Return-Path: <linux-media+bounces-60239-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AFVMLBpD+Gn9rwIAu9opvQ
	(envelope-from <linux-media+bounces-60239-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:56:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E8F4B911C
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A210430233F1
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 06:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCC62F1FC3;
	Mon,  4 May 2026 06:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FLSrwgHI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA98F2D5A19
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877658; cv=none; b=B0RN1UQzG8EwLa7S/UbGZl8ojQRq7g5JjEp9/Rh+ac+sogae8R8DMzHiwk9btCW/uNen0YM8boXCE/Dfj16LWKh0MQCZyj1EGRaIPca+b01afZo47c33cmBRnlIWdHmqKy+1JLarsqXRS4DCuvOTaNEZxbJRsCEupcjdH5pLcSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877658; c=relaxed/simple;
	bh=fM+EOez8tTjZWMaKaiEYlL+/TS0+1cDYerp5pGjy9hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HnSpH1LzYTSJQp4muiB5gLw1qHYvp5qr1KgZDKzpwuZQsxZX9LhyCJdDHC9/ib5Oiijy5yIMw8FRdXhw0MrF7U5vl2Cwv7cBZHPfsFPYR65IuBDJ3HEY8U1OpvlTEvDKUHMRb4Mu762Nq4nTDX2ogP3H1w+25qtv6+JYHYUZq/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FLSrwgHI; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a3d42263e4so4395241e87.2
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 23:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777877655; x=1778482455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iu0V+UWGhKofbsqLMuK6FkwiFliyODBO+j8A2mvjt3M=;
        b=FLSrwgHIWyTvOtS5gdU3Snt+qGQO5CAFxlytbP5BBqikxl7zhMRU8WDwDsdqEB4yaT
         0SlOa0LvOx8vIhifMV2fXAjGaxlX3yMzcP8tt1G9jTkuMi8kAOCHheAA4k7CTodvDcaF
         5Nz5Y7vYNb9I+CxcCZ+x5orzUXSyXPK5pqPOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877655; x=1778482455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iu0V+UWGhKofbsqLMuK6FkwiFliyODBO+j8A2mvjt3M=;
        b=rGHNAmvYo2PPmPX5cxxoATIbUaDqBYGkUXyotjVHVqBNSVGt631flFHb2LfssltU4n
         m4gGQpcaWP5NpB3D4rwD1+IXn9Tuu93yjdPiRjDSFCw4boO+OyT/um6r5FZf5SSxFc9J
         12iWK2xNeHkVzb8k7dJ/FFD6L7nRKhDBQb35r0Iy3FTWRIsxPVGUVVOPPcP/yAVgAqPw
         B/yMKBZx36RRlvYtOYftH07IpaV1dqZCB/FoEbb2pFPjVBP0gDkzUarZLKDwdTLpy+AF
         mscLVrCPKTXVx8Eowi147odZHfD2XirYEUEJm2f8NaHQA3hMFf7K33PcTIKCWOz56Lfk
         kwqg==
X-Gm-Message-State: AOJu0Yx4OpV1BClmy0XQBOlWop8c/PEEoim6UiEduv+ZRpyzbLlxs+1H
	ZmrxkXw4i7vKVvQMPYjZa1QkLjg2Ilyh6yOFJsHhntmzp7oOWQ29uRt2x0GP30SVlA==
X-Gm-Gg: AeBDiev/2D+LjRodpCVWChY+f3udLIHRPA+HvHIxIRzAKfjKoL89s6iTdF++aFAza7V
	xupCB/AZHkvAHZE5CGIptb7PzAbU+BpclTEnhMCosyF2Ps6pdaKLnFfpvXIGdwsCXc9pTUQDlcm
	xwGR1KRIg8LSF+lrmqmnAigqbKF1pX7TWiKPujYd1tNNQUqKcf5qjoqaYLCIFC6q70KAOzoQEmw
	lMPoYUGoAc4LYAlhtJHWb4yU4DWEU5uOjOlfPU+04WSV4h7CfPgdsUcTVYW6KHMBkBYyIBfYe27
	yEM6aP868xbj4GPp64taIQgMymDRTTK6R3vYQ4BaRBBc7cPjewhcWpM8aspMHfcyPaStTz8gyLT
	J7+Jk17uGul0g4I751v/uaAKd+h90muBHIEMEykvCsIWXZI9yxKHSZz+7OH5RjJt/W7xZaFSU92
	eoQcazmoCk4SsJdfePusOtRArlk9z0YYSfD0MPdojDRe5fwIdlWtpt4bBpHYAyZsncHw/FgLgpF
	TWlNpateZVhoV/dNg==
X-Received: by 2002:a05:6512:39c8:b0:5a8:6746:3f9f with SMTP id 2adb3069b0e04-5a867463fc4mr2661114e87.40.1777877655087;
        Sun, 03 May 2026 23:54:15 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c22e1d4sm2674579e87.9.2026.05.03.23.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:54:14 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 04 May 2026 06:54:07 +0000
Subject: [PATCH v3 4/6] media: chips-media: wave5: Add range checks for
 dec_output_info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-smatch-7-1-v3-4-fda125c30058@chromium.org>
References: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
In-Reply-To: <20260504-smatch-7-1-v3-0-fda125c30058@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 27E8F4B911C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60239-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,chromium.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

If the driver's dec_output_info contains invalid data the driver can
write in invalid memory. Add a range check for that.

This fixes this smatch error:
drivers/media/platform/chips-media/wave5/wave5-vpuapi.c:588 wave5_vpu_dec_get_output_info() error: buffer overflow 'inst->frame_buf' 64 <= 127

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index d26ffc942219..f77abd5e122a 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -584,8 +584,15 @@ int wave5_vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_output_i
 		p_dec_info->num_of_decoding_fbs : p_dec_info->num_of_display_fbs;
 
 	if (info->index_frame_display >= 0 &&
-	    info->index_frame_display < (int)max_dec_index)
-		info->disp_frame = inst->frame_buf[val + info->index_frame_display];
+	    info->index_frame_display < (int)max_dec_index) {
+		u32 idx = val + info->index_frame_display;
+
+		if (WARN_ON(idx >= MAX_REG_FRAME)) {
+			ret = -EINVAL;
+			goto err_out;
+		}
+		info->disp_frame = inst->frame_buf[idx];
+	}
 
 	info->rd_ptr = p_dec_info->stream_rd_ptr;
 	info->wr_ptr = p_dec_info->stream_wr_ptr;

-- 
2.54.0.545.g6539524ca2-goog


