Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5DE359CE6
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 13:15:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233978AbhDILPB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 07:15:01 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:57835 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233984AbhDILPB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 07:15:01 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id Up64lMJIA43ycUp67lV3It; Fri, 09 Apr 2021 13:14:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617966887; bh=IaSZUvg07dYSJKcw5uzS8iPWp606TgsBGU0Pzt2ushA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=FXluuVUDDebHs8NU0Hc/6oAYuHdLlHerJ+f/Xzb8+ICebHH6003vNuiWt9Z17BMp4
         0rNw6MMT7sg0A8qm1uIG7Z6Bok1DoLLwym1pMsZ0mONU8hJO3PnjuJJuCPw+GNofxd
         NsjxJJ7BKtK5GDDFf6/jBYbRGNgW0bfX7wjy0FoxNqsOBqHSIEQLff6wnXrp1LsOgf
         ag+TB6iUwPJsscqN9DQhUcoWMmWfM+a4gq2Q0xyhLPOuFkMfx3gY5mp4EP89O3dvAH
         wmEdQpGrLd4GvDGSM1tJOTqcYr80MnyiF05kgWY8vUuZYWVQ7U0sZoCiMVBMgUJ5Sj
         /JHOu6Vk3DObA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.13] Various fixes
Message-ID: <66b2a895-33d1-539a-92b5-4ffe679a94fc@xs4all.nl>
Date:   Fri, 9 Apr 2021 13:14:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfACh9Wy82r8k0b5Fd4qyDmN3jtn36PRiMw53FPLptkYpMO/8B8Fd/cen2hOGyVC7Nt60496FhUqOcKVBgK9aZiYajJkOx+m4CYKOQ5ESNujM2KcP545N
 4srffqFpYzuyGOJe/NYo0GNnPK/UY5xzXBOHjYw5rWE1f4J0e+zxRqXMdC56OsLqtToU4zE6GqNJIg2636XiTRL3RzGFWEm+0Ao=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit dccfe2548746ca9cca3a20401ece4cf255d1f171:

  media: staging/intel-ipu3: Fix race condition during set_fmt (2021-04-09 13:07:09 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13b

for you to fetch changes up to 0ba955d399761ca70ee4ee688c62dc76be058ad0:

  gscpa/stv06xx: fix memory leak (2021-04-09 13:08:43 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (4):
      allegro: change kernel-doc comment blocks to normal comments
      adv7842: configure all pads
      adv7842: support 1 block EDIDs, fix clearing EDID
      gscpa/stv06xx: fix memory leak

Jacopo Mondi (1):
      media: i2c: rdamc21: Fix warning on u8 cast

Muhammad Usama Anjum (1):
      staging: media/meson: remove redundant dev_err call

Tian Tao (1):
      media: cx25821: remove unused including <linux/version.h>

Yang Yingliang (1):
      media: camss: ispif: Remove redundant dev_err call in msm_ispif_subdev_init()

 drivers/media/i2c/adv7842.c                     | 81 +++++++++++++++++++++++++++++++++--------------------
 drivers/media/i2c/rdacm21.c                     |  2 +-
 drivers/media/pci/cx25821/cx25821.h             |  1 -
 drivers/media/platform/allegro-dvt/nal-h264.h   |  8 +++---
 drivers/media/platform/allegro-dvt/nal-hevc.h   |  6 ++--
 drivers/media/platform/qcom/camss/camss-ispif.c |  8 ++----
 drivers/media/usb/gspca/gspca.c                 |  2 ++
 drivers/media/usb/gspca/gspca.h                 |  1 +
 drivers/media/usb/gspca/stv06xx/stv06xx.c       |  9 ++++++
 drivers/staging/media/meson/vdec/vdec.c         |  8 ++----
 10 files changed, 74 insertions(+), 52 deletions(-)
