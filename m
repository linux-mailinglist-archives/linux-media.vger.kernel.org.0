Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3904589CD
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 08:27:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238735AbhKVHa4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 02:30:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:48436 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233435AbhKVHay (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 02:30:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7E8E60E0B;
        Mon, 22 Nov 2021 07:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637566068;
        bh=Ly/0T2OAUzTynxpf9QpH0VIk84ZehGQBwIxIsl8it18=;
        h=Date:From:To:Cc:Subject:From;
        b=kCvjnExUjW0IDDkPIJKOVLsubbbx2w2oCWKIjhUjZyMGlVOlDPoe5YhfpXYLRvMl6
         PphjgmkFDBBGQQxjTQdyXfPNPlJlnozXNOCev9Vakyk7fbdz0OdG1BV890/6/VHOu7
         gB/2dWFnduONks8nPt8O/hwltbkt5Z/ugv8Wbd3yk7X7TbPL5PufHi6kmCto3MHmNZ
         ULSqJ7eAxKalEWffNwbzFSOmR9u0S8vzF1gzI8XGGemSUB1Sdk5v7XDRnKP1M/o831
         lOdZYckHHbWqpeCS78mWXf/qdl0MQJ0oObM3ZMbQ5YN8ybrL0feni88PTKLQDfZQPr
         ZoJdOcsXnpfEQ==
Date:   Mon, 22 Nov 2021 07:27:43 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.16-rc3] media fixes
Message-ID: <20211122072743.4caac49f@sal.lan>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
	  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.16-2

For:

  - A fix at VIDIOC_DQEVENT ioctl handling for 32-bit userspace
    with a 64-bit Kernel;
  - A regression fix at videobuf2 core;
  - A fix at CEC core when handling non-block transmit;
  - hi846: fix a clang warning.

Regards,
Mauro


The following changes since commit 57c3b9f55ba875a6f6295fa59f0bdc0a01c544f8:

  media: venus: core: Add sdm660 DT compatible and resource struct (2021-10-21 14:26:19 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/media/v5.16-2

for you to fetch changes up to 62456590b84965ad8d633dbd8f8c75fcf1e765d6:

  media: hi846: remove the of_match_ptr macro (2021-11-19 05:56:07 +0000)

----------------------------------------------------------------
media fixes for v5.16-rc3

----------------------------------------------------------------
Arnd Bergmann (1):
      media: v4l2-core: fix VIDIOC_DQEVENT handling on non-x86

Hans Verkuil (1):
      media: cec: copy sequence field for the reply

Hans de Goede (1):
      media: videobuf2-dma-sg: Fix buf->vb NULL pointer dereference

Martin Kepplinger (2):
      media: hi846: include property.h instead of of_graph.h
      media: hi846: remove the of_match_ptr macro

 drivers/media/cec/core/cec-adap.c                 |  1 +
 drivers/media/common/videobuf2/videobuf2-dma-sg.c |  2 ++
 drivers/media/i2c/hi846.c                         |  4 +--
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c     | 41 ++++++++++-------------
 4 files changed, 22 insertions(+), 26 deletions(-)

