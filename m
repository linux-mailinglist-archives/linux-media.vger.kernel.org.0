Return-Path: <linux-media+bounces-65072-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fHudJkIEMmoTtwUAu9opvQ
	(envelope-from <linux-media+bounces-65072-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 04:19:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1150D696152
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 04:19:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IwC5s4R0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65072-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65072-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8190D304CFCD
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 02:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39CBE3009F6;
	Wed, 17 Jun 2026 02:19:30 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8E9285C91
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 02:19:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781662769; cv=none; b=F3aAfXdlHKluxJ6USKkCY3ML5hFZLyqw4o9vtwnAZXEQaFUhvYMUofRe3qs8rIjTXQn4Ft/yT5pJpDuy8LywKrxBsIdCI+UPrySM8cZE0J1Q62BnSPp5XmdLlRvPAQorAj+HQRmagw4CWQAh8NuBqOPYQn0SMpISEkqQdftdBXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781662769; c=relaxed/simple;
	bh=gUMUYpn3PwDj3mjyt/AnF1We3zQA6b0XllB67XsfCmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PdF7p/IqtXQJiaivR+N1R3avGwSPNa6TyEXE7JbeoqPNZOJo7sAcqKSNZQkaP1GOrnxNBBn38BOF0lKzDLdKgEyP+HA1kBg1382n1ax5UoHEz8aQ+TAahXVkn2bi8/xu/02odRYZx9x2BkC5tS1d5ArlSOqBr35xYwyf15UtJCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwC5s4R0; arc=none smtp.client-ip=209.85.160.174
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-517760dc3c2so34658241cf.3
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 19:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662767; x=1782267567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZ9wck5P6r9OGqEQx9lSHX/yZ9cfcypeRcv1sXaGY/s=;
        b=IwC5s4R0TJItD488d7TXjoGaFfDUf+/+ZfXhp7doCg6U4654DTAgPTysr8bdZ9xmtV
         wvfZsk0OVxVjrbUJorIrRVAFAlv4Rk9W55PvnQmarbRTLzcrD6CtaBdqnaMCKNnknCWe
         t6akqG0M6JDzi/iTdkMbBNFUDZyGNP28PKPcmf7X7cxIkJkHoWMPdB3Tusu7Xw8TpEXJ
         TAFkZTQBcX98kZJIxWzrcYgOLV+4N0Vj2gzqS7YNq0WjC0F2H2+y3MF407XpQ5ycgwPW
         rZm2c4b2T9ta8/L0xjPc7t70kku/cf107wPBQ67KR6U4Hwavc9xJVsc6IlUgNhuPrKAA
         JNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662767; x=1782267567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XZ9wck5P6r9OGqEQx9lSHX/yZ9cfcypeRcv1sXaGY/s=;
        b=NspwwIQJLMBlCrSh6gvNuMXRWaislM9kcB0GRV3cohSF+wltwOxJlZT2mcC40ONZgo
         7nKcGy5RJCaZ9E4WR1md8Deg1eSDGwfBzzmzYsZjI+BRYBL+lplgUkAis4jEDor6ezqZ
         YuUilUlbUwDJs74ZpCh1kMt3ij+xt8sJBo8PGcMHPgJRed6b4Sul2FWvrKufl5vJDdf1
         qokF83GTcbnw+SjovJAYlGP7SPaAp+8mPHvlNn2w19j7yuhzT7X4+ugjc1kF+99m3Fma
         qoCASSVQVqACfF97/aGqrwm4iJjch2Ka7ExWKXKcVdbR03Sm8i+06HPbQQdvVh1dFhxH
         yRmw==
X-Forwarded-Encrypted: i=1; AFNElJ8v+pitZIgTX5GxlORVY+dlgL7jEMMg4hP9K0VMjoc+lghN7N/JmLMjA7IDtn/gLhY8LhrA8p7fcSfeZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yycazsy6/j4iihnhpbXgj5y/oP5DxdNeDz66zTX3FodQbfQxWvQ
	zkWdHaHTOK6W9C9h+BvItGDMa76vEMie0letIaNFXFkJG+P9710l8bCb
X-Gm-Gg: Acq92OGm8ZQ8/wKYYUQO+doQpDhWvcfRBlJLxlgwvbHsZQegC4QqnYN7PVq6hW9z82S
	wtwIkk4pytRgpZtp9UVZhQi+hsIM0j1tWbU3RQovK8uknGe4DLEvnc+2OaCJVP2xng6kSCNrpA+
	5K0e7YD7GHvYc4yqBoah+QPhBSJQ0pQ0H6LsIGCNjfQ7CXLtbJu8nZpl0RZlBSktI99+4gPrGXa
	AjAwMbpjHErnrelsjdyQGEUzd7oU32J2jvS9wA0DwzVaYT1s3Q61obMl6TQ94NiaI/n1n4Lez/s
	2096qz+IRThZkFdci32ytNeK5vtF82hjF/t+h8F/xjMtUnmPxW/4RygcNM5r/BfETywmRT88ixa
	uRjsMUylhCghVuProCvw7+RvcLmfSpargaAto16h77yYhQMap8OEMjB4uXA13eIbmlzvog6ROwz
	iuXwfsYy1rSgjfaOtl3VwReb9xI5dDNIPAxBXOgvLst1UsMutfBw/UsZTdZfZia4Xfb9AWJjLfB
	GEGmrEV7sa4EB82N740vG/2Vyb2Vgpk
X-Received: by 2002:a05:620a:280a:b0:915:6504:2a11 with SMTP id af79cd13be357-91d8d7a6a6fmr417807285a.44.1781662767410;
        Tue, 16 Jun 2026 19:19:27 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e35sm1657646285a.28.2026.06.16.19.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:19:26 -0700 (PDT)
From: Michael Bommarito <michael.bommarito@gmail.com>
To: Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/9] media: v4l2-ctrls: validate HEVC tile counts
Date: Tue, 16 Jun 2026 22:18:58 -0400
Message-ID: <20260617021906.2746743-2-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617021906.2746743-1-michael.bommarito@gmail.com>
References: <20260617021906.2746743-1-michael.bommarito@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65072-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1150D696152

The stateless HEVC decoders read num_tile_columns_minus1 + 1 entries from
column_width_minus1[] and num_tile_rows_minus1 + 1 from row_height_minus1[]
and use them as tile-loop bounds, but std_validate_compound() does not
bound these u8 counts. Reject a V4L2_CTRL_TYPE_HEVC_PPS with tiling
enabled whose tile counts exceed the uAPI array capacity, mirroring the
existing compound-control range checks.

Fixes: 256fa3920874 ("media: v4l: Add definitions for HEVC stateless decoding")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 6b375720e395c..6d478e1a5ef22 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1242,6 +1242,18 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 
 			p_hevc_pps->flags &=
 				~V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED;
+		} else {
+			/*
+			 * These count the entries the stateless HEVC drivers
+			 * read from column_width_minus1[] / row_height_minus1[]
+			 * and use as tile-loop bounds.
+			 */
+			if (p_hevc_pps->num_tile_columns_minus1 >=
+			    ARRAY_SIZE(p_hevc_pps->column_width_minus1))
+				return -EINVAL;
+			if (p_hevc_pps->num_tile_rows_minus1 >=
+			    ARRAY_SIZE(p_hevc_pps->row_height_minus1))
+				return -EINVAL;
 		}
 
 		if (p_hevc_pps->flags &
-- 
2.53.0


