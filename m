Return-Path: <linux-media+bounces-60241-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNfHJlhD+Gn9rwIAu9opvQ
	(envelope-from <linux-media+bounces-60241-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:57:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA874B914D
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 08:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EA293030773
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 06:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCAB1302756;
	Mon,  4 May 2026 06:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ivXTabDD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17C72F746D
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 06:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777877662; cv=none; b=miNTZDVf6RNDAn0FwrIs3Zo2ojkRA2NSYjakGI6XUMWWat0sjRMdgKBT6O3zzdLUfcyEHm8G/4N3HwumRvOVqc2GfyeF4vUuxVeJRuSkPx15UdoUfKuj2GZikWlVUh5UfJtuMJ5NkI7lOE+j1+qjiJx3TEzsERLrMLgF08B5Lr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777877662; c=relaxed/simple;
	bh=maPN0uAGh5T9TmRwUDufwkMVbmorC5oANIGuNmwR7ek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dv9x6tSZMT3MzRzr722VRd2/xmSDHH1YavsCkmB0RO1w9v5w2DKXe6cx7qnmlw1wqiVOsvjj7+jbve2Qw6XKTgoYj2waV7a7xiiTWp+dR4G4+Ftq9vHALejbAlljkNHc1+QVNCD26pGRF+JKV1eU2OU5MP714vZk20rUyV0Ton0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ivXTabDD; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a86c1fe573so1653884e87.3
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 23:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777877659; x=1778482459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kcPDoUx1Q/YaISrAn+S58ePlDUIO7Y3t/DDUcj1x4Y=;
        b=ivXTabDDn58ho+nhz8hm0KEeyu3UGNmRWTFYmNY85tPSYtrgcGxuUnl9g+Jh0oj8LB
         VVmTwEQzw9jj7Alqzbed+2KlJ/A54BjvOC9tYTffRDBkzP37S7kY9T37SqIM/9zwGBS6
         IoewgRu+XNdE6CFSxPB5ZetIM+k8bm4X0cfQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877659; x=1778482459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1kcPDoUx1Q/YaISrAn+S58ePlDUIO7Y3t/DDUcj1x4Y=;
        b=k2+S3jq17ViG/RqmoDwPOL3yeljAjCbbQYWxBUH06jVU5DOPHFKie3zmHVtL49cVX+
         AxfqTA2/Pu73iYVENc15wNiGjoHzgfCqLKDzo8KbrM9op7Z/j0zyKPxenKp11DsQ6x26
         dik0rHKBL5vDBAto+NLIoLVlSDMZIzV1KyPQ8noRNJlOrySFtfFrd8mkegzJ5QrCDVwZ
         Ei45i9bqS0SlUauKIzhIhARw4fbwLwKxsfykDZ/f8d2JhVUHFzQJZj4vE3ouzcd1U8qI
         fXoOvlEUxClbBHnQnjTwQqo5qs0LW59GRAwvUAJWYbkeeJvIMBtw1MoRmV0j55yPIf6+
         CSEg==
X-Gm-Message-State: AOJu0YzP/7S9/6x6kOAjVMJ6L7ur06fGp9mB7uODjjBJph5M3LD6tqcP
	QLzSYpifTAzlmP/m+kLYK8DOVU1woSPrbWctaYTMQ3SCpYfJFjp8cBj7hVYHDCkFRQ==
X-Gm-Gg: AeBDieuM1BCDUc6KZ9c0W98/bNSvekamXFShveHefqjZi7/8p8WtHlA83Cm6CzENzNZ
	sAku8NpmJAEbCJzV/SaSJ3T4NFvKQSmRHvDUnrh0q7M9vG7FXHsp4oiD/p7hKMjm5RAJg6OmIyK
	sap6eI8x6er5yDTe0C4cl7p/w6fEKtGv2cUGYlO4IZcYCsN3gqyGLGmTCiyBvEpWMNSMluD/7TO
	QnjT9Dafmv7iloiUkkz69zGSt/tMC3Gj1Yzuvj0xurOma2ZdAd42FSYmop3TaSLDVVcAj2ibyZC
	svIlC8ZP3w+x0k7ftZnXPclLCXMFebOC0qhHnonedg6NB9TTEuICt13wFeAMu5WF7Cy9AXheu62
	EIZZqnH+L0661MDBi3J2snyhSG4HCDSjBRU4AhdVhuH/rPjC4WToCBSDkuq1XmXbfW3cNvDkUUX
	NsvF2kjmTjxecbtBIMg7e9MLYS3t4VE/Xtjubma3hl8kIaQZt16A66fo1gxMaX4F9J2aNb7egy3
	sP0aEMYJbfmLd9FHg==
X-Received: by 2002:a05:6512:3da2:b0:5a4:b2d:25c2 with SMTP id 2adb3069b0e04-5a8631bed57mr3075056e87.27.1777877658949;
        Sun, 03 May 2026 23:54:18 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c22e1d4sm2674579e87.9.2026.05.03.23.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:54:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 04 May 2026 06:54:09 +0000
Subject: [PATCH v3 6/6] media: amlogic-c3: Add validations for ae and awb
 config
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-smatch-7-1-v3-6-fda125c30058@chromium.org>
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
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 4CA874B914D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60241-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:dkim,chromium.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Avoid invalid memory access if the zones_num is bigger than
zone_weight.

This patch fixes the following smatch errors:
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:111 c3_isp_params_awb_wt() error: buffer overflow 'cfg->zone_weight' 768 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max
drivers/media/platform/amlogic/c3/isp/c3-isp-params.c:227 c3_isp_params_ae_wt() error: buffer overflow 'cfg->zone_weight' 255 <= u32max

Cc: stable@vger.kernel.org
Fixes: fb2e135208f3 ("media: platform: Add C3 ISP driver")
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
2.54.0.545.g6539524ca2-goog


