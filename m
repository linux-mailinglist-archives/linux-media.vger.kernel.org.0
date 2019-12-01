Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68A6810E10A
	for <lists+linux-media@lfdr.de>; Sun,  1 Dec 2019 09:07:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbfLAIHn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Dec 2019 03:07:43 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:49014 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbfLAIHn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 1 Dec 2019 03:07:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=OcvQUVi7k/pWsxDxL6CGsNVQjHASwhpi4TW6HCrsSh4=; b=OylsbUzZ8kLnsCApp3udLK84E
        zD5N6wGhFnizCAQp3BhT2WSKBqFo5MUn5UDfgm2jMYtoU3M3TDLXnig84eodvEB8mO7Px51hDYOAj
        rxOmlXdc3R5sGCdkPIuDIj/WtwgRmA7xOL9ci0j6PThBw+nGxBYmNw8nrC7hSHvWU0S/KlQrZZqjF
        wKWvdqAX2I+/gHr4QAOHlrMaSEu7H9LTmbYDGqmX+VQy7dRP/O1yuQ0a2hIeRvVmOvfXfAaIyjXf2
        BJvAOIg/DSF2eqi9pwqn79ezdQ50lFtQG3QYsw0SZWS589SdsH26WS/cnHdyrMCefUDIvxsIIz2g8
        i2wHl4oBg==;
Received: from [80.156.29.194] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ibKGX-0007jf-32; Sun, 01 Dec 2019 08:07:37 +0000
Date:   Sun, 1 Dec 2019 09:07:33 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     gregkh@linuxfoundation.org, rfontana@redhat.com,
        kstewart@linuxfoundation.org, tglx@linutronix.de,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dvb_dummy_fe.c: add members to
 dvb_dummy_fe_state
Message-ID: <20191201090733.2bd8c2c4@kernel.org>
In-Reply-To: <20191130045420.111288-1-dwlsalmeida@gmail.com>
References: <20191130045420.111288-1-dwlsalmeida@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Sat, 30 Nov 2019 01:54:20 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> 
> Add members to dvb_dummy_fe_state in order to match with other frontends.
> 
> Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> ---
>  drivers/media/dvb-frontends/dvb_dummy_fe.c | 26 +++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> index 1ccb58c67e8e..80e6a3bf76e0 100644
> --- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
> +++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> @@ -15,18 +15,29 @@
>  
>  DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
>  
> +struct dvb_dummy_fe_config {};
> +
>  struct dvb_dummy_fe_state {
>  	struct dvb_frontend frontend;
> +	struct mutex lock;
> +	struct dvb_adapter adapter;
> +	struct dvb_frontend frontend;
> +	struct dvb_dummy_fe_config config;
> +
> +	enum fe_status frontend_status;
> +	u32 current_frequency;

While the above will very likely makes sense, once we add the missing
functionality at the dummy frontend, please don't add fields at the
struct while they're not used, as this makes harder for reviewers to be
sure that we're not adding bloatware at the code.

> +
> +	bool sleeping;
>  };
>  
> +
> +
>  static int dvb_dummy_fe_read_status(struct dvb_frontend *fe,
>  				    enum fe_status *status)
>  {
> -	*status = FE_HAS_SIGNAL
> -		| FE_HAS_CARRIER
> -		| FE_HAS_VITERBI
> -		| FE_HAS_SYNC
> -		| FE_HAS_LOCK;
> +	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
> +
> +	*status = state->frontend_status;

That sounds wrong to me, at least on this patch as-is. Please remember that
we want one logical change per patch.

It means that, if you add a state->frontend_status at the driver, the
patch should implement the entire logic for it.

In other words, when the device is not tuned, status should return 0 and
when the device is tuned, it should return:

  FE_HAS_SIGNAL | FE_HAS_CARRIER | FE_HAS_VITERBI | FE_HAS_SYNC | FE_HAS_LOCK


So, while it is OK to move the status into a var at state, you need also
to modify the set_frontend part of the code for it to properly initalize
the state->frontend_status var.

>  
>  	return 0;
>  }
> @@ -79,6 +90,11 @@ static int dvb_dummy_fe_set_frontend(struct dvb_frontend *fe)
>  
>  static int dvb_dummy_fe_sleep(struct dvb_frontend* fe)
>  {
> +
> +	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
> +
> +	state->sleeping = true;
> +

Hmm...what's the sense of adding it? Where are you setting it to false?
Where are you using the sleeping state?

>  	return 0;
>  }
>  

Cheers,
Mauro
