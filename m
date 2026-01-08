Return-Path: <linux-media+bounces-50187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AE1D01101
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 06:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 62D1830245BE
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 05:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A0D2D9EE4;
	Thu,  8 Jan 2026 05:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="ObQtw63l"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E0A2D6401;
	Thu,  8 Jan 2026 05:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767849803; cv=fail; b=vD+R96SI3J2mZcgjw2X92hOMgNdRg7SGMC2QPOQJvPpgI81dImud7eVA3cnEIxqsvdu2g1OZrmxhCJrArZ7NuYcip8NfXmuQ3KXmD/YmKj+7xcsVoVg5k+HHDIinxBG2QMoi7vQqz6Tirjn3Y8L2Erj8TbdLSNaCyj4l8v67D2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767849803; c=relaxed/simple;
	bh=ALy6qpwCsq2qbxRkD9j+ILNsfnUkTZnmxR9J+qONeTM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oD44nGR8fQPN6Qq041EWHMpWx8MtbeF0wY8baAvhZPorfkxi+FVqqtPbBL+bZqt3+tvZUld6MiUVDs+K8iwjnSXtO0BoIgmtaOk+i/+X6urPcqe2umOPjbDZnUP5KgG02YpddEVwvP4YHnwbBc8peO8oshfin7gY5utxFjgzl3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=ObQtw63l; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084euGh3495041;
	Wed, 7 Jan 2026 21:22:26 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=JzMe5QdI3
	3u7Nr5rIOxDbXM66I36I44dYp4YVZjgewQ=; b=ObQtw63lg7N8Ryu+E1u9sf3M3
	FZ63/VfYrl1mklQ+e/4azeNZ5jMzKAs/Q92ihmBDWJAbMr7Y6Ns3joPhMRRmiDP8
	xePRv+TVC+T4fK7loSPLpf5xoHCNMV6moCiWGzs5zJ9ew1n6TvtPWQqTIfnggtXN
	s87VLhOZO+43Ls+N527vsnASmEy2hlUaPB3DYIu0DpSN621RBgZk5kOSrXSJelns
	rCwsR9yTdzqEpNqpGuQxdycpXnaD6MWn6q1a3vEWPPSbyLrUfQecjI3dE1BcG0Dy
	sKCHOFZAXv9VvOS1rMev+luLzsfv1h3P5bE8PvcQ3vLfwWua8Gk6lkdG8C8ow==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010047.outbound.protection.outlook.com [52.101.201.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bf3gkcqg7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 21:22:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8fqtgD+TpzxxXP8UnYHmKtWVPycmYz0MX7QKlWTUMCrmyOlKmGOkF6RvJDJPZPjx2Wk7gI0m0CemQB4TYyLqUPUXunV7U685Iy4jUQJYnrypEdjjDgswutUkrHeCa5dPC3h39IuqcHwPFRh4i0BDSMzhFN4lSbDZWr5VZMgPLjdx0Ulo9tVWvGj2Nyr8j3AfjB6kS3XUKV7SIznryja/xGbjA++O8aJCdKy21WdMcHc434jkkD32M+c2tlFyfpUqgX4ntJIq+u3k9woGBbqWFZRceiWfTVFbDZKFWvYGfUxMFDXeMdlA2l/h/PXKzeP3eTX92Ok7Iucv1KjNB8y2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JzMe5QdI33u7Nr5rIOxDbXM66I36I44dYp4YVZjgewQ=;
 b=Sg8+YCgpoiVoKh2hYvaBYlOPugV8ymXcrvXRLzG4cKAQ5lFw9Wx11E1hRugBzm2Ns3N40m4UL5+u/wcPMbixNMyqdFoxXLCJkcTXJqRUfs14weZYj5JzVQzaLp77mtlZDviOXz8+ZurRjAiWtyaxuZRTsk4aoTuiWVpOdvgQgdImEfLcsO6AEUpvjqr0zdOecsFyPn+aeUWBIkHNqOdRC7aOhhFwwUccNvCvGR/UtNhIPN79Dk7yp/h3AFT7OpDFKU90sfdxcXylOvHmJTMpr/MF2P25vZAqVKpMepcUMWtnEhJkuasr4qJChRM1l7ZUHxIloHCbPwDLlOp2r69fKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by LV8PR11MB8510.namprd11.prod.outlook.com
 (2603:10b6:408:1e8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:22:23 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e%6]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 05:22:22 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, tarang.raval@siliconsignals.io,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] media: i2c: ov5647: Modernize driver with CCI and new stream APIs 
Date: Thu,  8 Jan 2026 13:21:56 +0800
Message-ID: <20260108052159.3879884-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|LV8PR11MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: 53683075-a9fa-4cc3-66d6-08de4e75e703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|13003099007|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HY7Nw0tI8tCLAYKo0tDdsYu/Ozmc71VpJUKw6ZlMqQqr28Ocu2nMJ4sdg2jx?=
 =?us-ascii?Q?1QLtUjCt6v3kj1vpFGJIsH1Rr2T55Osgs0gP8tt32GNHXp3petCbdSt4ItEO?=
 =?us-ascii?Q?Sz0jaIL9r/Cn94KfFgRU+jCq8mC4P9W/CWOWVfNyxS8l2OXUiHaQWLAYQJEA?=
 =?us-ascii?Q?6p3bB1IJtXfL6UUcquR63uc8DkiJS2m+mP+U0iVPbQreY+MgB/yuQj147ACN?=
 =?us-ascii?Q?cxRcR7D1omdpa8+NtNN8PH0BuuFK7zco6BUTYSZnQ6btTUjHANX5jbeLaImD?=
 =?us-ascii?Q?zMOrHCKHtOUIomuZIx066y3s9rtIHdwYojFq6nClM3xBwyDN7yOiT9Ghj9T9?=
 =?us-ascii?Q?nT7LIlZyhVLbmmsdCZUsn1pxmzCkRKi1JI31z4lU9xW9sYA6TP+YG89g3Dbz?=
 =?us-ascii?Q?VJ/kkUZ47GgbtHSVhz3w3/HUkNd2QV1V7HQM+ePeeQnlyTpgkZgVcLgrRWFg?=
 =?us-ascii?Q?qS3G6DJNC3P05fFeNVqQGqqhzFQzxf+bi4JmmF2dNrumf01FXg7Ssgzeofqd?=
 =?us-ascii?Q?lTuutYo2ToOr+uUXpptRdrRfOFN9AAjej+kRdD3T2D1gqRM4jypuEAMELV3t?=
 =?us-ascii?Q?dZd4UNqMnuTwkOY8rnFMGbf2VApmwqNML0/nsYIn9QxRoDXPpqXLjzXFe0kJ?=
 =?us-ascii?Q?rxayFiXzFPOtZ9sdNAheZKemTVA6BsISbs9dQmfRiY+DUL8CtAfv2UlhZtxe?=
 =?us-ascii?Q?vRfLlUylQmW/jSenDuNMMuqI53Mx4EBbZ2HB+14FypbFMAmBpSaBrN1NpYBm?=
 =?us-ascii?Q?uK9JfeFZc2zDdrica4z9qlTzEGbAWv0SjSqgmJWQddsTLT+MlKhGtEr1Ha66?=
 =?us-ascii?Q?3T0rnzfaNd5GEwV72dOo29rpIec5Ae7bVf6lV/rudRs0eK687UL5EY4TBlzh?=
 =?us-ascii?Q?aAm4mUZT/juSjbgVz/Mt1uO/td1v7rBt3CSPJGxmWygCzMJ5DaWLiIoSYFUG?=
 =?us-ascii?Q?ILk2i2rQLJKdPQkIBxvOuuX3K7/QvN/du3su0+oInfeJ2Up9VcbsbJOhwuln?=
 =?us-ascii?Q?3mw6RIBpDHaijQUStMPywcD0iWFfQrv83qWBv7V0iCKHeKlX2BJKzKnXoX/k?=
 =?us-ascii?Q?WALHs2DZd4FTqrYqRVqCTRUc0XIN3Qo06LHdQcp78FxAASI3aDbnWDCA5bKc?=
 =?us-ascii?Q?ooHODmz2fMVMzOpzAEiE2nRcNwmn9pNtgFllyPj9ow3QsEbZQkgSxOHwVJxR?=
 =?us-ascii?Q?GevA9sCtQboY6MxNJ7vZpZQyyxe5WAwK63lnFytbxWwSxzr6f9SzdXXTlNKn?=
 =?us-ascii?Q?kShA11bQ4nMSZJIJWOc++ZM/Q3RE2bt1L1UlSu2gtOrfYDANQG0vKqRBb34E?=
 =?us-ascii?Q?4UIp5fNi+F243TRQLaT2XpQ4OY5hxKu/FJLS6aYUlzsdPE2V6eL/2Z2Bc+Zi?=
 =?us-ascii?Q?rrhgDyEVgQkx6ivJ+AkXpgHWW5rcHV2sDOX0qujK7aMF8/Aq6jGglD8iNsgL?=
 =?us-ascii?Q?nmAukntY1FQKWabcChwiS56mOcjQxuw8FFADFPmNa62ibOaWDYR9yK9pedK5?=
 =?us-ascii?Q?DqGSTFeFoFsdVQuzn4PnvcEq2JWCfHkoZ7HuDz9A69ihHg3xhZDHtX67/w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(13003099007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h0iR2hWItwUZOnircG0ZFsMSC18WgHJFg5kRjcZ2/03RE1ZDKo4TwYdml/32?=
 =?us-ascii?Q?104lCE/j2xtB+oHnWXEBZXgj/9iER3ii21+fxCxo/WfcLl3WEgtKFiJjUEAu?=
 =?us-ascii?Q?0SQNRjx5vhC19tbc4AXMkl8LrgAWv6tq/GplC2gfaV2XKcAtbvyTbEtekGCR?=
 =?us-ascii?Q?/PhuMpxDm6vmJ0EegxQ0UCNLJadxPGRtWITTo4lbdOTQhPR0laJwf4yl/JBi?=
 =?us-ascii?Q?vEmkR/Pt46kKd8p9WVOIrvaUU9i113Xu5p07t/5f/ygWuh8mYsoRjrDwY7or?=
 =?us-ascii?Q?SHR2V7xKuONkd1c9STxfj78WtjGcRVMbopYSHD26d9AmHaZ7AvehMmYy2iJJ?=
 =?us-ascii?Q?xkwrbUSAz4gS7aWZRJfeA42u/p2JpZeiCIaIeFuUvF21hJ47DKhi8WEHPPLQ?=
 =?us-ascii?Q?zDiFPTRdpQlOIrcEkssjMUMAzgbCrruBbXnFvHxaBPrxe7oda/gGd6OODvCp?=
 =?us-ascii?Q?PbT1adWppYYE7xlzM7iBTONXC/0AzR68xaQz3zfsnH9T1zWn6ukr4Eowwqgk?=
 =?us-ascii?Q?Dq/r05B7qojW5Gyc4cn8/Pchnr9C2szOxkpTQk39tqtTPIfacMPkxyhjZuFL?=
 =?us-ascii?Q?XEYIyLYcBfKlUmTvJS8z1Ghr6tdGiPsn9elEBKqJk0tg/tbxs8V0Uyx1UeiW?=
 =?us-ascii?Q?In9PPOQh1q60Gcokr6UJlhuJu+yZ41fAY/PVIyOlW2iEL5QfRF29Yj3BJXiC?=
 =?us-ascii?Q?aSVYq21BBMvTevGLErrWh4MzDaogW2Nv6CcFkW7Xc2wpkTHHbL10u550JuTG?=
 =?us-ascii?Q?JZCycoeSn2m+TFUN+ZcoAp82VjCOWnU036YfO+P1/GZ+rnIH7++KxddshT4Y?=
 =?us-ascii?Q?yUBUMzJRhKdutbs2OH95DrtBg8/+HVGkrbziN+eP3Y9S9iDrm23KCYddAggp?=
 =?us-ascii?Q?ZpZFRxOXee+theLKaZbC3tqOYWVteKU22BG8QtPMVbTZvanFlAhkBNDJMCxC?=
 =?us-ascii?Q?jK0dLRBaxMQn+78C/s+XZOfu64JIupTDwBGh1ErPr61BOadpdx72gx1t8xS2?=
 =?us-ascii?Q?rly4bA8HS3exPyrShZ9cVOl05iqtmrqUrOPx0z0YjXGfPEnCcx/kCTT9VETp?=
 =?us-ascii?Q?KxRawynSYX47hJHD2TZuKWrPHXAUi17Ilrjw5i+qyBVj/C4zJIuB7agHLm6m?=
 =?us-ascii?Q?dAqjnh29KhiEXyDBRYGuSQzQDagGYGuMjk3yJmWa5FNTOlb6itjxhRv2GxDy?=
 =?us-ascii?Q?e7wTjWPz9vUaz/1bkbELjPxaZ4m+e/WWZepwLjlqh7sIWDZKjed9DSbkoAgJ?=
 =?us-ascii?Q?dvrQzOsIbL1M8hooAhni5ZtcqwMPPbzIAhWN2oDvvYs2tjS4kuXYl5E7ZmKz?=
 =?us-ascii?Q?W2qJiSjjskZezpb2iQ55SQywVMDQI5mTkeKELbS7lm2KGk93qM40CnkiCEXQ?=
 =?us-ascii?Q?LiOHbZ1g5AJ/ciJ2EQJVw/rT1m5GPoYvZkNhlPemsI5DRoZ/KZ36voWFBqWj?=
 =?us-ascii?Q?Qdt23gYmgf6NBq/FNvDPtPWz4JX75vhr/JkiPAygQ46ehkkliE2Df+DOAqFb?=
 =?us-ascii?Q?CLaTfoyCbZBciAZCBODeOHcreEBSRQt2C5iCSSGa0eGtZdtJDBTG1hCwH34I?=
 =?us-ascii?Q?uycJ1qjdYVaqNPFJuq8N2ehEzx8YZ8k68/mWD61nSJchXe1QWD7hpapmB+4A?=
 =?us-ascii?Q?OF/R8Z7jHiZ4E2cyPszHZeuRj96VPVYKp/brMsU3KxPXc3wcq0tXWPnPNp0s?=
 =?us-ascii?Q?CSKWx1oI+mOkAqX4d9zTAH11dML4BbWfLF0JT6zWUsPv/kJEVa2R0AyZHdU6?=
 =?us-ascii?Q?MaTwcYRePPke6uRlbTQTjDjp7puvfIc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53683075-a9fa-4cc3-66d6-08de4e75e703
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:22:22.8886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: APeV4F+AxOWtwDTv6tOEiNfDDHiCE9rDCAuvzD2TYTJkjbkfb67INNlE4sVDIg8cS5uVwuOmBq8TUPzy+hpn9RMQ40wp2LeqcPs5pOXC7bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8510
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAzMiBTYWx0ZWRfX0+xP+QQjyefO
 l9eOoIUDVB49rOWy9d0LCnG8r/PeNwweWOjrP/r3QY31DpajDwFKLiuYof4Ip/zzixtVpqFgfpI
 02HML1ycplCSX/LAD7n2dOeVwNUCgzIQnBE8o4mGLj0Mu0uIQVAYK0tUcniTKtgqRR19BpqVpiO
 GivYyQI7BnEyYTkWMsm/aGRMa+zm9lhIqdlPgXL4krC3EhISZZ4m7wXYt0MhEezbscBvMEZikZF
 u4N0bNzip0gC/EjLLVLoRFIRaikuWV4RjOey2H44/Ju7sOjC7mbc4o/iEon2aigekQxv1pkThJq
 H5uWO1BZVgpeomceqH0AffuCtWZGJpuIEIPhNNrqRplMk4D3gx74MqZqpQb7in1L+Yre0aEJQ7r
 x1VNRtadQu+u4rVdHOahbrvbH5rvzv3AX47d95WdaL8bincYggp/ATqDqoNt94f681DtSv1Fb22
 j/Oo9m0LX0ZcjhU1jhQ==
X-Proofpoint-ORIG-GUID: mwcX-vo7oVvcbarmyKCcMk86nwXh6-cd
X-Authority-Analysis: v=2.4 cv=TYubdBQh c=1 sm=1 tr=0 ts=695f3f12 cx=c_pps
 a=6zE/HbjXcl5L3wBq6eN3xQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=xq3W2uTSAAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=0xLdrWArXTJhJHK4s28A:9
 a=P5L7wpMTXyg1GfFA3Gwx:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: mwcX-vo7oVvcbarmyKCcMk86nwXh6-cd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080032

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

Changes in V5:

 Because Dave's patch has already been applied to https://git.linuxtv.org/sailus/media_tree.git/log/?h=cleanup, 
 there will be conflicts when applying this set of patches. Therefore, in version V5, I used 
 'git clone --depth 1 https://git.linuxtv.org/sailus/media_tree.git -b cleanup' to reapply the patch to
 the https://git.linuxtv.org/sailus/media_tree.git cleanup branch.

 - In patch 1, I also updated OV5647_REG_HTS, OV5647_REG_HTS, and OV5647_REG_HTS to cci_write operations.

 - In patch 2, I moved the v4l2_async_register_subdev_sensor() call to before enabling Runtime PM.

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
 drivers/media/i2c/ov5647.c | 501 ++++++++++++-------------------------
 2 files changed, 158 insertions(+), 344 deletions(-)

-- 
2.43.0


