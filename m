Return-Path: <linux-media+bounces-47189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DA3C627D3
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 07:15:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB9923B3262
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 06:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA4F315761;
	Mon, 17 Nov 2025 06:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Pw/E7Jmt";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="C7E90vDp"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B68314D0C;
	Mon, 17 Nov 2025 06:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763360089; cv=fail; b=LawfuxeUATC6ZPbOL8kzj8s4+jcomhOCd178g/4MRyexc1e8/FU8A2J/F4kUyOBM+29TKHXInPWC/iBRlbGsxXlFpCvZnacmfM+C3RN9cXc9F+rsY1ANbRdaU47t2scr8dcAkSPwXJoaJdegi0ymwOOgJLjKn93naX/Nl153CPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763360089; c=relaxed/simple;
	bh=2JicV/bBLckltAoevsVOfilNNE/vc6qG8xOSOxT0qZw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lv2LoeozvBed1BJNhMdbNviU89BrwfgkInqCOPbDeI0dMhHDKJmqgmdexE0qku61ouH+oMXj7ZGsspHMFztCifJVeVmqiXJPZ6ygnupwCNFzW3FdUzrPirhEngW+4w+DOdkPQeDtpxLRMRUJF/bJRm1znG3gWInSotnsw5RPHJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Pw/E7Jmt; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=C7E90vDp; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b0d4cf50c37c11f0b33aeb1e7f16c2b6-20251117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=2JicV/bBLckltAoevsVOfilNNE/vc6qG8xOSOxT0qZw=;
	b=Pw/E7JmtLX2PsHVm6d112Fu2zEe9WrgzQQsPuF7KRsNnXnT0mWdcqMJsprwhfu7cwu0piImepe/MomToyzpYBepbGANZ4x/5UnxEh3/5KI6D0um7aI8+XEEtJAu0sJHknNS692+yGENkA1tvuPES8TM+CkKc9HjIX63NRg3BBP4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:748b909d-6d6f-4d56-8438-4d51bcd89c74,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:8320b982-b6af-4b29-9981-6bf838f9504d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|888|898,
	TC:-5,Content:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BE
	C:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b0d4cf50c37c11f0b33aeb1e7f16c2b6-20251117
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2107872010; Mon, 17 Nov 2025 14:14:35 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 17 Nov 2025 14:14:34 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Mon, 17 Nov 2025 14:14:34 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vTE/smE2F2ktmu6crItB+s2ccxD3LnvY7VLOMk4h2Omomf7UhLNR6VwESRstD3OAiL/HUfU1bRoWgFBCkUOvAu28SxDrzeh25ixOJ6k7SbnNVUK/ejJnT+Ra+jJtFGp9BBCkTR9O9r+QWLRQxQXMaBN8MX9b5fqnFNCQupkKu5+/l0pVfXkr3lnvk4DEt2XC6lSkY7rO/mhQGS8TMPqCjWXIL+mIZ48i1gf/94IU7Qg8Ei/oY8VjoBg5AWiIC0MSXiCaTPdhRHSoKAR1/esq7mxRaCtTs3lqUte72u5J2HU5LGsAXyyQ1fsKgjmhGv2eI+FIMfhtjHzSGrLhQOxbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JicV/bBLckltAoevsVOfilNNE/vc6qG8xOSOxT0qZw=;
 b=y8L11bMGHnw5+fLb6m1yuuP4Spmunc8pco/bamblHx4brDfarkSnYCz2t5QeMmgyTg1B+ia2PEzoWMElu8Hw/58XIy60SjqjxnLGf3kNq7W0Z6qJCNVSqvI3brISRcLsZSdL2TXMmjGuCyuPkRmzNTt9Kv3+HmdcZs2PuaQ3o5MN1Lf9QSzuNSyfVm/zwz7q5Q0Cpmg/wyAm34icSqG0/kG4vmh28j95C4kcYSZ8JbfCi7vQ0CRA6g2RynNJSCDSEmV90PUnRlyYKKNxrwKbIK/eSA/dfZCyelslCx6CMPYgmlLztxpazxKlgmWJQNLRD4HXVUxt0xkOtW+97e/2QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JicV/bBLckltAoevsVOfilNNE/vc6qG8xOSOxT0qZw=;
 b=C7E90vDpoDclERnNr8bU0Cf/+EtKGCe159AIWxfpmnfjUZtfAVPWPQGZE5YNly8udNUK5dvogdls6w7qsyLAt6YPmDy+IO+jnIm+4x2tOGhjA4PnN1JQEl+QUd2BBJKx01uz2TeBZqzI5tW50ZBsMcO7JJMwyI83lYcG7a1hF8w=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by SEZPR03MB7589.apcprd03.prod.outlook.com (2603:1096:101:128::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Mon, 17 Nov
 2025 06:14:31 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::a013:f3b3:a461:8ece%4]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 06:14:31 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?R2VvcmdlIFN1biAo5a2Z5p6XKQ==?= <George.Sun@mediatek.com>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"nhebert@chromium.org" <nhebert@chromium.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"robh@kernel.org" <robh@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?WWlsb25nIFpob3UgKOWRqOaYk+m+mSk=?= <Yilong.Zhou@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "arnd@arndb.de" <arnd@arndb.de>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 8/8] media: mediatek: encoder: Add MT8189 encoder
 compatible data
Thread-Topic: [PATCH v5 8/8] media: mediatek: encoder: Add MT8189 encoder
 compatible data
Thread-Index: AQHcTuSm/TgcrDa9YUKmU73nDnoy+rTlu6+AgBC5ZIA=
Date: Mon, 17 Nov 2025 06:14:30 +0000
Message-ID: <3d1d2a8da4cede0f3737e0cc70f9918f4126c97e.camel@mediatek.com>
References: <20251106061323.2193-1-kyrie.wu@mediatek.com>
	 <20251106061323.2193-9-kyrie.wu@mediatek.com>
	 <21be57561dbf7bd28367193e62296a43212e6030.camel@collabora.com>
In-Reply-To: <21be57561dbf7bd28367193e62296a43212e6030.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|SEZPR03MB7589:EE_
x-ms-office365-filtering-correlation-id: af3df924-8248-472a-52f8-08de25a09230
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NFVUUzFhTG54Q2NEMURxd0JXb20wZngrZmtwM2dqMGFRbDNadW80MW5QQWxj?=
 =?utf-8?B?S0RRMElqWkFnMlVEVW0rZlFQNTlPWkNDaVZGUm1JUWg1eGt6T3JXeGluUWM4?=
 =?utf-8?B?WGluNmFYQkJtdnNKaDVFUFhpWEdLbnE5WE1XYjZRMnRFcTl5STh4Z0RXTHlq?=
 =?utf-8?B?VzJycDJTanNudFlwWk1LbjlBZDlUUGlBSFhsU2MzZ3VMUVRXN3owWThjVzJp?=
 =?utf-8?B?YWhtNFNsVlpWc3dNQUpqR0I4ZWJ0L1RmU2xtMzl4NDNhS3RmZUNRTDY4YzRV?=
 =?utf-8?B?WUp4ZmZXUXhWUTIzbVB2dzNxYko0MkFEL28yY1hrek0xcHJEUll3M0pqdWJz?=
 =?utf-8?B?ZjNwMWFZcnV4U2l3aWRqZ1BlUjFyanNSTHdNd2dlemdjbUk4UDhCaUpVM21V?=
 =?utf-8?B?VkRXd1M2T0Qwa01iZm1RdUxWeGRxOEEvWmZKTit3VXU5TnZTbDMrSmpzSGhN?=
 =?utf-8?B?MmlXNTB0RnpQNTFKWWIzMy8vdG1nSUtRNGNyK0NNQ2NkWURQM3pFcXQrVWE4?=
 =?utf-8?B?clpQYjhYNzlmRnJRUFlLbWNNajNEalBpVW5GUUJVcGMvNCtsdG41eGpCWHpu?=
 =?utf-8?B?dCsvQW92ZlVPQm43NTNlMWRyMGFubjNEdm1ma2J3cFdCOVUyanJLYldGbE1w?=
 =?utf-8?B?akVOemo0RHRlYWdHYVQ5L245U0oyR0dwVUhZR0RqbExlVFQxZXJGWElMRDBU?=
 =?utf-8?B?RXJ4aFkzRm9IRktTeW1DbWxxUWJQN3RvVGpCWWxyZmtsbnhYR3l6YWlUaHN6?=
 =?utf-8?B?N1IvaVVBRXlVdnpuOVJ5UzVSdDRIcVhUYkZxMzM1UDJ0c0lCMGQzejh4VGlY?=
 =?utf-8?B?bWRFWFI4UTN4VTNHRFNJY1dLRmJIOU9YK0t1NVdsZktZeWtVcXptWmhDZ2E4?=
 =?utf-8?B?WmVQNmF3TGlna0Z2TmdYTytiL29qdHRSN2FySVhkQmlubzEyZ0lsekxjTDJ6?=
 =?utf-8?B?OEFQeTQ2Uk9oa3BpdHpiUVZMb0E4NWFqMkZUUFAwLythbXJFK2MrK2FOZDRW?=
 =?utf-8?B?TFFyU3J0enM3bWU0Y2pmd3BBZDdoK2xPNng4MERjYi91WExrZ2Rsc2hVMEY5?=
 =?utf-8?B?aStKanVwSlBWZzNSc3JVQ3pURFRnYm5SODYwaFg3TmhGSXRLOTBJa3FZM21I?=
 =?utf-8?B?ZTRiMlZ6NjV2anUzVXQ2RjB6bXBOU000ZVhjS0RGMG9LMzY3RVJRWTg1L1cr?=
 =?utf-8?B?MHpPS3Eva0NBVXc1OFNYQVlsaXRwSmFsak5xNkIvQ2RseGdxR29wWGlPak9S?=
 =?utf-8?B?SVZlUjdJRDVCYVVnckExZWM4RDgzdzBnQURwQmNSSENyMmVuNzF3aUJ2NTh2?=
 =?utf-8?B?emdEOG10YVltdko3OGxVd0JyMkZEUlY2WWs4ZThQZjFod3kwdjlCQTdKNzE5?=
 =?utf-8?B?UDBrQmF2RkdMdXJ6c0YwT0NmK1pWQVgwZzFONkI2NnhVY28zNUFrRXJjQ1FJ?=
 =?utf-8?B?dmdQVW9hb3gyNE5ObnU0SUdsL0plWGhUeCtIVmg0UGNGTi9LVTlFWUQxMWxW?=
 =?utf-8?B?bnBwMlIwOHpvamNqbWhuNjFaTUEzTW0rTlBvS0NPY3hRSjU1bWhObjBPdkww?=
 =?utf-8?B?UXpURkRUb29EalBqRGkzMDQwNUo1VmRycUhIcStBWHhLTXdHeGNKdWRPYVJB?=
 =?utf-8?B?UGlRQklEbkNwUHBmZmp1YysrNnA0b2s3Z2kzMU9lcjRDeVJyQXl6SDRVNHZJ?=
 =?utf-8?B?bXBZYXFjUDBBTDVGOFpTUTF3T0VUMFhtcnJ4SHMyaU9tc2kxTDlnTGltdEtk?=
 =?utf-8?B?OWpwbFpicmNoa3lQMXd1bWpxNmlnTk1JaXRSQTlpaDdXa3BHZ1BMOG5xd3N5?=
 =?utf-8?B?ZG1MWm1Bc2lqZ05wMkJSMG02QVAwT1hKYXJ1OWNTRHZTNXJxQjRRS3I3YTk4?=
 =?utf-8?B?dHlBOEtXYmZzZy84d1ZMdEQ2VTRPYXJISUVhcmhpNEZaaXRIckM5bDNtdklU?=
 =?utf-8?B?ZG1FRUVhYW11ck5OcG14ZmxGMmxzU1dhdjBlb0ZmUU9OMThPY0o4SmhDQ1Nn?=
 =?utf-8?B?bVdQY3VHZjBva1VnZFRJU1V0a1AzVkEwd0U5Unc2Wm9vT1NXcFRHS2EwbTcx?=
 =?utf-8?B?TWpYTmIrRUkvV0V6dllod3Q1Mmg5V3ZhRzVFQT09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVRrY2NhZnJBZUxFbnR5dU9kWmR0UEFGRGt5cDcxdkNhR0kzMzl4U2UyMkY0?=
 =?utf-8?B?alo2NjFFRlozc0F3Z2tvaDhlK3dGSXVKSkd1Z2JxMzB5ZER1ZGFGcGVZQmRD?=
 =?utf-8?B?cUwra0dhV3QrMlZyZ05zdDViSHV2WFJGRkVuWDRFTDNUNGZwTlRjK2lNeFlF?=
 =?utf-8?B?V1NiQkZib0JWMVlqV2JVQktQd3VrcVNBb2Q4anZOb3doWXdDcUxud3pocTFW?=
 =?utf-8?B?bUcyZkNEYkNiRjV5WUF0NE1VREMzRjBBT2lQdkZzaWplb2puWXAyM2h2NDFI?=
 =?utf-8?B?K2dNWUIwZUdPQTgvNWpiaU5udkJRVFRQL1hibUZzWVM2bTE3VUhsbjIrMEJB?=
 =?utf-8?B?b2pHSzc5My9MSGpsWjc3WjRacTBrbW1GT3VYMStCaVhlSm5wVE54SjJ6Q2pt?=
 =?utf-8?B?bmVKZVdGZ2pMMTVYblVSQzJEV2Z4MEVCdGllRUliVTVNUFdnMmhxNE1pa0hY?=
 =?utf-8?B?ZzFsSTlqcmh6UjlpWTcyTGF0aEJGeS9mRkxaa1JRVGlWbC9qSWQ2NlVhQnlL?=
 =?utf-8?B?RW9oMGJOcTNTaEZ6dDJwR1lMK2x4ZXRpWi9nREE5cUR5SDBBdFJTN2YwMjhr?=
 =?utf-8?B?OGRNZXNZaHdheW9Nd2lEMG9VT0NOallVRnNDYjhZdjFWQnU4Z0hUL1dtclpo?=
 =?utf-8?B?dFE5SnozaU5rL2dIc3YycHRJOGxHSlZENEtmNmk0RUMxMGNqSStQcVVRSFFs?=
 =?utf-8?B?eXRUMkgxaWppWFdINkVIZytYYlc4NEVtRFlxenZ2Yzh0Rjd5OENTQWdlOWJw?=
 =?utf-8?B?UVVUWFBZWHI3bzRiWWtlbFVsN1QxWEttdXdlaWlvcUtwOHFwS1EvQkppOWQ0?=
 =?utf-8?B?ZFlnY1crY0pvUnhNVTN3UVNQSFo0S01ZOGVqQklMeEd5NlhLa3ByeGs5Nm5O?=
 =?utf-8?B?T2RIUDJaSklvUnpuSFBpalBHaHQ2bDloUUNCZzBZOFplRkI3alNxdyt4MzhK?=
 =?utf-8?B?elZrczFyYmVheENwbmFtaXlqUjFQMk92dTRCRzkyRHhnZ1BFYm1yTGdUSWpt?=
 =?utf-8?B?YkNSZ2w2cUl0S1RiRzE4aUQyMTE2dU9sTU9PMTJBNjFyNXBPbUxwa0hmc3ln?=
 =?utf-8?B?emNudWpLenk3bXZZTW44QXNSMjZVSDkrSURacER5enMwQlU3UmFITHVMM0M1?=
 =?utf-8?B?YzVFbUtPWXJnaWNwRVJPWS9hYkJtMGlvZ3locjdZdnEzRmc3Q0VYUDlMdUhq?=
 =?utf-8?B?TE5ueWpPMlVIcGNicGZURTdhaHl4VmVDRjRIOEZSL05MVWFzTThWelZaZlIy?=
 =?utf-8?B?enJxZm1qbkFWOFBBRlo0SHRnTTVscmhFVFdJQjZueFM2OE5LTXlhTFc3T1lV?=
 =?utf-8?B?S1ZSNjRhTlNLRlMzVzRVSnlyRFhFSUpkbUdPUDdkcFNwWTRHajBFOTJLczdw?=
 =?utf-8?B?ZDNQdjg3MXlXeWo2dEtPTlR1LzhDV3V4dU5WTjVuS0w5M3MrS0gwdUIxSkIw?=
 =?utf-8?B?Tkd4M3g5VUdPNS9vd0NjYVhzNlpDL3l1RXp2NUlOWW51YzJyY3ZzVWdCMFBk?=
 =?utf-8?B?NWFrb0xzY2JDVk5TcFFqRWV6cW1XQUNJOVR3MmNNRXNZbTY1ZzFVUUxFdHJl?=
 =?utf-8?B?SzBGRlRnUWttNjJyRGFXYmQ4M0hjVy9VZE5FbUdxUlNDNnI0MzdKcGNaeS9Z?=
 =?utf-8?B?NVBGM2ZLcUNzRFdJZ0NCamJ5Mzllek9tMFNQcnRBOGpYYkNSSDZoY0Z1aU9p?=
 =?utf-8?B?aDFoVlNWQjRLc3JxbmF0Y3AxRURQaFNxRUYydGFGelZWNFRPUU1MVkkvbVhi?=
 =?utf-8?B?ZEFGK2wwRnY2UkZ4aFBQL0dVcUtONzZldWhNcEhqOXpsM3lrRTExZmsrWnpr?=
 =?utf-8?B?d291K2xjQ01RTzhocHp1SnN6YUlVK1o1SVVMUGk5OXo5eVdrTStCeG9GcWtH?=
 =?utf-8?B?MHFiTEpWS0VnZ0NWRkNzZE5yb21uUklKMjhlcTRYcjBSMWR3dDFDRi95U3Y4?=
 =?utf-8?B?NkkzM0xDQVZPeVduRXJaenFCdkF3cTU1OFRNQU8zcVpQcUx4THZHTmxLVFdo?=
 =?utf-8?B?U1gvRUkwRlduNitTUlNwSG90Q2pWZXVCbDg5RWluZ2h1NS9NR2NUdW53ZFVx?=
 =?utf-8?B?YzlUYWh1TXRTRWhhTU5WMmVHRE9ENGdJMFI2bk5DK3k1VFh4WTRGbnBIMDhp?=
 =?utf-8?Q?ETle0SjJrJ1tuKS4IKiTLU+Oc?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A93B660FC52CDE4C94784AAE01544EED@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af3df924-8248-472a-52f8-08de25a09230
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 06:14:31.0472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kvn3J8kjdvLnt+cnmKqDBLumkzAy4+O5Z10e0p0Yr5wP4w0eKN2Q+RZoG8MFeuo/WDZS+/Si/05iL9mKV3SHiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7589

T24gVGh1LCAyMDI1LTExLTA2IGF0IDA5OjUwIC0wNTAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBMZSBqZXVkaSAwNiBub3ZlbWJyZSAyMDI1IMOgIDE0OjEzICswODAwLCBLeXJpZSBXdSBh
IMOpY3JpdCA6DQo+ID4gYWRkIGNvbXBhdGlibGUgZGF0YSB0byBzdXBwb3J0IE1UODE4OSBlbmNv
ZGluZy4NCj4gDQo+IERvbid0IGNvcHkgeW91ciBzdWJqZWN0LCBicmllZmx5IGRlc2NyaWJlIHRo
ZSBjb25maWd1cmF0aW9uIGluc3RlYWQuDQo+IA0KPiBOaWNvbGFzDQo+IA0KRGVhciBOaWNvbGFz
LA0KDQpUaGFua3MgZm9yIHlvdXIgcmVtaW5kaW5nLCBJIHdpbGwgZml4IHRoZSBzdWJqZWN0IGFu
ZCBjb21taXQgbWVzc2FnZXMNCmluIHRoZSBjb21pbmcgdmVyc2lvbi4NCg0KVGhhbmtzLg0KDQpS
ZWdhcmRzLA0KS3lyaWUNCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBLeXJpZSBXdSA8a3lyaWUu
d3VAbWVkaWF0ZWsuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubw0KPiA+IDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+ID4g
LS0tDQo+ID4gIC4uLi9tZWRpYXRlay92Y29kZWMvZW5jb2Rlci9tdGtfdmNvZGVjX2VuY19kcnYu
YyAgIHwgMTQNCj4gPiArKysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5z
ZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2VuY29kZXIvbXRrX3Zjb2RlY19lbmNfZHJ2DQo+ID4gLmMN
Cj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2VuY29kZXIvbXRr
X3Zjb2RlY19lbmNfZHJ2DQo+ID4gLmMNCj4gPiBpbmRleCA2YjNkMmU3MmZhZDkuLjJjYzkyYThm
N2EwZCAxMDA2NDQNCj4gPiAtLS0NCj4gPiBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0
ZWsvdmNvZGVjL2VuY29kZXIvbXRrX3Zjb2RlY19lbmNfZHJ2DQo+ID4gLmMNCj4gPiArKysNCj4g
PiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL2VuY29kZXIvbXRrX3Zj
b2RlY19lbmNfZHJ2DQo+ID4gLmMNCj4gPiBAQCAtNDY3LDYgKzQ2NywxOSBAQCBzdGF0aWMgY29u
c3Qgc3RydWN0IG10a192Y29kZWNfZW5jX3BkYXRhDQo+ID4gbXQ4MTk2X3BkYXRhID0gew0KPiA+
ICAJLnNldF9kbWFfYml0X21hc2sgPSB0cnVlLA0KPiA+ICB9Ow0KPiA+ICANCj4gPiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBtdGtfdmNvZGVjX2VuY19wZGF0YSBtdDgxODlfcGRhdGEgPSB7DQo+ID4g
KwkudmVuY19tb2RlbF9udW0gPSA4MTg5LA0KPiA+ICsJLmNhcHR1cmVfZm9ybWF0cyA9IG10a192
aWRlb19mb3JtYXRzX2NhcHR1cmVfaDI2NCwNCj4gPiArCS5udW1fY2FwdHVyZV9mb3JtYXRzID0N
Cj4gPiBBUlJBWV9TSVpFKG10a192aWRlb19mb3JtYXRzX2NhcHR1cmVfaDI2NCksDQo+ID4gKwku
b3V0cHV0X2Zvcm1hdHMgPSBtdGtfdmlkZW9fZm9ybWF0c19vdXRwdXQsDQo+ID4gKwkubnVtX291
dHB1dF9mb3JtYXRzID0gQVJSQVlfU0laRShtdGtfdmlkZW9fZm9ybWF0c19vdXRwdXQpLA0KPiA+
ICsJLm1pbl9iaXRyYXRlID0gNjQsDQo+ID4gKwkubWF4X2JpdHJhdGUgPSAxMDAwMDAwMDAsDQo+
ID4gKwkuY29yZV9pZCA9IFZFTkNfU1lTLA0KPiA+ICsJLnVzZXNfY29tbW9uX2Z3X2lmYWNlID0g
dHJ1ZSwNCj4gPiArCS5zZXRfZG1hX2JpdF9tYXNrID0gdHJ1ZSwNCj4gPiArfTsNCj4gPiArDQo+
ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG10a192Y29kZWNfZW5jX21hdGNo
W10gPSB7DQo+ID4gIAl7LmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4MTczLXZjb2RlYy1lbmMi
LA0KPiA+ICAJCQkuZGF0YSA9ICZtdDgxNzNfYXZjX3BkYXRhfSwNCj4gPiBAQCAtNDc3LDYgKzQ5
MCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkDQo+ID4gbXRrX3Zjb2RlY19l
bmNfbWF0Y2hbXSA9DQo+ID4gew0KPiA+ICAJey5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5
Mi12Y29kZWMtZW5jIiwgLmRhdGEgPQ0KPiA+ICZtdDgxOTJfcGRhdGF9LA0KPiA+ICAJey5jb21w
YXRpYmxlID0gIm1lZGlhdGVrLG10ODE5NS12Y29kZWMtZW5jIiwgLmRhdGEgPQ0KPiA+ICZtdDgx
OTVfcGRhdGF9LA0KPiA+ICAJey5jb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE5Ni12Y29kZWMt
ZW5jIiwgLmRhdGEgPQ0KPiA+ICZtdDgxOTZfcGRhdGF9LA0KPiA+ICsJey5jb21wYXRpYmxlID0g
Im1lZGlhdGVrLG10ODE4OS12Y29kZWMtZW5jIiwgLmRhdGEgPQ0KPiA+ICZtdDgxODlfcGRhdGF9
LA0KPiA+ICAJe30sDQo+ID4gIH07DQo+ID4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG10a192
Y29kZWNfZW5jX21hdGNoKTsNCg==

