Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B635612D7A4
	for <lists+linux-media@lfdr.de>; Tue, 31 Dec 2019 10:47:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbfLaJrJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Dec 2019 04:47:09 -0500
Received: from gofer.mess.org ([88.97.38.141]:46179 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725770AbfLaJrI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Dec 2019 04:47:08 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id EDD6D11A001; Tue, 31 Dec 2019 09:47:06 +0000 (GMT)
Date:   Tue, 31 Dec 2019 09:47:06 +0000
From:   Sean Young <sean@mess.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        gregkh@linuxfoundation.org, rfontana@redhat.com,
        kstewart@linuxfoundation.org, tglx@linutronix.de,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: dvb_dummy_fe: Add error messages in case of
 attach failure
Message-ID: <20191231094706.GD24469@gofer.mess.org>
References: <20191107013745.22147-1-dwlsalmeida@gmail.com>
 <20191130075415.5d7ac0b1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191130075415.5d7ac0b1@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel, Mauro,

On Sat, Nov 30, 2019 at 07:54:15AM +0100, Mauro Carvalho Chehab wrote:
> Em Wed,  6 Nov 2019 22:37:45 -0300
> "Daniel W. S. Almeida" <dwlsalmeida@gmail.com> escreveu:
> 
> > From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
> > 
> > Complain if the attach functions fail, for any reason. This is helpful
> > when debugging.
> > 
> > Suggested-by: Shuah Khan <skhan@linuxfoundation.org>
> > Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
> 
> Looks OK to me.
> 
> > ---
> >  drivers/media/dvb-frontends/dvb_dummy_fe.c | 18 +++++++++++++++---
> >  1 file changed, 15 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/dvb-frontends/dvb_dummy_fe.c b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> > index 4db679cb70ad..ca86857c3667 100644
> > --- a/drivers/media/dvb-frontends/dvb_dummy_fe.c
> > +++ b/drivers/media/dvb-frontends/dvb_dummy_fe.c
> > @@ -114,12 +114,16 @@ struct dvb_frontend* dvb_dummy_fe_ofdm_attach(void)
> >  	/* allocate memory for the internal state */
> >  	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
> >  	if (!state)
> > -		return NULL;
> > +		goto err;
> >  
> >  	/* create dvb_frontend */
> >  	memcpy(&state->frontend.ops, &dvb_dummy_fe_ofdm_ops, sizeof(struct dvb_frontend_ops));
> >  	state->frontend.demodulator_priv = state;
> >  	return &state->frontend;
> > +
> > +err:
> > +	pr_err("%s: DVB Dummy frontend driver attach failed\n", __func__);
> > +	return NULL;
> >  }

If kzalloc() fails, it will already complain before returning. Lately we've
been removing error logs after kmalloc() failures. I'm sure someone will send
in patches reverting this if it gets merged.

Is this a good idea?

Sean

> >  
> >  static const struct dvb_frontend_ops dvb_dummy_fe_qpsk_ops;
> > @@ -131,12 +135,16 @@ struct dvb_frontend *dvb_dummy_fe_qpsk_attach(void)
> >  	/* allocate memory for the internal state */
> >  	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
> >  	if (!state)
> > -		return NULL;
> > +		goto err;
> >  
> >  	/* create dvb_frontend */
> >  	memcpy(&state->frontend.ops, &dvb_dummy_fe_qpsk_ops, sizeof(struct dvb_frontend_ops));
> >  	state->frontend.demodulator_priv = state;
> >  	return &state->frontend;
> > +
> > +err:
> > +	pr_err("%s: DVB Dummy frontend driver attach failed\n", __func__);
> > +	return NULL;
> >  }
> >  
> >  static const struct dvb_frontend_ops dvb_dummy_fe_qam_ops;
> > @@ -148,12 +156,16 @@ struct dvb_frontend *dvb_dummy_fe_qam_attach(void)
> >  	/* allocate memory for the internal state */
> >  	state = kzalloc(sizeof(struct dvb_dummy_fe_state), GFP_KERNEL);
> >  	if (!state)
> > -		return NULL;
> > +		goto err;
> >  
> >  	/* create dvb_frontend */
> >  	memcpy(&state->frontend.ops, &dvb_dummy_fe_qam_ops, sizeof(struct dvb_frontend_ops));
> >  	state->frontend.demodulator_priv = state;
> >  	return &state->frontend;
> > +
> > +err:
> > +	pr_err("%s: DVB Dummy frontend driver attach failed\n", __func__);
> > +	return NULL;
> >  }
> >  
> >  static const struct dvb_frontend_ops dvb_dummy_fe_ofdm_ops = {
> 
> 
> 
> Cheers,
> Mauro
