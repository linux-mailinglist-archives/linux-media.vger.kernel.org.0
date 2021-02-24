Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 071A3323FEF
	for <lists+linux-media@lfdr.de>; Wed, 24 Feb 2021 16:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235293AbhBXO2S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Feb 2021 09:28:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:59882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235324AbhBXNLR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Feb 2021 08:11:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1CAE864FA0;
        Wed, 24 Feb 2021 12:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614171327;
        bh=BMmT6/hWLV9+rdvo3ixw5fJP7Sbe3gl7300X0F+P8+A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ptx2bI/l9hBdnAq4SBx9ULPgbfcW2ByGDrSTQq0Hos6gI9m52ibZGRx8cC7VgUXpT
         PfmGWMIWTOoRxcnupDqXhq5xRL8p3OeGSwaTxwBqi9pWfZz+P+CVhu6LG2taKo/Gl4
         FjfkfhoNu6zhOZ1OkaFncrF7dEvzFhPsHxG8me1k3nmA9+2bHW84c0RK0ZrzRsGNOt
         K3nxNXyXNI1770KupfqTG9WlNXpg04p0jCXLulLi0ZiSqhlLJUfHolmaX6jK6iNGg2
         fUe+k2gj8ptURiDxhYCdSyRzL6i3hqRZ5IpKCM3U+UL5OOQ40Ew5+mz7McsIahlgbx
         CUOj1qxxm0yqg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Sean Young <sean@mess.org>,
        syzbot+6d31bf169a8265204b8d@syzkaller.appspotmail.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 10/16] media: mceusb: sanity check for prescaler value
Date:   Wed, 24 Feb 2021 07:55:07 -0500
Message-Id: <20210224125514.483935-10-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224125514.483935-1-sashal@kernel.org>
References: <20210224125514.483935-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sean Young <sean@mess.org>

[ Upstream commit 9dec0f48a75e0dadca498002d25ef4e143e60194 ]

prescaler larger than 8 would mean the carrier is at most 152Hz,
which does not make sense for IR carriers.

Reported-by: syzbot+6d31bf169a8265204b8d@syzkaller.appspotmail.com
Signed-off-by: Sean Young <sean@mess.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/rc/mceusb.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index bf7aaff3aa375..bbbbfd697f9c4 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -630,11 +630,18 @@ static void mceusb_dev_printdata(struct mceusb_dev *ir, u8 *buf, int buf_len,
 				data[0], data[1]);
 			break;
 		case MCE_RSP_EQIRCFS:
+			if (!data[0] && !data[1]) {
+				dev_dbg(dev, "%s: no carrier", inout);
+				break;
+			}
+			// prescaler should make sense
+			if (data[0] > 8)
+				break;
 			period = DIV_ROUND_CLOSEST((1U << data[0] * 2) *
 						   (data[1] + 1), 10);
 			if (!period)
 				break;
-			carrier = (1000 * 1000) / period;
+			carrier = USEC_PER_SEC / period;
 			dev_dbg(dev, "%s carrier of %u Hz (period %uus)",
 				 inout, carrier, period);
 			break;
-- 
2.27.0

