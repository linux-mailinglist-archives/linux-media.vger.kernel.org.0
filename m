Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD663EFDB0
	for <lists+linux-media@lfdr.de>; Wed, 18 Aug 2021 09:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238264AbhHRHU2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Aug 2021 03:20:28 -0400
Received: from gofer.mess.org ([88.97.38.141]:57603 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238080AbhHRHU1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Aug 2021 03:20:27 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id DA6AFC6459; Wed, 18 Aug 2021 08:19:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1629271190; bh=zsMfN8icGNBmVKoHAoS5ezmh4WMYA/SE/8Dp1fR4mXo=;
        h=Date:From:To:Subject:From;
        b=ffW8wDOK/LdG6Pd7v1ACeUChVIIEkjClgLI25IPr8BuqsL/COGoylBsYiE3D+WvRA
         BDbo28/LfyC1wsi4/8WqoLnkLn++W7rZhDE4AQIMMS0/JZeNIX8uwt+0sDpm34oR03
         OXsEjuA9eEA3zCArFbe0kRL6CIgk/8kDy/EhzGo3i13wrHSUV3EbV1T3AZcApiLZBS
         7tNPxZdhghahrO2snXgRSi+QzLopGvEW/K7VG3Q1ReqfJrKpEWpvQzmQmQWoiL1CDD
         HeHigPeX/J6Wi8jVn1bctSecrXktLgCHG2jtEfRSqoLgNdRq9pv6nqpAl+nHmUbHZT
         tMtBGnkiY9ZfQ==
Date:   Wed, 18 Aug 2021 08:19:50 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.15] Minor fixes
Message-ID: <20210818071950.GA2223@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit b395ba42afd9ee3abafc389d15e0985172448927:

  media: ir_toy: allow tx carrier to be set (2021-08-12 16:01:14 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.15e

for you to fetch changes up to 9b2cc3b383d150103b5bcfe65a37bc8cab2c883e:

  media: netup_unidvb: handle interrupt properly according to the firmware (2021-08-17 22:41:25 +0100)

----------------------------------------------------------------
v5.15e

----------------------------------------------------------------
Cai Huoqing (1):
      media: c8sectpfe-dvb: Remove unused including <linux/version.h>

Linus Walleij (1):
      media: cxd2820r: include the right header

Muhammad Usama Anjum (1):
      media: siano: use DEFINE_MUTEX() for mutex lock

Nil Yi (1):
      media: rc: clean the freed urb pointer to avoid double free

Pavel Skripkin (1):
      media: dvb-usb: fix ununit-value in az6027_rc_query

Zheyu Ma (1):
      media: netup_unidvb: handle interrupt properly according to the firmware

 drivers/media/common/siano/smscoreapi.c            |  7 ++----
 drivers/media/dvb-frontends/cxd2820r_priv.h        |  2 +-
 drivers/media/pci/netup_unidvb/netup_unidvb_core.c | 27 +++++++++++++---------
 .../media/platform/sti/c8sectpfe/c8sectpfe-core.c  |  1 -
 .../media/platform/sti/c8sectpfe/c8sectpfe-dvb.c   |  1 -
 drivers/media/rc/imon.c                            |  2 ++
 drivers/media/usb/dvb-usb/az6027.c                 |  1 +
 7 files changed, 22 insertions(+), 19 deletions(-)
