Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C4DF261F26
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 22:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730809AbgIHT7W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 15:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730485AbgIHPfh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 11:35:37 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF419C061368
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 08:35:06 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id n25so9706499ljj.4
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2020 08:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=tGrF/vntbxcaJrg5poH7gCu+VWyo9L1BGQaIoIoS0bQ=;
        b=n5qGCXo1v/X8PSEimLNceYfoLFK43B7g0eyI3jYR3uW14XAA4IE07X48ZKE7YJ70UB
         JEcRKUHQT4cygg8gCURGdeBaerT9Borb6Apcl4jO+AitKEYcyKR+v/V0SsZeW1b9KTKZ
         T4u/4yQeetA+aH1V5kXiKSA9NeqInShUo9Jj/fF24oDmWL98A/DUSelSqCmPdxjADtXt
         5egM5+0P5ils3V8bietOEkG7u8rodrCT2oQDTRr94vaFewKmE9Oka8lHZDq/Jryg7P64
         fBY0QMSrFBHO0ym10Uy5IR1zGhIxxftr1aETdSpB11o9cbC3wy6bK/RXkPmDvIKhlbcJ
         cRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=tGrF/vntbxcaJrg5poH7gCu+VWyo9L1BGQaIoIoS0bQ=;
        b=doyz+/MQVYJyvAvQR2us8tg/LKKEgFMlm7qhrq3BrwOXctIoCoZgN86Vht0ryPkWAe
         C9j3/js23fHPTgg4B5hpvwZJp9hN+WyO/LsBoIInu4VaFPqMtNx+HQZ1/DObZ9uRiS/2
         EJREj1tzpTk927faY9POWn3VHRt98vymYS6R6gKg82639A8K9OCEobuHUn6kPZOpp9gG
         3C4SFqeKzyunL1s/4RGkcS99mKLHeGKlud979tXNLVBTzqzYGctA6UBS79+9zWfezuhY
         IWatx3XFDcsVyLoZAhvHyzP+0bjQzVdeJ/4pNbLBshZ15KqrfiduvituEJS/bkxnv7qu
         t3aw==
X-Gm-Message-State: AOAM533/o/b3kaDilydbtSadwDVsFY+mF/OhDBO6fM0tTXsJjoHsRO2y
        LLw58zwopFI+bA8gvhAi3rtEkA==
X-Google-Smtp-Source: ABdhPJy1r23FBDpD0AieNv6pKwgAOMIvS4RqWasIIr61zMeo/9UcX+kJabzQIpPXrPEHYKTDEOtgpA==
X-Received: by 2002:a2e:9110:: with SMTP id m16mr13370093ljg.173.1599579304860;
        Tue, 08 Sep 2020 08:35:04 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id y4sm10537582ljk.61.2020.09.08.08.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 08:35:04 -0700 (PDT)
Date:   Tue, 8 Sep 2020 17:35:03 +0200
From:   Niklas <niklas.soderlund@ragnatech.se>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] media: rcar-vin: Update crop and compose settings for
 every s_fmt call
Message-ID: <20200908153503.GA3399240@oden.dyn.berto.se>
References: <1596187745-31596-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200801090456.GB1379367@oden.dyn.berto.se>
 <CA+V-a8sOHct_JetCsug8Z2BQpMLH2p39hj2XNw_1N5gkBQp1Gg@mail.gmail.com>
 <20200803192108.GB2297236@oden.dyn.berto.se>
 <6d659e56-1e1f-c9c7-2e66-4ddc4e7fad15@xs4all.nl>
 <CA+V-a8uzznUvzGgZ5A4B8ASEDbmMCrQPSAcEjO7v45zmAkdGDQ@mail.gmail.com>
 <20200904022522.GD9369@pendragon.ideasonboard.com>
 <CA+V-a8tTKu5FeEs+Hi2AwXy-i5OFufeyhTKGC6D4C5fK81895g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8tTKu5FeEs+Hi2AwXy-i5OFufeyhTKGC6D4C5fK81895g@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad,

On 2020-09-06 20:12:35 +0100, Lad, Prabhakar wrote:
> Hi Laurent,
> 
> On Fri, Sep 4, 2020 at 3:25 AM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Prabhakar,
> >
> > On Thu, Sep 03, 2020 at 03:53:18PM +0100, Lad, Prabhakar wrote:
> > > On Wed, Aug 19, 2020 at 3:08 PM Hans Verkuil wrote:
> > > > On 03/08/2020 21:21, Niklas wrote:
> > > > > On 2020-08-03 19:11:32 +0100, Lad, Prabhakar wrote:
> > > > >> On Sat, Aug 1, 2020 at 10:04 AM Niklas wrote:
> > > > >>> On 2020-07-31 10:29:05 +0100, Lad Prabhakar wrote:
> > > > >>>> The crop and compose settings for VIN in non mc mode werent updated
> > > > >>>> in s_fmt call this resulted in captured images being clipped.
> > > > >>>>
> > > > >>>> With the below sequence on the third capture where size is set to
> > > > >>>> 640x480 resulted in clipped image of size 320x240.
> > > > >>>>
> > > > >>>> high(640x480) -> low (320x240) -> high (640x480)
> > > > >>>>
> > > > >>>> This patch makes sure the VIN crop and compose settings are updated.
> > > > >>>
> > > > >>> This is clearly an inconsistency in the VIN driver that should be fixed.
> > > > >>> But I think the none-mc mode implements the correct behavior. That is
> > > > >>> that S_FMT should not modify the crop/compose rectangles other then make
> > > > >>> sure they don't go out of bounds. This is an area we tried to clarify in
> > > > >>> the past but I'm still not sure what the correct answer to.
> > > > >>>
> > > > >> What should be the exact behaviour of the bridge driver  for s_fmt
> > > > >> call. Should the crop/compose settings be updated for every s_fmt
> > > > >> callback or should they be only updated on s_selection callback.
> > > > >> Currently the non-mc rcar-vin doesnt update the crop/compose setting
> > > > >> in s_fmt callback due to which I see the above issue as mentioned.
> > > > >
> > > > > This is not entirely correct. It does update the crop and compose
> > > > > rectangles on s_fmt, it makes sure they are not out-of-bounds for the
> > > > > new format if it's accepted by s_fmt. See v4l2_rect_map_inside() calls
> > > > > in the snippet bellow.
> > > >
> > > > For non-mc mode s_fmt must update any crop/compose rectangles to ensure that
> > > > they are not out-of-bounds. But for mc mode the validation is done when you
> > > > start streaming, so I think s_fmt won't make any changes in that mode.
> > >
> > > Thank you Hans.
> > >
> > > > Double-check that with Laurent, though...
> > >
> > > Niklas/Laurent - How do we proceed on this ?
> >
> > MC devices rely on userspace to propagate formats between entities, and
> > on kernelspace to propagate formats within entities. This is documented
> > in https://linuxtv.org/downloads/v4l-dvb-apis/userspace-api/v4l/dev-subdev.html.
> > The configuration of an entity (formats and selection rectangles) must
> > be valid at all times. Subdev drivers should thus either adjust or reset
> > the crop and selection rectangles. The specification isn't clear on
> > which behaviour should be implemented, the only related text is
> >
> > "Sub-devices that scale frames using variable scaling factors should
> > reset the scale factors to default values when sink pads formats are
> > modified. If the 1:1 scaling ratio is supported, this means that source
> > pads formats should be reset to the sink pads formats."
> >
> > I would recommend resetting as the default behaviour. In any case,
> > adjustements are needed to ensure that the configuration remains valid.
> >
> In that case can I have your Ack to the patch please.

If this is the approach we wish to take here you should remove the code 
above and bellow the added block as it becomes redundant whit this 
change.

> 
> Cheers,
> Prabhakar

-- 
Regards,
Niklas Söderlund
