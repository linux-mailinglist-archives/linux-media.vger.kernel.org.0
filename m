Return-Path: <linux-media+bounces-66103-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GkI+N7jDQ2pthAoAu9opvQ
	(envelope-from <linux-media+bounces-66103-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:25:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E32E86E4D1E
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 15:25:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fJZRtrwo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66103-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-66103-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5CAB330379DB
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2026 13:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0EA4192EF;
	Tue, 30 Jun 2026 13:12:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lr2-f1.google.com (mail-lr2-f1.google.com [74.125.230.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E0941168C
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 13:12:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782825160; cv=none; b=j1uBSmYAa2Ew4Uj5uxlH01SjwkAS38eZosOfjx1umV97D05okMEvW+Vk9FDD1olRdiK8Yx/qNRHJCauweu4T+1eH7FlQYlMM7gO71iy+RfHuPhhk4HpvC4rGZAbgvzSIKcnd5/pQT4rfH0zzoS0934j+yUe52fnSpboakshFrdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782825160; c=relaxed/simple;
	bh=HVg+YqWI4chdY73d0/jR0tccjaohiK3cyNxnhw5aYa0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lljFBi8oHqH7OSz1m425YNqS02GH9Ght0/OQUSwgFSyE1KrX6pBlEBcB3M4THjEX3zefAOsCZ2Qw6CPoJRkqfn88eBfUbxXRl3i0a8mo6ZQX1u+QtxAGb8uMug6+81BARBGdkP9hz5KPDXmALzTHd4KmxUjmCjUa+Wfta+eXWHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJZRtrwo; arc=none smtp.client-ip=74.125.230.65
Received: by mail-lr2-f1.google.com with SMTP id 38308e7fff4ca-39aea87aaf6so6372031fa.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 06:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782825157; x=1783429957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bshkajr9LMtOLYZB9AnqP+QXGl8rV2fpMnulclow29g=;
        b=fJZRtrwoeVMKQefOEGXPBoR+tTN1UxObwaFEv/K+1A8HDaDDt13CLaW3EPmAmLjqB8
         se+vPbLUhg8FTd7e7aCMvJ5LoYuR/iV/XaBSYfy3I7zp7GqZisbWvw2eFFGZ1DB5Fw2h
         oROByxMy6eYziLP06gYUGFYfcqd7UruUhHdhBhAmoZhhLKFJ/kGK39q0wBdeqfbTq0K6
         woA2L6oVIAQVPybajJzACgtC2yC8g4NeXZXZuLvybbvS5I8tEqRC+/I6SMxMOb78KdYH
         5l1Zrn155neN+LAd6JnJfErbqWFm2fa5xDWfPvA/3aex8rSNNMsV/dO3Qc3lPggOwyTa
         OPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782825157; x=1783429957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bshkajr9LMtOLYZB9AnqP+QXGl8rV2fpMnulclow29g=;
        b=d/qNozoORMSQ4gCfbvl2wBNMBCGg5R6u1Xlec4Q3+mACy8wyIhVPSk97F1pF0BRKLd
         TNnxVkSHfL7vi2HcvAeHrkSnlwNnJSiWmThU58kJd33xNuMupwEuj6eGtUCDaybRaDHV
         ZVYbYfVNNHC3/VeBCmFV4y6Cp6orIbP9objYLf097oYc1OA2/aQpreA3VJg38V7GBWXT
         pq+ot7qwvuKQwqswmoqdREs+5/XkOxkoZevq9bDld8o4wrb/wszQGVs0LV+z0ovIUMr0
         Xu/qAsxRuSI5Kfg98Gb1+HJBwXhGjMUt8rJVIo/wFZnc4QlLLYYva7vYpE18LpCdbBAZ
         6hJw==
X-Forwarded-Encrypted: i=1; AHgh+RrgbdhpgHR7laaLsja6LDN2ZXWQkHfie0pUhhckzjjyEUg3G/4nX+5GZ7gjV9tn3xAAShqqCMdRlHiPJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqn7KZPM3m+//lNZKXAvCoG4SsnaVkYo3+jNAfihnVLRUKBCYA
	YAtKhpLrpu8L/PztFuAqKqVCZxzV1rCqcpBHBak/T7lUmnk/RQWq71fs
X-Gm-Gg: AfdE7cnvZm9HhOzr0qRHBnO7aXZiiyVNxTc1AV/JMaPNtQLQ8lBrq17BYeq/plVlgnL
	kcnpB6b8FLnW0HRAblEtQcbSc+zItw7Z1/2UcAzGVY2zRZyACUQbQflyml2Un5dGi0Zo9mfwEyn
	8lcDJua89BeWdMhMrohw7ruaEmdwuzYx+9wqG8APcvxaa/3pTQtEv5aXOgSA/t7trNYXzlfUYjD
	gSNlI8vlKtnu2nIoJbky5L7GufC1wsr07xkDnoQ2Jl0VorzCmagUns5yKEKds8RjjbuDvz5+url
	VEFyKRrckccqncSf80jq8hALF6nO+vEimDWN/RvPntAOJhmoxDuJPAgs7alNoKb6GZe3+yq0QoT
	Nd7u42VxDg3TA0bT4FWhAA6Q/Yb9kpVOrDSOPzKp5ayl8vlJz+2obQA1Gz0u37ezoRDb3hg==
X-Received: by 2002:a05:651c:40d4:b0:39a:d587:ceaf with SMTP id 38308e7fff4ca-39b1da5dcb4mr5857451fa.8.1782825156443;
        Tue, 30 Jun 2026 06:12:36 -0700 (PDT)
Received: from arch ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b1d81d0f8sm5296631fa.9.2026.06.30.06.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:12:36 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>,
	"Bohdan D. Marcus" <bohdanmarcus@tutanota.com>
Subject: [PATCH] media: atomisp: fix block comment formatting style
Date: Tue, 30 Jun 2026 16:12:26 +0300
Message-ID: <20260630131226.23374-1-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com,tutanota.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-66103-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:andy@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:bohdandmarcus@gmail.com,m:bohdanmarcus@tutanota.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bohdandmarcus@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,checkpatch.pl:url,tutanota.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E32E86E4D1E

Fix a block comment formatting warning reported by checkpatch.pl
in atomisp_cmd.c to conform to the Linux kernel coding style.

Signed-off-by: Bohdan D. Marcus <bohdanmarcus@tutanota.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..20abc2c0de80 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2520,9 +2520,12 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		if (sizeof(*cur) != sizeof(dvs2_coefs.grid) ||
 		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
-			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+						/*
+						 * If the grid info in the argument differs
+						 * from the current grid info, we tell the
+						 * caller to reset the grid size and try
+						 * again.
+						 */
 			return -EAGAIN;
 		}
 
-- 
2.55.0


