Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B58D2C65D6
	for <lists+linux-media@lfdr.de>; Fri, 27 Nov 2020 13:41:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729422AbgK0MlG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Nov 2020 07:41:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:49312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728340AbgK0MlG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Nov 2020 07:41:06 -0500
Received: from coco.lan (ip5f5ad5a6.dynamic.kabel-deutschland.de [95.90.213.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB89222240;
        Fri, 27 Nov 2020 12:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606480865;
        bh=Knjx8Ds+9n9DrWDY3pEXUQJXT6psTdPlMPP6Ng/RsPI=;
        h=Date:From:To:Cc:Subject:From;
        b=wkkHUfefVS/6PNLa2srpgw035nmpZXgyNOr//wp3Nt1bKNOYG5GClpZZCiYZ0inQh
         p7ujjchgdmKLUUvnSzY+yjr715I6BxzBRSPPvAF1Sf89cmt6ELggYWBNbSk67J0U/8
         h5GaaZg7EV6Kux+GN2SOJL66wktW+M8BHlUcVK2k=
Date:   Fri, 27 Nov 2020 13:41:00 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.10-rc6] vidtv driver fixes
Message-ID: <20201127134100.101be34e@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.10-3

For a series of fixes for the new the virtual digital TV driver (vidtv),
which is meant to help doing tests with the digital TV core and media
userspace apps and libraries.

They cover a series of issues I found on it, together with a few new things
in order to make it easier to detect problems at the DVB core.


Regards,
Mauro

The following changes since commit 9215f6bb4705ffe205885411394732bfc439dee0:

  media: venus: pm_helpers: Fix kernel module reload (2020-11-16 19:06:10 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.10-3

for you to fetch changes up to 44f28934af141149959c4e6495bb60c1903bda32:

  media: vidtv.rst: add kernel-doc markups (2020-11-26 08:05:24 +0100)

----------------------------------------------------------------
media fixes for v5.10-rc6

----------------------------------------------------------------
Daniel W. S. Almeida (6):
      media: vidtv: extract the initial CRC value to into a #define
      media: vidtv: psi: add a Network Information Table (NIT)
      media: vidtv: psi: Implement an Event Information Table (EIT)
      media: vidtv: psi: extract descriptor chaining code into a helper
      media: vidtv: Move s302m specific fields into encoder context
      media: vidtv: psi: fix missing assignments in while loops

Mauro Carvalho Chehab (30):
      media: vidtv: reorganize includes
      media: vidtv: add error checks
      media: vidtv: don't use recursive functions
      media: vidtv: fix the name of the program
      media: vidtv: fix the tone generator logic
      media: vidtv: fix some notes at the tone generator
      media: vidtv: avoid data copy when initializing the multiplexer
      media: vidtv: avoid copying data for PES structs
      media: vidtv: do some cleanups at the driver
      media: vidtv: remove some unused functions
      media: vidtv: pre-initialize mux arrays
      media: vidtv: cleanup null packet initialization logic
      media: vidtv: improve EIT data
      media: vidtv: fix the network ID range
      media: vidtv: properly fill EIT service_id
      media: vidtv: add a PID entry for the NIT table
      media: vidtv: fix service type
      media: vidtv: fix service_id at SDT table
      media: vidtv: add date to the current event
      media: vidtv: simplify PSI write function
      media: vidtv: simplify the crc writing logic
      media: vidtv: cleanup PSI descriptor write function
      media: vidtv: cleanup PSI table header function
      media: vidtv: cleanup PAT write function
      media: vidtv: cleanup PMT write table function
      media: vidtv: simplify SDT write function
      media: vidtv: simplify NIT write function
      media: vidtv: simplify EIT write function
      media: vidtv.rst: update vidtv documentation
      media: vidtv.rst: add kernel-doc markups

 Documentation/driver-api/media/drivers/vidtv.rst |  120 +-
 drivers/media/test-drivers/vidtv/vidtv_bridge.c  |  116 +-
 drivers/media/test-drivers/vidtv/vidtv_bridge.h  |    4 +-
 drivers/media/test-drivers/vidtv/vidtv_channel.c |  312 ++++-
 drivers/media/test-drivers/vidtv/vidtv_channel.h |   11 +-
 drivers/media/test-drivers/vidtv/vidtv_common.h  |    1 -
 drivers/media/test-drivers/vidtv/vidtv_demod.c   |    2 +-
 drivers/media/test-drivers/vidtv/vidtv_demod.h   |   11 +-
 drivers/media/test-drivers/vidtv/vidtv_encoder.h |    9 +-
 drivers/media/test-drivers/vidtv/vidtv_mux.c     |  248 ++--
 drivers/media/test-drivers/vidtv/vidtv_mux.h     |   21 +-
 drivers/media/test-drivers/vidtv/vidtv_pes.c     |  179 ++-
 drivers/media/test-drivers/vidtv/vidtv_pes.h     |    8 +-
 drivers/media/test-drivers/vidtv/vidtv_psi.c     | 1521 ++++++++++++++++------
 drivers/media/test-drivers/vidtv/vidtv_psi.h     |  282 +++-
 drivers/media/test-drivers/vidtv/vidtv_s302m.c   |  125 +-
 drivers/media/test-drivers/vidtv/vidtv_s302m.h   |    9 +-
 drivers/media/test-drivers/vidtv/vidtv_ts.c      |    5 +-
 drivers/media/test-drivers/vidtv/vidtv_ts.h      |    5 +-
 drivers/media/test-drivers/vidtv/vidtv_tuner.c   |    5 +-
 drivers/media/test-drivers/vidtv/vidtv_tuner.h   |    1 +
 21 files changed, 2182 insertions(+), 813 deletions(-)

