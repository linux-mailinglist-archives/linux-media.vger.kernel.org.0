Return-Path: <linux-media+bounces-30212-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD263A89469
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 09:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08A4F188F719
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 07:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E56D275112;
	Tue, 15 Apr 2025 07:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="F3pKGIac"
X-Original-To: linux-media@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC1018DB2F
	for <linux-media@vger.kernel.org>; Tue, 15 Apr 2025 07:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744700672; cv=none; b=pg1cl2C7RXayemXHVbb2e+BM6CfeAV0PTB/oA/3J9toUI6a+ZiGc2d1qmeLSF2+2bOnjU1PJL+7FCRDHc/8V3756hRSyofjUhbEpLuqoU5ko69t0B8xxj34Ot8NE8AtreWwLkNWCLOJ/dAXjvWIuygftAU0jwhdJ17xMdPRvdiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744700672; c=relaxed/simple;
	bh=1K5JeTQGfOPWCvQ2VMXlc0XMG7+I7l+jruHXwTnA+VY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=b5AdXSMsP5F/awQLWZ1yS1z86R56+aH2Dpde9CDfXLlLSQ7Ciyz2qFG/M89AzzT3YLjaGFmzfFchykm3wF4ezvlIaHC0yUZgYUyl7IIuPrDiXoncYQnIfcckQdDQJ7ZkAkcr7XzeMTnX/Wk/erUfVAh3pan1bg53aaAJJF7Rqpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=F3pKGIac; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53F74I4q2401968
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Apr 2025 02:04:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744700658;
	bh=OR0JL0iGcCVoVQnbSq5xT6vLAiQC0hltFrZp478X8/U=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=F3pKGIacDggDMWoLppdoR8i2UCuXc/5DjtDqo/zu8sgRToZlwEp48FeuvQz6L9s9d
	 jbEJPCHaaEJpHFoguG5xUxWOlM6xQzU/dEvrg3Md5C3ZueKxNnciXo4o3vJlZLAgRf
	 jy5rF7E89Vm2THgJxhwZY6LIIHKQWyD+0KXUqex8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53F74IhB016259
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Apr 2025 02:04:18 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 02:04:17 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 02:04:17 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53F74FiE000998;
	Tue, 15 Apr 2025 02:04:16 -0500
Message-ID: <96d33047-fe50-4b12-94cd-42573a239996@ti.com>
Date: Tue, 15 Apr 2025 12:34:14 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
To: Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
CC: Kieran Bingham <kieran.bingham@ideasonboard.com>,
        <libcamera-devel@lists.libcamera.org>, <linux-media@vger.kernel.org>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
 <2ff6c67b-7a1a-463a-8f57-8886fc66fbae@ti>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <2ff6c67b-7a1a-463a-8f57-8886fc66fbae@ti>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

++linux-media, libcamera-devel.

Hi Laurent,

On 07/04/25 20:50, Devarsh Thakkar wrote:
> Hi Laurent.
> 
> Thanks a lot for organizing this.
> 
> On 25/03/25 15:57, Laurent Pinchart wrote:
>> Hello everybody,
>>
>> Another year, another libcamera workshop. After the previous editions in
>> Paris, Brussels and Vienna, we will organize the next workshop in Nice
>> on Friday the 16th of May. The event will be hosted by Embedded Recipes
>> ([1]) as part of their workshops day ([2]).
>>
>> This year, our workshop will be colocated with the Pipewire workshop on
>> the same day and at the same venue (but a different room), to facilitate
>> discussions about topics that span libcamera and Pipewire. The Linux
>> Media Summit will also be organized in a nearby location on Tuesday the
>> 13th ([3]).
>>
>> If you would like to attend, please register your interest by replying
>> to this e-mail, and indicate if you have any discussion topics you would
>> like to include in the schedule. We will draft and circulate an agenda
>> in the next few weeks after receiving topic proposals. If registrations
>> exceed our capacity, priority will be given based on topic submissions.
>>
> 
> I am very much interested to attend libcamera workshop in-person this time.
> 
> Could you please let me know if it's possible to register me and if you 
> require any additional details ?

Thank you for organizing this. As shared above, I'd be interested to 
attend this in-person. Could you please let me know if it would be 
possible to register me so that I can plan accordingly ?

Regards
Devarsh

