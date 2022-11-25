Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C2C3638E02
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 17:01:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbiKYQBp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 11:01:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbiKYQBo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 11:01:44 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87EE64B9A9
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 08:01:43 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id z24so5646530ljn.4
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 08:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QzEV4++7bXQHfd6gsAbxp8XUPvUs+nkOTyY83Sr3UTY=;
        b=ZAiDK5yd/xeqy+ZSFr/KfpvNyJ0zNSZPAnup7G/ynZV+BOLO63vAp6mSvi0yyXtjhs
         fGKGHUZApe+Mx42JNbZD7ZGJQYjYlpRfaCMj8JFeU1jOAILfXDT7zmibzV4GYJurNokt
         VcZUwm5JesMnYBAMjv6roTAOig7PTMaIHF0JZRWJ/srodncvnorOyfLqKwnxpj5wP9HI
         +TNWtSLBBa0Y16DL2iFrHAvCsJkzviMlKJy4dbTY2skZdTRBtIbODZjSl+wL5+RjC+aC
         ocuFFThxggVRcTo14DAE0Rqh985y/quw++JJta5skK+JciZ4IPmITH63sTTHh4ra68wS
         /XKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzEV4++7bXQHfd6gsAbxp8XUPvUs+nkOTyY83Sr3UTY=;
        b=uaU41oJ3Bx1ak4r+7srhzaKVLJL1RVn9zUnhauzsTmYLwHxmb603vyx56vVsImU/R2
         e4q4SIqIBs872mjcmadij0mNeuVst9bw1mMg5pb0U2WTDppPVsTM2hbe7YvBbsu2L7EA
         qSF1hKEMsJmHx9P6GPHDF06TGZoq+zvgjK+lXPxcTrAr06gG6A4GnlW2KYleUJFVOf5J
         PIk5TDH7DuI+MyA41yjtNvJgUCoTuvE+hu61GFBkbmT802IQSK7x4YWpOOtB5GUDmLBI
         96NCubhuqzPThzj8iBy7+fcv7VbKKJEv4br2eygvwtVhpXG2/rdtskZJf514dzvWxsVJ
         s77g==
X-Gm-Message-State: ANoB5pmqj1Z8iuLPaRkvdPp2GAaaFMuJFgyY/gDJ1687HdWHolf/GbnV
        8s0EpKJ/SSkMP5vSHOr8fiPFIg==
X-Google-Smtp-Source: AA0mqf6uPCogSlP5rPSi0t3jnuQe0YhGzLoBriMSzf9EMfOMiNHRouH14/pDsZF8A/CO7aR9dN/T4g==
X-Received: by 2002:a05:651c:1954:b0:277:43c4:a864 with SMTP id bs20-20020a05651c195400b0027743c4a864mr11777535ljb.463.1669392098910;
        Fri, 25 Nov 2022 08:01:38 -0800 (PST)
Received: from melexis.com ([91.192.183.26])
        by smtp.gmail.com with ESMTPSA id bt14-20020a056512260e00b00499d70c0310sm571160lfb.3.2022.11.25.08.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 08:01:38 -0800 (PST)
Date:   Fri, 25 Nov 2022 18:01:34 +0200
From:   Volodymyr Kharuk <vkh@melexis.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Andrii Kyselov <ays@melexis.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        devicetree@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: Re: [PATCH v3 3/8] media: Documentation: v4l: Add TOF class controls
Message-ID: <Y4Dm3pghvTTlXBNx@melexis.com>
References: <cover.1669381013.git.vkh@melexis.com>
 <01cfeb602d52456bed08c89da356474474361e73.1669381013.git.vkh@melexis.com>
 <de7a776e-3fb2-3631-c301-847502fc1a39@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de7a776e-3fb2-3631-c301-847502fc1a39@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for review.

On Fri, Nov 25, 2022 at 03:28:30PM +0100, Hans Verkuil wrote:
> On 25/11/2022 14:34, Volodymyr Kharuk wrote:
> > Add description about V4L2_CID_TOF_PHASE_SEQ, V4L2_CID_TOF_FMOD
> > and V4L2_CID_TOF_TINT.
> > Also updated MAINTAINERS with new ext-ctrls-tof file.
> > 
> > Signed-off-by: Volodymyr Kharuk <vkh@melexis.com>
> > ---
> >  .../userspace-api/media/v4l/common.rst        |  1 +
> >  .../userspace-api/media/v4l/ext-ctrls-tof.rst | 35 +++++++++++++++++++
> >  MAINTAINERS                                   |  7 ++++
> >  3 files changed, 43 insertions(+)
> >  create mode 100644 Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/common.rst b/Documentation/userspace-api/media/v4l/common.rst
> > index ea0435182e44..1ea79e453066 100644
> > --- a/Documentation/userspace-api/media/v4l/common.rst
> > +++ b/Documentation/userspace-api/media/v4l/common.rst
> > @@ -52,6 +52,7 @@ applicable to all devices.
> >      ext-ctrls-fm-rx
> >      ext-ctrls-detect
> >      ext-ctrls-colorimetry
> > +    ext-ctrls-tof
> >      fourcc
> >      format
> >      planar-apis
> > diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst
> > new file mode 100644
> > index 000000000000..8902cc7cd47b
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst
> > @@ -0,0 +1,35 @@
> > +.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
> > +
> > +.. _tof-controls:
> > +
> > +***************************************
> > +Time of Flight Camera Control Reference
> > +***************************************
> > +
> > +The Time of Flight class includes controls for digital features
> > +of TOF camera.
> 
> You might want to extend this description a bit and give more info
> about how they work. Perhaps a link to wikipedia or something
> might help too.
I was not sure what to add here. Ok, I will update.
> 
> > +
> > +.. _tof-control-id:
> > +
> > +Time of Flight Camera Control IDs
> > +=================================
> > +
> > +``V4L2_CID_TOF_CLASS (class)``
> > +    The TOF class descriptor. Calling :ref:`VIDIOC_QUERYCTRL` for
> > +    this control will return a description of this control class.
> > +
> > +``V4L2_CID_TOF_PHASE_SEQ (dynamic array u16)``
> > +    Change the shift between illumination and sampling for each phase
> > +    in degrees. A distance/confidence picture is obtained by merging
> > +    3..8 captures of the same scene using different phase shifts(some
> 
> Space before (
> 
> > +    TOF sensors use different frequency modulation).
> 
> Either: use -> use a
> Or:     modulation -> modulations
> 
> It's not clear right now whether "frequency modulation" is meant to be singular
> or plural.
> 
> > +
> > +    The maximum array size is driver specific.
> > +
> > +``V4L2_CID_TOF_FMOD (dynamic array u8)``
> > +    The control sets the modulation frequency(in Mhz) per each phase.
> 
> Space before (
> 
> per each phase -> for each phase
> 
> > +    The maximum array size is driver specific.
> 
> What does the maximum array size signify? The number of phases?
> It's not clear from the spec (and I have to admit I know very little
> about TOF sensors).
yes, array size defines the number of phases.
But the maximum number of phases can be different and depend on the sensor.
I'll update the doc.
> 
> > +
> > +``V4L2_CID_TOF_TINT (dynamic array u16)``
> > +    The control sets the integration time(in us) per each phase.
> 
> Add space before (
> 
> per each phase -> for each phase
> 
> > +    The maximum array size is driver specific.
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index aa1974054fce..a2bc2ce53056 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13111,6 +13111,13 @@ S:	Supported
> >  W:	http://www.melexis.com
> >  F:	drivers/iio/temperature/mlx90632.c
> >  
> > +MELEXIS MLX7502X DRIVER
> > +M:	Volodymyr Kharuk <vkh@melexis.com>
> > +L:	linux-media@vger.kernel.org
> > +S:	Supported
> > +W:	http://www.melexis.com
> > +F:	Documentation/userspace-api/media/v4l/ext-ctrls-tof.rst
> > +
> >  MELFAS MIP4 TOUCHSCREEN DRIVER
> >  M:	Sangwon Jee <jeesw@melfas.com>
> >  S:	Supported
> 
> Regards,
> 
> 	Hans

-- 
--
Volodymyr Kharuk
Embedded Software Engineer
Melexis-Ukraine
Mykhaila Kotel'nykova St, 4, Kyiv
Mobile phone: +38 050 346 5527
www.melexis.com
---
The contents of this e-mail are CONFIDENTIAL AND PROPRIETARY. Please read
our disclaimer at http://www.melexis.com/mailpolicy

