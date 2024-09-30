Return-Path: <linux-media+bounces-18765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C84989BE9
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 09:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C234282BFB
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2024 07:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D82A166F1A;
	Mon, 30 Sep 2024 07:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="c+tDyT1j"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012065.outbound.protection.outlook.com [52.101.66.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A907746444;
	Mon, 30 Sep 2024 07:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727682716; cv=fail; b=gHs4MKg1h0UaWMm9vU+8BS9Z9l42GIxCE69HMSEJFlZyWRELww3rMhuYrodjWm+yU3BG/A5ANBo1E7Rg26cEuFWbHQZr8nz8ghnJ+f9soqATNIHu0JoKb9RABSPYs2L3A7+wnOSCbnD+poas3WaZH+o79b1V6xotTjY5KjaZXa0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727682716; c=relaxed/simple;
	bh=IW+D4ptwZyXvo42GSfOD4IVT/ZOSu1m6nLyttrgQ2o8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PQcs2RWfeFj+x+v1k5SbkdyRMX7DMNWXj1v7P65yD/YK1p0swUEkT3yr67XgHYx2UOPoDZo6JHh9XtT5lFfNIwBGv0X4nV1KTlvb4JuJW+PSXfjHn1ST/96kRxQRNS9x9NvNV2xSmymEEtjpDZy1oO0SlVqw3EAY9p5dlLYJ7WE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=c+tDyT1j; arc=fail smtp.client-ip=52.101.66.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVEI0D+bnsVprBTOOJvJGt+SJ64y3FmWhctYwVc0Ni0xG/UeZqEzdx5qNQYbg6zXMUWQOHhVj5fmd0TQSbK0dGiXK1GC2HonEo+UaBIQJizfnVmapVYOG/O1axR9wovlRQdUhS0NiepeQk+q8pstW19hOaS5So57ZYSMVjTxysXhmDnpq2+8NySNrAoDHQEcI5SrYXPLAFfcUkRTIUF40TeueWWhtx5PRJJbMmp8rNaG6+vMt0oX+qZPvK7KhlTcGjBeZ0tk06sdJflTXQQS5TDK4aekp+cFkvvle4f0PoQFq+lw4sydt+u7B9TrLGpps+JmLG7EIcp9zZ274+yfpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IW+D4ptwZyXvo42GSfOD4IVT/ZOSu1m6nLyttrgQ2o8=;
 b=CZ+tR+1OWCAKanVmqgjWyfaCvp5RKICvGPshIPQGd+k5lOCZg8XrOgs5HeVJHFUcxKCq4x4VtsOz1iwwuj2qJxv73WkwL8kYugxYZt6Sbtmb5CunU40mGvOtEHNWylhb0QVLqYorAdO4XoNs8dUNgUTYPcWEl6PWXOeX6suV7PmvJABJfxQcluwZShD6lfzfkaVhY/n5lageqGLZCCyser/yIe9VlSNBHt35jCg+18IgCUsxZgna2+kja1GZj0qJztiBjZk4mBcG0PGsDaE1EVaWuM+dox+1dwojyvIncBlh997/6GxotKiUQRNW4yJw4Xfy9R82nT+LHN6crDcy8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IW+D4ptwZyXvo42GSfOD4IVT/ZOSu1m6nLyttrgQ2o8=;
 b=c+tDyT1jhAAk5iDfcm2Ha4NhAIRuzGX1FXImIt2VLJVCH4diMa2gAu+LgJzr5HDBtrh2BlujModSORjZvvnLAdaIsWJYK7IGpDJmBYiDQDhmu0bRnC1j/3mgeqTZ3yCHFIciX3Js16Arzd22xXbthN6Zc8cgMMURulXqTYq9IUNTGlxdnu2HkQDf/2C/fzho725A6X+vudDMPAd05sHq6ZMg0+fKRmqkQWu5yld5bJ9dM++uL7XwkXSr33xtf2F2obZkH4ECcuADXO2Xgc8fTfSAOlPy1lPemeYXmMGcXJWDg+TVdtjLesKyxojC0Hxfj0wxydYDXjH2gDvc+prfKQ==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA4PR04MB7871.eurprd04.prod.outlook.com (2603:10a6:102:c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 07:51:45 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 07:51:45 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: "rmfrfs@gmail.com" <rmfrfs@gmail.com>, "martink@posteo.de"
	<martink@posteo.de>, "kernel@puri.sm" <kernel@puri.sm>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/3] media: imx8mq-mipi-csi2: Simplify power management
 handling
Thread-Topic: [PATCH 0/3] media: imx8mq-mipi-csi2: Simplify power management
 handling
Thread-Index: AQHbEnWjWQbBoFwBjkOAXS+Cpks20bJv48vQgAAKH4CAAAb/oA==
Date: Mon, 30 Sep 2024 07:51:45 +0000
Message-ID:
 <AS8PR04MB9080AF5E451A74FA0C0B03C0FA762@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20240929134354.20735-1-laurent.pinchart@ideasonboard.com>
 <AS8PR04MB9080211FC5A0FFCB255C3247FA762@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <20240930072151.GC31662@pendragon.ideasonboard.com>
In-Reply-To: <20240930072151.GC31662@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PA4PR04MB7871:EE_
x-ms-office365-filtering-correlation-id: 821788af-feeb-4d3d-8df2-08dce124bb46
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?U2ZCYzhHY0FlamtjZ2dvMnlNK0REWE5OQ3o1L1pNSDZTaWxSUC9IRGt0cTUv?=
 =?utf-8?B?NU9IQ1Q3WFJyZHl3OUpkWldkRmRRVE82QnQ1Nk1wdno3UUVlZFhDTVFwS0xH?=
 =?utf-8?B?aWxTbVFkVkJmWjBlQlBjNDN2TWlnVzY3ZktaaGgxWkc5QWw5SFB2enRWc3hw?=
 =?utf-8?B?YVY3SFJnMGgyTkRuQ2w4TUtqY2lBTGltYnlPRHl1czk4VXo1aXUrdW1qZ0hv?=
 =?utf-8?B?MGtSWjdvRXl1b2FkZUN6YjRMUHN1Sk5GZG5kYW5Xd3FRcmlUOWV5VCtwd1gr?=
 =?utf-8?B?Y3N3Y2k0V3RNeTZEZEExY1hIR0VCSUVIVTdZWFdNaU9aeEE0N1d0bFNQYkt0?=
 =?utf-8?B?RDFXOE1WUFpJQ01ETDRnRmNTakk3blV5RWRWYVRpdElVK2swT05JMExIOHBO?=
 =?utf-8?B?OGQvYW9Qall5UUR6Z0QzK0pibythbTV5aG1sNXBrL29VTERUSjVJTG5SNFJ5?=
 =?utf-8?B?cDBtTFZMbWVhWXFPV1AxcjlBMmtLaXkxR3Bib3BQU3hMZ251NlEybnUxeGpH?=
 =?utf-8?B?bjc3VTRmSElUQi9WYTlKUTBMSFpKc29oSHhzNFVmQVZOS252cmxxbWZLN2Fo?=
 =?utf-8?B?VTd3Zm1zdEUzRkxBY0dWV1ZXMUpIaWRPb0NBU3VOOWdQZkNNV2puSXoxekR6?=
 =?utf-8?B?QWo5UXR1eUlyZmhVa0puSmUrZmtqMVFjU0pFQzJFMmxnNXpyVDRCd1Bjbmor?=
 =?utf-8?B?MTJFcnZ2MGFNTmNEL0pPTXlOemk4MEVSTE9oRFNFYWszUTNEWGNpVVVteFdM?=
 =?utf-8?B?b01zOVR3djZUM0tSNExTNDJFS21OVXJNbFhMSGxmVWU3THVjai82ZWwzRFNh?=
 =?utf-8?B?Q1RTRjhPcXFtRVdZS21WRTBnNEhsUEVvcG9UbzBEMCtabkVrL2g4UTd3dEMv?=
 =?utf-8?B?MjdnaWh6eFMzK0ljcHBES3RDa1pKSmdveTZNNzV6U1plamVwb0Vxc1RFN3Bt?=
 =?utf-8?B?a3g3Q0Z2TnExRUdaOXBscWNNbjhaa2o1UG5EdENjQ0VVTFJERWJJY01zWnJW?=
 =?utf-8?B?MDA0d0xYQXM2L213Qk9HaFRWVTNUMlVaZS9JKy9LV3hYOTdxaXg3dTliNFRu?=
 =?utf-8?B?NlJPTTlDaUpKR2NYNWZQL3Q2eEJNRDc0VGxQMWtqNEIzcFh1elhNUy9ncHcz?=
 =?utf-8?B?Q2hWTTlIZmxIUEdGcWJBQ2hDS0V0RnZiWjV5dC95b0QyK0hTak5BdE5BNHhj?=
 =?utf-8?B?Z3NvbExIREs4YkNHdVpqMWdRL1FiMEpYaU4vaW4raTB1OUd6aWJxQVNwQ1A3?=
 =?utf-8?B?S3NGcWxvcW9RK3haYWtJK2lYZTRqWTcrejljRjBnaW5BVVY0ZzZXYlhSa2E4?=
 =?utf-8?B?TjJyN3BlZ3dCMk5MUFR5TTlSTElySkxvcGFGeUZjRzhrTUdEMXRFeTVIcUpO?=
 =?utf-8?B?OVU5Y2s3YXlPQ2Z0MXlUYTFNaHZiU3B5VUY3dmxDQ3BuTkpEMEY5M1Q4VnJz?=
 =?utf-8?B?d0JTOE1tdVQveVFZaDZXWkc5U3RhT2NtY0VJcjJXTEhIemhYNnhUeThYQ0Jy?=
 =?utf-8?B?SkRGM3hrdlJ0VmRiV29ncW10bzhsaVA4aVpzOENsTG9XR0VsTXI4Z3FxT1Z0?=
 =?utf-8?B?YlZ2emozeXNZK2VCUEgwQ1U1S2FmSVhmU0JMYUU4dzFPZHdZbWtiaWtjS2sz?=
 =?utf-8?B?a085bE5abWdjcUNNc3VQd3ZkVHQwMFoxUnNuQ3pHUXRKa2s1WjZON1Vkak81?=
 =?utf-8?B?RnZlK2QyRFNPa1NhNDNjd2JNMU1rWEY3S1ZjY2tyNzIwQUdrVG1BM29SdXpt?=
 =?utf-8?B?aVRlZEdQdW90NVZqQmszV1NoUEJEczVyQTJHa29HOTZLbjQrdjZzTW9GOUxJ?=
 =?utf-8?B?cFNLT2RWbWNJeE85R00wbUZxT2xOcElRSmozVGNEaHIvZUFDNjUvZ3hEQ1Rt?=
 =?utf-8?B?RFVWV0kvejZsendWWkpiMWNCaFoyUkJjSkY4bTk3ZGZsZlE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZVlTTmlqVGVzQlo0QmpOTllEeGZJKzFTd24veFJqbmh5bmFCRWlaQVRzUDhl?=
 =?utf-8?B?UWVpUFdtZ20wYllHcVd3dmx5TGZtYTN1TG1qdVNWeC9OSVVNNTRmTXNhaklZ?=
 =?utf-8?B?NEU3MVZ2Q3FJS2dRTncralhPbDJ5cnQyN2FoVGxHOEFFcm0yMmp2WnhDU05K?=
 =?utf-8?B?NjRycklwZmxqb0R4MEtwWDNNdWkzci9kQW0wT2x2TUhTN0kvL0xPaUxwaVBk?=
 =?utf-8?B?Yk1KSHRXbDJMTFR1VUJOamttcjNWb0p5MzJxa1UrV1RaUTEzeXVzYS9WaDdq?=
 =?utf-8?B?MU1tRUljb0h4WlRiQm5Hd0V3cmJkUmRmVDEwckM3MDJicndOSUtXZllzSnJt?=
 =?utf-8?B?d0ZoR1lZaGQ1anJGYTFDNHZTSTFXV25EejdNMEQ1TjlQUUNFTFRqVXF2aHdR?=
 =?utf-8?B?UDhFSktuaUQ0WE1uOEdMVEQ0ZnVhcGE4azdiYlZHbk5WMHlhSjdZV0NUOExa?=
 =?utf-8?B?SnBSekVmYVNpSHlmbFlCc28vRzZyTTZLdTBYZmZFTHpFdWg4Y2FoZkpZbUFC?=
 =?utf-8?B?eE1BZW9iNDVOcHpBblIvV2NldVU1dHBwK0ZkV1U2K2xmUzZkS2FXZFNTTmw5?=
 =?utf-8?B?YlVLOXQ1Z1AzSEdtV2FWaGR6YnpoWkJaZUROMEQ2amZyMzVnbFpYZE4wM2RL?=
 =?utf-8?B?RDQ1ancxZHkvSW9yUDJPZStIeGRkNzJob3FrOGxvMGJWYVFTbXJGVGlqTUZs?=
 =?utf-8?B?ZEJHNjkzdGtnVnN4UWtKYllMUHE0SGRpeXM3YlV2RWV3SXZCNi9yRjlDSXVi?=
 =?utf-8?B?U1kwMGJ4NG10ZnlPQUVuaFl2cmlwL2liRTRkVkQ2ajVsS1dHWTZXdWl6b0Qy?=
 =?utf-8?B?UVMyYlRLelI2YlI5ZXdlZ1VPUUw5YlJHYzB6R2ViOEY3OFA4RExPOHRoN2dn?=
 =?utf-8?B?enY1VWhibkJJMEt5dEEyYUlocHRSaGlQbFdLa1FBaCtMYlNLRTlqY3hpYkVx?=
 =?utf-8?B?VElHWkNvVEt2bnBuV255TjFyUEs3UkQzVmhwYzgyUHpEYXF0Um41YTZ6QnVz?=
 =?utf-8?B?WVJKOGwyNGNSeldGMVNYOGR2OURVNXk4aXNZMTdNMmYzU0Z5N2RIOStKKzgr?=
 =?utf-8?B?RDVicDd1QjNqWHVLTU96ZDkrcXlaZ0FzUTh4TEtYbTlZWlgzZXRpZWtEanJa?=
 =?utf-8?B?SlJyeHU1QWJiMXkzUzBXdzVMVnp1WndnZnNib1ROQjFPcCtQWThuTWxTdkh1?=
 =?utf-8?B?VWhXY0xsdjk5ZVl3S3hpWkpKNGtmWWZzdisvRXR1b0RiYkUvZHNleXlickQw?=
 =?utf-8?B?dHAzYmdYa0sxZkc0NXJaNnBTclZxbG1ieWdaRmowdllkNzU2RWRsK2xRWUVO?=
 =?utf-8?B?SzFhK09vK3BQaVY3R1FnbEF0L1VBMHBwMFJZVkk0K1ZMM3dLaHhULzN0akFj?=
 =?utf-8?B?a1pTMWkwTDVCb2JsbXBqRVFscVpONC9rL2o2eGgzSFV0TkdwOTdwcitUWnBO?=
 =?utf-8?B?NEpNS3MvNk5GdWRlc1UzVlFzVnpBT3JVMU9wZUZUZU93MytYRkxOSk9HL2ZJ?=
 =?utf-8?B?cWkxSUUyRkYrSmtWS0FNcmZ4U29QU0cwbFhzR0pjM01JUUw3c0JVWWY5dXhB?=
 =?utf-8?B?K0tQbDZxamN6QzRqU3MxcnQrcGRJQUpjNy9hTDRXZjVsRllsN202d1ZTNE9V?=
 =?utf-8?B?TGdGSWFHaW5nUTh5ekJWN2NtZWU3NlI1dnNVR203b1dHNk5EVTlnd0NGbWdN?=
 =?utf-8?B?aXM0NnVMOUxBNXVnTkRmY3RXbGZnYTBTbm1uanZsRzd0SmZvbWltRlhjcnRm?=
 =?utf-8?B?TWgvYTVZemhHelY5RENUbXUwWVVxV1NIUUJud0srWnJzL3lyNW9MaTNNN0NV?=
 =?utf-8?B?V0lkMnFJcEQ0MDhxdlM5Y29kOW56S09QMmEwMjBNd1F3TXNGdFlMWGhIODUv?=
 =?utf-8?B?UjhuZmVveHlrUklsdVVoUEQzbmg1d1l3bEJhLzFvcnNZUTJ4bU1lK3A4Z2pi?=
 =?utf-8?B?TExGNDBjbWN2Y3RvbmtZenZHSGZDQTZ3bmxPQkxVNXhoNEIwVzVQQkI5Zk9R?=
 =?utf-8?B?Ym1lK0JsMHhHd3dCenFZYXhzbThSblZkOHNoZnhsbWpvRXlaMDZoenZWM1ZO?=
 =?utf-8?B?L0lnZGIwTnBQMUJxSGZZZ0g4ZHBqcVdONGlJMjdBdmJ1WTBGazM5c1hpaDlM?=
 =?utf-8?Q?k8IwtNONgugUvxEz+B2DvsVi0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 821788af-feeb-4d3d-8df2-08dce124bb46
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2024 07:51:45.6480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iQVFCzYQzWwMGdhydw1X3pyWo/58tqQSxAi2gfWx3nd3D/PhhADoMRWpWEeeleGWW06iWs3CUxoaBTx6bOKGoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7871

SGkgTGF1cmVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6
IE1vbmRheSwgU2VwdGVtYmVyIDMwLCAyMDI0IDM6MjIgUE0NCj4gVG86IEcuTi4gWmhvdSAoT1NT
KSA8Z3Vvbml1Lnpob3VAb3NzLm54cC5jb20+DQo+IENjOiBybWZyZnNAZ21haWwuY29tOyBtYXJ0
aW5rQHBvc3Rlby5kZTsga2VybmVsQHB1cmkuc207DQo+IG1jaGVoYWJAa2VybmVsLm9yZzsgc2hh
d25ndW9Aa2VybmVsLm9yZzsgcy5oYXVlckBwZW5ndXRyb25peC5kZTsNCj4ga2VybmVsQHBlbmd1
dHJvbml4LmRlOyBmZXN0ZXZhbUBnbWFpbC5jb207IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4
LQ0KPiBtZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFk
ZWFkLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCAwLzNdIG1lZGlhOiBpbXg4bXEtbWlwaS1jc2kyOiBTaW1wbGlmeSBwb3dlciBtYW5h
Z2VtZW50DQo+IGhhbmRsaW5nDQo+IA0KPiBPbiBNb24sIFNlcCAzMCwgMjAyNCBhdCAwNzowODow
OUFNICswMDAwLCBHLk4uIFpob3UgKE9TUykgd3JvdGU6DQo+ID4gT24gU3VuZGF5LCBTZXB0ZW1i
ZXIgMjksIDIwMjQgOTo0NCBQTSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4gPiA+DQo+ID4g
PiBIZWxsbywNCj4gPiA+DQo+ID4gPiBUaGlzIHNtYWxsIHBhdGNoIHNlcmllcyBpcyBhIHJlYWN0
aW9uIHRvICJbUEFUQ0hdIG1lZGlhOiBueHA6DQo+ID4gPiBpbXg4bXEtbWlwaS1jc2kyOiBGaXgg
Q1NJIGNsb2NrcyBhbHdheXMgZW5hYmxlZCBpc3N1ZSIgKFsxXSkuDQo+ID4gPiBJbnN0ZWFkIG9m
IG1ha2luZyB0aGUgUE0gaGFuZGxpbmcgbW9yZSBjb21wbGV4LCBJIHRoaW5rIGl0IGNhbiBiZSBn
cmVhdGx5DQo+IHNpbXBsaWZpZWQuDQo+ID4gPg0KPiA+ID4gSSBoYXZlIG9ubHkgY29tcGlsZS10
ZXN0ZWQgdGhlIHBhdGNoZXMuIEd1b25pdSwgY291bGQgeW91IGdpdmUgdGhpcyBhIHRyeSA/DQo+
ID4NCj4gPiBBZnRlciBhcHBseWluZyB0aGUgcGF0Y2hlcyBhbmQgdGVzdCBib3RoIG9uIGlNWDhV
TFAuDQo+ID4NCj4gPiBGb3IgaU1YOFVMUCwgaXQgd2lsbCBjYXVzZSBrZXJuZWwgZHVtcCB3aGVu
IGFjY2VzcyBDU0kgcmVnaXN0ZXJzIGFuZA0KPiA+IHN5c3RlbSBoYW5nIGR1cmluZyBkbyBzdXNw
ZW5kL3Jlc3VtZSB3aGlsZSBzdHJlYW1pbmcgTmVlZCB0byBhZGQNCj4gPiBzeXN0ZW0gc3VzcGVu
ZC9yZXN1bWUgaGFuZGxlcnMgYW5kIGNhbGwNCj4gPiBwbV9ydW50aW1lX2ZvcmNlX3N1c3BlbmQv
cmVzdW1lIGluIHRoZSBoYW5kbGVycy4NCj4gPg0KPiA+IEkgdHJpZWQgdG8gZGVidWcgdGhpcyBp
c3N1ZSBhbmQgZm91bmQgcG0gcnVudGltZSBjYWxsYmFjayB3b24ndCBiZQ0KPiA+IGNhbGxlZCB3
aGVuIHN5c3RlbSByZXN1bWUuIFRoZSBzdGF0ZSBvZiBwb3dlciBkb21haW4gd29uJ3QgZW5hYmxl
ZC4NCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGVzdGluZy4NCj4gDQo+IEkgd29uZGVyIGlmIHRoaXMg
Y291bGQgYmUgY2F1c2VkIGJ5IHRoZSBDU0kgYnJpZGdlIGJlaW5nIHJlc3VtZWQgZnJvbSBzeXN0
ZW0NCj4gc2xlZXAgYmVmb3JlIHRoZSBDU0ktMiByZWNlaXZlci4gQ291bGQgeW91IGNoZWNrIGlm
IHRoYXQncyB0aGUgY2FzZSA/IElmIHNvLCBkb2VzIHRoZQ0KPiBmb2xsb3dpbmcgY2hhbmdlIGZp
eCB0aGUgaXNzdWUgPw0KDQpJIHRlc3RlZCBvbiBpTVg4VUxQIHdoaWNoIGRvbid0IHVzZSBDU0kg
YnJpZGdlIGJ1dCBJU0ksIG5vdCBpTVg4TVEuIEluIElTSSBkcml2ZXIsIEkgbm90aWNlIHRoYXQN
Cml0IGFscmVhZHkgaGFuZGxlciB0aGUgZGV2aWNlIHJlbGF0aW9uc2hpcCB3aGVuIHN1YmRldiBi
b3VuZCBsaWtlIGJlbGxvdzoNCg0KbGluayA9IGRldmljZV9saW5rX2FkZChpc2ktPmRldiwgc2Qt
PmRldiwgRExfRkxBR19TVEFURUxFU1MpOw0KaWYgKCFsaW5rKSB7DQogICAgICAgIGRldl9lcnIo
aXNpLT5kZXYsDQogICAgICAgICAgICAgICAgIkZhaWxlZCB0byBjcmVhdGUgZGV2aWNlIGxpbmsg
dG8gc291cmNlICVzXG4iLCBzZC0+bmFtZSk7DQogICAgICAgIHJldHVybiAtRUlOVkFMOw0KfQ0K
DQpGb3IgaU1YOE1RLCBJJ20gdHJ5aW5nIHRvIGVuYWJsZSBpdCwgYnV0IG1lZXQgc29tZSBwcm9i
bGVtcywgc28gY2FuJ3QgZ2l2ZSB5b3UgdGhlIHJlc3VsdHMgaW4gc2hvcnQgdGltZS4NCg0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDctbWVkaWEtY3Np
LmMNCj4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg3LW1lZGlhLWNzaS5jDQo+IGlu
ZGV4IDk1NjZmZjczODgxOC4uYzY2YjA2MjFlMzk1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL254cC9pbXg3LW1lZGlhLWNzaS5jDQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEv
cGxhdGZvcm0vbnhwL2lteDctbWVkaWEtY3NpLmMNCj4gQEAgLTIwNTcsOSArMjA1NywyMiBAQCBz
dGF0aWMgaW50IGlteDdfY3NpX25vdGlmeV9ib3VuZChzdHJ1Y3QNCj4gdjRsMl9hc3luY19ub3Rp
ZmllciAqbm90aWZpZXIsICB7DQo+ICAJc3RydWN0IGlteDdfY3NpICpjc2kgPSBpbXg3X2NzaV9u
b3RpZmllcl90b19kZXYobm90aWZpZXIpOw0KPiAgCXN0cnVjdCBtZWRpYV9wYWQgKnNpbmsgPSAm
Y3NpLT5zZC5lbnRpdHkucGFkc1tJTVg3X0NTSV9QQURfU0lOS107DQo+ICsJc3RydWN0IGRldmlj
ZV9saW5rICpsaW5rOw0KPiANCj4gIAljc2ktPnNyY19zZCA9IHNkOw0KPiANCj4gKwkvKg0KPiAr
CSAqIEVuZm9yY2Ugc3VzcGVuZC9yZXN1bWUgb3JkZXJpbmcgYmV0d2VlbiB0aGUgc291cmNlIChz
dXBwbGllcikgYW5kDQo+ICsJICogdGhlIENTSSAoY29uc3VtZXIpLiBUaGUgc291cmNlIHdpbGwg
YmUgc3VzcGVuZGVkIGJlZm9yZSBhbmQgcmVzdW1lDQo+ICsJICogYWZ0ZXIgdGhlIENTSS4NCj4g
KwkgKi8NCj4gKwlsaW5rID0gZGV2aWNlX2xpbmtfYWRkKGNzaS0+ZGV2LCBzZC0+ZGV2LCBETF9G
TEFHX1NUQVRFTEVTUyk7DQo+ICsJaWYgKCFsaW5rKSB7DQo+ICsJCWRldl9lcnIoY3NpLT5kZXYs
DQo+ICsJCQkiRmFpbGVkIHRvIGNyZWF0ZSBkZXZpY2UgbGluayB0byBzb3VyY2UgJXNcbiIsIHNk
LT5uYW1lKTsNCj4gKwkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJfQ0KPiArDQo+ICAJcmV0dXJuIHY0
bDJfY3JlYXRlX2Z3bm9kZV9saW5rc190b19wYWQoc2QsIHNpbmssDQo+IE1FRElBX0xOS19GTF9F
TkFCTEVEIHwNCj4gIAkJCQkJICAgICAgIE1FRElBX0xOS19GTF9JTU1VVEFCTEUpOw0KPiAgfQ0K
PiANCj4gPiA+IFsxXQ0KPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDkyOTEw
MTYzNS4xNjQ4MjM0LTEtZ3Vvbml1Lnpob3VAb3NzLm4NCj4gPiA+IHhwLmNvbQ0KPiA+ID4NCj4g
PiA+IExhdXJlbnQgUGluY2hhcnQgKDMpOg0KPiA+ID4gICBtZWRpYTogaW14OG1xLW1pcGktY3Np
MjogRHJvcCBzdHJlYW0gc3RvcC9yZXN0YXJ0IGF0IHN1c3BlbmQvcmVzdW1lDQo+ID4gPiAgICAg
dGltZQ0KPiA+ID4gICBtZWRpYTogaW14OG1xLW1pcGktY3NpMjogRHJvcCBTVF9TVVNQRU5ERUQg
Z3VhcmQNCj4gPiA+ICAgbWVkaWE6IGlteDhtcS1taXBpLWNzaTI6IERyb3Agc3lzdGVtIHN1c3Bl
bmQvcmVzdW1lIGhhbmRsZXJzDQo+ID4gPg0KPiA+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bnhwL2lteDhtcS1taXBpLWNzaTIuYyB8IDExMw0KPiA+ID4gKystLS0tLS0tLS0tLS0tLS0tDQo+
ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEwMyBkZWxldGlvbnMoLSkN
Cj4gPiA+DQo+ID4gPg0KPiA+ID4gYmFzZS1jb21taXQ6IDgxZWU2MmU4ZDA5ZWUzYzcxMDdkMTFj
OGJiZmQ2NDA3M2FiNjAxYWQNCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBp
bmNoYXJ0DQo=

