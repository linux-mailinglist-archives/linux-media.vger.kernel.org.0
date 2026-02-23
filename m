Return-Path: <linux-media+bounces-53151-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GjjHv2qm2mu4QMAu9opvQ
	(envelope-from <linux-media+bounces-53151-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 02:18:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E565B171429
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 02:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1099D30374B3
	for <lists+linux-media@lfdr.de>; Mon, 23 Feb 2026 01:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C35532BE03B;
	Mon, 23 Feb 2026 01:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F4KHJvew";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ad4YHdMB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B02E26C385
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 01:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771809303; cv=none; b=kI/8rCeWRdeB6SX6gRk9W7tfUFTCrT6Q6jrjGvmq1Jb6s4HlDDrVlNEKCdjGMKrIf0krdczz5viArOIg98hxcS2V5pX62HSnyz1Ew54j+8Qxf+bDvgbP7gFgcsBv7ZoGKGcu1G22YJOD6CZqO4Ae35e41W3M0nVRpADjjJKbS+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771809303; c=relaxed/simple;
	bh=xsU6fGdnTE88GJSJwPXDj93bSCh5tqrT/Rr5XG2l/5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZ1b1/rulODB0bUxoVyqMS6e8QIk6Vig6UWV/JFgoonklb+6mdSb2XcNZokIF85Zs0l59WnLIonudxcTPS6jSJn7C5z/oRyx8vHTYZbV7tW3E+8jgJ4cN0pBmxvyvIaCIuRAuu6jWQynjmFomnx5wZ3osNSIBx/8pq3wt/k+aYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F4KHJvew; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ad4YHdMB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMneZ82783699
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 01:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xzzVNFX3/pypzB5m2PFuoeCrh33FDwpI7eDwSNY/ja0=; b=F4KHJvewuoOx0rX1
	dVbELOIVHNXZTq0MOG1JUR+L1LYLwJ34HATZV2ow4Uc6jpHGY/01urMePQuuqS1H
	fdhYupKN1Z5G6pelgo48IFT0IVrZ2DaNMXVB6hyXff+W09rsJ4FuZGdbIZxojfyi
	k+oqRpiKIY+7lkRCzMtGMXxG8cTEjSYZMwaj8wPAWAz6JF9izKB5fOHiPI7oXuIj
	BPPEoLCjjCLZTFal/vFfh2KeB56da/Zzt5rDjgSX8mEBpvS53aed2HJKx6kzdAXr
	hA0b7GF959qQQE5SvcjpxYk6VUjMV7PwV8A2M5pBeE0gDzFppcb+nwEZzEMkO9HB
	YHBICw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgu28f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Feb 2026 01:15:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71655aa11so5817690885a.3
        for <linux-media@vger.kernel.org>; Sun, 22 Feb 2026 17:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771809300; x=1772414100; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xzzVNFX3/pypzB5m2PFuoeCrh33FDwpI7eDwSNY/ja0=;
        b=ad4YHdMBKE/j2E9neLtQpYWBYVnWwcMH/rdc/nUGH8K9nhHKEshbiA66CQ79/Q3Zgf
         bbcp3czZRXrfxfhMO423fK/5wTFicTPNJStAqZlsTaO8bZrfAI5hhRtr8MZC69V6NsBK
         bBbIr8wNI0A0yzeleRbcL29k7rNBGNm9fy1Lx9ADwwMPCbir4t//lWaibbNM1muEy0fL
         7aJ4boFQpVXzjAYsevEeGqtkUBnbmMPoBsokSeihSoqBa6FHsd2gqV+c33m16MTU8fuU
         VqDGRnsAY+Bvi+FlGlRPfZyHrQt3axTbtLO8ri8Adh1KU3hT+kcUUC3FjHWE1b0GJ0hE
         Xu9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771809300; x=1772414100;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xzzVNFX3/pypzB5m2PFuoeCrh33FDwpI7eDwSNY/ja0=;
        b=Xbws5SFJX0CohAYk4boOKdSAr7PiknrS5Q8NCc6jJIH17pO3kH0bhOk79NO/nJM8D8
         Q3LJsFY4DFk0j71tHfQPlXObZBo34yeKaO5E4LTc6zRwSVQdEbBb1cKorQiOH26QS/eQ
         svb91ab3Fn5xeN1ovXgWMQP7flrWK0BlXK0aUWLJwiOhxAQlsm52vBhB1GcC1sSTvQ9F
         8BDxuvhiSzU7zgmdFN1/kBS3A0/GkuSNy87PNtsklXgCEE5UFr0Z8YjUVo3kIFO+9CRt
         bdG2//82rZWd629uqUwUziYdW+n54uB582cSr+BVzNC8uT3mADRg0Cm0nTuDf8Zd3Xqz
         fjRg==
X-Forwarded-Encrypted: i=1; AJvYcCWeJDV540gLI6Qj84enunxSUtp6dJi9PFrv6MzaQYLYjZNrY3y+5mqFR8gMH0+asxI4wbZ9QCngcyx9ag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy05Q3Z6VVxQL62Xub1VLPQLVvGTflTpAr0BgnSHw9U19ZsCD90
	cfNBuIdBxYkC9JcurrqJLdr6J7euz1ZLXD02XaiO1QZiEDjmTju5Cw0jLjOwWXgbj3SySINfze/
	jwAiBa8602+qmxUmGZ8QP+2fd86gwA3vgZkhcvknmVi7IAN6/E+2Y1Ss9H0SgTLz0UxNhq9mr/Q
	==
X-Gm-Gg: AZuq6aL/izEx89VyIfJr4+gtKp5gjrqo8Mj6+Kggu7YL2MkGzOlfDvtOsWkmL0y0CEO
	J/9GF3nTWr133EnTThi5l93SYIFUKQfCw5MiPZOA6TdrV3MinFgdcdBTtyR6ZGjUQqqQecJUkFO
	iNngXKfqpND0vVZQvn/CXmlOV/68uutSYLs9CNocD5TS8sBDvaogIBM12euH5NmGVjAJ1DsiuEV
	3TeU8N3U2x0fPPk2Y3Br3pcZHZ1AIkplbSotjz55a832NNZpc0C5EMSNsEMfWgSPiUOpvdd5Q2F
	ieB1coJwekAKUrni9POoLlOB+8ms8su2bTlxReoshGSBmqkx5AHRuMcWSmW2MGS/0QqvF74jJxj
	9OfbX365T/wGsOnstbfbln/E4EfC0ATV3NRP7v2TIfwc8dbIkmnNv+B52QofTXuuG5JbCgVdRFY
	dzyhnZNjnYxeioQnsxZhTK4Bf2t9zGvEP/4iU=
X-Received: by 2002:a05:620a:472c:b0:8c3:598a:2956 with SMTP id af79cd13be357-8cb8ca15a53mr933271485a.33.1771809300242;
        Sun, 22 Feb 2026 17:15:00 -0800 (PST)
X-Received: by 2002:a05:620a:472c:b0:8c3:598a:2956 with SMTP id af79cd13be357-8cb8ca15a53mr933268785a.33.1771809299727;
        Sun, 22 Feb 2026 17:14:59 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb13680sm1248620e87.20.2026.02.22.17.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 17:14:57 -0800 (PST)
Date: Mon, 23 Feb 2026 03:14:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: iris: Enable Gen2 HFI on SC7280
Message-ID: <feoeiiauc4gb7mfo56wxew4ul3c2kuup3sn62kzmbe37fcuu55@ccigygl4lwpw>
References: <0da582a6-5bba-4450-99ec-cf57b67915e6@oss.qualcomm.com>
 <0a324898-092b-3e44-c35c-15de20b50f40@oss.qualcomm.com>
 <2uih6xdzarkwnvhlhv5kznmdwo4jorqvsrb7xxrxgr6vprx3ey@4kx45k5i3c4y>
 <6b9042c8-767e-0fdb-9012-f3790899509e@oss.qualcomm.com>
 <f9f40ac7-e6fe-41eb-92e4-311913567ef0@oss.qualcomm.com>
 <b759fb04-22b7-cd5c-9e53-f4ffe9f37dc5@oss.qualcomm.com>
 <nb576n2risxl5mabotlu3idmoztedrblur4gbvdlk4cu3mtiqq@ecezsux4w7jz>
 <2f85b131-2167-838c-152a-03be689b0b29@oss.qualcomm.com>
 <ed9a5194-356a-4c18-8ddb-c1017e87fb7b@oss.qualcomm.com>
 <06059a6c-96ef-f6f0-ded0-e536fd46c3b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06059a6c-96ef-f6f0-ded0-e536fd46c3b2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDAwOSBTYWx0ZWRfX9BNr1cbcRyYG
 jzPwNdvQJLGbPcynPW4O7FPI9lvDI9ljHFmkSb2N9lD992q5nsEb8mSsIhdMEK3xhofg5AyPjhy
 YRXcdd3hkhoCIm46ovUvZx9+An9WAd7wVBpoXE2+QfS+0EzLkocBf6Rw3e/JtQSgXU3lAbjhqtf
 dy/ofoKoBOtDVuEqgTPwoKB2u4o5qrX35mIuoJPXbplKSg7r7FHgtCYT+GyjMywM5W8p4zijWMf
 aSJpv8t4O3JaLQJqcAP+LMTnK1Izf4i0amj1bPterAHQf8kXTsOPoOTwywuL5dQtqEJ/U3oixrL
 p83q2UYqfqFBWOF+9qSBGPTAwa8joNnbnu4zMCTH5rKylXHvPGMbolDo3KpDh5FCWmxSjtSLRgG
 dkaRJQuRB/Mks7a9aa+kFMmNduD0UacEqlIjtMvL6vvqQhjsvI4pgVnVVvTzJ3EzeXQpQFK2TWj
 xUp3AkRh0TRkzrxdHrA==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699baa15 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=yIbyj-vG9sYIjwp8GdMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 5xHq-Ips4sauUB7-32xB9S2GSNDyOuuB
X-Proofpoint-ORIG-GUID: 5xHq-Ips4sauUB7-32xB9S2GSNDyOuuB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230009
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53151-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E565B171429
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 11:50:35AM +0530, Dikshita Agarwal wrote:
> 
> 
> On 2/17/2026 5:50 PM, Konrad Dybcio wrote:
> > On 2/17/26 8:40 AM, Dikshita Agarwal wrote:
> >>
> >> Due to these constraints, I think, the only possible way is to extract the
> >> version from the firmware binary blob itself.
> > 
> > Looks like both gens use the same iris_hfi_queue_write() logic for issuing
> > packets and they both use the largely common iris_hfi_queue_dbg_read() logic
> > 
> > So, knowing that e.g. HFI_CMD_SYS_INIT (0x10001) and HFI_CMD_INIT (0x01000001)
> > seem not to conflict, we should be able to issue say a gen1 command and check
> > if we get a timeout, no?
> 
> The two HFI generations do share some lower‑level queue infrastructure, but
> the command formats and packet layouts for Gen1 and Gen2 differ.
> 
> Because of this, sending a Gen1 HFI_CMD_SYS_INIT into a Gen2 firmware (or
> vice‑versa) is not safe. The firmware will interpret the buffer strictly
> according to its own expected packet layout, and since there is no
> protocol‑level version discriminator, it has no way to recognize that the
> host used the wrong HFI format.
> 
> Additionally, using a timeout as a discriminator is unreliable. If we issue
> a command and receive no response, we cannot differentiate whether it due
> to using the wrong HFI generation, or due to a genuine sys_init failure.
> 
> So, I will proceed with implementing the solution based on reading the
> firmware blob, extracting the version string, and switching between Gen1
> and Gen2 HFI accordingly. This avoids protocol ambiguity and does not
> require the firmware to support any additional detection mechanism.

Ack. Please proceed with this idea.

-- 
With best wishes
Dmitry

