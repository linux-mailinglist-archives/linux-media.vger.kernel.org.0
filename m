Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0100418D24D
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2020 16:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgCTPCX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Mar 2020 11:02:23 -0400
Received: from gofer.mess.org ([88.97.38.141]:59547 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726773AbgCTPCX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Mar 2020 11:02:23 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 17A72C635F; Fri, 20 Mar 2020 15:02:22 +0000 (GMT)
Date:   Fri, 20 Mar 2020 15:02:21 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Cc:     Takashi Iwai <tiwai@suse.de>
Subject: [GIT PULL FOR v5.7] snprintf fixes
Message-ID: <20200320150221.GA22904@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Here are some last minutes fixes for v5.7.

Thanks
Sean

The following changes since commit 4b508ed16acac15f4a762d5e10ed8d64a7ac3fb1:

  media: allegro: create new struct for channel parameters (2020-03-20 09:28:56 +0100)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git for-v5.7c

for you to fetch changes up to cff319e4df24cf90bbf011de811639b7ecd043c4:

  media: siano: Use scnprintf() for avoiding potential buffer overflow (2020-03-20 14:46:06 +0000)

----------------------------------------------------------------
Takashi Iwai (2):
      media: rc: Use scnprintf() for avoiding potential buffer overflow
      media: siano: Use scnprintf() for avoiding potential buffer overflow

 drivers/media/common/siano/smsdvb-debugfs.c | 214 ++++++++++++++--------------
 drivers/media/rc/nuvoton-cir.c              |   4 +-
 2 files changed, 112 insertions(+), 106 deletions(-)
