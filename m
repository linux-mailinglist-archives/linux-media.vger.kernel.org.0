Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C33882CD024
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 08:10:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388045AbgLCHIz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 02:08:55 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:46533 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726871AbgLCHIz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Dec 2020 02:08:55 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id kiinks0OgarN7kiiqkqaWp; Thu, 03 Dec 2020 08:08:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606979293; bh=VZDeXvWN80PdLtvK/c5hCTjVYRrS9+2FMu1MRUhXvew=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=A8IyRYod11S2uzLTPK38/18at1J1miJQGZEqnoiPtXhxqvZZvHY024x9FDa5zKKQ9
         xqWUlk9CFxbXLegfS4QCZ8DhRd9ZeAcSx3a44jsx9/47G8cqVSH28IUWsTtx2/CRU2
         uwIbOYNxflMYBnH/0vlJWaTHwKgQMsBtq96hQkFdY0uz6zBpvi/bNzkrFfbIxcybYo
         mqb7sGRTvr9i5QaiwBPSmtsHCguYzM72SCvF79NlxmAzq30f3b0PRhwuWrN5AYn+hN
         N3Nlr2PmWm4K96nkzWiuiwHyR6+aFtvxSgHBQbzFEYcJ8oDsCYBPv4DEzwJFpu+/H4
         fNMr+ACEEy6Ng==
Subject: Re: [PATCH v3 0/2] media: rcar-vin: Mask access to VNCSI_IFMD
 register
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     koji.matsuoka.xm@renesas.com,
        niklas.soderlund+renesas@ragnatech.se,
        laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20201126074757.2768-1-jacopo+renesas@jmondi.org>
 <20201203075830.2701c8b5@coco.lan>
 <de509dc4-c164-18e5-00e6-c4f4d39eeecc@xs4all.nl>
Message-ID: <bca27ed8-f6bc-f44e-df2e-ff210ac599a5@xs4all.nl>
Date:   Thu, 3 Dec 2020 08:08:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <de509dc4-c164-18e5-00e6-c4f4d39eeecc@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAwBqafzheTasGy5sBiE4Jc+AVTUxR9lCWeiYUFrJt2WlFkmHNKU0gniBdNLpHsEH7IfBvfJzot5O+9syb1m1KSdijZxS7dg6rwl2SvB7ROXwER3Z+ZF
 gRoeFnzstUUL5lO6ZrhQss/XYMFmlWSVihpNWgsgmDYXZJyNKHzvW90H+QgpOa4LemvqsCXIyRs3jg7vyPhbTRFWhFyeoR8v4/NK70UCeeSB7fprcUROSw/i
 hKVHCbnXdQrfYE4/3KfMiwMmBZiAlddt7diQDtvJTaT2V8Tn4tWvtmdPe/tSyToQveu57lqILrZNmn/OFXDzgd7kSvQQWyICvR7pzGgTQbhD00PMG6n3JNn0
 R6BV0jDoM/8ku8O4swD9K7KZgY6PUYAWc3QyBLG5DIoOI+KEbIeN8kIQWYPVwdGGVDARX6UgIYAWjooWbgaxXurnT8jvY/5omVUfqM7qDtM4EPILBL0=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 03/12/2020 08:06, Hans Verkuil wrote:
> On 03/12/2020 07:58, Mauro Carvalho Chehab wrote:
>> Em Thu, 26 Nov 2020 08:47:55 +0100
>> Jacopo Mondi <jacopo+renesas@jmondi.org> escreveu:
>>
>>> As reported in patch 2/2 commit message the the VNCSI_IFMD register
>>> has the following limitations according to chip manual revision 2.20
>>>
>>> - V3M, V3H and E3 do not support the DES1 field has they do not feature
>>> a CSI20 receiver.
>>> - D3 only supports parallel input, and the whole register shall always
>>> be written as 0.
>>>
>>> This patch upports the BSP change commit f54697394457
>>> ("media: rcar-vin: Fix VnCSI_IFMD register access for r8a77990") from
>>> Koji Matsuoka
>>
>> As checkpatch warned:
>>
>> 	-:22: WARNING: Unknown commit id 'f54697394457', maybe rebased or not pulled?
>> 	
>> There's no such commit upstream. Are you referring to an OOT patch?
>>
>> If so, you should provide an URL from where the patch is stored,
>> as otherwise this comment won't make any sense upstream.
>>
>> If you can't provide such URL, please adjust the comment to provide
>> a description that won't be dependent of such OOT commit.

Ah, it's too early in the morning for me. I didn't read your email carefully
enough.

Just ignore what I wrote.

Jacopo, can you repost with a URL? Or perhaps just drop this bit of text.

Regards,

	Hans

> 
> Read the commit message:
> 
>>> This patch upports the BSP change commit f54697394457
>>> ("media: rcar-vin: Fix VnCSI_IFMD register access for r8a77990") from
>>> Koji Matsuoka
> 
> This commit is from the rcar BSP package, and does not refer to a kernel
> commit. So it is correct that the commit ID is unknown.
> 
> Regards,
> 
> 	Hans
> 
>>
>>>
>>> Tested on r-car E3 Ebisu.
>>>
>>> v2 -> v3:
>>> - Remove a few comments and add Niklas' tag to [2/2]
>>>
>>> v1 -> v2:
>>> - Inspect the channel routing table to deduce the availability of DES1/DES0
>>>   bits as suggested by Niklas.
>>>
>>> Jacopo Mondi (2):
>>>   media: rcar-vin: Remove unused macro
>>>   media: rcar-vin: Mask VNCSI_IFMD register
>>>
>>>  drivers/media/platform/rcar-vin/rcar-dma.c | 26 ++++++++++++++++++----
>>>  1 file changed, 22 insertions(+), 4 deletions(-)
>>>
>>> --
>>> 2.29.1
>>>
>>
>>
>>
>> Thanks,
>> Mauro
>>
> 

