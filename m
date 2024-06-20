Return-Path: <linux-media+bounces-13822-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD76910805
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 16:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A2011C21DDE
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 14:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 622D21AD9EE;
	Thu, 20 Jun 2024 14:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rtj5r0ig"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC251AD499;
	Thu, 20 Jun 2024 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718893241; cv=none; b=mEOT+nC5Z+YstlIWHDehqUhAIuT31SiCOYU9Ra4WBdqCpoXbWYOSItkMLHlwj9Et5xHSB93SSz3/Xky7KFJZ6Fkfd+z9MNzAibJdh/9VYr5Q+LS54gAWl56pNWXQoSnly2UqSG41OzQfQDoRSCdDVA/+HFO+vGzeDO2BURzSFIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718893241; c=relaxed/simple;
	bh=H3l1v9yeYyPj1A0lN+6W/nwjuWXv/WE2qcLC1YwJUvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EWWict+/PNCmWPcGLOh0w4AqEVXhl5gYfHpKRCbX46PtEgOqvkb60wGmn22fk5Yvc5FxoAH99EG/04+FA4sDgmfMOX4fL0IJ9tsOddGUtWH+SQFhNj17OC3Ahxq5l/vrQOjpV2gnrlc4JDvaLbAimc42CSLkMTbfAvf9VsW9Xjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rtj5r0ig; arc=none smtp.client-ip=198.47.19.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45KEKJrU104681;
	Thu, 20 Jun 2024 09:20:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718893219;
	bh=ymReCO7N2ADiyVC3g1gB0UJoYCRDko7LaKWU+9edZ0E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rtj5r0igmn7EeYVH2JH/xAicz3ZwzuSAfwQhQROXR0PvnYD4K4kU6VomIRIHt373N
	 vuuRmidZ3cC/OmwEwJhbuT1h37ya7YPCIrz34BhhChWOc8UGe7Yp/dnJlVo1Rdvk8Z
	 RXb1jinQjdCwpgFkiWVbWwmg/BOYSRwz7DX9eZlI=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45KEKJmC097716
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Jun 2024 09:20:19 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jun 2024 09:20:19 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jun 2024 09:20:19 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45KEKEpK092433;
	Thu, 20 Jun 2024 09:20:15 -0500
Message-ID: <e901967f-59df-f4b0-de51-61e542c04161@ti.com>
Date: Thu, 20 Jun 2024 19:50:14 +0530
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
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        "jackson.lee"
	<jackson.lee@chipsnmedia.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        Nas Chung
	<nas.chung@chipsnmedia.com>,
        "lafley.kim" <lafley.kim@chipsnmedia.com>,
        "b-brnich@ti.com" <b-brnich@ti.com>, "Luthra, Jai" <j-luthra@ti.com>,
        Vibhore
	<vibhore@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Aradhya <a-bhatia1@ti.com>, "Raghavendra, Vignesh" <vigneshr@ti.com>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
 <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
 <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <SE1P216MB130382374B76CD8BC9FFCFE5EDC82@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <881dcea1-a592-4506-083a-9d5f3c6a8781@ti.com>
 <b2f7552d37075538e22640f7b42838d29d3f8b3e.camel@collabora.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <b2f7552d37075538e22640f7b42838d29d3f8b3e.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Nicolas,

On 20/06/24 19:35, Nicolas Dufresne wrote:
> Hi Devarsh,
> 
> Le jeudi 20 juin 2024 à 15:05 +0530, Devarsh Thakkar a écrit :
>> In my view the delayed suspend functionality is generally helpful for devices
>> where resume latencies are higher for e.g. this light sensor driver [2] uses
>> it because it takes 250ms to stabilize after resumption and I don't see this
>> being used in codec drivers generally since there is no such large resume
>> latency. Please let me know if I am missing something or there is a strong
>> reason to have delayed suspend for wave5.
> 
> It sounds like you did proper scientific testing of the suspend results calls,
> mind sharing the actual data ?

Nopes, I did not do that but yes I agree it is good to profile and evaluate
the trade-off but I am not expecting 250ms kind of latency. I would suggest
Jackson to do the profiling for the resume latencies.

But perhaps a separate issue, I did notice that intention of the patchset was
to suspend without waiting for the timeout if there is no application having a
handle to the wave5 device but even if I close the last instance I still see
the IP stays on for 5seconds as seen in this logs [1] and this perhaps could
be because extra pm counter references being hold.

[2024-06-20 12:32:50] Freeing pipeline ...

and after 5 seconds..

[2024-06-20 12:32:55] |   204     | AM62AX_DEV_CODEC0 | DEVICE_STATE_ON |
[2024-06-20 12:32:56] |   204     | AM62AX_DEV_CODEC0 | DEVICE_STATE_OFF

[1]: https://gist.github.com/devarsht/009075d8706001f447733ed859152d90

Regards
Devarsh

