Return-Path: <linux-media+bounces-57525-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MTLJEN0yWmxyAUAu9opvQ
	(envelope-from <linux-media+bounces-57525-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 20:49:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED70353A7F
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 20:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0884300490A
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2026 18:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB43519B5A3;
	Sun, 29 Mar 2026 18:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QxEe0pxO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124C4387591
	for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 18:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774810171; cv=none; b=DDCvYCnxNykR3+yzvOVQkqIbFrnetkNngORGK/JUZaCZGtxWDfcWy7kfYCxfWutPN6fPqxpVDVHvIHO5rJBA/pwaIa64MTvwK+diUgHZ48qtb6hAaZGO+oVTzlu8xWEXAV31nskYnHyFbdZl562JOI42XgcoSbpQ3a/Nj3pMOxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774810171; c=relaxed/simple;
	bh=LAaNo5RL+flgMVL1YHSP0zlU4TE9e7ImpSJmnKfKBr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qsjHuxib4S03AIUNrUx/o70npna7p3srUIjJxGPc2b1CGgXShRuGz8xtzCPBxkz+1F55On6QrDnXHqlVT36e2c8HHESMPJGdjhcLNwLTrtZGJStF2hpZRcR2SSittkQZcHs8LA28rpvIq/DmHHyzC4aCWZSCIq7vVX6wWeo0paQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QxEe0pxO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fba7ce4cso37143795e9.3
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2026 11:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774810166; x=1775414966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6PDT/N7LbYtJJDcDJelx2xg8NXIfygevP3dIW+DnC4=;
        b=QxEe0pxOJwq64SOs5QNHL7NNGf/M7OIJc/7QCDlCg5MXB5tcEc5+9fpud203+fdhER
         OIJrzGW/uqZdWxL34c39tsa9GVz9StfB+acTai78ZEltl4a0oEYpi5YlVk2JuBjs8Jic
         yj24eWPayuMHGQPGLCbOA0vxNVJDbUBaoS7XSevCveeggxCbrxk7wuucbXkUKMsc/9dj
         zORCp55zTv6OVb7BLI5oQCrlic0qyivfzb/9TJJRpFis7ooVaIZWnC8r23rxHKygUXoP
         hNBEt4eFGnt0KoP3tz21em/ZxK/ua/IgCzLYWzODcrsaHrt9XvS2BDXEie8zHQ12wFSo
         4VxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774810166; x=1775414966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c6PDT/N7LbYtJJDcDJelx2xg8NXIfygevP3dIW+DnC4=;
        b=K5irB9CjPMEBBhKsLDJX4wV+VtnWSg0A8piUl11faTpyP1Y+uZGvvYiSgyHRZm0cLo
         Y+9JUN+PLT6qJl8vikMAM37gtvpSnUxCUsy9qtccj/gqRedDy5RkZ3ES0U/r4mBognya
         /KRv9h+lRvBTT889q2tNF+2oDjAW8wGJHzHrLkWKEWXueGrFR4ZuiK2R03D2qBD0SxjJ
         ZNNXva2q+zHy9GIGQDwRmMcvJgMwNx/xQy96X3vHzfNfXeKBIji/BZZh49DwnYGLUgEJ
         afaZ4N+lQITwyYbmb4pbVm6iJAjX/L7LWtMrw2fFzDlPhRetCRvDbcvjfkPokflnCxL1
         6hSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM23/vuWeEBzmj4F05AMWwmng6pG1Dw5i3zVUC1P83aJgfD9IkzWVYp/gaiRgpCd5BgdCEQ1J1230h3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAk/VoI43zpmiF6uSleTt2fA+APp2fROGGszSqDSHU72GznSKt
	haJbs+EWVnwghCuGRWp3+u4bDbaW6oGSNTiG9o9j6L22Vvdxx3YszgjX
X-Gm-Gg: ATEYQzxQial3mjDKVAkm9Ml/aM2oL56JnO/AHbKhIOrB4CXYVHmsP7d7U8AUkQfLZiM
	QULDajPChE8Td/ZVYhqjieCxjNDFa7g04MBG6sh0MBOkzOjIZDIfMSYBCjrgUZirX3g2MUpxM6h
	jx/vZrPr+uhekfodu3uyL+n5nylOiihhbkKA10ZcgjfLnDewzGfDdprFeHu/1mgwFvyycYjuZj5
	5I7WMpyaOLaHfvl0G/KHVa3KYPWBUDmugMXyd/5BSFm7wOFOXqJXkP5ubxA5HAFBphcr7dVDg5H
	gLH2LS0FlQpqcJyfWIZDJnY9yD7+t/hp15/L2713oS9PpsACIFyxgzwBcTYvJk7d4v0ZxQkZiAI
	eSJ8tePG7IrTdkjH0vCYcHMwJCu2sCeqWxHCMH6VKexdipyT+tk1LbiYpulz3VkzLGwPOD3/FNM
	/dIl+4MF1NOZQuHEm7C/EHB5LPdFQAdzLcPFU8sHsgWhMUqVDPbtc=
X-Received: by 2002:a05:6000:40de:b0:43c:fd7e:72ed with SMTP id ffacd0b85a97d-43cfd7e7429mr3345917f8f.43.1774810165539;
        Sun, 29 Mar 2026 11:49:25 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21eba4dsm14058443f8f.11.2026.03.29.11.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 11:49:25 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	daniel.baluta@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH v3 4/4] staging: media: atomisp: remove redundant blank lines
Date: Sun, 29 Mar 2026 21:48:10 +0300
Message-ID: <20260329184810.455285-5-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329184810.455285-1-robyserbanpascu06@gmail.com>
References: <20260329184810.455285-1-robyserbanpascu06@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,nxp.com,vger.kernel.org,lists.linux.dev,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57525-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robyserbanpascu06@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 7ED70353A7F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove multiple consecutive blank lines to improve code readability
and follow kernel style guidelines.

Signed-off-by: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_global.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index c65a5be8445a..d417230faff2 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -218,7 +218,6 @@ typedef enum {
 #define	N_ACQUISITION_UNIT_ID		1
 #define	N_CTRL_UNIT_ID			1
 
-
 enum ia_css_isp_memories {
 	IA_CSS_ISP_PMEM0 = 0,
 	IA_CSS_ISP_DMEM0,
@@ -248,7 +247,6 @@ typedef enum {
 	N_ISYS_IRQ_ID
 } isys_irq_ID_t;
 
-
 /*
  * Input-buffer Controller.
  */
-- 
2.43.0


