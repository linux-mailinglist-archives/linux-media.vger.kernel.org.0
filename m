Return-Path: <linux-media+bounces-13888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DB7911A56
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 07:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27AA01F22233
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 05:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 976E1130A7D;
	Fri, 21 Jun 2024 05:27:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2099.outbound.protection.partner.outlook.cn [139.219.146.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4006563A;
	Fri, 21 Jun 2024 05:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718947627; cv=fail; b=aqZD3M2dRac+UxhDHJXFTRLPAGU4q2olgTTGehuoQVRWgNFhKwuGP8k9GCANLajdw6vrhV5ZQ21AftsKZuLiPIBzBM1uv+DsTg6JxLJk/Rf6+BQmTrTwXo39DdrSiNnGhbK9cIGD9c9E6M/dcG4FEUv8AbvabMYChpeUn86L+/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718947627; c=relaxed/simple;
	bh=UK1EjxogC61HDHqypF0xBfHUOj1u2hrFlpRkLhkRxdU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tbw0u2jbZ0kGnFpDurCjWJZ0rTv0USrRbnpkBcSKCW6LxRaKpqtJLizMgu8PlFD6uZw2Q6RteHXOfN/kXP01TRy5meKHfIaLoTSu0Q/fgoD4XHmaR3uPJixdycaQTR2lkVWIgtQvKbfae6062KYO8H3dHp3tQb9J6PXm1fufbU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xqh00x4sxyeGRn4zkkn5DkniGbtolFcU69foBYsqfi6r/v8fLjDM/Vah3lfjnxxEB4cdShEk8X/8ObGc7xuXfLtW0g8qw/00sfA0MITYcex5bf0WzhJ9P2rzVp6ohmrhYxo5Mts7BZxsXcbIrimW5Yal5Q+I1VUPy02Y2lSCQGGstRnP6ovQRw/pE+rTvnst9GrQLUsy6+uhxDYEK3G5EnN7EcxH2RXoEYYJiWf5eqX5FV07LEwWe+nS+ccwXfBNSEgyqSh3aSVvgPPUxKU3xzibEQwJuoO5qwk/wF53step+jk2rO0MIPQsupMmsPt0dzvPvLe7FK94tRMal0cASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UK1EjxogC61HDHqypF0xBfHUOj1u2hrFlpRkLhkRxdU=;
 b=SfmtVIPS7W5yuoXIpYH3ERPcphlKaPsciXeuPCa5QHKo+Hrqvc3iZURrmqZePy3rSk415iuYJ+BDlW1+Uh1U9tGzqZ0ZdcH7UGzjY0LmnanL/JtFrOJNlur5HnPybytks9keLUvGm/gv2KJVVbHQnyGXqxIFGnF6Tn1aFqU6j53YI5WdIi4cHXxzRiNTAeAeeYcY8/mirhTQqmq2MdBWo/d0vNqcVQxNz8vQ3gm6dvQ9HDLVi6Ix0i6q6uUCST7cn9K/d4hfLAra5QvUn2BexBnh7QPl9/4fz0Uie3abip1evCFeDHSIxPKG1XxYSVOVyBi1g4zj1AbKzC09CRc+GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1158.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.33; Fri, 21 Jun
 2024 01:55:14 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::4d66:ac5e:3903:cdf5]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::4d66:ac5e:3903:cdf5%4])
 with mapi id 15.20.7656.033; Fri, 21 Jun 2024 01:55:14 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Ming Qian <ming.qian@nxp.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, Tomi Valkeinen
	<tomi.valkeinen+renesas@ideasonboard.com>, Mingjia Zhang
	<mingjia.zhang@mediatek.com>, Marvin Lin <milkfafa@gmail.com>
CC: Jack Zhu <jack.zhu@starfivetech.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>
Subject:
 =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggdjQgMTEvMTNdIHN0YWdpbmc6IG1lZGlhOiBzdGFy?=
 =?utf-8?Q?five:_Add_ISP_params_video_device?=
Thread-Topic: [PATCH v4 11/13] staging: media: starfive: Add ISP params video
 device
Thread-Index: AQHahOSdWqK6kryYfkire1/jsFmExrHRC1+AgADlDnA=
Date: Fri, 21 Jun 2024 01:55:13 +0000
Message-ID:
 <ZQ0PR01MB130298ADCD73E4E0E05230C1F2C92@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
References: <20240402100011.13480-1-changhuang.liang@starfivetech.com>
 <20240402100011.13480-12-changhuang.liang@starfivetech.com>
 <d9c511e7-cf5b-449a-8116-bead72580b6d@xs4all.nl>
In-Reply-To: <d9c511e7-cf5b-449a-8116-bead72580b6d@xs4all.nl>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1158:EE_
x-ms-office365-filtering-correlation-id: c664d278-e176-40c5-2d85-08dc9195311d
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230037|7416011|1800799021|366013|41320700010|38070700015|921017;
x-microsoft-antispam-message-info:
 brZiZwbu9XsBN4LfHuytsEewmczBPCBE0U/r7eBMOxRd8rMqsU3eog7Flqfay021bn3itMU3Rf8JAzWN0wgl076L+Wp+ExfBGxUJ/Rent9JUIAbxT0y2DpW7tX96fmDmdGokwnyZ3cUvqVzRFsWv/kxOf/dBX3zgUVoxWWBPOY655I0VvvK/kSkH8pPge7FTIbX3F+gLvKex9sdZS7Xg8XUvI/hwH46nP/veoKqAIMuzU4nwotz9Wc1g2K/xcJsQSz3YoIqCWNX2zcxlrmiOa05l4IYygvIaibrBEXiF8lBhVN1UHftRzyru7K6SL1vlDNvQvxwFaK/3tMGdUkmQxwvZ4f43zxVuRd89MDMWB85973qIKmqczMgTUfyg60Ua2+mWurDh0sRj5MblMt00ZJ6lpb0ffW9W13MKPkHigMfGtkxeTzTSmRP6mM9RpWYNua2kYdTJiaXCFHkbiL2e347OIHtm7yFXJy5wwD9PpekIS2K/4xZVrAzeS0exnzS0+JrStSpIS2698buWbaD3oalpQK/SAW649w7gxJOudsMUu0uiU6ZFUWtMl8Pc7Q0JPhIIALmz6+W+FXHk+7xMg/q0fFw50QqMpaxn7zEBeUKGmPAvlF7r7MtlMTdkgPqCoFbhFP9FI/iGyN0yGH8CKg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230037)(7416011)(1800799021)(366013)(41320700010)(38070700015)(921017);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QlRvTFZzVzYvVEtuNXlDQ3dVSmZUTEkvcjVqTUFuZS8zbC9DeEpjYVhRRnYv?=
 =?utf-8?B?aDVzaGNrbFBlZHpSTUg2ZlgyYlVQaGppRURDTGwzeXNkMjhaOXNJRlYvcE5C?=
 =?utf-8?B?WTh0UFlYdVhHVnQyWXAzYUh1ZkNBZnYvM0lNblFlMERXVkJYUnRXU3FDQktP?=
 =?utf-8?B?TlVuV0dlNGFsTWVOK2kvSW9oWW9obE5uOEkvOTF0YzVkK2Z5dzNmNXpnZzQ5?=
 =?utf-8?B?VldvczdjWS9JZ1p4bWJmSXI2aE50RmFDTndKMThxN3VkdVZBSWdaZTRsMVdL?=
 =?utf-8?B?Z0lvR2JMNnRQc0xzOGJ3TVEvTGdBcEdQNktNNmlDUXVONmlSL3pwQnBlNEI4?=
 =?utf-8?B?eDRYQXRIeDJ6YlQ1aE0vODlXaytiTVpRSjhvb1F5RndpK2MrelRrVE80bk8z?=
 =?utf-8?B?c2JWNW5KVFV6S21VYWRHc3hpSTIvcFRxNWpqWEgvWFlXMXNKYkcrRjdqSis1?=
 =?utf-8?B?WDNxZ25iMmZXamlVcDFjVzg4bHpRM3RaRkRiWk85cVN2U0t6ZktqTk01MFly?=
 =?utf-8?B?R1I5UG9jK1dzNjY1VlMvWHR3UzQ3bmtnV3BsQW5TQlNVN2dGT2gzbUs4b1BT?=
 =?utf-8?B?cFRjN0UzbGNMUE1qNkpKMmRGRHR2Vk03OU9LT282T2pyOFZYWGdKZWtBc0gr?=
 =?utf-8?B?ZHp4aW5zNG5BS25XZUZpak9DQmY0aTgyZkdLVEdBbTVWd2ZrRk5XOXU4Y3BN?=
 =?utf-8?B?b1F5MTJtNGtaenlHTzM2UGNWb1czR3JYUGllaGVqN1hEbWNucVBtY0srNndC?=
 =?utf-8?B?WWVQaU16dDhQbjZ4Q2xkMTdhVFMwVlpPUEpHNWJhRjVmN3RPdjZPWE90SExJ?=
 =?utf-8?B?UzF5MElxYmoxUm9zZ0tDYlJNaktqMWpuQ3NxR0g2K1ZHeWVhbE1uTjh2ZHVT?=
 =?utf-8?B?K3ZaNlF5MStVaDFRdjM2TjZvcVBrRHlWMkMrT2djTXdwUnFXL09Ud3drMzVp?=
 =?utf-8?B?cENPZXo4NEpqSGlrTFRiZmEvUXFBWmdlSTJ3OVlVdEFaRkZEM2VYRlZPTXRk?=
 =?utf-8?B?Ry9iWjJnSGQ4QjJuZXdhZ05nTEFFb0t0T1EyUWlCOEErbEY3L212UklLZGpW?=
 =?utf-8?B?cWFQMHE1QnZrSlJUcWVwSmxCcjJFRjBhWHU4bWl6bmFia2ZOQjAyajlmZTMv?=
 =?utf-8?B?WHg2MHFUUis4aEdUQnRmOHRmMVFqQ3hQN3RhdnVBWmFEQW0wbC8zUFFKVEpN?=
 =?utf-8?B?WUZVRFZuNG9BK2wrVUx4UWxQaDI0TVBWZmlOcHJETG5lN1JPVU55QXQ2ZHo0?=
 =?utf-8?B?UWVnVTRUYlVxT3dvOE5aNzBsd3ZFdUJkMzNMaVZiemxwaU9oWHVZeXZHQjNS?=
 =?utf-8?B?UGtPVFpDZXNacWJrSysyQ0ljc21FeUFpL2JIeFBLamdJMEtlYjJOcUt3VGpm?=
 =?utf-8?B?ampNVmNqeWFZWWVJRU0wVGFTM2xOZXZBUEg0WlZQMkRibjF3MHU0azBvbXRT?=
 =?utf-8?B?WmNTbFlkMUc2Q2IwNXdBVHQwaGdQbzZHRzk1R2tmK1BxNk9WVzFlNFFuaEdF?=
 =?utf-8?B?Y3NrTThnQXlJVFlGYXhLYmd5d1ovSU1HTk9WTHFEZWVTZTlHaWs3Z290MERX?=
 =?utf-8?B?TDkxaC9KRmN0a2RuZmd4cHkvOS8yRkdNWlY4aTV3Q1MyeWg5QkpTYXZKKzY0?=
 =?utf-8?B?aGhBWXoyc1lraExrNnhrRDRSNzk3TC8wZ2ptUVpVcDFWMkJFOVkvMlA0TEZa?=
 =?utf-8?B?RkNJQ2Y0NkF1QTV3Q2JzeGE2MkdHUTRaaGJiUzUrbTZVSTZzQ3liREJQWElB?=
 =?utf-8?B?M3lnWnpBMVBLK2s0cVlmcGVQM2lOTHBDSzZKcm16Sk0wYWUzTDVIbDJHVjhL?=
 =?utf-8?B?Njg5VU5tdVhSZXkxS0I5Q3E1RmlEYkEzZ2dZZEVXZlJtZnY1WHhQeVBEeHRF?=
 =?utf-8?B?ZHoxckdxVzVSeU94UFptWnJiWjBvWFRqWU1IQUkxVUtkTnk4TTJyV0o2d0sz?=
 =?utf-8?B?K1ZWMUZINUdUdkhrTUhUS3gwN3drYU85bXRKSjNEUC9tZWFBSEtrQWlIWlJ2?=
 =?utf-8?B?Ui90ckhHZ05tUnNUeEF1TFRyVnRvaUdjYjExZGhRSkgwcWJ0Qm9FQzhGRll4?=
 =?utf-8?B?NjNBRVh6ZzZtTnR5U3RSbG5jME1salZhUDVFa3hIa0gwbXpPNVZiZUhXV1FI?=
 =?utf-8?B?OHZqOFBxZ0RrZkYvWmIwUExFOExzNkYrL3BSZElKbVU1RkQzMWRFeUQvdFVN?=
 =?utf-8?B?SHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: c664d278-e176-40c5-2d85-08dc9195311d
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 01:55:13.9648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gmEchP/YDac5Y5ThI6Gj8Bcz9KZzFK+JBwa4WIn/JePWAHGpRkeiw8LehTr0WNBNe9Q6aSWF+mNwr4nsy1V43jiopYc9VE3wQ79XzXomIzQoUytvir+jTEMsFkURBPzH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1158

SGksIEhhbnMNCg0KVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLg0KDQpbLi4uXQ0KPiA+ICtzdGF0
aWMgaW50IHN0Zl9pc3BfcGFyYW1zX3F1ZXVlX3NldHVwKHN0cnVjdCB2YjJfcXVldWUgKnEsDQo+
ID4gKwkJCQkgICAgICB1bnNpZ25lZCBpbnQgKm51bV9idWZmZXJzLA0KPiA+ICsJCQkJICAgICAg
dW5zaWduZWQgaW50ICpudW1fcGxhbmVzLA0KPiA+ICsJCQkJICAgICAgdW5zaWduZWQgaW50IHNp
emVzW10sDQo+ID4gKwkJCQkgICAgICBzdHJ1Y3QgZGV2aWNlICphbGxvY19kZXZzW10pIHsNCj4g
DQo+IEFkZDoNCj4gDQo+ICAgICAgICAgaWYgKCpucGxhbmVzKQ0KPiAgICAgICAgICAgICAgICAg
cmV0dXJuIHNpemVzWzBdIDwgc2l6ZW9mKHN0cnVjdCBqaDcxMTBfaXNwX3BhcmFtc19idWZmZXIg
Pw0KPiAtRUlOVkFMIDogMDsNCj4gDQoNCldpbGwgYWRkIHRoaXMuDQoNCj4gPiArCSpudW1fcGxh
bmVzID0gMTsNCj4gPiArCXNpemVzWzBdID0gc2l6ZW9mKHN0cnVjdCBqaDcxMTBfaXNwX3BhcmFt
c19idWZmZXIpOw0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KWy4uLl0N
Cj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCB2NGwyX2ZpbGVfb3BlcmF0aW9ucyBzdGZfaXNwX3Bh
cmFtc19mb3BzID0gew0KPiA+ICsJLm93bmVyICAgICAgICAgID0gVEhJU19NT0RVTEUsDQo+ID4g
KwkudW5sb2NrZWRfaW9jdGwgPSB2aWRlb19pb2N0bDIsDQo+ID4gKwkub3BlbiAgICAgICAgICAg
PSB2NGwyX2ZoX29wZW4sDQo+ID4gKwkucmVsZWFzZSAgICAgICAgPSB2YjJfZm9wX3JlbGVhc2Us
DQo+ID4gKwkucG9sbCAgICAgICAgICAgPSB2YjJfZm9wX3BvbGwsDQo+ID4gKwkubW1hcCAgICAg
ICAgICAgPSB2YjJfZm9wX21tYXAsDQo+ID4gKwkucmVhZCAgICAgICAgICAgPSB2YjJfZm9wX3Jl
YWQsDQo+IA0KPiBUaGlzIGlzbid0IG5lZWRlZCBzaW5jZSBubyByZWFkIHN1cHBvcnQgaXMgaW5k
aWNhdGVkIGluIHEtPmlvX21vZGVzLg0KPiANCg0KV2lsIGRyb3AgcmVhZCBzdXBwb3J0Lg0KDQo+
IE5vdGU6IEkgc2VlIHRoYXQgdGhpcyBpcyBhbHNvIHNldCBpbiBzdGZfdmlkX2ZvcHMsIGJ1dCBp
dCBjYW4gYmUgZHJvcHBlZCB0aGVyZSBhcw0KPiB3ZWxsLiBQbGVhc2UgbWFrZSBhIHNlcGFyYXRl
IHBhdGNoIGZvciB0aGF0IGNoYW5nZS4NCj4gDQoNCldpbGwgYWRkIGEgbmV3IHBhdGNoIGRyb3Ag
cmVhZCBzdXBwb3J0IGluIHN0Zl92aWRfZm9wcy4NCg0KUmVnYXJkcywNCkNoYW5naHVhbmcNCg==

