Return-Path: <linux-media+bounces-65073-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id c42VHmAEMmobtwUAu9opvQ
	(envelope-from <linux-media+bounces-65073-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 04:20:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F8569616B
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 04:20:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LvPXP63X;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65073-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-65073-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CBA7A301C5FC
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 02:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD04B30D41A;
	Wed, 17 Jun 2026 02:19:33 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A751C30595B
	for <linux-media@vger.kernel.org>; Wed, 17 Jun 2026 02:19:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781662773; cv=none; b=NDwx3MjKcJ5+ADTIuFmW4Vg52W8LBAoGIzYdDQXuNArCC1jpjOZ2JoPDz3Rl9ENwMt3TJ2jXhE3eWmPhH3yon29CcDGHDKnMfi6LFEJWT4UsRAShPe02TpzG729oEcHtN0vZZ7ieJVpguO06hpTI5YY7GIdJMIxQaMIcziVD0EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781662773; c=relaxed/simple;
	bh=Mx0g8BYiH4JJVDQ/qQsay5AAAsvT94G+UkuQhrIJeSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AzUDBnVft/9F06TA9GkIK4usG/xOFdKOP7ex93A9kJFmnSZnXKA7fHw/uB4UjsH2N2fCazn2EVHPPDPWW/ZOqYkfZafYm3VfHQEs68zYeahQqxObxZvceL9MqkLEys6JUttCcF+AHNlh4wuQ3DAgYsUP+8nr3MC/hnCXkyW3vB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvPXP63X; arc=none smtp.client-ip=209.85.222.170
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-9159f631656so65993985a.1
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 19:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781662770; x=1782267570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sml+UeKb9+6PbEr3ie8aYF51m/8hlVenyLRv+O5D8SY=;
        b=LvPXP63Xy5hRJuX5xFLEqvgMgjgONr1gb35QnyMK/nuyBjQ4MH2G+8oJV7oli+XkPC
         ZXhz5/HSGW4sRn7xAC8zJBD7gKNcNn8ClVmSGYvXj4Sl5jyImiKExqs4H7eYdTsVU5ny
         euFe9zlQfISeUjAN1oH+x4xmxYjrPYgsg8QccvE5RziQ5fb7koNcP73TC+U+ao4CfB0n
         8wsuYvzQ4L/ZzYBVW5Xw3wMYRAuCXB4HEQ2gOdlF9N1LenJX+8/4ephNuYPQ3hsXaWUx
         0cOfNCYshNEOXz/6qww/pQ3CNcmA4vcGnbfjUo4PDd5/aQZdfkqhamto8XDQvQqrQEVC
         TZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781662770; x=1782267570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sml+UeKb9+6PbEr3ie8aYF51m/8hlVenyLRv+O5D8SY=;
        b=JdVZeADEfBsBNEGSE9ujq+TKyGsOF4xoQCXAQKM5MFgw4excGUWfal3ng09aLfJqlU
         SrhKV1ZPCyhfkRarG5mI23OmOEv0kIV4DcMg9ij1N/iYO0SFImeAyKoHhw8jkAAcVdpq
         vPu6xv/JyLuAlFglc/QtRAc9LPixLE23YieYs0l1+LC9J+ehXHHAr4TfM1BLks4d8kBR
         WROeOBEZ5ViVqSUED4bVpd370v840bcc2uIt1eonMWXV3e8mzXNal1tv6kVU8kWjpzP8
         A8puxzlQjaxX6pli7gXQx+ktdhSCFdG57z7772LiZp83HPmS1iwFVnqkjx03P8J32WWE
         3bjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9cay9MoMlHlTqLOwRCnNCxbVHB1IPL/ab6NyQRisYKgGEXVUtf15xSQSz8pS2m3iPDhY4QTARU1I++0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHIRGtRotDNuYecZwqmCuJ4zf4pAFUITp1lRtEXU9NdZRpGxcV
	/aAS6cLsRurz5rVBwzXFYicHXfjJ/xg2tYtuK/40xPMyUsETNBAvtH5V
X-Gm-Gg: Acq92OEtCh1JvmDbrfJLYkB2TT8G1+u/AE9d643Q/N/d/wuJ3OI91+RzJ+9VTsha/4v
	OdaweHi5G41rlu9tZ15QRz2OZ5kdHP/SsfZjcLL6qIU+R4sutyVJp6ACjLNPD87/H3JE52k4lNr
	BtNPP01Z2XHOX2DcF443M8es8OjuCgvQt2iBl5yYvlDK/YykBzByLNd+LXCDZOlh9avlnT8v0Le
	o9esN7W3ba0sdygFa5OBSBs07Y0h5SXRjesOPwl+oJ2uiBIB+mQheFQGW9RrxRk3yaiDVz07pZb
	RmTe89ZEfxFO8hFsdqXLZqhF0XSZpoZyi6RJ6dTUgW/pHNg7lbgMCMWzhQVLpUPfeWR9oscu94m
	AkvjcCbVKQHT/7vFmGTksLbmpKkDA77mB3Wcxz5qib+VgUvTsdFdXXDGe/JzvLXLyz8EyFCPcos
	8CqVhAALeEBC4vk+zxx2W3VN4b/4vnrpA8P1X5RiuHCxkW6g+f0rNMl9QL2SCsGPQ70qyuzjeCz
	pzC+ASOymkTejPwtVmhrQtq0Ou23WQb
X-Received: by 2002:a05:620a:25cc:b0:915:351b:3ad5 with SMTP id af79cd13be357-91dcdd72cbfmr167100085a.29.1781662769637;
        Tue, 16 Jun 2026 19:19:29 -0700 (PDT)
Received: from server0.tail6e7dd.ts.net (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006e35sm1657646285a.28.2026.06.16.19.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 19:19:28 -0700 (PDT)
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
Subject: [PATCH v3 2/9] media: v4l2-ctrls: validate AV1 tile counts
Date: Tue, 16 Jun 2026 22:18:59 -0400
Message-ID: <20260617021906.2746743-3-michael.bommarito@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65073-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:hverkuil@kernel.org,m:mchehab@kernel.org,m:sakari.ailus@linux.intel.com,m:nicolas.dufresne@collabora.com,m:laurent.pinchart@ideasonboard.com,m:benjamin.gaignard@collabora.com,m:detlev.casanova@collabora.com,m:ezequiel@vanguardiasur.com.ar,m:yunfei.dong@mediatek.com,m:jonas@kwiboo.se,m:heiko@sntech.de,m:kees@kernel.org,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[michaelbommarito@gmail.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75F8569616B

The stateless AV1 decoders use tile_info.tile_cols and tile_rows as loop
bounds and as indices into the mi_*_starts[] and *_in_sbs_minus_1[]
arrays, as the divisor for context_update_tile_id, and their product
bounds the per-tile descriptor buffers, but std_validate_compound() does
not bound these u8 fields. Reject a V4L2_CTRL_TYPE_AV1_FRAME whose
tile_cols or tile_rows exceeds V4L2_AV1_MAX_TILE_COLS / _ROWS, or whose
product exceeds V4L2_AV1_MAX_TILE_COUNT. A zero tile count is left to the
consuming driver so the zero-initialised control that existing userspace
submits is still accepted.

Fixes: 9de30f579980 ("media: Add AV1 uAPI")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Michael Bommarito <michael.bommarito@gmail.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 6d478e1a5ef22..fb20ad13dfec7 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -790,10 +790,30 @@ static int validate_av1_film_grain(struct v4l2_ctrl_av1_film_grain *fg)
 	return 0;
 }
 
+static int validate_av1_tile_info(struct v4l2_av1_tile_info *t)
+{
+	/*
+	 * tile_cols and tile_rows index the per-tile descriptor arrays and
+	 * bound the tile loops in the stateless AV1 drivers; the product
+	 * bounds the total tile descriptor count.
+	 */
+	if (t->tile_cols > V4L2_AV1_MAX_TILE_COLS ||
+	    t->tile_rows > V4L2_AV1_MAX_TILE_ROWS)
+		return -EINVAL;
+
+	if ((u32)t->tile_cols * t->tile_rows > V4L2_AV1_MAX_TILE_COUNT)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
 {
 	int ret = 0;
 
+	ret = validate_av1_tile_info(&f->tile_info);
+	if (ret)
+		return ret;
 	ret = validate_av1_quantization(&f->quantization);
 	if (ret)
 		return ret;
-- 
2.53.0


