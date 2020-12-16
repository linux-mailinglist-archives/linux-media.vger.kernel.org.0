Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA122DBE0F
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 10:57:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbgLPJzs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 04:55:48 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:40003 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726046AbgLPJzs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 04:55:48 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id pTWQkOoffynrEpTWTkpdkD; Wed, 16 Dec 2020 10:55:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1608112505; bh=zQ6g/nGXa5L9vV6Sfad2gn8SccIlD9+U9gze4ZMg0as=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=i79Nh0PKtqTXdx+xCuLi5d3QrCRltPYS5zkfQLBTJ1SXU/ENDqZ/+A0Nh+ly2aM9J
         I2f29qdPZJxH1jU3tT1zhTGmRCkZTZrB8nTz5aV/KiG2IWbPBnrdlor+IMVaPTyLYR
         YoWOqNPsKQtYKla6mDRgkl4ycECoPi8ZRTfAej+a2jQ8fwcH4xpeW1rCZOainwILFZ
         EGFA5WknDqtLnkY9SAfHR4P/i3W5eBQyMBYsVv3unmXfKCL6tcEdjfAkZX+b+2PNWQ
         vLMZx//EiKWjwrJqlLZftOxiReC5iTu7/LJ4cYO97TjEifAwEcybv6nYviiuiKhD60
         AK4MdIyMZ/Enw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Michael Tretter <m.tretter@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.12] allegro: fix + move to mainline
Message-ID: <dfb7d5c7-dd82-2cbb-48ef-9b9cc26f3f57@xs4all.nl>
Date:   Wed, 16 Dec 2020 10:55:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBqf9IEodcaA5ebq19z0BmdnCdBmOSW+v3+BC3PbF2xobUAvUmigPC8IoMRMbXrbroJViY4uPFLNfytCuPv4UNwk+lICPgi6ldEBlywBrRgpAk6juwFQ
 cWFk8UptZSZuUkEoYUgJ/UdNwsLaVI19TXQXhqiAEkm1ggUKc/7nSLbT7SpfDLVAdTJIUN36WEhN400Jw48DXyU3Kxn+ayXAQwQmls6Pyp6l0BvLBDGb5f8N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

One use-after-free fix and then move the driver out of staging.

Regards,

	Hans

The following changes since commit fab0fca1da5cdc48be051715cd9787df04fdce3a:

  Merge tag 'media/v5.11-1' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media (2020-12-14 11:47:37 -0800)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.12d

for you to fetch changes up to a805266026bd1bb69385fe0dd6a4e11e1dd669a0:

  media: allegro: rename stream_id to dst_handle (2020-12-16 10:46:27 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dan Carpenter (1):
      media: allegro: Fix use after free on error

Michael Tretter (4):
      media: allegro: move driver out of staging
      dt-bindings: media: allegro,al5e: Convert to YAML
      media: allegro: remove custom drain state handling
      media: allegro: rename stream_id to dst_handle

 Documentation/devicetree/bindings/media/allegro,al5e.yaml            | 105 +++++++++++++++++++++++++++
 Documentation/devicetree/bindings/media/allegro.txt                  |  43 -----------
 MAINTAINERS                                                          |   3 +-
 drivers/media/platform/Kconfig                                       |  15 ++++
 drivers/media/platform/Makefile                                      |   1 +
 drivers/{staging/media => media/platform}/allegro-dvt/Makefile       |   0
 drivers/{staging/media => media/platform}/allegro-dvt/allegro-core.c | 183 +++++++++++++----------------------------------
 drivers/{staging/media => media/platform}/allegro-dvt/allegro-mail.c |   8 +--
 drivers/{staging/media => media/platform}/allegro-dvt/allegro-mail.h |   4 +-
 drivers/{staging/media => media/platform}/allegro-dvt/nal-h264.c     |   0
 drivers/{staging/media => media/platform}/allegro-dvt/nal-h264.h     |   0
 drivers/staging/media/Kconfig                                        |   2 -
 drivers/staging/media/Makefile                                       |   1 -
 drivers/staging/media/allegro-dvt/Kconfig                            |  16 -----
 drivers/staging/media/allegro-dvt/TODO                               |   4 --
 15 files changed, 178 insertions(+), 207 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allegro,al5e.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/allegro.txt
 rename drivers/{staging/media => media/platform}/allegro-dvt/Makefile (100%)
 rename drivers/{staging/media => media/platform}/allegro-dvt/allegro-core.c (95%)
 rename drivers/{staging/media => media/platform}/allegro-dvt/allegro-mail.c (98%)
 rename drivers/{staging/media => media/platform}/allegro-dvt/allegro-mail.h (98%)
 rename drivers/{staging/media => media/platform}/allegro-dvt/nal-h264.c (100%)
 rename drivers/{staging/media => media/platform}/allegro-dvt/nal-h264.h (100%)
 delete mode 100644 drivers/staging/media/allegro-dvt/Kconfig
 delete mode 100644 drivers/staging/media/allegro-dvt/TODO
