Return-Path: <linux-media+bounces-27350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 790FCA4C529
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92B70174C04
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 15:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA2521504F;
	Mon,  3 Mar 2025 15:24:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9982144CC;
	Mon,  3 Mar 2025 15:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741015462; cv=none; b=fbGi+LTTzbNNzHRfk/AuyFhJ0PjaJvAl19D/8kJb+YfzudI62HSndruRWC7uGtZtzh7qILnjlnX6i7W1oVl7YXwKvJWeQH8wdouuELkQkIt8wGq0YI9tmYXk3ZkgrQW/KZMoTVB0JRZTVAWmtMAwQFNjzrvuRtydZ4+X5VoR/RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741015462; c=relaxed/simple;
	bh=L9r5K4/fhByS3/3lkf7rOh8ExDYz8d7mzRGIbUen5/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Thf52YkIyLdhLRA/jtCVat6LqtPXzyg1yyujDYiL0r7IG+rQl2WMnHpkJc3SeRTVxnYOoHzcJAYVRcMZIE7if0DirVZ+Z+UXVbBtj1iSNOPkSJaBzPVtnMym8F8afl+AGG14F2yrddQI/shAav0nQTAhpH3Bex3EE8ezqwp71eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowABXXNCbycVnauIVEg--.17707S2;
	Mon, 03 Mar 2025 23:24:13 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] media: gspca: Add error logging for sq905c_command() to prevent silent failure
Date: Mon,  3 Mar 2025 23:23:55 +0800
Message-ID: <20250303152355.1897-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABXXNCbycVnauIVEg--.17707S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF4UZr1xury5Ww1UuF4rKrg_yoWfuwc_Ga
	1kCr9FgrW8Awn3Cr4Uta4Syryv93929w18uFy5KFy7Ja18Aa17Xr9Ivr4rJF1DWa4agrsr
	X3W8ZryjyanxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjO6pDUUUU
	U==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwwKA2fFj5Kr6QAAs-

Add error handling for sq905c_command() failure in sq905c_dostream().
Log debug message with gspca_dbg() to prevent silent failure.

Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/media/usb/gspca/sq905c.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/gspca/sq905c.c b/drivers/media/usb/gspca/sq905c.c
index 6ca947aef298..7bb6b24c3ed1 100644
--- a/drivers/media/usb/gspca/sq905c.c
+++ b/drivers/media/usb/gspca/sq905c.c
@@ -183,7 +183,9 @@ static void sq905c_dostream(struct work_struct *work)
 quit_stream:
 	if (gspca_dev->present) {
 		mutex_lock(&gspca_dev->usb_lock);
-		sq905c_command(gspca_dev, SQ905C_CLEAR, 0);
+		ret = sq905c_command(gspca_dev, SQ905C_CLEAR, 0);
+		if (ret)
+			gspca_dbg(gspca_dev, D_STREAM, "Clear command failed\n");
 		mutex_unlock(&gspca_dev->usb_lock);
 	}
 	kfree(buffer);
-- 
2.42.0.windows.2


