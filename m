Return-Path: <linux-media+bounces-67034-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y0y4GA1xTmpAMwIAu9opvQ
	(envelope-from <linux-media+bounces-67034-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:47:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D047283DD
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 17:47:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Rs6Jod4N;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67034-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67034-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B9F013083A2D
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 15:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEF33F12C0;
	Wed,  8 Jul 2026 15:21:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657DB34D3B9
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 15:21:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524074; cv=none; b=UgV90EWyYnbR5Dj7kKMOKpdw6VwMM0DrFtZw+Ob6NnTv6Taixa9HhT713XKxdYHufvG6TiVajDJQfn6Zi6r2oNRwqJUwCDs489Cu3U4mJtMx5M7RG7LCcN/1UUfL1QsxUaYfiz3BjGAVRu64SWeRry9HtDn0KL6NkN3+lm+H9ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524074; c=relaxed/simple;
	bh=WKBcHTgaZtpNkKKi2sgsqXtCohviIlzQuMwKPXfIX68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mokRAjVPR+8Cl3HBVCT1z8wvvX4Pv8z6lXVUOm2Yxlo/RHY4YL3MiAgrHJ6Pz6ABMKwURWJmlMTtmIsTXLgNtfBqoBZki90/vQTj0oRx4Cw8TAna4YxzR7P3f7y9m3FBeICCgrxZ81Zh95qpS4PpOxjxQ7c3dXunBcsa3pcQZNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rs6Jod4N; arc=none smtp.client-ip=209.85.214.180
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c7c61b5292so15562015ad.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 08:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783524072; x=1784128872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o36UxtuiqCAJdwEuwaBvvEJ+v2c/EEKhjYP437s9xVk=;
        b=Rs6Jod4Nzyh0EzlLOlKQs5kTJRy8RbX1dbYtradlIQFb3sOtyCSyjN2sFkn1IHY/Ao
         s3QnJLd/AaZHCL5tP+hVTpANuirRM+/lUl7BEkHr8POFqPL9EZqFcascOmcSmmC+Ozs5
         CAU7dNym0BIwFO/JvQ9F1m+sOOq+uvY9/GiJWHfVANxxKy0Cjj3I9JL35Ps/eh8dV+dl
         ffW3ySGLUW9RYgcqy/WmJzPcqe8CCNF5g+LwwU72CNhwBZTaHnGAp2StfzcZZ7D+LSJi
         ub2N89lRrz0hMfEVyHVjDrC9et8pzjrPhnSDdZIZNjuMnFXM/CaUyhal/osJjMCQ89os
         3ZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524072; x=1784128872;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o36UxtuiqCAJdwEuwaBvvEJ+v2c/EEKhjYP437s9xVk=;
        b=dkJn6fhLa8BaxEM4/GJc8p7CYIOBWjZ3/XcO3ktNXNAGwI7oJDjjQ/miMn3L98B5PU
         ajaif3dSrLBLgfN6ty1/0cronWFKqpPSZdNDs+mvBVT919bIJQGoSdqSZTvhDuBRkRZ5
         wStNzg1KnUJ4ujI+cSn65Si51hLT4sVqwo5/Zs1Eiw2EXnRo2BpzTCn1OXyKVVvI92tX
         BRSaOZEgzZzNeJ43uGflipPUlvDagSIwH2K/cokr7lUPGEz/ECAnk8OJo2gsevBjyLkN
         ZjWoht4UWwBNz7hKtgZ96rfClmg/HHko9aaa19dO0/arlf35c/U83sWmgoly1S145PBx
         /OiA==
X-Forwarded-Encrypted: i=1; AHgh+RrbenAVDroaJ2oKNxlGGYR1e0z360uuzG2JG5Cln9o5DFnXUKmG82+6s8dwjOL8e1LMkQZxZOvWQXntsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQqp1qBFTAr6K9Popme+Tf/BhQsnWcqRjia0b5o0oLY987KaJX
	N2Gu3UXnT0Vim217Rbf95LZI9pw3lwHoiOpWWU2JQROitDjReY2Rd5wiFup7nq83
X-Gm-Gg: AfdE7cns7rVgvwJKKcvdIY7mhiXCWOG8PYIjV7YnxGm1jKOgal9d0VXis9l6uPwgM6A
	VaeS10pjX/KkKQw6TxHz1EsXMpc9IpmxOVtaoIzPUlWYWaatihVYbrQUB8HRElltR9xOHdLTV6p
	oXjk/XgogmLunZQu/NPsdfd4HktwNiT+HCdCrT6WwB8bmy4OW6rZjIoTAFN48Pstosq9DCLJw0Z
	VR073lC4sqlrLfY5o0VfKWVPuGHgnvBJfbuF3E5FAdPKTm7HGpWhWqhl0VwuIVROW5wUUKYN+hl
	/BEXQTs6YRtDCRW6ii8ernw6xMLumDhtodZwO5zwGrDBKP7Ygka+cfdZ3GepUdJ7VygV/HnKG2X
	2xKHSMcu5AE5ZFUvhyfHRUgsBfxL3FGX2Ce0l0faBnAz763YowLJsGb9fRCQ1bwEA171NWkYKTN
	wEc/NJQtX7c7gOfXfvamYZJbk4cVzQMeN120LPowwwKHs=
X-Received: by 2002:a05:6a21:62c6:b0:3bf:6237:b1b3 with SMTP id adf61e73a8af0-3c0bd1a827fmr3540218637.42.1783524071668;
        Wed, 08 Jul 2026 08:21:11 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b6596681fsm24544817c88.8.2026.07.08.08.21.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 08:21:10 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: v4l2-core: Fix memory leak in v4l2_fwnode_parse_link
Date: Wed,  8 Jul 2026 20:50:54 +0530
Message-ID: <20260708152103.49371-2-birenpandya@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67034-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50D047283DD

In v4l2_fwnode_parse_link(), the remote endpoint fwnode reference is
acquired using fwnode_graph_get_remote_endpoint(). This reference is
properly released in the error paths, but it is leaked on the success
path. Add the missing fwnode_handle_put() before returning 0 to prevent
the reference leak.

Fixes: ca50c197bd96 ("[media] v4l: fwnode: Support generic fwnode for parsing standardised properties")
Cc: stable@vger.kernel.org
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/v4l2-core/v4l2-fwnode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
index 77f3298821b5c..93ef83c591ef2 100644
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


