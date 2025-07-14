Return-Path: <linux-media+bounces-37721-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6529B04B8C
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 01:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A74D1AA1A93
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 23:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF48228313F;
	Mon, 14 Jul 2025 23:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QZrwIfyp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999AF283121
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 23:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752534050; cv=none; b=sY/15QHHEx0MIgtSZ5vpuA+Q6xrqlAbGOFowLL8/38XYpiWWLlntKZ8aIokD7U+GlQVEvppcO84Ac8u4MjNwj3ulwZukJ/zV95v6HiaH6rt1ocEOlr38AGDd9v1bzPDT1un73pPvcx6sW8ekvEeENN2KE6inM6WJalU+TB6WdW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752534050; c=relaxed/simple;
	bh=e+0Cmmr4F+K/R2UeN2Bly9ROfgx+WBmlS3RH04i8bz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nn5KJJyvFS13IDdiq1ty1rR5cYrq8Ur/vilEuNXYMAWjRjgGWv5hvC3USOyou12f12HBGOf3wBXpg+E6OjUACvtk/b8gtSNJjRnP2IzvRoIsoZvADGJPr33fFKf0YhEjJSpe/99RMDiRJnDStYwEVgo8Xv1727w5PDtWAqckOrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QZrwIfyp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EKWDw4000421
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 23:00:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1NpEqFQILBPEuMCnazZYraXh
	kj5p8G0m5fq3n1OtqTk=; b=QZrwIfypgs2cF/bTIEwT02VNVdPwhEdVQsD2FQmR
	m4B6NfTRZhLE75Fx+uIXpbxxo0bCY9dckW9DLuWYVoSq25QtI3fd/U2N3CQZ714c
	udTF/vgm3Xv5yxrjO9ipCs87hdxZTQpybkCpqgcGQKD0eHn5+gOsoV9GpSwNBCO/
	3FFg5W4MmEXo26yQN7zosVztTe8M8Gz+RMJ5h7TZBZPaHELGfsKVMJxZf8o4QF6p
	qOTb/GDVMlLbNnEiF6rYcg7m4Y8Tz6fiWbBPIPvpMJZYz6Uw5GjphmCuz8fflTVv
	Zcm9UXd8n4FeGiUunpLT8kE6o1q0ma5geqOGhbUaaY4sBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu862bg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 23:00:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7dabc82916cso892860885a.0
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 16:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752534046; x=1753138846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NpEqFQILBPEuMCnazZYraXhkj5p8G0m5fq3n1OtqTk=;
        b=k/gpIX0zMMJ99eqDbAc1ixiikeFvdTHnAQZwIkWyU4ClmY18qQooX8Pxh1bR7cAJ3A
         GPGDIM9tLoRo0pCT77DzC7uYFgq5FiKKimjDmR3Dtvcdbu0q3t430HiehGGtSrqCJutO
         5KIsW3TbYmdPaXn+jmeC2G31hrv2ykGlyie903N4/NgL/k7uC4856TmRPyNFlOxjT5wD
         LYLPOQA1vgkmeGmcnIacK4nD9aQdHpwllE8yQsP9TcfOb8p07qVef1NMzVgnbFKhxp8F
         YSv8mCU64hsAk8DP00ialTen8lrqBKnx68uZ9gUG0VrMeHqRD1JB7zoBqCU9+t5jZGZ+
         GD5A==
X-Forwarded-Encrypted: i=1; AJvYcCXw2ULUmoC3hXSwNUh7Yuv0xBRfOXQiv35LDgpU5vp1gZcgC+4uAIvzOro790OMkMVj+YtqfviPMNU4EA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3PQ4sovxfV6x7AB7Tm26sdvqNg+KX2b1OjnSskdjugorBuiKH
	v3GbmfK/pp4Kpga+XYm3lFTkG89cXX0EBHYqBSs9XhwOA3g+eR7TeMt7KcHkKh5dx8FBezCfi+x
	QcrtlFqsdEHelOpB+63H0VjGZa59/JVJ0C80nna0otixHiW9g2SWy6HHML+xpciqThA==
X-Gm-Gg: ASbGncsW7BJz67dv2ezkbuPFmq9JMYSOqjy4LSKYoUitotLYnsG/W1ScSq/n5ZhSweA
	A4C6OjEQT5Uqg3ODSTGE0ZPp/R4QEqSv+2R2hFJ0+qRuZ5PzpVE23kHm4fuJDKRfIZqccKQa89T
	hypMQcJ9z4lASmx6OeUDoo7HsJzqUbpAtBEeZrJJ2DKmMM9BnY/yjfcc9gQ+V1TSJpklxWRwdJB
	HkobfAT3+dfEf9ev0nZnTXkLUjWJwMncRQ9F9EEJi31qnLXW+F94R+9560jlpjjmyhFEbdegiyj
	3ztThqkBdAWASpKmSqlBs79nhEKqlIH+CeSgSaq2BnYz95wGO0OBBIfySWZIlslej4QclmkdfD9
	M8+Zb0xiW5/EZ796FuPoghDlGBj8R8I485CeboJ5j0dGAw8Sq2HTY
X-Received: by 2002:a05:620a:6545:b0:7e1:f37b:4573 with SMTP id af79cd13be357-7e1f37b49damr780723785a.26.1752534046515;
        Mon, 14 Jul 2025 16:00:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTrO7EpByqKu8tXqsr6N3T4ZtPO2ul3BlN+85hAiFoRktXmd5xVQeQVO/Gb1MOMi6eUoHs0Q==
X-Received: by 2002:a05:620a:6545:b0:7e1:f37b:4573 with SMTP id af79cd13be357-7e1f37b49damr780720485a.26.1752534046086;
        Mon, 14 Jul 2025 16:00:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b79b6esm2082956e87.230.2025.07.14.16.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 16:00:45 -0700 (PDT)
Date: Tue, 15 Jul 2025 02:00:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>, krzk+dt@kernel.org,
        quic_dikshita@quicinc.com, mchehab@kernel.org, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] media: dt-bindings: venus: Add qcm2290 dt schema
Message-ID: <wmbw55r32ep4feu75mlv4mufdnko6s4t257dus2asi2knae5zg@gkxku4sm56rw>
References: <20250626135931.700937-1-jorge.ramirez@oss.qualcomm.com>
 <20250626135931.700937-2-jorge.ramirez@oss.qualcomm.com>
 <76492de3-c200-535a-aa1b-c617ba6146f1@quicinc.com>
 <aGuOMrjfQBNYAjmF@trex>
 <aGuS1X+RfX38krpf@trex>
 <cce7a38c-a90b-4f9d-b1cd-06dfadef2159@linaro.org>
 <aGuXcWpYWWGb8w8i@trex>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGuXcWpYWWGb8w8i@trex>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDE2MCBTYWx0ZWRfX8VFynHPuU2Sx
 gJ9a4Bad0Of/bGEOAbMltXCWIfXmZIIW1VYYI0Xk0JJ2jiNX9RYJ6yuy/D+6Hv/3+3Awq1PgSkf
 HqqKbsVNiQ6jktHIJEDE/OMwximEbGshgVeBPp4DTGE/sS2Syx70kj24rhEPNDNzVweCkoZDj7x
 yTtIrS2jmjWch4vGp7oF7/vhcRWhCljVXEE4aNGAvdZdziOJeZS8T1h9E8onVmmVlvBPvFeRDsN
 yuxDnGXwLO4jfIdAcIK9DkCm79Uyp3WbMX81XpPFAjXd1dpRHMkOS3vyiyYETcVIcLZ4xUH9jNw
 /QActQzm4Oeq2Yaa72PstDl1WgscpKddczUhwcnfUlXUVlrpVgC6lRICahC70c/svM0yx9wJ5lV
 e2LRVlmmzqjKm5zp2W9YLZdlBUkfRxzXQwoqZ3tOxKhmHlOWJ8pkzM4qtce3Nf4SA5cDhy6u
X-Proofpoint-ORIG-GUID: 39MrRFBZO2zCwHmsPCmZc08HwWwtzwY9
X-Proofpoint-GUID: 39MrRFBZO2zCwHmsPCmZc08HwWwtzwY9
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=68758c1f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=QGR8u22Tjq3xk0LboB4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=791 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140160

On Mon, Jul 07, 2025 at 11:46:25AM +0200, Jorge Ramirez wrote:
> On 07/07/25 10:29:56, Bryan O'Donoghue wrote:
> > On 07/07/2025 10:26, Jorge Ramirez wrote:
> > > > > > +    maxItems: 5
> > > > > 2 should be good to support non secure usecases. 5 not needed.
> > > > ok
> > > isnt it better to just leave 5 here - thinking of the future support for
> > > secure buffers - and just update the dts?
> > 
> > It should describe the real capabilities of the hardware, not the expected
> > use-cases.
> >
> 
> then five.

Just list all IOMMUs, if we know how to handle them properly.

> 
> > ---
> > bod

-- 
With best wishes
Dmitry

