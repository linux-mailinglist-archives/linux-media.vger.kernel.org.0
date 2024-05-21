Return-Path: <linux-media+bounces-11669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 939838CAB50
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 11:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EE6E281EDF
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 09:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEEA6CDA0;
	Tue, 21 May 2024 09:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hzoa8u/P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8953460EC4
	for <linux-media@vger.kernel.org>; Tue, 21 May 2024 09:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716285352; cv=none; b=YczHsP5/3uFWy3SWpd8zKmpVFvwpQvVFb5geN4Mi9MMIVXn4tRCMnTpjBHV26rNUcoWDgepDq9Wwmz4K31kl8kGBGIAwnTvCanK4T3ZR5k+2/wgHyUnB7/J12yv7ltXX/5gsbgi+L5rCvZhWld0CGpT6NN1LtaVpUuS0jgky/dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716285352; c=relaxed/simple;
	bh=qMTfM2RqcLcFcnpmgsM4+ekw46TcyOHKMEZUctQ7tns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LhXuOKTPJj/5RN/b4bUyAVpG6RQcu4hFI9S0GY/DD0O+qANLanS6K3W3tRpNrI07SiLQEy2pCCfDSEN2Vh2ZEBjGMxN7d706IkMf+fEWqgBT5zDGsN1/0wxfrntE1OoeVyrLvXP4wdmh9Pt2uDdERFaFvYWQgEEyrrt1okS49rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hzoa8u/P; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6f1242f1dcdso2111649a34.3
        for <linux-media@vger.kernel.org>; Tue, 21 May 2024 02:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716285349; x=1716890149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QIL8bJvqQtt10T5yeC3JXxYF7RA/JJU1vyZUZM4XpQE=;
        b=hzoa8u/P0M2zf2nPp2UUHs+5wCwCHYSNz7tFQN7N00aelg3onWOiAGArUGn5iXUcCD
         +OlDGmjAFf6u9KrxnrurSgfcdR0hJ8U4HcHuIEZ7FRF8rulDFvJ+uJxP8U2Lofh9DEnV
         U1YSvoOsIvQlSHfFeY96fE8Qy4J5s9YGFVn1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716285349; x=1716890149;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIL8bJvqQtt10T5yeC3JXxYF7RA/JJU1vyZUZM4XpQE=;
        b=H/RyXj3kU1crNvIOYwZ2YDkg80mz7yR5GTWHRXuoYoWWqij0oljZdVF5ISWv2o1g3D
         DccZ9twgNzxcrXwSBtwtl5t8NYEHeaa5Y3yuMW2WMsJvSUI8IFK1Do+UAXoRVtQfK/5m
         ktjfedOCzleGl72GLWN2arGJcrs/PruwhDq9x6VQVa1b1jNcGKTv62vq2T3mgFFYnPNj
         Ma/UkKOL9hbrdbtZwrJY5aZFkIZcRV9KRHBbMyrnpLNBRTe6uTkx+KJvqf0lys00hN/N
         q86gkCa2WhJJiNjXuFJLVGm7DmTbjU/eE2obOqVPRB/P6VnT4JZPwys3fVS0hxeyV2W5
         1MfA==
X-Forwarded-Encrypted: i=1; AJvYcCVlRcCCzQFhw/bigzhKuH2AjdOgW/u6TiwMPDL8asRWkGYEVn2bfjkb2OEX2N8wq0VO2hc6+zd/mKGlY+PFCxvjpfCb2YDHMm527KA=
X-Gm-Message-State: AOJu0YythGs+GA6WeRDPEg4O4xW8Xkm7BU3KLqTfi8q7uX/UoQALmuTX
	1Wb78PLBzD2qXArEnT2VheFDT7G1AAoGdq9NM6A5MgRiCnX9PMQdbtgKkybkjA==
X-Google-Smtp-Source: AGHT+IFKIYFqTMarrGIwJW/xjD4E5TP4smgp1LW/1jUBwGpm9C4Gsb/IKEVVDk5X70ezxhmNydvPxw==
X-Received: by 2002:a05:6830:3299:b0:6f2:5b44:593c with SMTP id 46e09a7af769-6f25b445a16mr6106649a34.35.1716285349487;
        Tue, 21 May 2024 02:55:49 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:7412:b980:a8eb:dfa3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f679902e57sm10016198b3a.110.2024.05.21.02.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 02:55:49 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Fei Shao <fshao@chromium.org>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mediatek: vcodec: Reduce msg queue trans buffer size
Date: Tue, 21 May 2024 17:54:56 +0800
Message-ID: <20240521095536.3869399-1-fshao@chromium.org>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the MediaTek HW vcodec pipeline, the `trans` buffer is used to
transfer the data decoded by the lat decoder to the core decoder.

In the beginning, 6MB and 30MB were allocated for the trans buffer to
handle FHD and higher-resolution contents respectively, but it turns out
that's more than enough in practice and there's room for improvement.

The buffer sizes were reduced to 5MB / 8MB respectively and the decoders
have been validated to work normally on the MediaTek Android products.
It's time to adopt that change in the upstream MediaTek vcodec driver.

Reduce the msg queue trans buffer size to 5MB / 8MB respectively to
optimize the memory usage per decoder instance and improve the overall
system performance.

Signed-off-by: Fei Shao <fshao@chromium.org>

CC: Yunfei Dong <yunfei.dong@mediatek.com>

---
I consulted Yunfei and he confirmed that these are the sizes they are
using today.

 .../media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
index f283c4703dc6..e36741179a97 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
@@ -29,9 +29,9 @@
 static int vde_msg_queue_get_trans_size(int width, int height)
 {
 	if (width > 1920 || height > 1088)
-		return 30 * SZ_1M;
+		return 8 * SZ_1M;
 	else
-		return 6 * SZ_1M;
+		return 5 * SZ_1M;
 }
 
 void vdec_msg_queue_init_ctx(struct vdec_msg_queue_ctx *ctx, int hardware_index)
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


