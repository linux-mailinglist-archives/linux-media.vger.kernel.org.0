Return-Path: <linux-media+bounces-35652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C325BAE45D7
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 16:03:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 785AE4472AE
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 13:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9495925393C;
	Mon, 23 Jun 2025 13:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j/XkvTZE"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642F9248F7E
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 13:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686865; cv=none; b=fEH3rIhHDWHDcHJVK5QWDvqjGCDwCHzSxNf1PGnsmsnpO+L6LqjGIkk3mywjZqOs1PcT+m+vDCps83ToFXhgY7/KEh91aifCHUKEIKgHVrM+nCvd0nVtVyJfwU2y1Bye8UP5QmAlMZhrknoAf0WrqpL1/IzadINgJJ6Mta64CnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686865; c=relaxed/simple;
	bh=5UaWLeWfA2H3BSBC8mo1Q1o/t/JITNtEQ6bSv7COgis=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpKnm7BKDKuWCAOEGxtjwJd9A52xIJu0YKQvqA+sFsAoqhA8zVyMl08ZqOl7n3c+8Fc+KMZAdM1+6hOFZ9stUqAKMjzUETmL/dfpIb4iVIzJ3zApzeZ5nw2xto4vEHJ1wNReYlVlC1XJyrJprids5WNHoJPnooiMPJLUGBApwU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j/XkvTZE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9PHnO025930
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 13:54:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rCjSuQgV2k3XZQnVF3MO5kvl
	tLvO2sISxvZYNm/MRjM=; b=j/XkvTZE+OGSvwP6sz7+kVIB//iRCIoX55EIfmRB
	AVZlY879uDe38R+NFHu0cYAWy5ru1/ta7YoroDhvcAkD+m0Y7XbaTyeCSQD/WZ14
	tsBS38BZUqNWImog+z0+4k7CYvX5gQVbXASWWwqJMdIOHzV0N3s5w0kOAme6uimS
	rLVyiGA+y2Sc/jfEv24qjx5iJ42i/kF+bUlzuzEtkUs2aBvTcYeS5nJ7yUc6jp5F
	L4DEkxEP1ZpI3giv9WVX3GTCmIZbqO9S8KsaC4iA/CVix8Bd5UkfrwA2gpW/hHCM
	oF9zinHBGHRgk1a2ScrVjV00/EsijDGnc/VOhI90yP0+Ug==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec263286-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 13:54:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d099c1779dso606604985a.0
        for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 06:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750686856; x=1751291656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCjSuQgV2k3XZQnVF3MO5kvltLvO2sISxvZYNm/MRjM=;
        b=DUcIsvQ1yxTDaalZBuHfhvKfs8oHHdXuM9dObv8ug183ZTQziUp3etHv2omKOE+EAO
         EclaLY/psMCwwZD8Dy2R+VH1UV3jB/TKlNphx8kYJqQObqUz7jPPtk3u6uCVbIBCAEU5
         pyTQ/XI/RL+UQwZjMxiY/dByjYv+zAfbtAeZv425qnEGlZLZ9j1xd7AQFAP8V/mD4Ub4
         KWoKm09Eb2A+UeH1Dl4Q+t4xxurcJCugEgRReD94ih91LMVfGWATI3lCwDI4Cms/+VqZ
         ExVhHcv1q1ta+f//lDL66pSv5rUflsNT4AJg7uqtN0rlLXHmErKe5vh7u3CwWv/d7Icw
         mvug==
X-Forwarded-Encrypted: i=1; AJvYcCWa1Y3alWjRytMR7hOwG2pm2J+EYFJu503tCzkDE86vtaE4QU+K5niGzk3TapE4z5W5v674C8uFEGak3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUgvW653i6NOZhUmYLsrdBhnLh/GILV/Y2ISLywvRLG14z4Van
	pMDvQL+PXwR7QsoaZyiTwpxmFfNo7kQCh31l+q3vLkoO7+ymwh/ZCzCuyo39YfsGfDzsAUvEyvs
	y5dioNBNn5TePQa9+qONDkh1fYj8MAB/GAtLTZbfQz0ZODHN+di7Jouf+uiwS536mrg==
X-Gm-Gg: ASbGncuAf518EWiwDbXGqLZ6WZfH+jXWwjYwMyKhdY6wyj0vRtgSn7vk6ZZRtA3CFVz
	oHoLcoxDmdTMJW4APh4L/X6jA4+JBmWAMpk9/EFZJ0TiBMIRPHnP9ZV81qY1ASEanlQ6/ARt+t4
	93tXDtXel0bMNcVHGCb9KK3Uf/E6RtOY5nycBQP/JjUF2Rykl4fuBL1P8enmRt2arxqnOrUg9b3
	JjDlJ6iNtFbuV2aHumnfuRVpYm/kVpiBzvNq4/pp+2b17qyJ1eBppwPV/hC6tlyCbe4byiHvE5W
	FxWMLwbgz5Qf0DIt5hdBRJcDg99FNn7jN8/bE8uvZFXHJ0EqmyGdUTL2Pg==
X-Received: by 2002:a05:620a:1920:b0:7d3:c5b7:2511 with SMTP id af79cd13be357-7d3f9920e96mr2207550085a.36.1750686855796;
        Mon, 23 Jun 2025 06:54:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9qQcWJAD/t7Ve7pZBwfhZjG7ipvKtwIHDAMc1m8aD0vO6qb0UcAOpl6wYycIHRg7QbyXceQ==
X-Received: by 2002:a05:620a:1920:b0:7d3:c5b7:2511 with SMTP id af79cd13be357-7d3f9920e96mr2207545785a.36.1750686855360;
        Mon, 23 Jun 2025 06:54:15 -0700 (PDT)
Received: from trex (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1187cf0sm9480249f8f.71.2025.06.23.06.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 06:54:14 -0700 (PDT)
From: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>
X-Google-Original-From: Jorge Ramirez <JorgeRamirez-Ortiz>
Date: Mon, 23 Jun 2025 15:54:13 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        quic_vgarodia@quicinc.com, quic_dikshita@quicinc.com,
        bryan.odonoghue@linaro.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/5] media: venus: core: Add qcm2290 DT compatible and
 resource data
Message-ID: <aFlchcdWjh4AvWNr@trex>
References: <20250623105107.3461661-1-jorge.ramirez@oss.qualcomm.com>
 <20250623105107.3461661-5-jorge.ramirez@oss.qualcomm.com>
 <53aee5d3-ac5c-4f6b-aa01-9c2d5060b17e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53aee5d3-ac5c-4f6b-aa01-9c2d5060b17e@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4MiBTYWx0ZWRfXyqqIeGvM3Zc7
 mt3pBwxLj0Ihm9Y3K6tS3NLEkhdLtc/y8Q0Lpvpmlgnn/AXcHC3xi6ZAo+8RaJYpvPggxPSKCAz
 H1/FuM/0djPKtF2J4BHYrM7sVD/BmIU6UaWXaq92Jj4ZF8HXDQWF1pw15IXCoyBaHOA+PQIA7eA
 STjjcHHOALfmjMB8OQ5diDCo2Sdn41VO7KyISVknjPXL8YRXnhJA4b7yK/Ydak1lh9PUpdb0Qrr
 c2PfD6j86QTGvHBUSWc9Ty3uZDN9ge29AGUXYL+Z4bDFvQSI+Wo/k8A4AoeEG9UODULsS+JI6O9
 +Iaj2YoZHyBzJ8ol3PTB5WOk2lYeBbefelM15RY7Y5+iGVFZl/iVKII+5vLFIycKKdrYExAs/tt
 PsAeUuOlSTmv6le5Eh0ePz2yZIUJAOxCOXsW9L+dIDKyUiEnrc7xdc3gf6igx5K3ickVXblO
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=68595c89 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=JM561_q83E0Icr2UghcA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: VBOpX9_LG5iUc15WKzqJWOVIQOMlfgPW
X-Proofpoint-ORIG-GUID: VBOpX9_LG5iUc15WKzqJWOVIQOMlfgPW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=720 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230082

On 23/06/25 13:51:51, Krzysztof Kozlowski wrote:
> On 23/06/2025 12:51, Jorge Ramirez-Ortiz wrote:
> > Add a qcm2290 compatible binding to the venus core.
> > 
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> > Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Wrong order of tags here as well.

but of course, this was not an oversight - I followed what was done in
some other commits (but yeah, I should have remembered not to use past
commits as reference)

> There is a direct example in
> submitting patches, so it is confusing to see something different.
>

yep I remember now when this was pushed 6 years ago (you can find me in
the patch - I was part of some earlier discussion on co-developed. ok
will revisit this doc).

