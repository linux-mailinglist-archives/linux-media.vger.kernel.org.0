Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 944C4450782
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 15:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbhKOOwN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 09:52:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232109AbhKOOwJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 09:52:09 -0500
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8C3AC061570;
        Mon, 15 Nov 2021 06:49:11 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id mdIAmFgeCfwDFmdIDmOpbl; Mon, 15 Nov 2021 15:49:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636987750; bh=qBF5gvocBu52H3ffjtTIchTajfvHLJyvUqLFSj2dXhs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=f3XzGkYUa1glkcPIKiyx7TVGQlMrrPu9kn5LPPWOB74rP5SUu1f8i1RUt9p8OSmFf
         W1kD9ZnJhf/FRnVoGEELGNJbLDNACFmU+CxtXhCiJ+tEFm8a/fRyxD3orhAL+4POKw
         uNbaZ7xEzB4bGxE/LLJ3KLgA0+UxbNWvDdZFSBbaA6is2nx0Ti3tMTtBAPfNkcQHi6
         gfWGnWfuyXd+3+TInC0I7XEhwINeC/2NYyXB3j/G/RM/Cp7W4m5R4wVYCOjBhf9SGV
         fv1Od6dA7OXrFkApueipBAHnCcjlFGwSu01p0NiQycJNfiQJHScOQVC3RV2XKi/XZV
         oWUHwlJ7aKTsA==
Subject: Re: [PATCH v2 0/3] Add NVIDIA Tegra114 support to video decoder
 driver
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>
Cc:     linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211114224732.11550-1-digetx@gmail.com>
 <1411d7a3913677fee58e103f7610e122686e87bf.camel@ndufresne.ca>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <55f445d8-8207-35a3-6c6f-dcb9ea70a90f@xs4all.nl>
Date:   Mon, 15 Nov 2021 15:49:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1411d7a3913677fee58e103f7610e122686e87bf.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMLDAGeBvTAWdd2xE0ooGtnAHZ4VFlE+FhevaxS+GpR56u9YwV4SxwyEFYocI9Bc322FaBG05O3L21bn3fQc+MXOjd8CcXX/s5f2QgW3KWl90QJL5aUf
 qNulR0gP2dyyAGhzUSglp6I6SBKxgtXoL6QcufE0oc1OqmxbICaPu4fNo9q9VFtgnV0OYrchg7w4iO0ERNMMuqiSDrBs0locCvdGERR8w/I3tyyU3pJKC/jq
 3pX3iifuuw9jvXAVKAvswR24oJDsEnv82UJ9+u4jkbXsJAHYAgqBEdKx7ovY6zb0E9KJp4VApZ6zf3fGynJezL5tbF0UHXLlUULE+cdeD+DbhBRsLl2nOr45
 8FKtQrTD6SWQDgmUvfgtYJZfg0neCRTYAoOTqNzge3zqg2RwLTMbtErfwP0Qhys/X6cnK/c8h4gWPNvyFwTkbaVZNzKyagHT6+SdcwJEaQh5CqnSjr30F/AL
 lnBRpXDEo5/I52TODbhjVB3qetLJmrg0oJAkWtdM6T5ipjh/sEAge3HyrlCIcSaWXpgICEO/zaoF+rFLbckWstTJHEpiTWrFglyi/Q==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/11/2021 15:43, Nicolas Dufresne wrote:
> Hi Dmitry,
> 
> Le lundi 15 novembre 2021 à 01:47 +0300, Dmitry Osipenko a écrit :
>> Video decoder of Tegra114/124 SoCs uses additional memory buffer required
>> for decoding of protected content. We won't support that content, but it
>> is impossible to disable access to the buffer, hence a stub buffer needs
>> to be provided. This series enables decoder driver only for Tegra114
>> because Tegra124 support requires more non-trivial changes on both kernel
>> and userspace sides.
> 
> I believe the stateless API is quite in place now, but I only see maintenance on
> this staging driver. I don't believe it really make sense to keep maintaining a
> staging driver without any step forward de-staging it. I believe it gives the
> wrong message on the Kernel staging purpose.
> 
> I'm not criticizing your effort, I believe you are doing nice work for you
> community, but would prefer to see this driver be ported to the official kernel
> APIs rather then being maintain as staging till the end of time.

I agree with Nicolas here. This driver only support H264 and the stateless API
for that is now in mainline. So there is no reason not to convert to the
stateless codec API and move this driver to mainline.

It would be really nice to see that happen.

Without any progress on that I am inclined to remove this driver some time
next year.

Regards,

	Hans

> 
> regards,
> Nicolas
> 
>>
>> Changelog:
>>
>> v2: - Changed tegra_vde_alloc_bo() to return errno and fix unassigned
>>       error code in tegra_vde_probe().
>>
>> Dmitry Osipenko (1):
>>   media: staging: tegra-vde: Reorder misc device registration
>>
>> Thierry Reding (2):
>>   media: staging: tegra-vde: Support reference picture marking
>>   media: staging: tegra-vde: Properly mark invalid entries
>>
>>  drivers/staging/media/tegra-vde/vde.c | 147 +++++++++++++++++++++++---
>>  drivers/staging/media/tegra-vde/vde.h |  18 ++++
>>  2 files changed, 152 insertions(+), 13 deletions(-)
>>
> 

