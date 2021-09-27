Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74BF6419128
	for <lists+linux-media@lfdr.de>; Mon, 27 Sep 2021 10:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233590AbhI0Izd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Sep 2021 04:55:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:43552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233587AbhI0Izc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Sep 2021 04:55:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 606F060F44;
        Mon, 27 Sep 2021 08:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632732834;
        bh=VssYZyRz4PGYsoLqjltuy11Agr4njvb26qTac7QB3jw=;
        h=Date:From:To:Cc:Subject:From;
        b=bexZRTVBzPYmoYVFxvTXrU/6cAAt9Z78w3D1hfJ86ifQlWbz12lj5L8G502Y6+ylJ
         CHLLo2fJzqUMsmSeHYWI/9JCEg6MIropULyPVMKLv0n04oI1OBQ3D62lSsSuZAsgQR
         GLtl+3LsWTimu+7yZ3vUicJSTMuU/1hPyGWrsaWIRy3O1F3WQxo0jHhqqEENsGQTb4
         GE0T9rjvx7l9tg2h51TWmPFCjUnB6EHxE8eyedoVD6B9qK0vNU8YFGUkMRQr7lyMVB
         58/8J15uQWOagzb9Ni1+n4PPuA+EmSvuYXxN5AG9Kyc3zqaH+Gls195VhNlHJagUAd
         F3kiBIlnDAm0A==
Date:   Mon, 27 Sep 2021 10:53:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.15-rc4] media fixes
Message-ID: <20210927105350.31f688c7@coco.lan>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.15-2

For a couple of driver fixes:
      hantro: Fix check for single irq
      cedrus: Fix SUNXI tile size calculation
      s5p-jpeg: rename JPEG marker constants to prevent build warnings
      ir_toy: prevent device from hanging during transmit

Regards,
Mauro

-

The following changes since commit 835d31d319d9c8c4eb6cac074643360ba0ecab10:

  Merge tag 'media/v5.15-1' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media (2021-09-01 10:34:52 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.15-2

for you to fetch changes up to f0c15b360fb65ee39849afe987c16eb3d0175d0d:

  media: ir_toy: prevent device from hanging during transmit (2021-09-19 11:19:37 +0200)

----------------------------------------------------------------
media fixes for v5.15-rc4

----------------------------------------------------------------
Jernej Skrabec (1):
      media: hantro: Fix check for single irq

Nicolas Dufresne (1):
      media: cedrus: Fix SUNXI tile size calculation

Randy Dunlap (1):
      media: s5p-jpeg: rename JPEG marker constants to prevent build warnings

Sean Young (1):
      media: ir_toy: prevent device from hanging during transmit

 drivers/media/platform/s5p-jpeg/jpeg-core.c       | 18 +++++++--------
 drivers/media/platform/s5p-jpeg/jpeg-core.h       | 28 +++++++++++------------
 drivers/media/rc/ir_toy.c                         | 21 ++++++++++++++++-
 drivers/staging/media/hantro/hantro_drv.c         |  2 +-
 drivers/staging/media/sunxi/cedrus/cedrus_video.c |  2 +-
 5 files changed, 45 insertions(+), 26 deletions(-)

