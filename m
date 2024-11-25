Return-Path: <linux-media+bounces-21913-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA69B9D7A61
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 04:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 401F8162325
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 03:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BDBF45003;
	Mon, 25 Nov 2024 03:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J+TEkf1G"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1581A10F9;
	Mon, 25 Nov 2024 03:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732505699; cv=none; b=tWuTQrTqjDl8FKgp3J95ayotHYCb+8hWAb34oMftWoZfWiWLu/Vv947ENRUUzZiRSaRD+vy7wk6Zrme0R3dp+c2qzjJiokizQIfNK9Tn9duOxHZSjBzV9KFHRxV0Gc1p+kyTvHtdKMg4bM42gTkV2dVMWJT5oCpEPsGLrx/m6uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732505699; c=relaxed/simple;
	bh=lcNPI45yomg7IuF4xmV0Xo+nJfMqH+IoJZHEDgOQV9w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DYof1h1WnZhsaOYFxA85W9luJoBCofarwQJVkKobV0oQJ1ZfOaL/U1wlpNP9L6qq4o9WB/Us+Aso2/qRoOnHN5C7A35RYr/U+eGTVxvllhunJtmckqbgYYjoEr09rbGXJuAlt8dDO93Ar5aeMahxx1qtPTDtEQjRX+Rl5XamRQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J+TEkf1G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AP0aKac026862;
	Mon, 25 Nov 2024 03:34:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OpBZt+79+I6qPOzBYNaFBSSziJPoniRcXUvri1ej4og=; b=J+TEkf1GF0ak6o8X
	E6BaHzrd0/6pMbBw1cLTG/VBQQS0q6R7AYbn5KjnwL6ZvMTFsypTr02DoK5POk5O
	v5VtmWezXZoOIi8Gev0Vqt8MmQ/ZPdwbjUaTs2nPaLQVnC3dLtQA9bCySVaVx2qP
	nQueG6RqIfq4Crx59b3w/ZpcD5/DDnAI81apmq36H/XZpPwydU8PgYz2Zo1SWgm/
	LLGJWPMcwUF8r3bmzfCN8y4qp+d7orXz/P3p1gBh7gY0dqbsza0DZP/udm1aexFG
	fg84fE8yW3RwC620aAv7eJWMsJ+rm+mgF89NGtqMySfEXcITMb6hAnuKpT+KzPj4
	wxXy4g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4337tjb5fh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 03:34:53 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP3YqMw018185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 03:34:52 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 24 Nov 2024 19:34:52 -0800
Received: from nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d]) by
 nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d%11]) with mapi id
 15.02.1544.009; Sun, 24 Nov 2024 19:34:51 -0800
From: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
To: "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>
CC: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH 2/2] venus: pm_helpers: Use dev_pm_genpd_set_hwmode to
 switch GDSC mode on V4
Thread-Topic: [PATCH 2/2] venus: pm_helpers: Use dev_pm_genpd_set_hwmode to
 switch GDSC mode on V4
Thread-Index: AQHbPMnJgtkyWgYmaE+y7I5Pm035ZbLDxuAAgAOLjvA=
Date: Mon, 25 Nov 2024 03:34:51 +0000
Message-ID: <ac44b1ef5fa84e1baa2dd11eefb48f4b@quicinc.com>
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
 <20241122-switch_gdsc_mode-v1-2-365f097ecbb0@quicinc.com>
 <2299ec8f-4b80-48ea-96ed-d1eb40998e55@linaro.org>
In-Reply-To: <2299ec8f-4b80-48ea-96ed-d1eb40998e55@linaro.org>
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
X-Proofpoint-GUID: 5-EJcI165nZ1WQSI8aZmFAeuN_JraGrV
X-Proofpoint-ORIG-GUID: 5-EJcI165nZ1WQSI8aZmFAeuN_JraGrV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 bulkscore=0 mlxlogscore=778 adultscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411250028

On Friday, November 22, 2024 8:51 PM, Bryan O'Donoghue wrote:
> On 22/11/2024 10:31, Renjiang Han wrote:
> > -	if (IS_V6(core))
> > +	if (IS_V6(core) || IS_V4(core))

> sdm845 IS_V4()

> The GDSCs for the clock OTOH are


> static struct gdsc vcodec0_gdsc =3D {
>          .gdscr =3D 0x874,
 >         .pd =3D {
 >                .name =3D "vcodec0_gdsc",
 >          },
 >         .cxcs =3D (unsigned int []){ 0x890, 0x930 },
 >         .cxc_count =3D 2,
 >         .flags =3D HW_CTRL | POLL_CFG_GDSCR,
 >         .pwrsts =3D PWRSTS_OFF_ON,
 > };

 > static struct gdsc vcodec1_gdsc =3D {
 >         .gdscr =3D 0x8b4,
  >        .pd =3D {
  >               .name =3D "vcodec1_gdsc",
  >        },
  >       .cxcs =3D (unsigned int []){ 0x8d0, 0x950 },
  >       .cxc_count =3D 2,
  >       .flags =3D HW_CTRL | POLL_CFG_GDSCR,
  >        .pwrsts =3D PWRSTS_OFF_ON,
  >  };

 > I can't see how this series will work on 845.
Thanks for your review. In [PATCH 1/2] clk: qcom: videocc: Use HW_CTRL_TRIG=
GER flag for video GDSC's, the gdsc flag will be changed to HW_CTRL_TRIGGER=
, so the v4 core also needs to use the method of switching GDSC mode like v=
6.


> ---
> bod

Best Regards,
Renjiang

