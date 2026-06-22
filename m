Return-Path: <linux-media+bounces-65384-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M4EJALJOOWp+qQcAu9opvQ
	(envelope-from <linux-media+bounces-65384-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 17:03:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D9E6B0921
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 17:03:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=STkAkxjp;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65384-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65384-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 360BF302EEEB
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 15:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD0B32860B;
	Mon, 22 Jun 2026 15:02:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D8A23B61B
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 15:02:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782140535; cv=none; b=B+Nzw9pE0jgmo8sXjUjsUSKnK5a9mCE8sdcjYwJ7Bwi1FmUNBCXwHdn6+zUG4maQkzACPVB0vDN+0Iwvv6d99XrIGjJ1gJOTrGJAozC0nFNaRFtk4JqLPeAZD41rtlGXYJgrCeeJUpjANE0dAWHQPfrPCn2GTYa4LnAJx54o2mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782140535; c=relaxed/simple;
	bh=/9ukfBK/ztcryyvhhlEy0Hs5YVLUHjAunXJO/dZMFzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PpCzAdYCUQkgR6n1iQlWJjI7KO8gI/4gcMu7TXVHpsOf8etkuMm405xFymbyMV7hYmxJeUMtyuyaYJagAlztzFSok3U4VULzVTawjoQNHPqhsf4NfLCPsrYTO/TKOOm/tOf8EDzaDSwIJ+lXB96C0Fi8SKqlDxqCvJC8qI/y31I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STkAkxjp; arc=none smtp.client-ip=209.85.214.170
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c6afcc99a5so20404915ad.0
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 08:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782140533; x=1782745333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e0XkJklm8rL/krb5iwJ4dfjHil7bNhNhtMSb7+JWpPM=;
        b=STkAkxjpx7MF/X/Om2uvD11GCZJXpjdAK1L+OhzmeNZqyzj7ZIoAUdkySEn0IHjw4e
         6s6aaIyU45pLV+IZ6k9kMfp9Q5QLN1KueF8qBfg8OiTS7GIB2nER0IITEknGj2eSXi8a
         7GgHfWoEbDQH4wXNl+OUHuEMdthY1w/QkBjcRwogLigS+PZS4S5U1jsXjQUAajp2uBEy
         C5adrgRgq/jNmBFefy0TgNE2g0sw7+vQW4qrfS712K4GOZ7JbaC0YX9RDcctiRSjdtgM
         SsLK7BnNlNP92dCQtIj0WYF8ewV7duvX09ZqgHvymPMLOMIUEhmpDYgxc65HdTI9Rl0W
         Im0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782140533; x=1782745333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0XkJklm8rL/krb5iwJ4dfjHil7bNhNhtMSb7+JWpPM=;
        b=TBITN/Ng60cmJj9lTe17GyYtHusGPxsCleDm0nJp++2Xd1EJyhtQw96T2Gtl9NK7EI
         X9sAzZhpqfX1uxS3k8n3HNY1VOfxLA3mnPYIgtvTP6xAzdN3nUSsbEl7PYlMS8EHQod8
         3K3TzN20wvbWBN+5m9+ODyCbWZN1Qh8VqPB9527S2LTWPohmLd1S8y5AAklWNwekrlSV
         MeoyTIZYl9RRcYHAxYanWCw8wmSV+SwHT8+yi0PocyVUwtOeu88NXbGYy4ctEs2c6DqO
         byeDEPs3VmponcH1M8sFJ6uR7qaDcdFYThCGyi3yCk05O1Jf1+P6vdW44x4yO0kcjs0k
         Ulnw==
X-Gm-Message-State: AOJu0YwgX+/barXR4OovhJ8sd0J/V7taQclhHhLyWyx66ajnzM4P275W
	MtGdmet5C2mCnK86U4EV+J71XYIX83qZYevHcohcjYgJJtBe9YeQTdQ7
X-Gm-Gg: AfdE7clzhYkK46HDEbgO8ipXtb0lUqXBcvCJikG1UMKMG06bN/Ah2UozRjDwZv4BZn0
	zetSbt54iv4r2a+iAyLQuLVLJOvosSJC61qfKeOrDxsu/4CBr7xTmiZj/7Qhi0EgWJ/NZV4bbfr
	Z6p74LqF4j+Mu1AZ5JnzO+w0atsV7QCcKtiv9IEpnvQq0ULXltowG8sLfwx8s4eAxP5uI4HBumw
	8oBmWnvF41gYg8wDeFqGNHvc98l1fIkJvUspAjiylGYM1tGwQZh6E8FRl2BEM+3FZJOoqvKZEcj
	D3+7H8XBHWAl5noVX6g1wVvaSAu9FmKD87QjxZnEv2uQDFLPviI+2ogLcPQBoVVYuxiDpxlYy6u
	/PVr4hND81BFmvtBbLsyY/3hmgBAsDLsL/HIXc7MzCG6dIlaeRilUTHtAXVR2KDMdK8wzAvheWJ
	VulkwCA2O8nBRhAPzhzf9DDTbAt+zpBlvgbwutqGea6/oWolCbslzWIhzx6NDDPS0HNdkx3b5i0
	P062uZc
X-Received: by 2002:a17:902:f689:b0:2ba:6601:8e3d with SMTP id d9443c01a7336-2c71952b30fmr125688045ad.9.1782140533022;
        Mon, 22 Jun 2026 08:02:13 -0700 (PDT)
Received: from localhost.localdomain ([115.99.236.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7444aad78sm94228685ad.81.2026.06.22.08.02.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 08:02:12 -0700 (PDT)
From: Mani Bharadwaj <manibharadwajcr@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mani Bharadwaj <manibharadwajcr@gmail.com>
Subject: [PATCH] staging: atomisp: anr: move trailing statement to its own line
Date: Mon, 22 Jun 2026 20:32:06 +0530
Message-ID: <20260622150206.30964-1-manibharadwajcr@gmail.com>
X-Mailer: git-send-email 2.54.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65384-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-staging@lists.linux.dev,m:manibharadwajcr@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[manibharadwajcr@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manibharadwajcr@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 51D9E6B0921

Move the return statement in ia_css_anr_dump() to its own line
to fix the following checkpatch error:

  ERROR: trailing statements should be on next line

No functional change.

Signed-off-by: Mani Bharadwaj <manibharadwajcr@gmail.com>
---
 .../atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index 899d56623..fd50a20ac 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -36,7 +36,8 @@ ia_css_anr_dump(
     const struct sh_css_isp_anr_params *anr,
     unsigned int level)
 {
-	if (!anr) return;
+	if (!anr)
+		return;
 	ia_css_debug_dtrace(level, "Advance Noise Reduction:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "anr_threshold", anr->threshold);
-- 
2.50.1 (Apple Git-155)


