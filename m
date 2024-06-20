Return-Path: <linux-media+bounces-13831-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEEE910907
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 16:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E59181C20CF1
	for <lists+linux-media@lfdr.de>; Thu, 20 Jun 2024 14:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D771AF699;
	Thu, 20 Jun 2024 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="c+cbk3Et"
X-Original-To: linux-media@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4661AF682;
	Thu, 20 Jun 2024 14:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718895185; cv=none; b=MJn44AO67VVnbaMTrREsNl/IzAaEA3Z14UC4JX5U+XW9+9n5uK2zaMxlaLKfmrScmGz+J4o7AMETvSX9wVTDlGqItDXHEvrNQxb0phyJOFjpm8O2dIqcnNFfKi+Q9ymT8eNWIWfG18ZyB1cwDJ7O4iEtA0F8dJc5wf+DSOOVngw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718895185; c=relaxed/simple;
	bh=g1ed6mztL+CfErEonUXtCOXbnBAIVWMRrGbPZjTx1Fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Mj2sz1JAJAZmn12bltfOu7ARtxJmFXzq+B/yy/2voykVVLsjBY5NxkKKSW+TlSGm5Al7m75vC4XAJd66FiCx9w4FaRxPd6iCGor9Q3bgfCIGrISzWGTKhYLfPrpc0LPrzdtWphy1OX0W6ljkLcGDmRJodfxZ6jpvCZN1n0Ndk5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=c+cbk3Et; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45KEqdpS106305;
	Thu, 20 Jun 2024 09:52:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718895159;
	bh=3/6+kacdbmCst+UFgiDAIXTXVnIMfqKugEUCsNBL3ZQ=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=c+cbk3EtD09edSE3FFAF+G9kOgGyod6mITEUaEUCxqX8h3ZCUJHOUwZUq/I0dfVqH
	 FdIeuq1L0t3TChAXByALOKKAPES/EL8fqo61N9IOmBYAnbZwwP3HTcmP0EVMDkZEjN
	 pSHpTtUmxJ4nNnAN5SOfFcdrgmR0NXGH6l4gqi0g=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45KEqdOl014581
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Jun 2024 09:52:39 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Jun 2024 09:52:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Jun 2024 09:52:39 -0500
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45KEqZIv002047;
	Thu, 20 Jun 2024 09:52:36 -0500
Message-ID: <1cefd686-2eb2-e0b2-0b24-2c4efb0c41a1@ti.com>
Date: Thu, 20 Jun 2024 20:22:35 +0530
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
        "b-brnich@ti.com" <b-brnich@ti.com>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
 <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
 <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
 <bc8796ef8107507e99df079f6d7ce2575ead3cab.camel@collabora.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <bc8796ef8107507e99df079f6d7ce2575ead3cab.camel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Hi Jackson, Nicolas,

On 20/06/24 19:33, Nicolas Dufresne wrote:
> Hi Jackson, Devarsh,
> 
> Le mercredi 19 juin 2024 à 23:56 +0000, jackson.lee a écrit :
>> Hi Devarsh
>>
>> If there is no feeding bitstreams during encoding and decoding frames, then driver's status is switched to suspended automatically by autosuspend.
>> And if we don’t use autosuspend, it is very difficult for us to catch if there is feeding or not while working a pipeline.
>> So it is very efficient for managing power status.
>>
>> If the delay is very great value, we can adjust it.
> 
> One way to resolve this, would be if someone share measurement of the suspend /
> resume cycle duration. With firmware (third party OS) like this, the cost and
> duration is few order of magnitude higher then with more basic ASIC like Hantro
> and other single function HW.
> 
> Yet, 5s might be to much (but clearly safe), but getting two low may means that
> we suspect "between two frames", and if that happens, we may endup with various
> range of side effect, like reduce throughput due to suspend collisions, or even
> worse power footprint. Some lab testing to adjust the value will be needed, we
> have very little of that happening at the moment as I understood.
> 

Okay I see the intention here is that if there is a process holding the vpu
device handle and the input feed is stalled for some seconds due to network
delay or CPU throughput then after a specified timeout say 5 seconds we want
to suspend even if the process is still active and holding the vpu device
handle ? I agree then if we want to support this feature a safer/slightly
larger value is required to avoid frequent suspend/resume due to network
jitter or any other bottleneck and maybe 5s is a good value to start with.

But if last instance is closed/stops streaming and there is no process holding
the device handle anymore then I think we should suspend immediately without
any delay.

Regards
Devarsh

