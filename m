Return-Path: <linux-media+bounces-65253-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QyE4Auz3NGr3lQYAu9opvQ
	(envelope-from <linux-media+bounces-65253-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 10:03:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BF26A47FD
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 10:03:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GNf2Q65z;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65253-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65253-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 901093021674
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 08:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE1935C1B1;
	Fri, 19 Jun 2026 08:03:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A96330678
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 08:03:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781856232; cv=none; b=DqHX1THWl1ADPnAlBx0/pLvcr5Oibxlac0hpL6gVoRMYM+TxUT2LVkG76tCYGPAxwAy7hD2jBQpDEHZ3vBvTGg05jS3RO9hyhiCHO9YlM/kWPgUijPzH41cd9bAynLEIB+2AsFiJlnI0aQaqexzjzBt5B51E22zdqR82aVNgu9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781856232; c=relaxed/simple;
	bh=rTM2wJ+Ucro+593hHhDOVYIT7BQvk/o4boHz7XGpDoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oMaXjaOhHm2MiFgMeJYPh7n+4IJbFrXy/Y0pi0sM0Fu4ffHMXwn952PXb+JkIGWqiIt2fyLsw/QFKixcbwMhYZFODcXRvByVD4wuAg6efdJ4JH1L+TJx5OHI22CzEKYMtZp8bx9dl/PG5tW1jcidH23Sh5ltuBYMbPnPX3hTgnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNf2Q65z; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c0c3546924so15366565ad.3
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 01:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781856230; x=1782461030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/LWq1Pi5dEJT4kYgvVIHgIA7tCgwCPmeLBwZZdPIMHw=;
        b=GNf2Q65zBSKQL5hyFd7xBp4zHUu8rByLYJI7bUnzK77ue19mir5aVn3RQIYJlfO/if
         fpnvqtcaGvA482ixKdgFjRG2MNQwDMt6lOn/ZpTZUbxwBhszpNBWIAXLsmlg/uSDQMPj
         vXqwrI4vpUDPLEBrnUW7CW87sVBf6mjDlKzbtmFCPcrL67eoPjEIziWi3rnTsDSYv0no
         6T5lplJm7pu6NE29nype6xE24yG8byI/IVJ7O7yQp3f7scInk1gCa0iXeoTbfkA+vQtJ
         th9WRf9a4ySMD20joaxpux/AwbdKiF8s+J5TKBh9mK7ukJ22a7xV7KpE1O51eBdiBtV1
         j1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781856230; x=1782461030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LWq1Pi5dEJT4kYgvVIHgIA7tCgwCPmeLBwZZdPIMHw=;
        b=kYOzSttpkOCUCgnvxZmcwSTmRc3OCBut6ezAubNMnSdsxUZTbf9rawANSdijVeOts/
         ZS1aSa0FOKmaIeeBqySnwhvkyGOmc1t929k8FWnqezHvjnPJseYWWZzSB+u1quTCVi0g
         XBQMyp6hSyqM6QidTsMx+WzJXJtlpchgwEva3gbyHP7ZdJSWfqfnba0PfS+JVlunI+/+
         ZpvK6dCyOeC+MPL/EGhIfazntVun48enWAeIQJxOzetafvHth2+ebIbT6K4z5Ftt/9j6
         TImxfCteN8SD4pqx++/7eCdwJs4+no/XljztOr/T8kVNPfxzGtWetrn3fHpu60AG5sWF
         tXnA==
X-Gm-Message-State: AOJu0Yyos7GEidryECFgVugCcXFQygp/+vcB9bIDPPnrLxilobM0S8/j
	IMtT8afgzNYs867Fn38MdJVRymMD7MmUypQ2HSF0Nom1SkpVd0fFbPi7qEpEFyz/
X-Gm-Gg: AfdE7ck90E6dqTz7f2mrUW0UWf8RlYksoSXnUnrxy3kIoi7nKFof7OaCkrK3I1T/jHn
	j8aUj2zFa8Je7vqcEKFpGSO6GgfrZ1FZ0FW+YOM6Ap2P0hFWDDK3eOV9qoDukiyt0CKofae1fXZ
	kK9zJraakQ32WsA2TKffkyo67Tz3QS/4CDNis294NmTIbhIPtcUkkig7rjeINyOIWYic7O+xHyG
	LryV6x8MZVF0bveyTTXJleayASENlAgr9Mdmy5+igc/cWSFvoo2azzHVmvDb+juZb4jxAgwMHep
	oT/aBhVqhs+L0m1x+NGSvaCjIQ50MSmnf8nj99J40iPAROIuOfxmR48L+fuVkqUM8H9ILsB0FH2
	fZ+JydpVgyouyyJW38xBqlpOeK+3dvnlLWrYfa/5I8nWoXgakQV92UptZy15ZzC7gV+r5nAsaoG
	sXhmoBJ4JHZib53vhljv4E0sGsDGckLl7cOoCBa4E5+W60uyMD4SVb
X-Received: by 2002:a17:902:f552:b0:2c6:c66b:4b03 with SMTP id d9443c01a7336-2c718f60ff1mr29234365ad.10.1781856230437;
        Fri, 19 Jun 2026 01:03:50 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7209bc754sm14795725ad.42.2026.06.19.01.03.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 01:03:49 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3] media: v4l2-core: Drop manual fwnode_handle_put() via scope-based cleanup
Date: Fri, 19 Jun 2026 13:31:33 +0530
Message-ID: <20260619080132.17735-2-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
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
	TAGGED_FROM(0.00)[bounces-65253-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 67BF26A47FD

Simplify v4l2_subdev_get_fwnode_pad_1_to_1() by converting the local
fwnode variable to use the __free(fwnode_handle) scope-based cleanup
macro.

This removes the need for manual fwnode_handle_put() calls and naturally
ensures the fwnode reference is held during the device_match_fwnode()
comparison.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
Changes in v3:
- Resend as a standalone patch to resolve Media CI robot grouping error caused by duplicate Message-IDs in the v2 thread. No code changes.
- Link to v2: https://lore.kernel.org/all/20260616162208.56488-2-birenpandya@gmail.com/

Changes in v2:
- Updated the commit message to remove the "Use-After-Free" language,
  as there is no vulnerability in practice.
- Adjusted the implementation to declare `struct fwnode_handle *fwnode`
  directly at the point of initialization, rather than at the top of the
  block, conforming to recommended usage.
- Renamed the patch subject to better reflect the true nature of the change.
- Link to v1: https://lore.kernel.org/all/20260616092516.46339-1-birenpandya@gmail.com/

 drivers/media/v4l2-core/v4l2-subdev.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index e6b133ef7850..806b059410ce 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1243,15 +1243,14 @@ const struct v4l2_file_operations v4l2_subdev_fops = {
 int v4l2_subdev_get_fwnode_pad_1_to_1(struct media_entity *entity,
 				      struct fwnode_endpoint *endpoint)
 {
-	struct fwnode_handle *fwnode;
+	struct fwnode_handle *fwnode __free(fwnode_handle) =
+		fwnode_graph_get_port_parent(endpoint->local_fwnode);
 	struct v4l2_subdev *sd;
 
 	if (!is_media_entity_v4l2_subdev(entity))
 		return -EINVAL;
 
 	sd = media_entity_to_v4l2_subdev(entity);
 
-	fwnode = fwnode_graph_get_port_parent(endpoint->local_fwnode);
-	fwnode_handle_put(fwnode);
 
 	if (device_match_fwnode(sd->dev, fwnode))
 		return endpoint->port;
 
-- 
2.50.1 (Apple Git-155)


