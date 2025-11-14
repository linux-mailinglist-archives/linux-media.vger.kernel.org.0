Return-Path: <linux-media+bounces-47031-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A19DBC5AE43
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 02:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F363034AFEA
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 01:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E922571A5;
	Fri, 14 Nov 2025 01:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="YxdLmM8J"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021081.outbound.protection.outlook.com [40.107.42.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C002264CC;
	Fri, 14 Nov 2025 01:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763083310; cv=fail; b=VbNCq0AHx3vbipVyusu3CGFUsvM6pXnlBmxjaS/is16V/TlGbJDWLHCGEbukc16U4CWKhDqaGsYjK3QKjgCDFxARzskbmMZcOmkPyv6MUz+9u7GdYGOu4nI6OipChrM4ZmlURbnhHmH+njXdvdA6zXjuPtsgJyg8OdbajeJffGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763083310; c=relaxed/simple;
	bh=qHE64HhoqMBKETyIEExrW52/09lLsRdCKTvJtCU4t68=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mOcFWLgWOzOTKT3HKj8nb4PlZm+9n2mzvTHCUpDZI4VOqSYW7lDL6CFMIRt3La3bNdM9snSoiidC0gAG8fVmw4D/k3prNT+/S4h2OT4VgPLITakZ4nuvtch/6SCdiXFC59jCuMtnv19F7qEkbsP4F2DfB1qGXytALCKD4vRvmxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=YxdLmM8J; arc=fail smtp.client-ip=40.107.42.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ag0WR/yTMSFfQ9l1XMcNOJO5hv/uW2ajpeTJfwd/ooGXhJuelq9/TIK47JXvYkRqQddn/j8SA1olv/lLwPVpxT1dhZE8aRlMru9Jnz0KAN5hqtahIxu9wr5PgZfj4yw5iU4s9DXACO6mZcWxuHHzTmi9TaaC5PdvFTEkZU4TqJ3W/+8vp+fxf6Zj/2FAOmB3yJftpEcXFal8ff8FbfrsbXV3M44GijOUSJc6M/gRbXSO0EXXU/K/1gpeOIt9SoBUlhwkO7NPu19OPhWdjoSiy359F98ZpUt4NCAez2Qo2uQnvsshNavUZ60oIzqO05vyXCf03Wvap31fUYgZ5GXsPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dclpbtmveS5RBWbIF/Jmzebb5NCPUCOT7PWk6F4LbKQ=;
 b=UZGCUeUlwP4oOIDFqpGgk/ZlBDDhfUN0g9kFQf4hlA0sas8kcL27GENA9PvAtUN3J6n3mplFDp2DBH3Quy7F/zwcS8d4wGWtMRBWsE8hdJ+xCP3WgBbBlaJ8/d42LopDGHbX7rA3gaapEeRYWifmsVIBJrldOAdhL6GGwfAMpBRGATdNZvBjgdvzDr44Znn5AL18ZzyjWY1GIus71iJ9l2Os+/qKwT1F6F3JLoAhOmy4cDAVD7YnCXwA+h1XTTE/uriqae75m4oA+mHDMJ7Fvz9919KFKCzVa2EV9WWhSi+zj7mCtidO8JqgkPWv3Kc2o2JX6cJpgTEAqTNn8Na5sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dclpbtmveS5RBWbIF/Jmzebb5NCPUCOT7PWk6F4LbKQ=;
 b=YxdLmM8Jv4yojfPfeHwrc+c3oyBsYwEHzYk/nSDNEH49YDoWNCLNnQu82YGEGRiRIE6YqjVUrwa7dAIRFegnMDw2bV1K9FEpBoOQrBIacDRwAYwI5pz82PB7pZuSYEBRxH0SJYGtHVm+6+bHr7Dbjk4xuUddOD2UzzAgHWDKAuE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE2P216MB2850.KORP216.PROD.OUTLOOK.COM (2603:1096:101:290::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Fri, 14 Nov 2025 01:21:45 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 01:21:45 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v6 1/4] media: chips-media: wave5: Fix SError of kernel panic when closed
Date: Fri, 14 Nov 2025 10:21:27 +0900
Message-Id: <20251114012130.59-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114012130.59-1-jackson.lee@chipsnmedia.com>
References: <20251114012130.59-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0031.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::10) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SE2P216MB2850:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a3dabe7-e6a1-4553-af08-08de231c2aa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x6JsDbCgCQHrWM8UJD7lu/AOeZwIFg5TRvlCJlA9RXAA1fzfgoyywf8u/t8k?=
 =?us-ascii?Q?MahN/w0ipl1YhqGFR++jDdOb6PeH6p6ZNyOuFUtvtsuUTwQtCoEIAmzP8Nc8?=
 =?us-ascii?Q?jiiUcrk8UKNIQJHqkCb+cMdzv5ph5M9GnV78T6nGU1dJ+8ByBHxzm4s4eKir?=
 =?us-ascii?Q?mtMbL9suZaMGf2+2lcg9/wm6S/K2xr3yLvLGkp7gMXiALCOxEm/b2Y8ezKe5?=
 =?us-ascii?Q?tRE27cu+wfMUuxwY+ycfutc2Nto7+IRX1z8iFC7ZDOsxn5dt0KvkRSPlkoi5?=
 =?us-ascii?Q?6hjMtl5Vmb/hWB3Fsy5JbTp/NOijMwyeXGewiBJniiUWEQStoO3y62AKjApV?=
 =?us-ascii?Q?P0hr3lGM75VxA11LES4wFSc7e+ho1DdnPUeNvZwbenNLtRtiE/Q7bnkUFT9v?=
 =?us-ascii?Q?mE5QZB2d+b6cNryXxIETBuiwzMTVieaydhpaNFuwHOZt2AozPQ/2jqSlTltj?=
 =?us-ascii?Q?u5+cGIgnowRPdxEKEKnnzxvkmlJCESzHMUdU6tvU7jnhEfhhpLetbhj16xe6?=
 =?us-ascii?Q?fQIFpBspKF5WzxGjctxmURfIp7yUdqaNu66wekRh+m8/V5Wjhds3hDfkBNv8?=
 =?us-ascii?Q?zVYVPAATlccmMxkzWp2jOeh4OSC0KqNr4SF+iqtphRQMjrCYofNZ2N5sKzs+?=
 =?us-ascii?Q?fYQQvC4ahwAiokdCN7ozHKyyHlKPACjBEEreAzm5w9379G3NWHgoqNwavuZM?=
 =?us-ascii?Q?9F5MYXciIIfRPQTp0hxpvvWFAguaKuQw6hZpsYBGFsvyY81hiDjeFWaoTHe6?=
 =?us-ascii?Q?5+M74J79706TQB7ytSZzL8ajH2aT4i+ZemmH41159UIuxpOu3Mtcy/vFy4l1?=
 =?us-ascii?Q?NX8au8wZnl2bpd++o7u8MVywPIEi50iilGShV+ZdoU9p9URzpvx85NEoPhVm?=
 =?us-ascii?Q?f/c5BoV3BiKdJZq0XFO0ush0TlfvrUEcFCFRAYBOxkg5QDaxkPBmyNdUKDWC?=
 =?us-ascii?Q?CPKZyepex+4nRvTVUtMtWMvtkWY7XxXVD2aqgdR4cJ2kzMX/N8k7qgqr2Mru?=
 =?us-ascii?Q?fYd6xdoWkIWVhPk8xqYMABbUNMre1LE8rx14mWoMbYl8jPmtaJN7zsvAamza?=
 =?us-ascii?Q?gl0NdgBzb7WwJSD3aG8herTULtvWeA9wdx+oeHaqWb7K9mmrQ9jHZ8toMJWY?=
 =?us-ascii?Q?fUDRlzQmj/LqPJDXc980/4L6PGbaN8VIVGaQgEG2xwbempT3BcoQd1i5rpFo?=
 =?us-ascii?Q?2zScGH3O/E0oJyQdNBM0AEoUqtoR/KiKXFW2UIcrgkq8klMP1h0Y+Oq73btL?=
 =?us-ascii?Q?8oevgzyoATN5GvZ/QOrszG25pIs28BpfHPGOXTAdJkb7NrSABWU8ADvneErn?=
 =?us-ascii?Q?ceThA3Lm6KhVU4VqnF60Ev6e8ba0aDyPJD1A7Sb7K8NvRBPUuFxv+Qq5HrXH?=
 =?us-ascii?Q?zJm6RPJ3A3VhStzPDZ/oLr6cHSpO0OWFopV1fSjWO5RocpQsD+9k6JGbStAe?=
 =?us-ascii?Q?bLpUgJTcyvO4Zbz+KUQX1y4qpb6Jhy+qSIMx/bIva02FCr9Ts5FpMuqarYFh?=
 =?us-ascii?Q?hkFkk19qAH8pGwZEGEpM+tlsnGaIQxky/Hrr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p6awD949PhRvQNIQm7YgaOaVref6EiazG8bl2IIFyQKZLjJlKdvuYHpE5rd0?=
 =?us-ascii?Q?x2HvRb8l8Hz6kA4ZaFOdDq8dU+fnbobEMXoCWm/bNCvaqXMwHsD/571h4X4c?=
 =?us-ascii?Q?h+faH/xm2OAdXpzW21SwjOqDC7vYM0vGLi6CZNJfVDWt28uq3hMwk+VBXrZZ?=
 =?us-ascii?Q?KwmG503unlV62DWLt8sx17jWHFTf02tDT/N7fdrRGDjTmdoNMAvTM2LI8ZWw?=
 =?us-ascii?Q?6J5Zou/Wfly/LDPEIlfXUzEgEbmVHGEB1Vr/pXd/mrR+Xc9xTKHzxNbzVkoY?=
 =?us-ascii?Q?k0ZNJBVO6cd41WbLR8XZUejngDz7nQiJKO83Ie+xWajIFJOUfnstyfUAkEs+?=
 =?us-ascii?Q?zICcZ/I3KklcSDH6/2DM0qnDaKWNN1sC5qHsdCsrglL53slsVcwfuT+xJ1FP?=
 =?us-ascii?Q?4CYRVV/wvnEq+F8rWJHIMlP0cUQyF5J7pWvdohoEkbhvaph51IhyzZ23xDhr?=
 =?us-ascii?Q?yzQyH0Hl10jj0YSUCOW6kTqWxydNXYw4W2VZTD5CU06RDs5S/oOSq4Zsor8K?=
 =?us-ascii?Q?PpwVsyAXL/irHrWFqZ5ydWjgQyWeaz8W1ruFHRVt6DFMobIjbm2ZWFiEk+1b?=
 =?us-ascii?Q?9gKdtwONbw0GMXXuo8ox5On69ZSo7m+Ba63JYblzP50l7gxuKijOVj1S8B/s?=
 =?us-ascii?Q?8ofbKIh0b3E8iBG1p5gmkzu82VY9+AMo4KOf2DL0lFooXSb8os9n8qm1Ju9S?=
 =?us-ascii?Q?4FL8zt0uzIX/RwlBbNn/Hi0jljUl9opVWmCxvk56708BzuIcxr/F6HHaCo1K?=
 =?us-ascii?Q?8OhS6BTVy4xI6/yIWljO7n9+7PAoi6Ye3PjBzcB2ft7Cy/zQukiiElb6zhGX?=
 =?us-ascii?Q?jIVamxSEmnXM9U7/KxlvujRS+P8OAOwFFk5Jctm0F1sGO0TsmSzqseobOHZp?=
 =?us-ascii?Q?k2PntTVgPSYcJ9yVQdOpoYzVWj7IPKz8GgAHxQJqax8MCXaiwIgWGrTVjTx7?=
 =?us-ascii?Q?z9heWgptgbB2LI+j6oGx+aDSdm3Suql6qZPQh9nqQai5Stg5RyEffhVurimb?=
 =?us-ascii?Q?80fka/iDdWun3TVFt+HxE0j8Et/ttim+dXTt3tEGFN8wGHEC4Tiu/6hXtcXk?=
 =?us-ascii?Q?Dt1TKjKVQaiB8LkjKn3kgg/08RkdNP7gPMWYbwbSWR7QUtX70C/g6kZx99a9?=
 =?us-ascii?Q?VUBPhQWWEKpyPxhCKhSDtxwJ5egLLSmUwa8nR2kHJLbaFu6iw8fU11y/lZ+H?=
 =?us-ascii?Q?QmY7uWg7Ql3cw/VJ1sf3bpTtI3QI1sCphzrbJ77wMSAi/vxblHOzVRkgQs6z?=
 =?us-ascii?Q?PwihV6Gw6VKBmjJFyUOJNHYT1Lh1Gv8JUTZL06Rc/YoGmgYV3KWuWCJMD4/2?=
 =?us-ascii?Q?7SzvwwY8oQBIMrmdlHU+NmBTMukW6CKzawnPPGj4bjTglNfb84X+hYDHQSup?=
 =?us-ascii?Q?/HXysyLly+xi8+WsqvdkPTy7RQlsRN8o/85mbPgnQWvSBnuwYbb/EStyCZD7?=
 =?us-ascii?Q?7oadMZIU3grwFtZx7IV+wNq8mrtaNQ7wYhQnc/mfs64vU4sG7pLFsNH8c6Y0?=
 =?us-ascii?Q?E67yXLG6BB79jOFHCr6LqaY4ODdVrcuPcKZ+anBiLgG0d+mREKUpdP3MSOsW?=
 =?us-ascii?Q?EEjhFbaeg99x1T59h3QlvX35oO2jHCxXGNb+ulHWg7F7i3ZPsFeICAaX07vB?=
 =?us-ascii?Q?7A=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3dabe7-e6a1-4553-af08-08de231c2aa3
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 01:21:43.4366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCF3t2QfsBWTjVHDjTUJXaWNI4eiWtrmaK9HylM03ztJEBtWf08M+NdZUzMyMg/XIbdGXYzwE7pqhO2tqLTssT/up86DRxGIFwz4DhFv9Jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2850

From: Jackson Lee <jackson.lee@chipsnmedia.com>

SError of kernel panic rarely happened while testing fluster.
The root cause was to enter suspend mode because timeout of autosuspend
delay happened.

[   48.834439] SError Interrupt on CPU0, code 0x00000000bf000000 -- SError
[   48.834455] CPU: 0 UID: 0 PID: 1067 Comm: v4l2h265dec0:sr Not tainted 6.12.9-gc9e21a1ebd75-dirty #7
[   48.834461] Hardware name: ti Texas Instruments J721S2 EVM/Texas Instruments J721S2 EVM, BIOS 2025.01-00345-gbaf3aaa8ecfa 01/01/2025
[   48.834464] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   48.834468] pc : wave5_dec_clr_disp_flag+0x40/0x80 [wave5]
[   48.834488] lr : wave5_dec_clr_disp_flag+0x40/0x80 [wave5]
[   48.834495] sp : ffff8000856e3a30
[   48.834497] x29: ffff8000856e3a30 x28: ffff0008093f6010 x27: ffff000809158130
[   48.834504] x26: 0000000000000000 x25: ffff00080b625000 x24: ffff000804a9ba80
[   48.834509] x23: ffff000802343028 x22: ffff000809158150 x21: ffff000802218000
[   48.834513] x20: ffff0008093f6000 x19: ffff0008093f6000 x18: 0000000000000000
[   48.834518] x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffff74009618
[   48.834523] x14: 000000010000000c x13: 0000000000000000 x12: 0000000000000000
[   48.834527] x11: ffffffffffffffff x10: ffffffffffffffff x9 : ffff000802343028
[   48.834532] x8 : ffff00080b6252a0 x7 : 0000000000000038 x6 : 0000000000000000
[   48.834536] x5 : ffff00080b625060 x4 : 0000000000000000 x3 : 0000000000000000
[   48.834541] x2 : 0000000000000000 x1 : ffff800084bf0118 x0 : ffff800084bf0000
[   48.834547] Kernel panic - not syncing: Asynchronous SError Interrupt
[   48.834549] CPU: 0 UID: 0 PID: 1067 Comm: v4l2h265dec0:sr Not tainted 6.12.9-gc9e21a1ebd75-dirty #7
[   48.834554] Hardware name: ti Texas Instruments J721S2 EVM/Texas Instruments J721S2 EVM, BIOS 2025.01-00345-gbaf3aaa8ecfa 01/01/2025
[   48.834556] Call trace:
[   48.834559]  dump_backtrace+0x94/0xec
[   48.834574]  show_stack+0x18/0x24
[   48.834579]  dump_stack_lvl+0x38/0x90
[   48.834585]  dump_stack+0x18/0x24
[   48.834588]  panic+0x35c/0x3e0
[   48.834592]  nmi_panic+0x40/0x8c
[   48.834595]  arm64_serror_panic+0x64/0x70
[   48.834598]  do_serror+0x3c/0x78
[   48.834601]  el1h_64_error_handler+0x34/0x4c
[   48.834605]  el1h_64_error+0x64/0x68
[   48.834608]  wave5_dec_clr_disp_flag+0x40/0x80 [wave5]
[   48.834615]  wave5_vpu_dec_clr_disp_flag+0x54/0x80 [wave5]
[   48.834622]  wave5_vpu_dec_buf_queue+0x19c/0x1a0 [wave5]
[   48.834628]  __enqueue_in_driver+0x3c/0x74 [videobuf2_common]
[   48.834639]  vb2_core_qbuf+0x508/0x61c [videobuf2_common]
[   48.834646]  vb2_qbuf+0xa4/0x168 [videobuf2_v4l2]
[   48.834656]  v4l2_m2m_qbuf+0x80/0x238 [v4l2_mem2mem]
[   48.834666]  v4l2_m2m_ioctl_qbuf+0x18/0x24 [v4l2_mem2mem]
[   48.834673]  v4l_qbuf+0x48/0x5c [videodev]
[   48.834704]  __video_do_ioctl+0x180/0x3f0 [videodev]
[   48.834725]  video_usercopy+0x2ec/0x68c [videodev]
[   48.834745]  video_ioctl2+0x18/0x24 [videodev]
[   48.834766]  v4l2_ioctl+0x40/0x60 [videodev]
[   48.834786]  __arm64_sys_ioctl+0xa8/0xec
[   48.834793]  invoke_syscall+0x44/0x100
[   48.834800]  el0_svc_common.constprop.0+0xc0/0xe0
[   48.834804]  do_el0_svc+0x1c/0x28
[   48.834809]  el0_svc+0x30/0xd0
[   48.834813]  el0t_64_sync_handler+0xc0/0xc4
[   48.834816]  el0t_64_sync+0x190/0x194
[   48.834820] SMP: stopping secondary CPUs
[   48.834831] Kernel Offset: disabled
[   48.834833] CPU features: 0x08,00002002,80200000,4200421b
[   48.834837] Memory Limit: none
[   49.161404] ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---

Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime suspend/resume")
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/chips-media/wave5/wave5-vpu-dec.c    |  5 ++---
 .../platform/chips-media/wave5/wave5-vpu-enc.c    |  3 ---
 .../media/platform/chips-media/wave5/wave5-vpu.c  |  2 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c     | 15 ---------------
 4 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index e3038c18ca36..528387c6ecf6 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1243,6 +1243,7 @@ static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
 	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
 
+	pm_runtime_resume_and_get(inst->dev->dev);
 	vbuf->sequence = inst->queued_dst_buf_num++;
 
 	if (inst->state == VPU_INST_STATE_PIC_RUN) {
@@ -1275,6 +1276,7 @@ static void wave5_vpu_dec_buf_queue_dst(struct vb2_buffer *vb)
 	} else {
 		v4l2_m2m_buf_queue(m2m_ctx, vbuf);
 	}
+	pm_runtime_put_autosuspend(inst->dev->dev);
 }
 
 static void wave5_vpu_dec_buf_queue(struct vb2_buffer *vb)
@@ -1825,9 +1827,6 @@ static int wave5_vpu_open_dec(struct file *filp)
 	if (ret)
 		goto cleanup_inst;
 
-	if (list_empty(&dev->instances))
-		pm_runtime_use_autosuspend(inst->dev->dev);
-
 	list_add_tail(&inst->list, &dev->instances);
 
 	mutex_unlock(&dev->dev_lock);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 9bfaa9fb3ceb..1bf1b92147bb 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1768,9 +1768,6 @@ static int wave5_vpu_open_enc(struct file *filp)
 	if (ret)
 		goto cleanup_inst;
 
-	if (list_empty(&dev->instances))
-		pm_runtime_use_autosuspend(inst->dev->dev);
-
 	list_add_tail(&inst->list, &dev->instances);
 
 	mutex_unlock(&dev->dev_lock);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index e1715d3f43b0..b3c633dd3df1 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -322,7 +322,7 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev, "Product Code:      0x%x\n", dev->product_code);
 	dev_info(&pdev->dev, "Firmware Revision: %u\n", fw_revision);
 
-	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	wave5_vpu_sleep_wake(&pdev->dev, true, NULL, 0);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index e5e879a13e8b..e94d6ebc9f81 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -207,8 +207,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
 	int i;
-	int inst_count = 0;
-	struct vpu_instance *inst_elm;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -250,11 +248,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
 
-	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
-		inst_count++;
-	if (inst_count == 1)
-		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
-
 unlock_and_return:
 	mutex_unlock(&vpu_dev->hw_lock);
 	pm_runtime_put_sync(inst->dev->dev);
@@ -720,8 +713,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	int ret;
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
-	int inst_count = 0;
-	struct vpu_instance *inst_elm;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -764,12 +755,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	}
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_task);
-
-	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
-		inst_count++;
-	if (inst_count == 1)
-		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
-
 	mutex_unlock(&vpu_dev->hw_lock);
 	pm_runtime_put_sync(inst->dev->dev);
 
-- 
2.43.0


