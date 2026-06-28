Return-Path: <linux-media+bounces-65828-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SBNoGoAkQWqLlQkAu9opvQ
	(envelope-from <linux-media+bounces-65828-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 15:41:20 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 099016D3EA9
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 15:41:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("headers rsa verify failed") header.d=0sec.ai header.s=google header.b=yxkjHsVe;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65828-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65828-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE8593005994
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2026 13:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686363A8739;
	Sun, 28 Jun 2026 13:41:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F73625B0A1
	for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 13:41:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782654072; cv=none; b=utVNmdMMmBZ/DpwQf1UX7LhEMrnxt3qixDEw/LZO0mcsiIrrV93FkfFon+Or7CWo36PRSKMGQ/1NCvoi4LXlvnggI5Bokg7R+49WdOafU6JtHsn/l4tQ/ea01rWefPk2UwVo14fooePeqoXa2rPW7h5Epnbm0l9u1fSgRUeLjtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782654072; c=relaxed/simple;
	bh=XBXekLwRZHRT2D0ztW+bHD6xNQlbp087ungVh0mi6oM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=av2VpHW2XiSdNrO2wiUHt8R95huVqrByP8e4vbGXZiiP5CziPPlCqrCO40WPTvW79ob+ITt/GomVHTvYTN4RVwpTDYA1CR/2Tq9b3f+BGHNv6PrBsIWtq1StK0ufnWzGx4KHg4WxQbKCi+jrUpzePKb5G4XLi5BACkOQVlStkaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=yxkjHsVe; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493a432c84eso6519815e9.3
        for <linux-media@vger.kernel.org>; Sun, 28 Jun 2026 06:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782654069; x=1783258869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vJS1PKV8SgVRQYqydkpb/m5zHoBNH+se2+aEfHH2UBk=;
        b=yxkjHsVel9yYa26hgekM3lx/XqQde7z13Oaos5+zTnrBRIjiACC+ZNA3IgNMb8p74G
         D8nWM38Bf8xIAfuiAc62JMiGUIKlTqXy5vO2mqPYhtj7u1vClGEkR26to2F2uSqRgJjh
         WszfUIAK5AUG6p2RRqq0dycSJd2rzaUVC3EUiHBISpDU2zsRcH4hTecgzTOHTTBVBE3A
         InE9LKK6Q7hRtoW3KQYZXPkC67fLd6FM4wquRqnUjMXNI5jsSbWe3pC+YcHYc6Ee+4UC
         SOdxI7OI7IWqk1JDXpBGI7/MNDiduqCAq6HWGD0ZslfsjBp9+epmU7+fwWsE113fwLV9
         NOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782654069; x=1783258869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJS1PKV8SgVRQYqydkpb/m5zHoBNH+se2+aEfHH2UBk=;
        b=gIAtmhiDMe+gzU+ZBD8niBwFV0JcD1gZaXxc/zO/i846wRy+ovy3tKHtJEN1uR75qr
         O48xBcPdBgggfvba3LagiJZvYp0B+B9Ks8LxO9gM2tgEtfC3mPQhBivKSBI8MQ0HnDSC
         RFczo/1vL3nc5oaHllEMOyT8pd7mR+de8yyuttzpOWd2YllSMRy4XviHd/JTlhtKbmuL
         Y6A8Bxok8rzJLa4Lhd6Df88Dp6PjD/GeKrAu0eu3oHbZjtAmi2im/jQA8aGQAy/dJhJ/
         19vDqyj0NIPGct6ywZvxNc4DXR77juOT6t8BjIPYFa0flfvGqQGsvdQ5eSx9WhemDcd0
         YT4Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ZZDgtootOEFSsLsXGAm9YwSRwuPmnGRRU0U2nfY81Mkv4kjE/aL1r+9NFVFRRc5DjrGfhThkWi2Qu0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyudPWQAaMLpoh/Ge13HMbxIBVcKc6GkvgQ7t6gibW12kTUFkT3
	/2ToQxNlYSCYWF/czLWkaAkcrDGx3DgReHvLCZ48wQ03DyyV5jbj6oyEzKfejN+F9Zs7
X-Gm-Gg: AfdE7clyGE3/nsIFIwdTcMQ5bcGlpwA77/ZKIIA5V5Zcde7U0DeqRzDVtq820IfIwSM
	ChKq0a64jMb0EJmFL5BhddBDCgRnOGLBwy1UpzDb0SRXdB+UuaPUpeSAtoBLBqR4Fnn2lUKehev
	unbM6d9NJelYMG2OkZuR13Qi+B5/XPYg9YtSn4EW65mJ4ii8MjGWc6tRMxeOVn4isi63Pic4uXy
	GnVMEwKKgBoFosNJkN/ALvfP3ep9hSDahYapS2eyPRFgQAnS3gXY8G+H8lFGj7ZE8JwIC3mFmoT
	Ds22eWbKMnqXkUDdQvbzYXREh3T5F73qd7wwyGkca3PdTiE1JeRYAkDA66//3s6izh+K173P1WW
	BzjHFbJKj9nJMxoCut10Sz9n1MntjQfNkoOmae/QQzF9Nmqmn9+QmMLqKAMb/zr/25KbrndiC86
	mcHGdBFH9pEs2cmacX2EeeUZmP6U+Lt6y+gZQh5qrSESUhGuo6kJ6weLrWVFXefT6Tz5562BUp8
	Vrujkgx+GcPSakzO1SzTCpbd8v+K3cG3pYAC8LyWjb6DQ==
X-Received: by 2002:a05:600c:821a:b0:493:aab3:c09c with SMTP id 5b1f17b1804b1-493aab3c1d8mr13730655e9.28.1782654068111;
        Sun, 28 Jun 2026 06:41:08 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fd9f2esm210836405e9.5.2026.06.28.06.41.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 28 Jun 2026 06:41:07 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: hverkuil@kernel.org,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com
Cc: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com,
	detlev.casanova@collabora.com,
	kees@kernel.org,
	michael.bommarito@gmail.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH] media: v4l2-ctrls: validate AV1 ref_frame_idx and primary_ref_frame
Date: Sun, 28 Jun 2026 15:41:05 +0200
Message-ID: <20260628134105.21001-1-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[0sec.ai:s=google];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65828-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,ideasonboard.com,collabora.com,kernel.org,gmail.com,vger.kernel.org,0sec.ai];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:nicolas.dufresne@collabora.com,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:detlev.casanova@collabora.com,m:kees@kernel.org,m:michael.bommarito@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:doruk@0sec.ai,m:michaelbommarito@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[0sec.ai];
	DKIM_TRACE(0.00)[0sec.ai:-];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[doruk@0sec.ai,linux-media@vger.kernel.org];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,0sec.ai:mid,0sec.ai:email,0sec.ai:url,0sec.ai:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 099016D3EA9

The stateless AV1 frame control V4L2_CID_STATELESS_AV1_FRAME carries
ref_frame_idx[V4L2_AV1_REFS_PER_FRAME] (signed, -128..127) and
primary_ref_frame (__u8), both copied from userspace. validate_av1_frame()
already checks flags, quantization, segmentation, loop filter, CDEF, loop
restoration and superres, but never bounds these reference indices.

Decoders use them directly as array subscripts. In the MediaTek decoder
vdec_av1_slice_setup_ref() does:

	int ref_idx = ctrl_fh->ref_frame_idx[i];
	pfc->ref_idx[i] = ctrl_fh->reference_frame_ts[ref_idx];
	slot_id = frame->ref_frame_map[ref_idx];

indexing reference_frame_ts[8] and ref_frame_map[8] with an attacker
controlled signed value. In the Rockchip/verisilicon decoder the CDF setup
does:

	rockchip_av1_get_cdfs(ctx, frame->ref_frame_idx[frame->primary_ref_frame]);

indexing ref_frame_idx[7] with the unbounded primary_ref_frame. Both are
out-of-bounds reads driven by unvalidated userspace input.

Validate in the core, like the other AV1 frame fields, so every decoder is
covered: reject ref_frame_idx entries outside
[0, V4L2_AV1_TOTAL_REFS_PER_FRAME) and primary_ref_frame >=
V4L2_AV1_TOTAL_REFS_PER_FRAME. The upper bound still permits the value 7
(PRIMARY_REF_NONE), which decoders handle explicitly.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Rockchip/MediaTek SoC
hardware required).

Fixes: 9de30f579980 ("media: Add AV1 uAPI")
Assisted-by: 0sec:claude-opus-4.8
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index ba047d7d8601..5096c48ea402 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -793,6 +793,7 @@ static int validate_av1_film_grain(struct v4l2_ctrl_av1_film_grain *fg)
 static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
 {
 	int ret = 0;
+	u32 i;
 
 	ret = validate_av1_quantization(&f->quantization);
 	if (ret)
@@ -836,6 +837,14 @@ static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
 	if (f->superres_denom > GENMASK(2, 0) + 9)
 		return -EINVAL;
 
+	for (i = 0; i < ARRAY_SIZE(f->ref_frame_idx); i++)
+		if (f->ref_frame_idx[i] < 0 ||
+		    f->ref_frame_idx[i] >= V4L2_AV1_TOTAL_REFS_PER_FRAME)
+			return -EINVAL;
+
+	if (f->primary_ref_frame >= V4L2_AV1_TOTAL_REFS_PER_FRAME)
+		return -EINVAL;
+
 	return 0;
 }
 
-- 
2.43.0


