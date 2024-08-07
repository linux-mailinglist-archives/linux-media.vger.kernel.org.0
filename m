Return-Path: <linux-media+bounces-15886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C5F949D5C
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 03:32:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6D2A2849E8
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 01:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB82D282FB;
	Wed,  7 Aug 2024 01:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="M2UujKbQ";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="vcCcbS2B"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718C27F9;
	Wed,  7 Aug 2024 01:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722994335; cv=fail; b=hp2UNKt8G0GRk8uteF6G2jtup716Rv/19mxn4siv6Omqu4SyF5ZeYULjPsfwLi57+dqDBG1qaKjGKUPMsFopNlSCIITQMo8wbhXvPRmvJqXaack7EeS/ZtRuF7TIXnPFnPExNv3gTQV95TPn+c1BIKO/ACM/agB2e88X+YENK+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722994335; c=relaxed/simple;
	bh=6az1SAMZKrdBix6BstTOOT2scOXXPjFe2aCsQNThC1w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gsu/7GN7F2eigEYgMt6bUHV3xMO1VR6rsHUOttzx1wnIN7WHj7cxJ+j8G8AWuVNsdvVaIPCJ8xT1cekmZ0d/Kwt8C2+m98SueUD72t/FMaaJ6tL5eHLiSyKzYsKQaR4Q7TwnVGPkGIlzBKah1ihud7PaFszbFiwsNTTK7aDhgXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=M2UujKbQ; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=vcCcbS2B; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: da26e964545c11ef87684b57767b52b1-20240807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=6az1SAMZKrdBix6BstTOOT2scOXXPjFe2aCsQNThC1w=;
	b=M2UujKbQMBNJ4vJ28h/YbjBV+UkNziTx3lC+/CREzOAAqN6rI7cRal9tlDb4vJB+SZUpwWcN82vjbD9KTVNxth1HGJGlS1SNmu3FViHUNgkAx2v0YtEEHGYYWP1xl546H3ARuEbFcv28RApfYtAw8egbj5e4zIPRiz3bo5SVIQ4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:bbdac9a9-1082-4c66-9345-8c7189b24044,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:1af146c1-acff-4a0f-9582-14bcdf4ed7e0,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: da26e964545c11ef87684b57767b52b1-20240807
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1071909716; Wed, 07 Aug 2024 09:32:04 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Aug 2024 09:32:02 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Aug 2024 09:32:02 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZqCXr3+a950galmkvdK7EhkmA5EpWyqvK6FpL/4d6WP2JCQxiJDzM6misOC3b4lg7PXGi5oQgpJQYz7n46VvOjA89wb5zTjXnrsE0RZAuzBZKQCiRhHQgzsRB3XfgcFXxNx3MKxe5NGF69nIOCAJlhD/fVqMjBsOCqdysPFPhuWDneFOs5Wb8ZtQOPDqmqIS8ylE4stmQMIn3pGmpENSMkpZ4bmJl6zKtAZP7AUBhozTqruZaTrB1pKvINnYlnYfyVrR16fKjcTPgPfylRfrFi7a7eotetLGgQ2yPnKb7fUpes7ITRTpq4MbeKruUHq0L5UmMLPBEZhLPDhX4LzSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6az1SAMZKrdBix6BstTOOT2scOXXPjFe2aCsQNThC1w=;
 b=snyJopsOl3ACdg4oG2Nvxr+ILIR/HvdIMhS7WsaIf1L6PyR1//3ZzZGHaLOSmJm35lWtp9PptLaJ6OfbThBW5LI26F8QIvlckiY/vhMq4UFGcVlBxx34x8YGJDonbgTijZ5Yd1i51KWcfQZo1u3jvbxu28dwH8PUGDFAesRIk0QWqOz5rG+Fm+5C7RRzEm+nTxhWMftQPOEk+oWCBOBJKcUVDRC291/7IWhxgqmmv1NTvsau+KnUtHCP9KU6brFHNrzhRs+7yMGkld0zc+Z9hs6txzyDC6TfAv53xF0Ggjl2fk4s95t8nkjW9hEf8o0a1lhNx0TBtiE3fvBs5ef+qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6az1SAMZKrdBix6BstTOOT2scOXXPjFe2aCsQNThC1w=;
 b=vcCcbS2BAbaOw27+yQbL3F66BcMabqqFx/m0zpxm7v02XbNmfO2lSlcZQhYGvzpf1RkaPyXRj4dCghnsjk1NgU+tnG5TH4SDDh0JvtjPuOgBpQGJ665dGSReODV6nsguaMF7QTwpdsT67iLUb9Ns3ZbVGAdqe+2blOkKo38UoBM=
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com (2603:1096:400:1f4::13)
 by SEYPR03MB7862.apcprd03.prod.outlook.com (2603:1096:101:173::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 7 Aug
 2024 01:31:57 +0000
Received: from TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54]) by TYZPR03MB6624.apcprd03.prod.outlook.com
 ([fe80::9ce6:1e85:c4a7:2a54%4]) with mapi id 15.20.7828.023; Wed, 7 Aug 2024
 01:31:57 +0000
From: =?utf-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"paul.elder@ideasonboard.com" <paul.elder@ideasonboard.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	=?utf-8?B?QW5keSBIc2llaCAo6Kyd5pm655qTKQ==?= <Andy.Hsieh@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "jstephan@baylibre.com"
	<jstephan@baylibre.com>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "fsylvestre@baylibre.com"
	<fsylvestre@baylibre.com>, "angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "pnguyen@baylibre.com"
	<pnguyen@baylibre.com>
Subject: Re: [PATCH v6 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Topic: [PATCH v6 4/5] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 camsv
Thread-Index: AQHa4ce8pNnPk1UzTUirk9/L9Gb6lbIQJ9sAgABcPQCACouGAA==
Date: Wed, 7 Aug 2024 01:31:57 +0000
Message-ID: <289ea20cb549f8fd76343776bf2a0871a33d4068.camel@mediatek.com>
References: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
	 <20240729-add-mtk-isp-3-0-support-v6-4-c374c9e0c672@baylibre.com>
	 <6a7467cde347600015078fe7aa25c4b46c45e96d.camel@mediatek.com>
	 <20240731082958.GM8146@pendragon.ideasonboard.com>
In-Reply-To: <20240731082958.GM8146@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB6624:EE_|SEYPR03MB7862:EE_
x-ms-office365-filtering-correlation-id: 9f6606e3-a5c0-44ff-1702-08dcb680ba47
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NVBXdDF1emNNR0E0a1JrVnB1REYvaGxwYWxSeTZud0pEOHVreE5QOEpiTVdF?=
 =?utf-8?B?ZC9UUmszSUxZczNLemJMYjVHZFE5OGhsQWxYb2FSaFJaYnZQOUtJODRSVE1v?=
 =?utf-8?B?b1FST1E2YUl1ZWprcjczR013K1QyNUJoWTFYMVo2Y0I2cTdJbUk1MUpOM2gz?=
 =?utf-8?B?RVFONkNIUFVPS0hleEt5bFAwUG1sMW5QU0xsZkhIRkZ5WXNHUC9TNHZEbStZ?=
 =?utf-8?B?RTBNOTAwZDdERzI0WGtTMjRhckxIcTF3bEovd2k1a1lKWTk5TFE5Y2l6YUlD?=
 =?utf-8?B?UDFlSDhqZ2dXQlF2THNEc1l0OG9IOGE1VStVYjRXMlRSb3daT3FXQVZZNmhL?=
 =?utf-8?B?YXhFRVU3UW1VWUJtbjFzOE9yN3AzM3FMQ0tYKy9RQ21PYTZxNFpRU2NaZGNG?=
 =?utf-8?B?azNnekVlQ2tTQzQvRmZORXA3bURWcTBHZHpOR2dzVjI5OS9CQXJRSnZHZE9H?=
 =?utf-8?B?bGRxUjh0VlhmZ3BkWTVLTVJGdkFNMG9sMWlRcEZObmJ0VCtMeWQ3ajF3V0Nk?=
 =?utf-8?B?ZWd0MDVxYTUybXdycUpPOVRZT29STFJBdkVRazk3MWNUbUdtOGFiQWFZS1lu?=
 =?utf-8?B?WkQyVm9EYVpDOVA4Q1BVcXpndlhidTY4S0xLN3FEYWs0ZCtxSis5Qk41bk43?=
 =?utf-8?B?ZlFvbm5PZ0xpdTBzU04xbUtQVXFwU2o4TmYwRWdUNnVYUUw4VS8vMUF3NGpW?=
 =?utf-8?B?QnFyd0RVaTBjclhwS1QyTW1EKzBtblFXbGdLRjhkN0pHanVSTi9tYmRvOTNL?=
 =?utf-8?B?bWZ2RUVsNC9RNkpkUGwwT2hhYlRFUHVhdUxBTDhDK0h2YzhDWGhjTW9SMmx0?=
 =?utf-8?B?eFd0VEhYaEJ2ak5xRXVzZHNsSzJKYnRYS1pDb3hNZ3NUUm1HMjAvOHA1YjE4?=
 =?utf-8?B?NmJYUDZhaGhHUGQ0OUkrVTczMC83WmtHQXAzRHpteXFaVjdnK3R3YlVrY1Jx?=
 =?utf-8?B?WFNFUFp2dW4rTFFQb0JKeDIwYUNsOTBqaUowWXhjN0RIZWdNMkxVVEJhejd2?=
 =?utf-8?B?WmJxVGpieGJDVEFzZE01THFoNm1ueWp2TW9vZXRUU0hObWp4M3d6c2JjRkMw?=
 =?utf-8?B?bkJqRzdMVkZXNWp1REFmVER3aDdxV2l6ZmxVRm9jblNNL1BYOVpEamxNSlR0?=
 =?utf-8?B?SHNTZ29HSlJZTW5ZUlh3RlNkdEN5R1JBU3M2OTNMV0lqUm5KQXp0WDhSN2l6?=
 =?utf-8?B?aHlJNHR2SjJ2R0d6MHBxRGFrdWliaXdDV2R3Zjd4QVMxR0JWVFdzZFE1V0JJ?=
 =?utf-8?B?R2ZVaG9ycjhTVllVUVN4QVB6dGdEWFhJUFVxU0h2TDdWTCttYkVwWFo0YkRK?=
 =?utf-8?B?TmJaVjFrSVNjelpxeWJGbE1QUThxUUN6YTdNeWVpdktNK3EvZ1kzcGJaVU5B?=
 =?utf-8?B?SUR3YjlzOVdKS2twS2U1V3JPOVl4UG9VT2ZBckFRVzlXYUQ1a0JnOFZidkpK?=
 =?utf-8?B?aUNzRE56a3d3N3ozcktqQ0x5Z0RLR0k3bGljMUxGUnJXZld2ZjRrV0tuNkpW?=
 =?utf-8?B?ZWRRWjJxYm0vOWhmRGE3cUk5bHZDNFhGOXpVUlZTOEFiTkdIMWcveUNHeGtk?=
 =?utf-8?B?Vk5lNHpBa0tWd2JJeFp4TXlHSGpvYlBmd29wOXlQY3VqNU14M21YR2thWFNt?=
 =?utf-8?B?bE5Vb0wxZ1oyVURWbXBFeDBIb2ZvTy9XMHdCaGp4UmZiUmxxZkkxYk0wcjBL?=
 =?utf-8?B?ZDhzY2VMWFJiQlNmazZjM01zcXNPTEhKUC80T0hNT0FmakZSZ3NhZnZPeUxD?=
 =?utf-8?B?T2VVRkVIa0RmalJkS2hDay9GUXd4dDVwMzZFN05QdERnNDJGUTM3Ly9NMjFs?=
 =?utf-8?B?MFBjUjhJZ2pMTmVsZ0I0RkNnTE5rc052N24wYWVqd2NvUVoxd29XTnAwWkVq?=
 =?utf-8?B?a29BSUUwTkUyS0FheGRTSnRTRG9ETDJTbFhQTHNibGxUVGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB6624.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkdzeXNPNmhmWWFwK0NRNkVRTW1KazhJTHNKVFVNRVd5RjFib2RDaVB6MzdT?=
 =?utf-8?B?b2VpMDFzM0hCMTNJWm5ob1JzTzRDS3FNaFA0d1dJa3dXQzJwT2tnSTQrRHZ0?=
 =?utf-8?B?TkNQcjlNK081ZjVXRjA4T2srUTdDYWJ6UG5ISnNwSU9RMkNsWnBDeFpJUkN0?=
 =?utf-8?B?WlViL0hHRVZYQWhseHh3WDQydHB2cGc5QThTQThxeTYwbWlkZGNoT25Pdnlh?=
 =?utf-8?B?Q05oZHBVclRLZzM5OVBERzZlUFRjbkdjSWUrR213dk52a2traURsS0NKQWhq?=
 =?utf-8?B?U2V5d3FNSnNaWDlucnBBUnJYTjdzZjdKOUR4YlVUaEd5SDRvRGI4SzFsM052?=
 =?utf-8?B?QkZMZmNCYXA4ZUpSVEZNSUJBT25NL01wWGlFR3Q2TEFrWGZUMjM3Q09RbE0x?=
 =?utf-8?B?MHNESEF6b01xekNpbjBvdDczV1NxRW8yZVI3bWduZGQwUWdMSml6SWZaK3dW?=
 =?utf-8?B?NWFGNExSZEoxOGMrZmJsNFZIL1hIMWZoWGZXNXJMQU9SZ0tQMDFhSnlqVWxr?=
 =?utf-8?B?eEw2K1Q5c3h6MnVoNU8wOGp5c1hlcDZGOXNKYkE4MDhvcnFmOHhYMS91ZTNx?=
 =?utf-8?B?UExCL1d1M1Z2c0FHaVpRZzRjTVhuYVgyUWdQNmwwRDN1ZEtZRi9GdDVEcnJa?=
 =?utf-8?B?NmczRTc5ZnpZbm5nSnF4c24vUjlWT05xdVR3TmF0bTIxYXhLck9sYW9jeGJy?=
 =?utf-8?B?U0dDenMrZVNEVWt2Y0szSllQaVFKVEtxMi9FUkZtMXhPT2xZdXJhakhsYVlx?=
 =?utf-8?B?MkZnQUQ5ZWFIeEdYUnVaRGFkbGQ0Z0VzaTJUejU5RTgycHNwWCtxU0ZYMmw2?=
 =?utf-8?B?NVhYMXZKREU4SWxNbnFybkl6bjhsZjRNbGNWNmdPNTZNOWNvWERqWGMxZDBE?=
 =?utf-8?B?NWk0Mk1JSlR5anBOTUJBekV3M1FFcDJFWTNIT3J2Q3dJT0dvcG9rb0dDSGds?=
 =?utf-8?B?bS9qa28vdnMvR2J1YWg5dU14QzgrakowU3VpZ0xjY2ZZMmM2TFl2bFVrRmIr?=
 =?utf-8?B?YzQxdnVvN0krMGpUdVFUTkkzcjliUkttRCtpcXdENlIrNy9CaVhycHVrNWIx?=
 =?utf-8?B?REtJNUVsZ1N1b25GSUhVczFUVHRSYno5eHFBdjZvZnVzbmc1RHR5MGxMdEpr?=
 =?utf-8?B?Z2RPNDlWcHVISEx0bU85YkJWUFJCSmFoRTVaTmJVSzZyYXdiQzJEVlBYQ3gz?=
 =?utf-8?B?Y1lXWWRRWktSVy9wNVdpQ1lxZ3BJbG5EenhTditpU1g2YitNc0Ywc3hmRGp3?=
 =?utf-8?B?M1pKVjQ2K2ZVS2dPcFZ0T3dPa256RHk0bE9WRzhlYUkxamVPKzNNZk1BMkFP?=
 =?utf-8?B?TDg0ZWhhd3JzcXJhQTBtOXhaN3lhZ01odWlZa1VkQys0d2ZQbnNCN2ZwRVFw?=
 =?utf-8?B?Sm4yTUwrVFlnNE5Rb0JjTXF4eXpHSEQ0ZmdTZDJIV2RyUUhWQ1pkMnNDamlO?=
 =?utf-8?B?VUtUYkRUSXZlUnVMQm0wOWJWcitLU3orUXhobGlKQzVCam1VZDNWYklyV2x4?=
 =?utf-8?B?dE4zanU2M1RmSGIrSmdsVk5BNEpmaExnY2xramFWbW1JYmZQZVJEek9sb0F3?=
 =?utf-8?B?R3RGcmhPV2VFUVBzVnA2UzBJMUxZOCtMN0RwVEpRU3FHSUF5ZDBMMURPdDZW?=
 =?utf-8?B?WE1tTmhVTndDSGpJSzNSZFF6Wm5sQnM4VGNSdjJQRzdwcWpXeVZPaGd6WFpv?=
 =?utf-8?B?RHBRR1NBS3oxczFweCtxVTR1TFBnRzhXeWtDOFdNQmU5c1NlY2dYMkNDVVBQ?=
 =?utf-8?B?Q1VwRDc1SUxyMW1KYjhkN1FCN3ZVcyt5NVIzUk40VEh6VmJQZmZVRy9vc1Fq?=
 =?utf-8?B?K0MxUEdxcFNLZFByUHNHNnV2UkV6QmlSZXVIWkgwYnY2dTBZTFJDS1kyU2Mw?=
 =?utf-8?B?ejl4Yk45dHh6TTlUU2pPSUhIWlJodXRGaVBURDFSUytzVHV4d2dqemFZNVhF?=
 =?utf-8?B?R3BTaklnSVoyWHZwNFREeitXVlNZQWEwZ3FMekd1ejV6ZUNIOCs4R0ZRQzFL?=
 =?utf-8?B?d1JOQmtuMDNvQVdpQmlmQmpJd2VRb0FudklyZThOY05icVo5dlQxQ2xTQ0xr?=
 =?utf-8?B?dGh4SWF1OUp5YVRjbno5bmE3M2tKYVFRKy9FNHk0cDdTdEEyUUZNeXFzU1kw?=
 =?utf-8?Q?LHuP1SIvE0PvWJJEUfYp89zx8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4770363D5A3054C883C68C150D35C50@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB6624.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f6606e3-a5c0-44ff-1702-08dcb680ba47
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2024 01:31:57.6694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oM7Utee+3hXC7QdmrQKvD6f0gmwcbmmLRlYA4hpqPJylzSi+654o+7Gjw89GdrZezHr+6F5qwzvEM6GlMWGeoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7862
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--23.504500-8.000000
X-TMASE-MatchedRID: QW5G6BKkLTqSfAmmPXvGRia1MaKuob8PCJpCCsn6HCHBnyal/eRn3gzR
	CsGHURLuwpcJm2NYlPAF6GY0Fb6yCpGpaLcbZyfwmlaAItiONP35bNUY+JJjyPt592eq2xoT9zu
	fTLEgR0zYtiN/0LqsYxzqqVflbLiW6fubsV+A+k+HZXNSWjgdU7n7V+KB+3cu1JVSTP0E9d4EB0
	+uIIPr34oyAc8SIkBIPUaNmZuUleWIlfP7LxrPY+w8wbnnSw8bwx0jRRxcQfMGW3hFnC9N1UdOR
	0Kgb7aXT+8jO231VliRk6XtYogiatLvsKjhs0ldC24oEZ6SpSk+Mqg+CyrtwA==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--23.504500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	B72FFA6716AD635970EA3E9824DCF08A1FD29C31A62B10C41DBCECA985A4603A2000:8

SGksIExhdXJlbnQ6DQoNCk9uIFdlZCwgMjAyNC0wNy0zMSBhdCAxMToyOSArMDMwMCwgTGF1cmVu
dCBQaW5jaGFydCB3cm90ZToNCj4gIAkgDQo+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVk
IHRoZSBzZW5kZXIgb3IgdGhlIGNvbnRlbnQuDQo+ICBIaSBDSywNCj4gDQo+IE9uIFdlZCwgSnVs
IDMxLCAyMDI0IGF0IDAyOjU5OjUxQU0gKzAwMDAsIENLIEh1ICjog6Hkv4rlhYkpIHdyb3RlOg0K
PiA+IE9uIE1vbiwgMjAyNC0wNy0yOSBhdCAxNjo0OCArMDIwMCwgSnVsaWVuIFN0ZXBoYW4gd3Jv
dGU6DQo+ID4gPiAgRnJvbTogUGhpLWJhbmcgTmd1eWVuIDxwbmd1eWVuQGJheWxpYnJlLmNvbT4N
Cj4gPiA+DQo+ID4gPiBUaGlzIGRyaXZlciBwcm92aWRlcyBhIHBhdGggdG8gYnlwYXNzIHRoZSBT
b0MgSVNQIHNvIHRoYXQgaW1hZ2UgZGF0YQ0KPiA+ID4gY29taW5nIGZyb20gdGhlIFNFTklORiBj
YW4gZ28gZGlyZWN0bHkgaW50byBtZW1vcnkgd2l0aG91dCBhbnkgaW1hZ2UNCj4gPiA+IHByb2Nl
c3NpbmcuIFRoaXMgYWxsb3dzIHRoZSB1c2Ugb2YgYW4gZXh0ZXJuYWwgSVNQLg0KPiA+ID4NCj4g
PiA+IFNpZ25lZC1vZmYtYnk6IFBoaS1iYW5nIE5ndXllbiA8cG5ndXllbkBiYXlsaWJyZS5jb20+
DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBGbG9yaWFuIFN5bHZlc3RyZSA8ZnN5bHZlc3RyZUBiYXls
aWJyZS5jb20+DQo+ID4gPiBbUGF1bCBFbGRlciBmaXggaXJxIGxvY2tpbmddDQo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBQYXVsIEVsZGVyIDxwYXVsLmVsZGVyQGlkZWFzb25ib2FyZC5jb20+DQo+ID4g
PiBDby1kZXZlbG9wZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRl
YXNvbmJvYXJkLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiA+IENvLWRldmVsb3BlZC1ieTog
SnVsaWVuIFN0ZXBoYW4gPGpzdGVwaGFuQGJheWxpYnJlLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBTdGVwaGFuIDxqc3RlcGhhbkBiYXlsaWJyZS5jb20+DQo+ID4gPiAtLS0NCj4g
PiANCj4gPiBbc25pcF0NCj4gPiANCj4gPiA+ICsNCj4gPiA+ICtzdGF0aWMgdm9pZCBtdGtfY2Ft
X2Ntb3NfdmZfZW5hYmxlKHN0cnVjdCBtdGtfY2FtX2RldiAqY2FtX2RldiwNCj4gPiA+ICsgICBi
b29sIGVuYWJsZSwgYm9vbCBwYWtfZW4pDQo+ID4gPiArew0KPiA+ID4gK3N0cnVjdCBkZXZpY2Ug
KmRldiA9IGNhbV9kZXYtPmRldjsNCj4gPiA+ICsNCj4gPiA+ICtpZiAocG1fcnVudGltZV9nZXRf
c3luYyhkZXYpIDwgMCkgew0KPiA+ID4gK2Rldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGdldCBwbV9y
dW50aW1lXG4iKTsNCj4gPiA+ICtnb3RvIG91dDsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiAr
aWYgKGVuYWJsZSkNCj4gPiA+ICtjYW1fZGV2LT5od19mdW5jdGlvbnMtPm10a19jYW1fY21vc192
Zl9od19lbmFibGUoY2FtX2Rldik7DQo+ID4gDQo+ID4gRGlyZWN0bHkgY2FsbCBtdGtfY2Ftc3Yz
MF9jbW9zX3ZmX2h3X2VuYWJsZSgpLg0KPiANCj4gVGhlIGdvYWwsIHdoZW4gdGhpcyB3YXMgZGV2
ZWxvcGVkLCB3YXMgdG8gc3VwcG9ydCBtdWx0aXBsZSBnZW5lcmF0aW9ucw0KPiBvZiBoYXJkd2Fy
ZSB3aXRoIGEgc2luZ2xlIGRyaXZlci4gSSB0aGluayBpdCdzIGEgd29ydGh3aGlsZSBnb2FsLCBi
dXQgYXQNCj4gdGhlIHNhbWUgdGltZSwgSSdtIG5vdCBzdXJlIHRoYXQgd2lsbCBldmVyIGhhcHBl
biBhcyBJJ20gbm90IGF3YXJlIG9mDQo+IHBsYW5zIHRvIHVwc3RyZWFtIEdlbmlvIDM1MCBhbmQg
NTAwIHN1cHBvcnQgKHdoaWNoIGlzIGEgYmFkIHNhZCwgYXMgaXQncw0KPiBtb3JlIG9yIGxlc3Mg
d29ya2luZyBvdXQtb2YtdHJlZSkuIEknbSB0aHVzIGZpbmUgZWl0aGVyIHdheSwgYW5kIGlmIHdl
DQo+IHRoaW5rIHRoZSBtb3N0IGxpa2VseSBvdXRjb21lIGlzIHRoYXQgdGhpcyBkcml2ZXIgd2ls
bCBvbmx5IHN1cHBvcnQNCj4gR2VuaW8gMzAwLCBJJ20gZmluZSBkcm9wcGluZyB0aGUgYWJzdHJh
Y3Rpb24gbGF5ZXIuDQoNCkkga25vdyB0aGlzIGdvYWwuDQpGb3IgdGhlIG10a19jYW1zdl8zMF9z
ZXR1cCgpLCBpbiBuZXcgU29DLCBpZiBvbmx5IG9uZSBsaW5lIGluIHRoaXMgZnVuY3Rpb24gaXMg
ZGlmZmVyZW50LA0Kc2hvdWxkIHdlIGR1cGxpY2F0ZSB0aGUgd2hvbGUgZnVuY3Rpb24gYW5kIG1v
ZGlmeSBvbmx5IG9uZSBsaW5lPw0KSSB0aGluayB3ZSBkb24ndCBrbm93IHdoYXQgd291bGQgaGFw
cGVuIGluIGZ1dHVyZSwNCnNvIHdlIHNob3VsZCBub3QgZGVzaWduIGZvciBzb21ldGhpbmcgd2hp
Y2ggd2UgaGF2ZSBubyBhbnkgaW5mb3JtYXRpb24uDQoNClJlZ2FyZHMsDQpDSw0KDQo+IA0KPiA+
ID4gK2Vsc2UNCj4gPiA+ICtjYW1fZGV2LT5od19mdW5jdGlvbnMtPm10a19jYW1fY21vc192Zl9o
d19kaXNhYmxlKGNhbV9kZXYpOw0KPiA+IA0KPiA+IERpcmVjdGx5IGNhbGwgbXRrX2NhbXN2MzBf
Y21vc192Zl9od19kaXNhYmxlKCkuDQo+ID4gDQo+ID4gPiArDQo+ID4gPiArb3V0Og0KPiA+ID4g
K3BtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGRldik7DQo+ID4gPiArfQ0KPiA+ID4gKw0KPiAN
Cj4gLS0gDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQo=

