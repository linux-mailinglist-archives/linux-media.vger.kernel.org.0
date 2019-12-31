Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1479712D7D8
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2019 11:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726643AbfLaKUX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Dec 2019 05:20:23 -0500
Received: from gofer.mess.org ([88.97.38.141]:37603 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726334AbfLaKUW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Dec 2019 05:20:22 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id CCC0111A001; Tue, 31 Dec 2019 10:20:20 +0000 (GMT)
Date:   Tue, 31 Dec 2019 10:20:20 +0000
From:   Sean Young <sean@mess.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     mchehab@kernel.org, gregkh@linuxfoundation.org,
        rfontana@redhat.com, kstewart@linuxfoundation.org,
        tglx@linutronix.de, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] media: dvb_dummy_fe: Add error messages in case of
 attach failure
Message-ID: <20191231102020.GG24469@gofer.mess.org>
References: <20191201161542.69535-1-dwlsalmeida@gmail.com>
 <20191201161542.69535-3-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191201161542.69535-3-dwlsalmeida@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Dec 01, 2019 at 01:15:38PM -0300, Daniel W. S. Almeida wrote:
> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Complain if the attach functions fail, for any reason. This is helpful
> when debugging.
> 
> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/dvb-frontends/dvb_dummy_fe.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> index 909dac2345c4..987c3488fe6c 100644
> --- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
> +++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> @@ -114,12 +114,16 @@ struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void)
>  	/* allocate memory for the internal state */
>  	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
>  	if (!state)
> -		return NULL;
> +		goto err;
>  
>  	/* create dvb_frontend */
>  	memcpy(&state->frontend.ops, &dvb_dummy_fe_ofdm_ops, sizeof(struct dvb_frontend_ops));
>  	state->frontend.demodulator_priv = state;
>  	return &state->frontend;
> +
> +err:
> +	pr_err("%s: DVB Dummy frontend driver attach failed\n", __func__);
> +	return NULL;

No need to log anything after k[zm]alloc() failures.

Thanks

Sean

>  }
>  EXPORT_SYMBOL(dvb_dummy_fe_ofdm_attach);
>  
> @@ -132,12 +136,16 @@ struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
>  	/* allocate memory for the internal state */
>  	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
>  	if (!state)
> -		return NULL;
> +		goto err;
>  
>  	/* create dvb_frontend */
>  	memcpy(&state->frontend.ops, &dvb_dummy_fe_qpsk_ops, sizeof(struct dvb_frontend_ops));
>  	state->frontend.demodulator_priv = state;
>  	return &state->frontend;
> +
> +err:
> +	pr_err("%s: DVB Dummy frontend driver attach failed\n", __func__);
> +	return NULL;
>  }
>  EXPORT_SYMBOL(dvb_dummy_fe_qpsk_attach);
>  
> @@ -150,12 +158,16 @@ struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
>  	/* allocate memory for the internal state */
>  	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
>  	if (!state)
> -		return NULL;
> +		goto err;
>  
>  	/* create dvb_frontend */
>  	memcpy(&state->frontend.ops, &dvb_dummy_fe_qam_ops, sizeof(struct dvb_frontend_ops));
>  	state->frontend.demodulator_priv = state;
>  	return &state->frontend;
> +
> +err:
> +	pr_err("%s: DVB Dummy frontend driver attach failed\n", __func__);
> +	return NULL;
>  }
>  EXPORT_SYMBOL(dvb_dummy_fe_qam_attach);
>  
> -- 
> 2.24.0
