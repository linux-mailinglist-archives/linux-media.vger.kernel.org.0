Return-Path: <linux-media+bounces-28248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE014A614F4
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D00791B63A90
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6BB201016;
	Fri, 14 Mar 2025 15:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIjKAPhb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B43204F6C;
	Fri, 14 Mar 2025 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741966206; cv=none; b=hQPvDE/F7RscKlV34u5Q6pe/M1Zh/HJJEqq5wbuOGinBdulH0MvhJyFc3ZBrNNL+N0VNFWBK55ICKJcbx23VgOmEUOGmt2WXFOQv0Yq+AITPXnRoc0wGaj2iGCm3pN4RopYuRyh/Aj2QDsygPImGHn5mORvy8uZkwcZxAUSSukE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741966206; c=relaxed/simple;
	bh=iLbNHxnZFdW7NufxIvEf3x0IAc/VSokrS+nHxqQFBe4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eK/YMIyVRiRnenqOFDvRGG85lguaipTNT9duUHqUH25qvz372HKUO42kt7SPS490eE/6uP8m4+ARLGd3W88+E82z6tyhcO47rRP7NuhRa8qBx2Cay/DbkVvNJHMbpAEaDD+eFc2cg8WTzcqK8fLHBFZGOn/8yPcdZDrH4cqXfuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIjKAPhb; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30761be8fcfso24667471fa.0;
        Fri, 14 Mar 2025 08:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741966202; x=1742571002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAe7Mq9PAoLxsqmL3ma6QJkF2PJXg5Q8DTTiDZQANqc=;
        b=RIjKAPhbCG2ypJsb/F1O2HrRYZnEwx88QyeFT8zgH4jLSyK//Iz0PHL7m3cHgMoucp
         BGI2TmkUcLF4XSfehRb7UIGtzOZgYXl3Uun63vxFH85Qxs/F3py/0+u5nZe9Aq6dU7Tg
         4RDAY8ssrv8wM9LJFcfXUp+S9HqcpVEztN7Y2tuYiBm8ebBpfW0ECJM0oulbFqJ6FFT+
         W06cabTCNdkmDAlV6XZqrL8o51U5QDPZ56F9sROdb1eg2LlcInTiNW53EVbQ1VBv1Vsk
         rEa/WnDg2PMiUOXtW9BNbMOHIsaG+2JbV5VKYyEGQ4s8+mzZYPkFnrunVzwIZSeMYlNG
         l/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966202; x=1742571002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAe7Mq9PAoLxsqmL3ma6QJkF2PJXg5Q8DTTiDZQANqc=;
        b=ZzfKBYZkbrSW8gOekoR+GMF5eK+XYf7YXCAmdfq8MADfki9oq4ywnQhjfkVJfA9BLq
         AcvfJOOvZHHMXDtwCsb0AgBog0ng/Z9E22SNC5RK67hsZhz2wOEsU1w1ry4prDIFWdPw
         EYhsjdyqNSHXsN4XFjlv3OfNN7R6LZeBc4yBnquDsqhkaBmUc4XDDwstqToGEdB/U0hS
         iU68AyMIcYLU++fmEMD9e+FkRYEogt35Q+yUpkrQU9TTECvMwIKyIxBCjf+xv5HQAT2c
         c+vsahR3FFp343X9z0s7RZxUcX9n/uwuxGl/c02qgNmAlSSmLWd6C0+Z+IjhsbP4HiEl
         iO6w==
X-Forwarded-Encrypted: i=1; AJvYcCV09OGMuzKyawlFNqdDHSlrnawFSMcLZPWL3eONI5dofi5Mj6w9ryk5NEvw3on7pqxz3m4YnO4bmHTIge0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/zXRR3gpcg9tav49HxnRNvc9/msucBCZIlU0mCzhfJGZhTqs9
	kaJ67ano1xVHj+l4TUnQAQKq121+VJUC3V1R5D5qNu98zo1oFCwDlQw6wL9wsGE=
X-Gm-Gg: ASbGncuHILsTH82XxavYSnkqfYS20+gWau232t7opjoM2Lh49KFFiBuWThM6hvXwNLb
	gEfjwwJRBqB6Lb7HF9j+2FOL7ufa/ENFH4E32B9BQ0cL7/Brjo5huhRCmPHl1HirG2d+J1DckPx
	qQVTIag4kn2LwaDdzl64NqBRP8Pxc+W9LFGPZVf87bkVvZPCZSuoGynewp1G/C7rRgg2sp+Uelo
	wK1xrwCN9crl7QYCT513XCWx/odpjctaAt1EWdOUDm+fJFQlkw1Arpjdcqdn7kF4loCMFYjN+JM
	fWP0GXqpZOG9r1236tkTDj3P27wlHWJ+AsCDHqSfu+UlFiRjIvoX2qg1gGAVMcFc+X43
X-Google-Smtp-Source: AGHT+IHgMHyFZg83gyxkscaVVuzrEiCvVQb0cElVQ6Sj6WCyMl+WLpiWNxs1mRZkFu8V2UVDyshoTA==
X-Received: by 2002:a2e:860f:0:b0:30b:e3d9:37e5 with SMTP id 38308e7fff4ca-30c4a861b95mr9020241fa.13.1741966201847;
        Fri, 14 Mar 2025 08:30:01 -0700 (PDT)
Received: from skhimich.dev.yadro.com (avpn02.yadro.com. [89.207.88.245])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30c3f0e99f6sm6253581fa.37.2025.03.14.08.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:30:01 -0700 (PDT)
From: Sergey Khimich <serghox@gmail.com>
To: linux-media@vger.kernel.org
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Vladimir Yakovlev <vovchkir@gmail.com>,
	Maksim Turok <turok.m7@gmail.com>
Subject: [PATCH 11/18] media: coda: Print size of encoded buff in other place
Date: Fri, 14 Mar 2025 18:29:32 +0300
Message-Id: <20250314152939.2759573-12-serghox@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250314152939.2759573-1-serghox@gmail.com>
References: <20250314152939.2759573-1-serghox@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladimir Yakovlev <vovchkir@gmail.com>

Print debug log containing size of encoded buff along with
other info of encoded buffer. This improves readability
of the log.

Co-developed-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Sergey Khimich <serghox@gmail.com>
Signed-off-by: Vladimir Yakovlev <vovchkir@gmail.com>
---
 drivers/media/platform/chips-media/coda/coda-bit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/coda/coda-bit.c b/drivers/media/platform/chips-media/coda/coda-bit.c
index 05d62c7bc692..c323bc96b998 100644
--- a/drivers/media/platform/chips-media/coda/coda-bit.c
+++ b/drivers/media/platform/chips-media/coda/coda-bit.c
@@ -1665,7 +1665,6 @@ static void coda_finish_encode(struct coda_ctx *ctx)
 		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, wr_ptr - start_ptr);
 	}
 
-	coda_dbg(1, ctx, "frame size = %u\n", wr_ptr - start_ptr);
 
 	coda_read(dev, CODA_RET_ENC_PIC_SLICE_NUM);
 	val = coda_read(dev, CODA_RET_ENC_PIC_FLAG);
@@ -1696,9 +1695,9 @@ static void coda_finish_encode(struct coda_ctx *ctx)
 	if (ctx->gopcounter < 0)
 		ctx->gopcounter = ctx->params.gop_size - 1;
 
-	coda_dbg(1, ctx, "job finished: encoded %c frame (%d)%s\n",
+	coda_dbg(1, ctx, "job finished: encoded %c frame (%d)%s size=%d\n",
 		 coda_frame_type_char(dst_buf->flags), dst_buf->sequence,
-		 (dst_buf->flags & V4L2_BUF_FLAG_LAST) ? " (last)" : "");
+		 (dst_buf->flags & V4L2_BUF_FLAG_LAST) ? " (last)" : "", wr_ptr - start_ptr);
 }
 
 static void coda_seq_end_work(struct work_struct *work)
-- 
2.30.2


