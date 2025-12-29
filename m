Return-Path: <linux-media+bounces-49617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8C7CE5BD3
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 03:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AE2F43000DD2
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 02:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FE425A34F;
	Mon, 29 Dec 2025 02:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="HJDf9muo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CBFD531;
	Mon, 29 Dec 2025 02:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766975495; cv=fail; b=FxL+0X5iYafXJX8fRwQc9UsHkeA71eXxV5xrpz9Xu2HwNKBO0NjzL2kpMDkY7yWvrV+IlEOaM6WW61dQGyAuVFlV06SDMqQvc9fjjJ9Bs8wcO5bxX7OdnSm7IkGjGdI6aNX9hOv/tS6nJeehZQwvQknnfyie0PZwYMJbnFG/JeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766975495; c=relaxed/simple;
	bh=9OM8E27IeBjZrY/RkqBxPmd2SN0JCPqSEpMVpSaoh0E=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EaC8bbsnMD3WEUCAY4Fo/oo0wnAtdpiPtDgtdKcfwinDL56/PWIhKa23QDvKiXZpYnjIYLhQyk/T4LCX6/qXald3hxQ6LEPZa3i/M5sw2OSyHweuYLzPSKCyltO7wvsMFzDZagX9jABGx8+SI8puCI9Y8tctd/SbVmNxhRUAReI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=HJDf9muo; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BT2V3He613092;
	Sun, 28 Dec 2025 18:31:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=cKjyIjLeD
	/+OVyK22pRD2SrZS10WKQGSodYYdw7keXE=; b=HJDf9muoIwcPE6GK2v69FngfN
	iSEnIbP3115EE3GQPRPixmaHr0lDqOnApvGqcO4hGF8A7mjyxuyndVn0ULLWrppB
	O5FRrdlPaV9O5aWL0uUHxMeSN/D6drExlKz/PIkzaPwLU/UYusRadAUFBkgIJ77S
	RYgByIsdW4HeNXGkLHDuw/nBpkWBWXO3VD5KiFQmdmokYA0FEBZZtUqtLv2thaV0
	4T7vgVvG4xc3eF8MLJ7LWRnLrELk5fx04X7HRtGLCjYHvWNwcNVkkO5dCwAI7Hq+
	S9y6aG5TkWTg2WmZQL5fkezOEM8lVOtNwTdr8BJ4kYaK/EEL74BUoEoB1aVMA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010036.outbound.protection.outlook.com [52.101.46.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4babm214j1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 28 Dec 2025 18:31:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9cDlOxN7JVkmU46ujD/z42ivwtIpMsEbiCDBQlcHL3toyGyR5iKgJszzMegLBaiidUFTih2Plbcq1HtYAUSxOTI6xfIK6dx2DdT5hlI0VVDOICmWHLgMpjynqe+OuTw/bdyz2NevR7EGlKCLLQOgmXqsqdYk9+KOrrcVi1g2dJDFLF9aRA0S4nyRba/CP3CE8IzgyNxuhY+1aDFegXrtg5wiNMqiCxTKuinTc2vzxMAxmj5WCpJTVF5gYM+vB6a6e5e+HUZoFffCIFMaRars90IEoLc+AzBZITryNvMUpOJIMxJUt/k34BJRc39zGIKKJzZ/C2kTX+qqQWyIA9ljQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cKjyIjLeD/+OVyK22pRD2SrZS10WKQGSodYYdw7keXE=;
 b=U+D9idyOJVynlMIIdi+RelG/Vhc9jLGnds0r0/quD1LcfvYR2uG5BmRBJZSq08/+jcyFGXnqJoBm4WPwnrdsYFQmOktbFfnYbAs1DTEvhRGgN94C2lwqoInZxqTuaSKCjFzoKq/SZsvaBxcTUWdoRKtpkBpcHHNTF6MYBIR8Y8yGgqyiH5DYdMhd5f6VaeWy+IcoAe0itZooj/P4LP1Hv//gBun57c1WfOhycjDee4Vmls4vkEB4WeBhD/76ICYNFpG1x5OrExDhBdANchiA9diCM4Qr/IEzybe8BrFsZHWsvXbWEjQKykWG3sOGLtyCwV68qcsAheG6MNr3q8Pzpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by MW4PR11MB7103.namprd11.prod.outlook.com
 (2603:10b6:303:225::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 02:31:01 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d%6]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 02:31:00 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        dave.stevenson@raspberrypi.com, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, xiaolei.wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] media: i2c: ov5647: Modernize driver with CCI and new stream APIs
Date: Mon, 29 Dec 2025 10:30:15 +0800
Message-ID: <20251229023018.2933405-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::11) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|MW4PR11MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 58170b9b-321c-4e06-3ba4-08de46824e54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OPigOeZi6PJpfa1oHJ5hSA5A3OfHeKWxx6bHdTTHxApZc42DlQfQ22fQi/tq?=
 =?us-ascii?Q?hB9yZsJ/dbudhg7ykID0+49mX2ZxRJ/DamtIyOFtaYlpsdQbKctjvnVvOdN2?=
 =?us-ascii?Q?l2sF1eHLeCOKH3B0otWidtga9WA5hwqQKdHrPa2+iQrBUqSMm+0kGZM6LG13?=
 =?us-ascii?Q?rQBOZAFqdNh30Vjkj2HyQdU5X6Iepu68bGD8H6UiEHVdqmFT5W76Pa8TN8GI?=
 =?us-ascii?Q?vkTe4nTJYZ6ivFiMZ0Kg5wmxl8lRRdAkWdzJ1BDvuafX9JB726bgWEUHjkW8?=
 =?us-ascii?Q?sip9pBY6+l12A89e44hcmv/vuAL4OOBX45z261tzfkZfgvWC/KnYC1C5Zzb3?=
 =?us-ascii?Q?8PH0C3gAtmcMyAB0Urcqm1id0yproihjFwB1BzFdsTbj4l29YTHhbc4gFk+Q?=
 =?us-ascii?Q?jvjMMb1sIez7RlQybED5XirwydKeNA+PpNiLUcmZlAQO1vnJXciZowrfw0CU?=
 =?us-ascii?Q?1qTJ1GWVAX6uYo/f8prPMV5OG6y/Bdml7j4XU7Gq+dssxJ0NFYp5sDsp2MD2?=
 =?us-ascii?Q?VWdBKbSp7RV6LHpzJiltLhC6wYMhGmu/tw+f3v18DOya7Kjiji60Jz1wnW5N?=
 =?us-ascii?Q?dAOxU8JqFnKYWPRS7uvlYHEnrLTNaMgw3E2tqgLaqCDQHCUdbPMqhbLrrWTE?=
 =?us-ascii?Q?79pzlIsuIxUt18jr75d2xDmXZ9nhfnMw0n+fLfFQxu1rU6MDN42Ac+GbMmmt?=
 =?us-ascii?Q?KzD4Eg8KY4jI4NHFlhZHz314LG1jVQbB0nfpoYvA1/ADL/zSXcOLyPSpy7oZ?=
 =?us-ascii?Q?MTr/GiDr82T6C2dmBjXoEwxXwjIkGke883FQyDG6GELxmq+cfgZiAXm9O5Yu?=
 =?us-ascii?Q?2o3cdCFLhDF+8uNqt7Mrn/JqvEqgNCNgTlKshrT21sWdyD2Dkc+eMzrxfT29?=
 =?us-ascii?Q?Pn5/X0Z/4Rgym6yrx5NXKHbCOkT3bwS1JEqc7ldVr4kV9/K0Jm5sDmAd20PV?=
 =?us-ascii?Q?EpP0Ju+r6ewdBT2KIvm+fmzUNdQA3E+pjtQ+YyY5/aCEC3GYUjljFzlU/+Ta?=
 =?us-ascii?Q?RpVTuEke6T+sl77UJI8AIx7Ulm+NghlzqQiVnKiGSbaiS1nhdASORFZ3QuKr?=
 =?us-ascii?Q?1fkLRv6qd+CYJScwuh62+wNxbtaAzCUuatg/oM4/C3u1QhXNJ1iXMhVr2aJy?=
 =?us-ascii?Q?wMuWuQ5cGrkvxR/8Pj6ur7PNq5q9Z8IWeez9eZzr8ArxDXcnyug1npLwjIED?=
 =?us-ascii?Q?fNWeNn206c5MdiZHWpE70Iuj25NJu8CFXyFH9/uyijmcOuk+z3oorg2UZMuu?=
 =?us-ascii?Q?CUK5P3kcadlZY1SaH4uiIcZCTyID0j1HA9tV3OueolDNw2cgSgGru5u8lrSq?=
 =?us-ascii?Q?4P/z4GfHvkiraI0FqjwU1opPpkO5rh564bJsga3pOYynRWNEUQvPVVcJVO5H?=
 =?us-ascii?Q?UwO02lkGN4C4az4MZGQu93+POzz85iw2daIx/4qKUtkmw+khz6C+LTDrq9uI?=
 =?us-ascii?Q?wUZXxg1TMWgXgc5ryCkFQzxqED5gl3AnPZ5vjaKXrNq3BDyYN/Rb7DHjjyle?=
 =?us-ascii?Q?3TzmFBQr55wstLicoAIO3/2tQxgZvX3O0O2PAOkUFoS6nSLctwAH2v6TKQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hvju+RWYjcGv7QiwAy93aLcrMKoXTA/VJ9/Ac04H+qg71w3KQKnvZVHSBX+A?=
 =?us-ascii?Q?uPrIGvljva8SFJluTcRtxcCo37HxXR6nND3PGy9HJIi5RN5DOF22Jl8ukpYa?=
 =?us-ascii?Q?8+1D2+d8rUFPZI0ObRwQZ8YvItta/xUB9z0NWuCniLFdOJl8wgAvPWovIs3u?=
 =?us-ascii?Q?4eWvScV6DJiq19ya+TJwms6CRKUL2a3hvEDF2ANp2pkmX4rIrLBkfATStESK?=
 =?us-ascii?Q?6pMYUwLprq8+t7KIya40FVl8pjXuTKKrUwhZxv8L5qDGeseLScFlwAhAPGdJ?=
 =?us-ascii?Q?i8tZGkQTTwrOYhXqNbsg8YuZ5sJbgrQ1WbaHypjydbQmiVNEV1cTPu4c61ih?=
 =?us-ascii?Q?3k4tA6SEewaRBQSxjbi+nIxKNrhpwrXuNrDRk2SWeyhiIrqPlRJxVk5nkQ1W?=
 =?us-ascii?Q?EfjuquhliJlSY133c0CiEEKn16n3d01SfaOK45bYxbItAnXHhx0WZWk3zbkx?=
 =?us-ascii?Q?2G5lKPg8R8I3Pq65bUyi/Tj48+NP58l3p6++zxWshtqAsnjxN+NHVVyjDR2v?=
 =?us-ascii?Q?9uUkeoJis6IJ97babsR90892O2NI1JF1uytdf67b13eeqAiutg8uBpmgjJ8F?=
 =?us-ascii?Q?b5aYZs8AI01LP3oAM4H0kD/pafyQY5jrg3P0Lx+GLK7IpbeC5VqmVCfKV5bA?=
 =?us-ascii?Q?sA+q6Z65hdZngJqM8IYUlETpzBO8rGabHVLEqBjHkbBQLK/lDgIAU3cY+AU5?=
 =?us-ascii?Q?FFUiCJ0PXq2lQ2A2ipsZs/55+nGTpSdy0D7wRONQxqTEytBcNerbh/hPAXBw?=
 =?us-ascii?Q?c5+mSC9wuVbJ/08M1gaFOjjKh/824e7zWMGlkBqKt1E+ou7iOoJu9FSpInKR?=
 =?us-ascii?Q?JULo60YibP39pyfVI3Oun17tHVso5iT6sAwZ6GZ3hNttxjiPwnE1KEn90Jdx?=
 =?us-ascii?Q?FdFi+MCr6RX89FRx2+0AgaENqwZD2oBz16mFOfanAz2qZWnEpwpTNk4j/QHK?=
 =?us-ascii?Q?gUeyAALJ+DKARoBpmtgo2ekQUQqwVTcC67HBaX9hOcAU7kN24TjZQKj0FrEl?=
 =?us-ascii?Q?L6HoioEE0yQZEf5zV6Wq0l6DTarJ7BjThp098oMZSy93yDBkjBVZUkr316gB?=
 =?us-ascii?Q?9gVj4Q+1nXvZYmhEtgwuNxPzszibXjFGXV4NbpJq1m5yRKl1gME2KxAqgayS?=
 =?us-ascii?Q?dsfVB9XirPXqfArFcwmWSrda4HbWmQOJOK1c1F68GjxXB+M5bEHafvzvk/gT?=
 =?us-ascii?Q?jkHYwK/YkL9CX5aAkPmoqKG9IKpOQu2LrTqYP4vRoJ8ia307gMXE597x4jpz?=
 =?us-ascii?Q?AjDq2jd2GZZ6esdsfx9k9a5zPbhtinnf9815S1rFXEWp0ZKETxjHVwxO2afS?=
 =?us-ascii?Q?QCeMzl9bctO6FNl3dBMOVo8gdeZCBr+euCUo7prVkKM0zlxsAU6CwJEE3VJr?=
 =?us-ascii?Q?UzyHUvbYrP9jpvq7DUH0uin8O2hN4wMAaPApNBp0Lt5VsaB5fWJcudlHGpmF?=
 =?us-ascii?Q?05wxN4EKp0NOSQC+nVA4aUz9K3lzaUvabcriIgvUno5X2yCo4d0e46Gjgeje?=
 =?us-ascii?Q?o3EMdV+OShJoDSl7fl6g25gMBaHYC8Ekt5jiUOlfZ50Nzig1ApCEWnpVW87/?=
 =?us-ascii?Q?tyMgcQDqywNlgvtg+D9qbWW8Cqr96GfZfxu4ymAjbi37fu3WzO1vYXY6KQVY?=
 =?us-ascii?Q?fCMzE6qJGRuCV+igv2V64aN0inHsUGMoxwFYfs0jNAZwiJDeYKZicOixTnZ/?=
 =?us-ascii?Q?DpnLgC1OaYLGWHROr515BD3of0nYKAgem0RcutURd5iSZdLOCcPiuq4D4m2/?=
 =?us-ascii?Q?DQP8VFXWPwXZtk7GQKmMCBtYC+eNHD0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58170b9b-321c-4e06-3ba4-08de46824e54
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 02:31:00.8811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3QefJq4obx8SK1gmGbAH+SkR1mpzt/vJK5ZClGBhLvtHuMbSAwmIfw4vYpeoifnhVQ8YV1pnsYcSO+PacOVXZ5hzqPoU7CvpJTubKZ7+Gok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7103
X-Proofpoint-ORIG-GUID: ZRrnNOajipnYfIcP3WScaRKyUS5FKGpt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDAyMSBTYWx0ZWRfX+bPCfqn+/8Xj
 tU/b5dFgaAM1G0FM25W+XrGlAfJ+5vZr+x4k732z9uQmOodmIsZHHaEsEnTEVIPbZ9Bo4pMUufS
 tV/I8vf4sfxiMg1ntLF5vO39qdCYQCZRPZvKJD6V6RltU8sZ5YkhVuHGn+UHrMwszryvslYGQhi
 YYom9DXFnbHajpQxqKLPbpGqyLbNR4hECb/5g60VszzLs0eHKT2+M8sCpuFKbFD0LoEnsa5eoyi
 ivZiyHXmPAHQZfDtovJ7zfZ/TcFKxtMjpAsf7xYOc78Ge2ZYCScWlCcTFlv58UOCP4kl5EB8til
 w+iklIZRcFKvljXCV9lnUvPyLkD9KQ65rEcnOLPAgh7I7IFplIzfoBwaQ2ixmFsYELmyHjHwljk
 SuIv9+28+xXN6DyU2KgOAIDq5BUZ1SW2rdTS59/d+LdWfm9nOSV1aSwDKrpxvHOCz9cTd0PR8cc
 wNe1n5ELyKF62QCK3WA==
X-Proofpoint-GUID: ZRrnNOajipnYfIcP3WScaRKyUS5FKGpt
X-Authority-Analysis: v=2.4 cv=bN0b4f+Z c=1 sm=1 tr=0 ts=6951e7e7 cx=c_pps
 a=8DpcgsHgAViCMqsLoRaOsQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=FNZcgRFws8AYyTAlzAgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_08,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290021

This patch series modernizes the OV5647 camera sensor driver by:

1. Converting from private I2C register access functions to the common
   CCI (Camera Control Interface) register access helpers, which
   simplifies the code and provides better error handling.

2. Switching from driver-specific mutex to the sub-device state lock
   and properly implementing v4l2_subdev_init_finalize() lifecycle.

3. Converting from the legacy s_stream callback to the new
   enable_streams/disable_streams operations to align with current
   V4L2 subsystem standards.

These changes reduce code complexity, improve maintainability, and
ensure the driver follows modern V4L2 subsystem patterns.

Changes in V2:

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

 drivers/media/i2c/Kconfig  |    1 +
 drivers/media/i2c/ov5647.c | 1098 ++++++++++++++++--------------------
 2 files changed, 492 insertions(+), 607 deletions(-)

-- 
2.43.0


