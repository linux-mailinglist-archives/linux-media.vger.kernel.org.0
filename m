Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD5FE7BA21D
	for <lists+linux-media@lfdr.de>; Thu,  5 Oct 2023 17:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbjJEPOW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Oct 2023 11:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232601AbjJEPNX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Oct 2023 11:13:23 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9853D36BE
        for <linux-media@vger.kernel.org>; Thu,  5 Oct 2023 07:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696516593; x=1728052593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aeiuRNOpjP8OJc6Nuaaq251fzG/vuRu5modEpuhazgE=;
  b=XAcjEtdEj3pe4qlJs9Aamc42zl8B1yJJlfTxBaKM3v+Vipb8r1vmwNex
   ZeGxK69Vm0axX9Ivm2B0FdjxzJL6dofXbaquuoIVGmSieT8TwYYkGFYNC
   s9X2PgAsfH4o5u78CqLe21UNuo3wWlOC+DkvE5cRv7Y+vmnp/fokhyvgP
   d+TklBwE3v60qnJA2Ng++pgRba7vbzx0+1z4UjWTk/QbTFgkrT//f/acc
   dcYAhrDDxW0fTy19bO/kpGTPmMkNHtYC/UYouHWP17dnLomhEpujEhGkV
   CA/zQFmd1dEgbp/u7TJcYJdfDOdZai6+hEzQDouG7p0gg9QUtSqiLR2VD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363796122"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="363796122"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 07:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="817606438"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="817606438"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 07:35:12 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id DF3DA120AD7;
        Thu,  5 Oct 2023 17:35:09 +0300 (EEST)
Date:   Thu, 5 Oct 2023 14:35:09 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tomi.valkeinen@ideasonboard.com, bingbu.cao@intel.com,
        hongju.wang@intel.com,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>,
        "Ng, Khai Wen" <khai.wen.ng@intel.com>
Subject: Re: [PATCH v6 09/28] media: Documentation: Document embedded data
 guidelines for camera sensors
Message-ID: <ZR7JnbqC0trXOV6P@kekkonen.localdomain>
References: <20231003115237.76828-1-sakari.ailus@linux.intel.com>
 <20231003115237.76828-10-sakari.ailus@linux.intel.com>
 <532dda7e-5632-4081-8ef0-89a89905e566@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <532dda7e-5632-4081-8ef0-89a89905e566@xs4all.nl>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Oct 05, 2023 at 12:14:05PM +0200, Hans Verkuil wrote:
> On 03/10/2023 13:52, Sakari Ailus wrote:
> > Document how embedded data support should be implemented for camera
> > sensors, and when and how CCS embedded data format should be referenced.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  .../media/drivers/camera-sensor.rst           | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> > 
> > diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > index 919a50e8b9d9..308f391c5ca1 100644
> > --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> > @@ -102,3 +102,31 @@ register programming sequences shall initialize the :ref:`V4L2_CID_HFLIP
> >  values programmed by the register sequences. The default values of these
> >  controls shall be 0 (disabled). Especially these controls shall not be inverted,
> >  independently of the sensor's mounting rotation.
> > +
> > +Embedded data
> > +-------------
> > +
> > +Many sensors, mostly raw sensors, support embedded data which is used to convey
> > +the sensor configuration for the captured frame back to the host. While CSI-2 is
> > +the most common bus used by such sensors, embedded data is not entirely limited
> > +to CSI-2 bus due to e.g. bridge devices.
> > +
> > +Embedded data support should use an internal source pad and route to the
> 
> "internal source pad" -> "internal sink pad"?
> 
> > +external pad. If embedded data output can be disabled in hardware, it should be
> 
> "external pad" -> "external source pad"?
> 
> Or perhaps "a source pad of the entity"?

The documentation discusses "internal source pads" that are in fact
internal pads with the INTERNAL and SINK flags set. This is probably
present in other patches, too. The terms are indeed confusing, I'll see if
I could rephrase it.

Of the two options, I prefer the former.

-- 
Sakari Ailus
