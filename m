Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 482CB42133E
	for <lists+linux-media@lfdr.de>; Mon,  4 Oct 2021 17:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236129AbhJDQBT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Oct 2021 12:01:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:36526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236108AbhJDQBP (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 Oct 2021 12:01:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0F3C16139F;
        Mon,  4 Oct 2021 15:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633363166;
        bh=ruLqSZwcgsLzJUDP9aLVM7caarwMV4tsqPQF1fYxMTg=;
        h=Date:From:To:Cc:Subject:From;
        b=TiM7wY+xoMC75h/isvuOuCwbokDqzNaN19HWjXJ8CNYY7dTv7qft/ipb5ed45Kcyt
         OzJNFqcfmBImKoGHQsWf2XVDs0RH5HGIDRie96dznWnX+jio038j7C1bjy2IvjIUdh
         DA0kD6uDCYAwLu2k6IMTdgV4mGwOIkY46hJMQorQ4MLa9NX7wKhizeFYizOjXFUvmp
         H6hcCOWbAJrlirxh27V1iVU2aaE+nZ8MlGyady0bB/IxOoxx9pDLjJgXn1xUDcHN5F
         yPQm2OAIqrI+CX6KWky1mkPswsjGtwD4pJyBxgdkQXriY1v6hRB7eZquzLEbKrq2RQ
         jpVEn07LXhNnw==
Date:   Mon, 4 Oct 2021 17:59:22 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [GIT PULL for v5.15-rc5] media fixes
Message-ID: <20211004175922.39809118@coco.lan>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Could you please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.15-3

There's just one patch here, fixing a -Werror issue at staging/atomisp.

Such patch is already at linux-next for quite a while, aiming 5.16, but
almost every week we're receiving a new variant of it.

So, the better is to merge this one early.

Regards,
Mauro

The following changes since commit f0c15b360fb65ee39849afe987c16eb3d0175d0d:

  media: ir_toy: prevent device from hanging during transmit (2021-09-19 11:19:37 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.15-3

for you to fetch changes up to 206704a1fe0bcaaa036d3e90358bb168fac8bea1:

  media: atomisp: restore missing 'return' statement (2021-10-04 17:54:48 +0200)

----------------------------------------------------------------
media fixes for v5.15-rc5

----------------------------------------------------------------
Arnd Bergmann (1):
      media: atomisp: restore missing 'return' statement

 .../staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c   | 2 ++
 1 file changed, 2 insertions(+)

