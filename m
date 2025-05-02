Return-Path: <linux-media+bounces-31570-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A5BAA6EC3
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 12:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 809B71C003AA
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 10:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8920B2512F3;
	Fri,  2 May 2025 10:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VRPd8PK0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32363246792
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 10:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180076; cv=none; b=AlTOcl/guM33CYESHySnS5bZOw6E5udud7bYrs08Aejb+Mp5SJiwR9K+IiU+hGVSgw6Aw9ph4hS+EStwE37D1AKdZAxrxXae9ed+/wwP1hhKwDasDEVq92z1xOvz7gDjLhjlekOQxOgQfeTP4R2IKoAkO9JDz3DY0SfW6tYch/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180076; c=relaxed/simple;
	bh=JBFJnBv1Vm67I2drd1XhP0qbGY0AFjAC5ZYn7HBNfWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u0eEnCkvpqfg6S+qIcprb+3cijv/9Z0bWkgMDiW7NEV0GoFi3G86O5UlLL1sHX/onH5pzenfYP6wxMbDRzJIfu912hAsi1IzNKkiEM00WefPXVhpsAc+ayBvOe1ien9DWufKVluZJLwwJeze2O606SFZdiqY3ZlAyhCRaYsB/yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VRPd8PK0; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac3b12e8518so313906466b.0
        for <linux-media@vger.kernel.org>; Fri, 02 May 2025 03:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180072; x=1746784872; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K96TP7RufWR0A5oYw5jAf7HfaOkuZ/rMipxLAIxdi/A=;
        b=VRPd8PK0ERWcTjG48qEpGUPUjpAsLO4CrLTlUAfNpoc2RkOC6HYgVxzJ/1jvtEvgkB
         zaevmFd3QGTx5kWomkX/lIWRxizweqjKxnVx3zB89sU8gRpqLa6OVPRo/TpRMTwxV6OO
         CKJ5XVhLm6kWvNnUkOfMEfKUlJrFoLmNzpzveRwVJVlvDRFvlmVeCweC6AjTCbfha2B6
         GrOS51bMsPpgKBMqBe+eOEFdK4+/x0W30hV+C1CkIsVqOFlPLjgszXVljlvDDbGIvRtV
         bXKcLFaNMsBzArp6f3Qlt0fdIvpAcNhoj1vTuSOxZz5QnEUmYXs+F3pQMiBhpUHndn8A
         Kc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180072; x=1746784872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K96TP7RufWR0A5oYw5jAf7HfaOkuZ/rMipxLAIxdi/A=;
        b=iEThnd4TLHm9JtXzqvqoFAK19sYT7l06SGVIyIP1N+UQiPYV6wVnpc8RvnZ6KNumXh
         RwsDHUbpnxDKVRbjOOWE9sXRkgBnCt8cWkytMd2s6fa8b1Ed1rx3c6VLv9ntkFTnvqD3
         9v/QJoNincdyP83dVUyyapOka2OW3fBOt9OC41LgTEwQtzebVCM2lYOGSxwuxrIP3f4i
         UnPwR0czMhEF7GhIXGHUjDTlvqIwQ+XIIhNsEDBMfTF3tnzAgLGa6EnrQPFme+kLzVya
         CAkE+QonIi4A0G2NENkf2w0fKLg+r20YCZHcpKLaq6ca3k9UjgU/bP1b/yR3LEg4ZLzx
         KIbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbkJZ9O/bnPZORg1zqKCmA6n+lb1L15BHgBtX19y5CTm0u+GMuLCwQ9LnonAbkfP/xgO+GvFsC8MddQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMv7FqWCqIYulUzSKrHDWQEDhvQNP+6C3JRx5hVvyQBJciwi2t
	kABkSBlDny6vvdTNMUVkGux72cQMDALIKQkez/I6HE3Dlm5a6rMudXTkNsksob4=
X-Gm-Gg: ASbGnctnkadEGVZmWVDOfSQiz2FpD8t0oUlMBVa/+bSrkqYwSfGBhlJn7eGxfG1C2SA
	EbBwuf/m/LBxapol3uFtzl2XzKz6TxLTPPHs5uudWNC/bcnl3TCWkliE086WtajU9YwW9P8oaT/
	mTJMglk6XeBOwJpCEick1ocJHFnDXEVpz4mDVnzg7Oo5hPlzJb4/l+MwDksCEFLoK4Qg7XgUvSx
	DDYqK/FxZTVNNYwSwp0+96fvjd2edH5aXkK3B8IBejCyrOdV5vnuzaOEsjEGvza0jx3LsGa0ghm
	r5ixFXcMPlP9za+QnKbGkOilRZzIIHV5rw9Y0vS5D9kXN932trkQYe2JMNWciI6barcMvEPqA0i
	kf4atRdeaNvV7QvOgKUvNEf9yd9js
X-Google-Smtp-Source: AGHT+IEw/QFZ4Q15wjtCZMc2Ys2EDGftsTen4aFJcOHmrUkANvg/HjzdHRZE7b55C3GGic4/3YhYzw==
X-Received: by 2002:a17:907:74a:b0:acf:15d:2387 with SMTP id a640c23a62f3a-ad17ada7132mr232347066b.19.1746180071962;
        Fri, 02 May 2025 03:01:11 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:01:11 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev
Subject: [PATCH v8 10/14] dma-contiguous: export dma_contiguous_default_area
Date: Fri,  2 May 2025 11:59:24 +0200
Message-ID: <20250502100049.1746335-11-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export the global variable dma_contiguous_default_area so
dev_get_cma_area() can be called a module.

Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 kernel/dma/contiguous.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 8df0dfaaca18..eb361794a9c5 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -53,6 +53,7 @@
 #endif
 
 struct cma *dma_contiguous_default_area;
+EXPORT_SYMBOL(dma_contiguous_default_area);
 
 /*
  * Default global CMA area size can be defined in kernel's .config.
-- 
2.43.0


