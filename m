Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 590DFF513F
	for <lists+linux-media@lfdr.de>; Fri,  8 Nov 2019 17:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbfKHQgw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Nov 2019 11:36:52 -0500
Received: from mx2.suse.de ([195.135.220.15]:37102 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726039AbfKHQgw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 Nov 2019 11:36:52 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 4DCF5B32E;
        Fri,  8 Nov 2019 16:36:51 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 0/2] media: ALSA memalloc cleanups
Date:   Fri,  8 Nov 2019 17:36:47 +0100
Message-Id: <20191108163649.32590-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

this is a couple of cleanups for media subsystem wrt ALSA memory
allocation API usages.  It's based on the recent API changes that are
found in for-next of my sound git tree for 5.5 kernel, hence these
patches need to be applied on top of it.

So, just give me ACK if they are OK, so that I can apply them.


thanks,

Takashi

===

Takashi Iwai (2):
  media: solo6x10: Remove superfluous snd_dma_continuous_data()
  media: tw686x: audio: Avoid non-standard macro usage

 drivers/media/pci/solo6x10/solo6x10-g723.c | 2 +-
 drivers/media/pci/tw686x/tw686x-audio.c    | 2 +-
 drivers/media/usb/usbtv/usbtv-audio.c      | 3 +--
 3 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.16.4

