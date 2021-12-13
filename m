Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41033472DCD
	for <lists+linux-media@lfdr.de>; Mon, 13 Dec 2021 14:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234793AbhLMNtw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Dec 2021 08:49:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233958AbhLMNtv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Dec 2021 08:49:51 -0500
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9491BC061574
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 05:49:51 -0800 (PST)
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id B531E1B001CF
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:49:45 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1639403385;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=ghxVV0QJ9VZbIXcHVmwM/z2Zle1+Q8CvriR2byako6M=;
        b=VHW1RjfnBpd1/cDDiUYmvaL94lAs8WxbcnXgWmjx1sAPpBl/VI/8Dvox8c+zFMr20ADxqm
        Ma53ttaQlXPB9nYakP3ALNq4V7nDhkS+eVtcbYgYo15udHkdUA9ZdgQwBXRVKSvVeXciGw
        VABilOztn/Lf4sM6WZ1hrVDF/5olCDIlDsldn+QKwUQpyKO8y9B+YHNbg4STrm9wlKkC5G
        BtIfssuMzd97Eeti6z9FMXeE41OlP0rUAOvC+pJpddHIa6n8Jqzt5nbZG+B0b1yf1JDTIe
        c4TxOtFgwWB95vKqyBz7NSvwhN8jpBw98VGqpPeztU8dhcMvnkIRTU1Gz236sQ==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 60F03634C91
        for <linux-media@vger.kernel.org>; Mon, 13 Dec 2021 15:49:42 +0200 (EET)
Date:   Mon, 13 Dec 2021 15:49:42 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 5.17] V4L2 patches
Message-ID: <YbdPdh/ivnjZKIOA@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1639403385; a=rsa-sha256;
        cv=none;
        b=LDjmbEJHRYBCscCCnL5kGZDChxHT7TyW7v1FDucxwzyu+M96ZwIO+WMaelSQlM/N3s4Vf7
        6/GiJ4/4pXu6r46DWoJk2Png3REvgNNjo18pm/9PhJZpmLQGQLGuwfBqt5CDWuhJkNjYzs
        NAbqVi+ySjIfq5a5Um3crtCR+mq3O6Y/so5Cu0Gi/JUuZKu9SIEkyYqj0s68R9DgX7ehaT
        siOe5RhBgyrbl7IU9FmPVPE964vQnbqWk3R5sHgG99urpSp0wnsxcI8DptFhZASnBfV9Fa
        w+eopaIzB/Uc5b+RQtXskF+FIWTTxQyBOXew7Nhm1JT7MwbnY354lW1U830ryA==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1639403385;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=ghxVV0QJ9VZbIXcHVmwM/z2Zle1+Q8CvriR2byako6M=;
        b=nX1qK66cEu9b745PC5svO7mvNAAa6OCa+TISIBE9sA1cUOW/1pQkYfwUh0Z6YMVLPw3q0t
        LGgbGmAAUF5+B9RkF4OZtEXuUUwuXYHrgc5QGGtkC0Rg/M7J2Oze39Qg5Bq9jzPBDSxwIo
        DP15VZds68pp6ppqpJIMJyt+/kxsn8XuuvJ7zZWhfmREC935mbx+P2QsisXPQM4Ion8Tvk
        BybXJXCXL7aWwGelyWQflbiFrlscH9nIayRDm7/e71pKwRfRBUoiOpefdHovxB42AvlXmF
        zmJIDis2VeXHzVJJhnSkOebJYOByN0Xy+tTb2HRnKwh170Ixf1ww4ILeAl6Pbg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here's a few patches for 5.17. In particular, included are isl79987 driver
from Michale Tretter and Marek Vasut, and a dependency fix for the recently
added max96712 driver.

Please pull.


The following changes since commit 4383cfa18c5bbc5b9b6a9e77adc12aec1c20b72d:

  Merge tag 'v5.16-rc4' into media_tree (2021-12-07 11:29:41 +0100)

are available in the Git repository at:

  git://linuxtv.org/sailus/media_tree.git tags/for-5.17-2-signed

for you to fetch changes up to 0541ae639fb1165fb309ebf58605f901146c2535:

  media: i2c: isl7998x: Add driver for Intersil ISL7998x (2021-12-08 09:51:54 +0200)

----------------------------------------------------------------
V4L2 patches for 5.17

----------------------------------------------------------------
Andy Shevchenko (1):
      media: i2c: max9286: Get rid of duplicate of_node assignment

Marek Vasut (2):
      media: dt-bindings: Add Intersil ISL79987 DT bindings
      media: i2c: isl7998x: Add driver for Intersil ISL7998x

Michael Tretter (1):
      media: imx6-mipi-csi2: use pre_streamon callback to set sensor into LP11

Sakari Ailus (1):
      max96712: Depend on VIDEO_V4L2

 .../bindings/media/i2c/isil,isl79987.yaml          |  113 ++
 MAINTAINERS                                        |    8 +
 drivers/media/i2c/Kconfig                          |   10 +
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/isl7998x.c                       | 1543 ++++++++++++++++++++
 drivers/media/i2c/max9286.c                        |    1 -
 drivers/staging/media/imx/imx6-mipi-csi2.c         |    9 +-
 drivers/staging/media/max96712/Kconfig             |    1 +
 include/uapi/linux/v4l2-controls.h                 |    6 +
 9 files changed, 1690 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/isil,isl79987.yaml
 create mode 100644 drivers/media/i2c/isl7998x.c

-- 
Sakari Ailus
