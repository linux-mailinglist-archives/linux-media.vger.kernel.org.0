Return-Path: <linux-media+bounces-60859-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECKiNTb9/Gk9WQAAu9opvQ
	(envelope-from <linux-media+bounces-60859-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 22:59:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BB74EF10E
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 22:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDE7F303E200
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 20:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48B5F346E47;
	Thu,  7 May 2026 20:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YvSM6sac"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8F032ABCA
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 20:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187504; cv=none; b=uJlBR6CzrXlFiTq/iaF9oXN4XHBz8+nXhwNw5/47HUk8907ve3/897cTNLmkjdxmX76J9auCbjFWCz/e5LFHcWFkO1aqyhf/bLY0GaFK1PzLEcu2vEBCR9D6GDzKbjR2Nyv4xMichbukO8PN62Ghz5xo+Pu5dBsJGg3A6xhgAbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187504; c=relaxed/simple;
	bh=d+O67gl2GIGylI6phsIj9TBlpbKokc/OVLyxskjLlYY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kTTCTi3RHbZQF7BH9jyREXa7a9s3HgdBp/1kTUPUw5cupqRMTzbTMEUS36f8ucbZpZsrwMcLwEKuE56iZFpP4FMwFMvphhNupxBmbYe5tqVerO8evpaMSxvkS62o9mNvHnPoXuSYPb9s7IbUg7W4ghcJ1Yk7Sc1tijpROQfZ3ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YvSM6sac; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3922b35e69cso10920101fa.0
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 13:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778187501; x=1778792301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=62sCEoVz1H20Bvb3z6VX8x/23MkbndGwBQZwPeDoJW4=;
        b=YvSM6sacUMKa5ReKxmV7Q6pj41AlEYXrqcgW7YQSTTQhdE1QTtPNvF4irkpkkSJtUB
         8B1tPznI35SNAR73xrdhf4ZMOqTFI30H884e8NwPDMUdEtbVTgxiqpe+361SEe2CRi+v
         4mv12opnfXkfMF6RV033R4C+XztH7q+uy1Ex4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187501; x=1778792301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=62sCEoVz1H20Bvb3z6VX8x/23MkbndGwBQZwPeDoJW4=;
        b=jyT3Nyh2Br/71pLWMRaSRag8lgPwvQ0F5sdQIAsXju06o6c9k6mi5ls34YV3/urm2h
         4TfbvJR0dMMQhu6MBM0wJIsBbm5z5bLUvngnwD9QKFt09rDlSoojpK2w5xf3mjE7GeoB
         XJjzMKXIN6K9dKB3T1eH/xh1upVAT/H9xX513FUfrAK0TRQi0ln+2K9C/K1ZpBiH8fH1
         HzpvTakVwQdY22VoMn2mEl4DwmKw2P9XQl9Pebh0GLB8mNHwHnEoiM19/CRDW0bNw7DA
         yPjD1GmV2EQ7H5i6z1ekTMQOamjm9+EYoCJZM40msh+Cza6TQcTkTWHRGnW8dQrv8P8s
         Tipg==
X-Gm-Message-State: AOJu0YzvuOMem7JULs8xe6LJ3E7XYSFkQ58TUUJ50yCkiApu8ai1hD58
	CakIgZ6ppnh+gU9OYgx+srrPNWcA5rDTPi9PuM8Jyae27kzv+jLed5JpJSN3QPBdYQ==
X-Gm-Gg: AeBDieu4Xw1jdf7ed78gjg9tcW/X1/G0e16K3rIpmI9451sCM+DH69LuMfmRQ6heypy
	14Q+QaEVhQBo5oI4IjHJYz/OsJVtFLuujC6XIyOk2Jpxe9v38yJgM4RO7j3Wum6zbsFzMzJsOz5
	St8Sy5w2iNL77Tsma8bZ7YFgYNiSApxkU+ekIvr03FzY4jvlS2tmQr8cSyPWzDhkO9EbmUBuqLm
	C46j7TaiR+ijlj/aDAtup7zhcCA+1rS1H/HkXQhBX1y+bJ7QhO8y+zbOlsKCxH9UcdlFa6C5ZVi
	iftbvuNfpcDDoUqICkE3JxL2b6q0UyRbXQ73xcnMluWm39djOockFBTWZF1hWJoGs952OoLRnp3
	5+DgyS7EiEt5kPAgJY/AX8yfKtXmWoN0y79oXbQ2BDD1l3ZdRY0KBQ8lo4MVoKIh87yB2+Vrr1d
	swACh0zzJTNuY/BdkmWUZCsCMvSJqfkFHs9pX9iRsaBD6ywNBoJETZLDsAN/IKbgwforw5MXDvX
	jOjtEc=
X-Received: by 2002:a2e:9783:0:b0:393:903c:225b with SMTP id 38308e7fff4ca-393c4338719mr27191651fa.31.1778187501297;
        Thu, 07 May 2026 13:58:21 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393eee53655sm2325571fa.0.2026.05.07.13.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 13:58:19 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 07 May 2026 20:58:11 +0000
Subject: [PATCH v4 6/6] media: amlogic-c3: Add validations for ae and awb
 config
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-smatch-7-1-v4-6-cc195f142167@chromium.org>
References: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
In-Reply-To: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, Nas Chung <nas.chung@chipsnmedia.com>, 
 Jackson Lee <jackson.lee@chipsnmedia.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, 
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 59BB74EF10E
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
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-60859-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Avoid invalid memory access if the zones_num is bigger than
zone_weight.

This patch fixes the following smatch errors:
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max

Cc: stable@vger.kernel.org
Fixes: fb2e135208f3 ("media: platform: Add C3 ISP driver")
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/amlogic/c3/isp/c3-isp-params.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
index 6f9ca7a7dd88..aec3eed0e443 100644
--- a/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
+++ b/drivers/media/platform/amlogic/c3/isp/c3-isp-params.c
@@ -104,6 +104,8 @@ static void c3_isp_params_awb_wt(struct c3_isp_device *isp,
 	c3_isp_write(isp, ISP_AWB_BLK_WT_ADDR, 0);
 
 	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
+	if (zones_num > C3_ISP_AWB_MAX_ZONES)
+		zones_num = C3_ISP_AWB_MAX_ZONES;
 
 	/* Need to write 8 weights at once */
 	for (i = 0; i < zones_num / 8; i++) {
@@ -220,6 +222,8 @@ static void c3_isp_params_ae_wt(struct c3_isp_device *isp,
 	c3_isp_write(isp, ISP_AE_BLK_WT_ADDR, 0);
 
 	zones_num = cfg->horiz_zones_num * cfg->vert_zones_num;
+	if (zones_num > C3_ISP_AE_MAX_ZONES)
+		zones_num = C3_ISP_AE_MAX_ZONES;
 
 	/* Need to write 8 weights at once */
 	for (i = 0; i < zones_num / 8; i++) {

-- 
2.54.0.563.g4f69b47b94-goog


