Return-Path: <linux-media+bounces-15597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E089424BB
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 05:05:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 462811C21227
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 03:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C8217C69;
	Wed, 31 Jul 2024 03:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="EUXgBcE+";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="XEq+6VWN"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6D4175A1;
	Wed, 31 Jul 2024 03:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722395139; cv=fail; b=HuIl0VekxinJYyWxfh/9WfIwQF+Inb/eS83dWzU/aDkdTZXk02pLlFTPuxrfmXSFCflwXbI4x3j4xiyUXDfJnRzX5s/FFSaNwgk8h9JY7INj/9TqyqkS23ZfWxQ1hrP8lYfV/8LIDSzI79xcZz3VVAzf9U8vI2Q+yeuhpKg17+A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722395139; c=relaxed/simple;
	bh=PG5rMn0JH2edJw0viQlO9Cj3zjy9kGgjbG+SmlwV0Aw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IazPfh/yNDoR/H0sOl47WQa0VoR/JKCR8SYIqjechllALwsMpHcXSMtiHnPUoBGnRXW/jh0O56DV0WRfm2NpztF5JpIM+5fhyiWoAAN2hgFXTV3ydJ9CUPd+Ji08pmCxlMADy/q9HtjVVGKHUOaumisT/VlogPuAT8u1wnkT2H0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=EUXgBcE+; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=XEq+6VWN; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: be2b09844ee911efb5b96b43b535fdb4-20240731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=PG5rMn0JH2edJw0viQlO9Cj3zjy9kGgjbG+SmlwV0Aw=;
	b=EUXgBcE+CUu6DVx/EB4rogkAMeR6lxgpFgFWkbmh0FBsjqSlV4MEZweFPmQalVxTOtOb4EfQ6q67rCJafXal8QYHXgBhVPqM43rlvF5wUAu3VkabURlqP2SzVRk5UTrZnQXOZe4Pgp20MTUI6JwPvfXcOb3Fx//ZzVWfMehoZcw=;
X-CID-CACHE: Type:Local,Time:202407311059+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:b35fbc0b-8159-45d7-a029-a0bf988899f2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:a751ea45-a117-4f46-a956-71ffeac67bfa,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: be2b09844ee911efb5b96b43b535fdb4-20240731
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 437251508; Wed, 31 Jul 2024 11:05:29 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 Jul 2024 11:05:28 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 Jul 2024 11:05:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XH3Le6kSk3YNRZW+0uMTWahRzEB0sS47iT8yia7YQjnXfLxEHT+GxCCg0PWrIe92q0NGV0bwdX1v9p+C5CwBSMOpA3RvapcCEuUY2n8E15TJJoS/8XC+50v/RAWz3ytTsAyLuANHjQD5k63N5Btm1dobNN8TlC60RmJfVyqF/MOrqaUCyf8W6B1wSUNquPtzG2Q7fLrfrvRwFeS1yNpVJz/Xfkin/CanGpq+DuU9+C2Vh7vaUjFsoXR18kWDg7Triz6l4d9c0bPZXj8ScZl7XfW9R4/SN7as8aXC9uyCE6M5w8fUq3y88rdW1iaZJqhLJdFKQAQpklqSrqDDf/RfrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PG5rMn0JH2edJw0viQlO9Cj3zjy9kGgjbG+SmlwV0Aw=;
 b=Fi8KUxnr8Q9/OQLuWsNqbwUTMtSA2NwGrnmt9RmQ7D7bTzHXYvsL/3XWQkGBCiWFGjpxtZAjEaPDdv6SVgswduA5D/YWbiuT+TvlXofhNxFwT3Zzc2n28OQlqAYHQ9gEfHU6pWm4ThQ2G3nG9IWpoCiVjmHb1Oe3U3o0hLSr9jW3GoqEMJ2KlpFHx6BLN0amVgwXJQimGS+edwnhDqqk7tTHUg95hYk4I4salCgiHZoeRHEYalwca1pEsL3/QFVGwmLoGfvgy69mjdyjN4uQDE+uU6ORePOJoow3plHdmyAuAB47nqgrx/W4KwejTjPhW/GsjG9yPFUqox9yNSeNdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PG5rMn0JH2edJw0viQlO9Cj3zjy9kGgjbG+SmlwV0Aw=;
 b=XEq+6VWNpJA9A1+dcWeje9K26VENlUUAqO1seCfZs3Gqm2Ng4wnOCgtrBdAdHiDbXgFRAxL57LZjyqt8JG8IKuetOAWnNp7NXKK4VP663Lxhsntk6Q2yYtT/mqFavSTkPjQI8OPuVwQXR4LrLrL5PaMCGFqOzIXI5y2B0PlV0Mg=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7503.apcprd03.prod.outlook.com (2603:1096:820:e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 03:05:25 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 03:05:25 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	"jstephan@baylibre.com" <jstephan@baylibre.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "laurent.pinchart@ideasonboard.com"
	<laurent.pinchart@ideasonboard.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "fsylvestre@baylibre.com"
	<fsylvestre@baylibre.com>, "pnguyen@baylibre.com" <pnguyen@baylibre.com>
Subject: Re: [PATCH v6 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v6 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Index: AQHa4ce8pNnPk1UzTUirk9/L9Gb6lbIQKWiA
Date: Wed, 31 Jul 2024 03:05:25 +0000
Message-ID: <6ee0b990d514c2f210c2a5dc5aff08a794cb4d00.camel@mediatek.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
	 <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
In-Reply-To: <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7503:EE_
x-ms-office365-filtering-correlation-id: 6c61a881-2eb2-4850-81a5-08dcb10d9fcd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R2NxSGVuSERxMi9WSDZNc1ZFOEN3TU1JcjgvWDROQVdyZS9kMVIwUEVmcXdy?=
 =?utf-8?B?cXo5aWhLbUlBZkh1UVZmcm5lZ0hBOGoya2ZNai9PcHVXSWYzaXNvNGI3NDZk?=
 =?utf-8?B?TEVFRHZiNjQrSGlET3A2VklmSFhBclZVcjMwU2RTcldKWmEwcTZVSE5hdkVD?=
 =?utf-8?B?bUlHaEdGYTczOVFmWXN5S29XczBiNmo3SjdQSU9rcDZ4Rzc0cmxaWSt1NHpt?=
 =?utf-8?B?Tktib2FKWEE3eFNBZlVDTVhjWUZTSEwyaFh0YXIrN1RZaDA1WklET1FDVnM1?=
 =?utf-8?B?TlNUUFVxRnJhRkJLdjVROTlqSjdOcXpFbzVtdWtCQUpuTHBMcFRRMHZXMkRL?=
 =?utf-8?B?VzNIbHRXelU4WklwL1ZmRE5Pbno3ZGpFL3RkOHNlL3lRMUthR1pPYUxBU3pJ?=
 =?utf-8?B?bDkvcmNua0xjL3NFaGZQMzF6VXc3bllML1haTEU5NTFIeXl2KzFYeW9xSU4w?=
 =?utf-8?B?ZHVpZ1h3NHNTZ2xXTlpsTVg0b055bEhjeXhKbStOTXkzaFpmSFR6SlhmTkR0?=
 =?utf-8?B?bnpFZERLeVVya3UydkVEbHU2WUlrUFFQem1SYzYxditVMzhKU0pOYkFpNENs?=
 =?utf-8?B?Y1d6Z3grd1ZuUS9KUWtacUhlQVA5YnN4NjREcWFzRG5wenJ0ZEpMRitFS0ZT?=
 =?utf-8?B?d3JoUE9DRDVZbVc2cGUxOVplSTBlYm1GNDNrNldUaWY5bm1zdldqOUp4S00v?=
 =?utf-8?B?TVdhaElNNG95Z21iUmpCck9YZmowanBtcUJtZXpRc0hOeHZYeUFBb3FNTSs3?=
 =?utf-8?B?eXNkaHZGYmUyRGdtei80RWhTL0l1SHBMTk5DM3B0aVdDcFIweEdpNXBzTW9s?=
 =?utf-8?B?cllKRFlreEZBMmFRb2pWdDY5SEV0RUsxcUsxWHYxNzBJeHd2Rm4zYjA0L1ht?=
 =?utf-8?B?aVkzU2FrV1hJdW15L21GTENNNktMTGJOYkQyMWFpSVRHbWlhVnZjRm90Snpl?=
 =?utf-8?B?OHFGQVlYcHphQW5ZQXlVNkdXNGVrWVA3ZWc2cTAzUmpHUGtESlNRNTlBRWE0?=
 =?utf-8?B?NlZQVk5abFVRVjRDZ25PeGgyKzlaT25pdnBiKzJsTTl5Y2tCV1JCaUgyR2Fw?=
 =?utf-8?B?OGxrWTFZVitWZVV3bnpVSWdjc3NySFh6YU40WWNTbmEydmdYL1VQMlRhZFJB?=
 =?utf-8?B?UnZkcE5odWVSTVE3R0pHUXRyZERvQjlrOU5PbTYxdVdGaFZDekIvdTFUUSsv?=
 =?utf-8?B?YXlLcXV0OGFuMEJGcks4VmNjUlZLclpINW15NEx0ckZsbE9LZEVPMzlMRmxv?=
 =?utf-8?B?eGFzQVBMOU5nU05GZFh0SG5GWVhlcUpNcFZzd2h2MFNYdkszUDRib0RkRzEx?=
 =?utf-8?B?SDk5L0xHSG9WMGNSNUY0WlVzMlgwNGJwR1ZvcXl2bzlZZXpJUVlnOHRUbFMz?=
 =?utf-8?B?ZnhhM21JamdWV0k3QnBNSHRFS3o3TXR3UzkvMXV4MytTYUsxbUJCNGw0Y00r?=
 =?utf-8?B?bjVKYjI1U3dzTS8wNFo5Ri9lRnJlaDdReTRDdVljdnl3V0FLVGNyZ0lLVXIr?=
 =?utf-8?B?dnM0UlRrM1VBNUJBVld2V3VsRDRkT2RBdE1YWEhONUFkaTBvaGVSQTNzN2dl?=
 =?utf-8?B?SzUyejIvS1Bwb2N6dUprMW4zQ3IzYTNxRkxzYTF0YVBDNkpRL3ljRHRVUDVX?=
 =?utf-8?B?TTE2L2hQTFcrTURpdUxwTGkrWVFlYndBc3BpUVBRd01LdXkxd1owL3QyK3d1?=
 =?utf-8?B?aytEMzdLMFM0Wm82Zkw5QXBQeGxQcmdPQnBpcnNldGgzd2dFOU90YVMxdExw?=
 =?utf-8?B?NTcxRmxmcUk3TXBuUkxuTUVHRTFCQjd4dVMrcGsrdXY3N2xVK2hsclhES3hq?=
 =?utf-8?B?Z3dqSUtvU0Qzdmsra2Y1SVo2aHgwckROMjJNckc4VWNzZ3FwTmpDZVBrYmdU?=
 =?utf-8?B?aWRBdU1nL0ZzeFd2YWluU3dTTW9jczdkWjMrbFhXMVdwbHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2loOWl0VXczVzdGOTZ6eWsxa090dGxEczJFNGJvNm5NWXVCRkpBcjZObjZu?=
 =?utf-8?B?b1UxalBWQ3plQ3BpV1RGK0FMQUNCU2JyZDB6eFdGMVdhVjEvVFZOckFYbkVj?=
 =?utf-8?B?T1ljaUlTbXVGRDFwbHJ3bXVqdDZRbjI3ampQVVo3OHNTRGFPbTYyY000OUQ4?=
 =?utf-8?B?K3JXZWFIK0VsMGtGZzVEWDd3eUdNRjJJYUNiVm9HMmJia2djYUxxTTFDcHVU?=
 =?utf-8?B?QXNOeGxhUGpRZ0NCZWdNbDBCR0FMUExCdWJaNzRldTlnS2NwYUFPK1NIUGc5?=
 =?utf-8?B?cnIySHpRdWVydXUwWTA2VVRLYzU0ZTcyNmNHMUYzR1F0L3hCd2ZycXZ4ODZy?=
 =?utf-8?B?QUt6N0xpS2pscGc4OWdZN1RwYTZ4OHdRQjZCVjI5bFh0VmZjcU1pZzBzNUkx?=
 =?utf-8?B?ZU01bXlrYWtjUDZtaXY2TnloN3hDUjVESlZjMzR6UTJmWEloT2tPZ3QxemM4?=
 =?utf-8?B?R2FCZENtRjVOeExzN1FIekZNRFlOTGxFYmM1ZG4xZnhUNUUrZDV6QldkV0p3?=
 =?utf-8?B?ZG9wWVpJdVNqenV1bVltT2J3NnlCV0N3aHJJK1E5ZnMvUGo5ZHQ1NlN3UkhK?=
 =?utf-8?B?VWZzb3hUNWRkWm5JNGp5dURuTTQ0emt1NFFoS2FlS1dCWkd2bEpCbFJVUXYw?=
 =?utf-8?B?d3I1RzBOVTFoOHM3RGlSek01L3dsem93TzcySk5PSkxNN1FKNHZlMmhub2FR?=
 =?utf-8?B?S3p2Y0JHdXJiVXc1aDVSNzl2RzdTTXZKczVDYkZuUmRFSVlQQjgvV2dFTFZy?=
 =?utf-8?B?emJNajE5bEZJOGNRK3prQjhSbVBtREFsYWRyUnR1VzNmSXpRWnRWNldKdmNr?=
 =?utf-8?B?a3M0VnpYQnlIbU5ldXlIV2pERDdvTm9hZkJtejk1REJkeXpDN0pBdGZHOFFv?=
 =?utf-8?B?a0NpVVJ5ZysyREZCZWxUVjIydDB3Yys4eFE2V0IrcFZHblBoTkMzTGhyYXhm?=
 =?utf-8?B?Z1V2S0R2ZXEzY1hVVVlNOWtKVTk2U25JZ1dWWFpQTFNVMFlZLzRwUSsrRzhZ?=
 =?utf-8?B?NUI1K1hBYXdyQ3h5dHZoYi9sRi9Rck9hTUo5RVg0c0dlUWkrZU0wNTJCZXlV?=
 =?utf-8?B?b1NSTTlSS3hkZlNRQnBNY1oxamU0QmZzT1JsdGxWQ0VxS1hnSlliaEFyQlRj?=
 =?utf-8?B?WndDR3gyaEdkYzNkWlJ1U09qdlVmd3k0b0hCYnA2OXk4bFIrYjEzam5hTXM2?=
 =?utf-8?B?MDFLTVFCbmd2NTZib2Y0YWN4Nkd0M1E3K1BraDNwb3JNb3BzQzE5OUp1RWZW?=
 =?utf-8?B?NDlnQmlRZnNtZ0FOQ3VaamZYOVpqUCsyaSs0Z0duSDdWU1JST3J0UXQ0WjNt?=
 =?utf-8?B?MVRTRm13dUp2UVgwWDRtbGdnQXBocDdERmRueWw0UXpPUTQwRnZSRmRJZHdx?=
 =?utf-8?B?YzJ4RFloRFVxVFNVL3RiR280MDU4UnRGUllwQmFTOTNKU0cyUzJPcS8wY1NJ?=
 =?utf-8?B?VHZlNzR6endTMlBPYU1NWWZkaVk2a1huMEgwY3FVZE5nclJIUENHT1J4OFFw?=
 =?utf-8?B?YTQwS0daV3Fjck5PaUlCOEtLTEFyMm92SzJnQmZUNlNnM1cwQTdpNWJReVFX?=
 =?utf-8?B?ZndrOVVIbklaZ2tlTDBaQzZHK0h5dzFGNFN3cDVnaC9ZekFrWnFyZmVVOEgz?=
 =?utf-8?B?ZmsrYTlReEY3aWxrbG41VDUzQi9DeUVnaWJzTkVSZXM0U2hZSUlkTVdLUGZY?=
 =?utf-8?B?TTR2RE5UNVNVdnN2TTRrRzNMYlRkaUhOM3BJN0x0VThua0t5b2p0cTRrUXhJ?=
 =?utf-8?B?emZET0tJRGsyaW51OWdwbDFkNEhOOHpTcWlodTNrbFFWYVJZcjhpMDhna1Vk?=
 =?utf-8?B?UnN2dW1WT0RSV3dzY05saE9ndnB2U1ZhMjFlaFFLbGIrbGxrbmEwcmF3MzEw?=
 =?utf-8?B?Q21HWCtzSjVIemFCNkEwSk1XY2NsVCswTTlrbGRQZk9ycE1DV25uRnZlbUFt?=
 =?utf-8?B?TlkvUHpSQTdUMk1UMVVyZTRIZW14MEhzVjBCdE10aVF3T0o0eVZPS09td3ZJ?=
 =?utf-8?B?QVJqcVlpM250Tk12SC9oRHZscjFsSy93RkVRODkrWC8vbGJHSFFsZlFLdDZ0?=
 =?utf-8?B?MHNBdG1VSjRPNHlHRHFJZGtONDhNMEp5UjhIcmduc1RSNWU1MzFneXI4OHBu?=
 =?utf-8?Q?dhdNEVuR5IDybn9t+aM50nFOv?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F273F4D62DE6DE4588EAD923C776B18A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c61a881-2eb2-4850-81a5-08dcb10d9fcd
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 03:05:25.3132
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UGIzRoncXT44Lt3XJ4a6oxabg4Vx09niCJkmM2Ux/V1aDIPTfZvSeXysj8dB5SCKLPgfALGwMPpnwumBuiaozQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7503

SGksIEp1bGllbjoNCg0KT24gTW9uLCAyMDI0LTA3LTI5IGF0IDE2OjQ4ICswMjAwLCBKdWxpZW4g
U3RlcGhhbiB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRo
ZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBGcm9tOiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5
ZW5AYmF5bGlicmUuY29tPg0KPiANCj4gVGhpcyBkcml2ZXIgcHJvdmlkZXMgYSBwYXRoIHRvIGJ5
cGFzcyB0aGUgU29DIElTUCBzbyB0aGF0IGltYWdlIGRhdGENCj4gY29taW5nIGZyb20gdGhlIFNF
TklORiBjYW4gZ28gZGlyZWN0bHkgaW50byBtZW1vcnkgd2l0aG91dCBhbnkgaW1hZ2UNCj4gcHJv
Y2Vzc2luZy4gVGhpcyBhbGxvd3MgdGhlIHVzZSBvZiBhbiBleHRlcm5hbCBJU1AuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBQaGktYmFuZyBOZ3V5ZW4gPHBuZ3V5ZW5AYmF5bGlicmUuY29tPg0KPiBT
aWduZWQtb2ZmLWJ5OiBGbG9yaWFuIFN5bHZlc3RyZSA8ZnN5bHZlc3RyZUBiYXlsaWJyZS5jb20+
DQo+IFtQYXVsIEVsZGVyIGZpeCBpcnEgbG9ja2luZ10NCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBF
bGRlciA8cGF1bC5lbGRlckBpZGVhc29uYm9hcmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IExh
dXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXls
aWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3RhdGljIHZvaWQgbXRrX2NhbV9kZXZf
bG9hZF9kZWZhdWx0X2ZtdChzdHJ1Y3QgbXRrX2NhbV9kZXYgKmNhbSkNCj4gK3sNCj4gK3N0cnVj
dCBtdGtfY2FtX3ZpZGVvX2RldmljZSAqdmRldiA9ICZjYW0tPnZkZXY7DQo+ICtzdHJ1Y3QgdjRs
Ml9waXhfZm9ybWF0X21wbGFuZSAqZm10ID0gJnZkZXYtPmZvcm1hdDsNCj4gKw0KPiArZm10LT5u
dW1fcGxhbmVzID0gMTsNCj4gK2ZtdC0+cGl4ZWxmb3JtYXQgPSB2ZGV2LT5kZXNjLT5mbXRzWzBd
Ow0KPiArZm10LT53aWR0aCA9IHZkZXYtPmRlc2MtPmRlZl93aWR0aDsNCg0KZm10LT53aWR0aCA9
IElNR19NQVhfV0lEVEg7DQoNClNvIHlvdSBjb3VsZCBkcm9wIGRlZl93aWR0aC4NCg0KPiArZm10
LT5oZWlnaHQgPSB2ZGV2LT5kZXNjLT5kZWZfaGVpZ2h0Ow0KDQpmbXQtPmhlaWdodCA9IElNR19N
QVhfSEVJR0hUOw0KDQpTbyB5b3UgY291bGQgZHJvcCBkZWZfaGVpZ2h0Lg0KDQpSZWdhcmRzLA0K
Q0sNCg0KPiArDQo+ICtmbXQtPmNvbG9yc3BhY2UgPSBWNEwyX0NPTE9SU1BBQ0VfU1JHQjsNCj4g
K2ZtdC0+ZmllbGQgPSBWNEwyX0ZJRUxEX05PTkU7DQo+ICtmbXQtPnljYmNyX2VuYyA9IFY0TDJf
WUNCQ1JfRU5DX0RFRkFVTFQ7DQo+ICtmbXQtPnF1YW50aXphdGlvbiA9IFY0TDJfUVVBTlRJWkFU
SU9OX0RFRkFVTFQ7DQo+ICtmbXQtPnhmZXJfZnVuYyA9IFY0TDJfWEZFUl9GVU5DX0RFRkFVTFQ7
DQo+ICsNCj4gK3ZkZXYtPmZtdGluZm8gPSBtdGtfY2FtX2Zvcm1hdF9pbmZvX2J5X2ZvdXJjYyhm
bXQtPnBpeGVsZm9ybWF0KTsNCj4gKw0KPiArY2FsY19icGxfc2l6ZV9waXhfbXAodmRldi0+Zm10
aW5mbywgZm10KTsNCj4gK30NCj4gKw0K

