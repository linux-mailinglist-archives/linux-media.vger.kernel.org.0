Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7BB62DBD7
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 13:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbfE2L2T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 07:28:19 -0400
Received: from retiisi.org.uk ([95.216.213.190]:53524 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726012AbfE2L2T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 07:28:19 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id 67DD9634C7B
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 14:28:10 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hVwkc-0000TY-8N
        for linux-media@vger.kernel.org; Wed, 29 May 2019 14:28:10 +0300
Date:   Wed, 29 May 2019 14:28:10 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.3] Sensor and sun6i patches
Message-ID: <20190529112810.h4rvqsfhe2zokopq@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are patches for the sun6i driver (+ DT bindings) and a fix for the
ov8856 driver missed earlier due to a missing SoB.

Please pull.


The following changes since commit 2c41cc0be07b5ee2f1167f41cd8a86fc5b53d82c:

  media: venus: firmware: fix leaked of_node references (2019-05-24 09:03:06 -0400)

are available in the git repository at:

  ssh://linuxtv.org/git/sailus/media_tree.git tags/for-5.3-2-signed

for you to fetch changes up to 30831731f2464e312524d7c8960563c1f53e7dd1:

  media: sun6i: Support A83T variant (2019-05-29 13:11:22 +0300)

----------------------------------------------------------------
sensor + sun6i patches

----------------------------------------------------------------
Chen-Yu Tsai (2):
      dt-bindings: media: sun6i-csi: Add compatible string for A83T variant
      media: sun6i: Support A83T variant

Shawn Tu (1):
      ov8856: modify register to fix test pattern

 Documentation/devicetree/bindings/media/sun6i-csi.txt |  1 +
 drivers/media/i2c/ov8856.c                            | 12 ++++++------
 drivers/media/platform/sunxi/sun6i-csi/sun6i_csi.c    |  1 +
 3 files changed, 8 insertions(+), 6 deletions(-)

-- 
Kind regards,

Sakari Ailus
