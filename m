Return-Path: <linux-media+bounces-43979-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C0EBC5E78
	for <lists+linux-media@lfdr.de>; Wed, 08 Oct 2025 17:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E2D1E4FB78D
	for <lists+linux-media@lfdr.de>; Wed,  8 Oct 2025 15:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8652BE021;
	Wed,  8 Oct 2025 15:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzELlqbt"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C8229BDAA
	for <linux-media@vger.kernel.org>; Wed,  8 Oct 2025 15:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759938709; cv=none; b=stmG74cIipzo5hTdbmWlv88sQ7Lgi65nN5MBN9+dvnZWShgicydfDZMldG4+NtvIUTwwt18teU930XdXQSlDSa8cANt0MPo3p0ipkw0HgdSKvFMVvwdGamRFW4whrBxpFhrSEyhrc/rfFR9+ZvdGJxFAJwAVvHb2e738a95FjO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759938709; c=relaxed/simple;
	bh=eyxcEGk5La7pCXllukSF0zv12uqJ+J81tlCMdMokhAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqQVCxXmqfDlN3sA+T8SzV1Z7uFejhloFkyo5cQ0JeGDO/W9XdNiR7eg2NtYURMtpkRtJqoYUQWhj3kHa/Si5LwoJaZasSeip8Qs2kmJzmeNs0PZ9kYwMnnJexiRGegP1+rx4cQZrgDvknAIj+fkEjDRyRwVK5HiAMzf8RSVxKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzELlqbt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890pdh014580
	for <linux-media@vger.kernel.org>; Wed, 8 Oct 2025 15:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RcwrCuhkeTvKEu0J3KBAezZB
	eXuc0UhImZ4vhS6DyQ4=; b=UzELlqbtZYwto0rau/q/lK+qg/21eXHcVNBzrFuQ
	2ejLtnv2+C/y0UbHKw/2Bc2ly2P3LFwMybj/jfAdi8XKOY1qQfZqwrCSMjXu4hwg
	QtHSjjjRFd0PtEfH8uWw2Kb9RPUJ2HxW0IxFppa9IWw36UeNlKfDTyUb1HpRGvct
	kEzTQuaZouTPrNZDXijQ35HdyezC6ZDZgjBXgIDwAm8lGSHfuB1qNADAZXPRJuWo
	qosmi6+hEFQ6BSg+sNiAoUQQVKZX/6G2T03CW9pYTNDg60F2yi56f1GgcRm0cQLu
	3dUnGELxdBEnqRF+McrBiEzTd2DDHKF7VBzzciNU8/n1UQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49mgd0puyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 15:51:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4de2c597a6eso280879071cf.1
        for <linux-media@vger.kernel.org>; Wed, 08 Oct 2025 08:51:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938705; x=1760543505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RcwrCuhkeTvKEu0J3KBAezZBeXuc0UhImZ4vhS6DyQ4=;
        b=mjsZpbjEvsLv5qCcjrGqSt355DvyodNPcqvHxGps1gav0NPoL4aoummBB5rIfCaZdh
         2lkRgx29NIsw6DZcuxqq78lyoyFxFX05Q5UST1TkrI3qVQRRAU+z0Y+OqFxNJu4sXiyH
         N9grjXdIiBJUJAb7kSMZRj7r8dHaBs77l/VG6bnsnuANTSBDAilJbCWGyp/HdKcK/1aK
         oy58wVxPpYkEsLTnmn+g6l51JGQZmVzpAPUVRvcEWW33m6Uaed+7KONSHknrFm3xpCqm
         S42ldPTFnFWJ3xQw30WbeqeiSyyj86w/gPwuat/L3aJAn8YQa76hEYbhTJ7UUQY4cD/0
         XfQw==
X-Forwarded-Encrypted: i=1; AJvYcCUJhmokuPx9p+PaNTrZo/EAs81zryZXrH7yJNudMrxCVe6ywAvOLQclZJMNuJXWkyjggQ+GW5N38XCZsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE+UrUhkEm9zMPwzSM59D+froBV4E3wRyci/+1VVzyLUym6r+Y
	/5pmnTLVr7kJ5Fj4QMlja5NDXM0km1E04FGxymqgM+6qCX0nDorPYru+pJ0YsCkg61IqYrW/6sw
	9+oq4mvhpZGabtnjAe5r+8P8um0uEqL8L1gEo8ybKITjQoYztzPRG3sskNoa+nz/0YQ==
X-Gm-Gg: ASbGncunznX3Mf8Ntaun/AnldHzf/CcTcDrGSzmam7F/Z0Q05Dr9foXHcilVHN3loqM
	eqyYykD2YcoN4zO4KSKOdw+SKYWWTHWA6+neSSnwxIbdf0g7B+8RgB430hfSoCtVMZVgKhNuy3G
	/ljK2udi99Jqzj56xTjsGXsEV1vgtayn/BbFPxwg91nv0CnNCb8CwETGyLEVAXHDhBwiL2xVYBj
	2HkMKXXGhcQHyB5DK2XfUU2nE4mw5nUB48c2gBDtABTTvwtt5a8AwlKOkHpDNQhhaxn6d0siQ25
	GHfYEqdeigGkfDIEOE4H+Nrrux99EpYaBvi19D+lGV2+GdJ3/NE6ff2RR8vS0EWLKgwl3EIzIHh
	jRDtBnIbYRi+D/ZnCj9by1BhhcqMVpmie9FK8F9BRf/4MDPs4MsGWQ3oBUA==
X-Received: by 2002:a05:622a:30a:b0:4e5:c50:54c9 with SMTP id d75a77b69052e-4e6eaccbd6amr57213571cf.14.1759938705310;
        Wed, 08 Oct 2025 08:51:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFz9nJurxqqfXeqyo/dKVySyAMhAg+u4zXN9CPjAveUmFiC40Vh1yMZggNhpP1YkzNwKyeM9g==
X-Received: by 2002:a05:622a:30a:b0:4e5:c50:54c9 with SMTP id d75a77b69052e-4e6eaccbd6amr57213131cf.14.1759938704793;
        Wed, 08 Oct 2025 08:51:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-375f3b8213csm20602691fa.48.2025.10.08.08.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 08:51:43 -0700 (PDT)
Date: Wed, 8 Oct 2025 18:51:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Richard Acayan <mailingradian@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Robert Mader <robert.mader@collabora.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sdm670: remove camss endpoint
 nodes
Message-ID: <tqepksd5rtlbgpih62vmw3n47lwbulkjgg2atcnndtykvnihkr@5464jxsoy2w4>
References: <20250905215516.289998-6-mailingradian@gmail.com>
 <20250905215516.289998-9-mailingradian@gmail.com>
 <95704b74-52e7-4831-bc93-d4d7aa32736f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95704b74-52e7-4831-bc93-d4d7aa32736f@oss.qualcomm.com>
X-Proofpoint-GUID: bcFweBb36OF385tI0o9w1xN0VQK11jsA
X-Authority-Analysis: v=2.4 cv=T8aBjvKQ c=1 sm=1 tr=0 ts=68e68892 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=gJjvgzWfCafZWgNBPEkA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bcFweBb36OF385tI0o9w1xN0VQK11jsA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA2MDEyMyBTYWx0ZWRfXw0eHSrbQEaFw
 ZXd0LctgdD+e8Hc88FgBT1qyVj9M29cQzPtIKEF6WWcTYERXbs9ubWSMXYGwH61J/tXHbZgmIQI
 jBtfP+o2pPJaj4tnHRPFpISjYub9NoyS7jGdyM7+wHV7oT46npR+wQcC3cGofrYG7kNVKgiQGfP
 i/rBHfU9o1V+A9XBJQrRjrdz+UJKQTScIwTHoIadIgbWCpBpAoVv/nWzHwFs9BmE/pJhbaB6uzH
 7JgzWGoxifqzimN8okS42r+XuCbGRQVcm+pg4YFUlOshEoM7bA6teQa24z9HsNJv1ixLKhmg5gf
 daX6FvqOE3TT0QdVcQLDgb0hvWfBbkESIeps5UCwaKvRuu0ZMpeXZaG+HU5m+A1CG653BL+oDjX
 raDI/HzJ2xaIs0JDD3teINLDtP0Z6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510060123

On Wed, Oct 08, 2025 at 12:05:55PM +0200, Konrad Dybcio wrote:
> On 9/5/25 11:55 PM, Richard Acayan wrote:
> > There is no need to add these by default for all of SDM670. Originally,
> > they were added so there could be a label for each port. This is
> > unnecessary if the endpoints are all added in a fixup to the camss node.
> > 
> > Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Link: https://lore.kernel.org/r/488281f6-5e5d-4864-8220-63e2a0b2d7f2@linaro.org
> 
> my comment on that discussion is "????????"
> 
> referring to nodes by label is the least error-prone way

+1. I'd suggest keeping the empty endpoints, unless we have the actual
usecase where are more than one endpoint under the port.

-- 
With best wishes
Dmitry

