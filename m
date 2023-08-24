Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E565C78685B
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 09:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234781AbjHXHbp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 03:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240339AbjHXHbU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 03:31:20 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A368B10C8
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 00:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692862277; x=1724398277;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5hgJKsiGWl4oq1llW7uZcjQWi9/ldTzf8++Sj3sGCPA=;
  b=l8c5CALkR09rMNfsvI1UFWtbRzfWuIfTr3tEnBiAcRmV6TQPl9oX9QMf
   FqLTIfqh0+qUmylpFzZU0HJsGbrS+/dBGOlp80Ji/TUnq5qGSw0VZT2B0
   4bU6qqP6SOFIFv2C2W1hJGuOBCDdeXd7Vc/XnG0w4aMK7kqJgdZFW4/tR
   r5GGRAG9PgWGQFkh3KIpmjds94UdP/2o7QsRHlV2hflUuLstiVDuD7Wf/
   Jp3QqhvI/jCyALGRNgxNEIEAVrWErs4J34jaf51VvRPv8dUJtd1WD4IjW
   Dkl5Z7G9DOAAuKR9G6eHtBLs7eubr3vdc90s4XnZtJ0X2FBvhs+ipXUeY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="405367660"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="405367660"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 00:31:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="851379731"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="851379731"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 00:31:14 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 0147911F9B6;
        Thu, 24 Aug 2023 10:24:21 +0300 (EEST)
Date:   Thu, 24 Aug 2023 07:24:21 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        bingbu.cao@intel.com, hongju.wang@intel.com, hverkuil@xs4all.nl,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: Re: [PATCH v3 04/10] media: uapi: Add generic serial metadata mbus
 formats
Message-ID: <ZOcFpbLmZHh1d6Vt@kekkonen.localdomain>
References: <20230808075538.3043934-1-sakari.ailus@linux.intel.com>
 <20230808075538.3043934-5-sakari.ailus@linux.intel.com>
 <0d022884-366d-4df0-caa6-2406714d5e07@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d022884-366d-4df0-caa6-2406714d5e07@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Moi,

On Wed, Aug 23, 2023 at 04:16:13PM +0300, Tomi Valkeinen wrote:
> Hi Sakari,
> 
> On 08/08/2023 10:55, Sakari Ailus wrote:
> > Add generic serial metadata mbus formats. These formats describe data
> > width and packing but not the content itself. The reason for specifying
> > such formats is that the formats as such are fairly device specific but
> > they are still handled by CSI-2 receiver drivers that should not be aware
> > of device specific formats. What makes generic metadata formats possible
> > is that these formats are parsed by software only, after capturing the
> > data to system memory.
> 
> If I'm not mistaken, the CSI-2 spec doesn't say much about embedded data,
> except that it may exist. Afaics, in CSI-2, the embedded data is split into
> "lines", although the amount of data can be different than in the video
> lines.
> 
> The CCS specs talks more about embedded data. Some of it is quite odd, like:
> "The length of the embedded data line shall not exceed the length of the
> image data line. The embedded data line should have the same length as the
> image data line.". I think it means the embedded line can be shorter than
> image line, but not longer.

That's what it means, yes. The CCS also has means to obtain the actual
length --- frame format descriptors.

> 
> CCS also says that an embedded line should use 0x07 as padding at the end of
> the line, if there's less data than the image line.
> 
> CCS also talks about how the embedded data would be packed, and in some
> cases that packing would be the same as for pixel data.

In fact the packing is the same as for pixel data: the CSI-2 does not
really differentiate there.

> 
> But I don't think these formats are generic. They're defined in CCS, so
> shouldn't the format be, e.g., MEDIA_BUS_FMT_META_CCS_RAW_12 or such?

The reason for having generic definitions is that we do not need receiver
drivers to be aware of formats that are specific to another driver.

If there is a need for new generic formats that do not match this, we can
always add more. But the point is: drivers for devices that do not produce
the data should never deal with (device) specific formats.

What comes to CSI-2 and these formats --- on parallel buses you might have
the data aligned to the least significant bits instead. But is there a need
to transport such data on parallel buses, at least so it would be expressed
in mbus formats?

> 
> The MEDIA_BUS_FMT_META_8 is quite safe one, as it just means byte data
> without any padding or packing.

As you're always dealing with 8 bits only, there is of course less room for
variation.

-- 
Regards,

Sakari Ailus
