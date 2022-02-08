Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC2864AD72C
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 12:32:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233771AbiBHLcF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 06:32:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356406AbiBHKjZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 05:39:25 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF692C03FEC0;
        Tue,  8 Feb 2022 02:39:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 970A0B81914;
        Tue,  8 Feb 2022 10:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F16C004E1;
        Tue,  8 Feb 2022 10:39:20 +0000 (UTC)
Message-ID: <d1ac24be-9315-7b8c-422f-b2bdc469aea9@xs4all.nl>
Date:   Tue, 8 Feb 2022 11:39:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
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
 <aed1f16a-4b28-8da9-728a-3151a75b1f5f@xs4all.nl>
 <dbdcba1a-3913-49e1-660c-784f450acd66@samsung.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <dbdcba1a-3913-49e1-660c-784f450acd66@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

On 2/3/22 00:06, Marek Szyprowski wrote:
> On 28.01.2022 11:07, Hans Verkuil wrote:
>> Hi Marek,
>>
>> I'm going through a bunch of (very) old patches in my patchwork TODO list
>> that for one reason or another I never processed. This series is one of them.
>> Patch 1/4 has been accepted, but not the other three.
>>
>> Patches 2-4 still apply without problems, so is it OK if I apply them?
>> Better late than never...
> 
> Well, there is no hurry ;) Patches which switch ARM 32bit architecture 
> to DMA-IOMMU framework still didn't reach mainline, so this patchset is 
> not really needed yet. I will check them soon (there have been some 
> changes in the IOMMU framework last year) and resend also with some 
> typos fixed.

Thank you for the status update. I've marked this series as
'Obsoleted' in patchwork, that way it's out of my queue of pending patches :-)

Regards,

	Hans
