Return-Path: <linux-media+bounces-30092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF94A87873
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 09:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4940D3AA475
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 07:11:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB912376EF;
	Mon, 14 Apr 2025 07:11:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0CFF237172;
	Mon, 14 Apr 2025 07:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744614675; cv=none; b=YoL2KpEX+YFSygVUCFA+vjcAGp/iiuk2C2BX23h0/ZTPAe5bToPmUOGBdx/TElHZEAMaFENSVn1RLXBiQou6KeeyCRX5ADWz6jVJRhDCjOwoSle+tP3bM6Iktm7fQBMWXL51e+pxFXd60otMIVMgKcshGNNopLRMEGCAWI3zpmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744614675; c=relaxed/simple;
	bh=7tPfO4YljEpw7kJklhNj2drCqG4KDq+vh0zUeK403dg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CokLAkNkpRYm8zjnpdUOsr9K179RjAB5OUQZLm2SWVtwO62flPZUQ0BH/gH3HHSDG1/TPVYlO0bm7+uEAz37V46qhm640c/IeRi1vK/19Nr18b5fH8jGgDItOSQTjY2CFzvJNMgdF9tmZ5HX74NST1axPYfmfeqsO58aLKcDHXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowABHhQ0Ktfxn4NPmCA--.19073S2;
	Mon, 14 Apr 2025 15:11:08 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH RESEND] media: gspca: Add error handling for stv06xx_read_sensor()
Date: Mon, 14 Apr 2025 15:10:46 +0800
Message-ID: <20250414071046.2192-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABHhQ0Ktfxn4NPmCA--.19073S2
X-Coremail-Antispam: 1UD129KBjvJXoWrtw4xKrykGFy5tFW8AF18Krg_yoW8JF4rpF
	WfWryFv3yjya17WF1UJw1v93W5t3ySyFW5Cr9Fqwn5Zw17JrsFvFyFy3W0vws7GF9xC3Wf
	trn5KayUWas7AaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUcBMtUUU
	UU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAgMA2f8nB5YwQAAsL

In hdcs_init(), the return value of stv06xx_read_sensor() needs to be
checked. A proper implementation can be found in vv6410_dump(). Add a
check in loop condition and propergate error code to fix this issue.

Fixes: 4c98834addfe ("V4L/DVB (10048): gspca - stv06xx: New subdriver.")
Cc: stable@vger.kernel.org # v2.6+
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c b/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
index 5a47dcbf1c8e..303b055fefea 100644
--- a/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
+++ b/drivers/media/usb/gspca/stv06xx/stv06xx_hdcs.c
@@ -520,12 +520,13 @@ static int hdcs_init(struct sd *sd)
 static int hdcs_dump(struct sd *sd)
 {
 	u16 reg, val;
+	int err = 0;
 
 	pr_info("Dumping sensor registers:\n");
 
-	for (reg = HDCS_IDENT; reg <= HDCS_ROWEXPH; reg++) {
-		stv06xx_read_sensor(sd, reg, &val);
+	for (reg = HDCS_IDENT; reg <= HDCS_ROWEXPH && !err; reg++) {
+		err = stv06xx_read_sensor(sd, reg, &val);
 		pr_info("reg 0x%02x = 0x%02x\n", reg, val);
 	}
-	return 0;
+	return (err < 0) ? err : 0;
 }
-- 
2.42.0.windows.2


