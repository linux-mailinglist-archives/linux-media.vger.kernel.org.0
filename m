Return-Path: <linux-media+bounces-2228-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA4680EB55
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 13:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5490E1F2122A
	for <lists+linux-media@lfdr.de>; Tue, 12 Dec 2023 12:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29C05EE65;
	Tue, 12 Dec 2023 12:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXWk0gh5"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F58AF;
	Tue, 12 Dec 2023 04:17:50 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-333536432e0so5193417f8f.3;
        Tue, 12 Dec 2023 04:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702383468; x=1702988268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3+HQb//Q5UqWfr8qTwrSIcTWToITh4nz6I2/WURW9m0=;
        b=dXWk0gh5011IbAUkFpkGinnHiApsQrT97R8LqWpUB14aCI1TC5SobslYKfupSIufOh
         z+CHyqo9Mgvikw+oq94YtKI1l2TEp4jFsXXpZdspoPMVt6U1nxRTrwAqNJDqJkJaeBTZ
         Milc8bBnrKX8QLbPTM3vvnQorJh+jmA0b8lI/W5yhc63JlzgqLIy+k+itCw4WvNXSGqt
         9FjBXxmRQ/7pq/rrRHMkXad+VTF4bP5AiB1eAwI7epochYodhGheGMuMPi82dCjT8QsF
         u+Dns66MSuBTjBrp+hYiwgnaCBHhB68u/lPjTOi23Jx284Uw5mSHVN+nHub7I/jBmlQA
         HH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702383468; x=1702988268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+HQb//Q5UqWfr8qTwrSIcTWToITh4nz6I2/WURW9m0=;
        b=IE8FingtNXCSZvImSrPmh6rFPeaZ1JMgo0n8Mn39J5XTfGaXCoXfJ3nVpZVuyzO7Te
         lOLq+w+lbEfFU+gUKE3o5vxsqwqKoDOHIqfhxz6JRuq5h3PjhbOfcF/lsE+tl+46/1rF
         U5EXBU/DDyRYgNymGvhxurzyxi2ELEGR0lvBXi5T9vN9R6IBO/W5OleO/EAPQC88Iys1
         tSLSc9pzvBk48f6cwcYKovv1hWnfK1OoPD0d945rMeT5+opkFLC3oMKBF+nvo8g6B1Id
         p8qaj02bf0D1R+pVylGBENC4uuPKJYOnSNshMwYWegPu1qLZcjqzLlORX1vD8TIzAHMl
         6dag==
X-Gm-Message-State: AOJu0YzpCtgt86Qmtb6/ZFrhntuBo3IerCAxOAiLlnazle6aIspGJ0a1
	2PHnGwjMw6HgD6MRzjazHJY=
X-Google-Smtp-Source: AGHT+IHCCPYtQvbPLlzsBOlwrLklD7Kfgi6H8YFBhbI/r7qrRB9D3jsaVNpq2gmUkrLMz0CYpqBaAg==
X-Received: by 2002:adf:fb44:0:b0:333:3f5d:63d2 with SMTP id c4-20020adffb44000000b003333f5d63d2mr2710731wrs.3.1702383468231;
        Tue, 12 Dec 2023 04:17:48 -0800 (PST)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-59-229.cust.vodafonedsl.it. [188.217.59.229])
        by smtp.gmail.com with ESMTPSA id k17-20020adfe8d1000000b00332fa6cc8acsm10675016wrn.87.2023.12.12.04.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 04:17:47 -0800 (PST)
Date: Tue, 12 Dec 2023 13:17:45 +0100
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: laurent.pinchart@ideasonboard.com, martin.hecht@avnet.eu,
	michael.roeder@avnet.eu, linuxfancy@googlegroups.com,
	mhecht73@gmail.com, christophe.jaillet@wanadoo.fr,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Gerald Loacker <gerald.loacker@wolfvision.net>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v15 3/3] media: i2c: Add support for alvium camera
Message-ID: <ZXhPabGpUDJNSgiZ@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <20231204094719.190334-1-tomm.merciai@gmail.com>
 <20231204094719.190334-4-tomm.merciai@gmail.com>
 <ZXhGQuqTZogWTJ42@kekkonen.localdomain>
 <ZXhHrhNQfn0uJMjk@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ZXhIaB_NTDtSJmj5@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZXhIaB_NTDtSJmj5@kekkonen.localdomain>

Hi Sakari,
Just a clarification about the following warnings:

Fixed on my side with:

CHECK: Assignment operator '=' should be on the previous line

-       alvium->is_mipi_fmt_avail[ALVIUM_BIT_YUV420_8_LEG]
-                                 = avail_fmt->yuv420_8_leg;
+       alvium->is_mipi_fmt_avail[ALVIUM_BIT_YUV420_8_LEG] =
+                                 avail_fmt->yuv420_8_leg;

CHECK: line length of 81 exceeds 80 columns
#1085: FILE: drivers/media/i2c/alvium-csi2.c:1085:
+		if (!alvium->is_mipi_fmt_avail[alvium_csi2_fmts[fmt].fmt_av_bit])

CHECK: line length of 81 exceeds 80 columns
#1102: FILE: drivers/media/i2c/alvium-csi2.c:1102:
+		if (!alvium->is_mipi_fmt_avail[alvium_csi2_fmts[fmt].fmt_av_bit])


Fixed on my side with:

        /* Create the alvium_csi2 fmt array from formats available */
        for (fmt = 0; fmt < ALVIUM_NUM_SUPP_MIPI_DATA_FMT; fmt++) {
-               if (!alvium->is_mipi_fmt_avail[alvium_csi2_fmts[fmt].fmt_av_bit])
+               if (!alvium->is_mipi_fmt_avail[alvium_csi2_fmts[fmt]
+                               .fmt_av_bit])
                        continue;

Can be ok for you?
If yes I'm going to prepare the patch on top of your media_tree/master
branch.

Thanks & Regards,
Tommaso

On Tue, Dec 12, 2023 at 11:47:52AM +0000, Sakari Ailus wrote:
> Hi Tommaso,
> 
> On Tue, Dec 12, 2023 at 12:44:46PM +0100, Tommaso Merciai wrote:
> > Hi Sakari,
> > 
> > On Tue, Dec 12, 2023 at 11:38:42AM +0000, Sakari Ailus wrote:
> > > Hi Tommaso,
> > > 
> > > On Mon, Dec 04, 2023 at 10:47:16AM +0100, Tommaso Merciai wrote:
> > > > The Alvium camera is shipped with sensor + isp in the same housing.
> > > > The camera can be equipped with one out of various sensor and abstract
> > > > the user from this. Camera is connected via MIPI CSI-2.
> > > > 
> > > > Most of the camera module features are supported, with the main exception
> > > > being fw update.
> > > > 
> > > > The driver provides all mandatory, optional and recommended V4L2 controls
> > > > for maximum compatibility with libcamera
> > > > 
> > > > References:
> > > >  - https://www.alliedvision.com/en/products/embedded-vision-solutions
> > > > 
> > > > Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
> > > 
> > > Could you run
> > > 
> > > 	./scripts/checkpatch.pl --strict --max-line-length=80
> > > 
> > > and address the issues in a patch on top of this set?
> > > 
> > 
> > Yes ofc.
> > You need also the following?
> > 
> > --- a/drivers/media/i2c/alvium-csi2.c
> > +++ b/drivers/media/i2c/alvium-csi2.c
> > @@ -2426,8 +2426,8 @@ static int alvium_probe(struct i2c_client *client)
> >                 goto err_powerdown;
> > 
> >         if (!alvium_is_alive(alvium)) {
> > -               dev_err_probe(dev, ret, "Device detection failed\n");
> >                 ret = -ENODEV;
> > +               dev_err_probe(dev, ret, "Device detection failed\n");
> >                 goto err_powerdown;
> >         }
> > 
> > Let me know. Thanks for your work.
> 
> Thank you, but I've already addressed that in my tree.
> 
> -- 
> Sakari Ailus

