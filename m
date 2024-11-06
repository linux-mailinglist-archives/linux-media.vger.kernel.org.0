Return-Path: <linux-media+bounces-20965-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A929BDDA8
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 04:35:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE835B233DA
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 03:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E00C190485;
	Wed,  6 Nov 2024 03:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Mc6kivbJ";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="FZ59A3Mk"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A12C19004E;
	Wed,  6 Nov 2024 03:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730864145; cv=fail; b=kH8Y4BthQR3MZX8ZyyOq8Pxg30aiuRPJOOBObxaIAxbiRjyKgjKEKWUe6tPTJSXX4x69JSVhic4MnmGDNq4M/gtwzW+QVAT0K8/lzW/IYmNUpONLJV8oVz8oQCxASjyVNeNgwefP2GbSCaC745A+yMc4EpuGTJaMFdVTX9BB/BU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730864145; c=relaxed/simple;
	bh=7znJ9V+KAhUKvbXITe+5tKZIGtJHbU+hE6NoF6JPeA4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CYmpoU6Pg08ItCxBEw65Hw9Rkm2I/d0P4UdNV5PUl3ouc8mhSyK/lmHgQIH9wGjjmzSHf2M+SQTCFmwQRS08GwBqTUcVGos8t1QeoDwx5cG8pVy+8/xZ8fxEsQP7y4d6eZ6kqawVR+hFOQEDQ8mqk3MPNNzD9NEHZYUjmylVLVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Mc6kivbJ; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=FZ59A3Mk; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 3008386c9bf011efbd192953cf12861f-20241106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=7znJ9V+KAhUKvbXITe+5tKZIGtJHbU+hE6NoF6JPeA4=;
	b=Mc6kivbJdyc2DDRLGS6C6hfJr+gI/G55sc6/GwOGTfgyX9Rn8TQ7nw2CmxQW87aqa1vxCvvnMqSDIM6TxZw2rfsBgOfLErw++QmNNrqxD28h00zjDDcNjl1sBxqet65Hv508VObJIFeCjCLRp3MAsrmsn0bQCJSpM6uskL397gw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:bba05ac0-b3c6-4ea0-a75c-ef8b5e0d8a3f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0fcdc3,CLOUDID:4780b01b-4f51-4e1d-bb6a-1fd98b6b19d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3008386c9bf011efbd192953cf12861f-20241106
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1530191033; Wed, 06 Nov 2024 11:35:37 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Nov 2024 11:35:36 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Nov 2024 11:35:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tr5L4vnjwwwNFMSkDaQjC9tUkfdFLIOkZtYt9s3qE/kh2048Y0L5jZsHvBd4Z+5bZxSHfzykm2/qe5PIwltSS4GL9gTkUyAZ1t+dk3bkGFyNVWQ8A6Tyq72EB4agoyAxMk6YYVVNuWMRobByl0yocYwQY9h70i5XPc3WgSMlFP0dFkXnH73deU4uLb0k3Nx828Qj02cPj/X1IAzp0Feho9fN2/wpvIewE4HJouyoSCDMg28XZD301luMtQRcmqjKfRgmtvyZDwWFfWQDV68iVwXruXwVBBJAsfZ9BrAodW3dt58UySA/SWkSfdnK5HTepug0BAIFSEoMS4HiAdcPtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7znJ9V+KAhUKvbXITe+5tKZIGtJHbU+hE6NoF6JPeA4=;
 b=FG6NTYZ5BIkAtl4eXyrjFEH+gq2iOnv77YVR8SWHnYv2SEkfryC5L6DMVD3dTpvPxBkL41Jp2qC9EjBtBDU3cOF5pvj+eKrjXc+/87o4r/RSetFt6Bu3a7hbG9PxTjlAAHJcHPScz8rhgq44R3pivySYQhaV3IqLugOx+M32YVIUoXg3d1gcu1S0Wq0gdeSMhrUD5hgpZdf2AACZkSyyVl/7JEiZDZ+9hlqUAiU/CeFCKP/8kMWRwrdMemnJaz0jkKLirbqjRi/aA7MaWgr8iLLcPBX6uuSDdGbsqQnnXKUxBy2agwPVgRx9p7+RPZ9r7v0U9/JqfFHDFU2uaIsm7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7znJ9V+KAhUKvbXITe+5tKZIGtJHbU+hE6NoF6JPeA4=;
 b=FZ59A3MkIF1sUbjExqlRXOLlzQkysZTJ5/ZPgudGjM/S4IhT+/y3ygUPzl03audIeSoOnHJJ5isP1lxz4uBuH91wos9GKOP0JwmRLoD7ojM75DQhF//zdPx4voOGaZ3RXmMjcMUnGBF9bY0g/0iPgmw6Yyct8zfh05CcnWR8O+E=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by TYZPR03MB7962.apcprd03.prod.outlook.com (2603:1096:400:462::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Wed, 6 Nov
 2024 03:35:33 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%7]) with mapi id 15.20.8114.028; Wed, 6 Nov 2024
 03:35:33 +0000
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
Subject: Re: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Topic: [PATCH v1 06/10] media: platform: mediatek: add isp_7x utility
Thread-Index: AQHbGj2JaAd/ufwz/0W0Edv5eKs5YbKpxWIA
Date: Wed, 6 Nov 2024 03:35:33 +0000
Message-ID: <edec7202e9b9e53ef76215e003c4d7cf7280d5f9.camel@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
	 <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
In-Reply-To: <20241009111551.27052-7-Shu-hsiang.Yang@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|TYZPR03MB7962:EE_
x-ms-office365-filtering-correlation-id: 7186e694-2642-4b7a-5cfc-08dcfe141227
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Yys0TUNta05xSmM0UXU3SmgrcmM5MGV6Q1dFd1IxTEpWZ3lCMSt4citUb0xZ?=
 =?utf-8?B?a2tseUNYeVdsQU5LU0hGT3pCWXV1anFncmErSmF4a0tKd3VPL1F4TzVKNTdI?=
 =?utf-8?B?bzdkWnlDU3dNN1pNdEJGeHc1Y1NjQjU3R2w5Q21mVWM1REdIUDBBdURIdTVu?=
 =?utf-8?B?Zm1pZGVqQVdXemI1UWpOSVJON0hLSmJWMTFKaWxqTnI3SVRQRjVWa28xcGhn?=
 =?utf-8?B?aWJxbk5HRVhKcWJBM0lGVDlxaXBSaTdnUEh3TnFxSjBuTEFaeWQ5T0oxTVN6?=
 =?utf-8?B?VDBBcnhWWS9iR2hIam1PTHREQkR4OGtqOE5WU1pEQ1RKSlRBa0VUWG1oVkFM?=
 =?utf-8?B?cjhtclU3YXBiTWtNRVA1THNlNjBVcU9PRzdJc1JGMldNczhpSCs0eENnVVhU?=
 =?utf-8?B?VWsrN1dvMTR1RjFpSHgxSlp4WmU1Y0xGNXBPV2FzMVdPZTNuQWtKenI5dVJM?=
 =?utf-8?B?eU1xRTRuL2Y0elVwMFNBUEoyK01NbVpkemhQR2s3TTVHRVo2MHE0UE5WMUVo?=
 =?utf-8?B?bEU0OWRnb1ZoQklQY01Qakl3NnpqTGdwNC8vV3h1SkU3b0lIa0lablRZOTRC?=
 =?utf-8?B?WHdMOG12enZsZEtQVGpVdmJUamc2bm00V1RjWXRUMGswVU5nWnpqSlBtUHBW?=
 =?utf-8?B?Z1dhbEZpQktKaGx3d3JucTA0OXdFSU1sUEdhc0oxclNVZU5BMmtPZUFDTTlv?=
 =?utf-8?B?UXorVjd6ditOK1dMNkh2WXlxbUYweWdUOCt0UkhENFZmWE9BNWpTSjdyTEUr?=
 =?utf-8?B?MkpRN0t0WHZVMUlFUm9jdWZDZ3FlVzUvZEEvbi9KMUMySkdDby92dzRvdGpw?=
 =?utf-8?B?NzhEcmlFTGc2bTZjRXoxSUpFNlZGbFQwcnpKNVVxL3BXZkFsc3J6T1gva1lw?=
 =?utf-8?B?NUpXc0ZUSFUvOXU1ZGZwLzBLMk94Q1lXNTlmUGluQjRaSDliTk1GMVF3ZEI2?=
 =?utf-8?B?cjFEQW9WMGVORGNYSkYwTmRxN2QxbEthWDIrYlpzN0UvM2xRcGpxbnVYVnkx?=
 =?utf-8?B?SnZTMVNnNUpXQVB4MHdFcGNoRmNEeXcrVEtnWHJpVWh2YVFnSWJybTBQWTRX?=
 =?utf-8?B?V0lSNW53R1ZGUlM5LzhKeCs4cDVPcUZvU25Xaml1N1NGSjE1c0hqZ0dNRVh3?=
 =?utf-8?B?RWRmMFMzQ1BhbDQ4YzY5Y3liNk9WQ2h4cGFmOGRxdy9CcGJYeG93MTU5T2ND?=
 =?utf-8?B?RU9CdkdnMVZOLzM4S1hGaHRRN0plai96NEt4ZW8rR3YvUEkwSG05U01jeFYz?=
 =?utf-8?B?Y3VQSDRYbmJWSis2WXN0cUJLZVB1aWdpQU53eWVIWk9iQ0lBZk1wY0lKajgv?=
 =?utf-8?B?clZDS2tUTnY3M040Z05PSmxaRUVJUUhTY1BpUnNXcVdwdm9LTGk1OWIrdGhw?=
 =?utf-8?B?eVFETkI1d0t6d1NTeHp4ampZWFdxZTJ1ZVN2cHVTTzdTR3lhNlJyKzZpbXZS?=
 =?utf-8?B?ODM3TklmTENJQ2JOR04zRDRnbk4yWlA2NnNqNlcvcjN1WGttRHZLQlpMMFVN?=
 =?utf-8?B?MHNVdWRHR0w2aWJ6akxaSjUvMWlRNlNITWVSaXlSOEtkU3dKWG16aWJvcmdi?=
 =?utf-8?B?SnJ3L3h3V3NkRUYwQ2RycWNYNkhYbzBpb0RXSlNvNE44YzJWbXFyZFgranlw?=
 =?utf-8?B?MEZreWhHYXlsUjNvQnphUHhMd3ltYXdKYXNpMWtIbCtrdjlKV21tMGZLaWVG?=
 =?utf-8?B?azJUR2NuL1hsa1BkZEdWaWtydWdBbXd5MUhEWVVlQXB4b1A5bktZS25RcHp2?=
 =?utf-8?B?aFplaWg1OGM1WjJPTVNHeUZXMzE2NlYzU2FOdndNMThKbjRUS0Z6WkdjaW1I?=
 =?utf-8?Q?ymvkrupa56eWuJhrZDeJvhDtdGAez6RcT5wKw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K3ptL3djanVvSzRkTUNiVmxtVk5UY1ZSSmlSUHRoNWI5Sk1rWHFoaFd6NzZL?=
 =?utf-8?B?K1gzUTl2alpLZnZCMmdnSjUreXdKZmNFbDVoZGtqZzNMRURWcDkrS2loczhp?=
 =?utf-8?B?bjYwajdaOEJEN2NTUUEyRjhYbjRmblNIZ2dMS0ZFdUtMa25sb1JjZHc2Smto?=
 =?utf-8?B?QVBPanM1aGZTL25DUVkyekNqYWhKR3V2Y2tKZFZFN1ZkM3Q2NTd3TTRhMkhI?=
 =?utf-8?B?cTc5S1pUd2hqMDdOUlZIUHlFRG9CWXlQdk5ZMngwNWE1OHNJbmxjVzBwK01J?=
 =?utf-8?B?Nm9LZFNBSTdNNk1NQU5NV2M1d1ZGeVVYV0xmR3l2ZlNveGRxelhLTVRJWUpi?=
 =?utf-8?B?bTEwM3RhdGVBR3B0eityUC9Qem90blhscWUrS2M5ZDg4VWQ5WHFKYTR5MXpN?=
 =?utf-8?B?L2dpNWxIbUVRWGVVdHRXaWhHK0NIdlNZSERBN3pEdUorMm16dmNoaXMxU3c5?=
 =?utf-8?B?Z1dMdkhWb1FyM1NLWHJvOWlsa25rcks0TDBVL1FsajZjU3VDTGNzSjY2QnRE?=
 =?utf-8?B?QS9zQ01CRjFsazhtM2NLQ0dsaU9xdjlxYWpFNS8xdDNLSTI0YzFjVUw4cFlw?=
 =?utf-8?B?YXI1YWUwSVBzMUxGNkRCQXZHWnAzOTVOek5nWVVFZFNnazVyblZvbkhxVVlQ?=
 =?utf-8?B?dDRuRzhKZTBVamlXK252ZkJIcVZyeDFDT1I3VktrK0cyWHQ1Mjd5TUwvM2l2?=
 =?utf-8?B?eDRaRUE2QXJYLzlFZzI1dkd6dk1sclN6RTcrZ3Q1MjVlRFdHd0dKdUkzUWtW?=
 =?utf-8?B?RXdqWTJ2ZWkvaDVzTmtvYTZYL3p5eGR1VWpyTXlQQlpPVW0vZFplTkY4MVE3?=
 =?utf-8?B?ZEx6MkpuOEZYTFJxQ2JKdUJQR2dTN3RZd3V2bVM0WVhjMURydFNxdjkzQys5?=
 =?utf-8?B?enRhOXRycHpQMFhsRFR6bHczOEJYVlZCRVFwZUUrV3BrK3dnYmgrUXUyZFov?=
 =?utf-8?B?Q0xJUlNjVkhETHhGVDN3WVJBR0RzbHQ5QTd0MTN1bFMzYk8xQS9vQ2Q5aFNR?=
 =?utf-8?B?K2U3U1hia0FqL2R4WTByMDN2ZTN0UUo0NlppdmlkNnl5UGVNV25nU216R0ty?=
 =?utf-8?B?b1pKbHc4cUVaRWM2RGFhMHAzTVp0Mk9uSzBPenpvcHltSUtsM1ZTVGI0K3hW?=
 =?utf-8?B?SWg3N0pBdmJyV2ZFcE5ncFVJeG1wZ0NXWTFualJsK25HYWMxUkVDcG9pQ2k3?=
 =?utf-8?B?UFhIRDlsTGhhM0JZNmYxdkpUd3lkc1hjRlNMTTgwWWsyQnZpRjREY1NTSG04?=
 =?utf-8?B?amMreXprYUVHTERvZnpaUVk4MTY3b3F0VnpkMTNyUzd3b0tRMUd3cnAyOFZy?=
 =?utf-8?B?dkFwbnpUWXFOUUhwalhQRTFPVDdUUlVXbjMzc3c2ODc2L2NldWdTRVQzQ2xV?=
 =?utf-8?B?WjZ2aThpbEY0WjE4RFZkTUtORHg0L1JienhWK3NIdFdsNkN5a01zQkQxM2NM?=
 =?utf-8?B?bFYvM1E0NXV1Yk9KbUMyajgyTmx1R1FvNG1pZ0s4RXNLNVZKd2x6Z3laWTBH?=
 =?utf-8?B?NDdkQVRqdmdXNC9IM0l6R3NlaE92M1VkN3pqR1NrdVovSVM3SytaNmZST2FB?=
 =?utf-8?B?aC9hR255SGRKaE1PV1QycE9lbUk3dU8rNDVFTUJuRU5IMnV2OERRby9mL25I?=
 =?utf-8?B?T3VsdHZBKzJjWUlSeEI1ZVZLUDZSK2xYSkhON2w0Q2FmaUtTaWZJR3g0OGd0?=
 =?utf-8?B?cVltOTNNUis3S3poQXB6MEkyeSthTmMvQXkwWGNkY0ZaTlJ6MzVlaHZWdmc0?=
 =?utf-8?B?SmxvMVpXam9CUGtLZkVJNGszbnVrYmt4c3ZDaWRaWS95TUJIS0NkWDVyUzFz?=
 =?utf-8?B?NlppdmFsOElodW0zaGdsd3hkV3kvclQ0aGNWOHZXZy9BNTdpUzJUMStOSFMy?=
 =?utf-8?B?Zm1WZzRQU0xYbWdMK2dGMWJOOE8vMVU0NkVzM09QMml6NU9hVHBJSVViOUY4?=
 =?utf-8?B?WWI2cFlTR3ZHNDJWUHIyYkNrZUxqVExMckZhZW5FZ2M4cXQzWW1Pamx1NjBP?=
 =?utf-8?B?SCtiV21KV09iRVNaTG44ZjRVR2ljY3E1Z1FPc0MvOFBoWUhPNW44U1c5M3pU?=
 =?utf-8?B?enp1Lzd5czJaTVB4bVptWHZtQlNMMXpGQ0pEOU5tTHJzS2psdnltWVlDK2FR?=
 =?utf-8?Q?tYvVkLbbcyux1S98hZGlaTBm/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <718E6AD53769D744B50E3F627D345768@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7186e694-2642-4b7a-5cfc-08dcfe141227
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2024 03:35:33.7114
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fmEQ+Wn04GNh6nja2IxuHCGKBVwEVGQ0zUqHDjXoMZyW9IGi+Xk7oIi9NUyFrJTbLJQoxvpczP+qctV0sfT3tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7962

SGksIFNodS1oc2lhbmc6DQoNCk9uIFdlZCwgMjAyNC0xMC0wOSBhdCAxOToxNSArMDgwMCwgU2h1
LWhzaWFuZyBZYW5nIHdyb3RlOg0KPiBJbnRyb2R1Y2VzIHV0aWxpdHkgZmlsZXMgZm9yIHRoZSBN
ZWRpYVRlayBJU1A3LnggY2Ftc3lzIGRyaXZlci4gVGhlc2UNCj4gdXRpbGl0aWVzIHByb3ZpZGUg
ZXNzZW50aWFsIHBsYXRmb3JtIGRlZmluaXRpb25zLCBkZWJ1Z2dpbmcgdG9vbHMsIGFuZA0KPiBt
YW5hZ2VtZW50IGZ1bmN0aW9ucyB0byBzdXBwb3J0IElTUCBvcGVyYXRpb25zIGFuZCBTQ1AgY29t
bXVuaWNhdGlvbi4NCj4gS2V5IGZ1bmN0aW9uYWxpdGllcyBpbmNsdWRlOg0KPiAxLkhhcmR3YXJl
IHBpcGVsaW5lIGFuZCByZWdpc3RlciBkZWZpbml0aW9ucyBmb3IgbWFuYWdpbmcgaW1hZ2UNCj4g
cHJvY2Vzc2luZyBtb2R1bGVzLg0KPiAyLkRNQSBkZWJ1Z2dpbmcgdXRpbGl0aWVzIGFuZCBidWZm
ZXIgbWFuYWdlbWVudCBmdW5jdGlvbnMuDQo+IDMuRGVmaW5pdGlvbnMgb2Ygc3VwcG9ydGVkIGlt
YWdlIGZvcm1hdHMgZm9yIHByb3BlciBkYXRhIGhhbmRsaW5nLg0KPiA0LklQSSBhbmQgU0NQIGNv
bW11bmljYXRpb24gc3RydWN0dXJlcyBmb3IgbW9kdWxlIHN0YXRlIG1hbmFnZW1lbnQgYW5kDQo+
IGNvbmZpZ3VyaW5nIElTUC4NCj4gNS5NZXRhZGF0YSBwYXJhbWV0ZXJzIGZvciBjb25maWd1cmlu
ZyBpbWFnZSBwcm9jZXNzaW5nLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2h1LWhzaWFuZyBZYW5n
IDxTaHUtaHNpYW5nLllhbmdAbWVkaWF0ZWsuY29tPg0KPiAtLS0NCg0KW3NuaXBdDQoNCj4gKy8q
DQo+ICsgKiBCaXQgRmVpbGQgb2YgTFRNX0dBSU5fTUFQOiBMVE1fVFJBTl9XR1RfVFlQRQ0KPiAr
ICogTVRLX0NBTV9MVE1fR0FJTl9NQVBfTFRNX1RSQU5fV0dUX1RZUEU6IFsxMiwgMTNdDQo+ICsg
KiB0eXBlIG9mIHRyYW4gd2VpZ2h0DQo+ICsgKi8NCj4gKyNkZWZpbmUgTVRLX0NBTV9MVE1fR0FJ
Tl9NQVBfTFRNX1RSQU5fV0dUX1RZUEVfTUFTSyAgIDB4MDAwMDMwMDANCg0KTVRLX0NBTV9MVE1f
R0FJTl9NQVBfTFRNX1RSQU5fV0dUX1RZUEVfTUFTSyBpcyB1c2VsZXNzLCBzbyBkcm9wIGl0Lg0K
DQpSZWdhcmRzLA0KQ0sNCg0KPiArI2RlZmluZSBNVEtfQ0FNX0xUTV9HQUlOX01BUF9MVE1fVFJB
Tl9XR1RfVFlQRV9TSElGVCAgMTINCj4gKw0KDQo=

