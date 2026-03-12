Return-Path: <linux-media+bounces-55539-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEZ0O0gss2ksSwAAu9opvQ
	(envelope-from <linux-media+bounces-55539-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:12:40 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD7F279CF7
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 22:12:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9F6F31CAF2B
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 21:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07F3C38A28F;
	Thu, 12 Mar 2026 21:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VAK7XF+a"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1173387598
	for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 21:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773349694; cv=none; b=A2tIkbg+cBuQ7M5dEcrblalw7EsOZMdWLlFETp8ydUpUpjhiGN2qSS0TGoIAUIXVv41Ey8zfTsb+5Bct2ueAsKZCaT1MrqA0Ta+5/JP5PDhuTLuLe0pdxPknYXQ2qRjYvSg0VSTDj+oQ0lL3/tSV7deAkzPsFqHlT0SAWNXjZKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773349694; c=relaxed/simple;
	bh=Jjwjji6DmEzsKUJGV1tPw2Ii7Kk/TrFt/sH+6mxjuqc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=C2onUZDFDhYR6PTgBCWUO6klNWzKYz0wdiA4IAbaizWenMcBQgteJTp/It+zjV1xXAoTzQ8/8SS32FVnceegBcf2kHCOYHHVniO2yYqhk/DYuCUItEXGxzBC8FPyc9Sud5uLtDeA3vjCeDj0ymU7IE8VKGLzdA2hh+N/roVUpT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VAK7XF+a; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ad9516a653so6869215ad.0
        for <linux-media@vger.kernel.org>; Thu, 12 Mar 2026 14:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773349691; x=1773954491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aoiNnbva39sA99NFKzTTm7yA6pujKxmE8bLsycQv4JI=;
        b=VAK7XF+aPne3WoDDmuRfZP/WU2gX9wjkeGWXgrYw3htN1DtxNRU2EqNC/qYfZflxjS
         BwwwEhpewaTB5oU1z1K7Zj36khUgYROK8GizfWnR0BQMJa+ys88dF6pQvuYfchjUAux8
         be1XxNfE6bVSWyVOedFWDeK/BFokZR2rkDWQIaqFgPbyMcOpNF2PtYJVFcQHM/QSa//s
         JIauHkkb33syYVVEhfQtE8RltYW8W2GcrXF6/n83QVFpWz6nE3KvHP8nfcpQFtFwpuIq
         /ylNPmPSCrhCyW5VkGJ/Jl361zEPKyg5VnmaZOqbOrB1gL5MlVL7wigLYDl91ehcUOIM
         wDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773349691; x=1773954491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoiNnbva39sA99NFKzTTm7yA6pujKxmE8bLsycQv4JI=;
        b=Mgd7pd8DJjlFYh3C/igDmnaO7LaRReOtMSqlN08HLGXEyud4kuLvlL47fR2fJobSNa
         5ZpFRBU6cut1DbaFEECAH3n4vr+Le3eloJRd/pBO/Lg6/4Pge67+eZbnklqTKS9Xf9df
         EpdoBSGWLH0i5kBxSscREjj4X9EDjw0WIn40JtmQFyYoQrWrJQKabI0wHRqlrNKZh6RY
         B2zC88J2RBQsYIYMrjD5AUThlj1UGHODNrCWEUfKch56ULOJvgE7KppfKOi25zGYmkzq
         7Qy6++YfQy6nzi2bD8oweBtyaW2xqN+7xrg2juTBD/XOeCeFXCOx3owz+SCzZ76kz5pr
         faUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtDwbG2MOk1DlU2oBLgMtE+hIDHRjzbidheMWRwcyhRkOYHNnEUHcEKbKYPXWJ1yQkGTBXEYV4ZpsUQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4uXh2B0beJyH7IIrLrsUM88s1y66ROIHFR8hybqE5YMmy/df4
	75/Fh6tTrVRnpGohHo6hKLpAEPUwPeSk6mjOFp/DHvcs/sqTrPDfdqNj
X-Gm-Gg: ATEYQzyGm38RLUqohtDlhgRkK7S36MGzgOimmP/XGtuFDWfR7zaUvERwmZQyKWF5Fod
	pA97PW6JBFLbW3/R5vzNrt89BlUZjClpJbAoKU+kMwn6Lpjd92yAT0KXd886c3NLfbJ2vFYT/hh
	bRagZ6QVc5MX8gGr70r1nZBT3ip3JfNUD05lTHbVRjyB9nvNe7Zqn33kkFl0dGhxbKYLWjiDpl2
	5DjWBXV8zpsVQc0fL5EfivH6Ez+PEmJRo53P2OPsim/hK+TR7al5HG8NxN5QuXt74o53pv+WjeW
	dOQk+KAFsPV4Lx+86Z2JbbD0bg40T0EnqdTXa+M3TMY5LiDQM0NVNgABG+dMFHuZw0kU6iE0fzm
	ygcPh6txxYNkMszi4Z6LOZ23awI0PIpAhTyiornWzq55lkTVso9NbW0PfdtAsGeOxTe6hxWzG5q
	DnJwgMkSx5GldxYRtomR/+3//r5Ef44Lh+pawwIeo5jpoix34vml8FLcq+AN8dhTN2iQZZdZkXC
	sjxpLIlJNJ2TfPe+zZJYEXqnz/PpYNT41OQ
X-Received: by 2002:a17:903:ac7:b0:2ae:3bb2:a8c0 with SMTP id d9443c01a7336-2aecac850e4mr7392925ad.44.1773349690898;
        Thu, 12 Mar 2026 14:08:10 -0700 (PDT)
Received: from starpt-K55VD.. (2001-b011-7803-1632-e2bc-8e41-031c-dc56.dynamic-ip6.hinet.net. [2001:b011:7803:1632:e2bc:8e41:31c:dc56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae376653sm68389985ad.81.2026.03.12.14.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 14:08:10 -0700 (PDT)
From: Lin YuChen <starpt.official@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	starpt.official@gmail.com
Subject: [PATCH] staging: media: atomisp: use kmalloc_array() for sh_css_blob_info
Date: Fri, 13 Mar 2026 05:08:01 +0800
Message-Id: <20260312210801.8416-1-starpt.official@gmail.com>
X-Mailer: git-send-email 2.34.1
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,vger.kernel.org,lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-55539-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[starptofficial@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 6AD7F279CF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the open-coded multiplication in kmalloc() with kmalloc_array()
to provide overflow protection and improve code readability.

Signed-off-by: Lin YuChen <starpt.official@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 57ecf5549c23..88757076c950 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -253,9 +253,9 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	sh_css_num_binaries = file_header->binary_nr;
 	/* Only allocate memory for ISP blob info */
 	if (sh_css_num_binaries > NUM_OF_SPS) {
-		sh_css_blob_info = kmalloc(
-		    (sh_css_num_binaries - NUM_OF_SPS) *
-		    sizeof(*sh_css_blob_info), GFP_KERNEL);
+		sh_css_blob_info =
+			kmalloc_array((sh_css_num_binaries - NUM_OF_SPS),
+				      sizeof(*sh_css_blob_info), GFP_KERNEL);
 		if (!sh_css_blob_info)
 			return -ENOMEM;
 	} else {
-- 
2.34.1


