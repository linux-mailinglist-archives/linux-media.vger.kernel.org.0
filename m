Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B04049F6D9
	for <lists+linux-media@lfdr.de>; Fri, 28 Jan 2022 11:07:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243644AbiA1KHn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jan 2022 05:07:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiA1KHm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jan 2022 05:07:42 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB239C061714;
        Fri, 28 Jan 2022 02:07:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 82EA1B824A6;
        Fri, 28 Jan 2022 10:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5551C340E6;
        Fri, 28 Jan 2022 10:07:38 +0000 (UTC)
Message-ID: <aed1f16a-4b28-8da9-728a-3151a75b1f5f@xs4all.nl>
Date:   Fri, 28 Jan 2022 11:07:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/4] Exynos4 media drivers: adapt for the planned ARM
 IOMMU-DMA changes
Content-Language: en-US
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
References: <CGME20200918144852eucas1p2cd6ec1d5fb76d5c472a7ff966e0c3e8e@eucas1p2.samsung.com>
 <20200918144833.14618-1-m.szyprowski@samsung.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20200918144833.14618-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

I'm going through a bunch of (very) old patches in my patchwork TODO list
that for one reason or another I never processed. This series is one of them.
Patch 1/4 has been accepted, but not the other three.

Patches 2-4 still apply without problems, so is it OK if I apply them?
Better late than never...

Regards,

	Hans

On 18/09/2020 16:48, Marek Szyprowski wrote:
> Hi,
> 
> This patchset updates Exynos4-IS and S5P-MFC drivers for the planned
> kernel changes in the area of ARM DMA-mapping and IOMMU integration [1].
> Those patches are intedependent, they can be applied separately from the
> ARM DMA-mapping changes.
> 
> Best regards,
> Marek Szyprowski
> 
> 
> References:
> 
> [1] https://lore.kernel.org/lkml/cover.1597931875.git.robin.murphy@arm.com/
> 
> 
> Changelog:
> 
> v2:
> - added patch for S5P-MFC driver
> - simplified code for Exynos4-IS (use the iommu_get_domain_for_dev()
>   instead of creating a separate domain)
> 
> v1: https://lore.kernel.org/linux-samsung-soc/20200915133256.1210-1-m.szyprowski@samsung.com/T/#t
> - initial version (only Exynos4-IS patch)
> 
> Patch summary:
> 
> Marek Szyprowski (4):
>   media: platform: exynos4-is: remove all references to physicall
>     addresses
>   media: platform: exynos4-is: add support for generic IOMMU-DMA glue
>     code
>   media: platform: s5p-mfc: properly assign device to both vb2 queues
>   media: platform: s5p-mfc: add support for generic DMA-IOMMU glue code
> 
>  .../media/platform/exynos4-is/fimc-capture.c  |  6 +-
>  drivers/media/platform/exynos4-is/fimc-core.c | 28 ++++----
>  drivers/media/platform/exynos4-is/fimc-core.h | 18 ++---
>  drivers/media/platform/exynos4-is/fimc-is.c   | 72 +++++++++++++++----
>  drivers/media/platform/exynos4-is/fimc-is.h   |  8 ++-
>  .../media/platform/exynos4-is/fimc-lite-reg.c |  4 +-
>  drivers/media/platform/exynos4-is/fimc-lite.c |  2 +-
>  drivers/media/platform/exynos4-is/fimc-lite.h |  4 +-
>  drivers/media/platform/exynos4-is/fimc-m2m.c  |  8 +--
>  drivers/media/platform/exynos4-is/fimc-reg.c  | 18 ++---
>  drivers/media/platform/exynos4-is/fimc-reg.h  |  4 +-
>  drivers/media/platform/s5p-mfc/s5p_mfc.c      | 37 +++++++++-
>  .../media/platform/s5p-mfc/s5p_mfc_common.h   |  2 +
>  13 files changed, 148 insertions(+), 63 deletions(-)
> 

