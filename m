Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F20357992
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 03:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbhDHBiD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 21:38:03 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:16027 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbhDHBiD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 21:38:03 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FG3jN71fyzPp09;
        Thu,  8 Apr 2021 09:35:04 +0800 (CST)
Received: from [10.174.178.140] (10.174.178.140) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 09:37:44 +0800
Subject: Re: [PATCH] media: Fix compilation error
To:     Mikko Perttunen <mperttunen@nvidia.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <skomatineni@nvidia.com>, <mchehab@kernel.org>,
        <treding@nvidia.com>, <john.wanghui@huawei.com>
References: <20210402074017.49009-1-cuibixuan@huawei.com>
 <c5b9fc40-0d52-4a31-2e73-14ec07434af4@xs4all.nl>
 <78d1052a-9f9a-315b-0bba-4628a6fb3ddb@nvidia.com>
From:   Bixuan Cui <cuibixuan@huawei.com>
Message-ID: <a3ffa92b-9719-5deb-97ed-48eef27e224f@huawei.com>
Date:   Thu, 8 Apr 2021 09:37:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <78d1052a-9f9a-315b-0bba-4628a6fb3ddb@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.140]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2021/4/7 21:45, Mikko Perttunen wrote:
> This change was done only very recently, it's in linux-next and submitted for 5.13. I missed this one host1x_syncpt_free call in vi.c, but Thierry has already applied an equivalent patch on his end so the issue should be resolved.

Yes,this build error has been fixed in the next-20210407.

Thanks，
Bixuan Cui
