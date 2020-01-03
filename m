Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D45612F6DF
	for <lists+linux-media@lfdr.de>; Fri,  3 Jan 2020 11:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbgACKtH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jan 2020 05:49:07 -0500
Received: from retiisi.org.uk ([95.216.213.190]:35464 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727220AbgACKtG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Jan 2020 05:49:06 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 57E00634C8C
        for <linux-media@vger.kernel.org>; Fri,  3 Jan 2020 12:48:02 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1inKUs-0001zC-O5
        for linux-media@vger.kernel.org; Fri, 03 Jan 2020 12:48:02 +0200
Date:   Fri, 3 Jan 2020 12:48:02 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.6] Sensor and bridge driver patches
Message-ID: <20200103104802.GK5050@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a set of sensor and bridge driver patches for 5.6. Included are
support for additional sun4i receiver hardware plus fixes here and there.

Please pull.


The following changes since commit 0885acd77eb4644fd88f6d9f41e433f4ee9bc37a:

  media: vivid: support multiplanar touch devices (2019-12-16 13:24:16 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.6-1.1-signed

for you to fetch changes up to 5774c3adcaff4993dd5c4d5056620c4808f554e3:

  media: sun4i-csi: Add support for A10 CSI1 camera sensor interface (2020-01-03 12:43:58 +0200)

----------------------------------------------------------------
Sensor and CSI-2 driver patches for 5.6

----------------------------------------------------------------
Adam Ford (2):
      media: ov5640: Put max framerate into table and simplify check
      media: ov5640: Fix check for PLL1 exceeding max allowed rate

Bingbu Cao (2):
      media: staging/intel-ipu3: set the main output as mandatory
      media: staging/intel-ipu3: make imgu use fixed running mode

Chen-Yu Tsai (6):
      dt-bindings: media: sun4i-csi: Add compatible for CSI1 on A10/A20
      dt-bindings: media: sun4i-csi: Add compatible for CSI0 on R40
      media: sun4i-csi: Fix data sampling polarity handling
      media: sun4i-csi: Fix [HV]sync polarity handling
      media: sun4i-csi: Deal with DRAM offset
      media: sun4i-csi: Add support for A10 CSI1 camera sensor interface

Eugen Hristev (1):
      media: i2c: mt9v032: fix enum mbus codes and frame sizes

Jules Irenge (1):
      staging: ipu3: replace 0 with false

 .../bindings/media/allwinner,sun4i-a10-csi.yaml    | 14 +++-
 Documentation/media/v4l-drivers/ipu3.rst           |  6 +-
 drivers/media/i2c/mt9v032.c                        | 10 ++-
 drivers/media/i2c/ov5640.c                         | 41 ++++++-----
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.c | 57 ++++++++++++++--
 drivers/media/platform/sunxi/sun4i-csi/sun4i_csi.h |  6 +-
 drivers/media/platform/sunxi/sun4i-csi/sun4i_dma.c | 20 ++++--
 drivers/staging/media/ipu3/TODO                    |  3 -
 drivers/staging/media/ipu3/include/intel-ipu3.h    |  4 --
 drivers/staging/media/ipu3/ipu3-css.c              |  2 +-
 drivers/staging/media/ipu3/ipu3-v4l2.c             | 79 ++++------------------
 drivers/staging/media/ipu3/ipu3.h                  |  5 +-
 12 files changed, 132 insertions(+), 115 deletions(-)

-- 
Sakari Ailus
