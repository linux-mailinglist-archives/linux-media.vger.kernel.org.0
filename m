Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF8AA17CEBC
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 15:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgCGOf6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 09:35:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:36024 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726283AbgCGOf6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Mar 2020 09:35:58 -0500
Received: from coco.lan (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E0DF22051A;
        Sat,  7 Mar 2020 14:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583591758;
        bh=45OV6CLg6Fo3/uUQ0kWXa8upeRwnERzGdfibPI0dQ2w=;
        h=Date:From:To:Cc:Subject:From;
        b=tEYIM3W6to8lMIUjgA2FCWw7IwU5TiA1WyC+SuQbi3jnTcQT/pqd5ociYd5kSrKrR
         JgQmfHqD6Tve6yVAkSri/sBwlLVWFCVyH0+QHvd14NXKRJDExjEHw5wJqZHVaERYoY
         bSpkP2Sl3+hIidqCCgOXtoU2h9/CddjQK2By0eoc=
Date:   Sat, 7 Mar 2020 15:35:54 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.6-rc5] media fixes
Message-ID: <20200307153554.1411ffb3@coco.lan>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.6-2


For:
  - a fix at the media controller links at both hantro driver and at
    v4l2-mem2mem core;
  - Some fixes at pulse8-cec driver;
  - vicodec: handle alpha channel for RGB32 formats, as it may be used;
  - mc-entity.c: fix handling of pad flags.

Regards,
Mauro

-

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.6-2

for you to fetch changes up to d171c45da874e3858a83e6377e00280a507fe2f2:

  media: hantro: Fix broken media controller links (2020-02-24 15:10:39 +0100)

----------------------------------------------------------------
media fixes for v5.6-rc5

----------------------------------------------------------------
Ezequiel Garcia (1):
      media: hantro: Fix broken media controller links

Hans Verkuil (5):
      media: pulse8-cec: INIT_DELAYED_WORK was called too late
      media: pulse8-cec: close serio in disconnect, not adap_free
      media: vicodec: process all 4 components for RGB32 formats
      media: v4l2-mem2mem.c: fix broken links
      media: mc-entity.c: use & to check pad flags, not ==

 drivers/media/mc/mc-entity.c                     |  4 +--
 drivers/media/platform/vicodec/codec-v4l2-fwht.c | 34 +++++++-----------------
 drivers/media/usb/pulse8-cec/pulse8-cec.c        | 12 +++++----
 drivers/media/v4l2-core/v4l2-mem2mem.c           |  4 +--
 drivers/staging/media/hantro/hantro_drv.c        |  4 +--
 5 files changed, 22 insertions(+), 36 deletions(-)

