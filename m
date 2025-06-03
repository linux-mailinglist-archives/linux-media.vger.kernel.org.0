Return-Path: <linux-media+bounces-33963-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3706CACBEE2
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 05:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB91F16F66D
	for <lists+linux-media@lfdr.de>; Tue,  3 Jun 2025 03:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2113918E377;
	Tue,  3 Jun 2025 03:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IQrBgCID";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="QqfQyDCE"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B0D2F32;
	Tue,  3 Jun 2025 03:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748921641; cv=fail; b=nEvHpt8KqFS1LVvq5R3KFdo4Ie3C7zhi+h4lnfZ2p0ouaHqStJ6Tj1Q5l4JPmTFB41v+O+2Lj8LrczQZVAqM+lBi7M065bwZQdZUeC4lVmnvKSkvNZOJY7kQHCF/b1bEE//IGSTmqtVAFTc9C7TdeHWT7lb5gev81QfK5j49f4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748921641; c=relaxed/simple;
	bh=493M1G9zpkD+sIRTEsOxIU9pyeR0wdpqym8vRimU4B0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uegAgd1M6rtavVuRRdX3EaX7fEuN5u77jw6u+btPtm19bdICx6tGWfk9SOLv6WfsrAc9DeQlZ9r33pbUiinAGidF8DibYjanI1VAZhDL4UwEl8tjJieZmoiKb5pkYOjqIJAJYbIj3HtT+SbACzR3Z53Pyg3JLiaknkrXpU6Crk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=IQrBgCID; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=QqfQyDCE; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 8ea7f468402b11f0813e4fe1310efc19-20250603
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=493M1G9zpkD+sIRTEsOxIU9pyeR0wdpqym8vRimU4B0=;
	b=IQrBgCIDttTUQixZReA1JJca2NI7QibcbC+p2CYt+JcgRt4KStkPQZk+YltUPUWYU+6URZpR1wXMle3MZYarq0hX4FQFlGu2qTIdVfWDbBBHeofw935ZzDy8iS00dtoNCNqETtXaQ+/Jdsv3xkTsQnMFHACzobOT7EPrLGdLHqw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:ef3fddfd-9310-400a-bd46-7e0bfd6ae4b8,IP:0,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:14a86459-eac4-4b21-88a4-d582445d304a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111,TC:nil,Conte
	nt:0|50,EDM:-3,IP:nil,URL:80|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 8ea7f468402b11f0813e4fe1310efc19-20250603
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <irui.wang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 20855602; Tue, 03 Jun 2025 11:33:46 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 3 Jun 2025 11:33:45 +0800
Received: from TYDPR03CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 3 Jun 2025 11:33:42 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkEYsPpKDM7tVwy6o5Y0fjbjob4db0/d2wiFsibSeUrR3eE2k712/DGiVBuIgg6yn0T8/CSU/qvud6InC5uhG5mwf/wr3brF9e4rPV+XnXUw6RST99DstyQm5tZoSObGugk4h5Z8wlqKww/JB2ykbsEw6GeFZaY/6WTNGH0disHv5HOLOTe4+Z2prsC+LT7VXZ9bC3HplkcQJjnDTKMxbJLvK5AA2DP/FuFtuc6OXm8rjJdrzALLKQtE7CnRPHwy+6Vt531f1v6FJBlA9AEhdjVmLDV64MP9OkWS/8OdfzZWsEJr6TYCXlGW8otNqJrdYBwQEJiNzV6NLFri4vZc4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=493M1G9zpkD+sIRTEsOxIU9pyeR0wdpqym8vRimU4B0=;
 b=QUj+Hf/HHv6vFSGIiVvdRMqWuRVoBuPZV30l073Wm9WGSgqkjj/vjFVfKjnR4ffkUgoGK4ty/ogWHx1k9B3NE8CmekKf+bBoQSglnovCV/Bz50vSsPzLPtZb49tGLsQMoJx9Bbzix6OJdoNV2u2IUKbpVuIWACKSzy2zyxGWgAYxENDPC3b9cBfbpqgaiQEv1G8tx7gdFswrMAxfeG2o2n49Cj6kdaDpZRTueliJJdJER4nlUkBNlsqZzF2+RJgRN7uJZg46vkqXJ9zDFDvucXYZNUHNIbDlK9njreFOnnTW+eiJIp1UEDorWA7hKM42L2/AxwXGEeiFFJMx9Vxgqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=493M1G9zpkD+sIRTEsOxIU9pyeR0wdpqym8vRimU4B0=;
 b=QqfQyDCEAA6leQGDr4PKT1d3xIXbvjTlNMLhBQop+/fUp80y1bAkJh8eNJ1consz/1gt3uEKCgBzs3mBLXOViP33fdYfsiGxHmBPEgXrfzRhhX5F6pWCYW7ecYwBwL/X2kJDC/2z1ZEHQVTbTo6mvrUfIUWPWisJAmyrdaL+gPg=
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com (2603:1096:101:187::6)
 by SEZPR03MB7248.apcprd03.prod.outlook.com (2603:1096:101:9e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 03:33:42 +0000
Received: from SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::ee7a:da9c:2ea4:50d3]) by SEZPR03MB7947.apcprd03.prod.outlook.com
 ([fe80::ee7a:da9c:2ea4:50d3%4]) with mapi id 15.20.8769.029; Tue, 3 Jun 2025
 03:33:42 +0000
From: =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "wenst@chromium.org"
	<wenst@chromium.org>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?TG9uZ2ZlaSBXYW5nICjnjovpvpnpo54p?= <Longfei.Wang@mediatek.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	Project_Global_Chrome_Upstream_Group
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 0/6] Add support for MT8196 video encoder
Thread-Topic: [PATCH v2 0/6] Add support for MT8196 video encoder
Thread-Index: AQHbz5sDr9gwpSN4ukij+r410u2iJLPrQnsAgAWO5wA=
Date: Tue, 3 Jun 2025 03:33:42 +0000
Message-ID: <5b7db0c0a766b77eb62318d212ce675bebce5d53.camel@mediatek.com>
References: <20250528063633.14054-1-irui.wang@mediatek.com>
	 <7a372c544c370d64b916a7092aabac555710d7c5.camel@collabora.com>
In-Reply-To: <7a372c544c370d64b916a7092aabac555710d7c5.camel@collabora.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEZPR03MB7947:EE_|SEZPR03MB7248:EE_
x-ms-office365-filtering-correlation-id: cebca0ee-e4c9-4a1b-14b0-08dda24f7020
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U3BzUHgvbVdPU2N5UGg0dVA5TSsrSkN3RGFFc0x0MzRYMVVDbDQ0OURPblk1?=
 =?utf-8?B?bmdhcXZkNWVIUm45NVRNUndxbEZvTERTckhuTGVQbVRaT3I0TmJIWlpFU3Y1?=
 =?utf-8?B?UURMUzhDSmswTitKQ25SdW1TQXF5Qml2dTdLbnFMODJnUWlmWTQ0QjNMcW9N?=
 =?utf-8?B?a2E5cFNLN0Jtd1JHTjBSSk0wc1FGYUlYMDBRQTZFcmtmTldNd0lwTDBZejg1?=
 =?utf-8?B?Z2ZSSjZXZ0lhTTdGVm1meURRKzZPVXhVQkpsTS9Ha0x6enErMkNsM3ErNGVK?=
 =?utf-8?B?NXdzd2ZCSlNIMTRPWjVzWlJkZWFZRlFrK050aTZVOStLV00vQmUwUHRabWxX?=
 =?utf-8?B?SnVaYlhMdk51QUdwbW1teEJhUllIZFZhbFo3Z2N5L1ByN0RQc3FiM2ZwWlVK?=
 =?utf-8?B?UEd0R0JBbHFKZGtQTzFjbk5GWXpVSDR2VFNncW5OSjJibkMvZ2lhZlJXMmhJ?=
 =?utf-8?B?RWZJdnZrK2xBU0UrZ21wSkxVNG9VQ2dTN3lwUnd0T1Z3QU1xeTlieU0wU0VI?=
 =?utf-8?B?NGxjOFhiK1BLVEN4N1R0cVZhZDI2VERsQ0NRbWZmalBlMHlPVFBCUEpYNVBN?=
 =?utf-8?B?UE9OcDN5Z1lmc2x5Witwd0pjMUpHV0x0SHhUT0RyQTBnb2lHUE9NU3RHUU5w?=
 =?utf-8?B?U2VLZ1ZNQU5ZMk01YjA3TVZqWVMwK25XUFBheGhWUEFlUUVlT1UrdjVPUHZG?=
 =?utf-8?B?cFk2UlppVHlYSURLRVk5SDN5RmZZNXBvd2NuT2hISzl4TXd4SlJ5NWNPc3RX?=
 =?utf-8?B?NzlDTDZsaFU5WjRpTEVITU9jck8yK2JzRTNaQmdITlUzQTVhSGs4Z1BncXow?=
 =?utf-8?B?VHZURE1ZSEk3L0hKYUR6WnFKQWJFUDVzTWZTaTA2Z3dyVEtRMTNkb2RnQWgz?=
 =?utf-8?B?OGJPMTJueThqNGdDUkVVbXdVSUV3a0hZM2d4YmgyS0xrNHo3RU94WFIyRXBm?=
 =?utf-8?B?emkvTVgzcFQ5N29CaW1IUU9pd3pENkYvYmdhSEpTTXdBNGZQUWZDaUtVQzNh?=
 =?utf-8?B?d0J0NlVYSEhFMHN5dmZ1RHYrcTJSQ2JzT093K0NJL3VpVG9ZT2tkUTNSSXMw?=
 =?utf-8?B?dk9Ia2xRUVh5UUhocVdwLzRrUGhpN3BoSTByMjNTWlRBMWpLNDBtNWNoYnF2?=
 =?utf-8?B?c3M5dm1zd1VwU1JjV0FuQ0lQSnVTdmFSK250dHVsQUVEQzB0UGlGQ2JHeWk4?=
 =?utf-8?B?MjBmeElvN3kwYVV4TlljcDhiZ1E0SUVVSkxqZW5jTFhRK0JsZ2FZbTNWZm5P?=
 =?utf-8?B?anBZN1JRNWhWQUwzbGQwT3hnZkdiK1NZRHpTS3h1ekJOdllXRlBDK2R2VWFJ?=
 =?utf-8?B?MFpiTTByeWxPS0JKV0cxRjRackp5RzlFY0FGaXBCVzh5ZkZmd01peXV4Q1Iw?=
 =?utf-8?B?QkM2aUVnZHkwLzY2TmVJQTZCdFlrTnFIbUpWdUQreVlpcG9TWFJsTVZoMmc0?=
 =?utf-8?B?OU13NlVkOGF5YXNtMFlUUXM2R1k4c2FDQnFsSHhrUnZyM2t2WmRtcEk4ZEJW?=
 =?utf-8?B?Tk1CVk9HcTllNWhxSEI2M3pOYVdRYU5XbnQxaWsvdkYrYVpoVjVUM01nb3JS?=
 =?utf-8?B?UG9QaktTTFlxUlFFTW96ODB0S0ZMR3BqSVEza1BsZ2FHNVl3REtaTnQ0RGZY?=
 =?utf-8?B?NjJLUVBCMFo4NXBWVDZTWUJWVXFkMHlTUkgvSG4yOHBMTG5zMmd2MG40SnhC?=
 =?utf-8?B?NVdmcUt2Zk5la0dPdEdiS1E2RUZXTmVJdGxwRDF4SHA5OGtwZkFLb3FpU3Z2?=
 =?utf-8?B?bE10dXRDVytoVC9CbytEQlFud1NENjVpNDdtMG9Db1d6d2NxVDZFTlc3SWw4?=
 =?utf-8?B?NHhaZVRWVko4elRvVTZnZi9lVDVDclFOc0JBSzgvMTU5TWxyWUpPM1dMNUxm?=
 =?utf-8?B?b3pjZzhQb1FJSjgyTWFubHExWS9HckJFRVExMlBjbHJxQU1SWC9aYlVFVlVE?=
 =?utf-8?Q?6HKuMquLLhk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7947.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFdabEg1dXY1T2VRQ0U3akNWeVBENWs2RUdLZUZzbXQ0cHpQK0tLQ2xsVi90?=
 =?utf-8?B?YVNsczRTaFl6aWNwM2VtbkVsZmZza0pPcFVoajlsMjlKUGsvL1FjQk1GaVVD?=
 =?utf-8?B?bk1URVhxQmxPeHdnc3lvM3ltQnE1cDU0dkxXdVpzaXVXamRzalJRQUNKdGM3?=
 =?utf-8?B?YStkYkFiRHgxRW9aVU9tOGdyUi9CZjlEUUZSZXFwbmRXenQ2cm90SFVJZTgr?=
 =?utf-8?B?VENkMUNiSDlhNUNhVHozMldRNHpkUkxiWVVSOEZCOFJ2ZDBpd3BRczVJcTM4?=
 =?utf-8?B?SXo2elJ5ZUhLOWQxVkg3SGMxcEM5WlArWE5RK2QzZjJkZ1RBREtDdWwxVEIr?=
 =?utf-8?B?OU9iUUo5NlB3T1RMYTVvREd6KzRpbHY0RTBpSUE5YWI2b3VVT0kzVU15RHha?=
 =?utf-8?B?ZGlBZENrdGJwVGlvRC9sdmMvS3V3M0s2aVp0TFVkYjFTemdOclU0dEVHMDQw?=
 =?utf-8?B?RG5kNnlVRklsc0U3UnNieGRFYjR3M3BXbndlVWtRUEVIMjhHL0hKTmdJQ1dR?=
 =?utf-8?B?UDd3NktCaFBEaFVnSnRaRUhXUVZidkprcW5uUXB2NmdLNTUvMVFZYUJPSzA0?=
 =?utf-8?B?V1ZrUForakVERjJqdXpienQxc1FndVpMVVdiMis4NHREaU9RN0twVXpJVmZp?=
 =?utf-8?B?eWdpaFhpbE1oOW5UZW9YQXdxRDY2TTUvQXZ1NERiOHlaNEVxTHJvY2Z2Ykp6?=
 =?utf-8?B?em5WQ0djdjNhRHRIT1JYelF4YUFITlJqc3RhZTVVczhMODdEN1lYQ2pGcmRS?=
 =?utf-8?B?L20rSGdiZjZRanlGai90MldKYXo5aWpGWlBYbW11WlR6VkM4NEwra0lka09o?=
 =?utf-8?B?ZGdFbW5JV2NYZmJyb0Uyd3QxVHA5K3ZIMXEvOHBONXAyRStUbGxSNU1Xc05X?=
 =?utf-8?B?TDJmdlF3RmZzRlU2QmcrQWxvSEJoWDVVeUlnTkhpaG91bjl6QkVYeVgweTdO?=
 =?utf-8?B?TzJVRm5ySmpxY0p4WTMrSkFWbWR0U1NBekREZWljNEZWM1RROWczd0w2NDB5?=
 =?utf-8?B?emJIaVBFVzkyeUVVQ0kzY3ZuTSt4aDdKS3ZKUnBGcUFuR21qN2J4ZSt5R3NQ?=
 =?utf-8?B?ZXJRWkg1WWV6TWFkMW01ZDlZMUxHZ2tKamNPK0xJeklqWWlFM3ZyR0htWE9z?=
 =?utf-8?B?SjNDbVNYUkxyMEQyVG1CcVlkcVRYUG5UM1RxY2VNK05URysvaDhYZVVQYzNE?=
 =?utf-8?B?T05XWkxGRG1PSU8yYlZvRytJdXkvTDBYcHBDNWhiazdTZGxyZzRSREFQL2Ro?=
 =?utf-8?B?NU1rbmc5Z1FqeVVxaE5QNmdCeXhscitrUXNpLzIzUjUwTi93bzlYcEk2QnM0?=
 =?utf-8?B?cjk0VG45NHI0dTRUeDlXRk4vZkVYOTZYbU5rd0VOckUrQ1cyWEZCMDlUaFo5?=
 =?utf-8?B?aUN6eG5kRWxjN3RRV1lLZmtIalVCcDRRZWZqTFRFNitoaCtjNEJONjR0K1po?=
 =?utf-8?B?VVVQUDhDaFBXVXRHc0pOQzJsNG02eis4Z21aOHN4S2JNUWVMUmZXNS9JUmo3?=
 =?utf-8?B?M0FFV05YNTQ1RW80K3ZaN0lSSkJKUndvZUk3UTBXcTFaSzRmaU1iZDRSMlI1?=
 =?utf-8?B?TERTaVhlT3AyTUxsaG9CbDk4MmxUdndJMFZ5RWV0dDVxd1NpTFhlbTBkeTRp?=
 =?utf-8?B?cW9Lays3aWQzUWQrNm42RytUM01ycDZHSFdtSm5jVTJBM0xjc1Vja0dPYWFN?=
 =?utf-8?B?TmY5bXRKbGtqdnB0WjNVaHN3elUrcWtiVHlOYldPRGN0Rlg4UlpMemdpbnVz?=
 =?utf-8?B?MXlhcGtRM3NKTTVISXZTWjNUL05IaEE0SXFuTlhRWUczWk05RHpoYnZRN2xC?=
 =?utf-8?B?T29Nd1Q5MG9UM1lVZnBPbHFtMjc3YktWRjNaaFhRUnNZZmlETlZTTHYyRDNS?=
 =?utf-8?B?ditibW5iakhTU0lZMnVqYllQeGdBYWkrSG04RW03S1hUSjV3cUkycHYzQ2Ri?=
 =?utf-8?B?bEFhUW1ReDEvYlZSeXo5L1cxemh1RVEzMXplWGpyOFZRV0tJeElhOW9MeTZx?=
 =?utf-8?B?TXBYUHpWYThJakNuTm1NZE56ZEdiNGgwaTc2R0t5WHdHckl4NFM0c2tiMHdM?=
 =?utf-8?B?U05TNVRkMnVhd1RMdHN0T3o5TTVEb0NwOXZSQmJLa1lLQVljTXBSOW81MEdj?=
 =?utf-8?Q?Ac640cwSZPjRw5NWIaSxQdQ32?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <916486C1BD49AE48A26634F7FD30EDB9@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7947.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cebca0ee-e4c9-4a1b-14b0-08dda24f7020
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 03:33:42.3459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SDIcWtnbD92FQEJFetYsmafQLQ5c9WBy4+m4YJk55Z2PL7aKpvaVMbzKJ+jjHkNYs6pv/iNNKfAjjRgy/xxPCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7248

RGVhciBOaWNvbGFzLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmVwbHkuDQoNCnRoZSBmYWlsZWQg
Y2FzZSBpcyBWSURJT0NfKFVOKVNVQlNDUklCRV9FVkVOVA0KDQogICAgICAgICAgICAgICAgZmFp
bDogdjRsMi10ZXN0LWNvbnRyb2xzLmNwcCgxMTcxKTogbm9kZS0+Y29kZWNfbWFzayAmDQpTVEFU
RUZVTF9FTkNPREVSDQogICAgICAgIHRlc3QgVklESU9DXyhVTilTVUJTQ1JJQkVfRVZFTlQvRFFF
VkVOVDogRkFJTA0KDQpiZWNhdXNlIGVuY29kZXIgZHJpdmVyIGlzIG5vdCByZWdpc3RlciB2NGwy
X2lvY3RsX29wcw0KLnZpZGlvY18odW4pc3Vic2NyaWJlX2V2ZW50DQoNCg0KVGhlIGZ1bGwgcmVw
b3J0IGlzIGJlbG93Og0KDQp2NGwyLWNvbXBsaWFuY2UgLWQgL2Rldi92aWRlbzMNCnY0bDItY29t
cGxpYW5jZSAxLjI4LjEsIDY0IGJpdHMsIDY0LWJpdCB0aW1lX3QNCg0KQ29tcGxpYW5jZSB0ZXN0
IGZvciBtdGstdmNvZGVjLWVuYyBkZXZpY2UgL2Rldi92aWRlbzM6DQoNCkRyaXZlciBJbmZvOg0K
ICAgICAgICBEcml2ZXIgbmFtZSAgICAgIDogbXRrLXZjb2RlYy1lbmMNCiAgICAgICAgQ2FyZCB0
eXBlICAgICAgICA6IE1UODE5NiB2aWRlbyBlbmNvZGVyDQogICAgICAgIEJ1cyBpbmZvICAgICAg
ICAgOiBwbGF0Zm9ybTozODAyMDAwMC52aWRlby1jb2RlYw0KICAgICAgICBEcml2ZXIgdmVyc2lv
biAgIDogNi42Ljc2DQogICAgICAgIENhcGFiaWxpdGllcyAgICAgOiAweDg0MjA0MDAwDQogICAg
ICAgICAgICAgICAgVmlkZW8gTWVtb3J5LXRvLU1lbW9yeSBNdWx0aXBsYW5hcg0KICAgICAgICAg
ICAgICAgIFN0cmVhbWluZw0KICAgICAgICAgICAgICAgIEV4dGVuZGVkIFBpeCBGb3JtYXQNCiAg
ICAgICAgICAgICAgICBEZXZpY2UgQ2FwYWJpbGl0aWVzDQogICAgICAgIERldmljZSBDYXBzICAg
ICAgOiAweDA0MjA0MDAwDQogICAgICAgICAgICAgICAgVmlkZW8gTWVtb3J5LXRvLU1lbW9yeSBN
dWx0aXBsYW5hcg0KICAgICAgICAgICAgICAgIFN0cmVhbWluZw0KICAgICAgICAgICAgICAgIEV4
dGVuZGVkIFBpeCBGb3JtYXQNCiAgICAgICAgRGV0ZWN0ZWQgU3RhdGVmdWwgRW5jb2Rlcg0KDQpS
ZXF1aXJlZCBpb2N0bHM6DQogICAgICAgIHRlc3QgVklESU9DX1FVRVJZQ0FQOiBPSw0KICAgICAg
ICB0ZXN0IGludmFsaWQgaW9jdGxzOiBPSw0KDQpBbGxvdyBmb3IgbXVsdGlwbGUgb3BlbnM6DQog
ICAgICAgIHRlc3Qgc2Vjb25kIC9kZXYvdmlkZW8zIG9wZW46IE9LDQogICAgICAgIHRlc3QgVklE
SU9DX1FVRVJZQ0FQOiBPSw0KICAgICAgICB0ZXN0IFZJRElPQ19HL1NfUFJJT1JJVFk6IE9LDQog
ICAgICAgIHRlc3QgZm9yIHVubGltaXRlZCBvcGVuczogT0sNCg0KRGVidWcgaW9jdGxzOg0KICAg
ICAgICB0ZXN0IFZJRElPQ19EQkdfRy9TX1JFR0lTVEVSOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAg
ICAgICAgdGVzdCBWSURJT0NfTE9HX1NUQVRVUzogT0sgKE5vdCBTdXBwb3J0ZWQpDQoNCklucHV0
IGlvY3RsczoNCiAgICAgICAgdGVzdCBWSURJT0NfRy9TX1RVTkVSL0VOVU1fRlJFUV9CQU5EUzog
T0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAgIHRlc3QgVklESU9DX0cvU19GUkVRVUVOQ1k6IE9L
IChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJRElPQ19TX0hXX0ZSRVFfU0VFSzogT0sg
KE5vdCBTdXBwb3J0ZWQpDQogICAgICAgIHRlc3QgVklESU9DX0VOVU1BVURJTzogT0sgKE5vdCBT
dXBwb3J0ZWQpDQogICAgICAgIHRlc3QgVklESU9DX0cvUy9FTlVNSU5QVVQ6IE9LIChOb3QgU3Vw
cG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJRElPQ19HL1NfQVVESU86IE9LIChOb3QgU3VwcG9ydGVk
KQ0KICAgICAgICBJbnB1dHM6IDAgQXVkaW8gSW5wdXRzOiAwIFR1bmVyczogMA0KDQpPdXRwdXQg
aW9jdGxzOg0KICAgICAgICB0ZXN0IFZJRElPQ19HL1NfTU9EVUxBVE9SOiBPSyAoTm90IFN1cHBv
cnRlZCkNCiAgICAgICAgdGVzdCBWSURJT0NfRy9TX0ZSRVFVRU5DWTogT0sgKE5vdCBTdXBwb3J0
ZWQpDQogICAgICAgIHRlc3QgVklESU9DX0VOVU1BVURPVVQ6IE9LIChOb3QgU3VwcG9ydGVkKQ0K
ICAgICAgICB0ZXN0IFZJRElPQ19HL1MvRU5VTU9VVFBVVDogT0sgKE5vdCBTdXBwb3J0ZWQpDQog
ICAgICAgIHRlc3QgVklESU9DX0cvU19BVURPVVQ6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAg
ICBPdXRwdXRzOiAwIEF1ZGlvIE91dHB1dHM6IDAgTW9kdWxhdG9yczogMA0KDQpJbnB1dC9PdXRw
dXQgY29uZmlndXJhdGlvbiBpb2N0bHM6DQogICAgICAgIHRlc3QgVklESU9DX0VOVU0vRy9TL1FV
RVJZX1NURDogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAgIHRlc3QgVklESU9DX0VOVU0vRy9T
L1FVRVJZX0RWX1RJTUlOR1M6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJRElP
Q19EVl9USU1JTkdTX0NBUDogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAgIHRlc3QgVklESU9D
X0cvU19FRElEOiBPSyAoTm90IFN1cHBvcnRlZCkNCkNvbnRyb2wgaW9jdGxzOg0KICAgICAgICB0
ZXN0IFZJRElPQ19RVUVSWV9FWFRfQ1RSTC9RVUVSWU1FTlU6IE9LDQogICAgICAgIHRlc3QgVklE
SU9DX1FVRVJZQ1RSTDogT0sNCiAgICAgICAgdGVzdCBWSURJT0NfRy9TX0NUUkw6IE9LDQogICAg
ICAgIHRlc3QgVklESU9DX0cvUy9UUllfRVhUX0NUUkxTOiBPSw0KICAgICAgICAgICAgICAgIGZh
aWw6IHY0bDItdGVzdC1jb250cm9scy5jcHAoMTE3MSk6IG5vZGUtPmNvZGVjX21hc2sgJg0KU1RB
VEVGVUxfRU5DT0RFUg0KICAgICAgICB0ZXN0IFZJRElPQ18oVU4pU1VCU0NSSUJFX0VWRU5UL0RR
RVZFTlQ6IEZBSUwNCiAgICAgICAgdGVzdCBWSURJT0NfRy9TX0pQRUdDT01QOiBPSyAoTm90IFN1
cHBvcnRlZCkNCiAgICAgICAgU3RhbmRhcmQgQ29udHJvbHM6IDE2IFByaXZhdGUgQ29udHJvbHM6
IDANCg0KRm9ybWF0IGlvY3RsczoNCiAgICAgICAgdGVzdCBWSURJT0NfRU5VTV9GTVQvRlJBTUVT
SVpFUy9GUkFNRUlOVEVSVkFMUzogT0sNCiAgICAgICAgdGVzdCBWSURJT0NfRy9TX1BBUk06IE9L
DQogICAgICAgIHRlc3QgVklESU9DX0dfRkJVRjogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAg
IHRlc3QgVklESU9DX0dfRk1UOiBPSw0KICAgICAgICB0ZXN0IFZJRElPQ19UUllfRk1UOiBPSw0K
ICAgICAgICB0ZXN0IFZJRElPQ19TX0ZNVDogT0sNCiAgICAgICAgdGVzdCBWSURJT0NfR19TTElD
RURfVkJJX0NBUDogT0sgKE5vdCBTdXBwb3J0ZWQpDQogICAgICAgIHRlc3QgQ3JvcHBpbmc6IE9L
DQogICAgICAgIHRlc3QgQ29tcG9zaW5nOiBPSyAoTm90IFN1cHBvcnRlZCkNCiAgICAgICAgdGVz
dCBTY2FsaW5nOiBPSyAoTm90IFN1cHBvcnRlZCkNCg0KQ29kZWMgaW9jdGxzOg0KICAgICAgICB0
ZXN0IFZJRElPQ18oVFJZXylFTkNPREVSX0NNRDogT0sNCiAgICAgICAgdGVzdCBWSURJT0NfR19F
TkNfSU5ERVg6IE9LIChOb3QgU3VwcG9ydGVkKQ0KICAgICAgICB0ZXN0IFZJRElPQ18oVFJZXylE
RUNPREVSX0NNRDogT0sgKE5vdCBTdXBwb3J0ZWQpDQoNCkJ1ZmZlciBpb2N0bHM6DQogICAgICAg
IHRlc3QgVklESU9DX1JFUUJVRlMvQ1JFQVRFX0JVRlMvUVVFUllCVUY6IE9LDQogICAgICAgIHRl
c3QgQ1JFQVRFX0JVRlMgbWF4aW11bSBidWZmZXJzOiBPSw0KICAgICAgICB0ZXN0IFZJRElPQ19S
RU1PVkVfQlVGUzogT0sNCiAgICAgICAgdGVzdCBWSURJT0NfRVhQQlVGOiBPSw0KICAgICAgICB0
ZXN0IFJlcXVlc3RzOiBPSyAoTm90IFN1cHBvcnRlZCkNCg0KVG90YWwgZm9yIG10ay12Y29kZWMt
ZW5jIGRldmljZSAvZGV2L3ZpZGVvMzogNDcsIFN1Y2NlZWRlZDogNDYsIEZhaWxlZDoNCjEsIFdh
cm5pbmdzOjANCg0KT24gRnJpLCAyMDI1LTA1LTMwIGF0IDEwOjQwIC0wNDAwLCBOaWNvbGFzIER1
ZnJlc25lIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlu
a3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbA0KPiB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2Vu
ZGVyIG9yIHRoZSBjb250ZW50Lg0KPiANCj4gDQo+IEhpLA0KPiANCj4gTGUgbWVyY3JlZGkgMjgg
bWFpIDIwMjUgw6AgMTQ6MzYgKzA4MDAsIElydWkgV2FuZyBhIMOpY3JpdCA6DQo+ID4gVGhpcyBw
YXRjaCBzZXJpZXMgYWRkIHN1cHBvcnQgZm9yIE1UODE5NiB2aWRlbyBlbmNvZGVyLg0KPiA+IHBh
dGNoIDF+MzogQWRkIGEgbmV3IGVuY29kZXIgZHJpdmVyIGludGVyZmFjZSBmb3IgbmV3IFZDUCBm
aXJtd2FyZS4NCj4gPiBwYXRjaCA0fjY6IEFkZCBNVDgxOTYgZW5jb2RlciBkcml2ZXIgcGxhdGZv
cm0gZGF0YS4NCj4gPiANCj4gPiBBYm91dCBhZGRpbmcgbmV3IGRyaXZlciBzdXBwb3J0LCB0aGUg
djRsMi1jb21wbGlhbmNlIHJlcG9ydCBzaG93czoNCj4gPiAiVG90YWwgZm9yIG10ay12Y29kZWMt
ZW5jIGRldmljZSAvZGV2L3ZpZGVvMzogNDcsIFN1Y2NlZWRlZDogNDYsDQo+ID4gRmFpbGVkOiAx
LCBXYXJuaW5nczogMCINCj4gPiBUaGUgMSBGYWlsZWQgY2FzZSBpcyBub3QgY2F1c2VkIGJ5IGN1
cnJlbnQgcGF0Y2ggc2V0Lg0KPiANCj4gV2UgcmVhbGx5IHdhbnQgdG8gc2VlIHRoZSBmdWxsIHJl
cG9ydCwgc2ltcGx5IHJlcGx5IHRvIHRoaXMgY292ZXINCj4gbGV0dGVyIHdpdGgNCj4gdGhlIGVu
dGlyZSByZXBvcnQgdG8gZml4IGl0Lg0KPiANCj4gTmljb2xhcw0KPiANCj4gPiANCj4gPiBUaGlz
IHBhdGNoIHNldCBkZXBlbmRzIG9uICJtZWRpYTogbWVkaWF0ZWs6IHZjb2RlYzogc3VwcG9ydCB2
aWRlbw0KPiA+IGRlY29kZXIgaW4gbXQ4MTk2IlsxXQ0KPiA+IA0KPiA+IFsxXSANCj4gPiBodHRw
czovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsubGludXh0di5vcmcvcHJv
amVjdC9saW51eC1tZWRpYS9saXN0Lz9zZXJpZXM9MTUyMzJfXzshIUNUUk5LQTl3TWcwQVJidyFu
ZTIwMDJJUmpoZjZFS2doQ28tYlNxX2QtUF9GTk50TlpibFExQkhOSnZ2UmVqZW5YVGJYMnh2Wk5H
OTNHeUZXSFNkeWRXXzNlazlNXzhrSFU0QklfWmhUaW9meVdrUSQNCj4gPiANCj4gPiBDaGFuZ2Ug
aW4gdjI6DQo+ID4gIC0gQWRkIHN1cHBvcnQgZm9yIFZDUCBlbmNvZGUgcHJvY2Vzcy4NCj4gPiAg
LSBBZGQgTVQ4MTk2IGVuY29kZXIgZHJpdmVyIHBsYXRmb3JtIGRhdGEuDQo+ID4gIC0gUmViYXNl
IGVuY29kZXIgcGF0Y2ggb250byBkZWNvZGVyJ3MgcGF0Y2ggc2V0Lg0KPiA+ICAtIEZpeCBzb21l
IHJldmlldyBjb21tZW50cyBpbiB2MS4NCj4gPiANCj4gPiBJcnVpIFdhbmcgKDYpOg0KPiA+ICAg
bWVkaWE6IG1lZGlhdGVrOiBlbmNvZGVyOiBBZGQgYSBuZXcgZW5jb2RlciBkcml2ZXIgaW50ZXJm
YWNlDQo+ID4gICBtZWRpYTogbWVkaWF0ZWs6IGVuY29kZXI6IEFkZCBzdXBwb3J0IGZvciBjb21t
b24gZmlybXdhcmUNCj4gPiBpbnRlcmZhY2UNCj4gPiAgIG1lZGlhOiBtZWRpYXRlazogZW5jb2Rl
cjogQWRkIHN1cHBvcnQgZm9yIFZDUCBlbmNvZGUgcHJvY2Vzcw0KPiA+ICAgbWVkaWE6IG1lZGlh
dGVrOiBlbmNvZGVyOiBBZGQgYSBuZXcgcGxhdGZvcm0gZGF0YSBtZW1iZXINCj4gPiAgIGR0LWJp
bmRpbmdzOiBtZWRpYTogbWVkaWF0ZWs6IGVuY29kZXI6IEFkZCBlbmNvZGVyIGR0LWJpbmRpbmdz
DQo+ID4gZm9yDQo+ID4gICAgIE1UODE5Ng0KPiA+ICAgbWVkaWE6IG1lZGlhdGVrOiBlbmNvZGVy
OiBBZGQgTVQ4MTk2IGVuY29kZXIgY29tcGF0aWJsZSBkYXRhDQo+ID4gDQo+ID4gIC4uLi9tZWRp
YS9tZWRpYXRlayx2Y29kZWMtZW5jb2Rlci55YW1sICAgICAgICB8ICAxMiArDQo+ID4gIC4uLi9t
ZWRpYXRlay92Y29kZWMvY29tbW9uL210a192Y29kZWNfZncuYyAgICB8ICAxOSArDQo+ID4gIC4u
Li9tZWRpYXRlay92Y29kZWMvY29tbW9uL210a192Y29kZWNfZncuaCAgICB8ICAgMiArDQo+ID4g
IC4uLi92Y29kZWMvY29tbW9uL210a192Y29kZWNfZndfcHJpdi5oICAgICAgICB8ICAgMSArDQo+
ID4gIC4uLi92Y29kZWMvY29tbW9uL210a192Y29kZWNfZndfdmNwLmMgICAgICAgICB8ICAgNiAr
DQo+ID4gIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay92Y29kZWMvZW5jb2Rlci9NYWtlZmlsZSB8ICAg
MSArDQo+ID4gIC4uLi9tZWRpYXRlay92Y29kZWMvZW5jb2Rlci9tdGtfdmNvZGVjX2VuYy5jICB8
ICAzNyArLQ0KPiA+ICAuLi4vdmNvZGVjL2VuY29kZXIvbXRrX3Zjb2RlY19lbmNfZHJ2LmMgICAg
ICAgfCAgMjggKw0KPiA+ICAuLi4vdmNvZGVjL2VuY29kZXIvbXRrX3Zjb2RlY19lbmNfZHJ2Lmgg
ICAgICAgfCAgMTUgKy0NCj4gPiAgLi4uL3Zjb2RlYy9lbmNvZGVyL3ZlbmMvdmVuY19jb21tb25f
aWYuYyAgICAgIHwgNjc4DQo+ID4gKysrKysrKysrKysrKysrKysrDQo+ID4gIC4uLi92Y29kZWMv
ZW5jb2Rlci92ZW5jL3ZlbmNfaDI2NF9pZi5jICAgICAgICB8ICAgOCArLQ0KPiA+ICAuLi4vbWVk
aWF0ZWsvdmNvZGVjL2VuY29kZXIvdmVuY19kcnZfaWYuYyAgICAgfCAgIDMgKy0NCj4gPiAgLi4u
L21lZGlhdGVrL3Zjb2RlYy9lbmNvZGVyL3ZlbmNfZHJ2X2lmLmggICAgIHwgIDExICstDQo+ID4g
IC4uLi9tZWRpYXRlay92Y29kZWMvZW5jb2Rlci92ZW5jX2lwaV9tc2cuaCAgICB8ICAyNiArDQo+
ID4gIC4uLi9tZWRpYXRlay92Y29kZWMvZW5jb2Rlci92ZW5jX3ZwdV9pZi5jICAgICB8ICA1MSAr
LQ0KPiA+ICAxNSBmaWxlcyBjaGFuZ2VkLCA4NDMgaW5zZXJ0aW9ucygrKSwgNTUgZGVsZXRpb25z
KC0pDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bWVkaWF0ZWsvdmNvZGVjL2VuY29kZXIvdmVuYy92ZW5jX2NvbW1vbl9pZi4NCj4gPiBjDQo=

