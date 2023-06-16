Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B90B733404
	for <lists+linux-media@lfdr.de>; Fri, 16 Jun 2023 16:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345743AbjFPO4Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jun 2023 10:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjFPO4X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jun 2023 10:56:23 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C1330C5
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 07:56:20 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-98646e2fc70so121534266b.1
        for <linux-media@vger.kernel.org>; Fri, 16 Jun 2023 07:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686927379; x=1689519379;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3/guVCvhqMGO/8+i+maytO+oe7dLYxFaH3/SmcVyGrE=;
        b=iooK99h7RRMDnnhDRzGg0JJPNCu2bLRYVc/AbQ9vRBtQ+zKxzAnLtviUo34v4kdtM6
         zcXH5+evAHG6TdoNlYOFuQSmUhLbPZKD3MGvKXt5PSpequ97Tw7i0ODHQPjoqi237C3w
         1xnlKmmQNvqpwjPbf3UIpgHi9X2xXHriOMYXmnSRNG7c6Ysy1gmnA3iKIslQeovd5xIP
         46rLxygpXB28fnlaab4/KYKQHkYnTt7RbyrnXq4K3qLwI0mVkM57evPKspuXax7Elzpd
         E/nCDCdN6bQnooNwRAjHufS/xcgQlddpNy26n0cCZaULM+etM7Zs6MznWyAPrm+u73fw
         AxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686927379; x=1689519379;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/guVCvhqMGO/8+i+maytO+oe7dLYxFaH3/SmcVyGrE=;
        b=GRPtk4nhpqlBwNZfpVofzOOUu4KGmHyBW9hXuuppcCENxaa9nY57ZzTTQZQhi5dTHR
         NyaFmwUYNerqSQWab7NQjJC/KpJh4k1u6obuwqa71RO2sHr1vbJOqkAUSG8xslRjsh3Z
         /IVpiFC9Ry4vI5DNbpgtFf35VWfbnYKyyOrMpSYHQhkvJgBY/V8t0bxk1CIitCvO5oLx
         /3n9NvHrMldnVp9Qmg3dPy8tf7JivO1N/iNNCf7yzROeaPd7iTbCJeheZEyfxh+WFrCe
         38o295kg/eme2PqKLvmRJAxGU3xKx2Y+BLiLisAJU7dul6WeK+9TgDrRzMGvEtMdC4Gm
         DwaA==
X-Gm-Message-State: AC+VfDxUplVL/cZCB3x0JhTrf8h0MzuOTXCdH4uJ5FX4k+96oOHjz/+Y
        tTQJMbl6cPpqf0Q2Yp+iR5M=
X-Google-Smtp-Source: ACHHUZ5ujLLQMTHbpuOkai3Fp9fHThkEmiSlhyIoSq5MtDr9Fr2fe9XbdJYOOudaLNgk2/vRdULgzQ==
X-Received: by 2002:a17:907:9483:b0:978:8e58:e1b9 with SMTP id dm3-20020a170907948300b009788e58e1b9mr2335166ejc.74.1686927378370;
        Fri, 16 Jun 2023 07:56:18 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-2-39-142-242.cust.vodafonedsl.it. [2.39.142.242])
        by smtp.gmail.com with ESMTPSA id re6-20020a170906d8c600b00982aca1560asm2113624ejb.219.2023.06.16.07.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:56:17 -0700 (PDT)
Date:   Fri, 16 Jun 2023 16:56:15 +0200
From:   Tommaso Merciai <tomm.merciai@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/5] media: Add MIPI CCI register access helper
 functions
Message-ID: <ZIx4D/lQFZ+19hWS@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <71aa3c7e-5bb2-afe6-a9a5-390307a8b3f9@redhat.com>
 <ZIr1YVf15ZBJvguX@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <ZIr8CFZzq0MttUf+@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <3b79c522-4bba-fd38-e087-8a506ae14a23@redhat.com>
 <ZIs5L1owIKEkg6aW@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20230615165236.GJ741@pendragon.ideasonboard.com>
 <ZIuOoFCjBOvoILsl@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20230616134124.GC14547@pendragon.ideasonboard.com>
 <ZIxubbZ6IY9MBqvN@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <20230616141706.GF14547@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230616141706.GF14547@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Fri, Jun 16, 2023 at 05:17:06PM +0300, Laurent Pinchart wrote:
> Hi Tommaso,
> 
> On Fri, Jun 16, 2023 at 04:15:09PM +0200, Tommaso Merciai wrote:
> > On Fri, Jun 16, 2023 at 04:41:24PM +0300, Laurent Pinchart wrote:
> > > On Fri, Jun 16, 2023 at 12:20:16AM +0200, Tommaso Merciai wrote:
> > > > On Thu, Jun 15, 2023 at 07:52:36PM +0300, Laurent Pinchart wrote:
> > > > > On Thu, Jun 15, 2023 at 06:15:43PM +0200, Tommaso Merciai wrote:
> > > > > > On Thu, Jun 15, 2023 at 02:00:46PM +0200, Hans de Goede wrote:
> > > > > > > On 6/15/23 13:54, Tommaso Merciai wrote:
> > > > > > > > On Thu, Jun 15, 2023 at 01:26:25PM +0200, Tommaso Merciai wrote:
> > > > > > > >> On Thu, Jun 15, 2023 at 01:10:40PM +0200, Hans de Goede wrote:
> > > > > > > >>> On 6/15/23 12:05, Tommaso Merciai wrote:
> > > > > > > >>>> Hi Hans, Laurent, Sakari,
> > > > > > > >>>>
> > > > > > > >>>> Can I cherry-pick this patch and use these new functions also
> > > > > > > >>>> for cci regs of the alvium driver?
> > > > > > > >>>
> > > > > > > >>> Yes that sounds like a good plan.
> > > > > > > >>>
> > > > > > > >>>> Are on going to be merge?
> > > > > > > >>>
> > > > > > > >>> Yes this will hopefully get merged upstream soon.
> > > > > > > >>
> > > > > > > >> Thanks for the info!
> > > > > > > >>
> > > > > > > >> I want to ask you your opinion about this:
> > > > > > > >>
> > > > > > > >> Into alvium driver actually I'm using the following defines
> > > > > > > >> manipulations:
> > > > > > > >>
> > > > > > > >> #define REG_BCRM_REG_ADDR_R				REG_BCRM_CCI_16BIT(0x0014)
> > > > > > > >>
> > > > > > > >> #define REG_BCRM_FEATURE_INQUIRY_R			REG_BCRM_V4L2_64BIT(0x0008)
> > > > > > > >> #define REG_BCRM_DEVICE_FIRMWARE_VERSION_R		REG_BCRM_V4L2_64BIT(0x0010)
> > > > > > > >>
> > > > > > > >> My plan is to use your cci API for cci register in this way defines
> > > > > > > >> became like:
> > > > > > > >>
> > > > > > > >> #define REG_BCRM_REG_ADDR_R				CCI_REG16(0x0014)
> > > > > > > >>
> > > > > > > >> And leave v4l2 regs are it are right now:
> > > > > > > >>
> > > > > > > >> #define REG_BCRM_FEATURE_INQUIRY_R			REG_BCRM_V4L2_64BIT(0x0008)
> > > > > > > >> #define REG_BCRM_DEVICE_FIRMWARE_VERSION_R		REG_BCRM_V4L2_64BIT(0x0010)
> > > > > > > >>
> > > > > > > >> What do you think about?
> > > > > > > > 
> > > > > > > > Or maybe is worth don't use v4l2 bit for v4l2 regs, I think is implicit
> > > > > > > > that what regs that are not CCI are v4l2, then we return wit the
> > > > > > > > following defines:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > #define REG_BCRM_REG_ADDR_R                           CCI_REG16(0x0014)
> > > > > > > > ^CCI regs
> > > > > > > > 
> > > > > > > > #define REG_BCRM_FEATURE_INQUIRY_R                    0x0008 
> > > > > > > > #define REG_BCRM_DEVICE_FIRMWARE_VERSION_R            0x0010
> > > > > > > > ^v4l2 regs
> > > > > > > 
> > > > > > > I'm not sure what you mean with "V4L2" registers ? I guess you mean
> > > > > > > registers which cannot be accessed through the CCI helper functions,
> > > > > > > but starting with v2 this is no longer true. There now is a CCI_REG64()
> > > > > > > so you can simply use that.
> > > > > > 
> > > > > > I'm playing a bit with v3 of your cci api :)
> > > > > > 
> > > > > > My problem is the following, bcrm regs are not real regs but are offset
> > > > > > from bcrm address (this is not fixed, it depends on the camera).
> > > > > > 
> > > > > > Then the workflow is:
> > > > > > 
> > > > > >  - read bcrm_address (base address)
> > > > > >  - then sum this to the offset (regs)
> > > > > > 
> > > > > > Myabe this clarify:
> > > > > > 
> > > > > > static int alvium_read(struct alvium_dev *alvium, u32 reg, u64 *val)
> > > > > 
> > > > > I would add a int *err argument to your read and write wrappers.
> > > > 
> > > > 
> > > > Thanks for your hint!
> > > > What about using:
> > > > 
> > > > static int alvium_write(struct alvium_dev *alvium, u32 reg, u64 val)
> > > > {
> > > > 	if (reg & REG_BCRM_V4L2) {
> > > > 		reg &= ~REG_BCRM_V4L2;
> > > > 		reg += alvium->bcrm_addr;
> > > > 	}
> > > > 
> > > > 	return cci_write(alvium->regmap, reg, val, NULL);
> > > > }
> > > > 
> > > > Then:
> > > > 
> > > > 	ret = alvium_write(alvium, reg, val);
> > > > 	if (ret) {
> > > > 		dev_err(dev, "Fail to write reg\n");
> > > > 		return ret;
> > > > 	}
> > > > 
> > > > 
> > > > I prefer to use this format if for you is ok.
> > > > Let me know.
> > > 
> > > This is fine when you have to write a single register only, but it makes
> > > things more complicated when writing multiple registers. Consider this:
> > > 
> > > 	int ret;
> > > 
> > > 	ret = alvium_write(alvium, REG_A, val);
> > > 	if (ret)
> > > 		return ret;
> > > 
> > > 	ret = alvium_write(alvium, REG_B, val);
> > > 	if (ret)
> > > 		return ret;
> > > 
> > > 	ret = alvium_write(alvium, REG_C, val);
> > > 	if (ret)
> > > 		return ret;
> > > 
> > > 	ret = alvium_write(alvium, REG_D, val);
> > > 	if (ret)
> > > 		return ret;
> > > 
> > > 	return 0;
> > > 
> > > and compare it to
> > > 
> > > 	int ret = 0;
> > > 
> > > 	alvium_write(alvium, REG_A, val, &ret);
> > > 	alvium_write(alvium, REG_B, val, &ret);
> > > 	alvium_write(alvium, REG_C, val, &ret);
> > > 	alvium_write(alvium, REG_D, val, &ret);
> > > 
> > > 	return ret;
> > 
> > Is worth to add is also in alvium_write_hshake right?

Checking this... :)

Most of the driver don't use so much sequence of writes/reads
and to be honest I want know where it fail


For example:

static int alvium_write_hshake(struct alvium_dev *alvium, u32 reg, u64 val,
							   int *err)
{
	struct device *dev = &alvium->i2c_client->dev;
	u64 hshake_regval;
	u8 hshake_bit;

	if (err && *err)
		return *err;

	if (!alvium->bcrm_addr)
		return -EINVAL;

	/* reset handshake bit */
	alvium_write(alvium, REG_BCRM_WRITE_HANDSHAKE_RW, 0, err);

	/* write alvium reg*/
	alvium_write(alvium, reg, val, err);

	/* poll handshake bit since bit0 = 1*/
	do {
		alvium_read(alvium, REG_BCRM_WRITE_HANDSHAKE_RW, &hshake_regval, err);
		hshake_bit = (hshake_regval & BCRM_HANDSHAKE_W_DONE_EN_BIT);

	} while (!hshake_bit);

	/* reset handshake bit, write 0 to bit0 */
	alvium_write(alvium, REG_BCRM_WRITE_HANDSHAKE_RW, 0, err);

	/* poll handshake bit since bit0 = 0 */
	do {
		alvium_read(alvium, REG_BCRM_WRITE_HANDSHAKE_RW, &hshake_regval, err);
		hshake_bit = (hshake_regval & BCRM_HANDSHAKE_W_DONE_EN_BIT);

	} while (hshake_bit);

	return *err;
}

If some write/read fail and have the same regs I want to know where the issue
is... Then I have to go back to the previous implementation..

I know that also cci API provides some print.
But maybe the older version is more straight forwed under debug
perspective...

Maybe is better to have more code in this case
This is my first impression following your way :)

Do you agree on this?

Regards,
Tommaso


> 
> I'd say it's worth everywhere you can have multiple writes.
> 
> > > > > > {
> > > > > > 	int ret;
> > > > > > 
> > > > > > 	if (reg & REG_BCRM_V4L2)
> > > > > > 		reg += alvium->bcrm_addr;
> > > > > > 
> > > > > 
> > > > > You should also clear the REG_BCRM_V4L2 bit here:
> > > > > 
> > > > >  	if (reg & REG_BCRM_V4L2) {
> > > > > 		reg &= ~REG_BCRM_V4L2;
> > > > >  		reg += alvium->bcrm_addr;
> > > > > 	}
> > > > > 
> > > > > > 	cci_read(alvium->regmap, reg, val, &ret);
> > > > > > 	if (ret)
> > > > > > 		return ret;
> > > > > > 
> > > > > > 	return 0;
> > > > > 
> > > > > Just
> > > > > 
> > > > > 	return cci_read(alvium->regmap, reg, val, err);
> > > > > 
> > > > > Same for alvium_write()..
> > > > > 
> > > > > > }
> > > > > > 
> > > > > > int alvium_write(struct alvium_dev *alvium, u32 reg, u64 val)
> > > > > > {
> > > > > > 	int ret;
> > > > > > 
> > > > > > 	if (reg & REG_BCRM_V4L2)
> > > > > > 		reg += alvium->bcrm_addr;
> > > > > > 
> > > > > > 	cci_write(alvium->regmap, reg, val, &ret);
> > > > > > 	if (ret)
> > > > > > 		return ret;
> > > > > > 
> > > > > > 	return 0;
> > > > > > }
> > > > > > 
> > > > > > Where for example:
> > > > > > 
> > > > > > #define REG_BCRM_V4L2		BIT(31)
> > > > > > #define REG_BCRM_V4L2_64BIT(n)	(REG_BCRM_V4L2 | CCI_REG64(n))
> > > > > > 
> > > > > > #define REG_BCRM_WRITE_HANDSHAKE_RW REG_BCRM_V4L2_8BIT(0x0418)
> > > > > > 
> > > > > > 
> > > > > > But I'm not sure that I'm in the right direction. 
> > > > > 
> > > > > This looks good to me.
> > > > > 
> > > > > The fact that both Hans' helpers and part of the Alvium camera registers
> > > > > are named CCI is not a complete coincidence, but it doesn't mean they're
> > > > > identical. I would thus keep the REG_BCRM_CCI_* macros for clarity,
> > > > > simply defining them as CCI_* wrappers:
> > > > > 
> > > > > #define REG_BCRM_V4L2_8BIT(n)		CCI_REG8(n)
> > > > > ...
> > > > > 
> > > > > > In real I need first to get the real address then sum the bcrm_address
> > > > > > if this is a bcrm regs(offset) then re-incapsule the address into the
> > > > > > right CCI_REG# defines.
> > > > > > 
> > > > > > Then I'm not completely sure that cci fits my use case.
> > > > > > What do you think about?
> > > > > > 
> > > > > > Btw really great work! :)
> > > > > > 
> > > > > > > > ?
> > > > > > > > 
> > > > > > > >>> Note I'm about to send out a v3 addressing some small
> > > > > > > >>> remarks on this v2. I'll Cc you on that.
> > > > > > > >>
> > > > > > > >> Thanks, in this way I can test that and let you know my feedback.
> > > > > > > >>
> > > > > > > >>>> Let me know.
> > > > > > > >>>> Thanks! :)
> > > > > > > >>>>
> > > > > > > >>>> On Thu, Jun 15, 2023 at 12:21:00PM +0300, Laurent Pinchart wrote:
> > > > > > > >>>>> On Thu, Jun 15, 2023 at 11:11:20AM +0200, Hans de Goede wrote:
> > > > > > > >>>>>> On 6/14/23 23:48, Sakari Ailus wrote:
> > > > > > > >>>>>>> On Thu, Jun 15, 2023 at 12:34:29AM +0300, Laurent Pinchart wrote:
> > > > > > > >>>>>>>> On Wed, Jun 14, 2023 at 08:39:56PM +0000, Sakari Ailus wrote:
> > > > > > > >>>>>>>>> On Wed, Jun 14, 2023 at 09:23:39PM +0200, Hans de Goede wrote:
> > > > > > > >>>>>>>>>> The CSI2 specification specifies a standard method to access camera sensor
> > > > > > > >>>>>>>>>> registers called "Camera Control Interface (CCI)".
> > > > > > > >>>>>>>>>>
> > > > > > > >>>>>>>>>> This uses either 8 or 16 bit (big-endian wire order) register addresses
> > > > > > > >>>>>>>>>> and supports 8, 16, 24 or 32 bit (big-endian wire order) register widths.
> > > > > > > >>>>>>>>>>
> > > > > > > >>>>>>>>>> Currently a lot of Linux camera sensor drivers all have their own custom
> > > > > > > >>>>>>>>>> helpers for this, often copy and pasted from other drivers.
> > > > > > > >>>>>>>>>>
> > > > > > > >>>>>>>>>> Add a set of generic helpers for this so that all sensor drivers can
> > > > > > > >>>>>>>>>> switch to a single common implementation.
> > > > > > > >>>>>>>>>>
> > > > > > > >>>>>>>>>> These helpers take an extra optional "int *err" function parameter,
> > > > > > > >>>>>>>>>> this can be used to chain a bunch of register accesses together with
> > > > > > > >>>>>>>>>> only a single error check at the end, rather then needing to error
> > > > > > > >>>>>>>>>> check each individual register access. The first failing call will
> > > > > > > >>>>>>>>>> set the contents of err to a non 0 value and all other calls will
> > > > > > > >>>>>>>>>> then become no-ops.
> > > > > > > >>>>>>>>>>
> > > > > > > >>>>>>>>>> Link: https://lore.kernel.org/linux-media/59aefa7f-7bf9-6736-6040-39551329cd0a@redhat.com/
> > > > > > > >>>>>>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > > > > > >>>>>>>>>> ---
> > > > > > > >>>>>>>>>> Changes in v2:
> > > > > > > >>>>>>>>>> - Drop cci_reg_type enum
> > > > > > > >>>>>>>>>> - Make having an encoded reg-width mandatory rather then using 0 to encode
> > > > > > > >>>>>>>>>>   8 bit width making reg-addresses without an encoded width default to
> > > > > > > >>>>>>>>>>   a width of 8
> > > > > > > >>>>>>>>>> - Add support for 64 bit wide registers
> > > > > > > >>>>>>>>
> > > > > > > >>>>>>>> I'm in two minds about this. This means that the read and write
> > > > > > > >>>>>>>> functions take a u64 argument, which will be less efficient on 32-bit
> > > > > > > >>>>>>>> platforms. I think it would be possible, with some macro magic, to
> > > > > > > >>>>>>>> accept different argument sizes, but maybe that's a micro-optimization
> > > > > > > >>>>>>>> that would actually result in worse code. 
> > > > > > > >>>>>>>>
> > > > > > > >>>>>>>> 64-bit support could be useful, but as far as I can tell, it's not used
> > > > > > > >>>>>>>> in this series, so maybe we could leave this for later ?
> > > > > > > >>>>>>>
> > > > > > > >>>>>>> I prefer to have it now, I just told Tommaso working on the Alvium driver
> > > > > > > >>>>>>> to use this, and he needs 64-bit access. :-)
> > > > > > > >>>>>>>
> > > > > > > >>>>>>> You could also easily have 32-bit and 64-bit variant of the functions, with
> > > > > > > >>>>>>> C11 _Generic(). Introducing it now would be easier than later.
> > > > > > > >>>>>>
> > > > > > > >>>>>> I took a quick look at C11 _Generic() and that looks at the type
> > > > > > > >>>>>> of "things" so in this case it would look at type of the val argument.
> > > > > > > >>>>>>
> > > > > > > >>>>>> Problem is that that can still be e.g. an int when doing a
> > > > > > > >>>>>> read/write from a 64 bit registers.
> > > > > > > >>>>>>
> > > > > > > >>>>>> So we would then need to handle the 64 bit width case in the 32
> > > > > > > >>>>>> bit versions of the functions too.
> > > > > > > >>>>>>
> > > > > > > >>>>>> And likewise I can see someone passing a long on a 64 bit
> > > > > > > >>>>>> arch while doing a cci_write() to a non 64 bit register.
> > > > > > > >>>>>>
> > > > > > > >>>>>> So this would basically mean copy and pasting cci_read()
> > > > > > > >>>>>> + cci_write() 2x with the only difference being one
> > > > > > > >>>>>> variant taking a 32 bit val argument and the other a
> > > > > > > >>>>>> 64 bit val argument.
> > > > > > > >>>>>>
> > > > > > > >>>>>> This seems like premature optimization to me.
> > > > > > > >>>>>>
> > > > > > > >>>>>> As mentioned in my reply to Laurent if we want to
> > > > > > > >>>>>> optimize things we really should look at avoiding
> > > > > > > >>>>>> unnecessary i2c transfers, or packing multiple
> > > > > > > >>>>>> writes into a single i2c transfer for writes to
> > > > > > > >>>>>> subsequent registers. That is where significant
> > > > > > > >>>>>> speedups can be made.
> > > > > > > >>>>>
> > > > > > > >>>>> This is something I'd really like to see, but it's way more work.
> > > > > > > >>>>>
> > > > > > > >>>>> There's an important need of applying changes atomically, which is often
> > > > > > > >>>>> not possible to strictly guarantee over I2C. Userspace ends up writing
> > > > > > > >>>>> V4L2 controls as quickly as it can after the start of a frame, hoping
> > > > > > > >>>>> they will all reach the sensor before the end of the frame. Some
> > > > > > > >>>>> platforms have camera-specific I2C controllers that have the ability to
> > > > > > > >>>>> buffer I2C transfers and issue them based on a hardware trigger. How to
> > > > > > > >>>>> fit this in th� kernel I2C API will be an interesting exercise.
> 
> -- 
> Regards,
> 
> Laurent Pinchart
