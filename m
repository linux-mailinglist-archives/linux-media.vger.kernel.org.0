Return-Path: <linux-media+bounces-21962-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AA59D8335
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 11:14:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86D1E28CBD2
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 10:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 870B8193434;
	Mon, 25 Nov 2024 10:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jjBST2s5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3A9190692;
	Mon, 25 Nov 2024 10:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732529630; cv=none; b=D/AnjT/w//+AgUWgvbIeXAWe7pd1ARHnBq3chDPVymZy9PErCEo7gKrHRCbQdQtYHKdJcUJwsWjFpNPEXBV05LSzhQ3OCs4G4THqozeGOUsp662tUU1oUmFmvoObcRJ8RpTb3R9HOVakYWgcbRmNMXi0ds01t8qPHqPdbw5j62o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732529630; c=relaxed/simple;
	bh=FL1Xtx4bsLEhMt9psLVFQieYZHh55oVV4re7iSg1qTs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tx3nFMYutmw4Of9x5ZH1oSEvwn2GtEjbYTzjVS8MOcsM47qJUMYEfFORo6auqe3K5pEBQZB+4oA1BgQDLr6e7Y7W0S1QGI0hDF6/P6TAp60u/4ypR5MCYeMXytXTzT94W5zM4T/mfWyemfkWdsff3Lq9739XtRz2s8pQBcoslos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jjBST2s5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AOKeosm004853;
	Mon, 25 Nov 2024 10:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FL1Xtx4bsLEhMt9psLVFQieYZHh55oVV4re7iSg1qTs=; b=jjBST2s5SrHm6xBl
	KuStHG4o83IC0jgipN8BbWrSzM+bEsrtaZ+oR0hcnXdBTi8U2aiRtvKpvYa4HlgW
	AyhDFluubTLEaHt6PFkxUF6pU9LlCG/Pyg9ejSYMMUq5OJgmlauRfQQBx41X0uCg
	GnqqaIpdpqHGI6RyYKN/Dc4MJNQ+0BVZF7oTUvCN/Jpukv4TgWMWFDwn15Ssh4ML
	BmsVh0+5KmzU3nDnwQbZ0IqQYZEpUUHBKSHy3u7iudCrPDJp8yLUehoL8DiTQ5Uk
	a5RkjorBOAK9/9DNBFiM1VvKDgwF6F3oBL3p3DklrKXUign1jirz1qiJ/R/F+zh8
	Jxxdfw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 433626ca41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 10:13:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4APADhjf028407
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Nov 2024 10:13:43 GMT
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 25 Nov 2024 02:13:42 -0800
Received: from nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d]) by
 nalasex01c.na.qualcomm.com ([fe80::5da8:4d0f:c16a:a1d%11]) with mapi id
 15.02.1544.009; Mon, 25 Nov 2024 02:13:42 -0800
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
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Taniya Das
 (QUIC)" <quic_tdas@quicinc.com>
Subject: RE: [PATCH 0/2] Use APIs in gdsc genpd to switch gdsc mode for venus
 v4 core
Thread-Topic: [PATCH 0/2] Use APIs in gdsc genpd to switch gdsc mode for venus
 v4 core
Thread-Index: AQHbPMnFuhcs0/Hoi02bEw0vEs1J7rLEhxwAgALQD9CAAPA8gP//ffFA
Date: Mon, 25 Nov 2024 10:13:42 +0000
Message-ID: <c82b5395b35a4d13a05f3826243070e0@quicinc.com>
References: <20241122-switch_gdsc_mode-v1-0-365f097ecbb0@quicinc.com>
 <f7c31279-8492-484c-94c4-893d98f53afb@linaro.org>
 <2212eace0ed44c439da117fb05f2b1db@quicinc.com>
 <970a37f0-ccb4-4c23-972f-4100cb6c4e81@linaro.org>
In-Reply-To: <970a37f0-ccb4-4c23-972f-4100cb6c4e81@linaro.org>
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
X-Proofpoint-GUID: 3UsuNXl0orZiNfae8AET-Enpy3M7XSFF
X-Proofpoint-ORIG-GUID: 3UsuNXl0orZiNfae8AET-Enpy3M7XSFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=573
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411250087

T24gTW9uZGF5LCBOb3ZlbWJlciAyNSwgMjAyNCA1OjM2IFBNLCBCcnlhbiBPJ0Rvbm9naHVlIHdy
b3RlOg0KPiBPbiAyNS8xMS8yMDI0IDAzOjQ5LCBSZW5qaWFuZyBIYW4gKFFVSUMpIHdyb3RlOg0K
PiA+ID4gPiBXaGF0IGhlbHAgZG8geW91IG5lZWQgPw0KPiA+IFNpbmNlIHRoZSBHRFNDIGZsYWcg
aGFzIGJlZW4gY2hhbmdlZCB0byBIV19DVFJMX1RSSUdHRVIsIHRoZSB2NCBjb3JlIA0KPiA+IG5l
ZWRzIHRvIHVzZSBkZXZfcG1fZ2VucGRfc2V0X2h3bW9kZSB0byBzd2l0Y2ggdGhlIEdEU0MgbW9k
ZSBsaWtlIHY2LiANCj4gPiBUaGUgdmlkZW8gY29kZWMgaGFzIGJlZW4gdmVyaWZpZWQgb24gU0M3
MTgwIGFuZCB0aGUgcmVzdWx0IGlzIE9LLiBUaGUgDQo+ID4gc2FtZSB2ZXJpZmljYXRpb24gaGFz
IGJlZW4gZG9uZSBvbiB0aGUgbGF0ZXN0IFFDUzYxNSBhbmQgdGhlIHJlc3VsdCBpcyBhbHNvIE9L
Lg0KPiA+IEluIGFkZGl0aW9uLCBzaW5jZSB0aGUgdmlkZW9jYyBvZiBRQ1M2MTUgdXNlcyB0aGUg
SFdfQ1RSTF9UUklHR0VSIA0KPiA+IGZsYWcsIFFDUzYxNSBhbmQNCj4gPiBTQzcxODAgYm90aCB1
c2UgdGhlIHY0IGNvcmUgaW4gdmVudXMuIFNvIHRoZSB2NCBjb3JlIG5lZWRzIHRvIHVzZSANCj4g
PiBkZXZfcG1fZ2VucGRfc2V0X2h3bW9kZSB0byBzd2l0Y2ggdGhlIEdEU0MgbW9kZSBsaWtlIHY2
Lg0KDQo+IEkgdGhpbmsgeW91IG5lZWQgdGhpcyB0ZXN0ZWQgb24gc2RtODQ1Lg0KDQo+IEkgY2Fu
IGRvIHRoYXQgZm9yIHlvdS4NClRoYW5rcyBmb3IgeW91ciByZXBseS4gWWVzLCB3ZSBuZWVkIHRv
IHRlc3Qgb24gc2RtODQ1LiBQbGVhc2UgaGVscCBydW4gdGhlc2UgdHdvIGNoYW5nZXMgb24gc2Rt
ODQ1LiBUaGFua3MgZm9yIHlvdXIgaGVscCBhZ2Fpbi4NCj4gLS0tDQo+IGJvZA0K

