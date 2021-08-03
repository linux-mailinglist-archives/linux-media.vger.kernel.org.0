Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6003DE9A1
	for <lists+linux-media@lfdr.de>; Tue,  3 Aug 2021 11:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234833AbhHCJS4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Aug 2021 05:18:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:52652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234506AbhHCJS4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 3 Aug 2021 05:18:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A30160F01;
        Tue,  3 Aug 2021 09:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627982325;
        bh=YiXsQ+RF1OHVNyaTQMNOqRK7p9cwYpYzfzh86WowLuw=;
        h=Date:From:To:Cc:Subject:From;
        b=ddbTBT/cVSrdQT2JkzXm68iiUiEcEYWvRg1dADsWKZvTB7ardSwBJLlQg/fsbwRFg
         dSd7wyRST1HzhWOQVrj7FgARaKbhJRivXvRAsFo6jwH0BvcV+VzATZkCnO4GohoFFH
         98PgALFeniIahQhWX1P2cuqdxa7/Z6EuGFJsftw6xrQPUvhIDbbkOHfRyjb0QdyY0t
         xGGOFR5TTm3h7THiOvn8tJC5WITVSNryY+f76RImjmI5sEoBhbhIDHbbMgFdR3E0Fd
         g6255fRAwN0cKoat7g+3b6iRdtp6KuQtR94nmWH1iUyWujRKta6MH1VFOh2X/q/tjo
         4rOOOJVxpkuFA==
Date:   Tue, 3 Aug 2021 11:18:40 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.14-rc5] media fixes
Message-ID: <20210803111840.1127af2f@coco.lan>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.14-2

For:

  - a regression fix at the rtl28xxu I2C logic;
  - a build fix for atmel driver;
  - videobuf2-core: dequeue if start_streaming fails

Regards,
Mauro

The following changes since commit 61c6f04a988e420a1fc5e8e81cf9aebf142a7bd6:

  media: s5p-mfc: Fix display delay control creation (2021-06-28 15:17:42 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.14-2

for you to fetch changes up to f1de1c7803595e937ce9b922807f499851225021:

  media: atmel: fix build when ISC=m and XISC=y (2021-07-30 13:01:52 +0200)

----------------------------------------------------------------
media fixes for v5.14-rc5

----------------------------------------------------------------
Eugen Hristev (1):
      media: atmel: fix build when ISC=m and XISC=y

Hans Verkuil (1):
      media: videobuf2-core: dequeue if start_streaming fails

Johan Hovold (2):
      media: Revert "media: rtl28xxu: fix zero-length control request"
      media: rtl28xxu: fix zero-length control request

 drivers/media/common/videobuf2/videobuf2-core.c | 13 ++++++++++++-
 drivers/media/platform/atmel/Kconfig            |  8 ++++++++
 drivers/media/platform/atmel/Makefile           |  5 +++--
 drivers/media/platform/atmel/atmel-isc-base.c   | 11 +++++++++++
 drivers/media/usb/dvb-usb-v2/rtl28xxu.c         | 14 +++++++++++---
 5 files changed, 45 insertions(+), 6 deletions(-)

