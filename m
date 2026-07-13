Return-Path: <linux-media+bounces-67421-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BhnQNilcVGpelAMAu9opvQ
	(envelope-from <linux-media+bounces-67421-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 05:31:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34796746EFD
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 05:31:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mediatek.com header.s=dk header.b=AdbfdH6G;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.s=selector2-mediateko365-onmicrosoft-com header.b=NFsj4ERf;
	dmarc=pass (policy=quarantine) header.from=mediatek.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67421-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67421-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C35EE302E902
	for <lists+linux-media@lfdr.de>; Mon, 13 Jul 2026 03:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485CD31B130;
	Mon, 13 Jul 2026 03:30:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26F4317173;
	Mon, 13 Jul 2026 03:30:14 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783913418; cv=fail; b=DzvtCwDTDDcCXvselrlNBhLKIhk123NpdJwFUlxjdVH5wm+BwX7S54zD+rxPg6y4ycZHw6TqlMu3Nu6J8Hi/EirPxLqSfrleY6dEDHxjyIUIKld8w0nloNxeb5Vhxj2qedjijf/6FjGPNeeqRkcmZ2DPF0IJkDE/gfZ4TZODFrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783913418; c=relaxed/simple;
	bh=QqXHsJcPx98/80q9pL8AHlN4DLohS594nOACSaHroUw=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QoyBvO+0Rslxs6EHJPpug+WV0RJYg/BEGKsQgJw50mqmDwqxC+qznb1bbCBtTt9FiFsYVSRLuPthLLUgym2xm2Rt+PibEz9JWKQ+13/dXKzZZBbb8/Y5svUsQP74iBmcccLo2yQfFLUDkXNhYPFgm/V4jdU1s1OG1VAzzUy25vA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=AdbfdH6G; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=NFsj4ERf; arc=fail smtp.client-ip=210.61.82.184
X-UUID: 26b706307e6b11f18dc8c9802ae25ab1-20260713
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=QqXHsJcPx98/80q9pL8AHlN4DLohS594nOACSaHroUw=;
	b=AdbfdH6GeY84Fpql9/8Hu7NDOgis47Jxad1G8MJqfjgfNG6BxYRv9AUUg+TunZ4qZBd+C4RSBSSMBYIMhGPhoMeW1eDCqbiEwTpQiR51ViZbovQmatzcZUWoISlStxg6lnFtAFiNvfVUBF4+0hpg6T7LWA2ZxuR6jOI/z04m5Ag=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.17,REQID:c8a91a02-b61b-4c20-bb56-62aa68fbc3ab,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d497b38,CLOUDID:5a0cc352-b1eb-4115-b37a-3847baafd2e2,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
	1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 26b706307e6b11f18dc8c9802ae25ab1-20260713
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 665740730; Mon, 13 Jul 2026 11:30:10 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 13 Jul 2026 11:30:08 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 13 Jul 2026 11:30:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/hiYP9sKY4nGSWmy2DlS7hrMwcM+93VWSWJ8eAZMXYC6gH7B3KwF/omDItPLc0y6URNR+yaWQoP+p1zcF0/WyYUcY+d6hYzyI+3b/vEwjEICFfAwwD6XpkmRwqnOJFlfvAN51W673Dnh4+aj1nQs4wahDf48OkahDGVrq2ACYZ69BJ6BEMg24DUlhM+Eg0K9IDoj7BByS9RAqY0HYBllCIg7gCQxx4GfWmot05b+ttA/rWfPKmxvdm6zBFR8AJvIa0hH+oEFt7P0F605QN3cExiUd2yr33NkCBcFaO0PCDfH4YVNtz++Ne3zG6A5D6H9O+mZWGGCOoXch2aBW4jBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqXHsJcPx98/80q9pL8AHlN4DLohS594nOACSaHroUw=;
 b=fEKJ6yD9V5h/qBNKQcRj8+cuB5NHv/COOgIgLQvqL380C4NiSSOILL4uEtUhcIpB7Y6Qe9P72+7yaBo7Qshf1R0mLmhV8DJAoxj68qCJGFNIbs7DN/ujWBVrVyoJxN3+M+Vjp/zPbnkWWwXw5MRgKLbot29pzKZuznwts7d7Nvngt+Lqmq9gYaOVQYcp88QHcvoNYQrkVRGrnmzCT1djpbHirVrHsfH83jvsoXTMESGapVNB9E5ilw+UAzEsEyw7Z1cshHoUZ22pOrsnDF6oEY/8rqFKM6BIp78mEGmtiH2KtSZp1hdIVNOKVYwatZNk5rAPRFEj0IEl3U9ajz5U9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqXHsJcPx98/80q9pL8AHlN4DLohS594nOACSaHroUw=;
 b=NFsj4ERfrdFYQo8Bx2GikNqvAAWAzyPsYUFKCmvmimbb3xQW5HOTHGGFxFxY8PtG96MnJ3pnTIDnmEAphpUtw49/2noc4aNYjGSgOQnRo3rrrjUPWGNUjTwfuX0P0ElEnq54FpKzHy75foz8P5qV9p1IB+7cGV1qrjQIW6JD3Ro=
Received: from SI2PR03MB6195.apcprd03.prod.outlook.com (2603:1096:4:14f::13)
 by SEZPR03MB7916.apcprd03.prod.outlook.com (2603:1096:101:18b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 03:30:05 +0000
Received: from SI2PR03MB6195.apcprd03.prod.outlook.com
 ([fe80::ea95:8d21:d28a:6b2c]) by SI2PR03MB6195.apcprd03.prod.outlook.com
 ([fe80::ea95:8d21:d28a:6b2c%6]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 03:30:05 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"robh@kernel.org" <robh@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "hverkuil-cisco@xs4all.nl"
	<hverkuil-cisco@xs4all.nl>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v15 01/12] media: mediatek: jpeg: fix jpeg cores' amounts
 setting
Thread-Topic: [PATCH v15 01/12] media: mediatek: jpeg: fix jpeg cores' amounts
 setting
Thread-Index: AQHdCfQqCQU/mTVgekickxRFo/sLj7Zo6KcAgAHy8AA=
Date: Mon, 13 Jul 2026 03:30:05 +0000
Message-ID: <05928d76a6cb103e1f4cafc38fd4ad4013b87c05.camel@mediatek.com>
References: <20260702072614.10373-1-kyrie.wu@mediatek.com>
	 <20260702072614.10373-2-kyrie.wu@mediatek.com>
	 <29b98aee357ea1ff49939c47eaca3cb4a01c8d72.camel@collabora.com>
In-Reply-To: <29b98aee357ea1ff49939c47eaca3cb4a01c8d72.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB6195:EE_|SEZPR03MB7916:EE_
x-ms-office365-filtering-correlation-id: e013285f-0594-44c9-5df6-08dee08f0821
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|11063799006|4143699003|56012099006|921020|22082099003|18002099003|38070700021;
x-microsoft-antispam-message-info: 5Fam6Af1E5glAi/9Nb6DrtXDxG9loKZH9LVAmUT6ilXn6Jb80e31+ToE0ainJ94t7OhvQFAdL9g9OKGMAc/W1XOboz9AmaSsZ+i8dPHMpbDaIhn//b8tjwksyz7jBodhLQ78mavIkr4XAAfcuh8QCy0DidPEMx2MuYUMMHBG9owmSxlFt9y0UgQzwZbCDSllxxtelTOCy3wU7tmXsHmKj0K9+m6V5+paCvZ8lEPU5UaO77IfINgRKTMXIB8/OV4fW0a33Ezz3yeSjF/pLIlAUHFIqhZojGse6H2l7wU1eRn0i5R8tWN5JRuEqxYePmT5RABxuGnQaOFbizDJHVnE6+AXQ+i53zqwNF9dsp44nXJIkdpCnXfURXEQg0Ew3vrr5OgWEXQvnMvO49kfam1ai7CPpcle6h+K2J7EIEYQAkGveORRtFAjN6NAJpxU13tWEO7QvLSYNzmmvvuUBjWGORGr9wZBYPDionvTrA81lGSnYmbJEtbUaKdK4qDsdwD8cyz7YBkCD3Hh4/EZJuKtOdr5dyB5lih63SnjLDr5cMSy27iDsUhlmyR8r1Zm9diVB5PAejfxEjHwoV6xtq2IlIA0TMk7WhlTYQs/b8cDg5+T93XKJHh+rCyxUwfVZWmifA3GLv7AP7gKWjpNdbFan0WQilez5anUPCRA1JyryxKcXFAWc1uNoOxiMubSkT+Xn4kzCUui3+L0UDDvtqf/jHoFXjSOtj61rvYVFEO0dFV4mJJ7iIMDfRA9g+nbUFL0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB6195.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(11063799006)(4143699003)(56012099006)(921020)(22082099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vy9sZzFZdTRkaGxnb1F4ZzRxSUJIaElnMkk4Q3B2d2RlYnc5eUpTTXFVUVNo?=
 =?utf-8?B?cGs3MFVFelVHVDg5cktRdU51TFFUQTlmMlpVUXRCVjVGMW14bDYxY2JYWG5k?=
 =?utf-8?B?bDZ5MHl1SzRGOXJ0dUlTVEhMTVlPMXU5RVVpTEYycENlR0ZyL0xMdDRRZ2xM?=
 =?utf-8?B?bDB0b043bXpaTmhGM055RnhjTmZPaEN6bXZWYkNEZHBUK05Kc1E3MjRwYmN6?=
 =?utf-8?B?UEhmZWFIUUplTHpBQW92WjVvVHQxS0RJSVBvLzNmVVlaTWg4ZXB2MVFScFZt?=
 =?utf-8?B?c0FnM0FQVFhxM3JxeTgvNUZyenZVekJOM2FxTU9wTEo1UzJUQ2hCME9HSWpa?=
 =?utf-8?B?dlBKNUkwdE5MRnZKRVEwdEFTbU5PQ0NWcnF2aUg1blQvaWJTcnhwMXMwc090?=
 =?utf-8?B?MXBHaVF3WTEydWdadU14NlV0YkNQcitKVDJ2czY4ZVJhSXJWK2dXT1R3ZGFQ?=
 =?utf-8?B?TXpnSnU3bFcxdW16aTdEYjJhZ3J3UWcwcURpOCtRdW1nYlhYVFc5djlFcUwx?=
 =?utf-8?B?RHhmY1BtZHBBNzUrdjUxVjcyWU43clV5TmswZ3BhS3YraWpaNDVHSlhEanpR?=
 =?utf-8?B?QXhkVnRMMlRMN1hoSTFBRHQ3cjFYeGFpWXZHMjkweG93anErMmtmOVVmMjlY?=
 =?utf-8?B?Z0FmUDVadnNmS0xiZmdqVG5KUXNHWkp4M21XZlNLMDZQVHhKaVZQa21MdTNS?=
 =?utf-8?B?MEZlY21qTWtJMnhCRlRVYkxpZlRCMkNWYngvYmR4U2dKQWdWSWxxZTEwNEth?=
 =?utf-8?B?MDJKQjhybG9jS0p3dFA5U2xpOXg0SDR2WklTdnlodmp5Sy82Z2JMY0dMQlA2?=
 =?utf-8?B?VjZkVlVYNW9xOGs5eG9SbUJIbFJxWjZqMDM0VmdTZ2wyWXB0YllEZ2kxT0VS?=
 =?utf-8?B?Y1pITWFhb1hHQm1KOGdRa3J4Nm9XaFlzbHArcFo3bWp2c245ekhuV2xld1VP?=
 =?utf-8?B?UjBQRVlwN2NmQ1VkVmVCaVlsZU9vc2NWY0N3MDlHZWczRlRnK2Vzb25aZVNC?=
 =?utf-8?B?VWhnZVNOQnRMWURTYjE2L1VnS3ZjL0JCbjhaYnZnM1hIVTlyVmJqbHNkRjF0?=
 =?utf-8?B?NHcrVE1FejV6WW9zUnB0OUZ5anVIOXlWNjVSY3h0YmN4RWNDS2tTa3ZiTWFi?=
 =?utf-8?B?TjJjcHh3RzllS3hjcEJsakhHTXBCVXNreDk2dXdOUXl4MnNmSllkTU8vd2RP?=
 =?utf-8?B?T2VkVXdTM2VCVHh5YzEyb0pZaG5RRHhNU1FKNVZCU2lRL3d4eGhxeEZTNTVF?=
 =?utf-8?B?cEVXaFVGN1NzSDVtMjN3UHNka2lBSHJmanYzTi9sN2k4akxORkZJTlh4aUJF?=
 =?utf-8?B?bnRPZTJET0VCZ09aSmF0WDlpYkpzMUNvcW9KNU95bUtEYzJJd2JKREpNQk5s?=
 =?utf-8?B?N0NPQXhzZHFxc2piOWdHOVdnb2RzUExZTHlRL3VOU0k3SGc0cjQzdDdZcUNR?=
 =?utf-8?B?bndsM241OUZnV29XenpHYXF3TFNnRGJ5WXFmNmtubkZWUDk0dHE0VjZzbTBP?=
 =?utf-8?B?UUNWSkF0NWJyc2VVZjFkUm5Cb0srU3RHdkV0aFJreE5vcytmM2JuUitZTjVk?=
 =?utf-8?B?OU9qWXlrdzhENmZ4ajdURzQ5MmVrTURMb1VXZGZkK2p4aU1oZjdJSG5PK21H?=
 =?utf-8?B?UW1LcEJ4MzFYTGM4eFRDd0NvMkZUcTJYRGxzY003dVl6UjJvd0RoeGpMRnQ2?=
 =?utf-8?B?K1pNMWdhUjhOaFJ4bXpvV095MkNURDNXenV0ZTdIbXZMQXBKcncwdVN4bTBE?=
 =?utf-8?B?SGdnZmpTKzIxdlVoN2cxcitDR3V4VEdwT2dSdTV0Mm1YL1U1YTdDRXNESkZ4?=
 =?utf-8?B?TU40aTlSazI1QllOUEpyempLcENnV0VXSmZpMEM5VHJPbjlSMU1BbWFhUU43?=
 =?utf-8?B?UWs0bjJTRkxqdFAraWJCUHpqTWJUOUo4UHFOUTNDeU91ajNQci9Zb0liYWlB?=
 =?utf-8?B?NFQ5RlorN2Y3azdTS1FvQklZbjJ6V0JiSXdDYTlnKzdtMkZRRXk3NWdhcWxl?=
 =?utf-8?B?OGs1SkdZQitqNit5ai9BZlcyMHVZalkycU8vUkcvTWlkR1RTVHVQZXV2L2VN?=
 =?utf-8?B?dWFxRllFOCtkM3dNV1N5RGdrdW94VDJLa3FUTGUycFd2UHUwRFN3V1E1UXAz?=
 =?utf-8?B?THYxNXNzSmlCSEVIYVIvdkZGUDVjZTB5MmZIVmNkZldtRlc3U2VqUHEvT014?=
 =?utf-8?B?aGR3bmozQmM5V2Rvdkl0YkRmQkJTMlVPOG9wbjN6UVNpZnRNbm0vWU9lMGpx?=
 =?utf-8?B?NUxpdEFGSzBjTHZwcThGVTByRUEzeVZjV0VKMERrWlhIcnJ6MmU0aG9Dek1i?=
 =?utf-8?B?aVpsb0dtQ29ZNjEveERxWjd2cFczdjhLVzRWcEZ5UW00M1Q3U0pDUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BA5AF81C535D84FAC7B5E81F4347356@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Qep/hw3lZAjH3DeshhBMlxHTkcnwPiZ+XR6wzsNq6AjUr1npCShEcgf4BXZIce55pS35P0H4Z5a6L/rfF65eK/Kd/Y6kQ4iAbzeHaBaOHxKBNAyf/llfy4s2wYrTWyn/vgIWU2g/3VsLVyWHI7WZlUjjiTJ3/WV5QfMeO7aDJO1QmF/NcMnaIgTLm5MsM8rREhMnDyUKcuF8YWJoLFr/2GAqRpnux8ziWeH76GiFcVhflSyNNob1X7CvbzE3YYGIOvwp6RmnTFpcFOaS5P6PnHG+jmIHW7anMyqdohORsEzS/LXCdXDZQjJvcqm7ScnxTHIbnl/LVgSBRcLweUchJg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB6195.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e013285f-0594-44c9-5df6-08dee08f0821
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2026 03:30:05.4089
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YFYVfcQamOsdgrPz3hQ8aU9ZwnB4AousNocW59pZquQD0BfPMaL9rOODLvZc5QQ61BsClDb1A9ef4bZyiRkKfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7916
X-MTK: N
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[mediatek.com,quarantine];
	R_DKIM_ALLOW(-0.20)[mediatek.com:s=dk,mediateko365.onmicrosoft.com:s=selector2-mediateko365-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67421-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:Kyrie.Wu@mediatek.com,m:angelogioacchino.delregno@collabora.com,m:robh@kernel.org,m:linux-kernel@vger.kernel.org,m:krzk+dt@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:nicolas.dufresne@collabora.com,m:mchehab@kernel.org,m:matthias.bgg@gmail.com,m:hverkuil-cisco@xs4all.nl,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:matthiasbgg@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,lists.infradead.org,mediatek.com,collabora.com,kernel.org,gmail.com,xs4all.nl];
	FORGED_SENDER(0.00)[Kyrie.Wu@mediatek.com,linux-media@vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mediatek.com:from_mime,mediatek.com:email,mediatek.com:mid,mediatek.com:dkim,vger.kernel.org:from_smtp,mediateko365.onmicrosoft.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Kyrie.Wu@mediatek.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[mediatek.com:+,mediateko365.onmicrosoft.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34796746EFD

T24gU2F0LCAyMDI2LTA3LTExIGF0IDE3OjQzIC0wNDAwLCBOaWNvbGFzIER1ZnJlc25lIHdyb3Rl
Og0KPiBIaSwNCj4gDQo+IExlIGpldWRpIDAyIGp1aWxsZXQgMjAyNiDDoCAxNToyNiArMDgwMCwg
S3lyaWUgV3UgYSDDqWNyaXTCoDoNCj4gPiBEaWZmZXJlbnQgSUNzIGhhdmUgZGlmZmVyZW50IGFt
b3VudHMgb2YgY29yZXMsDQo+ID4gdXNlIGEgdmFyaWFibGUgdG8gc2V0IHRoZSBjb3JlcycgYW1v
dW50cy4NCj4gPiANCj4gPiBGaXhlczogOTM0ZThiY2NhYzk1ICgibXRrLWpwZWdlbmM6IHN1cHBv
cnQganBlZ2VuYyBtdWx0aS1oYXJkd2FyZSIpDQo+ID4gRml4ZXM6IDBmYTQ5ZGY0MjIyZiAoIm1l
ZGlhOiBtdGstanBlZ2RlYzogc3VwcG9ydCBqcGVnZGVjIG11bHRpLQ0KPiA+IGhhcmR3YXJlIikN
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBLeXJpZSBXdSA8a3lyaWUud3VAbWVkaWF0ZWsuY29tPg0KPiA+
IFJldmlld2VkLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubw0KPiA+IDxhbmdlbG9naW9h
Y2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+DQo+ID4gLS0tDQo+ID4gwqBkcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5jwqDCoCB8IDggKysrKy0t
LQ0KPiA+IC0NCj4gPiDCoGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtf
anBlZ19jb3JlLmjCoMKgIHwgMiArKw0KPiA+IMKgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay9qcGVnL210a19qcGVnX2RlY19ody5jIHwgMSArDQo+ID4gwqBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3LmMgfCAxICsNCj4gPiDCoDQgZmls
ZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+IA0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdf
Y29yZS5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pw
ZWdfY29yZS5jDQo+ID4gaW5kZXggZDE0N2VjNDgzMDgxLi4xZTAxNGZkNjk4YWUgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2Nv
cmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtf
anBlZ19jb3JlLmMNCj4gPiBAQCAtMTQ2Miw3ICsxNDYyLDcgQEAgc3RhdGljIGludCBtdGtfanBl
Z2VuY19nZXRfaHcoc3RydWN0DQo+ID4gbXRrX2pwZWdfY3R4ICpjdHgpDQo+ID4gwqAJaW50IGk7
DQo+ID4gwqANCj4gPiDCoAlzcGluX2xvY2tfaXJxc2F2ZSgmanBlZy0+aHdfbG9jaywgZmxhZ3Mp
Ow0KPiA+IC0JZm9yIChpID0gMDsgaSA8IE1US19KUEVHRU5DX0hXX01BWDsgaSsrKSB7DQo+ID4g
Kwlmb3IgKGkgPSAwOyBpIDwganBlZy0+bWF4X2h3X2NvdW50OyBpKyspIHsNCj4gPiDCoAkJY29t
cF9qcGVnID0ganBlZy0+ZW5jX2h3X2RldltpXTsNCj4gPiDCoAkJaWYgKGNvbXBfanBlZy0+aHdf
c3RhdGUgPT0gTVRLX0pQRUdfSFdfSURMRSkgew0KPiA+IMKgCQkJaHdfaWQgPSBpOw0KPiA+IEBA
IC0xNTA5LDcgKzE1MDksNyBAQCBzdGF0aWMgaW50IG10a19qcGVnZGVjX2dldF9odyhzdHJ1Y3QN
Cj4gPiBtdGtfanBlZ19jdHggKmN0eCkNCj4gPiDCoAlpbnQgaTsNCj4gPiDCoA0KPiA+IMKgCXNw
aW5fbG9ja19pcnFzYXZlKCZqcGVnLT5od19sb2NrLCBmbGFncyk7DQo+ID4gLQlmb3IgKGkgPSAw
OyBpIDwgTVRLX0pQRUdERUNfSFdfTUFYOyBpKyspIHsNCj4gPiArCWZvciAoaSA9IDA7IGkgPCBq
cGVnLT5tYXhfaHdfY291bnQ7IGkrKykgew0KPiA+IMKgCQljb21wX2pwZWcgPSBqcGVnLT5kZWNf
aHdfZGV2W2ldOw0KPiA+IMKgCQlpZiAoY29tcF9qcGVnLT5od19zdGF0ZSA9PSBNVEtfSlBFR19I
V19JRExFKSB7DQo+ID4gwqAJCQlod19pZCA9IGk7DQo+ID4gQEAgLTE1OTIsNyArMTU5Miw3IEBA
IHN0YXRpYyB2b2lkIG10a19qcGVnZW5jX3dvcmtlcihzdHJ1Y3QNCj4gPiB3b3JrX3N0cnVjdCAq
d29yaykNCj4gPiDCoAkJanBlZ193b3JrKTsNCj4gPiDCoAlzdHJ1Y3QgbXRrX2pwZWdfZGV2ICpq
cGVnID0gY3R4LT5qcGVnOw0KPiA+IMKgDQo+ID4gLQlmb3IgKGkgPSAwOyBpIDwgTVRLX0pQRUdF
TkNfSFdfTUFYOyBpKyspDQo+ID4gKwlmb3IgKGkgPSAwOyBpIDwganBlZy0+bWF4X2h3X2NvdW50
OyBpKyspDQo+ID4gwqAJCWNvbXBfanBlZ1tpXSA9IGpwZWctPmVuY19od19kZXZbaV07DQo+ID4g
wqAJaSA9IDA7DQo+ID4gwqANCj4gPiBAQCAtMTY4Nyw3ICsxNjg3LDcgQEAgc3RhdGljIHZvaWQg
bXRrX2pwZWdkZWNfd29ya2VyKHN0cnVjdA0KPiA+IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiA+IMKg
CXN0cnVjdCBtdGtfanBlZ19mYiBmYjsNCj4gPiDCoAl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+
IMKgDQo+ID4gLQlmb3IgKGkgPSAwOyBpIDwgTVRLX0pQRUdERUNfSFdfTUFYOyBpKyspDQo+ID4g
Kwlmb3IgKGkgPSAwOyBpIDwganBlZy0+bWF4X2h3X2NvdW50OyBpKyspDQo+ID4gwqAJCWNvbXBf
anBlZ1tpXSA9IGpwZWctPmRlY19od19kZXZbaV07DQo+ID4gwqAJaSA9IDA7DQo+ID4gwqANCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19q
cGVnX2NvcmUuaA0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210
a19qcGVnX2NvcmUuaA0KPiA+IGluZGV4IDAyZWQwZWQ1YjczNi4uNmJlNWNmMzBkZWExIDEwMDY0
NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBl
Z19jb3JlLmgNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcv
bXRrX2pwZWdfY29yZS5oDQo+ID4gQEAgLTIxMiw2ICsyMTIsNyBAQCBzdHJ1Y3QgbXRrX2pwZWdk
ZWNfY29tcF9kZXYgew0KPiA+IMKgICogQHJlZ19kZWNiYXNlOglqcGcgZGVjb2RlIHJlZ2lzdGVy
IGJhc2UgYWRkcg0KPiA+IMKgICogQGRlY19od19kZXY6CWpwZyBkZWNvZGUgaGFyZHdhcmUgZGV2
aWNlDQo+ID4gwqAgKiBAaHdfaW5kZXg6CQlqcGcgaHcgaW5kZXgNCj4gPiArICogQG1heF9od19j
b3VudDoJanBlZyBody1jb3JlIGNvdW50DQo+ID4gwqAgKi8NCj4gPiDCoHN0cnVjdCBtdGtfanBl
Z19kZXYgew0KPiA+IMKgCXN0cnVjdCBtdXRleAkJbG9jazsNCj4gPiBAQCAtMjM0LDYgKzIzNSw3
IEBAIHN0cnVjdCBtdGtfanBlZ19kZXYgew0KPiA+IMKgCXZvaWQgX19pb21lbSAqcmVnX2RlY2Jh
c2VbTVRLX0pQRUdERUNfSFdfTUFYXTsNCj4gPiDCoAlzdHJ1Y3QgbXRrX2pwZWdkZWNfY29tcF9k
ZXYNCj4gPiAqZGVjX2h3X2RldltNVEtfSlBFR0RFQ19IV19NQVhdOw0KPiA+IMKgCWF0b21pY190
IGh3X2luZGV4Ow0KPiA+ICsJdTMyIG1heF9od19jb3VudDsNCj4gPiDCoH07DQo+ID4gwqANCj4g
PiDCoC8qKg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVr
L2pwZWcvbXRrX2pwZWdfZGVjX2h3LmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvanBlZy9tdGtfanBlZ19kZWNfaHcuYw0KPiA+IGluZGV4IDMyMzcyNzgxZGFmNS4uNDUz
NGNhZWIxMDRmIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0
ZWsvanBlZy9tdGtfanBlZ19kZWNfaHcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19kZWNfaHcuYw0KPiA+IEBAIC02NjQsNiArNjY0LDcg
QEAgc3RhdGljIGludCBtdGtfanBlZ2RlY19od19wcm9iZShzdHJ1Y3QNCj4gPiBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+ID4gwqAJbWFzdGVyX2Rldi0+ZGVjX2h3X2RldltpXSA9IGRldjsNCj4g
PiDCoAltYXN0ZXJfZGV2LT5yZWdfZGVjYmFzZVtpXSA9IGRldi0+cmVnX2Jhc2U7DQo+ID4gwqAJ
ZGV2LT5tYXN0ZXJfZGV2ID0gbWFzdGVyX2RldjsNCj4gPiArCW1hc3Rlcl9kZXYtPm1heF9od19j
b3VudCsrOw0KPiANCj4gSnVzdCBvbmUgcXVlc3Rpb24sIGNhbiB0aGUgbXRrX2pwZWdlbmNfd29y
a2VyKCkgc3RhcnRzIGJlZm9yZSBhbGwNCj4gY29yZXMgaGF2ZQ0KPiBiZWVuIHByb2JlZCA/DQo+
IA0KPiBOaWNvbGFzDQoNCkRlYXIgTmljb2xhcywNCg0KVGhhbmtzIGZvciB0aGUgcXVlc3Rpb24u
DQoNCm10a19qcGVnZW5jX3dvcmtlcigpIGlzIG5vdCBzdGFydGVkIGZyb20gdGhlIHByb2JlIHBh
dGguIEZvciB0aGUNCm11bHRpY29yZSBlbmNvZGVyLCB0aGUgd29ya2VyIGlzIG9ubHkgaW5pdGlh
bGl6ZWQgd2hlbiB1c2Vyc3BhY2UNCm9wZW5zIHRoZSB2aWRlbyBub2RlOg0KICAgIG10a19qcGVn
X29wZW4oKQ0KICAgICAgSU5JVF9XT1JLKCZjdHgtPmpwZWdfd29yaywganBlZy0+dmFyaWFudC0+
anBlZ193b3JrZXIpDQoNCkl0IGlzIHRoZW4gcXVldWVkIG9ubHkgdGhyb3VnaCB0aGUgVjRMMiBt
ZW0ybWVtIHJ1biBwYXRoOg0KICAgIHVzZXJzcGFjZSBRQlVGL1NUUkVBTU9ODQogICAgICAtPiB2
NGwyX20ybV90cnlfc2NoZWR1bGUoKQ0KICAgICAgLT4gLmRldmljZV9ydW4gPSBtdGtfanBlZ19t
dWx0aWNvcmVfZW5jX2RldmljZV9ydW4oKQ0KICAgICAgLT4gcXVldWVfd29yayhqcGVnLT53b3Jr
cXVldWUsICZjdHgtPmpwZWdfd29yaykNCiAgICAgIC0+IG10a19qcGVnZW5jX3dvcmtlcigpDQoN
ClNvIHRoZSB3b3JrZXIgY2FuIHJ1biBvbmx5IGFmdGVyIHRoZSB2aWRlbyBkZXZpY2UgaGFzIGJl
ZW4gcmVnaXN0ZXJlZMKgDQphbmQgYWZ0ZXIgYSB1c2Vyc3BhY2UgYXBwbGljYXRpb24gb3BlbnMg
dGhlIGRldmljZSBhbmQgc3RhcnRzDQpzdHJlYW1pbmcgYnVmZmVycy4NCg0KVGhlIEpQRUcgaHcg
Y29yZSBwcm9iZSBpcyBwYXJ0IG9mIHRoZSBwbGF0Zm9ybSBkZXZpY2UgcHJvYmUgZmxvdyBkdXJp
bmcNCnN5c3RlbSBib290LiBUaGUgdXNlcnNwYWNlIG9wZW4vc3RyZWFtaW5nIHBhdGggaGFwcGVu
cyBsYXRlciwgYWZ0ZXIgdGhlDQpzeXN0ZW0gaGFzIGJvb3RlZCBhbmQgdGhlIHZpZGVvIG5vZGUg
aXMgYXZhaWxhYmxlLiBUaGVyZWZvcmUgd2UgZG8gbm90DQpoYXZlIGEgY2FzZSB3aGVyZSBtdGtf
anBlZ2VuY193b3JrZXIoKSBzdGFydHMgYmVmb3JlIHRoZSBKUEVHIGh3IHByb2JlDQpoYXMgY29t
cGxldGVkLg0KDQpSZWdhcmRzLA0KS3lyaWUuDQo+IA0KPiA+IMKgDQo+ID4gwqAJcGxhdGZvcm1f
c2V0X2RydmRhdGEocGRldiwgZGV2KTsNCj4gPiDCoAlwbV9ydW50aW1lX2VuYWJsZSgmcGRldi0+
ZGV2KTsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9q
cGVnL210a19qcGVnX2VuY19ody5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlh
dGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3LmMNCj4gPiBpbmRleCBiNmY1YjIyNDlmMWYuLjI3NjVk
YWZhYjRhZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVr
L2pwZWcvbXRrX2pwZWdfZW5jX2h3LmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3LmMNCj4gPiBAQCAtMzg2LDYgKzM4Niw3IEBA
IHN0YXRpYyBpbnQgbXRrX2pwZWdlbmNfaHdfcHJvYmUoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KPiA+IMKgCW1hc3Rlcl9kZXYtPmVuY19od19kZXZbaV0gPSBkZXY7DQo+ID4g
wqAJbWFzdGVyX2Rldi0+cmVnX2VuY2Jhc2VbaV0gPSBkZXYtPnJlZ19iYXNlOw0KPiA+IMKgCWRl
di0+bWFzdGVyX2RldiA9IG1hc3Rlcl9kZXY7DQo+ID4gKwltYXN0ZXJfZGV2LT5tYXhfaHdfY291
bnQrKzsNCj4gPiDCoA0KPiA+IMKgCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGRldik7DQo+
ID4gwqAJcG1fcnVudGltZV9lbmFibGUoJnBkZXYtPmRldik7DQoNCg==

