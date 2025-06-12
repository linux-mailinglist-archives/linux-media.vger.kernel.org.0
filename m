Return-Path: <linux-media+bounces-34633-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 943B6AD7460
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 16:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BD931722B3
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 14:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B5C2566E9;
	Thu, 12 Jun 2025 14:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="vkbeMiww"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ACC2472BD;
	Thu, 12 Jun 2025 14:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739464; cv=none; b=G3D26xLmeBeltCTtfX+Xfv2xcc5Ozv+/8CykpoYnOMU4mLooNZYEkOA8AAo5mhk0E0iXIo7KSEc0XNcZj7Ii/3wfCfTLJGirjNwcgo1YcVUDx+7PPmod7cJrlsmlO+138Ow5LrlTKm7pj3qbNXQs0vQUmGVmw8bG5j91Xa+hfzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739464; c=relaxed/simple;
	bh=vBpKTwkj0wDTNvR3afmUscgIIZ3ospP8o3/K+X0opW8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mVES7ccqvXL0lQqUTr4YyAL4vFs1lq1XO1nJOoQv9tumo1bmWV1zmMOEYXqdnI3rDbummngCNjftiD8yM4KBsfXIEQSe8Ych+uyNmwnjNcepTbFdqMz2jBCY0dc5GoVWaZSHs5d4Zpm3Zsk1/zcnjrR97hqcxKSM4hbSuKDCd6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=vkbeMiww; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CCQQIv001116;
	Thu, 12 Jun 2025 16:44:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	QzQS4U29OThDBUOM/lDg6huUyLt6fWa3NdeaaWxqcGE=; b=vkbeMiwwEQeCUUzz
	orKOuWpY0qSbXIIYQYIIe+oakO0i9d+4W5+f4oMkqH4PBuM0kx1Q7tVRhGyWNm5r
	kILeSfiWH0zUVTSHhITKO7Q71UMZDP6sWD9VCNUrITvMz67USZoQe5gEjPR0dvDA
	+uubLYwTSYeFV1mIaT9z7x8HUjmm81JPClY9M5sgYRtRJBE/f6viPP6TW+6jQfzE
	xkh4nvtYVesj5vDUiIrCOQrZ/4i27f/cteqhlA8Tl3+isePx0IWL05Qz3+0Sofp6
	HaPk7k1HYKqCcxY9Ga36NkADxrZKfNZ1AYdgZ2xRTZJLEnbo5Uzo5l/sLIHrAoRt
	t+EzFA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474y05ekt4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 16:44:08 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5E4C84004F;
	Thu, 12 Jun 2025 16:43:29 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 07BD5A95C10;
	Thu, 12 Jun 2025 16:43:12 +0200 (CEST)
Received: from [10.252.9.207] (10.252.9.207) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 16:43:11 +0200
Message-ID: <ca48c562-ad69-4766-b766-247a172296db@foss.st.com>
Date: Thu, 12 Jun 2025 16:43:10 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: i2c: vd55g1: Fix return code in
 vd55g1_enable_streams error path
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250611-fix_vd55g1-v3-0-ef4ecf15ddbc@foss.st.com>
 <20250611-fix_vd55g1-v3-2-ef4ecf15ddbc@foss.st.com>
 <aEpygaTstAGV5EuE@kekkonen.localdomain>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <aEpygaTstAGV5EuE@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_09,2025-06-12_02,2025-03-28_01


On 6/12/25 08:24, Sakari Ailus wrote:
> Hi Benjamin,
> 
> On Wed, Jun 11, 2025 at 10:48:31AM +0200, Benjamin Mugnier wrote:
>> Enable stream was returning success even if an error occurred, fix it by
>> modifying the err_rpm_put return value to -EINVAL.
>>
>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
> 
> This looks like something that should be backported btw. What's the Fixes:
> header? I can add that while applying.
> 

You're correct, here it is :

Fixes: e56616d7b23c ("media: i2c: Add driver for ST VD55G1 camera sensor")

Thank you.

-- 
Regards,
Benjamin

