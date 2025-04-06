Return-Path: <linux-media+bounces-29436-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F98A7CD79
	for <lists+linux-media@lfdr.de>; Sun,  6 Apr 2025 11:26:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2A3516F8C0
	for <lists+linux-media@lfdr.de>; Sun,  6 Apr 2025 09:26:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E2291A23BB;
	Sun,  6 Apr 2025 09:26:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E4F154C17;
	Sun,  6 Apr 2025 09:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743931607; cv=none; b=U3lQqcvBZeQicB/GbTji3mtfErgOQBHKeZbGLA1GGNsuRHtJsL5jvfEXeh0XuHKbzCFVjnmRSjLM0ucMQJWpzPgVb3xixM6nkHwHiYmc0Hvk3kGFZGwCrrA4t76DYilSOhq0/M6wEK2sxH9h49VfvDa4N05gVxMiD5YV0thrU28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743931607; c=relaxed/simple;
	bh=ILfg5pyctVPHtkSPD5Gd/QGaqHzm5kjfCvQdn9D5FAc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oIprWK5acBQBciHsII6R5Xz98enEs/F0u9keEXVD4gjOeeFXGAqDYHgpF09ZX6uSUvyWO0XJZIyxRvOb0tDTyQLBpi1InF85OpbeC14usF5MBHRHwcnsfvANl0kj4w+UH9ikf9dnHo9YlEk0/f3UcvBHP4ONcd7Iw0DadGpD/QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [221.222.48.127])
	by APP-05 (Coremail) with SMTP id zQCowAC39AzOSPJnlxOPBg--.11003S2;
	Sun, 06 Apr 2025 17:26:40 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] media: dst_ca: Add error handling for dst_comm_init()
Date: Sun,  6 Apr 2025 17:26:18 +0800
Message-ID: <20250406092618.3123-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAC39AzOSPJnlxOPBg--.11003S2
X-Coremail-Antispam: 1UD129KBjvJXoW7GryUJrykJF4kZr43GrWrGrg_yoW8Jr4Dpa
	yqy39IkF98Jw4UX3srA348uFy5GanYka43Ka4Skw13Z3Z8JFsFvr4jq342gr4jgrW7Zay3
	JF15WryUG3WkCw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrV
	AFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCI
	c40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267
	AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_
	Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjO6pD
	UUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAYEA2fyGc1N9AAAs1

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


