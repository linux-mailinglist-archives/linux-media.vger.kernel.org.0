Return-Path: <linux-media+bounces-38248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5530BB0F1A7
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 13:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CA3D5828B5
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 11:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8E212DEA8E;
	Wed, 23 Jul 2025 11:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YEdhMEEI"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013017.outbound.protection.outlook.com [52.101.83.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C843289E07
	for <linux-media@vger.kernel.org>; Wed, 23 Jul 2025 11:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753271556; cv=fail; b=L9v7tTEHeIweYo+4/b3oirAvsbyhByUVtYxLqCNF/uepv1GShg6wEWC86ndSrD44NW1gUfMkT95e5iK4DhoC9zvy0+PTg8LLzamzzYs5FxwlwYLRQXI96d++JUWW5VJGqVDP3bfqQMVqSX+Nn7n4Q+S44GqCeNATDgNfM7rd1W8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753271556; c=relaxed/simple;
	bh=Pu2PNV4pmgrhHnvf7tpigT0t2MDBRm6ztmjTprRv5A0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L4oyaMtbrCJIEcyYXYZmE91F7ASJ2UHmKLD0YXedodkVm69JviH/6BGKJTKidGWAgwH8CmNBAJwv6TmytFJkdevGGHMO1h1ETvL1IW0bpd0dyihXvxrS5kLpklTjknQPQKWmM3Raaii5CEHOXd2K0AuGG94Dl6d+3hIJBa/kNlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YEdhMEEI; arc=fail smtp.client-ip=52.101.83.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCyKLxc8CmoqwugPYGEy99ILt52wavNQQC3IVSXkUxrDmBoJCimSLqR+27YhC/aP6KpgbIg0kf7QS4LFQkHHvwlYr2iHYVGmhvCaiiZ7rVz/YdUb+EaB6F/QphQcaMbvTMCDgs8MUuT9FT5lJ5Gjn6a7IvvknBPHuGPcGc8FQnd7CH6OoI2t3/60bLAGu7T8gYgLXv9XfU4GJ0/knNt2HaPoVfVYLlK3ELsm2AszmTXhafYw6lGBUDlNwPr7vejS9lm97KeWpj8ApleJCcE2jC3NU9l7t/xVGqsYdNI8aAEk7rxwEwqeg5ZFER7RE84lamzKIiRsTM3xPtI4CJY+1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YetjJxpcJsmVVpJoY086Zn32yrt8raaZxZXPi7FljYM=;
 b=BIm6G7FpGY9HR57aSN2M6yzDh5MJeycNagXhY2kH99KaIu1uKe9FCeLnaxYdUoAqwZTyVzo6cCqVlVpapvSAMhLD3zfAmfA0BxjUlwMFReTylEG1duwhK6qnawA3Rhll5LJ3SCdc8Og0gWedaPWY8SbYTh2iNolIUzBlM1Qwut4bEZbp5Y0OgkkOuwN/3ASZq3BlMuLoEogxDHR2eMiWOeBQ7OKPpnVUtuPyQt02Famjk8pA0eNgl0rN1Y9DMo5RMa7bzEPQsNjQ9OVwGI1coMbMM5aZRyi1IaMJdidhb31DVPtSlss52p3kNG8eVN9Y7V4n/ixNHgtnFSo1PF8GlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YetjJxpcJsmVVpJoY086Zn32yrt8raaZxZXPi7FljYM=;
 b=YEdhMEEIpMwQ1UVgLp8xU5LQiLcjyxY1xrTwDZ5Cdv9xN7vggA8NjmKC8phll7DloIvxPr+OwwJ16XtThciqKChs/GUvoTAMenBJpZFCxujiUghKRNAAAIxDmL7xvdWqjLYCclZQK0IDhmqu1hKPr7kS4tLdzaCAFlAcwenNLWuzMmp5Qb+UJTZyZ3Jq8p5wYxLjFcj4e7/0HCmXl4cWeaW6u2132gfW3zGupnbM/27tcDSgKI4PWJ33JRvh4HF55y2I9oHKBi5thkD0VDdKHtA8RP40YfwYej/Nk4pcAaGQ3idaB68xtRf4hn5RDBsuvQJLFm6QvLT9Z58Erinl8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by DB9PR04MB9963.eurprd04.prod.outlook.com (2603:10a6:10:4ec::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 11:52:29 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8964.019; Wed, 23 Jul 2025
 11:52:29 +0000
Message-ID: <6faf46b5-e48f-448f-90a7-19003b76d3f3@nxp.com>
Date: Wed, 23 Jul 2025 14:52:11 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 22/64] media: Documentation: v4l: Document internal
 sink pads
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
 <20250619115836.1946016-23-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20250619115836.1946016-23-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR02CA0047.eurprd02.prod.outlook.com
 (2603:10a6:802:14::18) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|DB9PR04MB9963:EE_
X-MS-Office365-Filtering-Correlation-Id: b72d3d5f-26b5-4a52-7061-08ddc9df668d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?cVpYTEpka3R5YUQycU0xRlBHY0tSWjFtSCt2aEZPYThOZm5QSDd5RW5XN1hi?=
 =?utf-8?B?Mk9BOGlkNmlSTmpPVjNnSnpFWHFhWno2R2FMeTF0UVRWVEFuSU9MZG11cVNJ?=
 =?utf-8?B?M2VEaFE4Ujc3b2dLdm42MDNoUzBkVHI5b2dnRjVMbnZXQ2JVcmJZRTVxK2dm?=
 =?utf-8?B?eWhUWmlVbE9KeVZON04zalBZaXY2UlFPcTF2aHVpV0xFWWxyRVlmSmpTWHhw?=
 =?utf-8?B?RjhIeXFPcGlwdkdvT09SVGtKZFZhWE1QeXM5MVhkcFV3YlBaLzcwUnBhNVRi?=
 =?utf-8?B?WkNKNHRPaEpqdWtSbnNJazlrNGN4Wks1V3ZhL2ZTZXVIcitLUGZ3N2FVT2or?=
 =?utf-8?B?cVZraFg2NEhveWFCU1h3L1RjZjhta0kwUUkyWHFUdFZRQVpSU05KdG4yMzdq?=
 =?utf-8?B?OC9sT0tPemxxQzQ1cGhicmh2TGkyOWxDQndtQVMrVkMrZWdQMG5DVFpMNXZL?=
 =?utf-8?B?bTN3VFRVZUgxTzR0WVNpeXJDbGY0ZU5xL1ZKWGNYOW9hbHludDZJYThVZFdK?=
 =?utf-8?B?bkRxd2Vhb2NYeElNVXI1VGdkc0ZXQzZZV2thWHhzb0JLbCt5M2JHQkVpYTI3?=
 =?utf-8?B?d0lIMm1zZzlHb3FsUUwxR0syY3BBUytibDBjeHA1WHhYUThCUDd5UTltYUo1?=
 =?utf-8?B?ZE5TODdHdHJxdUZOdWJjYzhBVzBSWnppUlJpRUNRODlzZ0pnMXdKTWpXQld5?=
 =?utf-8?B?RE9TUDFwQ1B1citZK2hEZlZiaWlNRXRYYjJhV2UzdGhwS3loQmNwa0hIS3Rw?=
 =?utf-8?B?RHZKcFhLandQL1lEbmJaVEozamlXYmxMbFJ0Ykw0YnNsbm52MWZMdDBlbmNa?=
 =?utf-8?B?R1UwRDVtRW4xaGhRUFY5NTN4bVZnMTQwRDlJVE1BcUo5aUJOU1U1Z2VqZ0g4?=
 =?utf-8?B?Vkh2bGoyMGNhNFJNUjJmWkQ0TG90V2FYKzRUck5HelZNZmNhWG9YUzB2a0VG?=
 =?utf-8?B?d0hJa1dqU1BoTnZLMGNLTVpmbjhSTWxIdE1TM2U0MnVOS3hNQnhheWFsTFNI?=
 =?utf-8?B?d3UwN2E4Uktia1FrM0JPdTQrRjdZWENER1p0ZzYwL3pFazR1VGZYODRSSUo3?=
 =?utf-8?B?bWFYU0YwNkF0TFRjanh5b05zTElsUHdlTTl3UjlIeEZ0bTJ0UFphbmhSTUU2?=
 =?utf-8?B?bmdaQS9MRE9xaTloczZHU0o5SmhHVzZOT2drb01YZXhsV0ovbjJuMjdOUTBX?=
 =?utf-8?B?UWN3TmV2YkFWNTZGNW8yQ1d1MVNSa0k4VlNaZG5KRXh6YU5TcEpKTlEyQUQr?=
 =?utf-8?B?dDI5VkpDeWRYVDVXUVBRay92THlBKzlNaFo5eGFicGRWdlkySEpINjEvYzlt?=
 =?utf-8?B?RXl6UEg1d2thZWNBM3BTM2h3ZnkyS0ZqOW93SmpQajFaa3hJS29lVTlNYUox?=
 =?utf-8?B?ekdFcHVETnBuRlVGemZYaWNkMklTRDJUd0JuTTIrSm1QcmplSVJtblRybHdD?=
 =?utf-8?B?anErQ3h1OXVJVVpUT1Y4WUwySTNMOFpIdldmVXp4RXJpVUZkVlBCbDdEaS9k?=
 =?utf-8?B?NFZUOHdKUGlpVUpidSs5b3VJODBWS3V3dTFiVkRDanhHcHJmTEt5NHpHMnQ4?=
 =?utf-8?B?NDF0elZwc0t1YWhPVitVek5TTytWMjdjbExIb0RTOVBOSkNNK3IwaUtRbVVG?=
 =?utf-8?B?anNyYnAvNW90WXdLelpoVmYzUlZzRitQbWVSblFlckJjcURsS1RwcjhjWWUz?=
 =?utf-8?B?bnMxR1NJMHROYmZLZUJ4RXNFbk5McXdZTnpnNk9UUlJ0eURzaHp5VzVlR0pT?=
 =?utf-8?B?MFJHMUgrTmNYeThRem12V25TWWxmUXFzVmZlMU00Q09HVnY0dW1qeDN6alNz?=
 =?utf-8?B?MTRJbXdPZ280QXBPMTBBMkVHNHpNNmtTakNZd3FJNnJ3VHpkL1FjT0NKSjQ1?=
 =?utf-8?B?UU91TVB1dXpGSlhwRVFzU1d4amVwL3QvM1pWdGRqOGlhWmpIZkpuRittWDll?=
 =?utf-8?B?U3JDTitCVnJsZHdmR3ZkZ3BGQkJGemVCa2ZzQnpSWEp5Y2hYQ3NuRUR2OWho?=
 =?utf-8?B?Q0RrR3J5QkJnPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?U0IrM21OY1RNMWl1NUxBWVhVZE0wQ0g5bkw2MVZHSm9Rcnc2QlhvaHQ4N0Q3?=
 =?utf-8?B?UENlVUR6S2QyQ3Jua1JobTNacEhqUis0SExiTG0yOEFlOHAzcjRudWVEVVFl?=
 =?utf-8?B?bDQyaVNWNU50V1lvWkVNYmdYZ0FLT29YQ040SitHWGdBaEhWeWJ4dFY5NzJ5?=
 =?utf-8?B?NFByWWRYYTZQRE4zdTRFNjk2aUkzQ0E1M05kS1l0QlUxdnhWTVBBSWJ2aDJj?=
 =?utf-8?B?ZTVMZGZ1c29KMCtOdktsdThmcjR0cGRCMzRvVlpUMy9CUmNxbk9oUnA5MXBQ?=
 =?utf-8?B?WWZweXJvY1VsZEtKd244VDF5UndIM1pnSFNYRFNzSXdpc3hFSWlsN1dPUDhQ?=
 =?utf-8?B?cCttOGs4QXlTNkRtMmlIQ1pNMFpmMy9tVFBlVnRzSUxMVHdkVWlmanA4SEly?=
 =?utf-8?B?bThqOXpMK0lyRHplRi85M0VrT0pRaE0zblgzMC9QN2pvYmQ0c3RwT0hNZnl6?=
 =?utf-8?B?TjBKTjRPRlpUajZTWkxrNFpQcU54Zmx6NVZORTFiRVVPeEhZRlBxTHpxWmxS?=
 =?utf-8?B?RGxuZ2M3NEpvR0pFSVF3STM2dlRxYlB4UU1sVGl0ZkxkclI3YUUrK21WN1Bi?=
 =?utf-8?B?dHcvTU5saTZ0c01WZ3VEZGFJRFhSOHA2T1oyNlRLQjFOTWY1YWhxczVnckx6?=
 =?utf-8?B?REVuSDV3dXZKWjAxQ2UvNk9CT053cEtuMmtTckdVV0RtMWV1bU4vWnZ6dUht?=
 =?utf-8?B?S2lmOHdPN05ScFp6NXREN2JqTTRCQXE5MFpSMjMyKzVZWlNYM2tzdjRRTWNw?=
 =?utf-8?B?eDZFQUdlTlVYSER4S2xxQkkrYU9GcGFMUHc5eitnNDRiNXBrQWw5akRLa3Av?=
 =?utf-8?B?d3ljLytLa2RBNnZKblZrdU1GcHQ5NWhNRm8xdEVkc3ZabEkvOGhmbC9wTkIv?=
 =?utf-8?B?NW5JTFUvSTNPdzRoWHFLMnh2eFVFY1M5amd5bmFTRXhwL2p6aW9Rc3czVFlQ?=
 =?utf-8?B?emhDR0JXL1JLbi9IdkFUUzdlc3FYalkvUlZnVS9TaDhuNlJqM0JLYVdHL3BE?=
 =?utf-8?B?SEFMNENUWmJWakxCSHZUVUJhMGxkNkd5VWc0QmhheFZvcnJETFNNem8yWG9F?=
 =?utf-8?B?SFB4cVJUalpvMjhBY1NBZCtMN2tyTjYrVmh1bS9qd1NlU3BmN3VMcVJrVVg4?=
 =?utf-8?B?YW9EM01oTzVPQVhianJKY215SW5UcS93ZGxEM2drS2FjTjZoMVl0SUc2bldz?=
 =?utf-8?B?Q0t1MXhvOE5Dc0ZwRVlhZkZoUjY5bmNCQm9tdjMxbjRFb2hiSnM0U2VxUXl5?=
 =?utf-8?B?NWlUejJGUVBwM3ZSRy9UbjdRTnVuMTdqVUthdC9ESUZ3c2xxRHRFZ3RxNGJV?=
 =?utf-8?B?ejU5OVBDaVVmTk9ONEJMZk94cHJ2eCtIZU1aUkV4NXA5M1h3am5CY3FzVUZC?=
 =?utf-8?B?Snd0d001OVR6eWhtTHp3UkNTdWNqVlFnR01SeGMwQ0pzUlRuaHB6MUpLNlUw?=
 =?utf-8?B?U2V0RU5aUkkzdnBCT0xiMHg5ZUFEOTk3VnMvcVJPWmlXTHFPNkRTWXFGYW83?=
 =?utf-8?B?Y1gvV1hXYmpZalBpeXFaOURZbmpjT3pnWkEwUWlSdWlWeTNVMXFDYjdIQUpw?=
 =?utf-8?B?c3hzVWg5b096OVl5NzVzR3Y0V2RrR0IxcUx2ZGs0cUE3eEZNQ1UxYzk4MWlQ?=
 =?utf-8?B?OXk3dXZLREF0eDZoNitIQTVLUXJ0S2RmdlJiZnRpQll6OFRDb3BXbHBVdEpy?=
 =?utf-8?B?VHdsdFBSMlM2eS9qSEpkaGJWT1BKRUI2ODdpV00rVFArQVhIaitadFd0cWpl?=
 =?utf-8?B?aWI4em5EQTluM20vcVlHak82eE9GVDBJU2JsTThod0VRYlNxa3dLbEhvZHY0?=
 =?utf-8?B?K3d6Z2ZSZDZJWmQ0eHQ2QTZNZHdxQWJLUjdEUy9mNGNIK2xiVlFtUU1yWGVM?=
 =?utf-8?B?VmtDbE9VdWN4Y0JrNFJ5bHVHRGVSd3RPZ1FoK3R6QVV2cDR2d3lkY2M0b21v?=
 =?utf-8?B?K1JzM2dTMklJWnhxbDdlRkVRdDdaTHhiRmx6K2tabWJ3ZnhnZFVObmJwVlZW?=
 =?utf-8?B?cWpsb0FCTU1VRVVBbFZJYjdSNFhoUXpzVDlzSVcvcWZ1WExDTVg5NCtHMGtV?=
 =?utf-8?B?N0Z5eTdGa3pVOWRQMXBVMzNZRVJ1TmdYMU1xMmZrN21HUXJpdWYvWk92VmVq?=
 =?utf-8?Q?GxeO/QwzWzYHBwzNvuBw995rT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b72d3d5f-26b5-4a52-7061-08ddc9df668d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 11:52:29.4230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5wQNPkpucqWEq4Dh0fc2Fwzh8IxlBEN4tI5n5VXZmKsadoTg/MwHoKbs4/+h0M9Phuo+k7MTgGALTRX2/hhXPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9963

Hi Sakari,

On 6/19/25 14:57, Sakari Ailus wrote:
> 
> 
> Document internal sink pads, pads that have both SINK and INTERNAL flags
> set. Use the IMX219 camera sensor as an example.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by Julien Massot <julien.massot@collabora.com>
> ---
>   .../userspace-api/media/v4l/dev-subdev.rst    | 151 ++++++++++++++++++
>   .../media/v4l/ext-ctrls-image-source.rst      |   2 +
>   2 files changed, 153 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/dev-subdev.rst b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> index 24a69c419dfe..835e910d4391 100644
> --- a/Documentation/userspace-api/media/v4l/dev-subdev.rst
> +++ b/Documentation/userspace-api/media/v4l/dev-subdev.rst
> @@ -553,6 +553,27 @@ A stream at a specific point in the media pipeline is identified by the
>   sub-device and a (pad, stream) pair. For sub-devices that do not support
>   multiplexed streams the 'stream' field is always 0.
> 
> +.. _v4l2-subdev-internal-source-pads:

This ref does not match the subtitle below, would be nice to rename 
_v4l2-subdev-internal-sink-pads

Other than that,
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>


> +
> +Internal sink pads and routing
> +------------------------------
> +
> +Cases where a single sub-device source pad is traversed by multiple streams, one
> +or more of which originate from within the sub-device itself, are special as
> +there is no external sink pad for such routes. In those cases, the sources of
> +the internally generated streams are represented by internal sink pads, which
> +are sink pads that have the :ref:`MEDIA_PAD_FL_INTERNAL <MEDIA-PAD-FL-INTERNAL>`
> +pad flag set.
> +
> +Internal pads have all the properties of an external pad, including formats and
> +selections. The format in this case is the source format of the stream. An
> +internal pad always has a single stream only (0).
> +
> +Routes from an internal sink pad to an external source pad are typically not
> +modifiable but they can be activated and deactivated using the
> +:ref:`V4L2_SUBDEV_ROUTE_FL_ACTIVE <v4l2-subdev-routing-flags>` flag, depending
> +on driver capabilities.
> +
>   Interaction between routes, streams, formats and selections
>   -----------------------------------------------------------
> 
> @@ -691,3 +712,133 @@ To configure this pipeline, the userspace must take the following steps:
>      the configurations along the stream towards the receiver, using
>      :ref:`VIDIOC_SUBDEV_S_FMT <VIDIOC_SUBDEV_G_FMT>` ioctls to configure each
>      stream endpoint in each sub-device.
> +
> +   In case generic raw and metadata formats are used,
> +   :ref:`V4L2_CID_COLOR_PATTERN <image-source-control-color-pattern>` and
> +   :ref:`V4L2_CID_METADATA_LAYOUT <image_source_control_metadata_layout>`
> +   controls are present on the source sub-device to obtain the pixel data color
> +   pattern and metadata layout.
> +
> +Internal pads setup example
> +---------------------------
> +
> +A simple example of a multiplexed stream setup might be as follows:
> +
> +- An IMX219 camera sensor source sub-device, with one source pad (0), one
> +  internal sink pad (1) as the source of the image data and an internal sink
> +  pad (2) as the source of the embedded data. There are two routes, one from the
> +  internal sink pad 1 to the source pad 0 (image data) and another from the
> +  internal sink pad 2 to the source pad 0 (embedded data). Both streams are
> +  always active, i.e. there is no need to separately enable the embedded data
> +  stream. The sensor uses the CSI-2 interface.
> +
> +- A CSI-2 receiver in the SoC. The receiver has a single sink pad (pad 0),
> +  connected to the sensor, and two source pads (pads 1 and 2), to the two DMA
> +  engines. The receiver demultiplexes the incoming streams to the source pads.
> +
> +- DMA engines in the SoC, one for each stream. Each DMA engine is connected to a
> +  single source pad of the receiver.
> +
> +The sensor and the receiver are modelled as V4L2 sub-devices, exposed to
> +userspace via /dev/v4l-subdevX device nodes. The DMA engines are modelled as
> +V4L2 devices, exposed to userspace via /dev/videoX nodes.
> +
> +To configure this pipeline, the userspace must take the following steps:
> +
> +1) Set up media links between entities: enable the links from the sensor to the
> +   receiver and from the receiver to the DMA engines. This step does not differ
> +   from normal non-multiplexed media controller setup.
> +
> +2) Configure routing
> +
> +.. flat-table:: Camera sensor. There are no configurable routes.
> +    :header-rows: 1
> +
> +    * - Sink Pad/Stream
> +      - Source Pad/Stream
> +      - Routing Flags
> +      - Comments
> +    * - 1/0
> +      - 0/0
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Pixel data stream from the internal image sink pad
> +    * - 2/0
> +      - 0/1
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Metadata stream from the internal embedded data sink pad
> +
> +The options available in the sensor's routing configuration are dictated by
> +hardware capabilities: typically camera sensors always produce an image data
> +stream while it may be possible to enable and disable the embedded data stream.
> +
> +.. flat-table:: Receiver routing table. Typically both routes need to be
> +               explicitly set.
> +    :header-rows:  1
> +
> +    * - Sink Pad/Stream
> +      - Source Pad/Stream
> +      - Routing Flags
> +      - Comments
> +    * - 0/0
> +      - 1/0
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Pixel data stream from camera sensor
> +    * - 0/1
> +      - 2/0
> +      - V4L2_SUBDEV_ROUTE_FL_ACTIVE
> +      - Metadata stream from camera sensor
> +
> +3) Configure formats and selections
> +
> +   This example assumes that the formats are propagated from sink pad to the
> +   source pad as-is. The tables contain fields of both struct v4l2_subdev_format
> +   and struct v4l2_mbus_framefmt.
> +
> +.. flat-table:: Formats set on the sub-devices. Bold values are set, others are
> +                static or propagated. The order is aligned with configured
> +                routes.
> +    :header-rows: 1
> +    :fill-cells:
> +
> +    * - Sub-device
> +      - Pad/Stream
> +      - Width
> +      - Height
> +      - Code
> +    * - :rspan:`3` IMX219
> +      - 1/0
> +      - 3296
> +      - 2480
> +      - MEDIA_BUS_FMT_RAW_10
> +    * - 0/0
> +      - **3296**
> +      - **2480**
> +      - **MEDIA_BUS_FMT_RAW_10**
> +    * - 2/0
> +      - 3296
> +      - 2
> +      - MEDIA_BUS_FMT_META_10
> +    * - 0/1
> +      - 3296
> +      - 2
> +      - MEDIA_BUS_FMT_META_10
> +    * - :rspan:`3` CSI-2 receiver
> +      - 0/0
> +      - **3296**
> +      - **2480**
> +      - **MEDIA_BUS_FMT_RAW_10**
> +    * - 1/0
> +      - 3296
> +      - 2480
> +      - MEDIA_BUS_FMT_RAW_10
> +    * - 0/1
> +      - **3296**
> +      - **2**
> +      - **MEDIA_BUS_FMT_META_10**
> +    * - 2/0
> +      - 3296
> +      - 2
> +      - MEDIA_BUS_FMT_META_10
> +
> +The embedded data format does not need to be configured on the sensor's pads as
> +the format is dictated by the pixel data format in this case.
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index 64c0f9ff5b1b..d803a2f0f2f9 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -146,6 +146,8 @@ Image Source Control IDs
>       ``V4L2_COLOR_PATTERN_FLIP_HORIZONTAL`` and
>       ``V4L2_COLOR_PATTERN_FLIP_VERTICAL`` is provided as well.
> 
> +.. _image_source_control_metadata_layout:
> +
>   ``V4L2_CID_METADATA_LAYOUT (integer)``
>       The metadata layout control defines the on-bus metadata layout for metadata
>       streams. The control is used in conjunction with :ref:`generic metadata
> --
> 2.39.5
> 


