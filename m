Return-Path: <linux-media+bounces-65763-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vUz9FIusPmpBKAkAu9opvQ
	(envelope-from <linux-media+bounces-65763-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 18:44:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 485A56CF366
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 18:44:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=0sec.ai header.s=google header.b=ufw+wRpx;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65763-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65763-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C5E2A3035B86
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2026 16:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801E93FDC08;
	Fri, 26 Jun 2026 16:40:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC8F3F23D0
	for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 16:40:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782492048; cv=none; b=c+Xz/bpIS87w7K95RIVTOB8CB8tjCV+hAl3bZCHTy674GK/NstUH45fv9lBGDnTiVjSpRsEp7umLsdglc11lGjWE4KRwm5pHdM71XY2Ydt0bnPwC5C+RKgXF/q859h7EgqBEvOQ03RffWc5Ab7b1Gbx3c8Y3I/hiU2oaB9g4ya0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782492048; c=relaxed/simple;
	bh=wcDFYdMEdRELPX75oazeC1gMDwgGL1B5HrcZmyU1N5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WBVJAepFCA4aZy3+rgt2OkhPjd9yXPKcdfkKjcz5zWmUIBVYXjyPFS99H+wdfclvEeU9piefaKiajSQz0ZqW0Ev8HaFsnfrMnM7wfLcUxUeFIHIwzS3r1HvoOOqzi3OFYItLS91YU8gvEhrMpxL3zPN8RoorH2TGWA72oMLVvm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=ufw+wRpx; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49230a567a9so6072995e9.0
        for <linux-media@vger.kernel.org>; Fri, 26 Jun 2026 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782492045; x=1783096845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ScBn68mQ55F5HD7Mh91TBJOJlFnEu0XWSeO7Pi9GAes=;
        b=ufw+wRpx1p2RS+bzVcpd+CEKs2hKK5ZIByGjf+ozf1UDR27wkwr2kFV13lAkCcXWHm
         NAXpCo2aZ3Plhy/E5Az11mknXCpb/uS8s8c9jSz+iI/ZSviONWX2V4loPaQ06mnjIiM2
         MkJgDMFPe3xBr56YXNyZgND9iTBafkFamyROTfVmT4PIPPn8ns0WTiGU64aa1E8HKD5N
         yyK/DYjsnYjO114I4F30m/O2yZvNp97EqMO8PV0guKEyA5HxAGOgBi+TiDbW7/XX5oYq
         4uCNCJJK59yn33qg1KhGF9nfiZfLRvHiTDGxO4xY3zlejxegt2H92xbhbt1eqkdGnW/F
         0Btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782492045; x=1783096845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ScBn68mQ55F5HD7Mh91TBJOJlFnEu0XWSeO7Pi9GAes=;
        b=ALGlYFSO4VfhYxsVahvHfwsqxediTu00pYshDqU/2bwEYWsoUP2d3WJNzATdSW90qX
         TWS/v4YeUbcTdwDthDM7lE9mWrLU40uI4tKw1yfI63m1lNGhMuukMXLyFNUffPHNM8XW
         aN2weJ3mrYmBj6GBJA9ecoNrsh5Syv01ono4/vqscbMKOlCBl+JHDEEyZT+iga7JtEE9
         tNMVfXa5eU78H6OiS7wlxSoE3gQ+JKViRQ/3mxkLJCD1YhqYo+NuPFeSuWkE2Be7h9Vc
         PdNW8E6Qhi4OOyU+U90RYP3/JI9Cq4HmTS5II+2xXDIZgeGFeK9yvonjbzcmd8/wFK6Z
         Je+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9gOPleSag+38NRTrQJbuMhohJeb4W39dBGfI4Z923HXfC4Rwqtkc43KldYRCctIKvd7fa8dc+NZmAMbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrPeXScxf/deM6bGYeqYLT1t9zHpeByl88Tpuin0PmTLf7Ry01
	lh9ob9al1PmI3jyo9ETibJDqyMW1WWWhfZ9nQ86uu7TAg0M0h1eUal6kzEODAAIddBB5
X-Gm-Gg: AfdE7cmiZKZuk0WohbsAImqelX38sMvjCz3xulw0TcJ85Cd3H8oDTv02jeMXmWOQxu8
	FE7Om53TBm3go0wgxP345OCDfG7jwH+fYxlEpKx3dcIUO2rb81fFDqbQHFqrvDEcbYCdaYw8mLh
	IzGT+LpQuabI1PdPStzSMRcpOFm6RjlyjVxhA7uETn+ES3vprPdlv/kQwW5CG9IRqacimv5A06e
	bLpGcNtjzw3uTAmopecOawJnGKwGwoDKogD/Tld4MF7PGm8pja+e/LunwXCZMzVlMM7yds6bexB
	j0HggYh6SB+ZKeZhwX8M/o7LBV0zdYGchhaAVWqKQ2BY+DOqUMVfikHFJiaK//w1RWF1Gh//27L
	T2TGVIw5rv8Y3YjZICn2VbkA5s7J0e0tFNnRjavC8ylNQcwIRExYYtsVaedSMzRaaWIiERsMm5c
	iYCBlOrzgQtyBdnc+Ten8QL5Wp7gSkRSB+D/u7Yn16B1sSreQXqTr/W6EHrkcfv/jvUJkToIClu
	x36YUWGzkvd/8D6Hysv8UJdWLCpUJb747k=
X-Received: by 2002:a05:600c:3b9f:b0:492:6d16:6317 with SMTP id 5b1f17b1804b1-4926d166478mr46785845e9.1.1782492045638;
        Fri, 26 Jun 2026 09:40:45 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d998esm25393443f8f.24.2026.06.26.09.40.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 09:40:45 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH 1/2] media: atomisp: validate sizeimage against the allocated frame in framebuffer-to-CSS
Date: Fri, 26 Jun 2026 18:40:41 +0200
Message-ID: <023f2124beb3d2fe9ab0ab6bd31717f0a6c9ff81.1782484857.git.doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1782484857.git.doruk@0sec.ai>
References: <cover.1782484857.git.doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[0sec.ai:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-65763-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hansg@kernel.org,m:andy@kernel.org,m:mchehab@kernel.org,m:gregkh@linuxfoundation.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[0sec.ai];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[0sec.ai:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,0sec.ai:url,0sec.ai:from_mime,0sec.ai:dkim,0sec.ai:email,0sec.ai:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 485A56CF366

atomisp_v4l2_framebuffer_to_css_frame() allocates the CSS frame
(res->data) from arg->fmt.{width,height,format} but then
hmm_store()s arg->fmt.sizeimage bytes into it. sizeimage is an
independent user-controlled v4l2_pix_format field with no cross-check, so
a sizeimage larger than the allocated frame overflows res->data (ISP/hmm
memory). Reject sizeimage > res->data_bytes before the store.

Found by static analysis; not yet runtime-reproduced (Intel Atom ISP
hardware required).

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).

Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9f..966b84402 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3331,6 +3331,16 @@ atomisp_v4l2_framebuffer_to_css_frame(const struct v4l2_framebuffer *arg,
 		goto err;
 	}
 
+	/*
+	 * sizeimage is a separate user-controlled v4l2_pix_format field; the
+	 * frame above was sized from width/height/format. Reject a sizeimage
+	 * that would overflow the allocated frame in the hmm_store() below.
+	 */
+	if (arg->fmt.sizeimage > res->data_bytes) {
+		ret = -EINVAL;
+		goto err;
+	}
+
 	tmp_buf = vmalloc(arg->fmt.sizeimage);
 	if (!tmp_buf) {
 		ret = -ENOMEM;
-- 
2.43.0


