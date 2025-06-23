Return-Path: <linux-media+bounces-35650-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC7AAE45D6
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 16:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5BBD4443D3
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 986A0253938;
	Mon, 23 Jun 2025 13:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EU+C167F"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00FC248891;
	Mon, 23 Jun 2025 13:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686838; cv=none; b=E0BY+j49owyQP6X6CwE+6QxO9gLG0ts8abdMRuvU3OB8k2sP6Zgtb65HvbXWtX+87ViyaxAvHHUBMqBFbdMgX1VHjGL4+pZXkB4m3+1tXNh7ZOVVvkEVLIczkTX/ckmDb8I8JWJT9w1aXRSX3+j8T08JuRxDgz8cHCt14KyE0jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686838; c=relaxed/simple;
	bh=m++sptggvKTsvRdmmh/Natbe80DqJQ51xNpv63moEe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bdxARn4R1qGEfWamkv2VgfmSqQtA4yM5W9EGEdx/2QxC7Y+6sziN3SPI5ahL43B6OmCUM3gGCHxHmdN4mjlvXrpGVJT1sL5yJvfC0bHcoD6fM0VVdMij9jR0EoEmIp83PGHQAMBDq4cmtiWXUxxzBEETfsdLCw2ULo6zWXNDn/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EU+C167F; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-74264d1832eso5335683b3a.0;
        Mon, 23 Jun 2025 06:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750686836; x=1751291636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m++sptggvKTsvRdmmh/Natbe80DqJQ51xNpv63moEe0=;
        b=EU+C167Fb5glCl9ADQZOO6HygAafvsW5AIGzVuKE/GHC3ZU5YyCUgSbwrBmOEc7tur
         +DZn1WM+8tJi3wz2nwcmp+pdrSa9Bsh8qFdqcrz2Jta62+MZJCe2Bk3aT/cuxmApjEZY
         SvU9Ay21pQqys9ZFSn6lRVcV6/MmFL8xb7nalF8xXO4pgta9PgZxSNBVBROkS+HfhDep
         C4aJssyDf/6NIcqPibtUS0MDbWy7NaaqGOWetQs+AR1Rb8DH3z0nDa0ryYzZlBQQEZb1
         G8uzOxR9HKEmTeH5HGKl2S/AAzq2un9R7rGidUvrIe5Bqvl2yFz0GYCJk4RaBue8sflp
         E6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750686836; x=1751291636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m++sptggvKTsvRdmmh/Natbe80DqJQ51xNpv63moEe0=;
        b=nmrZL7LrxFsuzJeMCIFGwCFwIq2iwFrRV7LOKuYqMlV8e3Vng9JcVErV1SuLMNY7rI
         PxMtO+B2AVtWlDeKeOfbQwAOQYvG21YWE+Xio77ylhvLne+/2zrUyPjqnoLpLuCP5W40
         SUQ9MI6R/3db5fik8xMUzbARZIBHhDMlpqYF6l1CqNZq3y25qoZEW4+V8h21OmVmNV7A
         Dy9eAys8RdZXaYl6ordgsrLOVhR2O9HOMLyBwDkNgnTQ+AWJUr1JaCn8URURqqrzEdWw
         sY2C0WjmBlpHh3Kika+oTEgsubadF3FiqLsJRd47DHG0e/Ixqr1ZKygYi4yd64FOWBO/
         nkew==
X-Forwarded-Encrypted: i=1; AJvYcCWGdKIMVDbnxW2dFQp3SItoYWrVFh6ndMGeHgfdxNDGZfPALBR+rsAPPMM/+gBfOQvbcE+E6ihqkY9P3pk=@vger.kernel.org, AJvYcCWJ3ZTB+Iv5PFxaXwx9Vr4Hc2unV0/vq7uMR7wGEcg9owVxlxNCzrZ1Zr5tnzgMRMw39b1gDqfk+tazrVk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0wuWbiA0F40gWFvOui1p1pzG+B/VMsgfX0SKjnq/LmXB4CqW8
	/Fp7Wudii4arqpAZjgVEFq6204mbbDRm+k1kiHKZe8CZwRK/6my9+4NO
X-Gm-Gg: ASbGncuoEX+qH80TXaHHCiuVzuInd8u85/hze5SDs2Q0l/JZDcZXetZ8StJizEa4CGN
	C08NQmpTEHatBn58uPzRMFNLtYtTxLGIssD3czz1QNzSPy2x8K5wUXNuzTnFNEJUm3M9qzKoC0W
	BptXGIp9h4FPF7MPkWeR6HIaBYWltbstPs9KhJIhFHwl2+F9BXyFYqLQd7YCuwgYFBYVr9S0iDy
	B364VdixNbyotLc/FEekzQ1JYVPeIeJK5hpSYnaRbHqnhvhyK9N+hWRLoXW6DgluJai2gEZwH2x
	ZuWbg42XxTKl6B+qpYmjidwjaM4tPMD1O0+BKzdxoikhscFStkTRTWpycHuInesahhC9aeA9U64
	OTd6pszgVe8UzGd4f1WUC7b+whoRj2VuyDByVI/68SN6SEa7/HGRcEKA34I2D
X-Google-Smtp-Source: AGHT+IHO8SNwFcSEBfcxQ1Deh5eokBB7/N4fSPLaf8uf7bBo1Vs+r9LUpLbtbpu6YeQYhzr1UuY6GA==
X-Received: by 2002:aa7:8896:0:b0:748:f135:4fe6 with SMTP id d2e1a72fcca58-7490d5875dcmr16754024b3a.10.1750686835914;
        Mon, 23 Jun 2025 06:53:55 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a49f3a8sm8645375b3a.62.2025.06.23.06.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:53:55 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
To: andy@kernel.org
Cc: zaq14760@gmail.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: media: atomisp: fix coding style in ia_css_output.host.c
Date: Mon, 23 Jun 2025 21:53:22 +0800
Message-ID: <20250623135323.816-1-zaq14760@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CAHp75VcFSbLwqot0Rrm=141Y-mCQUuFqNGn=DnfKSSYp-31vcg@mail.gmail.com>
References: <CAHp75VcFSbLwqot0Rrm=141Y-mCQUuFqNGn=DnfKSSYp-31vcg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Subject: Re: [PATCH v3] staging: media: atomisp: fix coding style in ia_css_output.host.c
In-Reply-To: <CAHp75VcFSbLwqot0Rrm=141Y-mCQUuFqNGn=DnfKSSYp-31vcg@mail.gmail.com>

Dear Andy,

Thank you for your review.

I'll go through the entire driver again and check for similar issues,
such as extra spacing between types and asterisks. If I find more,
I’ll send an updated v4 patch accordingly.

Best regards,
LiangCheng Wang

