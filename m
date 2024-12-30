Return-Path: <linux-media+bounces-24156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D039FE35D
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 08:39:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C01DD1882379
	for <lists+linux-media@lfdr.de>; Mon, 30 Dec 2024 07:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729791A00E7;
	Mon, 30 Dec 2024 07:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="g7bHzEbq";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="I/7qViuz"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A140F4D8CB;
	Mon, 30 Dec 2024 07:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735544382; cv=fail; b=KhDPrHXsUwV69gmx1XJnqBmlo8qUBpzXVJgsrIIA6xYudpegKSbGgnHBLf3RVpRk6MECNSRaUJqulH67wvMoz0IVPZMS6c29snZoa+Da+HCdMPjXi1ZSDKspB88s8IEr74UQzsBRZBpCiOvBdG4FtJvwhuQaIjKfRYjjRCXqZuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735544382; c=relaxed/simple;
	bh=F081WNjCEr+xaoAY6yhhm+6PFsOrM8G2QfKc8+I/cNY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a23uRkVygwPiJ64NY2Xeo7Du+3qcL7pxkgpiqmRJNifUwYRKu7EM0sXwtZ//QIHfR0Qm2KSKmQ8SO+CtSiBg7BFqULlsBffYoYN1RmWptYk10HiFb6IwDOGb521wlecHp4MMiL1187XUFOs8mMwBRXeo+tCBffBasDBTKg9TaM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=g7bHzEbq; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=I/7qViuz; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3669289ac68111ef99858b75a2457dd9-20241230
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=F081WNjCEr+xaoAY6yhhm+6PFsOrM8G2QfKc8+I/cNY=;
	b=g7bHzEbqP81B0ARNjRUaacGLmpyIJ9JEnABY15V2yd5dve/Y2OdE+50JFt7tg94q6CI09fH/rKReLL4G6e+dxBP5lWHWZR0CNw+rRqHEa5JttQn/yiy1n2FYUd2tmopzJh0egc5PlybHNYLeMtdfM1+TtYXC1YlPxcXhkz9Ia3k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:f037d21a-2639-4b2c-9fc3-031d94427714,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:b5bd1837-e11c-4c1a-89f7-e7a032832c40,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102,TC:nil,Content:0|50,
	EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3669289ac68111ef99858b75a2457dd9-20241230
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 864351051; Mon, 30 Dec 2024 15:39:33 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 30 Dec 2024 15:39:32 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 30 Dec 2024 15:39:32 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ai+ulD75fDmBrCuzEXngZQ5woqUHPamJM8mFOOH+v3WJHQRQxsOSj0RJUq/JLO/VTITPAlOHpMsGJfEdC9eURtGPoglONeKFFB5nEapiX05TkSjRd7b849mXgMC6qls7sbmSjka7JEho6WtCdfUcaIz8vP0DuwtKXHIaY8rnDu0Mx5R1i0jTEby+eMePxPovjHGRDzB867avz+0fwMo/+GwDQ0Q37p8u3FJFBXVRj6dD1aQR6S8MvTN3HyAijlRjogm5QPcJwC+3+TwVyq5Sok7zSsV9K6VR2AtxCHk98dtiCcWDsaaQYEZG2e5wRPVFMG00nOcyVXpB31FZNt9WkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F081WNjCEr+xaoAY6yhhm+6PFsOrM8G2QfKc8+I/cNY=;
 b=BAW1RVU9mvo5Ok9GHuo/hSxZX/0bf7a0i23EL5BeYI7HcmkMiQJgBvG6iaPXzmyzWT0TIeG19XP7igurHkcdfZsPe+9beYENeG7JkYFWwWlJPXITtCg8PgsuAbRW3O5XzFxyVN5pV1EZVY1tAx/GXOroe02LEHr6G3PugsBQrhiDYA03FtGvhn87LuLkN8nrxFnmvJopvPMYvKPdUPQZ2pUXtbgsWSDVbEq11nphIff/ztyoT5UaBl7xEuE/UxiWZrLi7HkGTN/4npLkLhz44bEdIu0Xtkcy5ZoUEiSqPQrB5b6rG7CWEZOolCm0AnLRywCnThGmM0JwVLmv8xCddw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F081WNjCEr+xaoAY6yhhm+6PFsOrM8G2QfKc8+I/cNY=;
 b=I/7qViuz+vesAcs79hMft0r+92SDuZHgE32m8XHE43jjajA1k5DOv/OdBYnN75DrXRhKfif9iJUDNwnj9IrczAW6XktaZy7Cu+o4Tv4theCvlWxnMlKBvS9jbedDg/eYx3ws4c5VX2H4KJDK+X5fA+Ms2oLzBuwj0MuzJhtueoE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TY0PR03MB6605.apcprd03.prod.outlook.com (2603:1096:400:21a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 07:39:29 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%5]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 07:39:29 +0000
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
Thread-Index: AQHbVqv2E/LiiDV3F0q0O1OD05OMm7L+bpEA
Date: Mon, 30 Dec 2024 07:39:29 +0000
Message-ID: <22a0b72681f290eac5364c43160c339b4b3c53b9.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TY0PR03MB6605:EE_
x-ms-office365-filtering-correlation-id: b70de01c-dcc1-480e-4363-08dd28a517d8
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RzNRbUN5YnBLQ0JSM3hxbVNuTlpNaEZyNVNiMDErSWI4UFVrTVNrb1d1ek1E?=
 =?utf-8?B?TUU5NEp3ZTNiUnc3TjJMMVQrUzYzM0tsZjFOODFmeHYwem9tU0dxQzRzOSt2?=
 =?utf-8?B?azF5UlRVV3pyOWpUS24xa09PMHpSeXNzNkRtbFdvd080LzhSMTk1NGxCaUZh?=
 =?utf-8?B?M2ZKanhjZ3JJTnp4cnZBdnhSTkNJaEZneFR2aVlLd0lhQ3I4TFRoM1FKWS95?=
 =?utf-8?B?cGtxRmk2MG1OWmJUMGtnUlJvZkRWaFBRajVMYjdKRzdTTzZUSFczVVM4dVBa?=
 =?utf-8?B?K0ZiU0l3RDF5VFQ3NytyM1RMaytJTVZaVThVUU5xTkw5UG5GOG1QcGZqeWVq?=
 =?utf-8?B?NVdydXJ3OEczQTJMa3hkY3d5Y2dWOXNGR2pqS083YlQ3c3V2ejM5MEVTV2JQ?=
 =?utf-8?B?R0N6eW9BOHpubkwrdVRrRStJR2Q5OUVlWkFpM2NEYUV6OGlWYWVFcGF2KzVv?=
 =?utf-8?B?dDBic0JrQ2N6dnE5YThuWDJGRWpKU1FUNzc2YmtIclVTcWdRemVqV2cyMFdW?=
 =?utf-8?B?YlNOaG1QNE1sWFJjV01RQ0NsTTdGLzNIWlo5eU0yK21kZ3JqT3VDNm9tYUsr?=
 =?utf-8?B?K2lodVFRY1BRaldvRGxMTVgySVNHdEp3RDUzMG82SWE0UDdRNDRaYzhybjVr?=
 =?utf-8?B?MFk0ZmNNNCtSTnZ6Q0dtMmpQTjdRb3daODJBRFZkeFVoeXllbU9xSW0xTXdj?=
 =?utf-8?B?eC9rbElwcUlPMTY1cUplU0lXRVhjQ1RVbzMvVThqNXRpL2NQZEg2U3A4SDA4?=
 =?utf-8?B?VkpzQk9VQ3ZydlRQTzRaRFlyU3lseEJ4MmNzZ20zRU82WkJNQ3BuS2NaSWl6?=
 =?utf-8?B?YUMzZlpPUGwxU1h3Vjd4THRXNi8zdjlKOHZKSWV2K1BBK2VDSWxTdFhUbzUr?=
 =?utf-8?B?dlNiQjR1SFpoV29rME9pMUZxM3llMm93TktTM1QwbHVYNHJCdkc5Uy9QZnJi?=
 =?utf-8?B?TDR4MG55eHRETHJSc0VObzVzSmNDRWRsemU2Q2FicHJ1K2p0MkI1WFpVZER0?=
 =?utf-8?B?UVpydGNKVEc3TFBiN01DWlZnZXJPQmdteTlWWkhXYnk3TmZqMG9kOXFkRnlu?=
 =?utf-8?B?VnZiQ0kvbGhMRGRiNS96V0ZKeUJWK05IYURUL2ZCYjVHdUVnZWYyUXJMSDdw?=
 =?utf-8?B?MU1XTnZoL2hOYm9lK1I5RlpTc2ZjTWJQZDM4TnlGZjA1NTZQeUplWG9PMUxL?=
 =?utf-8?B?cS9FdkRIMG81aE5aM0drWW52MnFvK0lxSi96NHllYXJzODIweDArVFh1Q2Y0?=
 =?utf-8?B?MXI3cWxSOWVSM0laU1diSDljcGR2SlRpL00raGg1aXRBRTZWcFhHQ1dCR0w1?=
 =?utf-8?B?bXV6S2VTTno5VEpGdS9mRWxhbFZPNlhIU3RDWUpxL2J0NmRLMk94bkUxVTB4?=
 =?utf-8?B?YnRjbFpObnlFd2M3TVI5WGVjVzdWL3NpYlFFUVBzcDNmR3RNVVlCVHN1clI3?=
 =?utf-8?B?SkFkd3hGUEEveTYrVkY0NERxV0Z4NUpGOWtoN2lHL2xCN0c3WHBPd0lPSkd6?=
 =?utf-8?B?cXZzM1dGMUNyQzQyUXl5bzd0OWM5UTA2WWlLcXJMZ0o5cGxDU3dYUlBqbFlv?=
 =?utf-8?B?T3IzNnA4SENNMGlMTmlXa0NDYW90T0RTVVZKNjYxU1QwV3F5ZTdzTUx5VzhE?=
 =?utf-8?B?TGZyNWZ2S1FKOTJnT0NVR3JTa0ZjMTUwV2x6WHRZb0U5dUxtS1RxOGhiVVRR?=
 =?utf-8?B?QnU2MnBjQ240cHZNOU5IK0NtdXU0WGFvMjZSRzZic2JIUk9ES1BPU0lNUDhp?=
 =?utf-8?B?RnZaK3AyMjZWTC9JUDl6K0FvZE5Yd3U3VUI2WTBacHhUWkdIVHFaMWowbVJ3?=
 =?utf-8?B?TSt6T3JVdEhaQkpYM3pMU2ZmdjFtN2pFNm11aHQ5akN0Z0tFVnpjT3ZqNU8r?=
 =?utf-8?B?SzNEQjk4TW5yL0FTOTVQam5QTlBLZzVLajNsbjFtZHFHZk5lK3NhZXdrUnRu?=
 =?utf-8?Q?g2LFXv/9xXotpbJCGNSZxCAaDVvdzIah?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b2JiVXVjNDYzWHVIVFZsNS80M0hOZEY4MUpabnh3dzBTTStmZVJ1Zm5NcUZJ?=
 =?utf-8?B?RDlXempod01nSkVZY2lFWDl2by9VOEl1WE53RUptRjM2MkRzeURYa05VY05S?=
 =?utf-8?B?RC8ra0sra1FNeTY5YnpLbU1SbGgrTlRwQk5EQVpQUDdTWVZLQ1c4eFV5UkVJ?=
 =?utf-8?B?bnpqQUtEci9aaElzV2kyNUUwT3RBOU81UFJLMGVhMDlrQS9GNyt3QWx1SzlN?=
 =?utf-8?B?aFYwanZTZ0prRkwvQVplaUUzTVR5RFpJNVhDcGg0T21GZnVNTStMS2Y5N3NY?=
 =?utf-8?B?VFpXZm50M05GVldhS1QwRmhsbjUzKzRjYklwRENqVE12ck11eXIyckVXVitK?=
 =?utf-8?B?d1lONmx6a0RuWnJnTzNKMnVrMHRTMDVhTWt0aXhSQmhDdXV0SzIxN2xKNUpu?=
 =?utf-8?B?SytnOG4rdWM0WFlIZFNsNUV0bGV0OHY0THhGZ0g3VUlhanFUQjFubXlWK29D?=
 =?utf-8?B?TFRxeVRCV1VGRjVya0ZEUzl6dWQxTDJ6S0RFeDJpdXJBeXo1TFI3cEVaVjRT?=
 =?utf-8?B?Um90NWVMcVB4MmE3Wkl0dE9saGRudFZMY1BsSjU4OU9pTEtwYms5Ynh0dE9Y?=
 =?utf-8?B?cDlVU3lnaEZJTEtIdTZ6QjRrb2lhR0FXdWwzVFN1bERTWjh3UHVuK2FGYm5h?=
 =?utf-8?B?M0RuTFhBcWFpVnl4cmlTa1Znb0sxU3NiQzkzNVZXeHRqSHd3UnM4ZmR0b3dt?=
 =?utf-8?B?YzNJSlcreWJHNTFxYjI3blZiOFQzYWhZclAxYVhiMCtSU0l1cDE2SWVhQ3BN?=
 =?utf-8?B?QjZ2anR1MkpVYkphaUdNYWUrYzNxcUFDRWY3WkpCcC81TXV3RUg5TENQZFND?=
 =?utf-8?B?VzdYbW1YbjBMVGUzUERzTkIxbGpqN1VnZXloLzhmcG9YNTBla3V2dXNhSnVz?=
 =?utf-8?B?MC95dVB3Uk14UjFydDRVcU4zYUJjWnJmSjY4Tkg2UyswYzJkNnFoMld4ZmNZ?=
 =?utf-8?B?em0xRWliVmwyS1hhUzVUZFRRM3JwMmpITWI3R25iTEpmRThFdnNpOERBb1Ju?=
 =?utf-8?B?TXZVQzVuWVBIZ0dvU2xOZTBpa1VheENiTDhWaDcxdXV0SmZCeUJxY0J6d0px?=
 =?utf-8?B?bHhBOW5jSjAyMkJuWFpSZVM0Szh1T2J6bHFaOU9yTUNoRFo1S1hrUS9kUFU0?=
 =?utf-8?B?NzJsS0tnY25tWkFyZHE5eDZKaHpGMEVGSm1aZ3JBUUJ3eEhyaURvQWRBWXR4?=
 =?utf-8?B?T3ROczBmRUpIZkRSZ2ZualBFcmtkb0xHcWJYWi9FeENNZEdZaTR4bURNS05s?=
 =?utf-8?B?MTBncWFYLzN3UmxydFhzajFlUGYyd1AwZitSMFJyK0kxZDFxOG1XWS9Ic09q?=
 =?utf-8?B?NFA1Q1pyZ29iZnJ0SDlDc3NhamFCVktMLzVWeDlrWlMxZ0Q0L3NmR3BaUUhI?=
 =?utf-8?B?YkV3b0NObDV2TTJEODNkUUY3aUVOSUh1UXVqOHZzaDZnRFdRamdLM1JMVzZn?=
 =?utf-8?B?WkRmOUFBMGZXTmdUNFJ2U1BFa2RBaWoreG1tSzhvK0JZM2RXZG4rMmFWYm5w?=
 =?utf-8?B?U1VyQUM3ODNVMTd2d1lxOEdZNU5NS0FBZUhWaEdHUXRPT2tlZFVIUlFVNERB?=
 =?utf-8?B?alpiaFNqRHM3eUNaMER1Y2gyZjBxNHoxYTNybThkZ1FoRk41b1ppb0NmTEg3?=
 =?utf-8?B?RTB3NjVoV05McGttT3JKSEpDVU5ZVVZOQ3B4Um9GbFVmTlh1bXNuTTNHQU9q?=
 =?utf-8?B?d3Z1K01SeUZkSlZtWGRZMGQ1aENIaERFS1FhazNvU1FZZEVaRFpGUFdTeVI4?=
 =?utf-8?B?UXRXMEZvYXRJbXc4R08zeDNhbHhVekZWUU5xaHBPS1NHUmwvT2YwTGxYYVZh?=
 =?utf-8?B?L09UN1RIVWFGd08xTXhweDZkN1M4R0xpRktHSEs1RitjT0pJRlBiY0VVREhY?=
 =?utf-8?B?aXljdmZGa3M4Wm15YjFjVU9RT1hGN3FwdmZQeUxPUGN4dlRHTVZWMm80NEMy?=
 =?utf-8?B?WjU1KzVHUUFhdXVYckNDN3Q2bzlvNFdTaEx6cEdTdGVUc2ttU3pndlRaT1Ir?=
 =?utf-8?B?ZzNhYzdKblhJTXQvWlBJS2JleUJ0N3BpMU1uVktwaEd3VjhOcmV5ck9UdFUr?=
 =?utf-8?B?UEFFUCs4aHNXMys2d01VaFNIY3hkZXc3WlVNdFFmd0sxTGs4RGs2NGtndW9r?=
 =?utf-8?Q?gfTCMtm3t0d7E3wa1eSMYze6b?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA570F5BB27CA14F93178A6E8CDDB7CE@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b70de01c-dcc1-480e-4363-08dd28a517d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2024 07:39:29.1181
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pwtP6UWBwB1K9K9HsHwp8sYBrGcH4188X7brlV8E2iqIEr23vPV/d0HBcCB31TBxFV+WHqN4hSxUbkTH3yqg3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6605

T24gV2VkLCAyMDI0LTEyLTI1IGF0IDE3OjAwICswODAwLCBiby5rb25nIHdyb3RlOg0KPiBGcm9t
OiBCbyBLb25nIDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEFkZCBhIFY0TDIgc3ViLWRl
dmljZSBkcml2ZXIgZm9yIE1UODE4OCBBSUUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBCbyBLb25n
IDxCby5Lb25nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICtzdGF0aWMgaW50
IG10a19haWVfY3RybF90eXBlX29wX3ZhbGlkYXRlKGNvbnN0IHN0cnVjdCB2NGwyX2N0cmwgKmN0
cmwsDQo+ICsJCQkJCSB1bmlvbiB2NGwyX2N0cmxfcHRyIHB0cikNCj4gK3sNCj4gKwlzdHJ1Y3Qg
bXRrX2FpZV9jdHggKmN0eCA9IGN0cmxfdG9fY3R4KGN0cmwpOw0KPiArCXN0cnVjdCBtdGtfYWll
X2RldiAqZmQ7DQo+ICsJc3RydWN0IHY0bDJfY3RybF9haWVfaW5pdCAqcF9haWVfaW5pdDsNCj4g
KwlzdHJ1Y3QgdjRsMl9jdHJsX2FpZV9wYXJhbSAqcF9haWVfcGFyYW07DQo+ICsNCj4gKwlpZiAo
IWN0eCkNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsNCj4gKwlmZCA9IGN0eC0+ZmRfZGV2Ow0K
PiArDQo+ICsJc3dpdGNoIChjdHJsLT5pZCkgew0KPiArCWNhc2UgVjRMMl9DSURfTVRLX0FJRV9Q
QVJBTToNCj4gKwkJcF9haWVfcGFyYW0gPSBwdHIucDsNCj4gKw0KPiArCQlzd2l0Y2ggKHBfYWll
X3BhcmFtLT5mZF9tb2RlKSB7DQo+ICsJCWNhc2UgRkRNT0RFOg0KPiArCQljYXNlIEFUVFJJQlVU
RU1PREU6DQo+ICsJCWNhc2UgRkxETU9ERToNCj4gKwkJCWJyZWFrOw0KPiArCQlkZWZhdWx0Og0K
PiArCQkJZGV2X2VycihjdHgtPmRldiwgIkFJRSBlcnI6ICBtb2RlOiAlZFxuIiwgcF9haWVfcGFy
YW0tPmZkX21vZGUpOw0KPiArCQkJCXJldHVybiAtRUlOVkFMOw0KPiArCQl9DQo+ICsNCj4gKwkJ
c3dpdGNoIChwX2FpZV9wYXJhbS0+c3JjX2ltZ19mbXQpIHsNCj4gKwkJY2FzZSBGTVRfWVVWXzJQ
Og0KPiArCQljYXNlIEZNVF9ZVlVfMlA6DQo+ICsJCWNhc2UgRk1UX1lVWVY6DQo+ICsJCWNhc2Ug
Rk1UX1lWWVU6DQo+ICsJCWNhc2UgRk1UX1VZVlk6DQo+ICsJCWNhc2UgRk1UX1ZZVVk6DQo+ICsJ
CWNhc2UgRk1UX01PTk86DQo+ICsJCWNhc2UgRk1UX1lVVjQyMF8yUDoNCj4gKwkJY2FzZSBGTVRf
WVVWNDIwXzFQOg0KPiArCQkJYnJlYWs7DQo+ICsJCWRlZmF1bHQ6DQo+ICsJCQlkZXZfZXJyKGN0
eC0+ZGV2LCAiQUlFIGVycjogIGZtdDogJWRcbiIsIHBfYWllX3BhcmFtLT5zcmNfaW1nX2ZtdCk7
DQo+ICsJCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwkJfQ0KPiArDQo+ICsJCWlmIChwX2FpZV9wYXJh
bS0+c3JjX2ltZ193aWR0aCA+DQo+ICsJCQkJZmQtPmJhc2VfcGFyYS0+bWF4X2ltZ193aWR0aCB8
fA0KPiArCQkJcF9haWVfcGFyYW0tPnNyY19pbWdfaGVpZ2h0ID4NCj4gKwkJCQlmZC0+YmFzZV9w
YXJhLT5tYXhfaW1nX2hlaWdodCB8fA0KPiArCQkJcF9haWVfcGFyYW0tPnNyY19pbWdfd2lkdGgg
PT0gMCB8fA0KPiArCQkJcF9haWVfcGFyYW0tPnNyY19pbWdfaGVpZ2h0ID09IDApIHsNCg0KV2h5
IG1heF9pbWdfd2lkdGggYW5kIG1heF9pbWdfaGVpZ2h0IGlzIHBhc3NlZCBmcm9tIHVzZXIgc3Bh
Y2U/DQpJIHRoaW5rIGl0J3MgdGhlIGhhcmR3YXJlIGxpbWl0YXRpb24gYW5kIHNob3VsZCBiZSBk
ZWZpbmVkIGluIGRyaXZlci4NCg0KUmVnYXJkcywNCkNLDQoNCj4gKwkJCWRldl9lcnIoZmQtPmRl
diwgIkFJRSBlcnI6IFNyY19XRDogJWQgU3JjX0hUOiAlZFxuIiwNCj4gKwkJCQlwX2FpZV9wYXJh
bS0+c3JjX2ltZ193aWR0aCwNCj4gKwkJCQlwX2FpZV9wYXJhbS0+c3JjX2ltZ19oZWlnaHQpOw0K
PiArDQo+ICsJCQlkZXZfZXJyKGZkLT5kZXYsDQo+ICsJCQkJIkFJRSBlcnI6IE1BWF9TcmNfV0Q6
ICVkIE1BWF9TcmNfSFQ6ICVkXG4iLA0KPiArCQkJCWZkLT5iYXNlX3BhcmEtPm1heF9pbWdfd2lk
dGgsDQo+ICsJCQkJZmQtPmJhc2VfcGFyYS0+bWF4X2ltZ19oZWlnaHQpOw0KPiArDQo+ICsJCQly
ZXR1cm4gLUVJTlZBTDsNCj4gKwkJfQ0KPiArDQo+ICsJCWlmIChwX2FpZV9wYXJhbS0+cHlyYW1p
ZF9iYXNlX3dpZHRoDQo+ICsJCQkJPiBmZC0+YmFzZV9wYXJhLT5tYXhfcHlyYW1pZF93aWR0aCB8
fA0KPiArCQkJcF9haWVfcGFyYW0tPnB5cmFtaWRfYmFzZV9oZWlnaHQNCj4gKwkJCQk+IGZkLT5i
YXNlX3BhcmEtPm1heF9weXJhbWlkX2hlaWdodCB8fA0KPiArCQkJcF9haWVfcGFyYW0tPm51bWJl
cl9vZl9weXJhbWlkID4gMyB8fA0KPiArCQkJcF9haWVfcGFyYW0tPm51bWJlcl9vZl9weXJhbWlk
IDw9IDApIHsNCj4gKwkJCWRldl9lcnIoZmQtPmRldiwgIkFJRSBlcnI6IGJhc2UgdzogJWQgaDog
JWQgbnVtOiAlZFxuIiwNCj4gKwkJCQlwX2FpZV9wYXJhbS0+cHlyYW1pZF9iYXNlX3dpZHRoLA0K
PiArCQkJCXBfYWllX3BhcmFtLT5weXJhbWlkX2Jhc2VfaGVpZ2h0LA0KPiArCQkJCXBfYWllX3Bh
cmFtLT5udW1iZXJfb2ZfcHlyYW1pZCk7DQo+ICsNCj4gKwkJCWRldl9lcnIoZmQtPmRldiwgIkFJ
RSBlcnI6IG1heCB3OiAlZCBoOiAlZFxuIiwNCj4gKwkJCQlmZC0+YmFzZV9wYXJhLT5tYXhfcHly
YW1pZF93aWR0aCwNCj4gKwkJCQlmZC0+YmFzZV9wYXJhLT5tYXhfcHlyYW1pZF9oZWlnaHQpOw0K
PiArDQo+ICsJCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwkJfQ0KPiArDQo+ICsJCWJyZWFrOw0KPiAr
DQo+ICsJY2FzZSBWNEwyX0NJRF9NVEtfQUlFX0lOSVQ6DQo+ICsJCXBfYWllX2luaXQgPSBwdHIu
cDsNCj4gKwkJaWYgKCFwX2FpZV9pbml0LT5tYXhfaW1nX3dpZHRoIHx8ICFwX2FpZV9pbml0LT5t
YXhfaW1nX2hlaWdodCB8fA0KPiArCQkgICAgIXBfYWllX2luaXQtPnB5cmFtaWRfd2lkdGggfHwg
IXBfYWllX2luaXQtPnB5cmFtaWRfaGVpZ2h0KSB7DQo+ICsJCQlkZXZfZXJyKGZkLT5kZXYsDQo+
ICsJCQkJIkFJRSBJTklUIGVycjogbWF4X3c6ICVkIG1heF9oOiAlZCwgcF93OiAlZCBwX2g6ICVk
XG4iLA0KPiArCQkJCXBfYWllX2luaXQtPm1heF9pbWdfd2lkdGgsIHBfYWllX2luaXQtPm1heF9p
bWdfaGVpZ2h0LA0KPiArCQkJCXBfYWllX2luaXQtPnB5cmFtaWRfd2lkdGgsIHBfYWllX2luaXQt
PnB5cmFtaWRfaGVpZ2h0KTsNCj4gKw0KPiArCQkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJCX0NCj4g
Kw0KPiArCQlicmVhazsNCj4gKw0KPiArCWRlZmF1bHQ6DQo+ICsJCXJldHVybiAtRUlOVkFMOw0K
PiArCX0NCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArDQoNCg==

