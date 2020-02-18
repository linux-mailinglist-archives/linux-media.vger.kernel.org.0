Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A581A162674
	for <lists+linux-media@lfdr.de>; Tue, 18 Feb 2020 13:49:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgBRMth (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Feb 2020 07:49:37 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51672 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbgBRMtg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Feb 2020 07:49:36 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 4EB2A292BAE
Subject: Re: linux-next: Tree for Feb 18 (drivers/staging/media/rkisp1/)
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
References: <20200218152853.67e2482a@canb.auug.org.au>
 <e9a420e2-992e-c358-5524-567a10955536@infradead.org>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <ad73d63c-1a33-7e47-ba88-1877cc106359@collabora.com>
Date:   Tue, 18 Feb 2020 09:49:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <e9a420e2-992e-c358-5524-567a10955536@infradead.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 2/18/20 3:31 AM, Randy Dunlap wrote:
> On 2/17/20 8:28 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20200217:
>>
> 
> on i386:
> 
> when CONFIG_OF is not set/enabled:
> 
> WARNING: unmet direct dependencies detected for PHY_ROCKCHIP_DPHY_RX0
>   Depends on [n]: STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && (ARCH_ROCKCHIP || COMPILE_TEST [=y]) && OF [=n]
>   Selected by [y]:
>   - VIDEO_ROCKCHIP_ISP1 [=y] && STAGING [=y] && STAGING_MEDIA [=y] && MEDIA_SUPPORT [=y] && VIDEO_V4L2 [=y] && VIDEO_V4L2_SUBDEV_API [=y] && (ARCH_ROCKCHIP || COMPILE_TEST [=y])
> 
> 
> Full randconfig file is attached.
> 

Thanks for reporting.

There is a patch on the mailing list fixing this already https://patchwork.linuxtv.org/patch/61175/
Changes were requested (+Zhang Xiaoxu).

Zhang, could you send another version of the patch? Or let me know if I can continue your work.

Thanks
Helen
