Return-Path: <linux-media+bounces-32009-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10543AAF236
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 06:51:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51F774E4610
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 04:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BEB20D4E7;
	Thu,  8 May 2025 04:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jbX4SbYP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47631FCF7C
	for <linux-media@vger.kernel.org>; Thu,  8 May 2025 04:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746679891; cv=none; b=M7n1wStJGRjmesixrFLtB/4W1AhA4auUthEHZQ8WU4eR3Oz/Vf9VQGIPBNk88qYGlharbXWnyDOQu98kANYtkWTAzjeSWU4p5N67rVOEpyXZuJk2eqInNKESmElJ/okWmjFhCFPgSgDMW1UlpNOcb/Q6dwy8dh9ph6MkRjilb68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746679891; c=relaxed/simple;
	bh=vH8pZApZwCxXj/zcKr2DuVOpsesqXZ3FpznsuRlEkIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NbqdENu8yvcJs/4KUEFk7aAjEDAqBF1JIGQ0v0PIteb7FoClKHubIYqeb9aIVPQ6X+ujelR1g7E0Vum1jN+6W9Fh5IePPvtSXl/Mcet/emRulMfmWNmBBRN8IRZaYOrTT962a09M54fcGQu3PTc3R+uRu/e+OypKrAL0O1QTOmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jbX4SbYP; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-736b350a22cso580950b3a.1
        for <linux-media@vger.kernel.org>; Wed, 07 May 2025 21:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746679889; x=1747284689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vH8pZApZwCxXj/zcKr2DuVOpsesqXZ3FpznsuRlEkIQ=;
        b=jbX4SbYP2dKr37f14Y4b1v3LuV5fI5CxSwUHxyTAFUoR/dscDaqOjIsBnDFuVttes8
         WD57GxqWxRwA93eV0UziNQWEpZavcBnLY0IgaYZ/qB4bXklkuEbeIWOk2X055xFRHKK0
         ZbsusjWj1zOfSeShT4BFqi5YZUn0OpxaEjieI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746679889; x=1747284689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vH8pZApZwCxXj/zcKr2DuVOpsesqXZ3FpznsuRlEkIQ=;
        b=V29AwkWv6rGgLjzwqiBGl+mESCx/L6Y7UPvrAaVsfmv6b7KOK1bvkixZqb1i6Bv0an
         g0r/NwyB5PjsG8vNfnLp1UpsdYOKTPZQVTLLiZn/LyTpfTycoEjRgjDh8UBR5LIr78BL
         XQvck5n5L+sjVduKDiUR3HDx2RdkInP/I03LlwCZhzMCnNarsUlmc7TSGEVpTx0ejVGl
         xCOdW7w81Mk5kievlHlF9B6kO8qSwk1def+3P+XMBH5hfBKrKaXWnL/ISxaQyANj+O+E
         c9o9p7c+UZMw+uxyQiBe1yEZvz9XO8BjzYqoW91a4bQZLBIR/7Ulu1ZFR0A1BBDxAVeb
         Ov7Q==
X-Gm-Message-State: AOJu0Yww7JS2y7wXgrJtgxZK5cdvFdzzssAlv+vQbjGPmiMRBid/3Nmz
	9GdEkjTYqlxIHz+y6HIMcQ4hbgJr6ChhGbcv2ZufDr1x19BZsL2d6KZAXMc0Uw==
X-Gm-Gg: ASbGnctBg/9Tb0S7qIWzMkhEcQ/jD6paQ8Q457ZBJ1NvKom9wd3/N2d51ZoZ9wBrKy0
	woxiARyZncoKAuCD5ZCWNXeQMDs+3XCwUXMHO2vrIRGhTNk4fsmO/mWDkmmQimwDMYxHYiKV3+1
	+BGNQxYtfvs2TcdMq9LFPngFB4zBOfN7Xgp+tGe3iNE3guppwV2AbaniUJ6l95oqT9457vHI5mq
	qjqgaRmXbxbJR+YKGYaI33adgcwg9Lq85+M0B4LBUk3HxLivqyovi+1GmMwcFKo9IYH+K1wLw7V
	wrYcWtHOX1VKXjVapbj/sTXIlL2rGpYUoxG8EBDlB2C2
X-Google-Smtp-Source: AGHT+IHJt3oTtWnZHdDl97ybd6P+Hsv2F0EjcCAUaLYDnkgYwSOPmPUSLh8gTCh3PPuM9rSSslwTKw==
X-Received: by 2002:a05:6a00:1bca:b0:736:5504:e8b4 with SMTP id d2e1a72fcca58-7409cfaf3a7mr7364505b3a.19.1746679889147;
        Wed, 07 May 2025 21:51:29 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:c794:38be:3be8:4c26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405905ce9fsm12728777b3a.136.2025.05.07.21.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 21:51:28 -0700 (PDT)
Date: Thu, 8 May 2025 13:51:23 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, Tomasz Figa <tfiga@chromium.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Robin Murphy <robin.murphy@arm.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 1/3] media: videobuf2: use sgtable-based scatterlist
 wrappers
Message-ID: <ravkxkfx6du2uovpfqwugtmm3ymmuswkusfiry3erslpgnvaz2@2gwxofmdfjye>
References: <20250507160913.2084079-1-m.szyprowski@samsung.com>
 <CGME20250507160921eucas1p2aa77e0930944aadaaa7c090c8d3d0e73@eucas1p2.samsung.com>
 <20250507160913.2084079-2-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507160913.2084079-2-m.szyprowski@samsung.com>

On (25/05/07 18:09), Marek Szyprowski wrote:
> Use common wrappers operating directly on the struct sg_table objects to
> fix incorrect use of scatterlists sync calls. dma_sync_sg_for_*()
> functions have to be called with the number of elements originally passed
> to dma_map_sg_*() function, not the one returned in sgt->nents.

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

