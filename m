Return-Path: <linux-media+bounces-19303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 599E79962EA
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 10:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 793451C21FB3
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2024 08:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE393185923;
	Wed,  9 Oct 2024 08:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rET0QKNb"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011038.outbound.protection.outlook.com [52.101.70.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7EA018785C;
	Wed,  9 Oct 2024 08:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728462651; cv=fail; b=bEZ6cbLiRkmx/uQFZHJRmv8Kw+HJnGDD39djnsI3+K6N2F6p1/EKvumvPc02XF0HXV+xKjXGcy4tldJmcWgLaz37kA9abWXF/uAa3sEjBtgQ9EOqJ5p4EXkVZevgqCknNZQbXdI21FCbkXPoue8vzKFNMOx5oaMOwXSS+uAlt7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728462651; c=relaxed/simple;
	bh=ActlAKbguGpqwe8Lr3QK8YbZZv8q3VJTNUL9M37hafU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PKmJXUfUJaruNbbdPPon4xtdqVd3wE14ni4QsTZP/6wfhxnuk3HKHK3X3cL9yMuoYhALuhpv6KmE67NcfiEFEBToAzGoxUeMbYUeP2z69++oDdjLrddo4DRgxETbrMD8LahQN/2j0Z619eVi69zh141tUAex/S76eIbPCnKVLoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rET0QKNb; arc=fail smtp.client-ip=52.101.70.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DRXqcLHrX09MTSPZYnoXishjXGiRm5gfECrUAcZgU227V7z+ZvS6Wz2LgRelxV/qOlwdf+gMjXseDXf7+hkxWV0uPh6ianybkx2XF9638B4LEsn1DXHFd/m2Tp7qoHjBD/dhJgMi3qto2dymPKXK67Vf+rUN0nAAJEVG7PX2r3lQ/7EIq/DnweZJvCWAEzK065dwxqF0EDD6Thu3azkc+71r+Rok/mW1AZ5DFFDfZVQeBnFYXDWz1OrfvzWzq/l/UU5HISslyccWBVmba/nid1aLeA8wDFNXVP/R8TiLwHD/OSB3Stw+0mTrzFsJdAjVqY+fNAye3l2s9IFFuO5aKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ActlAKbguGpqwe8Lr3QK8YbZZv8q3VJTNUL9M37hafU=;
 b=kmO3XXg56ajZI2CqXRrSReEVv5NkS3aLnrMKgoojSgr8PGOXqLGgQrBKF3BjyfZIX5LXbmRHOJsk5jinZqONlrop2wSU1QCFk5Cw17lEYd3hAUEnvQjcKjj4gsiZXFdFbmi9xuuiBcihlmjk5lJ3bnyzFJU/0caxi6TMMyWPDEBmSrw9G6rX093rPewgVCLmiJpOT4AYDOaBN8RtdDkkHYBpAim5aAUSCs/+hdAlNCXvS2HlWyp06Ca/EUfEfZvY7s1b62dzPXwBxCPcZGK2vam3gRwcmbza8jzsaX3eqfimjbSgXb1eGFVL01rJYPG1gEBGvx2bz2jdGFzI1+2cfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ActlAKbguGpqwe8Lr3QK8YbZZv8q3VJTNUL9M37hafU=;
 b=rET0QKNbzXyByT54iowPJkydyNh5CO82Bo9ixwvflaANSPyBhdqsJCSEsRHI+0+QfgEWlqC847kVQp/iRlvzdwpam3pv10GJIyJ9c8/ivN7F+EfjB5xsSGqH/zqNYhTDwpbktKPctqF7/2CRVRkg0IeZB8jmrdd9biWwLdNwrP7G8Iht1SdH/reqmM/fBAPiMFbT4KcCOIA8ywZtzWQ0vi9UC4XWWsXsFvTsn8WJWBjaJa3KMmmmiDQrC9K4pl5PnETkQrr83LTvVK8aYe2Vn63fT+taycu6JXp96/2xgsiQQmTsL0fFTYgDiOVSJv0PfcSFTl4bn/hZLvg3T3Yz7g==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM8PR04MB7203.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 08:30:44 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.8026.020; Wed, 9 Oct 2024
 08:30:44 +0000
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
Thread-Index: AQHbEnWjWQbBoFwBjkOAXS+Cpks20bJv48vQgAAKH4CAAAb/oIAL6iGAgAJAbKA=
Date: Wed, 9 Oct 2024 08:30:44 +0000
Message-ID:
 <AS8PR04MB9080E11C730639A09FB90E4BFA7F2@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20240929134354.20735-1-laurent.pinchart@ideasonboard.com>
 <AS8PR04MB9080211FC5A0FFCB255C3247FA762@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <20240930072151.GC31662@pendragon.ideasonboard.com>
 <AS8PR04MB9080AF5E451A74FA0C0B03C0FA762@AS8PR04MB9080.eurprd04.prod.outlook.com>
 <20241007214343.GB30699@pendragon.ideasonboard.com>
In-Reply-To: <20241007214343.GB30699@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|AM8PR04MB7203:EE_
x-ms-office365-filtering-correlation-id: 8aba7aca-4d2c-43ff-12e5-08dce83cab20
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?S2J0VDduZE5WN2VPM1lzREcvMlF0eUE1UHNXd0xhQjNUN21wMGs0dE5FL1dW?=
 =?utf-8?B?K2RNYmVxTVFhVjNBTTlQMzlsVFdzUER6TVVpWnhBNVVYMGpSeU5XOTRwNXFx?=
 =?utf-8?B?akNsWGMvbFBKRzY3b01ZR0tIamVBYjlnSGVZaG9EcllMSnNuMzZLTXJGTWV5?=
 =?utf-8?B?Wk1iWmZWOEMxYTR3a0l3MTBjaTR1RXh0S1YvNE9QZ0VLUGFISUFlVWRUcnlz?=
 =?utf-8?B?TlNZUll3QzREQXhqekh1MnlmRVp4VjFhZk5Ca1habWlMWWdyMC9KK1N3di9l?=
 =?utf-8?B?THowMFhwN2JrVU9RY1FaNkxRd2RkM0J0Y0JLeVcvdk5oY1U2VDVLNE8weUVZ?=
 =?utf-8?B?ZndSZ0pOamFsMDQ4VHQzYkNuanNzVHdtUUZEMjBPaXdpYVpWaFkxT0VZdGJY?=
 =?utf-8?B?bklWaFp1UmFhbGNMYmZ3K2VDVXUzME1KTTBtMGdMdjlJK3h1dS8yd0FpVjBD?=
 =?utf-8?B?MmZ6bWRYS2xCdlNMQm9odWZTMFdrd0Nlcy9NcVkwOWRWNmw4d3hFc01FNllD?=
 =?utf-8?B?ZFlTTTFCb08xMmZ4WHFjWkozZkNNaVhkNGcrdW1SVFV1RXJtbVI2RU1YSkxm?=
 =?utf-8?B?N1UzK0tPdTVEblFpamUwQ1dud2NLM3JkY1dvZ1pySXlRalhLQ0NxRU85a09Z?=
 =?utf-8?B?eWUvOHNaZkdKNTA5TXpLZ25iemtNYld3NlpSOWE4TTM3R1k2OEplVnJ3SW0r?=
 =?utf-8?B?eEppNURSWFBPUVZtaTAvVmZ4M0FUbWZnWnJubWhxelhxeitsOG5JWXFWUXRv?=
 =?utf-8?B?MHRVa3dwVkRnbkpDZFRWTkxhU3ZIblRKUngvNnRDb1E4VGlEWjZnblpoNGVj?=
 =?utf-8?B?aExHRm5SanJxUVJuNm44bTl1YktkaXR6bmxLWmlXTGF5NHdzSDZOU1FoZ3dh?=
 =?utf-8?B?R1pYaVhMUXNJcFBadSt3eVg1Wi9YVko5ZG5zSHBkb0dPemtyRitESzhIZDBx?=
 =?utf-8?B?QTVaUjdTREFZNHVMeFZwdVRZR1RVMzdlNW8yRjFTbGdWV0k3Y3J0eFZFczYz?=
 =?utf-8?B?b2F2RVA1TkhlWW5zOFdhYXZXSG03OU9CTmRLWHp0YmxSVy9ERUZlVVdtWWt6?=
 =?utf-8?B?VHE0SFVBUDRETk03a21ZMm84dDA0S1JwTWJRK3l1OUpQVFBxb3hVL1k3dkIz?=
 =?utf-8?B?bmNqU0VxRzA4RllpRFJBYXdZcFByL3Vka2crRUxNUUNWOVNtQWRIYW5SN0tz?=
 =?utf-8?B?ZFQ2R2lCM3p6dWhENU9PTnJUSklpUUNEZDByaU95OTJaeDNyQXM0LzlOa3Uv?=
 =?utf-8?B?MGtMS3d2d1VqenFXcHQ5UWh1Mm9ieGNXNUlXRVhKRmZldWtXT09YdVQ4c3JM?=
 =?utf-8?B?T3VLSGlGNW8rWDdHUTZtdmhnWDVRMlpRT3JQV1BNMXpzZk9nNC9MeFVUUFNq?=
 =?utf-8?B?S1JoekIxdnFuaGIwclI0d3cyWDQ2bDArankyTWxoM2V6anZ5RzJ1YU5WQWY5?=
 =?utf-8?B?eGVxeWpEQjVJZDJVQ0FaUnNyUjViajQ2NjRmbGFhMlFzaGUzenRpbWlrL3FO?=
 =?utf-8?B?WTRaQ3paKy9PY0ZvUldha1czTGw4ajNvM1J1VFZVaDg2aUYxZW5mVTV2Q0pI?=
 =?utf-8?B?amVCS3lDVjV2dnZ6Q2Q3TWxaVmNuWGF5UytSYW9wWVNFUUkrZ1VBWWRicWVJ?=
 =?utf-8?B?VWZDVCtxMXlWSFA0bjhndGdPZjJTZVZLUmNwd1h0YTZoVWZwaEMvZnJxMHlK?=
 =?utf-8?B?Zk1iNXVXTGNxYkRZSFdOM1dVc1NIcUZYeWx0cmNCWTRJa01kUVRST2Z4WjRz?=
 =?utf-8?B?UnZuK1VSemlVZTlTQUFDZWV1MFcrNnREb29uc21HNFBjZ1N0VC9nQVFseUJm?=
 =?utf-8?B?UjJLODV5Z3ZybnMzTFBnQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UUhuSDc0bmZDWUhmaENhakZHYktIYzgyT1MxcDltMlZMNEJXdXFoVXYzWk1E?=
 =?utf-8?B?L0JnM09JTUtySjFBVHE2am54RW5tem8zcnNVZWFpcFV5enF3ZU9hOXl2K2VL?=
 =?utf-8?B?a1B3S1JENjRZbFphZ0IrTUUyYTN0eUtDYWFWWFM5Rlc1N3VLbUh5NUwySC9o?=
 =?utf-8?B?U3NsdnBsdGU5UC9BSGdreTFnU242SGljWisrKzJYaVEzc3JpRGFiRGFDZkNu?=
 =?utf-8?B?amRKUlF5SXlFQVVaclprblIweGd4K01yYkxzV1hnZUtKckMxemZ4WXU3SVB1?=
 =?utf-8?B?SlFEbkxwcW9UbzVOQUpZUml1WDRRVkg3UFpHQjNWSUFWUS9PZ3puYzA3YkN2?=
 =?utf-8?B?cVlkZDFNUzdNK2k3TXdjOHlyVEdEcFRTaFpKT1ZZR3J1TFdINlh6RW9IbFR5?=
 =?utf-8?B?ZC9VcjM0QUFCeWVtQlZBeUZrSm1INGRLUGJxMStKWG5jL1dUQnVFVDA0S0ZD?=
 =?utf-8?B?Z0FMNUIwN2NPdGszTkl5bDlvOFBwZVJUZm9pbHc3TDgvUitnSURXRURjVjdM?=
 =?utf-8?B?Ni84ZnJUbVUwcUJUSG5hRXQzeUhEMWxIU0s5TWtrV3dnaHY0emVhZzdLMGJK?=
 =?utf-8?B?cWZ0YmN5L0cveHZJdmlSODdHbHVVTHA4M1RGQ2NiSkhzdll6aXJsS2xXLzJI?=
 =?utf-8?B?MzRjZk1LNUtPRGJxelM1c2NoRXpxeWdYSUdWRVVlZ0xOUWdiczB2S0EveC9a?=
 =?utf-8?B?a0s3QkFyRjBSRkoyVHBWQ1Juc25OUXNoQWQ0R1V0YkNTRGxLYkRXMmpiYkh0?=
 =?utf-8?B?OXhqSit5bzAzLzQzTGN4YnFYNzlVTmRGWlk2Z3ZGR2lqSnBZQVMwbXg5ZjRk?=
 =?utf-8?B?WlJxbEEwa3BLTmU0eEFLT1M0WktRZTI0Z2VOdUR5OXVDWDJRKys0V0pQVC9v?=
 =?utf-8?B?dXhHczU3dU1zTlpaUW41QWNxNlY2WklWcXJuZi9BbnpjMnlqNlBFY0tibmFF?=
 =?utf-8?B?bVh4blpiNHViUDM5ME5mZTlZU2lpU210OExwUTRJTVZYRVF5S2NXbDBDenpj?=
 =?utf-8?B?Mm9YczE5STU4Vm56UXhmTGFGUEtiYnBHSDdNZXRhUEtkbk8xYU1abE9HME5S?=
 =?utf-8?B?NC91eEJZb0lBTzJOc0pITFNwR3ZIOGxOSWZqdTJvVUJLc1Z4YngrL1d3ZGxQ?=
 =?utf-8?B?NExTWEsyQ3VLTTlaVDUyYlJ6WFNFOGU1L2gzZkxDRHZSYWRBS3FKMkJhc3NX?=
 =?utf-8?B?TjBkZGd1SS93VjJvTW84cWhJcGoxdlRpQXRmWDZHUnViUHNhOFo4SWE4VHJo?=
 =?utf-8?B?QkpSN1RRZmJlQW9PcklUSllUM0x5c3lHZXZFZHRMVzNQV1RaalFoQ2haZE1M?=
 =?utf-8?B?ZFoxMHRHYlcyNnZTNDRCb2lsczNMTEkrcStxSElyVUdUNms5KzNxcVFlM21Q?=
 =?utf-8?B?MHJxM3ZMQ3hlRms4NWVhSXZoakE1TnBKbE4zMmlveWhobE5aYXlRcC83ckw0?=
 =?utf-8?B?UjZHVVJTc0ZBT1hRQjVTdlVRa1NUZG5rNUt2R1ZIVGRnV1d1OVgvaktYbis1?=
 =?utf-8?B?dmVIU2VxdGR3YWFaQkQ5UzdQY3N3bEU4KzY5L2JycmpoaVdrdks0RFVyY3pv?=
 =?utf-8?B?YVFZL3NhYzFhUUFkVTJiMGVzL3F4ejlvZzNjQytJWHJTMGtYTGhYS2k1ZmNt?=
 =?utf-8?B?ODV4aFBkNm1hRENjcVBXbWxkQzFza2xPQTFWQTRVZjRON3NpcDN5YVBMNmd0?=
 =?utf-8?B?dSttU0VvamNiemVndDlGWXdCS2xwUVdPeXBuYitUVlo2YjAzWlQ1OWVSelBR?=
 =?utf-8?B?eEI4dENrWmd6emt5N1JoeFdlYlBLNG9TazZQang3c1BFanNsN1JLZ2lIaGxk?=
 =?utf-8?B?MDNKUG1EN1NMNjNsNHk1SHRiTHk5bFovTmZvUEdkcU10c3RKUVYvbFQwaXF3?=
 =?utf-8?B?bmZuM1FpS0czdkZlN2MwR1NUL0F6R2F4UkJBWnUvWXZuaE4wN3BPTXJDNE9i?=
 =?utf-8?B?SVkzMkh0QllHVWwwK24zblUrbzBoR29QMEFJS29UWUsyTU1ONVk0Zkk2d3J2?=
 =?utf-8?B?SGVRRUNQZTNWMmNEK0JvcUhZdmRNb01lbWx4aC96ZXpqTmtWZk9KVzYxTG9T?=
 =?utf-8?B?MDRzSDBSWkR2cDlFdmxPQS96WWpSMGdpRjAvTjFTVjhPOUJ0VkpQKzJUWWN5?=
 =?utf-8?Q?b+IzkrlF5LpXRCuBzVqNgqm8V?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8aba7aca-4d2c-43ff-12e5-08dce83cab20
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2024 08:30:44.6244
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d+tcKkzSnYiC4v9C0MfQaUsyhFM91UUietVxWnlLeKKRZa/K20xKJ+oegTjjCTjyelYYZyZNHl8kqg5IA9jb/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7203

SGkgTGFydWVudCwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVy
ZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6
IFR1ZXNkYXksIE9jdG9iZXIgOCwgMjAyNCA1OjQ0IEFNDQo+IFRvOiBHLk4uIFpob3UgKE9TUykg
PGd1b25pdS56aG91QG9zcy5ueHAuY29tPg0KPiBDYzogcm1mcmZzQGdtYWlsLmNvbTsgbWFydGlu
a0Bwb3N0ZW8uZGU7IGtlcm5lbEBwdXJpLnNtOw0KPiBtY2hlaGFiQGtlcm5lbC5vcmc7IHNoYXdu
Z3VvQGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVuZ3V0cm9uaXguZGU7DQo+IGtlcm5lbEBwZW5ndXRy
b25peC5kZTsgZmVzdGV2YW1AZ21haWwuY29tOyBpbXhAbGlzdHMubGludXguZGV2OyBsaW51eC0N
Cj4gbWVkaWFAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMC8zXSBtZWRpYTogaW14OG1xLW1pcGktY3NpMjogU2ltcGxpZnkgcG93ZXINCj4gbWFu
YWdlbWVudCBoYW5kbGluZw0KPiANCj4gSGkgR3VvLA0KPiANCj4gT24gTW9uLCBTZXAgMzAsIDIw
MjQgYXQgMDc6NTE6NDVBTSArMDAwMCwgRy5OLiBaaG91IChPU1MpIHdyb3RlOg0KPiA+IE9uIE1v
bmRheSwgU2VwdGVtYmVyIDMwLCAyMDI0IDM6MjIgUE0sIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6
DQo+ID4gPiBPbiBNb24sIFNlcCAzMCwgMjAyNCBhdCAwNzowODowOUFNICswMDAwLCBHLk4uIFpo
b3UgKE9TUykgd3JvdGU6DQo+ID4gPiA+IE9uIFN1bmRheSwgU2VwdGVtYmVyIDI5LCAyMDI0IDk6
NDQgUE0sIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBIZWxs
bywNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoaXMgc21hbGwgcGF0Y2ggc2VyaWVzIGlzIGEgcmVh
Y3Rpb24gdG8gIltQQVRDSF0gbWVkaWE6IG54cDoNCj4gPiA+ID4gPiBpbXg4bXEtbWlwaS1jc2ky
OiBGaXggQ1NJIGNsb2NrcyBhbHdheXMgZW5hYmxlZCBpc3N1ZSIgKFsxXSkuDQo+ID4gPiA+ID4g
SW5zdGVhZCBvZiBtYWtpbmcgdGhlIFBNIGhhbmRsaW5nIG1vcmUgY29tcGxleCwgSSB0aGluayBp
dCBjYW4gYmUNCj4gZ3JlYXRseSBzaW1wbGlmaWVkLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSSBo
YXZlIG9ubHkgY29tcGlsZS10ZXN0ZWQgdGhlIHBhdGNoZXMuIEd1b25pdSwgY291bGQgeW91IGdp
dmUgdGhpcyBhDQo+IHRyeSA/DQo+ID4gPiA+DQo+ID4gPiA+IEFmdGVyIGFwcGx5aW5nIHRoZSBw
YXRjaGVzIGFuZCB0ZXN0IGJvdGggb24gaU1YOFVMUC4NCj4gPiA+ID4NCj4gPiA+ID4gRm9yIGlN
WDhVTFAsIGl0IHdpbGwgY2F1c2Uga2VybmVsIGR1bXAgd2hlbiBhY2Nlc3MgQ1NJIHJlZ2lzdGVy
cw0KPiA+ID4gPiBhbmQgc3lzdGVtIGhhbmcgZHVyaW5nIGRvIHN1c3BlbmQvcmVzdW1lIHdoaWxl
IHN0cmVhbWluZyBOZWVkIHRvDQo+ID4gPiA+IGFkZCBzeXN0ZW0gc3VzcGVuZC9yZXN1bWUgaGFu
ZGxlcnMgYW5kIGNhbGwNCj4gPiA+ID4gcG1fcnVudGltZV9mb3JjZV9zdXNwZW5kL3Jlc3VtZSBp
biB0aGUgaGFuZGxlcnMuDQo+ID4gPiA+DQo+ID4gPiA+IEkgdHJpZWQgdG8gZGVidWcgdGhpcyBp
c3N1ZSBhbmQgZm91bmQgcG0gcnVudGltZSBjYWxsYmFjayB3b24ndCBiZQ0KPiA+ID4gPiBjYWxs
ZWQgd2hlbiBzeXN0ZW0gcmVzdW1lLiBUaGUgc3RhdGUgb2YgcG93ZXIgZG9tYWluIHdvbid0IGVu
YWJsZWQuDQo+ID4gPg0KPiA+ID4gVGhhbmsgeW91IGZvciB0ZXN0aW5nLg0KPiA+ID4NCj4gPiA+
IEkgd29uZGVyIGlmIHRoaXMgY291bGQgYmUgY2F1c2VkIGJ5IHRoZSBDU0kgYnJpZGdlIGJlaW5n
IHJlc3VtZWQNCj4gPiA+IGZyb20gc3lzdGVtIHNsZWVwIGJlZm9yZSB0aGUgQ1NJLTIgcmVjZWl2
ZXIuIENvdWxkIHlvdSBjaGVjayBpZg0KPiA+ID4gdGhhdCdzIHRoZSBjYXNlID8gSWYgc28sIGRv
ZXMgdGhlIGZvbGxvd2luZyBjaGFuZ2UgZml4IHRoZSBpc3N1ZSA/DQo+ID4NCj4gPiBJIHRlc3Rl
ZCBvbiBpTVg4VUxQIHdoaWNoIGRvbid0IHVzZSBDU0kgYnJpZGdlIGJ1dCBJU0ksIG5vdCBpTVg4
TVEuIEluDQo+ID4gSVNJIGRyaXZlciwgSSBub3RpY2UgdGhhdCBpdCBhbHJlYWR5IGhhbmRsZXIg
dGhlIGRldmljZSByZWxhdGlvbnNoaXAgd2hlbiBzdWJkZXYNCj4gYm91bmQgbGlrZSBiZWxsb3c6
DQo+ID4NCj4gPiBsaW5rID0gZGV2aWNlX2xpbmtfYWRkKGlzaS0+ZGV2LCBzZC0+ZGV2LCBETF9G
TEFHX1NUQVRFTEVTUyk7IGlmDQo+ID4gKCFsaW5rKSB7DQo+ID4gICAgICAgICBkZXZfZXJyKGlz
aS0+ZGV2LA0KPiA+ICAgICAgICAgICAgICAgICAiRmFpbGVkIHRvIGNyZWF0ZSBkZXZpY2UgbGlu
ayB0byBzb3VyY2UgJXNcbiIsIHNkLT5uYW1lKTsNCj4gPiAgICAgICAgIHJldHVybiAtRUlOVkFM
Ow0KPiA+IH0NCj4gDQo+IEFoIHllcyBpbmRlZWQgd2l0aCB0aGUgSVNJIGl0IHNob3VsZCBhbHJl
YWR5IGJlIGhhbmRsZWQuDQo+IA0KPiBJIGNhbid0IHRlc3QgdGhpcyBvbiBoYXJkd2FyZSBub3cg
YXMgSSdtIHRyYXZlbGxpbmcuIElzIHRoZSBzeXN0ZW0gaGFuZyBoYXBwZW5pbmcNCj4gYXQgc3Vz
cGVuZCBvciByZXN1bWUgdGltZSA/IFdoYXQgaXMgdGhlIG9yZGVyIG9mIHRoZSBzdXNwZW5kL3Jl
c3VtZSBoYW5kbGVycw0KPiBjYWxscyBmb3IgdGhlIGlteDgtaXNpIGRyaXZlciBhbmQgdGhlDQo+
IGlteDhtcS1taXBpLWNzaTIgZHJpdmVyID8NCg0KIzEpIElzIHRoZSBzeXN0ZW0gaGFuZyBoYXBw
ZW5pbmcgYXQgc3VzcGVuZCBvciByZXN1bWUgdGltZSA/DQogICAgICAgQWZ0ZXIgYXBwbHlpbmcg
eW91ciBwYXRjaGVzLCBzeXN0ZW0gaGFuZyB3aWxsIGhhcHBlbmVkIGF0IHJlc3VtZSB0aW1lLiBB
ZGRpbmcNCiAgICAgICBsb2cgYW5kIGVuYWJsZSBub19jb25zb2xlX3N1c3BlbmQsIEkgY2FuIGtu
b3cgdGhlIHRoZSBwb2ludCBvZiBjYXVzaW5nIGlzc3VlIGlzDQogICAgICAgYWNjZXNzaW5nIENT
SSByZWdpc3RlcnMgd2hlbiB0b3AtbGV2ZWwoSVNJKSBkZXZpY2UgdHJ5IHRvIGVuYWJsZSBzdHJl
YW0gZnJvbSBDU0kgaW4NCiAgICAgICBJU0kgcmVzdW1lIGNhbGxiYWNrIGxpa2UgYmVsbG93Og0K
ICAgICAgIG14Y19pc2lfcG1fcmVzdW1lKGRldikNCiAgICAgICAgICAgbXhjX2lzaV92aWRlb19y
ZXN1bWUocGlwZSkNCiAgICAgICAgICAgICAgIG14Y19pc2lfcGlwZV9lbmFibGUocGlwZSkNCiAg
ICAgICAgICAgICAgICAgICB2NGwyX3N1YmRldl9lbmFibGVfc3RyZWFtcyguLi4pICAgICAgIA0K
ICAgICAgICAgICAgICAgICAgICAgICAgbXg4bXFfbWlwaV9jc2lfc19zdHJlYW0oKQ0KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGlteDhtcV9taXBpX2NzaV9zdGFydF9zdHJlYW0oKQ0KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbXg4bXFfbWlwaV9jc2lfc2V0X3BhcmFtcyhz
dGF0ZSkNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlteDhtcV9taXBpX2Nz
aV93cml0ZShzdGF0ZSwgQ1NJMlJYX0NGR19OVU1fTEFORVMsIGxhbmVzIC0gMSk7ICAgICAgPC0t
LSAgIGNhdXNpbmcga2VybmVsIHBhbmljIGFuZCBzeXN0ZW0gZG9uJ3QgaGF2ZSBhbnkgcmVzcG9u
c2UNCg0KIzIpIFdoYXQgaXMgdGhlIG9yZGVyIG9mIHRoZSBzdXNwZW5kL3Jlc3VtZSBoYW5kbGVy
cyBjYWxscyBmb3IgdGhlIGlteDgtaXNpIGRyaXZlciBhbmQgdGhlDQogICAgICAgaW14OG1xLW1p
cGktY3NpMiBkcml2ZXIgPw0KICAgICAgIFN1c3BlbmQ6IElTSSAtPiBDU0kNCiAgICAgICBSZXN1
bWU6IENTSSAtPiBJU0kNCg0KT25lIG1vcmUgdGhpbmcgd2hlbiBJIGRlYnVnZ2luZyB0aGlzIGlz
c3VlIHRoYXQgdGhlIHZhbHVlIG9mIENTSSBkZXZpY2UgInBvd2VyLnVzYWdlX2NvdW50IiBpbiB0
d28gY2FzZXMNCg0KQ2FzZSAxOiBEb24ndCBkbyBzeXN0ZW0gc3VzcGVuZC9yZXN1bWUgYW5kIG9u
bHkgcnVuIGNhbWVyYSB0ZXN0Lg0KICAgICAgICAgICAgICBUb3AtbGV2ZWwgZGV2aWNlKElTSSkg
Y2FuIGNhbGwgQ1NJIHNfc3RyZWFtIHdoZW4gc3RhcnQvc3RvcCBjYXB0dXJlIGFuZCBDU0kgcnVu
dGltZV9zdXNwZW5kL3Jlc3VtZSB3aWxsDQogICAgICAgICAgICAgIGJlIGNhbGxlZCBpbiB0aGlz
IGNhc2Ugc2luY2UgdGhlIHZhbHVlIG9mIENTSSBkZXZpY2UgcG93ZXIudXNhZ2VfY291bnQgaXMg
MQ0KDQpDYXNlIDI6IFJ1biBjYW1lcmEgdGVzdCBmaXJzdCBhbmQga2VlcCBpdCBydW4gaW4gYmFj
a2VuZCwgdGhlbiBydW4gc3lzdGVtIHN1c3BlbmQvcmVzdW1lLg0KICAgICAgICAgICAgICBUb3At
bGV2ZWwgZGV2aWNlKElTSSkgd2lsbCBDU0kgc19zdHJlYW0oKSB0byBzdGFydCBjYXB0dXJlIHdo
ZW4gcnVuIGNhbWVyYSB0ZXN0IGFuZCB0aGVuLCBJU0kgc3lzdGVtIHN1c3BlbmQNCiAgICAgICAg
ICAgICAgY2FsbGJhY2sgd2lsbCBkaXNhYmxlIHN0cmVhbSBmcm9tIENTSSBieSBjYWxsaW5nIHNf
c3RyZWFtKCksIHRoZSBwbV9ydW50aW1lX3B1dChkZXYpIGRvZXNuJ3QgY2FsbCBDU0kgcnVudGlt
ZQ0KICAgICAgICAgICAgICBzdXNwZW5kIGNhbGxiYWNrIHNpbmNlIHRoZSB2YWx1ZSBvZiBDU0kg
ZGV2aWNlIHBvd2VyLnVzYWdlX2NvdW50IGlzIDIuDQoNCkknbSBub3Qgc3VyZSBpZiBpdCdzIGhl
bHBmdWxsLCBqdXN0IGZvciB5b3VyIHJlZmVyZW5jZS4gICAgICAgDQoNCj4gDQo+ID4gRm9yIGlN
WDhNUSwgSSdtIHRyeWluZyB0byBlbmFibGUgaXQsIGJ1dCBtZWV0IHNvbWUgcHJvYmxlbXMsIHNv
IGNhbid0DQo+ID4gZ2l2ZSB5b3UgdGhlIHJlc3VsdHMgaW4gc2hvcnQgdGltZS4NCj4gPg0KPiA+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDctbWVkaWEtY3Np
LmMNCj4gPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14Ny1tZWRpYS1jc2kuYw0K
PiA+ID4gaW5kZXggOTU2NmZmNzM4ODE4Li5jNjZiMDYyMWUzOTUgMTAwNjQ0DQo+ID4gPiAtLS0g
YS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg3LW1lZGlhLWNzaS5jDQo+ID4gPiArKysg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg3LW1lZGlhLWNzaS5jDQo+ID4gPiBAQCAt
MjA1Nyw5ICsyMDU3LDIyIEBAIHN0YXRpYyBpbnQgaW14N19jc2lfbm90aWZ5X2JvdW5kKHN0cnVj
dA0KPiA+ID4gdjRsMl9hc3luY19ub3RpZmllciAqbm90aWZpZXIsICB7DQo+ID4gPiAgCXN0cnVj
dCBpbXg3X2NzaSAqY3NpID0gaW14N19jc2lfbm90aWZpZXJfdG9fZGV2KG5vdGlmaWVyKTsNCj4g
PiA+ICAJc3RydWN0IG1lZGlhX3BhZCAqc2luayA9ICZjc2ktPnNkLmVudGl0eS5wYWRzW0lNWDdf
Q1NJX1BBRF9TSU5LXTsNCj4gPiA+ICsJc3RydWN0IGRldmljZV9saW5rICpsaW5rOw0KPiA+ID4N
Cj4gPiA+ICAJY3NpLT5zcmNfc2QgPSBzZDsNCj4gPiA+DQo+ID4gPiArCS8qDQo+ID4gPiArCSAq
IEVuZm9yY2Ugc3VzcGVuZC9yZXN1bWUgb3JkZXJpbmcgYmV0d2VlbiB0aGUgc291cmNlIChzdXBw
bGllcikgYW5kDQo+ID4gPiArCSAqIHRoZSBDU0kgKGNvbnN1bWVyKS4gVGhlIHNvdXJjZSB3aWxs
IGJlIHN1c3BlbmRlZCBiZWZvcmUgYW5kIHJlc3VtZQ0KPiA+ID4gKwkgKiBhZnRlciB0aGUgQ1NJ
Lg0KPiA+ID4gKwkgKi8NCj4gPiA+ICsJbGluayA9IGRldmljZV9saW5rX2FkZChjc2ktPmRldiwg
c2QtPmRldiwgRExfRkxBR19TVEFURUxFU1MpOw0KPiA+ID4gKwlpZiAoIWxpbmspIHsNCj4gPiA+
ICsJCWRldl9lcnIoY3NpLT5kZXYsDQo+ID4gPiArCQkJIkZhaWxlZCB0byBjcmVhdGUgZGV2aWNl
IGxpbmsgdG8gc291cmNlICVzXG4iLCBzZC0NCj4gPm5hbWUpOw0KPiA+ID4gKwkJcmV0dXJuIC1F
SU5WQUw7DQo+ID4gPiArCX0NCj4gPiA+ICsNCj4gPiA+ICAJcmV0dXJuIHY0bDJfY3JlYXRlX2Z3
bm9kZV9saW5rc190b19wYWQoc2QsIHNpbmssDQo+IE1FRElBX0xOS19GTF9FTkFCTEVEIHwNCj4g
PiA+ICAJCQkJCSAgICAgICBNRURJQV9MTktfRkxfSU1NVVRBQkxFKTsgIH0NCj4gPiA+DQo+ID4g
PiA+ID4gWzFdDQo+ID4gPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDkyOTEw
MTYzNS4xNjQ4MjM0LTEtZ3Vvbml1Lnpob3VAbw0KPiA+ID4gPiA+IHNzLm54cC5jb20NCj4gPiA+
ID4gPg0KPiA+ID4gPiA+IExhdXJlbnQgUGluY2hhcnQgKDMpOg0KPiA+ID4gPiA+ICAgbWVkaWE6
IGlteDhtcS1taXBpLWNzaTI6IERyb3Agc3RyZWFtIHN0b3AvcmVzdGFydCBhdCBzdXNwZW5kL3Jl
c3VtZQ0KPiB0aW1lDQo+ID4gPiA+ID4gICBtZWRpYTogaW14OG1xLW1pcGktY3NpMjogRHJvcCBT
VF9TVVNQRU5ERUQgZ3VhcmQNCj4gPiA+ID4gPiAgIG1lZGlhOiBpbXg4bXEtbWlwaS1jc2kyOiBE
cm9wIHN5c3RlbSBzdXNwZW5kL3Jlc3VtZSBoYW5kbGVycw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDhtcS1taXBpLWNzaTIuYyB8IDExMw0KPiA+
ID4gPiA+ICsrLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgMTAzIGRlbGV0aW9ucygtKQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiBiYXNlLWNvbW1pdDogODFlZTYyZThkMDllZTNjNzEwN2QxMWM4YmJmZDY0MDczYWI2
MDFhZA0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg==

