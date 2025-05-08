Return-Path: <linux-media+bounces-32021-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D86AAF63B
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 11:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38C2B1BC54A7
	for <lists+linux-media@lfdr.de>; Thu,  8 May 2025 09:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B2D23E25B;
	Thu,  8 May 2025 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VVYL2Iad";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="a7jS0GKa"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0D81714AE;
	Thu,  8 May 2025 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746694910; cv=fail; b=AFJkNyq1sRe+xOGNdh12/onEHKKRXbgDrZlzIuhgIUwWdcBUZm0QlSlky7scLYV/R7z47dwF1rW1Ns3fY3TXstSKSxUSl/94Uv6L/WqXxZtSkr3aiG1IsIoijgD/PEgkMzgiLF9uhrkOuM9eBXKhqHdOpw+kF8kEh8+rxuRraXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746694910; c=relaxed/simple;
	bh=EDq1rKM4QrQVdkwQuTYkBtWjfht4uLlDRKWMExR9ygs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fq588yMA/hlWeRNcrX+a2/PKNGWQA3EwRl0KqUXGB47gnTsZu2bnrDQCBlH3YcmYTbwylvZK5dr46Mw6Hn0Z0+N5PeXeAQQ5ENk8R2vuV4UTcV/A9YR5m4u6GFEHmXcMGpV+Q+L6Q4NWpJrfzEVQzPAM2s/52epuhLa6osALSFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=VVYL2Iad; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=a7jS0GKa; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 0e1faf6a2beb11f082f7f7ac98dee637-20250508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=EDq1rKM4QrQVdkwQuTYkBtWjfht4uLlDRKWMExR9ygs=;
	b=VVYL2IadsM6Ycdd1KMkYowjLJX9kBVFSTfM653uaH0WREjRB52FiAtPTsYTQYrAfKctf8FfY0VvyMThWcz46lauhsfbFZpYySEY3tr6Vq8gQV5TLRWoNPtBAJrS4BPiZVB35KUIK+gWfTgN7caysP7kYy/zPJLPYq/xgCPiG938=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:ce1bdbe5-be5b-40e6-84d3-45bf55a75624,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:712a4d51-76c0-4e62-bb75-246dfb0889c6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:99|80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 0e1faf6a2beb11f082f7f7ac98dee637-20250508
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2069026669; Thu, 08 May 2025 17:01:40 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 8 May 2025 17:01:38 +0800
Received: from SEYPR02CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 8 May 2025 17:01:38 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALM/AvTY17rLtFdnPwYThj+95t6nlV3HBBLSy6srFmmbnTNqN4gy3zWYHCfaBIf/Vxk/ix5jGm8oCGtn1e/zgkHrdGprXd9PTYZDKkcC81coa7M7k7jcFPKmQtNeBt+g2GMbo037gteu4mDzYV/D8lcOdjxwRgpk+KLkMx8/Qejnmg4F1ur9iYyERMrk3ldUmLfO9q3+8F3FfebAQpcVRdsEy4b+Gufo1Kws0xw1RLQMg2XaaSPBUHN+qbCumVF0SquGTIUciw2tFEZXErfFn5HWdtb412/Caex8ffif79vBl+Qn4i/+y8IlqUgzcoj3eNUKR09Xgzeh4jnCENLfVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDq1rKM4QrQVdkwQuTYkBtWjfht4uLlDRKWMExR9ygs=;
 b=m7wmBqt4xi03DNmLZ9o5JDuD0q3zGjjN97Sl8FGSKm2+BC6XRf2Yf26TITrRMtP94UChp4IvcuBUb5UeVDbrG4EJlZiunDGMFNI1MaQj+iJR7FT5Qpmwncy6Y5t6xbJg5g+0N3nDySJicjdrQzJq+RZUVX4bDKWN6C/oulBmjKKY0qycta8qEQziL5uXvuVCe4icqCtieLXWpreq5IeZTlMlHm6FeZzopSARKGBwlDfZDZB+1CC1dkl8HSgwB0FVO11yD8xpTE7JgENGJgWF+aPCe/LgrN5gL6XO6cpiiwMhR5RdFtj0LoNV7+iQYq032TFJ/ZN611BUaie78Whw0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDq1rKM4QrQVdkwQuTYkBtWjfht4uLlDRKWMExR9ygs=;
 b=a7jS0GKaduanM1gRrUf0V/zQn3wLmK3MfjBmYzx8rOzu7EC6yX/VjZRLYuZCJnA6us739iIBLBtBjcSn/me8vJLBVtot4PHyIVgCiC+GmLOM2Bby60u2zORf7UOBdp/qySax6Iw17LhX7jo2oQ9pQnF6S+69M8I5UzXwO8tbhyU=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SEYPR03MB7536.apcprd03.prod.outlook.com (2603:1096:101:146::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 8 May
 2025 09:01:34 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%3]) with mapi id 15.20.8699.035; Thu, 8 May 2025
 09:01:34 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: media: mediatek,jpeg: Add mediatek,
 mt8196-jpgdec compatible
Thread-Topic: [PATCH v3 01/12] dt-bindings: media: mediatek,jpeg: Add
 mediatek, mt8196-jpgdec compatible
Thread-Index: AQHbtb+Ip9hi9FnUgUW7BFGiHpfbe7O4rBmAgAAU8wCAAYWYAIAADliAgA4vG4A=
Date: Thu, 8 May 2025 09:01:33 +0000
Message-ID: <874ba04ef5e06385667549c6e29c47450113bff5.camel@mediatek.com>
References: <20250425085328.16929-1-kyrie.wu@mediatek.com>
	 <20250425085328.16929-2-kyrie.wu@mediatek.com>
	 <20250428-ambitious-deer-of-plenty-2a553a@kuoka>
	 <5b6e70181b417f1b25df6fc1838b0ad600e29e9c.camel@mediatek.com>
	 <2044b305-8786-49b9-82e2-aa294434c24e@kernel.org>
	 <41e258daf6ffaf14c3330c95860d70c95f9b61a2.camel@mediatek.com>
In-Reply-To: <41e258daf6ffaf14c3330c95860d70c95f9b61a2.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SEYPR03MB7536:EE_
x-ms-office365-filtering-correlation-id: 5d7f4eb0-465f-411a-a72f-08dd8e0eee85
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dlk0dTJRanowV2h3ZFBSSk5CWHAwamFBWW5SeXFPcEgweFhqa0taZ2xONzVh?=
 =?utf-8?B?NUJ4c0FEQ2ZBVGhVNTE3MSsrdWNnd3JicEhYMGVqL2ZRTnZyYkdlQXlyR09X?=
 =?utf-8?B?aEt0bzFJc3FibFJONmJwdU1CWWNZdUU4NDl6aFUrenZ5ZXhXK3EwZ3RHeFBM?=
 =?utf-8?B?dndoZFBCT3NZSWZPL1VqbFY2eWtOZmEzK243cE13MVVta3AwYm9wUkMzTW9j?=
 =?utf-8?B?UkVNOFF2RnpJTDRaQUczUEp3d1pWN09DVzYwQndmVW9vak9XajlWRllNWnRi?=
 =?utf-8?B?Mm1KM3JYZjlQS2xTalR4L1Y5YWlNQlZZVXZHR2xVS3o5SjVjR3piblk2blAw?=
 =?utf-8?B?UlhTeGl1bjhBYnMvNmFleUUxTmh5djVVemtpd2c4UWtzNmYzNVB4OWVvTnhp?=
 =?utf-8?B?U0ZJb0d5NCtUNHJLWWdDakVQT2lpQ1JHNE9aZ1pBZXlkVjN5WXhzQk94a3NH?=
 =?utf-8?B?MGZ3bXRqWStoc25aQWhlVk5JKzluVnlTT2xxMHJJcFRKRXhYOUY1Zmo0ejVw?=
 =?utf-8?B?N2VVMkpZcHd5c1NkWnpRcmlTMUlRREdzT0M5c0ZyNkpwUjlaYzR5SUhzb09h?=
 =?utf-8?B?Q0RnVHhGRlNTMEZpZ0JBcnYvcDhWNVhkVGFCa2JDZ0EvaDR5R0dha01PSWhK?=
 =?utf-8?B?WGpsZ3BsblhTSjNsaTVYRFJpTHJZTzEzTE9COHUrQlJ3TlVMbDhwMHdKem8w?=
 =?utf-8?B?ZVEybXQ3d0llN3RLTUgwaGFPQzcxcVVwS0ZxeGcyNmU0L1hlTFZ5dnZKVEM4?=
 =?utf-8?B?K0ZoYjBzV2dWbHR0dGJEUTdQTnowMUxEcExkeHU1czFHQ3Q5MUNtWmx4NnRn?=
 =?utf-8?B?TVc3WTh2dW1ibVZRajdhREl5VmhNTGVtZFhEZE04b2dWbnVGTmRlTytjYUxk?=
 =?utf-8?B?Qk52VC9hMFJ3N2hndWlwcDYwMUxoS1VpdTZFVFluTXRrdUxZN3ptdVZpcUlr?=
 =?utf-8?B?b2dJZGIyQk9ndTE2a1gxbUJacGhtZ3N1RDUyQWpkaUFhMURsZXY0dExEY1Bj?=
 =?utf-8?B?eTVHSnNwRkI2Vzg0L2pITS9jTENla0Z0UEpnV3VMTDVxN0RydTQrQUhxWExh?=
 =?utf-8?B?b0VQV0tYU2Z2bGVzdkdTek9GcFVNR3FmS2w3L0JmbTdVNDlweXR2MzFsVWlj?=
 =?utf-8?B?SnYzSXdNeXhSdEkyRk10ekYrUHZLdlBCNGVJLzA1YWlUUHFFQzBGTXpFK3oz?=
 =?utf-8?B?aXRrdFVEMXJnRFEzQ0plTzFzeDBpakRUUTZuOTdKQmo4Z09sOTRLL1gyeEli?=
 =?utf-8?B?d1c4Z3dXSlF3V2xCUk5FOGNwVTkyV1NjL2phTWtkWDFDQk50VWVHY1NaVm5O?=
 =?utf-8?B?YjNxWWtnbndBeVNPd3hIbWx1U1dCcnJoaXk1Mk4xeTZkYnZISzU4SHJjSVlu?=
 =?utf-8?B?TUlzaUJCaElXNXFseXRaVW91VFFnVHRSYWxEZ3lFdWhHT09GcUVlNXAzc1JJ?=
 =?utf-8?B?QnNyRWNOZlUvb3lZYzZuV0VGU3lIVW5DV1lxV0EvQ244WlNBMzI4T2pkcTds?=
 =?utf-8?B?MDhhRVBXNmFvQUZ3d0V1UmZIMllSMnhxSWlMTVlTUG5kdkZnWUQxbnlxZnRK?=
 =?utf-8?B?emgwSjcraGNXSzJRVjN0NHl6YUZWMFNCSlB3Vzc5bmYzOHR5WXlWSDZxTXFQ?=
 =?utf-8?B?eThFaFIwSjFISEZUcHdXcS81cUZ4NklrcXB1OEdYNUtpNWQ4bS9uMjh6YXk4?=
 =?utf-8?B?RU5nTWw3RGdZS28rS2JmYXVJK2tlc01ocll5bU5oMkdOa29hQUNzbDRQOTVD?=
 =?utf-8?B?WkFNVUU2SVcvc0xCZHVvY3NyQkhXbTczay9IV2hMVWVUNjJKYW01TVBCV0tU?=
 =?utf-8?B?WGpLMkIzK0JkRUZUajlYdis2cTNkZkJNckkvYzd0T0EzUUdQK0VibTZ1b05n?=
 =?utf-8?B?S3hPYm9WMloyQlNxUFlDOUlKSS9Za0s2VE4rR2hnV2I5bEg1WGxEaEdDaGlw?=
 =?utf-8?Q?PSmBmPI8oM96bOzs9I4WF625uplV6A+f?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NC9rTlRPVUZDTlEwUDVsUXlyTlRsUzRiNTQ2dnRnanVMa2hhdjIxTVM2T3Zq?=
 =?utf-8?B?Y3Q0MjErVndvV2s4VExYbERESjRNRVZybVo3N2thQnpZTXMvOG12MlU1QUdQ?=
 =?utf-8?B?Y2JtdEJsVmg3OTJ0bGpxZ3gxa3RIQmV6WmRFNCt5aWdRYUNrNXU1ZmcxbGtD?=
 =?utf-8?B?TnZsc25yb0pBZy9nSk1iOGNJTE5jVUpqRDBIdmpYYmR4UkY1b2ZtMUlVTFhh?=
 =?utf-8?B?bWo3cklrenhHbEMrNzdjUHdlejZ0bStQSDFZRkE3MjhsZmkwZER1K0p6ZElP?=
 =?utf-8?B?KzNIQU13RlZwbzByYStsSXdRTytBZS84OVhhK1BrQXNSamxLb09GV3RvOWZi?=
 =?utf-8?B?VFZsMWFRNnNyMGI0ZWhlR0JraVprZkdJNTNpb0JXZS9sdzlrSmswcmVvL2ZF?=
 =?utf-8?B?NkJuTHBKcEM2YzJMenVPTEVuVitlbFBrRFU5NXlaeTlNVFNNZVpLeHBtaCsw?=
 =?utf-8?B?T043a2ExZWlVU0VHNVdrVGt2UEpIODMzZmd3aHdqeU5NTzFBUXVLU3k2RHdi?=
 =?utf-8?B?YStIaUNwK2R6eTRoQzFUUmJDSnZ0cFJhdUZIdjlLanVrVW55NlVDaHB1bkVZ?=
 =?utf-8?B?TC9aZ01qQXBmT3Z1ZkhhVUpuUXZXdS9xcjMzbGVUSHhqaWp3Q0I4VnFmVmE4?=
 =?utf-8?B?ZGNPRzRDOWdLaEFKOFoxcnZ2YmpZazhKQjJwcW03cjhucW5KZndabzhKSUlu?=
 =?utf-8?B?NXdJVDkzWDdkc3dqd05iNTlidkxUdFExQ1Y0Q3J4VFF0K2VGd0lJT1cybTE0?=
 =?utf-8?B?TjBPWVduN2poT3Ezc3h0MGJPL0oxWnpveXBtMGpNeUxWZk42QXovSUxMQ2FH?=
 =?utf-8?B?TjZIbVNkYmY5R1NjM1JtNThVNksramtjS1RyditUU2NIQW9Fd0IxNk5wcWN6?=
 =?utf-8?B?TWd0aEpzSmNybUdIL1J1akVIN3JpSWgrK2ttOGhXSm1PejFKOWp4ZURqSE5u?=
 =?utf-8?B?NmpWNzhMWHVoQWZNdnBZWS9BQ1dVQUNWQXc5M2VMMXVadkttUVEwa0o3ZXU0?=
 =?utf-8?B?NmhjSlJlTkdjcXlQTjU3UGtSbGlaUkt6UlRnSmZoSklVbk90OGZ0ZzJwNi9M?=
 =?utf-8?B?emUyL0ZSWW5FSjI1MHZiRDRXeWNHbkIxZmFDQjcxUll6aWdOazB0SUlwSm50?=
 =?utf-8?B?L2hPYVZkeFdZbzFUTXduTlBNMW1TMFd5Y29hUVlFVmVwTC9lZjE2SXFLQUxv?=
 =?utf-8?B?TktvR045RzdFMWhhYWRsNTVpNXk1bTNEUDdtZllnNkVGWUQwbEsrZGRiemhB?=
 =?utf-8?B?dVRVWS96dE5IMW5YWXlSeSt2RFRYRzVPS2R6T2IvcEczekdQTjF2WVYwWml4?=
 =?utf-8?B?QzRQWCtNcDByZ0Z6NDVLbnZISENsS2NPS0Y2dllaWVkyaVpkMkwrYmtOK1B0?=
 =?utf-8?B?UDcxTDZTL1RWSDRDenBLeG1PaTdoaVJIRDE1ZzdyakVBbmNPSFl3Ym51RGZr?=
 =?utf-8?B?aWZObkY1clVadVlDdTdtTWpBckJndU40NWhDY1ZzNkl6Vkt1MTQ2VU5XekZI?=
 =?utf-8?B?WkpnNDZ0L1Vab1Y4THZhazA0aVlvWlN3cGw5alFDZXBUOGZCcTJnSWpieFFV?=
 =?utf-8?B?TFVFWUlrODl0cWFJWGRnWGdEQ01PWVNsMjdPOEt2cWpraGIvSEFpeEIxS05j?=
 =?utf-8?B?eUZldzBCcnQyZUdEOUN1WGlDUW9zME1hVm1LbEtVLzgyalBEM0s1OEZEVjQ1?=
 =?utf-8?B?ZWE3WVFjeW55M2ttdEg5WUp1UThSZkUzMnFGRmg4cmFoMk55bWxzMXhYejdB?=
 =?utf-8?B?WEkyYmlodTIxa2V5SjZ4VllrZ3hKcVRUd1lNdWtEa0dKdDVwMHY5T2padmhQ?=
 =?utf-8?B?eldocWtPcmpuemI2TGVsN2taODE5UGhHbDZTMlJZNlJselJET2E5c2VVU1Bz?=
 =?utf-8?B?d0VUNVhjZm9HcFIreUZsSEFLLzdTdE9GVGczV3dESmJiZGc4QkVlRTVrT0wy?=
 =?utf-8?B?R05ZOHVtYWh5Z2pGd2xvaldYZFBFVDFOdmlFWkM1bjVuMFNXSHJkbmd4RDVQ?=
 =?utf-8?B?dGVhRStCT1VCQytKd05lbzg3SjJ6cUllaHJCdkFFNG0xQlZaTkRCeG16L1Ey?=
 =?utf-8?B?Q3ZOYW9wa3FSaVpwOE5CelFQUXQ4b1VDRUxzYll6M0ZNdXo2b2J3dVNjdVZt?=
 =?utf-8?Q?XmqjfHg6F+5JhN3v650l9e92r?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B51D6A916F60634A85D3B6C3F175E0DD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d7f4eb0-465f-411a-a72f-08dd8e0eee85
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 09:01:33.8874
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SpspdpIxfV5SjrK7yHjfK7Dwf9SPkZU/tbKbVA5d8QD0PUFbmECxa+Kj4Jo+qzLDTodPeRPxFwrGZrSAQKpfog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7536

T24gVHVlLCAyMDI1LTA0LTI5IGF0IDE2OjI1ICswODAwLCBLeXJpZSBXdSB3cm90ZToNCj4gT24g
VHVlLCAyMDI1LTA0LTI5IGF0IDA5OjMzICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3Rl
Og0KPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBvciBvcGVu
IGF0dGFjaG1lbnRzDQo+ID4gdW50aWwNCj4gPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVy
IG9yIHRoZSBjb250ZW50Lg0KPiA+IA0KPiA+IA0KPiA+IE9uIDI4LzA0LzIwMjUgMTA6MTksIEt5
cmllIFd1ICjlkLTmmZcpIHdyb3RlOg0KPiA+ID4gT24gTW9uLCAyMDI1LTA0LTI4IGF0IDA5OjA0
ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPiA+ID4gPiBFeHRlcm5hbCBlbWFp
bCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cw0KPiA+ID4g
PiB1bnRpbA0KPiA+ID4gPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lg0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IE9uIEZyaSwgQXByIDI1LCAyMDI1IGF0
IDA0OjUzOjE3UE0gR01ULCBLeXJpZSBXdSB3cm90ZToNCj4gPiA+ID4gPiBDb21wYXJlZCB0byB0
aGUgcHJldmlvdXMgZ2VuZXJhdGlvbiBJQywgdGhlIE1UODE5NiB1c2VzIFNNTVUNCj4gPiA+ID4g
PiBpbnN0ZWFkIG9mIElPTU1VIGFuZCBzdXBwb3J0cyBmZWF0dXJlcyBzdWNoIGFzIGR5bmFtaWMN
Cj4gPiA+ID4gPiB2b2x0YWdlDQo+ID4gPiA+ID4gYW5kIGZyZXF1ZW5jeSBzY2FsaW5nLiBUaGVy
ZWZvcmUsIGFkZCAibWVkaWF0ZWssbXQ4MTk2LQ0KPiA+ID4gPiA+IGpwZ2RlYyINCj4gPiA+ID4g
PiBjb21wYXRpYmxlIHRvIHRoZSBiaW5kaW5nIGRvY3VtZW50Lg0KPiA+ID4gPiA+IA0KPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IEt5cmllIFd1IDxreXJpZS53dUBtZWRpYXRlay5jb20+DQo+ID4g
PiA+IA0KPiA+ID4gPiBJIGdhdmUgeW91IGEgbGluayB0byB0aGUgZXhhY3QgcGFydCBvZiBkb2N1
bWVudGF0aW9uIGFib3V0DQo+ID4gPiA+IHByZWZpeGVzDQo+ID4gPiA+IHRvDQo+ID4gPiA+IHJl
YWQuIEkgZG8gbm90IHNlZSBpbXByb3ZlbWVudHMsIHNvIEkgZG8gbm90IGJlbGlldmUgeW91IHJl
YWQNCj4gPiA+ID4gaXQuDQo+ID4gPiA+IEkNCj4gPiA+ID4gY291bGQNCj4gPiA+ID4gaW1hZ2lu
ZSBwZW9wbGUgc2tpcCByZWFkaW5nIGVudGlyZSBkb2MgKHdobyB3b3VsZCBsaXN0ZW4gdG8gdGhl
DQo+ID4gPiA+IHJldmlld2VyLCByaWdodD8pLCBidXQgaWYgSSBnaXZlIGRpcmVjdCBsaW5rIHRv
IHNwZWNpZmljDQo+ID4gPiA+IGNoYXB0ZXINCj4gPiA+ID4gYW5kDQo+ID4gPiA+IHN0aWxsIG5v
dCBmb2xsb3dpbmcgaXQsIG1ha2VzIG1lIGZlZWwgcXVpdGUgZGlzc2Fwb2ludGVkLg0KPiA+ID4g
PiANCj4gPiA+ID4gQmVzdCByZWdhcmRzLA0KPiA+ID4gPiBLcnp5c3p0b2YNCj4gPiA+ID4gDQo+
ID4gPiANCj4gPiA+IERlYXIgS3J6eXN6dG9mLA0KPiA+ID4gDQo+ID4gPiBJIHdvdWxkIGxpa2Ug
dG8gYXBvbG9naXplIHRvIHlvdSBhZ2FpbiBoZXJlLiBJIGFtIHZlcnkgc29ycnkgZm9yDQo+ID4g
PiB3YXN0aW5nIHlvdXIgcHJlY2lvdXMgdGltZS4gSSBjaGFuZ2VkIHRoZSBzdWJqZWN0IGZyb20g
ImR0LQ0KPiA+ID4gYmluZGluZ3M6DQo+ID4gPiBtZWRpYXRlazogWFhYIiB0byAiZHQtYmluZGlu
Z3M6IG1lZGlhOiBtZWRpYXRlayxqcGVnOiBYWFgiIGluIFYzLg0KPiA+ID4gVGhpcw0KPiA+ID4g
Y2hhbmdlIGlzIGJhc2VkIG9uIHlvdXIgcHJldmlvdXMgc3VnZ2VzdGlvbi4gVXNlIHRoaXMgY29t
bWFuZCwNCj4gPiA+IGdpdA0KPiA+ID4gbG9nDQo+ID4gPiAtLW9uZWxpbmUgLS0NCj4gPiA+IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS8sIG9idGFpbmVkLiBCdXQgdGhp
cw0KPiA+ID4gbW9kaWZpY2F0aW9uIGRvZXMgbm90IG1lZXQgeW91ciByZXF1aXJlbWVudHMuIFNo
b3VsZCBJIGNoYW5nZSB0aGUNCj4gPiA+IHN1YmplY3QgdG8gIm1lZGlhOiBkdC1iaW5kaW5nczog
bWVkaWF0ZWssanBlZzogWFhYIj8NCj4gPiA+IA0KPiA+ID4gQW5vdGhlciBxdWVzdGlvbiBJIG5l
ZWQgdG8gYXNrIHlvdToNCj4gPiA+IE1UODE5NSBhbmQgTVQ4MTk2IGJvdGggaGF2ZSBtdWx0aS1j
b3JlIGhhcmR3YXJlIGFyY2hpdGVjdHVyZXMuIERvDQo+ID4gPiB3ZQ0KPiA+ID4gbmVlZCB0byBj
aGFuZ2UgdGhlIHlhbWwgZmlsZSBuYW1lIGZyb20gJ21lZGlhdGVrLG10ODE5NS0NCj4gPiA+IGpw
ZWdlbmMueWFtbCcNCj4gPiA+IHRvICdtZWRpYXRlayxtdWx0aS1jb3JlLWpwZWdlbmMueWFtbCc/
IEluIG15IG9waW5pb24sIHRoaXMgaXMNCj4gPiA+IG1vcmUNCj4gPiA+IGFwcHJvcHJpYXRlLiBX
aGF0IGlzIHlvdXIgc3VnZ2VzdGlvbj8NCj4gPiANCj4gPiBJIGFza2VkIGFib3ZlIGFib3V0IGxp
bmsgdG8gZG9jdW1lbnRhdGlvbi4gWW91IGlnbm9yZWQgdGhhdCBwYXJ0LA0KPiA+IHNvDQo+ID4g
bGV0J3MgYmUgc3BlY2lmaWM6DQo+ID4gDQo+ID4gRGlkIHlvdSBvciBkaWQgeW91IG5vdCByZWFk
IHRoZSBkb2MgSSBsaW5rZWQgbGFzdCB0aW1lPw0KPiA+IA0KPiA+IEJlc3QgcmVnYXJkcywNCj4g
PiBLcnp5c3p0b2YNCj4gDQo+IERlYXIgS3J6eXN6dG9mLA0KPiANCj4gSSBoYXZlIHJlYWQgdGhl
IGZvbGxvd2luZyBsaW5rIHlvdSBwcm92aWRlZDoNCj4gDQo+IA0KaHR0cHM6Ly91cmxkZWZlbnNl
LmNvbS92My9fX2h0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL2h0bWwvbGF0ZXN0L2RldmljZXRy
ZWUvYmluZGluZ3Mvc3VibWl0dGluZy1wYXRjaGVzLmh0bWwqaS1mb3ItcGF0Y2gtc3VibWl0dGVy
c19fO0l3ISFDVFJOS0E5d01nMEFSYnchbFluR0xjT0JRSWg5eVFVeU1jdGVLeHZjS1F2Ml9lU2M0
dWR4a0REV1hpa1R5TjhWY1h5WURnR3VLLThVWld4S0U1UG1nM0Q1bHZwbGN3JA0KPiANCj4gSG93
IHRvIGFkZCB0aGUgcHJlZml4IG9mIHRoZSBwYXRjaCdzIHN1YmplY3QsIHRoZSBsaW5rIGFuZCBj
b21tYW5kDQo+IGxpbmUNCj4geW91IHByb3ZpZGVkIHJlc3BlY3RpdmVseSBpbnRyb2R1Y2UgdHdv
IGRpZmZlcmVudCBtZXRob2RzOg0KPiAnbWVkaWE6ZHQtYmluZGluZ3M6eHh4JyBpcyB0aGUgbWV0
aG9kIHByb3ZpZGVkIGluIHRoZSBsaW5rIHlvdQ0KPiBwcm92aWRlZDsNCj4g4oCYZHQtYmluZGlu
Z3M6bWVkaWE6eHh44oCZIGlzIHRoZSBpbmZvcm1hdGlvbiBvYnRhaW5lZCBmcm9tIHRoZSBjb21t
YW5kDQo+IHlvdSBwcm92aWRlZDsNCj4gSSBoYXZlIHByZXZpb3VzbHkgc2VudCB5b3UgYW4gZW1h
aWwgYXNraW5nIGhvdyB5b3Ugd291bGQgY2hvb3NlDQo+IGJldHdlZW4NCj4gdGhlIHR3byAoDQo+
IA0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3Bh
dGNoLzIwMjUwNDEwMDYzMDA2LjUzMTMtMy1reXJpZS53dUBtZWRpYXRlay5jb20vDQo+ICkuIEJ1
dCB5b3UgZGlkbid0IHJlcGx5LiBUaGVyZWZvcmUsIEkgdXNlZCB0aGUgcHJldmlvdXNseSBtZXJn
ZWQNCj4gcGF0Y2gNCj4gYXBwcm9hY2ggaW4gVjM6DQo+IGIxNWE1Y2U4NjM4MyBkdC1iaW5kaW5n
czogbWVkaWE6IG1lZGlhdGVrLGpwZWc6IFJlbGF4IElPTU1VIG1heCBpdGVtDQo+IGNvdW50DQo+
IE15IGJlaGF2aW9yIGhhcyBjYXVzZWQgeW91IGluY29udmVuaWVuY2UgYW5kIEkgaGF2ZSBtaXN1
bmRlcnN0b29kDQo+IHlvdXINCj4gaW5zdHJ1Y3Rpb25zLiBJIG9uY2UgYWdhaW4gc2luY2VyZWx5
IGFwb2xvZ2l6ZSB0byB5b3UuIEkgaG9wZSB5b3UgY2FuDQo+IHVuZGVyc3RhbmQgYW5kIGFjY2Vw
dCBpdC4NCj4gRmluYWxseSwgcGxlYXNlIGdpdmUgc29tZSBjb3JyZWN0IGd1aWRhbmNlLg0KPiAN
Cj4gVGhhbmtzIQ0KPiANCj4gUmVnYXJkcywNCj4gS3lyaWUuDQo+IA0KPiANCkRlYXIgS3J6eXN6
dG9mLA0KDQpJJ20gdGVycmlhYmx5IHNvcnJ5IHRvIGJvdGhlciB5b3UgYWdhaW4uDQpDb3VsZCB5
b3UgcGxlYXNlIGdpdmUgbW9yZSBzcGVjaWZpYyBzdWdnZXN0aW9ucyBvbiB0aGlzIGlzc3VlPw0K
V2UgYXBvbG9naXplIGZvciBhbnkgaW5jb252ZW5pZW5jZSBjYXVzZWQgdG8geW91Lg0KVGhhbmsg
eW91IQ0KDQpSZWdhcmRzLA0KS3lyaWUuDQo=

