Return-Path: <linux-media+bounces-21914-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEBF9D7A71
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 04:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E41B162A59
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 03:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CC141A84;
	Mon, 25 Nov 2024 03:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pM7uCdbK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65EE7FD;
	Mon, 25 Nov 2024 03:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732506601; cv=none; b=W2y0XhSAzueNyvNCI9aCmbmfZL/p1vTrTBjoWvECZeqFWRfcI58mPkKXy4V454xhQGai+VYUu+Jn3FsNuQhL2eB/MMqZ2Hxsk1eHfEG8o57YG98E4s8yF3HWn449MMM+3PjWv3Cu+vJqPXtTfgIGBpI2R3qaaw/8NW7I9T6xhj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732506601; c=relaxed/simple;
	bh=yGkrOcQYKfN/Q/cfyq/QHkdJ4b2lQxJIJS6gM76K6hw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EnCt/enOo/8f2yZ1CQdaxCM0A653ceUZy12zEdszJ/GskE3G+qJT7FyMOkkwk0myjN0rsazAV7xG1/dV9xlrr7FV1XMWOJXfAUo3qz0XDp8zo//0RBt2KJlIdHOHBFUIFiHH1j2ygjkyrs0ixWKifBHJiAvBvpAI91JMmZHH4aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pM7uCdbK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOMsbKQ015810;
	Mon, 25 Nov 2024 03:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uvbsf9el7uMW77H3pL6L/UKqOplk12CWDa7RDN1jpdw=; b=pM7uCdbKaGZqb+AM
	pEEsnCti07F5qO6LU6O1BpyFK+atAVIy51C+SWtlVPpt9wj+M3AWNq2ZvLBrFr+D
	aRc6tEi30fPDZ6K6q1yQJWHw50HbY2M32yVwZAXl3LtxBWfya0FrY6eaVHynQ6UN
	WVCXjeSLsQimwXSrRZe/9BzLBrG4kU0fMmrUdqCIg64v2dGinXcissJbP9w3jcX5
	jRGpXhU/3F3pBGtOks/OiW4Ir++E4IE+uxRSo91xr3Sk4L8EFhaWWRx5Or/rXkGa
	kc3h3m82jGpKVbhp3h+MYGVwqSrOoIbmNG84ZwbUDU21GSPgI6+QDcMtkOxAgY2l
	5t75Kw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 433792b8yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 03:49:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP3nrjB023470
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 03:49:53 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 24 Nov 2024 19:49:53 -0800
Received: from nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d]) by
 nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d%11]) with mapi id
 15.02.1544.009; Sun, 24 Nov 2024 19:49:53 -0800
From: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
To: "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
        "Mauro Carvalho
 Chehab" <mchehab@kernel.org>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Taniya Das
 (QUIC)" <quic_tdas@quicinc.com>
Subject: RE: [PATCH 0/2] Use APIs in gdsc genpd to switch gdsc mode for venus
 v4 core
Thread-Topic: [PATCH 0/2] Use APIs in gdsc genpd to switch gdsc mode for venus
 v4 core
Thread-Index: AQHbPMnFuhcs0/Hoi02bEw0vEs1J7rLEhxwAgALQD9A=
Date: Mon, 25 Nov 2024 03:49:53 +0000
Message-ID: <2212eace0ed44c439da117fb05f2b1db@quicinc.com>
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
 <f7c31279-8492-484c-94c4-893d98f53afb@linaro.org>
In-Reply-To: <f7c31279-8492-484c-94c4-893d98f53afb@linaro.org>
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
X-Proofpoint-ORIG-GUID: J-OYa_v6RuDto-3M_0e0Anahkr8saN6V
X-Proofpoint-GUID: J-OYa_v6RuDto-3M_0e0Anahkr8saN6V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=930 clxscore=1015 impostorscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250029

On Saturday, November 23, 2024 8:19 AM, Bryan O'Donoghue wrote:
> On 22/11/2024 10:31, Renjiang Han wrote:
> > The Venus driver requires vcodec GDSC to be ON in SW mode for clock=20
> > operations and move it back to HW mode to gain power benefits.=20
> > Earlier, as there is no interface to switch the GDSC mode from GenPD=20
> > framework, the GDSC is moved to HW control mode as part of GDSC enable=
=20
> > callback and venus driver is writing to its POWER_CONTROL register to=20
> > keep the GDSC ON from SW whereever required. But the POWER_CONTROL=20
> > register addresses are not constant and can vary across the variants.
> >=20
> > Also as per the HW recommendation, the GDSC mode switching needs to be=
=20
> > controlled from respective GDSC register and this is a uniform=20
> > approach across all the targets. Hence use dev_pm_genpd_set_hwmode()=20
> > API which controls GDSC mode switching using its respective GDSC regist=
er.
> >=20
> > Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com> >
> > ---
> > Renjiang Han (1):
> >        venus: pm_helpers: Use dev_pm_genpd_set_hwmode to switch GDSC=20
> > mode on V4
> >=20
> > Taniya Das (1):
> >        clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for video GDSC's
> >=20
> >   drivers/clk/qcom/videocc-sc7180.c              |  2 +-
> >   drivers/clk/qcom/videocc-sdm845.c              |  4 ++--
> >   drivers/media/platform/qcom/venus/pm_helpers.c | 10 +++++-----
> >   3 files changed, 8 insertions(+), 8 deletions(-)
> > ---
> > base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
> > change-id: 20241122-switch_gdsc_mode-b658ea233c2a
> >=20
> > Best regards,

> What's your test strategy here ? What platforms have you tested this on ?

> What help do you need ?
Since the GDSC flag has been changed to HW_CTRL_TRIGGER, the v4 core needs =
to use
dev_pm_genpd_set_hwmode to switch the GDSC mode like v6. The video codec ha=
s
been verified on SC7180 and the result is OK. The same verification has bee=
n done on
the latest QCS615 and the result is also OK.
In addition, since the videocc of QCS615 uses the HW_CTRL_TRIGGER flag, QCS=
615 and
SC7180 both use the v4 core in venus. So the v4 core needs to use
dev_pm_genpd_set_hwmode to switch the GDSC mode like v6.

> ---
> bod

