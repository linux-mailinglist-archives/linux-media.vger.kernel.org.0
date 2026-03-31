Return-Path: <linux-media+bounces-57789-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ8JOfTLy2luLwYAu9opvQ
	(envelope-from <linux-media+bounces-57789-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 15:28:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8F836A401
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 15:28:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D94D30C58A0
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 13:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568B43E6DDA;
	Tue, 31 Mar 2026 13:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="N/HqkTDi"
X-Original-To: linux-media@vger.kernel.org
Received: from out203-205-221-235.mail.qq.com (out203-205-221-235.mail.qq.com [203.205.221.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6365B3DDDDF;
	Tue, 31 Mar 2026 13:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774963256; cv=none; b=FDU/Rvzr9JDdNuXcddnC/zVpK2ewJ0oJRBnyUDbD1BxmwfRFaZVJ4y7xcf1U/SEDRw2/7nvH6Mpius2nH9vSk9DpDwm6FUhS5hrflQ3Hl98FwvryuiZSAJ6yk70s/YtHI0+xEV+GShGFvAZR3VVllJ//3XoZn0jjD/xUvjIu1OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774963256; c=relaxed/simple;
	bh=LrKWqSQDFqpnLRsyb6yALY2MY9iFarM+rDX6OhXrGcI=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=IlP1TufalewQnUV93dIA9cLUm5N7imT89RBnq00BlqTYyKjjZOCp+MWpclJW+/+CS+VSrmen2uFdFcx3bVrcTsg2Cq1YnG+njsCt2LsO3U9BFAWyViEendJXuWnNlVL+GNcDYeRxk/FBs+oxWOMIso7aBLgr/PP4gHvVS82j3gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=N/HqkTDi; arc=none smtp.client-ip=203.205.221.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774963245; bh=wtX/bQHYY78cVU+LpOoIXy6gCReiho5XD9bs0FEkWIs=;
	h=From:To:Cc:Subject:Date;
	b=N/HqkTDimAKlles65/N6RJVviwv6yL34ogp9VAqfsr6wS9M819nhtehDR/3a7dkYV
	 ncgK/QkS44JuBQWFCq2ew00PXT3mvhuPPBpiohEB+eMXts3pRnTQF7fUqIntNcokiA
	 C/P1Mn85WBbqfO+LEqgFmy5iC9BqdML9/OfcNf4Q=
Received: from LAPTOP-KQCD4QBN.localdomain ([123.121.145.48])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 52A3BCE5; Tue, 31 Mar 2026 21:20:42 +0800
X-QQ-mid: xmsmtpt1774963242tqd34xl6e
Message-ID: <tencent_F39F0BC7671F8B898AC622B86E21C4C75507@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLjV/k73kKnFv4Hux2soFqEOz268HGLCJ3WquB2tuRbF7VVC6TFq
	 K3oaVpj9AJ81rxRzkg4/+50p07BtEqA3DtWm84sQKVc7/xnauJWdPRu7wtNr1X9ceRdV9XZFK5D6
	 xmFIKr4bI13KMyji9DpXUpSLgwtGLY8OcynoU5PRGVVZXNv20FwJtje1DP9Noi63/FCNTlG/7nT6
	 o4hCrxuZ93HvJrfWHHzrgbXLR7ytOZ6pg5lJZh7X1hsFLMEIXFaWFfxcRrNjEHjS3+Wn06jyE6lX
	 XxRNn7BCYS/WZbGdbzpeWKztfmY/yR+/0fkC/7qnKvO2Ldd4Nx2JAmy35niZo0B/8CdL7Ag+0I37
	 D7e1baAen+4xl7lta0pXOFdkJSqPZTHhU5mt6TNKAhBUe3bDJuox4zRLO0T88IpCfQhqoFGZC85f
	 TrcfDPsa68dc0c/21bHEw/eJxWDBdK22KmMpiY799SuauKSdX4xXCRGQ2TSFdJqbJjMEPmGyR4l4
	 98n0OAxFwUDg3bHtyVJQcFMcN3c0qAiPdOSU9s+WH/CL9xFyuGDUi5IH/cuk4W209Dkwge7Sx/mP
	 dYCDfOQfAViR3SkYvWOoLUxX/GRMcT0OxMQn0ij6SmVsBx0AyO2lwmGKau+v1YsnK6pxLRDYbFdI
	 gGP0ThjF9WjGcjfmMfXWFv1kM97WfhiHE3U27C0KkieQn2gIqqeUVhmrzoRnukd4vHYXWiQn+eO9
	 zva3fOjuWKuzro3gHOuqNa7TcZ7GsPw2mQUhpNXVlL1Ksx5aMs8vLJUGQM3tAoHWCnYa6a0hMt7g
	 U1UC3LKsyRu6nrZmX2OApFmKd9o3DfEIsAPSetKm+2wCIyGR5I1YyhnU7gMNXHOfGtakI2huO+g/
	 iTBuVTvy99ggCytlRUn0LAqbdzPG/ZL5jFYj5JXihF7HRGy0oF+g7BSCvMWi9eIc/iFbvVBFfNC5
	 FTgWnGdWiHaa8amURKMKOoh+Z3gG+vq0nxt1YtlSYHPjuxq682juq8JFEpn3En7zOfcUUU8fd0cL
	 iXbZkCB3yfRbXQ5aCBmn++DWi9BlS8S/b8Yb84a4H5MpdZK+4LTs5cd/y7iTk=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Wenyuan Li <2063309626@qq.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gszhai@bjtu.edu.cn,
	25125332@bjtu.edu.cn,
	25125283@bjtu.edu.cn,
	23120469@bjtu.edu.cn,
	Wenyuan Li <2063309626@qq.com>
Subject: [PATCH] media: i2c: upd64031a: add error handling for I2C read
Date: Tue, 31 Mar 2026 21:20:41 +0800
X-OQ-MSGID: <20260331132041.15320-1-2063309626@qq.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qq.com,quarantine];
	R_DKIM_ALLOW(-0.20)[qq.com:s=s201512];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,bjtu.edu.cn,qq.com];
	TAGGED_FROM(0.00)[bounces-57789-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qq.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[qq.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[2063309626@qq.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qq.com:dkim,qq.com:email,qq.com:mid]
X-Rspamd-Queue-Id: 7E8F836A401
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In upd64031a_read(), i2c_master_recv() is called without checking
its return value. If the I2C read fails, the function proceeds to
return invalid data from the buffer.

Add proper error checking:
- Check if all 2 bytes were read successfully
- Log the error with %pe format
- Return 0xff (the same as invalid register) on error

Signed-off-by: Wenyuan Li <2063309626@qq.com>
---
 drivers/media/i2c/upd64031a.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/upd64031a.c b/drivers/media/i2c/upd64031a.c
index a178af46e695..ec9179cf9b69 100644
--- a/drivers/media/i2c/upd64031a.c
+++ b/drivers/media/i2c/upd64031a.c
@@ -73,10 +73,19 @@ static u8 upd64031a_read(struct v4l2_subdev *sd, u8 reg)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	u8 buf[2];
+	int ret;
 
 	if (reg >= sizeof(buf))
 		return 0xff;
-	i2c_master_recv(client, buf, 2);
+
+	ret = i2c_master_recv(client, buf, 2);
+	if (ret != sizeof(buf)) {
+		int err = ret < 0 ? ret : -EIO;
+
+		v4l2_err(sd, "I2C read failed: %pe\n", ERR_PTR(err));
+		return 0xff;
+	}
+
 	return buf[reg];
 }
 
-- 
2.43.0


