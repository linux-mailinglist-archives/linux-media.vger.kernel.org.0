Return-Path: <linux-media+bounces-52822-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJNmEb7VkWn+nAEAu9opvQ
	(envelope-from <linux-media+bounces-52822-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 15:18:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D54513ED68
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 15:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2DE5300DF6C
	for <lists+linux-media@lfdr.de>; Sun, 15 Feb 2026 14:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20E521638D;
	Sun, 15 Feb 2026 14:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="laYnSbs/"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013026.outbound.protection.outlook.com [40.107.159.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7948B3EBF34
	for <linux-media@vger.kernel.org>; Sun, 15 Feb 2026 14:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771165111; cv=fail; b=rqf/xZhsREck9bWKgZsM/fhdZY9qgEL9pcR6esq5I3zDyhP0qsnnoFCU1/DG/eMgmSAsF8S+LXWpzk8I7YOp5IHp/DEF1WYr8u5CMGzxFTOOqVbfqvM0Cl/DbEkJWEPg14mVvrkera/ZaYmRGhdJN1YsZiVcYB4CfI1sL8N9f50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771165111; c=relaxed/simple;
	bh=TIgaNLy7pEzAOPISmb5/Zyr8kLQKUap38FhUf6nkDos=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KChtZx0NK51r2DAVWfLjXue+PubpqYmxj++Dyv6cFFkytSNI8/dcfrpmNMoo9vXxSIJAfs7mUueH9+aZHAH6A1SDYk7ifRDHMbhs6ExRtYIfXGcyHMXDVGvQOMvztWyifgn9w2iEkPjqf+cyHVFTEGsXms/3RwCMCgj2yWJACfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=laYnSbs/; arc=fail smtp.client-ip=40.107.159.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eBhmredgRT06Fa4rzz+3FVDHC/zCuDy6yV3Y/vH4IMYvZRaRA55E+K+ItR6lvL7binna/QM5SLiwwYfBlEQ7czXmVFXnE8Hcu8U2mYaSl/fpB/ZqtTJhIxmg5pW0GckxM+4ElRsbqZlp8kKNeVbVNYuCOryLzhBGnt7DExPB2JLhZpfdVIXkbSX0921LzMeOMjSHLygTILDgHbk1TuP+nc5v5jRHcCnL+HgRYHnEf2IP6pSbILKPHxyo7Jp5zUTn5vRGfsKQt5OJeKxEb/gzk1ykqULVcrfvqTFCRFtjzqyUbjxvYw/kp6vAgd+fcohkg/e7cbV+rJzvM8KXKr7hIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCXJ4jmdJYz2mQXaDpLWkqGmLLA4Vr4Tokyrkoyp2nE=;
 b=Y5khHMfXvBgGJqKZlqXNoHWMuR0oUB2MQU2WFPxyHzdWObNcaGj9vAEsf7NEfYyLAw++ZyrhII4Ufwa+P/qDo5ueszIjtyRahO2yTVrIGzr6BHJaHt3ClxCA444OPnt+a3BaCoyQ6o6S9R2L2DA35AMkxxEmfV06Ju+/Hg1MjoaeKGZ0JHLAVjEXYFrm8qa8JQmP4alLRkWEpYVh0m0bG3koEtXNkLNfOxEUHRIDW0wpHM6su6lNDZt39+8tANbF2mkOkEClSngcoRLfUZzuDmdqDZqMDgBVUgC0ncNxDOAkbM4pnAlj2RS6xNCwsbXFiHw2S+nrtjWaunpBLL8olw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YCXJ4jmdJYz2mQXaDpLWkqGmLLA4Vr4Tokyrkoyp2nE=;
 b=laYnSbs/y1WZdoRQ0DvRC5l2Fnuh2kuUFUVbukWMdmjp6gg0YV/pDA2TnUSlnlcJnFF7vxh3YxXubfoUrgRL4p4Z/vnlgvtH6B+FUk+A+HEYXuIWlt+LtPCiRPCbhA9tz4A8X/arzaQQOd9gLnf69PicXtY2xbFR2bNS/LJKFb3vTxomNtP1gx7HGzauNRwGZ32O+HZxQ/d2NzAVndzX27An9RtyBa2OH7Za85jiaEX6mImLymuk9Bssav4C3BtAdmGCW23sN5VcMgDDGaxC32dpWRDJ/xFQG36Qp5qk+sj6OgV+IcQpchPCvNtd4Al8z3lUGoRFKIcQg9P6lk4x2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by PAXPR04MB8302.eurprd04.prod.outlook.com (2603:10a6:102:1ca::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.15; Sun, 15 Feb
 2026 14:18:26 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%4]) with mapi id 15.20.9587.017; Sun, 15 Feb 2026
 14:18:26 +0000
Message-ID: <0c759f9d-409a-47ad-ab37-0005f3ced257@nxp.com>
Date: Sun, 15 Feb 2026 16:18:19 +0200
User-Agent: Mozilla Thunderbird
From: Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: Re: [PATCH v2 02/14] media: v4l2-subdev: Allow accessing routes with
 STREAMS client capability
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
 <20260211090920.1851141-3-sakari.ailus@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20260211090920.1851141-3-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0036.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::29) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|PAXPR04MB8302:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ff9d2c3-783d-41f5-59a3-08de6c9d156c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MFlxZzk0QjY1VHhTT3kzUllDbENublV3UUJ6OG1aeTB6bGdsNDFOaC9NaTdv?=
 =?utf-8?B?c0hlaWhRd0EwNFZqUDV4a1Q3UHdWSE9CZTYzZnhqZzluODZqQXYwRm12T1dn?=
 =?utf-8?B?M0lWekRDaGk1VEZsV0xXWWZ1SnA0ZUVaMG5UZ0k5Zko1VlpPQktYN0JKTml0?=
 =?utf-8?B?cjk4WGNKZnRZdmRXUklXd0NGd1RwakJlZkxKTHNMSzl6MndUWE5tN1RGcnZY?=
 =?utf-8?B?QSt4OGJwQy80dmNvbWhZempGUC9aSWxPZE5Gci9MSHRxbW0xWmN3elVhNGJl?=
 =?utf-8?B?LzVIcW5kZXpnbDdSU1M2RE5jMEVLTXYrUzBSZ3ZJSGxGSzZld3p3aDRMWkZn?=
 =?utf-8?B?TDB6U3dJalI1WWVRaDd3RHBuazA1bEtmZlEzb2hmamFvRWlBTzhGZEdRMGxB?=
 =?utf-8?B?eHNSaTEwQWNhTWFUNnFOVmh0cUVSaWt3c2VZcnhibnlMOXZOWkJ6ZEZvaktw?=
 =?utf-8?B?YnEyMUN5QU9peFRPbGRjbnlPK3U5dWxSSXBKcVpUYmF4Z3FDUmFEREZMRDRP?=
 =?utf-8?B?WmRQeWZNczduNFNCeUtGbktPQmJLMlVRNjBYZ2lyenNOZ2dNdy9CL0tPenI1?=
 =?utf-8?B?VjNLd0JnTjdqSEwvRWw5Q2daVEdzdEtIeHVHNWQ1TkhIbFpiRHlRb3RQRUQ2?=
 =?utf-8?B?R00zcjVGRlpLZnI2enFKb005SkFsYStnMDFQVWh3WGlwZWFaUno4Q0I2d2dz?=
 =?utf-8?B?S1NwTGV3MDVjUjFOTkdleTdHM2g1aWduMzJodk5CVkttSGVQb3BveTJTUzJy?=
 =?utf-8?B?dzRaS0RuMmlubGwySjBEYUNuSzV2NlgrSmRaaHRrRnlOcm5OMy9welNqVHFF?=
 =?utf-8?B?VnplUEd1WnN6dTkyYTR3am1xNTZVYXFZaEFGSEFabzFUd3pvNlRrTzhGbEVs?=
 =?utf-8?B?Vk1SeGJhcXZTV0hEdUcvVTBHaFl6YWh3dWZYNUVQeURBNzEyVHhqOUVuSjYr?=
 =?utf-8?B?NjVHd0dXZXJYM2FSNzlDMmV6WlhodVRXWVpYTjNYa0lKQU1XM2VGNmQ3azBI?=
 =?utf-8?B?OWVXbkJJS2xsY1V2cjV3VVM4ZnpUeUJPNHQvYTkzYWNFUU5MM2RGQ3FpREpk?=
 =?utf-8?B?WTV2bTdheDkwbURKZk1WMTdZQm1rR25VUlBCVTdreTk4UzBVaFlqRHFaZ1ZG?=
 =?utf-8?B?S3cxMnlzZDQ2RExOcHJnaG44eDFvQkNOMTkwRDRsZGFhT1lLWml2cmY2Q3hh?=
 =?utf-8?B?MnV4MU9HUnIvOTBKbEdCMlpEYjlFcFRFdXlQRkpsZHVPUkRVR3Y0bUlxMmhB?=
 =?utf-8?B?Q3hqWCthaStXRENLNldzelV1clI3R0tvS1lyZHRmWkMwQXNOcnBZQ0FwK3Js?=
 =?utf-8?B?NU1oRU9vb1R2N0ZaZ2M4SzdzMDlXN2gzTjVxVUJFbTgzbDdaWUdEck9TS2JD?=
 =?utf-8?B?WFZ0dGNQK3pKR1ErWTRWeU54UWdNN01EY2ZLNk13UFlkaCtOS0xFYlRhRllx?=
 =?utf-8?B?NzcrVkFQTzRoT0hxTUUzWmM1UFhDcTF3RVM2QkczWVZpT0g2VHlrdTNib3Mw?=
 =?utf-8?B?Zm5BR2lmelV0Q0JDdnVKaUFweTZJYkExY2grSEQzMWV3NEhITWJ1djJObk5F?=
 =?utf-8?B?VmVkZEYrcHlSbHF0ZTlEdXQrZFEvemFjd2k3NFcvZ3hpWG9rWklqT0tVNGFO?=
 =?utf-8?B?UlQwYnJmemFEVlVqNzZ2bDA2MHgzdC9GWmVYTnVGTWpsTXlmNHVoUmd0c0sz?=
 =?utf-8?B?MER2RzJHc1J6RmpNd2JEMW44anJhcDNURERmWE1KMHVwOTlhckRXK2F0a2lm?=
 =?utf-8?B?ZnUyN1lhMFhGZmZQR3UvZ2NWZnhmWlNsbEtLL3o2L2pKYkRlV3lGZktiRkg4?=
 =?utf-8?B?WFRCOHdzYncrR05LVG90SzFVKzZQODNIZTIwRVA0aVpVUmdGcnFYL1FXdlRJ?=
 =?utf-8?B?a25xQ1Bid1lJd0R0eW9zOTUvUkhtejRBQUgyczNRNTRkM3FMR0t0SHhjMGJF?=
 =?utf-8?B?SFF5UEN0R0VnR2xzV2NoTzFacWprRW1MQm01cHRxa3ZCMGo2VE1RQWdxMmdW?=
 =?utf-8?B?VmUzeVBlNW41eXZDbDFsMGFyN0xSakdSUHd0TVlISEpibCszbk8ycnlNeW1j?=
 =?utf-8?B?cG51MEFEQVhQUlE5RjBEUGIwb25GdnNrMlF4UFZtWlJ2Y28yZmZXM2YwK0l4?=
 =?utf-8?B?U3JaY3kwNmxvdW9LejZXc1Fqc2lnMUVybnVBTk10L1BldXFUdityK2tzWWJP?=
 =?utf-8?Q?XEszr7dQZmBS9hCIo6bIgT8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Rjd0a0RHcXVXOFdhK29uM2Q2cnlOTlJEN0F1RS9Wd1k0MU1YOVFud3VMa0da?=
 =?utf-8?B?Yk5HbG90NE1YRklVR0g5MHF0eWZ5RjB3TUkzQ0s3MlNJMVRZanUzWmdXMVIz?=
 =?utf-8?B?dzFlY0QzOHZrZEhuYm43N2d3QWF2Y29BTVZPTFlXa1pGVSs5enV5VEZQekFZ?=
 =?utf-8?B?MlJVYmVqcFZnVWI5alpMSEE1THR3d1ZsSTl1V2s4MHRCZnpieUVrTnZvaU82?=
 =?utf-8?B?cURTVGRHZEZnRlBmSVhaWVVVVURvdUZlc0hBS2lxMW1YekUzZ1dmNG5jZFRB?=
 =?utf-8?B?dUJpdVhkREozTStXcFZKanNBZFBwS3djMndLR2FCRGhiNVZEc2FOQVlKVnNx?=
 =?utf-8?B?UUJnS3pkYXJWSk90WDZYaU0wb2xCOVJJWWdweWxaTVV4WEtMbUZmL1VCYnc5?=
 =?utf-8?B?VjhMMDljenQ0UFJZdGJlNG8zMC96UDFCNXlxWHVtUXlFcUxlLzVROVdmWXlJ?=
 =?utf-8?B?TVplSjQ4czl1TXlhTVRNdE5zVjNvZ0FMeHMrbmZMWDVzaHpMZXRyeHZUQ3J2?=
 =?utf-8?B?bnZGNVZUOFlPZ2NKMCtFdnhRbHBMQldyWStyMDJQY0pySi9OQTZzdHJlQ2oy?=
 =?utf-8?B?Mkl2aTgrQ1IvVVU5SG15WXA2OUg2TVVlblRhUDdQWnp3RldqMFdJWXFiQTlJ?=
 =?utf-8?B?Vko1THFvcTRrRGlUQWNzOERYejRXWWJPbk92cVo2STMvaXY5Y2paTnlOVDd6?=
 =?utf-8?B?Y1RSUkc2VEFWMTRtMGYxbzdJRnlWUU41ZGZiUkVzcDFwTUVPS2ZFMDZVSWZW?=
 =?utf-8?B?ZG9VRndZa1k4enp1TE96N3dTYmNOVXFYK2o2MGYvbjhvK2tJYTZITCtySUpk?=
 =?utf-8?B?dFptc2RtRHVxWnV0eDJDVUZxK1hjUmNRTVprSDl3Z1JnOCtKUHpjZFJ6YTNW?=
 =?utf-8?B?WEdzMExGTENIS0p3OER2aXFYOXB6anducEIvWGJ1eDNMUUJyeEVSc2s3dzBL?=
 =?utf-8?B?RXZPRnB4b0NlL3k3ZWpxN3lqZXFLWGtZcklsV2pWdktSRjQ5N2phc01OK2ow?=
 =?utf-8?B?YUtmYVBDUzhrWGdwVlN2L1pHSllMbVF0VWJBK1YzQXpFaGQrdGVXcjF0Ty9E?=
 =?utf-8?B?bEpZZzByaDdaK25zMTN3VHBOaVQzd0NmbjhPa3A0aDY5YzhYV2djRHEvdjlj?=
 =?utf-8?B?elFjOUNpMi9FTWI2VjRDWWpXa2tGMHAySDVpZE9Qc3ord21NekRvMGtWS1pT?=
 =?utf-8?B?OGlOMGhUQzhnblJRVGg1Nk5QMlFVTWNhTTJORFhwcEMwMEpUOFJxSkFyMGds?=
 =?utf-8?B?aEZaMXBrT0JlQnlCTGxtRUFLM21URTJYYnYwdUJvdVQzbDZ6TnFsdUo1T2d3?=
 =?utf-8?B?c0NVZDduaTdzVlBaNis1cWJST2ZIUEl0ZWw4QmNvTDFhR2J3Sy9Wa0Y4UU4x?=
 =?utf-8?B?SnMwbXh5WW94ZXN1Y0pKczV2Z3VmWDJ0RGg1dXVYR2pwd1Q5cTF4ZkNYMHoz?=
 =?utf-8?B?L1VIN1pvWFdGaFVBNDREMW9DR0RJenAxSkd2ZmRoZDhUV3FzTkxmVEtWNmJh?=
 =?utf-8?B?cGtOc3pGeDZodkc1bVJUVnZ1V3BkOUYvbXRzTHZSUzlWYXoyc2tYT2Z4T244?=
 =?utf-8?B?WnVFM1MwMWljZk1XaXJmeGF4dmhwRDRoUkRzQjAyMlJUdHNvczhFTUhaYi9x?=
 =?utf-8?B?bG9ObGlVMDV6TlJwcmR0cUFyS1pQT1RuUEJETVNORm5CTk1pdmp3bVoyYkpm?=
 =?utf-8?B?bXEwUHBUYnIwUWhtQVE0MGZrVEJjbE9mcC9XTHhSZ3p6cG1sNWFRUUNRcDQ5?=
 =?utf-8?B?RjMyWWdrZnpFVERDdmhLazRkMW0yNjdNbWFyajhyWUN6YjhPRkxuVVViSWF2?=
 =?utf-8?B?YXI5ZFQxVTRkblljTFRmK0NkWndOL3NwNnBuWEVmSkZvTEVvSk5WSnNPYW1W?=
 =?utf-8?B?V3hmd2VqM0F4aHh6akJUL0ZPZFFzRW5RQXJsRWVOS2IzM09pZWM4SUM1RFRo?=
 =?utf-8?B?dzhQWUI2ZHVhdUJXT0wvSDk2WE10RlpNSllmb3VDWHRkUmthbExQMmlrZDBN?=
 =?utf-8?B?OEdHSk0wdlRlcForUFJ4ZzdJcUtITG9sN24rZzZ2ZmZTQm5qZUsvV2dWM09V?=
 =?utf-8?B?K2FxZ29MTndNNWVaYlM4S0IvSGdCZExFNWVTOVJ1cHc5L3NFNUcyOVRIazd2?=
 =?utf-8?B?ZEkxcUkrMXlzakw0OFJ4MmNyenAxU3lyUnJpMzV2KzF3UVlZS1hTbVhYUHRO?=
 =?utf-8?B?dmE1bFRlY0l1S0FET1h4WjBMMEpOUEJYbWoyVktVVzVPbklxZXo3ZXdSblhw?=
 =?utf-8?B?bFE5UWJScWJYRjIrbDR0VXF5cjAyZU1FS09wSW5MeDc5OW1xTUxhN3VFbnF3?=
 =?utf-8?B?S3ZUcVZLRjFIZkRTclg3bFlueWk1V3RDNUx4cS9oNEZaT0pNbkVVdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ff9d2c3-783d-41f5-59a3-08de6c9d156c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2026 14:18:26.0926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnIcuKz9RGq9efaXgTIgJzESxP/G+Ipo7y9rtcqHOgWuQ8LaC9fJn+aHBAC1XzwSWGfVjwPXDzOI6V2OaTJj8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8302
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
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52822-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mirela.rabulea@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9D54513ED68
X-Rspamd-Action: no action

Hi Sakari,

On 2/11/26 11:09, Sakari Ailus wrote:
> Disable access to routes when the STREAMS client capability bit isn't set.
> Routes aren't relevant otherwise anyway.
>
> Signed-off-by: Sakari Ailus<sakari.ailus@linux.intel.com>
Reviewed-by <mirela.rabulea@nxp.com>
> ---
>   drivers/media/v4l2-core/v4l2-subdev.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 66842b975f91..b2105c34478e 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -1008,6 +1008,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>                  if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
>                          return -ENOIOCTLCMD;
>
> +               if (!client_supports_streams)
> +                       return -EINVAL;
> +
>                  memset(routing->reserved, 0, sizeof(routing->reserved));
>
>                  krouting = &state->routing;
> @@ -1035,6 +1038,9 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>                  if (!(sd->flags & V4L2_SUBDEV_FL_STREAMS))
>                          return -ENOIOCTLCMD;
>
> +               if (!client_supports_streams)
> +                       return -EINVAL;
> +
>                  if (routing->which != V4L2_SUBDEV_FORMAT_TRY && ro_subdev)
>                          return -EPERM;
>
> --
> 2.47.3
>

