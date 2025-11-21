Return-Path: <linux-media+bounces-47571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0A3C795A4
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 14:28:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E634B38069A
	for <lists+linux-media@lfdr.de>; Fri, 21 Nov 2025 13:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949872773F7;
	Fri, 21 Nov 2025 13:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="il38GDHD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C74274B2E
	for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 13:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763731376; cv=none; b=A0n3ctuUJyz11s+JAXECvAOoEJQEXoZdhlHSaM2ajKQyMGIv6TVX08QIeDbMvPx68WALAvx/RlGWZ4LQfZJ9Tp7kW6FPWfrBI6yvutyjES5p0IFQmuis86QWz4/LtI7DmbKn4eL61FfLGxgypC5AnuRozNaAjB63QE+oXFguZuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763731376; c=relaxed/simple;
	bh=kwWIXcKz+wkJQIb8kfPn6QFbAA4BP4+5X4O3otodBWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oLfZNOalFkk5wmeHJBdosYCJ4YJHKz5MDw5quKqP/O8OmUVPgIsMyBuDgiygxe07ArDHE59f9m0ORHSv2j2zn8KFIj+xjFWAiZ1g7lSbeb/+gK1/w9f3MHsAK/RvG0zhMaYsEy+yuEskB1KXKDAtWtD8GYaBWgIfoFaKu6jiIjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=il38GDHD; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso9630675e9.1
        for <linux-media@vger.kernel.org>; Fri, 21 Nov 2025 05:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763731371; x=1764336171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8QpSFXioSjyQXcU8SaMiFAt7l2VJ/I1C0RiE/RYFihE=;
        b=il38GDHDOAbp6gofZ4QLP7vkg+jm0onWHsGApcQZCSdDbG0Nv0GSon0fCqCTv/E0QL
         zHttMlD1pbLI0cCTDp+DpshB3ZTyOgN2DutylyLXbJNkqWkD2moQ/UvVU0Bra7e9ZQtG
         tfRKa723qrY/mhZD4dIJh7CIlBRbAY6CPpyzEqnQrcVyv0ejCpAbahAie9UHv5CEzju6
         ZYUAtitwfAoR6zfGVBkAp6NcxkmPcHK9ndKilcIXSFZ4i87eXLrJDoVfQQgtyBbf3T+r
         A5mDIidbsqyrroVmDZPJmH6CQ4qI0BVPS7dYKUpirLF2t9Cvk0Nf0u9QuV3FAr/DkxVw
         gIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763731371; x=1764336171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8QpSFXioSjyQXcU8SaMiFAt7l2VJ/I1C0RiE/RYFihE=;
        b=ieh7SxbfTeqabTV/Gmyjnv3ByiYcypG57022eLEvncgxrI6FUAGEZkJ+FUvgmf/QWF
         ddZFKtmDskl30oxRTmuVYzJ0fEPkuOyB64SgAGPfEV9alELJwWkH8TCucqOvhHwduJ4Q
         qttJakMiQsNyiGx4gZPoZBH6H+TiBAOzo3AiIJfI0UtnE6xgAqcSYdpgs667tH2O/DRl
         RC3KimFlNQzxD1aMrL6RXtvf0+7NJNsQSgpCuXAvkFPnUSUNZ+RbHr1ePaQfkJqHkV7m
         iKETDsoL+qbzdp13vHqNPD4RBAfFJnD0bQ/Dp8tjPcQNBY1XVj/glUVjiAPfsOMOMllq
         AMMw==
X-Forwarded-Encrypted: i=1; AJvYcCUX6Pz57Pc7VH8+YEMgsLDTsPZdiIpy82VY5gDRT6JAyHtQvOUwPtem1s0FLpq9k4oV+gJU3nKUpQcoYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeRBfPwvSaTZrgmPQ7i4893pWK47uJ47hjRFveB9Ac4GdNnFwV
	O2TkpRG2D18eq00H9fQhe+KsJzGTgHBq85jvvkTvnyZiGWjFRcgSk/gsMA6DkMsAxVo=
X-Gm-Gg: ASbGncsLVC3AWCRwDU2UQ/7yIj6G0p5lO4ZhZvZnX3grEgGtdqINqzmS8ZQtinsUF5k
	Pp/FWv1OtzAqfoCOySoKwpfEQVoO/yPAqTRRsC0xVFr50nbpdP76rmYgxW9hyDB95b4mMWbC8nf
	R8pAvHCk/Ya71y+8oaWEWu6OdRTkl1sbPrFdmj6zoEgC8RIDAXtsUpf9BfFMOyNorX0SvVnGoxC
	Pj3djH9lvxz4Hq5qxknP9QqVh8bFnzstQK/utaCerlPE0psQ7eswj6PpW/2z+cenL1NXITAbxk6
	TkgOlnQayqlHS+TXnEKgs57ui060vVdmRFliEMvdgthvB9R1qEttkokYB8N0H3Wl9vOxruu8EKf
	e6mubjLd2WWEr6JsnG8dbYjBSZgZSf/8cV4F+u4UycLxmOr/48A+vAORNqcOwB+bAQEeZkk+NYq
	ZYZ8abYYeNJ0+lPVsPH9it+A==
X-Google-Smtp-Source: AGHT+IHENEs1jPAAH0HGBykRBKQ08scGb3hNuXygpTUnmtkh54mkVXduB7RwTrk1Hwk0+hw6GdCMyg==
X-Received: by 2002:a05:600c:c492:b0:477:429b:3b93 with SMTP id 5b1f17b1804b1-477c1143089mr21426265e9.18.1763731370957;
        Fri, 21 Nov 2025 05:22:50 -0800 (PST)
Received: from linaro.org ([2a02:2454:ff23:4430:ca2:42d7:6571:757c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9739964sm89119435e9.1.2025.11.21.05.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 05:22:50 -0800 (PST)
Date: Fri, 21 Nov 2025 14:22:46 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: qcom: venus: flip the venus/iris switch
Message-ID: <aSBnpm1VduuPw9pW@linaro.org>
References: <20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-venus-iris-flip-switch-v1-1-852369f66e36@oss.qualcomm.com>

On Wed, Nov 19, 2025 at 05:18:18PM +0200, Dmitry Baryshkov wrote:
> With the Iris and Venus driver having more or less feature parity for
> "HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
> switch. Use Iris by default for SM8250 and SC7280, the platforms which
> are supported by both drivers, and use Venus only if Iris is not
> compiled at all. Use IS_ENABLED to strip out the code and data
> structures which are used by the disabled platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I think this will break the ChromeOS SC7280 platform, because the new
Iris driver does not (yet) support the non-PAS/TZ startup sequence.
Given that this is a dead (never released) platform, it probably does
not make sense blocking the switch from Venus to Iris, but it should be
made clear in the commit message at least. And perhaps the affected DTs
should be changed to disable Venus/Iris then.

It would be easy to add support for the non-PAS/TZ startup sequence in
the Iris driver. The changes exist already [1], they are just stuck on
the never ending discussion about how to model the additional
video-firmware IOMMU entry in the DT for newer platforms [2]. Perhaps
the existing legacy usage in SC7280 would be enough precedent to land
this patch as-is, although I don't have access to any SC7280-based board
for testing.

Thanks,
Stephan

[1]: https://git.codelinaro.org/stephan.gerhold/linux/-/commit/14db4bfae9279a0e69a0a9d2ccdd684658916431
[2]: https://lore.kernel.org/r/20250823155349.22344-2-krzysztof.kozlowski@linaro.org/

