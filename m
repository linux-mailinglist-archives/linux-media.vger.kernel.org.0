Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD2B1FEEFD
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2020 11:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729272AbgFRJvk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Jun 2020 05:51:40 -0400
Received: from smtp4-g21.free.fr ([212.27.42.4]:51292 "EHLO smtp4-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729060AbgFRJvk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Jun 2020 05:51:40 -0400
Received: from [192.168.1.91] (unknown [77.207.133.132])
        (Authenticated sender: marc.w.gonzalez)
        by smtp4-g21.free.fr (Postfix) with ESMTPSA id B434C19F5B2;
        Thu, 18 Jun 2020 11:50:54 +0200 (CEST)
Subject: Re: [RFC 4/4] media: dvb_frontend: disable zigzag mode if not
 possible
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media <linux-media@vger.kernel.org>
Cc:     Brad Love <brad@nextdimension.cc>, Sean Young <sean@mess.org>,
        Arnd Bergmann <arnd@arndb.de>,
        LKML <linux-kernel@vger.kernel.org>
References: <cover.1592419750.git.mchehab+huawei@kernel.org>
 <974065921c41fa0c97700196de1d921c95fafaaf.1592419750.git.mchehab+huawei@kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <20bb2501-8307-185e-ebec-a83488353a0b@free.fr>
Date:   Thu, 18 Jun 2020 11:50:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <974065921c41fa0c97700196de1d921c95fafaaf.1592419750.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/06/2020 20:52, Mauro Carvalho Chehab wrote:

> For the zigzag to work, the core needs to have a frequency
> shift. Without that, the zigzag code will just try re-tuning
> several times at the very same frequency, with seems wrong.

s/with/which

Suggest: "the core requires a frequency shift value"

> So, add a warning when this happens, and fall back to the
> single-shot mode.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  drivers/media/dvb-core/dvb_frontend.c | 141 +++++++++++++++-----------
>  1 file changed, 79 insertions(+), 62 deletions(-)

It's hard to discern in the diff what is just white-space adjustment
from one less tab, and what is new code that requires more scrutiny.
I'll try applying the patch, and then diff -w.
Yes, that's much better.

> diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
> index ed85dc2a9183..cb577924121e 100644
> --- a/drivers/media/dvb-core/dvb_frontend.c
> +++ b/drivers/media/dvb-core/dvb_frontend.c
> @@ -642,6 +642,9 @@ static void dvb_frontend_wakeup(struct dvb_frontend *fe)
>  	wake_up_interruptible(&fepriv->wait_queue);
>  }
>  
> +static u32 dvb_frontend_get_stepsize(struct dvb_frontend *fe);
> +static void prepare_tuning_algo_parameters(struct dvb_frontend *fe);
> +
>  static int dvb_frontend_thread(void *data)
>  {
>  	struct dvb_frontend *fe = data;
> @@ -696,78 +699,92 @@ static int dvb_frontend_thread(void *data)
>  			fepriv->reinitialise = 0;
>  		}
>  
> -		/* do an iteration of the tuning loop */
> -		if (fe->ops.get_frontend_algo) {
> +		if (fe->ops.get_frontend_algo)
>  			algo = fe->ops.get_frontend_algo(fe);
> -			switch (algo) {
> -			case DVBFE_ALGO_HW:
> -				dev_dbg(fe->dvb->device, "%s: Frontend ALGO = DVBFE_ALGO_HW\n", __func__);
> +		else
> +			algo = DVBFE_ALGO_SW;
>  
> -				if (fepriv->state & FESTATE_RETUNE) {
> -					dev_dbg(fe->dvb->device, "%s: Retune requested, FESTATE_RETUNE\n", __func__);
> -					re_tune = true;
> -					fepriv->state = FESTATE_TUNED;
> -				} else {
> -					re_tune = false;
> -				}
> +		/* do an iteration of the tuning loop */
> +		switch (algo) {
> +		case DVBFE_ALGO_SW:
> +			prepare_tuning_algo_parameters(fe);
>  
> -				if (fe->ops.tune)
> -					fe->ops.tune(fe, re_tune, fepriv->tune_mode_flags, &fepriv->delay, &s);
> -
> -				if (s != fepriv->status && !(fepriv->tune_mode_flags & FE_TUNE_MODE_ONESHOT)) {
> -					dev_dbg(fe->dvb->device, "%s: state changed, adding current state\n", __func__);
> -					dvb_frontend_add_event(fe, s);
> -					fepriv->status = s;
> -				}
> -				break;
> -			case DVBFE_ALGO_SW:
> +			if (fepriv->max_drift) {
>  				dev_dbg(fe->dvb->device, "%s: Frontend ALGO = DVBFE_ALGO_SW\n", __func__);
>  				dvb_frontend_swzigzag(fe);
>  				break;
> -			case DVBFE_ALGO_CUSTOM:
> -				dev_dbg(fe->dvb->device, "%s: Frontend ALGO = DVBFE_ALGO_CUSTOM, state=%d\n", __func__, fepriv->state);
> -				if (fepriv->state & FESTATE_RETUNE) {
> -					dev_dbg(fe->dvb->device, "%s: Retune requested, FESTAT_RETUNE\n", __func__);
> -					fepriv->state = FESTATE_TUNED;
> +			}
> +
> +			/*
> +			 * See prepare_tuning_algo_parameters():
> +			 *   - Some standards may not use zigzag.
> +			 */
> +			if (!dvb_frontend_get_stepsize(fe))
> +				dev_warn(fe->dvb->device,
> +					"disabling sigzag, as frontend doesn't set frequency step size\n");

s/sigzag/zigzag

I don't understand why you're calling dvb_frontend_get_stepsize() again?
prepare_tuning_algo_parameters() already tried its best to set fepriv->step_size

Why not just:

	if (fepriv->max_drift)
		do the zigzag
	else
		warn that zigzag is disabled

> +
> +			/* fall through */

Why would you want to fall through from DVBFE_ALGO_SW to DVBFE_ALGO_HW?
I think this changes the behavior before the patch.
