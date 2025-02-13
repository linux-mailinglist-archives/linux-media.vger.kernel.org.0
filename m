Return-Path: <linux-media+bounces-26104-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 88977A33895
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 08:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 957087A3E61
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2025 07:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26837208990;
	Thu, 13 Feb 2025 07:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="vZOSeXUa"
X-Original-To: linux-media@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3252A20764A;
	Thu, 13 Feb 2025 07:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739430673; cv=none; b=k0qcAI1wjqxrvwroWS9v2SUhOnrP6sW/mN4SMrVBsx0JiGKnOJ1S5ke0KxG1HJ4N+ziPHrOA6MVFKi5+oPlS0lOV4xRdzEhRN6AQexZ/lUvTIyH6F4xB//YSVbEmB/XVbciALUa1xMgolI0KD/Wiic35RzeDAeQ7UFC7O0VPzp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739430673; c=relaxed/simple;
	bh=SDlhNPTc+IJPTQYfd10RVnRI/DFPzcEU8dyGKrFH2/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GczQolCxKqyWewsEUrHkBZ35GoLHHLHjVC9ECepGlGF664lehcmkRtif6F4CDDIV1J0MVesdOYgJ+rpxCBxkywL2N/8E02xICNE6HTAfI7qgYfmTB2jQasNLk9KHdvh26lxGW3+BK/bF29r8QtIsImXTNldCS6iPW2Y7Wk1DvK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=vZOSeXUa; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51D7AsoI593886
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Feb 2025 01:10:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739430655;
	bh=4eQgfyqqS0+d1JZoc8rzTZkCyEzl8R/5sOSoxNwKzPo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=vZOSeXUa5ABJlGKuudF+QOIkdj4x1KW0IosftQvdiCX9wsTtcLqGCqR2Nhfv7ymh/
	 rAX3VsRlxFksC/ZKSiWGYlDNJ+uF4YL8NnpGn+WaxDHU0n45S6SXoZdKw9bR+EY2zO
	 UA0qMIUGByhRjgdgrVrymKlqWwsWCvmQk1SaLzFY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51D7AsnH109641
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Feb 2025 01:10:54 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Feb 2025 01:10:54 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Feb 2025 01:10:54 -0600
Received: from [172.24.227.115] (abhilash-hp.dhcp.ti.com [172.24.227.115])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51D7AoAS071134;
	Thu, 13 Feb 2025 01:10:50 -0600
Message-ID: <eb95288f-c777-4823-a5d2-dd837046f360@ti.com>
Date: Thu, 13 Feb 2025 12:40:49 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Enable support for error detection in CSI2RX
To: Conor Dooley <conor@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <mripard@kernel.org>,
        <mchehab@kernel.org>, <jai.luthra@linux.dev>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devarsht@ti.com>,
        <vaishnav.a@ti.com>, <r-donadkar@ti.com>, <u-kumar1@ti.com>
References: <20250212131244.1397722-1-y-abhilashchandra@ti.com>
 <20250212-caramel-darkish-6b1bbd8f562e@spud>
Content-Language: en-US
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
In-Reply-To: <20250212-caramel-darkish-6b1bbd8f562e@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 13/02/25 00:46, Conor Dooley wrote:
> On Wed, Feb 12, 2025 at 06:42:41PM +0530, Yemike Abhilash Chandra wrote:
>> This patch series enables the csi2rx_err_irq interrupt to record any errors
>> that occur during streaming. It also adds support for the VIDIOC_LOG_STATUS
>> ioctl, which outputs the current device status to the kernel log.
>>
>> The IRQ handler records any errors encountered during streaming.
>> Additionally, VIDIOC_LOG_STATUS can be invoked from user space to retrieve
>> the latest status.
>>
>> Logs with interrupt in DT: https://gist.github.com/Yemike-Abhilash-Chandra/58ced4df0158efad6f453b4d96463723
>> Logs without interrupt in DT: https://gist.github.com/Yemike-Abhilash-Chandra/d807230b2a624b7a38effed89efdd148
> 
> What is actually RFC about this patchset, rather than just being v1?

I sent this as an RFC to gather input from different vendors using the
cdns,csi2rx driver and its device tree bindings. so I just wanted to
get their feedback as well. If there are no concerns from any of the them,
I will proceed with sending this as v1.

Thanks and Regards,
Yemike Abhilash Chandra

