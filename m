Return-Path: <linux-media+bounces-26753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8F0A41478
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 05:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AFAE1892B36
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 04:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FBC71ACEBF;
	Mon, 24 Feb 2025 04:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="SIGYI9pD"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BA326AF3;
	Mon, 24 Feb 2025 04:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740370801; cv=pass; b=qfMyVQsam6z3dRVHwdViWRMUABGsyF8ae0P95AQJ9LSF8OmZ7kuksxCOszbRhMSmQB9B9/kpBej4/yY5qGTXOgk+jwDmzbChXM0VcAL/x8zbBU4MmZjhoMA/W4GoR82CWqcIjLbzKLaSJut6FmBvpp5tMp9YYLInNdKtQGaD9jA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740370801; c=relaxed/simple;
	bh=KvpBrS6TIBDeYs2gxcmcsV16S5YmNRzk55EH1IGQkhU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FB3Ip8l18T4vpJpM4TAlOBtpVqs9++dqd99NBIqWlZ7quEgNnf6Auepz/UqaodkS8gy2XG7Hr7ehLraLSB7BVMR53rGmA23ctpCDsLeDiTuI+6ThEHBzAx56GerNypOXj1Vcx6OCq1tQBhk++1bNM7ZavaVJnxG80MbCtpGeZ78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=SIGYI9pD; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1740370749; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UAjNen4dEW6JnpcOC6Mf+YxMzDXzamt+sZO0B9Iti4aVH1WNB5ZcTB44337CtWL2LIUtTFvLK5KZ0mDpO9BEa267QSFAiBXcpL6ncpNDypzxKZvdX//MKJTBi3v6FyNG7mxiAYdsG41iFK6zw7Ss1F6pLGmsUqbMD+EDpxoFGD0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740370749; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4ZkwbmlJtwopSPqeSfMDIV4RYNmzpFeckq4z8tSdpLw=; 
	b=hUIrcAJnWTgpPTuMAdSRUkcITbI8xW5Ra1m0CC/9Zctelb8pi06iIdWoSSpKrV5P+lhK5AScmqWJAOYes1vceEOTuGz1t0HJ2gjm0ICKiM92bH7bxW6iam3u2Eh8VkBZpG9qlZljTH8GxRlk6TrtybUvF4IYOjIpEriRnkK59VI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740370749;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4ZkwbmlJtwopSPqeSfMDIV4RYNmzpFeckq4z8tSdpLw=;
	b=SIGYI9pDbacW3G3kg7IVvLcHNtQD8eaLBfcZg1WT1AzVN22iYS5X+dtLvvt2rEOK
	mFxj1Jz5DZIt+EWl61cHYwZLOMrBVCIgs/wC+1ZNjvGD6ewpmFpjc4Jhkc6xQebDUdj
	h3tBMqnLfqV3vaYp2Ve7I3NNmJkoIkH4m7BHRFy4=
Received: by mx.zohomail.com with SMTPS id 1740370748102832.3357248261832;
	Sun, 23 Feb 2025 20:19:08 -0800 (PST)
Message-ID: <d13f13ac-1501-4427-b6d3-ee161eeb932a@collabora.com>
Date: Mon, 24 Feb 2025 07:19:01 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] media: platform: synopsys: Add support for HDMI
 input driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tim Surber <me@timsurber.de>
References: <20250223173019.303518-1-dmitry.osipenko@collabora.com>
 <20250223173019.303518-5-dmitry.osipenko@collabora.com>
 <88b02c37-6741-459b-b966-d6d58d1f9b6f@wanadoo.fr>
 <c30a291b-c81b-4da1-a0ae-270d323b28e3@collabora.com>
 <bc1f5334-b0fb-4e81-979d-feb17886ac40@wanadoo.fr>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <bc1f5334-b0fb-4e81-979d-feb17886ac40@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On 2/24/25 00:11, Christophe JAILLET wrote:
>>>
>>>> +    ret = cec_register_adapter(cec->adap, cec->dev);
>>>> +    if (ret < 0) {
>>>> +        dev_err(cec->dev, "cec register adapter failed\n");
>>>> +        cec_unregister_adapter(cec->adap);
>>>
>>> Is it needed to call cec_unregister_adapter() when
>>> cec_register_adapter() fails?
>>
>> Yes, it's confusing, but unregister is needed to free the adapter
>> properly, it's prepared to do it. Thanks for the review.
>>
> 
> I don't know this API, so you'll get the last word, but
> cec_unregister_adapter() does not seem to do that many things in such a
> case, unless I miss something. See [1].
> 
> CJ
> 
> [1]: https://elixir.bootlin.com/linux/v6.14-rc3/source/drivers/media/
> cec/core/cec-core.c#L370

On a second look, apparently you're right and
cec_notifier_cec_adap_unregister() should be used there.

-- 
Best regards,
Dmitry

