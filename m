Return-Path: <linux-media+bounces-49827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D7ECED427
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 19:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B45B33006A76
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 18:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F67D2F1FFE;
	Thu,  1 Jan 2026 18:15:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from rmisp-mx-out1.tele.net (rmisp-mx-out1.tele.net [194.208.23.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0792E54A3;
	Thu,  1 Jan 2026 18:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.208.23.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767291306; cv=none; b=ko591HkGLoqaHFP3tf7hRoM5WSSznoz5aq+piRQ8tnKTHiYP3Pqg5G74ODjUO45rxZnTMjNt/F/98v76v6slub7w8T7K9nMgjfG/ndsVnp5oYfv/vFChjQDudunEl7lFTAa6X4n9RW/XJkHV55bt67B0IwEJTIWlU4ZajhO2ofQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767291306; c=relaxed/simple;
	bh=Rmuqu+Ek+T5YtxAgpWBAVcG8C34jeDmR34VUZXa+XOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQT5UAx3xybP+GiQSAUhtw5EnO0SAYMAf6jbUWAVfk6ZLVlHKzJAddcJDcqhPchBSxsxfj1WMgoAXru0i3stWNgQLGdfPbk5m4h2Ip+h2taSTtkTtxV1QpKJ1RwtI/jAKfkl2qOcFG0L/gB4gmQVdM34NAwKlkCAtSo3swBt3lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=fail smtp.mailfrom=emfend.at; arc=none smtp.client-ip=194.208.23.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=emfend.at
Received: from [192.168.0.207] (194-208-208-245.tele.net [194.208.208.245])
	by rmisp-mx-out1.tele.net (Postfix) with ESMTPA id 0C26F10E2A89;
	Thu,  1 Jan 2026 19:09:14 +0100 (CET)
Message-ID: <1cca1105-07dc-4482-b131-eadf9ed3a5f0@emfend.at>
Date: Thu, 1 Jan 2026 19:09:07 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: i2c: imx283: add support for non-continuous
 MIPI clock mode
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Umang Jain <uajain@igalia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251217-imx283-ext-v1-0-906a762f592d@emfend.at>
 <20251217-imx283-ext-v1-2-906a762f592d@emfend.at>
 <176709148864.3401191.3323585790771042734@ping.linuxembedded.co.uk>
Content-Language: de-DE
From: Matthias Fend <matthias.fend@emfend.at>
In-Reply-To: <176709148864.3401191.3323585790771042734@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kieran,

thanks for your feedback.

Am 30.12.2025 um 11:44 schrieb Kieran Bingham:
> Quoting Matthias Fend (2025-12-17 07:06:01)
>> Add support for selecting between continuous and non-continuous MIPI clock
>> mode.
>>
>> Previously, the CSI-2 non-continuous clock endpoint flag was ignored and
>> the sensor was always configured for non-continuous clock mode. For
>> existing device tree nodes that do not have this property enabled, this
>> update will therefore change the actual clock mode.
> 
> So this means that not specifying non-continous will now enforce
> continuous mode on existing devices ?

Yes.

> 
> Are there any implications to that? I know there are quite a few users
> of the sensor on Raspberry Pi for instance.

This shouldn't cause any problems. Several sensors already use different 
clock modes. However, it can't be completely ruled out that some MIPI 
receivers might have issues with it.

At least on an i.MX8MP, both modes work without any problems.

> 
> I think it should be fine though.
> 
>> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
>> ---
>>   drivers/media/i2c/imx283.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/media/i2c/imx283.c b/drivers/media/i2c/imx283.c
>> index 8ab63ad8f385f6e2a2d7432feff0af09a5356dc4..7a6ab2941ea985401b21d60163b58e980cf31ddc 100644
>> --- a/drivers/media/i2c/imx283.c
>> +++ b/drivers/media/i2c/imx283.c
>> @@ -149,6 +149,9 @@
>>   #define IMX283_REG_PLSTMG02            CCI_REG8(0x36aa)
>>   #define   IMX283_PLSTMG02_VAL          0x00
>>   
>> +#define IMX283_REG_MIPI_CLK            CCI_REG8(0x3a43)
>> +#define   IMX283_MIPI_CLK_NONCONTINUOUS        BIT(0)
> 
> I can't find this in my datasheet, so no specific comment on the
> register I'm afraid. Did you get this from the vendor or is it an
> assumption from other sony drivers?

This was a hint from the vendor.

> 
> I assume you can measurably detect that this register impacts the clock
> on a CSI scope or such perhaps from the receiver?

Yes, on an scope you can clearly see whether the clock switches to the 
low-power state during the inactive phases.

Some MIPI receivers (such as the i.MX8MP) also have a status flag that 
indicates the current ULP state of the clock lane.

By increasing the vblank, this register can also be used to determine 
quite reliable whether the clock lane sometimes switches to the ULP state.

> 
> So even with all that I think this appears to be correct. I'll test it
> more when I can but otherwise:

Thanks!

~Matthias

> 
> 
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
>> +
>>   #define IMX283_REG_EBD_X_OUT_SIZE      CCI_REG16_LE(0x3a54)
>>   
>>   /* Test pattern generator */
>> @@ -565,6 +568,7 @@ struct imx283 {
>>          struct v4l2_ctrl *hblank;
>>          struct v4l2_ctrl *vflip;
>>   
>> +       bool mipi_clk_noncontinuous;
>>          unsigned long link_freq_bitmap;
>>   
>>          u16 hmax;
>> @@ -988,6 +992,7 @@ static int imx283_set_pad_format(struct v4l2_subdev *sd,
>>   static int imx283_standby_cancel(struct imx283 *imx283)
>>   {
>>          unsigned int link_freq_idx;
>> +       u8 mipi_clk;
>>          int ret = 0;
>>   
>>          cci_write(imx283->cci, IMX283_REG_STANDBY,
>> @@ -1007,6 +1012,10 @@ static int imx283_standby_cancel(struct imx283 *imx283)
>>          /* Enable PLL */
>>          cci_write(imx283->cci, IMX283_REG_STBPL, IMX283_STBPL_NORMAL, &ret);
>>   
>> +       /* Configure MIPI clock mode */
>> +       mipi_clk = imx283->mipi_clk_noncontinuous ? IMX283_MIPI_CLK_NONCONTINUOUS : 0;
>> +       cci_write(imx283->cci, IMX283_REG_MIPI_CLK, mipi_clk, &ret);
>> +
>>          /* Configure the MIPI link speed */
>>          link_freq_idx = __ffs(imx283->link_freq_bitmap);
>>          cci_multi_reg_write(imx283->cci, link_freq_reglist[link_freq_idx].regs,
>> @@ -1426,6 +1435,9 @@ static int imx283_parse_endpoint(struct imx283 *imx283)
>>                  goto done_endpoint_free;
>>          }
>>   
>> +       imx283->mipi_clk_noncontinuous =
>> +               bus_cfg.bus.mipi_csi2.flags & V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
>> +
>>          ret = v4l2_link_freq_to_bitmap(imx283->dev, bus_cfg.link_frequencies,
>>                                         bus_cfg.nr_of_link_frequencies,
>>                                         link_frequencies, ARRAY_SIZE(link_frequencies),
>>
>> -- 
>> 2.34.1
>>


