Return-Path: <linux-media+bounces-14712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C17D592A6E8
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 18:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F23A91C21E36
	for <lists+linux-media@lfdr.de>; Mon,  8 Jul 2024 16:10:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6EBB145340;
	Mon,  8 Jul 2024 16:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="apmbiQyZ"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9191411E7
	for <linux-media@vger.kernel.org>; Mon,  8 Jul 2024 16:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720455041; cv=none; b=oMO72K46IcyCoex89ZfP9TbvXKVzb/qeVFPrtpkd1k+iaZg6ti9Y4ias8EMMNhb1JyXjsJUvCom7kxMCgTRC4tbNWSOFbv+72vvzlTqrUvevKXrmuIK3e6tLbJbeVoIA+uuu2LsjU6nb9qQM0wk0NZ0THFvgoFkBAhRqZqhL5p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720455041; c=relaxed/simple;
	bh=9w8E6X2IN6tRp9nkv2mrwPkgNr+AZw8hMVLZCz7CelI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KgAqHYDaHOadu4CN7Fxxq2TDd1g+M2vNssg/IpIWzrvKyh2GLn0jUE+jfReV3H5eegL+9UokZ2yUkFp+cSdlel0/5CCAD+grQx19ipw51wtmRbu2M9DuC7mE6FK4NOsuvoelFrxgDfTA9lCKYn+CcR0DKDiXGXrcKoB+v2Qu6vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=apmbiQyZ; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 468GAZ9k082188;
	Mon, 8 Jul 2024 11:10:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1720455035;
	bh=EYo6hQunSNZDF1eE4CxQG1JEo0aCsP8+AYRyOc/BHsg=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=apmbiQyZfqaokmVlwFrf7ookkpauxdRmEBJq+E/nQMihIMumQ70pmsXWiDAGyphwm
	 HBfnn5qvfYL+Wlh03KKhSW64ncjEJ/CrpTLErJy7WW84lehR0WV5J8xhdZ3DqEwI71
	 1ALVStpblolCJ0J+uc+QBO3otK1oXfOddiwNDV+Y=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 468GAZom029579
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jul 2024 11:10:35 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Jul 2024 11:10:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Jul 2024 11:10:35 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 468GAXMF054004;
	Mon, 8 Jul 2024 11:10:34 -0500
Message-ID: <7df57628-175b-a02b-db45-c514037af325@ti.com>
Date: Mon, 8 Jul 2024 21:40:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [GIT PULL FOR 6.11] Imagination E5010 JPEG encoder
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Sebastian Fricke
	<sebastian.fricke@collabora.com>,
        <linux-media@vger.kernel.org>
References: <20240611155528.mqmekz42cgs6jpdi@basti-XPS-13-9310>
 <fe8c3f9a-b6c7-448d-8216-a803530b3954@ti.com>
 <1db64af7-3688-4bcc-a671-9440d8f02d1a@xs4all.nl>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <1db64af7-3688-4bcc-a671-9440d8f02d1a@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Sebastian, Hans,

On 13/06/24 13:45, Hans Verkuil wrote:
> On 12/06/2024 07:57, Devarsh Thakkar wrote:
>> +Andrew,
>>
>> Hi Sebastian, Hans, Andrew,
>>
>> On 11/06/24 21:25, Sebastian Fricke wrote:
>>> Hey Hans & Mauro,
>>>
>>> Doesn't include the math changes and
>>> https://patchwork.linuxtv.org/project/linux-media/patch/20240607133253.3559339-1-devarsht@ti.com/
>>> has to be taken separately, as discussed here:
>>> https://patchwork.linuxtv.org/project/linux-media/patch/20240604105335.2257629-1-devarsht@ti.com/#158409
>>>
>>
>> I see Andy mentioned here [1] that math.h is orphaned and nobody behind it.
>> And I see changes in these files getting pulled in along with subsystem
>> specific changes [2].
>>
>> So just wanted to check if it's possible to include math.h related patches too
>> directly in this PR itself since they were already reviewed/Acked and I guess
>> this be a simpler path since they need to be applied on top of current set of
>> patches in this PR.
>>
>> So, Could you please let me know if it's possible to include all the 13
>> patches sent across [3] in this PR itself or some other path need to be taken
>> for math.h related patches?
> 
> I plan to take this PR (with just the first 6 patches) first today.
> 
> Once in, post a new patch series for the second half. Mention in the cover
> letter that math.h is orphaned (I wasn't aware of that) and I expect that
> Sebastian can make a second PR.
> 

As suggested above, I have posted the math.h related changes as a separate
series here [1] as I see that imagination jpeg series already got into
media_stage tree.

Kindly let me know if it's possible to have a PR for this or any other changes
required.

[1]: https://lore.kernel.org/all/20240708155943.2314427-1-devarsht@ti.com/#r

Regards
Devarsh

