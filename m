Return-Path: <linux-media+bounces-17139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B029645B4
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 15:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACEAC1F26938
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 13:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E5D1A4ADE;
	Thu, 29 Aug 2024 13:03:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82ED1A2C3C;
	Thu, 29 Aug 2024 13:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724936628; cv=none; b=dMLRzu62i5ulPVAXtOwd1FQ1tN4GN18tjz05ch95nru407U5tdTxoILNOPsoLWZAcRBut2RPMTG914sPxKFkqx8rDZiD1dGbHpOx5uBqrdUJAGbUtsfhu6VszvvgBFB+RWXX+bv9aGEkC6pUSrpN9sOjgK0++ObyTSHP+l9/cns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724936628; c=relaxed/simple;
	bh=xRAHcgILyQrSlNfoTFDBhMpDCu1uBd9K5KrHhKjvR/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BJK9n6ierzr3Sx2d/h/SeC9CUN7iW6R/R8BtC4pls7ZrZYWbblBH6Oto4JdPYffNCcjwM1Fx8rU3tyLNqXuFTI3VEPxKuV7WAyv5Sn0fnrQ872CtElXQ752OHzohr6z+4ZzRrqoriLS4lBqxiv+wgDC2Bv4KpthEnXHRJUbQgds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WvhJ83bBmzpV1q;
	Thu, 29 Aug 2024 21:02:00 +0800 (CST)
Received: from dggpemm500020.china.huawei.com (unknown [7.185.36.49])
	by mail.maildlp.com (Postfix) with ESMTPS id 30B7D18007C;
	Thu, 29 Aug 2024 21:03:44 +0800 (CST)
Received: from [10.67.108.52] (10.67.108.52) by dggpemm500020.china.huawei.com
 (7.185.36.49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 29 Aug
 2024 21:03:43 +0800
Message-ID: <7c219682-833e-41d6-8708-044b89f9d591@huawei.com>
Date: Thu, 29 Aug 2024 21:03:43 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 1/3] media: v4l2-subdev: enable module autoloading
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Biju Das
	<biju.das.jz@bp.renesas.com>
CC: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>, "jacopo@jmondi.org"
	<jacopo@jmondi.org>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "tomi.valkeinen@ideasonboard.com"
	<tomi.valkeinen@ideasonboard.com>
References: <20240829075417.526459-1-liaochen4@huawei.com>
 <20240829075417.526459-2-liaochen4@huawei.com>
 <TY3PR01MB11346459841445E77A5FBA37B86962@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20240829094546.GA12951@pendragon.ideasonboard.com>
From: "liaochen (A)" <liaochen4@huawei.com>
In-Reply-To: <20240829094546.GA12951@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500020.china.huawei.com (7.185.36.49)

On 2024/8/29 17:45, Laurent Pinchart wrote:
> On Thu, Aug 29, 2024 at 08:27:06AM +0000, Biju Das wrote:
>> Hi Liao Chen,
>> On Thursday, August 29, 2024 8:54 AM, Liao Chen wrote:
>>> Subject: [PATCH -next 1/3] media: v4l2-subdev: enable module autoloading
>>
>> Commit header is wrong.
> 
> Indeed, it should be
> 
> media: i2c: mt9v111: Enable module autoloading
> 
>>> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based on the alias from
>>> of_device_id table.
> 
> Please also reflow the commit message to 72 columns. With those issues
> fixed,
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
>>>
>>> Signed-off-by: Liao Chen <liaochen4@huawei.com>
>>> ---
>>>   drivers/media/i2c/mt9v111.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/media/i2c/mt9v111.c b/drivers/media/i2c/mt9v111.c index
>>> b0b98ed3c150..b6a2623798c5 100644
>>> --- a/drivers/media/i2c/mt9v111.c
>>> +++ b/drivers/media/i2c/mt9v111.c
>>> @@ -1265,6 +1265,7 @@ static const struct of_device_id mt9v111_of_match[] = {
>>>   	{ .compatible = "aptina,mt9v111", },
>>>   	{ /* sentinel */ },
>>
>> Nit: Comma can be dropped from terminator entry as a separate patch.
>>
>> Cheers,
>> Biju
>>
>>>   };
>>> +MODULE_DEVICE_TABLE(of, mt9v111_of_match);
>>>
>>>   static struct i2c_driver mt9v111_driver = {
>>>   	.driver = {
> 
Thanks for pointing out, just sent a patch series with these issues fixed.

Thanks,
Chen

