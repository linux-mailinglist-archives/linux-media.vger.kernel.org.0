Return-Path: <linux-media+bounces-40250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF02B2BF86
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 12:58:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A1986874AA
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 10:58:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6B5326D46;
	Tue, 19 Aug 2025 10:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="DNUDMmvs"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012012.outbound.protection.outlook.com [52.101.126.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEC42FF16D;
	Tue, 19 Aug 2025 10:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755601070; cv=fail; b=r3yJVA4jtOjafilZ8ekJOIG7y+szP+ytvdxDTCXrUr3Rvsqz1euy4yxlnkn9Ry7eE6cu6PARpar60eYKYdbyI21PVl2FuU616mBg1oKtfcwoSVG4Qe/aUJdF54byGB/+1nPLX4QOzqC9KrRDrK4pT5lsy21A1B0nO0s1jecSAlM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755601070; c=relaxed/simple;
	bh=liGKinINoQY1ZsS2Z/xYjeCGZC4cSKLgmKOgz+iDsBI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=se0VOPlisVIhJy9sboecBPdE7ob/3W1jGxIXRJu84uxFAQi0icFNeeTRMrtmrSI2OmFfwQ8r2catHGtuBeUKkGQGzUZDvRG48w5gsDLKm5Gg4yiUVkK+D+/ZHoL6jKJud0f3o1wd34pL18ZHuanISVH+q1wtSgRA182p7Dr8+AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=DNUDMmvs; arc=fail smtp.client-ip=52.101.126.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dlHmpIgB3X73b5lJO2ehyl6UJMvN6JA6o9fIk8mIYiqLc9rTTrbC4dRe790/G4UNDO7WqPSIk3EIwg8cLMPXgIPyj8ABmn5mBf/TlPYrK7aCdPBOU1W71uzmGb4/2ltteTBp7BCCW+5Yq2sxn5ThZwG6hkDMZo44CI1X4PVb5LtlK+Rc6alVRMhNGMUe0fF74fPKF+f6TmGBcpGPB+/PUM+We8AX2avJHVOXXcnPruw5S4uK+vKDPHgMwz+xrJFSbr9DlMBC1vkWIMoCcga29mMNKDFQqZNMdf9uuIwP5Vle9an1v00gjpg/FaZrAEjly0/wUHbqGSYwbrMXzWn5kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=liGKinINoQY1ZsS2Z/xYjeCGZC4cSKLgmKOgz+iDsBI=;
 b=QYJpNdizy2glbl9vljAGVdN5pQ5ppANrLVJDXLnLVToU8YyAj1YQEKwCotepqBI1fQwefCJQmr6PncPq5re6B4AtAigNZ+gaBbTzNYe+BgZwrbWtuEk9FPMdUxI3B5L51VGk/P1NrsafiO1V0u2EfBFm0J0bV24PJREiaJj1OQ9xnF3OH9ideM4L3ceyI2iz6vWy7j2XReWvC030GQAWyPwavQtOBwx21iw60wcWfQbC+ObPkTBw+5cmlYDl49qJh2YRlVkqhGdHAbGa5JSo+lLH7yZMcWrF6Ej+VceJ5VnNi90JFv5nV3HQGyQXAJNAKqZyrut0dIiwa2gP+vzHIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=liGKinINoQY1ZsS2Z/xYjeCGZC4cSKLgmKOgz+iDsBI=;
 b=DNUDMmvs6UNh5vp4Brh5D6VnwpoFkmRvE2QnOcS5eG5rlSo1yqyVxcqAbRdXcdzkogkWpeZNg/6FYeRbkUzoqfXTqh8g4suyoRcY1sOgcdW2XYCmVhnFMA/jR2FBsJ+0jSp61KDLM7iV/TAP/1pLoPby49gw4U5Gu53rXQ81NdmgkIQlZ9nKEfhH22vK4M2oqT2GEGqM5jMLjEW5xwEatLTmPKcS5bhK1TZK8o1M/Oj9vu8j31XXjtFBgn2sXPq7mmgupMXr572iX03wwyJ23TQcZlt13ehAiArpd2Poix2pQipPpO/mnZvQ3z/v8mjim353bxMHrXcdUceUEZzgEA==
Received: from TYZPR06MB6021.apcprd06.prod.outlook.com (2603:1096:400:336::8)
 by TY0PR06MB5847.apcprd06.prod.outlook.com (2603:1096:400:276::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 10:57:44 +0000
Received: from TYZPR06MB6021.apcprd06.prod.outlook.com
 ([fe80::a774:9376:52a6:8783]) by TYZPR06MB6021.apcprd06.prod.outlook.com
 ([fe80::a774:9376:52a6:8783%7]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 10:57:44 +0000
From: =?utf-8?B?6LW16KW/6LaF?= <zhao.xichao@vivo.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	=?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@baylibre.com>
CC: "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
	"jonathanh@nvidia.com" <jonathanh@nvidia.com>, "skomatineni@nvidia.com"
	<skomatineni@nvidia.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: media: tegra-video: Remove the use of
 dev_err_probe()
Thread-Topic: [PATCH] staging: media: tegra-video: Remove the use of
 dev_err_probe()
Thread-Index: AQHcEOr1A7xwpKeIrE6TeJX9JwrW47Rpxi0AgAAIKwA=
Date: Tue, 19 Aug 2025 10:57:44 +0000
Message-ID: <97c0a0f7-ea4d-452b-956b-27de23cbc11b@vivo.com>
References: <20250819092330.550046-1-zhao.xichao@vivo.com>
 <20250819122830.3d4874ed@booty>
In-Reply-To: <20250819122830.3d4874ed@booty>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6021:EE_|TY0PR06MB5847:EE_
x-ms-office365-filtering-correlation-id: 74e63394-0c24-4b54-9182-08dddf0f39e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SDB5Um1oRFVkbW9iZEdNSjllT3N3ZE9VVWFNRkFQWGFBelhaV2tiUnZWV2to?=
 =?utf-8?B?KzlWWGhPa0R0dnJEN2pwZmIrYVlTR3ZSdW1HZ000cGF2dmVmSXhxaXh5ZTVC?=
 =?utf-8?B?d3dlMkZLdmluVGJodVhNNm1scFFDeG0vK3VxN0dQRWtodG9LZU1PS21GVmVM?=
 =?utf-8?B?Yk51UXUvODlTWGw3NTduZmxRZkNhajlXM2FhdnRjRDJvaFVhUE16SkZRNkx1?=
 =?utf-8?B?d25zMjBuUnF1V0o5TGdNdVFCRUcvYjZGaGpkUWVYc2RzVGRxaW9uVGJFbTcv?=
 =?utf-8?B?czhuT3hqZkZRTC9ZeEtOVDhZRjFjUklmUFg2M1pJN2ZsY0EyZG04aWx6N1Jx?=
 =?utf-8?B?NmdmbGNDazZuY1pRK0xxY3NCbHdINGVKK2FYVVdwRElraVFDckFWL3JsZUtJ?=
 =?utf-8?B?M1ZOVnJyQWNTV2ZYbHA4SWRmMUE1NlZXVWNWd0RGYWJuVVcrOTVBNjZvWkYz?=
 =?utf-8?B?S0ZJdGczKytrWnRRQzBYOExzczloeW9ueFhPeTY1RUYvMlcxUGpxN1k1czJ5?=
 =?utf-8?B?Ry9IVTV0d09NQU5SSjdzNFYrb1hNb2dXTDk4bFhaSGZNQmFTZndSQmRSOGRt?=
 =?utf-8?B?REc0UkRDcXdHb29RQTFQYWwrZ0pQRG5Ndjlxb3BpRnBhT2FhRndYNkF2WlZa?=
 =?utf-8?B?L2xKWFE0OENFaVNkOCttUmFjY3JiV3NLQU5UNGhVUlNwRkF3U3NpYlIwNFp1?=
 =?utf-8?B?bk0rT0JiWkpxRWo3QmxGSHhFeWR2RlFIRDZnTHpxNTJpaGRRRGVHYWpCdzkx?=
 =?utf-8?B?cU5iUjZSUWs4WDliTDAxbFFtY2M1aVRJVkxjSk5Cbm5OYnllNmF6UUJVbzAy?=
 =?utf-8?B?bHpiSjJ2Qm96Y08rWGFMMnhhaHNQN3RWUzlSTUd6ZmNEbkRGVHo4UjF0U1NO?=
 =?utf-8?B?RlVmb2hJRFl4aFlRd3Ezb0hsR0xKRXE2U0l5NUJEdithWXB1cnZSUE1CTVpw?=
 =?utf-8?B?OTRKdklqb0lQUHNuNlAvQzlmY3RsVUIwTzFYR0prdW5OOHRHNFZnYkhQaXRs?=
 =?utf-8?B?THVMWGpocXNhMDU3ZU82eEZReGswSHlsR2xVeFUyTTFHSnNMR3dGaDBWZmp2?=
 =?utf-8?B?bGdXODFHYkxUSVNLNFBQUFFpRG1FU05aT1cyR1NDbk5WQWJialVJZThiZjFy?=
 =?utf-8?B?cWFkemRwTWJKUFJKYjgyOWZTVi95VDJuaXplUjBFZU9JVXo2WlZwZlFkajhS?=
 =?utf-8?B?QmFBOWFoSUFBZ0VvMWZDMHQ4THVmVlhQZU5kc2g3ZTdkTjNsdkFZZkMvSHRs?=
 =?utf-8?B?NFIzd3VpY3J3R0hyYWlpN0VGNVhjT2pjS2FFeHo0UmRjQTh3NmdWSENRNml6?=
 =?utf-8?B?OStyWElyVlNiQlJla3ZaMEFqaHJrODdFeS83YXUrcDdBOWR3cnZTN1Bvcmc5?=
 =?utf-8?B?TGQvMDhReDExUGJha0dWUW5UbDhzZTBFek9nbkVtR0EzOElpbnUrSHozamJW?=
 =?utf-8?B?YlBJUUJMcG5FU3dtRHJYVUF4b05ESzRZR3BUVllteUxhNVhjdTUyaU92OEx5?=
 =?utf-8?B?ckVyaVZmU3FwZ3VlUnkyVjBOR3d5OHh1L3kwSTkzSXhrNWcwaElFRmRjMlFi?=
 =?utf-8?B?N3NqWFFjY1pCNFV1dTFubkhjam4rNmRzWTdUVkplTTMzdVo5MS9HcUg4Tkgz?=
 =?utf-8?B?Z0wwNCtJVHAzeW5jR2hybkVoK2xzVXhPS25tVmdTYjA3OEVmZDJETjdEUUdL?=
 =?utf-8?B?TTZyUXNiZGRkZUZLYjErQWdmSXJHYWJRY0tNYURYNW9KUEszWWlpZGlpRDYr?=
 =?utf-8?B?WWZWbTNqblhpMWdFVEt5eUx1NHJxWGJtbEdYemFKNXJnY0RhcDRwMkJzZGRH?=
 =?utf-8?B?Z3hzKy81SG9CTUpnZ2ZOWnVITFh3UTNtd3REd2RobTUzbDZ4T2pidHd3aGdU?=
 =?utf-8?B?bWZONlhTdlJqaWdKMGV1M29TYjZSRnNGQlpic3cvbkRCWks1YnhQZ2R1enZG?=
 =?utf-8?B?ZFgwdmlSSGdGaTFFV1NwdnI3ZFJPSkxRcUtpbitSWHpPdkFBMzA2Q2Z5K3Vj?=
 =?utf-8?B?TUJSV1Z5U3FBPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6021.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R2FkR0ZKdTZTSFhaQUkrYkxqY09RNGJJUHJ0THNndE5oeThrbzI1eG5DV3lM?=
 =?utf-8?B?YUE0VGRTQ1NZSDRjWG16RG9SQ1VhdlNJN1VIQjl1SFNLVnhKU1RVM2dFSFVu?=
 =?utf-8?B?ckxZOXFjTnFWamVpMXRQREV6aWNqd3BOVUNSaXZaOFFaYUFqWWFlTXVtSnhs?=
 =?utf-8?B?S0l2azBpWVRZekpqOVB5L2d1V1puRkNra2Y1Zkp1MnlCbnJ6SGJyVGxkUXdW?=
 =?utf-8?B?NFl6clU4QWpITjY1RmdwT041NktWWkZvU2xZU1I0N2N6NEFKRTBKWUg5L09j?=
 =?utf-8?B?dWRzYkhxK2FTeVZNblhlOHlBWm1qQlRHNVcwSUVlQXA5STloZTJKOHd0MFVU?=
 =?utf-8?B?azRaOFQrenk1V3E5djFJM0J2dytEMjcvWGVDcEVJd0t3dm83NEdnT1R6VFo3?=
 =?utf-8?B?Z2tXTHFMMFkxTWVqT3Zuek5TT3lrV0hZczBjcytYYzFPclQwSVltMHExU2NK?=
 =?utf-8?B?dGxiTjNQQXNyNWltaU04UGJoRlNqZFNieS9rT00rZXhNSVVmSHEwMmFjWmZo?=
 =?utf-8?B?Y2FrV2VhVEZRL0oxckZ2OU5oL3p1QkdxbXdUWWp6dGlSR2NaVTNjS1drbWR4?=
 =?utf-8?B?UkQ1eXkxekN6MERVQXh0SVNjMk1yYXhGUlhsdWlDUm5tSVFGV2tTc3JRVURl?=
 =?utf-8?B?Mm9vV2d3S00weW0zbDh3OUxYWEhobHVJeXZjcTk5azZuWFNoaGFWUXlTNEJo?=
 =?utf-8?B?QmZaT3dqelpyL3RnYXcvSXhvY3RESFBxZFZuMWg1eHdyVHJod1AycFNIZVNx?=
 =?utf-8?B?Q3V3ckswSzNUL21yVFV4RXgxUWdkRERPRDlyaEV1UWZSaDBObkJEY2JkSlhG?=
 =?utf-8?B?OGZYR1k2UlZIQkorbW1CNWFFRms1UHpBS0Z0MHp2eVJNUmlBNlNURDhvcHB4?=
 =?utf-8?B?SDczNGdOUmRUV3Y1ajBTRGJJT2thTk9sREJ0SFJodlBhMUh6VThyRUpUS0Ja?=
 =?utf-8?B?Q3NseXQrVXFmU2hxS1FacTFwYXRxSmZ4WXVpeFhjNGpubGR4UFhIeXl3aERB?=
 =?utf-8?B?TTNXWjNRS05HalMwQzROQjFXY2g5YWhTd2Z4cmdXR3J0T1F0R1poNW1qcjJn?=
 =?utf-8?B?SVNHSHRaNitEbEo2RUpVZ3krOFFYY24xbFlmcThyWW4vcFA2ZUF2UXlFaFVQ?=
 =?utf-8?B?QVVBazVna3RRNWtnblNZTzJGZ2plTExPZkg1TVQwclhPRjdBaHQ5S3R6REJR?=
 =?utf-8?B?UEUySW05dVdPbmJ6d3ZiNjJyYUQySWNHZUd3d203Rm9CTndlSzJUTUpUVkhr?=
 =?utf-8?B?MjFnWkRFd3kvYnlzUlFvMk1mNStwd0Q3NnNGMk1wcUgwTHErNldKbXR3SnVQ?=
 =?utf-8?B?eTQxOGhRaU9jZkJ0R1p6SDBDckpsU1IrWWFpT1RFWkZpWmhPb2FOT3B3V05N?=
 =?utf-8?B?VFFQeCtMOVQ4eWY1dlNsYlo1Q1E1TXo0aXJYaFlHUjNDNDBLNmdsQTg2dCtn?=
 =?utf-8?B?TSs1MDdGR0h2ZXJGREdJb3ZZVG5wNE1UaDJTRWJ6UlRtRG8wTWVRNUVSQ0Rt?=
 =?utf-8?B?dUd2WXNreWxmUUt0eGNBbVpOQiszZiszYStEeUtMQS9pYm9Td05JUDJ5eVlh?=
 =?utf-8?B?OTJkUVZzRVpPWGxXb3owSVpNVnd4Ty9lNXNIa0FrKzFJMDJram83T3ZYc0xk?=
 =?utf-8?B?bFAyQ3NVclV6NkJJekd3cWlpTVhWNjJqMUxjQzZuUU1QK241NjBGZUQ3OWhi?=
 =?utf-8?B?SjJaVTJ2WFdhaGRQRFM3SnNPRWtack0rSTNsdnREdkY1RFdWekN0bHpyaGVC?=
 =?utf-8?B?VEpZbVBTKzlmNUhnMGMvdDdLaEJjR3N0WkZBVmJqWlBhVnZtWitpcExHejBv?=
 =?utf-8?B?b2lNaGJwUHBnZitiM2g5RCtMZDNGQ0dxL205NHRhUmRlRVQxRXpwbU5CT3R6?=
 =?utf-8?B?d3hjNWlxcURTUWtLWkwyRERwSHBCYUgyb2ltbkIzRmc1SlFIbk1sOXJqNkhW?=
 =?utf-8?B?RWdlYnlLby9nQW5SK1VWenR4a012NC9xMVpLQUFyb3MyRm1xbmpVRGZwQnJp?=
 =?utf-8?B?K2FsdnhDdzBvSGJVVCtWWEFsdVU1R0ZYSVB0ekdiTlREMms4Z1FEMUNGSmVp?=
 =?utf-8?B?bjROYWhUSjRJWUMvT09hYVczRHlRRWUzSi92Zis2VWZNVHhOSnVDeENRZklk?=
 =?utf-8?Q?GmVw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4B4D24F3F3CC5A48B9780DE753D7D77B@apcprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74e63394-0c24-4b54-9182-08dddf0f39e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2025 10:57:44.4833
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ffCdmT/bTV6b3f6W6Ew7QnwSd1mLoLnLi0oyMa95ZZlBso08yYYBlwCcDTCrrK03+S0qzyQ6OcUguacYmCZcyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5847

5ZyoIDIwMjUvOC8xOSAxODoyOCwgTHVjYSBDZXJlc29saSDlhpnpgZM6DQo+IEhlbGxvIFhpY2hh
bywgVXdlLA0KPg0KPiArVXdlLCBhdXRob3Igb2YgMmYzY2ZkMmY0YjdjICgiZHJpdmVyIGNvcmU6
IE1ha2UgZGV2X2Vycl9wcm9iZSgpIHNpbGVudA0KPiBmb3IgLUVOT01FTSIpLg0KPg0KPiBPbiBU
dWUsIDE5IEF1ZyAyMDI1IDE3OjIzOjMwICswODAwDQo+IFhpY2hhbyBaaGFvIDx6aGFvLnhpY2hh
b0B2aXZvLmNvbT4gd3JvdGU6DQo+DQo+PiBUaGUgZGV2X2Vycl9wcm9iZSgpIGRvZXNuJ3QgZG8g
YW55dGhpbmcgd2hlbiBlcnJvciBpcyAnLUVOT01FTScuIFRoZXJlZm9yZSwNCj4+IHJlbW92ZSB0
aGUgdXNlbGVzcyBjYWxsIHRvIGRldl9lcnJfcHJvYmUoKSwgYW5kIGp1c3QgcmV0dXJuIHRoZSB2
YWx1ZSBpbnN0ZWFkLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFhpY2hhbyBaaGFvIDx6aGFvLnhp
Y2hhb0B2aXZvLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL3N0YWdpbmcvbWVkaWEvdGVncmEt
dmlkZW8vdGVncmEyMC5jIHwgMiArLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL21l
ZGlhL3RlZ3JhLXZpZGVvL3RlZ3JhMjAuYyBiL2RyaXZlcnMvc3RhZ2luZy9tZWRpYS90ZWdyYS12
aWRlby90ZWdyYTIwLmMNCj4+IGluZGV4IDdiOGY4ZjgxMGIzNS4uZWU2NWU4OWMxMTljIDEwMDY0
NA0KPj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL3RlZ3JhLXZpZGVvL3RlZ3JhMjAuYw0K
Pj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL3RlZ3JhLXZpZGVvL3RlZ3JhMjAuYw0KPj4g
QEAgLTI1NSw3ICsyNTUsNyBAQCBzdGF0aWMgaW50IHRlZ3JhMjBfY2hhbm5lbF9ob3N0MXhfc3lu
Y3B0X2luaXQoc3RydWN0IHRlZ3JhX3ZpX2NoYW5uZWwgKmNoYW4pDQo+PiAgIA0KPj4gICAJb3V0
X3NwID0gaG9zdDF4X3N5bmNwdF9yZXF1ZXN0KCZ2aS0+Y2xpZW50LCBIT1NUMVhfU1lOQ1BUX0NM
SUVOVF9NQU5BR0VEKTsNCj4+ICAgCWlmICghb3V0X3NwKQ0KPj4gLQkJcmV0dXJuIGRldl9lcnJf
cHJvYmUodmktPmRldiwgLUVOT01FTSwgImZhaWxlZCB0byByZXF1ZXN0IHN5bmNwb2ludFxuIik7
DQo+PiArCQlyZXR1cm4gLUVOT01FTTsNCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPg0KPiBS
ZXZpZXdlZC1ieTogTHVjYSBDZXJlc29saSA8bHVjYS5jZXJlc29saUBib290bGluLmNvbT4NCj4N
Cj4gQWJvdXQgZGV2X2Vycl9wcm9iZSgpLCBJIHdvbmRlciB3aGV0aGVyIGl0IHNob3VsZCBtZW50
aW9uIHRoZSAtRU5PTUVNDQo+IGV4Y2VwdGlvbiBpbiBrZXJuZWxkb2MuIElzIGl0IHBhcnQgb2Yg
dGhlIEFQSSAiY29udHJhY3QiIGl0IHByb3ZpZGVzPw0KPg0KPiBJdCB3b3VsZCBiZSBnb29kIHRv
IGNsYXJpZnkgdGhhdCwgYmVjYXVzZSB0aGVyZSBhcmUgb3RoZXIgdXNlcnMgb2YNCj4gZGV2X2Vy
cl9wcm9iZSguLi4sIC1FTk9NRU0sIC4uLikuIEkgY291bnRlZCA4MCB3aXRoIGEgdHJpdmlhbCBn
aXQgZ3JlcC4NCj4NCj4gTHVjYQ0KPg0KWWVzLCBJIGFncmVlIHdpdGggeW91ciBwb2ludCB0aGF0
IHRoZSAtRU5PTUVNIGV4Y2VwdGlvbiBzaG91bGQgYmUgDQptZW50aW9uZWQgaW4gdGhlIGtlcm5l
bGRvYy4NCg0KVGhpcyBjYW4gaGVscCBvdGhlciBkZXZlbG9wZXJzLiBJIGFtIGN1cnJlbnRseSBj
bGVhbmluZyB1cCBvdGhlciBjb2RlIA0KdGhhdCB1c2VzIGRldl9lcnJfcHJvYmUoLi4uLCAtRU5P
TUVNLCAuLi4pLg0KDQpCZXN0IHJlZ2FyZHMsDQoNClhpY2hhbyBaaGFvDQoNCg==

