Return-Path: <linux-media+bounces-34632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EBBAD743F
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 16:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C13E188F8E7
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 14:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8094E248897;
	Thu, 12 Jun 2025 14:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="n4xs0+e5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A94226CF1;
	Thu, 12 Jun 2025 14:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739027; cv=none; b=ou0bqCJ3wlsWDeIgJdrPy56EVwujXpDMy7aktcT4hksP/cZBSxLYABDub11cu2gOSxo+HKdMDNcAD+NHVI92XTInKuORC8INpRCDuR07Fw15OLr8XzdSpiY1Wp5WBWsrV7eV5pL0HI54JWHTst+b/j5LgppL+Kka/2+PGZ2/Xl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739027; c=relaxed/simple;
	bh=gy4Z7/j1AUXzmiZT9kxQby9opWaeoiU8G46ukvR+dvM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JfICfZ3SnNJi9n908H+egBwj3jvoDkw37y8HjoA1QdVhehWhLYwM4wWGFaIF07ahzfvqm8dXg57fCu+O7EnzDHgabZUfIqy6OAFwVTagI56h9byN+JxwqUOlqc6XKLjkd65RhkPFqgJn4Xfhji7YU6KnZF5mZqRg5XYkx2JtepI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=n4xs0+e5; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CCUW78017559;
	Thu, 12 Jun 2025 16:36:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	sZd4+FhIUpYGyZ7CJ7ZHdy/qoIQX7PX06UdReZgudWA=; b=n4xs0+e5WhsDf9iZ
	txJc9iZOB8cpwCDdbAw7UkBO9gPDgdjg2Zj4pbpLkH9U4qvS2qH/kUKSYluXv2xQ
	jEF3j+jYOHLJIRkHlvKm7qSSbjvmEmrDPr1BFGG8nz1X08RgyDCAb3kWQ1iI/bh6
	TETacmIwLzFdWwKn33GHNJ188PpCWuxzRdwlb0PuwtZQTjLOFr0Nby6Tr3SqEHzq
	HTKfOZ/LM7nHfJLmQrdJWUaZhbEJ26XxKckRQNUxdceyRj46D+MQboPl6ZXIKvay
	9JqyDQyfbWqROOgY7IkSB2OPZ2g/Bg8qTynGZoztPjPnMjgOKR2b32OVXQvVF1y2
	2O+KTQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474ajag59m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 16:36:56 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4AC6040052;
	Thu, 12 Jun 2025 16:36:13 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E913DA68D88;
	Thu, 12 Jun 2025 16:35:56 +0200 (CEST)
Received: from [10.252.9.207] (10.252.9.207) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 16:35:56 +0200
Message-ID: <f3aef0f1-df18-4539-9656-0265dce93433@foss.st.com>
Date: Thu, 12 Jun 2025 16:35:55 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] media: i2c: vd55g1: Fix RATE macros not being
 expressed in bps
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250609-fix_vd55g1-v1-0-594f1134e3fb@foss.st.com>
 <20250609-fix_vd55g1-v1-1-594f1134e3fb@foss.st.com>
 <aEf0gdJ0hA2dNQoH@kekkonen.localdomain>
 <e080a28c-9ec7-46bd-8bcd-49b48bd9ab94@foss.st.com>
 <aEpykCRKpJ9pA9sN@kekkonen.localdomain>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <aEpykCRKpJ9pA9sN@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_09,2025-06-12_02,2025-03-28_01



On 6/12/25 08:24, Sakari Ailus wrote:
> On Tue, Jun 10, 2025 at 11:31:09AM +0200, Benjamin Mugnier wrote:
>> On 6/10/25 11:01, Sakari Ailus wrote:
>>> On Mon, Jun 09, 2025 at 03:46:21PM +0200, Benjamin Mugnier wrote:
>>>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>>>> ---
>>>>  drivers/media/i2c/vd55g1.c | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
>>>> index 25e2fc88a0367bf6a28bb22d209323ace99299f2..78dd22d9cab03edf4ff3e5a301f8d045e930c997 100644
>>>> --- a/drivers/media/i2c/vd55g1.c
>>>> +++ b/drivers/media/i2c/vd55g1.c
>>>> @@ -129,8 +129,8 @@
>>>>  #define VD55G1_FWPATCH_REVISION_MINOR			9
>>>>  #define VD55G1_XCLK_FREQ_MIN				(6 * HZ_PER_MHZ)
>>>>  #define VD55G1_XCLK_FREQ_MAX				(27 * HZ_PER_MHZ)
>>>> -#define VD55G1_MIPI_RATE_MIN				(250 * HZ_PER_MHZ)
>>>> -#define VD55G1_MIPI_RATE_MAX				(1200 * HZ_PER_MHZ)
>>>> +#define VD55G1_MIPI_RATE_MIN				(250 * MEGA)
>>>> +#define VD55G1_MIPI_RATE_MAX				(1200 * MEGA)
>>>
>>> As the meaning of Hz is just /s, I don't think the use of HZ_PER_MHZ was
>>> wrong in any way above.
>>>
>>
>> Should I just drop this patch then ?
> 
> Up to you.
> 

Then I'd like to keep it please :)

-- 
Regards,
Benjamin

