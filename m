Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2463ABE8D
	for <lists+linux-media@lfdr.de>; Fri, 18 Jun 2021 00:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbhFQWNB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 18:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhFQWM7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 18:12:59 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD8C0C061574
        for <linux-media@vger.kernel.org>; Thu, 17 Jun 2021 15:10:50 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dsl-hkibng32-54fb5d-176.dhcp.inet.fi [84.251.93.176])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id D46DC20191
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 01:10:44 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1623967844;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=q+YxXWikZz95kOm/jY4uGE5Vc7tb0nSXaEPncwSdEBY=;
        b=viij3M66twqyiTqdC1ai9x8TCdTgbo5HnslV+C7MNY8bOlsubn1rA9Ua1TJdq1m4veOWgU
        Wjny71t16IfvpL1dTcJY7COn7wkjjcxLUFa9in0/0CNZGUZg3S4ug/ChfeXbwVsNeKy5mB
        0tLN+U6dsMyTnjky4fSLVOW0dicYo9k=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id C8387634C87
        for <linux-media@vger.kernel.org>; Fri, 18 Jun 2021 01:08:44 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lu0Dk-0005NT-59
        for linux-media@vger.kernel.org; Fri, 18 Jun 2021 01:10:44 +0300
Date:   Fri, 18 Jun 2021 01:10:44 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL for 5.14] V4L2 sensor driver patches
Message-ID: <20210617221044.GJ3@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1623967844; a=rsa-sha256; cv=none;
        b=L1SdJ4IXFjRNi4m9uuRXH0phOJEdNixnIGdKg6asz5bcT5cEXjZnB1T0pNLfFh2oHxnl4s
        wTVy99VLseumKJ9ZSYRlQMfDlbcG3VOmvfecGetGtVgpr/7fuoXtWk20qXr3RCnSYpmdiz
        YcXujlMjPuk/yDkJk9LfBLk/dVK4kHQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1623967844;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=q+YxXWikZz95kOm/jY4uGE5Vc7tb0nSXaEPncwSdEBY=;
        b=dU14LtHJQ/Ed6ehhfM0wRBr650GNR0PoYYpPyjKuA3PAK6TT2Sj6lHIBRRvk2Ie04/m4ef
        BZMjBWgGB5NJec11BnD3z1hSCO5Ik2bzuBiboa5TB3X3i3cWXK6Oo2Y1pvUa7C5k+yJeYJ
        J0xbeev6/9LUSb6HlXdbKEtPZvJLivM=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a nice little pull request for 5.14. There's a documentation fix and
three new sensor drivers, imx335, imx412 and ov9282, all with DT bindings.

Please pull.


The following changes since commit 198bb646e8553e8abd8d83492a27b601ab97b75d:

  media: i2c: rdacm20: Re-work ov10635 reset (2021-06-17 12:08:55 +0200)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.14-2-signed

for you to fetch changes up to 97b317cae87ec7e33acd479ee5127881775bff49:

  media: i2c: Add ov9282 camera sensor driver (2021-06-18 01:07:31 +0300)

----------------------------------------------------------------
V4L2 patches for 5.14

----------------------------------------------------------------
Martina Krasteva (6):
      dt-bindings: media: Add bindings for imx335
      media: i2c: Add imx335 camera sensor driver
      dt-bindings: media: Add bindings for imx412
      media: i2c: Add imx412 camera sensor driver
      dt-bindings: media: Add bindings for ov9282
      media: i2c: Add ov9282 camera sensor driver

Paul Kocialkowski (1):
      media: v4l2-subdev: Fix documentation of the subdev_notifier member

 .../devicetree/bindings/media/i2c/ovti,ov9282.yaml |   91 ++
 .../devicetree/bindings/media/i2c/sony,imx335.yaml |   91 ++
 .../devicetree/bindings/media/i2c/sony,imx412.yaml |   91 ++
 MAINTAINERS                                        |   27 +
 drivers/media/i2c/Kconfig                          |   42 +
 drivers/media/i2c/Makefile                         |    4 +-
 drivers/media/i2c/imx335.c                         | 1129 +++++++++++++++++
 drivers/media/i2c/imx412.c                         | 1272 ++++++++++++++++++++
 drivers/media/i2c/ov9282.c                         | 1137 +++++++++++++++++
 include/media/v4l2-subdev.h                        |    2 +-
 10 files changed, 3884 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
 create mode 100644 drivers/media/i2c/imx335.c
 create mode 100644 drivers/media/i2c/imx412.c
 create mode 100644 drivers/media/i2c/ov9282.c

-- 
Sakari Ailus
