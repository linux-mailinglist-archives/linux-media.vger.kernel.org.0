Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 919D12F7DC4
	for <lists+linux-media@lfdr.de>; Fri, 15 Jan 2021 15:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730617AbhAOOJL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jan 2021 09:09:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729512AbhAOOJK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jan 2021 09:09:10 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8369DC0613C1
        for <linux-media@vger.kernel.org>; Fri, 15 Jan 2021 06:08:30 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 144201F45FAE
Message-ID: <d3a4714e98ce065e8a6c7b11929d72c330ab4097.camel@collabora.com>
Subject: Re: [PATCH v3] media: v4l2-async: Add waiting subdevices debugfs
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kernel@collabora.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Fri, 15 Jan 2021 11:08:21 -0300
In-Reply-To: <20210114233632.GN11878@paasikivi.fi.intel.com>
References: <20210108171728.39434-1-ezequiel@collabora.com>
         <20210108171728.39434-2-ezequiel@collabora.com>
         <20210114233632.GN11878@paasikivi.fi.intel.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2021-01-15 at 01:36 +0200, Sakari Ailus wrote:
> Hi Ezequiel,
> 
> On Fri, Jan 08, 2021 at 02:17:28PM -0300, Ezequiel Garcia wrote:
> > There is currently little to no information available
> > about the reasons why a v4l2-async device hasn't
> > probed completely.
> > 
> > Inspired by the "devices_deferred" debugfs file,
> > add a file to list information about the subdevices
> > that are on waiting lists, for each notifier.
> > 
> > This is useful to debug v4l2-async subdevices
> > and notifiers, for instance when doing device bring-up.
> > 
> > For instance, a typical output would be:
> > 
> > $ cat /sys/kernel/debug/video4linux/pending_async_subdevices
> > ipu1_csi1:
> >  [fwnode] dev=20e0000.iomuxc-gpr:ipu1_csi1_mux, node=/soc/bus@2000000/iomuxc-gpr@20e0000/ipu1_csi1_mux
> > ipu1_csi0:
> >  [fwnode] dev=20e0000.iomuxc-gpr:ipu1_csi0_mux, node=/soc/bus@2000000/iomuxc-gpr@20e0000/ipu1_csi0_mux
> > imx6-mipi-csi2:
> >  [fwnode] dev=1-003c, node=/soc/bus@2100000/i2c@21a4000/camera@3c
> > imx-media:
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > --
> > v3:
> > * Drop MATCH_CUSTOM
> > * Use the actual fwnode, to print the real full path. endpoint name.
> > * Fix refcounted handle leak.
> > v2:
> > * Print fwnode path, as suggested by Sakari.
> > * Print the subdevices under their corresponding notifier.
> > * Rename the file as suggested by Laurent.
> 
> The patch itself seems fine. But lease put such notes below the '---' line
> below going forward. What's above it will be part of the commit message.
> 

Oops, sorry for the typo.

I have a v4 for this one, dropping MATCH_DEVNAME too.

Thanks,
Ezequiel

