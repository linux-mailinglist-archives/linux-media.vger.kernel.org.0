Return-Path: <linux-media+bounces-57547-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFqPCmsoymnX5gUAu9opvQ
	(envelope-from <linux-media+bounces-57547-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:38:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 913733568AC
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 09:38:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CE676301AA9D
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 07:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C45FC3A3828;
	Mon, 30 Mar 2026 07:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABZRB+id"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055643A0EB8
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 07:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856178; cv=none; b=BCuxp9n6SPQIOXv7uwPbIrxpg0fQAzg44gPI2SpQDkkPImBFADbwO+v2gUd4EnCEBCnwoB+eZs3UlQwpRGioZR6uesXl5X1ZqVQtGh+8SQNLhBRL95i1l3YM4XomDZFP8HqP1CMPefhovyqDdxbBGfz0FwVKQyS1Id00PbVsdYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856178; c=relaxed/simple;
	bh=I4h+Hb85bL/zpjRA/hGHNI3yGfnFlHifIvIALM1Wh7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=td6lnqp3MuN6kpkBBM9u5g9MXe76+19h3ntF/Ia2E9oSQQC8ZutqpLGGrY96qzyW38kIBprw0uLuL+86oiyI/+ukKmvdYMx1KJUBgWKDpXzNOMqWqpwdePmZLy4fC2TVDN19v2LmdQDSNb4e7SSDtY31zVma/NauAWdoy/2ZuJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABZRB+id; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso40376925e9.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 00:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774856174; x=1775460974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AMtD9W/+tPizjlaSoFxb4Hua6/k797TNYjPfSr7Lv6c=;
        b=ABZRB+idkmTWTVlSCS0Tk3f0Lm8A+lXQ4dxu2iXvyI9aZvBG6onMNtMobWagApT1r7
         EXXYXrk7J19lZBrPpJjogaMBaqBPgCAxaKAm83lTwOLliQuwE6pFDP6FUQa3nni2kRqs
         ShTfoEQqgyhlWPdTOPWhyu3GknUrX6xDdP1sEUFd6IgvqEnCpx7A28UoyE+Jb5sJPwf7
         BaQaz4Tqr0JhjwROVuIpfpsNO8Eg8jEzgFpviehoTWYuqn2ITFWDSmUeOF3pgHiMAjFi
         U/Ymo2zbhwX1ODSKJh8Pyobs7x74IrdEvP/ak5+kgwpCF9+cybwogpYgJK/NbgOx7+Q+
         fnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774856174; x=1775460974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AMtD9W/+tPizjlaSoFxb4Hua6/k797TNYjPfSr7Lv6c=;
        b=tY03naew9StrgDgZUN5gwr8UTB9BS4R8MVYq53hTvuWgWA2Osii4jE6r+3yGB69Ei5
         ISe3N3AeHzW3yk32HYvYO5BjVBQivLR3nxPdBEzBM5Hja7MbX7+xGk9QZ3peuTekcxtm
         cUwzankcCctllTJMiO6O1CMMWq3kteehEO9SHI+4gPfyev3E/ux6WEZMTHt9WQOkDHNs
         ZjhmSL0bvbV4K1eOZT2JaFnxqVK3WKfWu70lQXx1LPBJI8lb9qXc2QujiV9TXiv+NV3O
         1ORR7WWI4UguT9wmiFbTyEk9sM63efPni+E+qMH/KEcrDwigJOvhut+Z0Im7L4ugqZPH
         CXfA==
X-Forwarded-Encrypted: i=1; AJvYcCX9CQzmg8LFmewWJyJBVVyxZ8gDdeeoyb+crpb/auwRYMNaDof+SoIeN86VKLj7WFGV5AYLXbW2LZJO0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKrsossg4P9Gfxj+b4MF1i6v6XxdtJLdNTMbyv3F9Ndhj0WVmW
	U47cPTuXiLmBVA5lWWN05WwqniRYaoiQl0UChjInzxHxclPwFGAnCDOl
X-Gm-Gg: ATEYQzwU0zbTpGNy1x/7gONMaMrYLRzYPHxupt6qSS+UlS+pjTBLgD5scgUDXi1G3m2
	pgdN8keIj/4js5lpO+jDUc/0P9BOzVJ2WZQRQrhu3s6+aFOyLLY4Y9rUuasXmG06bf0MJcum1Bq
	00iiMT5RftyG75mz4MdiZxES4smkx9gugHW6KMNXq0qMehE7r+4BFovxPSgyDpX+WOol2E9eZCM
	tYDoyQIJH2rgm3oOFPCyrRvXJ9mCxWZlBr+4jR5PqrnVDECfx0qKqv0MpVgO8JGECg9Kb0tw02q
	FVICOTywyYHls6nvRQFp9fNgpRf9I5FLeEv37LJMZJ7yeSS6hZe1iri4+5y2cpvvWATikImCfg9
	06l+Jy6x6mcupRRznLOitUoySnm0uUngyhQSdzTPzl7GTbBdUACdbbRmJ1/6u9fLjvFhM30Q6qa
	MzX82gOlLKSrpFPrsbz7szmLv+l9ijvb4B3LEXpsPlSbv3LtWGqME=
X-Received: by 2002:a05:600c:160a:b0:486:d76c:fa21 with SMTP id 5b1f17b1804b1-48735166d0amr57756515e9.12.1774856174056;
        Mon, 30 Mar 2026 00:36:14 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be608bsm389407255e9.0.2026.03.30.00.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:36:13 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	d-gole@ti.com,
	m-chadhry@ti.com,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH v4 3/4] staging: media: atomisp: reformat block comments
Date: Mon, 30 Mar 2026 10:35:48 +0300
Message-ID: <20260330073549.5782-4-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330073549.5782-1-robyserbanpascu06@gmail.com>
References: <20260330073549.5782-1-robyserbanpascu06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,nxp.com,vger.kernel.org,lists.linux.dev,ti.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-57547-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robyserbanpascu06@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 913733568AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add missing asterisks to block comments to conform with the
standard Linux kernel comment style.

Signed-off-by: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_global.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index 6420436d88f7..c65a5be8445a 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -100,8 +100,9 @@ typedef enum {
 	N_GDC_ID
 } gdc_ID_t;
 
-/* this extra define is needed because we want to use it also
-   in the preprocessor, and that doesn't work with enums.
+/*
+ * this extra define is needed because we want to use it also
+ * in the preprocessor, and that doesn't work with enums.
  */
 #define N_GDC_ID_CPP 2
 
-- 
2.43.0


