Return-Path: <linux-media+bounces-16918-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 244C79608A6
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 13:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4D43284714
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 11:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B7219FA92;
	Tue, 27 Aug 2024 11:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="A4Yz1+1V"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D137C19F467;
	Tue, 27 Aug 2024 11:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724758066; cv=none; b=qmV7PVEYwnz6FdXYt2LWDY7pg/wSIlgM10qvlVtyEyHlJRvyDxo9RKO5om4K7vQ3eIu/6uW5B7fThaEmS8UkGn4eMh6yuGQ9LMekTBP/GE4mScG900x+Cd4ThfjTLRJmgmZbBApMeS4Ol8YH7W5t4VNHFNySoRjX4sdeYvVT148=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724758066; c=relaxed/simple;
	bh=NvUNmIiFddQBNUlI1Ldz3THrcrU/8gD3o2YKY7dPIPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b1C9tYMwSjFwousKdNmSLVGwrTbmitZzQtPhgVfkg+uDiQsTT1w/Ou4XFHShzjjcyI4wUDVoXdA6JRh97+E4T+ZmPCN58T4tgKyBUCHXHS/BCC8f/OTgMu8zCLBXahtPuiP9vpUdQ0BWkPXcooM4Wvi56v3Yz567e54C7/7zPPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=A4Yz1+1V; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47RBRPoH121851;
	Tue, 27 Aug 2024 06:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1724758045;
	bh=qtJ5rNu6wj/UDoMOvt2vEROyr8WOsRGIifqB7285mAY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=A4Yz1+1VpwlBdDgqbVBj68D03TsZG5G3SMH/RA8IsPY9BjCckq/kFvYDRxXEJlxE8
	 KJqXK7iQRKAXX6BaTb5NhBzK0gYphG2vO+VX6n4yCn1XvjAp9CoVY6+FlG7Yf7bRES
	 nr2dYOM5YEV0cYg8r7ujSmM5o5owIC0JJxWVNJWo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47RBRPnj013217
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Aug 2024 06:27:25 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Aug 2024 06:27:25 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Aug 2024 06:27:25 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47RBRI5Y082799;
	Tue, 27 Aug 2024 06:27:18 -0500
Message-ID: <9c41f6b7-6b06-cd5b-74bd-24873c4beaf7@ti.com>
Date: Tue, 27 Aug 2024 16:57:17 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/6] math.h: Add macros for rounding to the closest
 value
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sebastian.fricke@collabora.com>, <linux-doc@vger.kernel.org>,
        <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <s-jain1@ti.com>,
        <r-donadkar@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
        <p-mantena@ti.com>, <vijayp@ti.com>, <andi.shyti@linux.intel.com>,
        <nicolas@ndufresne.ca>, <jirislaby@kernel.org>, <davidgow@google.com>,
        <dlatypov@google.com>, <corbet@lwn.net>, <broonie@kernel.org>,
        <jani.nikula@intel.com>, <rdunlap@infradead.org>,
        <nik.borisov@suse.com>, <Dave.Martin@arm.com>
References: <20240826150822.4057164-1-devarsht@ti.com>
 <20240826150822.4057164-2-devarsht@ti.com>
 <Zsy-8xXQ01-JhL0m@smile.fi.intel.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <Zsy-8xXQ01-JhL0m@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Andy,

Thanks for the review.

On 26/08/24 23:14, Andy Shevchenko wrote:
> On Mon, Aug 26, 2024 at 08:38:17PM +0530, Devarsh Thakkar wrote:
>> Add below rounding related macros:
>>
>> round_closest_up(x, y) : Rounds x to the closest multiple of y where y is a
>> power of 2, with a preference to round up in case two nearest values are
>> possible.
>>
>> round_closest_down(x, y) : Rounds x to the closest multiple of y where y is
>> a power of 2, with a preference to round down in case two nearest values
>> are possible.
>>
>> roundclosest(x, y) : Rounds x to the closest multiple of y, this macro
>> should generally be used only when y is not multiple of 2 as otherwise
>> round_closest* macros should be used which are much faster.
> 
> I understand the point, but if you need to send a v3, please explain
> the equivalency between roundclosest() and one (or both?) of the
> round_closest_*() in case the argument is power-of-2.
> 

The equivalency between roundclosest w.r.t round_closest is same as
equivalency between existing macros rounddown w.r.t round_down. Functionally
both are same but the former is recommended to be used only for the scenario
where multiple is not power of 2 and latter is faster but is strictly for the
scenario where multiple is power of 2. I think the same is already summarized
well in commit message and further elaborated in the patch itself as part of
header file comments [1] so I personally don't think any update is required
w.r.t this.

[1]: https://lore.kernel.org/all/20240826150822.4057164-2-devarsht@ti.com

Regards
Devarsh

