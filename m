Return-Path: <linux-media+bounces-61445-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAhXKyJ6BGoPKgIAu9opvQ
	(envelope-from <linux-media+bounces-61445-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 15:18:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE52533E28
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 15:18:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43425306E4D3
	for <lists+linux-media@lfdr.de>; Wed, 13 May 2026 13:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFFD28B7EA;
	Wed, 13 May 2026 13:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lIHXbmdr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZWUE6rO"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74821426D1A
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 13:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778677795; cv=none; b=GZpyiuOFyOw8Lv6ldqbmDL7/8POqC3IP/bD41ERKf8gOVi58cUV1EQ7RLuUW8e4JXVNVBaf1A61d978kSrT5ID0/6/ioQvrQ1zuJtmceS9apm3Ylpi6H25v3h6PanQqP7/tlYnDjnbyMNChLwUF6qUZE1Ytq9POVitkZzIb5s2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778677795; c=relaxed/simple;
	bh=pPhZN7nfhtHHRw6dhJOnhfHiyh5eQfG5r3IROqjHaUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UJj9MyJPTptiXameGjBh6v6//GLDO+pQPVGfNFqrm7Qw4an98qyw8x+gYHZfstbg33CsRbiBGvWzzJF7ylyY+aDOi4gyc//4mVmHnC2XLazF1EjrSeQu0BvtiVIWKlvTKNyWLfmmCrxXJjs2nF/xO3u3fXTqNdQCbzw+csntffY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lIHXbmdr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZWUE6rO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVj5B1393025
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 13:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B5SnseXY8gWAqnQpvJungSJKJ2vcNA0bRZgJ6p/nT8Q=; b=lIHXbmdryhAAdCL/
	HfbH5KgK0BohO3ARBAdjZHiUBA0hBdx/x3+IXo7NGxGPRtUrdxEWhE8jX7tSqslj
	FKkwMUezvxpmTSKUuUldw9iF4Vg4hk98A0M5RwAowegqejjQGylUj1sv1xbNHCn+
	2uWWbvJiJBYX8XiPRCtVQ6O9jnCCErdIseRLb5xrhO74OpCHxlNqpQy83AlUhbDI
	J4mueiqhd9sqtDcsAkezYjTVX4n84BkTvvJYwzkQp6mmqjldFo2/lDJ7uKLiK7kp
	94eQXYVtJaV3aOuvrj0uVvRvzjbVQ6/oJGwuTedS/LrfUGedIomGFaP5jIVO7DVC
	akOk5A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4k261rac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 13 May 2026 13:09:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9a6d84522so127180655ad.2
        for <linux-media@vger.kernel.org>; Wed, 13 May 2026 06:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778677793; x=1779282593; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5SnseXY8gWAqnQpvJungSJKJ2vcNA0bRZgJ6p/nT8Q=;
        b=YZWUE6rOAwmrjSAkZz317QFUMWuWF3IfV1VCxRWwW60WI+Et49M+pbEpewpksR++7k
         moqABE6edxK4cKHl+N0H6yrZWIUZoiHSbaBP+ntuAEasHOQ1KJZr3xS7fRgj3eA7sOrY
         qpOrq68sBctZhrl0KML1OpocP+96SpW0hSWkxkd23SkyHq/Jm0BjW31dPoIk8XI6vuQl
         qYOreBVn6WoTJqHm3ZZ4109xmmxVl6X8g71FnktWmbZA7DW0THZfrlSa6X+5haIHITxS
         0Z65uL7Osu8aiNASY20m5myeBqHXwyYnV1dbX54JrvOhPVcRaTBYXiMxjbzTJ4ZIurVa
         KfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778677793; x=1779282593;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B5SnseXY8gWAqnQpvJungSJKJ2vcNA0bRZgJ6p/nT8Q=;
        b=W6ri8nOUlLIoc8bawM/Xefkfjbs2eB2DIqnV4Cyf3KUjQzMUkG4j8RZgAA0vttTCBU
         Q53CXPPFbGR5f6a7pi4x0nj35+uAJiwSkdi+rzMUsjAyFnTgwTcp8G5kmQjtf9xkaVG+
         0zIiuzq4RX0noK9rojwSWeVALY0wtPPS2Nxnv2Dsv9G8nHnT+bnCD4tjpUVA6mtpe4/l
         FTfxnERv5nGK7Wv5YNhWsACHOcZtuwOcosccbQkhFvDZCnbw0/5nWcyv7Drjq+fO8Yk8
         ToIHpPbx+J0prbBMTTDfZWz70MPYkhYEpz2TektjLGMcnDAh54S3I00IDB4+UAgGl9qi
         zEbw==
X-Forwarded-Encrypted: i=1; AFNElJ+8cpTfAPf7KS9VYf2vvPj9P+WxJbYxLylvW/iZi8ED7FERTllaUtnJhFPy86v/cUwUMNTPDmZMjxIIHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPL6QWkhG8BRA8J/oRIdPYZC3CUq2hGGUa/JDR8g3HSKEQmQpQ
	emHJIDjMJ3HGRn6C7qfcUXDI+/q0HIHn1rQJW9qm3HY83lAJs6Eybirt4NHJvdQps+/ZwvrY9EF
	+iGGhGRQ6M8/BQCNlaZE46EY/jKqnZxGa73XqIpJ5fnYyyLqCz3DHXn6ZmsDeqDjVhA==
X-Gm-Gg: Acq92OFvLHRfW7v8ch4SiYCtbY0Eb+iVNUrP2yXomrQGbV10H1yKVlkgZSU8Y9lUHnH
	bUbo+Iu7bRG0wsYmD3isj7oLi2VjcK6Wqb/bl149f3fbe4YYr9ZYzzvzS+pxxA5MYGBF3rwfoja
	5dwZeOlu3IffTjjmxHxLR3nVE4dbiOJRN1oohuQF5AJ9s+UI7ZgTMsgEhqgBqJAsAh50XPQoNjT
	rFbpns4nURxgFIaXqoxJL88jqSNwimvQkLuCCEmHPyHqRS7WlLTWcDyrTA23teGdg6SV6ycRgIP
	zlQijkOCXb+CH3FtRbETR727t7uNPV3MUu2YYYraw2oMTt5Z96BGktfF9z9pKPvUikl9sH72ikP
	GfZcc07CiniFRdn0Xq6nHTptx2y1lbuil/rDOp9XEqnJ/juYj6PFPBp0=
X-Received: by 2002:a17:903:f8e:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2bd275b9de9mr38165125ad.18.1778677792717;
        Wed, 13 May 2026 06:09:52 -0700 (PDT)
X-Received: by 2002:a17:903:f8e:b0:2b9:ff02:a14d with SMTP id d9443c01a7336-2bd275b9de9mr38164675ad.18.1778677792287;
        Wed, 13 May 2026 06:09:52 -0700 (PDT)
Received: from [10.204.101.125] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d52f27sm207675385ad.36.2026.05.13.06.09.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:09:51 -0700 (PDT)
Message-ID: <a1a38bf2-84b6-4e51-817b-b85ab6c65f08@oss.qualcomm.com>
Date: Wed, 13 May 2026 18:39:43 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/14] iommu: Add iris-vpu-bus to iommu_buses
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-2-7fbb340c5dbd@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260509-glymur-v5-2-7fbb340c5dbd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M/l97Sws c=1 sm=1 tr=0 ts=6a047821 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=j9WNCELPX4ZUnkJ91WYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzNSBTYWx0ZWRfX72CGpeDzdr+5
 Swm+5v2PTwrQTgR2RFsOYCDXbMuHlmBLQq2bZzBb3EshRNKjdFk0oqtJbNz29w+PZVhz3Xj55mU
 g4dg1b2AdN7KIQN+LnOLpOSmNLe8uRa3EiS4hF2PBCJhHbbvfNLIA4sQEMxdyIjz0SP+aOn8qJY
 mJ7n5OClg9MNzx0jjck/mDHkrDYE6Mqi6ZZSruRIuvmrLXdEqJstYpWQqTSMuAbQEa9OknhUN+p
 VmpvJxlBnTokIsptiNTQ+ZbTeV+c3//SWB6YdLxOH/7/tpPGyzpg8LK2u9Gqvk6INty1hSlS+f1
 cIxTRr9a8FLC9yzrFcd3QBvEvYrbnfJvpgX1wsuUBtMXkJ1ES0RrgWAJ0cgvtt8ZJT01jS8XvxI
 E50nDX0lXlMpTdeA6klUQwaoYdGTgYYIowJbAjwmrxijdszuUnYALenah3omkN4/YSqIsbQSxKX
 2smYZR5v+LM7eZfvHBQ==
X-Proofpoint-ORIG-GUID: l2zdDtFg42Bz8izatFVh-zeESkdwxiTS
X-Proofpoint-GUID: l2zdDtFg42Bz8izatFVh-zeESkdwxiTS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130135
X-Rspamd-Queue-Id: 4CE52533E28
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61445-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vikash.garodia@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Rob, Robin,

On 5/9/2026 12:29 AM, Vishnu Reddy wrote:
> From: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> 
> Add iris-vpu-bus to iommu_buses[] to register the bus notifier callbacks
> for device add and removal events. This ensures that when a device is
> registered on iris-vpu-bus, the notifier triggers dma_configure(),
> which sets up the IOMMU context for that device.
> 
> Reviewed-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia<vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/iommu/iommu.c | 4 ++++
>   1 file changed, 4 insertions(+)

We have added vpu platform bus as suggested by you earlier. Patches #1 
and #2 in this series adds the same. Please review and suggest if you 
have any comments.

Please provide an immutable tag by applying patch #1 and #2, we can then 
have that in media tree and apply remaining patches in this series.

If you have any other suggestion to land these patches, please suggest.

Regards,
Vikash

