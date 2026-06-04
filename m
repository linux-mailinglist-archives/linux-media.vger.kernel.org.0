Return-Path: <linux-media+bounces-63712-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mCh3BADOIGpI8AAAu9opvQ
	(envelope-from <linux-media+bounces-63712-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 02:59:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AAF63C201
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 02:59:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=H0QK68Xy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63712-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63712-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1ABEE3025D08
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 00:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256D42192F9;
	Thu,  4 Jun 2026 00:55:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B843142E83
	for <linux-media@vger.kernel.org>; Thu,  4 Jun 2026 00:55:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780534518; cv=none; b=P7dc0zdL5dc0UBMG00cCX1DPpuIVYYavTe9vfXgBZaHciF+8KfVq4iUQ07Bk87HA4RuO63W3JMiEs6FrJa256DRuk+AUCfqvzrIKdpyIsw/8gn6x8u6UW5F5a0UicKlSQpWA0xNTyUkV+gtqhG6kfReHlgej5C3vlVrWMdGBqo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780534518; c=relaxed/simple;
	bh=yGhRIMeacotGfJlIigmuoxejG7RGESTZ+fzgqVERoyg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=boJJykZTZfnq3iMM6fHG1FDx9/RQAAJYeZmHAxtsPLrsBIYnaLLVy57a3roHp/An0Z4pVnI5mKRou6h2xoMAhdfRGRO5bqwlGtSNJ/BTP633OTW++aLfHt2AIJ6tSx0nYotq+hs001tWRG8xDAMRc7v3Tg7xfcEdvJNvVN3/yJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0QK68Xy; arc=none smtp.client-ip=74.125.82.65
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-137dd5161feso122888c88.1
        for <linux-media@vger.kernel.org>; Wed, 03 Jun 2026 17:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780534517; x=1781139317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TSfuYLVnYIYRYjEGEV/ESmCiKsmLtg7Q7vhA9dB5Q3c=;
        b=H0QK68Xy3l/IcK4uCgg9vLSevD2WylKSbl3FXEFHJre9FoIMg+b5roD4vgymH8+I3w
         hexNljv71G+XDzmfV0ArljpUoNcsb8fs2n4gje6y0D+m1+CDDTn3JmuziDkt+APi5Ahe
         2ALlXxNkI8ZYz4IJagI1lZPddejJ6PuonebrKrs+2jmH0LhXbWh6upPQn8FOgLHfJgVg
         fqE68chXC8iDpN7YQf/9cAFreRSeFdAwlnHBme7AvCeKPZQ9HxeelQ0S3/3eEpcyl3ih
         p2V7ImIJZc99NAEnetrDtvZrgo24BP5DPxsDGZAmq67T9vJIPHjemQd79VSAFXvMgZje
         zYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780534517; x=1781139317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSfuYLVnYIYRYjEGEV/ESmCiKsmLtg7Q7vhA9dB5Q3c=;
        b=E36TXmC1lIl3RV7LXBMlJXdVJfJh5pckKrbk8npCbJjTwZeMEp35hx1vpLpm/GkQpG
         3y0J1PjTDUsUpk/CrCUYb+BA2ZUhEOxNzkpLpr+xkWASaJNR7Fij1mMzvzB5Eh1tyEnT
         8Gc935EUL30aY5vF+QFOsbl/vlrjkDV0b7jJHSBF1nc1fONFbvedsmL0y7iZd3QSoIWY
         vQHiH35ZuUpEtm4mIQXs4Eh5qaDhpuElZifD4IFhXfGrgF/N40CKpt8gh1qeW7HQxc1U
         jdfUmsdK4RmkQsv5n2v3DE+dKGWtrDiTqGciUyC3NMYQCbQMFE7OeEl5KXqeKpv21JFC
         AMZA==
X-Forwarded-Encrypted: i=1; AFNElJ+ne0a7RcieQdNmoJnbf8hCTX6piehTGut0dG2aWF6NZZKPhSUIushVYezRPhiYCPDpZjyBHmSdp172ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXSYevfKtzpbvD7OPFYYoYHqxLV99N7dwntnuCz2K4VRN5Wpab
	jlTSmlWMkct7ULuJjMEvvOaBE6Aazkrx4c0LyWNl9Kaz8HQih0qXuFYYCeEvoQME
X-Gm-Gg: Acq92OHZVRN72+cm8bhaoQ1G5TSW55uMAr4f5PXJ/fRtOw7jPW9JJqfANzFNjDF/OTl
	lGKBdFQOkX8Exg91gC+zbHPhXOmtXX76kCjbU1Xhn9zUtayGcdhYT1mUCN2mWWunn8s3haE9RLF
	/jN3C4YFw3QdN5zRxdAgSw+j0+47O+FZc3ax++QPv7BiVhiXWR4qfh8y+qdj8ZeW9GuY8OBDgdK
	S91Iv2PRRoi9H/Ey5Odn3eYeNqJluEI+vBVgpC6GeeARYFM8CdlxBqNfYyKzUrXSpWixdyj6FAz
	MWHAro6LhI7gF7ieFkpVdo15X77qOcXJ4qYBcciS/wuyvA8/zyxwRTf6hHtsiNSRJw9iMD/c87H
	dK0xhfo1X2EWDDAVr79HmsEOhEKL7NyIPAD0tRYX6gf8cJkSJObbfpWUbIZiIbjtyXOAubyB5nl
	7Jj9McPoCoz8+faMaysESY4sSAcKzvopAmN6dh7AV0EKXGfsa0vq9132zCBF3CvLCLLw==
X-Received: by 2002:a05:701b:418b:10b0:12d:b3f8:60e7 with SMTP id a92af1059eb24-137f6be4d67mr1966956c88.34.1780534516639;
        Wed, 03 Jun 2026 17:55:16 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539035sm3106891c88.11.2026.06.03.17.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 17:55:16 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: rfoss@kernel.org,
	todor.too@gmail.com,
	bryan.odonoghue@linaro.org,
	mchehab@kernel.org
Cc: vladimir.zapolskiy@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] media: qcom: camss: Rename unused macro parameter
Date: Thu,  4 Jun 2026 00:55:05 +0000
Message-Id: <20260604005505.39275-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-63712-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:mchehab@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dennylin0707@gmail.com,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 52AAF63C201

The ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_0_CID_c_PLAIN() macro
declares a parameter named 'c' but uses 'cid' in the macro
body instead.

Rename the parameter to match the identifier used in the
macro body and silence the checkpatch warning:

  WARNING: Argument 'c' is not used in function-like macro

No functional change intended.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
v2:
 - Parenthesize macro argument to silence checkpatch check

 drivers/media/platform/qcom/camss/camss-ispif.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index aaf3caa42d33..20ccd7b1f11f 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -83,8 +83,8 @@
 					(0x270 + 0x200 * (m) + 0x4 * (n))
 #define ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_1(m, n)	\
 					(0x27c + 0x200 * (m) + 0x4 * (n))
-#define ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_0_CID_c_PLAIN(c)	\
-					(1 << ((cid % 8) * 4))
+#define ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_0_CID_c_PLAIN(cid)	\
+					(1 << (((cid) % 8) * 4))
 #define ISPIF_VFE_m_PIX_INTF_n_STATUS(m, n)	\
 					(0x2c0 + 0x200 * (m) + 0x4 * (n))
 #define ISPIF_VFE_m_RDI_INTF_n_STATUS(m, n)	\
-- 
2.34.1


