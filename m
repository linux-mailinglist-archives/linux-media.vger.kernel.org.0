Return-Path: <linux-media+bounces-60129-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPYBJ6KQ9Gn/CAIAu9opvQ
	(envelope-from <linux-media+bounces-60129-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 13:38:10 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7654AC175
	for <lists+linux-media@lfdr.de>; Fri, 01 May 2026 13:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 087F23045446
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2026 11:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7763938737D;
	Fri,  1 May 2026 11:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZzF4goPK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D65C34A795
	for <linux-media@vger.kernel.org>; Fri,  1 May 2026 11:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777635184; cv=none; b=SZa9PWjXFGMv/efmYR3oKe1abQl0LNwqI8g7hslk+n88Wz9QJwRmXwq0QBw22QFfJwH2z0/9DNLC5MZZ6+2AJ+T5bYGijdpcdJPA6qYw4RHgAdX6cDIvS6sYHa60duyOV2bxEhJiooaS3rDi+x5YCHA21syA+LtfRF8oeVheebY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777635184; c=relaxed/simple;
	bh=fM+EOez8tTjZWMaKaiEYlL+/TS0+1cDYerp5pGjy9hQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bLpltPA9uhQAMXbZLT5k29RfiZ7fwhKgvPOgXhd9Fe1f3lkNnwFEX6QjNPcUCGHoeesVBtwDPoP4QDj6vcSZgmCXosxNHKYFyW/8U5AbLY88KvsdfKvuV1gia1VHS8E5W/ybbgEAbrPk8demW1J3GLzpafiNNPKl9q4gIJv38zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZzF4goPK; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a2c9c5ff87so2318534e87.0
        for <linux-media@vger.kernel.org>; Fri, 01 May 2026 04:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777635182; x=1778239982; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iu0V+UWGhKofbsqLMuK6FkwiFliyODBO+j8A2mvjt3M=;
        b=ZzF4goPKyUy/0bSMls5ANB0AyTYE4cEUEQ9I9u5ve4tIvXLQXNQGpgtzbQQ4HHniqC
         W1nhmy6DsNbSTmUkO6k1Q+A20tPMK6cvE91tYr4eLO5RDTDH0VwXQgGPs3TzpxvGU/ol
         1eXwL6dd8njY3kM1UyOcnXEHiqqg4di8wJFHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777635182; x=1778239982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iu0V+UWGhKofbsqLMuK6FkwiFliyODBO+j8A2mvjt3M=;
        b=Vw3yjrvHOudOPyiSiww9HL0Zs1sY71D4zbWs3NbVWWL5QqU3IvFS8F5O97p0PpJAwF
         jf6vfNagwejHN0biA9dQkgXBzcXPuiq2dLeK84C96Ld+wARJ+RDT41PoNAVuWO0ZWo4f
         93DGetUXTfbJLLUoeR0XXn0nTF1d8dJEtDNgsiwfO6lFKLMdQnEIzDv0m1toB2FTlGs9
         7TsDNrXHyc7rDBByr6bhpMhlTtmReaYigy/m475bKH1l5reUr1r4bPut1q0Xeezq1sj5
         gWCOI9mFcBnLnaTwsjC/xw0QGVe/pf3wRvETdki59O9SaVsLWP7qCwO/ybj03RYPqeLL
         r9pA==
X-Gm-Message-State: AOJu0YwU09JmlnJ8jEKIluelVoJjVV3TAoiFTFXxNsJv3WPkZ872wcyE
	TXxNlbkm8OeOOr9YtyNvAZ1LrKvjJEFx8OsYhE3r/OQVs8AX7T9Ut7GFWq+MlmsEXg==
X-Gm-Gg: AeBDiev7JK7heqvjzHLJ9gfKNyEWCY6W4K/GSeQ0vtL/dxPD7cQY5AWJ/imby/RGi9K
	ddqPp2Tw9ylo10S41xK5XjOylAbEW8KU+ZDo1eGrOgst52shCe4cKGD1j9xNS7lbW4zT0pT1WHW
	mhZjZmKEl6BtY17twNSe8CggUvwhDKKZUi439/TNeFzXJ//4gooWou4Hy/c69YPVKY1fo8REtmG
	D+Zs/u9q9qsQ2EzfGOEw46QJ5T7C9GD4mLkjYVC7udS6TqWCL1JB/TAgfU8lY256WxQLq+SrP0T
	f50i0TZH8emEEHYw6V4ore0JoQMHT6iGrTUiEoFCwZ4PfLD9CUmF8JqISgWZsb0UidGeY+60Uqp
	3E7XuxJ82+zTLEdCWpnJ2k64czv2z+MIH4As6B2N1YZgfFpllNXpx52bfIyXMV/J9Je3qkmtaWo
	Hc6jCHp5Idtf/10HQcQ1XSJCAPkWlsBNEIpUihW2x9q12e0Grir/7e6peAm+VO8hZr7LEW68qI2
	kNuZdDmOtv3NLoVnw==
X-Received: by 2002:a05:6512:1095:b0:5a4:1add:c56f with SMTP id 2adb3069b0e04-5a85aeabc17mr915710e87.36.1777635181622;
        Fri, 01 May 2026 04:33:01 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c346c02sm429166e87.74.2026.05.01.04.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 04:33:00 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 01 May 2026 11:32:49 +0000
Subject: [PATCH v2 4/6] media: chips-media: wave5: Add range checks for
 dec_output_info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-smatch-7-1-v2-4-a2fcfb2531ac@chromium.org>
References: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
In-Reply-To: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
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
X-Rspamd-Queue-Id: 0E7654AC175
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60129-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,chromium.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

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


