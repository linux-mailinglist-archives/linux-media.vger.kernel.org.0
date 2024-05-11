Return-Path: <linux-media+bounces-11377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B26B8C32A7
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2024 19:08:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4846F1F21A6C
	for <lists+linux-media@lfdr.de>; Sat, 11 May 2024 17:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0039D1BC3F;
	Sat, 11 May 2024 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="a4NzGwVH"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6334E17C67;
	Sat, 11 May 2024 17:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715447317; cv=none; b=OLPEps2jfVUxKsRBXSkS0ku88skVuUyVawYbKolvhbxlGkm+55aYqcHx0asrA/qeaJ3yxueltCR566CECeNHAGJCrW/KjpFEE57Qu2zWbZPorw3/ctlL0pjLOsSnrYDh3mAxBtqxXjGb0irnh3VmPNloI5s2V/IdGXEeJcvxhc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715447317; c=relaxed/simple;
	bh=FbE3i+JnOatXNvvdNBizHy3Gz3h9MPYDLjzAbWPxrUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mej4KUFRQ95zm+w6YGSQ3kYmn7yLI3nm3UcGMGpTAhiGp0TAHyLYJk8RhmlubBaZE5mDc6oQmO9I2UbsbaAe0oWUglyCM8dOuBBOAp5PRB76K7rtObmMDiPn9qNjbWpsM/e43DztsE101KuPO7Z9Ek+KzG7Cy8NP7vasK0pYDSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=a4NzGwVH; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44BH8EGc019533;
	Sat, 11 May 2024 12:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1715447294;
	bh=timvJRGsOvaAJupM+NGf/T5JlzD1cz4vtYJRKUFZTHQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=a4NzGwVH5nDzUxCmVpYQ+fMN5BN+GmueErg4d7loqutgIKrvCI6AUuihmGN2fCU+z
	 frzOoL7mLBc7Bb/gZdaP6Fx42PRBuShiwO7HmwWjMpXC5/GuvRtBMmcN1+IwucbaRy
	 PO5qs5SIFQPQMEYUvMDU3XpwzA+7HjUD16fNbLaE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44BH8E2G040776
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 11 May 2024 12:08:14 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 11
 May 2024 12:08:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 11 May 2024 12:08:14 -0500
Received: from [10.249.130.181] ([10.249.130.181])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44BH852Q090626;
	Sat, 11 May 2024 12:08:05 -0500
Message-ID: <7e3ad816-6a2a-4e02-9b41-03a8562812ad@ti.com>
Date: Sat, 11 May 2024 22:38:04 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] media: imagination: Round to closest multiple for
 cropping region
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <benjamin.gaignard@collabora.com>, <sebastian.fricke@collabora.com>,
        <dri-devel@lists.freedesktop.org>, <laurent.pinchart@ideasonboard.com>,
        <praneeth@ti.com>, <nm@ti.com>, <vigneshr@ti.com>, <a-bhatia1@ti.com>,
        <j-luthra@ti.com>, <b-brnich@ti.com>, <detheridge@ti.com>,
        <p-mantena@ti.com>, <vijayp@ti.com>, <andrzej.p@collabora.com>,
        <nicolas@ndufresne.ca>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <akpm@linux-foundation.org>,
        <gregkh@linuxfoundation.org>, <adobriyan@gmail.com>,
        <jani.nikula@intel.com>
References: <20240509184001.4064820-1-devarsht@ti.com>
 <Zj447ePSnccbj76v@smile.fi.intel.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <Zj447ePSnccbj76v@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Andy,

Thanks for the quick review.
On 10/05/24 20:40, Andy Shevchenko wrote:
> On Fri, May 10, 2024 at 12:10:01AM +0530, Devarsh Thakkar wrote:
>> If neither of the flags to round down (V4L2_SEL_FLAG_LE) or round up
>> (V4L2_SEL_FLAG_GE) are specified by the user, then round to nearest
>> multiple of requested value while updating the crop rectangle coordinates.
>>
>> Use the rounding macro which gives preference to rounding down in case two
>> nearest values (high and low) are possible to raise the probability of
>> cropping rectangle falling inside the bound region.
> 
> This is arguable. How do we know that the bigger range is supported?
> The safest side is to go smaller than bigger.
> 

Yes and that's what the driver does when do when application passes
V4L2_SEL_FLAG_LE while doing the selection. If application does not
specify explicitly whether to round down or round up the cropping
parameters requested by it (i.e app is neither passing V4L2_SEL_FLAG_LE
nor V4L2_SEL_FLAG_GE flags), then it is preferred by driver to round the
cropping parameters to nearest possible value by either rounding down or
rounding up to align with hardware requirements.

For e.g. If requested width for cropping region is 127 and HW requires
width to be multiple of 64 then we would prefer to round it up to 128
rather than rounding down to a more distant value (i.e. 64), but if
requested cropping width is 129 then we would prefer to instead round it
down to 128. But if requested cropping width is 160 then there are two
nearest possible values 160 - 32 = 128 and 160 + 32 = 192 and in which
case we prefer the smaller value as you suggested and that's why the
driver uses round_closest_down.

For any reason, if still the cropping rectangle falls beyond the bound
region, then driver will return out of range error (-ERANGE) to
application.

Regards
Devarsh



