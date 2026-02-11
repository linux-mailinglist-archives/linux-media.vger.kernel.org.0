Return-Path: <linux-media+bounces-52600-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LI2HRVtjGlmngAAu9opvQ
	(envelope-from <linux-media+bounces-52600-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 12:50:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D15B8123F56
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 12:50:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B8D43020D68
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 11:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D76F03126AF;
	Wed, 11 Feb 2026 11:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mwNI0NPZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b3Ff2VCP"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5628C281525
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 11:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770810623; cv=none; b=iH9EcJByTuvWPO+T1frho4+pANeqh9oT0kG0zznSY6bDyuFVTsqf01Z/oduIyN/gffX3sm2PJ2NjofE9S4QP3+9xCUl9Vb0gWCU/nAScsnCH7XUgMkJqyuj6x8Bgx05IdXnqd1rPlWiAjN+NWIuM0H91Q5vi3z+vhWRIcxoYJkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770810623; c=relaxed/simple;
	bh=wYKsv3bmtg7N9pxHjlqaInY4id26NwCDluvQ27D9FFw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ANatw26eTAwGjQhRBENcqub+3J/r/zv+i5YgtFCwaw9OMvYLjESY3Ndh2XL07Q+yJ/lbbGIs6jyHffa6su8TkRl/cNpSFzb36MLh+l0vEcLmb3LCuxQEdiNvqzzJGTYvymfqnjwkHEKZIxVeVV49dBC57veJm4WJf8lje8/l4rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mwNI0NPZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b3Ff2VCP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BA19b94127441
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 11:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mXjiM2zPEAKKLoz2JpUQzTocxEfivfvIE82fqHenleA=; b=mwNI0NPZI6facgXp
	hMOPADq5LpXNhycdL/hQ64LtIj88QWWJIhysaF7+g1w3t9UGaULR5uE2m4BTtkrA
	MQHu/wp0MVX1TVAzyd6Tfv5DENOA71yPmxac3fRzoQpbvtm/UQ10s/ovaHvs1GbY
	ZI9/O9MZqrfhH4zZ4LQs3taDZ3V8zjLB1Mqyz5He0ZTuBQ+UkvUjMHdEGQdPLP5T
	dTklrCnyKneFJSwDc1NVv10XsleW3rsX+SSLKn5cinRBj3kWAtgHikDfDhduUkKp
	2xZbZ69xv1o4BRqH3DS8ACCOW+tErFMiHg1S/zRURXkJnRfMCu2joNHq9kmhnfod
	/ar3Gg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8gvm1jyb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 11:50:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c7166a4643so547548885a.0
        for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 03:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770810621; x=1771415421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mXjiM2zPEAKKLoz2JpUQzTocxEfivfvIE82fqHenleA=;
        b=b3Ff2VCPHBuDlaVMpl1y6bFD7aXq4TYyFbeY8xyueynCgvz1bifP967jzPqwCVV1LM
         OUK2PG9XeliROyZ1uxb9kDKV9kUcxm2tDj9PvoJAda23Quppa/YZdlh/8OvqFQXjov8O
         jCvM/Yn/uqKz4xs0jmaEvop39KYxw8/wo1Wfxk39QRHYAirI/vXR6SMRnr4gCOCx+InU
         JL8P8Q0M9ZT3G3fWCxbSHE8z7rI21YLHBKd+cbBvn0UnnehrZjjrX1jWJgh/huiTJvvc
         yVI+oyDVM3RyWDKsT/3+iLFqZI8OxbpdsVv8IleUHz8Vw1JY52gz0hpFv8r9HQgpkl2N
         TPWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770810621; x=1771415421;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mXjiM2zPEAKKLoz2JpUQzTocxEfivfvIE82fqHenleA=;
        b=J++EzamS53Dbj/hj9QQMYhplNUmfuFiRj7gAOYmI9EpZR5LPJgNXWo1QlhH2K5BYSp
         UQW0EHUaLaArc0f3AhxkVHNE+bUGsnYmszktA4K732gG+Bl96srDI7mFlS/qSETn38md
         PU927japTE666+bsy0GLvRrnEEiX2H3d0wErZO+3rck1NuqSjl7c6V+RtxpExHaAfqeS
         g6yPKGfyauPvvauSnKGVFEtmu0njXc+ZtvLQaqTsshGGtMBq/BFK4/62pQd8xp/bvKny
         7LmJ0Ea2gNVv5jw/4T0KiF96dDjnDkcfwgCenFUqGMm28jlgqxUIWQ41hprLqizuAUU6
         9WIw==
X-Forwarded-Encrypted: i=1; AJvYcCXySDR7tyNQYzZ2nGRQZLOeHfYRFJQYiYFpCSLCL2f9YEvJzN25XGPZtIE9+6+hBRe72IV4BBlp0tTitQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzatuhHNLhrJ70BcO+1y5OBh95MWpZu5Te4awNPZ9XIl4OAJytM
	41u1ZwjMFXHYaQbZJQdAXGvvM5kU705p5I6rE7IMjaXbMs4fvAhpb+X6hTLKqsn/Obwj2+4ro56
	gJv08bGJd3/zOTmONoeO160ndDgD4/gbeTtxHt0K9+TQeso9uqgigmdRqKUdVq5zLcw==
X-Gm-Gg: AZuq6aLiSEWpxqXnFIDPX9BWEhpLxCMCgiVopnRA//oadvPwiPyzydGNDkpW6YH3Vte
	jXZ9HD1U4q/xh0cYZA9ahs6LjVTp7arHQL2q7vVtbEePSIymiBGYmWM7unXRTpJ5/du0E4nlLVG
	wZRH8nwmoTjyeW84xEXcN+rultfR0cVKC5LPvmTWpyAbl+0tgxDZ0Xe/opfNStS513pkYshtXto
	H7daE1HDpyCPBwcoPAOfanbXxBObVfpUvyTdItZGsH/jI5T7IE8zpzvMj5Th223W5+aN0z/ktrI
	tOgDw7v0J3xYgLzffjLA6ZvWjAkScUKQ8aYajAEstWepgwqTbT/3Vez8riIVXIDb9FLfovyy3vK
	iV0bXNqDmA+XBfYTnFOiiAZD67C8zeTqS2evHvgPe+APNJM4TOIhBYtcBk+13VvBmRcvxJxOaPh
	zaVCHWhULN1R6erbnugAEYtBuOumjU4bPgvgMaegcgp4C5swt51KH7K85DOXbc0MIkW+QKr1YkA
	r0y/n1EzSW8DhzM
X-Received: by 2002:a05:620a:1a04:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8caf13fedb3mr2470002285a.67.1770810620622;
        Wed, 11 Feb 2026 03:50:20 -0800 (PST)
X-Received: by 2002:a05:620a:1a04:b0:8ca:4438:b8f4 with SMTP id af79cd13be357-8caf13fedb3mr2470000085a.67.1770810620224;
        Wed, 11 Feb 2026 03:50:20 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f79c79e12sm32546666b.48.2026.02.11.03.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 03:50:19 -0800 (PST)
Message-ID: <b8ca670f-c45b-487e-9e29-2b097c1d5c17@oss.qualcomm.com>
Date: Wed, 11 Feb 2026 12:50:18 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] staging: atomisp: fix heap buffer overflow in framebuffer
 conversion
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>, soufianeda@tutanota.com,
        linux-staging@lists.linux.dev, Andy Shevchenko <andy@kernel.org>,
        linux-media@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
References: <20260210-atomisp-fix-v1-1-024429cbff31@tutanota.com>
 <aYt-vrc7h7CJOmSu@stanley.mountain> <aYw5q_gsHOmKAIhK@kekkonen.localdomain>
 <8efb3705-42f3-40c5-9631-d72eb2dda74a@oss.qualcomm.com>
 <aYxqjBSI-t8Jk9UF@smile.fi.intel.com>
Content-Language: en-US, nl
In-Reply-To: <aYxqjBSI-t8Jk9UF@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ctiWUl4i c=1 sm=1 tr=0 ts=698c6cfd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=CA8kUe_sQCdszHEXljoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA5MSBTYWx0ZWRfX9a6ATpxCsTG8
 kpi2PMmfu05Nvq9qcu+SkDTAhSw/UJLAtMkx+FTx8zAhvJcj76GUWcmpKGRfr7/9PvJ1zjZy2pX
 B/HIXqohzcTsTJ7dMdBn5I+p4rXVVgZT9Y1FHWgQ3rR6D5QEoNSorB1FWfAwFurdwn7xRCgwyBg
 HLFzhtXGreD/hpMXuw6c9CEtyYF7sy0W1XBPlNfgHY7uKncNYwqPd9a7JkwebuxSqHQ9hF77zLt
 R2i8wnVmYuvWcwHLTI75Mcm3KDJUuve2MBJ87R0Vdgh51nzZZxESipotVshGgA/wh0/oBhVmg0h
 rpk/zQbGI2B5+0j7d2USOwxNx/Mq0Srp3T8iZS/25lDHPh/v+iADyES/U9sHDW/DF/nYyEa8txi
 sG2EwwMIONsg3GNtQz99M4YgrfjuuiaAV8i59At+z92UdgkaEpugP4ULdfyz+iFHX3rGlqOhRC3
 gZBFA7pndm8R7edr79g==
X-Proofpoint-GUID: b5zgXWR-JE5xKFIJUjcbitg7A1qWk9K2
X-Proofpoint-ORIG-GUID: b5zgXWR-JE5xKFIJUjcbitg7A1qWk9K2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_01,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110091
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52600-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D15B8123F56
X-Rspamd-Action: no action

Hi,

On 11-Feb-26 12:39, Andy Shevchenko wrote:
> On Wed, Feb 11, 2026 at 12:28:35PM +0100, johannes.goede@oss.qualcomm.com wrote:
>> On 11-Feb-26 09:11, Sakari Ailus wrote:
> 
> ...
> 
>> This will cause a bunch of code to turn into dead code, but I would
>> like to keep that code around since when we add support for
>> a parameter buffer queue that code can serve as an example how to send
>> parameters to the ISP.
> 
> But it's forever in the Git index, we can remove it, so it's just matter
> of convenience to keep it in a working copy (tree). That being said,
> I would rather drop the dead code to avoid a stream of not-so-useful
> white space, style, and similar cleanups.

That is a good point, dropping some of the dead-code stemming
from this is fine with me.

We should probably stop pruning dead code when we get
deep into the helpers to pack things into fw specific
formats.

Regards,

Hans



