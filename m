Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87DFA26E5D2
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 21:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgIQT4p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 15:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727514AbgIQOpc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 10:45:32 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86DCBC06178A
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 07:45:07 -0700 (PDT)
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id C53A7634C87
        for <linux-media@vger.kernel.org>; Thu, 17 Sep 2020 17:44:16 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1kIv8y-0001vx-VF
        for linux-media@vger.kernel.org; Thu, 17 Sep 2020 17:44:16 +0300
Date:   Thu, 17 Sep 2020 17:44:16 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR 5.9] Imx274 DT binding fix
Message-ID: <20200917144416.GN834@valkosipuli.retiisi.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a single DT binding fix for 5.9. The patch converts the bindings to
YAML but at the same time address requested regulator name change.

Please pull.


The following changes since commit 129134e5415d46f38b9978b3809af94ed649b57d:

  media: media/v4l2: remove V4L2_FLAG_MEMORY_NON_CONSISTENT flag (2020-09-14 15:28:06 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/fixes-5.9-2-signed

for you to fetch changes up to 3be32303b83fd56708fd86d27590ecb6377e36ea:

  dt-bindings: media: imx274: Convert to json-schema (2020-09-17 16:58:05 +0300)

----------------------------------------------------------------
V4L2 fixes for 5.9

----------------------------------------------------------------
Jacopo Mondi (1):
      dt-bindings: media: imx274: Convert to json-schema

 .../devicetree/bindings/media/i2c/imx274.txt       | 38 -----------
 .../devicetree/bindings/media/i2c/sony,imx274.yaml | 76 ++++++++++++++++++++++
 MAINTAINERS                                        |  2 +-
 3 files changed, 77 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx274.yaml

-- 
Sakari Ailus
