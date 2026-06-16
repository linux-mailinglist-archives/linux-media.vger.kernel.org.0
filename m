Return-Path: <linux-media+bounces-65030-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xj/HM8lUMWrUgwUAu9opvQ
	(envelope-from <linux-media+bounces-65030-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:51:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 444B76901CF
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:51:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hyEUi1Bj;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65030-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65030-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2241C307954E
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE9E349CDE;
	Tue, 16 Jun 2026 13:46:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206662868B5
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 13:46:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781617580; cv=none; b=VPORLRr4VGkpLWSMpMJ4Atp7oAhukDTB6d8qzjx21+plrdVbQ6Evg5DtbKs+xl2Dw4MdwiOrnV9xdt/9Ddk+P2vLcB4QVyt1q6yOpWahB0Bxdv8feSsHBM7J+j7hFyJxefRFLHmCNTtL3i5f2CIKfNcWZB6yWavsVZhbWuz/hRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781617580; c=relaxed/simple;
	bh=BlveFnvCyuuxxrlhkvdOrm76dEkEjcUXw/fMbQgsxYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WYBBQzBCHeGa8DenMRw60IpZ7Jl3QaxdhbgOtczKFvIuozjkJ77UcXhPpSSEBTHjrVqv3sPGs74aRrNGmMjeOB0AvLSWeDNFRLDi79inz9TDrsd+0mHI0hPm/NIYrQX/VRfNb72rkYSn5Q2GS9mu6jKhHCCJudDg5M1Q5bkVA6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyEUi1Bj; arc=none smtp.client-ip=209.85.216.53
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so2211075a91.2
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 06:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781617577; x=1782222377; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=llhKls+j1Ixs2wr3qNDyvz9TD5apL48O8f6aX/4laYU=;
        b=hyEUi1Bj6+HKDFAT0/POEZqZY/IwN8cwtsUvrGPcaURX5FWY6UXttKcrnmmB+8M8hg
         yLJD5/is0rlBuQ13Feq1qW9o++Dk5CLj40T5DA4TGPz2YxfdKpoLK18ghLw8KIdzxiO7
         m4FQ/F4X3JNHOOy7ipOtq+m9kv8DawhNG2BYWo71LWfhLE5UppvhR6W2b5tKIpOO8YRj
         U6luDXCRwUXE3jxdy4tYHYZ2QFEZY1rn0KtkAausnf6tScSgtFNiMaCWw+onMw1Is0XW
         H+8Rbuhcb1d72opEHfS8ViN8sWtrvI923NEj3TA6posMNJhEdi6LhL4q3ZCdoNucwKak
         0rqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781617577; x=1782222377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llhKls+j1Ixs2wr3qNDyvz9TD5apL48O8f6aX/4laYU=;
        b=HpHHXg3Rltw5ItHAzWHhMuP2e8urH7w/L2uwiz4kLAAiV+RyoT1uk1xST965iubNtt
         2l7gV+awFh/uGrC3DYTO9cll6Rhy9G7ATnBe8R00Wy1+AR/CazDDlJ2KvaIGVHeTbVqM
         /dNlQZlwHG71MxUuKoUg5DmrUyqHrdhRf6lDgiTUbn8z+mpJkw+UfsAkk7nHwHoq2XYL
         sODn0z6RxpJtBnuIebRog7Ae4Pw/xSovmPCBtinTURY52krL3f9k9pWjtvfPmF+wG+ai
         tcjbGCpiD23iIHIqd2pwBU2r2RfSXRfPLLpRHrOdW5wNIZig0QAtDYeKf5dLe9g9fG6r
         8Ggw==
X-Gm-Message-State: AOJu0YxUfzJc26qrH/Rh3ZXJUAEP29NfwCL6urkBtyK0jWlxc+KjCFUA
	9++CziL8i3bMnjnjDD96EO7kwm7uN+FizKjZjRWfP2v73LCaa6o2sCia
X-Gm-Gg: Acq92OFz/KwsC9+3Cw111/AUcSb9bMYi9Rvx8K2jIY5yeXS5DzuC03AgEyrI/aQNJE8
	brArXMdmbJPrhDAjaqihWFH0ycwFXNQeem07nGztZLk4hNQfmqM3NxHAxT/pi3GBR5S0Dc8/U27
	B6G4DaMp8ePkKbIJkHimCc4bPS3ggPUyQz7d6udanvmR+nyOAWHzIctfl+BCaVNyCi4J4om+Z4i
	KrO+4FiNSbfQe8FVND/BX8aMgd8ro5snVUpBSU9+AkWNK/2+1bfgaeXP4hGPB8ty9/5g9LfLEgy
	cmkneBInVFeQXwmdojaxShT8N09wCWDa+4vkNu0kIQZmxbV5qSUOQA3EDGb0AZUbLQDAXCPFKK/
	esOCpvZM5tXrrLQWdeyqdQTls7zV76IMskM3syrHdZzVuVed/sbbSMTJiANIzKkwTTlo/NRSwLz
	3rQOj4RH9w+bnnlROPP6pRhp+9hg5Awesti6SXl5cOdr8iKtigOQ4C
X-Received: by 2002:a17:903:1448:b0:2c6:a99a:52b5 with SMTP id d9443c01a7336-2c6a99a54b8mr12860755ad.12.1781617577344;
        Tue, 16 Jun 2026 06:46:17 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433079999sm132366055ad.66.2026.06.16.06.46.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 16 Jun 2026 06:46:16 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH] media: v4l2-core: Fix memory leak in v4l2_fwnode_parse_link
Date: Tue, 16 Jun 2026 19:16:11 +0530
Message-ID: <20260616134611.52984-1-birenpandya@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-65030-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Queue-Id: 444B76901CF

In v4l2_fwnode_parse_link(), the remote endpoint fwnode reference is
acquired using fwnode_graph_get_remote_endpoint(). This reference is
properly released in the error paths, but it is leaked on the success
path.

Add the missing fwnode_handle_put() before returning 0 to prevent the
reference leak.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 77f3298821b5..93ef83c591ef 100644
--- a/drivers/media/v4l2-core/v4l2-fwnode.c
+++ b/drivers/media/v4l2-core/v4l2-fwnode.c
@@ -633,6 +633,7 @@ int v4l2_fwnode_parse_link(struct fwnode_handle *fwnode,
 	if (!link->remote_node)
 		goto err_put_remote_endpoint;
 
+	fwnode_handle_put(fwnode);
 	return 0;
 
 err_put_remote_endpoint:
-- 
2.50.1 (Apple Git-155)


