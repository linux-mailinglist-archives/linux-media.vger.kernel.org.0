Return-Path: <linux-media+bounces-34417-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59991AD34A5
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 13:11:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E76816750C
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 11:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ABD528DF3B;
	Tue, 10 Jun 2025 11:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kig8GL0q"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF2A28DF3F
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 11:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553911; cv=none; b=iYuw9n/Tnb5r8hVfxcZ101wPkfWbHUeGPE7gLI3U69PhC5epxfkzuZbUT0MqMkYPZPzO3tV7p0K00YPwcixDJbXeSpRWdFhmndu1tdDO2aQTTc0z19A4Q6PXgiKfxttE2/Pluf2VjzRSjvUhaGlqYAquKoQdHPzbMgYBnE4AwhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553911; c=relaxed/simple;
	bh=lGfzwxjvbEeSHMr2uJyICRwLy4LaylD3mrDy0I7qXRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8qXc+n1msK6AsnsuEN7trh39By3sJALZzrAyCd1PScvEoUcovy7kf3bq+ntLBmg+UJ0peN/4fpCESiEJDz21uvGTe8LQyVqODO7T48shgEKf2k9/nuUO2vLrRrp5v5hHlquvlVwVBAIaQEr72kLSTOU5NvFV2MGF12hwol1POk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kig8GL0q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A8rHJA019515
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 11:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HK0Q8aC3LXcnvaq66Cado38s
	e74xEfV882+wZWo0hHQ=; b=kig8GL0qr11q5E5Aj5/wwSFeqxnf4pqQ76GRU8uR
	K6Cpx6DiioPEXFMqgdL7h28bbGEapNJ9TPaud601vGDB/CBmlB3erNTzT9z556TV
	8Xl4MbT4pFS/f7ecH4i0YS+pUrtbcQGG7nhCiVQB8dV7rgqTxh/JkyQT3J2UT/gp
	kFX8CJQ8vj4QOSBuV68vaCVeJ5//HbiQ+0R+upbsEZHXBLOltUdzbu5uBOOHcAHJ
	uuu+6WrqgZJ+tM6aemT5BZKjE2B6EBFXirYOxCXvGOPXBIG4wbiiN4iuSAsNCshE
	gpqd5G6VEmqs28m9WXFrG4S1vaiUPe2jlxLzDlJiPpYgAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4766mchxss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 11:11:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c791987cf6so1020111285a.0
        for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 04:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553908; x=1750158708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HK0Q8aC3LXcnvaq66Cado38se74xEfV882+wZWo0hHQ=;
        b=QVN6yhQ0qYNhWOz6ILi7KPV03e55vfsW02O0LbrA3eamlIy3DLVxCyhbqClVzyRF8u
         RQ81bnB3JyPG5hHFKQ9s5F417v06F/FS/382Jhqy8n0GanEy8ZqVzzwBw1kWolX4hIQ1
         Zomb4dGyEWmUFFHllS40yIYAvofSKa4AZLxdyZWNS2ahjWy6V9F3axaWfzCXvlzJQysP
         iWVOVMb7j8rty5c/bIXWLewbajil73J/zHZwo6Yib/2+CG5HKFj4HnM+y0fYBu0g/aRf
         QxS8QGY9ClbWis/0Qxsrhon1Y8B+w4e0B+6tHMSq3t980wmYpokgsVrxcrIEg4MDGCMS
         Vc1A==
X-Forwarded-Encrypted: i=1; AJvYcCWmwIh1XARFAJeIqO51RK0ouleQaNAQCcrlQS7CVcirQVpclAbtLoU5PVZcVK6s779pHtFaSJjBNHizpg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5X1fwAQgyvTIKyGLNVWL2BueQF3lyinIzGYNFYnFPZ9QMpwD7
	oh3oFCXTT2ZMjTPORSFfGXUhcU7WNkt5MvTxScsdJxXDZtdeM3MaX0r9gwLak7DYsaen1F41fg0
	2WjwPdnxMuTKFkmVZ2HV/SgIvTNsSWCjLCVssPZGiYyww99pEeTI4XvN2GUbC5MWLZvdzcFYV2A
	==
X-Gm-Gg: ASbGncuoIdUsrashHTc9BYHNEr2TRjExIOfRVAqMRcVuALV/mPCcacdO0TL/2xNYSo5
	DvBsN74iq4TVg6YrkKQqGKTk8cXHMklTPsQ5pbL2f3kNJlvGSefEGZI3Mo3RuZvqU01GFsQdXm2
	TXOk3mSit0anZGorAzNOxAw7H57K0M/quBBPKXelMxurwtXI+9NgiS4CJOSaRwUywJeribhvbXA
	Q+poxWqY9p0jCAnox1KRqWD7x06w1afiFpGSBaU+4IWynh1xHTzAlbNwYIrnuHkaBm29UD2PlCz
	FvKBQrbHgoJ6NnQGX9QPC7xY2MxvQekr6Q0shlquiobf6vRKHij1oAbmMgsimGUTEVv37wt1okj
	qJ9abaJwBqXsRXg8HKnslNQ1erTwUARAsBT8=
X-Received: by 2002:a05:620a:440f:b0:7d0:9be4:2d60 with SMTP id af79cd13be357-7d22987e58emr2222428985a.29.1749553908049;
        Tue, 10 Jun 2025 04:11:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb4kfyNuHSaU+T1FQ6VVMu2WzZsjYdsmsGCLkuk82qWqzLkqzTASRPgiH65daVXczZpDmSIQ==
X-Received: by 2002:a05:620a:440f:b0:7d0:9be4:2d60 with SMTP id af79cd13be357-7d22987e58emr2222426885a.29.1749553907729;
        Tue, 10 Jun 2025 04:11:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1ccc9cesm15298411fa.82.2025.06.10.04.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:11:46 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:11:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnect alphabetically
Message-ID: <20250610111145.zp62zx5rjmezvmkb@umbar.lan>
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
X-Authority-Analysis: v=2.4 cv=T8KMT+KQ c=1 sm=1 tr=0 ts=684812f4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=k9-6lplzp057ag9H7OwA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: m4Jd2jSLSATBWzeIJX6BdvVYE_m7CRz3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NiBTYWx0ZWRfX+z6PKbFwEVhy
 Apsn7VbuH/JPhmCY2VBtB0KCPq6r5xVtzOG1rblIyX3PuqPzWeVEc9qxN9j5clzhdSfmZyhBpAA
 +kIKCf4MwGhff87DCyk1KgIfuv+uNE6OODnIdfQupw9HNKpW97zgFI2MMPRT3T8HDBc/rh3PlUr
 wtn3q5vD18oVUhSifVHWp361bvVBe34TNF2n6b1FLRLR478hHirtayZFVoYOoseuE8syPu+2JPN
 nBSE8xmlPYgJEUghVIWOmP/r9YSbOpZkhS9nmEcDMrMpU7n5ToHWmWI7i9BpYrZk6lCk38g78yH
 IIUqyfA5q1Q/OdVEWkuDtCHpn9nzcKLWf51mKuVq0YQse/03/ywe55Ivc/ZY9/ubYC4MpgDjhBo
 CyWwbes7XkPWiGnvTaO480mbS4YhE48ZPV5SSs/BgywNZMN4Dw7Py9X6JVn0xMM+BGMEWTxl
X-Proofpoint-GUID: m4Jd2jSLSATBWzeIJX6BdvVYE_m7CRz3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 phishscore=0
 mlxlogscore=796 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100086

On Tue, Jun 10, 2025 at 11:33:17AM +0300, Vladimir Zapolskiy wrote:
> Sort the entries of interconnect and interconnect-names lists in
> alphabetical order.

This looks like an ABI change. At least you should explain the reason
for the patch.

> 
> Fixes: 2ab7f87a7f4b ("dt-bindings: media: Add qcom,x1e80100-camss")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Another fix on top of https://lore.kernel.org/all/20250502204142.2064496-1-vladimir.zapolskiy@linaro.org/

-- 
With best wishes
Dmitry

