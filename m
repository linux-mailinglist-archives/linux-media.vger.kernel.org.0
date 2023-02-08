Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02EBD68F0E2
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 15:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231511AbjBHOdk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 09:33:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbjBHOdj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 09:33:39 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C8A0FA
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 06:33:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A7749B81E28
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 14:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA0FC433EF;
        Wed,  8 Feb 2023 14:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675866815;
        bh=nWey4jNU9+Sif+LSgRMsMxWM4RnLU+cpOsDgXGewWQg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Bxr6yBG2Sc2qJ8swG0K4FZBoRaWDOrxNOV4/Ljrof1okbjOBp9ODwtSnL5XEYUT3T
         dABWfhz1D35ipFx685szlb3KLiBQicaVpLNMMGwwdHGnixiNWNI58cw5Opmab4DEzx
         tN+KhRI6t277jpdWddIWGhFLtz/WtmWcr7FNpi9HGbNWa+XeSmth43M5xPsb3wnOKI
         8s/Wv3W5YYzuR8WkIKgISlnWdpjOGJPxjel9cu0qRimAdSJjrSHh7kjB3SKed6UUcR
         rRLFQ74JJ3gCyfIpYi9fl9kvIrBNax1zudQ06Ol8WvwxrxIZ/BZgOZwidQ40ANHvr4
         cMl5I248ST+Eg==
Date:   Wed, 8 Feb 2023 15:33:29 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <20230208153329.6dccd807@coco.lan>
In-Reply-To: <Y+OIBefssxY3bbmK@kekkonen.localdomain>
References: <20230123125205.622152-1-hdegoede@redhat.com>
        <20230123125205.622152-29-hdegoede@redhat.com>
        <Y+OIBefssxY3bbmK@kekkonen.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 8 Feb 2023 13:31:17 +0200
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> Hi Hans,
> 
> On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:
> > The following drivers under drivers/media/i2c: ov08x40.c, ov13858.c,
> > ov13b10.c, ov2680.c, ov2685.c, ov2740.c, ov4689.c, ov5670.c,
> > ov5675.c, ov5695.c, ov8856.c, ov9282.c and ov9734.c,
> > 
> > as well as various "atomisp" sensor drivers in drivers/staging, *all*
> > use register access helpers with the following function prototypes:
> > 
> > int ovxxxx_read_reg(struct ovxxxx_dev *sensor, u16 reg,
> >                     unsigned int len, u32 *val);
> > 
> > int ovxxxx_write_reg(struct ovxxxx_dev *sensor, u16 reg,
> >                      unsigned int len, u32 val);
> > 
> > To read/write registers on Omnivision OVxxxx image sensors wich expect
> > a 16 bit register address in big-endian format and which have 1-3 byte
> > wide registers, in big-endian format (for the higher width registers).
> > 
> > Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
> > versions of these register access helpers, so that this code duplication
> > can be removed.  
> 
> Ideally we'd have helpers for CCI, of which this is a subset. And on top of
> regmap. I don't object adding these either though.

Well, ideally, when the atomisp-specific sensor ioctls go away, we can
merge the atomisp-specific sensor drivers for not-yet-uptreamed sensors
or modify the existing sensor drivers to accept the atomisp resolutions [1].

So, for now, I wouldn't convert those to use regmap. This can be done
later with the remaining drivers.

[1] atomisp usually requires 16 extra lines/columns for it to work, so
the current sensor drivers there allow setting resolutions like
1616x1216 at the sensor, while offering 1600x1200 resolution to
userspace.

Thanks,
Mauro
