Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5227D424BD4
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 04:40:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbhJGClx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Oct 2021 22:41:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57090 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232329AbhJGClv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Oct 2021 22:41:51 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16AB09DC
        for <linux-media@vger.kernel.org>; Thu,  7 Oct 2021 04:39:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633574397;
        bh=mFh6U23MIJqLzTL4zVVxZ8xQ9qhBniMYx0NWoQJxl8E=;
        h=Date:From:To:Subject:From;
        b=Tnph6620/NavqQFEYyVXzUQvNMi/lvoZHuvaMS2wjwpl+YjPNBr7sU4wYAxNy6TOH
         kMMirc/nQKbhl69n6LNEKTiQSjIO753ECjcYYDjLFhuZFM8JF8XnisoaGv8B8gOvr2
         /j74bYnnJu0RPVG4ZHAntEfsHI7GBbwYTBqBoT0g=
Date:   Thu, 7 Oct 2021 05:39:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.16] Misc improvements to omap_vout and rcar vsp1
Message-ID: <YV5d9G1zp9fPyRPm@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

The following changes since commit c52e7b855b33ff2a3af57b1b1d114720cd39ec7e:

  Merge tag 'v5.15-rc4' into media_tree (2021-10-04 07:52:13 +0200)

are available in the Git repository at:

  git://linuxtv.org/pinchartl/media.git tags/v4l2-next-20211007

for you to fetch changes up to b6070a2dc0d2ffab862dbc5b3c7385f69ec33a1f:

  media: omap_vout: use dma_addr_t consistently (2021-10-07 05:27:08 +0300)

----------------------------------------------------------------
Misc improvements for omap_vout and rcar vsp1 drivers

----------------------------------------------------------------
Arnd Bergmann (1):
      media: omap_vout: use dma_addr_t consistently

Kieran Bingham (3):
      media: vsp1: Fix WPF macro names
      media: vsp1: Simplify DRM UIF handling
      media: vsp1: Add support for the V3U VSPD

 drivers/media/platform/omap/omap_vout.c      | 18 ++++++++++--------
 drivers/media/platform/omap/omap_vout_vrfb.c |  2 +-
 drivers/media/platform/omap/omap_voutdef.h   |  2 +-
 drivers/media/platform/vsp1/vsp1_drm.c       |  8 ++++++--
 drivers/media/platform/vsp1/vsp1_drv.c       | 14 ++++++++++++--
 drivers/media/platform/vsp1/vsp1_regs.h      | 11 +++++++----
 drivers/media/platform/vsp1/vsp1_wpf.c       |  2 +-
 7 files changed, 38 insertions(+), 19 deletions(-)

-- 
Regards,

Laurent Pinchart
