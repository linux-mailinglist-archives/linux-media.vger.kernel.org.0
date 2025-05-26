Return-Path: <linux-media+bounces-33341-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 228D5AC3A6C
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 09:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABEFD16FAC4
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 07:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A7A1DE4DB;
	Mon, 26 May 2025 07:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EUXn/+S+";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="hdgp0gE7"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11A2F9D9;
	Mon, 26 May 2025 07:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748243818; cv=fail; b=UYPZTuJtVSa1+/6TOcQnkn8isHuHmWClK/AtsTe0FT5uqtWszg6+D/eCxCpXeGYmy2gkgcPQuaQQakya+W6xsgj4O363hgk01OHxPzHWeHWrmfP5HQuJWFyort2jrRHooFy6Pqypy8bWrFu8lz35IesPuLLvnH+G+KwOKT5r9io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748243818; c=relaxed/simple;
	bh=ZpJSF9sgjAEKVXVcVGdgMD1UpGfwiGLBMDevG9jBck0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YBlTaoDBg+TbmcCMASl9hbY5L3K08+DjqKsYwlT06hd0jL72nFyIB1jbCWJ+vTyjtOvxxyMMyOK0VsH40TLn+nl3ka/vkR8fqdpzFQ5bUEoS/LQYFkNkGS8eqjvrM/KyUQfRWgmcHwRbA6iXzldTnNoCJkGt3PE72QXfjqwub+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=EUXn/+S+; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=hdgp0gE7; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 645ad64c3a0111f0813e4fe1310efc19-20250526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ZpJSF9sgjAEKVXVcVGdgMD1UpGfwiGLBMDevG9jBck0=;
	b=EUXn/+S+PS9FkpzgWwMfHb+AhW15abHGVmjgLZGB2VWeTdzxM7NHwYipFo+37nvW94Dh3E2LnQjSJvjUJePHz5EiiQPOUgoVJy8fW1RCkLu9GZEoFnC1H+tj5vHmAYk/yuq0/uSqDtmFUgiFQqflCcClT58Bms30ig5Qvskj8Q4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:732c254a-2290-490a-953a-aeca18f8f4c9,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:88321d59-eac4-4b21-88a4-d582445d304a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 645ad64c3a0111f0813e4fe1310efc19-20250526
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 99158231; Mon, 26 May 2025 15:16:50 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 26 May 2025 15:16:48 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 26 May 2025 15:16:49 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U0EqK2wvx2L/bnOTtwAkW32YgAGWcAEt0jkli3vCF4CC9d6le44my8kwfFSLgrT+yLXbUH9TaXphVVU+NGqQQLu7OWcDT+8I6HGydfH6+Mg8phliZ4Oxyy90Fr6UweI1j/gqNOvluslnnbAPk3/Bu+7LTTchI1FQlkH+m/jUF3UcR6GEO6rY0hBWLXyWqlZ8WoRSCnoU15ungOQYHDA6O45r1sv7xNpN/R1JIajGTAH0AG/Rg4TbP1b/8aTTe9xAp9GO4NuzshORSm7l86R22DXQVkjhfr8ou+R501A5vfPo6FubijtrvWX/o73EapDLhlMHznR+wTH1nmM3Te3L7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpJSF9sgjAEKVXVcVGdgMD1UpGfwiGLBMDevG9jBck0=;
 b=oOLZOj73CmomGwYjL3LHN5XaMcLMs7+oKdsDiFm4e/JRMFjOMiw4QO6dtyLySEYurBc91R5hYwqhrYv/HKKBFy/ns57Qs8w8D2TI9bFwr/1F2sLgcthfB6DRSBZhICKkaZr8u1pZkmMXlPHlii07BnoBgvTNz619xLcqXVH7ijlRN6LaA3UW+QbsLWsORQjpdigroOHL0FZbPS3gRwtWcrRNslamt/2uiFJKce7HxVRW5CSyWiIh4geczi4RTzfqaUYEHd4uQOg0WFKD9WxF9vHoDhqGPb4C6p5Qjp1rtyq3pMGmR3QNNU0kv/d1HLJnEFz4TaQkaZ4FJ1iems3DyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpJSF9sgjAEKVXVcVGdgMD1UpGfwiGLBMDevG9jBck0=;
 b=hdgp0gE7dAU4rKJSVAOdDDt9ikIOv6oV7EdsRev+oviOYAzJPUEsbnXKao8jwD1/bXUIKvtf0OUX/67re/RY/M2Tt4fMwgoreU7/Biodt1BX62u31Roui48VW7cGEPHN2gMNs/uIQv2M/NbzMdgqtBr9pvIWd29qgT8efL0DfTY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYSPR03MB7370.apcprd03.prod.outlook.com (2603:1096:400:414::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Mon, 26 May
 2025 07:16:45 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8769.021; Mon, 26 May 2025
 07:16:45 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?T2xpdmlhIFdlbiAo5rip5YCp6IuTKQ==?=
	<Olivia.Wen@mediatek.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>
Subject: Re: [PATCH v1 04/10] media: mediatek: isp: Add V4L2 flow support for
 ImgSys driver
Thread-Topic: [PATCH v1 04/10] media: mediatek: isp: Add V4L2 flow support for
 ImgSys driver
Thread-Index: AQHbzKSIGGgUkn/qAU6laecwNoJPfrPkgvsA
Date: Mon, 26 May 2025 07:16:45 +0000
Message-ID: <07ce826311b73276bc30d29c141b24223319c932.camel@mediatek.com>
References: <20250524115144.3832748-1-olivia.wen@mediatek.com>
	 <20250524115144.3832748-5-olivia.wen@mediatek.com>
In-Reply-To: <20250524115144.3832748-5-olivia.wen@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYSPR03MB7370:EE_
x-ms-office365-filtering-correlation-id: ad513698-eaa4-4a57-21a6-08dd9c2545a9
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?eUhpc2x3dWRycnZ3VGRLdXppSk9UWi8yTjVEbEh1Y0pVYzl2UXgvQ285WlAv?=
 =?utf-8?B?TURwcGJ4cGRwY2VBcXVZb0VBb09NdzVJaVF4bXFxTWtMdklRaHFLZkNMZCtR?=
 =?utf-8?B?Vm1HR2JNY0NZUFFybGgzUTVnZSs4U0hXdGVRdUM3UVFXK2JzMjhETFZ3N0ly?=
 =?utf-8?B?N2h6dkVwKysrbU52b25MRVdKZDFwSHhVdUJna2hkeDZVR0N2eEI2dzBzNFJj?=
 =?utf-8?B?N1pzZGh5ZHc0SGFFckFXWkVmZzZIY1Fnb2dYbDhrbWtwMjBPL1grcW9ORHR2?=
 =?utf-8?B?VHhFT0Z2Wlc1dWhhL0duYUgyUW92M1dnNm5mVGJQc21UWStOWmZlYnIwREt4?=
 =?utf-8?B?M2tMaEZTS1JRUjlIYWJjTnM2aU1YT2JuNGNrbkgxSisva0Z3eTFSYko1cXAx?=
 =?utf-8?B?dmNwVmlSSk5vVFZxQ1N5dDc5dWR4RXR6aVBibWdTOHVnZ2dHaDY3TTJyNjQv?=
 =?utf-8?B?WUpvUlhPaC9mMmF4Wjl4WFIvVkFWVFluWEt1cEFTVUMrclU1ZG9OSlhaZDg3?=
 =?utf-8?B?Y1lzcFFtTm5VYkJNM2ZFRHNSTTh0YlFjVmxyR3UyV3BEQVZXbDVqNzIrc2dS?=
 =?utf-8?B?QTVRWUY2UHdINGwwYVJrK0tON1lqenFjLy9VY0tUQi9DT3RuZHJUd1JsZ2d2?=
 =?utf-8?B?dkpua1dhTWxqZzVBQjRzYlB2YVFUdnZ3WnZwNElPQ3VJQXlPK2Y3OHR5OVlj?=
 =?utf-8?B?QlQ5UmtZZ2xiVW9CMnlYbm1mV2wrZkVuSUpEVUdCYXVVWG0zazVDcU1DS3hU?=
 =?utf-8?B?L05EUHZsR01vbks0K0xjMFc5U0dCL1RKdnpzV0I3MUJ4Uk1yRDV1Rk9HOE5L?=
 =?utf-8?B?T3pOUXJuVWRtNjlQV3o2dStCV05McVVpOXplRlJHeXdMVmZGQzRsQXJGeEpG?=
 =?utf-8?B?dTY2NmdzMUl5Z05QMkR2UXNlLzkydnh1UGFTS3d4VU5JdWRNREZzZ29qMGlK?=
 =?utf-8?B?WXk3TlIrS2M1cW1YOENVN2owaTQ5VzJObnltWE01dGV1bjhSSS9lK1g0M0lW?=
 =?utf-8?B?OEI1dGQvVFZlM3FFeEp4M2M1eVBKMWVuRnVvU0dFQVJQRy9ZN3k4REZNcG5n?=
 =?utf-8?B?R2NmOUsvVFR6V2EyT0tZQUdtd212Mis2Y24zd3l0UHdHcnY1Qy9GSkpRUFBZ?=
 =?utf-8?B?TEtSZ3pZZU5zMHF1Kzg2Z3paQmlTbVUrU2tERGpDQXZHZjNYWndZUC9mRjd4?=
 =?utf-8?B?OUNMUWNBeXNvVWFNc2FDcXVZWHl1ZDFDenpyek52YWROQ0NBYWthV2NoRkFl?=
 =?utf-8?B?Z1hPRVlGOG4rTUZNdVhxcUFpRzBMeVRoVlJ6Uko1eWhmOU5VWm5IZ25pcnJu?=
 =?utf-8?B?QTJzNlVtdVI3dVFKUjRBcHpXS2kzaHFWbWozVXh1ZUlURXpJbDVneFM3Z2R3?=
 =?utf-8?B?QVNxVkM2SWw2eThhYU44K3lpOWVhalpoYVcrQlkxRVJ2NzQ5M2s1UHI3a09l?=
 =?utf-8?B?L1duUDhJclBkbnRQUWNielM2aDFSYjVFUU5VN2RqSlljRExUeHVqN3IveFR3?=
 =?utf-8?B?UVV6d1c3bkhTZDM2bks5Zkx4WW5uNDZvQXBsa1g3UFRmb0ViNktMUzVZdHhF?=
 =?utf-8?B?S1FIMnhqZ1A1UzV4aytPMTRsbmJGZU9Dc3o4TEMrdU51a3hFMVpGODNGMlRp?=
 =?utf-8?B?RFhPclFpeEVZUXhvREk3eGdsaUpZL0sycks5RW8rc0NweFdWWmZTeXhmSEtW?=
 =?utf-8?B?bEgwYnhqRHl6b3VlSDRDSmJKY29BWXBnS1IvYnNRZm01UTJWT29ScHRXTFA4?=
 =?utf-8?B?VEtFeEE1KzZHNk1YSk5MNVBVOUoxQWxpUjJhRFJQZDVkMFJkK3VNc0V6Z3hT?=
 =?utf-8?B?Mkhrd1VabVRrSFpIbmFIWkZMMkNlMUxVSFM1NEh0VVN6cXh4TTRWYVZtSEJ1?=
 =?utf-8?B?UXZVZ2w4b1ozMDV0cmg5OGZxc0Q2TGdaUFRDc3VSTVQyMXdEaFFYd1J6L1FE?=
 =?utf-8?B?aE8zL3BxUUV0Snd3cVF1bC90d1lsRld5SUJiOHNuUGZUTzdNYk16NFF4Tk5Y?=
 =?utf-8?Q?p1jU9MjsbunIUNM+sHJBIqpEHL9F9c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzI3Y210TStTdlJ2Q0JVTGc2NVcyZ1EzcUJDazVKRHJLa3JycG1UNXFkM28z?=
 =?utf-8?B?ZkR1MlBTV3dDdy9obVFBMlZKeW14Y2ZDOVRDV093QUh0Vk9pQXdNM0p0aHJw?=
 =?utf-8?B?Ty9TTFN2NEgwL3c4djZReXlpQkt0NEhTN1lISWVUZWFWMmpwN21DOCtIelo4?=
 =?utf-8?B?eWJvVDI2TVBQb2lZdmhSWXErcmRDRkpkSHl2c0RIV2VpbEoxektTd2NJKy9X?=
 =?utf-8?B?amx4WldMdFRCKzVidEFHZDlMZWtTT0ovRUlxSVp6TCtyYmpkRXdTbjhUcWpy?=
 =?utf-8?B?SDk4RHNuYjl2bGZJUTRBN1MyVUhPMkgwdmk1Y3ZPSlNPdktBMXNjZ3JTbG9R?=
 =?utf-8?B?U2dJVGJoa2xhV0k2cm9FWlU2VTlSdy9jV00xQVRhL3ZXQmduR3dpR2Q0Q0N2?=
 =?utf-8?B?eXhZREc4OUV6WmUvNmlvcXpPdk9BSGZ3THJHZXBRNDh1Y1FZTHl6R3h6S3Yr?=
 =?utf-8?B?dUhuWGk4ZjZidGkyckpYQnlsc29EMjFYZFlCVnVwdVQxSTI4MmtlV21QTTI3?=
 =?utf-8?B?U2cwTThKcGZjRmlDYm1kVzBsYnNBeE94UWptNHV0d0tSWVp0SUpBYlFRVUc4?=
 =?utf-8?B?TDVkdStuV25hMDJaZ0F6L1g1dWhQWC9DZ3FCRXhDUmRlZ3RaczZXZ2JtZ0Uv?=
 =?utf-8?B?b2tkT1UyeEdyMmdUZTBmcHNBNDd5RTUybExmd3dYdlFsTTl4WW9Balh1QjB1?=
 =?utf-8?B?L0VwN3hlK0hnN2p6aTYyMjNtUHNCY0hKZGVOZW5vKzFwTWs0cVhaL01WNkFB?=
 =?utf-8?B?NFB5VXNNMjI1SzFpY0pmR2dUdklUU2g2dmdsYnVRY1g1cUdJVjBzUkZxcVpC?=
 =?utf-8?B?clN0azk0MXdDOFEyQVNGQXNIVHFoaE1iSFU3dWQ2akxqdjM5WWJZOVFlbEti?=
 =?utf-8?B?S0czK25BQm1EZkhhRE8zV2ozYmZkZzY4WHArUjl6bU1RS0Q2Yll4bnZsQlIx?=
 =?utf-8?B?d09OMUJPVzZTamJrMHhWQ0dTMVRrY0pTVm12dzhJaEI3bHhvSEpyeTd0NEVh?=
 =?utf-8?B?NjE2dDBwRWI0dkxlNkE5M1NQeFMyc3IvajBRUlNnMjVOODQyRi9xUFhTc0FN?=
 =?utf-8?B?OU5tUUUvWGo2VXpseE1pWm1KMGxPbHhFSHg2YkxjREFicG5CNjZ1WU9ialRE?=
 =?utf-8?B?WjJwZlV6YnBreFAzbVFKdE5MczNWR29WSDMyYzQyYmorUTRHaXFYaUxtVndp?=
 =?utf-8?B?RjNzZkRjMXpORmoyUjIvbzJGa2pFSHRtT2dCazEzTXQvRGtzWlQwNGdYQXFW?=
 =?utf-8?B?bGlJQ0lYdXNuOWFIcE42VFVpa3U0SUg4bUkxZG4rNlNBbHpjQWFsRTRjUFBo?=
 =?utf-8?B?TEpJdVVWN0NKQzBJTmtZNEk0Z2RFQ2gxb04zZ01zNUhOd2ExdW1EYzdiVkhY?=
 =?utf-8?B?amNPQnZxTHU5Y3J3MVJxTGlqMVQ2eE1YQVMySVRVSktDeVFkT251V29JYTNR?=
 =?utf-8?B?UHoyU0pEMmUyZmducHRIT2pCK0NZcEhuSXlleHFxaTBVQUR1WXR2TGFvSzll?=
 =?utf-8?B?azVuVko1UlluNS9WRkdsWWZNaFpHa0N5aWlNYkF6UjRZdjZUS2hveUg3ejlY?=
 =?utf-8?B?RG1zZmRoQVR4ZUMzQlB5RVl4U0RsZHNaUG16WFBPaWdJZmluTGljNEV5bEV1?=
 =?utf-8?B?NTRseWxsNm5KblpaZ2FRYUhLdVBZd2RFaC95amtVWFZSbVBYcnlPdnFSbmhN?=
 =?utf-8?B?d3A2RGNHbVUrYVN5UmRDU0xjeCtsTG81eDNiVGVFOVRLK2dSM3c5MUZLVzRJ?=
 =?utf-8?B?bWpjTlp2V1l3MHVkSVNvckNMcDhPWFFUSWV3ejgzd0xrcFlPU1hNS2Rrb2dt?=
 =?utf-8?B?RUo5NmZuNUNmb0NYT1YyM0h2bkc3NFFKcE9NSm1vYUtsOWZhbmcxbTUyWUdQ?=
 =?utf-8?B?Vm5JbzRvTFJIWlpXYlhueEVxankvUWxiUXd1TCtkWHNVbFdTdk5iSFNvU21E?=
 =?utf-8?B?NlJNUTlHQkxxd1d5VzMrRkNhc1ZpYklsVEtTdnVqZnBJN2oyNm5GMVM1d3Fn?=
 =?utf-8?B?eU5ma25sempUYlV2OVIwRWtPdDRrWU50VGhEWHRqMHRMdlJtRXdhTDRXRVV1?=
 =?utf-8?B?MU9mTUJYRGlhT2ZjZG42eTJqUXZKWkZFVS95c3d3RnRNeDBwWEVyZm5Wd0ky?=
 =?utf-8?Q?cHNTJanUw1f1qAizRobXQ0yLs?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EBC0BCB9F892B459989FC2A525737B1@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad513698-eaa4-4a57-21a6-08dd9c2545a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2025 07:16:45.2853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lbma8V+OP2uM4RnMeRBD8uyVdOp+rdedSiQWaq2VDGBHaLSRvgcDy85528H5UYc2Wl9kVYDH9Pqs4TQC5z+tSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR03MB7370

T24gU2F0LCAyMDI1LTA1LTI0IGF0IDE5OjQ5ICswODAwLCBPbGl2aWEgV2VuIHdyb3RlOg0KPiBU
aGUgSW1nU3lzIGRyaXZlciBpcyBpbXBsZW1lbnRlZCBhcyBhIHNlcmllcyBvZiBwYXRjaGVzLCB3
aXRoIHRoaXMgcGF0Y2gNCj4gZm9jdXNpbmcgb24gdGhlIFY0TDIgZmxvdy4gVGhlIE1lZGlhVGVr
J3MgSW1hZ2UgU3lzdGVtIChJbWdTeXMpLCBhbHNvDQo+IGtub3duIGFzIElTUCBQYXNzMi4gSW1n
U3lzIGlzIGEgbWVtb3J5LXRvLW1lbW9yeSBoYXJkd2FyZSBkZXZpY2UNCj4gZGVzaWduZWQgZm9y
IGFkdmFuY2VkIGltYWdlIHByb2Nlc3NpbmcgdGFza3MuIEl0IGlzIGNvbXBvc2VkIG9mIG11bHRp
cGxlDQo+IGhhcmR3YXJlIGNvbXBvbmVudHMsIGluY2x1ZGluZyBUUkFXLCBESVAsIFBRRElQLCBN
RSwgYW5kIFdQRS4NCj4gDQo+IFRSQVcgKFRpbGUgUkFXKToNCj4gLSBQcm92aWRlcyBtdWx0aXBs
ZSBkb3duc2NhbGVkIHJlc2l6ZXJzIHRvIHN1cHBvcnQgbXVsdGktc2NhbGUgbm9pc2UNCj4gICBy
ZWR1Y3Rpb24uDQo+IC0gU3VwcG9ydHMgUkFXL1JHQiBmb3JtYXQgY29udmVyc2lvbi4NCj4gDQo+
IERJUCAoRGlnaXRhbCBJbWFnZSBQcm9jZXNzaW5nKSBhbmQgUFFESVAgKFBpY3R1cmUgUXVhbGl0
eSBESVApOg0KPiAtIFN1cHBvcnRzIHN1Y2ggYXMgdGVtcG9yYWwgYW5kIHNwYXRpYWwgbm9pc2Ug
cmVkdWN0aW9uIChUTlIvU05SKSwNCj4gICBlZGdlIGVuaGFuY2VtZW50IChFRSksIGFuZCBzaGFy
cG5lc3MgKFNIUCkuDQo+IC0gUFFESVAgYWxzbyBzdXBwb3J0cyBpbWFnZSBzY2FsaW5nIGFuZCBy
b3RhdGlvbi4NCj4gDQo+IE1FIChNb3Rpb24gRXN0aW1hdGlvbik6DQo+IC0gU3VwcG9ydHMgbW90
aW9uIGVzdGltYXRpb24gYmV0d2VlbiB0d28gY29uc2VjdXRpdmUgZnJhbWVzLg0KPiANCj4gV1BF
IChXYXJwaW5nIEVuZ2luZSk6DQo+IC0gSGFuZGxlcyBpbWFnZSB3YXJwaW5nIGFuZCBkZS13YXJw
aW5nIHByb2Nlc3Nlcy4NCj4gDQo+IFRoZSBJbWdTeXMgZHJpdmVyLCBwcmltYXJpbHkgdXRpbGl6
ZWQgZm9yIEdvb2dsZSBDaHJvbWVib29rIHByb2R1Y3RzLA0KPiB1c2VzIE11bHRpLUZyYW1lIENv
bWJpbmVkIE5vaXNlIFJlZHVjdGlvbiB0ZWNobm9sb2d5IHRvIGVuaGFuY2UgaW1hZ2UNCj4gcXVh
bGl0eS4NCj4gDQo+IEJlbG93IGlzIGEgc2ltcGxpZmllZCBhcmNoaXRlY3R1cmUgb2YgdGhlIElt
Z1N5cyBkcml2ZXI6DQo+IFVzZXIgLT4gVjRMMiBGcmFtZXdvcmsgLT4gSW1nU3lzIERyaXZlcg0K
PiAgICAgIC0+IFNDUCAoSXQgcGFja2FnZXMgdGhlIGhhcmR3YXJlIHNldHRpbmdzIGludG8gY29t
bWFuZHMpDQo+ICAgICAgLT4gSW1nU3lzIERyaXZlcg0KPiAgICAgIC0+IENNRFEgKFRoZSBwYWNr
YWdlZCBjb21tYW5kcyBhcmUgc2VudCB0byB0aGUgaGFyZHdhcmUgdmlhIEdDRSkNCj4gICAgICAt
PiBIYXJkd2FyZQ0KDQpZb3UgYnJlYWsgdGhpcyBkcml2ZXIgaW50byBtdWx0aXBsZSBwYXRjaGVz
IGJ5IHRoZXNlIGZ1bmN0aW9uIGJsb2NrLA0KYnV0IHRoaXMgd291bGQgbWFrZSByZXZpZXdlciAo
aW5jbHVkZSBtZSkgaGFyZCB0byByZXZpZXcuDQpUaGUgYmV0dGVyIHdheSBpcw0KDQoxLiBBZGQg
aW1nc3lzIGRyaXZlciB3aXRoIGJhc2ljIGZ1bmN0aW9uIChpbmNsdWRlIHY0bDIgZnJhbWV3b3Jr
LCBzY3AsIGNtZHEuIFRoZSBiYXNpYyBmdW5jdGlvbiBtYXkgYmUgZG93bnNjYWxlIGFuZCBmb3Jt
YXQgY29udmVydCBvbmx5KQ0KMi4gQWRkIERJUCBmdW5jdGlvbg0KMy4gQWRkIE1FIGZ1bmN0aW9u
DQo0LiBBZGQgV1BFIGZ1bmN0aW9uDQoNCkxldCB0aGUgZmlyc3QgcGF0Y2ggYXMgc2ltcGxlIGFz
IHBvc3NpYmxlIGJ1dCBpdCBzaG91bGQgd29yay4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogT2xp
dmlhIFdlbiA8b2xpdmlhLndlbkBtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9tZWRp
YS9wbGF0Zm9ybS9tZWRpYXRlay9LY29uZmlnICAgICAgIHwgICAgMSArDQo+ICBkcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL21lZGlhdGVrL01ha2VmaWxlICAgICAgfCAgICAxICsNCj4gIGRyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvaXNwL0tjb25maWcgICB8ICAgMjMgKw0KPiAgLi4uL3Bs
YXRmb3JtL21lZGlhdGVrL2lzcC9pc3BfN3gvTWFrZWZpbGUgICAgIHwgICAgNiArDQo+ICAuLi4v
bWVkaWF0ZWsvaXNwL2lzcF83eC9pbWdzeXMvTWFrZWZpbGUgICAgICAgfCAgIDExICsNCj4gIC4u
Li9pbWdzeXMvbW9kdWxlcy9tdGtfZGlwX3Y0bDJfdm5vZGUuaCAgICAgICB8ICA1OTQgKysrKysr
DQo+ICAuLi4vaXNwXzd4L2ltZ3N5cy9tb2R1bGVzL210a19tZV92NGwyX3Zub2RlLmggfCAgMzg2
ICsrKysNCj4gIC4uLi9pbWdzeXMvbW9kdWxlcy9tdGtfcHFkaXBfdjRsMl92bm9kZS5oICAgICB8
ICAxNDkgKysNCj4gIC4uLi9pbWdzeXMvbW9kdWxlcy9tdGtfdHJhd192NGwyX3Zub2RlLmggICAg
ICB8ICAzNzEgKysrKw0KPiAgLi4uL2ltZ3N5cy9tb2R1bGVzL210a193cGVfdjRsMl92bm9kZS5o
ICAgICAgIHwgIDMxNyArKysrDQo+ICAuLi4vaXNwL2lzcF83eC9pbWdzeXMvbXRrX2hlYWRlcl9k
ZXNjLmggICAgICAgfCAgIDI4ICsNCj4gIC4uLi9pc3AvaXNwXzd4L2ltZ3N5cy9tdGtfaW1nc3lz
LWRldi5jICAgICAgICB8ICAyMzggKysrDQo+ICAuLi4vaXNwL2lzcF83eC9pbWdzeXMvbXRrX2lt
Z3N5cy1kZXYuaCAgICAgICAgfCAgNDI3ICsrKysrDQo+ICAuLi4vaXNwL2lzcF83eC9pbWdzeXMv
bXRrX2ltZ3N5cy1mb3JtYXRzLmMgICAgfCAgMTM5ICsrDQo+ICAuLi4vaXNwL2lzcF83eC9pbWdz
eXMvbXRrX2ltZ3N5cy1mb3JtYXRzLmggICAgfCAgIDcyICsNCj4gIC4uLi9pc3AvaXNwXzd4L2lt
Z3N5cy9tdGtfaW1nc3lzLW1vZHVsZV9vcHMuaCB8ICAgMjcgKw0KPiAgLi4uL2lzcC9pc3BfN3gv
aW1nc3lzL210a19pbWdzeXMtb2YuYyAgICAgICAgIHwgICAzOSArDQo+ICAuLi4vaXNwL2lzcF83
eC9pbWdzeXMvbXRrX2ltZ3N5cy1vZi5oICAgICAgICAgfCAgIDU1ICsNCj4gIC4uLi9pc3AvaXNw
Xzd4L2ltZ3N5cy9tdGtfaW1nc3lzLXN5cy5jICAgICAgICB8ICAgMjcgKw0KPiAgLi4uL2lzcC9p
c3BfN3gvaW1nc3lzL210a19pbWdzeXMtc3lzLmggICAgICAgIHwgICA1MCArDQo+ICAuLi4vaXNw
L2lzcF83eC9pbWdzeXMvbXRrX2ltZ3N5cy12NGwyLmMgICAgICAgfCAxNjg0ICsrKysrKysrKysr
KysrKysrDQo+ICAuLi4vaXNwL2lzcF83eC9pbWdzeXMvbXRrX2ltZ3N5cy12bm9kZV9pZC5oICAg
fCAgMTAwICsNCj4gIC4uLi9pc3AvaXNwXzd4L2ltZ3N5cy9tdGtfaW1nc3lzX3Y0bDJfdm5vZGUu
aCB8ICAxMzUgKysNCj4gIDIzIGZpbGVzIGNoYW5nZWQsIDQ4ODAgaW5zZXJ0aW9ucygrKQ0KPiAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvaXNwL0tj
b25maWcNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlh
dGVrL2lzcC9pc3BfN3gvTWFrZWZpbGUNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL21lZGlhdGVrL2lzcC9pc3BfN3gvaW1nc3lzL01ha2VmaWxlDQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9pc3AvaXNwXzd4
L2ltZ3N5cy9tb2R1bGVzL210a19kaXBfdjRsMl92bm9kZS5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9pc3AvaXNwXzd4L2ltZ3N5cy9tb2R1
bGVzL210a19tZV92NGwyX3Zub2RlLmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL21lZGlhdGVrL2lzcC9pc3BfN3gvaW1nc3lzL21vZHVsZXMvbXRrX3BxZGlw
X3Y0bDJfdm5vZGUuaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbWVkaWF0ZWsvaXNwL2lzcF83eC9pbWdzeXMvbW9kdWxlcy9tdGtfdHJhd192NGwyX3Zub2Rl
LmgNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVr
L2lzcC9pc3BfN3gvaW1nc3lzL21vZHVsZXMvbXRrX3dwZV92NGwyX3Zub2RlLmgNCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2lzcC9pc3BfN3gv
aW1nc3lzL210a19oZWFkZXJfZGVzYy5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9pc3AvaXNwXzd4L2ltZ3N5cy9tdGtfaW1nc3lzLWRldi5j
DQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9p
c3AvaXNwXzd4L2ltZ3N5cy9tdGtfaW1nc3lzLWRldi5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9pc3AvaXNwXzd4L2ltZ3N5cy9tdGtfaW1n
c3lzLWZvcm1hdHMuYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbWVkaWF0ZWsvaXNwL2lzcF83eC9pbWdzeXMvbXRrX2ltZ3N5cy1mb3JtYXRzLmgNCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2lzcC9pc3Bf
N3gvaW1nc3lzL210a19pbWdzeXMtbW9kdWxlX29wcy5oDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9pc3AvaXNwXzd4L2ltZ3N5cy9tdGtfaW1n
c3lzLW9mLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21l
ZGlhdGVrL2lzcC9pc3BfN3gvaW1nc3lzL210a19pbWdzeXMtb2YuaA0KPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvaXNwL2lzcF83eC9pbWdzeXMv
bXRrX2ltZ3N5cy1zeXMuYw0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbWVkaWF0ZWsvaXNwL2lzcF83eC9pbWdzeXMvbXRrX2ltZ3N5cy1zeXMuaA0KPiAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvaXNwL2lzcF83
eC9pbWdzeXMvbXRrX2ltZ3N5cy12NGwyLmMNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2lzcC9pc3BfN3gvaW1nc3lzL210a19pbWdzeXMtdm5v
ZGVfaWQuaA0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvaXNwL2lzcF83eC9pbWdzeXMvbXRrX2ltZ3N5c192NGwyX3Zub2RlLmgNCg0KUGxhY2Ug
dGhlc2UgZmlsZXMgaW4gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9pbWdzeXMuDQpU
aGlzIGlzIHRoZSBmaXJzdCBTb0Mgd2hpY2ggc3VwcG9ydCBpbWdzeXMgZHJpdmVyIHNvIGl0J3Mg
bm90IG5lY2Vzc2FyeSB0byB1c2Ugc28gZGVlcCBmb2xkZXIgc3RydWN0dXJlLg0KDQpSZWdhcmRz
LA0KQ0sNCg0KDQo=

