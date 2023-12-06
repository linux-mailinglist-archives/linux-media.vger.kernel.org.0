Return-Path: <linux-media+bounces-1777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C86807B76
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 23:38:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3EE51F219D7
	for <lists+linux-media@lfdr.de>; Wed,  6 Dec 2023 22:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C229E47F40;
	Wed,  6 Dec 2023 22:38:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
X-Greylist: delayed 250 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 06 Dec 2023 14:38:36 PST
Received: from smtprelay03.ispgateway.de (smtprelay03.ispgateway.de [80.67.31.30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2093DD59;
	Wed,  6 Dec 2023 14:38:36 -0800 (PST)
Received: from [92.206.191.209] (helo=note-book.lan)
	by smtprelay03.ispgateway.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.1)
	(envelope-from <git@apitzsch.eu>)
	id 1rB0TH-0007Ur-0d;
	Wed, 06 Dec 2023 23:34:23 +0100
From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Subject: [PATCH v4 0/4] media: i2c: imx214: Extend with sensor size and
 firmware information
Date: Wed, 06 Dec 2023 23:33:54 +0100
Message-Id: <20231206-imx214-v4-0-7ef604b01dcb@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIANL2cGUC/23MvQ6CMBSG4Vshna3pXwo4eR/GgbbnSAeBtNigh
 Hu3MBgNDh2+5jzvTCIED5GcipkESD76vstDHQpi26a7AfUubyKYkDw/6u+T4IrqyipZgUHDLMn
 HQwD00xa6XPNufRz78Ny6ia+/u0TilFEjJXJjHEeL52bw4yva9ggPskaS+IbVB4oMdd1UaErJn
 IY9lP+hzNA6ZbAssdY1+4XLsrwBvZLHGhABAAA=
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-Df-Sender: YW5kcmVAYXBpdHpzY2guZXU=
X-Spam-Level: *

Add the effective and active sensor sizes and add functionality to read
rotation and orientation from device trees.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
Changes in v4:
- Add r-b by Kieran to patch 1/4
- Link to v3: https://lore.kernel.org/r/20231028-imx214-v3-0-cd4bf77f9690@apitzsch.eu

Changes in v3:
- Squash patch 5/5 with patch 2/5
- Link to v2: https://lore.kernel.org/r/20231028-imx214-v2-0-69a8fb730d6e@apitzsch.eu

Changes in v2:
- Use integer representation for default exposure (Kieran)
- Replace dev_err_probe() by dev_err()
- Increase number of pre-allocated control slots (Jacopo)
- Fix typo in commit message (Jacopo)
- Add r-b tags
- Add patch to fix ctrls init error handling
- Link to v1: https://lore.kernel.org/r/20231023-imx214-v1-0-b33f1bbd1fcf@apitzsch.eu

---
André Apitzsch (4):
      media: i2c: imx214: Explain some magic numbers
      media: i2c: imx214: Move controls init to separate function
      media: i2c: imx214: Read orientation and rotation from system firmware
      media: i2c: imx214: Add sensor's pixel matrix size

 drivers/media/i2c/imx214.c | 175 +++++++++++++++++++++++++++++++--------------
 1 file changed, 120 insertions(+), 55 deletions(-)
---
base-commit: 577a4ee0b96fb043c9cf4a533c550ff587e526cf
change-id: 20231023-imx214-68c438ebfb0c

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>


