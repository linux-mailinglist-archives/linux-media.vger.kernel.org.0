Return-Path: <linux-media+bounces-53985-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NHlOruco2l2IQUAu9opvQ
	(envelope-from <linux-media+bounces-53985-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:56:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E6F1CC4D3
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6CBBC3080135
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C661F191F94;
	Sun,  1 Mar 2026 01:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvPJcBw6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B224311973;
	Sun,  1 Mar 2026 01:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329804; cv=none; b=nWseshvLJ2r8tRVWLqmRB8a+JTGhIrlIn1AVa1bNJrcYZivDpCqp1p93J1EwO/NI+x9H7v1ETmpI/vIBQaXX0O4hqs1vGiBRZNervuEtu0oiKYnvo6wRxPCp2KYsrWy+EeBjREXkWUesxnOeP/3zKPaBxcCgWeofCTyzd/hefEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329804; c=relaxed/simple;
	bh=xFQ0Ysh6tdVloh73ZaJ9AzyOJAjelfrho7qX/6MLnUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZjtNSdYcwaJoSzU+cerDFmSQIf4RoCdZha3qyxL52JX8UWjB1029P4IBJFoI7SyBNLG7pnp44p4UBjUS3s5chwwAwps/faVikqSiGwY10tpz6Nr/lzx/3z9Sv48Qrsg+tpXvb9enS9aVgnkoCpJ5G9mJOZRbT/ZkpLFGOccCQWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvPJcBw6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FD7AC19421;
	Sun,  1 Mar 2026 01:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329804;
	bh=xFQ0Ysh6tdVloh73ZaJ9AzyOJAjelfrho7qX/6MLnUw=;
	h=From:To:Cc:Subject:Date:From;
	b=cvPJcBw6TixlJ3OIEpOr0HRXHIk0gxWRROLyTSnKGjPNvFcLDxvLQ8tildoY6FJ8J
	 1EHZC4DNUK0jYrxKjaVO1LDKIxRt0VcnEI29TdkFj/n4n5dJd9ZKiGx3OP8axcMee7
	 vGCtJ0NcSxuC0CNsRos24Ye9NILlnTppd+ZU7fSSw/4WnQMIQnP/2Nx+b0FOue5Yel
	 qdywbb6o+WElZ3O7qYm0Bc/b8ByiI0ISbJcLPfKVAy4K6cKsUvGNqN+5bpWBRE7+QP
	 qAhQOuCEvvcls5dOO2m5cZenaoF1f3Zq1eYGXrM0fAlMkqmwpkNuxg8mJSfJHv7rMt
	 kvkYr8+LT6YLw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	xiaolei.wang@windriver.com
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov5647: use our own mutex for the ctrl lock" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:50:02 -0500
Message-ID: <20260301015002.1715634-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-53985-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,windriver.com:email]
X-Rspamd-Queue-Id: A8E6F1CC4D3
X-Rspamd-Action: no action

The patch below does not apply to the 5.15-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 973e42fd5d2b397bff34f0c249014902dbf65912 Mon Sep 17 00:00:00 2001
From: Xiaolei Wang <xiaolei.wang@windriver.com>
Date: Fri, 5 Dec 2025 15:19:18 +0800
Subject: [PATCH] media: i2c: ov5647: use our own mutex for the ctrl lock

__v4l2_ctrl_handler_setup() and __v4l2_ctrl_modify_range() contains an
assertion to verify that the v4l2_ctrl_handler::lock is held, as it should
only be called when the lock has already been acquired. Therefore use our
own mutex for the ctrl lock, otherwise a warning will be reported.

Fixes: 4974c2f19fd8 ("media: ov5647: Support gain, exposure and AWB controls")
Cc: stable@vger.kernel.org
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
[Sakari Ailus: Fix a minor conflict.]
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov5647.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 1041732104fa7..6285e234962e0 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -1248,6 +1248,8 @@ static int ov5647_init_controls(struct ov5647 *sensor)
 
 	v4l2_ctrl_handler_init(&sensor->ctrls, 14);
 
+	sensor->ctrls.lock = &sensor->lock;
+
 	v4l2_ctrl_new_std(&sensor->ctrls, &ov5647_ctrl_ops,
 			  V4L2_CID_AUTOGAIN, 0, 1, 1, 0);
 
-- 
2.51.0





