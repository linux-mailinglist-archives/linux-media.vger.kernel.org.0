Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C162730A355
	for <lists+linux-media@lfdr.de>; Mon,  1 Feb 2021 09:34:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232480AbhBAIdd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 03:33:33 -0500
Received: from mx2.suse.de ([195.135.220.15]:57284 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230080AbhBAIdc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Feb 2021 03:33:32 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 812E6ACB7;
        Mon,  1 Feb 2021 08:32:50 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stefan Seyfried <seife+kernel@b1-systems.com>,
        Robert Foss <robert.foss@linaro.org>,
        Sean Young <sean@mess.org>
Subject: [PATCH v2 0/2] media: dvb-usb: Fix UAF and memory leaks
Date:   Mon,  1 Feb 2021 09:32:45 +0100
Message-Id: <20210201083247.10760-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

here is a revised patch set to address the use-after-free at
disconnecting a USB DVB device that was recently reported on openSUSE
Bugzilla.  The bug itself seems to be a long-standing one, and I
spotted another memory leak there, which is covered in the first
patch.

This revision addressed the double-free bug Sean pointed.

I added Robert's R-b tag only to patch#2, as patch#1 differs from the
v1 significantly.


thanks,

Takashi

===

Takashi Iwai (2):
  media: dvb-usb: Fix memory leak at error in dvb_usb_device_init()
  media: dvb-usb: Fix use-after-free access

 drivers/media/usb/dvb-usb/dvb-usb-init.c | 70 +++++++++++++++---------
 1 file changed, 44 insertions(+), 26 deletions(-)

-- 
2.26.2

