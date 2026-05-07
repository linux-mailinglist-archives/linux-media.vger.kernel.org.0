Return-Path: <linux-media+bounces-60857-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FehGAj9/Gk9WQAAu9opvQ
	(envelope-from <linux-media+bounces-60857-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 22:58:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 547D84EF0DF
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 22:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4BD4F3011355
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 20:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFAE344D8D;
	Thu,  7 May 2026 20:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Yq8TVhvW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CF1342C80
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 20:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187501; cv=none; b=TUcqEBnJm2B39b3B4tQZiEEYefu1N1LKWDPO1IW1r4SPmknj9dhAyeYnYET8vmQR6zHPa0pZK1ztmy4DL16Zpb+1HqPgmdAqwEpUJS/7W1N0EYfHYNpDzgnff5SLZNGM7kBE4xRxWj+ShZHaJcJjwPTwC1osB8ug9WILt4HKnPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187501; c=relaxed/simple;
	bh=bhiAdfSzncpURbgdsQrG1MdM2mxUmXSubgdV4ifgDbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qDMEZIfjEaQWe6Y/YlqX35cWuScD/rdp1kodENSb5vn14+cHnoADyqDHhEyM6AFt7DK13eCdsbk6QamNByIDHFFV9W4/OEUsKEJvsDJVkxk/mAn8UwAOn5FBFjlz8XuU33K1kMprwrCqqNI3rgndWI2KsnaKgkIvKMLkb79yk18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Yq8TVhvW; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-393c40246afso13829721fa.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 13:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778187498; x=1778792298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UAoOc6QkMdG4r56PaqK1IeCoUwn5Lvm7uulH9yzKLh8=;
        b=Yq8TVhvWSvmYOuX2oV01ByLJmRytAIff/1LHPePFl15JVS9dDzd2cRHLsckAhTBUOG
         8cNKJoJD/pG1ZfX7H6USERbjGMQskFrCUyRVaia1QvcRuLkoFgXpoi/SQZYOAOBLhSoN
         YqM/I53hqvJPfamk2sZ0ZoJN3AQV1zLb/Fboo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187498; x=1778792298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UAoOc6QkMdG4r56PaqK1IeCoUwn5Lvm7uulH9yzKLh8=;
        b=mZCNqhyEYJKvzMvzpFXrJRXoTH1mDaFu/h8lcKdp7EzhXJ+Y7lnn04IYFouPuBGoMo
         1cdxx4WGq8ssDv6tcm012HKhuRi4Dy7fTfw7/UwFjQdvzJyweykx8Nmes9jxphSwSLvG
         FGf2wHgTKSkqsSkOXnDfRNL4ZLVPEqomqmG8Fft+ecjPfq91r1p/QD/sCurI2kQc9BiW
         XgtU1wcrO6+/lKZoh/u0VCkkkmQcfjy/oxkBgkDCQSQDMahMMFrFazOQDeEgaHomiYXP
         sz2s8rQRo/TbSRY0jeEa96/JUq4zJabwEVATSpyGSnK/HdlnsNsJySd7JQwLVob3kxT4
         7lOg==
X-Gm-Message-State: AOJu0YzMGpX0wpiEM/ZDcg7ITNBwI0BRIO5XY913Wa0EBcUCccO4kknN
	7mPqZNm4oLVsrYXvhY88pnj7SurxybLl0RNRQr/jxvk67IsEaVy1AgfgoOUsLcSsnw==
X-Gm-Gg: AeBDieufn4n4g1N0tsxFDe9tXd8w6tnfCygBukB61+ng8YJnU2XNy+YF2il33lbY+BZ
	nNari5ELokQ40815nvkAwbgOexZsJL41vUNUpKQ5TX/ucrOnpKdTpnSvMXuFXa3wtxVF1dn6N5Y
	v0+Xa3Xj/Qmge2bLTkxrnBWE+aUg37JWCi//dxO6EZub3gN4V7BS2+p8lukrZE4KK7K/bMLY2l0
	udWVKhQy+fnxAAC8okyOaW2vxrBx9W0fthjzmMJv9ba6paEsp6U4kk2RSjHZdWgzt8hSiNaF6Di
	4aEqVM/UQna7kWabA2CJmHzIIGEcA3X+6Nvkp8NCiArnGIfYTShMIHTx8rm/MfPheoJBPeBsE02
	Vh2Uvnjgc86JVuYDbw0Gpk7PI9ddiu6VW4HQrYHoHjykVpUXm2BNVS4Exf0at0zq9wU5LS6e9OG
	cmbMFYHTTz9HeJkCcP0+F3bUKIrVCe4msjnZUF4LN5FTIfN6WVl/mjDQE8i4YyDhn5ovvYyf92C
	0us5z0=
X-Received: by 2002:a05:6512:681:b0:5a8:52e0:7bc5 with SMTP id 2adb3069b0e04-5a887ce6338mr3443107e87.27.1778187498409;
        Thu, 07 May 2026 13:58:18 -0700 (PDT)
Received: from ribalda.c.googlers.com (52.163.228.35.bc.googleusercontent.com. [35.228.163.52])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393eee53655sm2325571fa.0.2026.05.07.13.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 13:58:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 07 May 2026 20:58:09 +0000
Subject: [PATCH v4 4/6] media: chips-media: wave5: Add range checks for
 dec_output_info
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-smatch-7-1-v4-4-cc195f142167@chromium.org>
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
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Queue-Id: 547D84EF0DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_FROM(0.00)[bounces-60857-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

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
2.54.0.563.g4f69b47b94-goog


