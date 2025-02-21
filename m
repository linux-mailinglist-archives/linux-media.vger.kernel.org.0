Return-Path: <linux-media+bounces-26552-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F37DDA3EFD0
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 10:18:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0BA07A6550
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 09:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E3F202C23;
	Fri, 21 Feb 2025 09:18:31 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F511C3F02;
	Fri, 21 Feb 2025 09:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740129511; cv=none; b=MdwzPml2g6DEGJfuDzWoaVk2gKLxdrIlkcXJVB43bTpdzxU+GEsy/GCTyl+T6Icja9AvWGiePCay7F/GI41ul26Lul20cvCdsW+Nk9lEpaTrrIy1c3HxPs26I2IGLf2za3XnIJL2NLpRTrlDGxMgM19qJas2ydueRkC7NdM9uRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740129511; c=relaxed/simple;
	bh=6P3RGZ+l16FlvU1+20xzjIs7Vv5XBFdodu33P37D33w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HTEdQ5FdZxd6ZS/IwFQ05xV52+fCQozVn1dzRPHTs8LTS1P3GwIL4mDldhfY8ABSV1O8sKC192lSboZVJwWEmeYp2d4wUqDAJSLNIJXN+evVIxNqjFc6qu0/0M8AvbK5IIhPXviFmesEYwbRWT+eFsSTCAXSejGWCOZ7g8Nknxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5163C4CED6;
	Fri, 21 Feb 2025 09:18:28 +0000 (UTC)
Message-ID: <dffc8e0b-2603-4e7e-ba64-15691c11ff7e@xs4all.nl>
Date: Fri, 21 Feb 2025 10:18:27 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: nuvoton: Fix reference handling of ece_pdev
From: Hans Verkuil <hverkuil@xs4all.nl>
To: Ricardo Ribalda <ribalda@chromium.org>, Joseph Liu <kwliu@nuvoton.com>,
 Marvin Lin <kflin@nuvoton.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marvin Lin <milkfafa@gmail.com>, linux-media@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250121-nuvoton-v1-0-1ea4f0cdbda2@chromium.org>
 <20250121-nuvoton-v1-1-1ea4f0cdbda2@chromium.org>
 <df5693d0-7747-4423-809e-ae081c9aae92@xs4all.nl>
Content-Language: en-US, nl
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <df5693d0-7747-4423-809e-ae081c9aae92@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/02/2025 10:04, Hans Verkuil wrote:
> Hi Ricardo,
> 
> On 21/01/2025 22:14, Ricardo Ribalda wrote:
>> When we obtain a reference to of a platform_device, we need to release
>> it via put_device.
>>
>> Found by cocci:
>> ./platform/nuvoton/npcm-video.c:1677:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
>> ./platform/nuvoton/npcm-video.c:1684:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
>> ./platform/nuvoton/npcm-video.c:1690:3-9: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
>> ./platform/nuvoton/npcm-video.c:1694:1-7: ERROR: missing put_device; call of_find_device_by_node on line 1667, but without a corresponding object release within this function.
> 
> This driver uses this construct:
> 
>                 struct device *ece_dev __free(put_device) = &ece_pdev->dev;
> 
> to automatically call put_device. So this patch would 'put' the device twice.
> 
> Does cocci understand constructs like this? If I hadn't looked closely at the
> code first, I would just have merged it.

Oh wait, now that I am reading the following patches I see that it was those later
patches that add the __free code.

This is far too confusing. Please post a v2 that just combines the 'fix references'
and 'use cleanup.h macros' in a single patch. It makes no sense to have this two-phase
approach.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 46c15a4ff1f4 ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> ---
>>  drivers/media/platform/nuvoton/npcm-video.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
>> index 024cd8ee1709..7b4c23dbe709 100644
>> --- a/drivers/media/platform/nuvoton/npcm-video.c
>> +++ b/drivers/media/platform/nuvoton/npcm-video.c
>> @@ -1673,6 +1673,7 @@ static int npcm_video_ece_init(struct npcm_video *video)
>>  
>>  		regs = devm_platform_ioremap_resource(ece_pdev, 0);
>>  		if (IS_ERR(regs)) {
>> +			put_device(&ece_pdev->dev);
>>  			dev_err(dev, "Failed to parse ECE reg in DTS\n");
>>  			return PTR_ERR(regs);
>>  		}
>> @@ -1680,11 +1681,13 @@ static int npcm_video_ece_init(struct npcm_video *video)
>>  		video->ece.regmap = devm_regmap_init_mmio(dev, regs,
>>  							  &npcm_video_ece_regmap_cfg);
>>  		if (IS_ERR(video->ece.regmap)) {
>> +			put_device(&ece_pdev->dev);
>>  			dev_err(dev, "Failed to initialize ECE regmap\n");
>>  			return PTR_ERR(video->ece.regmap);
>>  		}
>>  
>>  		video->ece.reset = devm_reset_control_get(&ece_pdev->dev, NULL);
>> +		put_device(&ece_pdev->dev);
>>  		if (IS_ERR(video->ece.reset)) {
>>  			dev_err(dev, "Failed to get ECE reset control in DTS\n");
>>  			return PTR_ERR(video->ece.reset);
>>
> 
> 


