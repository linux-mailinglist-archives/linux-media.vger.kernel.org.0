Return-Path: <linux-media+bounces-15599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E1A94251D
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 05:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEA6E1C2039A
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 03:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7342218C08;
	Wed, 31 Jul 2024 03:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DfzqMGu3";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="fYz2KGZs"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D99310A3E;
	Wed, 31 Jul 2024 03:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722396957; cv=fail; b=uKPiIkSnL44Dh5Z5ZxnAdQy93YBUWIf89cA+5tOIgw/2+D2/q4ctalSTsfehEgUSQvLuDljTEsxmTwXo1BFELK7JWJSOaB7k2taph9k17UCJ5LJL5wYjH/WLBNVRVzJt1tLf1UBTpDHl5Q8XLn1DnMnsMUKCh7utA9pUauXMZro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722396957; c=relaxed/simple;
	bh=iASTcfhp/ROqrh2ObAT9d2trAXKvtbGVnfdmJCO7cf8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W5ztyim45q+xRECchZ87fKy1NqMPvqObXuSQmr4BTsybx9HaWz0XxYqBzmt0uvuIcaoCtZ5yjwAeEZW5VDiV24R7fsfmQcwU5BFjyCNMlkt9FZZyf0sRkbN1KAXHr+n3yXzOwQ4AuAX13wJ4HrwLwruA/aXPn6KIdWGgz1hkrfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=DfzqMGu3; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=fYz2KGZs; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: f8786f4c4eed11ef87684b57767b52b1-20240731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=iASTcfhp/ROqrh2ObAT9d2trAXKvtbGVnfdmJCO7cf8=;
	b=DfzqMGu37JRIg27Jbb8jH2eWMAc3Z2Hb5KTQMN9mjStmFgmD0DaaWJxVMUG6SrnYb+MTS14FVTVWvGNDk/omgRmijZQt9mZ/zrvXc2k1NeaoLd+T4iecuHJY9GhKv5LlvK45zSRI5Y2lke9xm1yOKe07wWCaYxqrIIrhu0dFwlY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:6069ca13-0341-4ecc-861d-e9e23daf8c78,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:f2cb19d2-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: f8786f4c4eed11ef87684b57767b52b1-20240731
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 967634623; Wed, 31 Jul 2024 11:35:45 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 30 Jul 2024 20:35:46 -0700
Received: from APC01-PSA-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 31 Jul 2024 11:35:45 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAjdHSgkh0gA5o1KiZeB/8TQoXigW5/GNRXQQ6QRqlkv+kKE1YtMplrCgj4Csccm074xajHcwqneN5X0vVF/JuF7I99AbySX4oeejpIxs4ewH0EuBR0LnQu3jPCfCbV6l9kvFSo0kIOmKDyI2xyPrxLrrH7Vlel71Ftpxz3BZwc09nCJwVA/CWY52p0l3HX2cy8zIyJA0kVnUQMRE68mf5E4nzwEOCUjlPjZu6zkEqG/TKP21kwSjcSiCAkB26UmS0zvkY0nU38cEhhBXA3EgHg9eMO+Egl9kTRTmvbvdbWC1WUPmtpanRY4ZS4nHIJbFM3a9dhqR+MkN63fwILRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iASTcfhp/ROqrh2ObAT9d2trAXKvtbGVnfdmJCO7cf8=;
 b=JqOZkCGLHAXDg7Gimn0+W15Ei4/rsAU/pkTUmkTyywCPPcogH+LpfS/C0QPx6nGNw6UPXXdGCFiN2Lh9CdI5EuBQ31qwBXP9tYA+J9wRSZbe+DcmA/2gmiObX3pLMVMyDlZ1k+niK1KT2pOSIqxJH+ShCsHlnbOBGSNAzl0aI2qH3bpTBtz1eRzmZ6tQkwHSk6nVdG1oyOEYhdWEML/djDupJ4owWSsFpsXSgI4ml4/CeLyxHA7Nc8VjbD69+MuEdSewVZZwHyt9cHImN7GXqm0id2afRNevWsKY8YFgMPG7su58W4zjTb7rWChExbS09BIoQwLn1AGqYSOYgIsDCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iASTcfhp/ROqrh2ObAT9d2trAXKvtbGVnfdmJCO7cf8=;
 b=fYz2KGZsLCm1WWXnrkhXRS4G4OuXfm9PdehGnP4TfiqDCsbb024eCyvah56HEDfkn9RPjlsVg+ikqlG1zUYQFpBrkwyUkstovNsLSYdzptaD/a5zNwsPROt02HIKOZ3wqgWBP1m4+6cRFqPC7sMKi5jkT9tVaK3s+qcPs++7jxE=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by JH0PR03MB8256.apcprd03.prod.outlook.com (2603:1096:990:47::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Wed, 31 Jul
 2024 03:35:43 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 03:35:41 +0000
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
Thread-Index: AQHa4ce8pNnPk1UzTUirk9/L9Gb6lbIQMd+A
Date: Wed, 31 Jul 2024 03:35:41 +0000
Message-ID: <0bd19e578cd36f4b4019dd6dc1fd51b53be7774f.camel@mediatek.com>
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
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|JH0PR03MB8256:EE_
x-ms-office365-filtering-correlation-id: e09d8594-4313-46c3-e91b-08dcb111da93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZS8vTUZtb3V3RUpEUmV2ZlorcnQwbEp3VEpuWkszQ3ZrdUNyWkF6RDRYNVRr?=
 =?utf-8?B?cHBocU0wQ0lHR1ZUVTFHOG5ocTJoZUxSbVRmZzdydmRRYm96a2p1RGlaOGNW?=
 =?utf-8?B?cnBPVWFiZzM4cHhPdkRPM2tTMmJVdmY3a2p6UU5Od1JyeDlpTVIyODFnbWhu?=
 =?utf-8?B?d0FOSGx4WFJRNXJpVlYrZ2lQWFYxUGxwYVJ3cnNmNTZYL2I1UnBYL094dkR0?=
 =?utf-8?B?U1p5NUY3WG1PbmdJQ25aSk02UW5IUWlEMFJKSXFCY3ptMFJPUGZCeWFUSHho?=
 =?utf-8?B?U051Q2hRNWFzMzMrWFVLY0xSeDM3VDJ6ZUpaVGZCUGdObGJiUHNvaStOdFZL?=
 =?utf-8?B?SEFsalpmUmxIckg3cWZYdWhqVVl4ZlpnZW9qN3JQWFV3ZEVib3VzZ0MyNk9s?=
 =?utf-8?B?ekVmQ0YrckpxQzU5QU9QbG15S3hEVjduSlNJOHVkdUZWMG10V0FNZWNxeElG?=
 =?utf-8?B?b0FPVEg0MVE5ZnQxaXlnNkE3RDhjQlJHNDV2VTI1ZkRHWXNPZzdpNnhpRU04?=
 =?utf-8?B?WWxsS1lhNUNQSU1NdGcvRkFKK2F4NXVWWDBaNjdjL2tuV1dSTUxUZ09aUHcw?=
 =?utf-8?B?N0JTZkFkZzZwUTI5MWZWZXFUZDNNRnF4UEhQL3BLVU5DTE1EUXMvTkVJUTRy?=
 =?utf-8?B?VCtIUXVDL2ZKd1RiM1BoTndGdCs2Z240bldZd2pxV3RzR2tyc0FrU2NISWpR?=
 =?utf-8?B?MmRjVkxLSXpCdWw1cEVHbE1Jb3ZVZkpINmM3RU9ZTmk2cGNpMHE3YzEwWjRl?=
 =?utf-8?B?TXJqeFNSVEdJNk91L2lpb1VKQ1VjSVovV3RNWkFYQUxGZ0swRVhaRERpc3No?=
 =?utf-8?B?V1VDQXhsVk04SjU2WG1YM1pRVFpYZXV1RTJyYjlxNDlFMDVSQmNQRGZBYW50?=
 =?utf-8?B?SWlySUdHb1greWlXWm5hTm05RXp1Yi8raEovL1Q4RVpUeDJrNXl6eU14aWZJ?=
 =?utf-8?B?cUIvcG1BT29yZTZSQWk5SW1DUWxNcGVSVGlMZlNRZ2lUdndSTURPYmRzME56?=
 =?utf-8?B?bjVmMnBTSkFUTGMxeUQ0YzJ3SGE5M3Zrb01PL1Mvc2dOSFJsN25WUlgxcUNY?=
 =?utf-8?B?ZU1rVVNLQnM2bkR1SzZUNXNhL3JKUjJFcCt2emZod0IxRi84ak9Mdm56RnN0?=
 =?utf-8?B?c1J6eThSRzR6OWcxZjRSdFhlL2g1UXY3QXJ2cXRJeGd2TlowTWFENE1md010?=
 =?utf-8?B?MVlQYk5LUXZHdlgvdUd0ZVJxT2JYOHRpS0FXcXBHWTZJekZOYmNXQ2pwaWsw?=
 =?utf-8?B?SDhFamorbFRhL3QrN2U3b0Z0YzhsYjhiSGw3SVp6dHFmTWoxRmRUYW1iaTRK?=
 =?utf-8?B?eVB3cXpRZ2hRUkNVQzY5cGZYMWdFcnpEZUZCVEtSMy9VY0lOd051dGpYbGs1?=
 =?utf-8?B?WEhGU1dPdW4zY1FDUkY2SmFJSVA4SGl2aUJuYmRESW5RbEE2MkkzcFBFL2xP?=
 =?utf-8?B?ME9KakNNZ1E3TGRHNnN4WExVTy9CNXNDa291dU5BSDFrSlQ4Q2hqR2FNdzhh?=
 =?utf-8?B?OUNxL1pQVnBPR3NXa3grdWdBei9QcVFwN1JuTDA5NEU1SE8rV2ZLMjY4VDVz?=
 =?utf-8?B?RXpkY0pYZ25tVW53TWRYZFFjdnNMbkJkenVySmxVdmRibVBYc21WTlUxbW1I?=
 =?utf-8?B?L1FwMnpNZGNCV1RTODRZU25vc0IxbGZic3FMN0t4bFFqQ3Z6aE1lbWpKUy84?=
 =?utf-8?B?VkRHWnFwQTAzcy94YjQ0K3ZTTkVPbWFHdHVaVit2Slp1TTUzaHJWSXVEYURN?=
 =?utf-8?B?ZHJzdUlSeEVVYkdaZFNqYnVpcDllcGFqckdaYllTMWtyOEpFb241WmxQSW1N?=
 =?utf-8?B?MWFYK1ZwVXBrRis4ekJockRiNEU4cGRvL2h2S3NsejJWRGN6Ukd3MGIweGlZ?=
 =?utf-8?B?VXZJK2k0T3RVcmt5czFaZk4wNFlPTVdYdXBqUkkzdjJLbmc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NVFqKzBVMCtYTWpLUEs3aGMzTWFoU2IzckNZNWlhSnJuZXV5VGxvSnBxMFlu?=
 =?utf-8?B?MENNRTA4UzJvc0lzVHFwVkRsZzFqOVVTTWhoVzdnWW9DaG52bXVQWG5pc0My?=
 =?utf-8?B?QlAzRTRUbEpkV3FyUElhYzJNT044bVJucEp0TlV6bkNFYzcyYVFQb05Icmtm?=
 =?utf-8?B?VXQ2eXVuNEY0dVI2UnhlV0pYSVd0dDVTczdVN05zUHVHOE8yem9WNnV3YXNO?=
 =?utf-8?B?NXpKUy9BL09xZDJMVlJMVUtxZW9yR3pwcDFQZEpCL2JWSXNqcFlkajVQalNI?=
 =?utf-8?B?UDVKV2RzUDQ4VHpzaWRPQk92ZUhpajRld3dadExLbmwySzdUZ1JqUmd5SEtD?=
 =?utf-8?B?bE9MVXVaSEYrcHlrMjJKOVNBaTZiNmVFR0lvQWVCYm94SlZLRW5weW5uUGd5?=
 =?utf-8?B?Rm5ieFZVbmU0RmdMcXRmMVpYa3NVNEtoaEJ0blBPOHN6MnJNNE81SllqdXlL?=
 =?utf-8?B?RVBHN05XekwzNGYvLzZJMENVVVl2U3kzS1lxTUw3ODVrUmVzSEpiYjg5T0to?=
 =?utf-8?B?bDc1c2YzS3pRYUtEYU1TeVRaVWRoa0MrVkg5ZGlsS3Bha1kzMFQyZ1BZOUhq?=
 =?utf-8?B?NHZVU3RhL1ZkdFZtUDg3WFZrV0ZoWEk5emo4ckdad1RtZU85ZlJMTG1kd3hR?=
 =?utf-8?B?MG9qNzNON1Y3Z0x1NFZFb1lnOUZoRzRuOEtncFB0U3dtSXhwUXgvYkgxUFE0?=
 =?utf-8?B?YUxTanE5L2dqakJjcVFKUitKdlJ0SlpzbXNGaEhxMi9RakxEL1dXbVlkRVVm?=
 =?utf-8?B?VFBQMnhFWTVVcm1NS1B5ZDE2dXF2YVRqNUdVQUNqZk1lNU9FNnB1OWpya04x?=
 =?utf-8?B?eWU2dllCOWdoL0VqQ1VBVlA2WnExSkw1QUJOSmN1WHltdUc2S2pUSjhNMmZM?=
 =?utf-8?B?ZDdMK0pJVExRYmNHRURnQ1hlRWhMY1FXZmF3V0w5TjAxMng3NEw1TWlDUjlY?=
 =?utf-8?B?N3U4R1pTMURMQ1NRRzNpcTNhUTA0c2V3YnZGNExCVHMvc05jdWdxaDNWUHZK?=
 =?utf-8?B?eHQ2cmJ4RTNVUGdiK3RrMEhPamd4ZnBHai9NbHhEdGJtTDNhbWQwK2szUFMv?=
 =?utf-8?B?TVIyckFmZHFJeEEzYWpQd3RQZUtuZEVWQWc3aGJEOEM3VEhhZGlPUTZBZ1k4?=
 =?utf-8?B?VTBuMHJWQ0paK01wc1M4cThIQTRiOFFHRXRSdkw1cmFwakNBQmNqbkJ5N3dn?=
 =?utf-8?B?bHlqTm01TlpwcmpJOXdwbWlYZVpPZlhBQVM0QkFWZGJGcWRVSXlRdnVpYjF6?=
 =?utf-8?B?VkxUUC9qTGE3MUFSUXBrc1pEbVlJbGhmNzJUVVA3SkpJNFR2WEsrQkFNYUc4?=
 =?utf-8?B?cTBWNWg4KzNXT1JBSkZSOUhMZTZBdnVYOWJnUkFNRWdDNzBUWjNER3lBRkVO?=
 =?utf-8?B?QzNkeGpGZDRPekVsTFlKblI5NEIyTzZKZUxJemo0L3Y2ZVN0S1ZjSDNFMndR?=
 =?utf-8?B?d203MkxjNldGWWh5bDhsZlNlODZoVHVtZDNxT25XdThiTWpJamU4S3o4bHgy?=
 =?utf-8?B?a0JVVVpWcGN1YnpaU1hXZG8rOXVjeHMyY3pkN0sxbklodGJmVlY0cjAyM2l2?=
 =?utf-8?B?Zk9JTXlvUHpWWWJYenBNNW1IQWJoNzBpVitzTUczV2NYSlVnTFpMVGgwK3lO?=
 =?utf-8?B?RE4vMlFUMHNQUy8wN293cERIZUxhM1ZLblV2aUs3MENiZEtvcHhnZlFacW1K?=
 =?utf-8?B?aFBnKy9paTBJM2t2bEtabnhtN0RzK2pydFc2Qk5LbkduazJUdlk0WURzOFB3?=
 =?utf-8?B?R0JyU1c5ejljNmZ0L2hzcHFVcjQ3MzZZUzVNTnlQck9vbXlneUg4ZjFwcktV?=
 =?utf-8?B?QS9STmZ5NHplWDNPNDBYY2p4Y3VGZE4rcDVPQ1cxUTVWWE1YdHpqUGhiZEJu?=
 =?utf-8?B?azdqdkorT094WVFieWVLdFRtZWFQYm5mNFlCZzR5QmhIQ2VYMk9Pb1llSVkx?=
 =?utf-8?B?M3ZyaXZOT3RmRy9LT1lmTllnVTlDc0phd0Joc2dBRCtpOEN6SFBxWTNtQjhx?=
 =?utf-8?B?WUpSTUpmd0tKeE55VXBSMEZlNHlNWXJ4ZHNnbi9vMXppelRXLzFHZGg2ODJW?=
 =?utf-8?B?VTN1MFJEZ0h1K2IvbVQvWFRPVzZHRm9rS2NJdFllNDhFRE9TR0FCbXQwRXE4?=
 =?utf-8?Q?SY4dKyJrDFwjbltwVtFt/nBR9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C154EA95BD58F48BD6CD2B498BDD06A@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e09d8594-4313-46c3-e91b-08dcb111da93
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 03:35:41.9163
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5MXPqB40/ga0D+85wK7BW41V+bruj+QJBmqbMAdHlcbV8m/I5oufUi6ZSLmXNmOSi5/nmOeS9xBWybPwkMpIbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB8256

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
aWJyZS5jb20+DQo+IC0tLQ0KDQpbc25pcF0NCg0KPiArc3RhdGljIHZvaWQgbXRrX2NhbXN2MzBf
c2V0dXAoc3RydWN0IG10a19jYW1fZGV2ICpjYW1fZGV2LCB1MzIgdywgdTMyIGgsDQo+ICsgICAg
ICB1MzIgYnBsLCB1MzIgbWJ1c19mbXQpDQo+ICt7DQo+ICtjb25zdCBzdHJ1Y3QgbXRrX2NhbV9j
b25mICpjb25mID0gY2FtX2Rldi0+Y29uZjsNCj4gK3UzMiBpbnRfZW4gPSBJTlRfU1RfTUFTS19D
QU1TVjsNCj4gK3UzMiB0bXA7DQo+ICtzdHJ1Y3QgbXRrX2NhbV9zcGFyYW1zIHNwYXJhbXM7DQo+
ICsNCj4gK2ZtdF90b19zcGFyYW1zKG1idXNfZm10LCAmc3BhcmFtcyk7DQo+ICsNCj4gK2lmIChw
bV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KGNhbV9kZXYtPmRldikgPCAwKSB7DQo+ICtkZXZfZXJy
KGNhbV9kZXYtPmRldiwgImZhaWxlZCB0byBnZXQgcG1fcnVudGltZVxuIik7DQo+ICtyZXR1cm47
DQo+ICt9DQo+ICsNCj4gK3dyaXRlbChjb25mLT50Z19zZW5fbW9kZSwgY2FtX2Rldi0+cmVnc190
ZyArIENBTVNWX1RHX1NFTl9NT0RFKTsNCj4gKw0KPiArd3JpdGVsKCh3ICogc3BhcmFtcy53X2Zh
Y3RvcikgPDwgMTZVLCBjYW1fZGV2LT5yZWdzX3RnICsgQ0FNU1ZfVEdfU0VOX0dSQUJfUFhMKTsN
Cj4gKw0KPiArd3JpdGVsKGggPDwgMTZVLCBjYW1fZGV2LT5yZWdzX3RnICsgQ0FNU1ZfVEdfU0VO
X0dSQUJfTElOKTsNCj4gKw0KPiArLyogWVVWX1UyU19ESVM6IGRpc2FibGUgWVVWIHNlbnNvciB1
bnNpZ25lZCB0byBzaWduZWQgKi8NCj4gK3dyaXRlbCgweDEwMDBVLCBjYW1fZGV2LT5yZWdzX3Rn
ICsgQ0FNU1ZfVEdfUEFUSF9DRkcpOw0KPiArDQo+ICsvKiBSZXNldCBjYW0gKi8NCj4gK3dyaXRl
bChDQU1TVl9TV19SU1QsIGNhbV9kZXYtPnJlZ3MgKyBDQU1TVl9TV19DVEwpOw0KPiArd3JpdGVs
KDB4MFUsIGNhbV9kZXYtPnJlZ3MgKyBDQU1TVl9TV19DVEwpOw0KPiArd3JpdGVsKENBTVNWX0lN
R09fUlNUX1RSSUcsIGNhbV9kZXYtPnJlZ3MgKyBDQU1TVl9TV19DVEwpOw0KPiArDQo+ICtyZWFk
bF9wb2xsX3RpbWVvdXRfYXRvbWljKGNhbV9kZXYtPnJlZ3MgKyBDQU1TVl9TV19DVEwsIHRtcCwN
Cj4gKyAgKHRtcCA9PSAoQ0FNU1ZfSU1HT19SU1RfVFJJRyB8IENBTVNWX0lNR09fUlNUX1NUKSks
IDEwLCAyMDApOw0KPiArDQo+ICt3cml0ZWwoMHgwVSwgY2FtX2Rldi0+cmVncyArIENBTVNWX1NX
X0NUTCk7DQo+ICsNCj4gK3dyaXRlbChpbnRfZW4sIGNhbV9kZXYtPnJlZ3MgKyBDQU1TVl9JTlRf
RU4pOw0KDQoNCndyaXRlbChJTlRfU1RfTUFTS19DQU1TViwgY2FtX2Rldi0+cmVncyArIENBTVNW
X0lOVF9FTik7DQoNCmludF9lbiBpcyB1c2VkIG9ubHkgb25jZSwgc28gZHJvcCBpdC4NCg0KPiAr
DQo+ICt3cml0ZWwoY29uZi0+bW9kdWxlX2VuIHwgc3BhcmFtcy5tb2R1bGVfZW5fcGFrLA0KDQpj
b25mLT5tb2R1bGVfZW4gaXMgMHg0MDAwMDAwMSwgYW5kIHNwYXJhbXMubW9kdWxlX2VuX3BhayBj
b3VsZCBiZSAweDQgb3IgMHg4Lg0KVGhlIHJlc3VsdCBpcyBhbHdheXMgemVyby4gV2hhdCBkb2Vz
IHRoaXMgZG8gaGVyZT8NCg0KUmVnYXJkcywNCkNLDQoNCj4gKyAgICAgICBjYW1fZGV2LT5yZWdz
ICsgQ0FNU1ZfTU9EVUxFX0VOKTsNCj4gK3dyaXRlbChzcGFyYW1zLmZtdF9zZWwsIGNhbV9kZXYt
PnJlZ3MgKyBDQU1TVl9GTVRfU0VMKTsNCj4gK3dyaXRlbChzcGFyYW1zLnBhaywgY2FtX2Rldi0+
cmVncyArIENBTVNWX1BBSyk7DQo+ICsNCj4gK3dyaXRlbChicGwgLSAxVSwgY2FtX2Rldi0+cmVn
c19pbWcwICsgQ0FNU1ZfSU1HT19TVl9YU0laRSk7DQo+ICt3cml0ZWwoaCAtIDFVLCBjYW1fZGV2
LT5yZWdzX2ltZzAgKyBDQU1TVl9JTUdPX1NWX1lTSVpFKTsNCj4gKw0KPiArd3JpdGVsKHNwYXJh
bXMuaW1nb19zdHJpZGUgfCBicGwsIGNhbV9kZXYtPnJlZ3NfaW1nMCArIENBTVNWX0lNR09fU1Zf
U1RSSURFKTsNCj4gKw0KPiArd3JpdGVsKGNvbmYtPmltZ29fY29uLCBjYW1fZGV2LT5yZWdzX2lt
ZzAgKyBDQU1TVl9JTUdPX1NWX0NPTik7DQo+ICt3cml0ZWwoY29uZi0+aW1nb19jb24yLCBjYW1f
ZGV2LT5yZWdzX2ltZzAgKyBDQU1TVl9JTUdPX1NWX0NPTjIpOw0KPiArDQo+ICsvKiBDTU9TX0VO
IGZpcnN0ICovDQo+ICt3cml0ZWwocmVhZGwoY2FtX2Rldi0+cmVnc190ZyArIENBTVNWX1RHX1NF
Tl9NT0RFKSB8IENBTVNWX1RHX1NFTl9NT0RFX0NNT1NfRU4sDQo+ICtjYW1fZGV2LT5yZWdzX3Rn
ICsgQ0FNU1ZfVEdfU0VOX01PREUpOw0KPiArDQo+ICsvKiBmaW5hbGx5LCBDQU1TVl9NT0RVTEVf
RU4gOiBJTUdPX0VOICovDQo+ICt3cml0ZWwocmVhZGwoY2FtX2Rldi0+cmVncyArIENBTVNWX01P
RFVMRV9FTikgfCBDQU1TVl9NT0RVTEVfRU5fSU1HT19FTiwNCj4gKyAgICAgY2FtX2Rldi0+cmVn
cyArIENBTVNWX01PRFVMRV9FTik7DQo+ICsNCj4gK3BtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5k
KGNhbV9kZXYtPmRldik7DQo+ICt9DQo+ICsNCj4gDQo=

