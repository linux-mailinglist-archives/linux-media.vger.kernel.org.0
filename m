Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2D5410E595
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2019 06:50:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbfLBFuz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Dec 2019 00:50:55 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:46454 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbfLBFuz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Dec 2019 00:50:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=JxzbjAicqr2k4SAVBtPRNgbKswEiyX6uTFNgc/Dtp6k=; b=apK1WG3WMQC866rC6TIEGAe8J
        RgKee35qVnLc0VPcoQ8ae9sLiEhbUArE9MNDF18YZo910y0a/X2Ra1I4WjtaGnJKGKL7Hy8YNvwN8
        bAc+5ZmqYQZ9IvI+SJ7KWbH/SCevLyH9O3aos4UzUcfZWcF08ii1jmTEOp5Cvwp/2bw+7sd8k+ycY
        3Pt+RVyAqnB2sQ8WnQCmN61MnF6raHaDcD/fvVFBdByIg4wiBuUsY3afsLeS5KesFn0b1A0YpqD/t
        SiEaZHcjOFfgZU0Ihw4nsZWl+z2Rf219EJh8YfTstBt6/NQ+gdoA+9C5gCZS/AQDhTpgYXdPGbPFI
        nshkGjLYg==;
Received: from [80.156.29.194] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ibebi-0004Qx-To; Mon, 02 Dec 2019 05:50:51 +0000
Date:   Mon, 2 Dec 2019 06:50:47 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Cc:     gregkh@linuxfoundation.org, rfontana@redhat.com,
        kstewart@linuxfoundation.org, tglx@linutronix.de,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dvb_dummy_fe.c: add members to
 dvb_dummy_fe_state
Message-ID: <20191202065047.3cffda7a@kernel.org>
In-Reply-To: <13629649-f363-4787-e88b-784f8309bfcd@gmail.com>
References: <20191130045420.111288-1-dwlsalmeida@gmail.com>
        <20191201090733.2bd8c2c4@kernel.org>
        <13629649-f363-4787-e88b-784f8309bfcd@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 2 Dec 2019 01:49:38 -0300
"Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:

> Hi Mauro, thanks for checking out my work!
> 
> > please don't add fields at the
> > struct while they're not used, as this makes harder for reviewers to be
> > sure that we're not adding bloatware at the code.  
> 
> OK.
> 
> > Please remember that
> > we want one logical change per patch.
> >
> > It means that, if you add a state->frontend_status at the driver, the
> > patch should implement the entire logic for it.  
> I will keep this in mind.
> 
> >   static int dvb_dummy_fe_sleep(struct dvb_frontend* fe)
> >   {
> > +
> > +	struct dvb_dummy_fe_state *state = fe->demodulator_priv;
> > +
> > +	state->sleeping = true;
> > +  
> 
> > Hmm...what's the sense of adding it? Where are you setting it to false?
> > Where are you using the sleeping state?  
> 
> I noted some drivers seem to instruct the hardware into a low power state. Take helene, for instance:
> 
> static int helene_sleep(struct dvb_frontend *fe)
> {
> 	struct helene_priv *priv = fe->tuner_priv;
> 
> 	dev_dbg(&priv->i2c->dev, "%s()\n", __func__);
> 	helene_enter_power_save(priv);
> 	return 0;
> }
> 
> static int helene_enter_power_save(struct helene_priv *priv)
> {
> 	dev_dbg(&priv->i2c->dev, "%s()\n", __func__);
> 	if (priv->state == STATE_SLEEP)
> 		return 0;
> 
> 	/* Standby setting for CPU */
> 	helene_write_reg(priv, 0x88, 0x0);
> 
> 	/* Standby setting for internal logic block */
> 	helene_write_reg(priv, 0x87, 0xC0);
> 
> 	priv->state = STATE_SLEEP;
> 	return 0;
> }
> 
> As we are emulating some piece of hardware I thought it would be enough to add a simple bool to indicate that the device was sleeping.

Yeah, that could have some value. Yet, if you're doing that, I suggest
to add a function to change the device power state, as this is what a
real driver would do. Something similar to:

static inline void change_power_state(struct state *st, bool on) 
{
	/* A real driver would have commands here to wake/sleep the dev */

	st->power = on;
}

In any case, a real device on sleeping mode will not be tuning any
channels, so all stats will reflect that, e. g:

	- frontend status will return 0;
	- stats that depends on having a lock will be set with:
		FE_SCALE_NOT_AVAILABLE
	  tip: most stats are like that
	- stats like signal strength should probably return 0.

Not so sure what SNR will return, but probably it should return
FE_SCALE_NOT_AVAILABLE too, as this is usually calculated indirectly
once the device is locked.

On other words, only signal strength and stats should return a value
with would be 0 on both cases. All other stats should return
FE_SCALE_NOT_AVAILABLE.

Btw, as this depends on having the stats implemented, I would suggest you to
first finish the tuning and stats part of the driver. Only after having those
patches, apply the power mode patch.

> 
> This patch was a bit convoluted on my part. Let's iron out the issues you pointed out in v2.
> 
> - Daniel.

Cheers,
Mauro
