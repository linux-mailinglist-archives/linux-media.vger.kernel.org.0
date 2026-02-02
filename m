Return-Path: <linux-media+bounces-51952-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FGOIGkPgGmk2AIAu9opvQ
	(envelope-from <linux-media+bounces-51952-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 03:43:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D38C7EC5
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 03:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6CE7B3007F51
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 02:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4573C220F37;
	Mon,  2 Feb 2026 02:43:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18AA27453;
	Mon,  2 Feb 2026 02:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770000219; cv=none; b=I60fxK8jhaQEPlZFFKat/pHESsb5xTsUHM8zk+KQoG9pIgMTxVlGJkH1j/pDki2YOXebnW8Ox+w22bpxP5J9lyz0chBy2jxlcNTe0BoYYBJPgRTV9tyuJXoLjilpkQpoF1dEdF9y9KgiiyHxXPIr9YWoha++tkfVkqa4GcYrggA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770000219; c=relaxed/simple;
	bh=zizNSph+8zkuVHFgSG48RHeDa6NZiIO/FwjLr8Nn1NI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b9seE+wUCYo42iv6CmCXFosrxjRbAqNKVt589P/w/PgB+d+DFUKA5xmorWa1hLpL3mF73j1EJ4JM6bUhcmfiNVdYmt10woXy1qvIayFb+LWXJZv6Tswh0f+T+lXaeNo6gse2DXsW1sQBvizWRoUDKcnL69AbWxq/83VCD+wGqUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowAB3HWlSD4BpV671Bg--.2175S2;
	Mon, 02 Feb 2026 10:43:30 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] media: i2c: mt9p031: Check return value of devm_gpiod_get_optional() in mt9p031_probe()
Date: Mon,  2 Feb 2026 10:43:12 +0800
Message-Id: <20260202024312.3911800-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAB3HWlSD4BpV671Bg--.2175S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw4DXrW3Xr4UJF15tFy5Jwb_yoWDZwb_C3
	s3Xrn7X34UKrWFv3s7ZFs3ArZ7Cr48Wry8ZrWDt39IkF4UC3Z5ZFyvvr9rAr1kXF4jkFn8
	Ary7CF1fZr13GjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x0JU9XocUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51952-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[nichen@iscas.ac.cn,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:mid,iscas.ac.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 15D38C7EC5
X-Rspamd-Action: no action

The devm_gpiod_get_optional() function may return an error pointer
(ERR_PTR) in case of a genuine failure during GPIO acquisition, not just
NULL which indicates the legitimate absence of an optional GPIO.

Add an IS_ERR() check after the function call to catch such errors and
propagate them to the probe function, ensuring the driver fails to load
safely rather than proceeding with an invalid pointer.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/media/i2c/mt9p031.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
index 1500ee4db47e..ea5d43d925ff 100644
--- a/drivers/media/i2c/mt9p031.c
+++ b/drivers/media/i2c/mt9p031.c
@@ -1183,6 +1183,10 @@ static int mt9p031_probe(struct i2c_client *client)
 
 	mt9p031->reset = devm_gpiod_get_optional(&client->dev, "reset",
 						 GPIOD_OUT_HIGH);
+	if (IS_ERR(mt9p031->reset)) {
+		ret = PTR_ERR(mt9p031->reset);
+		goto done;
+	}
 
 	ret = mt9p031_clk_setup(mt9p031);
 	if (ret)
-- 
2.25.1


