Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD9F1405DB
	for <lists+linux-media@lfdr.de>; Fri, 17 Jan 2020 10:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729174AbgAQJLB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jan 2020 04:11:01 -0500
Received: from retiisi.org.uk ([95.216.213.190]:60966 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726406AbgAQJLA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jan 2020 04:11:00 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id DA1B4634C8A
        for <linux-media@vger.kernel.org>; Fri, 17 Jan 2020 11:10:50 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1isNeV-0000Qa-K0
        for linux-media@vger.kernel.org; Fri, 17 Jan 2020 11:10:51 +0200
Date:   Fri, 17 Jan 2020 11:10:51 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.6] Sensor and ImgU driver patches
Message-ID: <20200117091051.GI793@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a small set of sensor and ImgU driver patches.

Please pull.


The following changes since commit 2a0a0bc7020ef7e66c9569d8229d79fa72e3d659:

  media: MAINTAINERS: add entry for Rockchip ISP1 driver (2020-01-09 16:45:01 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.6-2-signed

for you to fetch changes up to 94a3670a8fa60df14b16d3316a0bd46a6a916034:

  Revert "media: staging/intel-ipu3: make imgu use fixed running mode" (2020-01-17 10:29:30 +0200)

----------------------------------------------------------------
Sensor + ImgU driver patches for 5.6

----------------------------------------------------------------
Bingbu Cao (1):
      Revert "media: staging/intel-ipu3: make imgu use fixed running mode"

Julia Lawall (1):
      media: mt9v111: constify copied structure

Shawn Tu (1):
      ov5675: add vflip/hflip control support

 Documentation/media/v4l-drivers/ipu3.rst        |  6 +-
 drivers/media/i2c/mt9v111.c                     |  2 +-
 drivers/media/i2c/ov5675.c                      | 82 ++++++++++++++++++++++---
 drivers/staging/media/ipu3/include/intel-ipu3.h |  4 ++
 drivers/staging/media/ipu3/ipu3-v4l2.c          | 74 +++++++++++++++++++---
 drivers/staging/media/ipu3/ipu3.h               |  5 +-
 6 files changed, 151 insertions(+), 22 deletions(-)

-- 
Sakari Ailus
