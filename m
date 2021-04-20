Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA5C365E5E
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 19:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233425AbhDTRSK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 13:18:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233381AbhDTRSI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 13:18:08 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A81AAC06174A;
        Tue, 20 Apr 2021 10:17:35 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id w6so11476638pfc.8;
        Tue, 20 Apr 2021 10:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pSKpMsW/K0S3j8/HHHbtUzqblbskpc2edyF1GPSE7zw=;
        b=UwsWtoaU7Jhaz+S2Lsum37dVQC5pRQA8jEgn2Qx6K4KQiUa0nDAKjgJQoCd+kSS0H3
         6LItWGedC2Ue8uIhIgzRtpFM8Y6MIeSnBSeHhimXaeobc0XB0wLso5MDn7KxE5i64PI+
         vbsiNKXb7mRUPPfYCpKrBmMuirzaetz577tfKeTZICkD2EfDudsjN9eeaGvOlMdjLqFp
         2TkaDgijwwrEq9UaRAj6V+L/WwENzN4TrVUxSj6m1m2wkQHy5Ux8UdKJesaGeqddm0PL
         5ZXXUdhVY3QEafi1gP70w2hqW2AfHrR2wLI4tziX/KRZVQUw0b7SDlH/8SEhYrUgdq7G
         X5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pSKpMsW/K0S3j8/HHHbtUzqblbskpc2edyF1GPSE7zw=;
        b=bvHAejXPpIWYKOJBcTncpFkBMk0SRZ2YGPD7pSvVbCXY+CvBCmlLdw2XcFaxomLM9x
         6lKS6GKeIf3nnJivECvkrB4GcVHNnQPnRHp2Aapxf7T9eeB7PJNqhcq27GlYFi4ZwpVk
         bfuojI+H7a28AQwTqBPE9VieEZ6PJn0Xc/i6y+1s2flWodLS9vpOcZ298/aI818weukP
         EHW1lToGghLu/bK9XVI45kEdcQSF2zLwTy3OB2keyMZgWPj2lYA4FBHCaTRasu5lVeJ9
         /j/lSZ0RdRF1aQpa+uee43spc3a5zFrRu9FEvIPQiiKao09036A0kZd9ZzHJeFR/eYUE
         Rz9Q==
X-Gm-Message-State: AOAM533x4zyjhYtSkAgOByYsshlkWJgQSabSMjWWnXkaQ+J6/1d5mLmO
        M+NZXriNJSh5nVhDlTV0X9I=
X-Google-Smtp-Source: ABdhPJymeYJwdbZQcrS1CCQC9mgdb6vsA1W3QgKGElbTEyYVjom+jyz2m7O/m9QRHTzXrcLWB6IJ6Q==
X-Received: by 2002:aa7:9984:0:b029:25e:d44c:5f86 with SMTP id k4-20020aa799840000b029025ed44c5f86mr12661412pfh.15.1618939055029;
        Tue, 20 Apr 2021 10:17:35 -0700 (PDT)
Received: from localhost ([103.241.225.98])
        by smtp.gmail.com with ESMTPSA id u4sm12294707pfk.56.2021.04.20.10.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:17:34 -0700 (PDT)
Date:   Tue, 20 Apr 2021 22:47:29 +0530
From:   Deepak R Varma <mh12gx2825@gmail.com>
To:     Fabio Aiuto <fabioaiuto83@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] staging: media: atomisp: reformat code comment blocks
Message-ID: <20210420171729.GB193332@localhost>
References: <cover.1618859059.git.drv@mailo.com>
 <7cf7b8253550460e7273c94bae005939000679fd.1618859059.git.drv@mailo.com>
 <20210420084448.GC1411@agape.jhs>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210420084448.GC1411@agape.jhs>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 20, 2021 at 10:44:48AM +0200, Fabio Aiuto wrote:
> On Tue, Apr 20, 2021 at 12:45:04AM +0530, Deepak R Varma wrote:
> > Reformat code comment blocks according to the coding style guidelines.
> > This resolves different checkpatch script WARNINGs around block comments.
> > 
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  .../media/atomisp/i2c/atomisp-gc2235.c        |  8 +++----
> >  .../atomisp/i2c/atomisp-libmsrlisthelper.c    |  3 ++-
> >  .../media/atomisp/i2c/atomisp-mt9m114.c       | 22 +++++++++++--------
> >  .../media/atomisp/i2c/atomisp-ov2680.c        |  3 ++-
> >  4 files changed, 21 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> > index 548c572d3b57..a585d73665a6 100644
> > --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> > +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> > @@ -747,10 +747,10 @@ static int startup(struct v4l2_subdev *sd)
> >  
> >  	if (is_init == 0) {
> >  		/* force gc2235 to do a reset in res change, otherwise it
> > -		* can not output normal after switching res. and it is not
> > -		* necessary for first time run up after power on, for the sack
> > -		* of performance
> > -		*/
> > +		 * can not output normal after switching res. and it is not
> > +		 * necessary for first time run up after power on, for the sack
> > +		 * of performance
> > +		 */
> >  		power_down(sd);
> >  		power_up(sd);
> >  		gc2235_write_reg_array(client, gc2235_init_settings);
> > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
> > index b93c80471f22..750b3484eb19 100644
> > --- a/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
> > +++ b/drivers/staging/media/atomisp/i2c/atomisp-libmsrlisthelper.c
> > @@ -57,7 +57,8 @@ static int set_msr_configuration(struct i2c_client *client, uint8_t *bufptr,
> >  	 * By convention, the first two bytes of actual data should be
> >  	 * understood as an address in the sensor address space (hibyte
> >  	 * followed by lobyte) where the remaining data in the sequence
> > -	 * will be written. */
> > +	 * will be written.
> > +	 */
> >  
> >  	u8 *ptr = bufptr;
> >  
> > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> > index 465fc4468442..160bb58ce708 100644
> > --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> > +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> > @@ -478,7 +478,8 @@ static int gpio_ctrl(struct v4l2_subdev *sd, bool flag)
> >  	/* Note: current modules wire only one GPIO signal (RESET#),
> >  	 * but the schematic wires up two to the connector.  BIOS
> >  	 * versions have been unfortunately inconsistent with which
> > -	 * ACPI index RESET# is on, so hit both */
> > +	 * ACPI index RESET# is on, so hit both
> > +	 */
> >  
> >  	if (flag) {
> >  		ret = dev->platform_data->gpio0_ctrl(sd, 0);
> > @@ -1019,8 +1020,8 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
> >  		dev->first_gain = AnalogGain;
> >  		dev->first_diggain = DigitalGain;
> >  	}
> > -	/* DigitalGain = 0x400 * (((u16) DigitalGain) >> 8) +
> > -	((unsigned int)(0x400 * (((u16) DigitalGain) & 0xFF)) >>8); */
> > +	/* DigitalGain = 0x400 * (((u16) DigitalGain) >> 8) +		*/
> > +	/* ((unsigned int)(0x400 * (((u16) DigitalGain) & 0xFF)) >>8);	*/
> >  
> >  	/* set frame length */
> >  	if (FLines < coarse_integration + 6)
> > @@ -1035,7 +1036,8 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
> >  
> >  	/* set coarse integration */
> >  	/* 3A provide real exposure time.
> > -		should not translate to any value here. */
> > +	 * should not translate to any value here.
> > +	 */
> >  	ret = mt9m114_write_reg(client, MISENSOR_16BIT,
> >  				REG_EXPO_COARSE, (u16)(coarse_integration));
> >  	if (ret) {
> > @@ -1044,7 +1046,7 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
> >  	}
> >  
> >  	/*
> > -	// set analog/digital gain
> > +	 * set analog/digital gain
> >  	switch(AnalogGain)
> >  	{
> >  	case 0:
> > @@ -1069,8 +1071,9 @@ static long mt9m114_s_exposure(struct v4l2_subdev *sd,
> >  	*/
> >  	if (DigitalGain >= 16 || DigitalGain <= 1)
> >  		DigitalGain = 1;
> > -	/* AnalogGainToWrite =
> > -		(u16)((DigitalGain << 12) | AnalogGainToWrite); */
> > +
> > +	/* AnalogGainToWrite = (u16)((DigitalGain << 12) | AnalogGainToWrite);
> > +	 */
> 
> this is best recommended for one line comment:
> 
> /* AnalogGainToWrite = (u16)((DigitalGain << 12) | AnalogGainToWrite); */

It then extends beyond 80 character in length. Will that be acceptable?

> 
> 
> 
> >  	AnalogGainToWrite = (u16)((DigitalGain << 12) | (u16)AnalogGain);
> >  	ret = mt9m114_write_reg(client, MISENSOR_16BIT,
> >  				REG_GAIN, AnalogGainToWrite);
> > @@ -1096,7 +1099,8 @@ static long mt9m114_ioctl(struct v4l2_subdev *sd, unsigned int cmd, void *arg)
> >  }
> >  
> >  /* This returns the exposure time being used. This should only be used
> > -   for filling in EXIF data, not for actual image processing. */
> > + * for filling in EXIF data, not for actual image processing.
> > + */
> >  static int mt9m114_g_exposure(struct v4l2_subdev *sd, s32 *value)
> >  {
> >  	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > @@ -1297,7 +1301,7 @@ static int mt9m114_g_ev(struct v4l2_subdev *sd, s32 *val)
> >  
> >  /* Fake interface
> >   * mt9m114 now can not support 3a_lock
> > -*/
> > + */
> >  static int mt9m114_s_3a_lock(struct v4l2_subdev *sd, s32 val)
> >  {
> >  	aaalock = val;
> > diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> > index c17615149f46..91dca275a08e 100644
> > --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> > +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
> > @@ -732,7 +732,8 @@ static int gpio_ctrl(struct v4l2_subdev *sd, bool flag)
> >  	 * existing integrations often wire two (reset/power_down)
> >  	 * because that is the way other sensors work.  There is no
> >  	 * way to tell how it is wired internally, so existing
> > -	 * firmwares expose both and we drive them symmetrically. */
> > +	 * firmwares expose both and we drive them symmetrically.
> > +	 */
> >  	if (flag) {
> >  		ret = dev->platform_data->gpio0_ctrl(sd, 1);
> >  		usleep_range(10000, 15000);
> > -- 
> > 2.25.1
> > 
> > 
> 
> multiline comment format should appear this way:
> 
> 	/*
> 	 * This is a comment, a
> 	 * multiline one.
> 	 */
> 
> with the first line of the comment empty.

Sounds good. The coding style guide also allows the other style for
specific driver types. I will improve this change according to your
feedback and resubmit.

thank you,
deepak.

> 
> thank you,
> 
> fabio
