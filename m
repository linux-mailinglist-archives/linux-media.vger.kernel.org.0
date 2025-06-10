Return-Path: <linux-media+bounces-34405-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B2BAD321C
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 11:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32A383B6497
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BD128B4FD;
	Tue, 10 Jun 2025 09:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="wPwT8JYn"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2458C28B40D;
	Tue, 10 Jun 2025 09:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547929; cv=none; b=kk/Fy2ZK6n69Z1Q3/mrtqXlgKWp7p15hGnfmYke25ePMj8xB+DbceKHF+5lXKtGA+d6vNSjTVfui5XLfegVlm9veOTn3wZ04t3P+2q1+klv1V3hvczf5x0t8NfaciF3DcyVBfR+FqCrROnpkdjIGyRlqBJbcJNycERtSsLRH0UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547929; c=relaxed/simple;
	bh=Mxu+F7oYs9rjhQqNFX6d81S4isBAqb9Rqh/JNc/9YqY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rWhaebELnf3kZqYlj6CmMImOEMDWNnkm7OHsG9rPDDXah6TwBHi2pFV3KB3vZsRnE0h4DzxViUuK2bdrQN/+fxCy48VG6f2geauxxHvQeAfFk2smyqq6K4FaV/QxfEigi8d9Rqq3VBaXIxh3+Id/nxEDvi8aI2/NAihqNHRYOE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=wPwT8JYn; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A5eoUF029247;
	Tue, 10 Jun 2025 11:32:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	QqzwGX7wP5jq59PpJTek9NUkOQyF6n6c9rZCQTs99RQ=; b=wPwT8JYnkRbt7i/x
	LVBF5rNE4g2xIbOeTDHzDjFNdCg5BzxoxOwjNPBmllV0082rSzfd4ydG4Qfq/lIn
	kA43jkuXQ0RFQQrc7eJ35WAK24Kn3fhIxz/gN9zEJTeV81lhj0xV42UBM45PqofS
	tMQ6O1lDFzg7R+BmvIa6HbGSfVd+P7DtE51ij55wCcIu3Hxew2Oju+AgaiCYBUKp
	KMbj36bXrmSdZChOfcxyhFbQ0RbCzo0teZ+CwSzx8SDWxbE2SjfavYXexiXEjc0U
	x7dBt7zqnLzPmH4AShDEsk6CNWmAudnx5U5MeCJhltnOh6xMwcAgYWeLM5pubqce
	rYTU0A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474y051mw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 11:32:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A8F4540047;
	Tue, 10 Jun 2025 11:31:22 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 26A0EAC6D9D;
	Tue, 10 Jun 2025 11:31:06 +0200 (CEST)
Received: from [10.130.73.167] (10.130.73.167) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 11:31:05 +0200
Message-ID: <55fd5868-0481-42e1-b56b-80f59d724364@foss.st.com>
Date: Tue, 10 Jun 2025 11:31:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] media: i2c: vd55g1: Miscellaneous fixes
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250609-fix_vd55g1-v1-0-594f1134e3fb@foss.st.com>
 <aEf0KcapklkWpBFD@kekkonen.localdomain>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <aEf0KcapklkWpBFD@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01

Hi Sakari,

Thank you for your review.

On 6/10/25 11:00, Sakari Ailus wrote:
> Hi Benjamin,
> 
> Thanks for the set.
> 
> On Mon, Jun 09, 2025 at 03:46:20PM +0200, Benjamin Mugnier wrote:
>> This series provides small fixes and style improvements to the vd55g1
>> driver.
>> Nothing fancy really, just to keep everything up to date.
> 
> On all (or at least more than one) patches:
> 
> - please add a proper commit message beyond the subject line and
> 
> - properly wrap the commit paragraphs (up to 75 characters per line, e.g.
>   the above paragraph would fit on two lines).
> 

Yes, commit descriptions have been added in v2. Media-ci rightfully
yelled at me for that ;)

I don't see any commit paragraphs being above 75 characters, my vim
seems to be properly configured.
Do you mean the commit header too perhaps ? For example "media: i2c:
vd55g1: Miscellaneous fixes".

-- 
Regards,
Benjamin

