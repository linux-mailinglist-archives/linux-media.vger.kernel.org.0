Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DED12EBC44
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 11:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbhAFKUk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 05:20:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725960AbhAFKUk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 05:20:40 -0500
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B981EC061358
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 02:19:59 -0800 (PST)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 6255EC63F3; Wed,  6 Jan 2021 10:19:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1609928397; bh=n4NQencnqG4nCobEQTPMingGoBYl21eysZNqqHo650Q=;
        h=Date:From:To:Subject:From;
        b=Oqb7kM4E38xFu9ctJp9MeT+o8od4wt+SSdF7MJgZKsiTLEL4dpP+4SX8NVpjBRdVH
         CMY+QRFLXG18OHX/pCLxoKj0nwKxRf72gw2SJnRakatpcmd2ncuzg9yTpIPcwa4Xb6
         9RBhyM1IbgRWSdoG0WYEAU3U8quI48+wAO5KREaJjvdQUZyKh8AbsgN9ZAxsmXRWqI
         7NfNeUqAUwvh91uWPsL43ELJjQfccZjEo6uMJQNjjheRH4aksUg+DbW6/VR/uSBqAn
         HhAhf/Ngw/pAPxH6frtevU80H6xrqPiJxF811PKqp896x9iGY6rOK+Cw1gCBO3QH+I
         OPiCha4Ftt5Hw==
Date:   Wed, 6 Jan 2021 10:19:57 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR v5.11] rc nsec to usec fix
Message-ID: <20210106101957.GA29145@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here is a fix for the nsec to usec change in rc-core. 

Thanks,

Sean

The following changes since commit 896111dc4bcf887b835b3ef54f48b450d4692a1d:

  media: rc: ensure that uevent can be read directly after rc device register (2021-01-04 11:00:25 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git for-v5.11f

for you to fetch changes up to 38ba369ca12bad5ed0a01d6a966f865219857415:

  media: rc: fix timeout handling after switch to microsecond durations (2021-01-05 10:03:01 +0000)

----------------------------------------------------------------
Matthias Reichl (1):
      media: rc: fix timeout handling after switch to microsecond durations

 drivers/media/rc/ir-mce_kbd-decoder.c | 2 +-
 drivers/media/rc/rc-main.c            | 4 ++--
 drivers/media/rc/serial_ir.c          | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
