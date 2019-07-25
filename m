Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26E1674CDD
	for <lists+linux-media@lfdr.de>; Thu, 25 Jul 2019 13:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391772AbfGYLTq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jul 2019 07:19:46 -0400
Received: from retiisi.org.uk ([95.216.213.190]:60228 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390925AbfGYLTp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jul 2019 07:19:45 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 51401634C87
        for <linux-media@vger.kernel.org>; Thu, 25 Jul 2019 14:19:28 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hqbmR-0000nA-Mb
        for linux-media@vger.kernel.org; Thu, 25 Jul 2019 14:19:27 +0300
Date:   Thu, 25 Jul 2019 14:19:27 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.4] V4L2 fwnode parsing improvements
Message-ID: <20190725111927.GI1263@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This set contains the V4L2 fwnode parsing improvements that have had
lengthy reviews on the list.

Please pull.


The following changes since commit ebe15c7679680308268b99d911b1db15d514c7b8:

  media: tegra-cec: use cec_notifier_cec_adap_(un)register (2019-07-23 08:40:57 -0400)

are available in the Git repository at:

  ssh://linuxtv.org/git/sailus/media_tree.git tags/for-5.4-2-signed

for you to fetch changes up to 7e9afcd1b74ed7daf6c16b217d0fe2cea81dc510:

  ipu3-cio2: Parse information from firmware without using callbacks (2019-07-25 11:41:18 +0300)

----------------------------------------------------------------
Fwnode parsing improvements

----------------------------------------------------------------
Sakari Ailus (8):
      davinci-vpif: Don't dereference endpoint after putting it, fix refcounting
      v4l2-async: Get fwnode reference when putting it to the notifier's list
      v4l2-async: Add v4l2_async_notifier_add_fwnode_remote_subdev
      omap3isp: Rework OF endpoint parsing
      v4l2-async: Safely clean up an uninitialised notifier
      ipu3-cio2: Clean up notifier's subdev list if parsing endpoints fails
      ipu3-cio2: Proceed with notifier init even if there are no subdevs
      ipu3-cio2: Parse information from firmware without using callbacks

 drivers/media/pci/intel/ipu3/ipu3-cio2.c      |  97 ++++----
 drivers/media/platform/am437x/am437x-vpfe.c   |   5 +-
 drivers/media/platform/davinci/vpif_capture.c |  18 +-
 drivers/media/platform/omap3isp/isp.c         | 331 +++++++++++++++-----------
 drivers/media/platform/qcom/camss/camss.c     |   2 +-
 drivers/media/platform/xilinx/xilinx-vipp.c   |   2 +-
 drivers/media/v4l2-core/v4l2-async.c          |  28 ++-
 drivers/media/v4l2-core/v4l2-fwnode.c         |  23 +-
 include/media/v4l2-async.h                    |  30 ++-
 9 files changed, 323 insertions(+), 213 deletions(-)

-- 
Kind regards,

Sakari Ailus
