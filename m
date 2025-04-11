Return-Path: <linux-media+bounces-29996-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB30AA851B6
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 04:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB9558A3551
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 02:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F92A27C145;
	Fri, 11 Apr 2025 02:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ACaG4Y58";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="LKUYQkwe"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B76242AAF;
	Fri, 11 Apr 2025 02:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744339701; cv=fail; b=OIL1QHewGpNFCwSMOfM11n3Ym7ikkSuS5S0Tc3qymobb7eY3AfSOeJJqzEmoYiPnQ8gW4xlmosc5YqWZVpWMNKcR6hwEHFvYANKLEHcWBiG7wUnVKDxFsjsuHK/9EksJBHuy/NXrnwd0d21PnsvWp26sDr+PsrCztJ8H0IgJ3Go=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744339701; c=relaxed/simple;
	bh=K42tsvt5+pxPWb9+YUltmoOgZljI4KC/H/U6rOdbq3c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=D79xyb02DxwIY0dZdqJNY5Mrkoo0cvuooPKZAQiSiCasFtNOK5Yt/c/FgKZnb8CtxIcmKaACmibtPARBpJjMWRXmJQ7V5NCzvy4e3COQYpHxeKrcT9cDAZqcP6hGITHCIs13tT1YmIQUQA0t1B3giqt8XggCWIAcq8lJdpu9lJM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=ACaG4Y58; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=LKUYQkwe; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 64cde434167f11f0aae1fd9735fae912-20250411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=K42tsvt5+pxPWb9+YUltmoOgZljI4KC/H/U6rOdbq3c=;
	b=ACaG4Y58975NG8naPn6JmLFlpBABtA+RoEVNXLsftVkc9oWsMDbyx2UiqLFxF94YvR4q9OKcdcum5X8EPGhZGGhhTijfy5jCXc01B9A85S0hdFS78t04bexmURgKir+qeYkbKhxmEuZBPmhmFh1TVWO3CRocTCb6/NS4AUH+jj4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:eef66f6b-af18-4b2c-808d-fe7f18921b3a,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:c5a970c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: 64cde434167f11f0aae1fd9735fae912-20250411
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1382902766; Fri, 11 Apr 2025 10:48:05 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 11 Apr 2025 10:48:04 +0800
Received: from HK3PR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 11 Apr 2025 10:48:04 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QR3PjofhVonL6DffbV1ciwJhMlrvx2rS7nablvUWr3mqBxH58PgZP3ddnzpAmcyIG+7mlqQnVKtTJnEJySnLOxgMaal4qrKJbXVOcIMiJynurODstrwuoQ3ySxcOftFx9pWTFNG2ZkAv3GBvQTfP2AB1I+kZ2YwowzjN81sebP0jXdEkWkhM3jnfXvUrlCw8rgvx9eWrYNFOch3Mf3L/BYhohjHPvlUhneI50Lg1Ekuxa45M0vxREh8F8SyBwhyxgRJuDoi6v8TB4U9E11g5Oiz7kpMHvu5Irmrx7LZ0DoQ5flW4yPnWmvtnJ13CUXmAUM+ShBOFLrbo/k4VF7XC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K42tsvt5+pxPWb9+YUltmoOgZljI4KC/H/U6rOdbq3c=;
 b=WBb2z4H6YKvb5PhkwMXTKJ3Tie/76Psml6C8G3+3sCugItEqn/Os8HSQkGMHhMUWFFCvfrnH5BWeU9/FpmLp2PhhdqZ3/i+drxp4gAFo9Zn1wojSaZI6VeoK2+BTb2lkD4q8+/2MX7jge8zxLPdD76eHph3JgtIB1mmKLufli1cdsKVtOoCHNioDAd/3/heqs4sAjmx1igV6AM4nCIuVS8xbtbDoGE3PO9JuhxW19HcgntqVdA0bKz5GpQR++zdFH7VLHP5u4zbZyeTOhXkg3K4lARlUll9QX5Q2vXPRrfIoyrjV7npXPKR7Qv8HEvLcyxrXV+w+CM5iDR8tdXCMfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K42tsvt5+pxPWb9+YUltmoOgZljI4KC/H/U6rOdbq3c=;
 b=LKUYQkwePYzNhk4km1EEwvU4OZn3wWn1ooej2oAxt+Xtnu+2lVrDblDnORJrzGMa78LKNIQcRiTc3U3+UfuOgYHuuq8wai/FigrgOkosuasPEhJxPIYf1XVo2rQi9GQgSkXbdfyhGUnaSmeUuSqQp7gsrDpVzdz5GzJgyu0bOeU=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by TYZPR03MB6621.apcprd03.prod.outlook.com (2603:1096:400:1fe::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Fri, 11 Apr
 2025 02:48:02 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%5]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 02:48:01 +0000
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
Subject: Re: [PATCH v2 02/12] dt-bindings: mediatek: Add mediatek,
 mt8196-jpgenc compatible
Thread-Topic: [PATCH v2 02/12] dt-bindings: mediatek: Add mediatek,
 mt8196-jpgenc compatible
Thread-Index: AQHbqeIP+01Xdz/BbkS2VaGyOTV29LOccyAAgAFRYgA=
Date: Fri, 11 Apr 2025 02:48:01 +0000
Message-ID: <82eec9802028d0e44530b4c7ddcaa5362f2434b9.camel@mediatek.com>
References: <20250410063006.5313-1-kyrie.wu@mediatek.com>
	 <20250410063006.5313-3-kyrie.wu@mediatek.com>
	 <20250410-new-zippy-elephant-54bbcb@shite>
In-Reply-To: <20250410-new-zippy-elephant-54bbcb@shite>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|TYZPR03MB6621:EE_
x-ms-office365-filtering-correlation-id: bd31cedb-8f83-4d29-8df1-08dd78a346a6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q0VndEpGdlg2bEl1SlpoUkZrTVQ1U0FNKzZwdGRVOWdzUjZ2QVNGQ3hyTVQ4?=
 =?utf-8?B?ZGhkemF3YlFtUFdPRHJwcXRMRk5KSUpqcHVNSlBLTGpXbzlUaFNxQ0pPUmY1?=
 =?utf-8?B?V25OdnBURXFFd1JDNGR2b21hOWNHNzJkci9BUzJpc1VzZnhuVXBBdzJVckFW?=
 =?utf-8?B?ZUkvSkdrVmZsZ0RvSkFlKzMzazBwR0tLQ1ArWXFSRWJXOWl6eHVrUTZjUCts?=
 =?utf-8?B?RHNRSFdYQndWSm9lRUxiQm5TUCt1MG9mbXNSeWpjeVdteUljUWFRTTRpSlhZ?=
 =?utf-8?B?WXpuOUlVcWVIY3RtbVowNkFqSmNOS0RZdzVoWkpxd2c4bjNVRVoyYWNWTkho?=
 =?utf-8?B?TW50SVJvOVF4N0wwNER6WHIycEc1WWZ5OHZLREdDK3JWcjJLTEpocUdrWEZr?=
 =?utf-8?B?Qmp3ZzJud1VIbUIxOHdHSUNoLzkxWUZCWk4vUEtQY0VkY1QrdWRUK21QM3hV?=
 =?utf-8?B?R3FJZnlLL3JxVDVUUDl1SVJobEVOaGVXRDM3TWFQTDBVL25IeU9ZWjl2ZG5t?=
 =?utf-8?B?aUFyY2FwbUN4TVZrSHQzUjZhYXFJWXRLZTBXbDF1UmdLNGdTa3JDVnhFNlFy?=
 =?utf-8?B?WXNPR05YY0dFQUlJaEgxMElMSlplZEIrWjBtZG80T3BSem5ONGlOdkhSRGta?=
 =?utf-8?B?Z25ONzJaK01EU245cXJ0d1JWenRoSno1TjV0NHRPdFpyN1A4ZGxQUXVxMTVJ?=
 =?utf-8?B?S3NsZUFCRlltL3ZDdURtaVJ1VGJneVB6MVI2ZWlrYmI0Lzd5VkNweWY0dk5y?=
 =?utf-8?B?Q1oxTWpjY1JLaWVXK2NvR1RUUE15Z3M1VUk2NlpLMTU0SVRFSjdabVFxbWhU?=
 =?utf-8?B?SGNuRUEyWG1UZjZEWVVaMk5jOTNBVjE2anAyQzdXS3AxdmM3Z2VZTUlkeldR?=
 =?utf-8?B?TUR5QWFGalYvSFNHaTkwSXlVdkJUTGk4UTZUQjljOUdOd1ZvdXFya2tSS29O?=
 =?utf-8?B?UVJuT2F2NnZJSVZhaGJ5RVJmS1IwZW55b2Y1VE0xdVo4dlYrMFo0QXpQSERt?=
 =?utf-8?B?bFVQcDZIcnVKSWN0YlhUMms2RmdTbHNpOVFXUnJ2VkhveFZVWFpaU0t5T3Qy?=
 =?utf-8?B?Nk5iM21tSjEvQ09BWC9DaFByR3hDY2d2Z09yMDU2MFQvM3RzV2VHNmlHelNP?=
 =?utf-8?B?QlJSMGZud1YyM2FrSXFmVG9uUTRNd3VnUG92MVcyZDlxbnV6ZnNIWG4xZVFN?=
 =?utf-8?B?eFJsakVDdVZmbjBCdDBrdkdHaUx0cUppSGJaNXNEckR2dXFma29XQityY1Nl?=
 =?utf-8?B?eENoQnlxRDhDdVdwMmhiQ0VHcEFQMG1tSEhUUGxHN3YyMEFObSt1UHJMa2x1?=
 =?utf-8?B?d0dxVmVQby80UmNNSFU1eHB2b0ZuaUlmd2xVa3BEKzlYZ1F4OFV3VWwrSDla?=
 =?utf-8?B?dHhyTjRDZDg2aWNvSC9QTEN3S3I1THg4b1dESjR0VTdEV2NNSXM0MFY0a3dM?=
 =?utf-8?B?YW55dGxYZTIwWWRqUUU0YzlaWjN5Y2NRYit2MytvbXREU3BPT1FwUmdPNjV2?=
 =?utf-8?B?ekF3MWhEcDZtMTllQktzYUhkUlZBV0N0ZkZML0RzL1psTkhDMS81Y3BQbmwz?=
 =?utf-8?B?NXoyOEV5Qm96Q2VuSzdLdUhnKzdxVXFoWWdwWUc0ckkxSENraVZRRHE0bU90?=
 =?utf-8?B?VXQ0OWJ3Vm8wRndseUU2WEx0bUJJK2R6ZVY1cStHK3pvR2NUcTYvNktkbDRX?=
 =?utf-8?B?RFZCUUJLY1ZOMHBWSG5HWlJ6U1oweFJ1U1NidllKbFRBSk5mRk15amxrNmFw?=
 =?utf-8?B?TWtmY0xjM1F3MzlFaW1uZHN6c2lzdGZzQjhTYmwxOFU4UGpsYWxwcjZXN05a?=
 =?utf-8?B?eXBOb3FsaXNJTVg4VzBzZFNDcDFnOE9SdU8xMTAwM2lkNHBTbWtGbVhod0w2?=
 =?utf-8?B?VTJXZC9LaHJYL1Rad3ZYV0N0NTZkUnNJSzhqaXZPT3NKM3I1bWdobnU4VU5X?=
 =?utf-8?Q?aRz5wzJ4nkY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SElYUmFNWkh0ak00OGxad2lDL296NW9LQzNjUml3RzUzeCtJNFN1NUN3NnUz?=
 =?utf-8?B?cHlsVTY3dTdqbC9LdmNtdFl4SlN0cHRRcGZzSWZkWWRLWmN4dVN5NmxVcFVp?=
 =?utf-8?B?cVFpZXQvY2haKy9SYXZGMzVGU3RJREJEOU1wdy9PV25lYmZrbjM0NkZVYzVC?=
 =?utf-8?B?TjFGclNYWmwvVHo1Vzh5RTE1dE5YaFh6SmF0VmxQaEdPdE5vMVprNmlXRTFC?=
 =?utf-8?B?YXNGQWxFdUVvSDNHcHM4cWRyR2V6V3FZemNRWDEvUG0wQ2NCeUFKQmRkbG8v?=
 =?utf-8?B?S2kxZDNOckIvRCtlQUY4cy9NSjNmQ3VmZHF3Ulk1eUJaTit3ODFqVUdZTHFl?=
 =?utf-8?B?R0JWZEI5NytXYWtnZzVqMHBaNDIyeG5Nazd6YUZjUFpCYnhoU3lzSGhQWnVy?=
 =?utf-8?B?dk5WRUI1TDRja2U3NmsvMU9aWlBSLzczMi9DOTdYSkJZd3NwNC9idDFCa1ZV?=
 =?utf-8?B?Rk90ZCttQ1h5Sy9SNGFDMElIb1MyZW5iNFpZSzBpaTFtTFQ2eGw5S2cxa1dT?=
 =?utf-8?B?UGtXSU05bnR1aStlREw0eitOL3JOWWhKTmg3VlUzMlZYbmpYZVg4My9FS01Z?=
 =?utf-8?B?b3RIcGw4Z0ZhRVBGUjRZaS9SRkR4ZmxadjIrYmVTVURlSHdXdk9Bem1JVGFj?=
 =?utf-8?B?V3haeXVYL1NxeDlXaUd6cTd1czVlYjB6VURra0l6RFZhYm01SzVmVDFlWnBT?=
 =?utf-8?B?S2x2cGtWdGo1dldXV1F4K1RWb0dUa3NuZnRJdFN5enFXK2RlaXRiQXhyLzVX?=
 =?utf-8?B?NDlIbEVmc1ZvSHZoYUx5VFRnbU5pQmFIU3ZEOUZnd3ZlZTB2Z2RGSEpHMVBK?=
 =?utf-8?B?K2NKVVhLdUZoUjliQzBIeXFPS3p5bXFKT004SGRub1BYbG42dU5VQ1JWV3RL?=
 =?utf-8?B?a2ZxS2s2TXZFNzlSKzFFQklwNDhnaDZzNHE0VmpCdC9aSks3bmJvZUpyS01n?=
 =?utf-8?B?dCthZm05d21FWXRHaUM2NmZqK0kxQlRTSy8vNHJrTmxtUVRxK1FybDV5Q3VN?=
 =?utf-8?B?d1BkR1QzZEtEWk4vY0R4WlZwbW5TM3ZsZjFEQzJFM3ppbVNnNnhSc0xGUElv?=
 =?utf-8?B?U2NXTGpDOVhPUnB0VGdGdnlhbStZbGhqTnJaUnMvS2NSWnpTUjFjWVEzalFD?=
 =?utf-8?B?ZHAvc0Z6c1RFSW9QSmJWeHhQWHA3ZWoranp0RDlBRHB0Z3ZGeWhTMHJYKzMy?=
 =?utf-8?B?OHoxeEZXRkdsSFFrZXk5MUQ1Z1ZyZVY2TlpVRVhSQmltV1RBZ1FBWE1iY2Vv?=
 =?utf-8?B?RUtPQWdkcFlibjhXNTMyYmU5WjdFbDVOeHRTUm5qTUFTSjVsSHFKWkZCU3JZ?=
 =?utf-8?B?UEw4VjNpOW9LT0hNTzM0NkpGK0d0SFkyY0hZRnJ6RFFrMk0vY1hmazU2UjBF?=
 =?utf-8?B?WGhTeFltMnA0VXd4bldzRzQwa2Z0dmRGYkNCcWpONk5uSUtvN0s2QmhuZVYr?=
 =?utf-8?B?QVI5T2kwZkwvT1AxcnBVeFZnME5ubVluczEyMnRhb0N5YjBGWmF2ZDZZSjhC?=
 =?utf-8?B?Mi9sdnhjQTJDVUcxV3ZZNmY3QzlWZmZkR0pwRGtTQ1FENVFTTllMOXA2cUx0?=
 =?utf-8?B?dGhpOE5DbG12VVplem05d2JMUVJ2R0NOdWNCcmdDanFXazk5ZndWT3dUTldI?=
 =?utf-8?B?MFZVd2RpaE45WlFxb2U1MzhuQ2lBSklBL2ZvUVdjNjhJWkJoU3YyM3A4bEZk?=
 =?utf-8?B?N3VGZlgzU3lSY1cwSEk0TlJiNFZlVzJjQmswNS85SHJvbHA4bWxlemxqYnNN?=
 =?utf-8?B?bWdXK21STEw2M1I2SSs4Y2ZmZkJyeEE4U1gveWpQSC83Nk1oWXdUMzZjV25M?=
 =?utf-8?B?VnpaMXV0WTlRNlpJOElINUNJRDc1a251WVNiMnprNTl3ZGsxdzBsczlVbWhD?=
 =?utf-8?B?NkVyVUxNZVBxa3FJcVJUOHVrZGhFd0RXZHRUbTU0VWRpQXMwbCs4UWxPaE1F?=
 =?utf-8?B?MlI5cG44c0RlSXFVQUlMcHI5VHN1d2Fpc3B0ekZyYnVkemV2U0dFc3h2aDdu?=
 =?utf-8?B?RUJWUUFkMXNXMDBIaXA4UWduNWhvWWJteHVRU2NqYWQ0MWh4OVp1OVNWYmhi?=
 =?utf-8?B?L3FQbTJQYldYelRkcW1aSzlKRlNoQlJtaWI2dFFOOWNGMEFPTVR1UVpmOFpT?=
 =?utf-8?Q?wUrNtv4CE4tKnmC8pcT52h3gp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0997D42D4A970244B163558ADBFA86E5@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd31cedb-8f83-4d29-8df1-08dd78a346a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 02:48:01.6215
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MOI9/HXlbpPRtTkSqIEeby6u3p7oHPu67ggeuNLyjaWDEpnyY5+PPqDQFkCHniZVWs+aiLzY0JyAB0/ZUmOU2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB6621

T24gVGh1LCAyMDI1LTA0LTEwIGF0IDA4OjQwICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIFRodSwgQXByIDEwLCAyMDI1IGF0IDAyOjI5OjU1UE0g
R01ULCBreXJpZS53dSB3cm90ZToNCj4gPiBBZGQgbWVkaWF0ZWssbXQ4MTk2LWpwZ2VuYyBjb21w
YXRpYmxlIHRvIGJpbmRpbmcgZG9jdW1lbnQuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieToga3ly
aWUud3UgPGt5cmllLnd1QG1lZGlhdGVrLmNvbT4NCj4gDQo+IFNhbWUgY29tbWVudHMuDQo+IA0K
PiBBbHNvOiBtaXNzaW5nIG1lZGlhIHByZWZpeCBpbiBzdWJqZWN0Lg0KPiANCj4gUGxlYXNlIHVz
ZSBzdWJqZWN0IHByZWZpeGVzIG1hdGNoaW5nIHRoZSBzdWJzeXN0ZW0uIFlvdSBjYW4gZ2V0IHRo
ZW0NCj4gZm9yDQo+IGV4YW1wbGUgd2l0aCAnZ2l0IGxvZyAtLW9uZWxpbmUgLS0gRElSRUNUT1JZ
X09SX0ZJTEUnIG9uIHRoZQ0KPiBkaXJlY3RvcnkNCj4geW91ciBwYXRjaCBpcyB0b3VjaGluZy4g
Rm9yIGJpbmRpbmdzLCB0aGUgcHJlZmVycmVkIHN1YmplY3RzIGFyZQ0KPiBleHBsYWluZWQgaGVy
ZToNCj4gDQpodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly93d3cua2VybmVsLm9y
Zy9kb2MvaHRtbC9sYXRlc3QvZGV2aWNldHJlZS9iaW5kaW5ncy9zdWJtaXR0aW5nLXBhdGNoZXMu
aHRtbCppLWZvci1wYXRjaC1zdWJtaXR0ZXJzX187SXchIUNUUk5LQTl3TWcwQVJidyFsWW5HTGNP
QlFJaDl5UVV5TWN0ZUt4dmNLUXYyX2VTYzR1ZHhrRERXWGlrVHlOOFZjWHlZRGdHdUstOFVaV3hL
RTVQbWczRDVsdnBsY3ckDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCkRl
YXIgS3J6eXN6dG9mLA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudC4gSSB3aWxsIGNoYW5nZSBz
dWJqZWN0IGluIHRoZSBuZXh0IHZlcnNpb24gDQpsaWtlIGZvbGxvd2luZzoNCg0KZHQtYmluZGlu
Z3M6IG1lZGlhOiBtZWRpYXRlayxqcGVnOiB4eHgNCg0KUmVnYXJkcywNCkt5cmllDQo=

