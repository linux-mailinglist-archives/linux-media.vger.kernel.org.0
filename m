Return-Path: <linux-media+bounces-41186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D39ECB38341
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 15:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD0AB363FD4
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 13:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275C5322DD5;
	Wed, 27 Aug 2025 13:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CHkYUpoV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C640D2F0C66
	for <linux-media@vger.kernel.org>; Wed, 27 Aug 2025 13:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756299784; cv=none; b=h4sNhSESmEQOuyfiMEdniiqwopeVF/EPNzXSfMWHJBThjooKs68bM/XyTambIi0+Qqv4EABihq101wWYl9KfLz17NJuZ6Clj3aehvVtSL+jjiLXf+V2p7hxXOAK0d1DMA5S8vI44h+qqcFpbs4MqJbpKyjC+DDE9qB8up+L0mBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756299784; c=relaxed/simple;
	bh=zx+GRYFooWpW9uCN18EKoluPmanyFaOpZIsBIGuITSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YyWtPiHQxU1p2Nxp8YnZuRj7U53FhoicxGJsdtb2ACapotIIwwDWrl9OdyiD6W5KiJzSa8RYRxLU31VcLeFNweqHwFgF0wi4pQQKIDaUv7ZAAnPNQ3letF93MdEQZXaU5NuZRmIq3WhekWF9CHUk6NNIDRkXPJjcuF9LlS7kkM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CHkYUpoV; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b00f23eso40099115e9.0
        for <linux-media@vger.kernel.org>; Wed, 27 Aug 2025 06:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756299781; x=1756904581; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JUBjHWZmJuNWePIdzQ6iJakPqEcAcCVwVw61Wzl+bZs=;
        b=CHkYUpoVHLht957ycyKcEN7Yv6nPFIrPyYX5rRhgpz+DmxJwnn4iVH+KKgkOIn7Yrk
         Yjgzl/kvAQXKAi84mLrbce87Wf/P9xBIeSt3mi1U9RZi83xo+5Yz+4C75fDOCip5lh0Q
         sxiC5ccsYlx/cYZauBK+HBBgcXP0BcU+me4HZxVYCiJW/x7+GykIkMiEG3uuqBOsjud3
         zUzawj9btwejzvTNCqfZ2L7tFOKoA5znZyT77n9GK1YcbjO8KXiR8mb4hU8JOZ5rywho
         URAC+WRgL8/AG4TrjacLOa8JsSL2agSpod9uMW3FgN8GPvv2OHhwSsPF6R9V0WJjx6ZX
         08zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756299781; x=1756904581;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JUBjHWZmJuNWePIdzQ6iJakPqEcAcCVwVw61Wzl+bZs=;
        b=J5tIKnt8eyG2G0TGZLc+XLYqKWbxI1XVbH2Wbe66FQNKLVM4MBFt2fTacZnyZWEA3n
         l6+1IlWgvwvI7TgPHrDMLlFwsdAL5vZCX0mo0bDCR0NWWHQ6c/3UfbmWbVKMEiodp2tW
         r6qiiRwK2i0lmhKQkkbbFa8Fe2HHN3Ho2Goj213z9MVJY/Qd1ojfZN7IZhh9fFNqP0Vy
         vIZBthuebZ+FAabZTRkAs9Iou5UskgolsEHVS+J/BjDjkTsW6h1BcMb1zVlJAoaPsw3e
         EDN7i60Bt83ZqzQttjnYUkF9CaZ9K2kK/zrGBtWVBXzHsyAvhVnEGhFfjSxGu1F9VFp7
         Oezg==
X-Forwarded-Encrypted: i=1; AJvYcCXqp0pWNqmSSakRWGu+6KyYyxhCD6Yh8b6Zah4A1vODnR22+WOmUQGRKS1hGPXJywp9QwgzgSPP7lMu1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGOSSf7D5ZMKDNN5TVRhr74u/W4R4thb2xVFqF7u57A3TL3zWE
	4DWLlVPT9+0F0CegQqXghqgaf/C9Oww0AKy6adYt+5VOAX3McX1BkN/Xa8cL4koP6sY=
X-Gm-Gg: ASbGncud/OI9Ox7D2WltISoGq0n0Zt8XmvBY0l6JJjS8XXCRUjTtxMze0bWdi8gULf+
	RLKzKNZ1LJ/rvjGtJNRYtMB7cQDCYuC9lfV0cXM7288Ptd3jA25J7nReJN/9EWx3jpTIVXbLpaK
	HacE6Vqu4g2o4bVWNSpDKqDpCCNukwabTsoXd1zHuVyj0Bew8At0rJGN2M9/ucMLpIbkw9lLAqx
	U9Qok8qj+8BHBQSbN0GV6CWQXwLHMyxMbO59CR9WTAMoohUvie1nTYCGp7M8VO5r25rClKDzWKo
	rcKBan9EIf28DLh39gg6DNUE25xkzPUOngpjEQClM52Jc9FxbaG+h/N1nebTIaH7cA9tLTrBmAR
	hJwXXZbbnU03XIZ9skw+/ZzMH5Us=
X-Google-Smtp-Source: AGHT+IELT6sCRdQHPl6oXE1cEnsudIW2S/Fsa1FNb4czZPQVDcQfdTiLtbkuS1heqEyBiDapqSdVYA==
X-Received: by 2002:a05:600c:4f8b:b0:459:dbb5:399d with SMTP id 5b1f17b1804b1-45b517c2fcfmr155117835e9.19.1756299781217;
        Wed, 27 Aug 2025 06:03:01 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c711211bd7sm21044448f8f.38.2025.08.27.06.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 06:03:00 -0700 (PDT)
Date: Wed, 27 Aug 2025 16:02:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Jai Luthra <jai.luthra@linux.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] media: ti: j721e-csi2rx: Fix NULL vs IS_ERR() bug in
 ti_csi2rx_request_max_ppc()
Message-ID: <aK8CATf4EdcYcTe-@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The media_entity_remote_source_pad_unique() function never returns NULL,
it returns error pointers.  Change this check from a NULL check to an
IS_ERR() check.

Fixes: 31f91c5224cd ("media: ti: j721e-csi2rx: Support multiple pixels per clock")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 3992f8b754b7..b75aa363d1bf 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -497,7 +497,7 @@ static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_dev *csi)
 	int ret;
 
 	pad = media_entity_remote_source_pad_unique(&csi->vdev.entity);
-	if (!pad)
+	if (IS_ERR(pad))
 		return;
 
 	ret = cdns_csi2rx_negotiate_ppc(csi->source, pad->index, &ppc);
-- 
2.47.2


