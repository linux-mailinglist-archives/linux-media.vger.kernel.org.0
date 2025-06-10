Return-Path: <linux-media+bounces-34406-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B23AD321D
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 11:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A118916E038
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 09:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF7028C00C;
	Tue, 10 Jun 2025 09:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="cOsjj9JR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF63A28B40D;
	Tue, 10 Jun 2025 09:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547934; cv=none; b=RFwVThLrkk5+nPeGrmBBk7Cx1VTC5BAs8xI1YebUa3NXQQa11IK6jK+eWatHR7y2OuObUisEKr/dOSErRPiTT81qq6KUE25OCa0OVutb5S0nf1GHwdwxgAExQqOwo45QeVIKoUF+b47vy8wEnMvAe6kPdS6LeHmw3y0EW4AJ/nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547934; c=relaxed/simple;
	bh=7Loi/0B4WmfQSoZ0MvqPYPboeuDmuaOKRQhtG0JFSQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=LW3wfnIOXQX5OMLhnD/jX21BGMZqmLj3gtQ5lHfJIqlessaDhz4rISn1MmlBwKatwayOBVAHfTHFDSTsQhc/TOT1cvm7ONKStkn4Q06bm2uyY25HeK3qe2kax2cAQETjFs+4+UCISRmfN4ccHJkW0dgIGyEkFmkQpCDhyO1jqIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=cOsjj9JR; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8SI5o011905;
	Tue, 10 Jun 2025 11:32:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	/KfDYauy7hsHDKCjaPlF/zLFmv8kle+7jCq3nLrbIsA=; b=cOsjj9JRte59qYlU
	amsY86UlZjgvSWTuq7O1J/rxgy1tXp3FCHQ72/ee8wS/aA0BneSjkVvDe5GxhBcB
	QSvLDG6ltHGqEg7uHvAZf5X/P/WJtEq+FUeAf/muVKAL2XzUyS4unT3NZHU54qse
	zstR2+xfjk0E94LCVGs91m4ZzScdYtiSv5SzdfJIxcbDHTxnrTTlLK4QAmN4Y8gI
	MrgYoR56Uj/3HXGWkbbwA8RVOK/OkRA9il+LeZ9zbJ1JmPB/1B7HBoQhfOtcZHfZ
	uilHdG4Mwfx/hQJ6HWuTWRPFCjvlEf/FWe5IPkjHlusmahqvi+WWVNKIpGqEcTHb
	DZogBA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cahk9rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 11:32:05 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 70E7540046;
	Tue, 10 Jun 2025 11:31:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 19CCBAC752C;
	Tue, 10 Jun 2025 11:31:10 +0200 (CEST)
Received: from [10.130.73.167] (10.130.73.167) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 11:31:09 +0200
Message-ID: <e080a28c-9ec7-46bd-8bcd-49b48bd9ab94@foss.st.com>
Date: Tue, 10 Jun 2025 11:31:09 +0200
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
Content-Language: en-US
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <aEf0gdJ0hA2dNQoH@kekkonen.localdomain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_03,2025-06-09_02,2025-03-28_01

On 6/10/25 11:01, Sakari Ailus wrote:
> On Mon, Jun 09, 2025 at 03:46:21PM +0200, Benjamin Mugnier wrote:
>> Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
>> ---
>>  drivers/media/i2c/vd55g1.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
>> index 25e2fc88a0367bf6a28bb22d209323ace99299f2..78dd22d9cab03edf4ff3e5a301f8d045e930c997 100644
>> --- a/drivers/media/i2c/vd55g1.c
>> +++ b/drivers/media/i2c/vd55g1.c
>> @@ -129,8 +129,8 @@
>>  #define VD55G1_FWPATCH_REVISION_MINOR			9
>>  #define VD55G1_XCLK_FREQ_MIN				(6 * HZ_PER_MHZ)
>>  #define VD55G1_XCLK_FREQ_MAX				(27 * HZ_PER_MHZ)
>> -#define VD55G1_MIPI_RATE_MIN				(250 * HZ_PER_MHZ)
>> -#define VD55G1_MIPI_RATE_MAX				(1200 * HZ_PER_MHZ)
>> +#define VD55G1_MIPI_RATE_MIN				(250 * MEGA)
>> +#define VD55G1_MIPI_RATE_MAX				(1200 * MEGA)
> 
> As the meaning of Hz is just /s, I don't think the use of HZ_PER_MHZ was
> wrong in any way above.
> 

Should I just drop this patch then ?

-- 
Regards,
Benjamin

