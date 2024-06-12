Return-Path: <linux-media+bounces-13026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A1990512C
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 13:14:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC797286879
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 11:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65A3C16F0DD;
	Wed, 12 Jun 2024 11:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Rl6E2d7T";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="S+NqB26k"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31FF168C3A;
	Wed, 12 Jun 2024 11:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718190834; cv=fail; b=NdLoC4ldJS7jvBe/fdzMN5JITXtSOrM93bTdFOxxFNP7kKVbAwh4p8/EbxcALkh4oKUsoiabpUQQFLIOQdSsRE5N6ubrRRUbNMp+6hpnfLVs1mHxtLoBSJF7LQ+8Y95NDqfuUunOlBUtHIV6IZucZInqfxlzFSTHmRVTZq1GsV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718190834; c=relaxed/simple;
	bh=8wGVGtujHyKcpCefOjUWAE4PTqXm4hMxy/UCBIA/qxc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b1lK0ETKzQdytfpVS3zdYgei6lA4jZoTE2vozUcDzFmjUPdNZebpnINVD8gsB0AYRA2prcWuGIWmpSoUhSUfQKWyNtaWmVoBTAY4x/i0h8PRfUekV5CeMqO9Ee/jWg9XvGeVn9GilRQI7dqZe2fJhuBU70hrkLQpzwI5/1JtRFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Rl6E2d7T; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=S+NqB26k; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d66c5ae228ac11efa22eafcdcd04c131-20240612
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=8wGVGtujHyKcpCefOjUWAE4PTqXm4hMxy/UCBIA/qxc=;
	b=Rl6E2d7TF8V0pOzRIOf5WlUHCAPXo9/ZMO3UoWtvFuZC26davkX5UsznMmBdiZ3h16NsEDdquvCPnuI3SEKgqTkIZ36jjJfweoFNMyt4J0E9cyZPq3PB0bEwey12mj+NBu3s9Tt4LPi/+9DpW8AozyXp8WnbHYz/taevjNmhUgs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39,REQID:27e3c19c-0d83-4ab2-84b7-fb982083321e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:393d96e,CLOUDID:095c7d44-4544-4d06-b2b2-d7e12813c598,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-UUID: d66c5ae228ac11efa22eafcdcd04c131-20240612
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <zhi.mao@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1072350040; Wed, 12 Jun 2024 19:13:46 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 12 Jun 2024 19:13:43 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 12 Jun 2024 19:13:43 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RajS7TMPVwRt5yQicLxipHHgw++gxuhIPTHX4Huwu0hb1j9h3tKBAxEfr7ZzHhK4M99YwrP8+ac4s5HUZxt+L8YugmePLuNLH2FKjGudaEldGOeAvbb0XFN2X9T+wLhaD/8jS6svRyTqWqJNyxJktPzURSUIdqZSO2mdgKnbolGlfwoMoU3xg2/KIro1joRYeUmFkSGF63ZCAYkXHIUVDeStFrxH3cRhJyRbJQx+Z2xVqBi3IqClmBUoIk9zu8cvG4plS+tkcMA9EzYSp0Q5ibhUxOU2LNyPQZjwFPDGIUhZj/5Xx61Vl/mdGJnnSX9GZYiOofjnSvE4KQkW3Oe9kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wGVGtujHyKcpCefOjUWAE4PTqXm4hMxy/UCBIA/qxc=;
 b=CkLVQU+pKDkwgoSJEfwbdZ6+i3cTFzXlKJ/wMEbr8qj0OvzNXjJcAMmENJTQfb+A1XNIsLXt5WeTBuivvjUrINbwK9xm85PsviK+iCPvduFFqVnCcDNHW45ktvImFUkMA6ZGBVyZCsjxPFmHliqdfWcpteTUjz5T6GuiaMW2cov3dN+8qTl3XzzXghh2HDXwCQLrLHBKH/FXHTqU2uBQANI6zoRuxFsxum1kYL6EW3lqt3IKtn/NLpEWa9euMx1FC9XMCGANtiH5f5LKQkeStYS04a3XLgvHanEStknWq/BEj1vigh4BaJ4viRyuaf1JFATuy2ioFtwyoiq3XfdGzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wGVGtujHyKcpCefOjUWAE4PTqXm4hMxy/UCBIA/qxc=;
 b=S+NqB26kECcjM0b9OmvwqkjjDMg2gIbfcd+xrH8ZRd77tqarS0NIq8RVSQ/VPDQIaowDQraBgHSwOgOQpY4ga7W37C/GGoL3ikGMpfLZUzW0an6zPVeUwIgKiflZ/FfKKYRUau2YmkCh2HU060djRWeygRJEh8yXkvNcrzK9hlE=
Received: from TYZPR03MB5566.apcprd03.prod.outlook.com (2603:1096:400:53::7)
 by KL1PR03MB7405.apcprd03.prod.outlook.com (2603:1096:820:cf::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.16; Wed, 12 Jun
 2024 11:13:40 +0000
Received: from TYZPR03MB5566.apcprd03.prod.outlook.com
 ([fe80::dbc2:ff5c:56d:2187]) by TYZPR03MB5566.apcprd03.prod.outlook.com
 ([fe80::dbc2:ff5c:56d:2187%7]) with mapi id 15.20.7677.019; Wed, 12 Jun 2024
 11:13:40 +0000
From: =?utf-8?B?WmhpIE1hbyAo5q+b5pm6KQ==?= <zhi.mao@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"angelogioacchino.delregno@collabora.com"
	<angelogioacchino.delregno@collabora.com>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
CC: "heiko@sntech.de" <heiko@sntech.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "laurent.pinchart+renesas@ideasonboard.com"
	<laurent.pinchart+renesas@ideasonboard.com>, "yunkec@chromium.org"
	<yunkec@chromium.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "hdegoede@redhat.com" <hdegoede@redhat.com>,
	"bingbu.cao@intel.com" <bingbu.cao@intel.com>, "paul.elder@ideasonboard.com"
	<paul.elder@ideasonboard.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "andy.shevchenko@gmail.com"
	<andy.shevchenko@gmail.com>, =?utf-8?B?WWF5YSBDaGFuZyAo5by16ZuF5riFKQ==?=
	<Yaya.Chang@mediatek.com>, =?utf-8?B?U2hlbmduYW4gV2FuZyAo546L5Zyj55S3KQ==?=
	<shengnan.wang@mediatek.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>, "alain.volmat@foss.st.com"
	<alain.volmat@foss.st.com>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "tomi.valkeinen@ideasonboard.com"
	<tomi.valkeinen@ideasonboard.com>, "10572168@qq.com" <10572168@qq.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "mehdi.djait@bootlin.com" <mehdi.djait@bootlin.com>
Subject: Re: [PATCH v3 2/3] media: i2c: Add GT97xx VCM driver
Thread-Topic: [PATCH v3 2/3] media: i2c: Add GT97xx VCM driver
Thread-Index: AQHavGbjaqjdV+0TAkGkmzYliWByKrHDtaMAgABEtoA=
Date: Wed, 12 Jun 2024 11:13:40 +0000
Message-ID: <18d2c28fc8b47889689a1506957ea2a308c80fa2.camel@mediatek.com>
References: <20240612012019.19078-1-zhi.mao@mediatek.com>
	 <20240612012019.19078-3-zhi.mao@mediatek.com>
	 <7c71534f-9815-4ea3-969f-c04d249d35d2@collabora.com>
In-Reply-To: <7c71534f-9815-4ea3-969f-c04d249d35d2@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR03MB5566:EE_|KL1PR03MB7405:EE_
x-ms-office365-filtering-correlation-id: b7b1b3a4-99ba-4cf9-22ac-08dc8ad0b6c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|1800799016|366008|376006|7416006|38070700010;
x-microsoft-antispam-message-info: =?utf-8?B?QlNNcnhIQTYrc2xJQ2JZaWVwd0JsbnVyMVNDdlBBa0s2bU9TT2xHSGxzakl5?=
 =?utf-8?B?ZjVqVkVWQmUwV0cveFM1VHBvb1M2QmdUeEdJVkdLdGtDVUFBRlNmZ204Y1dY?=
 =?utf-8?B?WVhBdkFmU3pNU0kyM292dlNqNndwV3J1ZzQ5QzJ6WFEwM1kweXRxMXJBNDBW?=
 =?utf-8?B?ck1MR2tMdlNLbU10ZVZvNGErYW8wR3hIeFQ3VGcwS2Fxb09udmU1aFEvd2Ny?=
 =?utf-8?B?TlhMZkkxUzZ2dDNIUkNFenN2cGJaT3R2V0F4NTJOaW9qM3dMeWdBeGRHOU9U?=
 =?utf-8?B?U0FHd0lVOVl3Q0RZdTJEVVpPTkIydkdzUjRLYUdIdkhLZjRFSjhsaUV2NFNZ?=
 =?utf-8?B?aTZxR0FFbnBHZm9IcDNWYjBkc21lVUxjcFVncGcyVWl6UVFMMHhrb3ZGMDlE?=
 =?utf-8?B?OFR1ZS8zdVREOWZVVy9xbUNDOGU3SXduV0JVbktySml0NGVaYXNuUkJ0MTh0?=
 =?utf-8?B?YUw1bUhiZ3VpSFlrbEFHV005N29GWGdOazFWT3BmT25jajN3Z0E0dzVMcDlZ?=
 =?utf-8?B?UDA0bS9zdTcrbjVHaFBOYXZpcEZScUQxZE9vNWIxT2xHa2FIazBlNHZqMDA4?=
 =?utf-8?B?bG5QZlFGZFpIY3ZaMm1ZVTBaTzBEclZVREowTFZsOTJZaUJNVjE3WEZxZGVD?=
 =?utf-8?B?Q0FZREVkdC9vQWFjSGFLTHlwYXRzRGx0OGIzTi91R2ZRMVA4K3dNWk1GRHJP?=
 =?utf-8?B?WjBqZFZkUlRuejdRd0FPN0lVTEJyaWRZN3NJMXZocU92OWxxSFZxNUNTcGRz?=
 =?utf-8?B?S3ExWnFZcTBVNW1MYzI3UjlKUU1Ba1U4WDNEU0lCZUNFTUtNOTdNMEpuV3pj?=
 =?utf-8?B?Mzl4cExzdjBhQ1Z5VXpOZ0tQNC9KRDVCYkJBall4LzJFL2lDRU5VNFd1M2pL?=
 =?utf-8?B?VHNoYmZrTXZFOGM4WDVta2NLRXdLRXpQY1Q1azNTR0Uxb1NEeVhwb29vRFF5?=
 =?utf-8?B?Smw2dnNlcDJ4cUx2K2RRUFdRZXJKK0o2MnN3TW5vc1RuVzZ6SVdtdGt0bkFK?=
 =?utf-8?B?bUlnZ2RuL00vdGtnRzRRWjlvUTVHTWhsSVRqbEZQQ3VQN1lkNy9GQUFHbGR4?=
 =?utf-8?B?UUhsMzdPWVRuZkdEckYxRWR5RzZCTnlTVDFWUXlnbUJOK01NYUxKM01qd0JX?=
 =?utf-8?B?aGVmUC9RbmlmNlljYXRseENrVjQ0bm5MdGhHME1LcmJjWjNCVDFKTEpFQTg4?=
 =?utf-8?B?blN2M2dvTlVCRWhscGNRSG1OZ0VLcmFiMFlyVXQ4MzBIZHpCbVNrNVFaaDdE?=
 =?utf-8?B?WHNxcW1INTFSc1JuT3pRV3ZreUM3SXdWM0h4aGFJTllCRzg0ZGVJMFJqd0hH?=
 =?utf-8?B?eExPa3U1R21GNzRxVzl6SURscE9vT2N4d01IK0VzOVFiejdza1JzVDZCQVJj?=
 =?utf-8?B?NktZb3JSRG4zNjlBdTBZQ1ZiUU9YQjdPUnZXVUlZdG5ZZXRRamdsa2pySkZi?=
 =?utf-8?B?ekl3dllBaHg0WldzeEhGWGs0TXNiRjVOTFJLUVdJMVNST0V2cHpiVGNsekM4?=
 =?utf-8?B?UjFiOUJjM25uQ3dxNy9nWlhkemdxQ0FheTFMTytxNjlYcm5BSEVEQUFwcERv?=
 =?utf-8?B?ckZlK045MDhPN0lLMHVKbG9CV0p2MGtsSEFEOU1MbTllWVNZNkVQeXFlTU8w?=
 =?utf-8?B?d2VJNDVncE8zVFpDK3VUMTRCaEw1ZjZLQVcyOENkcDh3eUpLYXhOZDJVSVF6?=
 =?utf-8?B?QUNrUE1YdmJEZXdmbDVaRU96MlZHWkxZUzQ3c0tXRnhtRkhHSHVSemppa2ds?=
 =?utf-8?Q?i2uKWiztB+olsbdCGvav6GCnlKJcNWXP2Ykl5ft?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5566.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(366008)(376006)(7416006)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MkJnS1Q0eGdYRml3QTJwQnBDNTBneDdZeHpSbjVhRnUyRHExVzZmb2xTOHda?=
 =?utf-8?B?MlR6bldxemxSYkV6WnM4MHZaY2VuU0Z6cnRTMkFSMk5xVWdxUkdjczZDcFRR?=
 =?utf-8?B?TjJ1cXRTdk55UUYxQkhUWXIwQnhsM3Ewb2dXOXRNRk9nZFUySHFINTNkNGtB?=
 =?utf-8?B?alBQZkFtWDQ0MFZ5UHRYWFFDNWRtSGpON3ZhdFcybmlvR2JXaEZkVTczUkpa?=
 =?utf-8?B?dnphOXNua1FVano1ZTh2TkdaaFMybGloYzhIUFNXTHV1cE4rbU1aYXdtTFBq?=
 =?utf-8?B?c2I2RVgyaFM2YlRGcmlTc3BRTGhqVStINDNjamY4Z0V1Q3k0Snl0Q0R3MStx?=
 =?utf-8?B?VjVvUmVCQlMzTjRGMXlmaXJ2SkVuWVlza0pESnRGQXJPbGlaU1FnZGErNVEw?=
 =?utf-8?B?bVdCVmNObHdkN0tPZ0RQN2d4WEFBaC9jSWtheUhUaE9XVW82dkpGQTlwZU92?=
 =?utf-8?B?WnBIa29OSEZUaXpkSm9maG91d1RYazVYY1RaSWtBRkkyR1EybGRGOXROUWJy?=
 =?utf-8?B?aTZEYzFqdTRSM0tETWtCdGRWQmdJRmxhYVRMMDJ6U2xJSVh1OUlLY1JrYVVO?=
 =?utf-8?B?ditpeEp3aHJxczJaOWhZdEkzR3Q4bm91SncrMTBLRmlXVnpJV3pBbStTT2x1?=
 =?utf-8?B?UnlZOVpFOGV3TjVKVTRkNEpWK3RkTlp2ODVXYTJRNlN0SkFodXhreEVzQTls?=
 =?utf-8?B?ZzEyLzBEdXZ2M013NVRxbXRsdEFsOHYxeHFvOVNhWnFGYXM1eTkwSTBHYUNx?=
 =?utf-8?B?MGhidFUxamI0Rnh1bHpDcm9qWFdPalUzSlJIdHhpdG1zZG9kQlM1MkRqcVFF?=
 =?utf-8?B?SHJuZENRaEl0c3lQak51YVBIdWFVbEhtaEFkb1k4TU5vQnJGTmI4NVYwK1JO?=
 =?utf-8?B?THNwY0EzOHVKQWl0ZmQycTVOZlNJaTJ6a1Zwa2g4cjlTa1FFcUFDcHNHWSsv?=
 =?utf-8?B?VzU5d1Roa3c1ZEhJakJiZmlXNm9FeUtLRkppY201alFoODF5TWt6SzdIM3VX?=
 =?utf-8?B?V2hzK04zaStKaVBlRmNWRVJ3UVhQODk5TEJRRGI2Ukw0TEkvSUw5eStkckI4?=
 =?utf-8?B?dGo4dkU5Y2xDbDgzR1NrWjVjbkZaVTEwaFp6R1BtYTZuRDVmTitPaHI1TzJu?=
 =?utf-8?B?Vlg4NEp4WWJqOUNpa2ZCUUN3dkVyNUZVMUloU0wxVzVkUkRRcTRkQ2VoRTZV?=
 =?utf-8?B?eHF3WlN2dFVhSlVRSDR1K2dJRXo4N2hQaitteGZQMWk0a1pkWVAwZTVMMEpi?=
 =?utf-8?B?UVdOcURkVEc4TEx2LzF1NzZTdGdDYVBkWXlYRWNkRm9GcWJWNWs2b1hGNXA5?=
 =?utf-8?B?YU9wM0c1dS9NM0cvZ3p2RmNpUkVnTHEzc1NyVFlIN3VNcnhmaVY2ZGJoUm9O?=
 =?utf-8?B?OGJlT21mdThsa29nUklsUVY5VUJsYitSL1FrMjc4WDNmbkhSTlV4U09ocW5o?=
 =?utf-8?B?NXhoVzJCakhTS1dTWGgvS2I4dU5LYUgwOGVQait2V0F5N3h6d3dLM3RLZWFl?=
 =?utf-8?B?SVVLbTZjV1ZCRzdDVm1WbTFJTjVLNi9SVE1NdzVjZGs0ZC9icEJiaG9IK1Bl?=
 =?utf-8?B?ZEVwdjFXWkgvOUlaMEMyeDZvR3FITW1XaEpUOVdXaWZDejFNYUd3eSs3N1Q4?=
 =?utf-8?B?TnJ2dU9SVkhOMlVLVkR1WWlVenlGenYrYWNua1BNa04raXo5Z3RKM0xtN0cv?=
 =?utf-8?B?TXJsOTlnSUpzdzBGWXdYSGJRcUNtVWR5d2VCdy9wOHR1SnVIMmpJaWJRWjFt?=
 =?utf-8?B?K0c4allIcVpUNSs4d2pNMklmUlhTREhVMG0ybXkxTTArWlUvd0diT2FXMHY5?=
 =?utf-8?B?K3hDbXhtWXZwL1hreEdBd1I0Zk5GbVJxWHB1WldBNEJlQjFzbDIxanFDcGtC?=
 =?utf-8?B?ckFDRUg0b2hRakpPOEQ3M0JLd0ZKZWRqWG1EbGN0TlF0T2FqVDlKcmUxbnlI?=
 =?utf-8?B?MTlrNXZjQmlqRG95dWZiWmQ2VjlRNTJ6eHZYVWtmR2xkM2E3U3F2VE9RT0RD?=
 =?utf-8?B?MXNCUGFzZU1XNU5nMU5JdTZReXBPT3gyUlN5Qld1c3lUNjhhdGt3Y2xmSVQ4?=
 =?utf-8?B?WEhtUDliOE5FYU5uek5XVU1jZEIrNzhFQTZ5TDlPKzhKek5sZ0RvQVFPZ0Z5?=
 =?utf-8?Q?C5qpxwO3k3NFPDTKfDgXxbk75?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5F405A7BDE3E747A103860E336E9DC3@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5566.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7b1b3a4-99ba-4cf9-22ac-08dc8ad0b6c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 11:13:40.4121
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qqLvK9TrHvA94GD1USJuu3hOj7aKFeJaEmNbXkYcsEsV5KfsRdB3EC4NgJyYuocnNDz0BYrhMj/n5Rb5BSVb0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB7405
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--13.381600-8.000000
X-TMASE-MatchedRID: u8usGLXufdjUL3YCMmnG4uYAh37ZsBDCQV6BZJ9WeFayrCkM9r1bWskU
	hKWc+gwPp2+PpVTz2PH89WDKQGB2LkaWGOeKmQYQFYJUGv4DL3y4vBuE2X0HlWecrqZc3vabMq+
	en+OaNuv0pNNnNZfFBHiAfP7G7VSTrm4HeV3SizK20BbG4zmyXiH8kDR0dp2maOWLD7G8i11sJM
	l68sUgsGLIvwhkzlO6OHMN5an+2gNANJabxsmbMp4CIKY/Hg3AwWulRtvvYxTWRN8STJpl3PoLR
	4+zsDTt+Tf0tcxKuLp0m7f8T+VH5dkViF/dpCHKFo+mtcNNa4z/pL0avBIEig==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--13.381600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	1A220DD2D83BCD4F2F2B748826BB81CB55DB0E3CF6EEBD84A1E243DC8567712A2000:8

SGkgQW5nZWxvLA0KDQpUaGFua3MgZm9yIHlvdXIgcmV2aWV3Lg0KDQpPbiBXZWQsIDIwMjQtMDYt
MTIgYXQgMDk6MDcgKzAyMDAsIEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIHdyb3RlOg0KPiBJ
bCAxMi8wNi8yNCAwMzoyMCwgWmhpIE1hbyBoYSBzY3JpdHRvOg0KPiA+IEFkZCBhIFY0TDIgc3Vi
LWRldmljZSBkcml2ZXIgZm9yIEdpYW50ZWMgR1Q5N3h4IFZDTS4NCj4gPiANCj4gPiBTaWduZWQt
b2ZmLWJ5OiBaaGkgTWFvIDx6aGkubWFvQG1lZGlhdGVrLmNvbT4NCj4gDQo+IEhlbGxvIFpoaSwN
Cj4gDQo+IEkgZmFpbCB0byBzZWUgd2h5IHdvdWxkIHlvdSBuZWVkIHRvIHVwc3RyZWFtIHRoaXMg
bmV3IGRyaXZlciBpbnN0ZWFkDQo+IG9mDQo+IHNpbXBseSBhZGRpbmcgdGhlIElDX0lORk9fUkVH
IHRvIHRoZSBhbHJlYWR5IGV4aXN0aW5nIChhbmQgbW9yZQ0KPiBmZWF0dXJlZnVsKQ0KPiBkdzk3
NjggZHJpdmVyLCB3aGljaCBhbHNvIHNlZW1zIHRvIHN1cHBvcnQgdGhlIEdpYW50ZWMgR1Q5NzY5
IFZDTS4NCj4gDQoNCk91ciBwcm9qZWN0IHVzZXMgR2lhbnRlYyBWQ00gaGFyZHdhcmUuIA0KRm9y
IGRldGFpbGVkIHZlbmRvciBpbmZvcm1hdGlvbiwgcGxlYXNlIHZpc2l0OiAoDQpodHRwczovL2Vu
LmdpYW50ZWMtc2VtaS5jb20veXFtZC8xNjQpLiANClRoZSBWQ00gZGF0YXNoZWV0IHdlIGFyZSBy
ZWZlcmVuY2luZyBpcyBwcm92aWRlZCBieSBHaWFudGVjLiANCkN1cnJlbnRseSwgdGhlIHJlbGF0
aW9uc2hpcCBiZXR3ZWVuIEdpYW50ZWMgVkNNIGFuZCBEb25nd29vbiBWQ00gaXMNCnVuY2xlYXIs
IGJ1dCBEb25nd29vbiBzZWVtcyB0byBiZSBhbm90aGVyIG1hbnVmYWN0dXJlciBvZiBWQ00NCmhh
cmR3YXJlLiANCg0KRnJvbSB0aGUgcGVyc3BlY3RpdmUgb2Ygc29mdHdhcmUgZHJpdmVyIGRldmVs
b3BtZW50IGFuZCBtYWludGVuYW5jZSwgaXQNCm1ha2VzIHNlbnNlIGZvciBlYWNoIHZlbmRvcidz
IGhhcmR3YXJlIHNob3VsZCBoYXZlIGl0cyBvd24gc29mdHdhcmUNCmRyaXZlci4NClNvLCBJIHVw
c3RyZWFtIGEgbmV3IFZDTSBkcml2ZXIgZm9yIEdpYW50ZWMuDQoNCj4gQ2hlZXJzLA0KPiBBbmdl
bG8NCj4gDQo+ID4gDQo+IA0KPiANCg==

