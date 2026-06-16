Return-Path: <linux-media+bounces-65045-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bz3cFoZxMWrQjQUAu9opvQ
	(envelope-from <linux-media+bounces-65045-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 17:53:42 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD306917AB
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 17:53:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=KHjFqWQK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65045-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65045-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 209CB3108787
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D1744611C1;
	Tue, 16 Jun 2026 15:43:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B351A682B
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 15:43:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781624593; cv=none; b=PKQri8XzZpkTr1N28lAuD99FMhU9EG5KpFWaoOyVf35A2xtsATY0uRMx8jF/zTT7iKFF6b39x87I1W//WFWQnlEg+cuP+N1VOtIGBP09otXUKpSqrzyYYQBsdEeQThOQpBABPgWa+LDpGRHYwUl4HPJhkyLabnMcE2xs0fUThgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781624593; c=relaxed/simple;
	bh=bnratpTl4l8YNVK0BrtLEtPixNWEOeuGI3AWx+r0rbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mK8V2lUdFNqggM2pKgXGwlh7eLRjye/oM2GHlQ44H/2qZMX/D9Triys9Wb6/6KirKKGdL6XXyW7TVnFGvmA+RGpDSIZXY/SpbJZL8KSfjg8L4c5zODhtqpRcY9nglTxF7Q5UDMRNwffjuhymieCvms9RlbYXDew9AhyINXAQmSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KHjFqWQK; arc=none smtp.client-ip=209.85.215.175
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c8585cd8400so1586378a12.3
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 08:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781624591; x=1782229391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+MTP2Vn+ea1Dmt517zV0XY75jGYUeXA8Er0VTEC0PP8=;
        b=KHjFqWQKdiDCZYTEUZaSJWLSDvFkUZrPqOg0Hni8BAuORgtpVGSR8dZcboovoa6iig
         zj2J6fT440vX3IzF6tDJ27fPXkuKUGJclhr39PwcefKIz6Hk0DjP7MiHo98wOthvx9fG
         b9jCv8OdfuJP3DDoVmw6Yk3cIl/XHwGZ5hGfVMpqAAtID33m3kFjG/1eniKU84JDnEgK
         rG4cxWapvu8HiQ+N6dvN2zCYfHFkhBd9ZegJ8nruxM3kqx/YRNZ8cK3Rux6/XOVkW/Th
         K7y5SBupQS/P1KYdt44kajQ/ckiuFZ84fG+SYHgnec6ARlqg++2j7SjLrLLDWGpxJFgQ
         Bxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781624591; x=1782229391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+MTP2Vn+ea1Dmt517zV0XY75jGYUeXA8Er0VTEC0PP8=;
        b=mKhyy6YtWVxF3R4Y9CFt63O+V7Lzck3UNqsam++LTaR/dVIplihEZFiyIu1Q1pJh7T
         qyKFQygLH9eY0Rexb7LxTLf5wHgGxWonWNUO/G2FOO9gTE7JQcPEGqc3dPg8i3TvrqvE
         RQEqlggzvLIJjtrlNzCKDk1QK/wxCARX6lZUe0lnJt1v7J4EqHG3mvrMvadGJ0xZY/tt
         /nsxNgcZvFwuBHMDK5zmkaZ5pZHTLn8xlwDi2zAEeSdZtPo8Xr1zhqnuGmc8HMg/ajmf
         MqQPTxfR6E24DGL+mRpCLNoVyBKrRSwzGB+Dww9ak38vD8wmadtN1vGvQf6TVZihfudu
         mLEg==
X-Gm-Message-State: AOJu0YwdiQkd8/ZgexCA5rLH3si//AXNl4L9hmVx5CmZeGhtcy4c/BjG
	hnek87vPNwIO5g+rVfOhrOcS5OgLznxLSc65xP5IeJwGhFMsmEn+2talhuZ/64tq
X-Gm-Gg: Acq92OH5VH+jxXWfXzZxtpNTnLTy0cL2Smb4O3GcV8oH2Kww/emWvZAhMJpCDI1kR7D
	k8Q+vAfiTtXVvDOB96Bs7IwyesqHBQzJjq1/lGD3HkVtmUP1xRd70QIGEhA7P4LhDVHuqFbVQm7
	0r0vs2xQG7qUFZnylQgwP10apvZqSR+zwgDFdL48frH6mawkq6XIxIChkuyvLdL3s2GXswVq7fr
	ZIjwOp+L1vZqFAk9iD5yceUBUEzkX7NRP6/HHtv70ea5/SvsNirUgjjOw6AG6DvmK3D5bPWMSCi
	9mAJ9Ro333x4vTzXIr60MesKhZn5xpdVK+0yH35S7QPmLYDC9iu9iRnfGnxLEZn78LJ/+2zbuDj
	XL+Y4ZKhfYeht4G1SXKeo/F/64TWPwf7Id+ZknNEoqY02JG7QCH+m0PVw6DnxmAYcjzVpQEM92U
	EmZuh4QIB1eOu1NzmnmlII8bEm8Ri9hdfHnbQ8GfLBs6BCYXmMcg3xasMHzIeEHEM=
X-Received: by 2002:a05:6a20:ce48:b0:39c:4af6:4309 with SMTP id adf61e73a8af0-3b7e49d1001mr5024788637.12.1781624591127;
        Tue, 16 Jun 2026 08:43:11 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8665186d98sm11732485a12.16.2026.06.16.08.43.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Jun 2026 08:43:10 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v2] media: v4l2-core: Drop manual fwnode_handle_put() via scope-based cleanup
Date: Tue, 16 Jun 2026 21:13:05 +0530
Message-ID: <20260616154305.54954-1-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260616092516.46339-1-birenpandya@gmail.com>
References: <20260616092516.46339-1-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-65045-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFD306917AB

v4l2_subdev_get_fwnode_pad_1_to_1() acquires a fwnode reference and drops
it via fwnode_handle_put() before calling device_match_fwnode(). This
requires manual lifecycle management.

Simplify the function by converting the local fwnode variable to use the
__free(fwnode_handle) scope-based cleanup macro.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
Changes in v2:
- Updated the commit message to remove the "Use-After-Free" language,
  as there is no vulnerability in practice.
- Adjusted the implementation to declare `struct fwnode_handle *fwnode`
  directly at the point of initialization, rather than at the top of the
  block, conforming to recommended usage.
- Renamed the patch subject to better reflect the true nature of the change.
- Link to v1: https://lore.kernel.org/all/20260616092516.46339-1-birenpandya@gmail.com/

Hi Laurent,

My sincere apologies for the mailing list noise earlier. That duplicate 
submission was an accidental misfire while I was adjusting my `git send-email`
scripts, and I deeply apologize for the lack of versioning and threading. 
I am still getting up to speed with the subsystem's submission workflow! 
Here is the correctly formatted v2 addressing Sakari's feedback.

 drivers/media/v4l2-core/v4l2-subdev.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index e6b133ef7850..806b059410ce 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1243,7 +1243,8 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
 int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
 				      struct fwnode_endpoint *endpoint)
 {
-	struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;
+	struct fwnode_handle *fwnode __free(fwnode_handle) =
+		fwnode_graph_get_port_parent(endpoint->local_fwnode);
 	struct v4l2_subdev *sd;
 
 	if (!is_media_entity_v4l2_subdev(entity))
@@ -1251,8 +1252,6 @@ int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
 
 	sd = media_entity_to_v4l2_subdev(entity);
 
-	fwnode = fwnode_graph_get_port_parent(endpoint->local_fwnode);
-
 	if (device_match_fwnode(sd->dev, fwnode))
 		return endpoint->port;
 
-- 
2.50.1 (Apple Git-155)


