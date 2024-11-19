Return-Path: <linux-media+bounces-21581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 283569D247A
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 12:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A98EEB22E9F
	for <lists+linux-media@lfdr.de>; Tue, 19 Nov 2024 11:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29C21C57B1;
	Tue, 19 Nov 2024 11:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="ZoqYUmXk"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9604014AD1A;
	Tue, 19 Nov 2024 11:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732014185; cv=pass; b=XekOq5+rEI5bGZQ0C7Ej6aO4ryn3EsLVenbUItkAvkX2z8MC0dBo5VZLjw5FBY/dI7qni87UrIFlm5Q5xreWJlsXqBfh/+3T4f8JgOK+VTdaAU5XraFPasE6ruq04QbRDQ+TRRN9vHW/UGpUEBxHF5OlJVTQpQJGN4HkjrmgJ6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732014185; c=relaxed/simple;
	bh=r8iOTpTsKvq1RFPuZ8XO2AP+FEfEYHV4WSecmxZ2HZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/D3lYlVlfoYkwL++tmLaj4AT2aGHQ8tnt/uJJZvBMMyY+XrULlloyhewvw/MAm0snShvry7WQzFGSBQQ5J6q3fMRfc1y61njhS2lhCe4/JNv2K9s6+xXXcxUoLTdCxu5ZmFnOGtJSIHSC9WPNJxuGn9mwYArPoyzvNYa1Zz8/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=ZoqYUmXk; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1732014158; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JpbNWO2S0DYM4KQM5jhFKm9aDqOnS1/bBXm2Rma7kdxv6xaAj81D5igv4QsIvgM6pi36V7N25hZDk4sYYDE9qThsehQOnc57LyBK9d9Le/ZUnw0ee1efWhqblpn05yUHWMPYOw5Be8qZhhjmmsiyNPwUm1ux3C20X/+zq12FQs8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1732014158; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=B4EERbWf+tNb39pmHBN5FMOodac7gvgp3/YRQaVUVFw=; 
	b=ZikEhzYsqIsF4/9NRHE4nF2LsYZDPPNTDr+NEAzyLpw1xm5233/Qbp8dPS0aSfg7d7yq2b3m7Uo5KSdX/SFQreHAMpqVYJ+jTiZ/4IlXNPESuhpYr8SyiIpsq48YTHqNZldWKjZF7LsM2Y+LtK6LGKCih6cc/89sTFAsIwupVvk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732014158;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=B4EERbWf+tNb39pmHBN5FMOodac7gvgp3/YRQaVUVFw=;
	b=ZoqYUmXkfrdvq11oc3VWeR2fUxq1YlBQ7ErRVQwhMvyIECXA4dfCqJfCP67XcQ9l
	MUrikgJgMgjuFyUy7U9uYXzr0ij4yfG2LQOayMNtko8crZsOFCCTUZKlccjQ1czXiQt
	LVPuFNdNLpCI2O9IO/V02MeDCX2sHoTSZmgBzgqY=
Received: by mx.zohomail.com with SMTPS id 1732014156496249.50679082277054;
	Tue, 19 Nov 2024 03:02:36 -0800 (PST)
Date: Tue, 19 Nov 2024 12:02:26 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] media: mediatek: vcodec: mark
 vdec_vp9_slice_map_counts_eob_coef noinline
Message-ID: <20241119110226.dbd54clp46klvjl5@basti-XPS-13-9310>
References: <20241018151448.3694052-1-arnd@kernel.org>
 <20241118200641.GA768549@thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20241118200641.GA768549@thelio-3990X>
X-ZohoMailClient: External

Hey Nathan,

On 18.11.2024 13:06, Nathan Chancellor wrote:
>On Fri, Oct 18, 2024 at 03:14:42PM +0000, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> With KASAN enabled, clang fails to optimize the inline version of
>> vdec_vp9_slice_map_counts_eob_coef() properly, leading to kilobytes
>> of temporary values spilled to the stack:
>>
>> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:1526:12: error: stack frame size (2160) exceeds limit (2048) in 'vdec_vp9_slice_update_prob' [-Werror,-Wframe-larger-than]
>>
>> This seems to affect all versions of clang including the latest (clang-20),
>> but the degree of stack overhead is different per release.
>>
>> Marking the function as noinline_for_stack is harmless here and avoids
>> the problem completely.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
>Unfortunately, I have seen no moment on my upstream report and this
>warning is breaking allmodconfig builds because of -Werror. Can this be
>applied as a workaround for now (preferrably with a Cc: stable on it)?
>
>Reviewed-by: Nathan Chancellor <nathan@kernel.org>

I'll handle it asap, it will be part of 6.13

Regards,
Sebastian

>
>> ---
>> I have not come to a conclusion on how exactly clang fails to do this
>> right, but can provide the .config and/or preprocessed source files
>> and command line if we think this should be fixed in clang.
>> ---
>>  .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c         | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>> index eea709d93820..47c302745c1d 100644
>> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
>> @@ -1188,7 +1188,8 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
>>  	return ret;
>>  }
>>
>> -static
>> +/* clang stack usage explodes if this is inlined */
>> +static noinline_for_stack
>>  void vdec_vp9_slice_map_counts_eob_coef(unsigned int i, unsigned int j, unsigned int k,
>>  					struct vdec_vp9_slice_frame_counts *counts,
>>  					struct v4l2_vp9_frame_symbol_counts *counts_helper)
>> --
>> 2.39.5
>>
>

