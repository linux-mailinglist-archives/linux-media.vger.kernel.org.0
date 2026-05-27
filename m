Return-Path: <linux-media+bounces-62926-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oZI9FHxLF2r7AAgAu9opvQ
	(envelope-from <linux-media+bounces-62926-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 21:52:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A67865E9B9A
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 21:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D8BE311775A
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 19:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C893B1EC8;
	Wed, 27 May 2026 19:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVFU/fEQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB0E3B19D0
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 19:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779911302; cv=none; b=iaCdxbG5Puxquc4Lw6B+Ig0Fd7r6mxcOTkyM+sy4KUdz5zDR649MmforI4rbXW86ECVMBg48YEQII52e4QsHYIWhsA/G8Bq1SufSgvmsFGTvdjBpfcNQ9XrCSggp/JbCHmEpiplIsXx4GIoJG37YW0s+3LCfTZnxTEaGAq90cQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779911302; c=relaxed/simple;
	bh=I53hd6CWTc3R94gXD+1qGG83yFt3BgYNnue52JOpibA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K9IpkcxqFbgtEa9aTz70zLnMmQS2mmkO4o0nalY1ztv/cPU9rQpK3W0zHmRJqB0qPfA6g64irRUvKN6SQuuUs0aS4/2SbF6f3OfTwmhGPtguVqosrS29N2ii/4JPfjZ2TrU1uHVC+kE7N9tO/V/uG79mjrE4HydZnnPDSWpgE3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVFU/fEQ; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-90fa736d46fso720763285a.0
        for <linux-media@vger.kernel.org>; Wed, 27 May 2026 12:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779911299; x=1780516099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvwC2v7tf0bP6Dcjl3lKTCXZwlNlpqu4CB+86cy9Tlo=;
        b=eVFU/fEQPAp0ZdXRZjGxp829SgOYsKhhyBzp3VQBI8jySwgmIR1tA9zRrGRYKKdfOn
         YGCxwfyj+fwsw4R1JUNuFz4uYo05WlITufcQfx77Wo6EiGtwqup36/r41J46/rDAcriO
         OyjRpaWSHnQ7HradsvDffiMbWHhGbrWfuNXXP39Rtg+TwL5Fv8Wt70W3qrEa+61OeUnB
         N1NHYeNg+6GmfvGn3icrc3lHaDWdSeAwxmWXRr9B78NDdqLKcaBXn7/Gu7YS8a/pN2A9
         nLiZ4UgjOuS9wPqEx+jHfWLHu/Ow1HSdKLrUraWp3nNu/cu4+jPmnq3s8mnXSk/mBloQ
         EAPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779911299; x=1780516099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PvwC2v7tf0bP6Dcjl3lKTCXZwlNlpqu4CB+86cy9Tlo=;
        b=E+St7DNJ9JQyeR9GjjA9R/72/XV7am2uxCrfVyMoxdP74vIT6sJnQyFk9R8bkMZgy2
         EB8bjeUHsUIp4b3RMKMjWqPaOSTkj2mDyVcz89iq9iyWkjyjLF7kP6jbuc7tHxPhillB
         utCkOS+0rrbrFJWiSXsU+6kHLOpohIuertXb/tp2rwU/KZb6KjOyh+s3SoK3SjREVK7l
         eBYsRGRfWgfkqQNjVrYOgHU4y/jGNwybWjbX31bOGmWyjX6tgVP67E5+GMjtsga2JTmZ
         JBMs2mIy2P8mx3kVkqiMfFIT6gw+zaF8MdmJNUC3PR7SLjf83h5pIJ1cPb3j163Zi14z
         HFWw==
X-Forwarded-Encrypted: i=1; AFNElJ8/BvlC8OZntKp5iayNWFHVOE6iUH+AHNDgYLkzwRIa3rCAbQcLOJ1cDtplAw8QnS/+a1LFhbAY13Ly/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC22vyBsGFAFU51LSmJhXgFyTgP1+Ta4b2SfNGQt0Jk1m58AAp
	W5D41uoIhydYhS4wszkt8FWIKL0Aor+cDyLxEs2gRKYQsu1Mp+D21M5L
X-Gm-Gg: Acq92OEVn0U1U0OEWTIhmXrSao9tkEdw4uCqJwXKrIzONJYFEIYwvdr1VVHDKa0MJXw
	KxfBWRgpHiPm6t3vWQDZBgh6+zjC4J6gBXWRgJ3FNjbT3dQ5+MwH0IBa68tUbNnL9Le3mT+JCES
	pg7nUG/P+QTbtfZyqoSiJmnDOaQjzhdGria+HlWq3tkK4dIUnIVnOvPvYS9Uec7le3PN4znAvQQ
	UVYbKJKrDEWZJQJFYBbvf4PSuhgY3TH1eN4cidEhWpNsmlTJAi3bO/6OK0WqUwgKo7GeWXxNTzk
	71kyAaKq8OftQzFOQAh5lmh8p0g6/DtWcdheJMf0ANpTRta0s7UR6MNnEsvorfpUuGZXe17ymIg
	jfK5NP6TFmyTYW19tAQSV2PwfRhvolQnhiSUzEtskW+ZeC8d2RS+kvNc2B0uxjlzD4AbpuH5Cf8
	2pmb0VpThI1kXyavJGzW8Dfluw4lmxg+T8bIJTMSh2KCA5woWjyyLvuwsSWbpRv5jUlBHS2vf83
	amgwnzYDjLKiObUzVT8GptHzn75/VUJFF6kjuF2RicZ70fXgJiKuQ==
X-Received: by 2002:a05:620a:2b45:b0:914:da39:eadb with SMTP id af79cd13be357-914da39ee49mr2225042385a.12.1779911298765;
        Wed, 27 May 2026 12:48:18 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f87017a0sm564942385a.15.2026.05.27.12.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 12:48:18 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 2/3] media: v4l2-ctrls: validate HEVC EXT SPS RPS counts
Date: Wed, 27 May 2026 15:47:36 -0400
Message-ID: <20260527194737.1999409-3-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527194737.1999409-1-michael.bommarito@gmail.com>
References: <20260513181922.2075438-1-michael.bommarito@gmail.com>
 <20260527194737.1999409-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-62926-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,collabora.com:email]
X-Rspamd-Queue-Id: A67865E9B9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The HEVC SPS control carries the short-term and long-term RPS counts
that decoder drivers use to walk the matching EXT SPS dynamic arrays.
Reject SPS values that exceed the HEVC limits of 64 short-term sets and
32 long-term references so drivers cannot later index beyond those
controls.

Also reject EXT SPS ST RPS entries whose negative or positive picture
counts exceed the 16-entry arrays, or whose combined delta-POC count
exceeds the HEVC DPB maximum.

Fixes: c9a59dc2acc7 ("media: rkvdec: Add HEVC support for the VDPU381 variant")
Cc: stable@vger.kernel.org
Suggested-by: Detlev Casanova <detlev.casanova@collabora.com>
Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 6b375720e395c..a1d773e5de20c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -16,6 +16,9 @@
 
 static const union v4l2_ctrl_ptr ptr_null;
 
+#define V4L2_HEVC_MAX_SHORT_TERM_REF_PIC_SETS	64
+#define V4L2_HEVC_MAX_LONG_TERM_REF_PICS_SPS	32
+
 static void fill_event(struct v4l2_event *ev, struct v4l2_ctrl *ctrl,
 		       u32 changes)
 {
@@ -1213,6 +1216,10 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	case V4L2_CTRL_TYPE_HEVC_SPS:
 		p_hevc_sps = p;
 
+		if (p_hevc_sps->num_short_term_ref_pic_sets >
+		    V4L2_HEVC_MAX_SHORT_TERM_REF_PIC_SETS)
+			return -EINVAL;
+
 		if (!(p_hevc_sps->flags & V4L2_HEVC_SPS_FLAG_PCM_ENABLED)) {
 			p_hevc_sps->pcm_sample_bit_depth_luma_minus1 = 0;
 			p_hevc_sps->pcm_sample_bit_depth_chroma_minus1 = 0;
@@ -1223,6 +1230,9 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		if (!(p_hevc_sps->flags &
 		      V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_PICS_PRESENT))
 			p_hevc_sps->num_long_term_ref_pics_sps = 0;
+		else if (p_hevc_sps->num_long_term_ref_pics_sps >
+			 V4L2_HEVC_MAX_LONG_TERM_REF_PICS_SPS)
+			return -EINVAL;
 		break;
 
 	case V4L2_CTRL_TYPE_HEVC_PPS:
@@ -1267,6 +1277,11 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 
 		if (p_hevc_st_rps->flags & ~V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED)
 			return -EINVAL;
+		if (p_hevc_st_rps->num_negative_pics > 16 ||
+		    p_hevc_st_rps->num_positive_pics > 16 ||
+		    p_hevc_st_rps->num_negative_pics +
+		    p_hevc_st_rps->num_positive_pics > 16)
+			return -EINVAL;
 		break;
 
 	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:
-- 
2.53.0

