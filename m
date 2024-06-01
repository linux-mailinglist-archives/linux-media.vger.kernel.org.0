Return-Path: <linux-media+bounces-12381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D468D712F
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2024 18:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5D811C20DCF
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2024 16:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681B515350F;
	Sat,  1 Jun 2024 16:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sIS3bpZw"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C54E1DFF7;
	Sat,  1 Jun 2024 16:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717260135; cv=none; b=fcIGLpvofbVyIHMv5qFtrhKUSH9kfaHt8V9BNBfhwQaxfVzjleIPLnbggpqdWjUROLM4ZvpK+7L7gMsU5C501by3hO7/uqehHZjmM8nqwazoCH0lMzq30vNwNpx6vjTn99vEFAdrdXjXTeNXLms0y2UDdwPjYGXclVFdaa5WEp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717260135; c=relaxed/simple;
	bh=Xu3vkhgffNTzU2/HpNfT9+Hk1mZIlW14sUSAMdOAUcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SoQhUm6jk1+WQ++qoqeE98LpWiWVcouixQljEEkHzD8qaQllkFucF2ck8345UU7VetxYclKqhPJZRmmIk7eVwo7jiU15hrlTCNKjMHd3BpXwx69t+SqOneIPWa069awvYw0Sy7FbtEftXFmznF2C8Kb0DdrikCKbphSeKaUhKwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sIS3bpZw; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 451GffZ8036681;
	Sat, 1 Jun 2024 11:41:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717260101;
	bh=+ocxchH9u2Icz4prOAtSV5xvLRJJKRxfx+7US0r/Pik=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sIS3bpZwCELHxccweU6x52eq+2O1Ue4QnQ+3wx6sWd9Ph/5SBvnFK0mTKgHaGJndb
	 vKZsUkZ3Oe7to6ThCH6xsu0xc89qM9QE8q7nFH1EGG/+3PLTYE1IabyCy1d1zv0tG/
	 +1848s9cQKrZRfDRz9FDEJPR6fOi8gD/x+EeypAc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 451GffhU069778
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 1 Jun 2024 11:41:41 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 1
 Jun 2024 11:41:40 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 1 Jun 2024 11:41:40 -0500
Received: from [10.249.130.181] ([10.249.130.181])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 451GfTpn129505;
	Sat, 1 Jun 2024 11:41:30 -0500
Message-ID: <1d35fe9f-79f3-4d64-81d6-97a63b333bfc@ti.com>
Date: Sat, 1 Jun 2024 22:11:28 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 07/11] Documentation: core-api: Add math.h macros and
 functions
To: Randy Dunlap <rdunlap@infradead.org>, <mchehab@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <benjamin.gaignard@collabora.com>,
        <sebastian.fricke@collabora.com>, <akpm@linux-foundation.org>,
        <gregkh@linuxfoundation.org>, <andriy.shevchenko@linux.intel.com>,
        <adobriyan@gmail.com>, <jani.nikula@intel.com>,
        <p.zabel@pengutronix.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <corbet@lwn.net>,
        <broonie@kernel.org>, <linux-doc@vger.kernel.org>
CC: <laurent.pinchart@ideasonboard.com>, <praneeth@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>,
        <b-brnich@ti.com>, <detheridge@ti.com>, <p-mantena@ti.com>,
        <vijayp@ti.com>, <andrzej.p@collabora.com>, <nicolas@ndufresne.ca>,
        <davidgow@google.com>, <dlatypov@google.com>
References: <20240531170229.1270828-1-devarsht@ti.com>
 <20240531171220.1295881-1-devarsht@ti.com>
 <c14215bd-96ff-4aec-83c4-e25375f6fe88@infradead.org>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <c14215bd-96ff-4aec-83c4-e25375f6fe88@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 01/06/24 00:01, Randy Dunlap wrote:
> Hi,
> 
> On 5/31/24 10:12 AM, Devarsh Thakkar wrote:
>> Add documentation for rounding, scaling, absolute value and difference,
>> 32-bit division related macros and functions exported by math.h header
>> file.
>>
> 
> I don't see any kernel-doc for division functions in this header file.
> 
> Do some division functions get rendered somehow?
> 

Good catch. I see couple of them having adequate documentation just
missing the sphynx syntax, will enable for DIV_ROUND_CLOSEST and
DIV_ROUND_CLOSEST_ULL.

Regards
Devarsh

