Return-Path: <linux-media+bounces-24567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D788A08689
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 06:32:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 386723A8B6D
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 05:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77BB347C7;
	Fri, 10 Jan 2025 05:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="n7RhrrZX";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="II4Z4fFs"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A2F746E;
	Fri, 10 Jan 2025 05:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736487111; cv=fail; b=Ao5B7yww5i1aIb+xTuH4WIGpc42b0EX0mHL8icdtof3cX/zlbtVNaziZTNBy3OcBSRYwQYpl/3ykHEc+MtOA7pVqtQRf8Byu536MMyRD+8bE0kaLWWk4FKjlFxSw/3w+zw3iZRXPMI1ZDrhBa59dsDZBVKVYapgi8m/ygeJ/lCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736487111; c=relaxed/simple;
	bh=PJGlaTJv69WyF4xtzI2uer6XsHsNSy+NQClLC0x0WTs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nb9AmPnuU8BtQioT3AQaEARKbE3USSau0ZU3xoIEko8jGtaqsrniAtwnnkxbTX63tjiZYr7eeydQcIYVFe8v2MePxrDJ007ZqUxKAVdmfv2eHLA7zu4D7+Xjkveata65DS57io0ICMZZGbq/MU8XQxNeQUWQ11SnpOkcHdlTyBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=n7RhrrZX; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=II4Z4fFs; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 2cd82efccf1411efbd192953cf12861f-20250110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=PJGlaTJv69WyF4xtzI2uer6XsHsNSy+NQClLC0x0WTs=;
	b=n7RhrrZXqGVyk2b0HFCe5lcEEoEeu2d6tITWpMHzKm57rX+YBH2/umTubgQAI7nvVZp7pyzdf/swixb7/h8IG4i0cs4cZDA5tEwiH8y0Jw0N33MAK4JsOMxD220b5He5S3/clN02q3y1Pc0wCUZkBmnoi65LTs3oEHgLCXRHLm0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:5ee1b797-114d-484e-af5b-5b8afbf0a6e1,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:5171aa37-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 2cd82efccf1411efbd192953cf12861f-20250110
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1217015050; Fri, 10 Jan 2025 13:31:43 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 10 Jan 2025 13:31:41 +0800
Received: from HK2PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 10 Jan 2025 13:31:41 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d1+NQAB02bdMh7zOMWvyZqQ+D4ajRCQjfHTAbNHSZmcCCNEi79EfMJmxTa/7E+/vlFcQ/DzGZsG/7NVNF8LS8Z0v+FYulPPGqX3qfOTEalWjv7tG+u5YH3PAVASeuo1LnZ62qvw6QOZNuaQf4T/0lJ3UCd7yM6UH4iQasOIb9fsc8G5kAhJ/3jILZl/lOKBo9GquCdcnYhfVBZZOFC55NFltwMeKNPDTCzNtPhpCb6JwreN9dwPiYZgL+kJypPHrKcdar8NV5Iyp0mb0YXEHVUwUu/ELw+IJmghYKjjEN9SzPVi2H13P3lL4annaYVpreW013jKFO7ymI2oAsWg2Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJGlaTJv69WyF4xtzI2uer6XsHsNSy+NQClLC0x0WTs=;
 b=NCW2AcaDVNR8lkYDIH5GtP9SYmb7QKhRuTpKlnBf3uOUKDIPTo36ROndZKSCPwQ1K5eIIBDv9SErGqOvyKJuQOgKcXdYu33c2DvAi1sM/i81mch4sf1eDCNXGW9r3a2rmOLjr2y76Tu0VzJqnUExRots4rO0rA42WKnPVxpXV1ACIJKVvXHsGi5uSWu4qSB8MoeXTJECuCCkB0YJ3fAwmWp+AKLHbUH0nJBuaS6jgdFc/Ag6sbCNgt/pCit49H0X4xJl0+HPqZlo8HddQNSscDyV3/LP6FehLjigA4bzQYRzB9Bcy4d3A75wR27gfE9rVX3elK9vGbM+fZCTQKX4eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJGlaTJv69WyF4xtzI2uer6XsHsNSy+NQClLC0x0WTs=;
 b=II4Z4fFsakbMSzYPoGgRMGLDSqiLKMRUkpOMbgTwJ11+W0dkh4+CXu5HR/zb/6oCWCyP8LlcTk86cKxD3JfYUn33cxhrGT+Kws+qgb5PkPF2pHy/ebdI1jNM5A0+w4cp44Rd2WLt18WvkhmNwx/vRuFXJs4e0eyRknJaaNI8fwg=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SEYPR03MB7024.apcprd03.prod.outlook.com (2603:1096:101:d1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 05:31:39 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%6]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 05:31:39 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "tzungbi@chromium.org" <tzungbi@chromium.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>,
	=?utf-8?B?QmluIExpdSAo5YiY5b2sKQ==?= <bin.liu@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: Re: [V1,00/12] Enable jpeg enc & dec multi-hardwares for MT8196
Thread-Topic: [V1,00/12] Enable jpeg enc & dec multi-hardwares for MT8196
Thread-Index: AQHbYptcL+kFhraGykezUCJU0B7V+bMOekcAgAECWQA=
Date: Fri, 10 Jan 2025 05:31:39 +0000
Message-ID: <199f5b929dcc34fe6835de9d31c96c2c929afa3d.camel@mediatek.com>
References: <20250109133513.20151-1-kyrie.wu@mediatek.com>
	 <c67ebf846d19086586b00d1d79252c8296a704b5.camel@ndufresne.ca>
In-Reply-To: <c67ebf846d19086586b00d1d79252c8296a704b5.camel@ndufresne.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SEYPR03MB7024:EE_
x-ms-office365-filtering-correlation-id: 9b3f7c99-ae40-4a3c-78f2-08dd31380ee2
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?enFVMit3TXRGa3lUcXJ0R0thNmx3RW1EbVVvQ0pXQWlDbU9UYW9OengrcWhR?=
 =?utf-8?B?WDNMOTdwVVRENU1FeENIMi9ZWkNjekxaZzY3NE5TWjdxb0kwQ2ltMTNLYmpq?=
 =?utf-8?B?bGNuUmg1ZXdJTjRVcGVRcFc0dDFjZFRrSnF6NHgzTU9KZXVHM2ZQWGlXK3JI?=
 =?utf-8?B?SVgrYTAxdm9PMThmTy91S3l0QTYrdTZKZnBsQ1ZQbWhPaS9CbjJOQWsxL2ox?=
 =?utf-8?B?K0pUditQaHhiUThFTEFud1kwbnBqbThkVFZnRWdxalB4VCtaTEZWcGVMdG9L?=
 =?utf-8?B?cHdYM01VZUx5Mk80Z1lxc0w5K3dvU0lmclppaExFWEFvUEdjNHFmQlVVZDE4?=
 =?utf-8?B?L2o3K3drL1pORDRyZW1YcGN3QnNFQ3JMMVRPK3BCcXZjSGxMMXhsOXgvSjZ2?=
 =?utf-8?B?cHB3M1MvZ01EYit5R3dkbzZRUVRxRFlQTjlvNG9WM3duTUVIUHJOeHhCY3l1?=
 =?utf-8?B?N0ZMV2xnOUFjRUhCanBNTXFuQXFWK0Y3YjJvYzdNYXNSS2R3NDdyMHZ4dVN1?=
 =?utf-8?B?TWxjWHFNQ1dGeFZjYzNDZVlkTkhqMWJkWHZuTWZNcDZMdStGQUJ3SUJpc1dE?=
 =?utf-8?B?QUdxajNJNU1ZcGs4SzdZd3VqMDYrSUtOUm12WTBnTEZJdFFwdFcvczkvQWtl?=
 =?utf-8?B?ais0dDU0RGJtMlYzUW5oQmMxaU40Yk91UEJQOFpNU3pUR1FTZUNiQXF2NmFq?=
 =?utf-8?B?YS91SGdreDJIb3BaZ3pKVkhSQ3Y5SXluaTBVU3hCM1kyNnpvU2ZxYWNMM250?=
 =?utf-8?B?OFJVeUFRejFOQ0tCNTBZdkNZNFZZdmhLdmlRSGg1dE53NVVBNEpDTHBoM3pY?=
 =?utf-8?B?RXR4NWJ0WjBqMkdKbXpHaXFMaUpaMXpmNXYyQURzVGNoR2tEVGNDMUs4SDZh?=
 =?utf-8?B?MkJ3LzdVcXhmWTZteDBTK0NSOXJDV3JOUUx4cW9HUXU1TjBXL1poaXpFdDJP?=
 =?utf-8?B?MUtqbFdFT0VrVUxxQVpzUXBielJwS3JLNTBqM0VtV0M1cXNMalJQREZZbERi?=
 =?utf-8?B?Z3cxVFkvcGtjcDkrdWhFamc5UVFGeTdGdmNlNjNrT2JUVU1sUTlUdituN1Fu?=
 =?utf-8?B?MHVmMjdxQkFYd01OaC92R1BLU2RpeTZzdFVLOE9iS1R1MmJueXRRZkc0RWJT?=
 =?utf-8?B?b002bEpSeDd6M1E5TUxPem5ES0pNNFZUOTJLMG9IWkhob2F0N2RkQ2RjWFRQ?=
 =?utf-8?B?dXZXSGs0bXNZZFRiRVRJNEpkRE4rRTJqeU00TnI4MHpVVDRWK3lyL081WTQv?=
 =?utf-8?B?M0NhNjBCRnF4bmhlT292SDRjK1Q5TTFSc2tmZGxQTHBuOVF6enVlL3hpNDNk?=
 =?utf-8?B?d08vd1RpRXNOMzVBTktBSWFBYjl6RUtRVTg2WGQvNno3ZWw2L1lvUUM3RDAr?=
 =?utf-8?B?SmtXdkVHbnM4VFJ2SW9YYmNsZXZJblVmTVFVQXpJZDExVTVGb0Q3WVV0aDBx?=
 =?utf-8?B?QVBNY0w2RGNOV3FLRWt1Z2RqZ1V0Y1FERU5YYUxyc2pjcXdmVEVkUUpPbHg2?=
 =?utf-8?B?aDNnVk5VWUZsTnE4ZVJJbG9PaXNOdWtzWXRWTnRWK0Uwc2hYL25TNHUvZkhN?=
 =?utf-8?B?VG5RekR3VDY0VHdmdmRaQkJnanozQURMclhoSnNMc1NmcTVpUnF5Nk1VWFlC?=
 =?utf-8?B?SjVRRDZUSi9KYkZXRy9lTXB2aWFDM1dUSWFHOURCUys1SWdSN3FLMkUrWkNX?=
 =?utf-8?B?QlZndjg0emJNK3RqYTAvRldRUG5nMEdYd3BrcHhRMzBVRS9JZjRYUTBORHFn?=
 =?utf-8?B?RGNSNFhIaXBxUnJ5L1NURzdYWkt1dFQvWndpVFlWTFpJTTFGTE1NSW9iRDlJ?=
 =?utf-8?B?UE40L1ZybGpJUitOODlka1JYZWg0b1Z5Qm5DVWZ4aE10VUk0Qk9FQ2tmSHJo?=
 =?utf-8?B?MFVyRm5YMzBOeWxUQ3YvdE5tM3dURlk1cFNrcUZrZStHb2M0MStqalAzSjNo?=
 =?utf-8?Q?wicAGutGL6bGwvVf8QZVX2dA3ENVSPP/?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bk9IRWtyMGRBc0lyZVBId3dUWTdLSkhKVllaMFl1TG9VQzJWSTQxUlZ1a0wr?=
 =?utf-8?B?bDI1dW1Lc1hRQnh0amRMOFJLMmpYOW9KRUhpSGhLcEZ4enc3d3R1YTgxVGVu?=
 =?utf-8?B?em94TUtzaVB2MzNnM2doS1pUNmR2akxnM1lVbytYZ0wvVVhZOVd5a3gzV2Nl?=
 =?utf-8?B?cTlLVFlJSlZLL0JwT3JEcjZBTlRHck1maTZjT1lJeC9TS2JkTGRQM0ErT0hY?=
 =?utf-8?B?aHhyV3JRenJvcUZOUEpiL1FZWWtlZURKK2ZTOHBocFdTdTg5aERabGVDc3dj?=
 =?utf-8?B?WnNWbWtlMmtmMEdyWkJRcEM0QnJGYm9BMzNMbHhPWHpqUmVvNVhFMnhDTnBC?=
 =?utf-8?B?cnZPTGdvWnRFTlRFQitxQXVpa3VzTHEvbmQzdjBlLzA0TFlTc1dkNkJScDlp?=
 =?utf-8?B?U1ZKMWpoV3VhUkQ3VFI1LzN1TVZ1c2FtaXk5SThOVUZKYlRZTlRSZ0JReExM?=
 =?utf-8?B?WEN4M05FNGRGTXN2S0tyZGd3NVQyVkZzVjdWbmhSaEtyMUt4NnlHL0RXaXFm?=
 =?utf-8?B?cURkQklzV0lKaDBCTlJCTEJHVGNQWHEyak55Y1c2dDJrWkJkS3FXdUFiYThl?=
 =?utf-8?B?MmdkMlhNckJVWktWZHJ3ckVhZGkvTVFzSnUxNVpFM1EzdzdDUks4dGY2cXly?=
 =?utf-8?B?VHpNbkhwdmlWeTlrZk9TbDN2cmRPNDVZdUlZR3l3RUtmeDc5THRuNmhEbEl4?=
 =?utf-8?B?R1dGSXQzbm9JQ0lKZlAyQ3loeEl4RStEM09RaDBiYzRJS2xLSzNvK01lUHg4?=
 =?utf-8?B?UlpJVXN2YjZCdnpRdTVRSGE5REZRYmRXN0xOWmZmZnMrVTBuMWpNVDQ0NTNZ?=
 =?utf-8?B?ZFVLSVhnR3BGVDVQN1NPWDFvSnVKZ1oyWHdmUml3ak5veEZtMnJyQS9MekRS?=
 =?utf-8?B?aUtTZXBpTGs0cXUzVnYwTDJvNmowZlo4NWhMYVlPTTh6SFZEUVZEOFZ2Nklw?=
 =?utf-8?B?anFhZWFheHFCTmVQK2lESEVCZUJJVWlyWm9Pam16VmlYTjZhdFF6aFJ4VFQ5?=
 =?utf-8?B?WmJLZVlKd2lDdzJ1VUc4a1h4OG5PVWhPdHZpMVRVaDRhNWN2dWw0TVVwaURZ?=
 =?utf-8?B?ay9LejJyZXFWVzBVMmtjdDAzMDNMVG5ncHNwajlDQ25uRjB4bXEvMS9tSHBo?=
 =?utf-8?B?bzZVZlgzZVd1akM5MnkvRzFJMmJvUmladlRuMEhOS1BkZEV3T3dqeTREMTAx?=
 =?utf-8?B?WUtHVTRXMTFPMGJqb1hPMlc1MTRoUThzeGpHdkVYVG42Z3UwWmx1N254M1p0?=
 =?utf-8?B?Mm1hZ0FGQXpwTXppTFpsYnEzb0crSnBlOHZqZkljQjE4VUovRE9Bc2JnUjBw?=
 =?utf-8?B?OXRFQUxkaS9lSTZtSWRKdmxxN2NXNGIwTlZPT0paeWltK2ZNcTIydkhsNElI?=
 =?utf-8?B?SEtRb3Z4cnYyQ3NEWTEwelNaQlI3NHdCMkZPR002anJ4RWl5SFBmd1ZwaWMx?=
 =?utf-8?B?NTcxaFVsR2grY1hkL0ZPL2lWb2poWEdlUU1JdGNQSFBidXpCbUwrU1FyTGxa?=
 =?utf-8?B?SUZURjB3anBKWUhOSGFlSDZQaFFyODdCdmt3dk5JZG5FZjltYmg2QmRYYlBz?=
 =?utf-8?B?eW1PWVJpT1BLeG1YSjJZcTZ4MXcwaFNyWWkyNTdHcXNLWCt3QVhLKzlrcW0w?=
 =?utf-8?B?U2JhMjhqQXN2UWYwSEZsOVQ3K005QklkSjYwZldyZCtVWTgwNTVmUW9CdnFP?=
 =?utf-8?B?WXNLcDl4cW12dG5DT3RodTErRDI4cWlrVjVGbTViRXBTUmorYUkzRkFiKzA4?=
 =?utf-8?B?dTlmTEhGZHpjY0NaV0hDUGh4YkwzVXV0bUZsTWpsTERUZlIwcTJKRVNQRTFQ?=
 =?utf-8?B?RUFxVUhYb0l2UFloc3UxSWRmQ25pOXlET3FQTXRrVVR6bGd5R1FNaUhnb1py?=
 =?utf-8?B?K21ZWkMxT1AzaUd3UWJCMDRKY1NFTEYzenQ1TXpBT01VQXNLRWdqblRFSVBU?=
 =?utf-8?B?NWFUMUZ4Q3pyM0VwNnJ5OVN1NHlUa2YrbVJpeE5lLzBVUWU4RlU4RGMyYkxY?=
 =?utf-8?B?QnlVRzBMaXc2VERrem9VZEpIc0g5Wk5vQU1CZjQySjFXTFJWcU9vY1o0UTdn?=
 =?utf-8?B?RlRIdzdYdldWTnpBYW4yK3ZmcWZCVmlmM3lOTnRDaFIyRVYzQzlCZ1cyRnpn?=
 =?utf-8?Q?eDCyO0FQdZRQ5qeQhqf8j6uMt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4831304AC230684A8E9F59C497C4555D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3f7c99-ae40-4a3c-78f2-08dd31380ee2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 05:31:39.3720
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O+vTMJ+J0tpPtvUHhBbvB38DQjyVULwgLIE1sgiC6m1zmKyL7Hc5qid5UnEEs9Q2nKvEX0ID4pYNZNt0Fs0MtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7024

T24gVGh1LCAyMDI1LTAxLTA5IGF0IDA5OjA2IC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBj
b250ZW50Lg0KPiANCj4gDQo+IEhpLA0KPiANCj4gTGUgamV1ZGkgMDkgamFudmllciAyMDI1IMOg
IDIxOjM1ICswODAwLCBreXJpZS53dSBhIMOpY3JpdCA6DQo+ID4gVGhpcyBzZXJpZXMgYWRkcyBz
dXBwb3J0IGZvciBtdDgxOTYgbXVsdGktaGFyZHdhcmVzIGpwZWcgZW5jICYgZGVjLA0KPiA+IGJ5
IGZpcnN0IGFkZGluZyBtdDgxOTYganBlZ2RlYyBhbmQganBlZ2VuYyBjb21wYXRpYmxlIHRvIGlu
c3RhbGwNCj4gPiBrZXJuZWwgZHJpdmVyLiBBZGQgc21tdSBzZXR0aW5nIHRvIHN1cHBvcnQgc21t
dSBhbmQgaW9tbXUgYXQgdGhlDQo+ID4gc2FtZSB0aW1lLg0KPiA+IFNlY29uZGx5IHJlZmFjdG9y
IGJ1ZmZlciBhbmQgY2xvY2sgc2V0dGluZyB0byBzdXBwb3J0IG11bHRpLWh3IGpwZWcNCj4gPiB3
b3JraW5nLg0KPiA+IExhc3RseSwgZml4IHNvbWUgYnVncywgaW5jbHVkaW5nIHJlc29sdXRpb24g
Y2hhbmdlIGhhbmRsZWluZywgc3RvcA0KPiA+IHN0cmVhbWluZyBzdyBmbG93IGFuZCBvdGhlcnMu
DQo+ID4gDQo+ID4gVGhpcyBzZXJpZXMgaGFzIGJlZW4gdGVzdGVkIHdpdGggTVQ4MTk2IHRhc3Qg
dGVzdC4NCj4gPiBFbmNvZGluZyBhbmQgZGVjb2Rpbmcgd29ya2VkIGZvciB0aGlzIGNoaXAuDQo+
ID4gDQo+ID4gUGF0Y2hlcyAxLTMgQWRkcyBqcGVnIGVuY29kZXIgYW5kIGRlY29kZXIgY29tcGF0
aWJsZS4NCj4gPiBQYXRjaGVzIDQgYWRkIGpwZWcgc21tdSBzaWQgc2V0dGluZy4NCj4gPiBQYXRj
aGVzIDUgZml4IGpwZWcgaHcgY291bnQgc2V0dGluZyB0byBzdXBwb3J0IGRpZmZlcmVudCBjaGlw
cy4NCj4gPiBQYXRjaGVzIDYgcmVmYWN0b3IganBlZyBidWZmZXIgcGF5bG9hZCBzZXR0aW5nIHRv
IGhhbmRsZSBidWZmZXINCj4gPiBzaXplIGJ1ZyB3aGlsZSByZXNvbHV0aW9uIGNoYW5nZWQuDQo+
ID4gUGF0Y2hlcyA3IHJlY29uc3RydWN0IGpwZWcgZHN0IGJ1ZmZlciBsYXlvdXQuDQo+ID4gUGF0
Y2hlcyA4IGZpeCBtdWx0aS1jb3JlIHN0b3Agc3RyZWFtaW5nIGZsb3cNCj4gPiBQYXRjaGVzIDkg
cmVmYWN0b3IgbXVsdGktY29yZSBjbGsgc3VzcGVuZC9yZXN1bWUgc2V0dGluZw0KPiA+IFBhdGNo
ZXMgMTAgZml4IGRlY29kaW5nIGJ1ZmZlciBudW1iZXIgc2V0dGluZyB0aW1pbmcgaXNzdWUNCj4g
PiBQYXRjaGVzIDExIHJlZmFjdG9yIGRlY29kaW5nIHJlc29sdXRpb24gY2hhbmdlIG9wZXJhdGlv
bg0KPiA+IFBhdGNoZXMgMTIgZml4IHJlbW92ZSBidWZmZXIgb3BlcmF0aW9uDQo+ID4gDQo+ID4g
LS0tDQo+ID4gVGhpcyBzZXJpZXMgcGF0Y2hlcyBkZXBlbmRlbnQgb246DQo+ID4gWzFdDQo+ID4g
DQpodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9y
Zy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjQwODA4MDkyNTU1LjEyOTk5LTEtamlh
bmh1YS5saW5AbWVkaWF0ZWsuY29tL19fOyEhQ1RSTktBOXdNZzBBUmJ3IW1KbVlIbF9Tb29tV0w4
YmVQXzVYdVVaMGJwdmhJX1RxSlZjRGpONW1reE9uck5QbkVrZnU4LUpkVGZ4eDNRNlNaSUVCVS0z
Q3ZkZE93LTN1aW8xTXhBJA0KPiA+IA0KPiA+IGt5cmllLnd1ICgxMSk6DQo+IA0KPiB3b3VsZCB5
b3UgbWluZCBmaXhpbmcgdGhlIC0tYXV0aG9yIGluIHlvdXIgY29uZmlndXJhdGlvbiwgd3JpdGUg
eW91cg0KPiBuYW1lDQo+IGluc3RlYWQgb2YgeW91ciB1c2VyIG5hbWUuIFVUOCBpcyBhbGxvd2Vk
LCBtYW55IHBlb3BsZSB3aWxsIHVzZSBhDQo+IEFTQ0kgc3BlbGxpbmcNCj4gKHNvbWUgYXBwcm94
aW1hdGlvbikgYW5kIHRoZW4gYWRkIHRoZWlyIHJlYWwgbmFtZSBpbiBwYXJlbnRoZXNpcy4NCj4g
DQo+IHJlZ2FyZHMsDQo+IE5pY29sYXMNCg0KRGVhciBOaWNvbGFzLA0KDQpJIGhhdmUgcmVzZW50
IGEgbmV3IHZlcnNpb24sIGJ1dCBJIGRpZG4ndCB2aWV3IHRoaXMgbWFpbCBpbiB0aW1lLg0KVGhh
bmtzIGZvciB5b3VyIGFkdmljZSwgYW5kIEkgd2lsbCBmaXggaXQgaW4gdGhlIG5leHQgdmVyc2lv
bi4NCg0KVGhhbmtzLg0KDQpSZWdhcmRzLA0KS3lyaWUuDQo+IA0KPiA+ICAgZHQtYmluZGluZ3M6
IG1lZGlhdGVrOiBBZGQgbWVkaWF0ZWssIG10ODE5Ni1qcGdkZWMgY29tcGF0aWJsZQ0KPiA+ICAg
ZHQtYmluZGluZ3M6IG1lZGlhdGVrOiBBZGQgbWVkaWF0ZWssIG10ODE5Ni1qcGdlbmMgY29tcGF0
aWJsZQ0KPiA+ICAgbWVkaWE6IG1lZGlhdGVrOiBqcGVnOiBhZGQganBlZyBjb21wYXRpYmxlDQo+
ID4gICBtZWRpYTogbWVkaWF0ZWs6IGpwZWc6IGFkZCBqcGVnIHNtbXUgc2lkIHNldHRpbmcNCj4g
PiAgIG1lZGlhOiBtZWRpYXRlazoganBlZzogZml4IGpwZWcgaHcgY291bnQgc2V0dGluZw0KPiA+
ICAgbWVkaWE6IG1lZGlhdGVrOiBqcGVnOiByZWZhY3RvciBqcGVnIGJ1ZmZlciBwYXlsb2FkIHNl
dHRpbmcNCj4gPiAgIG1lZGlhOiBtZWRpYXRlazoganBlZzogcmVmYWN0b3IganBlZyBkc3QgYnVm
ZmVyIGxheW91dA0KPiA+ICAgbWVkaWE6IG1lZGlhdGVrOiBqcGVnOiBmaXggc3RvcCBzdHJlYW1p
bmcgZmxvdyBmb3IgbXVsdGktY29yZQ0KPiA+ICAgbWVkaWE6IG1lZGlhdGVrOiBqcGVnOiByZWZh
Y3RvciBtdWx0aS1jb3JlIGNsayBzdXNwZW5kIGFuZCByZXN1bWUNCj4gPiAgICAgc2V0dGluZw0K
PiA+ICAgbWVkaWE6IG1lZGlhdGVrOiBqcGVnOiBmaXggZGVjb2RpbmcgYnVmZmVyIG51bWJlciBz
ZXR0aW5nIHRpbWluZw0KPiA+IGlzc3VlDQo+ID4gICBtZWRpYTogbWVkaWF0ZWs6IGpwZWc6IHJl
ZmFjdG9yIGRlY29kaW5nIHJlc29sdXRpb24gY2hhbmdlDQo+ID4gb3BlcmF0aW9uDQo+ID4gICBt
ZWRpYTogbWVkaWF0ZWs6IGpwZWc6IGZpeCByZW1vdmUgYnVmZmVyIG9wZXJhdGlvbiBmb3IgbXVs
dGktY29yZQ0KPiA+IA0KPiA+ICAuLi4ueWFtbCA9PiBtZWRpYXRlayxtdWx0aS1jb3JlLWpwZWdk
ZWMueWFtbH0gfCAgMTAgKy0NCj4gPiAgLi4uLnlhbWwgPT4gbWVkaWF0ZWssbXVsdGktY29yZS1q
cGVnZW5jLnlhbWx9IHwgIDEwICstDQo+ID4gIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210
a19qcGVnX2NvcmUuYyAgICB8IDEyNiArKysrKysrKysrKysNCj4gPiAtLS0tLS0NCj4gPiAgLi4u
L3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5oICAgIHwgIDE3ICsrLQ0KPiA+
ICAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19kZWNfaHcuYyAgfCAxMTYNCj4g
PiArKysrKysrKysrKysrKystDQo+ID4gIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19q
cGVnX2RlY19ody5oICB8ICAgNCArDQo+ID4gIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210
a19qcGVnX2VuY19ody5jICB8IDExMw0KPiA+ICsrKysrKysrKysrKysrKy0NCj4gPiAgLi4uL3Bs
YXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3LmggIHwgICA0ICsNCj4gPiAgOCBm
aWxlcyBjaGFuZ2VkLCAzNDMgaW5zZXJ0aW9ucygrKSwgNTcgZGVsZXRpb25zKC0pDQo+ID4gIHJl
bmFtZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEve21lZGlhdGVrLG10
ODE5NS0NCj4gPiBqcGVnZGVjLnlhbWwgPT4gbWVkaWF0ZWssbXVsdGktY29yZS1qcGVnZGVjLnlh
bWx9ICg5NSUpDQo+ID4gIHJlbmFtZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVkaWEve21lZGlhdGVrLG10ODE5NS0NCj4gPiBqcGVnZW5jLnlhbWwgPT4gbWVkaWF0ZWssbXVs
dGktY29yZS1qcGVnZW5jLnlhbWx9ICg5NCUpDQo+ID4gDQo+IA0KPiANCg==

