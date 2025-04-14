Return-Path: <linux-media+bounces-30091-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B55A877D3
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 08:21:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 794043AFF8A
	for <lists+linux-media@lfdr.de>; Mon, 14 Apr 2025 06:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 492E51A725A;
	Mon, 14 Apr 2025 06:20:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A68148832;
	Mon, 14 Apr 2025 06:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744611649; cv=none; b=Gw2yKMqYDq9lhL6JDJ7S2jt562KHxxXiLaVvWVVrbf8scS4gTk4Fb6QfPjuOtfZ8xW1BMxpLuqtRrzREELxMbnWsA9yCIFB1poSIB54LzB04rVe5Su5X5lFxCgpKsoK4DnYX1Efp+T7V/9du5im7wnMU35AfPLORVQkRMVWpsyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744611649; c=relaxed/simple;
	bh=ILfg5pyctVPHtkSPD5Gd/QGaqHzm5kjfCvQdn9D5FAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lNC+big/UG3mVqCtO9vhFGpkYV0uxjz4RdJVUlvzrq+MyUF8JVlw80daE23wOcgdfObfIBQ8cXlOd8s1ycH9LPrvuXvwzTkBGHwdmVyo6ni07LfIe+zeSOG9NjtoLVlZcZnVOyjkeZkpN+8QbKuGbeI1MyWGkzIkWcfLXZ+TB7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowABnpQ03qfxnkijlCA--.684S2;
	Mon, 14 Apr 2025 14:20:41 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH RESEND] media: dst_ca: Add error handling for dst_comm_init()
Date: Mon, 14 Apr 2025 14:20:11 +0800
Message-ID: <20250414062012.2026-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABnpQ03qfxnkijlCA--.684S2
X-Coremail-Antispam: 1UD129KBjvJXoW7GryUJrykJF4kZr43GrWrGrg_yoW8Jr4Dpa
	yqy39IkF98Jw4UX3srA348uFy5GanYka43Ka4Skw13Z3Z8JFsFvr4jq342gr4jgrW7Zay3
	JF15WryUG3WkCw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUUbAw7UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgwMA2f8nCQemQABsg

The function dst_ci_command() calls the function dst_comm_init()
but does not handle the error if the init fails. A proper implementation
can be found in dst_command() in /source/drivers/media/pci/bt8xx/dst.c.

Add error handling to the dst_comm_init(). Print an error message via
dprintk(), and jump to the 'error' label if the function fails.

Fixes: 50b215a05878 ("[PATCH] dvb: DST: reorganize Twinhan DST driver to support CI")
Cc: stable@vger.kernel.org # v2.6+
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/media/pci/bt8xx/dst_ca.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/bt8xx/dst_ca.c b/drivers/media/pci/bt8xx/dst_ca.c
index a9cc6e7a57f9..a743f7653fdd 100644
--- a/drivers/media/pci/bt8xx/dst_ca.c
+++ b/drivers/media/pci/bt8xx/dst_ca.c
@@ -66,7 +66,10 @@ static int dst_ci_command(struct dst_state* state, u8 * data, u8 *ca_string, u8
 	u8 reply;
 
 	mutex_lock(&state->dst_mutex);
-	dst_comm_init(state);
+	if (dst_comm_init(state) < 0) {
+		dprintk(verbose, DST_CA_ERROR, 1, "DST initialization failed.");
+		goto error;
+	}
 	msleep(65);
 
 	if (write_dst(state, data, len)) {
-- 
2.42.0.windows.2


