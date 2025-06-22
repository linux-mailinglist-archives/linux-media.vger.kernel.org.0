Return-Path: <linux-media+bounces-35544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 709A1AE305B
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 16:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B61113B1054
	for <lists+linux-media@lfdr.de>; Sun, 22 Jun 2025 14:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748321E7C11;
	Sun, 22 Jun 2025 14:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="Y9nLDICP"
X-Original-To: linux-media@vger.kernel.org
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A2781E;
	Sun, 22 Jun 2025 14:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750602021; cv=none; b=KFciNB7nTBhcU1zXLPN/VEEGaikVBRTFDOPNPRXttuRmactaTPsYbWpihRkV2s0v301Tvt7gdG3bkDNkx4UHUQ5+KgHr8vQtRX3TqNcb4HHuxidwMcaNjyPrfqdu/zkYCZxOxX4S9a+EAGvlU3qzH7kvFvhZPx1SCBWnUAj9LVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750602021; c=relaxed/simple;
	bh=OecXO9sxW7kdd7N1UI9WqZ+5Y9lT/zczJclspDH9wRc=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=PQKSaDNwCBTtmV46WZRdTZIiBz/4Co+W7YTOvOl9i3XBlu0GaoV7K9QuoVcf3aXMsjhHoeWAbx2ZiETJPPGwEuqgBzAiF8BiVqe7Hcx2OFGeqOT/N8rUrVweZUzZ3pCb8RBy9d0uioflqk2DaID97zV0D6p1JNGa+9GIZ20B74s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=Y9nLDICP; arc=none smtp.client-ip=43.163.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1750602008;
	bh=UaqXSnUq1XNbR2XOtzJYMb4cM/e4/INfRvb9Azy95NM=;
	h=From:To:Cc:Subject:Date;
	b=Y9nLDICP4u7uXuX5lkF99qLxFtRqprM3KO0DYR3LXlXjOi/ZKpjzOmKF1R8ocqq9u
	 R58z0S+phZcK8/7lNv79yjW1v1CM1NJ6R8Y7qptxJ/eGSVPtkpoZZ61bcSETV7BdTR
	 twF07jq9e2otQYzLAG81DQGQO/2ExViCFZ7FnUzQ=
Received: from KernelDevBox.byted.org ([115.190.40.10])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id 4ED2EA2B; Sun, 22 Jun 2025 22:19:45 +0800
X-QQ-mid: xmsmtpt1750601985tczxv4l6s
Message-ID: <tencent_1CC2EFA6BE166A2B0ACCD54358210D955B05@qq.com>
X-QQ-XMAILINFO: NdJjTjI40ejMvuasMn5y0tZ7UP03P80e/EBGCoyDycU9U6d+CLWHSjWkVqACHO
	 tW029Zv1kWfJbR6vfJElXZUJymhPtZmOozg7SCDnUIyTMkJ+hWqBsgCoYczaIm3v58Yc6EncYubS
	 LOePCM73CdyePaC4gHSqcvcCJVw8NvjBOGbIpcLaeJjheSCNJR6r7fAaMx0W93U2LfiryuLbDPAl
	 tpLLEi0EvFOUofQH5LMjMeeuqLDwRL7IgO8V6i/u+5X82SIV2pFtSnyw2ewD4J+lIqG4GmA8tzMM
	 6ZJOAOJ745ISdVXSvZNFEMsFYnngxzzhEEsrXSP58N+CpCZckrRFESD7ZvkuM7PbaeJzMWjXKA3f
	 j7KnPTkfyBzw+LHGR9PglX80XsKP0TrsUU7qZ3JFycM3HKNBGyQF/Uq7g1CQvmYxKhQ0PmtaOzmv
	 kpXOlwnFkPTDfcYqchNG6hdQfD1qm203+oiifL6a97QdnpSnIPFcM+6Nxh1WiO9P3sQAUVuIGcAB
	 BZYSYm/ANWJcK6RlV9SjVtLOh8V/o1SQSF0Szmm1mOAJDh5qbBCJDNMzPxpQZDSpGeX8fdBTb8Nn
	 PcgBJnVgkK7OqXlDSqtuIpB2EX23Ue4ImX87MpOJtlvjaajJR3yTJOn39EnATmOSaGZItwaqluQy
	 FLZABZCzlIacVEr5rVwgN56QfxTdezg4KSaup9ArU4AUgMqAMTCh4Kvc691DKtntsd7AL+439XH7
	 OoJyIAMeGWgR717umeG3gq/zYqLobxjoLsh36qmeyEZ7MnRaY24SWq0Z5eOiODUvdVqOWwtr8Xq3
	 lO+BbunFj5fUHSraAO/qsi/HbHBHkFN51PVkhrR67WiGATOVTnhlU01kMA3wZWPpOPEd3NN9hzsp
	 1S+s7DbcJAYvBfo1bWM6nxvcRt9GTwhQoW1SjhnydQKNnXzPWcafALtdiPFqv0MFTwWXOoHwhgCi
	 AnFTf698s0Dion+VuJxx6RRUSMx/gArI7ufKZcfNouOkND3cWEy819icSXn3oK
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: jacopo@jmondi.org
Cc: mchehab@kernel.org,
	u.kleine-koenig@pengutronix.de,
	hverkuil@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhang Shurong <zhang_shurong@foxmail.com>
Subject: [PATCH] media: rj54n1cb0c: Fix memleak in rj54n1_probe()
Date: Sun, 22 Jun 2025 22:19:36 +0800
X-OQ-MSGID: <20250622141936.144333-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rj54n1_probe() won't clean all the allocated resources in fail
path, which may causes the memleaks. Add v4l2_ctrl_handler_free() to
prevent memleak.

Fixes: f187352dcd45 ("media: i2c: Copy rj54n1cb0c soc_camera sensor driver")
Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
 drivers/media/i2c/rj54n1cb0c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
index b7ca39f63dba..b788c7cec5f9 100644
--- a/drivers/media/i2c/rj54n1cb0c.c
+++ b/drivers/media/i2c/rj54n1cb0c.c
@@ -1331,6 +1331,7 @@ static int rj54n1_probe(struct i2c_client *client)
 			V4L2_CID_AUTO_WHITE_BALANCE, 0, 1, 1, 1);
 	rj54n1->subdev.ctrl_handler = &rj54n1->hdl;
 	if (rj54n1->hdl.error)
+		v4l2_ctrl_handler_free(&rj54n1->hdl);
 		return rj54n1->hdl.error;
 
 	rj54n1->clk_div		= clk_div;
-- 
2.30.2


