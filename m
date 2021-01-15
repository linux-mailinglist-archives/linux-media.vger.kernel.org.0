Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AABF82F7EF0
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 16:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732163AbhAOPHP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 10:07:15 -0500
Received: from mga11.intel.com ([192.55.52.93]:2649 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732142AbhAOPHP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 10:07:15 -0500
IronPort-SDR: RJu17aFu+f6o2nfvuxf764Ih7kiSykdsN89gKE9pB+arF2pPNrjbfHRv+o2c7Idvt1yH2rtBlM
 Z9N0an/G7f0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="175054190"
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; 
   d="scan'208";a="175054190"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2021 07:05:27 -0800
IronPort-SDR: ynMfejPdgyy49MhXrflW3K6pZ8ULxJ4Bv6Ue0CS+eoHSiQ45FuDyOzj2PJWeWx79TWQlZ7p6+V
 2CQTFFmSXm9A==
X-IronPort-AV: E=Sophos;i="5.79,349,1602572400"; 
   d="scan'208";a="390133898"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2021 07:05:25 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id C4D56206A9; Fri, 15 Jan 2021 17:05:23 +0200 (EET)
Date:   Fri, 15 Jan 2021 17:05:23 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3] media: v4l2-async: Add waiting subdevices debugfs
Message-ID: <20210115150523.GS11878@paasikivi.fi.intel.com>
References: <20210108171728.39434-1-ezequiel@collabora.com>
 <20210108171728.39434-2-ezequiel@collabora.com>
 <20210114233632.GN11878@paasikivi.fi.intel.com>
 <d3a4714e98ce065e8a6c7b11929d72c330ab4097.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3a4714e98ce065e8a6c7b11929d72c330ab4097.camel@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 15, 2021 at 11:08:21AM -0300, Ezequiel Garcia wrote:
> On Fri, 2021-01-15 at 01:36 +0200, Sakari Ailus wrote:
> > Hi Ezequiel,
> > 
> > On Fri, Jan 08, 2021 at 02:17:28PM -0300, Ezequiel Garcia wrote:
> > > There is currently little to no information available
> > > about the reasons why a v4l2-async device hasn't
> > > probed completely.
> > > 
> > > Inspired by the "devices_deferred" debugfs file,
> > > add a file to list information about the subdevices
> > > that are on waiting lists, for each notifier.
> > > 
> > > This is useful to debug v4l2-async subdevices
> > > and notifiers, for instance when doing device bring-up.
> > > 
> > > For instance, a typical output would be:
> > > 
> > > $ cat /sys/kernel/debug/video4linux/pending_async_subdevices
> > > ipu1_csi1:
> > >  [fwnode] dev=20e0000.iomuxc-gpr:ipu1_csi1_mux, node=/soc/bus@2000000/iomuxc-gpr@20e0000/ipu1_csi1_mux
> > > ipu1_csi0:
> > >  [fwnode] dev=20e0000.iomuxc-gpr:ipu1_csi0_mux, node=/soc/bus@2000000/iomuxc-gpr@20e0000/ipu1_csi0_mux
> > > imx6-mipi-csi2:
> > >  [fwnode] dev=1-003c, node=/soc/bus@2100000/i2c@21a4000/camera@3c
> > > imx-media:
> > > 
> > > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > --
> > > v3:
> > > * Drop MATCH_CUSTOM
> > > * Use the actual fwnode, to print the real full path. endpoint name.
> > > * Fix refcounted handle leak.
> > > v2:
> > > * Print fwnode path, as suggested by Sakari.
> > > * Print the subdevices under their corresponding notifier.
> > > * Rename the file as suggested by Laurent.
> > 
> > The patch itself seems fine. But lease put such notes below the '---' line
> > below going forward. What's above it will be part of the commit message.
> > 
> 
> Oops, sorry for the typo.
> 
> I have a v4 for this one, dropping MATCH_DEVNAME too.

Could you remove it as a separate patch? It's unrelated to debugging.

-- 
Sakari Ailus
