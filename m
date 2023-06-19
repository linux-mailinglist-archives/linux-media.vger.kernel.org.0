Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC0E0734D4C
	for <lists+linux-media@lfdr.de>; Mon, 19 Jun 2023 10:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbjFSINe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jun 2023 04:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbjFSIN0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jun 2023 04:13:26 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD771B9
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 01:13:24 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9889429a89eso164047966b.1
        for <linux-media@vger.kernel.org>; Mon, 19 Jun 2023 01:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687162403; x=1689754403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9IZmNBpCk3CmUDoVfQixBIhRKfGCWj/vMP5w1KQ2xDA=;
        b=Sqeu07k81iC282yZ5K+ExzZTFVtimG2ZFId3DIFXkPz/Tm60kGMfInFDS7v2acJAwg
         q7sEa176Vc2xk5WvrY9ehuZf6X+mnBKYJPvfTGiasJdP7oWhWjhtLb8MwKFZxdGAJgRl
         cwGI6yKq9ipQC+VlPEzY96m0CLs/HJGVYFdq8mx2h134anGLYsqfAxi/2p76PJk8TCUa
         bqxdI8CGqafiIY8NMKruOAGLGZNQJgpY+rF35saNxXXlMnrt2SDSasVZ3orVu1OXVGE+
         m9fa0VCcA8JIgXs4Ex2bbWgHgaFyvenf+UUXHbVrSoh+Ds796xvtHI2WZujO33xBnQ3n
         +NfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687162403; x=1689754403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IZmNBpCk3CmUDoVfQixBIhRKfGCWj/vMP5w1KQ2xDA=;
        b=fufNvjoLnpEFB8GZx/SORrhDJNy1iLLWZ48dZ1P0M3m3dMHi0YWSBF+Qd9wzLaK3ph
         C0luiKuVyaSyKKq6HiI6B2Y9zqFuDFclh4nYkPMkzgtFA1KCgU9yxiB/Aie+AEtDdmvh
         +CDHA/ZN5oBKQ9k+KYXar3Bd2D7rSrCHyb8TQefOstiTAB+gu3ortlNYZXmVGs5pAITR
         jULqjO04glHBHp0YjZKs07+tRPgny/kAWQbltJyAX3dkt5HlbGX/5awY8QsGgZtqvZHQ
         wfF1hH7EEZS7xtJXXuJr49bmnls2D2USp1z4diXJK2QAIcNq9/wEjXv4KJwRmHzfTK9o
         QmhQ==
X-Gm-Message-State: AC+VfDydIYXxeOMZoySdLxsofWe1yuLBje7C9F1tr3dmHbnqhlnrx31j
        YzBcNuprucFitGttfK1BnAaMncoztOppHQ==
X-Google-Smtp-Source: ACHHUZ4BRRXUnwptBwipIPDbpM+8vd/Jyy8nbOnxu/2mwY6IHeeUmAPkgHGTRo5KmSs28gY4qgezAg==
X-Received: by 2002:a17:907:7da4:b0:969:9c0c:4c97 with SMTP id oz36-20020a1709077da400b009699c0c4c97mr12804093ejc.1.1687162403126;
        Mon, 19 Jun 2023 01:13:23 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-2-39-142-242.cust.vodafonedsl.it. [2.39.142.242])
        by smtp.gmail.com with ESMTPSA id le8-20020a170907170800b00988b6d05f33sm909991ejc.223.2023.06.19.01.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 01:13:22 -0700 (PDT)
Date:   Mon, 19 Jun 2023 10:13:20 +0200
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
Message-ID: <ZJAOIN3hQcjkOlqs@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <ZIo1kHgYMK84iMj7@kekkonen.localdomain>
 <b8e5f3f7-d82d-390b-ac63-824a42c3f6cd@redhat.com>
 <20230615092100.GE741@pendragon.ideasonboard.com>
 <ZIriVxMVVxG2dsUO@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <71aa3c7e-5bb2-afe6-a9a5-390307a8b3f9@redhat.com>
 <ZIr1YVf15ZBJvguX@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ZIr8CFZzq0MttUf+@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <3b79c522-4bba-fd38-e087-8a506ae14a23@redhat.com>
 <ZIs5L1owIKEkg6aW@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <73420627-f49a-eaf2-8544-02af15cfd6db@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73420627-f49a-eaf2-8544-02af15cfd6db@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans, Laurent,

On Fri, Jun 16, 2023 at 06:54:54PM +0200, Hans de Goede wrote:
> Hi Tommaso,
> 
> On 6/15/23 18:15, Tommaso Merciai wrote:
> > Hi Hans,
> > 
> > On Thu, Jun 15, 2023 at 02:00:46PM +0200, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 6/15/23 13:54, Tommaso Merciai wrote:
> >>> On Thu, Jun 15, 2023 at 01:26:25PM +0200, Tommaso Merciai wrote:
> >>>> Hi Hans,
> >>>>
> >>>> On Thu, Jun 15, 2023 at 01:10:40PM +0200, Hans de Goede wrote:
> >>>>> Hi Tommaso,
> >>>>>
> >>>>> On 6/15/23 12:05, Tommaso Merciai wrote:
> >>>>>> Hi Hans, Laurent, Sakari,
> >>>>>>
> >>>>>> Can I cherry-pick this patch and use these new functions also
> >>>>>> for cci regs of the alvium driver?
> >>>>>
> >>>>> Yes that sounds like a good plan.
> >>>>>
> >>>>>> Are on going to be merge?
> >>>>>
> >>>>> Yes this will hopefully get merged upstream soon.
> >>>>
> >>>> Thanks for the info!
> >>>>
> >>>> I want to ask you your opinion about this:
> >>>>
> >>>> Into alvium driver actually I'm using the following defines
> >>>> manipulations:
> >>>>
> >>>> #define REG_BCRM_REG_ADDR_R				REG_BCRM_CCI_16BIT(0x0014)
> >>>>
> >>>> #define REG_BCRM_FEATURE_INQUIRY_R			REG_BCRM_V4L2_64BIT(0x0008)
> >>>> #define REG_BCRM_DEVICE_FIRMWARE_VERSION_R		REG_BCRM_V4L2_64BIT(0x0010)
> >>>>
> >>>> My plan is to use your cci API for cci register in this way defines
> >>>> became like:
> >>>>
> >>>> #define REG_BCRM_REG_ADDR_R				CCI_REG16(0x0014)
> >>>>
> >>>> And leave v4l2 regs are it are right now:
> >>>>
> >>>> #define REG_BCRM_FEATURE_INQUIRY_R			REG_BCRM_V4L2_64BIT(0x0008)
> >>>> #define REG_BCRM_DEVICE_FIRMWARE_VERSION_R		REG_BCRM_V4L2_64BIT(0x0010)
> >>>>
> >>>> What do you think about?
> >>>
> >>> Or maybe is worth don't use v4l2 bit for v4l2 regs, I think is implicit
> >>> that what regs that are not CCI are v4l2, then we return wit the
> >>> following defines:
> >>>
> >>>
> >>>
> >>> #define REG_BCRM_REG_ADDR_R                           CCI_REG16(0x0014)
> >>> ^CCI regs
> >>>
> >>> #define REG_BCRM_FEATURE_INQUIRY_R                    0x0008 
> >>> #define REG_BCRM_DEVICE_FIRMWARE_VERSION_R            0x0010
> >>> ^v4l2 regs
> >>
> >> I'm not sure what you mean with "V4L2" registers ? I guess you mean
> >> registers which cannot be accessed through the CCI helper functions,
> >> but starting with v2 this is no longer true. There now is a CCI_REG64()
> >> so you can simply use that.
> > 
> > I'm playing a bit with v3 of your cci api :)
> > 
> > My problem is the following, bcrm regs are not real regs but are offset
> > from bcrm address (this is not fixed, it depends on the camera).
> > 
> > Then the workflow is:
> > 
> >  - read bcrm_address (base address)
> >  - then sum this to the offset (regs)
> > 
> > Myabe this clarify:
> > 
> > static int alvium_read(struct alvium_dev *alvium, u32 reg, u64 *val)
> > {
> > 	int ret;
> > 
> > 	if (reg & REG_BCRM_V4L2)
> > 		reg += alvium->bcrm_addr;
> > 
> > 	cci_read(alvium->regmap, reg, val, &ret);
> > 	if (ret)
> > 		return ret;
> > 
> > 	return 0;
> > }
> > 
> > int alvium_write(struct alvium_dev *alvium, u32 reg, u64 val)
> > {
> > 	int ret;
> > 
> > 	if (reg & REG_BCRM_V4L2)
> > 		reg += alvium->bcrm_addr;
> > 
> > 	cci_write(alvium->regmap, reg, val, &ret);
> > 	if (ret)
> > 		return ret;
> > 
> > 	return 0;
> > }
> > 
> > Where for example:
> > 
> > #define REG_BCRM_V4L2		BIT(31)
> > #define REG_BCRM_V4L2_64BIT(n)	(REG_BCRM_V4L2 | CCI_REG64(n))
> > 
> > #define REG_BCRM_WRITE_HANDSHAKE_RW REG_BCRM_V4L2_8BIT(0x0418)
> > 
> > 
> > But I'm not sure that I'm in the right direction. 
> > 
> > In real I need first to get the real address then sum the bcrm_address
> > if this is a bcrm regs(offset) then re-incapsule the address into the
> > right CCI_REG# defines.
> 
> Ah I see, so you have a set of windowed registers where
> the base address of these registers may change.

Yep, right :)

> 
> What I don't understand though is why you use V4L2 in the
> name of the #defines for this? Does the datasheet actually
> name them like this ? V4L2 stands for video4linux version 2,
> so unless these registers are somehow Linux specific using
> V4L2 in the #define names is a bit weird IMHO.

These registers are offered from the alvium fw for v4l2 API.
We had a previous discussion with Laurent about this.

Btw I will send v7 with Laurent hints (read_timeout_poll/err-params)
And we can discuss there.

(If for you is ok :) )

I will keep both you and Laurent in CC.

Thanks again both for your review/hints :)

Regards,
Tommaso

> 
> Regards,
> 
> Hans
> 
