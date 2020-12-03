Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB4492CD8D1
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 15:18:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730933AbgLCORr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 09:17:47 -0500
Received: from retiisi.eu ([95.216.213.190]:42304 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730709AbgLCORr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 09:17:47 -0500
Received: from valkosipuli.localdomain (unknown [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 0D2A7634C24
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 16:15:51 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kkpOh-0003Ab-Ga
        for linux-media@vger.kernel.org; Thu, 03 Dec 2020 16:15:51 +0200
Date:   Thu, 3 Dec 2020 16:15:51 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.11] Revert a DT binding update patch that requires
 changes
Message-ID: <20201203141551.GE4351@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

This pull request reverts a single patch in my previous non-CCS pull
request. It got merged too early, and requires changes.

Please pull.


The following changes since commit 63288c829b1a5991d8f8c15cab596108ed206ba6:

  media: pixfmt-compressed.rst: fix 'bullet' formatting (2020-12-03 12:27:34 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.11-5-signed

for you to fetch changes up to 614a88612036d6c4b9d7399324da7edd36614129:

  Revert "media: dt-bindings: media: Use OF graph schema" (2020-12-03 15:58:46 +0200)

----------------------------------------------------------------
V4L2 driver patches for 5.11

----------------------------------------------------------------
Sakari Ailus (1):
      Revert "media: dt-bindings: media: Use OF graph schema"

 .../bindings/media/allwinner,sun4i-a10-csi.yaml    |  1 -
 .../bindings/media/allwinner,sun6i-a31-csi.yaml    |  1 -
 .../devicetree/bindings/media/i2c/adv7180.yaml     | 31 +++++++--
 .../devicetree/bindings/media/i2c/adv7604.yaml     | 32 +++++++--
 .../bindings/media/i2c/aptina,mt9v111.yaml         |  2 +-
 .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml       | 25 ++++++-
 .../devicetree/bindings/media/i2c/imx219.yaml      |  4 --
 .../bindings/media/i2c/maxim,max9286.yaml          | 76 +++++++++++++++++-----
 .../devicetree/bindings/media/i2c/ov5647.yaml      |  5 +-
 .../devicetree/bindings/media/i2c/ov8856.yaml      |  5 +-
 .../devicetree/bindings/media/i2c/ovti,ov772x.yaml |  1 -
 .../devicetree/bindings/media/i2c/sony,imx214.yaml |  1 -
 .../devicetree/bindings/media/i2c/sony,imx274.yaml |  3 +-
 .../bindings/media/marvell,mmp2-ccic.yaml          |  1 -
 .../devicetree/bindings/media/renesas,ceu.yaml     |  1 -
 .../devicetree/bindings/media/renesas,csi2.yaml    | 36 ++++++++--
 .../devicetree/bindings/media/renesas,vin.yaml     |  7 +-
 .../devicetree/bindings/media/st,stm32-dcmi.yaml   |  7 +-
 .../devicetree/bindings/media/ti,cal.yaml          | 15 +++--
 .../bindings/media/xilinx/xlnx,csi2rxss.yaml       | 21 +++++-
 20 files changed, 214 insertions(+), 61 deletions(-)

-- 
Sakari Ailus
