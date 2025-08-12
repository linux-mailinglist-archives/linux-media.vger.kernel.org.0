Return-Path: <linux-media+bounces-39555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A09B222FC
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:24:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F58A1A2271D
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEF52E8894;
	Tue, 12 Aug 2025 09:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oFsnrREu"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013008.outbound.protection.outlook.com [52.101.83.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B8117BA5;
	Tue, 12 Aug 2025 09:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754990382; cv=fail; b=T/BqxYl54jHGtVl645Kj9Zbys/7JiduAPX1l+ZPLZXpIapYR54zJOnRPREbKNBNXku4qRShtLbdGzjV/p3TJdgAeE35FDtpZJpKv30LZbDzUWMmXMlT2Xm2YdP16+y2YFNUYghonQPeA5TwKPrLoeczT0fw86xNtuuXCQpcZCXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754990382; c=relaxed/simple;
	bh=qehv5rmIKnyTPK9HSnYTtlGJF1vT9DlJjJA1hPCGaMA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=N1pE3tskQQaSQeDsMl5h539GHvKvHA8ZfoZh1TbuVi8y5qirtorF/40DC0/m1n0PR138rWj6kWGDrA66lpwwWjk8HI5Lror2OZC20IEkscDIRGkSiNMweXEatkO4qkUOpuddBC6TBEbI/o7lDAnJagZHupO7hI0xmLzD+Gp3/N0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oFsnrREu; arc=fail smtp.client-ip=52.101.83.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U3j0ParvDKNR+mu5yxVdBs6wf0QDqkR2+H5Uumy+heK/jnZZzVVZxFHmUgLEUj+8El6LKHrQZgFwbD8vdEz4qNb2TyLNAgcTVass/S3A+kCxYCW7SO3rhWJqCxET31bGp0xIXXbbG3+Ir9hwCDRJFn3XAXzLvBaWAj2hVTgRcue2z8+YNdsmvyCwTEx2SaVhSCZG5yGGJ9RIp17BHBLze3/iNXtrf/7h29UdyzHCF6lbLRPAYy2OhSkO5OTwVZ4uBmfTAhydLMbVrzvl1LAJY0FIQh2jeEEKChjGbXAb48YwkQSPDzuT4KsbYSYtQ8HU4oYx+xs1mJWYIJf81QT/mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qFVXDRmMGe3CHp9rGJATdTy2qFJZ89mQzT1/AX3d80M=;
 b=JpMpcaNUhPefd9O83fTrN1UutA71jOiY3ni28k7V5QkIk4k0oAf8lRumRUPe/wrCD3HVC5QUuQKf4cTmnghmJZndRUBzVhfGLISSbxs0uDxxyvcjOgGAyQegl5MayQoNO3ZpNBu1SDlx8O2cG4ffNsAy3ZVgEUekXoAEOumIxUKw3iGZoHi5O+wi6BnOvcUjuW3w6Kh2bf5kSVeOyMHzmXYJggvr1Evda8H5/n1cra5qClJgG575gAUHYr6678py1eBFhCWCK4reyZJ7JBmiF7C1Va2VpfmBCMRkRU5D6uDpHnj55zWbV9zUqGYDpppIXmupEyAhnzyvLGtXZJjPvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFVXDRmMGe3CHp9rGJATdTy2qFJZ89mQzT1/AX3d80M=;
 b=oFsnrREui6LkGC2i54Ecn7uFa/2pz6I9ts9DSUaoYDdBuCs/e8/uMrxXzocjIh/UJI5qx92tSqvv//v28IOlg/fIkYCMPgwtP1WgxQOvbbg7CaCfMJpgLgqQG8qJXE3VUUOzbbLDO46ZBvmaBtTHdr1UDSCv/4xuAs9WecAc74ysJYvobps+AvxFSYu9HWw2FFnOyCyxW1R/CfAPmjbq814X9Kh8lvvH49Fly2ZX2DWiClN2gwM9bhnJAW3oOMj8TKvNMa8zjmV2uzOoJg6FrVELy0+8WHOha+2ci+LOv28ZOG6v5LqaERtI2ivoJmIt0GJsjPuuBJoGm27nJJcN+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM7PR04MB6904.eurprd04.prod.outlook.com (2603:10a6:20b:106::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 09:19:37 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 09:19:37 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Subject: [PATCH v3 0/3] media: imx8mq-mipi-csi2: Enhance the driver to meet more usage case
Date: Tue, 12 Aug 2025 17:18:54 +0800
Message-Id: <20250812091856.1036170-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::6) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM7PR04MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b4674d-b610-4d73-9c28-08ddd9815ba6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?WWtHZWE0VEVQNmFIVFU0ckZmMG9nQnFrWlo0bjhlOXpMQTNPb0hEdzFJRDZQ?=
 =?utf-8?B?RVRNYWd3bkdFWE9TQzcvTzBETi9kWEptdnY2OHY4U1JoVXRmeTRCYkpuR2Y1?=
 =?utf-8?B?TzVIdjhSaEFMRlhMVnU0WVJSL1hmT1B3ZEl6YU55NE5PbVFaQlg4a3p0M3lL?=
 =?utf-8?B?aVJMNU9VQ2xEckhycVdCT1MwMDVGVUVyQzZmZjRVTElLNERqU1FVSS8vUDlV?=
 =?utf-8?B?K0QwRERYZWMvSjR2NlhTdmtuOVk4dUw5Q0lta1h0bHZZUkhaU1ZkQlZiaThi?=
 =?utf-8?B?MFRoV1VkcnZHTm50alFNZEtZMmZxNXczY3JGaTFxSEFTSDVnZ1BvRGowTGI2?=
 =?utf-8?B?Q0UzL2gyNmJNVGtTSnlSY09BQy9YOG1Wandvczhxc2ZWTFlOK0FaeXkvSFhW?=
 =?utf-8?B?M2JRWWQzQllYbmxZMWFUUlFaMkZ5NjlVV1d2UjI4TGhaRStlS05FRXdBbnJ6?=
 =?utf-8?B?SVlYbC90YUpCVEsyTXliRXZ4S2NkK20vV1VOTi93MGdvQ29UTzZkcDJ4UGZB?=
 =?utf-8?B?aVNSb3BhWTduaThQTHEyUERTUGthV0xETUhQdU5LQUxJSUJIMFFZQWMrRWhi?=
 =?utf-8?B?UkRlUTUzSE03VHh0WmhORThPQ2dnRHZMY3FMZmF4VDBUcnpCT093ZUpCVVNp?=
 =?utf-8?B?VVM1ak5hMkJtbmpGMkNtVjVyNVQvbEJVbzRtVWgvWEpRcFBqc2t6UmpxK1hZ?=
 =?utf-8?B?aHBLQ25ML0p1YTlKSG44RW9RbkJKQVowM3kvc2pLTm5UWDNGMWJNdHlTdTRo?=
 =?utf-8?B?R0srRnlRTHBpTmx2bFFGUUVDKzlWUlNUV3orTVZyVlUraS9BdDJjNEVzT04r?=
 =?utf-8?B?TGp3cjg2OWFsVllXOUV3QzdPVWNUaS9WK21QdjhtcUdwZU5VRFdFYlgxWkhH?=
 =?utf-8?B?bXhjOUhhekxDV3FhRVd2WHdsblBPS1VRWk1mUzZLZU84WEluOUFzOWVxNjNp?=
 =?utf-8?B?cWZoZ3VuOHZaeUJjUjM1ZE1CUys4VGVaUDM1WkFYUUdVMUwxTTZBMUNzN3Ba?=
 =?utf-8?B?UUhtV2c3ZWh3TnBmUmpaL3pvZHFDVmtIYjV3UytHZHpGSytLK1h5NSt6MVE5?=
 =?utf-8?B?YkhjdGpKbUpveCt6dXZ2cHFPVzFWcHQ0RU9ZT0ljWkhURXVVcEJxbGhUWWF2?=
 =?utf-8?B?YVN3U2ZVQkhVYlhzWWZTQ0VOU3M2ZlU1TU9OUm1Db0lQL0pKT0E4TzZ5T0hB?=
 =?utf-8?B?TjMxMmxBdEY5cmw1SEd6Q0NOU2pXcnFocENzbUlJUVl1S0dRcUhJYmlDaXlU?=
 =?utf-8?B?Sk5SN3ExS1NDYU93UGFEOU1jNWdFb0pNNVNtdktmUnBPMWpNckREMXZZdzN3?=
 =?utf-8?B?dGpxbm5vRkoyaTJWQWllR3lkUCtDSkZuK1VONU5aTit3OUZFOFBIRTVaWEF1?=
 =?utf-8?B?bmg5Uzhya1Q4YWlJUmttejhsK1cyRUJNVStZSWhpeTZmTXpmOXp3Z2REcGY1?=
 =?utf-8?B?Y0h3bEhhcDhwUHBTREtrbEVZYlNaRFBIRG5GRW1WenlPaWUxcnVjRzlpNTRk?=
 =?utf-8?B?OEozcU9zeHB4aWRxTDA0VjE5bUFBc1gzZXY4eldvRGl5eWF1WTBzOEdaWlln?=
 =?utf-8?B?VjB0d1NXY2ZuK2MzcUtMaFJYT0VBdEhSMG9MSnU4TmhWVXZnS2JRV09HNFhR?=
 =?utf-8?B?ejlxbmdIRUpCdEFBT0ZnNE1LWDcrSm9aR0ZOay9NaUNKNklLQXhGcUtLYjVz?=
 =?utf-8?B?UHp6NGZiUUp6R0hlclk1KzNYL3RrcnlhNVZpdVp5WWlsUzRQZ1N4UndxRkd4?=
 =?utf-8?B?TGJxYVlTN05tRllLV0l0ZE8rVHVaMW0xUmE2TUxIK0FaTXlWWlNGd2paOXoz?=
 =?utf-8?B?Zk1wd2NHMWpqZmprQ3AxTklOdjlkblRMbHlUcUdzZFpxWFpjUjVMN3g3Y01K?=
 =?utf-8?B?aFkwN3QrTnpDSHBhUlFkdmVLRGpQeFNOTGdRalpoaUszVFNjcFZXdlZNU3Bt?=
 =?utf-8?B?NURleENDZXlaL0NiTVlnQ1YycStvUWx6VG12TzUxVXo5QWd5eVVqTHBXdGlh?=
 =?utf-8?Q?D068RncmWkRkRI+qEt/U1KK9Mgdxb8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QUxjWVNFTkhXSzNtclhMRHdzOFhGd3crcWxIMTlKblVRS2NZWmZOREw1NjJh?=
 =?utf-8?B?ZUVIMUxNZHBISWd1SWlQQUl4YWlDQnBKaGtTSFNHQzR1NlhDTXNRd1Nwb2ZL?=
 =?utf-8?B?Nit1VTVVdmVLRUxMODdENmJPZjBIczB5UElQVkMzUGI3cDllNWdaZU94YVR1?=
 =?utf-8?B?aC9yT21jVmRQUE51YzkvNEtFdlBIQTlRMlQ2SGF2SysxRkN3NkRoRE5qa1Y2?=
 =?utf-8?B?cWo2NzZGM1N1cmJ6MHlaS29JS3lZR1lIYWFtRDdXTDUyS0hOdDUzVVdYN3R1?=
 =?utf-8?B?aVdxTEZFcnRRSVNUWTFHOEJZcDVmbkhMVDAzbnNaN09jYzhjRnk1MThsN2gr?=
 =?utf-8?B?THhTOG04a1RDTkhLdzNDY3Q0WjZjc3BKZE40OXdmOWxWR2FGZitRWmg0S09I?=
 =?utf-8?B?Z3VpOFZtUjgrYW12S0RlbkpNWVFXalFCWnliQWM4c0k5RW8vRVlVbDljQjd1?=
 =?utf-8?B?VkNlNmkzSTByWmhpWlpXQWpKbXJaek9vRGR6dFdNWUVVVjFwRmVXTE1SYi9M?=
 =?utf-8?B?ZUN0anNEVGEzOUd2M1dBQXZpc1J4SnJEcDRSY3FmSkJZR29NYVEySFhBZ3di?=
 =?utf-8?B?RjF1b1dtSGJ1RlVKOWRlTGVwa1NwV0d4ajBOS0k2d2h1eUJ5Nm9HYTl5bkdP?=
 =?utf-8?B?N2c1ZW1aVFFxamt5TUVoeWRIRCsyWUxSb3lDMW9ubXI1Y1Znd1AzRUgvWHF3?=
 =?utf-8?B?TXV3VHAvL1kwMUIvVG94VG13bHozdytuOXhNZkNFUmpNOVZzT0hqS1Vod25o?=
 =?utf-8?B?MVpUQWZOVXFEcS9NY0U3dXFwaWo2QzBKQ2V1Tk4zWElOM0o0R3h0TFdLdkpk?=
 =?utf-8?B?TG14UkZjb1djWnRCRGRaUkR1OW01S2RjdHptcGZkN3dndUZSTjAzZ2lwaU5X?=
 =?utf-8?B?d0N3UXRpa2RCQmhDSWtlUjR2cTluRndYRXdBSTNncWtqWjBOVUF1dWVtNGYr?=
 =?utf-8?B?ZVZSNXBjRzJOQnZYT29sR2FhdjIwZjgxSE1NOE85UEFwTmZHbFIwcjVtMGl3?=
 =?utf-8?B?bU1xVVYwa0ZWQVljeVhtODdvYzVEZnQyRERERkhWQ05hWlpBV3F2RHo3cjAw?=
 =?utf-8?B?L3gwUE5Ld0UwWE1vQzhBdmFXTTZhemNzeE1kMnpObEJMc3l5QXdyNjZDaHdx?=
 =?utf-8?B?dTBiMW80WmlrdXkrZGxBTVYyZjhZeS9nZDVPU00rTGU4bmNIczZFMzRBN3dk?=
 =?utf-8?B?cWRNbFZadUpyTGNXQ1dnSkpyVXdkTDBZM3BvZitMZXkrT2Jodzd2NUtuOSts?=
 =?utf-8?B?WTVuOXg5Um5LTUp4OVlzWVVwOXlaK0swNkhlUGt0SDdtV2d0RkJjZW92TFhQ?=
 =?utf-8?B?cVBmMDdYQkJhYUkrUWQzM3ZMNy8vMFYvMFp0WHU1Y2lzbkdOVTM0TE5JQStI?=
 =?utf-8?B?Y0dlZG4waW1HTXBPWndjS1ZSWDVyN3lIMUFrU1RUdEJqR01ORkZGY1lCV1hM?=
 =?utf-8?B?c3FqN1hRdGRnd0U0MG96amR1NzZqQUhOMXZ3b2pDNHRhUURuVE9mTmljTFBB?=
 =?utf-8?B?ZGd5WGVZc09UaUVLNVdIbTV2WkhCeFpXUzgzMDNCbTRNdVJWdTNJSnoxdFNp?=
 =?utf-8?B?d2ZHWUYwV1NWRlRpT3djTG4zQU81bXFWQmlDRUVrZW9sVHZRWnhLZEpjUDNj?=
 =?utf-8?B?Z3FYZE1PU0xYTHNCRExrUXhnTVl4NzhzeUNrVzBzUzdYR3hnZVo0blFYUkdJ?=
 =?utf-8?B?YnBFQWIySWdwNUhjdWEyaTZuK3UvOUVCVmpkeW9TQll6WklLUFlsRkZuWlBa?=
 =?utf-8?B?Zkc0MUdrOG5vVjlWdUZ6Y0dHQzB2eDRJNEpDSk1TTEtzNmN2eTNEUVZxSm9y?=
 =?utf-8?B?Mm1PdU1MVlZ3dXhJRGFkVHBJU0dKdnkvaEMzUEZqRlNiY1R1eHI4S0tGVzJ2?=
 =?utf-8?B?V0RhYlY3KzFOTzEyY0ZUeXVVd1E5VlJyd1A3aXZROTExK1hsUm1ISzJPSzNC?=
 =?utf-8?B?TGY0aTI1eGVvSmdqVW9sZVFHRllXZDFkSUp5cXg1S2pFUHZuTURZYmRwSzVz?=
 =?utf-8?B?ZzJKWUpMVjdCY1hmdkZWaldaN0pxZjVsL0tmUm0wNjRwL1d4WWFUK2ZHb2ZK?=
 =?utf-8?B?ZHVYaWg1TTlYdkNMVnhRTXZyYjRCK044cVhJWEtTMUo3ZFh1Z1l0MFdrSWJo?=
 =?utf-8?B?cndya1gyNk0zd1pPdkRKZmlBYnV6S3VSY2cyZTFicVRLdjZaQ0NNdmxtNVV2?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b4674d-b610-4d73-9c28-08ddd9815ba6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 09:19:37.1886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3fZBkAz0bnjxAtdlsUW0IQtjNIws0qPQL13iV8zxJwZH0MhCPKLh3/Wwaqoxvb9OvrR9pXJSqyTWkBQZIqNquA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6904

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The bellow miscellaneous patches enhance the driver to meet more
usage case, such as i.MX8ULP.

Changes in v3:
  - Modify cover letter file to include history info.

Changes in v2:
  - Remove duplicated Signed-off-by tag.
  - Link to v1: https://lore.kernel.org/all/20250717071359.1910515-1-guoniu.zhou@oss.nxp.com

Guoniu Zhou (3):
  media: imx8mq-mipi-csi2: Add data type field in pixel format
  media: imx8mq-mipi-csi2: Add RGB format support
  media: imx8mq-mipi-csi2: Implement .get_frame_desc subdev callback

 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

-- 
base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
--
2.34.1


