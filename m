Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D167B73092A
	for <lists+linux-media@lfdr.de>; Wed, 14 Jun 2023 22:30:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbjFNUak (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jun 2023 16:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbjFNUaW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jun 2023 16:30:22 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A45882125
        for <linux-media@vger.kernel.org>; Wed, 14 Jun 2023 13:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686774621; x=1718310621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sCzktRSlIbaoyo4IIb8gBu+Mb9vziceDRLcPNf3lBXY=;
  b=Dlik/b2r/i6Urto8TU1BgLEZUMynSPAxCG/vzw+k6mkTeWQLTgILrvtD
   31a39Ea0UEEgcjvkFpg9Zh6CZZ+rlOYDEQWZE0gmWRdagq45UF+hQsVy8
   qluoDLzs6hBDEvrZsqjfi02ZxbgGg9lyIBmRiAG9hI62ZQ5l7Gr0lBj9+
   o7N0tq2MM93skSoZlNo5GLUuzTHAlaydRU8HfJlNfa/c5VCR0lq6Bj8hP
   7c8dnMdXLNd91oXCs8WY1B8ZOdXu58fWuAPLFuM/Ks99wPUWmUWanewFm
   vLtFtSM6HTwhkrj9+b71xi24nmdPGCpouHZYlacyHF32TatrHaNoPI5NU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="422329521"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="422329521"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 13:30:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="886397033"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="886397033"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 13:30:19 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id 88947120C62;
        Wed, 14 Jun 2023 23:30:16 +0300 (EEST)
Date:   Wed, 14 Jun 2023 20:30:16 +0000
From:   "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        hverkuil@xs4all.nl
Subject: Re: OV5693 Kconfig missing a select VIDEO_V4L2_SUBDEV_API ?
Message-ID: <ZIojWLapfr/pBeQH@kekkonen.localdomain>
References: <ce81b73f-48db-038d-2671-bccbb3490786@redhat.com>
 <ZInlO48ACwQ3lwYX@kekkonen.localdomain>
 <813f8b84-4737-3898-24eb-30099ffb6043@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <813f8b84-4737-3898-24eb-30099ffb6043@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Wed, Jun 14, 2023 at 06:50:14PM +0200, Hans de Goede wrote:
> Hi Sakari,
> 
> On 6/14/23 18:05, sakari.ailus@linux.intel.com wrote:
> > Hi Hans,
> > 
> > On Wed, Jun 14, 2023 at 05:47:01PM +0200, Hans de Goede wrote:
> >> Hi All,
> >>
> >> The ov5693 driver uses v4l2_subdev_get_try_crop() /
> >> v4l2_subdev_get_try_format() both of which are
> >> only defined if CONFIG_VIDEO_V4L2_SUBDEV_API=y .
> >>
> >> Yet it does not do select VIDEO_V4L2_SUBDEV_API
> >> in its Kconfig bits ?
> >>
> >> Note I've not seen any build errors because of this,
> >> I guess we somehow end up getting away with this...
> >>
> >> But still I think the select should be added ?
> > 
> > I agree.
> > 
> > The reason there haven't been compile failures is that there's a vast
> > number of sensor drivers that all select this so for a failure you'd need
> > to select this one but none of the others.
> > 
> > I can send a fix.
> 
> Also see my follow-up email. If we're going to fix this
> we really should fix it properly. As mentioned in
> my folow-up email an intermediate Kconfig option
> might be best.
> 
> E.g. doing:
> 
> grep -l v4l2_async_register_subdev drivers/media/i2c/*.c
> 
> And comparing that to Kconfig finds the following Kconfig
> entries lacking a select V4L2_FWNODE / select V4l2_ASYNC
> 
> VIDEO_IMX208
> VIDEO_IMX258
> VIDEO_IMX274
> VIDEO_IMX319
> VIDEO_IMX355
> VIDEO_OV6650
> VIDEO_OV7740
> VIDEO_OV9640
> VIDEO_OV9650
> 
> and I stopped checking after the ov* drivers since I think
> the above list makes my point.

Yeah, sometimes difficult to find errors get repeated. Luckily it's "just"
a compilation problem.

Using V4L2 fwnode and V4L2 sub-device APIs are still unrelated as such
although in practice they do often happen together. There are still quite a
few sensor drivers that don't need both of them. Some can be compiled with
VIDEO_V4L2_SUBDEV_API disabled, too, but I'm not sure how useful that
really is. The rest are probably not usable outside a very specific scope,
such as I²C async matching used by a handful of receiver drivers (none use
MC, thus no sub-device API either).

Perhaps we could group these in two classes where the common class has
V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API selected? I'm not sure having an
intermediate, somewhat obscure, option would be helpful.

Also cc Hans and Laurent.

-- 
Regards,

Sakari Ailus
