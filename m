Return-Path: <linux-media+bounces-28526-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECD5A6A3D3
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 11:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16BF03B0B26
	for <lists+linux-media@lfdr.de>; Thu, 20 Mar 2025 10:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A359E224253;
	Thu, 20 Mar 2025 10:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="OwMsywnM"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABC8214A98;
	Thu, 20 Mar 2025 10:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742467030; cv=none; b=g+vqNs/+PELw/wq2y5W8DuU9WcYpvBNuv3aTWSe16KBlSkIrRNJBYwVLYL0Ck9pm859kHa0wXMgw5JRQsDNLjHUqkVWs+bdNZndGvp5v13IXz56p5PzgyzKMuSPiQ/yls++A5O9EaGukkm3UOYzcMWDK6Yo3WlneWTfyCJe7Oxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742467030; c=relaxed/simple;
	bh=AUDVoiyN4McEPqMspXasxzf9mQTu+o6KoRx+9lpt4hY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=absd4AQUDfC1owlSV/UDqzKL+zVBYaL41KRonzE5Ui1VDhgS8elkJZeSkimbKuiRtrnEztYYN/PffEXENT2il67erVv6B1m7Ib/p2tp74rmouhNG7a01TMkYooeJTBDUF1m6byK+QuWQ6aim4KTt+ZNNs8nFVGNMwctsSElsGJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=OwMsywnM; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KAau863202664
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 20 Mar 2025 05:36:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742467016;
	bh=Vfh2vEkxvJzuMvy4NFEQRLkhxkFVUDFQV3PkRHiU/5E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=OwMsywnMovSRADyjbTBFAy5l14UmLPVH0cYAbswBgF8u4Z3ungYqAkiVdLOIoI1Ed
	 jC+V/zZQnKAkxncMvvITeUDKyxX7zzI/RZUkLAmbEWZ+rs1pU2wS68c5PV+fMJGDi/
	 9bouGC3vAPY/wKPEWHop+HCuaunAaQ7UZDCiOGe0=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KAau61033484;
	Thu, 20 Mar 2025 05:36:56 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 05:36:55 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 05:36:55 -0500
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KAarNM129293;
	Thu, 20 Mar 2025 05:36:54 -0500
Message-ID: <8b377d15-1fe3-42fb-b220-09f4e667f7da@ti.com>
Date: Thu, 20 Mar 2025 16:06:52 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] media: i2c: ds90ub960: Enable second i2c interface
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <vaishnav.a@ti.com>, <u-kumar1@ti.com>, <r-donadkar@ti.com>
References: <20250305121705.2143540-1-y-abhilashchandra@ti.com>
 <9032362c-a332-4b44-8c77-386edb1f09f7@ideasonboard.com>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <9032362c-a332-4b44-8c77-386edb1f09f7@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Tomi

On 18/03/25 20:16, Tomi Valkeinen wrote:
> Hi,
> 
> On 05/03/2025 14:17, Yemike Abhilash Chandra wrote:
>> The DS90UB960-Q1 includes a second I2C interface for independent control
>> of the deserializer and remote devices. However, the current driver does
>> not utilize it, thus restricting users to either CSI TX0 or CSI TX1 on
>> the primary I2C interface. Enable the second I2C interface, allowing
>> flexible routing where CSI TX0 can be used on the primary and CSI TX1 on
>> the secondary, or vice versa by enabling appropriate ports in DT. To
>> achieve the same only modify the bits relevant to the enabled RX and TX
>> ports of that interface and during probe and enable_streams call, few
>> registers were being reset to HW reset state, these operations are not
>> necessary for functionality and resets the state when secondary I2C
>> interface is probed, thus drop them.
> 
> I'm a bit confused about the description. My recollection is that both 
> CSI TX0 and TX1 can be programmed just fine from the first I2C 
> interface. Is that not so?
> 

I apologize for not giving the entire context while sending the RFC.
The purpose of this patch is not only to enable secondary I2C interface
but also to overcome the v4l2 framework limitation by doing that.

> Also, even if the driver supports both CSI TXes, at the moment v4l2 
> framework doesn't work with it, at least in many cases. E.g. if you 
> connect one TX to a CSIRX, the other TX to another CSIRX, and those 
> CSIRXes are independent, have their own media graphs, it's not going to 
> work at all.
> 

Lets say that the overlay applied is as shown in [1]

[1]: 
https://gist.github.com/Yemike-Abhilash-Chandra/5c53a5f3a77954b28c5bd4c27cd336a5

On the physical connection, if we have one V3Link Fusion, where:
CSITX0 is connected to CSIRX0 and CSITX1 is connected to CSIRX1
and the following overlays are applied:

ti/k3-am68-sk-v3link-fusion-dual-csitx.dtbo \ (same overlay as in [1])
ti/k3-v3link-imx219-0-2.dtbo ti/k3-v3link-imx219-0-3.dtbo \
ti/k3-v3link-imx219-1-0.dtbo ti/k3-v3link-imx219-1-1.dtbo

and now each media graph will contain two IMX219 sensors and a
UB960 , with the same UB960 being emulated in both media graphs.
This configuration assigns CSITX0 to the first media
graph and CSITX1 to the second media graph and the
sensors in the first media graph are programmed using the
primary I2C bus, while the sensors in the second media graph
are programmed using the secondary I2C bus.

and this will not break the existing usage, as it will
dynamically check the overlay applied and use primary and
secondary I2C interface accordingly ( primary for Port4
CSITX0 and secondary for port5 CSITX1 )

> So I guess my question is, what's the target here, how did you test 
> this, etc?
> 

for the details I discussed above, I have attached detailed logs
including applying the v3link overlay [1] and sensor overlays
and setting up routes. I ran a free running capture after that.

[2]: 
https://gist.github.com/Yemike-Abhilash-Chandra/1afc731e098fd23cad32dd5438852219

>   Tomi
> 

