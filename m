Return-Path: <linux-media+bounces-22022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1549D89AA
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 16:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6D9016333E
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 15:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29061B4149;
	Mon, 25 Nov 2024 15:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nqeSHWKC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BDC44C94;
	Mon, 25 Nov 2024 15:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732549781; cv=none; b=oQwWBMD+yOLE+q59x1eIkJyJXq/rZaGHH7m1Cn06sYGuFH7ZdLqB65NAqfkqCFsRKHGcrCA6LUXwLWcNOu5z41a/5ZUj4oNSoR1eL7a1dMg7JgNMdSmxQo5ICcFbgsOgCgUefMB/HTtB5PE+31kjfeE4h2I9P/O9VHzegoGvqEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732549781; c=relaxed/simple;
	bh=BagwbimB9mVeZIN+ux/kKsFB52R0ap/BIYaUJgjIASM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UP7wuQ7XPfcqtgK7dmO1hg2KZSMMh8sl6JbtBAKdkOMYnFpzt+0A3zLGrKEu8pw6AqUrJ5Qx38JCs13ccZ916jp2JBQXlvp2mQSfNlDqVwQkb2LWskj4aGibTxsNN9OIi+pKFR4ahQClbK2bfk5RigYC5H/yuCQBTfNl3/1mXYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nqeSHWKC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4APBML6p014123;
	Mon, 25 Nov 2024 15:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BagwbimB9mVeZIN+ux/kKsFB52R0ap/BIYaUJgjIASM=; b=nqeSHWKCRQY/zgP1
	g3ZjyvDxN0uS2glMM0Aw/mfOUFRINK/5BWY9E5MKwAXg9OxjvkTQXto7ScArCgjz
	8AMKGO7OLxVLFAVxLxCmp6Rcmc5b2sesLjI9HuGvs+p59rDCd7hOg46W97oQC8sj
	wcSmgR6PvljHXC63Couiul/svo3vm/FXQMPw4RA1wTz6OeSNXUDfC2rlmBxFTRxo
	n53imkwtwwfSMHQqJhTATKQADz6EJ+NhLFzvYEOe8UAj2hFYaN09fhRUoCc/7gM4
	rPtTZaRs2toKxWqk6avy7lDO1Z6MCgqdqT7zR2pcHw62qdsZh3+ZihaCtKNg9/4T
	V0kz6Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4334dmwkau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 15:49:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4APFnWQQ002921
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 15:49:32 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 25 Nov 2024 07:49:31 -0800
Received: from nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d]) by
 nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d%11]) with mapi id
 15.02.1544.009; Mon, 25 Nov 2024 07:49:31 -0800
From: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        "Vikash Garodia (QUIC)"
	<quic_vgarodia@quicinc.com>,
        "bryan.odonoghue@linaro.org"
	<bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rob Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad Dybcio" <konradybcio@kernel.org>,
        "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 1/4] dt-bindings: qcom,qcs615-venus: add support for
 video hardware
Thread-Topic: [PATCH v3 1/4] dt-bindings: qcom,qcs615-venus: add support for
 video hardware
Thread-Index: AQHbPvvNBcmhQ7jCvUeLTdcFK605vrLIJWyA///8ehA=
Date: Mon, 25 Nov 2024 15:49:31 +0000
Message-ID: <18cc654b4377463e8783de0b4659a27d@quicinc.com>
References: <20241125-add-venus-for-qcs615-v3-0-5a376b97a68e@quicinc.com>
 <20241125-add-venus-for-qcs615-v3-1-5a376b97a68e@quicinc.com>
 <jovwobfcbc344eqrcgxeaxlz2mzgolxqaldvxzmvp5p3rxj3se@fudhzbx5hf2e>
In-Reply-To: <jovwobfcbc344eqrcgxeaxlz2mzgolxqaldvxzmvp5p3rxj3se@fudhzbx5hf2e>
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
X-Proofpoint-GUID: 1XYZDBYywCo-kjBS4jw64C43yQQiHrpT
X-Proofpoint-ORIG-GUID: 1XYZDBYywCo-kjBS4jw64C43yQQiHrpT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411250132

T24gTW9uIDExLzI1LzIwMjQgMzo1MCBQTSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4g
T24gTW9uLCBOb3YgMjUsIDIwMjQgYXQgMTE6MDQ6NDlBTSArMDUzMCwgUmVuamlhbmcgSGFuIHdy
b3RlOg0KPiA+IEFkZCBzdXBwb3J0IGZvciBRdWFsY29tbSB2aWRlbyBhY2NlbGVyYXRpb24gaGFy
ZHdhcmUgdXNlZCBmb3IgdmlkZW8gDQo+ID4gc3RyZWFtIGRlY29kaW5nIGFuZCBlbmNvZGluZyBv
biBRQ09NIFFDUzYxNS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBSZW5qaWFuZyBIYW4gPHF1
aWNfcmVuamlhbmdAcXVpY2luYy5jb20+ID4NCj4gPiAtLS0NCj4gPiAgLi4uL2JpbmRpbmdzL21l
ZGlhL3Fjb20scWNzNjE1LXZlbnVzLnlhbWwgICAgICAgICAgfCAxODIgKysrKysrKysrKysrKysr
KysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxODIgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+
IGRpZmYgLS1naXQgDQo+ID4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVk
aWEvcWNvbSxxY3M2MTUtdmVudXMueWFtbCANCj4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9tZWRpYS9xY29tLHFjczYxNS12ZW51cy55YW1sDQoNCj4gRGVwZW5kZW5jeSBm
b3IgdGhpcyBwYXRjaCBtdXN0IGJlIG1lbnRpb25lZCBoZXJlLg0KDQo+IEFtb3VudCBvZiBkZXBl
bmRlbmNpZXMgbWFrZSBpdCB1bm1lcmdlYWJsZSBhbmQgdW50ZXN0ZWFibGUuDQo+IEkgc3VnZ2Vz
dCBkZWNvdXBsaW5nIGRlcGVuZGVuY2llcyBieSByZW1vdmluZyBjbG9jayBjb25zdGFudHMuDQoN
ClRoYW5rcyBmb3IgeW91ciBjb21tZW50LCBJIHdpbGwgdHJ5IHRvIHJlbW92ZSB0aGUgY2xvY2sg
Y29uc3RhbnRzDQphbmQgdXNlIGNsb2NrIGlkIGluc3RlYWQuDQoNCj4gPiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPiA+IGluZGV4IA0KPiA+IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAuLjdhM2EwMWZmMDZkOGI2MmJjMjQyNGEwYTI0ODUNCj4gPiA3Yzg2YzY4NjVmODkN
Cj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21lZGlhL3Fjb20scWNzNjE1LXZlbnVzLnlhbWwNCj4gPiBAQCAtMCwwICsxLDE4MiBA
QA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1
c2UpICVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
c2NoZW1hcy9tZWRpYS9xY29tLHFjczYxNS12ZW51cy55YW1sIw0KPiA+ICskc2NoZW1hOiBodHRw
Oi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4gPiArDQo+ID4gK3Rp
dGxlOiBRdWFsY29tbSBRQ1M2MTUgVmVudXMgdmlkZW8gZW5jb2RlIGFuZCBkZWNvZGUgYWNjZWxl
cmF0b3JzDQo+ID4gKw0KPiA+ICttYWludGFpbmVyczoNCj4gPiArICAtIFN0YW5pbWlyIFZhcmJh
bm92IDxzdGFuaW1pci5rLnZhcmJhbm92QGdtYWlsLmNvbT4gPg0KPiA+ICsgIC0gVmlrYXNoIEdh
cm9kaWEgPHF1aWNfdmdhcm9kaWFAcXVpY2luYy5jb20+ID4NCj4gPiArDQo+ID4gK2Rlc2NyaXB0
aW9uOg0KPiA+ICsgIFRoZSBWZW51cyBJUCBpcyBhIHZpZGVvIGVuY29kZSBhbmQgZGVjb2RlIGFj
Y2VsZXJhdG9yIHByZXNlbnQNCj4gPiArICBvbiBRdWFsY29tbSBwbGF0Zm9ybXMNCj4gPiArDQo+
ID4gK2FsbE9mOg0KPiA+ICsgIC0gJHJlZjogcWNvbSx2ZW51cy1jb21tb24ueWFtbCMNCj4gPiAr
DQo+ID4gK3Byb3BlcnRpZXM6DQo+ID4gKyAgY29tcGF0aWJsZToNCj4gPiArICAgIGNvbnN0OiBx
Y29tLHFjczYxNS12ZW51cw0KPiA+ICsNCj4gPiArICBwb3dlci1kb21haW5zOg0KPiA+ICsgICAg
bWluSXRlbXM6IDINCj4gPiArICAgIG1heEl0ZW1zOiAzDQo+ID4gKw0KPiA+ICsgIHBvd2VyLWRv
bWFpbi1uYW1lczoNCj4gPiArICAgIG1pbkl0ZW1zOiAyDQo+ID4gKyAgICBpdGVtczoNCj4gPiAr
ICAgICAgLSBjb25zdDogdmVudXMNCj4gPiArICAgICAgLSBjb25zdDogdmNvZGVjMA0KPiA+ICsg
ICAgICAtIGNvbnN0OiBjeA0KPiA+ICsNCj4gPiArICBjbG9ja3M6DQo+ID4gKyAgICBtYXhJdGVt
czogNQ0KPiA+ICsNCj4gPiArICBjbG9jay1uYW1lczoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsg
ICAgICAtIGNvbnN0OiBjb3JlDQo+ID4gKyAgICAgIC0gY29uc3Q6IGlmYWNlDQo+ID4gKyAgICAg
IC0gY29uc3Q6IGJ1cw0KPiA+ICsgICAgICAtIGNvbnN0OiB2Y29kZWMwX2NvcmUNCj4gPiArICAg
ICAgLSBjb25zdDogdmNvZGVjMF9idXMNCj4gPiArDQo+ID4gKyAgaW9tbXVzOg0KPiA+ICsgICAg
bWF4SXRlbXM6IDENCj4gPiArDQo+ID4gKyAgbWVtb3J5LXJlZ2lvbjoNCj4gPiArICAgIG1heEl0
ZW1zOiAxDQo+ID4gKw0KPiA+ICsgIGludGVyY29ubmVjdHM6DQo+ID4gKyAgICBtYXhJdGVtczog
Mg0KPiA+ICsNCj4gPiArICBpbnRlcmNvbm5lY3QtbmFtZXM6DQo+ID4gKyAgICBpdGVtczoNCj4g
PiArICAgICAgLSBjb25zdDogdmlkZW8tbWVtDQo+ID4gKyAgICAgIC0gY29uc3Q6IGNwdS1jZmcN
Cj4gPiArDQo+ID4gKyAgb3BlcmF0aW5nLXBvaW50cy12MjogdHJ1ZQ0KPiA+ICsNCj4gPiArICBv
cHAtdGFibGU6DQo+ID4gKyAgICB0eXBlOiBvYmplY3QNCj4gPiArDQo+ID4gKyAgdmlkZW8tZGVj
b2RlcjoNCj4gPiArICAgIHR5cGU6IG9iamVjdA0KPiA+ICsNCj4gPiArICAgIGFkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiArICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAg
IGNvbXBhdGlibGU6DQo+ID4gKyAgICAgICAgY29uc3Q6IHZlbnVzLWRlY29kZXINCj4gPiArDQo+
ID4gKyAgICByZXF1aXJlZDoNCj4gPiArICAgICAgLSBjb21wYXRpYmxlDQo+ID4gKw0KPiA+ICsg
IHZpZGVvLWVuY29kZXI6DQo+ID4gKyAgICB0eXBlOiBvYmplY3QNCg0KPiBCb3RoIG5vZGVzIGFy
ZSB1c2VsZXNzIC0gbm8gcmVzb3VyY2VzIGhlcmUsIG5vdGhpbmcgdG8gY29udHJvbC4NCj4gRG8g
bm90IGFkZCBub2RlcyBqdXN0IHRvIGluc3RhbnRpYXRlIExpbnV4IGRyaXZlcnMuIERyb3AgdGhl
bS4NCkRvIHlvdSBtZWFuIEkgc2hvdWxkIHJlbW92ZSB2aWRlby1kZWNvZGVyIGFuZCB2aWRlby1l
bmNvZGVyIGZyb20gaGVyZT8NCklmIHNvLCBkbyBJIGFsc28gbmVlZCB0byByZW1vdmUgdGhlc2Ug
dHdvIG5vZGVzIGZyb20gdGhlIGR0c2kgZmlsZSBhbmQgYWRkDQp0aGVtIGluIHRoZSBxY3M2MTUt
cmlkZS5kdHMgZmlsZT8NCg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0K

