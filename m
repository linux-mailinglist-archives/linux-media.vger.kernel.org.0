Return-Path: <linux-media+bounces-24107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3506E9FD07E
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 06:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9688E1611C9
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2024 05:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29ED1369BB;
	Fri, 27 Dec 2024 05:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QfVVbWow";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="TNPhQoem"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B3F335D3;
	Fri, 27 Dec 2024 05:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735278992; cv=fail; b=TKGXD0FNa+85K3AElaAFWLATnBGa9TqC5OnUghAJSMfJ3o70EtHUYnmNUAPL/Zg+fpr5n+d6g2vqcmOAUxF7DXPbk2OEJENKNMrgclaZ3wnElve8wRuZR5J4pHqNE1zGkAITM3ZSxTCMUKdaX9OLT8wxSf/pC1rdVVv9gGfBepw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735278992; c=relaxed/simple;
	bh=SV2129PXpd/qb7+lS7F5IWxiOjQRoBxdRfjROHn+Tc8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kw8qfee7gS8lMEDaHZ8YHikQAEg+czjYey1/RorZDfCYfEcyxYlM0JpLSbl/xIosBxRHXlcrxJ8t37x4BkbN1/Ac/LG64Kst+VXzytUwk4fz/x7E/0/ZWQmKh6EyPqzyV/1NNzIzTR9gOTAuFpz/HciUJio2CvikAAjelI+6n/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=QfVVbWow; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=TNPhQoem; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4d60cbf0c41711efbd192953cf12861f-20241227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=SV2129PXpd/qb7+lS7F5IWxiOjQRoBxdRfjROHn+Tc8=;
	b=QfVVbWowCNxUG7FjTiQNDxh91nAuaCZbTFNqARO85JFAjJgl99Z2BrOhOl1UoedllcQnKeL+RkAAD09G1QyiJ2ku4vvGV7wIx98wAT9LPWG3FRJ/PogFn7NarXSMAQupTd3rsEqOHMFapP82F1jOSwQGAludBnjClXUdZ+TlYzc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:31b12481-d072-4b2a-82f2-afecc7df80ac,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:22cef118-ec44-4348-86ee-ebcff634972b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 4d60cbf0c41711efbd192953cf12861f-20241227
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 847502708; Fri, 27 Dec 2024 13:56:23 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 27 Dec 2024 13:56:22 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 27 Dec 2024 13:56:22 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eit+1ZfZmHaqOK2lM0+NEnbU+sWi0G+McFk/UgQssUVQNRmy5xMUKg2WIahf5vDKlhu68KMN8TulMheCavgiKearQ/UHsUb2sWdWn5lwkU3tnbAsOut+vtj0fLgWFJ8zh7F7NkA59LaTqDHeI9zkbSrX3OAEL/uLWxZk5BXVLndO9jHsYqGSn6/VHnQxfgV7Jt5IklddYsLPMIzBs78qdhTFhL7jnEATncoIOOK/5vF5ZJLZc/QNIJllbzD4hE5ThXDUdKkXoWlZ7PemCILzsxDpb8oDbRL3RtFHpZgLhztoEvP//G5LeKukXTfH/3+I6y+LdVVLq2BRTbQACXRIyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SV2129PXpd/qb7+lS7F5IWxiOjQRoBxdRfjROHn+Tc8=;
 b=q8JULTn/LqvKRjj6jquCTP5YFIiZtUtavXXDU1wQuNU70TOvbcD84eixfEkd/GymRzzYnjDxg6FI3kdx/z1kiCQQ8axsXhkjXMLruSqv7QvCd4LAn5zScGutKvKCYHKzAdBSQyu0Bok5Wy3GBq7r9ZMCziX6U/+pUtvzobMxKJkLEaKYZyEqPyBg/kXyF1BFon0fxB9ckIylqoeS41GRG015cFCiA3+AAtVUQZ3eCslrk6RamMWWoYNf6ou++VE6+yEbTF7yfd88L+yXDYVlkkpYHxpHaSVRFmPLMvD3vBo+uiH1iVVoD6VCmQm9oO2nsKIX2MvXwzozZgzhwsNfMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SV2129PXpd/qb7+lS7F5IWxiOjQRoBxdRfjROHn+Tc8=;
 b=TNPhQoemKaNEpG3vZ4+jwdW4vx1QO4ZXhotehbchbxRPzWg57PoW9LpD9xrpzdXlv+nCQ05b8PULhrqk9YtZ+yhQrR3RpPxLX+m22vLIrNciORlyd2R3PbgVwB/dFFKe1x4fPdVLCFCmUzEs1pZXv5fPeV92Fn6lboqxnmFLiMg=
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com (2603:1096:101:83::7)
 by TYZPR03MB8728.apcprd03.prod.outlook.com (2603:1096:405:66::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.15; Fri, 27 Dec
 2024 05:56:18 +0000
Received: from SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba]) by SEYPR03MB6626.apcprd03.prod.outlook.com
 ([fe80::9fa0:ee98:d5ed:beba%5]) with mapi id 15.20.8272.013; Fri, 27 Dec 2024
 05:56:18 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?Qm8gS29uZyAo5a2U5rOiKQ==?= <Bo.Kong@mediatek.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>
Subject: Re: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Topic: [PATCH v3 3/4] media: mediatek: add MT8188 AIE driver
Thread-Index: AQHbVqv2E/LiiDV3F0q0O1OD05OMm7L5mr6A
Date: Fri, 27 Dec 2024 05:56:18 +0000
Message-ID: <e2c20204500252aaa20f1dc813547fd9d304d611.camel@mediatek.com>
References: <20241225090113.17027-1-bo.kong@mediatek.com>
	 <20241225090113.17027-4-bo.kong@mediatek.com>
In-Reply-To: <20241225090113.17027-4-bo.kong@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR03MB6626:EE_|TYZPR03MB8728:EE_
x-ms-office365-filtering-correlation-id: 35911cde-d6aa-4ab5-72fe-08dd263b2ea9
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MjAvM3RZNURCclF2UzFvYm1zYXFwejFpQ0IrdFN4cGdUa0huVkRqZXNtY2NS?=
 =?utf-8?B?SVJOeCtWUU9YSUJhbjErNC9nN0ZKT0FTUEF3Qm1pUzBIZ2lBOGl2VTBOUmZW?=
 =?utf-8?B?dTVtWkRzVXB0R0dMUmhIR2JXREtrTXdnY1ByaUM3ZmROWGZJNWMyclpLenE3?=
 =?utf-8?B?em5hYThENUNNaGZYWm01RmxXN1QzMUlHeFZ5Nko1WjE1Skp0RGttS0tHbDFh?=
 =?utf-8?B?d0pNcmwwaHFMRzhEemR2bHpLUjNhbDJKdU93TUhkMElkSzdtUldRYTZDTkVm?=
 =?utf-8?B?RXIwdm9WNWsvS1VaR2dYTFc0N3JhQnFxNVhIdFZ2dmRRS1hCYnJCaU1MMDNs?=
 =?utf-8?B?dmFKUXdvMnJJb3ZvUGZUYXZNT1dEdDdsTFQwQnc2Uzl5SXBDZEV5LzlVQUxl?=
 =?utf-8?B?blZ4cXdlcWFQR29PbnVKaDRFSi9qMkpVRVdyN1hDRkd0ZTlxeWV1QTJtRm1n?=
 =?utf-8?B?c2JpdVMxSVdnRXBxbGJxUUpFTVhhWnpkRjU2SjFkSWFPOVdxWk01dlM0eCtK?=
 =?utf-8?B?MkM0cVUwa1Y3aXNEUm4zRzRabkpZS1ZJK1c3VHJObXFrWHRpZ1UxZytUN2pT?=
 =?utf-8?B?UVRTY3ZUSmdzcmRlbEJVY2h4U1o2TFBsbjYzako4REdKa0xXYzhVMm9EbHE1?=
 =?utf-8?B?WlY0VlNUVW1OVFVtandRUXRMd1Foa0JlM0s2UEJFcTdXSnJ2Q1krMFlRNHBB?=
 =?utf-8?B?emRrWEw3UVV0QWNGeFc4NlZDcldwMFh5Skt6WmkyaU5USVNGTXB0ck8yVXBL?=
 =?utf-8?B?aFlvMHMrUnA5eUdBNVVteEVZWTNHaGFhK0V3Wjd3aWQ4Mk4yYmFLN09zT2Z3?=
 =?utf-8?B?MHpkQy90dXF1dExrcFhPQklTbThvRUpxVHRwWmcwSGVEa2YyT3FkRFFla1cz?=
 =?utf-8?B?QkhQT2JGckxiU2xQYVM2Wi83b3VPUFhyYUpiRWFDOHdWRGNjSldKc3ozUzJa?=
 =?utf-8?B?M0QrcXkrODBtL3IvNjVIQURObDdwRUpqN1FMaEVmek55NnRjRDVhcnJqdlJv?=
 =?utf-8?B?WmVUNlc1dCswUWNiWFYzRGVkb2dMcjRCVVB6WHR6NTVyN1FtNHpiZHB0Vk5i?=
 =?utf-8?B?ZHE0Qmd3aXZ5dytUNVJiTEdESnRUaHFsRHI0dTdqd2xYQTlZdGRtVXJ2YVZ3?=
 =?utf-8?B?VGlWUFRxb3FxTzBVb0g0bFFXWEFNcHFUU3dPZGMvTHk4YlQ1L2RqZm0wdXkr?=
 =?utf-8?B?elpITnRlc2swdmN6Mk83WjlraFowMmJpT2hjYitjREZVSnR5eCs3eGxiYmJo?=
 =?utf-8?B?Skx2dGhiN0o4dVNlZW90dEFzSi9vTzhOa1ZVT25xVG9rZjQ1WHBPQTl6Nkgx?=
 =?utf-8?B?dFQwWXYrZ2YzODYxVC9qejRrcnZuaXd4QWtrVUJ2L2Y2YnpGTCs2MUZtbnI4?=
 =?utf-8?B?OG1LZzhVUHF6OFZwR1Bxelg1d2YzaEFrdUNvZHk0Q0pFZjhoMkQzY2gzRXg0?=
 =?utf-8?B?SnJYK0pNZkwvL3FGS0ljOTVqRjBtRTVQdUpDVzVydEQrcDRXYTBXS3Mrd0V4?=
 =?utf-8?B?WDVPd3dtV3htWTFUaXROQldDMTc5bDA4ZWM3ODlneWpDdytxbHdrT0VDWDJj?=
 =?utf-8?B?RmY3L25jUEpEQmRzQ1U0aUtIN3RFbGJkeGRaUjN6NkI3L04zdXZaWUR5UFBM?=
 =?utf-8?B?WXpadDMyaDlaakY1V0E4a1RGbWpVbmcyN3hhY29MQWNVeDJhTElqRWV2QnFu?=
 =?utf-8?B?dnY0MTZrTjk2ZS9QdktNQVJKdTNENG5HV0FMNVRBVCtydEIyaDVTclBFU0ZV?=
 =?utf-8?B?ajFHczREa0RGRjNHV3FyaENCeGVSUC93dms1SzBzUzRHUjM1UXlBaCtmc2ZI?=
 =?utf-8?B?N3hhSWp5TSthMExHNmhXSVRTekd3TmlMUVNwU1dFL2Y5WTJ4TzQyVzBMYzl2?=
 =?utf-8?B?Wk93ZUJxeGZnckNHN0p1QUhzVER1N3E4VUhkM29UYmZwZFp2S3A0VEhDOEYw?=
 =?utf-8?Q?Pu+LIP7aH2HRbNKi0dKuLHwBAiXA5Zmg?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR03MB6626.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mnk4TXV0NS9adGtRUWdNdlMza2lDQTdTc1p1Y281WXdZSXRPcnRpTys3SzFC?=
 =?utf-8?B?OWZPM2VZK1BRaHdHLzNHYXJLS0EyRGM1TFNUeGFjSjBQZWlPcElLUFNid1hX?=
 =?utf-8?B?RlRFKzVMUTg1bGlhOVVOcWxpSFBid1Q0M2dmNHMyRVJvcnZnbU80SWE3aFFH?=
 =?utf-8?B?QnUzWWRtdGdsdnZzbHFXYWpGc200dVlIcnY5SEY2cnBkbjE0SEV2NENhaXNl?=
 =?utf-8?B?VDJha01nYXJDazgxY2dDeGF6WEZ1eWpNREhxeEVYRkxEbUR5QmQyc0dIRFdJ?=
 =?utf-8?B?ZHpTUXVRL1VlL2N2WWt6TnNtTUE4SlVCNWlkSlNkVk0rb0NsaVlsWitaclN0?=
 =?utf-8?B?OXUyTlY2VVFtYSthMWlpSCs0MVk5djBFaGFleHdJM1c3YlBaWFZHYnhGTW0z?=
 =?utf-8?B?RW1FOG1GN21iYW9UQk1HMXo2K1ZGT25wTks1YjVWVXNwc0ZIVTZ1bW5WTmFF?=
 =?utf-8?B?aFIwQmgzeUVqZWQzd2I3RnNTYWIrWDFORlY0a05Kd1ZZbG1SWXg5R3lHNFho?=
 =?utf-8?B?bWJjcU1pdTRsczZWZm9wTkhDTzVNMVJrWnpIbEJMbHRCYzRYT3hXZkFjcHJs?=
 =?utf-8?B?Y3lJcDloM1Joc1ZzL0w1dDVvZ2V1OWtBWnRVaFV2ZGZpVUVKTUNEaVVldVl5?=
 =?utf-8?B?bTY2eVp4WVNVWGhmSjh2SEdYY0tSSG05TUh6RGYzTS92RjNncTBxdDVhNENm?=
 =?utf-8?B?bFBJTmJJbUx6Mnc3QTA3Z0JCMERKcmtWOTdOTTlxSmV0ZkpqRTRmYVVrQU5Z?=
 =?utf-8?B?ZE1uZkQ1aVFlYjhQdGYyaldSTGZLVGk0WmJ4Y0NyRnJPUnVqSHI3dGJlUDZy?=
 =?utf-8?B?TkNZdE1wdkswYmsySkVrWUxwRzZoT0ZwaEplamFaTWFmSkNVNEZlTWFUYm5M?=
 =?utf-8?B?b3l3WGNhOFJCMFQxUDg1OFhnTno0QndsK3hhTEVWbkQ2RGVIaVllRG9ic2Ux?=
 =?utf-8?B?SkpxL1ZjVjl5TzJVM2FJREgyRnJiV29neVAwclNKVEpJZ2RZMVAyVzFpdHcx?=
 =?utf-8?B?MmxYVWlyRG9GSlZ1MTNiSkVueEV6MFcrQkxpTW5UbXZPOUpkYXRrNllhelY1?=
 =?utf-8?B?aENLb0hCZGhHYS9wc1laL3BYcW81WmRjT3hqVGVDWTgzTXgrTWZjSUx1SVds?=
 =?utf-8?B?anRZT0xzK1djOTgzZTZvaTdxRXhnNjdndnMrZjBFQzE5ZjFWSnZQQW5wZS9U?=
 =?utf-8?B?ZWtQN3VRZzNGYW9aQ2xMWit1NEhkUVh2WlJtNWtLM29VQ3p6eEVtNnhsclpv?=
 =?utf-8?B?ejRlV3VVQVZ0L29UeUtWVDAxV1V6OVpWWjFlNGFWcXNuRDVIR0V0SHNWTzRp?=
 =?utf-8?B?em9VNU5qeWdNTnZjZXkwY05EamNmYk1FdHJQcmU2ZHA5V1ZaTmF2Mm1wb0x2?=
 =?utf-8?B?cGdGb2NNTUVLWnM2MEhnNnRRQmZwVkM0ZytiZEZXUHcvcWpuQXdqZXlVVmZr?=
 =?utf-8?B?ajJ6dVZVUlJqN2ZxUGxMUUFXSXY2YjFxd0psdjZscDdiZWpGLytKaEZGZlI0?=
 =?utf-8?B?YUtiL3k4cmJtekpPOTVVR1ZKcGhJQzk2QUJCOWJUVFl4Rld4VFREcVZpV3hs?=
 =?utf-8?B?ZGVsTkU0TE1EYmJVcUtySmw2V3VqaTZ6eGhOSXNhbVBybzZEcXFVZGtzSDFh?=
 =?utf-8?B?bXNxZDkxRzFGQzRxV0dGejMxQ2ZranRTcVpmRjRMOU9zUC9RYkJZaWNWaGFD?=
 =?utf-8?B?b2FVVHZrM0VSaThZNVhNR1lNcm1GeWVySzdYUzlsb2F5enJIRXhoL3lBQlo3?=
 =?utf-8?B?K01iSmI1MjVvZUVWRGdFSHQ5M1NxMEt0eXc2RjNKdEdSUi9xeFdYREw4bVZZ?=
 =?utf-8?B?Ump5azRQb1o3M0tJb295WUgwWjJQTVZuOHJwTlMweG85ZTZtQjdkbk1TVkNV?=
 =?utf-8?B?Y0FVNXVDQU1pWWt0Sm5WZEgxSWxGYWk5dDE1eDlxMU81M2N2ekVlSWxqdEU0?=
 =?utf-8?B?alpzUXZTNndPZFRhRzZTYTZ4ZkRabmQ2QkxzcE9HWG50dzNUNGphZk03N0tp?=
 =?utf-8?B?WXdRK1p2dFpxUjJPRHp2YWdRdmpFTzlIZE5SQzVkeFJXTVZMeHp6STh0eUxk?=
 =?utf-8?B?d3ladkZxaGprLzdURGtaSXBLTXBjenNJb2txM1ZOQ2FIbGlMRVJzYjNoNWIw?=
 =?utf-8?Q?wieJcqCztKiPCgYY5/+o8jZfl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B11D5DC06435004AA12878D806C76CE8@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR03MB6626.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35911cde-d6aa-4ab5-72fe-08dd263b2ea9
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2024 05:56:18.3711
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6GYX3pnQGnADz9/Q7bU7cfXP4fIFiGxf5swMIkfMhPb/2il+0GI5GgVsNbt3GUovHVi8TtGMzdHHYma1xT4hKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8728

T24gV2VkLCAyMDI0LTEyLTI1IGF0IDE3OjAwICswODAwLCBiby5rb25nIHdyb3RlOg0KPiBGcm9t
OiBCbyBLb25nIDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFkZCBhIFY0TDIgc3ViLWRl
dmljZSBkcml2ZXIgZm9yIE1UODE4OCBBSUUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCbyBLb25n
IDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICtzdGF0aWMgaW50
IGFpZV9jb25maWdfZHJhbShzdHJ1Y3QgbXRrX2FpZV9kZXYgKmZkLCBzdHJ1Y3QgYWllX2VucV9p
bmZvICphaWVfY2ZnKQ0KPiArew0KPiArCWludCByZXQgPSAtRUlOVkFMOw0KPiArDQo+ICsJaWYg
KGFpZV9jZmctPnNlbF9tb2RlID09IEZETU9ERSkgew0KPiArCQlyZXQgPSBhaWVfY29uZmlnX3ky
cihmZCwgYWllX2NmZywgYWllX2NmZy0+c2VsX21vZGUpOw0KDQpUaGlzIGNvZGUgaXMgaWRlbnRp
Y2FsIHdpdGggQVRUUklCVVRFTU9ERSwgc28gbW92ZSB0aGlzIG91dCBvZiB0aGlzIGlmLWNhc2Uu
DQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsJCWlmIChyZXQpDQo+ICsJCQlyZXR1cm4gcmV0Ow0KPiAr
DQo+ICsJCXJldCA9IGFpZV9jb25maWdfcnMoZmQsIGFpZV9jZmcpOw0KPiArCQlpZiAocmV0KQ0K
PiArCQkJcmV0dXJuIHJldDsNCj4gKw0KPiArCQlyZXQgPSBhaWVfY29uZmlnX25ldHdvcmsoZmQs
IGFpZV9jZmcpOw0KPiArCQlpZiAocmV0KQ0KPiArCQkJcmV0dXJuIHJldDsNCj4gKw0KPiArCX0g
ZWxzZSBpZiAoYWllX2NmZy0+c2VsX21vZGUgPT0gQVRUUklCVVRFTU9ERSkgew0KPiArCQlyZXQg
PSBhaWVfY29uZmlnX3kycihmZCwgYWllX2NmZywgYWllX2NmZy0+c2VsX21vZGUpOw0KPiArCQlp
ZiAocmV0KQ0KPiArCQkJcmV0dXJuIHJldDsNCj4gKw0KPiArCQlyZXQgPSBhaWVfY29uZmlnX2F0
dHJfbmV0d29yayhmZCwgYWllX2NmZyk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlyZXR1cm4gcmV0
Ow0KPiArCX0NCj4gKw0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCg0K

