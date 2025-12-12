Return-Path: <linux-media+bounces-48690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39033CB7C69
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 04:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B08DA3004227
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 03:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06372305E2D;
	Fri, 12 Dec 2025 03:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6vq12U+"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E132BDC1B
	for <linux-media@vger.kernel.org>; Fri, 12 Dec 2025 03:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765510457; cv=none; b=PMZsc9mGD0FAQGiXdqZfXza3XIVq8NqYmD980+amWpYEv1WpSO9z/HYQYA2/uU39pl6PcfAbbWSV94gcr7fNcnNfKMZhOF4LyTPjYV7+VD7MXs+df4Y9rENy43RvACSCAsLgCZgwwMe9Ns3C6wO7m+jgG3KGXGy/R7QFA5jVCs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765510457; c=relaxed/simple;
	bh=HsbNc9NhdAR/LG1ML5qxg47G4bhkbg0BKoPAGiEnJGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BEZrD0akEITVZNX/bTglklhoZAnRcz7/rJsljNsjvSvIRRN3RtueZgZkaWXxAt7KUOA+Zc364s1UpC1XEpJ/Cfh1CBA36ye8uTXHbwkvgJDDPF+OK+oPhjq11jtqDnQzdjCC8XdDwvVFKVm1YVp3Hs0QQSsWVac5+3LW6jzv4Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R6vq12U+; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34ab4ac9a34so73034a91.0
        for <linux-media@vger.kernel.org>; Thu, 11 Dec 2025 19:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765510449; x=1766115249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DI+KXchmH44mUxxpsbUV6PudffQTHA3dEjh5VjxDDHg=;
        b=R6vq12U+6TQVWy591Ul6kCAgKRnvWvZVeZvNMANwlOQSMTVFOI57VzVepAiFfEbSut
         szcqXcL2/HfPDZkURge+l9Y5z8dpaqxsSQxYiw9AGej9kYFZUqyUDX/A+DgEnki2tfPL
         T2BKUpfQb7h6CPPgfy4uPmxK5ax2Y7fnu3Ddpzol8KxHPQ3j/Reqk2kef1sO745dOheK
         cx8me85Mx7KRr+xSwpjYpJ/Gw18KlM9YL+k9hKolr0Blx454DgctzgEquvsMA+F3JAL2
         WT+XPWWX60R+sXsZ0/CeYV0uMgDjLkgOgUbFIzxGNb36UQ5m1sH1AL77q+2fxc9Rl1gP
         COXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765510449; x=1766115249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DI+KXchmH44mUxxpsbUV6PudffQTHA3dEjh5VjxDDHg=;
        b=mqeVUfuJU9qOd/1ScZlNzlPmZ+ivPQENB+/77mV9FiGpd979rrLDZvFLQpk2P0vt6d
         prearfC3Ui1qumC02miaDpvVDx5W2PAHk7JaBYv1nAbMk1TemYSFCV5iluj0+Zmy2vFo
         dBXN1UUtmW5oXWqjzbhfPCDYQOfnicbV3jK2w9YTEdLkDb3BwDSSlo6atBix0j8Xc18b
         qghn0s0o5VloA04WNTwRIXVAzQbULZnJjkVz7q2f4NZykXpL14f/h3GmAWd1wCshhoY+
         xWkUjsIHJGiTGSnsqN9OJyzkrjE7UVaZeyNwU6QKyRBfaW5ee0xyEulUvfd0ZYknfhZx
         MwBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMloIe9EgHzhu298XXhspOx5Vddbt/8L+At7u9IqaxaBJFUJ7Fd4QYrUCurhPjmCIv8gE69/OdLw3Erw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPZh0qTRYJ9Kbj6zGMxb0n8WjYOzk2EeCpxsWTecHr+cuUugKr
	zNHBfVURLhMX9tGnWLjvTL5LvAOoTKVtK2fTeSbRUTpioizp9Hmj+ZrOLxQCfszgpgwibw==
X-Gm-Gg: AY/fxX612ZeD/dsEBMn9NFrmqTJtiiceJe4U4/4Iwh58iddjhyjSCssXUU0rG/PNUAg
	Y9iB6f/PDQf5caxenrrAvvmiUe/UWyFPib81UEnjvliZb9TGxPKmqyfJR8BMFMCE2kA/7xYj2WD
	rHMoImFJvzFIqRJz0xYtuIqRyntOXJfeN+msHpVMJWipbYuJDfHWXqXfud0hnptX0CvAEVwPh5o
	19aF6aoXgZ1SkOWl8Mrg9mp6azBg/xSU/xB0lkB1W4LLKatLCzff/djtjUwZ+ZC0WadfRoJIuVO
	tidV0WgausxR76Vt2QqyguiLvwOm8VJA6sKZeb5V6on8HeTVw2+vu16ktQkMIcxQ4h58axDicHJ
	wKinllKrhDDyg4FbBDe2eMrJb2CJadLKYLcNrsEHHHZJQY+QKNJWgXyBEsVpF/cMkBQv225lA9d
	KklSn3uFeY5I6FMVY=
X-Google-Smtp-Source: AGHT+IEq2LErwdAEYXkfS1MvdZpjTJctOQkyTkNrB4+pZbLaSSuDnUfhZAotu6OCfqjLgju1qwGSvQ==
X-Received: by 2002:a05:6a21:3397:b0:342:d1c5:491 with SMTP id adf61e73a8af0-369aab23434mr604352637.0.1765510449357;
        Thu, 11 Dec 2025 19:34:09 -0800 (PST)
Received: from rock-5b.. ([27.17.162.110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2ad5996fsm3575764a12.22.2025.12.11.19.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 19:34:08 -0800 (PST)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: benjamin.gaignard@collabora.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	joro@8bytes.org,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	robin.murphy@arm.com
Subject: Re: [PATCH v9 3/7] iommu: Add verisilicon IOMMU driver
Date: Fri, 12 Dec 2025 11:31:57 +0800
Message-ID: <20251212033157.3036182-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911155720.180465-4-benjamin.gaignard@collabora.com>
References: <20250911155720.180465-4-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On Thu, 11 Sep 2025 17:57:13 +0200, Benjamin Gaignard wrote:
>+#ifdef CONFIG_VSI_IOMMU
>+void vsi_iommu_restore_ctx(struct iommu_domain *domain);
>+#else
>+static inline void vsi_iommu_restore_ctx(struct iommu_domain *domain) {}
>+#endif

After applying this patch to v6.18, I get error when building this driver
as module:

drivers/iommu/vsi-iommu.c:541:6: error: redefinition of 'vsi_iommu_restore_ctx'
  541 | void vsi_iommu_restore_ctx(struct iommu_domain *domain)
   |      ^~~~~~~~~~~~~~~~~~~~~
In file included from drivers/iommu/vsi-iommu.c:31:
./include/linux/vsi-iommu.h:18:20: note: previous definition of 'vsi_iommu_restore_ctx' with type 'void(struct iommu_domain *)'
18 | static inline void vsi_iommu_restore_ctx(struct iommu_domain *domain) {}
   |                    ^~~~~~~~~~~~~~~~~~~~~

I have to use:
#if IS_ENABLED(CONFIG_VSI_IOMMU)
instead.

Best regards,
Jianfeng

