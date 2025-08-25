Return-Path: <linux-media+bounces-40850-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF0CB333A8
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 03:44:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 868924E151C
	for <lists+linux-media@lfdr.de>; Mon, 25 Aug 2025 01:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CFA2226541;
	Mon, 25 Aug 2025 01:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCaY39G/"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7124B1C862C;
	Mon, 25 Aug 2025 01:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756086284; cv=none; b=lraSkEddHjVCfIL6GfLY//vvb+H3oU7DtpIAbRrPMMXQSv2bvQlq0F/qIXAT6qlxVAX9bcCapuw1f8tA5An/uVpR9zqTzgFdu8QSXT/fJbVUTdAf+d4YX17ZACCyQQhwCxPG2N4NfbNwWQYEHxGL5ClkuqL4IMrhi4PadCG9ajE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756086284; c=relaxed/simple;
	bh=s2avFoHaq0qeWQxHmu0/IfmoRr/AhaW/Ha68YwepWTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qq9lk7E06VEhRvUnXoZLP85EW/nv6T+LOxk7K4lWttQKcKCU/CrlPno5ibvb87VvEFc71NpeiVi2bBivlM/nP9zL/b5s0FyckKdT28QZ/SUf7/kgbpBiQ4zEIsBO7LtDEMdybW5OE2gMzY0jghIQ8xNhemtvSSI4z51lguCcAZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCaY39G/; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-61c7942597fso48893a12.0;
        Sun, 24 Aug 2025 18:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756086281; x=1756691081; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s2avFoHaq0qeWQxHmu0/IfmoRr/AhaW/Ha68YwepWTw=;
        b=NCaY39G/g40huWFF39yNfow2UZM4vPRz2XAIeakXYgjQPKLLbFtXSF01CZGdgP6KwX
         5/yLJhdPQ38tRDRf/BHUiLOowLcVQkffWzG6OIZauGWmlzuRrHBcdrIV42bCJRdmqAPE
         qCHzWMpaboE04Wjj3LzjwFg3g4iM7sQ7TB5f15yTxXxpifZyJLVsF70RFHTEDx0gSQXf
         gTzCmpASiNqnyvNSeL4ED48SOUfK4KtM+HaNj7P6vJyGV/ubZ7RRB96Ngkfi2fhRU4Xl
         pvTBKsv+YlnwJVIrSLTjweqBS5e6Huu/fdw+bViuFpbEJ2bOejsCBoIJnUyc/SguBfz/
         FjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756086281; x=1756691081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s2avFoHaq0qeWQxHmu0/IfmoRr/AhaW/Ha68YwepWTw=;
        b=vfTvG+/9Sol46jfNYsEVWbuRfgUEDOEJ/TOXGtfm/uR4NELg3kfaLYxoDDprmN9dui
         aTW8hH4JiXYVrelhCytNRAcnttVk3KoNoyt8OUan4QVlQ3zPquytrdKzZXkgrOAaR5F5
         RCzCrvBQzHvHtfPZ7mvWhSz3XI4i2ThkCZ2ciD976F2EAp+GENUNRnqXFuOtg4sAL9He
         CEIctIPC+yHnXEYv0SNBSonYj6En+zK+9XGiY1aymhHotaLgUhoEjbuN2ioEdYYNZu3w
         rF5dsSgSvw0PjgMM7yNzaHnMydepAJAbU1u+cknEattlc1EHusLnAYgmcEuSJws8jEJh
         tfmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr+0BncAjegwoviG3f+C6XYDjN7E7tTCT2+q7zocJP7xqVVfiiPwZ94jE+nPtrHj/gTYTKlBMbHXtSk8w=@vger.kernel.org, AJvYcCVLKleeb2AIFTMG/OYyhhNfWuEnVdjLq7YGWQxIHbQsjEW8IYt/GK2IBqXGJnqsYMRGrN5gp5VT/OG+niI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0W6OEDI2dQLxV/Sw6OuM3B9DJD9ThL330QxVms6HjCf7BEbjq
	jA10/Fm32ij3AnMHJD3vu7cg+lI93sAbx8MX9bySSWs+3VeVpcIghaNgPnO+aVIKWsUFpj3ZpbV
	da28khugCyg5LzbMOCy+7uSd9hcYe3cY=
X-Gm-Gg: ASbGnctYuhP3eqSarcL2d3UkGaJMpRR/64i9mMzPrWFCW9fA5DPeRd3ScpLUQh2kvK+
	BUWYXiihgcJJIN7PzK1sHMbO0nLHgulkjROrJJQ3dtO3HUcqsUpH1/vcPLaVZVjzXd6CaeYkKlM
	UBAehS0L/+dwRgb/7zdz0KqXiG+AiWPmdATgEHioS/EgJ4rUriLAS692KdpOeGwLDlzhSOLkHZW
	mRTcA==
X-Google-Smtp-Source: AGHT+IHLT+1EhLaT3bu32mIdNQEQRef1+B6NgFxQSUMzQXVyaMWMj/7mH5haukRWJU7ZixB7O+144Y6gyHOf1vKncZg=
X-Received: by 2002:a17:907:2d0c:b0:afe:63c0:2649 with SMTP id
 a640c23a62f3a-afe63c04d30mr437552666b.4.1756086280542; Sun, 24 Aug 2025
 18:44:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250805-drm-v4-0-94eaec01598d@gmail.com> <20250805-drm-v4-3-94eaec01598d@gmail.com>
In-Reply-To: <20250805-drm-v4-3-94eaec01598d@gmail.com>
From: =?UTF-8?B?546L6Imv5Lie?= <zaq14760@gmail.com>
Date: Mon, 25 Aug 2025 09:44:30 +0800
X-Gm-Features: Ac12FXwzSE2zxS8y6PyOaGjyBdjGU_uY8OxnqAzHE1RG7jBfGO_i3hWpq6MZILA
Message-ID: <CAKEtaPAvXPHsEF1SLHg_KATZVCyaAy4Cha_p65KQ6FTUUy4qow@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] drm: tiny: Add support for Mayqueen Pixpaper e-ink panel
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Wig Cheng <onlywig@gmail.com>, LiangCheng Wang <zaq14760@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
	linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gentle ping on this series.

I sent v4 on August 5, but haven=E2=80=99t received any feedback yet.
Any comments or reviews would be greatly appreciated.

Best regards,
LiangCheng Wang

