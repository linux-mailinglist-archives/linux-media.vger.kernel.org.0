Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA83166A9E
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2020 23:58:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729239AbgBTW6B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Feb 2020 17:58:01 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:57811 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729130AbgBTW6A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Feb 2020 17:58:00 -0500
Received: from [192.168.2.10] ([46.9.235.248])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 4ulXjF80tyIme4ulajmxsC; Thu, 20 Feb 2020 23:57:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582239479; bh=12FJtcCt6otnFRK/LXnDCD5EekpzPODkYdgDQyoeWkg=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hFAQMqIcL/rAj3P+oadXloxY11I/evnqEpgYThSMd1SHQmUeo24HFDX7vIGSTYWbT
         CB4mOQGihzSnGqrP9TRg29YzlcS9rzhHnZpH3kwaJqdLMhGaf4iVnMwlFRpqhNFpCp
         A4DwboDEnBwFgf2TgOyr6mBnycWZQb9OpdvJeS9wHBnJ3Z57p+5KjzDTY7OTY/Q6EG
         NCbEHowjVcR8JzQ2IjBQo7h2CKS6m/Jo1szf/tOW8LkLCR7kkjpwvyaVSPLahAG4Uk
         Qw11ogrtBsuW2/GMZ8lA0XiyVrkz0FNw4O86A7LOnG4uRMnf7Mlm5vr4yMiQaPoMEk
         ICfvaShhSo5gg==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.7] rockchip: Add the rkvdec driver
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>
Message-ID: <7be24fe6-1a4a-94cb-832e-818db9d1d2e1@xs4all.nl>
Date:   Thu, 20 Feb 2020 23:57:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPxaIo9JLks2b6wsIksSQDmFrztsKAATbssBpiXZg7D/S8LKZtC9Qu1OCZA33rIlnfWlvuzijlQNos5AAVbAW4bpldU6/aJjyEnZKV2Q13brCesZINWw
 J4rNTHNEnPYKWiJzWtgiX2Q1PgrwiNSi34edMFSZ/N+lAmjJfJoyuRCtPfoQrSmahJetph1EyBAF74vBpWxKSbu49GfDGRa+kWI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-rkvdec3

for you to fetch changes up to dd8ba6ffc539190bdf77f7385182eb89112676f9:

  arm64: dts: rockchip: rk3399: Define the rockchip Video Decoder node (2020-02-20 19:10:11 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Boris Brezillon (5):
      media: v4l2-core: Add helpers to build the H264 P/B0/B1 reflists
      media: hantro: h264: Use the generic H264 reflist builder
      media: dt-bindings: rockchip: Document RK3399 Video Decoder bindings
      media: rkvdec: Add the rkvdec driver
      arm64: dts: rockchip: rk3399: Define the rockchip Video Decoder node

Jonas Karlman (1):
      media: uapi: h264: Add DPB entry field reference flags

 Documentation/devicetree/bindings/media/rockchip,vdec.yaml |   71 +++
 Documentation/media/uapi/v4l/ext-ctrls-codec.rst           |   16 +
 MAINTAINERS                                                |    7 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi                   |   14 +-
 drivers/media/v4l2-core/Kconfig                            |    4 +
 drivers/media/v4l2-core/Makefile                           |    1 +
 drivers/media/v4l2-core/v4l2-h264.c                        |  258 +++++++++
 drivers/staging/media/Kconfig                              |    2 +
 drivers/staging/media/Makefile                             |    1 +
 drivers/staging/media/hantro/Kconfig                       |    1 +
 drivers/staging/media/hantro/hantro_h264.c                 |  237 +--------
 drivers/staging/media/rkvdec/Kconfig                       |   15 +
 drivers/staging/media/rkvdec/Makefile                      |    3 +
 drivers/staging/media/rkvdec/TODO                          |   11 +
 drivers/staging/media/rkvdec/rkvdec-h264.c                 | 1153 ++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/rkvdec/rkvdec-regs.h                 |  223 ++++++++
 drivers/staging/media/rkvdec/rkvdec.c                      | 1134 +++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/rkvdec/rkvdec.h                      |  123 +++++
 include/media/h264-ctrls.h                                 |    2 +
 include/media/v4l2-h264.h                                  |   85 +++
 20 files changed, 3131 insertions(+), 230 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec.yaml
 create mode 100644 drivers/media/v4l2-core/v4l2-h264.c
 create mode 100644 drivers/staging/media/rkvdec/Kconfig
 create mode 100644 drivers/staging/media/rkvdec/Makefile
 create mode 100644 drivers/staging/media/rkvdec/TODO
 create mode 100644 drivers/staging/media/rkvdec/rkvdec-h264.c
 create mode 100644 drivers/staging/media/rkvdec/rkvdec-regs.h
 create mode 100644 drivers/staging/media/rkvdec/rkvdec.c
 create mode 100644 drivers/staging/media/rkvdec/rkvdec.h
 create mode 100644 include/media/v4l2-h264.h
