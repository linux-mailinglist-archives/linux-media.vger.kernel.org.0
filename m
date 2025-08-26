Return-Path: <linux-media+bounces-41064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F38B356CF
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 10:27:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E4432A09DA
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 08:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 019692F99A3;
	Tue, 26 Aug 2025 08:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="HTkjHKqg"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE7014A8B;
	Tue, 26 Aug 2025 08:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756196840; cv=none; b=fvH1fNqe0fyt7MtDoPdZ5EvnXzwksIlD8aX3Vb/yw5gwlaKIM5ByywFWZw56xmyof51pujS9SAtJrjr172CK9P0Kn2A3E4IU871Wg0UX/VK1NN9apk2exzzDZ9K7AjG1+wTt/3GasUzMLr8GnUxbYx6SBKObQnIm0ior3+E96ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756196840; c=relaxed/simple;
	bh=iNAbWuRYqKobddKwX1b9TKa5uBTJVXzw0AZxRaDpRvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OMDZExn3QXLQzArtPQNRyTfFnEF/fltS3Wna2hHLvikWo79NBXvjGre2j5o20/Sb22OECWjaSP2Y+26ysmPcEy84ZGV1j/eGQfYcXBQvrk/X1NnYVS6iRtiVpKUGZdE/kGud2INFukHq81d0P8XOl/Q7D9xtqdMlX0+AfCZByao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=HTkjHKqg; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57Q8QYjL1490705;
	Tue, 26 Aug 2025 03:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756196795;
	bh=Up+ZYBhT8QrHZf6BT7jB0PeZJcHkilAw8/OUTiwhvLA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HTkjHKqgBOhYCfjmgZlnluvXZdydWAd0LCYS9qOkZDbddhcqGaZ5Li0nawgQHh0Tf
	 MKCaXbQP0nCR56AyDoY8OL+CWHYkn44k78UEaPiXPT3KwlEmySi9l2xmfYUB0jDKty
	 qi6rZ5yco8+Bbx9qLN90tmF60xVuOw4BUR8ZfC0o=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57Q8QYmW2259941
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 26 Aug 2025 03:26:34 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 26
 Aug 2025 03:26:33 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 26 Aug 2025 03:26:33 -0500
Received: from [10.24.68.198] (abhilash-hp.dhcp.ti.com [10.24.68.198])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57Q8QQkQ1132570;
	Tue, 26 Aug 2025 03:26:27 -0500
Message-ID: <3b9f6ecc-2152-4385-bbdc-700b7eca94af@ti.com>
Date: Tue, 26 Aug 2025 13:56:26 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/4] Revert "media: platform: ti: Remove unused
 vpdma_update_dma_addr"
To: Krzysztof Kozlowski <krzk@kernel.org>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux@armlinux.org.uk>, <ardb@kernel.org>, <ebiggers@kernel.org>,
        <geert+renesas@glider.be>, <claudiu.beznea@tuxon.dev>,
        <bparrot@ti.com>, <andre.draszik@linaro.org>,
        <kuninori.morimoto.gx@renesas.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <heikki.krogerus@linux.intel.com>, <kory.maincent@bootlin.com>,
        <florian.fainelli@broadcom.com>, <lumag@kernel.org>,
        <dale@farnsworth.org>, <sbellary@baylibre.com>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <dagriego@biglakesoftware.com>, <u-kumar1@ti.com>
References: <20250716111912.235157-1-y-abhilashchandra@ti.com>
 <20250716111912.235157-3-y-abhilashchandra@ti.com>
 <c453aadb-afd7-473c-bb39-cab1930c8baa@kernel.org>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <c453aadb-afd7-473c-bb39-cab1930c8baa@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Krzysztof,
Thanks for the review.

On 16/07/25 19:53, Krzysztof Kozlowski wrote:
> On 16/07/2025 13:19, Yemike Abhilash Chandra wrote:
>> This reverts commit 9314891df119442a6ec1518b3d872c330e2bf1a1.
>>
>> We're adding support for TI VIP driver, so this is no longer unused.
>>
>> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> ---
>>   drivers/media/platform/ti/vpe/vpdma.c | 32 +++++++++++++++++++++++++++
>>   drivers/media/platform/ti/vpe/vpdma.h |  3 +++
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/drivers/media/platform/ti/vpe/vpdma.c b/drivers/media/platform/ti/vpe/vpdma.c
>> index bb8a8bd7980c..da90d7f03f82 100644
>> --- a/drivers/media/platform/ti/vpe/vpdma.c
>> +++ b/drivers/media/platform/ti/vpe/vpdma.c
>> @@ -552,6 +552,38 @@ EXPORT_SYMBOL(vpdma_submit_descs);
>>   
>>   static void dump_dtd(struct vpdma_dtd *dtd);
>>   
> 
> 
> Please add kerneldoc.
> 

I will add kerneldoc in v3. Thanks

>> +void vpdma_update_dma_addr(struct vpdma_data *vpdma,
>> +	struct vpdma_desc_list *list, dma_addr_t dma_addr,
>> +	void *write_dtd, int drop, int idx)
>> +{
>> +	struct vpdma_dtd *dtd = list->buf.addr;
>> +	dma_addr_t write_desc_addr;
>> +	int offset;
>> +
>> +	dtd += idx;
>> +	vpdma_unmap_desc_buf(vpdma, &list->buf);
>> +
>> +	dtd->start_addr = dma_addr;
>> +
>> +	/* Calculate write address from the offset of write_dtd from start
>> +	 * of the list->buf
>> +	 */
>> +	offset = (void *)write_dtd - list->buf.addr;
>> +	write_desc_addr = list->buf.dma_addr + offset;
>> +
>> +	if (drop)
>> +		dtd->desc_write_addr = dtd_desc_write_addr(write_desc_addr,
>> +							   1, 1, 0);
>> +	else
>> +		dtd->desc_write_addr = dtd_desc_write_addr(write_desc_addr,
>> +							   1, 0, 0);
>> +
>> +	vpdma_map_desc_buf(vpdma, &list->buf);
>> +
>> +	dump_dtd(dtd);
>> +}
>> +EXPORT_SYMBOL(vpdma_update_dma_addr);
> 
> 
> This has to be GPL
> 

I will correct this in v3.

Thanks and Regards
Yemike Abhilash Chandra

>> +
>>   void vpdma_set_max_size(struct vpdma_data *vpdma, int reg_addr,
>>   			u32 width, u32 height)
> 
> Best regards,
> Krzysztof


