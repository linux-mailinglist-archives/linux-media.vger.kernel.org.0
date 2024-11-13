Return-Path: <linux-media+bounces-21342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4A89C67C6
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 04:23:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67F761F25FA4
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 03:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0A716DEB2;
	Wed, 13 Nov 2024 03:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TCWKlwmx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B682231C;
	Wed, 13 Nov 2024 03:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731468204; cv=none; b=IqvGZlPwvPh6RES9GKJc08+f0Ct8xqnjRYCiywb5tgQxpYU21FciKNTWszSaxsPR5S93cQtKFARFML3C4c0zsb6TZCSvgDOwRJS3zNstVa5d81/jHYY9XzvNXrPy3NErr/DjBZCXT5A+tez4p8W+3RGphjgzu4GPUWeoLACrZpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731468204; c=relaxed/simple;
	bh=1tneCB0lrtWRviJiovN1a0CfYo4kk8aE3R6ZF9tg/Ww=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Wmkrk/584Y+Cc1MmsdxEtXgbmXZAnEchlXEHRBlWzIpr8MvNy30OgV8JWEFkJl+hk0ugnh9uNYqzTKpK7g2qpkylOTiUie31Bawaep+1DoUBXnJt5kWtnvvbeOd31MafZMu8F3JBCugtYRlLs5tQKDsBMYC6qAD1mR3mFJnsmyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TCWKlwmx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMSPYP016376;
	Wed, 13 Nov 2024 03:23:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1tneCB0lrtWRviJiovN1a0CfYo4kk8aE3R6ZF9tg/Ww=; b=TCWKlwmxVY1W0vCj
	USkYbUNm3ny/PYVhJAm68Ex+1tr+LKiYbz4+xpYH4d+jkGrs80lEQv/UIWNJM/P3
	OwUL+C03sHeP5/E3MNKlqg2bIhcmZnGZzc/VNGxKqmQgR0Ye8uwMEAZwUi4AKfXv
	7+7cs8jlkcicAYdbxIU7iaNMfhLA9b7kRbMLLQmJoL93wCOWWbzsKBXwOVCSEn9P
	9R9j+zPnCm7ZZ/QEblZjZe8v1XO9d2Ot/WhqN2UkLi2kxwSM5bEvGX7mGu8xa69d
	izyCAwIde4h7HmPYEsap8d2C1uSxzlTvcBfsKS8f3rPZatQYj457tyVNyoqb0FZp
	CBicdQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v1vfu3gk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 03:23:17 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD3NGKU015622
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 03:23:16 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 19:23:16 -0800
Received: from nalasex01c.na.qualcomm.com ([fe80::dac3:ec8:4ce:6a85]) by
 nalasex01c.na.qualcomm.com ([fe80::dac3:ec8:4ce:6a85%11]) with mapi id
 15.02.1544.009; Tue, 12 Nov 2024 19:23:16 -0800
From: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "bryan.odonoghue@linaro.org"
	<bryan.odonoghue@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "Vikash
 Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
        "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>,
        Stanimir Varbanov
	<stanimir.k.varbanov@gmail.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Subject: RE: [PATCH v2 1/4] dt-bindings: qcom,qcs615-venus: document QCS615
 venus
Thread-Topic: [PATCH v2 1/4] dt-bindings: qcom,qcs615-venus: document QCS615
 venus
Thread-Index: AQHbNPjc6u9OdCowaE+nFUoyTjgZx7K0KVQAgABgmhA=
Date: Wed, 13 Nov 2024 03:23:15 +0000
Message-ID: <1abcb44b418d42b6b5e86fc4b75aad14@quicinc.com>
References: <20241112-add-venus-for-qcs615-v2-0-e67947f957af@quicinc.com>
 <20241112-add-venus-for-qcs615-v2-1-e67947f957af@quicinc.com>
 <173141803295.771794.12897067124135705292.robh@kernel.org>
In-Reply-To: <173141803295.771794.12897067124135705292.robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: robh@kernel.org
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
X-Proofpoint-GUID: LONNOqK6XVFI42cdYLy0dpZL0pgkqIxw
X-Proofpoint-ORIG-GUID: LONNOqK6XVFI42cdYLy0dpZL0pgkqIxw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130028

SGkgQFJvYiBIZXJyaW5nIChBcm0pDQoNClRoYW5rcyBmb3IgeW91ciByZXBseS4NCiJkdC1iaW5k
aW5ncy9jbG9jay9xY29tLHFjczYxNS12aWRlb2NjLmgiIGlzIGFkZGVkIGluIGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDI0MTEwOC1xY3M2MTUtbW0tY2xvY2tjb250cm9sbGVyLXYzLTAt
N2QzYjJkMjM1ZmRmQHF1aWNpbmMuY29tLy4gSSB0aGluayB0aGlzIHBhdGNoIG1heSBub3QgYmUg
aW5jbHVkZWQuDQoNCg0KQmVzdCBSZWdhcmRzLA0KUmVuamlhbmcNCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+IA0K
U2VudDogVHVlc2RheSwgTm92ZW1iZXIgMTIsIDIwMjQgOToyNyBQTQ0KVG86IFJlbmppYW5nIEhh
biAoUVVJQykgPHF1aWNfcmVuamlhbmdAcXVpY2luYy5jb20+DQpDYzogTWF1cm8gQ2FydmFsaG8g
Q2hlaGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+OyBicnlhbi5vZG9ub2dodWVAbGluYXJvLm9yZzsg
S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwub3JnPjsgZGV2aWNldHJlZUB2Z2Vy
Lmtlcm5lbC5vcmc7IEJqb3JuIEFuZGVyc3NvbiA8YW5kZXJzc29uQGtlcm5lbC5vcmc+OyBDb25v
ciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVs
Lm9yZzsgVmlrYXNoIEdhcm9kaWEgKFFVSUMpIDxxdWljX3ZnYXJvZGlhQHF1aWNpbmMuY29tPjsg
bGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOyBTdGFuaW1pciBWYXJiYW5vdiA8c3RhbmltaXIu
ay52YXJiYW5vdkBnbWFpbC5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBLb25y
YWQgRHliY2lvIDxrb25yYWR5YmNpb0BrZXJuZWwub3JnPg0KU3ViamVjdDogUmU6IFtQQVRDSCB2
MiAxLzRdIGR0LWJpbmRpbmdzOiBxY29tLHFjczYxNS12ZW51czogZG9jdW1lbnQgUUNTNjE1IHZl
bnVzDQoNCg0KT24gVHVlLCAxMiBOb3YgMjAyNCAxNzoxNzo1NyArMDUzMCwgUmVuamlhbmcgSGFu
IHdyb3RlOg0KPiBBZGQgc3VwcG9ydCBmb3IgUXVhbGNvbW0gdmlkZW8gYWNjZWxlcmF0aW9uIGhh
cmR3YXJlIHVzZWQgZm9yIHZpZGVvIA0KPiBzdHJlYW0gZGVjb2RpbmcgYW5kIGVuY29kaW5nIG9u
IFFDT00gUUNTNjE1Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUmVuamlhbmcgSGFuIDxxdWljX3Jl
bmppYW5nQHF1aWNpbmMuY29tPg0KPiAtLS0NCj4gIC4uLi9iaW5kaW5ncy9tZWRpYS9xY29tLHFj
czYxNS12ZW51cy55YW1sICAgICAgICAgIHwgMTgxICsrKysrKysrKysrKysrKysrKysrKw0KPiAg
MSBmaWxlIGNoYW5nZWQsIDE4MSBpbnNlcnRpb25zKCspDQo+IA0KDQpNeSBib3QgZm91bmQgZXJy
b3JzIHJ1bm5pbmcgJ21ha2UgZHRfYmluZGluZ19jaGVjaycgb24geW91ciBwYXRjaDoNCg0KeWFt
bGxpbnQgd2FybmluZ3MvZXJyb3JzOg0KDQpkdHNjaGVtYS9kdGMgd2FybmluZ3MvZXJyb3JzOg0K
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL3Fjb20scWNzNjE1LXZlbnVz
LmV4YW1wbGUuZHRzOjI1OjE4OiBmYXRhbCBlcnJvcjogZHQtYmluZGluZ3MvY2xvY2svcWNvbSxx
Y3M2MTUtdmlkZW9jYy5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQogICAyNSB8ICAgICAg
ICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3Fjb20scWNzNjE1LXZpZGVvY2MuaD4NCiAg
ICAgIHwgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fg0KY29tcGlsYXRpb24gdGVybWluYXRlZC4NCm1ha2VbMl06ICoqKiBbc2NyaXB0cy9N
YWtlZmlsZS5kdGJzOjEyOTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L3Fjb20scWNzNjE1LXZlbnVzLmV4YW1wbGUuZHRiXSBFcnJvciAxDQptYWtlWzJdOiAqKiogV2Fp
dGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLg0KbWFrZVsxXTogKioqIFsvYnVpbGRzL3JvYmhl
cnJpbmcvZHQtcmV2aWV3LWNpL2xpbnV4L01ha2VmaWxlOjE0NDI6IGR0X2JpbmRpbmdfY2hlY2td
IEVycm9yIDINCm1ha2U6ICoqKiBbTWFrZWZpbGU6MjI0OiBfX3N1Yi1tYWtlXSBFcnJvciAyDQoN
CmRvYyByZWZlcmVuY2UgZXJyb3JzIChtYWtlIHJlZmNoZWNrZG9jcyk6DQoNClNlZSBodHRwczov
L3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3QvZGV2aWNldHJlZS1iaW5kaW5ncy9wYXRjaC8y
MDI0MTExMi1hZGQtdmVudXMtZm9yLXFjczYxNS12Mi0xLWU2Nzk0N2Y5NTdhZkBxdWljaW5jLmNv
bQ0KDQpUaGUgYmFzZSBmb3IgdGhlIHNlcmllcyBpcyBnZW5lcmFsbHkgdGhlIGxhdGVzdCByYzEu
IEEgZGlmZmVyZW50IGRlcGVuZGVuY3kgc2hvdWxkIGJlIG5vdGVkIGluICp0aGlzKiBwYXRjaC4N
Cg0KSWYgeW91IGFscmVhZHkgcmFuICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIGFuZCBkaWRuJ3Qg
c2VlIHRoZSBhYm92ZSBlcnJvcihzKSwgdGhlbiBtYWtlIHN1cmUgJ3lhbWxsaW50JyBpcyBpbnN0
YWxsZWQgYW5kIGR0LXNjaGVtYSBpcyB1cCB0bw0KZGF0ZToNCg0KcGlwMyBpbnN0YWxsIGR0c2No
ZW1hIC0tdXBncmFkZQ0KDQpQbGVhc2UgY2hlY2sgYW5kIHJlLXN1Ym1pdCBhZnRlciBydW5uaW5n
IHRoZSBhYm92ZSBjb21tYW5kIHlvdXJzZWxmLiBOb3RlIHRoYXQgRFRfU0NIRU1BX0ZJTEVTIGNh
biBiZSBzZXQgdG8geW91ciBzY2hlbWEgZmlsZSB0byBzcGVlZCB1cCBjaGVja2luZyB5b3VyIHNj
aGVtYS4gSG93ZXZlciwgaXQgbXVzdCBiZSB1bnNldCB0byB0ZXN0IGFsbCBleGFtcGxlcyB3aXRo
IHlvdXIgc2NoZW1hLg0KDQo=

