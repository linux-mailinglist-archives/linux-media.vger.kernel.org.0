Return-Path: <linux-media+bounces-61070-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KJHD4OjAWpKhAEAu9opvQ
	(envelope-from <linux-media+bounces-61070-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:38:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE0B50B0CA
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 389E730EC774
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4D3B3BE631;
	Mon, 11 May 2026 09:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jB0kE2os"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867FF3BED18
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 09:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778491238; cv=none; b=LRTr3YO+/zIIkMqaq2cIJEV53w3aaakI1HzYNEhiefPzApFT4PRLd+B6X+PBgOoZJTjztIgUtNc1J3ED36sAczTicGCEwawKd4026KDBdaG4oaMmrMOcMG8ltt/VkVpd1dgvhqdLRLnxxh3mmPXDwczw1oR2+EX1Cea4HcpsjAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778491238; c=relaxed/simple;
	bh=QZuxmCrKzUY9/4DJZBvW/RsakTj7/Vxp1bMSYyTjHRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P10XUfIWFZthlbwg6uWUzcg0Ga6aB1eGzpe1QV44/aiPYgjC93erqTlqKNKWp0M/qTfG6Ri7vhN6od9OFzvAjoT25F1Q59FItir3mz0g60ADLrIFfYNafIIyud2ThknruIWEqSMB3vszF/rm3rjNxOfxX6aDzwa9b/IUB9N+jj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jB0kE2os; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso47208475e9.0
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 02:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778491235; x=1779096035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8uKDFDq6E8/eD48OfK+PZznOc+DyNeOaGLJOIQrrNXY=;
        b=jB0kE2osLOr+Dk83W82dX+mQpF19Ns8nUH6q2iYx+DPIJXkvUSMLy1vy00bv7mKJ2L
         keazgK5wdch9ujVGp6z8zduPweE/HM5mlT5pm0NnNULzokM+3AGTqMtmh1miKgze43su
         nN9bWLpYN5FG04AoUMwrNU7rCFcB+ZfeqX+96FRh0b4/D+3q8SYzENq0C150tF6xdBEr
         8xGVsSVhjdy8PhQpnGOz1EFs1da2bHgcb9FYLrz4E7FoL5UJrhK6ZDqbNiWOgtZEzeF0
         4i2U0Hh8DSEsXeYOCwLuno/wvwYhGMhrFY6bdcUVTtrZwXRpPSI1AkWJUZfZKzuuEq4z
         ixzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778491235; x=1779096035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8uKDFDq6E8/eD48OfK+PZznOc+DyNeOaGLJOIQrrNXY=;
        b=j/mxR4usQqJ3GhL6PdEv2K9dMbLRnKM7N1j98LjzluYvbmV/CooscWZ7pd2NCnknmQ
         2HB9PLeFEcyZT7tpeT+e9iLJWFU7oOaMD7IVaQs9pcqSanXaQBzxeO3vFylrCLb3Ligj
         Gi0HAr59Cdjb9iOOwCO+rGDTFd4e7eql2hkdfLoHFaGwIzBDltaC5kU0L3ezxZ47a9bb
         GhKLe5uPfvbD6SM/G5DQfGtOR+2MMwCwDtgq1ow+u1v8UZqONnylP3GhEzSXhs+lxuGz
         0DY8Whx4Wci+LAgnAPM08SNQD7A0WFI5/ekNrG1L6MzDfUUNG9wBxgKgeweMfuFh0Uil
         PyTA==
X-Gm-Message-State: AOJu0YyvbzWXzuiD/Cfpb6miNgC942TdLusjzbN/UtnJ5+mteWQffVak
	lNp8B6+NiFZF8PJkJOK9sAsYJ6F7RrcZUFrfKqtTMTyvPvX/KzKjqnrm1NDbfgvNQKw=
X-Gm-Gg: Acq92OFr0n5Y22bPWuvFS6iQM0x6Yut8mUViVFJo7iIecLKZVityC8+n9YST3IWyiJR
	yO6pE4A7YF9/Tfu8p6r3M5se7T24rvVF23CziA4dFyFOi2Vw6IMl1F8o/7kfthyWcNCMSits0S2
	8DqeZty8OMZWLEWaYiIITKDg/TkTwh63rUBaKTNstEu/Te5Olu/kr581PKaIIFeImVs9Oypv2lC
	CdHqnKk+IykPi8SlB1dec6so+8hujJCLLkU2OManjBQeRcxrz9D1kajCivcxwHFD5eXWNZfleq0
	y5ZgtUdOP8y3ZZqBrequ44bThLjuslcXG2h9hga6U0SZvAiPeXvjfeKb3w1pJLewa+hskkKObcc
	MyRewdedIz+z8Fz9g9fZbHTiFUlToNzjtL2BwNBBJ/XbKwNTE+qOv9KmSPNXAtM6bMejD/K+4yx
	upEApjGhfGvdIpna7tERRjcU5MGcu8EeYmiIst14zTCH4ZsxWJtZw+kNFg4XBlNgoyjg==
X-Received: by 2002:a05:6000:290f:b0:43d:7af0:3a7c with SMTP id ffacd0b85a97d-4515d3dc24cmr36669919f8f.29.1778491234498;
        Mon, 11 May 2026 02:20:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4549120ec0asm23743240f8f.17.2026.05.11.02.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 02:20:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 11 May 2026 11:20:30 +0200
Subject: [PATCH v3 5/6] media: qcom: iris: vdec: update find_format to
 handle 8bit and 10bit formats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-topic-sm8x50-iris-10bit-decoding-v3-5-7fc049b93042@linaro.org>
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=QZuxmCrKzUY9/4DJZBvW/RsakTj7/Vxp1bMSYyTjHRU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqAZ9d9BsAPVj1mBVZ+AYXUx2sn524eS3AODUszxx4
 KW545AqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCagGfXQAKCRB33NvayMhJ0dSxD/
 9EW3HTL0vDojNVspto/DqfUz+dZnPXlgKd4cCHR72RhQclrmBNfexxUoZqU9mxmGY0/lPkIftsz1zT
 4O8tSVaZpThR5Ds5CS+TMWxuUj8HtcrQisMaBTmqOKiBVUB4Tf/50CNjTk3hvpx5x5OJLYFEANlD4S
 JLlRg65qHzPBB40XAqbJH2W3RQAjc4gC6hgm7fFoyI5cxmzliAwDb2rWEbxXFYkdkIMbrk9H7eZj4z
 aO6NYRjnVjshJQL0DdloVNScd/lY+8LQKESplWQVOJ+EzdpVknUy/yVo9GwDlS3kX8PnKkw7fbBgtt
 cOSelzRccijlH50wEYJPm4hOatLN1n65f6JJ33L5OGrxehfLWpatyjRVWmPNEYkM4U+CrS8HAZClub
 LN6iLCICGNcqHtDqzHBFv3OxADMD3bCrb4jhH/b5qx+6FKWKolzNE5eFh1QxtZyM0UiYzrdjYHSAlg
 bANWxUkzearxKBGLMIM2Q0QsuQD/BhXTinvMtQ/0x+9bXoyNoP80TyL6E+eWenHIaM4lkRQr5196PV
 PbSKAyu0ayhq6sSyA7IwKtj+1qkPI5bS0TyXa0wAiZPm5+nPlY4dQ+bU3X7aazvGqWOhspDI9pwmd5
 fiu0YzJeibPnSPmYglYtha8JLTibFiqVcuaIQYDnDnPsBp1UWqsN2CRCG4qg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: ADE0B50B0CA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61070-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:mid,linaro.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

The 10bit pixel format can be only used when the decoder identifies the
stream as decoding into 10bit pixel format buffers, so update the
find_format helper to filter the formats and only allow the proper
formats when setting or trying a capture format.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h |  1 +
 drivers/media/platform/qcom/iris/iris_vdec.c            | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580e..cd3509da4b75 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -18,6 +18,7 @@ struct iris_inst;
 
 #define REGISTER_BIT_DEPTH(luma, chroma)	((luma) << 16 | (chroma))
 #define BIT_DEPTH_8				REGISTER_BIT_DEPTH(8, 8)
+#define BIT_DEPTH_10				REGISTER_BIT_DEPTH(10, 10)
 #define CODED_FRAMES_PROGRESSIVE		0x0
 #define DEFAULT_MAX_HOST_BUF_COUNT		64
 #define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index eea69f937147..f4d9951ed04c 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -99,6 +99,16 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 	if (i == size || fmt[i].type != type)
 		return NULL;
 
+	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
+		if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
+		    inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
+			return NULL;
+
+		if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
+		    inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
+			return NULL;
+	}
+
 	return &fmt[i];
 }
 

-- 
2.34.1


