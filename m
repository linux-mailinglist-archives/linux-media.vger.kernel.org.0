Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 800B92CD470
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387578AbgLCLS1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:18:27 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:42105 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727069AbgLCLS0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 06:18:26 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id kmcHkag932G8DkmcKkjGh9; Thu, 03 Dec 2020 12:17:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606994265; bh=wF9eUFaan/URuu27tAd7FBr8tR4bXeHmZL/cJLM+GN4=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=rn36vZrYfQQxJX/+EH1pPM8Dq24VyqSR+BzqX0pU7uRaThUpkZUDJ1GUSjdOJ4A13
         BCHHn6AM/bzF84ZxFvThjb7g6wGt3NGo0okHt59R2KGW8Trf9NcWjZRXMmtg5T4gNT
         O8b0WzG/GOYnVZFyWieSrs8aannHpIHZiehhGxAeUzICRSRWjnCoCxXlhZElfKM98O
         COrONon9XgjUl6PlNcPBLuqqao6LHJVKGo+6yvaQuxpdVx2IiyH5hoUPhunCF02pD8
         6C9XpuJvvVNtRQx1UeLFn7KFo8izavHftRfX5AS4w2haEv7UVodobHOpJjmTIkDKES
         twzMj1XwKXNEw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>,
        Neil Armstrong <narmstrong@baylibre.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.11] Various fixes and a new meson driver
Message-ID: <4bfaa4d3-7b04-3b5c-801c-d68f0765646d@xs4all.nl>
Date:   Thu, 3 Dec 2020 12:17:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNAniiC4/hktbnBdDIA3H0otqTdueekDDm0SMsgb+xNHADYksQJvZpig1i9GkwK1JcfQ3jHMS7DYa/081dr34DCkHyAJpUAuMYTiyIDAi4USU3iZ77ZI
 L2EyvoATQwT9w7cDa/6/11MCq4+oBA4SJwaGE1Zr62sU6JdfCr0naTx68vyRMY7fC8NLid/IpMO33gz6xkofyc7TtqFd+eq0Ggwc7cKyUO2lf/wc8rBsHrmQ
 06phmcnYIplm7SyPoNfeaapvbNL5vTBsGG3QP2yk/bc=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit fb1f3a1befdb43a40255d35d50ac49a332232fc0:

  media: pixfmt-compressed.rst: fix 'bullet' formatting (2020-12-03 11:45:17 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.11e

for you to fetch changes up to 0d87b2a2c7e667078075e7b86f90662aa5ee1e2b:

  vivid: fix 'disconnect' error injection (2020-12-03 12:01:53 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alan Stern (1):
      media: gspca: Fix memory leak in probe

Hans Verkuil (1):
      vivid: fix 'disconnect' error injection

Jacopo Mondi (1):
      media: rcar-vin: Mask VNCSI_IFMD register

Jernej Skrabec (1):
      media: cedrus: Make VP8 codec as capability

Neil Armstrong (3):
      dt-bindings: media: Add bindings for the Amlogic GE2D Accelerator Unit
      media: meson: Add M2M driver for the Amlogic GE2D Accelerator Unit
      MAINTAINERS: Add myself as maintainer of the Amlogic GE2D driver

 Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml |   47 ++
 MAINTAINERS                                                   |    9 +
 drivers/media/platform/Kconfig                                |   13 +
 drivers/media/platform/Makefile                               |    2 +
 drivers/media/platform/meson/ge2d/Makefile                    |    3 +
 drivers/media/platform/meson/ge2d/ge2d-regs.h                 |  360 +++++++++++++
 drivers/media/platform/meson/ge2d/ge2d.c                      | 1067 +++++++++++++++++++++++++++++++++++++
 drivers/media/platform/rcar-vin/rcar-dma.c                    |   25 +-
 drivers/media/test-drivers/vivid/vivid-core.c                 |   66 ++-
 drivers/media/test-drivers/vivid/vivid-core.h                 |    1 +
 drivers/media/test-drivers/vivid/vivid-ctrls.c                |   29 +-
 drivers/media/usb/gspca/gspca.c                               |    1 +
 drivers/staging/media/sunxi/cedrus/cedrus.c                   |   27 +-
 drivers/staging/media/sunxi/cedrus/cedrus.h                   |    1 +
 drivers/staging/media/sunxi/cedrus/cedrus_video.c             |    1 +
 15 files changed, 1610 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
 create mode 100644 drivers/media/platform/meson/ge2d/Makefile
 create mode 100644 drivers/media/platform/meson/ge2d/ge2d-regs.h
 create mode 100644 drivers/media/platform/meson/ge2d/ge2d.c
