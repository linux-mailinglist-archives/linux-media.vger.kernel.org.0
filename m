Return-Path: <linux-media+bounces-15109-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF059346C1
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 05:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC34E1C2188F
	for <lists+linux-media@lfdr.de>; Thu, 18 Jul 2024 03:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06C338DCD;
	Thu, 18 Jul 2024 03:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iLvqH7d+";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="HVDWE0t9"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C061FA3;
	Thu, 18 Jul 2024 03:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721273555; cv=fail; b=AuZx6gKyswacP7isc+2VC9LW8NTwITdQ75aIkjY65fOuMnGuLro+Opkys8UAH0Ao/lbJlGXl9afPARgAzrvPjv3hbYo2biIhyW1q+8270PbCs8Jt7R/Zn6xwYKhrCkUhILZvcC8RP1HKbCGfEfiWWeqBG8KLMYwIZ/qUOC7Bcak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721273555; c=relaxed/simple;
	bh=3p8kKbk7w6RfovRWzhoRMX1I44l6KQC9DT5gur2ixdk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RI00PkroxwumVyqVxm5MVWYXkEqo38/bKS2UXgY7v0m2Ew5/eDgzQaPR7jn8ZnMFZzQc+YE5hRYaOAevZ4oPcipKNDduTDH9vDjim4VtJsI0CK8ymhIX1Dg6gN8TQQzIi3K+tg+pnj87DSqAD5OI+w6Rx6rhsnhUzTjbyBqQcio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=iLvqH7d+; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=HVDWE0t9; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 5aee36ee44b611efb5b96b43b535fdb4-20240718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=3p8kKbk7w6RfovRWzhoRMX1I44l6KQC9DT5gur2ixdk=;
	b=iLvqH7d+zvgyRXDO+fQIsTpBI6hEAuFTFWZWDy7uQ7Mn/usbGnZhb78A0VVyEeAbwYwqirDgMks9vEr5YnTbEkKOBzujmOF+kuvY3a2IeiIdaaF/Cb+FkHrs3dXg3ocTkP7/Ny5L4C0pNg4jZNsVNCX47K717E0qKgAEu9XZhOA=;
X-CID-CACHE: Type:Local,Time:202407181126+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.40,REQID:75940fbf-6fcd-4601-b80c-e05f1c5b2e74,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:ba885a6,CLOUDID:d18d7ad5-0d68-4615-a20f-01d7bd41f0bb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5aee36ee44b611efb5b96b43b535fdb4-20240718
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1234384; Thu, 18 Jul 2024 11:32:27 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 18 Jul 2024 11:32:26 +0800
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 18 Jul 2024 11:32:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvG29D/3uNAZlVhx4sGXFiemXdqsjORLKTnK4AMUmp+K5ceiNylY38l5XOk+PTW2tjmMnb+zbTgxtnEwjQb9HizcPXU7Rf00hkqjv3oczD3k5SyAGBEYkgjoMre16gO0Z5sK20yzD4g9wG2Vva6VyuwqCaVfZ9vudRCMtlwJr/EJAV56MTS+sp4/yiGpuvHAn6t14WccjZCemkFtLrzYCoKU8DXZ71VeG05iSfdJGl7FGy98HKST0UVgtcypmT9RPR322rccvrF5oHJG1JZt/1MqF/XkftQXLIXdtxvEs+MvPL0wEIoGRhMS45TiZHsMmNq6SDN6Qnt/46bfDIyrNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3p8kKbk7w6RfovRWzhoRMX1I44l6KQC9DT5gur2ixdk=;
 b=l/o9kmPq0Lzb+P5fL2uEDpl53pZogtNn9oHLm5VC9MAZzF5m3sJe/NFpqhVTVOy3T8Wuffy3qXmz2z2oMMYMnIlVC4uFcst8btwG6HhZ2zIdfjosi/T6z/XKv8BPEdWqDp9lInvEhB1BRp52/NtjdFQ2spS9HoLRi2KhJL/dlt9h/8SXMjCO3fDynVJLntcjoffEwDvyJ9oamtSHdBeCq7emxoQQtEHmgdbazyOgvRXZ2IgIN+/CEt/ohWXi5ZaAsmSQPIdoKD5LoPW7PL5Uv8kTo2u+bGGOFxKX1vkb3x+lr9dGP29lCzBtOlAAr3Em0DOsagu+UplcVk94NU6bCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3p8kKbk7w6RfovRWzhoRMX1I44l6KQC9DT5gur2ixdk=;
 b=HVDWE0t9bfBgS53RLSgKlrpUBJ+JlkKPb47N6z0FVxJP+eAtv2UXG+u8Fl5z4h3iON8mzEAyo2ry4wOiNU56XR35yD3rUZ+B/ZCM9ntAQfTRhRLEQGdPxdvClPh8XWwlUrXbhV9UK5GCP/uaRqFND9YBJRp1OTx3uDEXLqz/Zbs=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by KL1PR03MB7969.apcprd03.prod.outlook.com (2603:1096:820:f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Thu, 18 Jul
 2024 03:32:23 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7762.027; Thu, 18 Jul 2024
 03:32:23 +0000
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
Subject: Re: [PATCH v5 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v5 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Index: AQHazhdkyJtqWsdLFUSbwSAjf5xgNbH76gQA
Date: Thu, 18 Jul 2024 03:32:22 +0000
Message-ID: <b605fc6a489846ac0c13e6022824f093f61fe126.camel@mediatek.com>
References: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
	 <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com>
In-Reply-To: <20240704-add-mtk-isp-3-0-support-v5-4-bfccccc5ec21@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|KL1PR03MB7969:EE_
x-ms-office365-filtering-correlation-id: de1107df-2f6a-4af3-8ee3-08dca6da3c9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MXhVSEJiR0N3Skk2YjNQbWsxMW5JODVRSnJPR1hGeHB4VnJPNGVxVDhSaTh0?=
 =?utf-8?B?Vk9udVZBSmFaY05WNXZVbnYvRTYwdlAxVStPdjBzWVNCcEVLckhhcExpL0gz?=
 =?utf-8?B?NmxWYmlnZWVpT2c1YWF2ODh5MWtwMVB2WmZ4Tjh6TmtoVkJiWjJlL29OaWVw?=
 =?utf-8?B?US85WnhmTkJYNG9RTXdwWnBqbWkrKzVBSHRjMHBvMDhXaHRERmZUM0hsdjNi?=
 =?utf-8?B?YzJlVHJvZzJtV2RKeUgwRU10MmVXWjRpNnlSK1NhdkpWUlFZWlcyVDV3a1kw?=
 =?utf-8?B?ZDc0a1JMUkZ3dzZMU2JyNnQwb3FnSGJ6T0RlUDMxQjVpdkU1Rml0S0gzNzU2?=
 =?utf-8?B?QnMwV01NVWVXTzdCUG1DS0Z0VHlXMkQ0VmsybjBRUXo5QUY1aWJQazJ4ck1S?=
 =?utf-8?B?WEU0eXdtQkVZZWE2RkRwVnNSbWF3UE4wMGlrdHl0dFVHUXVLZWlKZk1vSGsz?=
 =?utf-8?B?OXFRdjJ1ZllRSUdHQ0pWNnh1c1pjUDRGNkh6MkNoZldCOGNRTlZCYk4zMjNh?=
 =?utf-8?B?bmh5cXJ0NW1zOFJlZkRIQ29pa2ZQY0RGanNGV0JXZEllWTVXenNOSUdNZHQw?=
 =?utf-8?B?Y0tNWXdkRGMrRUVZN3dRNFE4N2N0Unl4amtPUkpLbzl2SUVVVTlZa2l5aDRU?=
 =?utf-8?B?TXJKN2dZZXo0MHl0NVkyK242dU1BNEFObzVFYlFCdE50eElUc1FodXhNWkVT?=
 =?utf-8?B?M2pmUUlCVHZGZ1l1ZXJINTQ0aEQ5amh0M3ZGN1ZPcWVNbVBFOHIxOFNMMW5M?=
 =?utf-8?B?dERlL0prNXJZQU5hWEovN3QvR3I2L0NWUUVCU2JtMXZxd21vQXJJSGF0VTNk?=
 =?utf-8?B?Qk5nOFAzWklHdjhMWVhoeExTZjlqNGtIL2FYYUJvVyttcnlWc1gweUp4N3BZ?=
 =?utf-8?B?YjZFSXYzRmJUbUhSYkhJNndjVFZtTEtXVm14Mk95MEdsUXF0bk5pZTNBb2dU?=
 =?utf-8?B?T2pDOVZpWlBocU1JaHJsYzZNNlNSR2VVWVNWcFNBV0dxVDhON3JEU1p1Q3Yy?=
 =?utf-8?B?TXZkUmV6WEdhUU1oYmtBTnA1M2thZ1NwUjVZRVJ0bnJPeHJRZ0RXa29sWFNR?=
 =?utf-8?B?ZGhFdkkzbGxhVjNXalczZ2xkUkwwVUFxL2h4aDNmdlhOb1Q4OTdvSlY3WEx0?=
 =?utf-8?B?ZzFCeGJVSHlaNXJTQTNhV1grTEpmREJidk5iM3dHcGN0L3pCTTZva3plUUdL?=
 =?utf-8?B?Mk9TSWlGTlRPN0h1NTdOZ0FIUjFPeGdmalN1TEd0Q3ZFS2o1RnQrQTdsVmZW?=
 =?utf-8?B?SWRFYTZnVUxjMTRwMHZ1UE5XdnE5L2lTcFRkSHBreXFWaWRheVFTL2VCZDc4?=
 =?utf-8?B?a2hRMXJRYUhhenIrTzdYR2k5REJDNTVmMDU3Z1Q5em9lRTNMN3FjT20wYXZB?=
 =?utf-8?B?OTVkVlVzb3ZMQkNsNTJPTFFyNXU4dkx1NzVya1dHYVlERWVObjUzdEpqR1lD?=
 =?utf-8?B?eVJycEJaMFVsS0JhVlppY2hUQk5wZmRHdnVtbjZ1eWxtRFFRUW02MjVrblVa?=
 =?utf-8?B?UG9Qb0gyQ1dwY1NqODJ4T0c5eVEwdlozT3JjU3l3REV0QlJkR0lvMUIyVEhu?=
 =?utf-8?B?UVdHRWxoUUFIRmloTitqOUxVbzlxWE5INmN4TzlkbTRteGtvdGcrK3lRMGVT?=
 =?utf-8?B?T0lxN3VOT1I5UHM4RTV1WGZrdjM3dnZJcXlQWEwwRUtwN1BIR2xMaExLY1Y0?=
 =?utf-8?B?RmhlMjNiTHJQdjFHcXA0cmZibjlHckdBSTdSVk9uTkNvMEZIUzhhVTJBK3BR?=
 =?utf-8?B?RW5IYnV5MDhTQXMvMXdpRkhET0ZkSlpod2MwMzJyendQL1JGL28zMWhWRFNL?=
 =?utf-8?B?V0FmNUpDNVZkR203VzRaZ0xpd2tVdDdJK1I5RWtGR3JUeC9ldk5OVHpwbDhW?=
 =?utf-8?B?V1M2NDdQZnRZeWJ4WHB4MUJZcmprTGc2ZWkwOGhJWWM3blE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2E3c1JYY0o0cDMzTEVuamtuNDFoM2ppRTd0UmZnVE4zaEhYSXRlZjdNWW1W?=
 =?utf-8?B?SkNBT3laa3V6QUhVYVh0ejhwczhYOG5kOWlBSi9rT0hnUHYyTFdqQm9KaVRp?=
 =?utf-8?B?anNCclpDVDRNWXgrTWJSNjVxdWJTeFJUd2k5akZ6UW4rOU5qN3dHSU85Q3JF?=
 =?utf-8?B?Uk5BSFNsOWdlVEpoZWdpRXJ6MFRFZlR3TnVIYnNYelhDV3ZQNlJoTmZRL1JE?=
 =?utf-8?B?bFEzMDhtLy9xUGljNVhXUSs4b3M3S3NFb1pVZFNvSGd5QmdEOE1NbXl6MURL?=
 =?utf-8?B?eHV6TUpxa3ozQnlXL1Raa2ZDQS9GUmcwYm5rdW9GK0JNUk5hQ29CTEltb25j?=
 =?utf-8?B?NjRydGFIOE9tZnJFeTYxZlQyaGlsSFRwenNVUUpTbTJ2cEhyY0NKdnFtTDA4?=
 =?utf-8?B?MGxBRTg4eExCYmE3bGQ3ZnBJZ2doT05Uc1pLSUFZZHA5OFpmcHdjVXovbXhi?=
 =?utf-8?B?RXhDN1F5WTNSdVZncnNabGNvL2NUOHo5dGtNek1obnpCcVBSeGpMTjA0dWJY?=
 =?utf-8?B?ZW5rMGFXcU43ZnRNa1IzdUhxVVVGRkppcW1CUU52S2pmNDFnWGg5MlBvaHlL?=
 =?utf-8?B?cmwxRG9YUFRyTy9DYmJnR284RmVNcDQvTUhWS3NSeEZEMUF3QXlBSFBONWow?=
 =?utf-8?B?WXJsWEhUbnpQQ0FDaXhOL3c3SVR4ZWVRRmRtNEV0SklISEtUNE13NmMzMWN2?=
 =?utf-8?B?TnhsR1JXU2JqcUlvTDZHdmZKS0lHdWtlZ2pyRzNUUHNEaktJUG02c3VLMUho?=
 =?utf-8?B?YWR2MzF0aWtOd2FZVHl5UWEyWXM1elljN1Nnc09Kd2hhU2RHM3pqdTFzaXRM?=
 =?utf-8?B?UElwUi9INlVocEFWTWRKZmhKLytBT29JNUJmL1BSdm4xTlkza0NFMENTZUhY?=
 =?utf-8?B?MkNQNlFaTTRscGhKL2Z5OEVNUis0WHB1VzhEVGpCMXhodlo4QTFobG9vL0tw?=
 =?utf-8?B?cGxCRlJxN0xJY2QwcWtDTTVNdFAyM0dFeGxYNXFHbGFtZVl4bXNteUE0Uzd1?=
 =?utf-8?B?d2hSMDJ2ckEwWHBzcG5uMDRXT2dvK1crR1p3TkhEeUI2bmFGcHZPcENMYkdi?=
 =?utf-8?B?dzBYRkxHeFhkd3ptazl1aG9zZkNxa0M5bkxDTGU4ZytJTDN2TEdJeDBYbHlS?=
 =?utf-8?B?Y2F5TDFCTkZpWjhRemU4UXEzQkZwRDZQYzRmRGlaVVBsSC9FSG5kRWZDWEpR?=
 =?utf-8?B?QldNbFV6VjJ3UE1LcXhZaE5KWUtKOTJkNE1mdGdMUXphRkw0dHQrVU8xQm1I?=
 =?utf-8?B?QVlKMTVHSW9TdFVndWswdzdWdUdjN0dFSnd0U0FxbW5ubmRsYmZQZ0pyYjAx?=
 =?utf-8?B?SExxQXZ2WW1zTnNmSDllTzYzc2c3SmVDUHpwZHpkWGMxOXlzMXAyeEJJa2k1?=
 =?utf-8?B?MUVLcXdkNUJsQWxSamZHL3cyZ245Z1FPbXNrNHEyZTVEdU9TT2g4U2FVSjBl?=
 =?utf-8?B?c0ordk16NmR0KzRudFhKWjd4aXgxcHpXZHlkS1VZd1FodUJWb28vcGRIMkhG?=
 =?utf-8?B?cThjamxYRnZISGtZekx3T292QXlCalR4NVFkdVppM2lsZmhIMUF6VjBTSlI1?=
 =?utf-8?B?U1hNR3FGL3JZSU1ZVXpvSjV1Ti9aRUdKTWYrZjFUY0p2YlAzdEw5c0dsK2Y5?=
 =?utf-8?B?MDhnbGZaSlVxSnBYaENOQkNTempyaEFNL1dCOGlvUzRrYjJMem5ZODlSd1Az?=
 =?utf-8?B?NE5RY1hrWC9qR0gzSjZDU0RRQ2VGbTIvS1RySHkxdHdnNTNCUnNacmZnQUV6?=
 =?utf-8?B?Y2x2ZnVIci94V1BoRVd5OHkzejFRa0JCaUpWWUpzSi96UzF2WnU5M0xlZFM2?=
 =?utf-8?B?MFdiNmdKbkJwcTF5YUt2eWJGNXg2WXpJSWRrcmthaHdZcS9ZSXhjdlFhRU9p?=
 =?utf-8?B?K3BOcnVadkx6ajZ4T1RwV0hqb1NiNVRLVVpDNk9QTUFXcHQ0ZGM2WVloMEJ4?=
 =?utf-8?B?SzFDZ1N3SlQ5aVhQOTdtcGVMRUgrY0ZrR0NIQVZHSHRnSUdFQ29CNWlubWxn?=
 =?utf-8?B?TE1SU0YvYjlKTm5CMzRrOXdJWjVsV1RyckxhbTB2dEtTcE91OHcrS0hhdTE1?=
 =?utf-8?B?VWdlczV6cUpwTnZXZFVtd0xxWFBSdXBSZWhLd0VvMjJUY0ttamxCaXhzWGZo?=
 =?utf-8?Q?tpSYWVfJWPo0hjEq3HP9pGF2G?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <42405CDE6D22CF45B10BB2F6D351F418@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de1107df-2f6a-4af3-8ee3-08dca6da3c9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2024 03:32:22.9526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i0mDFRNdSeca7fpUbw2s1AVQTPdsiAaz91X7G4mn+dUXk7Tl9C7W1iMtqhkcsxkWi5eUtMe/gQZisWyUqNb7/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7969
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--24.824300-8.000000
X-TMASE-MatchedRID: HXSqh3WYKfsOwH4pD14DsPHkpkyUphL9meN8m2FdGic3xO2R3boBWFbu
	qIY+/skQkABPgKBt/0r/XD0CNJ3fxO4dcT3ZaTocyYHhs0mgDoxyETzgIO4sasaQTVtPXXNM8ha
	W4U9IrFq4+90dmk+ZowOam7Qa4hbBLZbtj42l31HLtNJZxvPj1ov8pidhVYOU33Nl3elSfsr8+W
	FAD4qdrHGrfwDuqgHGJKAbDfejtraGeTbGWdRz1kZakoam9+aefS0Ip2eEHnylPA9G9KhcvbLn+
	0Vm71Lcq7rFUcuGp/G8QIu4z6HhEH7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--24.824300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	6023C27B33409B9E29252861FB372FD46497F4B16BB6C9B89B98E5841EF359AD2000:8

SGksIEp1bGllbjoNCg0KT24gVGh1LCAyMDI0LTA3LTA0IGF0IDE1OjM2ICswMjAwLCBKdWxpZW4g
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
aWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3RhdGljIGludCBtdGtfY2FtX3ZiMl9x
dWV1ZV9zZXR1cChzdHJ1Y3QgdmIyX3F1ZXVlICp2cSwNCj4gKyAgIHVuc2lnbmVkIGludCAqbnVt
X2J1ZmZlcnMsDQo+ICsgICB1bnNpZ25lZCBpbnQgKm51bV9wbGFuZXMsDQo+ICsgICB1bnNpZ25l
ZCBpbnQgc2l6ZXNbXSwNCj4gKyAgIHN0cnVjdCBkZXZpY2UgKmFsbG9jX2RldnNbXSkNCj4gK3sN
Cj4gK3N0cnVjdCBtdGtfY2FtX3ZpZGVvX2RldmljZSAqdmRldiA9DQo+ICt2YjJfcXVldWVfdG9f
bXRrX2NhbV92aWRlb19kZXZpY2UodnEpOw0KPiArdW5zaWduZWQgaW50IG1heF9idWZmZXJfY291
bnQgPSB2ZGV2LT5kZXNjLT5tYXhfYnVmX2NvdW50Ow0KPiArY29uc3Qgc3RydWN0IHY0bDJfcGl4
X2Zvcm1hdF9tcGxhbmUgKmZtdCA9ICZ2ZGV2LT5mb3JtYXQ7DQo+ICt1bnNpZ25lZCBpbnQgc2l6
ZTsNCj4gK3Vuc2lnbmVkIGludCBucF9jb25mOw0KPiArdW5zaWduZWQgaW50IGk7DQo+ICsNCj4g
Ky8qIENoZWNrIHRoZSBsaW1pdGF0aW9uIG9mIGJ1ZmZlciBzaXplICovDQo+ICtpZiAobWF4X2J1
ZmZlcl9jb3VudCkNCg0KbWF4X2J1ZmZlcl9jb3VudCBpcyBhbHdheXMgemVybywgc28gdGhpcyBj
aGVja2luZyBpcyByZWR1bmRhbnQuDQoNClJlZ2FyZHMsDQpDSw0KDQo+ICsqbnVtX2J1ZmZlcnMg
PSBjbGFtcF92YWwoKm51bV9idWZmZXJzLCAxLCBtYXhfYnVmZmVyX2NvdW50KTsNCj4gKw0KPiAr
c2l6ZSA9IGZtdC0+cGxhbmVfZm10WzBdLnNpemVpbWFnZTsNCj4gKy8qIEFkZCBmb3IgcS5jcmVh
dGVfYnVmcyB3aXRoIGZtdC5nX3NpemVpbWFnZShwKSAvIDIgdGVzdCAqLw0KPiArDQo+ICtucF9j
b25mID0gMTsNCj4gKw0KPiAraWYgKCpudW1fcGxhbmVzID09IDApIHsNCj4gKypudW1fcGxhbmVz
ID0gbnBfY29uZjsNCj4gK2ZvciAoaSA9IDA7IGkgPCAqbnVtX3BsYW5lczsgKytpKQ0KPiArc2l6
ZXNbaV0gPSBzaXplOw0KPiArfSBlbHNlIGlmICgqbnVtX3BsYW5lcyAhPSBucF9jb25mIHx8IHNp
emVzWzBdIDwgc2l6ZSkgew0KPiArcmV0dXJuIC1FSU5WQUw7DQo+ICt9DQo+ICsNCj4gK3JldHVy
biAwOw0KPiArfQ0KPiArDQo=

