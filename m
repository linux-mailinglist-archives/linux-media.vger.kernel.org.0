Return-Path: <linux-media+bounces-26464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5D9A3DB92
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 14:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0975E1882821
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 13:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966A91FA84F;
	Thu, 20 Feb 2025 13:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="ZrNqmH+M"
X-Original-To: linux-media@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A4A1F8BCC
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740059006; cv=none; b=cBUd1lIHymDdlJFe4XWSsqVExwqUH+kiQsRX0SqB0TkXT3HppMeTF9RN3h00r5r4IjWG3D96rTzns74jrxDv1M+pt6J9wuSPgbgEGknnEGMoyFXlgxMtOkSD+RU8ZAseA7SCHLuGNr73UdLqmWmUQB8drAzI7pu3CcPKRKadJj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740059006; c=relaxed/simple;
	bh=Ygl3Io+G6KqutlPU+fN7rhX49BRWWSTxgCi4pToE2yo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OC5JHjA+vHbiXCItOdonbNnlzHWlE1Nrl+9zgVaxoEUdYSNgA4zy6kwbeq8VsVg1EtVLZePye+1Py6CC8UL6ogB4poOMFMRV0uWx1+tPIuXdDbFcDwMECdxqF/C5TWkqPQ41lbF/CBdsppLcv+uKaSQIvtfBLY12pYRGcyIE9no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=ZrNqmH+M; arc=none smtp.client-ip=195.121.94.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: a2b237e4-ef90-11ef-a82b-005056abad63
Received: from smtp.kpnmail.nl (unknown [10.31.155.38])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id a2b237e4-ef90-11ef-a82b-005056abad63;
	Thu, 20 Feb 2025 14:43:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:from:to:subject:mime-version:date:message-id;
	bh=EKsMcRh8yu35s4bHPNkPdYgdQb79+wz6oYDyj9ZvfMg=;
	b=ZrNqmH+MUFV9RSKjYXnZkzJNnuZp7NrE8+dj+cYujSjNmTMKovbKN4qo/uPEYXtk2ZSW4DL9mdCI2
	 V5LrdfIGzke6K3iSeA556+w7YAjnCCBHWTE5UdtO4eaTZdjPSNGiKv54BmnFSa673Z3x8GhLdKqxse
	 Oiudzw165p97wdUrPXARL0cGgifb2+jAePEZ0WXMsPQVMr7oth5KYsGmQhjZPGtBsAgaaAKCcAVhlI
	 tZdiKhMaz+eo3CY6DHYSfXJD60fqveV4rWGxtkHu+BXFnr5dd+F/Ik92El2zfYdaUYdse7gmQqwfbU
	 d18zGue3tJ2UjMWHYsuYK3e+zRIdLKw==
X-KPN-MID: 33|Eaes4jiC4gq/6GSUBflgNK6jQjPkayQpNLwk1yC2Jg/ldz/sMueDSDnkCJYFleA
 ujuKRdtYYm0KpviVaqjc6ZuKficPf1ZztXjbHlAl0LDk=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|XHi/ZriUdfwf0X3CR+WgT+xssa8CX/k3++rWXWzY8yfbLB5GJPl7lo158Z2otDZ
 rHizjhSnc4m7nXkrsplu/mg==
Received: from [10.47.75.249] (unknown [173.38.220.43])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id a1d21ade-ef90-11ef-957d-005056abf0db;
	Thu, 20 Feb 2025 14:43:14 +0100 (CET)
Message-ID: <eaf46d30-71a4-4200-b1e1-6b657372f5ef@xs4all.nl>
Date: Thu, 20 Feb 2025 14:43:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers/media/pci/sta2x11: replace legacy GPIO APIs
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Song Chen <chensong_2000@189.cn>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20241203072742.191787-1-chensong_2000@189.cn>
 <9489561e-bc41-481d-b542-07fed1161a03@app.fastmail.com>
 <f552e0f5-6350-416f-89e5-e1a0e6aa2886@189.cn>
 <070175a7-1bea-4dbb-8b5b-9edee06fec79@app.fastmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <070175a7-1bea-4dbb-8b5b-9edee06fec79@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 12/3/24 08:52, Arnd Bergmann wrote:
> On Tue, Dec 3, 2024, at 08:48, Song Chen wrote:
>> ok, then remove it.
>>
>> what about drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c,
>> it has the same problem, are you going to remove it as well?
> 
> No, that one is likely to stay around for a while. I think it
> was actually removed before and brought back because there are
> users. That one is just the on-chip component on certain Atom
> SoCs.
> 
> The sta2x11 platform was never that widely used and I think might
> have not been completely upstreamed.

So I can drop this patch, and in the near future I guess we'll receive
a patch from you removing this driver? Is that correct?

Regards,

	Hans


