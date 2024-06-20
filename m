Return-Path: <linux-media+bounces-13779-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B09B3910076
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 11:35:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A8841F21277
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 09:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CC51A4F0C;
	Thu, 20 Jun 2024 09:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NceWNLW9"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88F41802E;
	Thu, 20 Jun 2024 09:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718876145; cv=none; b=HPOGUOzrZ5PJKVB9gtRyWYCZTPA1VC9rQLFLt16PYeV6N2vzrqyvClyuqS4kAbp2g+DedVXoS9f9LnHalTGz91E3rjECINvok9yREYrIhxcP3FLqw+gPcVYH2TlWeS//oKaeXoMKT95iEybSyN7ncqP+ZMI+DU6sVq38Bv3zIJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718876145; c=relaxed/simple;
	bh=/im2dJUny8GKoQW+PN7rXm2Wg0NNCu6haplVD9oaSw8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=euU57rWi/3tAu6mn0R4bLQkcHwA6x3vIjRg+/asQSimwoLp7dwqphCSA3h2ABY5r86rcc/I3HXVe+TYDuegXuoilrie5f5GoQrnz13rWFv/YF+kgVMzEetTmAi6a0pa3JLtadHuruVT7nJtepye/fuECjQQwEpbcdsrWaiGRLtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=NceWNLW9; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45K9ZTDQ022533;
	Thu, 20 Jun 2024 04:35:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718876129;
	bh=LuavQ3UC+4/Ob7tONsBWjdr8str9OS1gS5F4yxXaans=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NceWNLW9zcklCRy6jNVQDNpck5HQ3D8ehO7BXXQd/muV/S4FA8VqFJCV8Z6sjpDt8
	 vLDYHiTxlYYzETsien5It9ebvzJk5XEOhqJ9ujXs15Uq4uUKho9bZi64vxghhWp4+l
	 bp8PIuBMBkH1KnRPIFHd/c6CVR4r/iaiQG6HXE64=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45K9ZT4H071619
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Jun 2024 04:35:29 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jun 2024 04:35:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jun 2024 04:35:28 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45K9ZNUN057394;
	Thu, 20 Jun 2024 04:35:24 -0500
Message-ID: <881dcea1-a592-4506-083a-9d5f3c6a8781@ti.com>
Date: Thu, 20 Jun 2024 15:05:23 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support runtime
 suspend/resume
Content-Language: en-US
To: "jackson.lee" <jackson.lee@chipsnmedia.com>,
        "mchehab@kernel.org"
	<mchehab@kernel.org>,
        "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
        "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        Nas Chung
	<nas.chung@chipsnmedia.com>,
        "lafley.kim" <lafley.kim@chipsnmedia.com>,
        "b-brnich@ti.com" <b-brnich@ti.com>,
        Nicolas Dufresne
	<nicolas.dufresne@collabora.com>,
        "Luthra, Jai" <j-luthra@ti.com>, Vibhore
	<vibhore@ti.com>,
        Dhruva Gole <d-gole@ti.com>, Aradhya <a-bhatia1@ti.com>,
        "Raghavendra, Vignesh" <vigneshr@ti.com>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
 <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
 <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <SE1P216MB130382374B76CD8BC9FFCFE5EDC82@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <SE1P216MB130382374B76CD8BC9FFCFE5EDC82@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Jackson,

On 20/06/24 05:41, jackson.lee wrote:
> 
> 
>> -----Original Message-----
>> From: jackson.lee
>> Sent: Thursday, June 20, 2024 8:57 AM
>> To: Devarsh Thakkar <devarsht@ti.com>; mchehab@kernel.org;
>> nicolas@ndufresne.ca; sebastian.fricke@collabora.com
>> Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
>> hverkuil@xs4all.nl; Nas Chung <nas.chung@chipsnmedia.com>; lafley.kim
>> <lafley.kim@chipsnmedia.com>; b-brnich@ti.com; Nicolas Dufresne
>> <nicolas.dufresne@collabora.com>
>> Subject: RE: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support runtime
>> suspend/resume
>>
>> Hi Devarsh
>>
>> If there is no feeding bitstreams during encoding and decoding frames, then
>> driver's status is switched to suspended automatically by autosuspend.

I think the pm_runtime_*_autosuspend helpers are to schedule a delayed suspend
i.e. after the pm counter goes to 0, suspend the device after timeout period
which is set to 5s in this case.

Even without using the pm_runtime_*_autosuspend helpers, i.e if you use
pm_runtime_resume_and_get on start streaming and pm_runtime_put_sync on stop
streaming the device gets suspended automatically if not in use albeit
immediately after the pm counter goes to 0. And this is what many codec
devices drivers do today [1]. Ain't that suffice what we want ?

In my view the delayed suspend functionality is generally helpful for devices
where resume latencies are higher for e.g. this light sensor driver [2] uses
it because it takes 250ms to stabilize after resumption and I don't see this
being used in codec drivers generally since there is no such large resume
latency. Please let me know if I am missing something or there is a strong
reason to have delayed suspend for wave5.

>> And if we don’t use autosuspend, it is very difficult for us to catch if
>> there is feeding or not while working a pipeline.
>> So it is very efficient for managing power status.

As mentioned above, if you mean by autosuspend that device should
automatically suspend if not used then you don't require to use
pm_runtime_*_autosuspend helpers (as those are for delayed suspend actually)
and instead use the generic pm helpers pm_runtime_resume_and_get and
pm_runtime_put_sync and PM core will automatically suspend the device when pm
counter drops to 0 and resume it back when pm counter is incremented.

>>
>> If the delay is very great value, we can adjust it.
>>

As mentioned above, I feel we don't require to use pm_runtime_*_autosuspend
helpers at first place.

>> Thanks
>> Jackson
>>
> 
> One more thing, 
> 
> When an instance is closed or started, we are currently putting a power status to suspend or resumed immediately.
So I tested this series and see below issues :

1) I see it seems to break VPU operation on AM62A using upstream linux-next
colliding with the polling functionality there since that device does not have
an irq and relies on polling as I see below logs on bootup :

[2024-06-20 13:01:12] root@am62axx-evm:~# dmesg | tail
[2024-06-20 13:01:16] [   23.744372] x8 : ffff000804248a50 x7 :
ffff00087f6ba0c0 x6 : 0000000000000000
[2024-06-20 13:01:16] [   23.744381] x5 : 0000000000f42400 x4 :
0000000000000000 x3 : 0000000000000001
[2024-06-20 13:01:16] [   23.744390] x2 : ffff0008041ad808 x1 :
0000000000000044 x0 : ffff800082150044
[2024-06-20 13:01:16] [   23.744400] Call trace:
[2024-06-20 13:01:16] [   23.744404]  wave5_vdi_read_register+0x8/0x20 [wave5]
[2024-06-20 13:01:16] [   23.744420]  kthread_worker_fn+0xcc/0x184
[2024-06-20 13:01:16] [   23.744432]  kthread+0x118/0x11c
[2024-06-20 13:01:16] [   23.744440]  ret_from_fork+0x10/0x20
[2024-06-20 13:01:16] [   23.744452] Code: b9000022 d65f03c0 f940b000 8b214000
(b9400000)
[2024-06-20 13:01:16] [   23.744458] ---[ end trace 0000000000000000 ]---

I think care needs to be taken to make sure timer is started after device is
powered on and stopped before device gets powered off.


> The autospend feature is being only used when there is no feeding while working a pipeline.

2) I think above doesn't seem to work, Brandon had a hack patch on vendor tree
[3] for AM62A timer, with that I no longer see above crash issue but I observe
that there is a 5 second wait to power off device even after last instance is
closed as seen here [4], seems like power counter is not getting set to 0 on
instance close, you may try to reproduce the same on j721s2 evm too.


[1]:
https://gitlab.com/linux-kernel/linux-next/-/blob/master/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c?ref_type=heads#L1637
[2]:
https://gitlab.com/linux-kernel/linux-next/-/blob/next-20240619/drivers/iio/light/bh1780.c?ref_type=tags#L179
[3]:
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-6.6.y-cicd&id=0be8de03825c2834a39af603b088cbf31e19d55d
[4]: https://gist.github.com/devarsht/009075d8706001f447733ed859152d90

Regards
Devarsh

