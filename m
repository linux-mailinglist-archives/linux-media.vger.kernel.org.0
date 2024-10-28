Return-Path: <linux-media+bounces-20389-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC9F9B278C
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 07:49:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E1961C21452
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 06:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172DC18EFD0;
	Mon, 28 Oct 2024 06:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WJJWbi+H";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="tAgAO64b"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234CB8837;
	Mon, 28 Oct 2024 06:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730098150; cv=fail; b=K70hKesf9FlRHt+Uyvaxu7kJXOnsZ89QbA8TuIGU60MMYXJTrV6aNgetMmAJkaPwpvpLIuzTT6/BUkFdtNG9Ra+YDbMPyOxUUOM6bMERNQKVKtk6ukHbKyfbaHVaAFnnRaQhIVEFFBBHJEjL4/Z9OdIRvow5JB/WNwK34O7JFno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730098150; c=relaxed/simple;
	bh=ZP+cSSVAS6DL8CzaGRSIB5e3JXDsV2CXr6KC8mnvbv0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jnVPJDFyOlDC0ALf0iKL03iBK/X6mcu4EtAaIsgezR76uJ95cSEYEXsK7PWgMzkauswdDZ+bhu74QqFhKCQEGRuf+NNljsrkrueKiofaP7E0N9absDMXjrDsvBaBH2UZtkj+xBmOjDFfnVexkWt9iYrTYfSdpy3CL3FT9hywfFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=WJJWbi+H; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=tAgAO64b; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: b62ce9e694f811efbd192953cf12861f-20241028
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=ZP+cSSVAS6DL8CzaGRSIB5e3JXDsV2CXr6KC8mnvbv0=;
	b=WJJWbi+HGcDAc6ll5Wtv5tVQVu5bpCyLIoIzakLCjVOodw1TsAfQfpq+ul4/PpawZimsBzHiE+jPtt0q6wqcMSiebkJcLGPxMgnGyXtNI+hJZhlRxiFc/FzzpUrGS7BUSDGD1AZ3rVsLUsM+62blL/xrH8ZKi2kMDkM8CLBkIno=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:481779f7-ac4d-417d-8878-84c1ea654d98,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:9675f6cc-110e-4f79-849e-58237df93e70,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|-5,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b62ce9e694f811efbd192953cf12861f-20241028
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2017877302; Mon, 28 Oct 2024 14:49:00 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 27 Oct 2024 23:48:58 -0700
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 28 Oct 2024 14:48:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GQrs18gZ5EBFQwGzfieM25rjENNittTBcX+ZIlDYTCB8wHmWjovLlwZCFUPKo3Doz/s/VfBC0EK1ulFr042ZS6V6wJnjzKF1k5uhrupwQNfc92Auwe7iNH+RxLKVuOyLIcv+RHGSnGnV+64MN06B8ZyHV+zv4un8ww3YmCTlCtyVjaR/cxyaKa2IVeV4sCrdM2H/fZJIDBYejl1KQNhB5RChI+Xst2tuLEWnPfia5LrxkaW2JsA6vURoL8CIj2ssx8VhTfwJJSma139KAxbiIaAfx+8eZNWpWt+/cGcCRUm+d1otnI+5JIwSKSX9xNoGQIGJ6pcuLkhszxzCHAy2qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZP+cSSVAS6DL8CzaGRSIB5e3JXDsV2CXr6KC8mnvbv0=;
 b=yZIFE4ZCfTRyDAgV7qJzu0ga+nReDtzNpQgJElC7QDN36OEPlUbH/20E74jdn5fRgnAMv1a0sDJyeb3lL/NcbL91DSBXMogwD6YXSbCa6O9XGWXl0DzOwUB2Moo1AK8YqwzDTDuzYJfsQom8RuOK8e2zWytz3UA4m/QRNqFHMNk1dX21UPG+ghB2Mup2Gsk5pqpTyuBWl3np0PkfeG4q8inb6QWigIIQFkjsmGKxASwfDXD1nauJZbocylfpVQBaSW6u0pguKOh+VtdIkk+zEExIcIaMC+tuiZvN35rAFso9LB+qdmKutRvEGvCx+YN4d1Vb0d9DNksnQYyBY2PI0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZP+cSSVAS6DL8CzaGRSIB5e3JXDsV2CXr6KC8mnvbv0=;
 b=tAgAO64bCdi0jUgsRus2T7NNxB3YOkqzv772ZFvWzZ7OVo8uuNZWOC/lWWTQKlhawmSiiN/BMbzGJZ0e9T5Snpj7nM7iFTqFm5wE6uze5MUKhrxThtmUlz2HBRTSAjMimV3GnnabyZ9O19u/uqU+yMysuxJzDdMG5wmg1CGy96U=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7647.apcprd03.prod.outlook.com (2603:1096:820:e7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Mon, 28 Oct
 2024 06:48:40 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8093.021; Mon, 28 Oct 2024
 06:48:40 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?U2h1LWhzaWFuZyBZYW5nICjmpYroiJLnv5Qp?=
	<Shu-hsiang.Yang@mediatek.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"yunkec@chromium.org" <yunkec@chromium.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	=?utf-8?B?VGVkZHkgQ2hlbiAo6Zmz5Lm+5YWDKQ==?= <Teddy.Chen@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "hidenorik@chromium.org"
	<hidenorik@chromium.org>, =?utf-8?B?U2h1bi1ZaSBXYW5nICjnjovpoIblhIQp?=
	<Shun-Yi.Wang@mediatek.com>
Subject: Re: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Topic: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
Thread-Index: AQHbGj2G8utVn4Ab5UaBggOzyqwWS7Kb1luA
Date: Mon, 28 Oct 2024 06:48:40 +0000
Message-ID: <9ec4cdb2a5f86c045ec8ddb24de1545225c35d78.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7647:EE_
x-ms-office365-filtering-correlation-id: aff65d12-27c1-451e-5be8-08dcf71c8e96
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MTA3cHY3b2lRYVZKSnFOSkJFSG5lbkJBd1hDbHF4azY1d2pWZEZLMk5LZXFM?=
 =?utf-8?B?T1VrZG1uVlJOREtYSFBuWit6Yi9MZ3BhVHlqejd3VjAwZVN2TGNPYzNFdU1i?=
 =?utf-8?B?bGtIZGliNGJ6S2dwd0ViVEsvbVFBUjdsdWpuZ2srczVuL0hGMUFYOFRITGJQ?=
 =?utf-8?B?STdzOXF6c2tBV3ZleTJoUlk5bS9qQVdtdWFHWGpTd21MNzBvbXpzKzNobzJ2?=
 =?utf-8?B?NGc0bklRa0cyWDlITTdlWnBuRlFaWXVCUXNPUHc3NUpxeXM3U21YNHhNV1BR?=
 =?utf-8?B?djB4b2NzdGt4bmFtb2k1Z2RjMFZiZFpaU29WU0Rzb3dIZmRSeStiemsxZzFn?=
 =?utf-8?B?cEM2Y2VnTlh6RXlZY0trNzEzamNhZ2ZwZ0NvUjFmSjZ3RmhjM0Z3djdkcjJK?=
 =?utf-8?B?RWQvZ25BakRKc1NKT0dZR0EyNlVDaGthTE1maG13bDdLSzU0cHdZbmRCSGhK?=
 =?utf-8?B?cnhiZDFrdHJEY1lESXYxWC91bzlTUncxREM3MWt3UmthNUpnZXpQTkxjU2Ni?=
 =?utf-8?B?TmFUQ0RtNGw3eHd3Y2pHZW5Ld3p3TmFlZ2J0bForS2k5czQyUnZxTXhqUHB4?=
 =?utf-8?B?NXd5TDdpYTBGVnp0MUVVRUprQTJGYmZPUEtLSEZEdmpYTURNcFA3ZjF4R2sz?=
 =?utf-8?B?cCtJYXdNdkgvL2hFZGJGRE9sMW5OUG4vV0h2Nm14VG5TUkJneDdVbjI3K3Fr?=
 =?utf-8?B?YjI4SzB4WWkxMjUvZUpwNHdVZmdxZVdqaTY4b1BRZlJ0K0JwV0JwZzA5TENV?=
 =?utf-8?B?eXVwRkJXc0ZDT1lEVTZEU1lJQkRpVDMvcWowcEwwenoyUloraUNsV25UMk5o?=
 =?utf-8?B?WmZERldnajRwQ080QWJteUdKSDVXanFtaThoYytGVXJNamNLZlY0bWNHblFm?=
 =?utf-8?B?d1ZRdHh2RTZ4VW1mVG91bmVOM0wrZXhNR3FtV29sUVNZNE1UTlowQlVEa3d3?=
 =?utf-8?B?VmVIUzdHQjRReEM3MXZWd1lMaTlSdWRBSTZpQityOVd1cXQ3VnRzek5qSkUz?=
 =?utf-8?B?eWFoTVpzaDlQMGRGWlRxRGN5N2tPVWM3YkxydDdBcWNUOUVCeDNoN0NyUk1q?=
 =?utf-8?B?dkNKdldKcGJ1SFltMllxZjRBMlRUcEdicVNpbEpoRk04TmRHZ0RDSGR6ZS9n?=
 =?utf-8?B?aFFBWWtuYUN4UkwxdFJDSUR5eExqMk5GcUg5WW1IeUJyU1dZc3NvbE56VFBm?=
 =?utf-8?B?UzdhUXZXS21ERy8vK05PekZTZmUrWDFqMzNwQUxhV3ljNzVRR1VyaXFPdUgx?=
 =?utf-8?B?cVNlTWFyWS80NFJISTBMZUFrSmRuck5qRkxUL0dUaGhsb3lYdDdNR1IrY3ox?=
 =?utf-8?B?UzFSNUp0NmxmcHY2YmVpQ3Q4VGcxMDBTdXo3MmNEMStLR25XTHJXNzBtQWpI?=
 =?utf-8?B?TzNqOHNaTjYyY2xrb3pwUzhBczVTNFNBOVJJREFOUU54N2ZoNk5xVElpTmxD?=
 =?utf-8?B?MWZXRTREUmdXdXhRZEVocHQyajFWQm9YTmtLcmIzN2pBenlJc0FyRUxrb0hv?=
 =?utf-8?B?OUgwWWFjczJXbU8vL1RrUnJLRCtITCs3dVVhbEZ6S3JjOHJ5Q2JET0NWUmxv?=
 =?utf-8?B?aXJqUWxLbXdsTGdEV3NwRWQvVUdkNXQ0ODh5c3M3TFMrbkRWVllYcTRlS3M3?=
 =?utf-8?B?eUFGVTM2cXdHci9ub1RSeGIzSFFLTXB4dnNpaGcrOTQ3ZGJ3QkNjMWZLN1I3?=
 =?utf-8?B?NG5oYldldngzbmYrd3QvMzZzdERibDRnM3hLWmdBZVhuc00xYWszRU5KV2ta?=
 =?utf-8?B?MmgycU1wY1FYMzlURnpHNk1vUW5TTVVXMVdMMUkrb1RoWHhlT2s5K2FLbEdG?=
 =?utf-8?Q?4ckLl6s4rnZpQUnaUiDT/v5uLxtUSdCQ2hRrY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SG1laGNFVEhYQm53SDlHZW1URkEvTGdQRU83OGU1YWM4ZzV2Vm9DYmtncHhI?=
 =?utf-8?B?NTVMSHIzVXQwR0VpWkNYcTRzd3o0bG9QU3h3aUVHRm1wVnFVSXZ6R0NEWDhQ?=
 =?utf-8?B?b25NdG1FZ3pOejRIV0ttWVVpZGxYZTU1REllTTlISHRFdkNLdW0rKzNwWjJ5?=
 =?utf-8?B?VVlhNERvNjJrQWR4S2NvTjEwanNtemZWNS9ESHlsOXU2ZVlQS0FLNDlBZ1ZP?=
 =?utf-8?B?YmpUUkVvdTM0a2l5TmdxaTB6dEJsYnluT09oRTJjZnRaYXRrTmgrUGlZaWxD?=
 =?utf-8?B?ZHgvOGs4djgreFhBMU9VRTlPM0ZaRStOODhxeWNSdnJkZHIwN29WN004Wm1Z?=
 =?utf-8?B?VmprSXlGTkQ0bUdEc1Rlb21sam9KVmJ5MU1TdXJEQXZFNExmU3pIMlZzK1R6?=
 =?utf-8?B?MkNGQVA4YStVVlJuTk42SjBaalB1Z1RNb1gxY1o0bkZLZFFUbU9iWTc0SHF4?=
 =?utf-8?B?Sy9iSXZ3ZHFrYUlDL2k0RHRZdEVoRnVLOS9WUWJLdGhSelIralBiMFJmd3Az?=
 =?utf-8?B?L1prRXpnOEtsaG80TEh6TWU3OCtENnJwUDNydkZUMUVEUEV1eW5vV2o4OWpR?=
 =?utf-8?B?S1FhZnh5aEVQdW1sRzhrME9tRUorSG9kbndpV2tPT0VkUmlBRDFiSFdrMmZQ?=
 =?utf-8?B?NTIrYTZLSGZta2xreEQybXJ5bi9TRW0reHVCbzZtMnhSdFhhK3BKR1YrQkF0?=
 =?utf-8?B?UzdObERhdXU3VS8wZmJjTExnYXB0ZHhraWo0eXV1Q2JXTXJyUVA2K3o4ZjFD?=
 =?utf-8?B?ZlhHemdGVXZsb09aVTVldlF1Zm1LMk5BVzVxaFFlV09qSEFjMklONFdrYWZu?=
 =?utf-8?B?MlBreHFrSmUzdjd1dUdBOXg3ODlxYWxlTytsTGRneUUvMEt1UWMxK3o0emcv?=
 =?utf-8?B?QVlpUHp6VjFibks4cHhDMVgyVkxrSFBQOFpvYktXUW9DNWpHWVR5b2hLV2xi?=
 =?utf-8?B?RmdYazRydlBVRWZnMjh0ajROTThQdGdqcDNqbnN0M3JVbWY4Nk1jRlBhSWJT?=
 =?utf-8?B?T2w3eEF0K29TV3oxUk9NcjRjV1BFRWdYTWNGU1BleVJ6OCtzN1RCdnlOZDJn?=
 =?utf-8?B?dkhmdHp3VWw5ZVZtV3E4SjJEL3p3WGlXSEhxMWoxTGR1Nzd0UTcxUXQvaStS?=
 =?utf-8?B?bUQ3YmhIRTZTeVhVTGV0Q2VGNHZOSW5tYXhxQlJyQjZ6QVZsN1VidTlEc2Fh?=
 =?utf-8?B?UE96UFZBeGdNVEpsUkdLTG0vejFFQm52UGhFOHFCUGVKc2JoS1ppK01KMnB1?=
 =?utf-8?B?OEh6NlhmeGpVNkdibGhGamh6cW4vMTBWNndZSzdvTDNkNVA0aThlM204OEtO?=
 =?utf-8?B?d1lVcTBIalhTcE5FUWNzOUttR29jR0tNaFdoRENVbWRiQnF5bm5JcUFxY29H?=
 =?utf-8?B?dEhnaURFVHI0a1haMHJ4VmFCMWF5Qkp0VngvV0FUM0xzbWhKUlpydW9MLzQv?=
 =?utf-8?B?MHlxNWRDb2xpNGRqbHVxNU8zYWM5MUpPWXh5amhyZW5vc3BPWWZSYTNoRFZP?=
 =?utf-8?B?WWY0b28xOHFsODl5cmZjNkdkNWRzOGM5M3hWOW1KcXFjanhNdGFSa3R2aElx?=
 =?utf-8?B?VnVpZFZ6Z2szL1krenR0UGpOdjBoZzhLWFZzZ2Q2UlV3Y2dsUHAzYndMWkx5?=
 =?utf-8?B?OFhITVZEYnhFbEhzakhnNTUrd2YyTGllUHBaUzZPM2xkMG9uY3RCeGJ5ak1W?=
 =?utf-8?B?VnZnZ2djdW5mdUVRaUU0RGRiQjRjeVJLVUJhYW1QNjRRMjBEOHMzRzVXU0FQ?=
 =?utf-8?B?VHk3UFphNU4ycDIrTTV6My83S3VKVEd4Qk9tVUdnd21UWjJDZVFkaFpCZTN6?=
 =?utf-8?B?cmR4c0RDMFdsY1VYSHFzL2NQL0hXWGErTEp5MnNvaTVoQ0lsSXBsZ3poTEJj?=
 =?utf-8?B?bGR6Y0NKWnQxNS9RVWFjNGRXOXpDbitSMHVlUURURFl3Tkh2NFJvVkpPdldt?=
 =?utf-8?B?V254RDJWdVVDZlNMdmVIRWxxaG8waGMrSzJXOXVVbk1jUVJqTFFIYWZVZWdM?=
 =?utf-8?B?YjdQdjVld0VnYmhmWHF2OXNJZVhBVmF0TmQ1VCtITE9uaGttRGE3MmxsYVU0?=
 =?utf-8?B?VUVMOURNTWFyL3RaUEtjQ09GMEYvcTN1M0psaUNWdTdYSU1GYmEwcGlwZUJk?=
 =?utf-8?Q?Zba9WKxSx/LKA6l22vrqth+M+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A3A208928596D48BAFEC3E18DD222BF@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff65d12-27c1-451e-5be8-08dcf71c8e96
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2024 06:48:40.2542
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rc28H9SCQK40SI1awL8eCpbXvLx+HNRHLupnPi1u270b+azVOHS3IjtBMrMQyfOHYrMlNeQ0DGjNlNzHG4QA9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7647

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHRoZSBJU1AgcGlwZWxpbmUgZHJpdmVy
IGZvciB0aGUgTWVkaWFUZWsgSVNQIHJhdyBhbmQgeXV2DQo+IG1vZHVsZXMuIEtleSBmdW5jdGlv
bmFsaXRpZXMgaW5jbHVkZSBkYXRhIHByb2Nlc3NpbmcsIFY0TDIgaW50ZWdyYXRpb24sDQo+IHJl
c291cmNlIG1hbmFnZW1lbnQsIGRlYnVnIHN1cHBvcnQsIGFuZCB2YXJpb3VzIGNvbnRyb2wgb3Bl
cmF0aW9ucy4NCj4gQWRkaXRpb25hbGx5LCBJUlEgaGFuZGxpbmcsIHBsYXRmb3JtIGRldmljZSBt
YW5hZ2VtZW50LCBhbmQgTWVkaWFUZWsNCj4gSVNQIERNQSBmb3JtYXQgc3VwcG9ydCBhcmUgYWxz
byBpbmNsdWRlZC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNodS1oc2lhbmcgWWFuZyA8U2h1LWhz
aWFuZy5ZYW5nQG1lZGlhdGVrLmNvbT4NCj4gLS0tDQoNCltzbmlwXQ0KDQo+ICsNCj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgbXRrX2NhbV9mb3JtYXRfZGVzYyB5dXZfb3V0X2dyb3VwMl9mbXRzW10g
PSB7DQo+ICsJew0KPiArCQkudmZtdC5mbXQucGl4X21wID0gew0KPiArCQkJLndpZHRoID0gWVVW
X0dST1VQMl9NQVhfV0lEVEgsDQo+ICsJCQkuaGVpZ2h0ID0gWVVWX0dST1VQMl9NQVhfSEVJR0hU
LA0KDQpJIGRvbid0IGtub3cgd2h5IHlvdSBkZWZpbmUgd2lkdGggYW5kIGhlaWdodCBoZXJlLg0K
QWxsIHdpZHRoL2hlaWdodCBvZiB5dXZfb3V0X2dyb3VwMl9mbXRzIGFyZSB0aGUgc2FtZS4NCkFu
ZCB0aGUgbWF4IHdpZHRoL2hlaWdodCBpcyBkZWZpbmUgaW4gY2FwdHVyZV9xdWV1ZXNbXS5mcm1z
aXplcy4NClNvIHRoZSB3aWR0aC9oZWlnaHQgY291bGQgYmUgZHJvcHBlZCBoZXJlLg0KDQpSZWdh
cmRzLA0KQ0sNCg0KPiArCQkJLnBpeGVsZm9ybWF0ID0gVjRMMl9QSVhfRk1UX05WMTIsDQo+ICsJ
CX0sDQo+ICsJfSwNCj4gKwl7DQo+ICsJCS52Zm10LmZtdC5waXhfbXAgPSB7DQo+ICsJCQkud2lk
dGggPSBZVVZfR1JPVVAyX01BWF9XSURUSCwNCj4gKwkJCS5oZWlnaHQgPSBZVVZfR1JPVVAyX01B
WF9IRUlHSFQsDQo+ICsJCQkucGl4ZWxmb3JtYXQgPSBWNEwyX1BJWF9GTVRfTlYyMSwNCj4gKwkJ
fSwNCj4gKwl9LA0KPiArCXsNCj4gKwkJLnZmbXQuZm10LnBpeF9tcCA9IHsNCj4gKwkJCS53aWR0
aCA9IFlVVl9HUk9VUDJfTUFYX1dJRFRILA0KPiArCQkJLmhlaWdodCA9IFlVVl9HUk9VUDJfTUFY
X0hFSUdIVCwNCj4gKwkJCS5waXhlbGZvcm1hdCA9IFY0TDJfUElYX0ZNVF9OVjEyXzEwLA0KPiAr
CQl9LA0KPiArCX0sDQo+ICsJew0KPiArCQkudmZtdC5mbXQucGl4X21wID0gew0KPiArCQkJLndp
ZHRoID0gWVVWX0dST1VQMl9NQVhfV0lEVEgsDQo+ICsJCQkuaGVpZ2h0ID0gWVVWX0dST1VQMl9N
QVhfSEVJR0hULA0KPiArCQkJLnBpeGVsZm9ybWF0ID0gVjRMMl9QSVhfRk1UX05WMjFfMTAsDQo+
ICsJCX0sDQo+ICsJfSwNCj4gKwl7DQo+ICsJCS52Zm10LmZtdC5waXhfbXAgPSB7DQo+ICsJCQku
d2lkdGggPSBZVVZfR1JPVVAyX01BWF9XSURUSCwNCj4gKwkJCS5oZWlnaHQgPSBZVVZfR1JPVVAy
X01BWF9IRUlHSFQsDQo+ICsJCQkucGl4ZWxmb3JtYXQgPSBWNEwyX1BJWF9GTVRfTVRJU1BfTlYx
Ml8xMFAsDQo+ICsJCX0sDQo+ICsJfSwNCj4gKwl7DQo+ICsJCS52Zm10LmZtdC5waXhfbXAgPSB7
DQo+ICsJCQkud2lkdGggPSBZVVZfR1JPVVAyX01BWF9XSURUSCwNCj4gKwkJCS5oZWlnaHQgPSBZ
VVZfR1JPVVAyX01BWF9IRUlHSFQsDQo+ICsJCQkucGl4ZWxmb3JtYXQgPSBWNEwyX1BJWF9GTVRf
TVRJU1BfTlYyMV8xMFAsDQo+ICsJCX0sDQo+ICsJfSwNCj4gKwl7DQo+ICsJCS52Zm10LmZtdC5w
aXhfbXAgPSB7DQo+ICsJCQkud2lkdGggPSBZVVZfR1JPVVAyX01BWF9XSURUSCwNCj4gKwkJCS5o
ZWlnaHQgPSBZVVZfR1JPVVAyX01BWF9IRUlHSFQsDQo+ICsJCQkucGl4ZWxmb3JtYXQgPSBWNEwy
X1BJWF9GTVRfTlYxMl8xMiwNCj4gKwkJfSwNCj4gKwl9LA0KPiArCXsNCj4gKwkJLnZmbXQuZm10
LnBpeF9tcCA9IHsNCj4gKwkJCS53aWR0aCA9IFlVVl9HUk9VUDJfTUFYX1dJRFRILA0KPiArCQkJ
LmhlaWdodCA9IFlVVl9HUk9VUDJfTUFYX0hFSUdIVCwNCj4gKwkJCS5waXhlbGZvcm1hdCA9IFY0
TDJfUElYX0ZNVF9OVjIxXzEyLA0KPiArCQl9LA0KPiArCX0sDQo+ICsJew0KPiArCQkudmZtdC5m
bXQucGl4X21wID0gew0KPiArCQkJLndpZHRoID0gWVVWX0dST1VQMl9NQVhfV0lEVEgsDQo+ICsJ
CQkuaGVpZ2h0ID0gWVVWX0dST1VQMl9NQVhfSEVJR0hULA0KPiArCQkJLnBpeGVsZm9ybWF0ID0g
VjRMMl9QSVhfRk1UX01USVNQX05WMTJfMTJQLA0KPiArCQl9LA0KPiArCX0sDQo+ICsJew0KPiAr
CQkudmZtdC5mbXQucGl4X21wID0gew0KPiArCQkJLndpZHRoID0gWVVWX0dST1VQMl9NQVhfV0lE
VEgsDQo+ICsJCQkuaGVpZ2h0ID0gWVVWX0dST1VQMl9NQVhfSEVJR0hULA0KPiArCQkJLnBpeGVs
Zm9ybWF0ID0gVjRMMl9QSVhfRk1UX01USVNQX05WMjFfMTJQLA0KPiArCQl9LA0KPiArCX0NCj4g
K307DQo+ICsNCg0KW3NuaXBdDQoNCj4gKyNkZWZpbmUgTVRLX1JBV19UT1RBTF9DQVBUVVJFX1FV
RVVFUyAxNQ0KPiArc3RhdGljIGNvbnN0IHN0cnVjdA0KPiArbXRrX2NhbV9kZXZfbm9kZV9kZXNj
IGNhcHR1cmVfcXVldWVzW10gPSB7DQo+IA0KDQpbc25pcF0NCg0KPiArCXsNCj4gKwkJLmlkID0g
TVRLX1JBV19ZVVZPXzJfT1VULA0KPiArCQkubmFtZSA9ICJ5dXZvIDIiLA0KPiArCQkuY2FwID0g
VjRMMl9DQVBfVklERU9fQ0FQVFVSRV9NUExBTkUsDQo+ICsJCS5idWZfdHlwZSA9IFY0TDJfQlVG
X1RZUEVfVklERU9fQ0FQVFVSRV9NUExBTkUsDQo+ICsJCS5saW5rX2ZsYWdzID0gTUVESUFfTE5L
X0ZMX0VOQUJMRUQgfCAgTUVESUFfTE5LX0ZMX0lNTVVUQUJMRSwNCj4gKwkJLmltYWdlID0gdHJ1
ZSwNCj4gKwkJLnNtZW1fYWxsb2MgPSBmYWxzZSwNCj4gKwkJLmRtYV9wb3J0ID0gTVRLQ0FNX0lQ
SV9SQVdfWVVWT18yLA0KPiArCQkuZm10cyA9IHl1dl9vdXRfZ3JvdXAyX2ZtdHMsDQo+ICsJCS5u
dW1fZm10cyA9IEFSUkFZX1NJWkUoeXV2X291dF9ncm91cDJfZm10cyksDQo+ICsJCS5kZWZhdWx0
X2ZtdF9pZHggPSAwLA0KPiArCQkucGFkX29wcyA9ICZzb3VyY2VfcGFkX29wc195dXYsDQo+ICsJ
CS5pb2N0bF9vcHMgPSAmbXRrX2NhbV92NGwyX3ZjYXBfaW9jdGxfb3BzLA0KPiArCQkuZnJtc2l6
ZXMgPSAmKHN0cnVjdCB2NGwyX2ZybXNpemVlbnVtKSB7DQo+ICsJCQkuaW5kZXggPSAwLA0KPiAr
CQkJLnR5cGUgPSBWNEwyX0ZSTVNJWkVfVFlQRV9DT05USU5VT1VTLA0KPiArCQkJLnN0ZXB3aXNl
ID0gew0KPiArCQkJCS5tYXhfd2lkdGggPSBZVVZfR1JPVVAyX01BWF9XSURUSCwNCj4gKwkJCQku
bWluX3dpZHRoID0gSU1HX01JTl9XSURUSCwNCj4gKwkJCQkubWF4X2hlaWdodCA9IFlVVl9HUk9V
UDJfTUFYX0hFSUdIVCwNCj4gKwkJCQkubWluX2hlaWdodCA9IElNR19NSU5fSEVJR0hULA0KPiAr
CQkJCS5zdGVwX2hlaWdodCA9IDEsDQo+ICsJCQkJLnN0ZXBfd2lkdGggPSAxLA0KPiArCQkJfSwN
Cj4gKwkJfSwNCj4gKwl9LA0KPiArfTsNCj4gKw0K

