Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56B832FCE75
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387711AbhATKma (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:42:30 -0500
Received: from mx2.suse.de ([195.135.220.15]:56358 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732965AbhATKVn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 05:21:43 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 97B8BAAAE;
        Wed, 20 Jan 2021 10:21:00 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stefan Seyfried <seife+kernel@b1-systems.com>
Subject: [PATCH 0/2] media: dvb-usb: Fix UAF and memory leaks
Date:   Wed, 20 Jan 2021 11:20:55 +0100
Message-Id: <20210120102057.21143-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

here is a patch set to address the use-after-free at disconnecting
a USB DVB device that was recently reported on openSUSE Bugzilla.
The bug itself seems to be a long-standing one, and I spotted
another memory leak there, which is covered in the first patch.


Takashi

===

Takashi Iwai (2):
  media: dvb-usb: Fix memory leak at error in dvb_usb_device_init()
  media: dvb-usb: Fix use-after-free access

 drivers/media/usb/dvb-usb/dvb-usb-init.c | 41 +++++++++++++++---------
 1 file changed, 25 insertions(+), 16 deletions(-)

-- 
2.26.2

