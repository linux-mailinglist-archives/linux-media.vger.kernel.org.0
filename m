Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51246190E5C
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2020 14:08:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbgCXNIC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Mar 2020 09:08:02 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:50957 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726190AbgCXNIC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Mar 2020 09:08:02 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id GjHfjWGmyBr2bGjHjjCpNO; Tue, 24 Mar 2020 14:07:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585055279; bh=8an7+sIdB7NJzPGkxiHi8p0RMo7NATo0kBQR6ciqnh8=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Jf09rQzH10MRI9StFXWvkCxLlixFyo88EREHFVz5d3dkIHOAhYhvYRMX1WfmrjHi5
         r8Gxe5nAqmLArCDFmGA2vcR7uqc3aJlSWqOIKfZCaUZP6H676e5TYl4yYc2enlxUWD
         YyrooJxucW/JW2rvhn6irUjeGD4faTg4qazxaQKeFx8e6o1VLheIIwTE+ZOeySmHWQ
         QLep0tV2OEbDN3+pnur4A0iunbpWMYIUU4TGOKLIjcIUX/KiTHsFFUngT0ae8JFCH6
         ipMC9nlLaaiaEeFrv1JydYJDoE9t6g9SSaan3uWUlzSYNYZrM0ayPZ8EO8nBDR2XpS
         qpEuqNGeoB77A==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.7] Various fixes, add i.MX8MQ hantro support
Message-ID: <270c0340-e052-7466-4a7b-2155a643d35f@xs4all.nl>
Date:   Tue, 24 Mar 2020 14:07:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJ952qqIbAWIhg2/rJkf9waDFO6tal8SwObCrLlHeAIpxB8rCuF1UCeEO5wM2Ed8UCOJN2HvxuQuxw+zr0yBaWcX9axoFI4eD6OhdxTWZ7UdEdXJn90+
 tJ6bX/PZWyWa6lxm56QB3YbNicL9gTKaAjr4E6i6pUDF3MzD1JfQdjikgtoDds2bS5sOey9i4jxdvG5rbJNZDRbAHRX9tRZlBMIK9QQ7SgznuOcUtOy/8u6r
 33OiTcEzZQr6XM4OPW9eMg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Various fixes that should go into v5.7.

Also add hantro support for the i.MX8MQ. It's a bit late in the cycle, but it
is similar to adding a card for a USB or PCI driver in that it doesn't touch
the existing hardware that supports the hantro IP.

Regards,

	Hans

The following changes since commit af72bc8cd6ab32be2105129f05eb4502f45577df:

  media: siano: Use scnprintf() for avoiding potential buffer overflow (2020-03-20 16:28:07 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.7m

for you to fetch changes up to 2bcbf79e4823f48c2546251271fd7b86bc38107c:

  media: mtk-vpu: load vpu firmware from the new location (2020-03-24 13:50:59 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ezequiel Garcia (1):
      hantro: Add linux-rockchip mailing list to MAINTAINERS

Hans Verkuil (1):
      vivid: fix incorrect PA assignment to HDMI outputs

Jernej Skrabec (1):
      media: cedrus: h264: Fix 4K decoding on H6

Matt Ranostay (1):
      media: i2c: video-i2c: fix build errors due to 'imply hwmon'

Philipp Zabel (3):
      media: dt-bindings: Document i.MX8MQ VPU bindings
      media: hantro: add initial i.MX8MQ support
      media: MAINTAINERS: add myself to co-maintain Hantro G1/G2 for i.MX8MQ

Rui Wang (1):
      media: mtk-vpu: load vpu firmware from the new location

 Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml |  77 +++++++++++++++
 MAINTAINERS                                                 |   3 +
 drivers/media/i2c/video-i2c.c                               |   2 +-
 drivers/media/platform/mtk-vpu/mtk_vpu.c                    |  16 ++-
 drivers/media/platform/vivid/vivid-core.c                   |   4 +-
 drivers/staging/media/hantro/Kconfig                        |  16 ++-
 drivers/staging/media/hantro/Makefile                       |   3 +
 drivers/staging/media/hantro/hantro_drv.c                   |   3 +
 drivers/staging/media/hantro/hantro_hw.h                    |   1 +
 drivers/staging/media/hantro/imx8m_vpu_hw.c                 | 220 +++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus_h264.c            |   6 +-
 11 files changed, 340 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx8mq-vpu.yaml
 create mode 100644 drivers/staging/media/hantro/imx8m_vpu_hw.c
