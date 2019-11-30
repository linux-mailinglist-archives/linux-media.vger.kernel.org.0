Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9378010DCD7
	for <lists+linux-media@lfdr.de>; Sat, 30 Nov 2019 07:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbfK3GyX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Nov 2019 01:54:23 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:42992 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfK3GyX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Nov 2019 01:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=jkdoSYUNZ89xuj/Bwl89piFhc4gKd3WFY89atXxPidA=; b=oPISDPzGcYsw9AyQhiH0DhPeQ
        wZRlwujwV0gRp91PwLMfvIR2hDQpz7FU1K7oYPm5M3QyoLey9TqviBS5Uw/fbuwcvctTWodNSMnZ/
        K07ExbsBkEugHn0wGVlICpFQHi4Wh3KP+uH+3XcS+zhab8Zx3Zi0tchwbDXLUjGPmJqIlVu+qEC1I
        f3wzGHr+DVckAvU3q9GxMazc4Pw0IpOMMiMAxEbWIkkiVdvYY7C+5d/v4IxEDVMP9jr7O+VDxRkqV
        5/MWMtBv7S4smCEbO2cmDttYGSoNs5VibUZfefy12B7YZSFnjLQTbkD0AsdZruXd7tKf56Rgj2MUU
        pMz9f/2Jw==;
Received: from [80.156.29.194] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iawe2-0002Ec-Rk; Sat, 30 Nov 2019 06:54:19 +0000
Date:   Sat, 30 Nov 2019 07:54:15 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     gregkh@linuxfoundation.org, rfontana@redhat.com,
        kstewart@linuxfoundation.org, tglx@linutronix.de,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dvb_dummy_fe: Add error messages in case of
 attach failure
Message-ID: <20191130075415.5d7ac0b1@kernel.org>
In-Reply-To: <20191107013745.22147-1-dwlsalmeida@gmail.com>
References: <20191107013745.22147-1-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed,  6 Nov 2019 22:37:45 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Complain if the attach functions fail, for any reason. This is helpful
> when debugging.
> 
> Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>

Looks OK to me.

> ---
>  drivers/media/dvb-frontends/dvb_dummy_fe.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> index 4db679cb70ad..ca86857c3667 100644
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
>  }
>  
>  static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops;
> @@ -131,12 +135,16 @@ struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
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
>  
>  static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops;
> @@ -148,12 +156,16 @@ struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
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
>  
>  static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops = {



Cheers,
Mauro
