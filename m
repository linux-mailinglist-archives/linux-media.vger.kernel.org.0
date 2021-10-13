Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0ADA42C07C
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 14:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234152AbhJMMr6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 08:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231372AbhJMMr4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 08:47:56 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF1DBC061570
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 05:45:52 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 94430C63B0; Wed, 13 Oct 2021 13:45:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1634129151; bh=ZEaFWw/oz53qP7bvdd2AAW+dI8CjlmQDHuwSlvXMBA0=;
        h=Date:From:To:Subject:From;
        b=aBM4NmqqcoolSrbygm3Z5Ea3ExEjoz4XpK/qB+q3i5tEK6Bh5UIqiRCKgc0rFPs61
         EdOTT6nIxftXolsp+/bqO9tN91rfRCgVVZOhBlAAK5A17Ql5nziLY6P4CAjbdhuobO
         aQ0ccNiz20zNAvdK2zCR6r6AIElpMElYj/Sape9fPaYUMFjR08tujDI1VlBGBiRcXq
         rkLCDL+p3PCPXsQGOJAEW2MS+5O0I0conCmfuiorakRqbKIvzCGjlYu5M05E2Js/cw
         K4RRA3Oo/mPAKzwUrrtTSKUNQxxf3IORA9i5s+Kn62q6IukgO1iGyqW0Hn0RGsgv0p
         QYXBIMabEdqNQ==
Date:   Wed, 13 Oct 2021 13:45:51 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.16] ir fixes
Message-ID: <20211013124551.GA25487@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit fd2eda71a47b095e81b9170c3f8b7ae82b04e785:

  media: remove myself from dvb media maintainers (2021-10-08 13:56:25 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.16c

for you to fetch changes up to 5b3010ff85af476019e2d1c1bb4436c23a034729:

  media: sir_ir: remove broken driver (2021-10-13 13:27:57 +0100)

----------------------------------------------------------------
v5.16c

----------------------------------------------------------------
Sean Young (2):
      media: ir_toy: assignment to be16 should be of correct type
      media: sir_ir: remove broken driver

 drivers/media/rc/Kconfig  |   8 -
 drivers/media/rc/Makefile |   1 -
 drivers/media/rc/ir_toy.c |   2 +-
 drivers/media/rc/sir_ir.c | 438 ----------------------------------------------
 4 files changed, 1 insertion(+), 448 deletions(-)
 delete mode 100644 drivers/media/rc/sir_ir.c
