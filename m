Return-Path: <linux-media+bounces-39487-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8A9B21BD9
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 05:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAEBF62801D
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 03:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF4722DCBE0;
	Tue, 12 Aug 2025 03:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="iIs9rAbA"
X-Original-To: linux-media@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013005.outbound.protection.outlook.com [40.107.44.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C6E1E1C22;
	Tue, 12 Aug 2025 03:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754970877; cv=fail; b=La+RJHjt3vCWi7mJHCI6Lu+ceGjWz9t+/7KxNv8iVMR+bTwi6/YK3qr0tmwljdduE7FnQtjaCcL5tBsUyAwDsbQc8056ozhOjTdiQg4ZZT1trk4jLs+IRlxkkVTcyEPVMZ5Wcgdnh23HlWjrTPiqPpJISHplHrJvEqVTxJseWXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754970877; c=relaxed/simple;
	bh=wLojaKhshPaZh/a3MlEKHLwOeSfeIXV6wYeLrWcGcrM=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=BMTzq7npYQZ/7nmr9qldQuQ+iGdl0j3zHZYusS5O4HtSbvx8C0A6In0NgRxOTIHXCgHfdfJccX+UmLqSJcAnkvzWORZViRrCvfcF3EocH4DI2Zu/G7iosOtie/56iNC+QHvvL/9V2dEVXN8Ucm/XswGhHCOHZWAabPg3rdLigJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=iIs9rAbA; arc=fail smtp.client-ip=40.107.44.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRJ0PSGqI1zDBhRtsZBRzMdGWnLR8H48lNq5ipmzFStUqh6+rYZoZk9eN8XyFCM6/rnuW/xWW9LAHmJYvxowJeDDbe9PuAD3BShD+auWYK9nG3Biom86pnwmmcH+feBfdCfJJ6qJv2BrDyRhVz6HzU+7fbPr7mDzKiJRBZ9EuN0SmubRmTVe+mR8EiKuIZX8qn5XRX/e1Qcugjqbm7CfeaXlL7dqtsPGCLk4Kxu7XfVkg04MzUJRmVkx1CLn3DeW25G7b6oOCux0Cz5GTuTqveOPYkSJuP00uY5xz6zRnZqM0Q1lUbM3lZula2T22oJ0y4y9Xomgl4a/9NowIPisiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3iZ9gb8NRV7SnzlUd9qOJ1SaPxhdMiwCsjPvv3/8kFk=;
 b=ovYey+h+pC3mkQ3xQ+SvT83s2ZldjjGQhqC1vA8IMTL4uwJMI+O5lHxdo0s82HTk+84j4ff+UTJebbdhsvR6eWfbsOwvAazfRvFoOp683uI13W8kNfVUUtsb1oKJu71ap2aBJVMaGdx1Z8+qAEHzk+7JZtDcYMTDeU8PBfBcvsDSba1xQyFJaeHXuh2IM44+8hDFDgaQ1HARcMqztqTSQo76dSFeDw+em4CqVMN76ZYAHYE0RJECPYig9PXLJKVg2HbxtiuMSStAHgBpCNT68+0440SLABKfE0W2Mnp1fHNlYhvVt4hbcn/pU4RJd0Qen/oC8ke30xp7Mf7iXnw0Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3iZ9gb8NRV7SnzlUd9qOJ1SaPxhdMiwCsjPvv3/8kFk=;
 b=iIs9rAbAr8dP9zEhKs5N+iZ/0QjwTclWnUD1AvgGHhzz7VlWsHB90XmsOjebDNKAsiTOJI9756Pk1ccTSDn+QjT2bKU8FeaoCw4mlFelUBDSdrHeis1FpJbiKTEPBWv4LdlCJ2J8JDfGUCfTKmvudR0q9tajWZAhM2/SCqGfEGVBhq5domUysXzZQ1Eg3GmBrHKTN077Dad5PDY9CInnvQXlpAf62QwjC3gHm/FmndENipUXFxLmAsSgBrcvR+pe4d8Un00X/gHAkTlApz5qcAZt/blrFymBe0QjNUd7kTFdSJg/11W+OWJVMgUzc+LbjyRJznJ933LveIB0F80ZAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYSPR06MB7046.apcprd06.prod.outlook.com (2603:1096:400:46b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.21; Tue, 12 Aug 2025 03:54:30 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 03:54:30 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Akihiro Tsukada <tskd08@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	"jieqing.wang" <standback@126.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-media@vger.kernel.org (open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/3] media: use vmalloc_array and vcalloc to simplify code
Date: Tue, 12 Aug 2025 11:53:01 +0800
Message-Id: <20250812035310.497233-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYSPR06MB7046:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d83c30b-2753-4793-7226-08ddd953f0f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8jl+gRzA4KA1VJPb0TEV8o3cuP9OaaUGoHZwN0UBv0W5xtxhG62Srlt//Jyh?=
 =?us-ascii?Q?Jut5b7uEkRq4DdBtImYzvGOS8ItLCgj1zL6euM6P2mflrxRnsHiElDRMCzDi?=
 =?us-ascii?Q?hx1qX46CLURa6+vMuCuVwBMgn5hfTY+sRooBmRjAKzW/Nm9fevzppA2C/feG?=
 =?us-ascii?Q?98JapU2JZJTZMQ1JyNu93FChBtsfs7sOmDk2ut31XX1jPDKsQXq6zrgwfBkY?=
 =?us-ascii?Q?ugDZRi8l6l0vLojEHAg4JMeRZyVE7v9/Yl3RJgUnvr49Pn6S7ol35z2VDhIZ?=
 =?us-ascii?Q?G5cVAPHUPTZWcpQj0BXzhB9Q7Gs2Nl1oo0qiG09FUoLyPPLHdbgn2/z/ZFXv?=
 =?us-ascii?Q?JPOuwdH/NJN4joZbj9SVCCYATSsbl3s5w+9vW3dfWNleTZlcvV+zW/RdiNGd?=
 =?us-ascii?Q?1nrr9NpkeIfbFaRHDO/SEREDAWgmgOzipWEkHbPu4+gYmxmzE2tc3hR+qOVN?=
 =?us-ascii?Q?TkkdF1EJeE3YK5VmdRT/GtfUMfqSDyHvp+kd7WT4Z2CfprFdSsW4IOOFh1Xc?=
 =?us-ascii?Q?pPBLB2JIDFpeHCMsHXWDB/kx/0b7VjVi/clTQGjaPbaA+o8fMf072DaIKFcM?=
 =?us-ascii?Q?yjug1LHKDVUa6NZAtDy/27QSR1dhOwRglA4UiTIoi5bZ6Ww8JIyyZ86/+NYD?=
 =?us-ascii?Q?XdGL3Z8+ECC7EmTncqq6MhiXTskN37DAwltGz1voj6q8h0NB8ztbvpeKKS0z?=
 =?us-ascii?Q?n8IO0QBkQPqxXZYFZ2zSewuX4pzXbcxxkqRkhs1ZfkDHZ11IyyfzJudxSlVH?=
 =?us-ascii?Q?Qx8rESs0x04zPREmu40CR9KVd9OtcX++FNIi+S/MVUsv6TUWpfYC/myYHn8Y?=
 =?us-ascii?Q?+i1/800T5dtgGLxxARwI7mcFg7TE0rvJj5sq5zmYd7PsjxSnzTdCxw6r6OHp?=
 =?us-ascii?Q?J9o0O03AtIKfMRuEwYQr1j/HSFvEwTOrNrfyTnY9vkUVkbODD6PerIUXv+bb?=
 =?us-ascii?Q?WJNRogepl4KSW/jqpRnM6vJv5iiw5yV7E0ooGR52Im84R2AL5kdz6m5b5OuV?=
 =?us-ascii?Q?m1dNqnpsqjG/+CV4NO0n7C1khZLn6kI9YRW3Sg86emYfpvQ77CSUyRNDePbz?=
 =?us-ascii?Q?FcUy2HGtwQ4rADx3mZxnWq8dmYbyNQ1bs0qmYgVJO522I4vjidCLeXJQxl4d?=
 =?us-ascii?Q?NvahQw77egx1P0uBFoP9j4Cjnj8LsW+5+JXSI15x0MieaYPrWI/jWaLxzxzd?=
 =?us-ascii?Q?2eQVTHoGM+5mVJWw80RgcbSSEV3KYYqfZw1REtZzwdFzxIrp1LdI+2VxMn2r?=
 =?us-ascii?Q?xBzmVybV7UG2zgqprkLI02WIEYyXkX3rRAGGFEN4zdoTdZFlaqaPXldIKjHi?=
 =?us-ascii?Q?x/r8JnMupgPVhmgfh75ZXYyCZMvjfA3C3A+BolQiu+8LSQwz69GW6g5vBSs0?=
 =?us-ascii?Q?VWtbOSQXvMYgCJoKUJs20MxydpNlZzDDPQh6mRiesimrTSX0baDPAnz5SqWa?=
 =?us-ascii?Q?FvINX099m/bRjnPDZGW8CT9UXZbQbEafJXWU4ZBkkFNjtiBCD1OyAw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bN1mgFmOAv22nWAhDlfBg8Usk7qyusxv7ELeE05PW/L2bsExVj0FYMP2D2jq?=
 =?us-ascii?Q?XhEWMzfMP8+SnG9tfFhisgoPA+eZu00p/0v0lTXOmkJHj+ggzFRVf0LRgAZh?=
 =?us-ascii?Q?cxK+4O3IuMc9LfpRxq0TqFWSR/dvMzsGvnE5oM0VeHWrOoFV8mTAbK4iKoy+?=
 =?us-ascii?Q?vAcIbaVHCYGAGVi97McemAijheob9ENlpGKxEfKIs0NzGwrrx7L2RCS9iQr5?=
 =?us-ascii?Q?hR134GBR/NnBzRR4ETkY3Gc5jLQoB5/H+IJIMqsHAX6GixgCgSAfW7JrMKJa?=
 =?us-ascii?Q?Ca6pCsKVSGt8oYydYO+ADgEwPwJJaCH6LyviJoZ3KSSXD7TN4/WefA6AWtOP?=
 =?us-ascii?Q?PH/KV6znH2OjUzX9M4jXseaC9UlItms3fgyTEDQLQUHcJSQCKLUJgPqzRzXh?=
 =?us-ascii?Q?YJSqPyAyz4PBgjErCdn4PYzT2Kj6DP89kKoMYcV8qcT+HdAVjhGoH7T0llnJ?=
 =?us-ascii?Q?Frmo4JEH6LXODfcRdRDo8J6A/77ALsKAHOB5wtbrIPqeLkSGgMQ6+Sk2aY1L?=
 =?us-ascii?Q?+hGvsZbh+A1gT/rsKevTxq3uJ2v5/iIpcAXFUEY6twD9EI0s1f78vDBiK/Bc?=
 =?us-ascii?Q?6gS2CPasFD4LeyA+bxz9MEOcBPbTCLRTlyI6UIZD6ynAr062isqAHdtlhVa4?=
 =?us-ascii?Q?7hV+a0K/J373YBmUL22Q+rKu7JQIZu8HSBiCe95owu9ReMtsXTcKLmbutIbw?=
 =?us-ascii?Q?MI/7lE3mBnHa5Jr+ww6pwAS5Bst/J1ZThpIQc85vsEqSPM0WfULe6kW1bE2V?=
 =?us-ascii?Q?L2rLK0WPfuz6gd5eS5M2MC1Pix2wNZ+HYqyjisa3HtYNQtNL2Jom2toAffNT?=
 =?us-ascii?Q?CQ22u3yB0Xi3eIH4UnLKSdH4lRb/rtUR8o2is48SdGZ0nOScIDJdWFmZDSlz?=
 =?us-ascii?Q?RuzMU14VSg0Kz+gBT9MFMcd8c5LTnnd+0WUekcb4KuDVy0p2SOlWa1Tlm2e1?=
 =?us-ascii?Q?dXe/pE3UTZIHNntxRpy978J3HjpDC1mA0+Exk288/iGXu/3w1v9d4SYhsCpz?=
 =?us-ascii?Q?nmnLpc725Egzno1FVfDPSddlaNnorvDxwm22G7j6dvVII8hS9ejtPYuEh3W/?=
 =?us-ascii?Q?umFhJSrFn+K9UNBjASmUrluwr51vb1/cbTco9NjGYZ4CPM9aH+QktFPcDCeM?=
 =?us-ascii?Q?UanA30NjR7D5hQ6vFcWHWO52nPFOBeZrczAAX/FQgoJCLH9Y3a9ZdU4uMRup?=
 =?us-ascii?Q?Kfmgwfrm59mrQi0GekrXQqNWmeFhJA6c3tlbajI686G/AwHi+bMCPD4BOXJi?=
 =?us-ascii?Q?0dk0XQN4rarh/n8DArlEkMI5I2tldGfYBu0jliYPXZvA/uvIuE1lJD5r0hdu?=
 =?us-ascii?Q?sf6WQCVmA+1Lb+s2cfhiSJpkgHcHiS1nf9BaoIxRXjNI/RxpOZDjBPCOiuC/?=
 =?us-ascii?Q?hb03fz/hZJ1DjhqYGD4/lEDZS0fKa7VR03ddYtzFvSvIz43rDjL3pu8hjndC?=
 =?us-ascii?Q?pKydrEplLazxdvDY9T5DyWEc9hXC8VzITR65uDTjB9EbMNHDN2Ucrf0NyHRk?=
 =?us-ascii?Q?vRlDGCsSBN5AMExdvKjgTfgNgjxAkQ8agjyroiSaqDyNzLGfS8jIONbbpMtd?=
 =?us-ascii?Q?TI7vS2j4d3y329tdzQPFehD7pPuEw1Xhh9lSMHDp?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d83c30b-2753-4793-7226-08ddd953f0f8
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 03:54:30.8319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KdDV3XzXRSQpfetDJICCuWyOpSVd2ae8pQF3YRodQ5QnUVC2qck4/Z/lYJQHLcgGqX0o1IWQH7Q9ZA9zlsQN7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7046

Remove array_size() calls and replace vmalloc(array_size()) with
vmalloc_array() and vzalloc(array_size()) with vcalloc() to simplify
the code.

Compile-tested only.

Qianfeng Rong (3):
  media: dvb-core: use vmalloc_array to simplify code
  media: pt1: use vmalloc_array to simplify code
  media: vivid: use vmalloc_array and vcalloc to simplify code

 drivers/media/dvb-core/dmxdev.c               | 4 ++--
 drivers/media/dvb-core/dvb_demux.c            | 8 ++++----
 drivers/media/pci/pt1/pt1.c                   | 2 +-
 drivers/media/test-drivers/vivid/vivid-core.c | 6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.34.1


