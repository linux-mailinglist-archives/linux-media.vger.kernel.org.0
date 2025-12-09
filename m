Return-Path: <linux-media+bounces-48488-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 988E8CB0B17
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 18:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 19EDB305D984
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 17:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBDAF32AAB9;
	Tue,  9 Dec 2025 17:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okMl+qbc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gzWnOKa6"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAA0242D79
	for <linux-media@vger.kernel.org>; Tue,  9 Dec 2025 17:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765300569; cv=none; b=dWA0+A/UfnCMxDVXlsqDNZvbGFwKcZ5abYnfq1Gbij/2D3H2J+IltxkLGHDgBlounOmhZxDilEVtzNrVIIKX+HMhkQFdxffUWdgBH+SPDN66tthpXKoAKkkrN2+UY35qabAI8bADF9w/L9nknfCS51bZKMJbRxMT2fBeHg4eXgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765300569; c=relaxed/simple;
	bh=20O0SbAQMW9hXmQs/75+aASrhFHHl0vrGt64WxXZ/h0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=cmRq7zlRb/v+bu/dTB5bEQNVN8OqQrVZXWqO5JkcCxPz6Olqm/vZkkwugEgJzceymGD73VWUoK+9Fa8u1DssO98g7Jmd6qmtRkzrWwG0O3tHpoK97WitVmJeq26Z0Fs4NsmFyi7vFCGP1IZYZf6tZ6X8BMlh7yFlumGLugpehnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okMl+qbc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gzWnOKa6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B9GiTha650449
	for <linux-media@vger.kernel.org>; Tue, 9 Dec 2025 17:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bu5Ehn7/BfgcW2RUl6VBHayBawS8qi7AADvvlk4KCyQ=; b=okMl+qbcIHH/b8eH
	CS4B2cfXvawRxStHxjF2M89KFMXuFwNQjlQY/Rt/YjxEhrZsxnWgcfu+w8URGKgC
	qQ7mQLnkxpLE3DJcC+5zA1hWj+5YpGtmOTrW0H0XmQC5W1NMJdAJz42PY+5VQ6ZB
	NgUxhj7JQm5+V2vYQLxphlcmlrm3DzzE1dmfyp29UsmVqQhwIJqErGL6rNHhBizn
	C5JGDOi/oHETltyqwOqox9xdhQY2mI40GF8ssxQo5NMWPSeAiWB4xoKUHfnbOJF5
	l3ojUUpjHUmn6mP5zDmcRaGbakSN7X4U8Jv0C0c96RMw/Rj3TxlcKhdWOAaV/H7Y
	zq8eeQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axmg60ta0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 17:16:06 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-55b0f62aeb7so7988120e0c.0
        for <linux-media@vger.kernel.org>; Tue, 09 Dec 2025 09:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765300566; x=1765905366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bu5Ehn7/BfgcW2RUl6VBHayBawS8qi7AADvvlk4KCyQ=;
        b=gzWnOKa6k2ynTILLg5GLZdgrn3jugYiV5ybBBm94vR7mi8WYatprXcMGUma8bwKpYr
         YBviHmJgPAY0Sj3d6I0UOtsq3FbfbfdPsp9AxpEawz3EQLI2r/4ILZIrFss3qJOb+0Nn
         w+/WPMTVJ5grXJ1xqJrPF8ABm7rOH1N6FzGzguL+xlqQGhUy1WiY3gVowlbFshu39RDK
         B4+NN2oZk0irn+988Y2pCo0suSLWR8geETWNkl/avpU2glUej2WmConX5Fzg7pTBi/hL
         kHkevCKA6jVO2rK1Rr+0bWlu9fwxZZeTsQpJVomy5Q1kWlhIJQm2WxPmdXyZRTnu1pBv
         4cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765300566; x=1765905366;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bu5Ehn7/BfgcW2RUl6VBHayBawS8qi7AADvvlk4KCyQ=;
        b=W5ffXlhCU4BYZ8gA5gwPAzPhFZCFbkZ+i3hTEi0s2qJmtfdAM0MTbwi1AKTvOOmV75
         Kyt4iChQJ4NUOr8HGEeD+8Sb1f5/CzQKJLrsv5qLD/STlxKTcLEenZKxU1gp1HPux8EA
         uFSCsXJtFCuzEhGQ4ZbAB6QDQS49s+5w46jyY9qNdJ8y5/2qyjHh51xj3NZloOTnnA2e
         zcdtIUgBV2bU931RMsV4gMn41wgK3mgW1RmC3rqibm3RANUjb3C2NQSXFSRzv/X35YvF
         theI5somjkmi744cthenESPwX6oNRgwakrnQTT2wA2cafR+YsBLCkLE4dGvwe1iPZZOa
         Q5mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjZTdDUrHSTpL+66XsBpvR6qHGSnOugGtzM3x8RSum7nx84B4a3A247LmqHlN3PjCLGB7EmxOLRqlXyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YySYT5Omkh2FlVZQpQtfVz42MgpvqJSy+BvzVYbFYp9gp/Nb1+8
	Jy/XuJbltJ+80x5AY9yDxLtqU8ELeOhMM/XcFaaDnELbkNg1g26TnG1SXSdmK98CdIm+4aBMT5B
	kNHTqAe3dvHpostj0a/SSJcKSzHP2tw/I0gghHwn5FM2yBSCOHOQ9TPJanpZB5Cej9A==
X-Gm-Gg: ASbGncsSAqj/Xqv7prPZv+rxxLCB7ZlDSANE/4Rkf08/Yk4+BW5s1AEWE8yYuBD7YDY
	b1/8yVC7YuASzPDzDlYiGnRnl808tYZHwsYhWZtcfvAQwD5F+mqJjuboq27nv1ku3kpjKzXJBNm
	kx6KRWMO3mp5W1giX01gFIFUlZsiOjUVpBCXfv/kpPfzw9pHM7jEqjofKKO8gKEQT8vbQJZFUYt
	q9O1fmbxN/HoR717iSgGJq5FSVURXAm56k1p4m8qJqsKo6JgL3TSTTsiy44i6r0PEyTOyBEitEC
	Hro14T9tZqUSgkGQiPN0LpovmRwt0nUOfhgzfw2m4Z5Wg9MumAn1VjAZx3GX/hbvCA56iuaIROE
	ePXHfIJOBCCo/VyIGBlWqhTgQergMGxOYYIjjLD/2mcmyMktnP8Ylf+FBvjDf+UudZJTfHGai0M
	/OVGSd9AeknxysoPx4FGciWABStbKKu23htwMSFqvfrQFZoFqyMgryt1sxAYSzypqQFn7760/H2
	gf3
X-Received: by 2002:a05:6122:319b:b0:55b:305b:4e42 with SMTP id 71dfb90a1353d-55e8479ec61mr4033988e0c.19.1765300564557;
        Tue, 09 Dec 2025 09:16:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFR570Q/hf1Z/Wcn+RbDL6HEpK4Zf1P9Y62ky92xaE03gXW2N+BCEzvkVgGTT7DC1F3uti6w==
X-Received: by 2002:a05:6122:319b:b0:55b:305b:4e42 with SMTP id 71dfb90a1353d-55e8479ec61mr4033813e0c.19.1765300562693;
        Tue, 09 Dec 2025 09:16:02 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:8e96:3679:b9c:de47? (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f44d3d9esm1402432266b.30.2025.12.09.09.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 09:16:01 -0800 (PST)
Message-ID: <6a48f714-8360-4729-8d51-85a1a54cb48f@oss.qualcomm.com>
Date: Tue, 9 Dec 2025 18:16:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] media: ov02c10: Fix bayer-pattern change after
 default vflip change
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
        linux-media@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
References: <20251209160621.6854-1-johannes.goede@oss.qualcomm.com>
 <20251209160621.6854-2-johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20251209160621.6854-2-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDEzMSBTYWx0ZWRfXyP1cel5L4+aY
 SfhExUEAn4367H5QaqfwKTXADwiowiPzBOfZw1leRriYQm5LfQZ4uCzdr5nU2uJYg+co1Q+tBqe
 UxibIxW7d+pbLxE2YRRqUvgVqigI4whxMkxibuR/8GUO7Ps76SPEXQ/IYlZyKhTtHVILgXePePB
 R+aMicgu1ToeYhajAP2RF2Dpjs/3oBodaSQJt8uxo1Yd2j6pMP905K2cljfgGW79IMlwQ27NTjD
 vJLMqS3ssxDgaFl7ASlOUfO3YfZ9aQVKNiSMqyhNtwp0nB+RAuncsqfaTiVKxs/Z/bqfbQsvTMh
 PMHd5svJHz+y0eo8WvJJ7qbHsK85Dy98AYf7wcBN1Q2+9F/FyNxAhu6H5SgnDW8dqHYiP3/H6h1
 tgWRFF971hPDyycEX0l/kDKruFGC/A==
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69385956 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XcUMaHnUY8WEdTgpWY8A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: 4wWXY67aCFsnXyGRH6pVD-Lqag0l26Mh
X-Proofpoint-GUID: 4wWXY67aCFsnXyGRH6pVD-Lqag0l26Mh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090131

Hi,

On 9-Dec-25 5:06 PM, Hans de Goede wrote:
> After commit 69fe27173396 ("media: ov02c10: Fix default vertical flip")
> the reported bayer-pattern of MEDIA_BUS_FMT_SGRBG10_1X10 is no longer
> correct.
> 
> Change the 16-bit x-win register (0x3810) value from 2 to 1 so that
> the sensor will generate data in GRBG bayer-order again.
> 
> Fixes: 69fe27173396 ("media: ov02c10: Fix default vertical flip")

Correction this should be:

Fixes: d5ebe3f7d13d ("media: ov02c10: Fix default vertical flip")

Let me know if you want a v2 with this fixed.

> Cc: Sebastian Reichel <sre@kernel.org>
> Cc: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>  drivers/media/i2c/ov02c10.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index b1e540eb8326..6369841de88b 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -168,7 +168,7 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
>  	{0x3810, 0x00},
>  	{0x3811, 0x02},
>  	{0x3812, 0x00},
> -	{0x3813, 0x02},
> +	{0x3813, 0x01},
>  	{0x3814, 0x01},
>  	{0x3815, 0x01},
>  	{0x3816, 0x01},


