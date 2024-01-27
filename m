Return-Path: <linux-media+bounces-4236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9DAF83E677
	for <lists+linux-media@lfdr.de>; Sat, 27 Jan 2024 00:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 606F728B33D
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 23:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E275A799;
	Fri, 26 Jan 2024 23:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="X6OsNMgN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC745916E
	for <linux-media@vger.kernel.org>; Fri, 26 Jan 2024 23:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706310968; cv=none; b=D+W9pQflVxfTmbn1dC3WN3z8qhx70LvDjmzIfryJNxMGpX0ekD3mPOdIHq9d1T9m8FCCaWtiqTzmYmSQlnKvNKNNkHuzXymWZsmnoeJ7xUezUICPX+z2Ux06UMh0wDS8mGBysBDyTHGqZYaiL8nU4SLE5DWBJiEl+2m+I+R4vDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706310968; c=relaxed/simple;
	bh=R2OIOj19CJvWbbSWmqb+lX1DvD+M2O8JbQX48DRMZGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YPbiFNqEIAk77eB4VkaUizT0uAbbDyvRfnDx8AkUYNAEsBUs5vl6RfICQa7KrDVSvqPImgq6P7UrwRsTSVseGLBZdascqfR8U/6r6w5ZQSmG3fulF4B2J1MWfC80OFwZ4rnep1O96SRYPJBzPEuIR4Owq4X7m1vKcuSOme78x0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=X6OsNMgN; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7831806c51bso75175985a.1
        for <linux-media@vger.kernel.org>; Fri, 26 Jan 2024 15:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706310965; x=1706915765; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ar8mBbHXqsE1e1cRGpZMgerGImf36JANUI0hlBJjqHM=;
        b=X6OsNMgNDSbzeQguxuNF+fl2a/YABnI6Z/YQQxitxrhaNMod9dcUbOM+rNAVSWhHZN
         hTC2O5zT+LCq5CEpa0OYUtE7Klvwx0APwKOIaWkLZ1lObj29I/xZc4Kuggv2jZfvoeQ/
         MJf7vi2wFyx3ZZwMdtW9MdjwtZf5HDJYeDjmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706310965; x=1706915765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ar8mBbHXqsE1e1cRGpZMgerGImf36JANUI0hlBJjqHM=;
        b=RcEV3GtJVa5PZW6UKuM3L4XqsfWW3jIYjpMostNW+8kcFEJCFTAKB2Eud1kFGc0oWN
         gGzrYeLcnCtdHDkQmihFUAUVZMQUdWwOLRqkvuV45nmSiKprFRywYWF8IJFCc+w2Z2jw
         XK/+BjORXyjJXGTefQF5F28CWH7cs65QUiISD49lkm5h6ZR6YMJmKuTbVvyab6WFWraf
         fvkm5JPYQklbcSTbFbGJlav7GIooAkKuFDRkCpBxNl/Xqu3aY0gHHvB3zThQjEu2nIJ8
         bdtLoiSedW6i5Z88R2muEUqSJJKuadSU/l3xG3TJ9f57gLYZOGmO80eR2D+ZU5PwXcuI
         qGCw==
X-Gm-Message-State: AOJu0YyHdp91Pa6WFuUUQTajWuBYn1fj/QFjzgA8Twaox1nSEm95eIPC
	eOV+qz3PK7ieKbZHmuo1AZkhvm7ooofWSj4ELEMniGbgIfh4tsDQsQRou69t1A==
X-Google-Smtp-Source: AGHT+IEp2TplztXDP53F55JwtnOMG+m/bhamzc+Y9PQOYbhM+M8gtls3bXtKPqVmvF6K1+rXQLaydQ==
X-Received: by 2002:a05:620a:46a6:b0:783:35f0:d03c with SMTP id bq38-20020a05620a46a600b0078335f0d03cmr626950qkb.135.1706310965318;
        Fri, 26 Jan 2024 15:16:05 -0800 (PST)
Received: from denia.c.googlers.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a290400b00783de3ddf5esm507358qkp.70.2024.01.26.15.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 15:16:04 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 26 Jan 2024 23:16:00 +0000
Subject: [PATCH 01/17] media: mediatek: vcodec: Fix kerneldoc warnings
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-gix-mtk-warnings-v1-1-eed7865fce18@chromium.org>
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
In-Reply-To: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Bin Liu <bin.liu@mediatek.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
 Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.3

These fields seems to be gone:
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c:57: warning: Excess struct member 'wait_key_frame' description in 'vdec_vp8_slice_info'
drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:166: warning: Excess struct member 'mv_joint' description in 'vdec_vp9_slice_counts_map'

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c    | 1 -
 .../media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
index f64b21c07169..f677e499fefa 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c
@@ -37,7 +37,6 @@
  * @bs_sz:		bitstream size
  * @resolution_changed:resolution change flag 1 - changed,  0 - not change
  * @frame_header_type:	current frame header type
- * @wait_key_frame:	wait key frame coming
  * @crc:		used to check whether hardware's status is right
  * @reserved:		reserved, currently unused
  */
diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
index 69d37b93bd35..cf48d09b78d7 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
@@ -141,7 +141,6 @@ struct vdec_vp9_slice_frame_counts {
  * @skip:	skip counts.
  * @y_mode:	Y prediction mode counts.
  * @filter:	interpolation filter counts.
- * @mv_joint:	motion vector joint counts.
  * @sign:	motion vector sign counts.
  * @classes:	motion vector class counts.
  * @class0:	motion vector class0 bit counts.

-- 
2.43.0.429.g432eaa2c6b-goog


