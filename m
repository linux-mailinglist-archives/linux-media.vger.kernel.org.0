Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0362A43A4E3
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 22:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232336AbhJYUoi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 16:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231748AbhJYUoi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 16:44:38 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82E20C061745
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 13:42:15 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 128EC1B0016E
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 23:42:11 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1635194531;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=QdpdPv1grqMuKi54+SYw6k8sypxd5eWhXCVAJ0Apa8A=;
        b=XbqJvUNSixqdVW8uHYA7ePsZOZfxT/wlTLAyvuugoogsBQKYCVx/trZTjpe/YHhBEagjuk
        oQOP7Mj/TJHwjdQfONsvEC75/VvkjYgo0Aj6wNKqzdfn+mXZ6SXuj/OJbLaQ7Mig2E/yoR
        42pqCp/5DigTO65uva4sDWh1hHE5F88Owgi0hUTZ5bOpMiCDPGExT3tbaDnkbH7QbalOPU
        tlEJ0j++hPh1LJrXgTira9Sh5kFai/eKbcmFVLly5rKWBnoh6rpsnZqXZSx8V6mptQB7lo
        K2XU9vx2Pm1IwQceicf8clXpNSXdipa7awrJv+uxuXa+yCefWg38qHRSGUGe9g==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8373D634C90
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 23:42:10 +0300 (EEST)
Date:   Mon, 25 Oct 2021 23:42:10 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 5.16] V4L2 patches
Message-ID: <YXcWok80UXRyK1eq@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1635194531; a=rsa-sha256;
        cv=none;
        b=DjBUr3VdwTW55DqrdxCALzMJDkkXUCwk0x1y7KSSjI9rqDmN4qCz5pc5fWWPpb/kMoN4c7
        oHDsq71YC91hcc0VTwCp3O2RW0CN+rLK8yTqE5rSw+i2ESJP1hmVw9PqswWszUl9MDIs3N
        eWQ0Ms+kLxvz3IT4RmZPjGVCLguM+J/HgnhOLItqCTBuFK+CZhRBCGziZv5zgCJnMHRVVe
        kz5w1ampK2Twed75O6Wi2Bo0KxS8QLG02/4TG7MVHjC7f4AjPIAeJjJRaWFYnaWp2/tBMe
        ny377NrGSvdrTmMbMTdprn5DexagbiVEV7Umq1iWvBl3lrq6A4yLY88t9h3ALA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1635194531;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=QdpdPv1grqMuKi54+SYw6k8sypxd5eWhXCVAJ0Apa8A=;
        b=K5DWZnpQ7wxZrpBobEs3j4H7suTnkCeawDrEgAxumyuQUPEDH2TrJM703sL6LEhAFY9bYk
        VYNJB+Arb0EsfjmiV7zhqTnSk+JOfSlwt064kAeoQTH3gfSraUmMnWWVnndhuVzbkawDTP
        motxZx1VGPYY/l70LIwnMmo+0m6M/m2kRq8KRuXz46fruRmDT45md1hpTQcbjcsBqEl9eN
        XcW1YMfBF0rNVx5d1CBz6+cUu8Ywrv/+4UCSHlxnt/QUgqTvdZ5sQpDOllqjUkUiXSb+eg
        TJRZFFGIpAh3H4QrzZDbQvdrlGydf1qO77ldcFK1cwyx1vAoyfeJOfoavb1B1A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a few patches for 5.16 if time allows, most notably a staging driver
for MAX96712 by Niklas. Also a few fixes for the IPU3 ImgU and CIO2
drivers.

Please pull.


The following changes since commit 57c3b9f55ba875a6f6295fa59f0bdc0a01c544f8:

  media: venus: core: Add sdm660 DT compatible and resource struct (2021-10-21 14:26:19 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.16-2-signed

for you to fetch changes up to dad71f55b69025a58cc54db95ed1a9e8cedbb08e:

  media: staging: ipu3-imgu: clarify the limitation of grid config (2021-10-22 23:30:49 +0300)

----------------------------------------------------------------
V4L2 patches for 5.16

----------------------------------------------------------------
Bingbu Cao (2):
      media: dw9768: activate runtime PM and turn off device
      media: staging: ipu3-imgu: clarify the limitation of grid config

Dan Carpenter (1):
      media: ipu3-cio2: fix error code in cio2_bridge_connect_sensor()

Niklas Söderlund (1):
      media: staging: max96712: Add basic support for MAX96712 GMSL2 deserializer

Qing Wang (1):
      media: i2c: ccs: replace snprintf in show functions with sysfs_emit

 MAINTAINERS                                        |   6 +
 drivers/media/i2c/ccs/ccs-core.c                   |  12 +-
 drivers/media/i2c/dw9768.c                         |   6 +
 drivers/media/pci/intel/ipu3/cio2-bridge.c         |   4 +-
 drivers/staging/media/Kconfig                      |   2 +
 drivers/staging/media/Makefile                     |   1 +
 .../staging/media/ipu3/include/uapi/intel-ipu3.h   |  10 +-
 drivers/staging/media/max96712/Kconfig             |  13 +
 drivers/staging/media/max96712/Makefile            |   2 +
 drivers/staging/media/max96712/max96712.c          | 440 +++++++++++++++++++++
 10 files changed, 487 insertions(+), 9 deletions(-)
 create mode 100644 drivers/staging/media/max96712/Kconfig
 create mode 100644 drivers/staging/media/max96712/Makefile
 create mode 100644 drivers/staging/media/max96712/max96712.c

-- 
Sakari Ailus
