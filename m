Return-Path: <linux-media+bounces-64804-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YZcOJDPQLmob3gQAu9opvQ
	(envelope-from <linux-media+bounces-64804-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:00:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1919681788
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:00:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XN1CZtl8;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64804-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64804-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5569303526F
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 15:56:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41ABF3C8C70;
	Sun, 14 Jun 2026 15:56:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DF33C8738
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 15:56:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781452585; cv=none; b=FJ1MYMAIojp2L56SojBlIRuhhC+zPd95e59LX7b4cX3Z/5f+cjp/gKocgYPlZbvT0ZTkLUKmlScE8CXZrbDtaM72DhE3cDhvG4erNsF5tr3/6wxZbZc93uNhEBGhT/ZGvsVAqJ6nt0MFiXeQcK5UWEXpIs0hktioF/UrTxBCdkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781452585; c=relaxed/simple;
	bh=3KLh89mDhDdVayszBxxlbw+uuMcGM3EZXAmm1ZBvebU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nYIA56E/xdqt2+tfqnmEdjbb9oOjVe1kbya6cJklemVBAE3Rhv5RHHkvrIlHDfOJAWNmTH0/UWU0vqXILFDYh5TkdyqGFP7A98T7TWOt9ExXB+eZjXXw2r8LtoD4X+aQ2aKmrOD/22ykZySF5/CA/LJUlsHIxGkWXKQ7b8bFGBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XN1CZtl8; arc=none smtp.client-ip=209.85.219.50
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8cce77eb087so22407196d6.1
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 08:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781452581; x=1782057381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppzEj7clxwYqaF2xsc1Xu8dwkm63CSTY5UlsiLbKHOs=;
        b=XN1CZtl8hDJS14UI02OZPqhJdTAFllsjVyGRHkjRMU23RXUyBFkk+7krP9wjqjd6TT
         9UP1ELj9ZwP99FsiEakO6894MrRvTnFbM3nqZkLQDHNgpWAxKzVPAhSMjrSC2DjlcVkz
         AiKDCFhPVZ0Hoqe/PBd3AhFFtWSWFTlyX+Uit4GbOiNdHUz4DaPJ3Cp3zXJ4cgaIFZny
         IqN0mB/s/7XkFFuXWN0r3UfqR5MJUNgDTG9ornMlCLyBzFaaYJZVv0/+l8G67jLQfKqL
         Ne1xyIpIo+GIgLSaeIPUzBlmhilbkyOrY0P2JOi6hXMOZOeWf7XEvxSmpdn4unKhIiox
         YR3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781452581; x=1782057381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ppzEj7clxwYqaF2xsc1Xu8dwkm63CSTY5UlsiLbKHOs=;
        b=mpXbdSpt4mJIXilQSJJ2zWJxahVCRgFMYE5ix+1me5BTE/H2FMXK/ZQoScaDqTxpRj
         pwWVbj9kqXdKSbKUa57tnQVc7QCVrsE4NhAwYnOLFJuKrENRntPDNzSRsgblEaPaAh1H
         ECnew02kS8hayj9BAGVRYTPbUpLYeo5oSSJVSSgrAl0cDDO8DLHBX1l+5PXT7yXLE/0G
         aS2hYjoa0CHvAb9sbvG5hlF7l0UTbthy668fpU7nj8otpYx1k0KbL+h2+ejDCL0x9Lzr
         hpr+T80d8kVmvJ+1aqUCAFNdZuZlR9aCdU90XlnOLmJk8WDM2044KVQqZDxrn0EYpzT3
         bsfw==
X-Forwarded-Encrypted: i=1; AFNElJ/S4AXft6M22X6Tyz9peoSDeB9tuH0yQh5EDtoMTJ47ZjmARoPpCkT6joE6WlXQqwbCWaf95z5G73vbYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXE7SZb99ICphaPk5I6Vau34lAzJFNi0N29WLj+DqTZcIfZxi3
	eLiokwwINbrbCmsFd8A8zrFicIsR0KCnUVuUQ+G/81debpwmDebu6L0X
X-Gm-Gg: Acq92OF9dtErUyWE4xOJLqIYaxvOiXF6O4bgKniIxD+XxiKRdKqmD/rm7ei9GF4g7Qf
	MQEfmQHMGEwLCqtG3lEjRBldJKX2CKPeTrqNg31ZsKl5WrmmuXygnxB+28GpM5iDPMVavPLL0lH
	P5Iun6yooeWv4lBI8c0ORss0/nQMMPw0eTmi8sgdehpyunhHSK9ZzIEfydNQMNVTUXPi0zWJ0a7
	5vwyYki0EEmOFlcbdMXjNNccFEeefDSwUO8O05hQdqbCi78OQIMTCNi9z49334fTDuGDTDSxw6J
	R9v8EP2Bym5h7rk8XdSb1oNuTodM+uzxsNBoSnxis1KmRxqA58HZajokWQ9Ya5ta389CfEmA9wQ
	ZYpIawqP/XFf01RPqPTA6I8fetI0LVaKD9gTGUQSHFKYZfLDptOr9iDL/WKIM1jCcZDEXdkdlyd
	k9nfrmey4Q2dFQesfZGGOsE9ku4FBD36+jdXbZrm80HDScSmJ4sN0reNGBof9Ez5chrWY9boA4F
	2PFblvSMiwyVQW8o8RPZEDbGARRJ2i+YtpH/4lhK7I=
X-Received: by 2002:a05:6214:40c:b0:8cc:ef56:d997 with SMTP id 6a1803df08f44-8d32bd2d8cfmr184388716d6.7.1781452580813;
        Sun, 14 Jun 2026 08:56:20 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d30522cbeasm82008446d6.44.2026.06.14.08.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 08:56:20 -0700 (PDT)
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
Subject: [PATCH v2 5/6] media: mediatek: vcodec: bound AV1 tile-start copy to the array capacity
Date: Sun, 14 Jun 2026 11:56:07 -0400
Message-ID: <20260614155609.3107600-6-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614155609.3107600-1-michael.bommarito@gmail.com>
References: <20260614155609.3107600-1-michael.bommarito@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64804-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1919681788

vdec_av1_slice_setup_tile() copies tile_cols + 1 / tile_rows + 1 start
positions into mi_col_starts[] / mi_row_starts[], which hold
V4L2_AV1_MAX_TILE_COLS + 1 / V4L2_AV1_MAX_TILE_ROWS + 1 entries. tile_cols
and tile_rows come straight from the bitstream; bound the copy to the array
capacity so the accesses stay in range.

Fixes: 0934d3759615 ("media: mediatek: vcodec: separate decoder and encoder")
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
Assisted-by: Claude:claude-opus-4-8
---
 .../mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c       | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 2d622e85f8271..49d9b4a72387e 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1299,11 +1299,12 @@ static void vdec_av1_slice_setup_tile(struct vdec_av1_slice_frame *frame,
 	tile->uniform_tile_spacing_flag =
 		BIT_FLAG(ctrl_tile, V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING);
 
-	for (i = 0; i < tile->tile_cols + 1; i++)
+	/* Bound the copy to the mi_col_starts[]/mi_row_starts[] capacity. */
+	for (i = 0; i < tile->tile_cols + 1 && i < V4L2_AV1_MAX_TILE_COLS + 1; i++)
 		tile->mi_col_starts[i] =
 			ALIGN(ctrl_tile->mi_col_starts[i], BIT(mib_size_log2)) >> mib_size_log2;
 
-	for (i = 0; i < tile->tile_rows + 1; i++)
+	for (i = 0; i < tile->tile_rows + 1 && i < V4L2_AV1_MAX_TILE_ROWS + 1; i++)
 		tile->mi_row_starts[i] =
 			ALIGN(ctrl_tile->mi_row_starts[i], BIT(mib_size_log2)) >> mib_size_log2;
 }
-- 
2.53.0


