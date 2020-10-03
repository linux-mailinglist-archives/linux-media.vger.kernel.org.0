Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88D4D28228F
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 10:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbgJCImM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 04:42:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:37442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725763AbgJCImB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 3 Oct 2020 04:42:01 -0400
Received: from mail.kernel.org (ip5f5ad5cf.dynamic.kabel-deutschland.de [95.90.213.207])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8577220738;
        Sat,  3 Oct 2020 08:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601714520;
        bh=q8u1UlvPfmsV6VIf1D4oal2zRtzy+wplm1IJN2QmTek=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E7N/nYLrhXEkOBVgW/m9aa93OcajQyNDd8e7b+ZSB2sbzh3bXhOxTp8q1f/IbRD6W
         wHpC9gwYsREJah1s9qj9a0bPM4yD48G+KM8VNrAWvHA74gMFL2I71ArMkzqqHcG87z
         h59jDkU5AtMwcL9NKMYwDjNtgbFPI8P437LcCsSw=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kOd77-0002Iv-Vs; Sat, 03 Oct 2020 10:41:57 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] media: siano: rename a duplicated card string
Date:   Sat,  3 Oct 2020 10:41:55 +0200
Message-Id: <210191dd5314f26b062fed3a47d108a0e4f53d18.1601714147.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <6b90346919d42ffc7c3ad283bfca2825b238147a.1601714147.git.mchehab+huawei@kernel.org>
References: <6b90346919d42ffc7c3ad283bfca2825b238147a.1601714147.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are two different variants for Hauppauge WinTV MiniCard:

	[SMS1XXX_BOARD_HAUPPAUGE_TIGER_MINICARD] = {
		.name	= "Hauppauge WinTV MiniCard",
		.type	= SMS_NOVA_B0,
		.fw[DEVICE_MODE_DVBT_BDA] = SMS_FW_DVBT_HCW_55XXX,
		.default_mode = DEVICE_MODE_DVBT_BDA,
		.lna_ctrl  = 29,
		.board_cfg.foreign_lna0_ctrl = 29,
		.rf_switch = 17,
		.board_cfg.rf_switch_uhf = 17,
	},
	[SMS1XXX_BOARD_HAUPPAUGE_TIGER_MINICARD_R2] = {
		.name	= "Hauppauge WinTV MiniCard Rev 2",
		.type	= SMS_NOVA_B0,
		.fw[DEVICE_MODE_DVBT_BDA] = SMS_FW_DVBT_HCW_55XXX,
		.default_mode = DEVICE_MODE_DVBT_BDA,
		.lna_ctrl  = -1,
	},

As it can be seen, the RF part of the definitions are different.

So, better to use different names in order to distinguish
between them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/media/siano-cardlist.rst | 2 +-
 drivers/media/common/siano/sms-cards.c             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/media/siano-cardlist.rst b/Documentation/admin-guide/media/siano-cardlist.rst
index d387c04d753c..bb731a953878 100644
--- a/Documentation/admin-guide/media/siano-cardlist.rst
+++ b/Documentation/admin-guide/media/siano-cardlist.rst
@@ -20,7 +20,7 @@ Siano cards list
      - 2040:1801
    * - Hauppauge WinTV MiniCard
      - 2040:2000, 2040:200a, 2040:2010, 2040:2011, 2040:2019
-   * - Hauppauge WinTV MiniCard
+   * - Hauppauge WinTV MiniCard Rev 2
      - 2040:2009
    * - Hauppauge WinTV MiniStick
      - 2040:5500, 2040:5510, 2040:5520, 2040:5530, 2040:5580, 2040:5590, 2040:b900, 2040:b910, 2040:b980, 2040:b990, 2040:c000, 2040:c010, 2040:c080, 2040:c090, 2040:c0a0, 2040:f5a0
diff --git a/drivers/media/common/siano/sms-cards.c b/drivers/media/common/siano/sms-cards.c
index e67ee3d55488..d4a116ab6c88 100644
--- a/drivers/media/common/siano/sms-cards.c
+++ b/drivers/media/common/siano/sms-cards.c
@@ -79,7 +79,7 @@ static struct sms_board sms_boards[] = {
 		.board_cfg.rf_switch_uhf = 17,
 	},
 	[SMS1XXX_BOARD_HAUPPAUGE_TIGER_MINICARD_R2] = {
-		.name	= "Hauppauge WinTV MiniCard",
+		.name	= "Hauppauge WinTV MiniCard Rev 2",
 		.type	= SMS_NOVA_B0,
 		.fw[DEVICE_MODE_DVBT_BDA] = SMS_FW_DVBT_HCW_55XXX,
 		.default_mode = DEVICE_MODE_DVBT_BDA,
-- 
2.26.2

