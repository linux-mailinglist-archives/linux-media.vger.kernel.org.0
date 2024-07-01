Return-Path: <linux-media+bounces-14456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD7791DB61
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 11:27:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC2421C226C1
	for <lists+linux-media@lfdr.de>; Mon,  1 Jul 2024 09:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AA284DFF;
	Mon,  1 Jul 2024 09:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ujXxo3s8"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8D01F937;
	Mon,  1 Jul 2024 09:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719826019; cv=none; b=nom5D1DqaRqb9fVGO7Md5kRF2lmlQXvhI8VTeEryhhzJZSRUyutW56gALdyOvNmyihla8u/h6oYfOkOs93qE3meNnR2a9ABGRqrkqAZi6Gs/7mpR/DO4n84Zos2Wdv/vIlKb03+RqAJjAsMj8+tWI6BTFzuIZG/y6zvgGK+OcYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719826019; c=relaxed/simple;
	bh=nrCkN3tD/QfQyR0fUVWHWZ+rTsMW7+5cNHHWacjAW38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WqWQmE5zMI3LXYpJByppDUqyqIlYM9PwXA7CG+VI6uxJwmB6ItM5nsM1SVG5ZJvMJgutljVNEXNV1TtgHA9evfjffbfQORiMnuBEbspacXgy8cgrpE+iEn9QBb2VBtIHIzjCT8hYNxGtF3yL4LNuNWSBiuDA+WkgKJIeznbxZzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ujXxo3s8; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719826016;
	bh=nrCkN3tD/QfQyR0fUVWHWZ+rTsMW7+5cNHHWacjAW38=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ujXxo3s82tWF5ifLVJppUjgHuwuEcLY+AIlxVBed01+JtZQT+x6lRIEYVm74oVYSP
	 RF1IRDlDKSaVLFhijNF524Y0jtck8keC2yQO63I4BZZTb3zSPYY6aHiA0WgDw5BYos
	 TrRZJZVDjtjp8qahxsDZ1QIpOmyPs51+8ZRR/9p2/MKZDNiu43et4h6Vbnkez8Ql0A
	 ljpu6A+FbSuh3uARKuSqOL5eGWalHD2fQe/3pDGiMvxX1L1d02Sx1JY6J6+XZSzARl
	 3Ue/s3qSfJ0M6JdwMDFww8/r1mqdCI9/ukJCdNr42Ud8rWfzwCR5rKN6+JJfvCk2ch
	 ZxRmQzGvlMJ+g==
Received: from [100.74.67.65] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DECDA37804B2;
	Mon,  1 Jul 2024 09:26:55 +0000 (UTC)
Message-ID: <b51c6781-8c35-4945-abf4-21deedaefc06@collabora.com>
Date: Mon, 1 Jul 2024 11:26:54 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: i2c: max96714: coding style fixes
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240628-gmsl2-drivers-style-fixup-v1-0-a4bb49f4c7a1@collabora.com>
 <20240628-gmsl2-drivers-style-fixup-v1-2-a4bb49f4c7a1@collabora.com>
 <ZoJU/2Ai0Bl/08Vt@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Content-Language: en-US
From: Julien Massot <julien.massot@collabora.com>
In-Reply-To: <ZoJU/2Ai0Bl/08Vt@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Tommaso,

On 7/1/24 9:04 AM, Tommaso Merciai wrote:
> Hi Julien,
> 
> On Fri, Jun 28, 2024 at 02:29:28PM +0200, Julien Massot wrote:
>> Coding style fixes suggested by Sakari during the
>> driver review.
>>
>> Signed-off-by: Julien Massot <julien.massot@collabora.com>
>> ---
>>   drivers/media/i2c/max96714.c | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/i2c/max96714.c b/drivers/media/i2c/max96714.c
>> index c97de66631e0..c738908bf141 100644
>> --- a/drivers/media/i2c/max96714.c
>> +++ b/drivers/media/i2c/max96714.c
>> @@ -25,6 +25,7 @@
>>   #define MAX96714_NPORTS     2
>>   #define MAX96714_PAD_SINK   0
>>   #define MAX96714_PAD_SOURCE 1
>> +#define MAX96714_CSI_NLANES 4
>>   
>>   /* DEV */
>>   #define MAX96714_REG13                 CCI_REG8(0x0d)
>> @@ -724,8 +725,9 @@ static int max96714_init_tx_port(struct max96714_priv *priv)
>>   	 * Unused lanes need to be mapped as well to not have
>>   	 * the same lanes mapped twice.
>>   	 */
>> -	for (; lane < 4; lane++) {
>> -		unsigned int idx = find_first_zero_bit(&lanes_used, 4);
>> +	for (; lane < MAX96714_CSI_NLANES; lane++) {
>> +		unsigned int idx = find_first_zero_bit(&lanes_used,
>> +						       MAX96714_CSI_NLANES);
>>   
>>   		val |= idx << (lane * 2);
>>   		lanes_used |= BIT(idx);
>> @@ -757,9 +759,7 @@ static int max96714_rxport_disable_poc(struct max96714_priv *priv)
>>   static int max96714_parse_dt_txport(struct max96714_priv *priv)
>>   {
>>   	struct device *dev = &priv->client->dev;
>> -	struct v4l2_fwnode_endpoint vep = {
>> -		.bus_type = V4L2_MBUS_CSI2_DPHY
>> -	};
>> +	struct v4l2_fwnode_endpoint vep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
>>   	struct fwnode_handle *ep_fwnode;
>>   	u32 num_data_lanes;
>>   	int ret;
>> @@ -791,14 +791,14 @@ static int max96714_parse_dt_txport(struct max96714_priv *priv)
>>   	}
>>   
>>   	num_data_lanes = vep.bus.mipi_csi2.num_data_lanes;
>> -	if (num_data_lanes < 1 || num_data_lanes > 4) {
>> +	if (num_data_lanes < 1 || num_data_lanes > MAX96714_CSI_NLANES) {
>>   		dev_err(dev,
>>   			"tx: invalid number of data lanes must be 1 to 4\n");
>>   		ret = -EINVAL;
>>   		goto err_free_vep;
>>   	}
>>   
>> -	memcpy(&priv->mipi_csi2, &vep.bus.mipi_csi2, sizeof(priv->mipi_csi2));
>> +	priv->mipi_csi2 = vep.bus.mipi_csi2;
>>   
>>   err_free_vep:
>>   	v4l2_fwnode_endpoint_free(&vep);
> 
> This Patch looks good to me.
> Reviewed-by: Tommaso Merciai <tomm.merciai@gmail.com>
> Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
> 
> Note:
> I think we can fix also the following defines here, as a coding style
> fixes. Maybe in another patch.
> 
> #define MAX96714_PATGEN_DE_CNT         CCI_REG16(0x25B)
> #define MAX96714_PATGEN_CHKB_COLOR_A   CCI_REG24(0x25E)
> 
> I think hex numbers for regs must be lower case instead of upper case :)

Thanks for the test, I will send a v2 with these hex numbers in lower case.

Regards,
Julien

