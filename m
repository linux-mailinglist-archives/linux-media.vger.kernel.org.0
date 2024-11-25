Return-Path: <linux-media+bounces-22019-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C489D88ED
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 16:14:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3926E281CA0
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 15:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EA31B392F;
	Mon, 25 Nov 2024 15:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mnmMtTTp"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71221B3927;
	Mon, 25 Nov 2024 15:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732547679; cv=none; b=LaP03r7nMGkrQfu5snvX5QfVqhMwegmaiEIMtgz5G7fBMJ4LT+SBxdCSojrSOACCR/VbEl+xW2pebBaAXuLugNtyEH5OD1rrXIQsRsfPpoZYl9mrR0JHaKPF8IBRa0rZcT2IHZy5sfMW9PjVzDpeewyZuHE2it2couKM/mPV0sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732547679; c=relaxed/simple;
	bh=IDc3s65VgfufqNNVA8rbj6MGucc1mNxpQg9R06Yd0sw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WeEWSSG9Wxv8hBSA7cvUy3jUti55oEbXx5rpOYXAZix2SYXu3gnN4gZSaYToX3jNcZWm8Ocn0gBHHl0XprJc2JHOUdP7glIHF1TJDNa+t05DnLMmNzbpNao1eIW1RQPscrViB6DJbhyXlWsTh50l42KTNmeE2qTGeQhVC0oCU6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mnmMtTTp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APAt3tr006831;
	Mon, 25 Nov 2024 15:14:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IDc3s65VgfufqNNVA8rbj6MGucc1mNxpQg9R06Yd0sw=; b=mnmMtTTp6dtXIObt
	prBiMtQo7FGuBzgpcgTLjNRtrZRxxoCkPeZBdCb4CcOV2oEey3MvP92VVJOuEPer
	3DfvS4IG94zHO6NSpKSu8oCW9jQcGlEwrXwPcHm55ZmqAD0qXMZUbvx+bogFNE0q
	NolHex9kd0AQPmyeAPMzI2MPxsxyxS+L9MW8vs4gSXPJgDqYrBZu9tXePbliPeZm
	8cSdHtoW6jFT02foDDVABCdzMCkOH4KzFO+CXWr94/uW1TXNFXqMI6Hf4Uz77EzG
	Z1il5ZmIfZZZqFgK7nwxDxL97O63XlgLmHZjpo7/oqVkmNZ6GJJUAmlERt9S+Jdy
	M2gTLA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4336mxd5vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 15:14:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4APFETZr004372
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 15:14:29 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 25 Nov 2024 07:14:28 -0800
Received: from nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d]) by
 nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d%11]) with mapi id
 15.02.1544.009; Mon, 25 Nov 2024 07:14:28 -0800
From: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
To: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>
CC: "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
        "Taniya Das
 (QUIC)" <quic_tdas@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
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
Thread-Index: AQHbPMnHbExtF43Cx0+9GIchxuRRY7LDp7qAgABjjACAAHgMAIAAAygAgALeqPCAASq6gP//jDyw
Date: Mon, 25 Nov 2024 15:14:27 +0000
Message-ID: <7765000a0f87447e98d827dee5977ca7@quicinc.com>
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
 <20241122-switch_gdsc_mode-v1-1-365f097ecbb0@quicinc.com>
 <zhco37pigrp4fh5alqx4xfxx3xhjitqlgw552vwiijka22bt4u@sl4ngzypwh4x>
 <1d9aa2e7-d402-42dc-baa6-155f01b132ca@quicinc.com>
 <23ho25gl3iwyi2jspb6a2x5bv76fco5pkg2x5ct4gu3c44dbiq@yec6evx5sihm>
 <eec92088-edfb-4d0c-b81d-9d4f1d968b20@linaro.org>
 <b411489f9f2441f7a0f936127678e36b@quicinc.com>
 <CAA8EJpqYSujKXPFkdWcqRpOKZ+dJHQDkYM33Mt5JxuA=Mfs+WQ@mail.gmail.com>
In-Reply-To: <CAA8EJpqYSujKXPFkdWcqRpOKZ+dJHQDkYM33Mt5JxuA=Mfs+WQ@mail.gmail.com>
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
X-Proofpoint-ORIG-GUID: OzGxjbSolOr4rvVNv6v92AOpA1bgYvit
X-Proofpoint-GUID: OzGxjbSolOr4rvVNv6v92AOpA1bgYvit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 adultscore=0 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250128

T24gTW9uZGF5LCBOb3ZlbWJlciAyNSwgMjAyNCA5OjU1IFBNLCBEbWl0cnkgQmFyeXNoa292IHdy
b3RlOg0KPiBPbiBNb24sIDI1IE5vdiAyMDI0IGF0IDA3OjMxLCBSZW5qaWFuZyBIYW4gKFFVSUMp
IDxxdWljX3JlbmppYW5nQHF1aWNpbmMuY29tPiB3cm90ZToNCj4gPiBPbiBTYXR1cmRheSwgTm92
ZW1iZXIgMjMsIDIwMjQgODoxNyBBTSwgQnJ5YW4gTydEb25vZ2h1ZSB3cm90ZToNCj4gPiA+IE9u
IDIzLzExLzIwMjQgMDA6MDUsIERtaXRyeSBCYXJ5c2hrb3Ygd3JvdGU6DQo+ID4gPiA+IFRoaXMg
bGVhdmVzIHNtNzE1MCwgc204MTUwIGFuZCBzbTg0NTAgdW50b3VjaGVkLiBEb24ndCB0aGV5IGFs
c28gDQo+ID4gPiA+IG5lZWQgdG8gdXNlIEhXX0NUUkxfVFJJR0dFUj8NCj4gPg0KPiA+ID4gSSBi
ZWxpZXZlIHRoZSBjb3JyZWN0IGxpc3QgaGVyZSBpcyBhbnl0aGluZyB0aGF0IGlzIEhGSV9WRVJT
SU9OXzRYWCANCj4gPiA+IGluDQo+ID4NCj4gPiA+IFlvdSBjYW4ndCBhcHBseSB0aGUgc2Vjb25k
IHBhdGNoIGluIHRoaXMgc2VyaWVzIHdpdGhvdXQgZW5zdXJpbmcgdGhlIA0KPiA+ID4gY2xvY2sg
Y29udHJvbGxlcnMgZm9yIHNkbTg0NSBhbmQgc203MTgwDQo+ID4NCj4gPiA+IGdyZXAgSEZJX1ZF
UlNJT05fNFhYIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcWNvbS92ZW51cy9jb3JlLmMNCj4gPg0K
PiA+ID4gZHJpdmVycy9jbGsvcWNvbS92aWRlb2NjLXNkbTg0NS5jDQo+ID4gPiBkcml2ZXJzL2Ns
ay9xY29tL3ZpZGVvY2Mtc2M3MTgwLmMNCj4gPg0KPiA+ID4gSG1tLi4gdGhhdCdzIHdoYXQgdGhp
cyBwYXRjaCBkb2VzLCB0byBiZSBmYWlyIG15IG90aGVyIGVtYWlsIHdhcyBmbGlwcGFudC4NCj4g
Pg0KPiA+ID4gVGhpcyBpcyBmaW5lIGluIGdlbmVyYWwsIG9uY2Ugd2UgY2FuIGdldCBzb21lIFRl
c3RlZC1ieTogZm9yIGl0Lg0KPiA+DQo+ID4gPiBUaGF0J3MgbXkgcXVlc3Rpb24gLSB3aGF0IHBs
YXRmb3JtcyBoYXMgdGhpcyBjaGFuZ2UgYmVlbiB0ZXN0ZWQgb24gPw0KPiA+DQo+ID4gPiBJIGNh
biBkbyBzZG04NDUgYnV0LCB3ZSdsbCBuZWVkIHRvIGZpbmQgc29tZW9uZSB3aXRoIDcxODAgdG8g
dmVyaWZ5IElNTy4NCj4gPg0KPiA+IFRoYW5rcyBmb3IgeW91ciBjb21tZW50LiBXZSBoYXZlIHJ1
biB2aWRlbyBjYXNlIHdpdGggdGhlc2UgdHdvIHBhdGNoZXMgb24gc2M3MTgwLiBUaGUgcmVzdWx0
IGlzIGZpbmUuDQoNCj4gQSBzaW5nbGUgY2FzZSwgYSB0aG9yb3VnaCB0ZXN0cywgYSBtaXh0dXJl
IG9mIHN1c3BlbmQmcmVzdW1lIHdoaWxlIHBsYXlpbmcgdmlkZW8gY2FzZXM/DQoNCj4gQWxzbywg
Y2FuIEkgcGxlYXNlIHJlaXRlcmF0ZSBteSBxdWVzdGlvbjogc203MTUwLCBzbTgxNTAgYW5kIHNt
ODQ1MCA/DQo+IFNob3VsZCB0aGV5IGFsc28gYmUgY2hhbmdlZCB0byB1c2UgSFdfQ1RSTF9UUklH
R0VSPw0KPiBOZXh0IHF1ZXN0aW9uLCBzZG02NjAsIG1zbTg5OTYsIG1zbTg5OTg6IGRvIHRoZXkg
c3VwcG9ydCBIV19DVFJMX1RSSUdHRVI/DQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXcuIFRoZSB2
aWRlbyBwbGF5YmFjayBhbmQgcmVjb3JkaW5nIGNhc2VzIGluY2x1ZGUgdmlkZW8NCnBhdXNlIGFu
ZCByZXN1bWUsIGFuZCBmdWxsIHZpZGVvIHBsYXliYWNrLiBUaGUgcmVzdWx0cyBhcmUgZmluZS4N
CkFsc28sIHRoaXMgY2hhbmdlIGlzIG9ubHkgZm9yIHY0IGNvcmUgKEhGSV9WRVJTSU9OXzRYWCAp
LiBUaGVyZWZvcmUsIHdlIGhhdmUgb25seSB0ZXN0ZWQgaXQNCm9uIHBsYXRmb3JtcyB1c2luZyB2
NCBjb3JlLiBXZSBoYXZlIG5vdCB0cmllZCBvdGhlciBwbGF0Zm9ybXMuDQpzbTcxNTAsIHNtODE1
MCBhbmQgc204NDUwIHNob3VsZCBub3QgdXNlIHZlbnVzIHY0IGNvcmUuIFNvIHRoZXkgbmVlZG4n
dCB0byB1c2UgSFdfQ1RSTF9UUklHR0VSLg0KDQpCZXN0IFJlZ2FyZHMsDQpSZW5qaWFuZw0K

