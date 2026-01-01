Return-Path: <linux-media+bounces-49821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E56CECF34
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 11:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F17B3006F79
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 10:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6005E29A30E;
	Thu,  1 Jan 2026 10:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="NxHnVG2j"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3B17260F;
	Thu,  1 Jan 2026 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767263476; cv=fail; b=jytvgOXoz1K3HzaZGmTgWR82OdYqQCHnrV2rYvbssJkAOzeayCkoTRvRDwB2Ip7F0FghVQDqlmwHoVQsh4wO8b1UclsLvAenEqFeCmN/+gcSNK6E2n8m+VKcBMlSdGkFyJ8DywqjfW21H2SEUyC7yY8dH24VxczSkYKz7IcWLbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767263476; c=relaxed/simple;
	bh=n68zORH5I/Oz7qzo0QygXqv0B5RnnPCBQiukfj30Frw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GNcto+PYCPjtv0zQk1C28XOdakpl9edhvPdIysfjASyaMw47OXQvi7MtRaqHXSua8zRmvNaAQaYsaLdr4RfA7wLsuip+RTasaCwZQPVvESw6M+WJB3jMEPyxiUBdGzUftTCjngQJ/20nazRLbwi+1wq81hgHwZA/uYkyI0QUEsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=NxHnVG2j; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601AS0tx1045881;
	Thu, 1 Jan 2026 10:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=PVEvl+3IU
	G30V3E8roZrCdC2yejsseMm7aqSRHmapqY=; b=NxHnVG2jayJ7nEpj+fosjFOcn
	4OtjCTOpeIFfDOmFXfWO9QPcoOzW2gpZWY1h2+S3smwjiKsX+S8qM3RtHZijYY+6
	O9QUCJvxesAVk24zTp4/lz2vHpLcS4WrGLt3IyZoX9/SRSmea1uN4Wlp7JGZCLqa
	fp/VqTsKX66ro+2iGm5wThCfpY/94MnsX9qWVoeNWKb8STrBrq81U34a/GHNuaC9
	2xrXMRJYSCu1k+OAMM4eAc6VTafGBChgzFLVW7yESyyz4kDI9VrgNPZ8puqUVFDN
	DVjxXPVFc6XhD4+YA8wze2ADc43rtEsu9s6cGNEcbNKABOqiIcVgjnXdOGZ8A==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010060.outbound.protection.outlook.com [52.101.56.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4vfqn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Jan 2026 10:30:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAhfd6KBn7TtT7z07Ewutcbv7Wxe1YE3RVj+IxIX3WnqbIsaSun+ISlGE8fP0rxFH3FYof3w1U7DU1HZz50fESgJqVVuE/LAl1VP+35rlkZ5V9LOSGbW4hKCOdmqMGYruc3i5OoycGoOABBMKyAppeySy+rfCFmoQBa536FNR4rgPldZy4Yis/ZYliPzuZiqyOzkEE57tVrYfINKhpeRkP/x/6wGUHSyYIzEMjFl6IY+zXytsbKAKJA45SQuzmZR56Bwi3rWOYYRldKhyGocXZaPmqLZ5/nPyF522V3GsVi7AaEf+1Bh6t9pY+Y72gv8JSo2tgPHNsKZKduEfi+4ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVEvl+3IUG30V3E8roZrCdC2yejsseMm7aqSRHmapqY=;
 b=SAJanJod0lC86M+NZ0hkcMBMAYXbB96Miu4l1X3AnOT4ebh3+IW1JuGSJ/N4Ximgg2s3J742ovDy188scK6pUE635Z0/fH/gc3JIy7dRurmMiJStY4FpGPInIGnxzjv2vJXdY1ibZ2n6jqBr/JrPL0XVfBfqGooeDh6zpxwOxrAEFZS4WRNR61pZZqqLOOZVQ85xpricLfC//dM35JVHZoQc2vnmJTH045E7zZxGMLltWbQxCjeiP2I5SrbRtOz+i5C07Hr3u8buvM0zfS+m8pE+6/ZlJE9Xnr22qarG3cIbY7eOSUOXwKnWKI34gNhvesgUhdi0fvqsvj3FfT3F4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by CY8PR11MB7876.namprd11.prod.outlook.com
 (2603:10b6:930:7d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 1 Jan
 2026 10:30:28 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e%6]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 10:30:28 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: tarang.raval@siliconsignals.io, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] media: i2c: ov5647: Modernize driver with CCI and new stream APIs
Date: Thu,  1 Jan 2026 18:29:58 +0800
Message-ID: <20260101103001.207194-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:4:197::14) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|CY8PR11MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: 92692a84-3a7c-44a8-111a-08de4920c88a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uMjdZnBJVoCIE2UIJKZoUYXH43yd5k6h6BvpgCV7EZIrA/E6ZkFKf3ZZ98/s?=
 =?us-ascii?Q?GygS4ckCM/yoiGxV5E9lSB0zCn9RQW9EZXkK5hzY/HAqy7AVm6TejLKhFrDh?=
 =?us-ascii?Q?sR0NCNqw/cVbpupsY8T7mgF85gCWVtutOvUKTMW4mSZgnZO16Gw8STuitfQm?=
 =?us-ascii?Q?7xF/UYLxC0Wg/aQUjcRN5+HfcLeNASQYRzoJChMzhrcHUAS8l5VY/gXA5rgz?=
 =?us-ascii?Q?svtJZ/qCgKsk4+I0qjBO+DRGLGIQC312R208brD7tP9UvUhmW5rdlwHqH8e2?=
 =?us-ascii?Q?p2ZosgM689j35b4t8JYTSNXvejNQyjifk05GG2g/wlJlAQoMcMvKr/5LnDOQ?=
 =?us-ascii?Q?mbE+XTZyhXKUrtH3k5wobGKPN0WrsdVbnvxMEA6sJe1uDbucdfyDvWrpmOT2?=
 =?us-ascii?Q?QuEB/v/Rml3cun8AtJNDileFD7n7bhwkHkOKM0PIONg6g2UYN08Me8n71hRv?=
 =?us-ascii?Q?MPPmTJSt4Scg/KgG338lCd5q78fpbLS8EJqDjU2HSNMOWYkcaZE2AVUkjtF1?=
 =?us-ascii?Q?XKmOXPCaYCLHrUUVbp38FhwtrkBf9aTEO6hDvNEVOn2F5uVzwDTM0qKTtoRt?=
 =?us-ascii?Q?3KtFyB9/Fu1UNABHRbFFzyxLh6NEh+UuMjGm52U8Hmi0nP5MpXu/VB1NKb8f?=
 =?us-ascii?Q?mltjFrRiFmEgyy2N3sensNZFCsjUQ+K4nvV4T2Y0Xqd9ykOZrViGM8J3TAnb?=
 =?us-ascii?Q?npm01PncouLmrhpMBrVVx3UDTNVALnMWuUSdXUx/vtK2tpm/dFyONomLQFzm?=
 =?us-ascii?Q?kv0ZGl929B3I2mi2TUbkOsUvcLGM4uafk83O3oLfukSPoWjd6eQGiS4pb+h/?=
 =?us-ascii?Q?18Z4w0yi5iGk0VxZIvBjgi0J+1ktVNQBnw0Yd9xtYzrvhKZokrPJApoF7MQo?=
 =?us-ascii?Q?lUP8wr8Cfh1q2GSjXXmf7aKQbDJW35xvSZqEmZJdfN+tVZv2hiFmeXg3o9dT?=
 =?us-ascii?Q?YkQ8OZw/e5Se94BoIXyNlWpwkDOIv7gPB74voEsx61fFL2Z89+FWsYf8ak84?=
 =?us-ascii?Q?TkXaiCB3Xv2fRJKUnLn+vPNApb41Zrc3n7YNoOeDUzpNrIOz/aQJ0I/Gtg4R?=
 =?us-ascii?Q?oFskcbF+3LlcJB5f4nqoHDAJgMTCfpwouBF9m/PSImXKAJnHa8dGJ7jHUpl7?=
 =?us-ascii?Q?g7/p5JpLi0kceR961oL635ywZkrGwERdMLOyMgTVv2h5JAbDBk9VeEE8YeV+?=
 =?us-ascii?Q?gY03Csvwbo9s2xF5tKFOcGBD1WyfCqSW4RcBK/wadwqyuaLw05L+DDxXfKRH?=
 =?us-ascii?Q?9AUCmioq4hSraLJGNpgQ8CkX8KgpFyY6iA2DmpgNOSyTtN1MODCj94wSK1z1?=
 =?us-ascii?Q?GP25CMJsRobseje0gLrbLyOexPtRNZsXIoWaWmEnGuV/w77VKVfVPLxUeZjR?=
 =?us-ascii?Q?fVbjAJmYbiW5WZ9/BnKiyp0rkvQdaoKy1QOHJHJK/KBho+yRabsn4FtuKGrN?=
 =?us-ascii?Q?uZPnF548HMYwZG/jPa2KVNtAUrUxz4fhztw98jq7eaQklxEG8LeMFa5+JKee?=
 =?us-ascii?Q?nZRBe0SufRmYHks8xIILcvc0HFqB1tBQAmGyHGPO68KKL5iGrw2bO1c5sw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w5WqzXKyAfANwEyi2OEBDADRGg+4XMCAuKYUgpKodbv+a/PNq2AOLn5VQeby?=
 =?us-ascii?Q?9x6DB4gTDFQYPkhU9g/E7mwGrKMj24NuqfgUoDeZP/hcgXidMQO64Qw0aIfu?=
 =?us-ascii?Q?Gmt3lhMS/qbv6zbirirc0hZ58mM07J9JrG3Anc8p+OH1oyXK0odpnkhhWWIM?=
 =?us-ascii?Q?Hs2LPQ+tfPoU87Fm7+z3HhJd6Lrd3x/alUdWoZw4dQyClnV/pYVKrCrbO0Mc?=
 =?us-ascii?Q?Sbp+5U0CAh3G+8sSI+zUXsk94NiheuW9xE7hAw27tGDOKT6Cwed+R9+tDise?=
 =?us-ascii?Q?rjucerjrPZBtIeubriwPAauRBKwCYT1Q5eQDVoeUSmyMM2Pv43ORkPh5Xo0b?=
 =?us-ascii?Q?SeD03pr8v3NoDk7rzgEJ91U3/VSdRH2XfItjI3fPm3eSh77SsYv+a3PlWPG/?=
 =?us-ascii?Q?OxJ2CWmm/4UBCMWCOJHhFCNT5s8wVZ0dIgBqJBFsdsM0Iw7iFhpPuW2wDAZs?=
 =?us-ascii?Q?uwR4KVAyYzdt6MGXd629UNhMm/vPso991sN1NVzx/bvctgyBf8EAxVuRPoZI?=
 =?us-ascii?Q?fM5R1j0vSfO1FJCPy8PeDfBmyZkF5tqjZ20FHDzo4vQySa6iSLzlO26KI43Q?=
 =?us-ascii?Q?i/frVYnvSgqwQsLGa4aShpOSvhO86DKS1RHXgZ8c7KgY/qVjNenS9hd6+gWT?=
 =?us-ascii?Q?A0Zufwz9E8AMtHuFRWarZEGf5NDa1inzjaabOII5e+RvEil3UoOCRNpMZgj8?=
 =?us-ascii?Q?dbiXo19y3P92GTX0jCZMrAXBWiXnw+zYExAPB4ViZL950/LyJiiBJIbqdDcI?=
 =?us-ascii?Q?uexLW1m2rG5iZfzfrVSESvIrQIQWVNmQsZy75UkGucvb+vQOiZpQkKzQbfGm?=
 =?us-ascii?Q?Su3lvZEUHT8gRuIhTDHi8cKwTJNPFWvsPF52PcwjS3a419+kYzUOL+SEYElH?=
 =?us-ascii?Q?Q3e/gjC4biqsG0N3kLYDS+MPk0bg3DLk0SA44MI4j1udhp2Z+0genqk1kbNz?=
 =?us-ascii?Q?bS617nMHQIfAY9Z/mNKUSFZd0coWrB9tiyUwZKqSW9tnCIEq9MYgeLgNgW33?=
 =?us-ascii?Q?f33QKxZrndHxvcf501WWpH1xCa4u0q24Vn9o0jFnivbhs24hKwgzSs+drkD3?=
 =?us-ascii?Q?M5uS8XA0uSuuqNradIZwmFDeXtpyOOg8ZPd/KtmAF7wc1WC6WNsUR8KZICKU?=
 =?us-ascii?Q?o8gla1g65sw6fIMj36pgSCtdO3VynhMw4Rs/yRvwxeQojQ8G0EEwiMrVrRxr?=
 =?us-ascii?Q?alULzVZlCPvlEQQLqj7ocYXsKQLhPSVfrVnHMJRXuryZ2lmleEadfyC1yY8w?=
 =?us-ascii?Q?r8/zoVhXXjU65Su6q+NNJoX26eWfI+hA/tltwatpTm37OwSXN81htDYFfASf?=
 =?us-ascii?Q?qfT8m9QmwwQ9kSaL1rNS4pJ4BorwPlnVFfsoky3ADRCXAxisgkOFIkZAQyxq?=
 =?us-ascii?Q?AP2aeozgby1TOxwWy3E84WQFWzJUCFv1di9nEwSKMaLVsaOl9WExpqJQg2V3?=
 =?us-ascii?Q?WvKRtbDiCqFtDvhgaMkzcQAWcu8eBulUSGfTknLO5i3XRJ926SYufbKNHt+P?=
 =?us-ascii?Q?nCDSk1AayWF5d3Dwfxn8PFcEQZ703z73e1BY//ltpQpUHYdCnBWaTt64xgzb?=
 =?us-ascii?Q?/fFwUCiYA8Tak2pkujC/Mh1Z7cQoOEwWvTkIJiu4f5UpyvyODIKN5tvytsJA?=
 =?us-ascii?Q?AzvqG3Tv8Hq7KpwfbwKG5rZjjZeeS2+gfoA7wLF9O359jTHHdaQd02owYdTv?=
 =?us-ascii?Q?U/mHy9b59kyWYEOEV9/G2jIOXx26ER0pVl1gO68E6+ku1dtTkj5dT3WzMV/5?=
 =?us-ascii?Q?/Sko1w1nRsCKZ33BtilAzNeslQiY3n0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92692a84-3a7c-44a8-111a-08de4920c88a
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 10:30:28.7484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xADLLenIdKFWajK7TL9soPGexuONq3Mu3ygGWmB5kJhYXomwwEX4lIcGF4InYBJWQjFQG30g8KHYXZkOqyLhOoydC7IhbwlUmGaHko7ZJdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7876
X-Proofpoint-ORIG-GUID: 1AVK3i7fJp_rSIuTg3vY8Gm564ww9Gic
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=69564cc7 cx=c_pps
 a=KwZW/a2w+sB+hZzDdQVeig==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=e-NImqCR5jq8QaWzZYQA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 1AVK3i7fJp_rSIuTg3vY8Gm564ww9Gic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDA5MiBTYWx0ZWRfXxQVDBA+MWrPc
 xyyH3vxpe3uNplzLbzVQn6Cjw7TLSgQaaRxSjSfNFu+Z+wFVvSbuPw5kAOHaddHy1vPJg6yyVr5
 eGWuJtawsT/jwFBIms0yNvu8PlEcEgk5SfJd5/hOUfZndTsi1e6fk9GKtAoh4xpXAnJ6O8tlzQp
 pEFPLumU7Aq4eKz8yBUOfMaF1APQ6sIvTZI9Nb++6dObT3dan3TsHotyjEyMTtLCpAyK7GMfoey
 MRBHsIR0ljMPlch7NdOmryUCBa64QJdHnxQRTDaBpanbcowbzeWV9pTf9g7vtFcipP/5/zxN83v
 QLZ9nCGiMijCYKWNXYFlpYgLX6eQoLgSwJWasQ8gvmyjCE+I8aNa5/doSnkJAtjVMAKDvbPS6/S
 i/S5BrjVqtHaRhBgHMkABKGxAf0TMGDt5nvdOB9CG4zMQ2rHxHCyhq5fHZF9qwJgTzRPg7UCk8f
 h/U2vED+gvJeVPmV2sQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601010092

This patch series modernizes the OV5647 camera sensor driver by:

1. Converting from private I2C register access functions to the common
   CCI (Camera Control Interface) register access helpers, which
   simplifies the code and provides better error handling.

2. Switching from driver-specific mutex to the sub-device state lock
   and properly implementing v4l2_subdev_init_finalize() lifecycle.

3. Converting from the legacy s_stream callback to the new
   enable_streams/disable_streams operations to align with current
   V4L2 subsystem standards.

I tested each patch on a Raspberry Pi 5 using the following commands:

rpicam-jpeg --output test.jpg
rpicam-still -o long_exposure.jpg --shutter 100000000 --gain 1 --awbgains 1,1 --immediate

Changes in V4:

 - In patch 1, have corrected the issue of variables that do not need initialization.
   I have defined a chip ID, dropped all control functions, and now set the
   chip ID directly in the set control, using `cci_update_bits()` instead of
   read + write operations.

 - In patch 2, Use dev_err_probe instead of dev_err

 - In patch 3, have corrected the issue of variables that do not need initialization.

Changes in V3:
https://patchwork.kernel.org/project/linux-media/cover/20251231083924.2657165-1-xiaolei.wang@windriver.com/

 - In patch 1, I replaced cci_multi_reg_write() with regmap_multi_reg_write() and
   fixed OV5647_REG_GAIN at 0x350a. I also replaced the original ret = PTR_ERR(sensor->regmap) with dev_err_probe().

 - In patch 2, I replaced the mutex with v4l2_subdev_lock_and_get_active_state() in s_stream().

 - In patch 3, I replaced err_rpm_put with done, and added the ov5647_stream_stop() function.

Changes in V2:
https://patchwork.kernel.org/project/linux-media/cover/20251229023018.2933405-1-xiaolei.wang@windriver.com/

 - Proper register width definitions
 - Fixed formatting and indentation
 - Error chaining implementation
 - Simplified chip detection logic
 - Clean compilation with -Werror
 - Add a new patch, switch from s_stream to enable_streams and disable_streams callbacks.

Link to V1: https://patchwork.kernel.org/project/linux-media/cover/20251226031311.2068414-1-xiaolei.wang@windriver.com/ 

Xiaolei Wang (3):
  media: i2c: ov5647: Convert to CCI register access helpers
  media: i2c: ov5647: Switch to using the sub-device state lock
  media: i2c: ov5647: switch to {enable,disable}_streams

 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov5647.c | 450 ++++++++++++-------------------------
 2 files changed, 144 insertions(+), 307 deletions(-)

-- 
2.43.0


