Return-Path: <linux-media+bounces-57950-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IQiFvFgzmnvnAYAu9opvQ
	(envelope-from <linux-media+bounces-57950-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 14:28:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9738389117
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 14:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4170D30A2510
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 12:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 217D63E1204;
	Thu,  2 Apr 2026 12:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlArw2Gm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465F73D3CEA
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 12:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775132634; cv=none; b=fNGbwXWSfS9nczhcHw9oKab53Mj9lDScqUl/LPvvALtrlTndjpmcZ/E0dkKUPCsu4jKGjdQeqkBsYIoBft/LVId+7qpxkfN0XfUdJga6sjn/LHwsTFdimYjC/JK63EZbuPJubNUklm80L1gsOFE8KnlqlsQ1sLtLj7ahn1MsRDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775132634; c=relaxed/simple;
	bh=CiazWmmi6vMLPLWIeEGthiISVK90JbaZcBdoKBCyeMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BskkTuNmsU98/5VKAe59+04MYquKZxEpTWGGW9iG0bOtG/SVctQGIr+uF0K2qsYsnPz991g4ein5PhtHEZBZRe0qSmov01UEnAh3OB7E8GypeZifvx7QB0EdECGZ3YpFGKUklHdCBNqI05n3UbCS//wg0ghvxR3uhsM34KO/BdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlArw2Gm; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b93698bb57aso176674666b.0
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 05:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775132631; x=1775737431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=93MKXho5CihfBi64XHlp856AFQOutHeNOOS2UatSKRs=;
        b=TlArw2GmNejwEwiQsANoFk7nzKsJ6pkxherYZvL5Zy9NNXzyB9g2hqdKc7dfq/Q72r
         1LMaRlloR+tvK46KLHaiIfadbAahpnSBzrMLDm8gLMObtNXmqdFbRyfcT+noxkECwhlW
         3yuY38VJlaX5OQdxeOTBuiT6BwX1DBXPciQahUN9JdHubKHBxctbRfWxERo3z8Os1EQA
         qaP2a//gNxVx6ES9wEoRuj7Q8e6N+/ghaN2bewtfDZSUsstxLMosMbfwQRW1ld1EjTTv
         mLzyJUJDOR+J1wr8EANjHjwmjXlvCkSQ6G4EWuD7MaiDh5MyljWlfOpk5osctGpnbi8F
         xa4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775132631; x=1775737431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93MKXho5CihfBi64XHlp856AFQOutHeNOOS2UatSKRs=;
        b=kyWG2GS3QeZ9RQCl/bZXcaK5yyxNhb6upeARXDBloRDXuDt/ADzjY+Z4S7TzuiNUbP
         GaBcAJSGH2epkHCTrzALHWV+unBP65OfFdddesqFZpznQlnJLAuAfg7X39cQXVccVydN
         IfGraARRnnQY7eclISA7ogYWId8y/LsXYEPq+sGM0VGYXxjLr19wN97FLuzxjILA0bXw
         FqM4mNy2lE2K1/VBqIxq5pd8YFEbkCTv4KSHpnknFcnsHp7s8ztTDw2DMD8c9Ds5BYIF
         6aGCMqyiChoDZbO65nDNJ7pnFDt66uHhTbR3loCmOo30atXJ2cZECuviOWe7iRyK98dt
         Gcew==
X-Forwarded-Encrypted: i=1; AJvYcCXQO8sJHK5SyvoJufhMk49Eg9sV1PK2/pBCEB6t0OdS7I36DKEehij1Cifzl4GoHuLaXEUB3SJ49cZh0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSb0s4mTlTwGHG5gAX5y3ZtMBSBGF8J8VvDUbckKFHRrX6RSwj
	JNw4SMXWr7js9/Ocl4pi2OKuAK/DbXL2Vx15cXMk+SkfVJB8LqdzfS6x
X-Gm-Gg: ATEYQzzjaleRXG8WMklXkzGHIKJHb+FFhGTxSTw1kpJN3lyPTrdwpSr54qYeqXPUUiw
	4oxenf/PDFD23LU9U3kU4606WlPDTDKHvUNREeQ1BqLh8lDapN/KUzYOoqMNiSkrnruRaHycU9c
	Bc9NakAbtOfUkkGE/Lz7Kmvybntum4gSrmbNQ17NWPjrZNxcMvXBXKFIDLPZ8rxYOkDfJ8mQEfl
	PITnDa9oIm6LGoBrZUPkQMaWjO4K3h16wnVPVH8H7HfV8pbfT5lSXz/vacsmWww9ZZYcZOnCYvy
	r6EFulRJys2v46cT1PMMOkvK09TzQwZ/PzbNMhl42YG561CccJ28zpMZCnIWLHd9CROFr1tAuRy
	mtzpSBXIXQABvydtwiNn85AJtKc5PoD2NJifmHM848/A+Ac15uaVE5VxbCL4VGYrMu7cAUB0lxA
	ja6oa2rRTxNH9NZQjk3BHHbE89RKWhOp7LlbnSQt7Sx7DQWSoBKny1YXbQN9q92z+oUrU/5FW/o
	MqNbQbjvAA2SDOZ6mOMcD2Vrir5w52DIM8uz6x8Gn/CBVzif6sooDCd0qKugyU3yz8YTPJm16W/
	ynrdMb6gq1DclzlENTbgPdFouXoGNmLiA70wTQqWW4jeEm1fGXHNS+1GIRiyD2tn0aurF7SJZXT
	AW3Z+v+l/8N6F0AEY
X-Received: by 2002:a17:907:97d3:b0:b9b:e7b3:a257 with SMTP id a640c23a62f3a-b9c46fedbebmr95671466b.21.1775132631230;
        Thu, 02 Apr 2026 05:23:51 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-a.c.od237066db22328bb-tp.internal (253.119.12.34.bc.googleusercontent.com. [34.12.119.253])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02d4500asm658588a12.10.2026.04.02.05.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:23:50 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	grondon@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joshua Crofts <joshua.crofts1@gmail.com>
Subject: [PATCH v2] staging: atomisp: fix alignment in function signature
Date: Thu,  2 Apr 2026 12:23:33 +0000
Message-ID: <20260402122333.1336-1-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-57950-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,gmail.com,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joshuacrofts1@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E9738389117
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix alignment checks in function signatures

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
v2:
- Rebased patch onto the staging-next branch to resolve CI merge conflict.
- No functional changes to the code.

 drivers/staging/media/atomisp/pci/atomisp_fops.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index c7aef066f2..c51d04af6c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -96,8 +96,8 @@ static int atomisp_buf_init(struct vb2_buffer *vb)
 }
 
 static int atomisp_q_one_metadata_buffer(struct atomisp_sub_device *asd,
-	enum atomisp_input_stream_id stream_id,
-	enum ia_css_pipe_id css_pipe_id)
+					 enum atomisp_input_stream_id stream_id,
+					 enum ia_css_pipe_id css_pipe_id)
 {
 	struct atomisp_metadata_buf *metadata_buf;
 	enum atomisp_metadata_type md_type = ATOMISP_MAIN_METADATA;
-- 
2.47.3


