Return-Path: <linux-media+bounces-19480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A8499B004
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 04:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2177C1F2296A
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 02:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2304510A0C;
	Sat, 12 Oct 2024 02:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kXQXRMzE"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010067.outbound.protection.outlook.com [52.101.69.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33413D528;
	Sat, 12 Oct 2024 02:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728699288; cv=fail; b=LdD7KsPPWSI8+/M2zyzOxpQXOEZ0p9ePHfDuRo5cuzm8AUh3vrKXk/z3bonPp7canfws39JHioioMtF5/roxE+3GrUYSqPc3WULweUODusj1bjvwSwUNhYw/lu/LYtRoKhuwla1GdZYJ9SfLTZ5JSR+K8zYo3i1euK+KwfBVPwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728699288; c=relaxed/simple;
	bh=ZONAlQznWJw4OSHvNrEKWVUPKyfjw3AekzyGx/UtomI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=DbxWJwXCwQEvNvvxYMdcSgzxuiBhPblIpCWCdKe4y+qjuaKeBmIoAGNCwIGhfv7gXeFOb14poekNJrGPrke80QKwWwnyalOopSzzIflmWL7n9oxON+aaHXpRyV1+nK0igEaeb+Ywzz4QFn1pKkMLTLzZcQKYgmPTiBe0AY8libc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kXQXRMzE; arc=fail smtp.client-ip=52.101.69.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VadtqR99wSgmUZ2zVfW+rlUIpGKpyB2ukaOhjjFy7qm64Pt4HkV0wkVkFNT9FcKsEF7CD7XcY0BnUc4ZkkDtUon+cnwhEAYi4H2128+djmTQxTvEOawu1xsjgUlgSLdJJDuPZ/6MELE9LxH2D9yPJUEzHG/0Me6XiYvTbKyQBE6lY9yp1Jc5U/dJ4EIWg2AWCF8Il9mVCe0pZDrK18MBJ6aF/jqmvfiyT8NKh7re1ufkNakRWbKimhGH3SKO6Y0RM+kYtySjgSJveQLRAzfyrD/Eox63Smb5p08LtIENt3zzKVbazXBS1LEiCS6GW6HfAuvn7TMok+THprlY1+Cuag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZONAlQznWJw4OSHvNrEKWVUPKyfjw3AekzyGx/UtomI=;
 b=JYBG55u/FaojsbTJBjnKwon54ahcwraaclTfWmTR2lv/l6xLvh03oWTUVLDbJECk2GDBuSqjoEzQORlqP3uSr+g3/RCiRDSZ+Apky4ODXxkUPEO6PL/iFWWH1vk5OjHvMl1sGDww5Fo9LO1HyIK0OX4fBPAAIdVXRIJciEHgDExYP4wTodH/qYfeae/lgibEaoiNs/5qsaF8HzdVllx0J3DN0blFxrVgAFA3tTZAFVJc1qUsoJ5cGaluU+rrvKoVE4BnnTum6V73EOe32gtgF86MernT5Ot0T6v6/GCCYj/ngV7o61zt8gu5W7QdXajoy8jDcqL/cmt9Pnp6OgJi9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZONAlQznWJw4OSHvNrEKWVUPKyfjw3AekzyGx/UtomI=;
 b=kXQXRMzETn2OodbqtNlL4Cm0O0ZK8gwG1889V+Rk5Q2gQmTZwHTg+0R9KGtfKI1qd3Ofy5hs1WpSg8baKgjW/vNl4gAZ7zVR4P76mrmV+2VrPcey6Osej7mpBYVcWj9wodOBejPsn2kGUsM/86BC86gLd1Umd/FTshIbhO8kIKthR8kKcj8p+v3rMgn8q8gjf/cacYQXnNKFu2miSgN6xWegUniZkKBy73zf29BrlgmOO9okjQsCQ+CUJ3qk2FVUrh12OruotbCpa/Lzbtzm9MWiRKns+/g4TgO6GSWL4v5C4D8zlgVAi6rlvhL2NcRKIydyvez1lgQLVb2Vu9LjgA==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8128.eurprd04.prod.outlook.com (2603:10a6:102:1c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Sat, 12 Oct
 2024 02:14:42 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.8048.018; Sat, 12 Oct 2024
 02:14:42 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"jacopo@jmondi.org" <jacopo@jmondi.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.d"
	<kernel@pengutronix.d>, "festevam@gmail.com" <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] media: nxp: imx8-isi: Add i.MX8ULP support
Thread-Topic: [PATCH 1/2] media: nxp: imx8-isi: Add i.MX8ULP support
Thread-Index: AQHbG8a7ZTpv6CiNo0+xFH+lJ/KZRrKBjAGAgADSygA=
Date: Sat, 12 Oct 2024 02:14:42 +0000
Message-ID:
 <AS8PR04MB90809F7A6C2FF1E46CA06AFCFA7A2@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20241011101711.704226-1-guoniu.zhou@oss.nxp.com>
 <20241011101711.704226-2-guoniu.zhou@oss.nxp.com>
 <20241011133047.GC9543@pendragon.ideasonboard.com>
In-Reply-To: <20241011133047.GC9543@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PAXPR04MB8128:EE_
x-ms-office365-filtering-correlation-id: e1b9c627-ad4d-4c2c-7d19-08dcea63a238
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?UHdOZlorRm1QYXl1NUNRbVNaaGZIM2N6NmxQZTZWSVFZRHJUbUtsSHBDL25y?=
 =?utf-8?B?emc1UzJiQUhoN3BhcnZUL1NMd0RReFArMEIxcGx3MkxjQnNQdStaRytzSEhT?=
 =?utf-8?B?TFZSWjhMbC8wUVRDNUpaVTBNQnhVNXFLNmFGR2VCN2tWdUhtV3VmU0t1NkxW?=
 =?utf-8?B?VEdSekQ3THBaMGdkZGw5ckR6WmxwalQ4RzlQMlNUMXBuSGJDKzdYb2ZZVklY?=
 =?utf-8?B?Z1hVRFNkc0VjK3F6SHMyRGxVQ2FuNkNPOGlyay9FWEZoa1JEdzc2K1k1cmYw?=
 =?utf-8?B?NTB4VHJsemFHUFhGU21sbXlSVzJ6RStPV3hhdVdLcmtYVWFkYjZEclMwRG9u?=
 =?utf-8?B?YnZaelRjcUlvT2FUODh6dE9Ia0tXQTMrOXRRODg0OTFhbFZlMG5iOHh5b1JF?=
 =?utf-8?B?WU1mblBtbVRHUlBNQVpEZi9mTS9aNkJNVEFwdDRDMTA3MUlMdllVK3F5SU1X?=
 =?utf-8?B?U1dEVU9hMHU4NS9jYllLS2lwbG42cVZDYlp4MW5BTzJsNWRmVjlIenVWMWlq?=
 =?utf-8?B?TG1iWEJSclQ0anV0T0tZOXpNSnBhYTNJSWJ0c2RVanVjT2ZzNkJFdlNNWHhK?=
 =?utf-8?B?b2h2SzNDZGVrWUlyMEFWZ0pvaU45V3ZocDJ4THl5ZE5rMEtKRGo2MWNVRzhy?=
 =?utf-8?B?V0Y2Y0Z5M0V5UVNpaU9tQWk3YWQwcEpTVitJaVk5OUxMVGxESUVpek82RTFT?=
 =?utf-8?B?SlZOUkI3UmxsYklJaU1vaWh4TGRUTmdRSWs5RE9kUkR0M3RyM2tFUDRKRlNH?=
 =?utf-8?B?Tll3Ly90VVR5R1hPUGg4cUlmSWxBVnR6YmdUUWkvMkVDRjI5M2lHM0hJKzhW?=
 =?utf-8?B?M244OTd5TnJCZllyWW1EbW02eEVMTzk0SG5QcGZaMHg2MERLWDhlaGU5aXU0?=
 =?utf-8?B?NFZGeWE0c3BKVVBOYjhid2VRNG44NnppQnVUSWhUZVdGTHFYYURsZEZSYW9Y?=
 =?utf-8?B?R3BvNTdDTU53QUZQNW1abEtNZGxGcnovZVNCcjkvQ0NpMEhtNmpaMkduMyto?=
 =?utf-8?B?SWRDSnRwOWxnbVBUSTNtemVTcEs3UzRGa3BzTlNkRTRNTjN3eDdoWW8zOEhL?=
 =?utf-8?B?QmgxQnljVmxkVmV5ZW9nbk1LSTdBemhhSFA1TVlzcFlEZThsWHgxYm05R2Rw?=
 =?utf-8?B?SFJuUG5BZVBIcCtkRUhHa3ZOcXdFS0tMcThta2krbW5TeDZOdnBseWlSSC9H?=
 =?utf-8?B?ZjRoY3IycXp5WVhYNisvTEdrY1pVWFBnNVdTdlpBajJLVnlUVUE5Y0VjdWVy?=
 =?utf-8?B?cW9WTzRCU0VMOXdMYlplRzVSQk9JRnAzRDlaNXRHaHlMMWQ5Qmc4cXdqVVQx?=
 =?utf-8?B?NDFvd1kxR3laUTlvbWMyY3pXaWY1M240K2w5cTJGV0JVM3h3cGkwYzFOQXFU?=
 =?utf-8?B?TzhnbFZuV3FZTWw4Q1ppaXg3OWxqTDZNN2IwVjhuVmdvQUdLenJYbHRXUmhO?=
 =?utf-8?B?R0JxQktIcXMxamJnMHVKYjNHRkVrR1lVeXNwaXZjZjFNb2lVbmJhTEs3MVRl?=
 =?utf-8?B?K0d5dDhlbXlWV2g1ZDZqeitETGk3QXNpaXowb2pZS1YwQ3lha3I1b2Qzd3RZ?=
 =?utf-8?B?NndrNWIxWXlJNUpxVlVxaW5rWW5PYTlQMzI2d3lCdHl6OWZzaWxjTUllUEs5?=
 =?utf-8?B?alhyemp6cmlIa3dreGlTZG16ajJ3cG0rdDlCU3pIOGdSUjZ3TXp2ODEzVldR?=
 =?utf-8?B?c2wzSkNuVjhyQUdoSFd2MmRZdE1Vc0p6aWZ2eWx6Q2VFOVNSUmJ4ZmRzR2pT?=
 =?utf-8?B?T2tCNGphVW1OR00wWTRrTkVJSjRQQ3BaM0NuaUdRdkNOMDZWRVM5Q0I4cXZT?=
 =?utf-8?B?RkZ1YVF1UFpSc2xkOTlkUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b2FZR0d6MHVkTk5rbGNjYTNFb2RSSmh2WndnOER1Y2FpZG5KVC9VeUZXZXg4?=
 =?utf-8?B?VVZEYllXZ3pMeWVnQ3JRaVhPUXFlM1dvaThxR3BvbGlVZG1tVDVKMUJVcE1y?=
 =?utf-8?B?NkJic21QQTVZRlBHVFZwZ0p6ZU51dHdOWUJCMG1LTzRMNkorbzdaQXZxdStw?=
 =?utf-8?B?RW9UNlJGYUtFZmRkUm1IWWtJaG45em9JTmhRTHlPaTNuTUxGMElZNjNuOXF6?=
 =?utf-8?B?bW45amZtRVNBeEhKYnA1ajR2K0xKaGZvSGYvRy9YVVQzU2phckl1Vkt6OG0v?=
 =?utf-8?B?ODgraUhzeURSR1dSUXBQN0VMRmxoZk1EVkkrNENTWXBuS2pjcEF5OExhcVZ4?=
 =?utf-8?B?WlEzcmg5OUhYVjhPYllFenhDd0JSSDFxaCt1WWZreWJTTjJHRnpRUmJCRk5r?=
 =?utf-8?B?R2tGVW8zUG02dUVMdG5BelZpQW1Uc21CckpYWkRiWWl5dWRiMDdxMFV6TDMr?=
 =?utf-8?B?OEUvYVBIWGFBaFQ4RElzZzhCZnlCb3QxamdkTWFOd3VEMDg0clVOUTNBK1dT?=
 =?utf-8?B?TWRvVXN4TXhHZHZrMHI1K0tpMFZRMkdncUVKeHdhVHh6bUd4SWRCSnRSOFFW?=
 =?utf-8?B?ZmV5TVc5VnJ4WGNVSVdWRUxsUXN6TUxlT3JLbXZHVzJMZVIyRFdQaGFOOWwr?=
 =?utf-8?B?dVlyNDhZVTkvQzF3aUErejBPZzU2alpVdnFXNEoxV0NWY09rYnRqTjQvSWdU?=
 =?utf-8?B?OWhOODh3aDRjTW4wWFhyaXhqWDBTZVRNc1FVSXJhV1dJQm11c2NvTFZ4UGM5?=
 =?utf-8?B?WVc5UHhNMC9WZHhyVXZLRXVhSVNZNUJNemRvQVVscHBRZjQvcDZ6d3A2aHZW?=
 =?utf-8?B?TW9WZE5xRmFUeHdpZ3UwZkJXMUtEWHk1RkNXRFFsTDl5SHYxckdyaE1Za3dO?=
 =?utf-8?B?WDcvOWhRc1Q0ZWNlUndNUFZ4V0FIUU9LZVp4cEgwMFVUMnFLUkkyNnV3Uk9D?=
 =?utf-8?B?NmFZaTlkamtzZC9aSWZyclcxNUpTdFRDZ1Mvb1lpSm94MEZoOURST2J2LzVr?=
 =?utf-8?B?d2pTazZydTlZNWZ4S2dRMjJtd2R6SDlFRnk3VVFlSytZQzZGcTVnRk9IR2pO?=
 =?utf-8?B?KzZFWnFxdkNQcTZOY1h0aVB3S0RUbkpxQkpQVzNmeURuSnJDakowdmhQZjRR?=
 =?utf-8?B?ZGpNMVBJN1RpTTJjRlhVZk10aVRhWHZZc1lWbVYrNmxmQkljaUY5TkFHbThy?=
 =?utf-8?B?L0RKTWVMVGs0Mnk5OVZJdnBMWisvV1hrU0VyWVorNkx0QndpOUwydGFQWVYw?=
 =?utf-8?B?a0I4RE9sYzlVWmhzaTMzeHFEbzljSy9DM2Y5STZ1VkRnRmswYjV0V29Ld2pP?=
 =?utf-8?B?VktOVmxVeDVMaS9UZEovN2dlc1padjlmSlJPQVVhZ3JWTk5BcTBHeVVMTkth?=
 =?utf-8?B?dHJkUnQzdGJsYldyekVyRmNna3lyN2lzRjNsWTN6ZTBZcEFvczEycGlYdUtO?=
 =?utf-8?B?MVFHODVxNHVkMjNPVnF5UUxZSVh5Wk5vMFppbGs1OVBla3ZMYjZkdlZvN1pW?=
 =?utf-8?B?dmh6MjlJdGhBTXk1OTRJdE0yakpoZ2RGcnJ5TkV4eWlsQWl3cG8yN3FxR0dS?=
 =?utf-8?B?cEhaV0JZMjlmTmRwMUNENFdoY2s3R2JuQnJZK3dPeE5JVGF5S2lwZFNMWUJE?=
 =?utf-8?B?eU5Wa2pvVE9Ham9WOGxucTZ5SHJWY2hHUHRtRWFJK0hUd014UWNHK0Y4cUFp?=
 =?utf-8?B?Q21SOTJaS0gxTDFyMDdXNVgzUzBGcWRtRldwb0NXb1lQaVpnNUtyaFFldDhh?=
 =?utf-8?B?TFUzam5YdS8vNzlYdFQ4UFM4RTFoYlVYK0FqYkNOUWViQjcrY25WbFcyRExp?=
 =?utf-8?B?cE5mU3dqSE0rajl4OTNqL3pHdEVhNVFRYzJ4aE1yRmNhQW9Dbzg0L2hvdThL?=
 =?utf-8?B?ME02cEVxRHpHVW1yWU84bnZBWVdObmptUTI4cng3Mzh5SllhOC9NQjdaVERz?=
 =?utf-8?B?K1BoWUkwOWo0dlE4TUhNSDFmL0lGNDZvNkJJczVpd1FxSlI2TFpRc0xaMVB1?=
 =?utf-8?B?K1drR1pyQmpWNHFxTnJnZzd2TE10QjlLRVMxZWtyZk9TaEcvSW9hUmlydmRC?=
 =?utf-8?B?WWxIcDNnMDBBQzlmZWZhbmlVazNacVpsT3A0bWJNdGdzWVlHZDNaVk5MUjhE?=
 =?utf-8?Q?ZtqiqkaOxnvfgesVoGdckaZA/?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e1b9c627-ad4d-4c2c-7d19-08dcea63a238
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2024 02:14:42.3718
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jloKHILngFFhk+tuOgSLTlP+veUvEN93XHtxwt0wR2E9oF5LFPaOmJiDzPWiqHBF2U0yk/G4qlrJknopF8zrVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8128

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB5b3VyIHJlcGx5aW5nLg0KDQo+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDExLCAyMDI0IDk6
MzEgUE0NCj4gVG86IEcuTi4gWmhvdSAoT1NTKSA8Z3Vvbml1Lnpob3VAb3NzLm54cC5jb20+DQo+
IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGphY29wb0BqbW9uZGkub3JnOyBtY2hl
aGFiQGtlcm5lbC5vcmc7DQo+IHJvYmhAa2VybmVsLm9yZzsga3J6aytkdEBrZXJuZWwub3JnOyBj
b25vcitkdEBrZXJuZWwub3JnOw0KPiBzaGF3bmd1b0BrZXJuZWwub3JnOyBzLmhhdWVyQHBlbmd1
dHJvbml4LmRlOyBrZXJuZWxAcGVuZ3V0cm9uaXguZDsNCj4gZmVzdGV2YW1AZ21haWwuY29tOyBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsgbGludXgtDQo+
IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIG1lZGlh
OiBueHA6IGlteDgtaXNpOiBBZGQgaS5NWDhVTFAgc3VwcG9ydA0KPiANCj4gSGkgR3Vvbml1LA0K
PiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBGcmksIE9jdCAxMSwgMjAy
NCBhdCAwNjoxNzoxMlBNICswODAwLCBndW9uaXUuemhvdUBvc3MubnhwLmNvbSB3cm90ZToNCj4g
PiBGcm9tOiAiR3Vvbml1Lnpob3UiIDxndW9uaXUuemhvdUBueHAuY29tPg0KPiA+DQo+ID4gQWRk
IElTSSBzdXBwb3J0IGZvciBpLk1YOFVMUC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b25p
dS56aG91IDxndW9uaXUuemhvdUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vcGxhdGZvcm0v
bnhwL2lteDgtaXNpL2lteDgtaXNpLWNvcmUuYyAgICAgIHwgMTggKysrKysrKysrKysrKysrKysr
DQo+ID4gIC4uLi9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29yZS5oICAgICAgfCAg
MSArDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWNv
cmUuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2kt
Y29yZS5jDQo+ID4gaW5kZXggYzIwMTM5OTUwNDljLi5mNWQwNzZkN2Y1MGIgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29yZS5j
DQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2kt
Y29yZS5jDQo+ID4gQEAgLTI3OSw2ICsyNzksMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtf
YnVsa19kYXRhDQo+IG14Y19pbXg4bW5fY2xrc1tdID0gew0KPiA+ICAJeyAuaWQgPSAiYXBiIiB9
LA0KPiA+ICB9Ow0KPiA+DQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX2J1bGtfZGF0YSBt
eGNfaW14OHVscF9jbGtzW10gPSB7DQo+ID4gKwl7IC5pZCA9ICJwZXIiIH0sDQo+IA0KPiBUaGlz
IGRvZXNuJ3QgbWF0Y2ggdGhlIERUIGJpbmRpbmdzLiBXaGljaCBvbmUgaXMgd3JvbmcgPw0KDQpJ
J20gd3JvbmcuIEl0IHNob3VsZCBiZSAiYXhpIiBzaW5jZSB0aGUgY2xvY2tzIHVzZWQgaGVyZSBp
cyBhDQpnYXRlIGNsb2NrIGNvbnRyb2xsZXIgYnkgUENDKFBlcmlwaGVyYWwgQ2xvY2sgQ29udHJv
bGxlcikgYW5kDQpkZXJpdmVkIGZyb20gIkxQQVZfQVhJX0NMSyIuIEkgd2lsbCB1cGRhdGUgYSBu
ZXcgdmVyc2lvbiB0bw0KY29ycmVjdCB0aGlzLg0KDQo+IA0KPiA+ICt9Ow0KPiA+ICsNCj4gPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBteGNfaXNpX3BsYXRfZGF0YSBteGNfaW14OG1uX2RhdGEgPSB7
DQo+ID4gIAkubW9kZWwJCQk9IE1YQ19JU0lfSU1YOE1OLA0KPiA+ICAJLm51bV9wb3J0cwkJPSAx
LA0KPiA+IEBAIC0zMDcsNiArMzExLDE5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXhjX2lzaV9w
bGF0X2RhdGENCj4gbXhjX2lteDhtcF9kYXRhID0gew0KPiA+ICAJLmhhc18zNmJpdF9kbWEJCT0g
dHJ1ZSwNCj4gPiAgfTsNCj4gPg0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG14Y19pc2lfcGxh
dF9kYXRhIG14Y19pbXg4dWxwX2RhdGEgPSB7DQo+ID4gKwkubW9kZWwJCQk9IE1YQ19JU0lfSU1Y
OFVMUCwNCj4gPiArCS5udW1fcG9ydHMJCT0gMSwNCj4gPiArCS5udW1fY2hhbm5lbHMJCT0gMSwN
Cj4gPiArCS5yZWdfb2Zmc2V0CQk9IDB4MCwNCj4gPiArCS5pZXJfcmVnCQk9ICZteGNfaW14OF9p
c2lfaWVyX3YyLA0KPiA+ICsJLnNldF90aGQJCT0gJm14Y19pbXg4X2lzaV90aGRfdjEsDQo+ID4g
KwkuY2xrcwkJCT0gbXhjX2lteDh1bHBfY2xrcywNCj4gPiArCS5udW1fY2xrcwkJPSBBUlJBWV9T
SVpFKG14Y19pbXg4dWxwX2Nsa3MpLA0KPiA+ICsJLmJ1Zl9hY3RpdmVfcmV2ZXJzZQk9IHRydWUs
DQo+ID4gKwkuaGFzXzM2Yml0X2RtYQkJPSBmYWxzZSwNCj4gPiArfTsNCj4gPiArDQo+ID4gIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbXhjX2lzaV9wbGF0X2RhdGEgbXhjX2lteDkzX2RhdGEgPSB7DQo+
ID4gIAkubW9kZWwJCQk9IE1YQ19JU0lfSU1YOTMsDQo+ID4gIAkubnVtX3BvcnRzCQk9IDEsDQo+
ID4gQEAgLTUyOCw2ICs1NDUsNyBAQCBzdGF0aWMgdm9pZCBteGNfaXNpX3JlbW92ZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlDQo+ID4gKnBkZXYpICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZCBteGNfaXNpX29mX21hdGNoW10gPSB7DQo+ID4gIAl7IC5jb21wYXRpYmxlID0gImZzbCxp
bXg4bW4taXNpIiwgLmRhdGEgPSAmbXhjX2lteDhtbl9kYXRhIH0sDQo+ID4gIAl7IC5jb21wYXRp
YmxlID0gImZzbCxpbXg4bXAtaXNpIiwgLmRhdGEgPSAmbXhjX2lteDhtcF9kYXRhIH0sDQo+ID4g
Kwl7IC5jb21wYXRpYmxlID0gImZzbCxpbXg4dWxwLWlzaSIsIC5kYXRhID0gJm14Y19pbXg4dWxw
X2RhdGEgfSwNCj4gPiAgCXsgLmNvbXBhdGlibGUgPSAiZnNsLGlteDkzLWlzaSIsIC5kYXRhID0g
Jm14Y19pbXg5M19kYXRhIH0sDQo+ID4gIAl7IC8qIHNlbnRpbmVsICovIH0sDQo+ID4gIH07DQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgt
aXNpLWNvcmUuaA0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14
OC1pc2ktY29yZS5oDQo+ID4gaW5kZXggMjgxMGViZTliNWY3Li45YzdmZTllNWY5NDEgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2kt
Y29yZS5oDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14
OC1pc2ktY29yZS5oDQo+ID4gQEAgLTE1OCw2ICsxNTgsNyBAQCBzdHJ1Y3QgbXhjX2dhc2tldF9v
cHMgeyAgZW51bSBtb2RlbCB7DQo+ID4gIAlNWENfSVNJX0lNWDhNTiwNCj4gPiAgCU1YQ19JU0lf
SU1YOE1QLA0KPiA+ICsJTVhDX0lTSV9JTVg4VUxQLA0KPiA+ICAJTVhDX0lTSV9JTVg5MywNCj4g
PiAgfTsNCj4gPg0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQN
Cg==

