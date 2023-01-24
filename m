Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 682E3679885
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 13:49:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234098AbjAXMtk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 07:49:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234086AbjAXMt1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 07:49:27 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AE8246168
        for <linux-media@vger.kernel.org>; Tue, 24 Jan 2023 04:48:59 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="305948418"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="305948418"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 04:47:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="662131747"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; 
   d="scan'208";a="662131747"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 24 Jan 2023 04:47:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pKIiR-00ELMA-0k;
        Tue, 24 Jan 2023 14:47:55 +0200
Date:   Tue, 24 Jan 2023 14:47:54 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y8/Tevwd4AiZ3YmO@smile.fi.intel.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y87NchQIfQ3zah+4@smile.fi.intel.com>
 <c5a0df74-d2a0-0795-5185-06582be7f0b6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5a0df74-d2a0-0795-5185-06582be7f0b6@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 24, 2023 at 12:21:50PM +0100, Hans de Goede wrote:
> On 1/23/23 19:09, Andy Shevchenko wrote:
> > On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:
> >> The following drivers under drivers/media/i2c: ov08x40.c, ov13858.c,
> >> ov13b10.c, ov2680.c, ov2685.c, ov2740.c, ov4689.c, ov5670.c,
> >> ov5675.c, ov5695.c, ov8856.c, ov9282.c and ov9734.c,
> >>
> >> as well as various "atomisp" sensor drivers in drivers/staging, *all*
> >> use register access helpers with the following function prototypes:
> >>
> >> int ovxxxx_read_reg(struct ovxxxx_dev *sensor, u16 reg,
> >>                     unsigned int len, u32 *val);
> >>
> >> int ovxxxx_write_reg(struct ovxxxx_dev *sensor, u16 reg,
> >>                      unsigned int len, u32 val);
> >>
> >> To read/write registers on Omnivision OVxxxx image sensors wich expect
> >> a 16 bit register address in big-endian format and which have 1-3 byte
> >> wide registers, in big-endian format (for the higher width registers).
> >>
> >> Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
> >> versions of these register access helpers, so that this code duplication
> >> can be removed.

...

> >> +	msgs[1].buf = &data_buf[4 - len];
> > 
> > This trick I don't like. Can we have like other driver have it, i.e. switch
> > case for the possible length and explicit usage of the endian conversion
> > calls?
> 
> This new header (which is intended to eventually be used in many other
> ovXXXX drivers too) is modeled after the reg access helpers
> in drivers/media/i2c/ov*.c
> 
> And those do use be16 for the addr_buf in some cases, so I'm fine
> with changing that. But non of them do a switch-case on len,
> instead they all use similar tricks as this code (which was
> copied from drivers/media/i2c/ov2680.c) does.
> 
> So I would prefer to keep this as is, so that the new
> ovxxxx_16bit_addr_reg_helpers.h code is more like the code which
> it intends to replace.

Yes, this is rather for the followup improvements when we have all drivers use
these helpers.

But under "other drivers" I meant more or less IIO ones where similar
(to what I suggest) approach is being used.

-- 
With Best Regards,
Andy Shevchenko


