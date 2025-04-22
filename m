Return-Path: <linux-media+bounces-30675-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B24A95CD2
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 06:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC0503A2DA6
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 04:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E2719FA93;
	Tue, 22 Apr 2025 04:17:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B012E273FE;
	Tue, 22 Apr 2025 04:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745295470; cv=none; b=oU+DZyxudG6EmsNu4qDl/dzE7LkiVchwogvc00ece+JayzLkcFNq1cN9IFLkTK5aPLF2b9yTB5aQ3HRutvaleTPAhE2/fBewAMPUGwFFPqznttUMj/I3B8GArjpHvZECGjqhw+R7sCTlmSMoQ5PUNWTCwcyxq94sAA6mkSrLs1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745295470; c=relaxed/simple;
	bh=ILfg5pyctVPHtkSPD5Gd/QGaqHzm5kjfCvQdn9D5FAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HBOmLVahYqkiJr3YcdjQrx2WB7kHkkR0IyPpe2II5Zqy1gYBjrw1a8NESHTqFMeexLKfSLQZXwkOYFYTkYVco7BMzvppUiJCylWyrIWBfz+Tb8T74P5a/IsRR3VWyiYlPHlFQgb/XYxD2wg+HYiFi7esNbkmIftUAXMmHlLVYwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowADXEQpnGAdoZj4lCw--.30010S2;
	Tue, 22 Apr 2025 12:17:45 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH RESEND] media: dst_ca: Add error handling for dst_comm_init()
Date: Tue, 22 Apr 2025 12:17:21 +0800
Message-ID: <20250422041721.2228-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowADXEQpnGAdoZj4lCw--.30010S2
X-Coremail-Antispam: 1UD129KBjvJXoW7GryUJrykJF4kZr43GrWrGrg_yoW8Jr4Dpa
	yqy39IkF98Jw4UX3srA348uFy5GanYka43Ka4Skw13Z3Z8JFsFvr4jq342gr4jgrW7Zay3
	JF15WryUG3WkCw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1lc2xSY4AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUUxwIDUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAUAA2gG6EzI+AAAsw

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


