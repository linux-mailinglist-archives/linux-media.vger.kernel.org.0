Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50CC2130156
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2020 08:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgADHyZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Jan 2020 02:54:25 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:51638 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgADHyZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Jan 2020 02:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=3G5V/Yt8+LHaKTB8iEhyRfbumFUZlmo8w3chEDC5pCY=; b=oXGRSO+mtvC28SIwMg1qv3G4b
        K2PoVYv2PAqRrjvQ4MN0NTHwJwinvYyy39gATHfE+U0fXP+z1V3P9+veQIKWYqvJtb1U323d+aqIS
        zyXoyx6XC/HQS4oe7/uODwwW4iTOzFglinyNCz+eYCjuyojxuBRlg8OcqsTO23H+HULElJ0wpVcht
        gUMU6d2HNo3HbVd3kp1pAFYf6D+sEcGggD8e5FYgnX3nSzBWE3rrAtfrcLY8G8GcZUEdxdvYgNEcy
        c/GKTMcB6zEow7zJF67i+xBYXFHhQWfbCthY/SWk7HpsZ9x/UQHPsvcmCpbbxCiufBX224cFGWiKV
        cXKRhlJew==;
Received: from [80.156.29.194] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ineGN-0003wg-Tr; Sat, 04 Jan 2020 07:54:24 +0000
Date:   Sat, 4 Jan 2020 08:54:20 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.5-rc5] media fixes
Message-ID: <20200104085420.5fe6a671@kernel.org>
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
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.5-3

For:
  - some fixes at CEC core to comply with HDMI 2.0 specs and fix some border
    cases;
  - a fix at the transmission logic of the pulse8-cec driver.
  - one alignment fix on a data struct at ipu3 when built with 32 bits;

Regards,
Mauro

-

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.5-3

for you to fetch changes up to ce644cf3fa06504c2c71ab1b794160d54aaccbc0:

  media: intel-ipu3: Align struct ipu3_uapi_awb_fr_config_s to 32 bytes (2020-01-03 15:02:59 +0100)

----------------------------------------------------------------
media updates for v5.5-rc5

----------------------------------------------------------------
Hans Verkuil (4):
      media: cec: CEC 2.0-only bcast messages were ignored
      media: cec: avoid decrementing transmit_queue_sz if it is 0
      media: cec: check 'transmit_in_progress', not 'transmitting'
      media: pulse8-cec: fix lost cec_transmit_attempt_done() call

Sakari Ailus (1):
      media: intel-ipu3: Align struct ipu3_uapi_awb_fr_config_s to 32 bytes

 drivers/media/cec/cec-adap.c                    | 40 +++++++++++++++++--------
 drivers/media/usb/pulse8-cec/pulse8-cec.c       | 17 ++++++++---
 drivers/staging/media/ipu3/include/intel-ipu3.h |  2 +-
 3 files changed, 41 insertions(+), 18 deletions(-)

