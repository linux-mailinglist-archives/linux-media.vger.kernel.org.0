Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F03B01CE50C
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 22:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729572AbgEKUG5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 16:06:57 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10535 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729215AbgEKUG4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 16:06:56 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eb9b0160000>; Mon, 11 May 2020 13:05:42 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 11 May 2020 13:06:56 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 11 May 2020 13:06:56 -0700
Received: from [10.2.160.186] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 11 May
 2020 20:06:56 +0000
Subject: Re: [PATCH -next] media: tegra: Make tegra210_video_formats static
To:     Samuel Zou <zou_wei@huawei.com>, <mchehab@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>
CC:     <linux-media@vger.kernel.org>, <devel@driverdev.osuosl.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1589196015-8945-1-git-send-email-zou_wei@huawei.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <095bb6a1-c4a0-1983-ac5e-701969aa3346@nvidia.com>
Date:   Mon, 11 May 2020 13:06:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1589196015-8945-1-git-send-email-zou_wei@huawei.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1589227542; bh=8NkRMhmEgp8vXL9arKWTRj7av/YgRy1DwkZ7Z7QGPWE=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=D8FW17cg1BSjdvPU1ki890GVx4lYKBEGU6UFG0wwJ4u96XRHd5+fc6+xKa0yNuXWH
         Zskx93VyA9IjGdy1i+JpzQzs1L1pLn0r4zRok4JZjSP3HGvUtQPTOLbinaXw+qALoV
         xu1VsC/Kk3vHwmVyIcA+EfuMptOQcusr1SxSCD5vvDPXwM10XCgZD0JXx0xuu99maw
         xm5VdHS4SfKrfcrN2bi7N0HqCRfIgcJ0Y+QXyIvtCX1nnqduQRuqWY641yQFbLPqIM
         U2NXXRNVr97FzDGtyVrtjk0kWjwxsua1t4mKBGuJBCZwD6SIpSjBWk1GO/bMVYZ7KU
         vUHA4XF2lBpXA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 5/11/20 4:20 AM, Samuel Zou wrote:
> Fix the following sparse warning:
>
> drivers/staging/media/tegra-video/tegra210.c:589:33: warning: symbol 'tegra210_video_formats' was not declared.
>
> The tegra210_video_formats has only call site within tegra210.c
> It should be static
>
> Fixes: 423d10a99b30 ("media: tegra: Add Tegra210 Video input driver")
> Reported-by: Hulk Robot<hulkci@huawei.com>
> Signed-off-by: Samuel Zou<zou_wei@huawei.com>
> ---
>   drivers/staging/media/tegra-video/tegra210.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
Acked-by: Sowjanya Komatineni <skomatineni@nvidia.com>
