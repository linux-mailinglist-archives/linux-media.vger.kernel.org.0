Return-Path: <linux-media+bounces-52859-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNd4B8frkmlSzwEAu9opvQ
	(envelope-from <linux-media+bounces-52859-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 11:04:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 901BD142356
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 11:04:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 37E81300FEC1
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 10:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B852E62DC;
	Mon, 16 Feb 2026 10:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Y3ZbeMc9"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DD626FD93
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 10:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771236288; cv=fail; b=U/eJBz0fdeNPIMawvyT86KrStmhOUV8US5KtFG2b1yhZvMavlBLTdkqdNSVpYZXAmbTCGkqoiloHBuocSE/0eTd7NahJVr7yz67kGSoaqAk9P1rZ0x1wZ5MBa3PJ8LQSqqgL4qaNAxh/h+c3hxasvwVNgqRepS35yKI0B/oziCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771236288; c=relaxed/simple;
	bh=0eDQWey7IsN7xC+WzPFohLMTVj234ezTq48nq7b+rxs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WExVh0Q01VHYUpqR1Kh0Ne71MCoU+uRblcHFLcQe5c7TgHBLwKg7ZyuaKYjTxlKVOc2gytYOCW7P9GwvzJt9YfKId96SkUnxpwKYxMGW9e9pJt9IPO1OWqe3u9SPJBdv8eTpSLnw/rHBR6c2wH6qvQmlLdGDlzjce+lHI40Eluk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Y3ZbeMc9; arc=fail smtp.client-ip=52.101.66.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5a6yUEnQ1KHEj/yuIxTpI4p+CrI/O5sWIotW6/tBDNM6svqzeCIwwrmeL5+8nxmo8/xZa72MqnJiuDDjsY/wFm8yWzWgIRotg/JkI9JjMWDgAcueb1Bssh583u+R7zItdax2xUlRZIXsQzj5RecFZHkXFkDDn3owiBkY50ij6BGEprPIaA3uNpWTGBT4qtIdUf4l+TErFM0G00Cv5+11MMwCOJ8gpB1fZp9ay9M9cK8hSI4SLyw27owU6eNadOB5ewJYDTyM79qiqSpAUsBZNX+4genD7YJbZyoOSFJ3tvFcFZMzCbkzM36ELz16afb4NUjh7G32OXiioetYxDXYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0eDQWey7IsN7xC+WzPFohLMTVj234ezTq48nq7b+rxs=;
 b=kcniGT/qcrcbU3rZprL2WNFCzfLlzGSbbbFLM/j9lQajAfkVjtGNUE4sl7XIssQ3laMo9Lzz0ooHXSPoShP3ttqvGhGYhpN1IwwUJflgLW+v8a+L+V1TR8U5ddy1+zZhjrYKa6ItqkGEdGHzK2UASbR709xHKjk2ULJkdJs6pwXpSw8CGFrI0O7AiTYK7puRqtVpZzZ3geBAYD3TTwMQffiqUF8+qqqRBYbbnHy1Up/ofjM4kR34mMTUD2TdF06cDnyhPsjfDvF5s5ms8xSTwfqgyQAXU/NoHztf6UZW73/R1O/s/IPXCThlrTZd+vNT1nM9fA2JNehijkSahBCqhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0eDQWey7IsN7xC+WzPFohLMTVj234ezTq48nq7b+rxs=;
 b=Y3ZbeMc9NGmS5PT5ndjSJBGPCG1gxv7nV+BpmpaufLNieF5qcE6diC9/TxVXicdzAPBA4rexWmTTaGeu2gV6XCyi6l9xc6AI4sL8Yp46Vh+jb5A8d9clhcWbcy8O6apbjjesyVXIoArfy8VgMZRPi6B0WjBhZx2iC3Jh7ViF5CdgefYphJnG9EDUneO/y3nL0OmWdxG5zxDr508uPddMjVJmAaChxDArzCT4+mC3Fwkjo8yTQBy9qKHDeWE9lSzLSWfBU6O7AQappZqzibELbLW9Oa7G1V9k1sxZsdlxoIJQBRBcebnxpOQycLwWuBljxr3pURw4dMfSxF1hK8lpHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AM9PR04MB8763.eurprd04.prod.outlook.com (2603:10a6:20b:40a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Mon, 16 Feb
 2026 10:04:43 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%4]) with mapi id 15.20.9587.017; Mon, 16 Feb 2026
 10:04:43 +0000
Message-ID: <79c625a2-9080-4762-aee7-a436e4e2836b@nxp.com>
Date: Mon, 16 Feb 2026 12:09:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [PATCH v2 05/14] media: v4l2-subdev: Refactor returning
 routes
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl,
 laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>,
 Kate Hsuan <hpa@redhat.com>, Alexander Shiyan
 <eagle.alexander923@gmail.com>,
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
 <20260211090920.1851141-6-sakari.ailus@linux.intel.com>
 <81e543df-a188-4c2b-a24a-b599b27b3954@nxp.com>
 <aZLdO8k_qDd_3J5a@kekkonen.localdomain>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <aZLdO8k_qDd_3J5a@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0039.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::12) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AM9PR04MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: ff27fffa-377c-43e0-11e3-08de6d42ce4c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MmdCWTRmbVYxZkNza3ZMK2dUcnBpam1ydmxjd0NMYjY5dnJTTXRRRXMrS1A0?=
 =?utf-8?B?Z1ZDdTRUdncrME90eGR6di9iMGY3Tnc5SjFBNWlDWDVNSVkrY25xcDVrN0w4?=
 =?utf-8?B?VFFVSFVlYmJXaG8yRW8rV2tRZU5EUXlxRnEyUDd1TTN2QnNiNHYwMkw3SnNh?=
 =?utf-8?B?eFFaZE85VkJBZGJad0w4UCtWeTBrak9xSTBBL1VsMTJERDN3L3BKMCthY3ps?=
 =?utf-8?B?dGNxMlBDME5wNWlZNDVZMmRyVGR5eVBVQzhoYTZFbUZXYUdHRlRSbWVEYlA3?=
 =?utf-8?B?YkxYYXc4aGxINk00K1dLMTk3QTNsOUFKdXZnR1EyblBDN1daT1F4SkJrcjQ2?=
 =?utf-8?B?YWVwKzVubXhiK3V2T21tRTJjN3dadFJlYXJ2SGRVVTVOd1JmZkFjME5LN29t?=
 =?utf-8?B?NUREY28wYUhIckFjNFNHMzBUNW15c2RPTjRTU1JzWWRSYUJOVkNab3JrWVFj?=
 =?utf-8?B?U1BzRU4ySWVjT2NkRS9DblJmRzlUSVY5SzNuNkVlVDJQSE9mUzNRejBpaUtH?=
 =?utf-8?B?bnFxVkdaTmtYTmg1WGxWOUdnb05xOFY3UW5pOXdnM01oZ2hGd0VrMDNvNkVX?=
 =?utf-8?B?WENrWG1ja2JMa25wVWNOSkxKT3RaclFQZWV5Q3VKRHhIWUtvVWZKMnVoWG1a?=
 =?utf-8?B?V04vMlZTSmNRZS9LREtkb3FQSWpyS3JnYlZkTXB3dW8vekRacmJHRFBlYTRu?=
 =?utf-8?B?cXdSOG83UTJEQ2Z2azdBaXRCV091VWFSc00zWC9OcEEzaEpOTzhPam9jbEJn?=
 =?utf-8?B?Z3M0dDB3UjZLTGowamhyMWJkOVEwbi9HaFVBZWJ3UUx2MlJteDdmcGdMZkg0?=
 =?utf-8?B?ZE1RL0xjaHRVMDZXYlUxamp1RkNYRHk2S01vSFFMbXVmMWprNlBDcksrWjZZ?=
 =?utf-8?B?TWR0VXl3M3o2ZGlhcjVaMUhsU21sYkEzUlFjMmZxZnV4UnZIY01UTjB5NWNU?=
 =?utf-8?B?RTZvSW04cDluSmNrb2VFaGFYMERXZEQ0VVB2WmpWK0FHUVRCd21rajNwWml0?=
 =?utf-8?B?aHJjVzZaaStrMy9sU3FrWEJMT0Y3aWV1bnFzOHpJRVlLWTlzREFNclV4SVNL?=
 =?utf-8?B?UHZrN1Flem8rVGtWNTNFWG51UnBZSUhobjZLUkY4TmkzWjNFOHhYRGFqSVpF?=
 =?utf-8?B?RmZ0c1J2L0hiQ3Z3aDNmQVB4R01aZnhlbHg3d3lxZU9tL3ZXU2FvMDBWbUdY?=
 =?utf-8?B?ZDMxOTVFdEdFcmRDcUxNaTk3dk1TdW1QR3hiSkRibFkwVkxYdjJ6UTlrTmNh?=
 =?utf-8?B?cGtmWCt4SWFiWEJmVjR2RERqd3NPMTFMOXNNa2xJQmNSbW0weFJFZ3hDMVJv?=
 =?utf-8?B?RlYvQ01mU09kTlBaWVpHMVNQOHFpNUwwSkhYaUJCZzIxeGxoaHVpLzJJNURP?=
 =?utf-8?B?ZU9qaVpiOGFvSXNBUkZSVHV3eXRUL0EyT0tIWStsMEpSY1ZvbnFjWVFjREZ3?=
 =?utf-8?B?cWVOb1N6TmJ2cHU2UkNRRHEvRlBMdTRkMFE1QVdDVGFRRXBtQXVlbFB4bzdO?=
 =?utf-8?B?YjR3V1VqdVRxNUpyakFNRHNaYnpDaVhLemprejlUQ204bjRybU5jWFB2L21i?=
 =?utf-8?B?UnZydWRFT3VoRUNsTXF3YmxtYUo0bzl2WVZzWlkrN2lmMkJZNWhhbmg2ejkw?=
 =?utf-8?B?VDdGR0xKOUdvWGtGWGRkaG5aK2xaaEFXREE3dThaMHZHTjIyempQSEpZUkxx?=
 =?utf-8?B?d3ZiSmlseWRqQkxLZnRHNUZWTGw2TzhseVc5MEpVanRVbFV0cldqaFRPTVY2?=
 =?utf-8?B?WU1nN2tGazZ1N0xHRS9VVmdGOFFteEZGNGNyZlhxN2ZHSURzdlljVU5BK0dT?=
 =?utf-8?B?MFhGeGpUdXNmRTRQTDNzZDZyN1pSWXFLemluZ2FIQzM0SmpDOFQ2NitqSlBR?=
 =?utf-8?B?YlJsQ29POUFTdUdjT1BqZURneWtNUjM5VlZnNEErN2ZhdENhZlVHK2ZLODJi?=
 =?utf-8?B?RXZYM3lvSmRBcjk1L3dlblpuWG1HKzVvaU1PN0hkZ205YXUxakpGYUZkdW1G?=
 =?utf-8?B?aEFkL0E0bThPeE1QWTl1YzZNNjBsNTh5YzZId3E5aEVRQ2xYYjFKVzJScHU5?=
 =?utf-8?B?T1RQeFcxbU1LcWowRzVwYkIxTDNaSU1wMVJpK1FKRVhuazE5YU01a2xpOWgw?=
 =?utf-8?B?dExLbkhCNzBsZXczNnNHRGI0RzJjZGhhbjhvMnlNRGw5VnkzbHlKaTJiV0Nh?=
 =?utf-8?Q?9zbhmNvPmnos0HtzQUQ4fSM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QXRub0tjR2piMDdnajZjdlVkS0dPeWNXUkNpYS9Bd203eERaeEJZV3dOcDlS?=
 =?utf-8?B?eVZEbitsOGtqekg3UUdHbitqT1RhWkUvTHZka1Myd2kxdFlFZDA0U1ViOWVY?=
 =?utf-8?B?S1IxV0t3OU5hbFhNNEpqL25IZUZOT3d6MUxsdHNSSUlMb21QSUZxN3VVc1pV?=
 =?utf-8?B?cVZyOU9tMzg1dWR0K0NMcVNLd1laeENJQkErZklJTG56c2lUNW0yUU5GUTlK?=
 =?utf-8?B?dnQwTEFUZXR2TVhJY2pnU0F5ZUN1Q0E3T2pHUG9qd3lTdjdDYWVxaWhuSlhH?=
 =?utf-8?B?MFI2MTRvZjhWanBPd0N4UUdOT0h5OVRhbUJMdTRwejZxTXNCZUo3SEdrRURF?=
 =?utf-8?B?UDFtSmViVWFkbFZGSGMrcTJGMU4xbFYya2JqVXJGZHVaMVNSeHFpODZRMHFs?=
 =?utf-8?B?eFMxK3ZVRm9RZ2V3bVZwSjcvTWhXWm1XbDJqaHdVaE1TS2h5TFVyMjNMVXRj?=
 =?utf-8?B?bjVQaXdvMmY2K2hEMm1MZVdraDBhTFVENmdwaUNLak5iM1MydW5NaVVEM1lP?=
 =?utf-8?B?bXdEejQvQVM4b25icTdOdURIY1gzRlpBd0FKWk8vZDRMWTgrTXFtM2FRUU1H?=
 =?utf-8?B?UU1OdXFkVkw3VkdSbXF3ZGZZRTRtajJEa25jOG9FMElZRWtZcVVna0ZuYVNB?=
 =?utf-8?B?Ui91aE5ITUpBdEYwUHNwSFJRdkNBTVhKUnpnL0RHa1J5VzBEY3B0YnMrSU0r?=
 =?utf-8?B?bHNGdWxnckp6OVhRMXk5UXdNZHdrbisvTTBHR2x0QmZTY1JmUmYzenQvTUxB?=
 =?utf-8?B?UnEzcXA2cER3WWdFdG5wRGFLZFAxNHpTUGFtSlNLaEtUMGs3V0RzS291U3ll?=
 =?utf-8?B?bzZnYXRrNkxNck10VXZKK2kzSjVTS3BPODV4SERUM1B1VzVxRXBwWk1SOThY?=
 =?utf-8?B?NU1zUGFjaTRjdTlvbk4wSXJ1eTdGcU1waW13VGJWZ3E5N1BpOFN2NnQwd0tU?=
 =?utf-8?B?UEFzMVRDQ3kwbEoyY2RDQ2w3S0FsR0F3akt6Yis0eHJEaDZaVUtKVXg0eExm?=
 =?utf-8?B?d0w4UWc5Rm93K3BhWGVZa3kwRWVqaHkwaG54S1lKek81QStzcWdLVkZLZEJ3?=
 =?utf-8?B?MHZLcHNiR2dsdFk5V2NsSWNMcTQ2ZU4vR2R2NGJBNkw0Qi9Qa2haenRBbEJH?=
 =?utf-8?B?VkN3WnM3Z2tTbStNRkhML2tMSU9IRWZVVksvWnNhU1M0RFIyK1dkSW43VHlw?=
 =?utf-8?B?Ly8yOUowMEYwRnFBRTZsUkxnaEt0WkZhWEJubTB3VHlqQWdhVzZiTXdZdDJX?=
 =?utf-8?B?WWpnMGRKalErR0o4ZGZzK2tCV1psVUR5NC9jeExndnRFL1MyMlJZYUdpTXU3?=
 =?utf-8?B?aVhxNnMrd2Z5enVsS3FDeHRQODlWMjRBbEY3V1pjMklmNEt5alJzMVVnaDJV?=
 =?utf-8?B?eWVHalpRT1lMNmxMQ2dPSGVoVGV1THhhQ21SMGNyMERZbDI0MERYbzZGaTV5?=
 =?utf-8?B?U21lSkVNRWFUclZMVUNyNEZGMHV5ZzY4VTFuRSthZjhoZUZUNjcxMHVRU1BQ?=
 =?utf-8?B?Mk84dGc3Vi9HRUhyZXdLc3E5andBSUZCZE02YlJHZ2k3QllDOGZFcWZTSzBh?=
 =?utf-8?B?aUkwWUxIU1RkNTRUVDNCWWxmUlpzbzdBSER1S2hCNEs2OG5kZytORzJwZ3hI?=
 =?utf-8?B?ZStPWkJ0NmZIeWhzS2dMY1dVZnJLNnVhbGlwS0YyMGVGN2tlZEZjbGNTWVVQ?=
 =?utf-8?B?VWl2UWs1YlcvWHJyMzlWMmYweFIxZktjOEpnQ1NrTk0vdzNXN3BmTHdjb3BO?=
 =?utf-8?B?dDFGYThpNzV6bE40aUREMGY4TjhXNzJoTWtLUGh0WmRtdVVhU0NIaVVTSVlj?=
 =?utf-8?B?Q2c1R0kvZDBjbVgzMFlLbDY2NnVxMlpFb1d1cWQ0aXIxQ3pucERQWVQ4NHJ0?=
 =?utf-8?B?bjNoVVp4ZEl6QkJseG43NW53OXJRbnpIM3A3dFBENW5sQkN1WVpJb09hQ3Nv?=
 =?utf-8?B?QnZsNHVvRmpSTlpOMXBXd05HSWlUN2FWOFFhZ01pYlNaVmNiUDdiQ05TcWdq?=
 =?utf-8?B?MzlQZ0taTGxDQ0xVSVIwOXlGSlJiN1hFQTdaRlBrLzhPRklUajAya0xETHZa?=
 =?utf-8?B?KzVpaFBTdEE3bm41NHlOT0d3a1lsVjZ1T0ZKdWllQlhNWHJwQ2tlU0xuWVpS?=
 =?utf-8?B?MjErdnpsL2RQOHJNSE44L3ozcXNNNURSTmtDKzh4SjE5RzFGKzRCSUxXMG12?=
 =?utf-8?B?TVNteGRyUHAwaDhiKzQxZnkwUnN4NG5PUGJkZjJmNlVkR0k3S2FRN3M1Rkpk?=
 =?utf-8?B?emlRdVh2MVZvazNrMkIxUEdFalA4MzlodDVZVzVIekQ5RE9SRjkxODc2YWVu?=
 =?utf-8?B?NHN2V1Npd25NNXRQMXg1YzBBSVdXYlR2eWNEWnBXQTAzR3FEd1JmUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff27fffa-377c-43e0-11e3-08de6d42ce4c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 10:04:43.2536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kql3UyS274tSY3JEJuDNl+BiLM2S5poJWLIAg/qSPK3oD4w6bqkMSlf6Keun4m96c9lXgrGUdXFPidF55ab3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8763
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52859-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,raspberrypi.com,foss.st.com,wanadoo.fr,collabora.com,intel.com,apitzsch.eu,linux.intel.com,kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mirela.rabulea@nxp.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim]
X-Rspamd-Queue-Id: 901BD142356
X-Rspamd-Action: no action

Hi Sakari,

On 2/16/26 11:02, Sakari Ailus wrote:
>> The function just copies routes, no fixing, so I agree with Jacopo's
>> comment, subdev_copy_routes seems like a better name.
>>
>> Clear names for src/dest sound better, and also address the case when
>> copy_routes>num_routes, at the calling place it was
>> min(state->routing.num_routes, routing->len_routes).
> I agree. I'll also change the arguments to just include the routing struct
> and the state -- all the callers already use these. How about calling it
> copy_routes_state_to_routing()?

Ok.

Regards,

Mirela

>
> --
> Regards,
>
> Sakari Ailus

