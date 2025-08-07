Return-Path: <linux-media+bounces-39006-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D41DDB1D3BD
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 09:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D62064E2AEB
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 07:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5F9242D8C;
	Thu,  7 Aug 2025 07:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="O43eZfNy"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F9924113D;
	Thu,  7 Aug 2025 07:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754553302; cv=none; b=samdM+o2Oyf8j5bgPIHTk/1J/MmE/RcfSBWq+wqEfsXEJeDJaIVBzg5KtGOvgPxSXbB4nVFxmCRYskRQNqY142tbWtXf2W3zz2CBQAfWH92YEgW1YAhIXjoQldiOYCX49ZSIDE3P5+nDCSde8+vTpDyZdWWoekxpfSWi+0Wo8bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754553302; c=relaxed/simple;
	bh=eF41UGuHUZM9YiTxRuYW3QX8Wuqz7PLBtDX/R9mW6ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ED+Pd0dgZHBFb2Vqf3zk7HH/VqtxYT7vdpwSrEqezY8bf5D4uXde4aMC0QcIJTuS2xDWx2jV0JOKd4IjbkyYEraUfY5BQHQELwMClawu0T1kYcBR+mBXBooO7lKIxu0tHwbWYljYNRmwMOkpboXpPaphrimcl7uGwmg2pMvQLUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=O43eZfNy; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5777SgqM007917;
	Thu, 7 Aug 2025 09:54:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	+09BlbFswcQ8kqh6grV/WOvvjds15aYjFOjwNDgCvB4=; b=O43eZfNy0PW50uZs
	kLog1fGY1J7XLkTaP1hE9tMl0PhLu3gf06HGBGOCV3IkX3nmxlg4UQJz1l/JvcT1
	YpvpRMEcGkrJ98cAqOCg246I4WHbK4ERBkC01DdfhhzsZgr7h/LU9uT8am0sMk1p
	doC6MXl8jhq/YzjCqy6MpbCeyHAWjd9L+5orhFWi8F0y/l8TmnB2Tbv224FXDyM7
	tbpcgaJ6RUtx5oSRWbqbKbBH9KqA53Sh11NLqsjgevE02eSZrur+9sqrMPRBDIrl
	CJHgBKLf5nIvCTF15aZraiQNxlLLsXIqZn7ZgGFgHTkGo2v5vquIDzZjTSyPrP99
	yxjCsA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48bpx06nus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Aug 2025 09:54:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C9EF54004B;
	Thu,  7 Aug 2025 09:54:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3A1BF71CF0C;
	Thu,  7 Aug 2025 09:53:44 +0200 (CEST)
Received: from [10.130.78.67] (10.130.78.67) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 09:53:43 +0200
Message-ID: <452a1263-2ec3-4174-9082-078445e67637@foss.st.com>
Date: Thu, 7 Aug 2025 09:53:41 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: uvcvideo: Log driver load in uvc_probe function
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Imene Jaziri
	<imenjazirii18@gmail.com>
CC: <linux-media@vger.kernel.org>, <hansg@kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250801145326.28560-1-imenjazirii18@gmail.com>
 <20250801150430.GC4906@pendragon.ideasonboard.com>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20250801150430.GC4906@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_05,2025-08-06_01,2025-03-28_01

Hi,

On 8/1/25 17:04, Laurent Pinchart wrote:
> Hi,
> 
> On Fri, Aug 01, 2025 at 03:53:26PM +0100, Imene Jaziri wrote:
>> Add a pr_info() in the uvc_probe function to trace when the
>> uvcvideo driver is loaded. This is for learning purposes.
> 
> What part of the learning instructions you are following instructed you
> to submit this patch to kernel mailing lists ? We are regularly spammed
> by similar patches, which indicates the instructions are not clear
> enough.
> 

I got curious too. It comes from the Linux Foundation training LFD103
[1]. Chapter 8 describes this patch pretty much, and chapter 9 describes
how to send the patch, but with a warning not to do so :

  [...]
  At this time, you can run:

  git format-patch -1 <commit ID> --to=maintainer1 --to=maintainer2
--cc=maillist1 --cc=maillist2

  This will generate a patch.

  Important Note:
  Please note that this is just an example. Don’t send this patch upstream.

  You can revert this commit now.

  Please refer to the Select the recipients for your patch section in
the Submitting patches: the essential guide to getting your code into
the kernel document.

  When you have your own patch ready for submittal, you can follow this
example process to generate the patch and send it upstream using the
following command:

  git send-email <patch_file>
  [...]

Looking at it I guess it's pretty easy to miss the note. Maybe
requesting to add '--dry-run' to the git send-email command could be a
simple fix to prevent from copy/pasting ?

[1]
https://training.linuxfoundation.org/training/a-beginners-guide-to-linux-kernel-development-lfd103/

>> Signed-off-by: Imene Jaziri <imenjazirii18@gmail.com>
>> ---
>>  drivers/media/usb/uvc/uvc_driver.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>> index da24a655ab68..4e5d1d636640 100644
>> --- a/drivers/media/usb/uvc/uvc_driver.c
>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>> @@ -2170,7 +2170,6 @@ static int uvc_probe(struct usb_interface *intf,
>>  		(const struct uvc_device_info *)id->driver_info;
>>  	int function;
>>  	int ret;
>> -
>>  	/* Allocate memory for the device and initialize it. */
>>  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
>>  	if (dev == NULL)
>> @@ -2188,7 +2187,7 @@ static int uvc_probe(struct usb_interface *intf,
>>  	dev->info = info ? info : &uvc_quirk_none;
>>  	dev->quirks = uvc_quirks_param == -1
>>  		    ? dev->info->quirks : uvc_quirks_param;
>> -
>> +	pr_info("I changed uvcvideo driver in the Linux Kernel\n");
>>  	if (id->idVendor && id->idProduct)
>>  		uvc_dbg(dev, PROBE, "Probing known UVC device %s (%04x:%04x)\n",
>>  			udev->devpath, id->idVendor, id->idProduct);
> 

-- 
Regards,
Benjamin

