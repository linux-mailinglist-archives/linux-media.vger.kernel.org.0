Return-Path: <linux-media+bounces-21950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5EF9D80D3
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 10:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE773162A0B
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 09:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5378190052;
	Mon, 25 Nov 2024 09:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A2CSDU5j"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23C618F2D8;
	Mon, 25 Nov 2024 09:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732525581; cv=none; b=kfVNdrQiTP1np5SpXr4Rrew0+Tv4n2nvfOnewfDy39iyYRERmy18C+Gw8zcO75BZ94z/yQethc/v1oebHvfhrNflUNUfUU1DW+uW7EzmQzy0MEBNiRC9vovHpAdl5nTscu+XM/P7pzm8AMAy+N1txTaOCOoTE0aGOCSL9vuFIAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732525581; c=relaxed/simple;
	bh=P9ZMDlRRm7FABa4QfREkhHCjgnFUH7DacEOVXkfquP4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WXGFkVSqnz+VZuezOcZWt0UGuezQk5C8vwNzMGRtD3nhYFH0bZ5nOz17LG9VyI7ZZ5Lm4v9eg3dA8adqH0krv6yexd7AU+S4Pww4vBnaly3DZwiN3mJ2soWBiaVMO//ckCypKrE8VYF7qLle5Okk/Idmo8kF6ZJ6WrdUnX8E3IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A2CSDU5j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOLuNTY020661;
	Mon, 25 Nov 2024 09:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P9ZMDlRRm7FABa4QfREkhHCjgnFUH7DacEOVXkfquP4=; b=A2CSDU5jF2EGHQvn
	3qfSWbK+PJcl2x1fuNE13h9zhS0M1tOflYVHIU+XWDBFJJwzeuBMIdTbcV7rAg6U
	mFi5KODNGqZo6PD2sLRwn03VP3f/Ty2vthVHhu5IEiQqMuVbFqquKHLqpHaeXSzF
	C7JOS5KQfxmWWvqKYrhDMOZ8kcYpfVakZqVHFmr0ZPtPLfTVWQniEDYwNZzI8S/a
	KbmY2EcznSR3Xdbk5iXy7R473CXuVpQqU5JjNdnsk+dHXcreVZs8wnccFN39DQis
	yXMkM6oFE9r1pDTZTId9smiwPo7QazLEUsb9Ek52woIPehOigSxKazAmawRG6zQn
	phgLzw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4337tjbxrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 09:06:15 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP96FsH026296
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 09:06:15 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 25 Nov 2024 01:06:14 -0800
Received: from nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d]) by
 nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d%11]) with mapi id
 15.02.1544.009; Mon, 25 Nov 2024 01:06:14 -0800
From: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        "Vikash Garodia (QUIC)"
	<quic_vgarodia@quicinc.com>,
        "bryan.odonoghue@linaro.org"
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 2/4] media: venus: core: add qcs615 platform data
Thread-Topic: [PATCH v3 2/4] media: venus: core: add qcs615 platform data
Thread-Index: AQHbPvvPYYY1eWJHr0iQpbQKhF55QLLHqWPggACOroD//3tXQA==
Date: Mon, 25 Nov 2024 09:06:14 +0000
Message-ID: <7646d1f78d25449a87c51a741250705a@quicinc.com>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-2-5a376b97a68e@quicinc.com>
 <3b3cab5c583a41d79acc75dd08ca84d6@quicinc.com>
 <9b37a31e-9de3-4230-8a3a-4ea506ca8d0d@kernel.org>
In-Reply-To: <9b37a31e-9de3-4230-8a3a-4ea506ca8d0d@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ny0APwcuSNB0IdBvy7Hc3fwgcwfvHhfN
X-Proofpoint-ORIG-GUID: Ny0APwcuSNB0IdBvy7Hc3fwgcwfvHhfN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411250077

On Monday, November 25, 2024 4:57 PM, Krzysztof Kozlowski wrote:
> On 25/11/2024 09:44, Renjiang Han (QUIC) wrote:
> > On Monday, November 25, 2024 1:35 PM, Renjiang Han wrote:
> > > Initialize the platform data and enable venus driver probe of QCS615 =
SoC.
> >=20
> > Forgot to add Reviewed-by, next version will add Reviewed-by: Bryan=20
> > O'Donoghue <bryan.odonoghue@linaro.org>

> Please start using b4. You cannot add other people's tag this way - via r=
eply to email.
Thanks for your comment. Next version will be updated with b4.

> Best regards,
> Krzysztof


