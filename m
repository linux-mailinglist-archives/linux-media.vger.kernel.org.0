Return-Path: <linux-media+bounces-52917-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEbnJh06k2mV2gEAu9opvQ
	(envelope-from <linux-media+bounces-52917-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:39:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F5A145B32
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 16:39:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4F5E3057498
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 15:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0A231195B;
	Mon, 16 Feb 2026 15:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PUJJQXcd"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011031.outbound.protection.outlook.com [52.101.70.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD62432694C
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 15:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771256127; cv=fail; b=cW1jfhOm8YZz9kG6KDaluBwYZyuMLdsbULAy0vrj5J3mW1XtEXeb2NAgk+ATEI+U4OQ1eqyAOOl4gSXk6lxMqw+zHBoNhVjLHMzbz6c4RjyqigAB9AV7M7H3rpeYoiKmaCfPrXODHVb9sgGsDYMOaW5Z0e4c0EzGrhJMZrO6qHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771256127; c=relaxed/simple;
	bh=mh91f3quzlIrVQH2tgn8j5HZ75yu5QDUcsqnP0A7Ofs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q0OJoVj1kI7oEnWHAd4rSSiXgLqt8smwvFZB7YPEd/ftg6tUwO3sAnA0u+dv3QB9dGLCJ4pUyFo904tANJMnB4RydepS6+CuBzeuDQ1OGSLZEJPjEtC99hWqi7+4e+WZ+jndlzZHxNLULJiZXJWpQrNynqEHBf8H5XhQPfaZ5mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PUJJQXcd; arc=fail smtp.client-ip=52.101.70.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZD2eVwZSuXlAHshHyeCVyVjChCwGESXZcY1+Z6OmWDcfWdAcWcxKL0XurXgkqpgYVuSbdwLLmkNEhJUL1DRJgo7LqmZV8I3SyL8831EQOlsfqztmSg4sQZV2cA8g9KLKDZn+rvsVI3sq7xsFmuw0qN9fG1u0lL7HRVM23nnOotP9BJFTmZBk9SfzJm9fWIv2MfIRnqpaL/tcMUgWNbiM1d9D18/S7fWt9fMWioBkZHOWYg0Zc/O0QaFD07vTiF60ZfB96GY/cTqMefOAsTh4LMQsKHkUwvEk/TxgdGDVw8s1mIEhbZo/zqUe6JdwZW7pxVqwH2k237HRn1Ah8gg3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRScR/xu8JKJRlhUaUVf+l1Bt5qWhemoLKq5G2dmqZo=;
 b=VZoc0CRVpBUjgx6MTMqmhGb1fmCbO0kAw+Raa+/CgEbUXIFc0m1jWGCIjXM58/pKIj7YR7udK1ZoeTYnkh78aUhftS2luKv7ZsESIXoLJc0HkIfRu/duw+X07/ebXTK+ve11jgfVsZ3pa9OUjMVWruyEUdYS6AuV95SHt+QGO3Ncc0eBVQBaX0PZgvq90fBYx67/XGJ+t7pQRvD7qXPoT4ha/wI9qjVNEu51KXgY42tLDCv3Js5Pdg92sYrAFnmWn9333TrlDb8qdYIk1uKy/hPPvREUKmkyTiJo3bD37Opd1XFk3UUIYfgswLSGmc3lecnl8jPT9bK7Rp9p+71ZdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRScR/xu8JKJRlhUaUVf+l1Bt5qWhemoLKq5G2dmqZo=;
 b=PUJJQXcdr/Mmf7aHyRT+QP98EbNVZcHK2xK6jNcId3pjzzbyscVZyoM9EeiaxtGKo+qQzOnwb0rQVnuKETqBQsJiHKc5lLrRF76HnSOrpEOeerNGWHR/MeCIN/7+Z6NJp2KbDw0zRc8FdK/T54MPL03wJ+qXWvBYeMZTIOAe2gfbSNew0W4YJW0lSfYXYhb4IZro6cLUOMPbl7suaXWyTl2OdEMBKQrFxcblZjTGT2Fu/c4gNfD5Ss6rsGiw+d3276J/3r5XxV8DBxjDYzVxRQN9hBCMWawfx7c8OMDmPwbQGzrkN+Ucfjq0uPf6zuOOreDSOrVbfseTCA17piAHHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AM7PR04MB7109.eurprd04.prod.outlook.com (2603:10a6:20b:117::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Mon, 16 Feb
 2026 15:35:22 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%4]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 15:35:22 +0000
Message-ID: <9e71c99b-a6d6-4a71-bfed-ccf8e59695f8@nxp.com>
Date: Mon, 16 Feb 2026 17:40:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] media: v4l2-subdev: Move subdev client
 capabilities into a new struct
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hans@jjverkuil.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, Stefan Klug <stefan.klug@ideasonboard.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hansg@kernel.org>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Plowman <david.plowman@raspberrypi.com>,
 "Yu, Ong Hock" <ong.hock.yu@intel.com>, "Ng, Khai Wen"
 <khai.wen.ng@intel.com>
References: <20260211090920.1851141-1-sakari.ailus@linux.intel.com>
 <20260211090920.1851141-11-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20260211090920.1851141-11-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM9P192CA0014.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21d::19) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AM7PR04MB7109:EE_
X-MS-Office365-Filtering-Correlation-Id: f8064b38-57c5-437d-b821-08de6d70ff23
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|52116014|366016|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?NExPRWdXREE5bHNLTjN0ejRwOWxzWU9hY05BMWFOR05XWTJDV2lVNGVPQUFk?=
 =?utf-8?B?VElTVFdoWlVWRkJRWjNFQkt3NFRURURDV2MxaEpMS21FUGpOZHJ6YWRoejVP?=
 =?utf-8?B?YmN0czZVOTZQNkpwK2Z5eWZVZ0lhY0lCT0JFTnhtQ01rVkpFVUNqYVdwRUpt?=
 =?utf-8?B?MEVxZUU4czVER0JUZWFzUkJZSWM2cTE1MHU3VzZUYVNzdFFOUEluTU0rbHVG?=
 =?utf-8?B?cVJ3eCsxQy9oWkxOcFdPQTlnRDVtUk9yWm13Sk1JTFpGaVRDaUh3ck5DUHhM?=
 =?utf-8?B?ZGw1MDdYR0JzN1QxSzlXbGtsWGJwYlVmWWliRHZqTEk1dXdnQlRpTkk4bFl2?=
 =?utf-8?B?bTh4RTZRNU1tMm05WkpPekZZRjdXOS93c1lYb3lrYUh3SXo1VVpTUVUwLzVj?=
 =?utf-8?B?bGROaWZNU0VHY2dmRzlOKzZROVNYdHZ4UjVnQXFEMm90cHQvcGhwSUFFL2la?=
 =?utf-8?B?T29yR0ljZ0ZiUzFYMWJHampkUkFsQWRtMDgycXZoMEJIS3pSSU1xYWZQRURZ?=
 =?utf-8?B?SElMOVJpYi85TWZMZGUrSFlOazZaNlV0OVJOOGxubEhxRzQwVzFQQk43RVM2?=
 =?utf-8?B?a3gzZ0R1TXk2SjU1dk5lcnArWitIYmp3MDZyR0RTM09BeUxFV2lEWDMxeFlF?=
 =?utf-8?B?U3F5bkJPSXlXUDBjM1J1ZW0ybWtPbDZ1SU1RdWtOeFh1N1JOalBGaU9FWlZh?=
 =?utf-8?B?TGdubWdTVmlFVVJpVkRMem1sMGRVbEZpTzhYOS8vQWFGOGxWRnQzVWgyUGZH?=
 =?utf-8?B?VUlaaUIyVXE3RGxPWXRGZXZYcVNudjdCd1IzVFNSNm9QRVYvWnJySGxDRStP?=
 =?utf-8?B?K0F6U0pheHVSYlAxUkFibGhxWUlhTytUNnlxVDk0eXZhQVNVKzNwTmwzdVRB?=
 =?utf-8?B?T3U5SUN2YmFrS1RtZVNkRmhScmtPZ0lsaUhFQW5ZL05uclA0dlFWQ0hBbjJR?=
 =?utf-8?B?dFJNRGR2RzhUQUx5eGdjK0g1SDNJSnpGVUQ5alB2Y0gwREJheWdIKzJXd1gr?=
 =?utf-8?B?RUhFa3E0SkFrWlcrd2tSeURXdk9NTW9IVjI0bHV6TUlYUGpKWDNGZVZvakpl?=
 =?utf-8?B?SGM3WTFRa1JBdUM4M1ExNE4xWG13d2hMeFFUTVpocElGdzVuOHE5Z3g5Z3E4?=
 =?utf-8?B?eEZramY1UlYwTDJ3aCtReStWck1oSXNHMXc5OWhvYjZrYXdLeG8rcFdSMEV0?=
 =?utf-8?B?TDNHSU9OUkgyVTRhbWI3UTJzdmhSU0U5VUpjeEFjdXBQN3ZmZE9XMWNVVFhD?=
 =?utf-8?B?a1B4UmhkNDRPN1BUT1NyVUpOQlBBTXZMYllmUTl3UTFlSWcyZ0lVaWxETDdO?=
 =?utf-8?B?SjlsVGEzNklyTU9QL2w1Y2lwSUVoUkpZWGJFRitaNFdJWWRlSGxyaVZIZUZP?=
 =?utf-8?B?NzVVb1hybkRKWUtiU3RSTkF2MkxTR1NOYzE2OGVSaEhXWFJnR0lhcDFURXlE?=
 =?utf-8?B?cXlvSklmZlpYSlp2dC94WXFrcUZxNEJQRHFGbkRqWlBHbkVZWk9mS01RcjRq?=
 =?utf-8?B?c2ZXQ1JCdW9hT0V3N2dMTFhoaldzc2FPK25KVEwyZlEzN2dsR2ZOUW1NM0Y5?=
 =?utf-8?B?bW1xYmhKT1ZzRGpBZUFoaW5HOWZyQ3ZCZ1ZVdXRzcHlXUk9hcmgyL2lNaEJh?=
 =?utf-8?B?VldkUi9WUmw2dUMrRWlCMzJualBzVDdaSlBobjRnSnV6N1Fib2V0enQrTFVN?=
 =?utf-8?B?VFR4bTlrU0VHd24wUHVXanFReldtYjhmTm9uYk42SjhjeTFPOGVNeUxGcm84?=
 =?utf-8?B?aWhZYUZJTFg2cUVMSUYxNklQcmY3SFF0Z0RaY1Nzam1HQ2MzeE1pQjhKTDM0?=
 =?utf-8?B?VkRJZFlDTngzd1g0by9nZ25RaFZLNmdsWTQvalkrbkJ2clozWElVdXgwcTBX?=
 =?utf-8?B?UUFPSWNFL0Uyc3dIWUVpeHNVQ09IUDZ3QkozUTJsWG43clYybUl6Y3JnZHZK?=
 =?utf-8?B?ejQvZ0F0UkZtWUpob0RoemdoaldLY3FUSlU1amRQa0Z5SWU3SzJDOHJaVEhi?=
 =?utf-8?B?eFA2Q3NlZ2dGYmVFNFdsZHN2L2F1aVR5Wkl3NTlQMmxQVVdERXp4a0daeldL?=
 =?utf-8?B?ZTZMS3p4dEVqdENVRUcyOUNmdUhiQm1IVms0Q2F4aWVBVWZxSitWcFNpZFhG?=
 =?utf-8?B?bUh5UTFDc2lXN1I1S3IrK0FhbEtISDhjOVd5cUg0NnZWU0FTYmhvZDQzamFp?=
 =?utf-8?Q?pqm3h7WGKx+x362KYXzJOeA=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(366016)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TUcyTDRkNEg5eE1acGRLZDJ1REFFbytrc3VZNFdROUlVTDVOalgrd1lReEV5?=
 =?utf-8?B?K3FySnV3SEJTQUswQTdReGpKRmc2MGV3eHhNV1JPSDVSVG94Y0RhZnhWZGVq?=
 =?utf-8?B?VElERTd2TmxGcERhK3prczBoNzdKNUlIeUxHUGxBd0pQQ2xheUZLUUpvWTVJ?=
 =?utf-8?B?WXJPYXgxS2E4ZG5Tais4RWpkZHozOXFQQW0rNUEyRW5wWU8yZVlxdlNZMzdI?=
 =?utf-8?B?K1FnaFd5TmxOOEhJTUpHOHZ0YnRWZWtwNWI3ZnVsVG8rdkJ1RVFZUFJOVkxZ?=
 =?utf-8?B?TS90eU5zT3NWSStrbWV3dmQ1ckEwVWdyMHU1eWE0RkdqQTJlcnU2dXVMNjdy?=
 =?utf-8?B?TGxOT2ZBMXNzSExPUmowNlVwSXNPNjc3TVJTUjNic3Jxb1FCdU0xa3R5am8w?=
 =?utf-8?B?eTVWVzEzdWw2RElVdHdkY0R4MFBjV0EwNGw4LzBlWkp1ZlFUd2NsbDJlV2ZI?=
 =?utf-8?B?VUZVb3R0bkRxdUI1Sll6NFlML1FBYUJzRHhLNkszS3A4SkhSSklCeGFNOVc5?=
 =?utf-8?B?UEVFbUdxdSthRWlzYXVDR0wyeGxRQlEyYUE3Q0hkVks5Z0hGcFNuUjZ5dkNr?=
 =?utf-8?B?cVBSNkVqdXJmOG9oMlFlSFNFb2VGenR0c0toM2w1N1VSVndWNXkwdmNFa0lt?=
 =?utf-8?B?a1B6eDNUNy84ak1GTWRYenBaOEtoeC84NjRxVWo5aUVQcStMalhqZlBSc1Zk?=
 =?utf-8?B?VVVDQkRXQVJqbUpBak1vNkNvZjBac3pZNmp5cEJXcVNGL2F5bzNUQTYvdTIx?=
 =?utf-8?B?eEFSb0d1b25EQ2VHUWRSVDRIQ1Q4SkxBakJHSElCcUF1QkZ5VFk1Ri9HUjlT?=
 =?utf-8?B?c2M3cTBWenlXQVlCdjgrRFArRzE5NmlOQWQ2Sm9Wd1ZENlg5TFptdnpMRWl2?=
 =?utf-8?B?dE5nendUdFJmVlAxckZxZzhIMnlLRzFqYWRvdTRyMkFISCtkNXNURXZoK0U3?=
 =?utf-8?B?WG5PWmlyWHNIMHJncGJVNG9BV2VzaFJ2QTRIcGN2MjJucW1MMmpiRU94ckZM?=
 =?utf-8?B?SW1YUjVoVnVqdGNQRVMwTE83WnNYR2hRTVhsVmYrZjloeUJBcE1sUk8wVFpY?=
 =?utf-8?B?Z3hXYWE1YUlCa3pEZlpHZk1jMDEzVDhqMEIxaEVSZm13QjdWd2hiTmw0UFVG?=
 =?utf-8?B?MERIM2tudi90TlhBTU9VMTBEUGtmamdyTytORW1tY2JjZTkzZkdMejdJeDBy?=
 =?utf-8?B?Ty94elhQQitKd2pXWUg5Y2RXWmF1SEVzTEpGR0xhT0UvcHJRRjFia3VTa1F5?=
 =?utf-8?B?N0NyMUVxdStPWjBuVExjMzNFZFpPQjdMUjlRZmFkeDdVcmYzcnNOMVlBc0Rp?=
 =?utf-8?B?TEI1dEZiQ0VJaVd2TnBDeUlGRCs0a0gxTnRuZW54Nm9saDFTeWxxRWtoYTBa?=
 =?utf-8?B?LzZUbXRSZWhCR3M2YlBGZ25OU3ViZEhjY0xQS1pKRmJjVXZrYW9UYmJQQkdR?=
 =?utf-8?B?ZG5XcGlTY2Y4Zk1DRm9penNCOTY5NnRSbVg5UjBTQTZENEM0OWw0UEpMMWZC?=
 =?utf-8?B?Ung1d2poNktvdXFlWEoveUtIUk1ESmMxbFBNckxETm1MY1ZQUmdidktXcDFW?=
 =?utf-8?B?RVNlRTJOWjUwOFp0cU16TjVvcFhUREpzWUwyaFU2ak5LaWk5N3JteTROdGZG?=
 =?utf-8?B?RVkyQnhzeGZaMGdReEkrUGF2YXlDSzVCanJOTWJOaUV0ZjNaN3NnVUxsU1V6?=
 =?utf-8?B?ZWorL2NPS0xxQWpid0wrWEtLeEtNSFMvQy91aGI1YU5OWVE5ejhwRTVheXhT?=
 =?utf-8?B?endYZzQyUXVYT1ZWOU4wT0puNVN6NS95YkU4M21FYUdwOGM1cndpS2R6dTNh?=
 =?utf-8?B?a2VZcnczSlJ3c2xPTDJ5UHhGVTFLQVFwT0d2OUtqMEVWcjllR0JrZm9OQlJ4?=
 =?utf-8?B?NVU5WUw3QmNJNEJiTDc0bUhyb1p5RERJTDY1MU5DQXBDeVBiTnVJNU9seGh5?=
 =?utf-8?B?L1paREh3eGZqL0hFZklocUJ3UGRkRzRwVzVGQ281d2VjeDJTdElvd0F6VjA0?=
 =?utf-8?B?LzRacFpZT25EeEpKVFQ4bkpJMnpZTHd3MzVEbnhlMzY2d2hEdjh4bGRUTDZm?=
 =?utf-8?B?Zk5NcVptL2VqTkJDNUExUGdZMGJuaWptZFVjbFo2V2VaVnk3UDEzSnFDVEc2?=
 =?utf-8?B?TkQ0eS9qalJhZkljQjlpbkpJRE9odFVDVHBjTVB5U01nODlweVI0ZUd2aXhO?=
 =?utf-8?B?dzNlcmNPVXNyNlYySEVWMlh6cE5yWHZYZjMzZWdvMkV6NUkxSklPaXZqeXVh?=
 =?utf-8?B?a3N2Ui9zTWF4dnpFWVBweWRHMnptRG1IRnF2NElFd1ZOODZYMTJyS2ZOTWJo?=
 =?utf-8?B?cnUwR1dpWGNNdlc5ZDZ1REphTTNkTnpnSXNFazFpMDQyTGRuOE9nQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8064b38-57c5-437d-b821-08de6d70ff23
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 15:35:22.0539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jd06siFMbZAplTSL5LBFbO3l6IqlFFJbJ/1oj7wt2V+40o+Ex1wKR0Xf1KBeaO8hATQr6N4O/yfV2fRpLucLlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52917-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mirela.rabulea@nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email,intel.com:email]
X-Rspamd-Queue-Id: 06F5A145B32
X-Rspamd-Action: no action


On 2/11/26 11:09, Sakari Ailus wrote:
> Add struct v4l2_subdev_client_info to hold sub-device client capability
> bits that used to be stored in the client_caps field of struct
> v4l2_subdev_fh. The intent is to enable passing this struct to sub-device
> pad operation callbacks for capability information. The main reason why
> this is a new struct instead of a u64 field is that modifying the callback
> arguments requires touching almost every sub-device driver and that is
> desirable to avoid in the future, should more than the client capability bits
> need to be known to the callbacks.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>   drivers/media/v4l2-core/v4l2-subdev.c |  8 ++++----
>   include/media/v4l2-subdev.h           | 12 ++++++++++--
>   2 files changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 8a433d074587..79fb4643182a 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -611,7 +611,7 @@ subdev_ioctl_get_state(struct v4l2_subdev *sd, struct v4l2_subdev_fh *subdev_fh,
>          case VIDIOC_SUBDEV_S_FRAME_INTERVAL: {
>                  struct v4l2_subdev_frame_interval *fi = arg;
>
> -               if (!(subdev_fh->client_caps &
> +               if (!(subdev_fh->ci.client_caps &
>                        V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH))
>                          fi->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>
> @@ -651,7 +651,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>          struct v4l2_subdev_fh *subdev_fh = to_v4l2_subdev_fh(vfh);
>          bool ro_subdev = test_bit(V4L2_FL_SUBDEV_RO_DEVNODE, &vdev->flags);
>          bool streams_subdev = sd->flags & V4L2_SUBDEV_FL_STREAMS;
> -       bool client_supports_streams = subdev_fh->client_caps &
> +       bool client_supports_streams = subdev_fh->ci.client_caps &
>                                         V4L2_SUBDEV_CLIENT_CAP_STREAMS;
>          int rval;
>
> @@ -1124,7 +1124,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>          case VIDIOC_SUBDEV_G_CLIENT_CAP: {
>                  struct v4l2_subdev_client_capability *client_cap = arg;
>
> -               client_cap->capabilities = subdev_fh->client_caps;
> +               client_cap->capabilities = subdev_fh->ci.client_caps;
>
>                  return 0;
>          }
> @@ -1144,7 +1144,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>                  client_cap->capabilities &= (V4L2_SUBDEV_CLIENT_CAP_STREAMS |
>                                               V4L2_SUBDEV_CLIENT_CAP_INTERVAL_USES_WHICH);
>
> -               subdev_fh->client_caps = client_cap->capabilities;
> +               subdev_fh->ci.client_caps = client_cap->capabilities;
>
>                  return 0;
>          }
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index de2684b15b96..c9fe99ea7841 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -734,6 +734,14 @@ struct v4l2_subdev_state {
>          struct v4l2_subdev_stream_configs stream_configs;
>   };
>
> +/**
> + * struct v4l2_subdev_client_info - Sub-device client information
> + * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
> + */
> +struct v4l2_subdev_client_info {
> +       u64 client_caps;
> +};
> +
>   /**
>    * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
>    *
> @@ -1129,14 +1137,14 @@ struct v4l2_subdev {
>    * @vfh: pointer to &struct v4l2_fh
>    * @state: pointer to &struct v4l2_subdev_state
>    * @owner: module pointer to the owner of this file handle
> - * @client_caps: bitmask of ``V4L2_SUBDEV_CLIENT_CAP_*``
> + * @ci: sub-device client info related to this file handle
>    */
>   struct v4l2_subdev_fh {
>          struct v4l2_fh vfh;
>          struct module *owner;
>   #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>          struct v4l2_subdev_state *state;
> -       u64 client_caps;
> +       struct v4l2_subdev_client_info ci;
>   #endif
>   };
>
> --
> 2.47.3
>

