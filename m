Return-Path: <linux-media+bounces-41068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2301CB35967
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 11:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41463189E5CE
	for <lists+linux-media@lfdr.de>; Tue, 26 Aug 2025 09:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C134F31DD98;
	Tue, 26 Aug 2025 09:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="AG9TH54n"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FED2D7381;
	Tue, 26 Aug 2025 09:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756201996; cv=pass; b=HumuFlSbWk25DKr3Y4+PSVgwyFjWPok+RTH/91mQs/Y71XBhCbl2tneV6hcDtA3rDMiz8O21F+79wFISNP+HBrQSUrZRvBLnLRNDldMpqxASiXhEON7Wj0o+bG0jkVONGNK4CSdG3oPD1k3pDoiWsPJ7xtbFi1xxJoAD4Yc4JME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756201996; c=relaxed/simple;
	bh=zIGY1fFtDQfdPHcEoxy08v8AvwrDO5wfolpGfMYBkfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MFhcFrm1SJJgbah4xL6KV/2G/vPHnhxrab/MO8ljQ2vi7N2zQo+PBnd7zwPdVaQhiJdmtl49jL33dJP8jO7c8KMjlqKl0pib0HcpYVsUF8JXc3CWPoIQXCOn3FOK4omK1nv1w/HrAeAiTXsYW/ZrqlaMfwiBCBi6usgOdk/bc8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=AG9TH54n; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1756201964; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JqdDCyoBRzA1ioGUjwKcsJArCawzPxSOe3thrDi9ZwZgHt0F9QAZqRvQAfV4esQt0ZAZYxZfIwKBbLA7wAN7myHdr64ix7uqfJlkTjg6/8Z8geKK3qdsikhHWjXZdkwx8jcP4HmdM2znP3ZrQ+jGvAhdUK+s1kfc3IWXPCcePq0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756201964; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=o6Q7Y3E1cI9YU4bN/X3ZlCOSutz2V8wdoXek4KPsGKk=; 
	b=O5Q+G54QW5RkzHJ6dJtSKoVoOCfSKVlAW+tfDEe6CjrFcIrolaNLgkVVGVlXU6YMb0lZSSUL6jajqZN74bUUXUQxUpjgSKaIRLRnXOs2Ay78qz2buhWoyqtXUub8H+w1BJW0kL0ivqY6GnMj28JhPGSLhMYnqndGs68QaJt0/+A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756201964;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=o6Q7Y3E1cI9YU4bN/X3ZlCOSutz2V8wdoXek4KPsGKk=;
	b=AG9TH54nMsGLH+Z0Jeu4Bj4Bk9uWmYiW+eIryri/67U8aGWVludige0cAmHf5BUe
	4Vr+Dy3eHegOxtOfj19PKtaH4dbpV48j5LWWIqE/K6aTrdSqjS2YOyqGTZ07W7EP8bU
	O8Mw0wN5T1Ut623zh1GF4mD75RQRZ9MxZIZT209w=
Received: by mx.zohomail.com with SMTPS id 1756201961981405.52754025942295;
	Tue, 26 Aug 2025 02:52:41 -0700 (PDT)
Message-ID: <441df5ff-8ed4-45ed-8a52-b542c6e7d38c@collabora.com>
Date: Tue, 26 Aug 2025 11:52:37 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/6] media: verisilicon: AV1: Restore IOMMU context
 before decoding a frame
To: Jason Gunthorpe <jgg@ziepe.ca>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
 p.zabel@pengutronix.de, mchehab@kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, linux-media@vger.kernel.org
References: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
 <20250825153450.150071-5-benjamin.gaignard@collabora.com>
 <20250825170531.GA1899851@ziepe.ca>
 <01c327e8353bb5b986ef6fb1e7311437659aea4a.camel@collabora.com>
 <20250825183122.GB1899851@ziepe.ca>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20250825183122.GB1899851@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 25/08/2025 à 20:31, Jason Gunthorpe a écrit :
> On Mon, Aug 25, 2025 at 01:50:16PM -0400, Nicolas Dufresne wrote:
>
>> Jason, the point is that the iommu and the VPU are not separate devices, which
>> comes with side effects. On RKVDec side, the iommu configuration get resets
>> whenever a decoding error leads to a VPU "self reset". I can't remember who from
>> the iommu subsystem suggested that, but the empty domain method was agreed to be
> IDK, that seems really goofy too me an defiantly needs to be
> extensively documented this is restoring the default with some lore
> link of the original suggestion.
>
>> the least invasive way to workaround that issue. I believe Detlev tried multiple
>> time to add APIs for that before the discussion lead to this path.
> You mean this:
>
> https://lore.kernel.org/linux-iommu/20250318152049.14781-1-detlev.casanova@collabora.com/
>
> Which came back with the same remark I would give:
>
>   Please have some kind of proper reset notifier mechanism - in fact
>   with runtime PM could you not already invoke a suspend/resume cycle
>   via the device links?

when doing parallel decode suspend/resume are not invoked.

>
> Or another reasonable option:
>
>    Or at worst just export a public interface for the other driver to
>    invoke rk_iommu_resume() directly.
>
> Sigh.

An other solution which is working is to call iommu_flush_iotlb_all()
before decoding each frame.
It doesn't require to allocate a domain per decoding context.
Does that sound as a better solution ?

Benjamin

>
>> Benjamin, please improve the naming, comment and description, I agree with Jason
>> its not completely clear. I'm also surprised that you do that every frame, seems
>> excessive.
> Indeed if it is just error recovery.
>
>> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ff8c5622f9f7c644e995d013af320b59e4d61b93
> This is already merged? And now you want two copies of this? I think
> this is a very poor direction..
>
> Jason
>

