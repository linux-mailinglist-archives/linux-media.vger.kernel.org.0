Return-Path: <linux-media+bounces-41085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BBDB362E0
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 15:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74C57466FD7
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 13:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDDF343D7B;
	Tue, 26 Aug 2025 13:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="Vn5AcRhu"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB46D343D9B;
	Tue, 26 Aug 2025 13:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756214108; cv=pass; b=aex+zRaTkr5w+zIITfs8VnbX+t7yw0qNqUlpAHYDSIJIcqu3GOdLMplIMazkcmQm/R1NrZgZYQ0+YsLzLLBLo/2ETGyemSdf7LyCBm3+ho/FO3cWJyynv6RDs+DJ3O65xwB6qx1+W7OKjeE+gkhwsfjdPCo8yTT7b6G2aJhTA38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756214108; c=relaxed/simple;
	bh=4L/5/IzzgVuHCII7Kzbc+julZ9J9jxBCB23SMl/aB8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S31DK4etBhYvMN0KYQazUujlXvNxGJ4wKub5TkMr1qa04/RmaQFy6fpXcNUC18Z8dOMAFWvzIq9Cbklmi09WF9LZ9qztrjGsE54U3HtW3E6nUDC3V1/9bxk3PiAuAbR2kgbRYRE9/M0YTdjewK+BGL5bcYEM0io0y2wVPibB+/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=Vn5AcRhu; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1756214076; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SzFR1y2hQifrr1QcPR5WzrWPvb1o9u/qCP/XFXoSQ0eixqkF4WfPknRj4noSB+VIYxrwBu/+gAQLGHH3d5enRKgIEcYRWmoDBQtMkzwLYsSACjPRzAc3nwvfPio7lXuCRjDefXNdwAxE6lp1oE7yVo0iI7lQx/lnsYIdCgLabPw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756214076; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WNuw2smkSUbseMqhQYhMnAKOM3W6MRvMOpj1QgvkS8w=; 
	b=JnPShJ/oLY3hwO01CreDYBXMbChk11ZYRhdeoShjQAd+WV2IRdfwZsiwVJphqMa068f5Np9AkgkAiE3sfs60mSLNHkG8PXLSJc9JA9ADF48ohhiRciWn2WnALv4x7s1bJmrLEdAc0k/CbDIXOJoqpUlLbTulWz1CLagQAYRtlk0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756214076;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=WNuw2smkSUbseMqhQYhMnAKOM3W6MRvMOpj1QgvkS8w=;
	b=Vn5AcRhuGSt2DFamCzGpSUHNC/sEkT8T+X90OV2ajvTRiXEQZlJ2uBTzMl1cZLkY
	8REbeo8r1FHpwGjvvKUw7Ibd/uoePOjBTwfTSB6YfpMVT2m8VKXcETlUALaUlHcuRRD
	NDdFupVdVqUxPssNPoMBayroq0UMTgLmtRVwFX2o=
Received: by mx.zohomail.com with SMTPS id 1756214074471159.25951317157126;
	Tue, 26 Aug 2025 06:14:34 -0700 (PDT)
Message-ID: <f2f09c95-1d08-43db-aee0-25cdaaf8dbca@collabora.com>
Date: Tue, 26 Aug 2025 15:14:30 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] media: verisilicon: AV1: Restore IOMMU context
 before decoding a frame
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, joro@8bytes.org,
 will@kernel.org, robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, p.zabel@pengutronix.de,
 mchehab@kernel.org, iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 linux-media@vger.kernel.org
References: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
 <20250825153450.150071-5-benjamin.gaignard@collabora.com>
 <20250825170531.GA1899851@ziepe.ca>
 <01c327e8353bb5b986ef6fb1e7311437659aea4a.camel@collabora.com>
 <20250825183122.GB1899851@ziepe.ca>
 <441df5ff-8ed4-45ed-8a52-b542c6e7d38c@collabora.com>
 <20250826124155.GD1899851@ziepe.ca>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250826124155.GD1899851@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 26/08/2025 à 14:41, Jason Gunthorpe a écrit :
> On Tue, Aug 26, 2025 at 11:52:37AM +0200, Benjamin Gaignard wrote:
>> Le 25/08/2025 à 20:31, Jason Gunthorpe a écrit :
>>> On Mon, Aug 25, 2025 at 01:50:16PM -0400, Nicolas Dufresne wrote:
>>>
>>>> Jason, the point is that the iommu and the VPU are not separate devices, which
>>>> comes with side effects. On RKVDec side, the iommu configuration get resets
>>>> whenever a decoding error leads to a VPU "self reset". I can't remember who from
>>>> the iommu subsystem suggested that, but the empty domain method was agreed to be
>>> IDK, that seems really goofy too me an defiantly needs to be
>>> extensively documented this is restoring the default with some lore
>>> link of the original suggestion.
>>>
>>>> the least invasive way to workaround that issue. I believe Detlev tried multiple
>>>> time to add APIs for that before the discussion lead to this path.
>>> You mean this:
>>>
>>> https://lore.kernel.org/linux-iommu/20250318152049.14781-1-detlev.casanova@collabora.com/
>>>
>>> Which came back with the same remark I would give:
>>>
>>>    Please have some kind of proper reset notifier mechanism - in fact
>>>    with runtime PM could you not already invoke a suspend/resume cycle
>>>    via the device links?
>> when doing parallel decode suspend/resume are not invoked.
> It was a proposal for an error recovery path.
>
>>> Or another reasonable option:
>>>
>>>     Or at worst just export a public interface for the other driver to
>>>     invoke rk_iommu_resume() directly.
>>>
>>> Sigh.
>> An other solution which is working is to call iommu_flush_iotlb_all()
>> before decoding each frame.
> That was already proposed and shot down, it makes no sense at all use
> to use flushing to reset the registers because the HW weirdly lost
> them, and flushing should never happen outside mapping contexts.
>
> If the HW is really resetting the iommu registers after every frame
> that is really just painfully broken, and makes me wonder if it really
> should be an iommu subsystem driver at all if it is so tightly coupled
> to the computing HW. :\
>
> Like we wouldn't try to put a GPU MMU into the iommu subsystem though
> they do fairly similar things.

I will add vsi_iommu_restore_ctx() function where all locks will be
managed and call vsi_iommu_enable(). Decoder driver will call this function
before each frame.
I think it similar to some omap iommu code I have found.

Regards,
Benjamin

> Jason
>

