Return-Path: <linux-media+bounces-40170-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C5BB2AC16
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 17:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CF736865AE
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 14:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD577233735;
	Mon, 18 Aug 2025 14:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ZD/CjvBM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA79136358;
	Mon, 18 Aug 2025 14:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755528829; cv=none; b=kUlmnwYwVsMQQID/c+JHC7Z5vtXtOFohMhztCf/5TlwwEQ4dbiuEX3uqaJHkqYd4F/d585QGh1M6c5UOmkj/+zcNFbsgP9J7Nv0ksuyxix9lf1qasfgh2bDecNXcgivsXlRjW4MJkje39Kibk9T6q34l0gkjiTEymzABm2RjN6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755528829; c=relaxed/simple;
	bh=c/QKZ8Y0emGKWKV7g4dCcuZGfd+Fq2Qp0OrgNg0pg8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=kUc53WYv4R43SMziKagQ/3Fe5WyMS/4YKi8kz7Clf1Xf1nmPMzbuxmn21V25Mn0eFt8ovQTlDU2D+++KaQ6bvZDCR3HeA0QhEfTx2NTKiTGcynOhugSXD7apyFycFSIMB0dVDw3KaHCgJ1Jt1FqITPiFnQEwnDg6Q4Jg70bfEd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ZD/CjvBM; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IBSstQ008630;
	Mon, 18 Aug 2025 16:53:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	A3H8GlnS5IGsbVeiPQFUfGjUlKvjNRte3jkEoUZg3Yw=; b=ZD/CjvBM4dKRhHcW
	Kh5U+EMhijdB8mpFLDvRfMfNxyNlg/OXgtBAo6JLsiuAlJDerDIOykiekBFFpKko
	cTOAmQt0Q+GHT/WkQ7Z9ceVi8GzNJUvND1GcrspbUf3pWIpJzfyEQGOxoJzFbRnd
	+MOvr0b0vvtqk9NRvrc8h+BlmX1ScwReuj8u+e4kyBnqwzQOQ9YtRgVuPDINSFgS
	lMA16B2jUOKG2ztaMzJdcMIWH1D28MWUBac80+DQ+HbEkWt3J5mGTdWCvWHapxkP
	Q9Vz7Nh27Ug0LszesWp/xD4M3kFBu+bQX6RfBOevYupMkcbfZhW0EjSD/AfIQ1zr
	VU0YzQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48jhb1py22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 16:53:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id A75114002D;
	Mon, 18 Aug 2025 16:53:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3D2A773C431;
	Mon, 18 Aug 2025 16:52:41 +0200 (CEST)
Received: from [10.130.78.67] (10.130.78.67) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Aug
 2025 16:52:40 +0200
Message-ID: <9fa2ac32-ad3c-4aea-b2f6-b476745cb7d5@foss.st.com>
Date: Mon, 18 Aug 2025 16:52:38 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: vd55g1: Fix duster register address
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20250818-vd55g1_fix_duster-v1-1-1b9d115dee87@foss.st.com>
 <aKMz1xtvXvMLKUZ9@kekkonen.localdomain>
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <aKMz1xtvXvMLKUZ9@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01

Hi Sakari,

On 8/18/25 16:08, Sakari Ailus wrote:
> Hi Benjamin,
> 
> On Mon, Aug 18, 2025 at 03:50:58PM +0200, Benjamin Mugnier wrote:
>> The duster register needs to be disabled on test patterns. While the
>> code is correctly doing so, the register address contained a typo, thus
>> not disabling the duster correctly. Fix the typo.
>>
>> Fixes: e56616d7b23c ("media: i2c: Add driver for ST VD55G1 camera sensor")
>>
> 
> Extra newline; I'll remove it while applying.
> 

Thanks a lot.

>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> ---
>>  drivers/media/i2c/vd55g1.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
>> index b89fff7e11f891dea04a0085a9e7aac841b6643d..cf35f73fdd1086c6d4d76f67c2b6e4cf66eadff8 100644
>> --- a/drivers/media/i2c/vd55g1.c
>> +++ b/drivers/media/i2c/vd55g1.c
>> @@ -66,7 +66,7 @@
>>  #define VD55G1_REG_READOUT_CTRL				CCI_REG8(0x052e)
>>  #define VD55G1_READOUT_CTRL_BIN_MODE_NORMAL		0
>>  #define VD55G1_READOUT_CTRL_BIN_MODE_DIGITAL_X2		1
>> -#define VD55G1_REG_DUSTER_CTRL				CCI_REG8(0x03ea)
>> +#define VD55G1_REG_DUSTER_CTRL				CCI_REG8(0x03ae)
>>  #define VD55G1_DUSTER_ENABLE				BIT(0)
>>  #define VD55G1_DUSTER_DISABLE				0
>>  #define VD55G1_DUSTER_DYN_ENABLE			BIT(1)
>>
> 

-- 
Regards,
Benjamin

