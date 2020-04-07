Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E17041A083A
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2020 09:27:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbgDGH1S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Apr 2020 03:27:18 -0400
Received: from retiisi.org.uk ([95.216.213.190]:47538 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726591AbgDGH1S (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Apr 2020 03:27:18 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id BB43D634C89
        for <linux-media@vger.kernel.org>; Tue,  7 Apr 2020 10:26:10 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1jLicb-0002Iw-RR
        for linux-media@vger.kernel.org; Tue, 07 Apr 2020 10:26:09 +0300
Date:   Tue, 7 Apr 2020 10:26:09 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.8] ImgU and sensor driver patches
Message-ID: <20200407072609.GH6127@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a set of ImgU and sensor driver patches.

Please pull.


The following changes since commit 2632e7b618a7730969f9782593c29ca53553aa22:

  media: venus: firmware: Ignore secure call error on first resume (2020-03-30 11:28:18 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.8-1-signed

for you to fetch changes up to 20ec71010d5cc887a4436c2b3f39d6f1d9c92817:

  media: staging: imgu: do not hold spinlock during freeing mmu page table (2020-04-06 12:18:36 +0300)

----------------------------------------------------------------
ImgU and sensor driver fixes and cleanups

----------------------------------------------------------------
Bingbu Cao (4):
      media: staging/intel-ipu3: Implement lock for stream on/off operations
      media: doc-rst: add yavta test example in ipu3 docs
      media: ipu3.rst: add yuv-downscaling into pipeline diagram
      media: staging: imgu: do not hold spinlock during freeing mmu page table

Deepak R Varma (3):
      media: staging/intel-ipu3: css: simplify expression
      media: staging/intel-ipu3: Remove extra blank lines
      media: staging/intel-ipu3: Simplify single goto jump

Tomi Valkeinen (1):
      media: ov5640: fix use of destroyed mutex

 Documentation/media/v4l-drivers/ipu3.rst     | 29 ++++++++++++++++++++--------
 drivers/media/i2c/ov5640.c                   |  4 ++--
 drivers/staging/media/ipu3/TODO              |  2 --
 drivers/staging/media/ipu3/ipu3-css-params.c | 14 ++++++--------
 drivers/staging/media/ipu3/ipu3-mmu.c        | 10 ++++++----
 drivers/staging/media/ipu3/ipu3-v4l2.c       | 28 ++++++++++++++++-----------
 drivers/staging/media/ipu3/ipu3.c            |  3 +++
 drivers/staging/media/ipu3/ipu3.h            |  4 ++++
 8 files changed, 59 insertions(+), 35 deletions(-)

-- 
Sakari Ailus
