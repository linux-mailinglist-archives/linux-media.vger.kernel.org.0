Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB2B7423EA
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 12:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbjF2KW4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jun 2023 06:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231681AbjF2KWt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jun 2023 06:22:49 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1860510F
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 03:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688034168; x=1719570168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0lJv9JWAWWAQKoQS4Faw7veXAIoTHp6hoUETvI1p+9Q=;
  b=dPjhbNExCpwlRiXzEYH6xAQaRUrus0lyWeUFTXFIVc9h0rStHTBfZErC
   RJoPvjPGM2Kt5vDCAIXwVe7PcJZc4oDqatE+jrbCv1T8f5pkk6X/lXePu
   iVTGSQNVWiN1ayEob+hIfg0qbIB0xwxmTdAmWjPv7ztvpEjmaStNVo5Yr
   d/amBXWRMzsxNtqPATWyiNc/rR0F72vWehjmZ/T+6CMa0V0XPx7gDh3Pm
   TnEbf2leLSH6M8E/anudnThGnhE++yXiKKe1vu0thYbWRBavrLyAlkPmB
   R6qtmCTRVtY+UNkwMcOJhbsSZqZ3zh2QZV3i6DkESrw/splfBvP6RsmRY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="448453533"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="448453533"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 03:22:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="963938985"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="963938985"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 03:22:46 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 47B751206E6;
        Thu, 29 Jun 2023 13:22:43 +0300 (EEST)
Date:   Thu, 29 Jun 2023 10:22:43 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dan Scally <dan.scally@ideasonboard.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/1] media: i2c: Select V4L2_FWNODE and
 VIDEO_V4L2_SUBDEV_API for sensors
Message-ID: <ZJ1bc6YuHPg6YpOT@kekkonen.localdomain>
References: <20230629081116.919253-1-sakari.ailus@linux.intel.com>
 <199f7d7a-ae7a-3a08-0a92-14511db0daf5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <199f7d7a-ae7a-3a08-0a92-14511db0daf5@redhat.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jun 29, 2023 at 12:11:01PM +0200, Hans de Goede wrote:
> Hi Sakari,
> 
> On 6/29/23 10:11, Sakari Ailus wrote:
> > Select V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API for all sensor drivers. This
> > also adds the options to drivers that don't specifically need them, these
> > are still seldom used drivers using old APIs. The upside is that these
> > should now all compile --- many drivers have had missing dependencies.
> > 
> > The "menu" is replaced by selectable "menuconfig" to select the needed
> > V4L2_FWNODE and VIDEO_V4L2_SUBDEV_API options.
> > 
> > Reported-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Thank you for working on this. This looks good to me, but shouldn't
> all the existing sensor Kconfig bits then have their depends on
> MEDIA_CAMERA_SUPPORT / MEDIA_CONTROLLER and select V4L2_FWNODE / VIDEO_V4L2_SUBDEV_API
> bits dropped ?

Yes. I thought of doing that in a separate patch while this one could be
backported independently of any added sensor drivers.

I forgot MEDIA_CONTROLLER now can be selected, it's not something to depend
on anymore.

-- 
Regards,

Sakari Ailus
