Return-Path: <linux-media+bounces-61492-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODXoDgjCBGp7NgIAu9opvQ
	(envelope-from <linux-media+bounces-61492-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:25:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A5549538E3F
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 20:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 927CA30AE3CF
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 18:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8803A7597;
	Wed, 13 May 2026 18:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nb/ls1vM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCA93A7585
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 18:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778696375; cv=none; b=D5zVQFccQpvXCLfEkGQz1lhVnvDtZ/fU+ygWBZLzsf7Y7lsGp4JcHEVXzVUri0QgJl9FYd6IdaJUAEzI8Gr8ranhfz8OS2oU6uERNhitRvUsvAFm5Pccq1KZLAx9zUYABNYSuVY3qS3GuKBM2+QGwsMFAcAQ3tQJtSyjYsKAHEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778696375; c=relaxed/simple;
	bh=kjNupAK/J8F0Ik6qBviODgZBc/q9fZtKcmtllAC9dz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hql9meSYqBC/POxG9I7cHXRYO99qqylYehGf5hKmKP1DWvUSHiGbDhJ4Co+I2svqFRlScHwINVS+E6xBuVv1LAhNzbsf/+w/EcdnBwSseg7li9gx9kmOCcyXJqT3bZeTTQTvl4cmZehZgtFTo042lK6yP7MzhIACECWkBdC2QpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nb/ls1vM; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8dbbc6c16b2so918089685a.0
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 11:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778696372; x=1779301172; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KPjNzhHK50cDvgdayyNCGaEkmYz/Q2VYJa8N/oM2vHs=;
        b=Nb/ls1vM3sTdg6EXEvU9aDMTlSiZSW5BtCW6Viy7/zcdTZ+ZJpQk+6IQroCavW06hS
         CbhTJhWORgvy6ktqWenkD/RcaBFFa/VGyHja/gT5d4yQxgh+VcmWS9cIO8vpsPPvoZl4
         ++3qY6cNa43w8J+3SrvwdF1KPkWV/+/9m9qz/TZZdol1LHu4PTh5Um7sVqna7lFgPCMF
         wMm+yHHn8rMC4PIlIgWP7DLP3GV6hnCVdewA06N9oy0pylsFAp4WeRoqSdNVPAusU9od
         SGwxL8LI5UxxkwbQkZzGOPZx5xSO51LTguxiXqTY3r1vLKixNV3VvMExXtEsXUorbYaH
         GrFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778696372; x=1779301172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KPjNzhHK50cDvgdayyNCGaEkmYz/Q2VYJa8N/oM2vHs=;
        b=s7s8Xxig/azv10fDDCJWPb5c2bzFth6y4CTj6esFyG7TPiXXu1Grvl/wd+bIw3lqo9
         XMQ0j6WXqegcmQ4m52WKBCkNDo/3oOeqOrtpVv9UYoYGFaw7OmmE+X7WuXRke6cT7JQ2
         um8hxgTKT7yI+1TWdaWRVgwuqUwMJTqzNUjxt6Fzm8Fy5VSGDf6NYWdpFz5L0204PIPg
         7veSXi+vtR0ryqJcbwlCk8lOaMX0MP2B/AU0lJiiSGELWITA+u1yyilw7JR46KHjxf+I
         M7FwhHEfun+QLYO8+zdAp1921eONU7qNeCj0m7web2S0cU+SyeE6kmGCZPo9dvoTWz9b
         uB4Q==
X-Forwarded-Encrypted: i=1; AFNElJ8wQsANiXNV5tMcpOpkHzrDvdlZOszm+FamBO4IwKU6e7gT6KxGPcOIE627MYtidZUyr1z2tQcqR+i6SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMTxHV/+1F7DcqxqTIsUdQi9hIpyfGKNb3HQkdvsM2OrJWpDr1
	qLMOthsobf8q1EbMAB8419MX/0Br3HfR3wj3XB/5U0J85LkrEhTI+Qpd
X-Gm-Gg: Acq92OFcDVEo5JBWH9xq9HMg1IJFWQjTJByfCgdo7WKYOtLL242P5bitiZpQfBPiicC
	HQh+DWHKdJf6T0TBWy/XGaHbMNfd+OnDIRdfV+cRy1ROl2Houx64aRlzKpCeZs2+h7MlB9OzWKk
	kKPjTctWn2FYtf0hetfKIYWWvFA2YoBTFCFItCno5N7robCl0kEr8lO6lS9qxkZdKAdvGKuaqwz
	izV0pih3TCfQoEjhLfFpvnyWt+Y+z47nuafiazhTGk9nzI1kKK6Jh0p9OwvYptXhSCTPLo2rvZv
	WFRvQIUQDCzjsRkwfHtcxQx/Ts287wJ2VSGBT+b5st+DufuNagsp6YhCPUFyHpeZjziqq+NK9/l
	dAGGofIEqDq9UZRB3VSCoSsfhbDaCXQuEH/4rw6UtFJd/ZTWNP55DvyRwzpe1p+W8vnUyAQnepf
	Qbr41kYPtfu5kLrFLxRvv7En0A0gvIDjR5KzXjP5cUg0sndS+aZo2VqhJiHIIbRWlcBSq5k35Cl
	TMOv7EN0P0Be1aBX/EStAQC8L+dNlSe8taVkgWKtMYIaaH3NiZkHQ==
X-Received: by 2002:a05:620a:8886:b0:910:1c85:4adb with SMTP id af79cd13be357-910b110235bmr62071185a.37.1778696372150;
        Wed, 13 May 2026 11:19:32 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bd02f12dsm27871485a.40.2026.05.13.11.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:19:31 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: rkvdec: hevc: cap EXT SPS RPS control counts before descriptor assembly
Date: Wed, 13 May 2026 14:19:22 -0400
Message-ID: <20260513181922.2075438-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A5549538E3F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61492-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS and
V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS are registered as dynamic-size
controls with a per-control element cap of 65. The V4L2 control core
enforces only the payload-element cap. It does not bound the spec-derived
count fields that the rkvdec HEVC helper later uses to walk fixed hardware
descriptor tables and temporary helper arrays:

  - struct rkvdec_rps::refs[32]
  - struct rkvdec_rps::short_term_ref_sets[64]
  - struct calculated_rps_st_set::delta_poc_s0[16] / delta_poc_s1[16]

A userspace V4L2 client that can open the Rockchip RKVDEC m2m decoder node
may submit SPS/RPS controls whose counts exceed those capacities or whose
prediction reference index underflows. rkvdec_hevc_assemble_hw_rps() then
walks past the descriptor table or temporary-array bounds.

KASAN under a small KUnit harness wrapping the real helper reports
slab-out-of-bounds in all of:

  - num_short_term_ref_pic_sets = 65 (write past short_term_ref_sets[64])
  - num_long_term_ref_pics_sps = 33  (write past refs[32], intra-struct)
  - ext_sps_st_rps[i].num_negative_pics or num_positive_pics > 16
    (write past delta_poc_s0[16] inside calculated_rps_st_set)
  - INTER_REF_PIC_SET_PRED with delta_idx_minus1 + 1 > i
    (u8 ref_rps_idx underflow then OOB read on calculated_rps_st_sets)

Validate the SPS/RPS counts before calling the assembly helpers. The cap
values match both the HEVC spec ranges (num_short_term_ref_pic_sets <= 64,
num_long_term_ref_pics_sps <= 32) and the fixed driver descriptor and
helper-array capacities. Reject controls whose counts exceed those, and
reject prediction entries whose reference index would underflow.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-7
---

I don't have a RK3588 / RK3576 board to confirm this through a real
/dev/videoN request path yet, but was convinced enough by:

  1. Static reach: registration of EXT_SPS_ST_RPS / EXT_SPS_LT_RPS with
     .dims = { 65 } at drivers/media/platform/rockchip/rkvdec/rkvdec.c
     :239-287, the SPS-count-driven loops in rkvdec-hevc-common.c
     :213-225 and :228-251, and v4l2-ctrls-core.c :1213-1277, which
     validates only EXT RPS flags and not the spec-derived count fields.

  2. A KUnit harness (separate, not in this patch) that allocates one
     struct rkvdec_rps + a single calculated_rps_st_sets element via
     kunit_kzalloc / kzalloc and calls the real
     rkvdec_hevc_assemble_hw_rps() helper. Under UML + KASAN_GENERIC with
     the kasan_multi_shot boot param, on a stock tree it produces these
     reports:

       BUG: KASAN: slab-out-of-bounds in
         rkvdec_hevc_assemble_hw_rps+0xb0c/0x1080
         (num_short_term_ref_pic_sets = 65, write of size 36 0 bytes past
         the rps allocation)

       BUG: KASAN: slab-out-of-bounds in
         rkvdec_hevc_assemble_hw_rps (num_negative_pics = 64, write past
         the single-element kzalloc'd calculated_rps_st_sets buffer)

       BUG: KASAN: slab-use-after-free / slab-out-of-bounds reads via
         u8 ref_rps_idx underflow at calculated_rps_st_sets[255]
         (INTER_REF_PIC_SET_PRED with delta_idx_minus1 = 0, idx = 0)

     The num_long_term_ref_pics_sps = 33 case is invisible to KASAN
     (the OOB write lands inside struct rkvdec_rps) but corrupts
     short_term_ref_sets[0]; the harness asserts that case explicitly.

  3. Same harness on the patched tree: all five cases (four adversarial
     plus a legitimate-limit regression with ST=64, LT=32, num_neg=1)
     pass clean, no KASAN reports.

If hardware-side validation actually does reject these counts before
rkvdec_hevc_assemble_hw_rps() runs and this patch is unnecessary, please
say so and I will withdraw it. If it is reachable, I will follow up with
a runtime hardware splat once the Orange Pi board I bought arrives.

Let me know if you want a patch set with the KUnit harnesses too.

checkpatch.pl: 0 errors / 0 warnings.

 .../rockchip/rkvdec/rkvdec-hevc-common.c      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
index 3119f3bc9f98..895fb16bc572 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -408,9 +408,58 @@ static void rkvdec_hevc_prepare_hw_st_rps(struct rkvdec_hevc_run *run, struct rk
 	memcpy(cache, run->ext_sps_st_rps, sizeof(struct v4l2_ctrl_hevc_ext_sps_st_rps));
 }
 
+/*
+ * V4L2 caps the EXT_SPS RPS payload length but not the SPS-derived counts
+ * that the helpers walk. Caps match the HEVC spec ranges.
+ */
+#define RKVDEC_HEVC_MAX_SHORT_TERM_REF_PIC_SETS	64
+#define RKVDEC_HEVC_MAX_LONG_TERM_REF_PICS_SPS	32
+#define RKVDEC_HEVC_MAX_RPS_NEG_POS_PICS	16
+
+static int rkvdec_hevc_validate_rps_ctrls(struct rkvdec_hevc_run *run)
+{
+	const struct v4l2_ctrl_hevc_sps *sps = run->sps;
+
+	if (run->ext_sps_lt_rps &&
+	    sps->num_long_term_ref_pics_sps >
+	    RKVDEC_HEVC_MAX_LONG_TERM_REF_PICS_SPS)
+		return -EINVAL;
+
+	if (run->ext_sps_st_rps) {
+		unsigned int i;
+
+		if (sps->num_short_term_ref_pic_sets >
+		    RKVDEC_HEVC_MAX_SHORT_TERM_REF_PIC_SETS)
+			return -EINVAL;
+
+		for (i = 0; i < sps->num_short_term_ref_pic_sets; i++) {
+			const struct v4l2_ctrl_hevc_ext_sps_st_rps *r =
+				&run->ext_sps_st_rps[i];
+
+			if (r->num_negative_pics >
+			    RKVDEC_HEVC_MAX_RPS_NEG_POS_PICS ||
+			    r->num_positive_pics >
+			    RKVDEC_HEVC_MAX_RPS_NEG_POS_PICS)
+				return -EINVAL;
+
+			if ((r->flags &
+			     V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED) &&
+			    (unsigned int)r->delta_idx_minus1 + 1 > i)
+				return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 void rkvdec_hevc_assemble_hw_rps(struct rkvdec_hevc_run *run, struct rkvdec_rps *rps,
 				 struct v4l2_ctrl_hevc_ext_sps_st_rps *st_cache)
 {
+	if (rkvdec_hevc_validate_rps_ctrls(run)) {
+		pr_err_ratelimited("rkvdec: rejecting HEVC SPS/RPS controls with out-of-range counts\n");
+		return;
+	}
+
 	rkvdec_hevc_prepare_hw_st_rps(run, rps, st_cache);
 	rkvdec_hevc_assemble_hw_lt_rps(run, rps);
 }
-- 
2.53.0


