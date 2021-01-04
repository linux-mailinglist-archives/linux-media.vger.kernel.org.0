Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA1C2E947D
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 13:04:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbhADMDT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 07:03:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbhADMDT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 07:03:19 -0500
Received: from hillosipuli.retiisi.eu (unknown [IPv6:2a01:4f9:c010:4572::e8:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B145FC061793
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 04:02:38 -0800 (PST)
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id B424A634C87
        for <linux-media@vger.kernel.org>; Mon,  4 Jan 2021 14:02:27 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kwOZ9-0000X8-L2
        for linux-media@vger.kernel.org; Mon, 04 Jan 2021 14:02:27 +0200
Date:   Mon, 4 Jan 2021 14:02:27 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES for 5.11] CCS and rcar driver fixes
Message-ID: <20210104120227.GA850@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are some CCS and rcar driver fixes for 5.11. Also change the name of a
function added in this cycle to avoid reworking drivers using the old name.

Please pull.


The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-5.11-1-signed

for you to fetch changes up to a17c19ac4a062c51d0d5654b6c45619bd70b0d6f:

  v4l: common: Fix naming of v4l2_get_link_rate (2021-01-04 13:49:04 +0200)

----------------------------------------------------------------
V4L2 fixes for 5.11

----------------------------------------------------------------
Colin Ian King (1):
      media: rcar-vin: fix return, use ret instead of zero

Sakari Ailus (3):
      ccs-pll: Fix link frequency for C-PHY
      ccs: Get static data version minor correctly
      v4l: common: Fix naming of v4l2_get_link_rate

 drivers/media/i2c/ccs-pll.c                 | 8 +-------
 drivers/media/i2c/ccs/ccs-data.c            | 2 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c    | 2 +-
 drivers/media/platform/rcar-vin/rcar-core.c | 2 +-
 drivers/media/v4l2-core/v4l2-common.c       | 4 ++--
 include/media/v4l2-common.h                 | 4 ++--
 6 files changed, 8 insertions(+), 14 deletions(-)

-- 
Sakari Ailus
