Return-Path: <linux-media+bounces-49045-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE25ECCA746
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 07:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29EA9302E15B
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 06:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFBDE321F27;
	Thu, 18 Dec 2025 06:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTk89eol"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4261DDA24
	for <linux-media@vger.kernel.org>; Thu, 18 Dec 2025 06:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766039206; cv=none; b=QYNz5+3723KJMmFjI/HfJSKu4bGJY3ODtViFieVkP/nKcFs3R6m/wrDcIq+mWK3W60t91M4am4bKBGy749l/5a8d4ClzB3m6CsJ+CAqCZzu+Jk9cOm0tmjlWBhfp4szxP3lSUi6XC500mqVhkQYVRYJs3VzJTsqyraFRQsB68Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766039206; c=relaxed/simple;
	bh=UlMEygPgZYt1TC2YAh0pYgTJVUX3LvnVxttd0WMbq5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KJaVxliuEZJMgj8WVYn/IHZh1m0qricpwnZwhHKAzDiSb8DLySAyOqmxKiN5XY+bO0HFIcZxuViJpw6FdDRniWJ/Y5WzyH2zFsszR2eNrxJt/vQWgtK62FFwSHnvJC0epdhaZnY4ATvvSdLBDTY6nwRKCJfvL4PVMycJ0KO/XK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTk89eol; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0c09bb78cso2050635ad.0
        for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 22:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766039203; x=1766644003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p4VUBVbWwpNIpkjB1F2W0ja2iH35Nmps3FuQdZl02MI=;
        b=VTk89eolwiEt3/71PBbnwANDFKNEwkuS95+vt3WaCAY50qoRWSWCWcPDMm9p0KbcYc
         SugeMCLbaA9KKBHHfnzLQwii210cSw6hcKq+9rSdT6BUJxjrO5AIxkLLcViMSkc3Y1m4
         MEkAerfS/CTp7FIZXZcGBWXPUSshi79YOZpkXZQArxUc+Vf2RX14ZFBxJ1QK6QUvJaWe
         KtCH9CWlOMdzAe6xGVmSzG44P9Gwu/wsdqpj0VcEyi44xaAyrraHfVOVVyCxS0k0CS0m
         WbL0ZG8o/6dQUvj8B+aOPtQEezH95r6++Gx9Qbsl2hC78MnwzfOiDVh5lLrVihd2MEDi
         C8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766039203; x=1766644003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4VUBVbWwpNIpkjB1F2W0ja2iH35Nmps3FuQdZl02MI=;
        b=fzOl6TyYNKHOqXCxJkA6eYHKo+Q4Sd0A/UAWqJtrE/HrZg90XjiizJ6BTlfPcnClx6
         dsbNCT0b90YrCvDNFZ9+zX9HcTjEy9qvwgL+oYWGQUYyr6RQY6jFX8aoCc58mdsLuWcs
         7l4c6Z3TM2ak9FM56gDgGJWrLozXO0otgqv8LGqAAP0ZM0kMal+TnJLs6AHmZ36NohPA
         2dVlZ5AIPMdhdCkH+rRS0KSDGjtivLoW4BnxuXOhFaZXUiLE4INVGRmK4EhWxLbyufoq
         V50fwXUd7k2BXVBlSTJpKOomonHbXxM9v+N1o1hH98BK7Ydj73vM95Uz0+U75fpMW9Ma
         Woig==
X-Forwarded-Encrypted: i=1; AJvYcCUr367YlKkGSbo33itjbkm7qJ4AiS/so5ujbVLXqh3G2mzpte7sMI1O26vBMRqqurQyQF83yOG8YnoXNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKMkTaWr26AOewnfOWLxTnEbo21gBSmv3lOtZhOGZtBSc7swqk
	5B7mwVlT5DG2rPzNZzy4Gv6qm2ad/RH0BZqvWMb8krLL6IWBm4/ydft1
X-Gm-Gg: AY/fxX5MBFEVPHBM8pchCgoNB0EdwDGF7pVyXXNq+u+QOYx60w4TfniH+BWHG0H1rmk
	UEYdYNr+sBItNn/Jj64pGC7NRM1cBHOVJriFL2H2G5wMbcfHV7ZSZ7gslQzDuYc9Q4ezIbTs2+m
	/vh6MxEb4mxJMKyjtn4NNEJPOxWkVk2TXLdn4tsTBD+4ZpY5MiHrsv4YafpnNZDUTkUuMatn3UQ
	gnoYVtPvNsU5MUhR4ww1QfkYu9TLY8LN3ke+6t1DC7c/JaOocpvq+rl5iMKecZ5emwH0ZsJM1pQ
	h7BAMFJdNJtuZaEtOUI9hbY1aodSqHeZskMUNq0fh0Y3rVeLmwrMMQFN6TaHhtoLFhZx7e+428O
	M7qDwIZ+eSGMztZZpBkREHsYGIN3p8uxDkqUwR4X10YUC/s6s9AL3nH6z487+d6hwp6gUCGndnu
	lrXBW5Bzz4ZunXptHJEpX5brMiyL2ShEOiJyQs9BM=
X-Google-Smtp-Source: AGHT+IGx4R+PIVssXH4XccN262LJNTaBCUV1p76NtqjZyU02/zR3inToV5I3TKpqo+j5lyVmwcEt6g==
X-Received: by 2002:a17:903:1c3:b0:262:f975:fcba with SMTP id d9443c01a7336-2a2caac6fa4mr17362855ad.9.1766039203082;
        Wed, 17 Dec 2025 22:26:43 -0800 (PST)
Received: from SIQOL-WIN-8.localdomain ([49.36.67.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2d193ce6esm12997115ad.95.2025.12.17.22.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 22:26:42 -0800 (PST)
From: Arjun Changla <arjunchangla7@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Arjun Changla <arjunchangla7@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix code indentation
Date: Thu, 18 Dec 2025 06:26:26 +0000
Message-ID: <20251218062627.8340-1-arjunchangla7@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "code indent should use tabs where possible"
by replacing spaces with tabs for proper indentation.

Signed-off-by: Arjun Changla <arjunchangla7@gmail.com>
---
 .../pci/isp/kernels/output/output_1.0/ia_css_output.host.c      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
index d09365e0c471..dac0736f55a6 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
@@ -74,7 +74,7 @@ int ia_css_output0_config(struct sh_css_isp_output_isp_config       *to,
 }
 
 int ia_css_output1_config(struct sh_css_isp_output_isp_config       *to,
-		          const struct ia_css_output1_configuration *from,
+			  const struct ia_css_output1_configuration *from,
 			  unsigned int size)
 {
 	return ia_css_output_config(to, (const struct ia_css_output_configuration *)from, size);
-- 
2.43.0


