Return-Path: <linux-media+bounces-38224-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADA7B0E649
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 00:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 674AEAA4A34
	for <lists+linux-media@lfdr.de>; Tue, 22 Jul 2025 22:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F1B2882D2;
	Tue, 22 Jul 2025 22:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XkPZqjPd"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16DB1AB6F1
	for <linux-media@vger.kernel.org>; Tue, 22 Jul 2025 22:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753222535; cv=fail; b=iJ0d0z4g2002u6rL5WgvtdQ+l0rlOg6APby6cur3YCAZvD/HTM6T29TTiWBHySsepJknJc8xpRpwocryCC63Ue6+UyHvEBqkGO/2hDky9Mcniln5Rsgkm88JXxwmOtbTJkvX7GZeQhA3/dHPdPRnf7CNxk/nz8LpXOluGOrU+2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753222535; c=relaxed/simple;
	bh=CZ73oWPaOK7+p2d7YwRwBOGOMPNV4ZkdWdUDA3CL7C4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q0U5CyDvIgxupuh9IaiAHQWbbQgW/pGE4mrjoLHMXoLkPjwv7lizOCbfAfrn99H8g25Hd/wKWvTOGom+iPO5AZYmVIU5HkVaKFyy4N5rWVSPKmv/K/7Uc9J2rQsqMRJqR20BbU8x2wIWKcxYL6uhZ3I3rH+G2NByAzj4ZlhiODM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XkPZqjPd; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTspan4e97gmg7ipyv1b/8nD+v3jDMLdm1/dXGwy8pAEV7aFxKfFhBRInDWdqsjaiz9IRumPtkdDAGzJ6PLNZaYtyf1G6o42XtlxqAAWJ2z+15C/AwSIvtIvssq/JExNKIABiI+TpteD7nFPMseOl/6FSsgjOJtXRfW4fu8R4qRE7D8UhaokQYrTI0sfQRi2b4x1bHv8PoW4wBhq33KQr9OephV73WfebibOfeewdUcjqg14Z0axAm7pNKXSeq/UiewAjqj+JB1qx4Iepmymf3ea1nngP2fhWyGu3y7BZmGLfcWOGrTxlNpXybKTkC539HGAraLZ+13HgCF+mjnQnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzCGQHzksnPpMzdEJUWtlzgce2uDYzWIVQ+/sQUySBA=;
 b=pQeU6Ww6Dc4P4SgdQwKALYhfrFtI2Wot+jk4PxdzgVtmaV3U2RFB5aYa+oLtvLFFmKNZsSMbUW2cVMVhGruuHB04uuwP6KwRD4JVWEePRIBVZdCx9hEKCg8yv/h2NyM33QR1e3DW0PnMwG6dRy/TbmUma8waABAnVOyXah9WsvRamMdyI6x2akC+mfk7TXy+oGSMcZOTEiguWQsM6K5iK5VblLyVuj53DU1TrPd74w7uQdQYyXQ6Rgi7IuplZDnxyvDgbJMSPFh1q23m/U31MMoGi+4LLXZUD7FyHXy9BWH+FgfaA+1GnvYixYzOLroQKbZ7XEjCRDobzMnTE3hwrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JzCGQHzksnPpMzdEJUWtlzgce2uDYzWIVQ+/sQUySBA=;
 b=XkPZqjPdzq8L7jkHWRsM/X9pfNE/lz84L0oobQK/zhAeWwqU8x2vNtWz1wQCCHnLAKfngM4/aOk9ElwIhnNcZ3SAu3WOugH01lcztNycMoylOooz89KuUkdpgxXyRHoCB0PbIyQ2kcmz+Ztzo9y/g175ikEZs1oNSkN93gwxUo1/HYNB1wSpKnD6gsdugwfg6voiYzlVhCzULcucfLB7z0teOu/h9rjOl9isz/aJJMkRSnleQ1rwjWYM0a5x9mPm6w1rgiPGmp5QNKG1ZWVufjlz7vg61hSSWrHo0/gRXCp8i/mAdjRBdIO7mZnC0elKiUH2Y2UkSeELbTQLHX3lYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AM9PR04MB8603.eurprd04.prod.outlook.com (2603:10a6:20b:43a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 22:15:31 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 22:15:31 +0000
Message-ID: <0b89e587-20c8-4aee-b07b-3d796df4bcf6@nxp.com>
Date: Wed, 23 Jul 2025 01:15:25 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 20/64] media: Documentation: Document raw mbus codes
 and CFA for cameras
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20250619115836.1946016-1-sakari.ailus@linux.intel.com>
 <20250619115836.1946016-21-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20250619115836.1946016-21-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0241.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::14) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AM9PR04MB8603:EE_
X-MS-Office365-Filtering-Correlation-Id: 24bb2885-a033-4e07-8900-08ddc96d4585
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|19092799006|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?V2RXSkk4M0lzbDNQRjVjRVdiV1VXWmVQdVFoV2VPMm5OeC9YUi92UzJBMGRj?=
 =?utf-8?B?aHRSNytLenZQbFg1QjlWVTd6TUFZZTgvZjEvMlJ2QzcrMUJpaWc1UDNNM0Nn?=
 =?utf-8?B?TW81NUlMQXlSWW5Kc2VUejljRExiVmFQQy9pYnhNM2pmNVRUZHhPYUVwTmlT?=
 =?utf-8?B?MFlBeG1kSnVrV01VMWd6NEpPVkN2NEIrTFNKK3RlSkZibzNNejhOeTJRaG9P?=
 =?utf-8?B?YzFhWGFxS1NsSUxWZ3FRSE1HMTBzZldLcVFGSEZpblJaVmZERUhtM0NrUzVq?=
 =?utf-8?B?eVQ3WXNnY3c2MldXMzFVekwzc0NWNkNZd3NDTkphOFYvcDA4K1NhMkt2VWY4?=
 =?utf-8?B?NncyWVZZN3Z1SkpjRFhXbndNWEVOaTFsV210bmxZNzNjYjEzaWN2cCt0M1lT?=
 =?utf-8?B?cDZzaVRDNnNCRHY0MUI0NlV3OGdKTENHSGtYY3dqaTQyV0tXK3M0K3NFR0U2?=
 =?utf-8?B?T2d3Zjh2bXZmeHI0N21IVWRtM1QvSDVRbE1pZ1FTeTd2TmVBNHJybFpiVUpo?=
 =?utf-8?B?THppWFdhR25zczFTeEozYVNyS0hVUkI5ZjluSjB6WjA1L000ZEJQaHh6eFkv?=
 =?utf-8?B?K1kzZlFEcGowT2pFZ24rNmtHVk9wNHFRRXJHcDFpS1hlODBhRmVtYStHcWE1?=
 =?utf-8?B?WUpjNmJSRFJLT0M2cE42bHV3S0p5a0F2eDVOY3dsZjZ6M082ZGpDWElWRTV4?=
 =?utf-8?B?NnFxZkp4N0lNc2Rhc096VG94WENjMVNackRZMjNhTFBEYitLVGg5WVREL25C?=
 =?utf-8?B?Nkl1Y3h1RVNNM1NGcVhzZFVOTUZSWGhSUDBwMXBXTmhuSFZaSTA2NHExVlg1?=
 =?utf-8?B?VTc1bTZBWG5KeVFQU0hIeHphWEF4anZTWFUweVQzYUlyUSs2L3BiUnAxOVZQ?=
 =?utf-8?B?cDROR29LaVVOTjBraXBEUVF3bC95aHgydS91QWFwL3BUVUhNRXp4QkdxZmwz?=
 =?utf-8?B?MStydS84blFwT1R4WFpsOWFHQjNsQkhjMmFPdy9vckphdWg3RHJuUWk0VFVa?=
 =?utf-8?B?ZVdDM0VxSTI2OHh5VDFnbndkTHUwZ2dpNUlPQ2RlYVRPdWRxZHNoVHR3RnY0?=
 =?utf-8?B?VDdCN3RBa0xtTUgxN3RYU2JYbUh5T0IveUNpdnB0OXZxMGNjOWdtL08zQnBl?=
 =?utf-8?B?VnduWDlCQ1o3NkZMb1FIblhISHl1K3VISTFkZ2lVVnNiK3dnTWEycUw3WEtO?=
 =?utf-8?B?aHFyYmdrTnROTzA3Q0hYbC9zY3lJQlpPaUJSNDA1VEZHcEpLa0NJVUp6NkNa?=
 =?utf-8?B?SWVnTTNOLzZEdmMvdjkwTngxSUhrMHNMRk51bnJWbExMT3NUdm9hN2owNTl0?=
 =?utf-8?B?VkJEd2ZnTGhtZE83OGJGUTF3RE9ubjZuZC9Nem0rNDhxM3lYNDFDNkptUlh4?=
 =?utf-8?B?RXd1aGU2M1NBSzRkSTZRd1c0MlE0eFZyNFRhMitzQUZaVTE4aFpnMzVsczdD?=
 =?utf-8?B?TXRZT3NNRnY2VGVOd3hpcGpkMkREdmZ3QXpFbTVId0RBL0NCb0ViYUdtQWFn?=
 =?utf-8?B?N1kybXpvejM5Wk9jaGRhMWdTRHFDaTcycHpWL3lkcUhYUXlkMlBlRVBSQ01u?=
 =?utf-8?B?QTZDQWFYTnlUK2dESCs2QlJSRGpleWJqODFXR05vZmh4REtzWk9TU0hqQU9r?=
 =?utf-8?B?R2ZocXRGZDQ2QzdKWWJRWjAzc3VTUVFvV1Y0dzAyem9uTEJnOVRzVU5FQXdz?=
 =?utf-8?B?UVZDa05vVm1wSGdxZ3dZZWNrdThMSDh0K3MreFlzVXlxRG91aVRMOEtpSnRz?=
 =?utf-8?B?blRtajlMcG5QbkJVNzN4VHBWRXFiRlIzaEtSeVk2L2ZpMERRN1pLUDhOTkJi?=
 =?utf-8?B?WWNBK3V0YmtLc2FUVjlUUU5hdm1BT1dXNGJsVEptSDJ3WWR3dTAzekwwcGxs?=
 =?utf-8?B?OXl6MkwxdFkrR0VwVU9oRGhkSE1QdVR1MlcycU5WT3ZYcUVUSGV5U1NWNHpI?=
 =?utf-8?B?OEJPUFRQMFlHVkMzbmVCSUpucnViYk9iY1NkSW9WZHdHcm0xbnZUVkJsM2ZP?=
 =?utf-8?B?S2hWUW9vcjhRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MExtclJiNk9tbkN4QTJsVThhcVFDRHNiZWZrNEJHcGlYdlQ0OENJcllkOU1o?=
 =?utf-8?B?NTg2MWpyN1Vyd1F3Q1NLUkxQWVpwSUIrN2ozeFY5eWl4RUk0d1hCdUI1RnV4?=
 =?utf-8?B?Nk1NdlBMT0ZNNmNsODRZQXBMenA3Y3JYUTVFeE1vUW90cUJwaVFXdFQ2SExB?=
 =?utf-8?B?b2dNdVY3TW13SkRaUDZRYWs0Q3QyWEhISGgzdmFRUmJrejBYUzJoS3J3Z1E0?=
 =?utf-8?B?UG5kRWVXM0M0cG83dkpIdGNnWDVweVRaR3RxVU5zb2ZMbE9mOHVKcmg3b1d0?=
 =?utf-8?B?OEZXcXJYbWkwejBjbG5XcXpPVTZyaUVHZkpzWHJFRWZlZnFOazF1d3c5Ky9D?=
 =?utf-8?B?UzV3QWFGdDdrRGJGbjhQTnZjS3ZOUHFvay9WV2RyOXQ5bC90KzNlcy9nUTh1?=
 =?utf-8?B?aWltVFVHZ2p3SitEREgxaGcxeWYybWZVNUtvcGNGdk5aa1JnbVZ1Z1RsK1d6?=
 =?utf-8?B?dVNqd0lqeTFZdXlkYUJSMitNTGQvUnAwNnFJZFlTeCsrcUMvVEZHMWt1bUJ0?=
 =?utf-8?B?NTRMWldOY2liY3NyY2RlSVNscDJmN2JpblRPTEQrSjFZUXEyQW5LUVlCUk5D?=
 =?utf-8?B?Z3VlTkp1dk5yb2NhZ0ZJREZOUnBra1gwK2xNNkM4RlFKS0JnSFhvdDZzdDUw?=
 =?utf-8?B?ZlNJa1pGWE90NmJrUU0rTFR3WDdzSWlLNklDTi9kNjB1UVEwcU9LY0k1bEMz?=
 =?utf-8?B?L0xwVHNxM2xBYkhxWmRjTUM4aTJodDZqMnRTWFNsZnFYMmxtV0N2eU9SYkZ4?=
 =?utf-8?B?T3NPTFB0SXJGMmwxMjZXOXpiMU1lcW1INmxDdEZ0a0pNaGZyWS9aREpaZ28z?=
 =?utf-8?B?N281V01uOUJDa0gvREdacHp0RG9jdHlIUUI4YmhpaVdQS3M2Y2lTM2lobldM?=
 =?utf-8?B?TXc4T2dVWWJXUmV1VnNkVzFBRmhpblpZckFOU3RqczR3bWNxN3plZzM5TmFP?=
 =?utf-8?B?bVYydDlBUFhYRnJMa1prTzQ0NEpQbi9LSStuL0pHenZMZXJ6Qk85Q2h0Z2Y4?=
 =?utf-8?B?VlFaOXE3N0NaK1NHZ3NLVE12OU1vcTE5WlZMWjdxcW5qQ1pacHNyWkZJejl2?=
 =?utf-8?B?YlRZdXZZSTlpdC8zYmdxUy9ERWlzM2p2aW1qZXozOTNpYitXUUVCQlBhQUVu?=
 =?utf-8?B?dzZ1VEk0V2F5UnBxRlhsaytjczg2VVVTTWxBRFpSUjhPV2VCdzl2OXRxTTlE?=
 =?utf-8?B?UEV6SzEvMmdQNy9rdHEwNXFEMmcvRVBRSHp4TE50K3JFZzJIWFZnMkR6clk3?=
 =?utf-8?B?Mis5NnJ0Tnd5YlZYMDhBM1hvTzlmcnphVzVBbytKcEYxcm9Lb3JDWHVUUDRY?=
 =?utf-8?B?YW5ubCtiQkI0TG9KSVNseElMQkxuU3dQODBaZGRMYWh6M0pudk1rOWdiTWVa?=
 =?utf-8?B?UlBFWEdMZTZkUjZiSk9NMkVDbzVPa3d1dTlTN1h2SUdDT21XREpvL2VvVzBO?=
 =?utf-8?B?L0JlQnBVVHA2eDZSTDArMUxySXlSblZ1cTh1dFhCV3pzSjZzeWVxMFV6NW9v?=
 =?utf-8?B?ZWtnbmVmU3d1U1U4dGlQczJabmFZTG9Uakg0RTJQMUFkcjB6bTVEZzVjMStY?=
 =?utf-8?B?UmpLcCtCTHhiRWhMaHRQVnV0THV6dkF2SHI4L0RmRFN0eVpkOWpqSmRBMm5X?=
 =?utf-8?B?a2RqcHdWQWpSNGY5V0VsdzQwU1BrTFdOczBjMHAvSDNvdFY1RUc4YkhDSWQ5?=
 =?utf-8?B?VFNGL2NTQWdzM0NsRjZIT3llTWJHaFROMDgrdGtzU3FlY3FDVHFrMFR2UGdP?=
 =?utf-8?B?UXJ4OXpKTHBVVTdtKytCYm9tV2dGbVJpMEVZYVRXOXdzREQrT2tLNER4OG54?=
 =?utf-8?B?VzdUekZwZ2t3dkpjSkw1ZWNkMFNNRUF4OEpWMnVRWE9PMFFYSmhRLzhhQzRt?=
 =?utf-8?B?L0FWL0lpdzhtczQ2Q3RSNnI2VElKbzNMVW5zdk0ybGFLUHA4ZmJORGt2K1lx?=
 =?utf-8?B?TXhQWjJtU2VHRVc4K1d1N0YwZmx1a1RHZDliZGk5RzNIaHp6d1hNVW8wMTVQ?=
 =?utf-8?B?MnV6V2ZjWUtUL3Z3L2pxRlk0QWFsSVl2SGh3cVJVMGJRSzIvVDV3bkR6VUJW?=
 =?utf-8?B?RCtpeG1aRVRqRjRBSVoyaG9RV3NIcXczOEdpTVFuZmk1OThrUG9hZGFjL3dU?=
 =?utf-8?Q?VOl3rAU0UsX+I0fdqE3rIzA3U?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24bb2885-a033-4e07-8900-08ddc96d4585
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 22:15:31.3309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zEs/VtG/LScXjapMQMm5txATJ+OJlcDtxFaBm/tV6TJzpzY19lP4Wl4vFy93XP/sQE24Yk/C5HKivxBjz4qkjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8603

Hi Sakari,

On 6/19/25 14:57, Sakari Ailus wrote:
> 
> 
> Document the use of raw mbus codes for camera sensors and how the
> V4L2_CID_COLOR_PATTERN and V4L2_CID_COLOR_PATTERN_FLIP controls are used
> to convey the color filter array pattern on UAPI.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   .../userspace-api/media/drivers/camera-sensor.rst   | 13 +++++++++++++
>   .../media/v4l/ext-ctrls-image-source.rst            |  4 ++++
>   2 files changed, 17 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/drivers/camera-sensor.rst b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> index 919a50e8b9d9..9f68d24dfe0b 100644
> --- a/Documentation/userspace-api/media/drivers/camera-sensor.rst
> +++ b/Documentation/userspace-api/media/drivers/camera-sensor.rst
> @@ -37,6 +37,19 @@ format set on a source pad at the end of the device's internal pipeline.
> 
>   Most sensor drivers are implemented this way.
> 
> +V4L2_CID_COLOR_PATTERN, raw mbus formats, flipping and cropping
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +For raw image data originating from camera sensors, specific :ref:`raw mbus
> +codes MEDIA_BUS_FMT_RAW_x (where 'x' is the bit depth)
> +<v4l2-mbus-pixelcode-generic-raw>` are used as Color Filter Array (CFA) agnostic
> +raw formats. The ``V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>``
> +control in the same sub-device defines the native color pattern of the
> +device. Flipping may further affect the readout pattern as indicated by the
> +``V4L2_CID_COLOR_PATTERN_FLIP <image-source-control-color-pattern-flip>``

The links for V4L2_CID_COLOR_PATTERN and V4L2_CID_COLOR_PATTERN_FLIP are 
not working, need a :ref?

Regards,
Mirela

> +control. Further on, cropping also has an effect on the pattern if cropped
> +amount is not divisible by the size of the pattern, horizontally and vertically.
> +
>   Frame interval configuration
>   ----------------------------
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index 43a62a85afb8..3cb7ee1b0aed 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -93,6 +93,8 @@ Image Source Control IDs
>       is reported as being (say) 128, then a value of 192 would represent
>       a gain of exactly 1.5.
> 
> +.. _image-source-control-color-pattern:
> +
>   ``V4L2_CID_COLOR_PATTERN (integer)``
>       This control determines the color components and native pixel order in the
>       sensor's CFA (Color Filter Array) when used in conjunction with
> @@ -132,6 +134,8 @@ Image Source Control IDs
>           red, green pixels.
>         - 3
> 
> +.. _image-source-control-color-pattern-flip:
> +
>   ``V4L2_CID_COLOR_PATTERN_FLIP (bitmask)``
>       Whether the horizontal or vertical flipping controls (V4L2_CID_HFLIP and
>       V4L2_CID_VFLIP) have an effect on the pixel order of the output color
> --
> 2.39.5
> 


