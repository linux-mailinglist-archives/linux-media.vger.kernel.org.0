Return-Path: <linux-media+bounces-37948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BABB08646
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 09:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C03C03AD9EA
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 07:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8296C21B199;
	Thu, 17 Jul 2025 07:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SYagyOg6"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013062.outbound.protection.outlook.com [40.107.162.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3980321CFFD;
	Thu, 17 Jul 2025 07:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752736330; cv=fail; b=M4umN3QnIJ4PG4mQdesjxdlJck7tMOfMjLkjAjQK/FvmosBZLlQ0aJB5QOzqdm/pNgvv8Nsscc8YR102mGYa1ZFo/U3w9pIovalYLs1lNNfgA0eqsls5dO6Jh+rVad/x9AJAwE920ZlZK8EF+sf9dI1GXseEBPfrEqIU7MEo4Gk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752736330; c=relaxed/simple;
	bh=vUhZ3Bc7saCigKaBomfsmWk1KrQ0fo2N3kCDq9G7uIE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HWnsmcNcG4Kutuq/yBEkjHDt/RwDBZegXGhZ9ur1oPztEVyCWNcXnr4XsSwYbeCGQ1LzmRkC5j5HYRJvtLtM50GcLxDDvdNkqRwBw3SKMgfNAhoKMwJe/qav7ImWxQ5ylyrm7X/+S+BR9LHvAcwFOk5hzEP+PZ6eWuNZlrxowSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SYagyOg6; arc=fail smtp.client-ip=40.107.162.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIMOXT5SktPVcGlhrstefHpbxLdVXWe+xcQUD7ctWUA+uMBUy/jPphJhKbr+TUO9udXFpGaGS6ltb2rKbMjgLTns6HoAY0SkJwyl0YyxmNGdvF5Q23hd3Z4IPgBDD1F9wAxWJfIoYtAfiuv2KIA9Cm00o1/qqqk01sh64xB3dfEjG4JbiobPWkCDDr+E3Kqi7GWmZ7KfORHkXQYXsYSu66pbEADUG01zO0u6n8rLp5kHAuhbEwymw6TboVGHlnFuc5+reCag3+CVjH5TsmuCYQHPuaUvd22emZDK3DMZHK+zIO53xG6LpHphNLIECDDJHEKGpsng7cSvtIeNbKBQXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kf9phgx6XVZQAJyVXriVCoxybomjLOFXbQPA9K5XaEM=;
 b=APz4fHHvgmrk5eW+369GhaIA7MTzbofeJu6InzEfDar7f62VAcaibRZTuEY+MPInvdFdSF9i0u6oHdtDIjvIl6VbsGI6ZtKxMoyTdAqohRiKQNsl87RiIUwBQocRLMmVTXbY+szQBL7X6AcPZHh9CRy3crYHh8fWvgi7domB8PxaxgMEUrqaI0TtKeO9dwLmaqJUlUDWIINIFBFw0w/N/9C1saDOxGqd3S9MFVGnE8RBXSlvJeR73+wD7suoEw8/eXNTq9iJxCM0UEA5rjJqQ5fiU+Rla3kGtUXDBQ39vI4V2ydySGesoWUbIdGA9E06rhsKjBBltBJQX9PZecP0Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kf9phgx6XVZQAJyVXriVCoxybomjLOFXbQPA9K5XaEM=;
 b=SYagyOg6PxR0J8J5EBA+Mo/SX1vzUnsLOXb/d5GjKllkR4WUz3M8GLDbR/xug9tfc3RLjFI4eOai85F5PJpcA157Z/tq4GBF7xKcoj/5TLFcr5UQrvNp/Yx0Pi95P4AijTI9YILH/FBoWBcGDQ6btJl2KsBn2ngvzU53R9ZfaV/Y8euwmesLDyLS8krBHKO0GJoYVkT/fXHS0BW/3DKPiP8N3BNWV5fxZk3563Kb/tRIv6ewQoACynk6OLXj1IFiAOY7GgMHU03rRtFn2UgTwuf4l1cxrE7kWXTo+qWR9il/JY90JgJq2xFQUyJvgjgPy98nayirXdhbEyA0BaU+/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI1PR04MB6942.eurprd04.prod.outlook.com (2603:10a6:803:136::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 07:12:04 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%2]) with mapi id 15.20.8922.028; Thu, 17 Jul 2025
 07:12:04 +0000
From: guoniu.zhou@oss.nxp.com
To: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm
Cc: mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: imx8mq-mipi-csi2: Implement .get_frame_desc subdev callback
Date: Thu, 17 Jul 2025 15:13:59 +0800
Message-Id: <20250717071359.1910515-4-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717071359.1910515-1-guoniu.zhou@oss.nxp.com>
References: <20250717071359.1910515-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:196::11) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI1PR04MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: cd7ad48d-07ab-4bf0-65f7-08ddc5013b3a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UXR5aHdSUHFjY085WWtoWllzRm0yR25SVlpiNXkrdDhsUUNqZEJrREVwcGpG?=
 =?utf-8?B?emJyVUxtdVpPbW9xdVpvdDZteDIvcWhhRXV6T3dwOC93d2VZbGpjQjRBYkFw?=
 =?utf-8?B?Qm1lT2Y5WEtqdzNvVWI1NytqYkhxdU1TRmxuWHZtK1JNVXhjTVFLeFc4MFQ0?=
 =?utf-8?B?dFRPL2Vhekx6a1RIQitIeHpWWWx1L3F4dTlHNXBvR2lJcFdZQTB2WWp1bCtv?=
 =?utf-8?B?b2UyQ3ErMEE0cjlkYzdXRFA2RDVpQlRJK3poQlp6c05vNUJxRG9WbGNsaHZ0?=
 =?utf-8?B?cWpLZ1J3MUt3dGhxdnNpWE4xL1R4clo2OFUrZi9tMmNobzVhVkdJNENrWE8r?=
 =?utf-8?B?Kzg1cS9xYnlaWjdiRGFPd3NqZ2JnenRsM3kxOFpSZ0FjbnBjb1FRcysrVUZi?=
 =?utf-8?B?d2dDSVpRZytDeE1ES3FHR1lUcjBuNHNma0FNdzRjWWZaWFBoN1dQY3ZWNjNs?=
 =?utf-8?B?di9lRUZxU2Q5MlllNmYvRzdVSGZjaGY1NVphSnYwRlJpblAzRXdqbm15QzJV?=
 =?utf-8?B?ZVZJb0tsMjdhU1psSk1ZR1pTSVRuUmkyN3UzN2xZOU5SSVRFNWxKUWYyMXY4?=
 =?utf-8?B?cDIzdFIzZGcvN1NGK1d2Z3c4bVVwcXVzcUNHVWJVckhmNzVIOFBpUVJ3Y0RS?=
 =?utf-8?B?c2ZNWFlaMi9IT2hCTmtWS0pmZlcyVVJBV3VldVJtL09MdGc4Y2NBd3RqYloz?=
 =?utf-8?B?eEQ5STBuVjFRRGQvZURPM1Yvdlh4Ym1xY3F0M1l6anFjczVESGtoSGkzUlJI?=
 =?utf-8?B?WXpRMUI1aC82TUxzS3BzU29JbW1aK1pIdTRuTndHU0V1NDlyRW1Sb0s2MDhC?=
 =?utf-8?B?TnNrcEN0M25ja1VqRGd6akJtOWZNUzFLUmNMRW1DRHpMWEk1eGV6MGpqNXJI?=
 =?utf-8?B?UlBkVW5MdHNHTzNNbXFGYkhpaDhrMjZqMWxkUzdBNzBiUFB3YUlERitSTFBE?=
 =?utf-8?B?NWIwc1FzM3dDU1FjRUpEWHBFb2NRK1RoZHBRaXYxWjlMcWdBbDFzK3NIME1B?=
 =?utf-8?B?T2hyaUNxbjF6djV0N3lVOWkxSnlNSUVYaVVEcjdRMzJpREtVdHpFTHlCTjNF?=
 =?utf-8?B?UkJETFR4a2ViWURWWlZNWXd1Si9FNDRKNjFneklZeVc1WDhHT2YrNUtNVTdz?=
 =?utf-8?B?TCtXQU56cGdzMlRITFRnOENWTTlncjladzZvMUNlYlZjUHBxVE5QdWk5YXhu?=
 =?utf-8?B?ejdkQlNRRWNSV1Z0WTUrMFZUT3duYWc5dlFqaXRkMTNGeG9QVGpBczF3SE5N?=
 =?utf-8?B?NHpjQmdacFBWT1drU09CY3NndVppWVBTKzlqa05meHBxZU1vMytpclhrYmNB?=
 =?utf-8?B?WWhxbW52MW0zSU16TnY0L0tYTGxha2MvZXBUVU1VWEZ3dDNaejh6UVpKV2xw?=
 =?utf-8?B?WFJMWElMOTUvVFZhSy9uUUdVbnFrQUl6ckNMVG5lNmlBSjV2QXYrRUhPYkhm?=
 =?utf-8?B?VXNUNFhYNXhpQVhOa2ZRN1drOVJhaXNKUlp3N3JCS1RCVDBya2xWNWQ5QXU5?=
 =?utf-8?B?QjU1ZHVNU2kwR0FUU0V5TnVpNFlneW40QU41ZTJjKzZGakU4eW5FTk5RRVRt?=
 =?utf-8?B?b1NYT0paOE1qU29nUjN4TS9ZbVJXd2dQRnNibkU1NUxwRTBEK2U5Yk9LQUVU?=
 =?utf-8?B?OGErOUp3cFQ5OVNrZnJ2ak9QTWpSeDlXMENYQVVBYzNJOFlwRkc2VUJTVnlw?=
 =?utf-8?B?ZEpzSlZmZWxsZEJ5YWdPZEIvRzFTTnBoc0s5K1dTUjgzSDhVaTRmUUQxVXZi?=
 =?utf-8?B?TjB3cWJNY1BXVERJM2hDVG1SV0s2YUpGN08rTi8rVEVPQUxCZUlwV251Z2hY?=
 =?utf-8?B?MSs1TTF2ZmdIQ1BUaXNzeUpObzE5QVY4Mmd2SDVZRGpXNjJIaGRQRTk5TWRK?=
 =?utf-8?B?Rzc4RXNIamkvalVLaHdjcWVoNjJWdk1JOHFzRlNtOEtvSjM0Q0xQcDBING9y?=
 =?utf-8?B?NlRwdXNjOE1Uc1l0Wlh2ZzVMUUlXaHJIbGtSR2NCbk9zdjRGTkJiQmgvdWdr?=
 =?utf-8?B?emVobXJRMk9RPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MnNKZytWN1NTUnBSWmNXeGZ1c29GRzVnTnhweUQvWGZvMFUzbkxBSkxHS2J4?=
 =?utf-8?B?TkVLZ29xM2dreEdTM2drZ0xnMWlSOE9rSWF5Rm44RTlPdnorTjA4a3VtdHR0?=
 =?utf-8?B?RnE0eUNkSDBKVFRxeUZaQWQxZExBc3RNdUgwaTBJTTlTQ05IeWR3dU5LSlh4?=
 =?utf-8?B?d1RzMGJVQXJnK1k5cmF6dEl0cG5sc2R4MVNDcmYzN0czQzdOWHd0QXhzb0Qx?=
 =?utf-8?B?Z0s1NmpEdy9FeDdmYjhNeHJodkhUL0xkRHZUS0dscTBVNXFud2lTUFNPOW9j?=
 =?utf-8?B?V0U0VnladXRGYW1sSkJBSnQxVmRTaURiSy92cDVVdWdENWNzSUhpRnoyQk9k?=
 =?utf-8?B?dnVjYmhGL0R4VHdYYUhzQWZCbzVUOVJpVW9qZVAyR1p2a01VWjBYSDUvRytN?=
 =?utf-8?B?S3c0WmZvOTdiNWUxNEpRQStyZlZpb29kekppSlc4NnhwZFhLM0dlN2hGcE5s?=
 =?utf-8?B?SnI5YXdKVjdaSXNjQXFGQ1NPcXdmcmkyQkZnRFlieE83VjA3enhQV3VDck9T?=
 =?utf-8?B?ZG5UcTI3bzJUdkhjVndzYkJBRTh6NUZZNVVZak1yNEJoaUNOTFZXL2NSVGNv?=
 =?utf-8?B?N1k5dElDaDFwRzBQRzBVdlkzWjhQYTNCVTFJdWtiaDBIc1NxNU5zMnBiVlJ6?=
 =?utf-8?B?UFRadDdaamNUZW5qZVY1bFg1VmZGUDg3bGMyb2k1cG5FeHB1Y1JJWFpoTFQw?=
 =?utf-8?B?MmZIYXJNN3BabU9BUWtWSWswRGRqVXdTUTR1bkJaM21sc1NHV3ROS0p3anJN?=
 =?utf-8?B?endaSUFuOFJLK3NtNXFtM0VoSGxSRFVUU1VCOXFwRFc0aUd0VGVGVVFFYkIr?=
 =?utf-8?B?UkMvVFpTV3ArRFlIeDZOUkMwTkRUc1ZwSWZpVWJsRHY3TUExRUxKdmNNRmhp?=
 =?utf-8?B?SFAvQzczd3NSV1N4VEltQTVvZjNCQ2oxb3ZDOGdrc3Z0ZERPWUJBNUwzOFBI?=
 =?utf-8?B?eEpXeVJsU0UxaHBJQ3lNNG9HOWFxNGQ0TVBvTXFGZDF0cEZZbnlJcTlPTFE5?=
 =?utf-8?B?THNiSjQzWEI5SlJRaFlKZW5idXFmY2NuYkhmTFFnRmhmbU5kS2l3VVRBZmdk?=
 =?utf-8?B?WnpsRW1md2ttYVFXT2dJVks3OFVUYjVSOE85d3JMUUxWYUhRUVVwU2dFUmZ6?=
 =?utf-8?B?OTNzZzRhOXJHSFNnaGc0eXhMOUorUXBUeUpuZys4WTJlUEI4aEM3akg0SUtp?=
 =?utf-8?B?KzF5RVJITUo5b01XTDZ3WUZ5UHR1VDlob0VkT3VGMEE2ZW50TXdQKzRla3Zq?=
 =?utf-8?B?QzVERUZzTDh4NVZHYzRtODZrRlgrdTdzbVc0eWg2V3owV0RJeTMzaHFFT1pr?=
 =?utf-8?B?V3dmWG1qdHRWN1JwMDNJbVJMZWYwZXZUQ1EzYlRuSXJkei80TVQ5ZnNNTFk1?=
 =?utf-8?B?WjJsT3ZhMjJMWFF2aUtST0M0QmtIRGxXbnlGeC9Id2VVbjZyeThGMU9DQ2lv?=
 =?utf-8?B?eGRZU1BPdDhPNVZHditpZU9DVWZVNldQNjNmSllicUpKY09LempkdE5TK1hL?=
 =?utf-8?B?ZjZSaFRFL0xueFREb3lwb21WN1hXRk10SVJwL1RxOHJ6bDZqNk05eHF2Um8v?=
 =?utf-8?B?ejRUZktMa2c1S0Roa0xWbTJyR2loNmFRcFdQV1RtM3p4dU9QV0tIMTAza3RP?=
 =?utf-8?B?K0tXbmcveEMwS0dwRzZMNWF5V0JnWmZiV2EvRnpmcWUvaUNWUU1RenNIZko4?=
 =?utf-8?B?ZHpyOUp2dWJUQWlYSms1WUtaMEZhTjJFSGhDSFpwdWxjZUR3SFJKS1pSN0lx?=
 =?utf-8?B?VXVkdGp2bysyZ1F2VGZRakw3b3F5M3loVmwwd3ZyczNXNDZJNFdSbG5IWTdH?=
 =?utf-8?B?VitSeWMrNlFFZWdvcTVNZnN0ZTVtdFZNdDdETzk4QkJrWkFYcDBJdDFqRVYw?=
 =?utf-8?B?OFpFckJTNFA4VnpVdlFRUGVLQU95TlVaUndnRE52bEJUQzR2U0k2NWhrRkM5?=
 =?utf-8?B?RENaYU13VXFxTzBXd3FvM2dLaEdIS3h5OVYyc3NmelEvNnplbTNMZTZsLzFm?=
 =?utf-8?B?WGc5bUJyMCtVeGJlblF5R3NrVjV1Y29Sbi8xSlV1L0ZHdk84REQraER2ak9r?=
 =?utf-8?B?NlJuenZsSjA1b1Q2bGE0eWZWNk13TWZGakhMVEF6cVNBSnJLbmpFL2twczhy?=
 =?utf-8?Q?QeMQs+oxSonAOPbGJczbNYpF6?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd7ad48d-07ab-4bf0-65f7-08ddc5013b3a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 07:12:03.9815
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BA+lKLuImBNdRRBPXl1PQ4FZo5Dz5SWdp1tsoNm7wmeB6hxzW9vFTOJHZGhTG282KlKyjX+GfwBXdmcpR08tXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6942

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Implement .get_frame_desc subdev callback since downstream subdev
need to get frame description.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 3de9007ad122..ed6578f7f0f9 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -689,6 +689,37 @@ static int imx8mq_mipi_csi_set_fmt(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int imx8mq_mipi_csi_get_frame_desc(struct v4l2_subdev *sd,
+					  unsigned int pad,
+					  struct v4l2_mbus_frame_desc *fd)
+{
+	struct v4l2_mbus_frame_desc_entry *entry = &fd->entry[0];
+	const struct csi2_pix_format *csi2_fmt;
+	const struct v4l2_mbus_framefmt *fmt;
+	struct v4l2_subdev_state *state;
+
+	if (pad != MIPI_CSI2_PAD_SOURCE)
+		return -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(sd);
+	fmt = v4l2_subdev_state_get_format(state, MIPI_CSI2_PAD_SOURCE);
+	csi2_fmt = find_csi2_format(fmt->code);
+	v4l2_subdev_unlock_state(state);
+
+	if (!csi2_fmt)
+		return -EPIPE;
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+	fd->num_entries = 1;
+
+	entry->flags = 0;
+	entry->pixelcode = csi2_fmt->code;
+	entry->bus.csi2.vc = 0;
+	entry->bus.csi2.dt = csi2_fmt->data_type;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_video_ops imx8mq_mipi_csi_video_ops = {
 	.s_stream	= imx8mq_mipi_csi_s_stream,
 };
@@ -697,6 +728,7 @@ static const struct v4l2_subdev_pad_ops imx8mq_mipi_csi_pad_ops = {
 	.enum_mbus_code		= imx8mq_mipi_csi_enum_mbus_code,
 	.get_fmt		= v4l2_subdev_get_fmt,
 	.set_fmt		= imx8mq_mipi_csi_set_fmt,
+	.get_frame_desc		= imx8mq_mipi_csi_get_frame_desc,
 };
 
 static const struct v4l2_subdev_ops imx8mq_mipi_csi_subdev_ops = {
-- 
2.34.1


