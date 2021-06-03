Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2478399BEA
	for <lists+linux-media@lfdr.de>; Thu,  3 Jun 2021 09:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbhFCHtx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Jun 2021 03:49:53 -0400
Received: from foss.arm.com ([217.140.110.172]:34558 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229635AbhFCHtw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Jun 2021 03:49:52 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B27D11FB;
        Thu,  3 Jun 2021 00:48:08 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F32B3F774;
        Thu,  3 Jun 2021 00:48:06 -0700 (PDT)
Subject: Re: [PATCH 03/11] drm/panfrost: Use xarray and helpers for depedency
 tracking
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Luben Tuikov <luben.tuikov@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Daniel Vetter <daniel.vetter@intel.com>
References: <20210521090959.1663703-1-daniel.vetter@ffwll.ch>
 <20210521090959.1663703-3-daniel.vetter@ffwll.ch>
 <2054fee7-dcd2-a4fa-5d50-7fe6f1b474be@arm.com>
 <YLfTGbb52KtbPk7q@phenom.ffwll.local>
From:   Steven Price <steven.price@arm.com>
Message-ID: <e9081dec-0225-a24d-261c-3ab750b29614@arm.com>
Date:   Thu, 3 Jun 2021 08:48:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLfTGbb52KtbPk7q@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/06/2021 19:51, Daniel Vetter wrote:
> On Wed, Jun 02, 2021 at 03:06:50PM +0100, Steven Price wrote:
>> On 21/05/2021 10:09, Daniel Vetter wrote:
[...]
>>> +	if (!xa_empty(&job->deps))
>>> +		return xa_erase(&job->deps, job->last_dep++);
>>
>> Rather than tracking last_dep separately this could be written using
>> xa_find():
>>
>>     if (xa_find(&job->deps, &i, ULONG_MAX, XA_PRESENT))
>> 	return xa_erase(&job->deps, &i);
> 
> I copypasted this from other drivers, imo consistency is better than
> looking pretty. I think eventually we should stuff this as optional
> helpers into drm/scheduler.
> 
> Also yours walks the xa twice.

Agreed this isn't as efficient (I was somewhat disappointed xarray
doesn't expose a "get and remove the first element" API). Moving this
into drm/scheduler seems like the right long term solution - so matching
other drivers first is a good move.

Thanks,

Steve
