Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01FDC1FEE84
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 11:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728995AbgFRJU7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 05:20:59 -0400
Received: from smtp4-g21.free.fr ([212.27.42.4]:17268 "EHLO smtp4-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728343AbgFRJU6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 05:20:58 -0400
Received: from [192.168.1.91] (unknown [77.207.133.132])
        (Authenticated sender: marc.w.gonzalez)
        by smtp4-g21.free.fr (Postfix) with ESMTPSA id 664CE19F5AB;
        Thu, 18 Jun 2020 11:20:12 +0200 (CEST)
Subject: Re: [RFC 3/4] media: dvb_frontend: move algo-specific settings to a
 function
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Cc:     Brad Love <brad@nextdimension.cc>, Sean Young <sean@mess.org>,
        Arnd Bergmann <arnd@arndb.de>,
        LKML <linux-kernel@vger.kernel.org>
References: <cover.1592419750.git.mchehab+huawei@kernel.org>
 <daa69edd80e7fcf979062273f3067cb7b5573d52.1592419750.git.mchehab+huawei@kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <8956d79a-cc5a-b744-3e21-25e9b4267dea@free.fr>
Date:   Thu, 18 Jun 2020 11:20:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <daa69edd80e7fcf979062273f3067cb7b5573d52.1592419750.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/06/2020 20:52, Mauro Carvalho Chehab wrote:

> As we're planning to call this code on a separate place, let's

s/on/from/
Suggest: "to call this code from somewhere else"

> fist move it to a different function.

s/fist/first
Suggest: "first move it to its own function"

> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/dvb-core/dvb_frontend.c | 90 +++++++++++++++------------
>  1 file changed, 49 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
> index 06ea30a689d7..ed85dc2a9183 100644
> --- a/drivers/media/dvb-core/dvb_frontend.c
> +++ b/drivers/media/dvb-core/dvb_frontend.c
> @@ -1790,6 +1790,54 @@ static int dvbv3_set_delivery_system(struct dvb_frontend *fe)
>  	return emulate_delivery_system(fe, delsys);
>  }
>  
> +static void prepare_tuning_algo_parameters(struct dvb_frontend *fe)
> +{
> +	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
> +	struct dvb_frontend_private *fepriv = fe->frontend_priv;
> +	struct dvb_frontend_tune_settings fetunesettings;

Suggest: fetunesettings = { 0 };
then we can remove the memset() below.

> +
> +	/* get frontend-specific tuning settings */
> +	memset(&fetunesettings, 0, sizeof(struct dvb_frontend_tune_settings));
> +	if (fe->ops.get_tune_settings && (fe->ops.get_tune_settings(fe, &fetunesettings) == 0)) {
> +		fepriv->min_delay = (fetunesettings.min_delay_ms * HZ) / 1000;
> +		fepriv->max_drift = fetunesettings.max_drift;
> +		fepriv->step_size = fetunesettings.step_size;
> +	} else {
> +		/* default values */
> +		switch (c->delivery_system) {
> +		case SYS_DVBS:
> +		case SYS_DVBS2:
> +		case SYS_ISDBS:
> +		case SYS_TURBO:
> +		case SYS_DVBC_ANNEX_A:
> +		case SYS_DVBC_ANNEX_C:
> +			fepriv->min_delay = HZ / 20;
> +			fepriv->step_size = c->symbol_rate / 16000;
> +			fepriv->max_drift = c->symbol_rate / 2000;
> +			break;
> +		case SYS_DVBT:
> +		case SYS_DVBT2:
> +		case SYS_ISDBT:
> +		case SYS_DTMB:
> +			fepriv->min_delay = HZ / 20;
> +			fepriv->step_size = dvb_frontend_get_stepsize(fe) * 2;
> +			fepriv->max_drift = (dvb_frontend_get_stepsize(fe) * 2) + 1;
> +			break;
> +		default:
> +			/*
> +			 * FIXME: This sounds wrong! if freqency_stepsize is
> +			 * defined by the frontend, why not use it???
> +			 */
> +			fepriv->min_delay = HZ / 20;
> +			fepriv->step_size = 0; /* no zigzag */
> +			fepriv->max_drift = 0;
> +			break;
> +		}
> +	}
> +	if (dvb_override_tune_delay > 0)
> +		fepriv->min_delay = (dvb_override_tune_delay * HZ) / 1000;
> +}
> +
>  /**
>   * dtv_property_process_set -  Sets a single DTV property
>   * @fe:		Pointer to &struct dvb_frontend
> @@ -2182,7 +2230,6 @@ static int dtv_set_frontend(struct dvb_frontend *fe)
>  {
>  	struct dvb_frontend_private *fepriv = fe->frontend_priv;
>  	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
> -	struct dvb_frontend_tune_settings fetunesettings;
>  	u32 rolloff = 0;
>  
>  	if (dvb_frontend_check_parameters(fe) < 0)
> @@ -2260,46 +2307,7 @@ static int dtv_set_frontend(struct dvb_frontend *fe)
>  	if (c->hierarchy == HIERARCHY_NONE && c->code_rate_LP == FEC_NONE)
>  		c->code_rate_LP = FEC_AUTO;
>  
> -	/* get frontend-specific tuning settings */
> -	memset(&fetunesettings, 0, sizeof(struct dvb_frontend_tune_settings));
> -	if (fe->ops.get_tune_settings && (fe->ops.get_tune_settings(fe, &fetunesettings) == 0)) {
> -		fepriv->min_delay = (fetunesettings.min_delay_ms * HZ) / 1000;
> -		fepriv->max_drift = fetunesettings.max_drift;
> -		fepriv->step_size = fetunesettings.step_size;
> -	} else {
> -		/* default values */
> -		switch (c->delivery_system) {
> -		case SYS_DVBS:
> -		case SYS_DVBS2:
> -		case SYS_ISDBS:
> -		case SYS_TURBO:
> -		case SYS_DVBC_ANNEX_A:
> -		case SYS_DVBC_ANNEX_C:
> -			fepriv->min_delay = HZ / 20;
> -			fepriv->step_size = c->symbol_rate / 16000;
> -			fepriv->max_drift = c->symbol_rate / 2000;
> -			break;
> -		case SYS_DVBT:
> -		case SYS_DVBT2:
> -		case SYS_ISDBT:
> -		case SYS_DTMB:
> -			fepriv->min_delay = HZ / 20;
> -			fepriv->step_size = dvb_frontend_get_stepsize(fe) * 2;
> -			fepriv->max_drift = (dvb_frontend_get_stepsize(fe) * 2) + 1;
> -			break;

As an aside, I find it confusing that there are 3 sources for the stepsize.
1) fe->ops.get_tune_settings().step_size
2) fe->ops.info.frequency_stepsize_hz
3) fe->ops.tuner_ops.info.frequency_step_hz

> -		default:
> -			/*
> -			 * FIXME: This sounds wrong! if freqency_stepsize is
> -			 * defined by the frontend, why not use it???
> -			 */
> -			fepriv->min_delay = HZ / 20;
> -			fepriv->step_size = 0; /* no zigzag */
> -			fepriv->max_drift = 0;
> -			break;
> -		}
> -	}
> -	if (dvb_override_tune_delay > 0)
> -		fepriv->min_delay = (dvb_override_tune_delay * HZ) / 1000;
> +	prepare_tuning_algo_parameters(fe);

LGTM

Reviewed-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
