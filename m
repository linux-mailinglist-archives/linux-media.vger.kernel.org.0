Return-Path: <linux-media+bounces-58573-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEkKG3mc2Wk3rQgAu9opvQ
	(envelope-from <linux-media+bounces-58573-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 02:57:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21ACF3DDCB9
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 02:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E4D83066445
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2026 00:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD472F0C48;
	Sat, 11 Apr 2026 00:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdIHUEcm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FB92E62A9
	for <linux-media@vger.kernel.org>; Sat, 11 Apr 2026 00:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775869005; cv=none; b=lgulYkyiPzTbEFC8rNXRf89DLmgKqvhhVOKSzQ7JlFF/OO0U4Umts/RUnKEcjV7KCeOzYHGFO53G4SyDNkslrAGiDtBm0pRTA94ogIjwOhM38td9H+J4tmmelGCt6QoRvNjtjdfKRwj/gkPknCNyihV5b7fNOCOOF8qOUFdvFSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775869005; c=relaxed/simple;
	bh=1r6NUx1mBz7uU53BJS3Rp8JEFf3SRmd0SDN6gzgB/gs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HGH5ZytMeEJ9nQSNZnSB1uYcv9FwyCAVcOn81x4IZiw7alYXxoJpEJ7FWxq/sgyAfOr4ntgqo0n1bpx85HxfMDj3qUvbmwUQNB3fE63ryKS6LNu4EPg1xMYVU/LpocrpBnBeVGVyZHF+jiT2j+FWQsh9z0RfiBvTes9RrdUaoUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdIHUEcm; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82748257f5fso1484822b3a.1
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 17:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775869003; x=1776473803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5fMmliGav1dc37kxbo/jRmBbPOJ48pG/a6mgTM5JNk=;
        b=gdIHUEcm6Q8wTgY1P0wrYIi/+G/hPz8+um5S79coD9bZx7bYS0AWXBf5pBKdPqMhfF
         JEAXJN2YVtM8QAPIhoA9Qm5tpzkTWB/OCVf7g8zt6RA4Ow+EpwuPYRJg2VeuCkzyBl6T
         25roJKVMHRgQ5Q8WvqcjvGtOWDRywwNZZqgzgMv9irY3Qoiu2sbEvw9vwH6e6vLHUW/W
         UU7BEhDOvNZtH6uiqyPC63lK5gOyVgEgMhwraMqdx4BMMBcfpHPVgpuZB2kN+k/jXWFb
         wbZDoWGCJqnCJ/4ESv+5ya9o3XfiEfNkH08z0ZCyF4XOAK9zp61q1KJGpMlPgKEBt7Ea
         3O+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775869003; x=1776473803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5fMmliGav1dc37kxbo/jRmBbPOJ48pG/a6mgTM5JNk=;
        b=ZU77l2dR+dMY+S3cyqQlAMAyw7cOc9n1Z5XAzAywG+TPOqeGJNritMCRSb+vQAUWHJ
         qOatTmhJxBmuew38sOwxB+lk4sAxGlBxueufVE66TPlfBJw+4j60EbCU3k3UDPlOyTvU
         9/3iCDBfrvL+OjRrRwZ+olPsYP4ydW9a2Ehrc2/+y2LaSibpnJR8k6YcFm4fAo7iEcsQ
         3exK57L6Wp32no4rPSYIc4ThOJ+wHw+YypXr2kie1QrkiAld0GNUgmzh3fSGB5quSrTn
         XATrZNDDHQpS/GHvCZkFrreCTuw4VDSubCT9NpopY9wh0j+P4qYmufRYTENJ0RxR3kKH
         eLvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEyGjnkOK+HuXhfRLPShzoVVfko4KN+6eXyXfQx8dDKVTvLhSyHrttBLAyEZ7D8YDsDXVmNTwjPpwdUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPKT2GOpR/iLx1HJxqFn3LmXfIqXU1tDHwXKfqdM78aOlnDW9W
	fP77RNxd9uishkAhcY1FzXdDj2uXsViJSEVGPyRsioTUraFntFd6QwhFXTAraN0e
X-Gm-Gg: AeBDietCMLExLK0Y7Fc5ciplzTWJIS3D4MeZPbnUgcTR24epoggEQGK020QBiebiFiX
	UnqCLVoxgPYdsoPWUrcAnGX7DAWaMzpfgKlUz58wY+0rETOCFQvqzH0ZzV61lOVTHn/7SHouVHR
	ON8jdyv6t8C3uUSCCnHXc4TrbKVF0khVY2v1NFG3+pTYQovphi7vN97umzRGTW7EhYXQnKbXn+l
	1SwL1A/4LjCx8bnZu0ATCizWIMt1aVge0M+4HiZp+BEm1ku6LCwQPCKd2YKbzt7WUUVNjt+SlY5
	aig6s2Qa/pUmSxanTgQNtK8ehSBG1IWrKsWcnjGGVP+LD6MqFvJdOuBZVJrWl1oBeDHFfwNqavK
	Oi/qDcGqLP51DpZ9FcvoDkoSmvF6EevBmnpmuOMYx9PibtwpJOT21KwE13Vw1QKxx6ePAajtE+8
	UMm2tjas8yS17FnDSlMzevGb6ZiyKLk69SuNsUoGDGSjfAVPFqpXx2fUy8I3mIk5e2TyGZ+b3PW
	HRr/oaDGU8vqWUaTnLoQq+RsE32qVjI
X-Received: by 2002:a05:6a00:3a1e:b0:829:8083:472b with SMTP id d2e1a72fcca58-82f0d0d1199mr4728146b3a.4.1775869003279;
        Fri, 10 Apr 2026 17:56:43 -0700 (PDT)
Received: from michael-mint.tail2556e3.ts.net ([50.47.84.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50cd34sm4388692b3a.54.2026.04.10.17.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 17:56:42 -0700 (PDT)
From: Michael Ugrin <mugrinphoto@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael Ugrin <mugrinphoto@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix indentation to use tabs instead of spaces
Date: Fri, 10 Apr 2026 17:55:12 -0700
Message-ID: <20260411005512.46142-1-mugrinphoto@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,linuxfoundation.org,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-58573-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mugrinphoto@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 21ACF3DDCB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix whitespace issue where a continuation line used spaces
instead of tabs for indentation.

Signed-off-by: Michael Ugrin <mugrinphoto@gmail.com>
---
 .../staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index b411ca2f415e0..966d4efb200c5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -1257,7 +1257,7 @@ ia_css_debug_pipe_graph_dump_stage(
 					p--;
 				/* Last comma found, copy till that comma */
 				strscpy(enable_info1, ei,
-                                        p > sizeof(enable_info1) ? sizeof(enable_info1) : p);
+					p > sizeof(enable_info1) ? sizeof(enable_info1) : p);
 
 				ei += p + 1;
 				l = strlen(ei);
-- 
2.43.0


