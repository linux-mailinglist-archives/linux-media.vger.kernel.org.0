Return-Path: <linux-media+bounces-21915-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 493179D7B2D
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 06:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E18E2813B1
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 05:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CFF1157A6C;
	Mon, 25 Nov 2024 05:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pviVoli7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0D02500CC;
	Mon, 25 Nov 2024 05:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732512689; cv=none; b=hzxXVgGfw26p9NoXpQVfaM0JcDEGqUmha52Ga4nUJvMn5yJWsaXcsrjntgo0K+7uMns34x1H6L/WP5up1SrE/u6b/8UBZYSQYfmhs5QbTVIvmWQVZQhftwsloaMBhcn+SjLugvHxC7Lz6DNRppu13ciNeR6Byidx+WI8xduE+Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732512689; c=relaxed/simple;
	bh=sX81iNwF+B7/VwoQHzDY90j+Y00UPtMTVIZ2oDZH/Vo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n2pIYUbi/pa//l77yRdswGjSEotlqFniW47CD9TIzcyJLm75xUovIrS3Lh/Jjzj1lMuAYBiwt66UwNp4xUbAzh8vgW0NtDt5Q0PtejJjn2GRZD0ZlTv0IO2UKwLG2iwSPv7mgTGunls4rQ7UDCTW1k3AUIUW2avHiwTnjYpOutg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pviVoli7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AONb9Go022850;
	Mon, 25 Nov 2024 05:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sX81iNwF+B7/VwoQHzDY90j+Y00UPtMTVIZ2oDZH/Vo=; b=pviVoli7lclgR6V2
	tJ63R0I03t0CgxBtiNmomuygxTUhkx1PYN0YetMqkBqeDgeefOXufWuu1UxzZG6G
	qKz1CDeVZUrJCsJH+oO5J2C5FeiX8CkA/c2Y6bbfMExW8hYTZN+0VdRcFpOguE6A
	smlgYhGvBXdEjMIqYzruY5uXdngzTK78ZFLZLMBDSEGNMoBvmCnYriPygXsfB8Xg
	tfX0ZyR502s18quj3NW/VqT32og84owOBu8ILrWAvw7F2IWXNrpeS+FL2enkhn5J
	t1SvKC0THUo0tEY1c1ft6SBKxV5zfWyqcI8wx7QcRcC6DsFa/hlnvN4CFlY/nybG
	y5YdYQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 433792bf0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 05:31:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AP5VMIS026486
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 05:31:22 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 24 Nov 2024 21:31:22 -0800
Received: from nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d]) by
 nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d%11]) with mapi id
 15.02.1544.009; Sun, 24 Nov 2024 21:31:22 -0800
From: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
To: "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        "Taniya Das
 (QUIC)" <quic_tdas@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        "Vikash Garodia (QUIC)"
	<quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH 1/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
Thread-Topic: [PATCH 1/2] clk: qcom: videocc: Use HW_CTRL_TRIGGER flag for
 video GDSC's
Thread-Index: AQHbPMnHbExtF43Cx0+9GIchxuRRY7LDp7qAgABjjACAAHgMAIAAAygAgALeqPA=
Date: Mon, 25 Nov 2024 05:31:22 +0000
Message-ID: <b411489f9f2441f7a0f936127678e36b@quicinc.com>
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
 <20241122-switch_gdsc_mode-v1-1-365f097ecbb0@quicinc.com>
 <zhco37pigrp4fh5alqx4xfxx3xhjitqlgw552vwiijka22bt4u@sl4ngzypwh4x>
 <1d9aa2e7-d402-42dc-baa6-155f01b132ca@quicinc.com>
 <23ho25gl3iwyi2jspb6a2x5bv76fco5pkg2x5ct4gu3c44dbiq@yec6evx5sihm>
 <eec92088-edfb-4d0c-b81d-9d4f1d968b20@linaro.org>
In-Reply-To: <eec92088-edfb-4d0c-b81d-9d4f1d968b20@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: F8yTw2U3O7PwtVgEQgjILzbml9KWbi2b
X-Proofpoint-GUID: F8yTw2U3O7PwtVgEQgjILzbml9KWbi2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250045

T24gU2F0dXJkYXksIE5vdmVtYmVyIDIzLCAyMDI0IDg6MTcgQU0sIEJyeWFuIE8nRG9ub2dodWUg
d3JvdGU6DQo+IE9uIDIzLzExLzIwMjQgMDA6MDUsIERtaXRyeSBCYXJ5c2hrb3Ygd3JvdGU6DQo+
ID4gVGhpcyBsZWF2ZXMgc203MTUwLCBzbTgxNTAgYW5kIHNtODQ1MCB1bnRvdWNoZWQuIERvbid0
IHRoZXkgYWxzbyBuZWVkIA0KPiA+IHRvIHVzZSBIV19DVFJMX1RSSUdHRVI/DQoNCj4gSSBiZWxp
ZXZlIHRoZSBjb3JyZWN0IGxpc3QgaGVyZSBpcyBhbnl0aGluZyB0aGF0IGlzIEhGSV9WRVJTSU9O
XzRYWCBpbg0KDQo+IFlvdSBjYW4ndCBhcHBseSB0aGUgc2Vjb25kIHBhdGNoIGluIHRoaXMgc2Vy
aWVzIHdpdGhvdXQgZW5zdXJpbmcgdGhlIGNsb2NrIGNvbnRyb2xsZXJzIGZvciBzZG04NDUgYW5k
IHNtNzE4MA0KDQo+IGdyZXAgSEZJX1ZFUlNJT05fNFhYIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
cWNvbS92ZW51cy9jb3JlLmMNCg0KPiBkcml2ZXJzL2Nsay9xY29tL3ZpZGVvY2Mtc2RtODQ1LmMN
Cj4gZHJpdmVycy9jbGsvcWNvbS92aWRlb2NjLXNjNzE4MC5jDQoNCj4gSG1tLi4gdGhhdCdzIHdo
YXQgdGhpcyBwYXRjaCBkb2VzLCB0byBiZSBmYWlyIG15IG90aGVyIGVtYWlsIHdhcyBmbGlwcGFu
dC4NCg0KPiBUaGlzIGlzIGZpbmUgaW4gZ2VuZXJhbCwgb25jZSB3ZSBjYW4gZ2V0IHNvbWUgVGVz
dGVkLWJ5OiBmb3IgaXQuDQoNCj4gVGhhdCdzIG15IHF1ZXN0aW9uIC0gd2hhdCBwbGF0Zm9ybXMg
aGFzIHRoaXMgY2hhbmdlIGJlZW4gdGVzdGVkIG9uID8NCg0KPiBJIGNhbiBkbyBzZG04NDUgYnV0
LCB3ZSdsbCBuZWVkIHRvIGZpbmQgc29tZW9uZSB3aXRoIDcxODAgdG8gdmVyaWZ5IElNTy4NCg0K
VGhhbmtzIGZvciB5b3VyIGNvbW1lbnQuIFdlIGhhdmUgcnVuIHZpZGVvIGNhc2Ugd2l0aCB0aGVz
ZSB0d28gcGF0Y2hlcyBvbiBzYzcxODAuIFRoZSByZXN1bHQgaXMgZmluZS4NCg0KPiAtLS0NCj4g
Ym9kDQo=

