Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C59CB136E51
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2020 14:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbgAJNk2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Jan 2020 08:40:28 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:55451 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728192AbgAJNk1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Jan 2020 08:40:27 -0500
Received: from [IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef]
 ([IPv6:2001:420:44c1:2577:c967:e1d3:183a:b8ef])
        by smtp-cloud8.xs4all.net with ESMTPA
        id puWTinFt8pLtbpuWXiQqCI; Fri, 10 Jan 2020 14:40:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1578663625; bh=MHkmQDKT0r4fQcBBc2IMAMBUeWf7ULY+mdGIXIE99eE=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=O//lvPbN29U0TCDl8YaGRGESV2JX23l8A0Y20wPkKhQ1ks/tuf+x5unexaa6kdXTR
         FxMWw3eNi7id6vuDo7U48E1X6LmgJLBKrPoQPWPfsU/PWNJY4bvtYyTZRGasAk0q0P
         STzuC6gf+2lBnFZFBemXD/K6XacpXE6XYveEnTRvJ2QTa+a6kffkPUx8obna9vc9lO
         BJ0zBVsVzvXvW5MPItBtkSopbqfIgn10T5fUPwg5Qz9Y1BmoSICXRVWr4gdremE3zb
         qadwjJkbh51NxAENND7Y50fQ2yM7oVYubS3SJNpp+ARUcviojJLb+TKnLttAlW420C
         QcEGKYTwEG3OA==
Subject: Re: [PATCH v2 RFT] media: exynos4-is: add missed
 clk_disable_unprepare in remove
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191219074824.15047-1-hslester96@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f253eb6e-5e21-fd9b-8c2f-371beea66afa@xs4all.nl>
Date:   Fri, 10 Jan 2020 14:40:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191219074824.15047-1-hslester96@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJQy4Gzf1IEMxWqhmwovv3bnMJlsGgGc6jsSNp9UlIaXbaOBGCM0fOyz5BB9dlhYab0a2NZJ0/noauOBJA9ZdcBv5EwI55HwlTGDB1ynYVVBZd1h/03T
 O4hsaRHDYftag8lWWDgwg2HpVXRJhpL0ByqssqOfSMG60XEEof9G1kt9azOy0ZSPZ1lT5/O5D0cQV0zCMgR18p4XLKXVhsMurGXOmIUElYQL9sMt+3lOh/gy
 jOlDIECumrBQcgjW3o26Y/pWEB8nNRiD9pussXQNgPn0i1MPDERpuPiMuXkE7iNHDV3fykh/PXJfTdoc+86o0WxqlS2T97gne+u6LPaCMLyXZ2pZMcpoStfa
 vMYM8qzbUzlq0Jpv0evU2P9HgaPtlnkZe9rLpIbtE6PhroHQNgM8R4OxQRQd+pppfk+7G8FlWfBhZZwq2pg0CJ3GZahhjzMO+A9ZABOwepNQp9dwgraqkZAy
 jjO4/GgJIshj4mQuXHa36d+rkfhKky1U+f4Q1hkns0MAP8Ze2NZXAtWAe6ZBJheqQ60g8ZHgB19XDbOBm0v6ciHUr4sCCbZUMERG+M+o9AE8fWt8oaVS1ofT
 oS5ReaE/M81QCgIbqU7TVF4GBtAFAtZmMQ1Fn1RYo36CdQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Anyone able/willing to test this patch?

Regards,

	Hans

On 12/19/19 8:48 AM, Chuhong Yuan wrote:
> This driver forgets to disable and unprepare clock when remove.
> Add a call to clk_disable_unprepare() to fix it.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
> Changes in v2:
>   - Add a check of pm_runtime_enable() to match enable in probe.
>   - Add RFT tag.
> 
>  drivers/media/platform/exynos4-is/fimc-lite.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
> index e87c6a09205b..17de14fbba31 100644
> --- a/drivers/media/platform/exynos4-is/fimc-lite.c
> +++ b/drivers/media/platform/exynos4-is/fimc-lite.c
> @@ -1614,6 +1614,9 @@ static int fimc_lite_remove(struct platform_device *pdev)
>  	struct fimc_lite *fimc = platform_get_drvdata(pdev);
>  	struct device *dev = &pdev->dev;
>  
> +	if (!pm_runtime_enabled(dev))
> +		clk_disable_unprepare(fimc->clock);
> +
>  	pm_runtime_disable(dev);
>  	pm_runtime_set_suspended(dev);
>  	fimc_lite_unregister_capture_subdev(fimc);
> 

