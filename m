Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6C43D1FB0
	for <lists+linux-media@lfdr.de>; Thu, 22 Jul 2021 10:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbhGVHbW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Jul 2021 03:31:22 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:34069 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230048AbhGVHbT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Jul 2021 03:31:19 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6To8m8TbnW9Qy6To9mm1r0; Thu, 22 Jul 2021 10:11:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1626941514; bh=aXglBLJbbrJHTf5O1siAI+ojHHMEN7098GWbPK/pt3Q=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=MezmrMGL5PhgT7u/Hrc/z3h7hHzO9iQdCJel+HHHlx7Gz4O3crFGPtv/XSR7NZ442
         TIHRw+7f6jLhseeb35/CtE3JDZYGOQlgoPvJe4VpkW9ZaeMfTxXABNOjK697vh0nrr
         V3Om06Rozb0A1ZyutinGNe0cg/X+IgfnZu6uJzlmlJL9YuhAx1u4guWU9NsHoLtCzv
         x5bzCPqXKHJYj2G6AnmP/bVbdgdvZgmnIWWlOd6BDlB1EQ1AD8nbHLDYGj18Ls3uDp
         aL51zk1hgHJQfesdgHo/YthzKUuAta8oobecZqTuSPkYu2SGI969eBDzkQU+LSttJm
         TkqwrBwrMqSeg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.15] rcar-vim/isp: add r8a779a0 support
Message-ID: <a10d5622-62f2-57aa-6031-e937470dd83b@xs4all.nl>
Date:   Thu, 22 Jul 2021 10:11:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfJVFs3WXTaYXfG/ZjAIgwBB6WxI08sNNocUVV7K376TCX30q19KJ9lbzqBmrnxUqiJJqmL2eruX4EIREbYDRDyhqPMVWmHriW/ARAmXABqX40McgkWmM
 t8YiYXU7sep0odAm8i3Z7fKliyQ5O76VcQ0DZQoJ77sBv9RtbludToyAHPbcci+Jlv3rURh+EZRGq0RsRyJ+riuEU8WMyGNWhoGd4xFfy66/hSArS+rW/jKH
 0RAOqttsAhhh401G+NTqDBwxPTUIfxyB7ECqJPauOhdkyMdqjy2LY57nKoVC+A7ClR+5zLaHLYtuMYKXZemRDyRXay5ALAyeXi7v5AqJlHAvSZnUZx5MGGEj
 v95ZQy/i
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 379e205dab9d7f9761984728e7d6f5f8305cc424:

  media: usb: dvb-usb-v2: af9035: let subdrv autoselect enable si2168 and si2157 (2021-07-12 14:28:49 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.15c

for you to fetch changes up to 325f8c6441a46b549fce94b494c860bc730f4847:

  media: rcar-isp: Add Renesas R-Car Image Signal Processor driver (2021-07-22 10:00:30 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Niklas Söderlund (12):
      rcar-vin: Refactor controls creation for video device
      rcar-vin: Fix error paths for rvin_mc_init()
      rcar-vin: Improve async notifier cleanup paths
      rcar-vin: Improve reuse of parallel notifier
      rcar-vin: Rename array storing subdevice information
      rcar-vin: Move group async notifier
      rcar-vin: Extend group notifier DT parser to work with any port
      rcar-vin: Create a callback to setup media links
      rcar-vin: Specify media device ops at group creation time
      rcar-vin: Move and rename CSI-2 link notifications
      rcar-vin: Add r8a779a0 support
      media: rcar-isp: Add Renesas R-Car Image Signal Processor driver

 MAINTAINERS                                 |    1 +
 drivers/media/platform/Kconfig              |   16 +
 drivers/media/platform/Makefile             |    1 +
 drivers/media/platform/rcar-isp.c           |  505 ++++++++++++++++++++++++++++
 drivers/media/platform/rcar-vin/rcar-core.c | 1059 +++++++++++++++++++++++++++++++++-------------------------
 drivers/media/platform/rcar-vin/rcar-dma.c  |   22 +-
 drivers/media/platform/rcar-vin/rcar-vin.h  |   25 +-
 7 files changed, 1151 insertions(+), 478 deletions(-)
 create mode 100644 drivers/media/platform/rcar-isp.c
