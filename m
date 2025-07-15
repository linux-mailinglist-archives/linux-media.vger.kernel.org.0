Return-Path: <linux-media+bounces-37742-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B44BB05334
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 09:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CEA717C704
	for <lists+linux-media@lfdr.de>; Tue, 15 Jul 2025 07:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D3927280F;
	Tue, 15 Jul 2025 07:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UnzotfKP";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="JR+lGGdO"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0566026C396;
	Tue, 15 Jul 2025 07:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752564522; cv=fail; b=OxF/j6H83ZpMuZscuen4U7Sf+MDoRTIqbgYm+7XDYgA610ycchdPmbiCK8KRwM7kUEJDEuhy0rqpT88Q+ZioHHPB8WBgBspwK4nGdLQzAOFDgVXcqgxC4Cwi2Gb8nE3LcVdXzna/nbTblg5lt/Ry8HZZrV2eRymCjTOfPnrV9YA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752564522; c=relaxed/simple;
	bh=sU1T1sqM5bpv4EgzDafvp2Adq8IL2Fiy1DJiQlWQ1Yg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=M82aSgv6VnUfwK/EY8Vf+uxbu2JQsulQebEwI22axlXBd25E67CfK/C8dhI+CCI8ykCXuLX8ElFxrAxSN5w+1ku8UjrH0VMHl5DsPYCIIGrVB5ST6RT55Yk+4lvzqJiYACf9GxpILhIkaR0CKEM0rR0DanzOV+3IetMAXvWJNds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=UnzotfKP; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=JR+lGGdO; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4e885ac4614d11f0b1510d84776b8c0b-20250715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=sU1T1sqM5bpv4EgzDafvp2Adq8IL2Fiy1DJiQlWQ1Yg=;
	b=UnzotfKPMsSSlgOtIHoFGlHX6icYsg5sJrnmZeXfReqzmmiHsKOatIaSKeAu5IXwLjptPhthyQWGa+LBi8YP/Jw36yGkjSuFFj31zMG97DNB6SXp6U0yiqiNFD8An5MNjVyQEciydofTWj5Zx9UldKjwWdyvShCaGYgxcedbYVw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:ed46bdd8-7d8d-456e-bfd9-675c4a1828a5,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:84f9e049-3902-4ad6-a511-6378a8132fbf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:99|80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,
	COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4e885ac4614d11f0b1510d84776b8c0b-20250715
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 119286435; Tue, 15 Jul 2025 15:28:30 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 15 Jul 2025 15:28:28 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 15 Jul 2025 15:28:27 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IssZJrSMAZPj15WFoTS6ogzBrlqfqOEIPPw81mAXeMWdNyZObo14Wz3lomjhDAbB9KHDk5/COqxW6Z5uqD6e2huJWaiSGg7QTch/wuONHDyx8GEWkydytQYW2zYGmpOo5ZUoUNJSqljKO3Gde0KRl0NzaaGcMQSFYh+I++LnY5YjiXNhSXwcIVhfbOa5BPI1sjk1gnDcOLwl1oUZyaFFVGungJ0mfDjcfJnhD4LIrhJ0VKrkDZxFOUYsnQRRfKq1lYY+6oM+80Do9J6kegPF8LAUXexJl/0hMzKWPuT/6UWfO9QNMOE7RhkYm5dYczaHe2WfIzPPhQzACHvpaKz/iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sU1T1sqM5bpv4EgzDafvp2Adq8IL2Fiy1DJiQlWQ1Yg=;
 b=XL8NXOlCCXk9kZA+KHMsp71+Qt+4y+AznHvwMrsFHJdhBL/Yzz50rCjmCsGYDjfhC0xkwl4XHcLwdQpgGlAKZ8dTgUqEylZpImQ4gaxkpGEANLIRTWocYWFheNCDjpXszMzM9CyqSO1mKFXpqz75ga6RQv1lKZjZwDZsotTwoPsEfk2J/571RqD9XZ2bryKGQzpbdvFx6oIahYAvC5aE4DPgsyk/R+bbhNq7DUZauLjbUrFSqU99K4sMnM7oTlzhEFn+fOdM2Jpssa9cFnjHg9T2Eo+6ClaoMIKMLpbZy8u3PbH7P4UX2PgVNMyqhaWjx8LB8e4KZuIBKba1kC2jzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sU1T1sqM5bpv4EgzDafvp2Adq8IL2Fiy1DJiQlWQ1Yg=;
 b=JR+lGGdOJpc4aCUac7INGrjfUSleKE8fEtNf+JeaG5WPbR3iQs/IETaFAKS+XAmuKalwwLrlmBPkOZtFiet+EhMuSw2LEyLSrQbvhlkdi8jb/HRbz7x6bz3JoeUY2FJ29O+/nSGyf6CkPArJ+YA4SNfQkVdeZt0A/w/IogetuzY=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEZPR03MB8321.apcprd03.prod.outlook.com (2603:1096:101:199::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 07:28:26 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 07:28:26 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, =?utf-8?B?U2hhbmd5YW8gTGluICjmnpfkuIrloK8p?=
	<Shangyao.Lin@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 02/13] dt-bindings: media: mediatek: add seninf-core
 binding
Thread-Topic: [PATCH v2 02/13] dt-bindings: media: mediatek: add seninf-core
 binding
Thread-Index: AQHb7t+qzC46ODtza0CnUqxPGN2Fp7Qy1lqA
Date: Tue, 15 Jul 2025 07:28:25 +0000
Message-ID: <5d8fe3bd4a9d56ab5b4757f6c2f950fca3f18c18.camel@mediatek.com>
References: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
	 <20250707013154.4055874-3-shangyao.lin@mediatek.com>
In-Reply-To: <20250707013154.4055874-3-shangyao.lin@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEZPR03MB8321:EE_
x-ms-office365-filtering-correlation-id: d53308c5-7b13-4297-07b9-08ddc3712ffb
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|42112799006|366016|7416014|376014|38070700018|13003099007;
x-microsoft-antispam-message-info: =?utf-8?B?QUZnSzFjMGZWSHZPVHRvS3NmbGwwb1krTHUvNzVVR1JIRkh3djMwK0IxYUJ6?=
 =?utf-8?B?cW11QzhRa3FjN1p3OE1xbGNBR1JMV0NjY3NaUGR4NGZaeVJzNHV5N2xLU3dq?=
 =?utf-8?B?Y1hJaDRRcmJjRVVadEhoTU1tZDZTVmMxU3h2enZOeXVrV0pSV1FVSHVQUDNJ?=
 =?utf-8?B?dy8zYXBtN1Z6dXRjQW5WbEFISEYxeWEvUkQrRzltRXEyejJOM3VXUGdGTzlx?=
 =?utf-8?B?N2Y1cnAvWUk1b0hPK1dJbUpQUDJEZ0lZbml2WGcyMjZTdlZ5Y05MZmE5MVRR?=
 =?utf-8?B?cGthNXhMeERqOUdlNUdqTWZZa2Q5OU1mekZGSjdTanJTNGJnWHdocFQ5a2pT?=
 =?utf-8?B?REtSQlJ5TEpSNkJCYWU4Qis4TEovNFNDMXJkeTRIc0ROcDRUV2pTVFFTMW5W?=
 =?utf-8?B?em80N1V1emsrU3J3bmVSZXRGRkxLa0dSVzhtb1BXa1VHcG9tZjFRNHRpY3lx?=
 =?utf-8?B?Q2ZiM1haL2hqVkZkVzBES2NRV1lacDY4OHFkWUJyYWE1UE53Uk15YjFPbWxW?=
 =?utf-8?B?dDc2Zys0cmlDTVN5MEZHQmFacDJEMWZYcVRYQmtsZWRNNDc2N2xqWCsvOVRM?=
 =?utf-8?B?UWFsa1lWaUdjZE1jaldaVjJCb0JKY1NvOStabFhnaDVmckVDVkVXRXJNNk1D?=
 =?utf-8?B?OUYweVFoLzJrb0V3bjVJVjZ4b0J4Q2VDaFpwNFJ5NWUzSTNJYXBlc0ZvcGRy?=
 =?utf-8?B?aVcrTS9sZTc2YlBraEJlZzBVWXpBSnVvV1N2L3VObkNTaURZbHNEem94ckFl?=
 =?utf-8?B?MWo1YUFaYkZpWk5PdWEyVzJRcXhPeGx0Z2lUbllKQmVHRkdneDRTRXdWcGQr?=
 =?utf-8?B?VHFjQ3dRMUFnU2poekw0NGtzbmN6Vm04Nkg4TEdiMlkxNFo5bVpoTlFPamU5?=
 =?utf-8?B?YTFUZS9qNjVFZlh5anlacVVLRnAwS1VmWncwTTBueHRRR3p0TWtnUGh1eFVn?=
 =?utf-8?B?UG4wbjJBcXVTdFE3UVU4U2xHb3VSRGxWOWRuS1ltaFNHb3FUU1BtRWRwTUsz?=
 =?utf-8?B?ZHN6ZUt2UEpMUnY0QVBxSzYralhsTjRFS2VjS1dMd3B2QnJaMG53c1JSRThw?=
 =?utf-8?B?QSt1NXFtVm1yK2JmL2lnRGcwVXZaMnpJRDRmd0hmUHpYcFR3ZWNtNlgxSVJw?=
 =?utf-8?B?MVFBUE5OMVhIVGR0dCtCNFEyRkk0dDl6T1lqNmhVN3ZoNCtUTkdxTGVjeU9m?=
 =?utf-8?B?OW1vZm1zM1VEZGJzOHRDb1d6OERoeks0b0w0MVRsRW1lY0JCdmVNNEx2VkxX?=
 =?utf-8?B?b2JoUU10UXVwTHpYanhMN2ZJdVhPVUxKa2dDNjhQSUMwSFNna2RtL2luUWJ6?=
 =?utf-8?B?YnVJR0xKbVp0YlkrUlVxS3d4WWVlbGRUdzZVTGZjL2MrQ2NDYWUzM3lDQzgy?=
 =?utf-8?B?STRTSmUreVVzV0lXWGViRjZFYnZtSm9WTXQ5N1lnUXZBbkVyQmlEV0VBZnlP?=
 =?utf-8?B?Vi9KUHJjekFPNlFpK2dsUDMzeXBNUTJSL0hkOU5FSDdOb3hoRFBiUUNkeHZi?=
 =?utf-8?B?VWNFY3NzQzY3OVU4bEpNZGNxRE9mckIyWUlsMFNXNnhWTFVJVkFZMkRTanNK?=
 =?utf-8?B?dnhBcVc3QTZ6elhoTUkzTWlyaHlUTjRzM1RDVXNia3JJT0FUa2tnTGNrT2Rn?=
 =?utf-8?B?QVhGYlV6Rm9zZDZRdzVpWGtoS1kyZEF6MFBnWWhLMk4xTGU0MlRweE5HckpY?=
 =?utf-8?B?QWJmSk1zcndjdnh0L1ArUXRrNkk4REkrVStsd2VKUEw5bVJyenFTT1loUUYw?=
 =?utf-8?B?Q2VBOVRobnloNXRodjU2cE96R3lhRVBTZ1ZOU01jQlFZYXl1K3hKN05ZZjRX?=
 =?utf-8?B?RTN6UG9kdHBWekZ0M1NjQXhsaTBXczQwZE5vK2tWeXBQRDgwcFZyNlhyY3cx?=
 =?utf-8?B?VitSczlrbVZOWFhLMDhsdVNnb2daRXdjM2tnZTJNK3h3R0ZBWE1NOTdWTE56?=
 =?utf-8?B?OG5qR3hvZ3dRam5icGRKZXUzTEEweGw3K1Y2bTNreFVJdTllZWZXTWhYcFJH?=
 =?utf-8?Q?on3VKaUYYQXlRgcy3BkMyIZG8xXVHs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(42112799006)(366016)(7416014)(376014)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WUZYdE15cHBzQ1NOUVF5dDAyKzZIT3hKeDJUR1F4dFMyMWErMmpVMmltR2NL?=
 =?utf-8?B?UjlZWjFzOFlxR3JzUVUzRnJnVHYxL3dXbVBPb2diTExaUDZBSnJLQnppcUky?=
 =?utf-8?B?dlh6TmVST0RuQlhLd1dtOXo0S0F2SFJhbDlIN2VwM29iUXJTaHJmRVlCdllS?=
 =?utf-8?B?L0syRXMvSHlxL0RxcjRmRE1LQy83SnBBTjVsekVjcGlCMHJnQWc5OTFNa3V6?=
 =?utf-8?B?WXMzL2ZocU9tODhDdHMreHFGWm9aeXc4VjJlbVU0aGtYK2Q1d1dCNW9CZElY?=
 =?utf-8?B?UDZLdENPbVE1eTB0ZTVrQk9uMnRhaGlyWG00NXd2SjFwb01mSmVBRkhLdXVC?=
 =?utf-8?B?cVgzNzV1clQxZnpLaTJUUjZGdnBWM1NNZFhOKzM2UEJ6SW1XOUEzODdpOGJx?=
 =?utf-8?B?bC9FSEM5cTd5MXRWY01SbzVFNVRKQXN4SVNZV3AwV2RPSjFjZFJEdERwdUpF?=
 =?utf-8?B?c2szVFUyTi9SbWZ1Vk1vK1FzMkpINGZMWjI1S1B3UFVicmdaQXBVcXlnYU1P?=
 =?utf-8?B?VUROR2NyekdrYXFJZkhhdWNLaVdXWGJDNEhkd3NPcnZtTEJEOXltNDlabkxX?=
 =?utf-8?B?T3ROOWhFUlNXak5XN050UUcwYTAyNXFtSHNxWU5lSzR1T3dtd0JrNGRZMTVx?=
 =?utf-8?B?NGdjaFBQbWRNSTJrZXRLMkN6Vm1Ielo5SnlURzVQZlVnbXp1anJMMUVoL2RW?=
 =?utf-8?B?MDdqQitoYlRpNHNxUTllcGVlKy9kTVhndEpTMG40R0gxNThaQWMxUE1rdXBa?=
 =?utf-8?B?MzJZVDNqaEFWS01iT292dUVWVzh5Qlk3Rk4vWEF1TkcwaVhZZWZzQ3VaR2Rl?=
 =?utf-8?B?QlZycjR6bml0N3FLYklZdVZwQWx0Q0JBUTJkVW1rYU8vejdURWZmOVgwZ2tm?=
 =?utf-8?B?bkxMamxsVE5PWFRPQ2U0RVd4cFhBam1ZRFlHQW96QVJjNUQwb2pjcFFLc29z?=
 =?utf-8?B?QXNldnplQW5RSkZ0TzRxVSswQ2xHajdTQ2VvbEw2aXN0RUcxVnF3bkp4enlq?=
 =?utf-8?B?azhudVdsbURJUVZ0WEw3TnVPTWgxbm13dGdmQmhzcGVWa2RxKzVjekt4R0Js?=
 =?utf-8?B?cUFyNzdKdDZVZUN0MmdJN3phSGVFRmp4bXBlUE90MWNobkJUckJZOThKRFov?=
 =?utf-8?B?SW9kUHVLVklkRkRibFVhbm9zK0V3bnhEOExpTzNOSFFBazRQUW94SVV4NEZW?=
 =?utf-8?B?emJiaU0vMUdjTlBLWkVuNHhvWHhKSTZHek54TWVjZVNNY0dKR041dzRPWWpT?=
 =?utf-8?B?SXpZdjh4MFlTRUJzRVdUSjRPaDAwbTZPYkxqN0JBU3dpRktCbkt5OUczRWVJ?=
 =?utf-8?B?VTJYcUdQeW14MzAwZTFQeXphRzA3b05rT0ovZXU5T2ZzWFNxZUlsYm93QXp4?=
 =?utf-8?B?NUtsVnJsVzVxWWJmVkdsUi9SendYSTQxcXpHdUdzQ2pVMjMvVGhQOVBzOTdm?=
 =?utf-8?B?S2UrcDl0eXI2OG5BOU5aeDc0VDBhSlZRcC9PZElYb1QyVXZFSXJlZEhxUW51?=
 =?utf-8?B?RHVOTm8rYml5eEE0R2JobGpnWURkcTczSTY4MXpEUUJYMHpjdHpzVWRHcjc0?=
 =?utf-8?B?eG9EaHNLckRUTmxLNDNFcURXdlpLdlJqa2VDRk1heFZnVkhhN3VWbW5vZWJG?=
 =?utf-8?B?eHNEQXgwYlZDd2pUUWFCNWU1SDJMVFcxQTNKSE91REE3ZDFUbzB3THk4eHkw?=
 =?utf-8?B?R2paUW1aMVdjbEllZlpXUVFjaXQ0UnR0Q0FZS0d2amM2bUhpQnIzaGs0ZnZF?=
 =?utf-8?B?SlRpZHBWQk9QS0U5eUY2MUxJcXNPY3A0WExiL21qTXgrSlRPd1FWYmZ1ZDlj?=
 =?utf-8?B?YTlZQXNQdDQwbHk2M29ENXdLUG1reWlINjdiN2FMb1RZT0ZkU3BiTkkxQXBN?=
 =?utf-8?B?M1MvNDc0WklkY1MzWVVhTTM3RHVOTW01SnFsN2VWZzQxamswWERsSW9wWWhN?=
 =?utf-8?B?eEU5VDNnWXp0dFBmRk9hS3pKWkZ4SW9RSzh0Z01Xa05uOWhjSUhhTUprRHJ2?=
 =?utf-8?B?bmhHZUNWbEVxRk5JU1phNFI0cng5Njl2TW9yN0NqUnRzejN6ZlZ2Q2ZXaFMx?=
 =?utf-8?B?OVoyNHRHRWdvblJOTFI3YmJ3bnFnODkycEZmTjNRbWhGN01Tb0dBTTdVN2hn?=
 =?utf-8?Q?QjIwvJ2Mdk/VvHICxDBtMIEz6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9A900F95290BF142A12114888FCA483F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d53308c5-7b13-4297-07b9-08ddc3712ffb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 07:28:25.9676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d0Jk7ongmzjguRgyTVwEwq3X/kHgmIMg1oXjKRxlLAP8ATXeJVXT/Xj5lkbCYZCJp0qG8eQE7/ihqFyBlYFW7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8321

T24gTW9uLCAyMDI1LTA3LTA3IGF0IDA5OjMxICswODAwLCBzaGFuZ3lhbyBsaW4gd3JvdGU6DQo+
IEZyb206ICJzaGFuZ3lhby5saW4iIDxzaGFuZ3lhby5saW5AbWVkaWF0ZWsuY29tPg0KPiANCj4g
MS4gQWRkIGNhbWVyYSBpc3A3eCBtb2R1bGUgZGV2aWNlIGRvY3VtZW50DQo+IA0KPiAtLS0NCj4g
DQo+IENoYW5nZXMgaW4gdjI6DQo+ICAgLSBSZW5hbWUgYmluZGluZyBmaWxlIHRvIG1lZGlhdGVr
LG10ODE4OC1zZW5pbmYtY29yZS55YW1sDQo+ICAgLSBWYXJpb3VzIGZpeGVzIHBlciByZXZpZXcg
Y29tbWVudHMNCj4gICAtIFVwZGF0ZSBtYWludGFpbmVycyBsaXN0DQo+IA0KPiBRdWVzdGlvbiBm
b3IgcmV2aWV3ZXIgKENLKToNCj4gDQo+IEhpIENLLA0KPiANCj4gVGhhbmsgeW91IGZvciB5b3Vy
IHJldmlldyBhbmQgc3VnZ2VzdGlvbnMgb24gdGhpcyBwYXRjaCwgZXNwZWNpYWxseSBmb3IgcHJv
dmlkaW5nIHRoZSByZWZlcmVuY2UgcGF0Y2ggKGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19o
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/
c2VyaWVzPTg3NDYxN19fOyEhQ1RSTktBOXdNZzBBUmJ3IWxLNjJiVlE5LWlPSWR2c3F5M1kwTVpJ
R1FsNVN6cDIzSy1yQl9JQjV1ZmZWLXRmYk1MOXAxNDRDZ3QtNHhUcGdlWVFXdW5nUkRCemhmdVkx
ZllmbEJuayQgKSBhbmQgZm9yIG1lbnRpb25pbmcgaW4gYW5vdGhlciBwYXRjaCAoW1YxLDAyLzEw
XSBNRURJQTogUExBVEZPUk06IE1FRElBVEVLOiBBREQgU0VOSU5GIENPTlRST0xMRVIpIHRoZSBz
dWdnZXN0aW9uIHRvICJNb3ZlIHRoZSBwaHkgcGFydCB0byBwaHkvbWVkaWF0ZWsvIGZvbGRlci4g
WW91IGNvdWxkIHJlZmVyIHRvIHBoeS9tZWRpYXRlay9waHktbXRrLW1pcGktY3NpLTAtNS5jIi4N
Cj4gDQo+IEFmdGVyIHJlYWRpbmcgeW91ciBjb21tZW50cyBhbmQgdGhlIHJlZmVyZW5jZSBwYXRj
aGVzLCBteSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgb25seSB0aGUgc2VuaW5mLWNvcmUgZHJpdmVy
IHNob3VsZCBtYW5hZ2UgYWxsIHBvcnRzIGludGVybmFsbHksIGFuZCBlYWNoIHBvcnQgY29ycmVz
cG9uZHMgdG8gYSBQSFkuIER1cmluZyBwcm9iZSwgdGhlIGRyaXZlciB3aWxsIHBhcnNlIGVhY2gg
cG9ydCwgb2J0YWluIHRoZSBjb3JyZXNwb25kaW5nIFBIWSAoZS5nLiwgZGV2bV9waHlfZ2V0KGRl
diwgImNzaTAiKSwgZGV2bV9waHlfZ2V0KGRldiwgImNzaTEiKSwgZXRjLiksIGFuZCBvcGVyYXRl
IHRoZSBQSFkgZm9yIGVhY2ggcG9ydCBpbmRpdmlkdWFsbHkgZHVyaW5nIHN0cmVhbSBvbi9vZmYg
b3IgcG93ZXIgb24vb2ZmLg0KPiANCj4gQ291bGQgeW91IHBsZWFzZSBjb25maXJtIGlmIG15IHVu
ZGVyc3RhbmRpbmcgaXMgY29ycmVjdD8NCj4gSWYgeW91IGhhdmUgYW55IGFkZGl0aW9uYWwgcmVm
ZXJlbmNlIHBhdGNoZXMgb3IgZXhhbXBsZXMsIEkgd291bGQgZ3JlYXRseSBhcHByZWNpYXRlIGl0
Lg0KDQpJJ20gbm90IGV4cGVydCBvbiBzZW5pbmYgYW5kIEkgZmluZCBwcmV2aW91cyBsaW5rIFsx
XSBpcyBpbnZhbGlkIG5vdy4NCkkgcHJvdmlkZSBbMl0gaGVyZSBmb3IgeW91ciByZWZlcmVuY2Uu
DQpJIGRvbid0IGtub3cgdGhlIHJlbGF0aW9uIG9mIHBvcnQgYW5kIHBoeS4gWW91IG1heSBmaW5k
IHNvbWUgaGludCBpbiB0aGF0IGxpbmsuDQoNClsxXSBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlzdC8/c2VyaWVzPTg3NDYxNw0KWzJdIGh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8yMDI0
MTEyMS1hZGQtbXRrLWlzcC0zLTAtc3VwcG9ydC12Ny0zLWIwNGRjOTYxMDYxOUBiYXlsaWJyZS5j
b20vDQoNCj4gDQo+IFRoYW5rIHlvdSBmb3IgeW91ciBndWlkYW5jZSENCj4gDQo+IEJlc3QgcmVn
YXJkcywNCj4gU2hhbmd5YW8NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IHNoYW5neWFvLmxpbiA8c2hh
bmd5YW8ubGluQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICsNCj4gK2V4YW1w
bGVzOg0KPiArICAtIHwNCj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNv
bnRyb2xsZXIvYXJtLWdpYy5oPg0KPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1
cHQtY29udHJvbGxlci9pcnEuaD4NCj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcG93ZXIv
bWVkaWF0ZWssbXQ4MTg4LXBvd2VyLmg+DQo+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Ns
b2NrL21lZGlhdGVrLG10ODE4OC1jbGsuaD4NCj4gKw0KPiArICAgIHNlbmluZkAxNjAxMDAwMCB7
DQo+ICsgICAgICBjb21wYXRpYmxlID0gIm1lZGlhdGVrLG10ODE4OC1zZW5pbmYtY29yZSI7DQo+
ICsgICAgICByZWcgPSA8MCAweDE2MDEwMDAwIDAgMHg4MDAwPjsNCj4gKyAgICAgIHJlZy1uYW1l
cyA9ICJiYXNlIjsNCj4gKyAgICAgIG10a19jc2lfcGh5X3ZlciA9ICJtdGtfY3NpX3BoeV8yXzAi
Ow0KDQptdGtfY3NpX3BoeV92ZXIgaXMgbm90IG5lY2Vzc2FyeS4gY29tcGF0aWJsZSBpbXBseSB0
aGlzLg0KU28gZHJvcCB0aGlzLg0KDQpSZWdhcmRzLA0KQ0sNCg0KPiArICAgICAgaW50ZXJydXB0
cyA9IDxHSUNfU1BJIDMxNiBJUlFfVFlQRV9MRVZFTF9ISUdIIDA+Ow0KPiArICAgICAgcG93ZXIt
ZG9tYWlucyA9IDwmc3BtIE1UODE4OF9QT1dFUl9ET01BSU5fQ1NJUlhfVE9QPiwNCj4gKyAgICAg
ICAgICAgICAgICAgICAgICA8JnNwbSBNVDgxODhfUE9XRVJfRE9NQUlOX0NBTV9WQ09SRT4sDQo+
ICsgICAgICAgICAgICAgICAgICAgICAgPCZzcG0gTVQ4MTg4X1BPV0VSX0RPTUFJTl9DQU1fTUFJ
Tj47DQo+ICsgICAgICBjbG9ja3MgPSA8JmNhbXN5cyBDTEtfQ0FNX01BSU5fU0VOSU5GPiwNCj4g
KyAgICAgICAgICAgICAgIDwmdG9wY2tnZW4gQ0xLX1RPUF9TRU5JTkY+LA0KPiArICAgICAgICAg
ICAgICAgPCZ0b3Bja2dlbiBDTEtfVE9QX1NFTklORjE+LA0KPiArICAgICAgICAgICAgICAgPCZ0
b3Bja2dlbiBDTEtfVE9QX0NBTVRNPjsNCj4gKyAgICAgIGNsb2NrLW5hbWVzID0gImNsa19jYW1f
c2VuaW5mIiwNCj4gKyAgICAgICAgICAgICAgICAgICAgImNsa190b3Bfc2VuaW5mIiwNCj4gKyAg
ICAgICAgICAgICAgICAgICAgImNsa190b3Bfc2VuaW5mMSIsDQo+ICsgICAgICAgICAgICAgICAg
ICAgICJjbGtfdG9wX2NhbXRtIjsNCj4gKyAgICB9Ow0KPiArDQo+ICsuLi4NCj4gXCBObyBuZXds
aW5lIGF0IGVuZCBvZiBmaWxlDQoNCg==

