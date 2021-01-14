Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBD4F2F6F05
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 00:39:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730776AbhANXiY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 18:38:24 -0500
Received: from mga12.intel.com ([192.55.52.136]:18139 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727838AbhANXiX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 18:38:23 -0500
IronPort-SDR: JSmD/s+03VeuBXkpQyOyShv7TKDrlMu3RXeS6W6KFUYcQjJ7l50XmuVo/0JVlgc+fqGLhAm2Bd
 waCbmLKCEX4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="157642975"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="157642975"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 15:36:37 -0800
IronPort-SDR: HcRxOd6KA9mM2z4Kav3tL1g84evSYosLcUyUiW4Uq1FAmpY5kYT5UKE5icsDXCmsmZblnWWtoo
 RBsUzVfXmuZw==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="569887845"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 15:36:35 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 642B0206F4; Fri, 15 Jan 2021 01:36:32 +0200 (EET)
Date:   Fri, 15 Jan 2021 01:36:32 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3] media: v4l2-async: Add waiting subdevices debugfs
Message-ID: <20210114233632.GN11878@paasikivi.fi.intel.com>
References: <20210108171728.39434-1-ezequiel@collabora.com>
 <20210108171728.39434-2-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108171728.39434-2-ezequiel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Fri, Jan 08, 2021 at 02:17:28PM -0300, Ezequiel Garcia wrote:
> There is currently little to no information available
> about the reasons why a v4l2-async device hasn't
> probed completely.
> 
> Inspired by the "devices_deferred" debugfs file,
> add a file to list information about the subdevices
> that are on waiting lists, for each notifier.
> 
> This is useful to debug v4l2-async subdevices
> and notifiers, for instance when doing device bring-up.
> 
> For instance, a typical output would be:
> 
> $ cat /sys/kernel/debug/video4linux/pending_async_subdevices
> ipu1_csi1:
>  [fwnode] dev=20e0000.iomuxc-gpr:ipu1_csi1_mux, node=/soc/bus@2000000/iomuxc-gpr@20e0000/ipu1_csi1_mux
> ipu1_csi0:
>  [fwnode] dev=20e0000.iomuxc-gpr:ipu1_csi0_mux, node=/soc/bus@2000000/iomuxc-gpr@20e0000/ipu1_csi0_mux
> imx6-mipi-csi2:
>  [fwnode] dev=1-003c, node=/soc/bus@2100000/i2c@21a4000/camera@3c
> imx-media:
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> --
> v3:
> * Drop MATCH_CUSTOM
> * Use the actual fwnode, to print the real full path. endpoint name.
> * Fix refcounted handle leak.
> v2:
> * Print fwnode path, as suggested by Sakari.
> * Print the subdevices under their corresponding notifier.
> * Rename the file as suggested by Laurent.

The patch itself seems fine. But lease put such notes below the '---' line
below going forward. What's above it will be part of the commit message.

> ---
>  drivers/media/v4l2-core/v4l2-async.c | 66 ++++++++++++++++++++++++++++
>  drivers/media/v4l2-core/v4l2-dev.c   |  5 +++
>  include/media/v4l2-async.h           |  8 ++++
>  3 files changed, 79 insertions(+)
> 

-- 
Kind regards,

Sakari Ailus
