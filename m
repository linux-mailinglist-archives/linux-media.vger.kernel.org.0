Return-Path: <linux-media+bounces-29398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D31BA7BF67
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 16:33:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9D9E189F8D7
	for <lists+linux-media@lfdr.de>; Fri,  4 Apr 2025 14:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061321F416B;
	Fri,  4 Apr 2025 14:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TANzxv2G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0B91EF088
	for <linux-media@vger.kernel.org>; Fri,  4 Apr 2025 14:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743777149; cv=none; b=I8PgNNOFbs2rao0AjUdPdhjpMrxVax3NJ00FsRd19bNOqdYVP3jAknIqA1gwyzJj3QMYJTAY5s1SWAYVF/wni4Djrv8rMbbRsuJuwbyePZC/QP9atisrWE0keXOYDMVvxKP9YBh1W8a+gwjghhYmOIghXwlbV1tSq1Wd/gtKFrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743777149; c=relaxed/simple;
	bh=vCWwdAowEJBs6cvWQ7lIUrdUovkUmMtp1i6POol9XM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jzBlmhGWYtFGHmcfG83V+vA6rpzzx49YQoaovGB0Bo3BCiAbqL+ZKnvAPmuxfJqQyzIEIOsziYKRu0WZ9Vowsp37aDGxuaw7La3r254/DCSdJfJWVeZSykM//0EGXI9R0MlBTQ7XRqxO/d36rVwI77rABMJQcqdK8HBDlpCPYyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TANzxv2G; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so3334667a12.2
        for <linux-media@vger.kernel.org>; Fri, 04 Apr 2025 07:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743777146; x=1744381946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ItVLbwXh6klaFZ4DOTZKuJkyifurR/QGuqAr/eTlGU=;
        b=TANzxv2GpPZdEhyiGGh5EWl/HyKKguDIWKIdX2iwWSvO2Ym4qqksdaIrYC6zLd0iKq
         P5Y17KooDw72t/1B7eJtYFtosX558iA1zYX46ZV87r4ccylThz54uisq6gxG22vLlq9l
         Kxrqg5Ljt95fF7xS6I0ZKLGs+td2IOYoNF7xBW2WrLdft0fQssekmsBB0dCbuLHCRLcO
         l3DYcwS07HcEnpHHJtyceryLrKwGItTCIIyap7wFcOQMyc9ZzNGHeI5Kkg49y8azTs3J
         aiuDhAWeWR0MVUZUdPKcaJOHGTCVK0LcJTTCwBujhwQbBh4m35OxMko9gZfUYH8DJUF2
         CrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777146; x=1744381946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ItVLbwXh6klaFZ4DOTZKuJkyifurR/QGuqAr/eTlGU=;
        b=OlzAIVAqc+m1NiOz1MrrwAI4upIt+FXT8HEsg6yovuLM9jF685ND1gUVBj847DSmM/
         6lYyUm1hpWtWk7nvIHPwiO1VAwru6+5sOFqeoA620U3wCpIlJ+dzJiX8WqeaeFqPvrWH
         IUf0ZKUnQXZ6dREm/xN1GeR0toa8nBjovFyojQYkUG+D2zbf94U7nJFidRKkl7+Hk5XF
         vQM0ZhO68S064ubtLqNhuF3A7vkDPGbVIS8X0n7fCOVF/+t4vl5aVDOIUOIPXVqDNzeC
         yHxZ498PcObQwB5kFCosv9FL0l7SrOaeqI5+B5XP4OKT2AlgPvIjzV5WbB3SobpOVIlt
         azpA==
X-Forwarded-Encrypted: i=1; AJvYcCXenP9KzbV01LWjWIJ7MaLk78hoE2o6skUzh+w4DFVi3qYCZhCIY4O+wgutUZtcPJb78kNFwepWe4FgxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWXKd62JhRSZOvVlUoJHtNcDqmmfSsk6BWr+luBUTEk5ry0tuF
	RUVv4+ig3JGPN4pQ7ep0xNGjoEQQ2cTB0wqzj58zkgEtOZibiSPexGrSdMikhfg=
X-Gm-Gg: ASbGncuNUi4pErvetlvVnJ0cPwMz06LHal2V7tutBRuIZhMbz5bIbf1LzEN1QAhV37Q
	vzNMybFLfv/Lvwfwr9ye+hCF2oqbZs/xjPf1VdNc9NYWky7G6iGmYhjJrILtqmkKzw1HxOn2TI1
	rICDD0YpwhQ839yPcbhoBPYgDiQrY8xGUi68A0gd3+X3rockRWTov1xlWAxYiNbubXpM4C6TQxQ
	as+fQ/Xssp/qceMcKTDBzVuMsVoSbC+TLe4NAMb2MB3lCIlSyywvw4EbI+Hk4075CiTWeN0S3C9
	W2ADEmMYBoOXYVDccP7uyO3ZVbcMmYkis1TRZsyAJVIW5XBYHdhFn4pS+tsSboN+TLoXc5W/vrq
	wuAsH0PqyyZDRoT34xvptzg==
X-Google-Smtp-Source: AGHT+IHJ/1I/ptH3pCVDAQfcdNx5KHUGy5Tb2VN4inalxBPszr0OVkQ817HOYwXzW+KxBXdP3/CVtg==
X-Received: by 2002:a05:6402:234e:b0:5e7:b081:aa7c with SMTP id 4fb4d7f45d1cf-5f0b5ebbc4emr2568089a12.12.1743777145883;
        Fri, 04 Apr 2025 07:32:25 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:32:25 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v7 01/11] tee: tee_device_alloc(): copy dma_mask from parent device
Date: Fri,  4 Apr 2025 16:31:24 +0200
Message-ID: <20250404143215.2281034-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404143215.2281034-1-jens.wiklander@linaro.org>
References: <20250404143215.2281034-1-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a parent device is supplied to tee_device_alloc(), copy the dma_mask
field into the new device. This avoids future warnings when mapping a
DMA-buf for the device.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@kernel.org>
---
 drivers/tee/tee_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index d113679b1e2d..685afcaa3ea1 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -922,6 +922,8 @@ struct tee_device *tee_device_alloc(const struct tee_desc *teedesc,
 	teedev->dev.class = &tee_class;
 	teedev->dev.release = tee_release_device;
 	teedev->dev.parent = dev;
+	if (dev)
+		teedev->dev.dma_mask = dev->dma_mask;
 
 	teedev->dev.devt = MKDEV(MAJOR(tee_devt), teedev->id);
 
-- 
2.43.0


