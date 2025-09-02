Return-Path: <linux-media+bounces-41523-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E71B3F6CA
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 09:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB595202614
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 07:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8862E6CDD;
	Tue,  2 Sep 2025 07:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RXmtI/tR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2C5BA4A
	for <linux-media@vger.kernel.org>; Tue,  2 Sep 2025 07:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756798742; cv=none; b=cB/+iVewz+Z3lf49lumF4rfoJaj7Krf1AW4Iec1ZKEfaJgNyjiNyZuv5o+IZFbAhPuphl0pCOIyZZsnBvqRJvqBnqIF3vriXLOa50m2JbykYD9W9LCB3++Dqa8SVbF9v1A7xpHQvEyUcxQzgmDtWoklpsLXouoqn+4/E2d8sFDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756798742; c=relaxed/simple;
	bh=qxr+CREui4pE7rWTCWj6E45p0I+6Etq/aCUmmlsx7ok=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=e1NOcAqhJaafHkPgOc8p12JC6obo67pf0pT/ySspRbRuW5EDeAm+9rXiKkOA1lGRHqRZnTA9Vau4TUYSap5+LQf2tn6wDn6CWBTHg9VyUI22yjSDdYZ0K3eTNFx42Xf7dw4+farmHCPQ7u5pzjtb3Nvq0TJCrOr06h7TEY+OnUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RXmtI/tR; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3d1eb191c35so1477042f8f.0
        for <linux-media@vger.kernel.org>; Tue, 02 Sep 2025 00:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756798739; x=1757403539; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WE7v0z7TzjZvPVfK4+4Sp1UwAsOZUOttl1hBOuNjNnw=;
        b=RXmtI/tREvYorkHCf4d6iMF84kM8El9u92b3F9C3SL6kXV02xf81nAlAxqSSILTeSx
         MdGdC90i8eMYOs5s3/37tY7kEvGPzycBFPVHLTY8yrhXdjq4NIDZ6bOddHofdqC7WYq8
         Y1jq6/MFRQ9Byja3MEK3G24cSuPERpq4Qhrvqd9liz0HXcg6pSmgNLIoBotmELb5lgxB
         aAsEkSScEiynhEpm1J3EII6hYzLNBYaPv2bKMwhi1fgopcUYQUqHHn+3IoIshcS1w/N8
         tn1jxyOOkcCyW2dcKCXEPtgXkiXsATHgi2J4xcmNRiVLg+WvnZkGl5/vvWqZzb5lODwA
         RfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756798739; x=1757403539;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WE7v0z7TzjZvPVfK4+4Sp1UwAsOZUOttl1hBOuNjNnw=;
        b=Xc8AEh0twSGyuAhpPmt1gUfDR9lG2GezVxyMO4hRMd9LzZBdq/baGEeHgCkI6v/JQu
         0vTdpH4IKP4zh3XnHdb3hp047qvSxuKca3Cp3AUiSimLtakn9aTIsFie76JZ6IXpol8S
         is7NG45jzrm0IwFjEoQ8sufvXoMV95NBhsQF3d6o+gv/SFGlWUuHsu+THEHCT7eOYTL3
         nP7hdNkRejWbWU9BzSlRtMA227kLf3JDv1QF4GWDfXrhnKzbj7ILPQsd+HabG4isRJM6
         mpRZI0N/7QjDsye/vG0N5cgRUdAC3aE3B/83lYdmzuEe3NUVT0HjFx77wusvAYwyH2zx
         8h/g==
X-Forwarded-Encrypted: i=1; AJvYcCWNjsqPB+4C4kqNSQs5roHMhWuRlLP4YkCe67CJFYsDLyWP8yLVXDdrQA1XmuZQmpB99JBtgmVly2JsNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGiouCMwPOpkqhE1Oc6k92nCf80pTh1tduQf/cDv71Xl0OzB6G
	AD5DedPsxW0iyTtAMsQAutk1Fif1QgqKBOjDLrR37Da0VedWSsnx5MBAPTjcrjhZJjx9KRlFW2v
	kr9oPC5KrRw==
X-Google-Smtp-Source: AGHT+IGtOLqgwO0BX/6Sg5J5mhZ2KciPQ7kiO1dkbcPPy47bP+WENUmn6cded6JsjNVS6Jfarr14pjp35Rl5
X-Received: from wmsd13.prod.google.com ([2002:a05:600c:3acd:b0:459:dcf5:1b54])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:2d82:b0:3d7:38a7:35dc
 with SMTP id ffacd0b85a97d-3d738a739a7mr3158803f8f.12.1756798739364; Tue, 02
 Sep 2025 00:38:59 -0700 (PDT)
Date: Tue,  2 Sep 2025 07:38:40 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.51.0.318.gd7df087d1a-goog
Message-ID: <20250902073841.2338568-1-abarnas@google.com>
Subject: [RFC] staging: media: atomisp: Simplyfy masking bit logic
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"

Simplified masking logic in pci/hive_isp_css_common/host/vmem.c.

---

I have tested this change on whole range of *valid* inputs, and it gives
the same results as before, but this function seems to be little
counter-intuitive as far as start is a (bit index) but end is
(bit index + 1).

It is follow up to: https://lore.kernel.org/linux-staging/20250901091050.1935505-1-abarnas@google.com/
---
 .../staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
index 722b684fbc37..9703e39b7497 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/vmem.c
@@ -22,14 +22,14 @@ typedef hive_uedge *hive_wide;
 static inline hive_uedge
 subword(hive_uedge w, unsigned int start, unsigned int end)
 {
-	return (w & (((1ULL << (end - 1)) - 1) << 1 | 1)) >> start;
+	return (w & __GENMASK_ULL(end-1, 0)) >> start;
 }
 
 /* inverse subword bits move like this: MSB[xxxx____xxxx]LSB -> MSB[xxxx0000xxxx]LSB */
 static inline hive_uedge
 inv_subword(hive_uedge w, unsigned int start, unsigned int end)
 {
-	return w & (~(((1ULL << (end - 1)) - 1) << 1 | 1) | ((1ULL << start) - 1));
+	return w & (~__GENMASK_ULL(end-1, start));
 }
 
 #define uedge_bits (8 * sizeof(hive_uedge))
-- 
2.51.0.318.gd7df087d1a-goog


