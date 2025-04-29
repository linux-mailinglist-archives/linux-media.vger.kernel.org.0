Return-Path: <linux-media+bounces-31267-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12070AA05D9
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 10:35:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72E2B189DCEB
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 08:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D6228B51E;
	Tue, 29 Apr 2025 08:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Uq+y5WTT";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="SuTwiEFI"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319FE175D53;
	Tue, 29 Apr 2025 08:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745915696; cv=fail; b=ET/ceDCPfyqHMt3Ik4IM+k3WLKmdD08wgfOGT3FoGUAsptYMgw3NXyoJdRTdPl/SJW1KEMygo/0c80BZMQ/GQBI4R9QHgn9uwUbSl3D/+I/Tok/iRgz0gmsaNMC2EQ8AUrdR0pXk9NDVsQZbvOpJJL9e3wPbfOrLgXxkkFKTfiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745915696; c=relaxed/simple;
	bh=E1EI7QrHcas5qAwcFhENip21vCr+vKFC2jen3S6ZiQQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ml+YmTm6067dcqy2dokDNoNFnVWSx4nvenMrm4KCOOXbJjnb8e2Vner4LmM58ffKDXGrl/E7qyZTx2oTExP+cTxjczIJbh8gy4z43f4pHPQLqJVn9/Osy6GRU/LH8oxKaHLkVpeR33YQVzz6OlWqfHTDMz3FQoZa0JUp4mY2n2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Uq+y5WTT; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=SuTwiEFI; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: cdfbf3b624d411f09b6713c7f6bde12e-20250429
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=E1EI7QrHcas5qAwcFhENip21vCr+vKFC2jen3S6ZiQQ=;
	b=Uq+y5WTTMlWcG6nYufFmExjDsK2NtBbSYl34HvCqOUF38NEuUpqT5tq+vzyQ4Avn9fjO3yH2fddun2KRNB4dV/bFfB+IDvDL830VkBFtP1GiTD13PVpFGInAubjp56AVtFzn9gFKiBr8FkUxVG4viaTLNilKFy8L0AY/UGJQni0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:e8d46306-591e-442f-bcdd-3439b59d1d28,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:5376fe6f-e08c-41ab-89e8-3ba0a33da853,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: cdfbf3b624d411f09b6713c7f6bde12e-20250429
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 532462118; Tue, 29 Apr 2025 16:34:45 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 29 Apr 2025 16:34:44 +0800
Received: from OS8PR02CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 29 Apr 2025 16:34:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hszHYBemvimvKTJw/CSkVyzDOUjkbxFkwDFnBnrJOXPeLVYjm+1wBy7+o+Jbs956JdcG7Zv0Gwp14Q9dAr1/mybHHL4eCokENCCAlhMINtmkwSFuJHiXX0HpQl0GHpQ9M4q+hUJIE3LwuNDXHiTyZZ/DeIHzDVJE5CY6HVoSMQ5jzKoFT+Wf008CvoenzuIJ553RElCeF/RA+ARsr+KquHH712KvnQhoAEHkeWQbHHlvOWPi97fZtBJ4dm0WtGh89pPd30DYvFEzvak7uYic20ItuePNYGvca7ubBFCSU69MrYJYVqgHM2ATecRd4gmkMbMj2p7LFBXlvYOnRbT7sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1EI7QrHcas5qAwcFhENip21vCr+vKFC2jen3S6ZiQQ=;
 b=fdTyleX83BW0IFc2EPI7X0/OoCtL12FbPI+YdVcCX7OuFk4lY8CRZsasmBfkLzDAfsHtDdJViWWS/bW0TOwVhU3jcCpFRyzT4229n9nNHg238yVRuiE6gB31topEJAHEgkYBKXNqz6FNVqaxLQqAAPnqfLns3VqgvSgLwQb0yGB+8vGf0oXmQ6TpEfbaGyL54ObtNYE3mJ9aX3nC5n6pg6JoSeJcYbk/7GaOhAJyTtMHpMFBzhSCLEJHfLGp/gUHwmNB9VEJRzFvoCjyrpD0DwSxrUg+yiEZBawSDiD0kuQ2H60RXDeJfqq1XVaMmT/0ZRlpNbStsd0cW2ZwDmvgDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1EI7QrHcas5qAwcFhENip21vCr+vKFC2jen3S6ZiQQ=;
 b=SuTwiEFI3WfUmmaY/9l4DcpuXk7cUWreBm+zcxLyEjzDUb9A7lU/CxAAgzShEocX+n7ccBzsLpM6uAVHrlZvqcnf8+LPubFRSLBqliWCLLe//+Tdd+fJMlZco/CIbHdlrY70ADM05EUoGHUgSqil5UAhZRSoUTPiF5WIqLx+a1Y=
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com (2603:1096:301:b9::5)
 by TYZPR03MB7848.apcprd03.prod.outlook.com (2603:1096:400:459::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 08:34:42 +0000
Received: from PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c]) by PUZPR03MB6186.apcprd03.prod.outlook.com
 ([fe80::7b22:91f6:b76e:161c%5]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 08:34:42 +0000
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
Subject: Re: [PATCH v3 00/12] Enable jpeg enc & dec multi-hardwares for MT8196
Thread-Topic: [PATCH v3 00/12] Enable jpeg enc & dec multi-hardwares for
 MT8196
Thread-Index: AQHbtb+JBOkotc7Vbkyf4sKVgb4bPbO4qyuAgAATVYCAAYhHAIAAENOA
Date: Tue, 29 Apr 2025 08:34:42 +0000
Message-ID: <48b2addf6d6368a86b32d1276ded10c4deff0438.camel@mediatek.com>
References: <20250425085328.16929-1-kyrie.wu@mediatek.com>
	 <20250428-inescapable-smiling-oriole-bfbe3e@kuoka>
	 <5735ebabb8b049bd7c8700a433bf5b073dde66ad.camel@mediatek.com>
	 <4557dde5-c0fe-4339-8c4c-291b186ee86f@kernel.org>
In-Reply-To: <4557dde5-c0fe-4339-8c4c-291b186ee86f@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR03MB6186:EE_|TYZPR03MB7848:EE_
x-ms-office365-filtering-correlation-id: d69ebe51-c031-42a9-76dd-08dd86f8b02e
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UmZUcWRGZGoyS0ZXdCs1OERjUEYxL0k4TXQ0YVpsU1lqRDRUaUl5RXVheXNC?=
 =?utf-8?B?dUZ4dkpvZHBKK1VYRllNK1BOSUgvcXJkY1p0OXdlUzJKVmlZTU5yZHlNekR2?=
 =?utf-8?B?YWQwWTZFblJiTG5wSjFrZ2ZzN09MU2djTnp1SHc3Zk9KVnZuVHA4bWUzbXlH?=
 =?utf-8?B?SU5QSXdXUE9IR0pzVjVOeUszYjNxNGNXaGZvc3JZRUlIbWNrKzJFV294L3Iv?=
 =?utf-8?B?elpaTW4xMzBncVdrL1M3Z2p2RFIxczNZclJIOEk0L1crYS9BaXRLMEhGN2Nn?=
 =?utf-8?B?Q05neXpOcG42SkY4NUM2ZnNIZDdFeFk1SVhpdHB5b1hZclpuRk9LelgwTXVE?=
 =?utf-8?B?d1FDbXZhWVhmY2NuZm0rY2NRcW9lRVRtcU8veXc4bkF4cUVYTzhBUUJHbnJn?=
 =?utf-8?B?cnNiNWtTMUs4Wk1hd2w1RnRqTFVrbS9rZzBTMnhjN2toM1JXRmJVRzdheThY?=
 =?utf-8?B?K1NkbVFmMEVUUzVPcGhteElqQUFwNUtweXQ1YTh4Q1hOMkk2bVNPUmEwMG8x?=
 =?utf-8?B?d0xmcDZRT2UyWFdHb1Zqd3RNWjI0S2dacmpDZCtUdnFWQnkvdjN3UDFSbnh5?=
 =?utf-8?B?NmN1eGlOQ2VGdVVwWFFlWGYzS0sybTJpSGs0MkNiMWpkOWJ1SHZFV29jbjhE?=
 =?utf-8?B?azA0QnA0TStLempWOEgwdlZQcUo3aEVGWndWek1GN1h0SG9mdjRCN3A1cXZO?=
 =?utf-8?B?Sm9MQ0t0aXl2all6SGdyRVh1cmYrd01JZy9DNktWSmdWQmlXU1NSMEgxeXpZ?=
 =?utf-8?B?dWRDaWxqZWRGY1NqYXFISjJaakhIekZ6Wm5SUlRRRHNhazh6dTI5bkV1ckdD?=
 =?utf-8?B?Y2prcUEyY1h4UW10cDdGMUFldzFPS3c5a0IvVHV5dHF1Nkw2WW0xWURvSy8r?=
 =?utf-8?B?TmxjZk5iWmFiSjQ3MkNNeDJrTjA2RFo3WU1OV29xb3B4blFYNW5Kc0FFb3Fo?=
 =?utf-8?B?QjlEanY0NVQzcUlRTGJ4ZzVXNHlKMjUxZi9OMDVlOVB3UUxKZjF4bDI4aHpo?=
 =?utf-8?B?ME9xVUpPWUx0SWErTUhIZ1hyZVkyZXhnM3dtMUdnT21uMXRxSXVlQnQzaURV?=
 =?utf-8?B?aHd4OXUrOTRCZ1FxZHRXdFVXMTdVbXNnK1ljWjBrYlEzclluZkUrRytQcnNW?=
 =?utf-8?B?YWxVUi9RSmNjQnIxdVJBWDFzVUJqa0JyOUZxemxNc21OYk40U2l5UjRXcUVP?=
 =?utf-8?B?SDJaRVkzcll3UXZ6UklnZ1BGazJnV2E4cHdmV0hCSGJUcXY0NUpvejdtTjBa?=
 =?utf-8?B?eTRuRFlUbVlTQkRaMlJRZUMxbWJrcEF3MzdVTmdqaVZLenNqZ0p2ZnI1OFlv?=
 =?utf-8?B?N09EU3FvTk5jMnN1SWRpM0VrYkhwVDlSY3dvODhlbEFvNnFiemJ1ckJrWnBS?=
 =?utf-8?B?RDU5aHdsTHpDK3prMVF1dG9vdnRWdjl4QnpxWnFDMUIxMmxRWVcxbE5ET1F6?=
 =?utf-8?B?dTBOc0NrTEdzWE5SYnhHQzZSM20wWHpFbE5lVlVaMStJSHNUUEduQ1gyV0cy?=
 =?utf-8?B?RW1pRHNFNTNwRDNOK3M2Qi9UQS92cGJudnI4a0FZYmlUTXAvdnl0d241ckQr?=
 =?utf-8?B?TWdDRXlhclpNREEvWlhPTXY5bW4xZzQrNEwrMXQ4K1hNRTVwR1d4cEVBUHBm?=
 =?utf-8?B?bXFnZHphTzA4YzJTN1dTSWhjQnB2TllBb1gwYXlyNlBucnFBV3VyM1RWQWZl?=
 =?utf-8?B?bG5VV1p0WkNCV2tiUXEyWXRDaGNhT0dRbEc2VzArL3NVVzRDVmdQV0RZeEJk?=
 =?utf-8?B?UThmQzlMdXVKeTNyOW10d2hidEkyTTZWZnp6YTZZOFZzR3NVV0RqbHBaNVZl?=
 =?utf-8?B?K1owTFFURjZheDdCWTZoSTFNaDJxZksrQjNjVTVPMDZUTXl3WjZTQ0RZN1Fx?=
 =?utf-8?B?d0g4OVdTUUpIQVluS3ZMRm91NTdBUEY5MVErY3A4bmk4djdTMnNjbXM0YjJO?=
 =?utf-8?B?azlYRFhveXk4VTVFWXFHTnoxeGN0ZnpCZXBIMElGNWZKNkNScEpyZWNhaXhh?=
 =?utf-8?Q?JCPIrhVhM5V0gEzaAfFaCVgQPN6tsA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR03MB6186.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTJaR3pxUGRKczZpNUlKL09TM3FnMnA5aVZNVEhYVjlRbnhBUDFOR2RpbHpU?=
 =?utf-8?B?RkwwZkk4ZG1SbkRBTndCK0JmZmJSaDIyZ3MxN1JLTlB5ajZLdVhDNXpXS3l6?=
 =?utf-8?B?aEdRVlhYNUxUZE5KK0U0NmNCcHI4NXo2MitqclMvWitGT25EenVRS1Jpa2NJ?=
 =?utf-8?B?TW9wTVUxUzdKajduZ0lwdWJITnlibmFhR0tmNFpPUlVvU1F6ekY1NnRyMXEw?=
 =?utf-8?B?Um0yK1dLQUF6eE82eE5ONkh0QlNHbU5HcGFwMVMyVWRHOXlITnFWSnZqN0Fv?=
 =?utf-8?B?ZDdKR2pQOFJOaGdCVHhFM2tYRGQ0dWpmSCtnNTUvVWhJU0pSSEtpdk83cnh5?=
 =?utf-8?B?bXlFWkFqMDhsYmduYi93TzIxU1YwaEZabmpGTUJPNHd2MXFkMmJvNGRUVllE?=
 =?utf-8?B?YVJ2b2pXbkxINmlyUDdGQkZ0bFlQWUVQZlYvL1ArTXJEUUdrSVkrZ3piUERo?=
 =?utf-8?B?eWJWWjFKRGt3dU9zemJybUNDSlBRb3RrL2xJbGpYSEM3Z0xGUE9FOHp1UFA2?=
 =?utf-8?B?NFFjb1BHMUVBRDRGOGpjWnJjV2JLUC9ha3pmMFVtemYxMmRWM3cwM3lZeVF0?=
 =?utf-8?B?eWxpMUlMVDhxU0dYREMvV1RiTlFnWWtidUw3Qjl1aTZaSFRWWUdtbmk2SE8v?=
 =?utf-8?B?cDlrT1lxOWxuRWRhQWtTVVZjaTVseGMvVlpMWTZ2SXhnSGpVN1d0N0RTMEhx?=
 =?utf-8?B?UlYrOWlBVnZ3aTJ2R2ZCMjNZQmJXcXVmUko0dEJpcTB5QTRneXNaNkt3ZVNU?=
 =?utf-8?B?N3hUWjV2SUtkbUNueS9QV0QwZVlGa0lpYTFKZlNkNWhTSTkvNExxZ1JaYnk4?=
 =?utf-8?B?NjhuQ0p0bFVVNmZ5TmF4bjdRRU5GM0t2NktnbjR1bVJVL1BzYUdzTHc3NmJn?=
 =?utf-8?B?a1dMcGhQakhpOGs5NDRZa3BZL1IzZHNOYjRTWktsckhmc0ZzVWZOcUE1ZEE3?=
 =?utf-8?B?dDh2STFyWjVmZzFWQzRDK0hzVzZodHhOTS9ja2ZNcm5yaFZHcUplaDBSemJp?=
 =?utf-8?B?OUhCTEQrdE1DWmlPblRzZVBWOFN5bWNWdkhPQy9xdmUzbHdUNGNNQmxtM1Bx?=
 =?utf-8?B?VmRwOG1yQm41TnNFLzhoem41bEpOMHZwTG9tdGJzWU1uTmhQOHdDVWFvcDZD?=
 =?utf-8?B?eUZXUVpwQTJ3TFlDQTdXcjhSV0V1cVE1aDhsOGhmZlFWd0lBZGU0YzZycDVS?=
 =?utf-8?B?enBDMjlMdjdXUEtvRHN0V05oZ2VtOFprRFI0Y3kveXVyOHR5YUQxdmw3a21R?=
 =?utf-8?B?TUFMbit4UGMzeWhwTXJVY0ZEQlYzY3VZSCtMRUt6aUE0am9CczNMcThzT0xK?=
 =?utf-8?B?Tk95aHJ5NWlUM3dnaUNnS3pRdWFlM0JNYW9wNUxJTzg0MUF3amdWRWNxRWZV?=
 =?utf-8?B?eGxLc2c5c0NJdVVFTE01UGtoYkhvd2l4TlNIM2hHZWdPazJEemRTSXBHT0dP?=
 =?utf-8?B?YWZsNnJBZm9wOHBESHRpUGcwUmZOVE84MDl5NkNjOEtKNWc0VXZ0NDJGalQw?=
 =?utf-8?B?Nlg2NHVCRi8rM0o5UmtpWHVMV0ZHdnhSc0hNLzNXL1dNZUJwQVg4SlB2Rm5s?=
 =?utf-8?B?TXJOTWpwKzUzS2Z5b3pKSm1adE9LQVdQN216Q0M4NjBuNlpQL3ZYVTljMW9O?=
 =?utf-8?B?VXorVnI0aUdhVWc2ejdvbS8zQ1ZxQm1jU1I5bHJzUjRiTkZpc0RGV1pYb09l?=
 =?utf-8?B?ZHZHbUlSUUJZTlBjZnRMNHJNcVMwcWJjSkxCVEx0amhVRkJ6WllNMjVLenU2?=
 =?utf-8?B?cWp2YkpMM2l4QlpaZnp1UkwxRnZiMzBVZzc3cVFuZmZPVkRMZjVlWG5GNEZD?=
 =?utf-8?B?OGlLSnkxdTMrTDBEK2RVMkhyeTh5VGozUlFxeU84MW9wam9ZT0VXTTRITVo3?=
 =?utf-8?B?OGU5T2w5ZlQvRkVVV0R3QXNMY2F1Q3IxWlR3d2tQK3lYeW10NkVaUERpcCtZ?=
 =?utf-8?B?ZFk0SEs5TE9RZDVpaTk4cFZYMWZjMXNGRFQrVnhNd2NGVWpaZEpLbVJSKzlP?=
 =?utf-8?B?NUY1SkZpNmgycGgremdGTFJrTGk4RGNpQUt2bGpQNGhrRjJpdWRsbG51NjVB?=
 =?utf-8?B?dTBVa1RIWmlGWE1CQTMySTRad01BeTZOQzdpcUREVVI4bHpOcndyYVcwZUlM?=
 =?utf-8?Q?+o8VN0qgHvYbp396SH1qV94np?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <11840E148EF37342A231A8A4F4D52C6D@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR03MB6186.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69ebe51-c031-42a9-76dd-08dd86f8b02e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2025 08:34:42.2189
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QqBttmzTUU5gTHYMQU4hA+ZZkE6rtXRPVEhHx65GlPnxx/y+WsJVlSWwUNL0ilN9an9qDW0dIyRV6DQctiEsAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7848

T24gVHVlLCAyMDI1LTA0LTI5IGF0IDA5OjM0ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3Bl
biBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRo
ZSBjb250ZW50Lg0KPiANCj4gDQo+IE9uIDI4LzA0LzIwMjUgMTA6MTAsIEt5cmllIFd1ICjlkLTm
mZcpIHdyb3RlOg0KPiA+IE9uIE1vbiwgMjAyNS0wNC0yOCBhdCAwOTowMSArMDIwMCwgS3J6eXN6
dG9mIEtvemxvd3NraSB3cm90ZToNCj4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzDQo+ID4gPiB1bnRpbA0KPiA+ID4geW91
IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4NCj4gPiA+IA0KPiA+ID4g
DQo+ID4gPiBPbiBGcmksIEFwciAyNSwgMjAyNSBhdCAwNDo1MzoxNlBNIEdNVCwgS3lyaWUgV3Ug
d3JvdGU6DQo+ID4gPiA+IFRoaXMgc2VyaWVzIGFkZHMgc3VwcG9ydCBmb3IgbXQ4MTk2IG11bHRp
LWhhcmR3YXJlcyBqcGVnIGVuYyAmDQo+ID4gPiA+IGRlYywNCj4gPiA+ID4gYnkgZmlyc3QgYWRk
aW5nIG10ODE5NiBqcGVnZGVjIGFuZCBqcGVnZW5jIGNvbXBhdGlibGUgdG8NCj4gPiA+ID4gaW5z
dGFsbA0KPiA+ID4gPiBrZXJuZWwgZHJpdmVyLiBBZGQgc21tdSBzZXR0aW5nIHRvIHN1cHBvcnQg
c21tdSBhbmQgaW9tbXUgYXQNCj4gPiA+ID4gdGhlDQo+ID4gPiA+IHNhbWUgdGltZS4NCj4gPiA+
ID4gU2Vjb25kbHkgcmVmYWN0b3IgYnVmZmVyIGFuZCBjbG9jayBzZXR0aW5nIHRvIHN1cHBvcnQg
bXVsdGktaHcNCj4gPiA+ID4ganBlZw0KPiA+ID4gPiB3b3JraW5nLg0KPiA+ID4gPiBMYXN0bHks
IGZpeCBzb21lIGJ1Z3MsIGluY2x1ZGluZyByZXNvbHV0aW9uIGNoYW5nZSBoYW5kbGVpbmcsDQo+
ID4gPiA+IHN0b3ANCj4gPiA+ID4gc3RyZWFtaW5nIHN3IGZsb3cgYW5kIG90aGVycy4NCj4gPiA+
ID4gDQo+ID4gPiA+IFRoaXMgc2VyaWVzIGhhcyBiZWVuIHRlc3RlZCB3aXRoIE1UODE5NiB0YXN0
IHRlc3QuDQo+ID4gPiA+IEVuY29kaW5nIGFuZCBkZWNvZGluZyB3b3JrZWQgZm9yIHRoaXMgY2hp
cC4NCj4gPiA+ID4gDQo+ID4gPiA+IFBhdGNoZXMgMS0zIEFkZHMganBlZyBlbmNvZGVyIGFuZCBk
ZWNvZGVyIGNvbXBhdGlibGUuDQo+ID4gPiA+IFBhdGNoZXMgNCBhZGQganBlZyBzbW11IHNpZCBz
ZXR0aW5nLg0KPiA+ID4gPiBQYXRjaGVzIDUgZml4IGpwZWcgaHcgY291bnQgc2V0dGluZyB0byBz
dXBwb3J0IGRpZmZlcmVudCBjaGlwcy4NCj4gPiA+ID4gUGF0Y2hlcyA2IHJlZmFjdG9yIGpwZWcg
YnVmZmVyIHBheWxvYWQgc2V0dGluZyB0byBoYW5kbGUgYnVmZmVyDQo+ID4gPiA+IHNpemUgYnVn
IHdoaWxlIHJlc29sdXRpb24gY2hhbmdlZC4NCj4gPiA+ID4gUGF0Y2hlcyA3IHJlY29uc3RydWN0
IGpwZWcgZHN0IGJ1ZmZlciBsYXlvdXQuDQo+ID4gPiA+IFBhdGNoZXMgOCBmaXggbXVsdGktY29y
ZSBzdG9wIHN0cmVhbWluZyBmbG93DQo+ID4gPiA+IFBhdGNoZXMgOSByZWZhY3RvciBtdWx0aS1j
b3JlIGNsayBzdXNwZW5kL3Jlc3VtZSBzZXR0aW5nDQo+ID4gPiA+IFBhdGNoZXMgMTAgZml4IGRl
Y29kaW5nIGJ1ZmZlciBudW1iZXIgc2V0dGluZyB0aW1pbmcgaXNzdWUNCj4gPiA+ID4gUGF0Y2hl
cyAxMSByZWZhY3RvciBkZWNvZGluZyByZXNvbHV0aW9uIGNoYW5nZSBvcGVyYXRpb24NCj4gPiA+
ID4gUGF0Y2hlcyAxMiBmaXggcmVtb3ZlIGJ1ZmZlciBvcGVyYXRpb24NCj4gPiA+ID4gDQo+ID4g
PiA+IC0tLQ0KPiA+ID4gPiBUaGlzIHNlcmllcyBwYXRjaGVzIGRlcGVuZGVudCBvbjoNCj4gPiA+
ID4gWzFdDQo+ID4gPiA+IA0KPiA+IA0KPiA+IA0KaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9f
X2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRj
aC8yMDI1MDQyNDA5MDgyNC41MzA5LTEtamlhbmh1YS5saW5AbWVkaWF0ZWsuY29tL19fOyEhQ1RS
TktBOXdNZzBBUmJ3IWhEanp5ZGYyYmx5SWhkQWtZc19OYnFwRWFhV1R1b2xMYmFITER3OGhMZzRC
Sjg3cjdlUHpLa0VULXVEdzI0VTZZWEFxbWJTeEl0ZW0xUSQNCj4gPiA+ID4gDQo+ID4gPiA+IENo
YW5nZXMgY29tcGFyZWQgd2l0aCB2MjoNCj4gPiA+ID4gLS1yZWZhY3RvciBzbW11IHNpZCBzZXR0
aW5nIGZ1bmN0aW9uIGludGVyZmFjZQ0KPiA+ID4gPiAtLVNvbWUgbW9kaWZpY2F0aW9ucyBmb3Ig
cGF0Y2ggdjIncyByZXZpZXcgY29tbWVudHMuDQo+ID4gPiANCj4gPiA+IFRoaXMgaXMgdmVyeSB2
YWd1ZS4gV2hhdCBleGFjdGx5IGNoYW5nZWQuDQo+ID4gDQo+ID4gRGVhciBLcnp5c3p0b2YsDQo+
ID4gDQo+ID4gU29ycnkgZm9yIHRoZSBzaG9ydGx5IGRlc2NyaXB0aW9ucy4gVGhlIG1haW4gY2hh
bmdpbmcgaW4gVjMgaXMNCj4gPiBmaXhlZA0KPiA+IGR0LWJpbmRpbmdzIGNvbW1lbnRzIGJ5IHlv
dS4NCj4gDQo+IA0KPiBXaGF0IGNoYW5nZWQ/IFdoYXQgY29tbWVudHM/IEFnYWluIHdheSB0b28g
dmFndWUuDQo+IA0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KRGVhciBLcnp5
c3p0b2YsDQoNClNvcnJ5IHRoYXQgdGhlIHF1ZXN0aW9uIHdhcyBub3QgbWFkZSBjbGVhciBpbiBt
eSByZXBseS4NCllvdXIgY29tbWVudHMgYXJlIHRoYXQgeW91IHdhbnQgbWUgdG8gY2hhbmdlIHRo
ZSBlbWFpbCBuYW1lIGluIHRoZSBuZXh0DQp2ZXJzaW9uIGFuZCBhZGQgYSBwcmVmaXggdG8gdGhl
IHN1YmplY3Qgb2YgdGhlIHBhdGNoIHRoYXQgbW9kaWZpZXMgdGhlDQp5YW1sIGZpbGUuIEluIHRo
ZSBWMyB2ZXJzaW9uLCBJIG1hZGUgc29tZSBjaGFuZ2VzIGJhc2VkIG9uIHlvdXINCmNvbW1lbnRz
LCBidXQgdGhleSBkaWQgbm90IG1lZXQgeW91ciByZXF1aXJlbWVudHMuDQpJIGFwb2xvZ2l6ZSB0
byB5b3UgYWdhaW4gYW5kIGhvcGUgdGhhdCB0aGlzIHJlcGx5IGNhbiBhbnN3ZXIgeW91cg0KcXVl
c3Rpb24uDQoNClRoYW5rcy4NCg0KUmVnYXJkcywNCkt5cmllLg0K

