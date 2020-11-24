Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADB552C210B
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 10:22:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731002AbgKXJVU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 04:21:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:34932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727131AbgKXJVU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 04:21:20 -0500
Received: from [192.168.0.50] (89-70-52-201.dynamic.chello.pl [89.70.52.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1C6172073C;
        Tue, 24 Nov 2020 09:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606209679;
        bh=oKt7lzKJIRzdykgXOv/jC03dAAOGoozvRQH79n/UDYM=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KALKaqVitfJzX6OKPc7V/NtJ9SDSTEchUb0hztjVmmH3wc0/LtpQY5Zm7HUURuTrH
         okD5QqjL40FeByHsjO2kKvNzFNBe0chpS93wi/zuuX7fQtv4UWyMW+NuRmPzyKj2G1
         FMlnYcLLKoTzl05Luv5IM1Fa41OvDtx2tXOf1des=
Subject: Re: [PATCH] media: platform: exynos4-is: remove all references to
 physicall addresses
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <CGME20201124084139eucas1p1f8a0e5c782b5706868bb3b5ea5de25e7@eucas1p1.samsung.com>
 <20201124084128.12496-1-m.szyprowski@samsung.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <e00f36da-d838-f2d6-ee23-1ad189f85e2b@kernel.org>
Date:   Tue, 24 Nov 2020 10:21:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201124084128.12496-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 11/24/20 09:41, Marek Szyprowski wrote:
> This driver always operates on the DMA/IOVA addresses, so calling them
> physicall addresses is misleading, although when no IOMMU is used they
> equal each other. Fix this by renaming all such entries to 'addr' and
> adjusting comments.
> 
> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>
> ---
> This patch was previously sent as part of "[PATCH 0/8] IOMMU-DMA -
> support old allocation algorithm used on ARM" patchset:
> https://lore.kernel.org/linux-samsung-soc/20200925141218.13550-1-m.szyprowski@samsung.com/
> The IOMMU related changes are still under review, but this change is
> unrelated and it makes sense to aplly it separately.

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
