Return-Path: <linux-media+bounces-33083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0790BAC05B3
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 09:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84801188F9B3
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 07:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54DEF225A39;
	Thu, 22 May 2025 07:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="OrdS93Ll"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022136.outbound.protection.outlook.com [40.107.43.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7335224AEE;
	Thu, 22 May 2025 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898790; cv=fail; b=NNMgzbQZHkghuPi29Oke3nxaEK0HTC9wJFu06A9ygd1mE6sBvK6m1o8cPBHjvTMGKu3upuC+jQsT5zWPfQysVMODxXWXcCnPS5q3Nh3H6ernREvdSDQXk6UYqABuf1idfCYww5b+e0pZDghvqT1mxj2tU76mIB6T8Qi+ORp4ZQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898790; c=relaxed/simple;
	bh=PaFT5igaTSjpxSeoGSg+Vf7GB+9v69WpAbNTX8cJoCw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aTYtuYjntDXTRib/re1ly4fe9fFZVLElkmUkO9eMv8nN/qCt+rv7g2MI6w9Y/PlQoSeDQmEbMLHi/XPpMECgW8kfR/59Q9QCDe0tg6aeoNz+dd2BHECKTNZn5HBm8VwRucxXfH3qC2p1+Zp7qbuVgioVobC6ctrJgfXfc/AtFKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=OrdS93Ll; arc=fail smtp.client-ip=40.107.43.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7T2TxdhPHjZnqJCIEeGcwh3xiJH6LdmZtSOqLrgmwafzTgvXdXm3Qgkcm3x+2ZWIr6+QjGDMwZx9IQzzUKHpWvrqhVFXy4c21YxhHvxFSuBr4n1ZgG22dGGhVj1uwujNHZSfvOVtmGKxvwLH1aIvoGMXjMRBvqbR3QUcz/6aCF0yInGus7HKJYEKZO3p0D3DbYEzbQPL190ZR54oIj8bRL79D4bc3zKgPX1ALo9PgCjCbGeadBegg7jaYO9D2peuZJ5mei951DVuhxFfn9P2Cy7VhcB1orm4O6S1srqGG8/bL9xVvo4F/SMY6rxmAyPInD3ezp+otTDiTplKbyufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEH9NT8DCJiP4UN716FFmcS1IC7KnhaKvZzpwYDS05E=;
 b=O2McwxLMTCABfBsVa5onrV6PyOJ/7KXSuCz2jsvm+wZy1u6qmGOFGUvygbBX+aZW6cHY/v/cYrCa3oZLY4De6md7KCVHPyz8YSv18IiFuh2B7q7y1KldyLI5a7mEdxJzWbH2E/3lSOEQ/l8z7xo/Andpjjsb3EmeBOptkA0PxdYDpo+TKGb8SUGN6FHN3Us7wLQuucKoZG5fAkZyax2uHRApTPoQ+PoVcpAJ9nh/do9Z2cus68eImEI3QQA2rqIsoW0jcJPAWktwpgp86QcXgazVFGpww7PU9sEbckMdkUeheWUmOkCXhytqulGQ3jsdBLhtMhdJyUnlUq6sCnv8QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEH9NT8DCJiP4UN716FFmcS1IC7KnhaKvZzpwYDS05E=;
 b=OrdS93LlTjiztMERuoPUqdFlApTitfSBUgy78G6z/boCPhyjCkItTWFV9ADf70D9P00FgX5tid8iK4gRAUu9h5M6ElamhQhwMIdesOsPMMp+I2F84SizwG6Pdm7iHmhjmr1/1qUjjjS398+N8+mU3MPu/mLk6ohTZYD1nl6y5M0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PUYP216MB2872.KORP216.PROD.OUTLOOK.COM (2603:1096:301:152::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.20; Thu, 22 May 2025 07:26:18 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%5]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 07:26:18 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	sebastian.fricke@collabora.com,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com,
	dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v2 7/7] media: chips-media: wave5: Fix SError of kernel panic when closed
Date: Thu, 22 May 2025 16:26:06 +0900
Message-Id: <20250522072606.51-8-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0071.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bc::13) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PUYP216MB2872:EE_
X-MS-Office365-Filtering-Correlation-Id: 6666a388-232d-44d5-7b21-08dd9901f1ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wBAVu1nolKnkEfxmdIbcCSAZIlcbxQh6Sqq47ep7vN4bVjgEdSo3XovSeqfl?=
 =?us-ascii?Q?OIp/dYXOsJCK67cwCV6HoFRR8tL2JRGn5upPe6GmOaHPGIK/tL9MzGgolPR0?=
 =?us-ascii?Q?9DZ6awOhkYHpFM90ieWSyARSXlltaoZ5hhj85vYZkAEmQqsK/l45fynBxnIp?=
 =?us-ascii?Q?euJCHPzS+E7LwjsUO6CSaOL6pVR6YBv0LDuNoh4ZuuIM8Wk3EU2PZUFMIkFW?=
 =?us-ascii?Q?kUQOzE+/lDCrDbgohITX+ILygPaylSKaFY38IlbwkY+0WkRg+SyLVBwXALCy?=
 =?us-ascii?Q?TUj4sbNoeWqpnuPVI+RURCKUZqN9LzS8yH64/N7ayUNXZRV47/XlvmKxPy9B?=
 =?us-ascii?Q?JQOtGScOJwsNfHkyqbzpOMtpYLfEWDOF0vWPkrdW4EFyupm+2BuNIS9Qs+Ba?=
 =?us-ascii?Q?Y2sYz7SFiQHyYJAwv6HN/DYJaydsSnH3qAvyt8fdgAqf74spm2qQxARSJlGZ?=
 =?us-ascii?Q?EKk+QDMaHILRmwApY47r5y78XS2by2ICbEK4kLHJK5QjiKq7ysvAlvW51LBy?=
 =?us-ascii?Q?LtBXhHLTOKMqpeL4Y/J8jbIu06cU8A0zUE/Jhs2ODmCdh47jRAxblaFNAWco?=
 =?us-ascii?Q?0On7kZYh0uEQKeVcWMqRoqrXJmoACq2BxUozJUp0DPtmNGtRaU9a5HTL8v86?=
 =?us-ascii?Q?FtPGPynllQm/FkytuDtg5Le4K/jXL2Ed9c+XPqF38VeiPVFKAgUxXhfHhfSJ?=
 =?us-ascii?Q?I7ft535kXKy1urPz6ngTt8ldvxU8I5RaoPziFaUCjjg/E46/9AmXWjdAReTH?=
 =?us-ascii?Q?3zQbkIU3U3DI3YxD0uloLH8oc0LcNi0BXGa8bPkma8HSNQoqxwV/VIZm6QUY?=
 =?us-ascii?Q?e+1fsadHIrxLedhN4/UQ+Kj+6j2cbytfb/hMYH64d6tT6fpandtBpJ6Movz6?=
 =?us-ascii?Q?QRGEEvB/PX1gkxQVIUbmNqBRyZEj7xAPPrTEzGJfz+k17thu8cWLeosmhIu9?=
 =?us-ascii?Q?tgm3OUVX9X3R/fnbMjd3U3p+sU51ORrlavHOycYqPk6Qur9ReHSBi7eDZTeD?=
 =?us-ascii?Q?vDrmKrDxgLbuse4XO6yoemfkn+7bd8nB08eZOUQOM7sI+lDxF13WO3FpxuIg?=
 =?us-ascii?Q?9a20tvS0zr4CrwNhGjoR5KBg/L0AU8HzE6WUDsWIrF2mypLJ7Cq+ZGTJ6Uoi?=
 =?us-ascii?Q?R+rr0k0uxjVRZ0SFWlYRtWB7liw1j0scZ/mdHZtbtgnz0/A1C+Hj2b9iMhuM?=
 =?us-ascii?Q?RzVh2rQirBSikW53BDTS3Wn2QCxqFDevdwO963rLMXSntrc6Awr0eiBH90ac?=
 =?us-ascii?Q?SEGUerCVeN65v8QzzkktBpUPtfLdKOQC46S4ufALG/vUWo4EvgJ1fH/c2M3Y?=
 =?us-ascii?Q?l+rXg760XteJRAOoebm+oRWwskQB9XvJdBEJswg+6ewb0vkpFu1unTQIqrFw?=
 =?us-ascii?Q?7MzeCdCfnnawIw0mWKC1DqzvpiT/bULVwIC/Uj5nfNgOra9mMKWPHEg+bLRR?=
 =?us-ascii?Q?NyZTqepIamNLedsBzjfIF2tBSZXCm4lbXXXmVmOc3AKDWA/lqq0qsQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?S9eiuf5R2OzjGhyVb4ymJ0ftLiVgNwopfU/twUsJyNqH8jSvhe+hWDoWN6cO?=
 =?us-ascii?Q?HNXHX6k9zAXvEgiXzrgHtmEJMYlO2fZQ7Z7WRkYyywjJgfVCGwhQ76IDD6b5?=
 =?us-ascii?Q?J9ZaXbfj08A+L+9/9RM/tfOnUkA6L+jwU5l1+GCD5nwhE4pRRUCPTE8Z3k45?=
 =?us-ascii?Q?+uypaZWMwx8SuGeosXTknCA/xlNAuBT6UUQRjPAqIfcEt3kj2Vc7ee6hS3LN?=
 =?us-ascii?Q?3FNWwXOsEOS8hI2kyLJP6vLRSvWTi3TwwC1XyL8ndp89jRzZD9NMMI/vUQNQ?=
 =?us-ascii?Q?jafy/Art1td7z54sXVc8cHEeAi9suIfpKQ+YWRxlzzo9nOeRQfFBxa25KK6K?=
 =?us-ascii?Q?ipDjEV7igVKnip+GhGovNgXYDS+lxRjyOKHpHgpPhixN9EMXnQlmZ2FEK5c7?=
 =?us-ascii?Q?gnh2q0GhMn/hng+SV+SH6yTq/LaOuQMO+tWON1THsSzRw0ONa5IfGJOeaa0t?=
 =?us-ascii?Q?g0/CBGobQY84zsZdOVUpOEH1QqVg3qGRL0YyavDEd0kBZsN6fj2LiZXxOICl?=
 =?us-ascii?Q?mxCkU1jvMC7Zao0Cvgx/opanVJ8x5Ylel8SHy5xNi4lzzlnl4Dgtlq0tuxcq?=
 =?us-ascii?Q?70LDRih2VUkWUdt01sbpP5Qf3AutU4MFs7e/DWMCGKZoGzTTdlV0V5cGhSu9?=
 =?us-ascii?Q?5upJVnrdmQGb1xyGPnjyzpom8wZFcjZv+mTe3frIKnzo8xgPOOSfeqpuaNGu?=
 =?us-ascii?Q?OsJsfP0KjsZPcROU0f1xmUtKP74bsUw/KOw9ZVWv1scH5TZ29ARPkhJL0tn0?=
 =?us-ascii?Q?3Tg3wePQX9YS8cqBR5W0+n8+wvsddpg/yDDb94/HaKW2g9Hc8GlQWzkxblEW?=
 =?us-ascii?Q?CD1/lsWUAkHWxS0T6jtQtva6bfityOZM0hi71GTnyCeSbfGvX47GmVeZhZdM?=
 =?us-ascii?Q?R4EWkwyfIYBy9GABiNhv0bbeD9zkwjI+KGpYU0JmQk66JlSLRA/YTt2o1t1x?=
 =?us-ascii?Q?eUqWDGxkhmfqMAiGEudZ8ZkMqnt+WmhoTv2FZ4i/Ejhr5HzCUJc2WN6DTgwu?=
 =?us-ascii?Q?oCpcOvYXpaRqDea3x5WAaDbA08pc7ShifRqWE+lgk2whcz4h4mPEiUxSjaXy?=
 =?us-ascii?Q?Gwna5lV87eLFKVBwNlq46ecPT0Z71WYnhrr++pGTn3U8ZH/OIqqFm7wTKIIO?=
 =?us-ascii?Q?9nFDUpbfDZZ6fe2PY8XxHX0OFTz/CMRSVvsDGntaRUeBJxHz86YRaLa/oO84?=
 =?us-ascii?Q?BOLAspPb5MgTfylALFecJho1AWMzVswo4sHfjL+Ix72L5ri+nLF8euV0fuk+?=
 =?us-ascii?Q?J8SvkBJ/bZyujV+9vqyQUYLsbgPbtVG+HGwjzbhfWWmgOZt+hwFIK+M0dXW9?=
 =?us-ascii?Q?D7I3O/1L1vbse6FZL0M4nJiGYIpFKB1p9ZpNrL3rJAklDj/J7R8rNZiL9vBT?=
 =?us-ascii?Q?LQvIBhw1/hu2sb4E5fx0IOsIwnCqIvSteNDwdrFcPmE14tOtC2YI6qRCp8Hk?=
 =?us-ascii?Q?qMxASh7IAmxC0h9zQ+xJgVwkh2Ie4DuQCSSN3jT6gMqQr4NBdytsESEdkPij?=
 =?us-ascii?Q?U3lYFviy0Z6E+1O1j3Nmau9pGc+bWuOhiXeA6jpfsOAtAIqGkFUVMmvVhvPj?=
 =?us-ascii?Q?czx+yUXrQtvNHNy0LyXbPIGAYxGRGqKqU4I84yoOTgn+erTQzy9J2CEPR2hT?=
 =?us-ascii?Q?9g=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6666a388-232d-44d5-7b21-08dd9901f1ae
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:26:18.6964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cyApyrT4rVbw1h1MPqbjTjtsjK3PHAn7qKJQRhBOSqFAapKJep7Hfx+amtvbw7xEhUMYLvldcCQC6izX4NJ6vwHpzLQhCxiUhwA/fAbR6tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB2872

From: Jackson Lee <jackson.lee@chipsnmedia.com>

Since applying "Reduce high CPU load" patch, SError of kernel panic rarely
happened while testing fluster.
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

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-vpu-dec.c   |  3 ---
 .../platform/chips-media/wave5/wave5-vpu-enc.c   |  3 ---
 .../media/platform/chips-media/wave5/wave5-vpu.c |  2 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c    | 16 ----------------
 4 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 421a9e1a6f15..b4b522d7fa84 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1865,9 +1865,6 @@ static int wave5_vpu_open_dec(struct file *filp)
 	if (ret)
 		goto cleanup_inst;
 
-	if (list_empty(&dev->instances))
-		pm_runtime_use_autosuspend(inst->dev->dev);
-
 	list_add_tail(&inst->list, &dev->instances);
 
 	mutex_unlock(&dev->dev_lock);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 52a1a00fd9bb..7f1aa392805f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1779,9 +1779,6 @@ static int wave5_vpu_open_enc(struct file *filp)
 	if (ret)
 		goto cleanup_inst;
 
-	if (list_empty(&dev->instances))
-		pm_runtime_use_autosuspend(inst->dev->dev);
-
 	list_add_tail(&inst->list, &dev->instances);
 
 	mutex_unlock(&dev->dev_lock);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index a2c09523d76b..24a9001966e7 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -368,7 +368,7 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev, "Product Code:      0x%x\n", dev->product_code);
 	dev_info(&pdev->dev, "Firmware Revision: %u\n", fw_revision);
 
-	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	wave5_vpu_sleep_wake(&pdev->dev, true, NULL, 0);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index d7318d596b73..1f7f4d214b3c 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -207,8 +207,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
 	int i;
-	int inst_count = 0;
-	struct vpu_instance *inst_elm;
 	struct dec_output_info dec_info;
 
 	*fail_res = 0;
@@ -265,12 +263,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	}
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
-
-	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
-		inst_count++;
-	if (inst_count == 1)
-		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
-
 	mutex_destroy(&inst->feed_lock);
 
 unlock_and_return:
@@ -738,8 +730,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	int ret;
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
-	int inst_count = 0;
-	struct vpu_instance *inst_elm;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -782,12 +772,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
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


