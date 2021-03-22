Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326FE344958
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 16:34:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbhCVPeF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 11:34:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:43670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230455AbhCVPde (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 11:33:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D549F61994;
        Mon, 22 Mar 2021 15:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616427214;
        bh=KzP4v3tkS2uLc6oExhJwyYXag2zCF3wXfwH/syF61Fc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=LhOmt0R/2cqLUcoiL7VNXseG8mb15jcvsaG0nbycY6FdzpJWlBAfqxzUoSXca4IHB
         KEHTDSyTLRgQz6Ei9Rwu+scz+azSLZWrCutipQP9hL7ctcuUrMTHLHuKcnjRus/cdw
         vdBGbHYLkv3S8Vp6OQTX+ReTeHI/i7ufu/bjJZP/mF3kWapkIYAsdX5CuNp7bOPk7l
         j3WSpdXdrdFlI8P1r1S6R1yWbHR5OMukVGZTig3Oay+ZKYGESDCVJlEtzF62WHQElL
         B2JLzLJka7SccULysH7unwSifpcjl0vYI0yloFRH1M7IvHUknjnPlkRaaZUKffyeGp
         u+0T8PROuuPbg==
Date:   Mon, 22 Mar 2021 16:33:29 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Brad Love <brad@nextdimension.cc>, Sean Young <sean@mess.org>,
        Arnd Bergmann <arnd@arndb.de>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 4/4] media: dvb_frontend: disable zigzag mode if not
 possible
Message-ID: <20210322163329.4afe27ed@coco.lan>
In-Reply-To: <20bb2501-8307-185e-ebec-a83488353a0b@free.fr>
References: <cover.1592419750.git.mchehab+huawei@kernel.org>
        <974065921c41fa0c97700196de1d921c95fafaaf.1592419750.git.mchehab+huawei@kernel.org>
        <20bb2501-8307-185e-ebec-a83488353a0b@free.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 18 Jun 2020 11:50:54 +0200
Marc Gonzalez <marc.w.gonzalez@free.fr> escreveu:

> On 17/06/2020 20:52, Mauro Carvalho Chehab wrote:
> 
> > For the zigzag to work, the core needs to have a frequency
> > shift. Without that, the zigzag code will just try re-tuning
> > several times at the very same frequency, with seems wrong.  
> 
> s/with/which
> 
> Suggest: "the core requires a frequency shift value"
> 
> > So, add a warning when this happens, and fall back to the
> > single-shot mode.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  drivers/media/dvb-core/dvb_frontend.c | 141 +++++++++++++++-----------
> >  1 file changed, 79 insertions(+), 62 deletions(-)  
> 
> It's hard to discern in the diff what is just white-space adjustment
> from one less tab, and what is new code that requires more scrutiny.
> I'll try applying the patch, and then diff -w.
> Yes, that's much better.
> 
> > diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
> > index ed85dc2a9183..cb577924121e 100644
> > --- a/drivers/media/dvb-core/dvb_frontend.c
> > +++ b/drivers/media/dvb-core/dvb_frontend.c
> > @@ -642,6 +642,9 @@ static void dvb_frontend_wakeup(struct dvb_frontend *fe)
> >  	wake_up_interruptible(&fepriv->wait_queue);
> >  }
> >  
> > +static u32 dvb_frontend_get_stepsize(struct dvb_frontend *fe);
> > +static void prepare_tuning_algo_parameters(struct dvb_frontend *fe);
> > +
> >  static int dvb_frontend_thread(void *data)
> >  {
> >  	struct dvb_frontend *fe = data;
> > @@ -696,78 +699,92 @@ static int dvb_frontend_thread(void *data)
> >  			fepriv->reinitialise = 0;
> >  		}
> >  
> > -		/* do an iteration of the tuning loop */
> > -		if (fe->ops.get_frontend_algo) {
> > +		if (fe->ops.get_frontend_algo)
> >  			algo = fe->ops.get_frontend_algo(fe);
> > -			switch (algo) {
> > -			case DVBFE_ALGO_HW:
> > -				dev_dbg(fe->dvb->device, "%s: Frontend ALGO = DVBFE_ALGO_HW\n", __func__);
> > +		else
> > +			algo = DVBFE_ALGO_SW;
> >  
> > -				if (fepriv->state & FESTATE_RETUNE) {
> > -					dev_dbg(fe->dvb->device, "%s: Retune requested, FESTATE_RETUNE\n", __func__);
> > -					re_tune = true;
> > -					fepriv->state = FESTATE_TUNED;
> > -				} else {
> > -					re_tune = false;
> > -				}
> > +		/* do an iteration of the tuning loop */
> > +		switch (algo) {
> > +		case DVBFE_ALGO_SW:
> > +			prepare_tuning_algo_parameters(fe);
> >  
> > -				if (fe->ops.tune)
> > -					fe->ops.tune(fe, re_tune, fepriv->tune_mode_flags, &fepriv->delay, &s);
> > -
> > -				if (s != fepriv->status && !(fepriv->tune_mode_flags & FE_TUNE_MODE_ONESHOT)) {
> > -					dev_dbg(fe->dvb->device, "%s: state changed, adding current state\n", __func__);
> > -					dvb_frontend_add_event(fe, s);
> > -					fepriv->status = s;
> > -				}
> > -				break;
> > -			case DVBFE_ALGO_SW:
> > +			if (fepriv->max_drift) {
> >  				dev_dbg(fe->dvb->device, "%s: Frontend ALGO = DVBFE_ALGO_SW\n", __func__);
> >  				dvb_frontend_swzigzag(fe);
> >  				break;
> > -			case DVBFE_ALGO_CUSTOM:
> > -				dev_dbg(fe->dvb->device, "%s: Frontend ALGO = DVBFE_ALGO_CUSTOM, state=%d\n", __func__, fepriv->state);
> > -				if (fepriv->state & FESTATE_RETUNE) {
> > -					dev_dbg(fe->dvb->device, "%s: Retune requested, FESTAT_RETUNE\n", __func__);
> > -					fepriv->state = FESTATE_TUNED;
> > +			}
> > +
> > +			/*
> > +			 * See prepare_tuning_algo_parameters():
> > +			 *   - Some standards may not use zigzag.
> > +			 */
> > +			if (!dvb_frontend_get_stepsize(fe))
> > +				dev_warn(fe->dvb->device,
> > +					"disabling sigzag, as frontend doesn't set frequency step size\n");  
> 
> s/sigzag/zigzag
> 
> I don't understand why you're calling dvb_frontend_get_stepsize() again?
> prepare_tuning_algo_parameters() already tried its best to set fepriv->step_size
> 
> Why not just:
> 
> 	if (fepriv->max_drift)
> 		do the zigzag
> 	else
> 		warn that zigzag is disabled
> 
> > +
> > +			/* fall through */  
> 
> Why would you want to fall through from DVBFE_ALGO_SW to DVBFE_ALGO_HW?
> I think this changes the behavior before the patch.

I double-checked this patch. What happens is that there are 3 
types of DVB devices:

1. Devices where the Zigzag happens at the hardware level,
   automatically (DVBFE_ALGO_HW). All they need is to call 
   fe->ops.tune() logic once;

2. Devices that have their own hardware-assisted zigzag logic.
   Those are handled via DVBFE_ALGO_CUSTOM logic. Those use
   an special callback: fe->ops.search(fe).

3. Devices that require the Kernel to do zigzag (DVBFE_ALGO_SW).
   Those should set max_drift and other fields, in order to
   setup the zigzag steps.

In other words, a device driver which uses DVBFE_ALGO_SW should 
provide the vars that are needed for the zigzag to work, as
otherwise, the software zigzag would be just wasting time, as
it won't be different than a device driver using DVBFE_ALGO_HW.

What the above patch does is to generate a warning when
DVBFE_ALGO_SW is used without setting the frequency shift,
which is an uAPI/kAPI violation. On such cases, it will fallback
to DVBFE_ALGO_HW.

The main issue is that testing this patch is not trivial.
As you pointed, it can cause regressions. So, instead of this
patch, I'll merge one that will just print a warning. We need
to fix the frontend drivers case by case.

Thanks,
Mauro
