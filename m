Return-Path: <linux-media+bounces-12330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D12F98D5CE0
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 10:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7071B1F263FB
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2024 08:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFF215099D;
	Fri, 31 May 2024 08:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="meMAKXV6"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42BC14F9FA;
	Fri, 31 May 2024 08:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717144606; cv=none; b=Lsh7xY7qLUWFwGRRFc5w2JV9REZMuHEDv4XuHwbcibHDmGQVGYAms+MUJFW41HNvphQNGJlAnpC9tutAYuvgwOaOFQngEl7bqAnUQcrR4alB3pKH4V4sXh0tUyCa5pWXSLVaiSjCqpd6gWpMLBlU0JynnSLpQLRpgfkmaRv67s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717144606; c=relaxed/simple;
	bh=TfQdA2XCPGkN/zEB747sTwVs1wSBXHbq/hbPTp30TYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gD5JYgRbTD8WZDlp8qp8CJsqrcFYEsKHZyePgx5lTOdCfcMW1uE+HHyInq3X2hbnlO9H7L3fKCw9ZZDulnYqRQrye26/AloU4dBZVx8ghlFP5ZkGxvdn4SWpK0ojRA3ZfJoIqEjxaEAF6C3u+BNpS9LRbnFbkDbY6MtavUPkiF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=meMAKXV6; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44V8aMR9042855;
	Fri, 31 May 2024 03:36:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717144582;
	bh=S0ukmk1g2waDrHjd+R+8zkx4KdRvWUrWFxGLS+wgH5o=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=meMAKXV66h+EykWFPDoMgyrkHcRwg0+dFJ/xtgo6dy/5/lpt8EuwgxEeH80KIrnSG
	 U940IDV5SC45+69YFr2knqGlDA+G9lN0oYWmsx5AYL2M74hR/3iaqCyPhvJg8TOfCf
	 sK7vMOV9TYdPqU1Kx/Gd3bBUepEm8LLSZ9pPOv+E=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44V8aMc9051757
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 May 2024 03:36:22 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 May 2024 03:36:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 May 2024 03:36:22 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44V8aEXd052311;
	Fri, 31 May 2024 03:36:14 -0500
Message-ID: <7bed5792-db9d-3bc8-5325-7333076822e9@ti.com>
Date: Fri, 31 May 2024 14:06:13 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v10 06/11] math.h: Add macros for rounding to closest
 value
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
        <akpm@linux-foundation.org>, <gregkh@linuxfoundation.org>,
        <adobriyan@gmail.com>, <jani.nikula@intel.com>,
        <p.zabel@pengutronix.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <laurent.pinchart@ideasonboard.com>,
        <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
        <j-luthra@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
        <p-mantena@ti.com>, <vijayp@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>, <davidgow@google.com>, <dlatypov@google.com>
References: <20240530165925.2715837-1-devarsht@ti.com>
 <20240530171225.2749312-1-devarsht@ti.com>
 <ZljRSXtXWdOyCJaB@smile.fi.intel.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <ZljRSXtXWdOyCJaB@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Andy,

Thanks for the review.

On 31/05/24 00:49, Andy Shevchenko wrote:
> On Thu, May 30, 2024 at 10:42:25PM +0530, Devarsh Thakkar wrote:
>> Add below rounding related macros:
>>
>> round_closest_up(x, y) : Rounds x to closest multiple of y where y is a
>> power of 2, with a preference to round up in case two nearest values are
>> possible.
>>
>> round_closest_down(x, y) : Rounds x to closest multiple of y where y is a
>> power of 2, with a preference to round down in case two nearest values are
>> possible.
>>
>> roundclosest(x, y) : Rounds x to closest multiple of y, this macro should
>> generally be used only when y is not multiple of 2 as otherwise
>> round_closest* macros should be used which are much faster.
>>
>> Examples:
>>  * round_closest_up(17, 4) = 16
>>  * round_closest_up(15, 4) = 16
>>  * round_closest_up(14, 4) = 16
>>  * round_closest_down(17, 4) = 16
>>  * round_closest_down(15, 4) = 16
>>  * round_closest_down(14, 4) = 12
>>  * roundclosest(21, 5) = 20
>>  * roundclosest(19, 5) = 20
>>  * roundclosest(17, 5) = 15
> 
> ...
> 
>> + * Examples :
> 
> It's inconsistent with the other one below.
> 
>> + * 	round_closest_up(17, 4) = 16
>> + *
>> + * 	round_closest_up(15, 4) = 16
>> + *
>> + * 	round_closest_up(14, 4) = 16
> 
> The three have TABs/spaces mixture.
> 
> I believe you wanted:
> 
>  * Examples::
>  * * round_closest_up(17, 4) = 16
>  * * round_closest_up(15, 4) = 16
>  * * round_closest_up(14, 4) = 16
> 

I initially referred the style from this link [1] but probably missed to
remove extra space from my patch.

But what you suggested looks better, I will go with what you suggested.

[1]  https://elixir.bootlin.com/linux/v6.9/source/include/linux/int_log.h#L22

Regards
Devarsh

