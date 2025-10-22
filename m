Return-Path: <linux-media+bounces-45204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35070BFAAE1
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 09:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D29BE421229
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 07:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA18D3019D8;
	Wed, 22 Oct 2025 07:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="MSTEhaE7"
X-Original-To: linux-media@vger.kernel.org
Received: from PUWP216CU001.outbound.protection.outlook.com (mail-koreasouthazon11020102.outbound.protection.outlook.com [52.101.156.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B8E2FD7B9;
	Wed, 22 Oct 2025 07:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.156.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761119263; cv=fail; b=JiMxD1xzOvNZX/U83EE5kNMr3/iBArFP0GUNFKhlS8ZzfKeqOpo7Z4L2qiIkRGj9esui/kpS7QYCkubbu57Qmg3T8KH/znC8zIX7Pa5c6qoEZpiXQSrJmRVQShXVfxpvqStxC/SXQcrmtZ4XVUy9WZJ17IQ7H6MbxIrCi28Wswo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761119263; c=relaxed/simple;
	bh=kekuOgaQY26Vy+zK/vyshQnjyjjYdA19Rqnr1fqCfFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZNXmhCd/8Snkc4DWfJSY5Able+RNpA0AEdQvTr497a7ziBfHLLLgafmdneG6Qexqsj6CKPTw5FX3qJMxQCNvOxXmUVe6xNd2vBt32Zksfw7kluPyfqHD1+2s0wZoZA9mSHHGz7MWXJlTxPPi97gfEcDgpuNzojiurJv/kd9yDaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=MSTEhaE7; arc=fail smtp.client-ip=52.101.156.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bRuTHecEFiF+o0ljjhzi5p+VmgUuxvxhRz/yEnWVQ8SP4ge+eUzwoCECWIuAtjmbZhmCX1lk/vvIR1uL7nSTYaXkeh95OdMMgn6jGQGYgbn53DfCKBrSY8WglgzsWwEIPWfHMAC2s9z6DQrbM4jQihA6MbZWC9bzqmSmZ0GL7FV2ArxOwNP7TH5E7GGv0tdkPASp/casAAApl/YwrThLVwi2NouBzz8Fcjzr96jDzlTW+ene364/HKA9T95kyta8vaSWpSq1bAzfxIaLFsCmT5w3PW0IqQSW71uTBMNcR2fwQ7ENpZ/vtQfrrf0mqoDAZYkr5oHHH2yJJ5uPyAjjDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uof5P0usYfT80n2nwSHOgY4mwQHPpR7KIa6h+i17SGs=;
 b=msgSNylRb8j1zKo/hZL/jSA1tn9dPlolvzVO/hoOIIH65VS5XTNv6bDQfJFnCrwBEri6qTwlswxOFod9QExt9Uz4BY+SpzesW4Za71tFuIaoanhHY2JhixiCtNT1ZrIwk5dPot35JhW0U93ZwQbvV6ZXzOUzx4cY+SLKXwS8SQQVfwj0/C1M2ov4ne3/cOan7imHSk9LjwWcfn+5ovhovDO48fICJIn7Ej2M7cvMHs66cnx0uxEdf/IpujMAWiOpDI0V9tUjc2+G2nlf+VqahhSs26Xy8INkhTKvsXoXBfEXwgFTUMGfkaNbH9o/3xnfLoeMULxOiIrnDc+WrsRe9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uof5P0usYfT80n2nwSHOgY4mwQHPpR7KIa6h+i17SGs=;
 b=MSTEhaE7CQnZQNQFAm/4Kop27EqRn2g7yvucc5XNuMDJR9YMi9VGRcIChyHCT0asQTE7KY7XHFTdApIRHf2ujW1ZKQlpuQUXsMmLFt+ai8N3L69d9++g4OYebWHr315JpfiP95cX6iLB1o803p5xxydJ/jSXDRrG2V6/6LAPlbk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SE2P216MB3135.KORP216.PROD.OUTLOOK.COM (2603:1096:101:28c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.12; Wed, 22 Oct 2025 07:47:25 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%5]) with mapi id 15.20.9228.009; Wed, 22 Oct 2025
 07:47:25 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	marek.vasut@mailbox.org,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Ming Qian <ming.qian@oss.nxp.com>
Subject: [PATCH v4 3/9] media: chips-media: wave6: Add Wave6 VPU interface
Date: Wed, 22 Oct 2025 16:47:04 +0900
Message-Id: <20251022074710.575-4-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251022074710.575-1-nas.chung@chipsnmedia.com>
References: <20251022074710.575-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0122.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::6) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|SE2P216MB3135:EE_
X-MS-Office365-Filtering-Correlation-Id: 4489d4ec-798a-407b-99da-08de113f3dd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oqwOlLYFnd/Qr0zgdTaAQD+tS5T6X49PlfDrcHmiVtTzt97hKhWHDjS0Gng0?=
 =?us-ascii?Q?unOiWv0pH/7JYvewi2302XO54rt985NO6y3UCoiUOx43vXMYA5n1Y+lkWWS/?=
 =?us-ascii?Q?5jVkElXdsAn3mhrHG5rqJHEeftKPJtcKegE+PaPX9lTgqfW0TOfRa5bJJJCh?=
 =?us-ascii?Q?i9PgkwTyoOE9Tk/3M5C3vg1XHQVVnfRI2u+UWSbx4D42iGedtgkxygulVNu0?=
 =?us-ascii?Q?fFov1xFTxbAP/q19TNYqW11zvqyEbUgEcPVdoAHCFJsM8Vp8yqQ6Ol4FTc3G?=
 =?us-ascii?Q?/QDlOQDRQEoDFT8eu5gcg/Xau5xdt5HaoIGRCZ1Vp18XVkNWkym3BpsPNOOm?=
 =?us-ascii?Q?qrg4fdZiJVSapQ1l8wn4DY57uZTIRXwU4jTQvdAbh3qlfmCG+G8j5E1GTVAZ?=
 =?us-ascii?Q?3kniD9wIwDKpmAEgBKVxqoZLBEYv5hk3toQdWG4UgZGGNtzGI3ljRflneZvW?=
 =?us-ascii?Q?apsM3Uf/0YjGWZwk2l64E8Z74gqP0+tCm7VW60ADS6GC7YmYwq5403xZd0JT?=
 =?us-ascii?Q?x2BfYJdJfMt6dcODTsGb5DUPWEa0sXQ+EAc5d2F1VmBt/oEbVdX/2K6sK6TG?=
 =?us-ascii?Q?gqZOsUZ5tYQFYJmQy6k63qQbqtBb/4GJCpU+qJ1Qj+oOYgjXDJMNdIllYkuQ?=
 =?us-ascii?Q?aVLG95ThpqwWlga2NueuHPzVBL5wB5tbRmLdCUhXD51JUQAgEod8IjPc4+Eo?=
 =?us-ascii?Q?SMUpK+Ib3cB/ijVvmba5dvyn6v0B3xdlcLLIpB+f9L69HD62eiEX2znch623?=
 =?us-ascii?Q?z54Ua6msakyLdROycEAjtJHjpEVXtxC9xseifjODo6cqymUan16GbjA/Z1yw?=
 =?us-ascii?Q?ij3SIG3feYuPT7jsXqpUqPVDymMneiyK3nczPceqSf4xdc3ZxPVi+4k5en0G?=
 =?us-ascii?Q?KHU1bfGLbu7ooqZQ+huEGSrSHga/4lIcoCix4Wt49o66+yGurvxSgoAyCN9E?=
 =?us-ascii?Q?cNeR2Dw3ESIWWsf7Gxr7ptjaK0VjFfTBxs6U64le0uNDJQBJJVoosn8jklU/?=
 =?us-ascii?Q?lXt2jssgFk8bPs30OYREsrVUC5MR33gAlGST2TjbdTL/g7KvlJhjlSzLQJ4W?=
 =?us-ascii?Q?Knc/se07tXDm20wUE5ly+YdNiSY8pYq3x3Yl7DvM79dhgkvsoHnrvsjIR2Tr?=
 =?us-ascii?Q?oQ7qET854ypu5U7Y8oqb33YJH2j72d3oImcVrYxFy7/4F9YmKOFBxN1EYffE?=
 =?us-ascii?Q?CeKIlGKTU/iFaqXFSZimjGn1WwuesE68fmXQ18tAzuCuSkLA/8++c6xUxEea?=
 =?us-ascii?Q?LGqFwBuM2+zppzTXFzbnmRaZZYzwJfESAeRiIf6m0AOMjlYzm7lBFEgXVRyq?=
 =?us-ascii?Q?crIRZ75Uaej+OT4QW3JY8NArdlCrRrPRwEs/OSSghIqSagZA/LOa/mI4H+VG?=
 =?us-ascii?Q?RkkHiS/qqxBTl+qIRJqQTmEPgKNjqM9dinNmsTkp4EcGtrgtKIWdr/AW9vet?=
 =?us-ascii?Q?CncjWyR0F1ZjiGxzW+rEdh2yecFNeNxmFYqN9/QXKGzJYKm5lCHSTtt1UmEj?=
 =?us-ascii?Q?3wxXYvoYIrp5qfIXLnmJf2QwFuQ0b3JVUMMX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R7Z0Ni8Bv5nyFw90GAQdh8cp/mjUceTsJoyZISuOzCEgapTALS0QqDk2QmRF?=
 =?us-ascii?Q?ecUj1bo902TFlKqeNvKNOZDbgC9n6oTmPX4hovMrQcgY636391oaUgQ7HsiN?=
 =?us-ascii?Q?ntxHBwWejHn6w8uBqJgI+HcFPPs/B13CF5iaRgVZCHZS88B2qLxQZUcQH08B?=
 =?us-ascii?Q?DGmoGKoJyAfQyrl4x6XNPRDUpMltvZEsrHUirJuc/j7tjnTmDqmg5/+bh59e?=
 =?us-ascii?Q?kPQ1nLdYiq4d26GAAtSEeARum1gIFGludwIYJ+5z0RyvykBawBU0P3Mnap2V?=
 =?us-ascii?Q?El/oNQeVO7+FFHlrPtD2mM7GlS4HmMb89tZfaw96I5ae1773M2GjUEWo5K5d?=
 =?us-ascii?Q?BixDHFzI2kS9wp5Y9gZARwriEhvLuALeauqaAd0Au0M3IyuKW0zfYuELrDPR?=
 =?us-ascii?Q?EsM9MPPStH8Kplf/sg2nYsl41teAr3FyQLQKfyVFMwtJmmICOlExrZtg3FA7?=
 =?us-ascii?Q?UQZ5t2fkgaijYROWVZSJgXxv+qvcrUNl1Y3dGPVR+wN0DREtL08r/oj9bHfk?=
 =?us-ascii?Q?OZJkIPnHoI3kWymtQ1/nNUJhTrTl7aTTMLAoytsrH+7vlHhd/ihGZGF58moa?=
 =?us-ascii?Q?9b0zg0KHlHDQNdx8yCehcx8dLztcgsfz1Nlh6sikJ6LOnpyRoStjfGvKwHaZ?=
 =?us-ascii?Q?U8aSfqHpvmu2dz9NFtccjxUuptgdWFsvhn7W895hvW0+yrQWbB4/AMBsMYHZ?=
 =?us-ascii?Q?GMbLBwZvDkfcQIrdelWMHPmknXZWtnOfK76ehIOf6ye4Z9UJvl83crdTVNsI?=
 =?us-ascii?Q?LnQ1hGl41qBYx1iKvOYvKwxXKAW9wk5haaJzs8/qnYMwYkpB3+BgODPCBrSw?=
 =?us-ascii?Q?/Jmj6FyPCRlHpDlEqzKlKWcdIyQ4rBoKZ8EwkQbi5CABnE0pV0dYLeA5gORm?=
 =?us-ascii?Q?B/JAM3Q49hxJ1MA13SzVwNrYrA9Ys0mmYvpSma5CTYAZUujeukiw1SkIoHtV?=
 =?us-ascii?Q?6NhUfa+2vC7scpZU28hoGrbQ6HETbcwMmWnrh4f70pfZsqwbKSqTSXt+f5ub?=
 =?us-ascii?Q?3T8hf7qYkgdexXIdVvczmaggqN/EDhITXltSBfaylW2f1ZvA0JLouReV29gc?=
 =?us-ascii?Q?Wq8KTyfTmghKlf7npPSmTKojVMePRuaPlz4K6k2yc6SveMHKo6asHcdaEo2X?=
 =?us-ascii?Q?uysYIB9VK+LNI9WQw9EKa1E8c4owKJ23aCgfJi9UAGK5HlhOUpR4bmY0gntF?=
 =?us-ascii?Q?tX9sPscOv+bqwu7tU7rXzfzQf+whPg52/MTRJFDWtOGIi34QqAb8kzkiGdL1?=
 =?us-ascii?Q?NZTNrL1ufBA6Zsm27kxu2O/902gxpuMNYtVJ7ViU16+GKPnzb0kzFP6YjQUD?=
 =?us-ascii?Q?2VFF4jsg92t3Ihf2+54rfpaZgQcGNCH2mm5YU6cERXC6+JKog4OK1ERJ2HAw?=
 =?us-ascii?Q?3Hy3c25MfqMIpRBVBOMETxTMmi6A2dLSiD4ScuEvhr8xD6RbD3U7tMHnpRfQ?=
 =?us-ascii?Q?Xr3yLrbr3OoH7U7rMbLsKNjLRPAf9FLAuPeG2rD4ppc7+sMJQ4cYGRckB2ZG?=
 =?us-ascii?Q?oisZDO1JVeeQQMy2XBNVdenS5Zva5N9eJMKpG3GErqODiDQbxwBXJUq2CoVu?=
 =?us-ascii?Q?MRXPE7MJ0cCoD/Z/KriLZ15zmVQi2uuIUCVW1BHPFFf4DU9Li1SSkxvexXnR?=
 =?us-ascii?Q?6A=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4489d4ec-798a-407b-99da-08de113f3dd0
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 07:47:25.3644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtMl4qnjpWot2lxzM0NlFhp+YrxVCLgzzXotGiYe4yEXqsGAHPUw8s2VCbZ/CuxqSuv9XnPYSDHEnuLh7ITN+G9xTaWazme4EJRMa8oSs74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB3135

Add an interface layer to manage hardware register configuration
and communication with the Chips&Media Wave6 video codec IP.

The interface provides low-level helper functions used by the
Wave6 core driver to implement video encoding and decoding operations.
It handles command submission to the firmware via MMIO registers,
and waits for a response by polling the firmware busy flag.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
---
 MAINTAINERS                                   |    1 +
 .../platform/chips-media/wave6/wave6-hw.c     | 2929 +++++++++++++++++
 .../platform/chips-media/wave6/wave6-hw.h     |   73 +
 .../chips-media/wave6/wave6-regdefine.h       |  641 ++++
 .../platform/chips-media/wave6/wave6-vdi.h    |   92 +
 .../platform/chips-media/wave6/wave6-vpuapi.c |  725 ++++
 .../platform/chips-media/wave6/wave6-vpuapi.h | 1026 ++++++
 .../chips-media/wave6/wave6-vpuconfig.h       |   71 +
 .../chips-media/wave6/wave6-vpuerror.h        |  262 ++
 9 files changed, 5820 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-hw.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-regdefine.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuerror.h

diff --git a/MAINTAINERS b/MAINTAINERS
index a57fee506d57..3c8c123ebe04 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27564,6 +27564,7 @@ M:	Jackson Lee <jackson.lee@chipsnmedia.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
+F:	drivers/media/platform/chips-media/wave6/
 
 WHISKEYCOVE PMIC GPIO DRIVER
 M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.c b/drivers/media/platform/chips-media/wave6/wave6-hw.c
new file mode 100644
index 000000000000..69a70416acdc
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-hw.c
@@ -0,0 +1,2929 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 backend interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/iopoll.h>
+#include "wave6-vpu-core.h"
+#include "wave6-hw.h"
+#include "wave6-regdefine.h"
+#include "wave6-trace.h"
+
+void wave6_vpu_writel(struct vpu_core_device *core, u32 addr, u32 data)
+{
+	wave6_vdi_writel(core->reg_base, addr, data);
+	trace_wave6_vpu_writel(core->dev, addr, data);
+}
+
+u32 wave6_vpu_readl(struct vpu_core_device *core, u32 addr)
+{
+	u32 data;
+
+	data = wave6_vdi_readl(core->reg_base, addr);
+	trace_wave6_vpu_readl(core->dev, addr, data);
+
+	return data;
+}
+
+static void wave6_print_reg_err(struct vpu_core_device *core, u32 fail_reason)
+{
+	char *caller = __builtin_return_address(0);
+	struct device *dev = core->dev;
+
+	switch (fail_reason) {
+	case WAVE6_SYSERR_QUEUEING_FAIL:
+		dev_dbg(dev, "%s: queueing failure 0x%x\n", caller, fail_reason);
+		break;
+	case WAVE6_SYSERR_RESULT_NOT_READY:
+		dev_err(dev, "%s: result not ready 0x%x\n", caller, fail_reason);
+		break;
+	case WAVE6_SYSERR_ACCESS_VIOLATION_HW:
+		dev_err(dev, "%s: access violation 0x%x\n", caller, fail_reason);
+		break;
+	case WAVE6_SYSERR_WATCHDOG_TIMEOUT:
+		dev_err(dev, "%s: watchdog timeout 0x%x\n", caller, fail_reason);
+		break;
+	case WAVE6_SYSERR_BUS_ERROR:
+		dev_err(dev, "%s: bus error 0x%x\n", caller, fail_reason);
+		break;
+	case WAVE6_SYSERR_DOUBLE_FAULT:
+		dev_err(dev, "%s: double fault 0x%x\n", caller, fail_reason);
+		break;
+	case WAVE6_SYSERR_VPU_STILL_RUNNING:
+		dev_err(dev, "%s: still running 0x%x\n", caller, fail_reason);
+		break;
+	default:
+		dev_err(dev, "%s: failure: 0x%x\n", caller, fail_reason);
+		break;
+	}
+}
+
+static void wave6_dec_set_display_buffer(struct vpu_instance *inst, struct frame_buffer fb)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	int index;
+
+	for (index = 0; index < WAVE6_MAX_FBS; index++) {
+		if (!p_dec_info->disp_buf[index].buf_y) {
+			p_dec_info->disp_buf[index] = fb;
+			p_dec_info->disp_buf[index].index = index;
+			break;
+		}
+	}
+}
+
+static struct frame_buffer wave6_dec_get_display_buffer(struct vpu_instance *inst,
+							dma_addr_t addr)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	int i;
+	struct frame_buffer fb;
+
+	memset(&fb, 0, sizeof(struct frame_buffer));
+
+	for (i = 0; i < WAVE6_MAX_FBS; i++) {
+		if (p_dec_info->disp_buf[i].buf_y == addr) {
+			fb = p_dec_info->disp_buf[i];
+			break;
+		}
+	}
+
+	return fb;
+}
+
+static void wave6_dec_remove_display_buffer(struct vpu_instance *inst,
+					    dma_addr_t addr)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	int i;
+
+	for (i = 0; i < WAVE6_MAX_FBS; i++) {
+		if (p_dec_info->disp_buf[i].buf_y == addr) {
+			memset(&p_dec_info->disp_buf[i], 0, sizeof(struct frame_buffer));
+			break;
+		}
+	}
+}
+
+static enum chroma_format_idc get_chroma_format_idc(enum frame_buffer_format fmt)
+{
+	switch (fmt) {
+	case FORMAT_420:
+	case FORMAT_420_P10_16BIT_MSB:
+	case FORMAT_420_P10_16BIT_LSB:
+	case FORMAT_420_P10_32BIT_MSB:
+	case FORMAT_420_P10_32BIT_LSB:
+		return C_FMT_IDC_YUV420;
+	case FORMAT_422:
+	case FORMAT_422_P10_16BIT_MSB:
+	case FORMAT_422_P10_16BIT_LSB:
+	case FORMAT_422_P10_32BIT_MSB:
+	case FORMAT_422_P10_32BIT_LSB:
+	case FORMAT_YUYV:
+	case FORMAT_YVYU:
+	case FORMAT_UYVY:
+	case FORMAT_VYUY:
+	case FORMAT_YUYV_P10_16BIT_MSB:
+	case FORMAT_YVYU_P10_16BIT_MSB:
+	case FORMAT_UYVY_P10_16BIT_MSB:
+	case FORMAT_VYUY_P10_16BIT_MSB:
+	case FORMAT_YUYV_P10_16BIT_LSB:
+	case FORMAT_YVYU_P10_16BIT_LSB:
+	case FORMAT_UYVY_P10_16BIT_LSB:
+	case FORMAT_VYUY_P10_16BIT_LSB:
+	case FORMAT_YUYV_P10_32BIT_MSB:
+	case FORMAT_YVYU_P10_32BIT_MSB:
+	case FORMAT_UYVY_P10_32BIT_MSB:
+	case FORMAT_VYUY_P10_32BIT_MSB:
+	case FORMAT_YUYV_P10_32BIT_LSB:
+	case FORMAT_YVYU_P10_32BIT_LSB:
+	case FORMAT_UYVY_P10_32BIT_LSB:
+	case FORMAT_VYUY_P10_32BIT_LSB:
+		return C_FMT_IDC_YUV422;
+	case FORMAT_444:
+	case FORMAT_444_P10_16BIT_MSB:
+	case FORMAT_444_P10_16BIT_LSB:
+	case FORMAT_444_P10_32BIT_MSB:
+	case FORMAT_444_P10_32BIT_LSB:
+		return C_FMT_IDC_YUV444;
+	case FORMAT_400:
+	case FORMAT_400_P10_16BIT_MSB:
+	case FORMAT_400_P10_16BIT_LSB:
+	case FORMAT_400_P10_32BIT_MSB:
+	case FORMAT_400_P10_32BIT_LSB:
+	case FORMAT_YUV444_24BIT:
+		return C_FMT_IDC_YUV400;
+	case FORMAT_RGB_24BIT_PACKED:
+	case FORMAT_YUV444_24BIT_PACKED:
+	case FORMAT_RGB_32BIT_PACKED:
+	case FORMAT_RGB_P10_32BIT_PACKED:
+	case FORMAT_YUV444_32BIT_PACKED:
+	case FORMAT_YUV444_P10_32BIT_PACKED:
+		return C_FMT_IDC_RGB;
+	default:
+		return C_FMT_IDC_YUV400;
+	}
+}
+
+static int wave6_wait_vpu_busy(struct vpu_core_device *core, unsigned int addr)
+{
+	u32 data;
+
+	lockdep_assert_held(&core->hw_lock);
+
+	return read_poll_timeout(vpu_read_reg, data, !data,
+				 W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
+				 false, core, addr);
+}
+
+void wave6_vpu_enable_interrupt(struct vpu_core_device *core)
+{
+	u32 data;
+
+	lockdep_assert_held(&core->hw_lock);
+
+	data = BIT(W6_INT_BIT_ENC_SET_PARAM);
+	data |= BIT(W6_INT_BIT_ENC_PIC);
+	data |= BIT(W6_INT_BIT_INIT_SEQ);
+	data |= BIT(W6_INT_BIT_DEC_PIC);
+	data |= BIT(W6_INT_BIT_BSBUF_ERROR);
+	data |= BIT(W6_INT_BIT_REQ_WORK_BUF);
+	vpu_write_reg(core, W6_VPU_VINT_ENABLE, data);
+}
+
+bool wave6_vpu_is_init(struct vpu_core_device *core)
+{
+	lockdep_assert_held(&core->hw_lock);
+
+	return vpu_read_reg(core, W6_VPU_VCPU_CUR_PC) != 0;
+}
+
+static int32_t wave6_vpu_get_product_id(struct vpu_core_device *core)
+{
+	u32 product_id = PRODUCT_ID_NONE;
+	u32 val;
+
+	lockdep_assert_held(&core->hw_lock);
+
+	val = vpu_read_reg(core, W6_VPU_RET_PRODUCT_CODE);
+
+	switch (val) {
+	case WAVE617_CODE:
+		product_id = PRODUCT_ID_617; break;
+	case WAVE627_CODE:
+		product_id = PRODUCT_ID_627; break;
+	case WAVE633_CODE:
+	case WAVE637_CODE:
+	case WAVE663_CODE:
+	case WAVE677_CODE:
+		product_id = PRODUCT_ID_637; break;
+	default:
+		dev_err(core->dev, "Invalid product (%x)\n", val);
+		break;
+	}
+
+	return product_id;
+}
+
+static void wave6_send_command(struct vpu_core_device *core, u32 id, u32 std, u32 cmd)
+{
+	u32 reg_val;
+
+	lockdep_assert_held(&core->hw_lock);
+
+	if (cmd == W6_CMD_CREATE_INSTANCE)
+		reg_val = INSTANCE_INFO_CODEC_STD(std);
+	else
+		reg_val = INSTANCE_INFO_CODEC_STD(std) | INSTANCE_INFO_ID(id);
+	vpu_write_reg(core, W6_CMD_INSTANCE_INFO, reg_val);
+
+	vpu_write_reg(core, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	vpu_write_reg(core, W6_COMMAND, cmd);
+	vpu_write_reg(core, W6_VPU_HOST_INT_REQ, HOST_INT_REQ_ON);
+
+	trace_wave6_vpu_send_command(core, id, std, cmd);
+}
+
+static int wave6_send_query(struct vpu_core_device *core, u32 id, u32 std,
+			    enum wave6_query_option query_opt)
+{
+	int ret;
+	u32 reg_val;
+
+	lockdep_assert_held(&core->hw_lock);
+
+	vpu_write_reg(core, W6_QUERY_OPTION, query_opt);
+	wave6_send_command(core, id, std, W6_CMD_QUERY);
+
+	ret = wave6_wait_vpu_busy(core, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_err(core->dev, "query timed out opt=0x%x\n", query_opt);
+		return ret;
+	}
+
+	if (!vpu_read_reg(core, W6_RET_SUCCESS)) {
+		reg_val = vpu_read_reg(core, W6_RET_FAIL_REASON);
+		wave6_print_reg_err(core, reg_val);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int wave6_vpu_get_version(struct vpu_core_device *core)
+{
+	struct vpu_attr *attr = &core->attr;
+	u32 reg_val;
+	u8 *str;
+	int ret;
+	u32 std_def1, conf_feature;
+
+	lockdep_assert_held(&core->hw_lock);
+
+	ret = wave6_send_query(core, 0, 0, W6_QUERY_OPT_GET_VPU_INFO);
+	if (ret)
+		return ret;
+
+	reg_val = vpu_read_reg(core, W6_RET_PRODUCT_NAME);
+	str = (u8 *)&reg_val;
+	attr->product_name[0] = str[3];
+	attr->product_name[1] = str[2];
+	attr->product_name[2] = str[1];
+	attr->product_name[3] = str[0];
+	attr->product_name[4] = 0;
+
+	attr->product_id = wave6_vpu_get_product_id(core);
+	attr->product_code = vpu_read_reg(core, W6_VPU_RET_PRODUCT_CODE);
+	attr->product_version = vpu_read_reg(core, W6_RET_PRODUCT_VERSION);
+	attr->fw_version = vpu_read_reg(core, W6_RET_FW_API_VERSION);
+	attr->fw_revision = vpu_read_reg(core, W6_RET_FW_VERSION);
+	attr->hw_version = vpu_read_reg(core, W6_RET_CONF_HW_VERSION);
+	std_def1 = vpu_read_reg(core, W6_RET_STD_DEF1);
+	conf_feature = vpu_read_reg(core, W6_RET_CONF_FEATURE);
+
+	attr->support_decoders = 0;
+	attr->support_encoders = 0;
+	attr->support_decoders |= STD_DEF1_HEVC_DEC(std_def1) << W_HEVC_DEC;
+	attr->support_hevc10bit_dec = CONF_FEATURE_HEVC10BIT_DEC(conf_feature);
+	attr->support_decoders |= STD_DEF1_AVC_DEC(std_def1) << W_AVC_DEC;
+	attr->support_avc10bit_dec = CONF_FEATURE_AVC10BIT_DEC(conf_feature);
+	attr->support_encoders |= STD_DEF1_HEVC_ENC(std_def1) << W_HEVC_ENC;
+	attr->support_hevc10bit_enc = CONF_FEATURE_HEVC10BIT_ENC(conf_feature);
+	attr->support_encoders |= STD_DEF1_AVC_ENC(std_def1) << W_AVC_ENC;
+	attr->support_avc10bit_enc = CONF_FEATURE_AVC10BIT_ENC(conf_feature);
+
+	return 0;
+}
+
+int wave6_vpu_dec_check_open_param(struct vpu_instance *inst,
+				   struct dec_open_param *param)
+{
+	struct vpu_attr *attr = &inst->dev->attr;
+
+	if (!(BIT(inst->std) & attr->support_decoders)) {
+		dev_err(inst->dev->dev, "std: %d, support_decoders: 0x%x\n",
+			inst->std, attr->support_decoders);
+		return -EOPNOTSUPP;
+	}
+
+	return 0;
+}
+
+int wave6_vpu_build_up_dec_param(struct vpu_instance *inst,
+				 struct dec_open_param *param)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	u32 reg_val;
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	p_dec_info->sec_axi.use_dec_ip = true;
+	p_dec_info->sec_axi.use_dec_lf_row = true;
+	switch (inst->std) {
+	case W_HEVC_DEC:
+		p_dec_info->seq_change_mask = SEQ_CHANGE_ENABLE_ALL_HEVC;
+		break;
+	case W_AVC_DEC:
+		p_dec_info->seq_change_mask = SEQ_CHANGE_ENABLE_ALL_AVC;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_TEMP_BASE, param->inst_buffer.temp_base);
+	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_TEMP_SIZE, param->inst_buffer.temp_size);
+	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_BS_PARAM, VPU_STREAM_ENDIAN);
+	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_ADDR_EXT, param->ext_addr_vcpu);
+	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_DISP_MODE, param->disp_mode);
+
+	reg_val = CREATE_INST_CORE_INFO_CQ_DEPTH(COMMAND_QUEUE_DEPTH) |
+		  CREATE_INST_CORE_INFO_CORE_IDC(SINGLE_CORE_IDC) |
+		  CREATE_INST_CORE_INFO_CORE_NUM(SINGLE_CORE);
+	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_CORE_INFO, reg_val);
+
+	reg_val = CREATE_INST_PRIORITY_SECURITY_FLAG(param->is_secure_inst) |
+		  CREATE_INST_PRIORITY_VALUE(param->inst_priority);
+	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_PRIORITY, reg_val);
+	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_TIMEOUT_CYCLE_COUNT,
+		      W6_VPU_TIMEOUT_CYCLE_COUNT);
+
+	wave6_send_command(inst->dev, 0, inst->std, W6_CMD_CREATE_INSTANCE);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
+		return ret;
+	}
+
+	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
+		u32 reason_code = vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
+
+		wave6_print_reg_err(inst->dev, reason_code);
+		return -EIO;
+	}
+
+	inst->id = vpu_read_reg(inst->dev, W6_RET_INSTANCE_ID);
+
+	return 0;
+}
+
+int wave6_vpu_dec_init_seq(struct vpu_instance *inst)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	u32 reg_val;
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	p_dec_info = &inst->codec_info->dec_info;
+
+	vpu_write_reg(inst->dev, W6_CMD_DEC_INIT_SEQ_BS_RD_PTR, p_dec_info->stream_rd_ptr);
+	vpu_write_reg(inst->dev, W6_CMD_DEC_INIT_SEQ_BS_WR_PTR, p_dec_info->stream_wr_ptr);
+
+	reg_val = DEC_PIC_BS_OPTION_STREAM_END(p_dec_info->stream_end) |
+		  DEC_PIC_BS_OPTION_EXPLICIT_END_ON;
+	vpu_write_reg(inst->dev, W6_CMD_DEC_INIT_SEQ_BS_OPTION, reg_val);
+	reg_val = INIT_SEQ_OPTION_MODE(W6_INIT_SEQ_OPT_NORMAL);
+	vpu_write_reg(inst->dev, W6_CMD_DEC_INIT_SEQ_OPTION, reg_val);
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_INIT_SEQ);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
+		return ret;
+	}
+
+	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
+		u32 reason_code = vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
+
+		wave6_print_reg_err(inst->dev, reason_code);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static void wave6_get_dec_seq_result(struct vpu_instance *inst, struct dec_seq_info *info)
+{
+	u32 reg_val;
+	u32 profile, profile_comp;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	info->rd_ptr = wave6_vpu_dec_get_rd_ptr(inst);
+
+	reg_val = vpu_read_reg(inst->dev, W6_RET_DEC_PIC_SIZE);
+	info->pic_width = DEC_PIC_SIZE_WIDTH(reg_val);
+	info->pic_height = DEC_PIC_SIZE_HEIGHT(reg_val);
+
+	info->min_frame_buffer_count = vpu_read_reg(inst->dev, W6_RET_DEC_NUM_REQUIRED_FBC_FB);
+	info->frame_buf_delay = vpu_read_reg(inst->dev, W6_RET_DEC_NUM_REORDER_DELAY);
+	info->req_mv_buffer_count = vpu_read_reg(inst->dev, W6_RET_DEC_NUM_REQUIRED_COL_BUF);
+
+	reg_val = vpu_read_reg(inst->dev, W6_RET_DEC_CROP_TOP_BOTTOM);
+	info->pic_crop_rect.top = DEC_CROP_TOP(reg_val);
+	info->pic_crop_rect.bottom = info->pic_height - DEC_CROP_BOTTOM(reg_val);
+
+	reg_val = vpu_read_reg(inst->dev, W6_RET_DEC_CROP_LEFT_RIGHT);
+	info->pic_crop_rect.left = DEC_CROP_LEFT(reg_val);
+	info->pic_crop_rect.right = info->pic_width - DEC_CROP_RIGHT(reg_val);
+
+	info->f_rate_numerator = vpu_read_reg(inst->dev, W6_RET_DEC_FRAME_RATE_NR);
+	info->f_rate_denominator = vpu_read_reg(inst->dev, W6_RET_DEC_FRAME_RATE_DR);
+
+	reg_val = vpu_read_reg(inst->dev, W6_RET_DEC_COLOR_SAMPLE);
+	info->luma_bit_depth = DEC_COLOR_SAMPLE_L_BIT_DEPTH(reg_val);
+	info->chroma_bit_depth = DEC_COLOR_SAMPLE_C_BIT_DEPTH(reg_val);
+	info->c_fmt_idc = DEC_COLOR_SAMPLE_C_FMT_IDC(reg_val);
+	info->aspect_rate_info = DEC_COLOR_SAMPLE_ASPECT_RATIO_IDC(reg_val);
+	info->is_ext_sar = info->aspect_rate_info == H264_VUI_SAR_IDC_EXTENDED;
+	if (info->is_ext_sar)
+		info->aspect_rate_info = vpu_read_reg(inst->dev, W6_RET_DEC_ASPECT_RATIO);
+	info->bitrate = vpu_read_reg(inst->dev, W6_RET_DEC_BIT_RATE);
+
+	reg_val = vpu_read_reg(inst->dev, W6_RET_DEC_SEQ_PARAM);
+	info->level = DEC_SEQ_PARAM_LEVEL(reg_val);
+	info->tier = DEC_SEQ_PARAM_TIER(reg_val);
+
+	profile = DEC_SEQ_PARAM_PROFILE(reg_val);
+	profile_comp = DEC_SEQ_PARAM_PROFILE_COMPATIBILITY(reg_val);
+	if (inst->std == W_HEVC_DEC) {
+		info->profile = profile;
+		if (!info->profile) {
+			if ((profile_comp & PROFILE_COMPATIBILITY_MAIN) &&
+			    (profile_comp & PROFILE_COMPATIBILITY_MAIN10))
+				info->profile = HEVC_PROFILE_MAIN;
+			else if (profile_comp & PROFILE_COMPATIBILITY_MAIN10)
+				info->profile = HEVC_PROFILE_MAIN10;
+			else if (profile_comp & PROFILE_COMPATIBILITY_STILL_PICTURE)
+				info->profile = HEVC_PROFILE_STILLPICTURE;
+			else
+				info->profile = HEVC_PROFILE_MAIN;
+		}
+	} else if (inst->std == W_AVC_DEC) {
+		if (profile == PROFILE_H264_BP)
+			info->profile = H264_PROFILE_BP;
+		else if (profile == PROFILE_H264_HP)
+			info->profile = H264_PROFILE_HP;
+		else if (profile == PROFILE_H264_MP)
+			info->profile = H264_PROFILE_MP;
+		else if (profile == PROFILE_H264_HIGH10)
+			info->profile = H264_PROFILE_HIGH10;
+		else if (profile == PROFILE_H264_EXTENDED)
+			info->profile = H264_PROFILE_EXTENDED;
+		else
+			info->profile = H264_PROFILE_BP;
+	}
+
+	reg_val = vpu_read_reg(inst->dev, W6_RET_DEC_COLOR_CONFIG);
+	if (reg_val) {
+		info->color.video_signal_type_present = true;
+		info->color.color_description_present = DEC_COLOR_CONFIG_COLOR_PRESENT(reg_val);
+		info->color.color_primaries = DEC_COLOR_CONFIG_COLOR_PRIMARIES(reg_val);
+		info->color.transfer_characteristics = DEC_COLOR_CONFIG_TRANS_CHAR(reg_val);
+		info->color.matrix_coefficients = DEC_COLOR_CONFIG_MATRIX_COEFF(reg_val);
+		info->color.color_range = DEC_COLOR_CONFIG_COLOR_RANGE(reg_val);
+	} else {
+		info->color.video_signal_type_present = false;
+	}
+}
+
+int wave6_vpu_dec_get_seq_info(struct vpu_instance *inst, struct dec_seq_info *info)
+{
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	ret = wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_GET_RESULT);
+	if (ret)
+		return ret;
+
+	if (vpu_read_reg(inst->dev, W6_RET_DEC_DECODING_SUCCESS) != 1) {
+		info->err_reason = vpu_read_reg(inst->dev, W6_RET_DEC_ERR_INFO);
+		ret = -EIO;
+	} else {
+		info->warn_info = vpu_read_reg(inst->dev, W6_RET_DEC_WARN_INFO);
+	}
+
+	wave6_get_dec_seq_result(inst, info);
+
+	return ret;
+}
+
+int wave6_vpu_dec_register_frame_buffer(struct vpu_instance *inst,
+					struct frame_buffer *fb_arr,
+					enum tiled_map_type map_type, u32 count)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	size_t fbc_remain, mv_remain, fbc_idx = 0, mv_idx = 0;
+	size_t i, k, group_num, mv_count;
+	dma_addr_t fbc_cr_tbl_addr;
+	u32 reg_val;
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	mv_count = p_dec_info->seq_info.req_mv_buffer_count;
+
+	for (i = 0; i < count; i++) {
+		if (!p_dec_info->vb_fbc_y_tbl[i].daddr)
+			return -EINVAL;
+		if (!p_dec_info->vb_fbc_c_tbl[i].daddr)
+			return -EINVAL;
+	}
+	for (i = 0; i < mv_count; i++) {
+		if (!p_dec_info->vb_mv[i].daddr)
+			return -EINVAL;
+	}
+
+	reg_val = SET_FB_PIC_SIZE_WIDTH(p_dec_info->seq_info.pic_width) |
+		  SET_FB_PIC_SIZE_HEIGHT(p_dec_info->seq_info.pic_height);
+	vpu_write_reg(inst->dev, W6_CMD_SET_FB_PIC_SIZE, reg_val);
+	reg_val = SET_FB_PIC_INFO_C_FMT_IDC(p_dec_info->seq_info.c_fmt_idc) |
+		  SET_FB_PIC_INFO_L_BIT_DEPTH(p_dec_info->seq_info.luma_bit_depth) |
+		  SET_FB_PIC_INFO_C_BIT_DEPTH(p_dec_info->seq_info.chroma_bit_depth);
+	vpu_write_reg(inst->dev, W6_CMD_SET_FB_PIC_INFO, reg_val);
+	vpu_write_reg(inst->dev, W6_CMD_SET_FB_DEFAULT_CDF, 0);
+	vpu_write_reg(inst->dev, W6_CMD_SET_FB_SEGMAP, 0);
+	vpu_write_reg(inst->dev, W6_CMD_SET_FB_MV_COL_PRE_ENT, 0);
+
+	fbc_remain = count;
+	mv_remain = mv_count;
+	group_num = (count > mv_count) ? ((ALIGN(count, 16) / 16) - 1) :
+					 ((ALIGN(mv_count, 16) / 16) - 1);
+	for (i = 0; i <= group_num; i++) {
+		bool first_group = i == 0;
+		bool last_group = i == group_num;
+		u32 set_fbc_num = (fbc_remain >= 16) ? 16 : fbc_remain;
+		u32 set_mv_num = (mv_remain >= 16) ? 16 : mv_remain;
+		u32 fbc_start_no = i * 16;
+		u32 fbc_end_no = fbc_start_no + set_fbc_num - 1;
+		u32 mv_start_no = i * 16;
+		u32 mv_end_no = mv_start_no + set_mv_num - 1;
+
+		reg_val = SET_FB_OPTION_ENDIAN(VDI_128BIT_BIG_ENDIAN);
+		if (first_group)
+			reg_val |= SET_FB_OPTION_START;
+		if (last_group)
+			reg_val |= SET_FB_OPTION_END;
+		vpu_write_reg(inst->dev, W6_CMD_SET_FB_OPTION, reg_val);
+
+		reg_val = SET_FB_NUM_FBC_START_IDX(fbc_start_no) |
+			  SET_FB_NUM_FBC_END_IDX(fbc_end_no) |
+			  SET_FB_NUM_MV_COL_START_IDX(mv_start_no) |
+			  SET_FB_NUM_MV_COL_END_IDX(mv_end_no);
+		vpu_write_reg(inst->dev, W6_CMD_SET_FB_NUM, reg_val);
+
+		for (k = 0; k < set_fbc_num; k++) {
+			vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_Y(k),
+				      fb_arr[fbc_idx].buf_y);
+			vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_C(k),
+				      fb_arr[fbc_idx].buf_cb);
+			vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_CR(k),
+				      fb_arr[fbc_idx].buf_cr);
+			vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_Y_OFFSET(k),
+				      p_dec_info->vb_fbc_y_tbl[fbc_idx].daddr);
+			vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_C_OFFSET(k),
+				      p_dec_info->vb_fbc_c_tbl[fbc_idx].daddr);
+			fbc_cr_tbl_addr = p_dec_info->vb_fbc_c_tbl[fbc_idx].daddr +
+						(p_dec_info->vb_fbc_c_tbl[fbc_idx].size >> 1);
+			vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_CR_OFFSET(k),
+				      fbc_cr_tbl_addr);
+			fbc_idx++;
+		}
+		fbc_remain -= k;
+
+		for (k = 0; k < set_mv_num; k++) {
+			vpu_write_reg(inst->dev, W6_CMD_SET_FB_MV_COL(k),
+				      p_dec_info->vb_mv[mv_idx].daddr);
+			mv_idx++;
+		}
+		mv_remain -= k;
+
+		wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_SET_FB);
+		ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+		if (ret) {
+			dev_err(inst->dev->dev, "%s: timeout\n", __func__);
+			return ret;
+		}
+	}
+
+	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS))
+		return -EIO;
+
+	return 0;
+}
+
+int wave6_vpu_dec_register_display_buffer(struct vpu_instance *inst, struct frame_buffer fb)
+{
+	int ret;
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	u32 reg_val;
+	u32 c_fmt_idc, out_fmt, out_mode;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_SCL_PARAM,
+		      inst->scaler_info.enable);
+	reg_val = SET_DISP_SCL_PIC_SIZE_WIDTH(inst->scaler_info.width) |
+		  SET_DISP_SCL_PIC_SIZE_HEIGHT(inst->scaler_info.height);
+	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_SCL_PIC_SIZE, reg_val);
+	reg_val = SET_DISP_PIC_SIZE_WIDTH(p_dec_info->seq_info.pic_width) |
+		  SET_DISP_PIC_SIZE_HEIGHT(p_dec_info->seq_info.pic_height);
+	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_PIC_SIZE, reg_val);
+
+	c_fmt_idc = get_chroma_format_idc(p_dec_info->wtl_format);
+	switch (p_dec_info->wtl_format) {
+	case FORMAT_420_P10_16BIT_MSB:
+	case FORMAT_422_P10_16BIT_MSB:
+	case FORMAT_444_P10_16BIT_MSB:
+	case FORMAT_400_P10_16BIT_MSB:
+		out_mode = (WTL_RIGHT_JUSTIFIED << 2) | WTL_PIXEL_16BIT;
+		break;
+	case FORMAT_420_P10_16BIT_LSB:
+	case FORMAT_422_P10_16BIT_LSB:
+	case FORMAT_444_P10_16BIT_LSB:
+	case FORMAT_400_P10_16BIT_LSB:
+		out_mode = (WTL_LEFT_JUSTIFIED << 2) | WTL_PIXEL_16BIT;
+		break;
+	case FORMAT_420_P10_32BIT_MSB:
+	case FORMAT_422_P10_32BIT_MSB:
+	case FORMAT_444_P10_32BIT_MSB:
+	case FORMAT_400_P10_32BIT_MSB:
+		out_mode = (WTL_RIGHT_JUSTIFIED << 2) | WTL_PIXEL_32BIT;
+		break;
+	case FORMAT_420_P10_32BIT_LSB:
+	case FORMAT_422_P10_32BIT_LSB:
+	case FORMAT_444_P10_32BIT_LSB:
+	case FORMAT_400_P10_32BIT_LSB:
+		out_mode = (WTL_LEFT_JUSTIFIED << 2) | WTL_PIXEL_32BIT;
+		break;
+	default:
+		out_mode = (WTL_RIGHT_JUSTIFIED << 2) | WTL_PIXEL_8BIT;
+		break;
+	}
+	out_fmt = (inst->nv21 << 1) | inst->cbcr_interleave;
+
+	reg_val = SET_DISP_COMMON_PIC_INFO_BWB_ON |
+		  SET_DISP_COMMON_PIC_INFO_C_FMT_IDC(c_fmt_idc) |
+		  SET_DISP_COMMON_PIC_INFO_PIXEL_ORDER(PIXEL_ORDER_INCREASING) |
+		  SET_DISP_COMMON_PIC_INFO_OUT_MODE(out_mode) |
+		  SET_DISP_COMMON_PIC_INFO_OUT_FMT(out_fmt) |
+		  SET_DISP_COMMON_PIC_INFO_STRIDE(fb.stride);
+	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_COMMON_PIC_INFO, reg_val);
+	reg_val = SET_DISP_OPTION_ENDIAN(VDI_128BIT_BIG_ENDIAN);
+	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_OPTION, reg_val);
+	reg_val = SET_DISP_PIC_INFO_L_BIT_DEPTH(fb.luma_bit_depth) |
+		  SET_DISP_PIC_INFO_C_BIT_DEPTH(fb.chroma_bit_depth) |
+		  SET_DISP_PIC_INFO_C_FMT_IDC(fb.c_fmt_idc);
+	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_PIC_INFO, reg_val);
+	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_Y_BASE, fb.buf_y);
+	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_CB_BASE, fb.buf_cb);
+	vpu_write_reg(inst->dev, W6_CMD_DEC_SET_DISP_CR_BASE, fb.buf_cr);
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_DEC_SET_DISP);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
+		return ret;
+	}
+
+	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS))
+		return -EIO;
+
+	wave6_dec_set_display_buffer(inst, fb);
+
+	return 0;
+}
+
+int wave6_vpu_decode(struct vpu_instance *inst, struct dec_param *option, u32 *fail_res)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	u32 reg_val;
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_BS_RD_PTR, p_dec_info->stream_rd_ptr);
+	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_BS_WR_PTR, p_dec_info->stream_wr_ptr);
+
+	reg_val = DEC_PIC_BS_OPTION_STREAM_END(p_dec_info->stream_end) |
+		  DEC_PIC_BS_OPTION_EXPLICIT_END_ON;
+	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_BS_OPTION, reg_val);
+
+	reg_val = DEC_PIC_SEC_AXI_IP_ENABLE(p_dec_info->sec_axi.use_dec_ip) |
+		  DEC_PIC_SEC_AXI_LF_ENABLE(p_dec_info->sec_axi.use_dec_lf_row);
+	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_SEC_AXI, reg_val);
+
+	reg_val = DEC_PIC_OPTION_MODE(W6_DEC_PIC_OPT_NORMAL);
+	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_OPTION, reg_val);
+
+	reg_val = DEC_PIC_TEMPORAL_ID_PLUS1_SPATIAL(DECODE_ALL_SPATIAL_LAYERS) |
+		  DEC_PIC_TEMPORAL_ID_PLUS1(DECODE_ALL_TEMPORAL_LAYERS);
+	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_TEMPORAL_ID_PLUS1, reg_val);
+	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_SEQ_CHANGE_ENABLE_FLAG,
+		      p_dec_info->seq_change_mask);
+	reg_val = lower_32_bits(option->timestamp);
+	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_TIMESTAMP_LOW, reg_val);
+	reg_val = upper_32_bits(option->timestamp);
+	vpu_write_reg(inst->dev, W6_CMD_DEC_PIC_TIMESTAMP_HIGH, reg_val);
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_DEC_PIC);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
+		return ret;
+	}
+
+	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
+		*fail_res = vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
+		wave6_print_reg_err(inst->dev, *fail_res);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int wave6_vpu_dec_get_result(struct vpu_instance *inst, struct dec_output_info *result)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	u32 reg_val, i;
+	int decoded_idx = -1, disp_idx = -1;
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	ret = wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_GET_RESULT);
+	if (ret)
+		return ret;
+
+	result->decoding_success = vpu_read_reg(inst->dev, W6_RET_DEC_DECODING_SUCCESS);
+	if (!result->decoding_success)
+		result->error_reason = vpu_read_reg(inst->dev, W6_RET_DEC_ERR_INFO);
+	else
+		result->warn_info = vpu_read_reg(inst->dev, W6_RET_DEC_WARN_INFO);
+
+	reg_val = vpu_read_reg(inst->dev, W6_RET_DEC_PIC_TYPE);
+	result->ctu_size = DEC_PIC_TYPE_CTU_SIZE(reg_val);
+	result->nal_type = DEC_PIC_TYPE_NAL_UNIT_TYPE(reg_val);
+
+	if (reg_val & DEC_PIC_TYPE_B)
+		result->pic_type = PIC_TYPE_B;
+	else if (reg_val & DEC_PIC_TYPE_P)
+		result->pic_type = PIC_TYPE_P;
+	else if (reg_val & DEC_PIC_TYPE_I)
+		result->pic_type = PIC_TYPE_I;
+	else
+		result->pic_type = PIC_TYPE_MAX;
+	if (inst->std == W_HEVC_DEC) {
+		if (result->pic_type == PIC_TYPE_I &&
+		    (result->nal_type == H265_NAL_UNIT_TYPE_IDR_W_RADL ||
+		     result->nal_type == H265_NAL_UNIT_TYPE_IDR_N_LP))
+			result->pic_type = PIC_TYPE_IDR;
+	} else if (inst->std == W_AVC_DEC) {
+		if (result->pic_type == PIC_TYPE_I &&
+		    result->nal_type == H264_NAL_UNIT_TYPE_IDR_PICTURE)
+			result->pic_type = PIC_TYPE_IDR;
+	}
+
+	reg_val = vpu_read_reg(inst->dev, W6_RET_DEC_DECODED_FLAG);
+	if (reg_val) {
+		struct frame_buffer fb;
+		dma_addr_t addr = vpu_read_reg(inst->dev, W6_RET_DEC_DECODED_ADDR);
+
+		fb = wave6_dec_get_display_buffer(inst, addr);
+		result->frame_decoded_addr = addr;
+		result->frame_decoded = true;
+		decoded_idx = fb.index;
+	}
+
+	reg_val = vpu_read_reg(inst->dev, W6_RET_DEC_DISPLAY_FLAG);
+	if (reg_val) {
+		struct frame_buffer fb;
+		dma_addr_t addr = vpu_read_reg(inst->dev, W6_RET_DEC_DISPLAY_ADDR);
+
+		fb = wave6_dec_get_display_buffer(inst, addr);
+		result->frame_display_addr = addr;
+		result->frame_display = true;
+		disp_idx = fb.index;
+	}
+
+	reg_val = vpu_read_reg(inst->dev, W6_RET_DEC_DISP_IDC);
+	for (i = 0; i < WAVE6_MAX_FBS; i++) {
+		if (reg_val & (1 << i)) {
+			dma_addr_t addr;
+
+			addr = vpu_read_reg(inst->dev, W6_RET_DEC_DISP_LINEAR_ADDR(i));
+
+			result->disp_frame_addr[result->disp_frame_num] = addr;
+			result->disp_frame_num++;
+		}
+	}
+
+	reg_val = vpu_read_reg(inst->dev, W6_RET_DEC_RELEASE_IDC);
+	for (i = 0; i < WAVE6_MAX_FBS; i++) {
+		if (reg_val & (1 << i)) {
+			dma_addr_t addr;
+
+			addr = vpu_read_reg(inst->dev, W6_RET_DEC_DISP_LINEAR_ADDR(i));
+
+			wave6_dec_remove_display_buffer(inst, addr);
+			result->release_disp_frame_addr[result->release_disp_frame_num] = addr;
+			result->release_disp_frame_num++;
+		}
+	}
+
+	if (inst->std == W_HEVC_DEC) {
+		result->decoded_poc = -1;
+		result->display_poc = -1;
+		if (decoded_idx >= 0)
+			result->decoded_poc = vpu_read_reg(inst->dev, W6_RET_DEC_PIC_POC);
+	} else if (inst->std == W_AVC_DEC) {
+		result->decoded_poc = -1;
+		result->display_poc = -1;
+		if (decoded_idx >= 0)
+			result->decoded_poc = vpu_read_reg(inst->dev, W6_RET_DEC_PIC_POC);
+	}
+
+	reg_val = vpu_read_reg(inst->dev, W6_RET_DEC_PIC_SIZE);
+	result->dec_pic_width = DEC_PIC_SIZE_WIDTH(reg_val);
+	result->dec_pic_height = DEC_PIC_SIZE_HEIGHT(reg_val);
+
+	result->rd_ptr = wave6_vpu_dec_get_rd_ptr(inst);
+	result->wr_ptr = p_dec_info->stream_wr_ptr;
+	result->byte_pos_frame_start = vpu_read_reg(inst->dev, W6_RET_DEC_AU_START_POS);
+	result->byte_pos_frame_end = vpu_read_reg(inst->dev, W6_RET_DEC_AU_END_POS);
+	result->stream_end = vpu_read_reg(inst->dev, W6_RET_DEC_STREAM_END);
+	result->notification_flags = vpu_read_reg(inst->dev, W6_RET_DEC_NOTIFICATION);
+	result->last_frame_in_au = vpu_read_reg(inst->dev, W6_RET_DEC_LAST_FRAME_FLAG);
+
+	reg_val = vpu_read_reg(inst->dev, W6_RET_DEC_TIMESTAMP_LOW);
+	result->timestamp = vpu_read_reg(inst->dev, W6_RET_DEC_TIMESTAMP_HIGH);
+	result->timestamp = (result->timestamp << 32) | reg_val;
+
+	result->cycle.host_cmd_s = vpu_read_reg(inst->dev, W6_RET_CQ_IN_TICK);
+	result->cycle.host_cmd_e = vpu_read_reg(inst->dev, W6_RET_RQ_OUT_TICK);
+	result->cycle.proc_s = vpu_read_reg(inst->dev, W6_RET_HW_RUN_TICK);
+	result->cycle.proc_e = vpu_read_reg(inst->dev, W6_RET_HW_DONE_TICK);
+	result->cycle.vpu_s = vpu_read_reg(inst->dev, W6_RET_FW_RUN_TICK);
+	result->cycle.vpu_e = vpu_read_reg(inst->dev, W6_RET_FW_DONE_TICK);
+	result->cycle.frame_cycle = (result->cycle.vpu_e - result->cycle.host_cmd_s) *
+				    CYCLE_PER_TICK_VALUE;
+	result->cycle.proc_cycle = (result->cycle.proc_e - result->cycle.proc_s) *
+				   CYCLE_PER_TICK_VALUE;
+	result->cycle.vpu_cycle = ((result->cycle.vpu_e - result->cycle.vpu_s) -
+				   (result->cycle.proc_e - result->cycle.proc_s)) *
+				  CYCLE_PER_TICK_VALUE;
+
+	if (decoded_idx >= 0 && decoded_idx < WAVE6_MAX_FBS)
+		p_dec_info->dec_out_info[decoded_idx].decoded_poc = result->decoded_poc;
+
+	if (disp_idx >= 0 && disp_idx < WAVE6_MAX_FBS) {
+		result->display_poc = p_dec_info->dec_out_info[disp_idx].decoded_poc;
+		result->disp_pic_width = p_dec_info->dec_out_info[disp_idx].dec_pic_width;
+		result->disp_pic_height = p_dec_info->dec_out_info[disp_idx].dec_pic_height;
+	}
+
+	result->sequence_no = p_dec_info->seq_info.sequence_no;
+	if (decoded_idx >= 0 && decoded_idx < WAVE6_MAX_FBS)
+		p_dec_info->dec_out_info[decoded_idx] = *result;
+
+	if (result->notification_flags & DEC_NOTI_FLAG_SEQ_CHANGE) {
+		wave6_get_dec_seq_result(inst, &p_dec_info->seq_info);
+		p_dec_info->seq_info.sequence_no++;
+	}
+
+	return 0;
+}
+
+int wave6_vpu_dec_fini_seq(struct vpu_instance *inst, u32 *fail_res)
+{
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_DESTROY_INSTANCE);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret)
+		return -ETIMEDOUT;
+
+	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
+		*fail_res = vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
+		wave6_print_reg_err(inst->dev, *fail_res);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+dma_addr_t wave6_vpu_dec_get_rd_ptr(struct vpu_instance *inst)
+{
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	return vpu_read_reg(inst->dev, W6_RET_DEC_BS_RD_PTR);
+}
+
+int wave6_vpu_dec_flush(struct vpu_instance *inst)
+{
+	int ret, index;
+	u32 unused_idc;
+	u32 used_idc;
+	u32 using_idc;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_FLUSH_INSTANCE);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret)
+		return -ETIMEDOUT;
+
+	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
+		u32 reg_val;
+
+		reg_val = vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
+		wave6_print_reg_err(inst->dev, reg_val);
+		return -EIO;
+	}
+
+	ret = wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_GET_FLUSH_CMD_INFO);
+	if (ret)
+		return ret;
+
+	unused_idc = vpu_read_reg(inst->dev, W6_RET_DEC_FLUSH_CMD_BUF_STATE_UNUSED_IDC);
+	if (unused_idc)
+		dev_dbg(inst->dev->dev, "%s: unused_idc %d\n", __func__, unused_idc);
+
+	used_idc = vpu_read_reg(inst->dev, W6_RET_DEC_FLUSH_CMD_BUF_STATE_USED_IDC);
+	if (used_idc)
+		dev_dbg(inst->dev->dev, "%s: used_idc %d\n", __func__, used_idc);
+
+	using_idc = vpu_read_reg(inst->dev, W6_RET_DEC_FLUSH_CMD_BUF_STATE_USING_IDC);
+	if (using_idc)
+		dev_err(inst->dev->dev, "%s: using_idc %d\n", __func__, using_idc);
+
+	for (index = 0; index < WAVE6_MAX_FBS; index++) {
+		dma_addr_t addr;
+
+		addr = vpu_read_reg(inst->dev, W6_RET_DEC_FLUSH_CMD_DISP_ADDR(index));
+
+		if ((unused_idc >> index) & 0x1)
+			wave6_dec_remove_display_buffer(inst, addr);
+		if ((used_idc >> index) & 0x1)
+			wave6_dec_remove_display_buffer(inst, addr);
+	}
+
+	return 0;
+}
+
+struct enc_cmd_set_param_reg {
+	u32 enable;
+	u32 src_size;
+	u32 custom_map_endian;
+	u32 sps;
+	u32 pps;
+	u32 gop;
+	u32 intra;
+	u32 conf_win0;
+	u32 conf_win1;
+	u32 rdo;
+	u32 slice;
+	u32 intra_refresh;
+	u32 intra_qp;
+	u32 rc_frame_rate;
+	u32 rc_target_rate;
+	u32 rc;
+	u32 hvs;
+	u32 rc_max_bitrate;
+	u32 rc_vbv_buffer_size;
+	u32 inter_qp;
+	u32 rot_param;
+	u32 num_units_in_tick;
+	u32 time_scale;
+	u32 num_ticks_poc_diff_one;
+	u32 max_intra_pic_bit;
+	u32 max_inter_pic_bit;
+	u32 bg;
+	u32 non_vcl_param;
+	u32 vui_rbsp_addr;
+	u32 hrd_rbsp_addr;
+	u32 qround_offset;
+	u32 quant1;
+	u32 quant2;
+	u32 custom_gop;
+	u32 custom_gop_pic[MAX_CUSTOM_GOP_NUM];
+	u32 tile_param;
+	u32 custom_lambda[MAX_CUSTOM_LAMBDA_NUM];
+	u32 temp_layer_qp[MAX_NUM_CHANGEABLE_TEMP_LAYER];
+	u32 scaler_size;
+	u32 scaler;
+	u32 color;
+	u32 sar;
+	u32 sar_extended;
+};
+
+struct enc_cmd_change_param_reg {
+	u32 enable;
+	u32 rc_target_rate;
+};
+
+int wave6_vpu_build_up_enc_param(struct device *dev, struct vpu_instance *inst,
+				 struct enc_open_param *param)
+{
+	struct enc_info *p_enc_info = &inst->codec_info->enc_info;
+	u32 reg_val;
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	p_enc_info->stride = 0;
+	p_enc_info->seq_info_obtained = false;
+	p_enc_info->sec_axi.use_enc_rdo = true;
+	p_enc_info->sec_axi.use_enc_lf = true;
+	p_enc_info->mir_dir = param->mir_dir;
+	p_enc_info->rot_angle = param->rot_angle;
+
+	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_TEMP_BASE, param->inst_buffer.temp_base);
+	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_TEMP_SIZE, param->inst_buffer.temp_size);
+	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_AR_TABLE_BASE, param->inst_buffer.ar_base);
+	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_BS_PARAM, VPU_STREAM_ENDIAN);
+	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_SRC_OPT, 0);
+	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_ADDR_EXT, param->ext_addr_vcpu);
+
+	reg_val = CREATE_INST_CORE_INFO_CQ_DEPTH(COMMAND_QUEUE_DEPTH) |
+		  CREATE_INST_CORE_INFO_CORE_IDC(SINGLE_CORE_IDC) |
+		  CREATE_INST_CORE_INFO_CORE_NUM(SINGLE_CORE);
+	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_CORE_INFO, reg_val);
+
+	reg_val = CREATE_INST_PRIORITY_SECURITY_FLAG(param->is_secure_inst) |
+		  CREATE_INST_PRIORITY_VALUE(param->inst_priority);
+	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_PRIORITY, reg_val);
+	vpu_write_reg(inst->dev, W6_CMD_CREATE_INST_TIMEOUT_CYCLE_COUNT,
+		      W6_VPU_TIMEOUT_CYCLE_COUNT);
+
+	wave6_send_command(inst->dev, 0, inst->std, W6_CMD_CREATE_INSTANCE);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
+		return ret;
+	}
+
+	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
+		u32 reason_code = vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
+
+		wave6_print_reg_err(inst->dev, reason_code);
+		return -EIO;
+	}
+
+	inst->id = vpu_read_reg(inst->dev, W6_RET_INSTANCE_ID);
+
+	return 0;
+}
+
+static int wave6_set_enc_crop_info(u32 codec, struct enc_codec_param *param, int rot_mode,
+				   int width, int height)
+{
+	int aligned_width = (codec == W_HEVC_ENC) ? ALIGN(width, 32) : ALIGN(width, 16);
+	int aligned_height = (codec == W_HEVC_ENC) ? ALIGN(height, 32) : ALIGN(height, 16);
+	int pad_right, pad_bot;
+	int crop_right, crop_left, crop_top, crop_bot;
+	int prp_mode = rot_mode >> 1;
+
+	if (codec == W_HEVC_ENC &&
+	    (!rot_mode || prp_mode == 14))
+		return 0;
+
+	pad_right = aligned_width - width;
+	pad_bot = aligned_height - height;
+
+	if (param->conf_win.right > 0)
+		crop_right = param->conf_win.right + pad_right;
+	else
+		crop_right = pad_right;
+
+	if (param->conf_win.bottom > 0)
+		crop_bot = param->conf_win.bottom + pad_bot;
+	else
+		crop_bot = pad_bot;
+
+	crop_top = param->conf_win.top;
+	crop_left = param->conf_win.left;
+
+	param->conf_win.top = crop_top;
+	param->conf_win.left = crop_left;
+	param->conf_win.bottom = crop_bot;
+	param->conf_win.right = crop_right;
+
+	if (prp_mode == 1 || prp_mode == 15) {
+		param->conf_win.top = crop_right;
+		param->conf_win.left = crop_top;
+		param->conf_win.bottom = crop_left;
+		param->conf_win.right = crop_bot;
+	} else if (prp_mode == 2 || prp_mode == 12) {
+		param->conf_win.top = crop_bot;
+		param->conf_win.left = crop_right;
+		param->conf_win.bottom = crop_top;
+		param->conf_win.right = crop_left;
+	} else if (prp_mode == 3 || prp_mode == 13) {
+		param->conf_win.top = crop_left;
+		param->conf_win.left = crop_bot;
+		param->conf_win.bottom = crop_right;
+		param->conf_win.right = crop_top;
+	} else if (prp_mode == 4 || prp_mode == 10) {
+		param->conf_win.top = crop_bot;
+		param->conf_win.bottom = crop_top;
+	} else if (prp_mode == 8 || prp_mode == 6) {
+		param->conf_win.left = crop_right;
+		param->conf_win.right = crop_left;
+	} else if (prp_mode == 5 || prp_mode == 11) {
+		param->conf_win.top = crop_left;
+		param->conf_win.left = crop_top;
+		param->conf_win.bottom = crop_right;
+		param->conf_win.right = crop_bot;
+	} else if (prp_mode == 7 || prp_mode == 9) {
+		param->conf_win.top = crop_right;
+		param->conf_win.left = crop_bot;
+		param->conf_win.bottom = crop_left;
+		param->conf_win.right = crop_top;
+	}
+
+	return 0;
+}
+
+static void wave6_update_enc_info(struct enc_info *p_enc_info)
+{
+	struct enc_open_param op = p_enc_info->open_param;
+
+	p_enc_info->width = op.pic_width;
+	p_enc_info->height = op.pic_height;
+	p_enc_info->c_fmt_idc = get_chroma_format_idc(op.output_format);
+}
+
+static void wave6_gen_set_param_reg_common(struct enc_info *p_enc_info, enum codec_std std,
+					   struct enc_cmd_set_param_reg *reg)
+{
+	struct enc_open_param *p_open_param = &p_enc_info->open_param;
+	struct enc_codec_param *p_param = &p_open_param->codec_param;
+	unsigned int i;
+	u32 rot_mir_mode = 0;
+
+	switch (p_enc_info->rot_angle) {
+	case ROT_0:
+		rot_mir_mode |= 0x0; break;
+	case ROT_90:
+		rot_mir_mode |= 0x3; break;
+	case ROT_180:
+		rot_mir_mode |= 0x5; break;
+	case ROT_270:
+		rot_mir_mode |= 0x7; break;
+	}
+
+	switch (p_enc_info->mir_dir) {
+	case MIR_NONE:
+		rot_mir_mode |= 0x0; break;
+	case MIR_VER:
+		rot_mir_mode |= 0x9; break;
+	case MIR_HOR:
+		rot_mir_mode |= 0x11; break;
+	case MIR_HOR_VER:
+		rot_mir_mode |= 0x19; break;
+	}
+
+	wave6_set_enc_crop_info(std, p_param, rot_mir_mode, p_enc_info->width, p_enc_info->height);
+
+	reg->custom_map_endian = VPU_USER_DATA_ENDIAN;
+	reg->rot_param = rot_mir_mode;
+	reg->src_size = SET_PARAM_SRC_SIZE_HEIGHT(p_enc_info->height) |
+			SET_PARAM_SRC_SIZE_WIDTH(p_enc_info->width);
+	reg->conf_win0 = SET_PARAM_CONF_WIN0_BOTTOM(p_param->conf_win.bottom) |
+			 SET_PARAM_CONF_WIN0_TOP(p_param->conf_win.top);
+	reg->conf_win1 = SET_PARAM_CONF_WIN1_RIGHT(p_param->conf_win.right) |
+			 SET_PARAM_CONF_WIN1_LEFT(p_param->conf_win.left);
+	reg->gop = SET_PARAM_GOP_TEMP_LAYER_CNT(p_param->temp_layer_cnt) |
+		   SET_PARAM_GOP_TEMP_LAYER3_QP_ENABLE(p_param->temp_layer[3].change_qp) |
+		   SET_PARAM_GOP_TEMP_LAYER2_QP_ENABLE(p_param->temp_layer[2].change_qp) |
+		   SET_PARAM_GOP_TEMP_LAYER1_QP_ENABLE(p_param->temp_layer[1].change_qp) |
+		   SET_PARAM_GOP_TEMP_LAYER0_QP_ENABLE(p_param->temp_layer[0].change_qp) |
+		   SET_PARAM_GOP_PRESET_IDX(p_param->gop_preset_idx);
+	for (i = 0; i < MAX_NUM_CHANGEABLE_TEMP_LAYER; i++) {
+		reg->temp_layer_qp[i] = SET_PARAM_TEMP_LAYER_QP_B(p_param->temp_layer[i].qp_b) |
+					SET_PARAM_TEMP_LAYER_QP_P(p_param->temp_layer[i].qp_p) |
+					SET_PARAM_TEMP_LAYER_QP_I(p_param->temp_layer[i].qp_i);
+	}
+	reg->intra_refresh = SET_PARAM_INTRA_REFRESH_ARGUMENT(p_param->intra_refresh_arg) |
+			     SET_PARAM_INTRA_REFRESH_MODE(p_param->intra_refresh_mode);
+	reg->intra_qp = SET_PARAM_INTRA_QP_MAX(p_param->max_qp_i) |
+			SET_PARAM_INTRA_QP_MIN(p_param->min_qp_i);
+	reg->inter_qp = SET_PARAM_INTER_QP_MAX_B(p_param->max_qp_b) |
+			SET_PARAM_INTER_QP_MIN_B(p_param->min_qp_b) |
+			SET_PARAM_INTER_QP_MAX_P(p_param->max_qp_p) |
+			SET_PARAM_INTER_QP_MIN_P(p_param->min_qp_p);
+	reg->rc_frame_rate = p_param->frame_rate;
+	reg->rc_target_rate = p_param->bitrate;
+	reg->rc_max_bitrate = p_param->max_bitrate;
+	reg->rc_vbv_buffer_size = p_param->cpb_size;
+	reg->rc = SET_PARAM_RC_UPDATE_SPEED(p_param->rc_update_speed) |
+		  SET_PARAM_RC_INITIAL_LEVEL(p_param->rc_initial_level) |
+		  SET_PARAM_RC_INITIAL_QP(p_param->rc_initial_qp) |
+		  SET_PARAM_RC_MODE(p_param->rc_mode) |
+		  SET_PARAM_RC_PIC_LEVEL_MAX_DELTA_QP(p_param->pic_rc_max_dqp) |
+		  SET_PARAM_RC_VBV_OVERFLOW_DROP_FRAME(p_param->en_skip_frame) |
+		  SET_PARAM_RC_CU_LEVEL_ENABLE(p_param->en_cu_level_rate_control) |
+		  SET_PARAM_RC_ENABLE(p_param->en_rate_control);
+	reg->hvs = SET_PARAM_HVS_MAX_DELTA_QP(p_param->max_delta_qp) |
+		   SET_PARAM_HVS_QP_SCALE(p_param->hvs_qp_scale_div2);
+	reg->num_units_in_tick = p_param->num_units_in_tick;
+	reg->time_scale = p_param->time_scale;
+	reg->num_ticks_poc_diff_one = p_param->num_ticks_poc_diff_one;
+	reg->max_intra_pic_bit = p_param->max_intra_pic_bit;
+	reg->max_inter_pic_bit = p_param->max_inter_pic_bit;
+	reg->bg = SET_PARAM_BG_DELTA_QP(p_param->bg_delta_qp) |
+		  SET_PARAM_BG_THRESHOLD_MEAN_DIFF(p_param->bg_th_mean_diff) |
+		  SET_PARAM_BG_THRESHOLD_MAX_DIFF(p_param->bg_th_diff) |
+		  SET_PARAM_BG_ENABLE(p_param->en_bg_detect);
+	reg->qround_offset = SET_PARAM_QROUND_OFFSET_INTER(p_param->qround_inter) |
+			     SET_PARAM_QROUND_OFFSET_INTRA(p_param->qround_intra);
+	reg->custom_gop = p_param->gop_param.size;
+	for (i = 0; i < p_param->gop_param.size; i++) {
+		struct custom_gop_pic_param pic = p_param->gop_param.pic[i];
+
+		reg->custom_gop_pic[i] = SET_PARAM_CUSTOM_GOP_PIC_TEMP_ID(pic.temporal_id) |
+					 SET_PARAM_CUSTOM_GOP_PIC_REF1_POC(pic.ref_poc_l1) |
+					 SET_PARAM_CUSTOM_GOP_PIC_REF0_POC(pic.ref_poc_l0) |
+					 SET_PARAM_CUSTOM_GOP_PIC_MULTI_REF_P(pic.multi_ref_p) |
+					 SET_PARAM_CUSTOM_GOP_PIC_QP(pic.pic_qp) |
+					 SET_PARAM_CUSTOM_GOP_PIC_POC_OFFSET(pic.poc_offset) |
+					 SET_PARAM_CUSTOM_GOP_PIC_TYPE(pic.pic_type);
+	}
+	for (i = 0; i < MAX_CUSTOM_LAMBDA_NUM; i++) {
+		reg->custom_lambda[i] = SET_PARAM_CUSTOM_LAMBDA_SSD(p_param->lambda_ssd[i]) |
+					SET_PARAM_CUSTOM_LAMBDA_SAD(p_param->lambda_sad[i]);
+	}
+	reg->scaler_size = SET_PARAM_SCALER_SIZE_HEIGHT(p_enc_info->height) |
+			   SET_PARAM_SCALER_SIZE_WIDTH(p_enc_info->width);
+	reg->scaler = SET_PARAM_SCALER_COEF_MODE(p_enc_info->scaler.coef_mode) |
+		      SET_PARAM_SCALER_ENABLE(p_enc_info->scaler.enable);
+	reg->color = SET_PARAM_COLOR_RANGE(p_param->color.color_range) |
+		     SET_PARAM_COLOR_MATRIX_COEFF(p_param->color.matrix_coefficients) |
+		     SET_PARAM_COLOR_TRANS_CHAR(p_param->color.transfer_characteristics) |
+		     SET_PARAM_COLOR_PRIMARIES(p_param->color.color_primaries) |
+		     SET_PARAM_COLOR_DESCRIPTION_PRESENT_ON;
+	reg->sar = SET_PARAM_SAR_ASPECT_RATIO_IDC(p_param->sar.idc) |
+		   SET_PARAM_SAR_ASPECT_RATIO_ENABLE(p_param->sar.enable);
+	reg->sar_extended = SET_PARAM_SAR_EXTENDED_HEIGHT(p_param->sar.height) |
+			    SET_PARAM_SAR_EXTENDED_WIDTH(p_param->sar.width);
+}
+
+static void wave6_gen_set_param_reg_hevc(struct enc_info *p_enc_info,
+					 struct enc_cmd_set_param_reg *reg)
+{
+	struct enc_open_param *p_open_param = &p_enc_info->open_param;
+	struct enc_codec_param *p_param = &p_open_param->codec_param;
+
+	reg->sps = SET_PARAM_SPS_DEFAULT_SCALING_LIST(p_param->en_scaling_list) |
+		   SET_PARAM_SPS_STILL_PICTURE(p_param->en_still_picture) |
+		   SET_PARAM_SPS_AUTO_LEVEL_ADJUSTING_ON |
+		   SET_PARAM_SPS_STRONG_INTRA_SMOOTHING(p_param->en_intra_smooth) |
+		   SET_PARAM_SPS_INTRA_TRANSFORM_SKIP_ON |
+		   SET_PARAM_SPS_SAMPLE_ADAPTIVE_OFFSET(p_param->en_sao) |
+		   SET_PARAM_SPS_TEMPORAL_MVP(p_param->en_temporal_mvp) |
+		   SET_PARAM_SPS_LONGTERM_REFERENCE(p_param->en_longterm) |
+		   SET_PARAM_SPS_C_FMT_IDC(p_enc_info->c_fmt_idc) |
+		   SET_PARAM_SPS_BIT_DEPTH(p_param->internal_bit_depth) |
+		   SET_PARAM_SPS_TIER(p_param->tier) |
+		   SET_PARAM_SPS_LEVEL(p_param->level) |
+		   SET_PARAM_SPS_PROFILE(p_param->profile);
+	reg->pps = SET_PARAM_PPS_CR_QP_OFFSET(p_param->cr_qp_offset) |
+		   SET_PARAM_PPS_CB_QP_OFFSET(p_param->cb_qp_offset) |
+		   SET_PARAM_PPS_TC_OFFSET_DIV2(p_param->tc_offset_div2) |
+		   SET_PARAM_PPS_BETA_OFFSET_DIV2(p_param->beta_offset_div2) |
+		   SET_PARAM_PPS_DEBLOCKING_FILTER(!p_param->en_dbk) |
+		   SET_PARAM_PPS_LF_SLICE_BOUNDARY(p_param->en_lf_slice_boundary) |
+		   SET_PARAM_PPS_CONST_INTRA_PREDICTION(p_param->en_const_intra_pred);
+	reg->intra = SET_PARAM_INTRA_PERIOD(p_param->intra_period) |
+		     SET_PARAM_INTRA_HEADER_MODE(p_param->forced_idr_header) |
+		     SET_PARAM_INTRA_QP(p_param->qp) |
+		     SET_PARAM_INTRA_REFRESH_TYPE(p_param->decoding_refresh_type);
+	reg->rdo = SET_PARAM_RDO_CUSTOM_LAMBDA(p_param->en_custom_lambda) |
+		   SET_PARAM_RDO_ME_SEARCH_CENTER_ON |
+		   SET_PARAM_RDO_QROUND_OFFSET(p_param->en_qround_offset) |
+		   SET_PARAM_RDO_ADAPTIVE_ROUND_ON |
+		   SET_PARAM_RDO_HVS_QP(p_param->en_hvs_qp);
+	reg->slice = SET_PARAM_SLICE_ARGUMENT(p_param->slice_arg) |
+		     SET_PARAM_SLICE_MODE(p_param->slice_mode);
+	reg->quant2 = SET_PARAM_QUANT2_LAMBDA_DQP_INTER(p_param->lambda_dqp_inter) |
+		      SET_PARAM_QUANT2_LAMBDA_DQP_INTRA(p_param->lambda_dqp_intra);
+	reg->non_vcl_param = SET_PARAM_NON_VCL_PARAM_ENCODE_VUI;
+}
+
+static void wave6_gen_set_param_reg_avc(struct enc_info *p_enc_info,
+					struct enc_cmd_set_param_reg *reg)
+{
+	struct enc_open_param *p_open_param = &p_enc_info->open_param;
+	struct enc_codec_param *p_param = &p_open_param->codec_param;
+
+	reg->sps = SET_PARAM_SPS_DEFAULT_SCALING_LIST(p_param->en_scaling_list) |
+		   SET_PARAM_SPS_AUTO_LEVEL_ADJUSTING_ON |
+		   SET_PARAM_SPS_LONGTERM_REFERENCE(p_param->en_longterm) |
+		   SET_PARAM_SPS_C_FMT_IDC(p_enc_info->c_fmt_idc) |
+		   SET_PARAM_SPS_BIT_DEPTH(p_param->internal_bit_depth) |
+		   SET_PARAM_SPS_LEVEL(p_param->level) |
+		   SET_PARAM_SPS_PROFILE(p_param->profile);
+	reg->pps = SET_PARAM_PPS_ENTROPY_CODING_MODE(p_param->en_cabac) |
+		   SET_PARAM_PPS_TRANSFORM8X8(p_param->en_transform8x8) |
+		   SET_PARAM_PPS_CR_QP_OFFSET(p_param->cr_qp_offset) |
+		   SET_PARAM_PPS_CB_QP_OFFSET(p_param->cb_qp_offset) |
+		   SET_PARAM_PPS_TC_OFFSET_DIV2(p_param->tc_offset_div2) |
+		   SET_PARAM_PPS_BETA_OFFSET_DIV2(p_param->beta_offset_div2) |
+		   SET_PARAM_PPS_DEBLOCKING_FILTER(!p_param->en_dbk) |
+		   SET_PARAM_PPS_LF_SLICE_BOUNDARY(p_param->en_lf_slice_boundary) |
+		   SET_PARAM_PPS_CONST_INTRA_PREDICTION(p_param->en_const_intra_pred);
+	reg->intra = SET_PARAM_INTRA_HEADER_MODE_AVC(p_param->forced_idr_header) |
+		     SET_PARAM_INTRA_IDR_PERIOD_AVC(p_param->idr_period) |
+		     SET_PARAM_INTRA_PERIOD_AVC(p_param->intra_period) |
+		     SET_PARAM_INTRA_QP_AVC(p_param->qp);
+	reg->rdo = SET_PARAM_RDO_CUSTOM_LAMBDA(p_param->en_custom_lambda) |
+		   SET_PARAM_RDO_QROUND_OFFSET(p_param->en_qround_offset) |
+		   SET_PARAM_RDO_ADAPTIVE_ROUND_ON |
+		   SET_PARAM_RDO_HVS_QP(p_param->en_hvs_qp);
+	reg->slice = SET_PARAM_SLICE_ARGUMENT(p_param->slice_arg) |
+		     SET_PARAM_SLICE_MODE(p_param->slice_mode);
+	reg->quant2 = SET_PARAM_QUANT2_LAMBDA_DQP_INTER(p_param->lambda_dqp_inter) |
+		      SET_PARAM_QUANT2_LAMBDA_DQP_INTRA(p_param->lambda_dqp_intra);
+	reg->non_vcl_param = SET_PARAM_NON_VCL_PARAM_ENCODE_VUI;
+}
+
+static void wave6_gen_change_param_reg_common(struct vpu_instance *inst,
+					      struct enc_info *p_enc_info,
+					      struct enc_cmd_change_param_reg *reg)
+{
+	if (p_enc_info->open_param.codec_param.bitrate != inst->enc_ctrls.bitrate) {
+		reg->enable |= SET_PARAM_ENABLE_RC_TARGET_RATE;
+		reg->rc_target_rate = inst->enc_ctrls.bitrate;
+		p_enc_info->open_param.codec_param.bitrate = inst->enc_ctrls.bitrate;
+	}
+}
+
+int wave6_vpu_enc_init_seq(struct vpu_instance *inst)
+{
+	struct enc_cmd_set_param_reg reg;
+	struct enc_info *p_enc_info = &inst->codec_info->enc_info;
+	u32 i;
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	memset(&reg, 0, sizeof(struct enc_cmd_set_param_reg));
+
+	wave6_update_enc_info(p_enc_info);
+
+	wave6_gen_set_param_reg_common(p_enc_info, inst->std, &reg);
+	if (inst->std == W_HEVC_ENC)
+		wave6_gen_set_param_reg_hevc(p_enc_info, &reg);
+	else if (inst->std == W_AVC_ENC)
+		wave6_gen_set_param_reg_avc(p_enc_info, &reg);
+
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_OPTION, W6_SET_PARAM_OPT_COMMON);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_ENABLE, reg.enable);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SRC_SIZE, reg.src_size);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_CUSTOM_MAP_ENDIAN, reg.custom_map_endian);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SPS, reg.sps);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_PPS, reg.pps);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_GOP, reg.gop);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_INTRA, reg.intra);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_CONF_WIN0, reg.conf_win0);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_CONF_WIN1, reg.conf_win1);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RDO, reg.rdo);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SLICE, reg.slice);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_INTRA_REFRESH, reg.intra_refresh);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_INTRA_QP, reg.intra_qp);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RC_FRAME_RATE, reg.rc_frame_rate);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RC_TARGET_RATE, reg.rc_target_rate);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RC, reg.rc);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_HVS, reg.hvs);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RC_MAX_BITRATE, reg.rc_max_bitrate);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RC_VBV_BUFFER_SIZE, reg.rc_vbv_buffer_size);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_INTER_QP, reg.inter_qp);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_ROT_PARAM, reg.rot_param);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_NUM_UNITS_IN_TICK, reg.num_units_in_tick);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_TIME_SCALE, reg.time_scale);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_NUM_TICKS_POC_DIFF_ONE,
+		      reg.num_ticks_poc_diff_one);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_MAX_INTRA_PIC_BIT, reg.max_intra_pic_bit);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_MAX_INTER_PIC_BIT, reg.max_inter_pic_bit);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_BG, reg.bg);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_NON_VCL_PARAM, reg.non_vcl_param);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_VUI_RBSP_ADDR, reg.vui_rbsp_addr);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_HRD_RBSP_ADDR, reg.hrd_rbsp_addr);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_QROUND_OFFSET, reg.qround_offset);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_QUANT1, reg.quant1);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_QUANT2, reg.quant2);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_CUSTOM_GOP, reg.custom_gop);
+	for (i = 0; i < MAX_CUSTOM_GOP_NUM; i++)
+		vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_CUSTOM_GOP_PIC(i),
+			      reg.custom_gop_pic[i]);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_TILE_PARAM, reg.tile_param);
+	for (i = 0; i < MAX_CUSTOM_LAMBDA_NUM; i++)
+		vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA(i),
+			      reg.custom_lambda[i]);
+	for (i = 0; i < MAX_NUM_CHANGEABLE_TEMP_LAYER; i++)
+		vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_TEMP_LAYER_QP(i),
+			      reg.temp_layer_qp[i]);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SCALER_SIZE, reg.scaler_size);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SCALER, reg.scaler);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_COLOR, reg.color);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SAR, reg.sar);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_SAR_EXTENDED, reg.sar_extended);
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_ENC_SET_PARAM);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
+		return ret;
+	}
+
+	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
+		u32 reason_code = vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
+
+		wave6_print_reg_err(inst->dev, reason_code);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int wave6_vpu_enc_get_seq_info(struct vpu_instance *inst, struct enc_seq_info *info)
+{
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	ret = wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_GET_RESULT);
+	if (ret)
+		return ret;
+
+	if (vpu_read_reg(inst->dev, W6_RET_ENC_ENCODING_SUCCESS) != 1) {
+		info->err_reason = vpu_read_reg(inst->dev, W6_RET_ENC_ERR_INFO);
+		ret = -EIO;
+	} else {
+		info->warn_info = vpu_read_reg(inst->dev, W6_RET_ENC_WARN_INFO);
+	}
+
+	info->min_frame_buffer_count = vpu_read_reg(inst->dev, W6_RET_ENC_NUM_REQUIRED_FBC_FB);
+	info->min_src_frame_count = vpu_read_reg(inst->dev, W6_RET_ENC_MIN_SRC_BUF_NUM);
+	info->max_latency_pictures = vpu_read_reg(inst->dev, W6_RET_ENC_PIC_MAX_LATENCY_PICTURES);
+	info->req_mv_buffer_count = vpu_read_reg(inst->dev, W6_RET_ENC_NUM_REQUIRED_COL_BUF);
+
+	return ret;
+}
+
+int wave6_vpu_enc_change_seq(struct vpu_instance *inst, bool *changed)
+{
+	struct enc_cmd_change_param_reg reg;
+	struct enc_info *p_enc_info = &inst->codec_info->enc_info;
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	memset(&reg, 0, sizeof(struct enc_cmd_change_param_reg));
+
+	wave6_gen_change_param_reg_common(inst, p_enc_info, &reg);
+
+	if (!reg.enable)
+		return 0;
+
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_OPTION, W6_SET_PARAM_OPT_CHANGE_PARAM);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_ENABLE, reg.enable);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_SET_PARAM_RC_TARGET_RATE, reg.rc_target_rate);
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_ENC_SET_PARAM);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_warn(inst->dev->dev, "enc set param timed out\n");
+		return ret;
+	}
+
+	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
+		u32 reason_code = vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
+
+		wave6_print_reg_err(inst->dev, reason_code);
+		return -EIO;
+	}
+
+	*changed = true;
+
+	return 0;
+}
+
+struct enc_cmd_set_fb_reg {
+	u32 option;
+	u32 pic_info;
+	u32 pic_size;
+	u32 num_fb;
+	u32 fbc_stride;
+	u32 fbc_y[WAVE6_MAX_FBS];
+	u32 fbc_c[WAVE6_MAX_FBS];
+	u32 fbc_cr[WAVE6_MAX_FBS];
+	u32 fbc_y_offset[WAVE6_MAX_FBS];
+	u32 fbc_c_offset[WAVE6_MAX_FBS];
+	u32 fbc_cr_offset[WAVE6_MAX_FBS];
+	u32 mv_col[WAVE6_MAX_FBS];
+	u32 sub_sampled[WAVE6_MAX_FBS];
+	u32 default_cdf;
+};
+
+static void wave6_gen_set_fb_reg(struct enc_info *p_enc_info, enum codec_std std,
+				 struct frame_buffer *fb_arr, struct enc_cmd_set_fb_reg *reg)
+{
+	u32 mv_count = p_enc_info->seq_info.req_mv_buffer_count;
+	u32 buf_width, buf_height;
+	u32 stride_l, stride_c, i;
+
+	if (std == W_AVC_ENC) {
+		buf_width = ALIGN(p_enc_info->width, 16);
+		buf_height = ALIGN(p_enc_info->height, 16);
+		if (p_enc_info->rot_angle == ROT_90 || p_enc_info->rot_angle == ROT_270) {
+			buf_width = ALIGN(p_enc_info->height, 16);
+			buf_height = ALIGN(p_enc_info->width, 16);
+		}
+	} else {
+		buf_width = ALIGN(p_enc_info->width, 8);
+		buf_height = ALIGN(p_enc_info->height, 8);
+		if ((p_enc_info->rot_angle || p_enc_info->mir_dir) &&
+		    !(p_enc_info->rot_angle == ROT_180 && p_enc_info->mir_dir == MIR_HOR_VER)) {
+			buf_width = ALIGN(p_enc_info->width, 32);
+			buf_height = ALIGN(p_enc_info->height, 32);
+		}
+		if (p_enc_info->rot_angle == ROT_90 || p_enc_info->rot_angle == ROT_270) {
+			buf_width = ALIGN(p_enc_info->height, 32);
+			buf_height = ALIGN(p_enc_info->width, 32);
+		}
+	}
+
+	if ((p_enc_info->rot_angle || p_enc_info->mir_dir) &&
+	    !(p_enc_info->rot_angle == ROT_180 && p_enc_info->mir_dir == MIR_HOR_VER)) {
+		stride_l = ALIGN((buf_width + 63), 64);
+		stride_c = ALIGN((buf_width + 31), 32) / 2;
+	} else {
+		stride_l = ALIGN((p_enc_info->width) + 63, 64);
+		stride_c = ALIGN((p_enc_info->width) + 31, 32) / 2;
+	}
+
+	reg->option = SET_FB_OPTION_END | SET_FB_OPTION_START;
+	reg->pic_info = SET_FB_PIC_INFO_STRIDE(p_enc_info->stride);
+	reg->pic_size = SET_FB_PIC_SIZE_WIDTH(buf_width) |
+			SET_FB_PIC_SIZE_HEIGHT(buf_height);
+	reg->num_fb = SET_FB_NUM_FBC_END_IDX(p_enc_info->num_frame_buffers - 1) |
+		      SET_FB_NUM_MV_COL_END_IDX(mv_count - 1);
+	reg->fbc_stride = SET_FB_FBC_STRIDE_L(stride_l) |
+			  SET_FB_FBC_STRIDE_C(stride_c);
+	reg->default_cdf = 0;
+
+	for (i = 0; i < p_enc_info->num_frame_buffers; i++) {
+		reg->fbc_y[i] = fb_arr[i].buf_y;
+		reg->fbc_c[i] = fb_arr[i].buf_cb;
+		reg->fbc_cr[i] = fb_arr[i].buf_cr;
+		reg->fbc_y_offset[i] = p_enc_info->vb_fbc_y_tbl[i].daddr;
+		reg->fbc_c_offset[i] = p_enc_info->vb_fbc_c_tbl[i].daddr;
+		reg->fbc_cr_offset[i] = p_enc_info->vb_fbc_c_tbl[i].daddr +
+						(p_enc_info->vb_fbc_c_tbl[i].size >> 1);
+		reg->sub_sampled[i] = p_enc_info->vb_sub_sam_buf[i].daddr;
+	}
+	for (i = 0; i < mv_count; i++)
+		reg->mv_col[i] = p_enc_info->vb_mv[i].daddr;
+}
+
+int wave6_vpu_enc_register_frame_buffer(struct vpu_instance *inst, struct frame_buffer *fb_arr)
+{
+	struct enc_cmd_set_fb_reg *reg;
+	struct enc_info *p_enc_info = &inst->codec_info->enc_info;
+	u32 mv_count = p_enc_info->seq_info.req_mv_buffer_count;
+	int ret;
+	u32 idx;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	for (idx = 0; idx < p_enc_info->num_frame_buffers; idx++) {
+		if (!p_enc_info->vb_fbc_y_tbl[idx].daddr)
+			return -EINVAL;
+		if (!p_enc_info->vb_fbc_c_tbl[idx].daddr)
+			return -EINVAL;
+		if (!p_enc_info->vb_sub_sam_buf[idx].daddr)
+			return -EINVAL;
+	}
+	for (idx = 0; idx < mv_count; idx++) {
+		if (!p_enc_info->vb_mv[idx].daddr)
+			return -EINVAL;
+	}
+
+	reg = kzalloc(sizeof(*reg), GFP_KERNEL);
+	if (!reg)
+		return -ENOMEM;
+
+	wave6_gen_set_fb_reg(p_enc_info, inst->std, fb_arr, reg);
+
+	vpu_write_reg(inst->dev, W6_CMD_SET_FB_OPTION, reg->option);
+	vpu_write_reg(inst->dev, W6_CMD_SET_FB_PIC_INFO, reg->pic_info);
+	vpu_write_reg(inst->dev, W6_CMD_SET_FB_PIC_SIZE, reg->pic_size);
+	vpu_write_reg(inst->dev, W6_CMD_SET_FB_NUM, reg->num_fb);
+	vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_STRIDE, reg->fbc_stride);
+	vpu_write_reg(inst->dev, W6_CMD_SET_FB_DEFAULT_CDF, reg->default_cdf);
+	for (idx = 0; idx < p_enc_info->num_frame_buffers; idx++) {
+		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_Y(idx), reg->fbc_y[idx]);
+		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_C(idx), reg->fbc_c[idx]);
+		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_CR(idx), reg->fbc_cr[idx]);
+		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_Y_OFFSET(idx),
+			      reg->fbc_y_offset[idx]);
+		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_C_OFFSET(idx),
+			      reg->fbc_c_offset[idx]);
+		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_CR_OFFSET(idx),
+			      reg->fbc_cr_offset[idx]);
+		vpu_write_reg(inst->dev, W6_CMD_SET_FB_SUB_SAMPLED(idx),
+			      reg->sub_sampled[idx]);
+	}
+	for (idx = 0; idx < mv_count; idx++)
+		vpu_write_reg(inst->dev, W6_CMD_SET_FB_MV_COL(idx), reg->mv_col[idx]);
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_SET_FB);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
+		kfree(reg);
+		return ret;
+	}
+
+	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
+		kfree(reg);
+		return -EIO;
+	}
+
+	kfree(reg);
+	return 0;
+}
+
+struct enc_cmd_enc_pic_reg {
+	u32 bs_start;
+	u32 bs_size;
+	u32 bs_option;
+	u32 sec_axi;
+	u32 report;
+	u32 mv_histo0;
+	u32 mv_histo1;
+	u32 custom_map_param;
+	u32 custom_map_addr;
+	u32 src_pic_idx;
+	u32 src_addr_y;
+	u32 src_addr_u;
+	u32 src_addr_v;
+	u32 src_stride;
+	u32 src_fmt;
+	u32 src_axi_sel;
+	u32 code_option;
+	u32 param;
+	u32 longterm_pic;
+	u32 prefix_sei_nal_addr;
+	u32 prefix_sei_info;
+	u32 suffix_sei_nal_addr;
+	u32 suffix_sei_info;
+	u32 timestamp_low;
+	u32 timestamp_high;
+	u32 csc_coeff[MAX_CSC_COEFF_NUM];
+};
+
+static bool is_format_conv(enum frame_buffer_format in_fmt,
+			   enum frame_buffer_format out_fmt)
+{
+	if (in_fmt == FORMAT_420 ||
+	    in_fmt == FORMAT_420_P10_16BIT_MSB ||
+	    in_fmt == FORMAT_420_P10_16BIT_LSB ||
+	    in_fmt == FORMAT_420_P10_32BIT_MSB ||
+	    in_fmt == FORMAT_420_P10_32BIT_LSB) {
+		if (out_fmt != FORMAT_420 &&
+		    out_fmt != FORMAT_420_P10_16BIT_MSB &&
+		    out_fmt != FORMAT_420_P10_16BIT_LSB &&
+		    out_fmt != FORMAT_420_P10_32BIT_MSB &&
+		    out_fmt != FORMAT_420_P10_32BIT_LSB)
+			return true;
+	} else if (in_fmt == FORMAT_422 ||
+		   in_fmt == FORMAT_422_P10_16BIT_MSB ||
+		   in_fmt == FORMAT_422_P10_16BIT_LSB ||
+		   in_fmt == FORMAT_422_P10_32BIT_MSB ||
+		   in_fmt == FORMAT_422_P10_32BIT_LSB) {
+		if (out_fmt != FORMAT_422 &&
+		    out_fmt != FORMAT_422_P10_16BIT_MSB &&
+		    out_fmt != FORMAT_422_P10_16BIT_LSB &&
+		    out_fmt != FORMAT_422_P10_32BIT_MSB &&
+		    out_fmt != FORMAT_422_P10_32BIT_LSB)
+			return true;
+	} else if (in_fmt == FORMAT_444 ||
+		   in_fmt == FORMAT_444_P10_16BIT_MSB ||
+		   in_fmt == FORMAT_444_P10_16BIT_LSB ||
+		   in_fmt == FORMAT_444_P10_32BIT_MSB ||
+		   in_fmt == FORMAT_444_P10_32BIT_LSB) {
+		if (out_fmt != FORMAT_444 &&
+		    out_fmt != FORMAT_444_P10_16BIT_MSB &&
+		    out_fmt != FORMAT_444_P10_16BIT_LSB &&
+		    out_fmt != FORMAT_444_P10_32BIT_MSB &&
+		    out_fmt != FORMAT_444_P10_32BIT_LSB)
+			return true;
+	}
+
+	return false;
+}
+
+static void wave6_gen_enc_pic_reg(struct enc_info *p_enc_info, bool cbcr_interleave, bool nv21,
+				  struct enc_param *opt, struct enc_cmd_enc_pic_reg *reg)
+{
+	struct enc_open_param open = p_enc_info->open_param;
+	struct enc_codec_param param = open.codec_param;
+	bool is_lsb = false;
+	bool is_10bit = false;
+	bool is_3p4b = false;
+	bool is_cr_first = nv21;
+	u32 stride_c;
+	u32 c_fmt_idc;
+	bool is_ayuv = false;
+	bool is_csc_format = false;
+	bool is_24bit = false;
+	bool is_packed = false;
+	bool is_packed_uv_first = false;
+	bool format_conv = is_format_conv(open.src_format, open.output_format);
+
+	c_fmt_idc = get_chroma_format_idc(open.src_format);
+
+	switch (open.src_format) {
+	case FORMAT_420:
+	case FORMAT_420_P10_16BIT_MSB:
+	case FORMAT_420_P10_16BIT_LSB:
+		stride_c = (cbcr_interleave) ? opt->source_frame->stride :
+					       (opt->source_frame->stride / 2);
+		break;
+	case FORMAT_420_P10_32BIT_MSB:
+	case FORMAT_420_P10_32BIT_LSB:
+		stride_c = (cbcr_interleave) ? opt->source_frame->stride :
+					       ALIGN((opt->source_frame->stride / 2), 16);
+		break;
+	case FORMAT_422:
+	case FORMAT_422_P10_16BIT_MSB:
+	case FORMAT_422_P10_16BIT_LSB:
+		stride_c = (cbcr_interleave) ? opt->source_frame->stride :
+					       (opt->source_frame->stride / 2);
+		stride_c = (format_conv) ? (stride_c * 2) : stride_c;
+		break;
+	case FORMAT_422_P10_32BIT_MSB:
+	case FORMAT_422_P10_32BIT_LSB:
+		stride_c = (cbcr_interleave) ? opt->source_frame->stride :
+					       ALIGN((opt->source_frame->stride / 2), 16);
+		stride_c = (format_conv) ? (stride_c * 2) : stride_c;
+		break;
+	case FORMAT_444:
+	case FORMAT_444_P10_16BIT_MSB:
+	case FORMAT_444_P10_16BIT_LSB:
+		stride_c = (cbcr_interleave) ? (opt->source_frame->stride * 2) :
+					       opt->source_frame->stride;
+		stride_c = (format_conv) ? (stride_c * 2) : stride_c;
+		break;
+	case FORMAT_444_P10_32BIT_MSB:
+	case FORMAT_444_P10_32BIT_LSB:
+		stride_c = (cbcr_interleave) ? ALIGN((opt->source_frame->stride * 2), 16) :
+					       opt->source_frame->stride;
+		stride_c = (format_conv) ? (stride_c * 2) : stride_c;
+		break;
+	case FORMAT_YUV444_24BIT:
+		stride_c = ALIGN((opt->source_frame->stride * 2), 16);
+		break;
+	default:
+		stride_c = 0;
+		break;
+	}
+
+	switch (open.src_format) {
+	case FORMAT_420:
+	case FORMAT_422:
+	case FORMAT_444:
+	case FORMAT_400:
+	case FORMAT_YUYV:
+	case FORMAT_YVYU:
+	case FORMAT_UYVY:
+	case FORMAT_VYUY:
+		is_lsb = false;
+		is_3p4b = false;
+		break;
+	case FORMAT_420_P10_16BIT_MSB:
+	case FORMAT_422_P10_16BIT_MSB:
+	case FORMAT_444_P10_16BIT_MSB:
+	case FORMAT_400_P10_16BIT_MSB:
+	case FORMAT_YUYV_P10_16BIT_MSB:
+	case FORMAT_YVYU_P10_16BIT_MSB:
+	case FORMAT_UYVY_P10_16BIT_MSB:
+	case FORMAT_VYUY_P10_16BIT_MSB:
+		is_lsb = false;
+		is_10bit = true;
+		is_3p4b = false;
+		break;
+	case FORMAT_420_P10_16BIT_LSB:
+	case FORMAT_422_P10_16BIT_LSB:
+	case FORMAT_444_P10_16BIT_LSB:
+	case FORMAT_400_P10_16BIT_LSB:
+	case FORMAT_YUYV_P10_16BIT_LSB:
+	case FORMAT_YVYU_P10_16BIT_LSB:
+	case FORMAT_UYVY_P10_16BIT_LSB:
+	case FORMAT_VYUY_P10_16BIT_LSB:
+		is_lsb = true;
+		is_10bit = true;
+		is_3p4b = false;
+		break;
+	case FORMAT_420_P10_32BIT_MSB:
+	case FORMAT_422_P10_32BIT_MSB:
+	case FORMAT_444_P10_32BIT_MSB:
+	case FORMAT_400_P10_32BIT_MSB:
+	case FORMAT_YUYV_P10_32BIT_MSB:
+	case FORMAT_YVYU_P10_32BIT_MSB:
+	case FORMAT_UYVY_P10_32BIT_MSB:
+	case FORMAT_VYUY_P10_32BIT_MSB:
+		is_lsb = false;
+		is_10bit = true;
+		is_3p4b = true;
+		break;
+	case FORMAT_420_P10_32BIT_LSB:
+	case FORMAT_422_P10_32BIT_LSB:
+	case FORMAT_444_P10_32BIT_LSB:
+	case FORMAT_400_P10_32BIT_LSB:
+	case FORMAT_YUYV_P10_32BIT_LSB:
+	case FORMAT_YVYU_P10_32BIT_LSB:
+	case FORMAT_UYVY_P10_32BIT_LSB:
+	case FORMAT_VYUY_P10_32BIT_LSB:
+		is_lsb = true;
+		is_10bit = true;
+		is_3p4b = true;
+		break;
+	case FORMAT_RGB_32BIT_PACKED:
+		is_ayuv = false;
+		is_csc_format = true;
+		break;
+	case FORMAT_RGB_P10_32BIT_PACKED:
+		is_ayuv = false;
+		is_csc_format = true;
+		is_10bit = true;
+		break;
+	case FORMAT_YUV444_32BIT_PACKED:
+		is_ayuv = true;
+		is_csc_format = true;
+		break;
+	case FORMAT_YUV444_P10_32BIT_PACKED:
+		is_ayuv = true;
+		is_csc_format = true;
+		is_10bit = true;
+		break;
+	case FORMAT_RGB_24BIT_PACKED:
+		is_ayuv = false;
+		is_csc_format = true;
+		is_24bit = true;
+		break;
+	case FORMAT_YUV444_24BIT_PACKED:
+		is_ayuv = true;
+		is_csc_format = true;
+		is_24bit = true;
+		break;
+	case FORMAT_YUV444_24BIT:
+		is_ayuv = true;
+		break;
+	default:
+		break;
+	}
+
+	switch (open.src_format) {
+	case FORMAT_YUYV:
+	case FORMAT_YUYV_P10_16BIT_MSB:
+	case FORMAT_YUYV_P10_16BIT_LSB:
+	case FORMAT_YUYV_P10_32BIT_MSB:
+	case FORMAT_YUYV_P10_32BIT_LSB:
+		is_packed = true;
+		break;
+	case FORMAT_YVYU:
+	case FORMAT_YVYU_P10_16BIT_MSB:
+	case FORMAT_YVYU_P10_16BIT_LSB:
+	case FORMAT_YVYU_P10_32BIT_MSB:
+	case FORMAT_YVYU_P10_32BIT_LSB:
+		is_packed = true;
+		is_cr_first = true;
+		break;
+	case FORMAT_UYVY:
+	case FORMAT_UYVY_P10_16BIT_MSB:
+	case FORMAT_UYVY_P10_16BIT_LSB:
+	case FORMAT_UYVY_P10_32BIT_MSB:
+	case FORMAT_UYVY_P10_32BIT_LSB:
+		is_packed = true;
+		is_packed_uv_first = true;
+		break;
+	case FORMAT_VYUY:
+	case FORMAT_VYUY_P10_16BIT_MSB:
+	case FORMAT_VYUY_P10_16BIT_LSB:
+	case FORMAT_VYUY_P10_32BIT_MSB:
+	case FORMAT_VYUY_P10_32BIT_LSB:
+		is_packed = true;
+		is_packed_uv_first = true;
+		is_cr_first = true;
+		break;
+	default:
+		break;
+	}
+
+	reg->src_fmt = ENC_PIC_SRC_FMT_C_FMT_IDC(c_fmt_idc) |
+		       ENC_PIC_SRC_FMT_CSC_24BIT(is_24bit) |
+		       ENC_PIC_SRC_FMT_CSC_AYUV(is_ayuv) |
+		       ENC_PIC_SRC_FMT_CSC_ENABLE(is_csc_format) |
+		       ENC_PIC_SRC_FMT_CSC_FMT_ORDER(opt->csc.fmt_order) |
+		       ENC_PIC_SRC_FMT_ENDIAN(open.source_endian) |
+		       ENC_PIC_SRC_FMT_10BIT_ORDER(is_lsb) |
+		       ENC_PIC_SRC_FMT_10BIT_3PIXEL_4BYTE(is_3p4b) |
+		       ENC_PIC_SRC_FMT_10BIT_ENABLE(is_10bit) |
+		       ENC_PIC_SRC_FMT_YUV422_PACKED_ORDER(is_packed_uv_first) |
+		       ENC_PIC_SRC_FMT_CBCR_ORDER(is_cr_first) |
+		       ENC_PIC_SRC_FMT_2PLANE(cbcr_interleave) |
+		       ENC_PIC_SRC_FMT_YUV422_PACKED(is_packed);
+	reg->bs_start = opt->pic_stream_buffer_addr;
+	reg->bs_size = opt->pic_stream_buffer_size;
+	reg->sec_axi = ENC_PIC_SEC_AXI_RDO_ENABLE(p_enc_info->sec_axi.use_enc_rdo) |
+		       ENC_PIC_SEC_AXI_LF_ENABLE(p_enc_info->sec_axi.use_enc_lf);
+	reg->report = ENC_PIC_REPORT_MV_HISTO_ENABLE(param.en_report_mv_histo);
+	reg->mv_histo0 = ENC_PIC_MV_HISTO0_THRESHOLD0(param.mv_histo_th0) |
+			 ENC_PIC_MV_HISTO0_THRESHOLD1(param.mv_histo_th1);
+	reg->mv_histo1 = ENC_PIC_MV_HISTO1_THRESHOLD2(param.mv_histo_th2) |
+			 ENC_PIC_MV_HISTO1_THRESHOLD3(param.mv_histo_th3);
+	reg->src_pic_idx = (opt->src_end) ? ENC_PIC_SRC_PIC_IDX_END : opt->src_idx;
+	reg->src_addr_y = opt->source_frame->buf_y;
+	reg->src_addr_u = opt->source_frame->buf_cb;
+	reg->src_addr_v = opt->source_frame->buf_cr;
+	reg->src_stride = ENC_PIC_SRC_STRIDE_L(opt->source_frame->stride) |
+			  ENC_PIC_SRC_STRIDE_C(stride_c);
+	reg->src_axi_sel = ENC_PIC_SRC_AXI_SEL_PRP_PORT;
+	reg->code_option = ENC_PIC_CODE_OPTION_ENCODE_VCL |
+			   ENC_PIC_CODE_OPTION_ENCODE_HEADER;
+	reg->param = ENC_PIC_PARAM_INTRA_4X4(param.intra_4x4) |
+		     ENC_PIC_PARAM_FORCE_PIC_TYPE(opt->force_pic_type) |
+		     ENC_PIC_PARAM_FORCE_PIC_TYPE_ENABLE(opt->force_pic) |
+		     ENC_PIC_PARAM_FORCE_PIC_QP_B(opt->force_pic_qp_b) |
+		     ENC_PIC_PARAM_FORCE_PIC_QP_P(opt->force_pic_qp_p) |
+		     ENC_PIC_PARAM_FORCE_PIC_QP_I(opt->force_pic_qp_i) |
+		     ENC_PIC_PARAM_FORCE_PIC_QP_ENABLE(opt->force_pic_qp) |
+		     ENC_PIC_PARAM_PIC_SKIP_FLAG(opt->skip_picture);
+	reg->timestamp_low = lower_32_bits(opt->timestamp);
+	reg->timestamp_high = upper_32_bits(opt->timestamp);
+	reg->csc_coeff[0] = ENC_PIC_CSC_COEFF0_RY(opt->csc.coef_ry) |
+			    ENC_PIC_CSC_COEFF0_GY(opt->csc.coef_gy) |
+			    ENC_PIC_CSC_COEFF0_BY(opt->csc.coef_by);
+	reg->csc_coeff[1] = ENC_PIC_CSC_COEFF1_RCB(opt->csc.coef_rcb) |
+			    ENC_PIC_CSC_COEFF1_GCB(opt->csc.coef_gcb) |
+			    ENC_PIC_CSC_COEFF1_BCB(opt->csc.coef_bcb);
+	reg->csc_coeff[2] = ENC_PIC_CSC_COEFF2_RCR(opt->csc.coef_rcr) |
+			    ENC_PIC_CSC_COEFF2_GCR(opt->csc.coef_gcr) |
+			    ENC_PIC_CSC_COEFF2_BCR(opt->csc.coef_bcr);
+	reg->csc_coeff[3] = ENC_PIC_CSC_COEFF3_OFFSET_Y(opt->csc.offset_y) |
+			    ENC_PIC_CSC_COEFF3_OFFSET_CB(opt->csc.offset_cb) |
+			    ENC_PIC_CSC_COEFF3_OFFSET_CR(opt->csc.offset_cr);
+}
+
+int wave6_vpu_encode(struct vpu_instance *inst, struct enc_param *option, u32 *fail_res)
+{
+	struct enc_cmd_enc_pic_reg reg;
+	struct enc_info *p_enc_info = &inst->codec_info->enc_info;
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	memset(&reg, 0, sizeof(struct enc_cmd_enc_pic_reg));
+
+	wave6_gen_enc_pic_reg(p_enc_info, inst->cbcr_interleave,
+			      inst->nv21, option, &reg);
+
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_BS_START, reg.bs_start);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_BS_SIZE, reg.bs_size);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_BS_OPTION, reg.bs_option);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SEC_AXI, reg.sec_axi);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_REPORT, reg.report);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_MV_HISTO0, reg.mv_histo0);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_MV_HISTO1, reg.mv_histo1);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CUSTOM_MAP_PARAM, reg.custom_map_param);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CUSTOM_MAP_ADDR, reg.custom_map_addr);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_PIC_IDX, reg.src_pic_idx);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_ADDR_Y, reg.src_addr_y);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_ADDR_U, reg.src_addr_u);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_ADDR_V, reg.src_addr_v);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_STRIDE, reg.src_stride);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_FMT, reg.src_fmt);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SRC_AXI_SEL, reg.src_axi_sel);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CODE_OPTION, reg.code_option);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_PARAM, reg.param);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_LONGTERM_PIC, reg.longterm_pic);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_PREFIX_SEI_NAL_ADDR, reg.prefix_sei_nal_addr);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_PREFIX_SEI_INFO, reg.prefix_sei_info);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SUFFIX_SEI_NAL_ADDR, reg.suffix_sei_nal_addr);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_SUFFIX_SEI_INFO, reg.suffix_sei_info);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_TIMESTAMP_LOW, reg.timestamp_low);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_TIMESTAMP_HIGH, reg.timestamp_high);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF0, reg.csc_coeff[0]);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF1, reg.csc_coeff[1]);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF2, reg.csc_coeff[2]);
+	vpu_write_reg(inst->dev, W6_CMD_ENC_PIC_CSC_COEFF3, reg.csc_coeff[3]);
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_ENC_PIC);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
+		return -ETIMEDOUT;
+	}
+
+	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
+		*fail_res = vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
+		wave6_print_reg_err(inst->dev, *fail_res);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int wave6_vpu_enc_get_result(struct vpu_instance *inst, struct enc_output_info *result)
+{
+	u32 reg_val;
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	ret = wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_GET_RESULT);
+	if (ret)
+		return ret;
+
+	result->encoding_success = vpu_read_reg(inst->dev, W6_RET_ENC_ENCODING_SUCCESS);
+	if (!result->encoding_success)
+		result->error_reason = vpu_read_reg(inst->dev, W6_RET_ENC_ERR_INFO);
+	else
+		result->warn_info = vpu_read_reg(inst->dev, W6_RET_DEC_WARN_INFO);
+
+	result->enc_pic_cnt = vpu_read_reg(inst->dev, W6_RET_ENC_PIC_NUM);
+	result->pic_type = vpu_read_reg(inst->dev, W6_RET_ENC_PIC_TYPE);
+	result->enc_vcl_nut = vpu_read_reg(inst->dev, W6_RET_ENC_VCL_NUT);
+	result->non_ref_pic = vpu_read_reg(inst->dev, W6_RET_ENC_PIC_NON_REF_PIC_FLAG);
+	result->num_of_slices = vpu_read_reg(inst->dev, W6_RET_ENC_PIC_SLICE_NUM);
+	result->pic_skipped = vpu_read_reg(inst->dev, W6_RET_ENC_PIC_SKIP);
+	result->num_of_intra = vpu_read_reg(inst->dev, W6_RET_ENC_PIC_NUM_INTRA);
+	result->num_of_merge = vpu_read_reg(inst->dev, W6_RET_ENC_PIC_NUM_MERGE);
+	result->num_of_skip_block = vpu_read_reg(inst->dev, W6_RET_ENC_PIC_NUM_SKIP);
+	result->avg_ctu_qp = vpu_read_reg(inst->dev, W6_RET_ENC_PIC_AVG_CTU_QP);
+	result->enc_pic_byte = vpu_read_reg(inst->dev, W6_RET_ENC_PIC_BYTE);
+	result->enc_gop_pic_idx = vpu_read_reg(inst->dev, W6_RET_ENC_GOP_PIC_IDX);
+	result->enc_pic_poc = vpu_read_reg(inst->dev, W6_RET_ENC_PIC_POC);
+	result->enc_src_idx = vpu_read_reg(inst->dev, W6_RET_ENC_USED_SRC_IDX);
+	result->wr_ptr = vpu_read_reg(inst->dev, W6_RET_ENC_WR_PTR);
+	result->rd_ptr = vpu_read_reg(inst->dev, W6_RET_ENC_RD_PTR);
+	result->bitstream_buffer = vpu_read_reg(inst->dev, W6_RET_ENC_RD_PTR);
+	result->pic_distortion_low = vpu_read_reg(inst->dev, W6_RET_ENC_PIC_DIST_LOW);
+	result->pic_distortion_high = vpu_read_reg(inst->dev, W6_RET_ENC_PIC_DIST_HIGH);
+	result->mv_histo.cnt0 = vpu_read_reg(inst->dev, W6_RET_ENC_HISTO_CNT0);
+	result->mv_histo.cnt1 = vpu_read_reg(inst->dev, W6_RET_ENC_HISTO_CNT1);
+	result->mv_histo.cnt2 = vpu_read_reg(inst->dev, W6_RET_ENC_HISTO_CNT2);
+	result->mv_histo.cnt3 = vpu_read_reg(inst->dev, W6_RET_ENC_HISTO_CNT3);
+	result->mv_histo.cnt4 = vpu_read_reg(inst->dev, W6_RET_ENC_HISTO_CNT4);
+	result->fme_sum.lower_x0 = vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME0_X_DIR_LOWER);
+	result->fme_sum.higher_x0 = vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME0_X_DIR_HIGHER);
+	result->fme_sum.lower_y0 = vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME0_Y_DIR_LOWER);
+	result->fme_sum.higher_y0 = vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME0_Y_DIR_HIGHER);
+	result->fme_sum.lower_x1 = vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME1_X_DIR_LOWER);
+	result->fme_sum.higher_x1 = vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME1_X_DIR_HIGHER);
+	result->fme_sum.lower_y1 = vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME1_Y_DIR_LOWER);
+	result->fme_sum.higher_y1 = vpu_read_reg(inst->dev, W6_RET_ENC_SUM_ME1_Y_DIR_HIGHER);
+	result->src_y_addr = vpu_read_reg(inst->dev, W6_RET_ENC_SRC_Y_ADDR);
+	result->custom_map_addr = vpu_read_reg(inst->dev, W6_RET_ENC_CUSTOM_MAP_ADDR);
+	result->prefix_sei_nal_addr = vpu_read_reg(inst->dev, W6_RET_ENC_PREFIX_SEI_NAL_ADDR);
+	result->suffix_sei_nal_addr = vpu_read_reg(inst->dev, W6_RET_ENC_SUFFIX_SEI_NAL_ADDR);
+
+	result->recon_frame_index = vpu_read_reg(inst->dev, W6_RET_ENC_PIC_IDX);
+	if (result->recon_frame_index == RECON_IDX_FLAG_HEADER_ONLY)
+		result->bitstream_size = result->enc_pic_byte;
+	else if (result->recon_frame_index < 0)
+		result->bitstream_size = 0;
+	else
+		result->bitstream_size = result->enc_pic_byte;
+
+	reg_val = vpu_read_reg(inst->dev, W6_RET_ENC_TIMESTAMP_LOW);
+	result->timestamp = vpu_read_reg(inst->dev, W6_RET_ENC_TIMESTAMP_HIGH);
+	result->timestamp = (result->timestamp << 32) | reg_val;
+
+	result->cycle.host_cmd_s = vpu_read_reg(inst->dev, W6_RET_CQ_IN_TICK);
+	result->cycle.host_cmd_e = vpu_read_reg(inst->dev, W6_RET_RQ_OUT_TICK);
+	result->cycle.proc_s = vpu_read_reg(inst->dev, W6_RET_HW_RUN_TICK);
+	result->cycle.proc_e = vpu_read_reg(inst->dev, W6_RET_HW_DONE_TICK);
+	result->cycle.vpu_s = vpu_read_reg(inst->dev, W6_RET_FW_RUN_TICK);
+	result->cycle.vpu_e = vpu_read_reg(inst->dev, W6_RET_FW_DONE_TICK);
+	result->cycle.frame_cycle = (result->cycle.vpu_e - result->cycle.host_cmd_s) *
+				    CYCLE_PER_TICK_VALUE;
+	result->cycle.proc_cycle = (result->cycle.proc_e - result->cycle.proc_s) *
+				   CYCLE_PER_TICK_VALUE;
+	result->cycle.vpu_cycle = ((result->cycle.vpu_e - result->cycle.vpu_s) -
+				   (result->cycle.proc_e - result->cycle.proc_s)) *
+				  CYCLE_PER_TICK_VALUE;
+
+	return 0;
+}
+
+int wave6_vpu_enc_fini_seq(struct vpu_instance *inst, u32 *fail_res)
+{
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_DESTROY_INSTANCE);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret)
+		return -ETIMEDOUT;
+
+	if (!vpu_read_reg(inst->dev, W6_RET_SUCCESS)) {
+		*fail_res = vpu_read_reg(inst->dev, W6_RET_FAIL_REASON);
+		wave6_print_reg_err(inst->dev, *fail_res);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_enc_check_gop_param(struct vpu_instance *inst, struct enc_codec_param *p_param)
+{
+	struct device *dev = inst->dev->dev;
+	int i;
+	bool low_delay = true;
+
+	if (p_param->gop_preset_idx == PRESET_IDX_CUSTOM_GOP) {
+		if (p_param->gop_param.size > 1) {
+			int min_val = p_param->gop_param.pic[0].poc_offset;
+
+			for (i = 1; i < p_param->gop_param.size; i++) {
+				if (min_val > p_param->gop_param.pic[i].poc_offset) {
+					low_delay = false;
+					break;
+				}
+				min_val = p_param->gop_param.pic[i].poc_offset;
+			}
+		}
+	} else if (p_param->gop_preset_idx == PRESET_IDX_ALL_I ||
+		   p_param->gop_preset_idx == PRESET_IDX_IPP ||
+		   p_param->gop_preset_idx == PRESET_IDX_IBBB ||
+		   p_param->gop_preset_idx == PRESET_IDX_IPPPP ||
+		   p_param->gop_preset_idx == PRESET_IDX_IBBBB ||
+		   p_param->gop_preset_idx == PRESET_IDX_IPP_SINGLE) {
+	}
+
+	if (p_param->gop_preset_idx >= PRESET_IDX_MAX) {
+		dev_err(dev, "gop_preset_idx: %d\n", p_param->gop_preset_idx);
+		return -EINVAL;
+	}
+
+	if (p_param->gop_preset_idx == PRESET_IDX_CUSTOM_GOP) {
+		if (p_param->gop_param.size < 1 ||
+		    p_param->gop_param.size > MAX_CUSTOM_GOP_NUM) {
+			dev_err(dev, "gop size: %d\n", p_param->gop_param.size);
+			return -EINVAL;
+		}
+		for (i = 0; i < p_param->gop_param.size; i++) {
+			struct custom_gop_pic_param pic = p_param->gop_param.pic[i];
+
+			if (pic.pic_type != PIC_TYPE_I &&
+			    pic.pic_type != PIC_TYPE_P &&
+			    pic.pic_type != PIC_TYPE_B) {
+				dev_err(dev, "pic[%d].pic_type: %d\n", i, pic.pic_type);
+				return -EINVAL;
+			}
+			if (pic.poc_offset < 1 ||
+			    pic.poc_offset > p_param->gop_param.size) {
+				dev_err(dev, "pic[%d].poc_offset: %d\n", i, pic.poc_offset);
+				return -EINVAL;
+			}
+			if (pic.temporal_id < 0 || pic.temporal_id > 3) {
+				dev_err(dev, "pic[%d].temporal_id: %d\n", i, pic.temporal_id);
+				return -EINVAL;
+			}
+		}
+		if (inst->std == W_AVC_ENC && !low_delay) {
+			for (i = 0; i < p_param->gop_param.size; i++) {
+				if (p_param->gop_param.pic[i].temporal_id > 0) {
+					dev_err(dev, "std: %d, pic[%d].temporal_id: %d\n",
+						inst->std, i,
+						p_param->gop_param.pic[i].temporal_id);
+					return -EINVAL;
+				}
+			}
+		}
+	}
+
+	if (inst->std == W_HEVC_ENC) {
+		if (p_param->decoding_refresh_type > DEC_REFRESH_TYPE_IDR) {
+			dev_err(dev, "decoding_refresh_type: %d\n", p_param->decoding_refresh_type);
+			return -EINVAL;
+		}
+	} else {
+		if (p_param->decoding_refresh_type != DEC_REFRESH_TYPE_NON_IRAP) {
+			dev_err(dev, "decoding_refresh_type: %d\n", p_param->decoding_refresh_type);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_enc_check_tile_slice_param(struct vpu_instance *inst,
+						int width, int height,
+						struct enc_codec_param *p_param)
+{
+	struct device *dev = inst->dev->dev;
+
+	if (p_param->slice_mode > 2) {
+		dev_err(dev, "slice_mode: %d\n", p_param->slice_mode);
+		return -EINVAL;
+	}
+	if (p_param->slice_mode == 1) {
+		unsigned int ctu_size = (inst->std == W_AVC_ENC) ? 16 : 64;
+		unsigned int mb_num = ((width + ctu_size - 1) / ctu_size) *
+				      ((height + ctu_size - 1) / ctu_size);
+
+		if (p_param->slice_arg < 1 || p_param->slice_arg > 0x3FFFF) {
+			dev_err(dev, "slice_arg: %d\n", p_param->slice_arg);
+			return -EINVAL;
+		}
+		if (p_param->slice_arg > mb_num) {
+			dev_info(dev, "slice_arg: %d, mb_num: %d\n",
+				 p_param->slice_arg, mb_num);
+			p_param->slice_arg = mb_num;
+		}
+		if (inst->std == W_AVC_ENC && p_param->slice_arg < 4) {
+			dev_info(dev, "std: %d, slice_arg: %d\n",
+				 inst->std, p_param->slice_arg);
+			p_param->slice_arg = 4;
+		}
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_enc_check_rc_param(struct vpu_instance *inst, struct enc_codec_param *p_param)
+{
+	struct device *dev = inst->dev->dev;
+
+	if (p_param->frame_rate < 1 || p_param->frame_rate > 960) {
+		dev_err(dev, "frame_rate: %d\n", p_param->frame_rate);
+		return -EINVAL;
+	}
+	if (p_param->bitrate > 1500000000) {
+		dev_err(dev, "bitrate: %d\n", p_param->bitrate);
+		return -EINVAL;
+	}
+	if (p_param->qp > 51) {
+		dev_err(dev, "qp: %d\n", p_param->qp);
+		return -EINVAL;
+	}
+	if (p_param->min_qp_i > 51 || p_param->min_qp_p > 51 || p_param->min_qp_b > 51) {
+		dev_err(dev, "min_qp_i: %d, min_qp_p: %d, min_qp_b: %d\n",
+			p_param->min_qp_i, p_param->min_qp_p, p_param->min_qp_b);
+		return -EINVAL;
+	}
+	if (p_param->max_qp_i > 51 || p_param->max_qp_p > 51 || p_param->max_qp_b > 51) {
+		dev_err(dev, "max_qp_i: %d, max_qp_p: %d, max_qp_b: %d\n",
+			p_param->max_qp_i, p_param->max_qp_p, p_param->max_qp_b);
+		return -EINVAL;
+	}
+	if (p_param->min_qp_i > p_param->max_qp_i) {
+		dev_err(dev, "min_qp_i: %d, max_qp_i: %d\n", p_param->min_qp_i, p_param->max_qp_i);
+		return -EINVAL;
+	}
+	if (p_param->min_qp_p > p_param->max_qp_p) {
+		dev_err(dev, "min_qp_p: %d, max_qp_p: %d\n", p_param->min_qp_p, p_param->max_qp_p);
+		return -EINVAL;
+	}
+	if (p_param->min_qp_b > p_param->max_qp_b) {
+		dev_err(dev, "min_qp_b: %d, max_qp_b: %d\n", p_param->min_qp_b, p_param->max_qp_b);
+		return -EINVAL;
+	}
+	if (p_param->rc_initial_qp < -1 || p_param->rc_initial_qp > 51) {
+		dev_err(dev, "rc_initial_qp: %d\n", p_param->rc_initial_qp);
+		return -EINVAL;
+	}
+	if (p_param->en_rate_control != 1 && p_param->en_rate_control != 0) {
+		dev_err(dev, "en_rate_control: %d\n", p_param->en_rate_control);
+		return -EINVAL;
+	}
+	if (p_param->rc_mode > 1) {
+		dev_err(dev, "rc_mode: %d\n", p_param->rc_mode);
+		return -EINVAL;
+	}
+	if (p_param->en_rate_control) {
+		if (p_param->bitrate <= p_param->frame_rate) {
+			dev_err(dev, "bitrate: %d, frame_rate: %d\n",
+				p_param->bitrate, p_param->frame_rate);
+			return -EINVAL;
+		}
+		if (p_param->rc_initial_qp != -1) {
+			if (p_param->rc_initial_qp < p_param->min_qp_i) {
+				dev_err(dev, "rc_initial_qp: %d, min_qp_i: %d\n",
+					p_param->rc_initial_qp, p_param->min_qp_i);
+				return -EINVAL;
+			}
+			if (p_param->rc_initial_qp > p_param->max_qp_i) {
+				dev_err(dev, "rc_initial_qp: %d, max_qp_i: %d\n",
+					p_param->rc_initial_qp, p_param->max_qp_i);
+				return -EINVAL;
+			}
+		}
+	} else {
+		if (p_param->qp < p_param->min_qp_i) {
+			dev_err(dev, "qp: %d, min_qp_i: %d\n", p_param->qp, p_param->min_qp_i);
+			return -EINVAL;
+		}
+		if (p_param->qp < p_param->min_qp_p) {
+			dev_err(dev, "qp: %d, min_qp_p: %d\n", p_param->qp, p_param->min_qp_p);
+			return -EINVAL;
+		}
+		if (p_param->qp < p_param->min_qp_b) {
+			dev_err(dev, "qp: %d, min_qp_b: %d\n", p_param->qp, p_param->min_qp_b);
+			return -EINVAL;
+		}
+		if (p_param->qp > p_param->max_qp_i) {
+			dev_err(dev, "qp: %d, max_qp_i: %d\n", p_param->qp, p_param->max_qp_i);
+			return -EINVAL;
+		}
+		if (p_param->qp > p_param->max_qp_p) {
+			dev_err(dev, "qp: %d, max_qp_p: %d\n", p_param->qp, p_param->max_qp_p);
+			return -EINVAL;
+		}
+		if (p_param->qp > p_param->max_qp_b) {
+			dev_err(dev, "qp: %d, max_qp_b: %d\n", p_param->qp, p_param->max_qp_b);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_enc_check_intra_param(struct vpu_instance *inst,
+					   int width, int height,
+					   struct enc_codec_param *p_param)
+{
+	struct device *dev = inst->dev->dev;
+	unsigned int ctu_size = (inst->std == W_AVC_ENC) ? 16 : 64;
+	unsigned int num_ctu_col = (width + ctu_size - 1) / ctu_size;
+	unsigned int num_ctu_row = (height + ctu_size - 1) / ctu_size;
+
+	if (p_param->intra_refresh_mode > INTRA_REFRESH_COLUMN) {
+		dev_err(dev, "intra_refresh_mode: %d\n", p_param->intra_refresh_mode);
+		return -EINVAL;
+	}
+	if (p_param->intra_refresh_mode != INTRA_REFRESH_NONE) {
+		if (p_param->intra_refresh_arg < 1 || p_param->intra_refresh_arg > 511) {
+			dev_err(dev, "intra_refresh_arg: %d\n", p_param->intra_refresh_arg);
+			return -EINVAL;
+		}
+	}
+	if (p_param->intra_refresh_mode == INTRA_REFRESH_ROW &&
+	    p_param->intra_refresh_arg > num_ctu_row) {
+		dev_err(dev, "intra_refresh_mode: %d, intra_refresh_arg: %d\n",
+			p_param->intra_refresh_mode, p_param->intra_refresh_arg);
+		return -EINVAL;
+	}
+	if (p_param->intra_refresh_mode == INTRA_REFRESH_COLUMN &&
+	    p_param->intra_refresh_arg > num_ctu_col) {
+		dev_err(dev, "intra_refresh_mode: %d, intra_refresh_arg: %d\n",
+			p_param->intra_refresh_mode, p_param->intra_refresh_arg);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_enc_check_custom_param(struct vpu_instance *inst,
+					    struct enc_codec_param *p_param)
+{
+	struct device *dev = inst->dev->dev;
+	int i;
+
+	if (p_param->en_custom_lambda != 1 && p_param->en_custom_lambda != 0) {
+		dev_err(dev, "en_custom_lambda: %d\n", p_param->en_custom_lambda);
+		return -EINVAL;
+	}
+	for (i = 0; i < MAX_CUSTOM_LAMBDA_NUM; i++) {
+		if (p_param->lambda_ssd[i] > 16383) {
+			dev_err(dev, "lambda_ssd[%d]: %d\n", i, p_param->lambda_ssd[i]);
+			return -EINVAL;
+		}
+		if (p_param->lambda_sad[i] > 127) {
+			dev_err(dev, "lambda_sad[%d]: %d\n", i, p_param->lambda_sad[i]);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_enc_check_conf_win_size_param(struct vpu_instance *inst,
+						   int width, int height,
+						   struct vpu_rect conf_win)
+{
+	struct device *dev = inst->dev->dev;
+
+	if (conf_win.left % 2 || conf_win.top % 2 || conf_win.right % 2 || conf_win.bottom % 2) {
+		dev_err(dev, "conf_win left: %d, top: %d, right: %d, bottom: %d\n",
+			conf_win.left, conf_win.top, conf_win.right, conf_win.bottom);
+		return -EINVAL;
+	}
+	if (conf_win.left > 8192 || conf_win.top > 8192 ||
+	    conf_win.right > 8192 || conf_win.bottom > 8192) {
+		dev_err(dev, "conf_win left: %d, top: %d, right: %d, bottom: %d\n",
+			conf_win.left, conf_win.top, conf_win.right, conf_win.bottom);
+		return -EINVAL;
+	}
+	if ((conf_win.right + conf_win.left) > width) {
+		dev_err(dev, "conf_win.left: %d, conf_win.right: %d, width: %d\n",
+			conf_win.left, conf_win.right, width);
+		return -EINVAL;
+	}
+	if ((conf_win.bottom + conf_win.top) > height) {
+		dev_err(dev, "conf_win.top: %d, conf_win.bottom: %d, height: %d\n",
+			conf_win.top, conf_win.bottom, height);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int wave6_vpu_enc_check_temporal_layer_param(struct vpu_instance *inst,
+						    struct enc_codec_param *p_param)
+{
+	struct device *dev = inst->dev->dev;
+	int i;
+
+	if (p_param->temp_layer_cnt < 1 || p_param->temp_layer_cnt > 4) {
+		dev_err(dev, "temp_layer_cnt: %d\n", p_param->temp_layer_cnt);
+		return -EINVAL;
+	}
+	if (p_param->temp_layer_cnt > 1) {
+		if (p_param->gop_preset_idx == PRESET_IDX_CUSTOM_GOP ||
+		    p_param->gop_preset_idx == PRESET_IDX_ALL_I) {
+			dev_err(dev, "temp_layer_cnt: %d, gop_preset_idx: %d\n",
+				p_param->temp_layer_cnt, p_param->gop_preset_idx);
+			return -EINVAL;
+		}
+	}
+	for (i = 0; i < MAX_NUM_CHANGEABLE_TEMP_LAYER; i++) {
+		if (p_param->temp_layer[i].change_qp != 1 &&
+		    p_param->temp_layer[i].change_qp != 0) {
+			dev_err(dev, "temp_layer[%d].change_qp: %d\n",
+				i, p_param->temp_layer[i].change_qp);
+			return -EINVAL;
+		}
+		if (p_param->temp_layer[i].qp_b > 51) {
+			dev_err(dev, "temp_layer[%d].qp_b: %d\n", i, p_param->temp_layer[i].qp_b);
+			return -EINVAL;
+		}
+		if (p_param->temp_layer[i].qp_p > 51) {
+			dev_err(dev, "temp_layer[%d].qp_p: %d\n", i, p_param->temp_layer[i].qp_p);
+			return -EINVAL;
+		}
+		if (p_param->temp_layer[i].qp_i > 51) {
+			dev_err(dev, "temp_layer[%d].qp_i: %d\n", i, p_param->temp_layer[i].qp_i);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+int wave6_vpu_enc_check_open_param(struct vpu_instance *inst, struct enc_open_param *pop)
+{
+	struct device *dev = inst->dev->dev;
+	struct vpu_attr *attr = &inst->dev->attr;
+	struct enc_codec_param *p_param = &pop->codec_param;
+
+	if (!(BIT(inst->std) & attr->support_encoders)) {
+		dev_err(dev, "std: %d, support_encoders: 0x%x\n",
+			inst->std, attr->support_encoders);
+		return -EOPNOTSUPP;
+	}
+	if (pop->pic_width % W6_ENC_PIC_SIZE_STEP || pop->pic_height % W6_ENC_PIC_SIZE_STEP) {
+		dev_err(dev, "pic_width: %d | pic_height: %d\n", pop->pic_width, pop->pic_height);
+		return -EINVAL;
+	}
+	if (pop->pic_width < W6_MIN_ENC_PIC_WIDTH || pop->pic_width > W6_MAX_ENC_PIC_WIDTH) {
+		dev_err(dev, "pic_width: %d\n", pop->pic_width);
+		return -EINVAL;
+	}
+	if (pop->pic_height < W6_MIN_ENC_PIC_HEIGHT || pop->pic_height > W6_MAX_ENC_PIC_HEIGHT) {
+		dev_err(dev, "pic_height: %d\n", pop->pic_height);
+		return -EINVAL;
+	}
+	if (pop->src_format == FORMAT_RGB_32BIT_PACKED ||
+	    pop->src_format == FORMAT_YUV444_32BIT_PACKED ||
+	    pop->src_format == FORMAT_RGB_P10_32BIT_PACKED ||
+	    pop->src_format == FORMAT_YUV444_P10_32BIT_PACKED ||
+	    pop->src_format == FORMAT_RGB_24BIT_PACKED ||
+	    pop->src_format == FORMAT_YUV444_24BIT_PACKED) {
+		if (!inst->cbcr_interleave) {
+			dev_err(dev, "src_format: %d, cbcr_interleave: %d\n",
+				pop->src_format, inst->cbcr_interleave);
+			return -EINVAL;
+		}
+		if (inst->nv21) {
+			dev_err(dev, "src_format: %d, nv21: %d\n",
+				pop->src_format, inst->nv21);
+			return -EINVAL;
+		}
+		if (pop->mir_dir || pop->rot_angle) {
+			dev_warn(dev, "rot/mir is not supported (fmt %d)\n",
+				 pop->src_format);
+			pop->mir_dir = MIR_NONE;
+			pop->rot_angle = ROT_0;
+		}
+	}
+	if (pop->src_format == FORMAT_YUV444_24BIT) {
+		if (!inst->cbcr_interleave) {
+			dev_err(dev, "src_format: %d, cbcr_interleave: %d\n",
+				pop->src_format, inst->cbcr_interleave);
+			return -EINVAL;
+		}
+		if (pop->mir_dir || pop->rot_angle) {
+			dev_warn(dev, "rot/mir is not supported (fmt %d)\n",
+				 pop->src_format);
+			pop->mir_dir = MIR_NONE;
+			pop->rot_angle = ROT_0;
+		}
+	}
+
+	if (wave6_vpu_enc_check_gop_param(inst, p_param)) {
+		dev_err(dev, "failed wave6_vpu_enc_check_gop_param()\n");
+		return -EINVAL;
+	}
+	if (wave6_vpu_enc_check_tile_slice_param(inst, pop->pic_width, pop->pic_height, p_param)) {
+		dev_err(dev, "failed wave6_vpu_enc_check_tile_slice_param()\n");
+		return -EINVAL;
+	}
+	if (wave6_vpu_enc_check_rc_param(inst, p_param)) {
+		dev_err(dev, "failed wave6_vpu_enc_check_rc_param()\n");
+		return -EINVAL;
+	}
+	if (wave6_vpu_enc_check_intra_param(inst, pop->pic_width, pop->pic_height, p_param)) {
+		dev_err(dev, "failed wave6_vpu_enc_check_intra_param()\n");
+		return -EINVAL;
+	}
+	if (wave6_vpu_enc_check_custom_param(inst, p_param)) {
+		dev_err(dev, "failed wave6_vpu_enc_check_custom_param()\n");
+		return -EINVAL;
+	}
+	if (wave6_vpu_enc_check_conf_win_size_param(inst, pop->pic_width, pop->pic_height,
+						    p_param->conf_win)) {
+		dev_err(dev, "failed wave6_vpu_enc_check_conf_win_size_param()\n");
+		return -EINVAL;
+	}
+	if (wave6_vpu_enc_check_temporal_layer_param(inst, p_param)) {
+		dev_err(dev, "failed wave6_vpu_enc_check_temporal_layer_param()\n");
+		return -EINVAL;
+	}
+
+	if (p_param->internal_bit_depth != 8 && p_param->internal_bit_depth != 10) {
+		dev_err(dev, "internal_bit_depth: %d\n", p_param->internal_bit_depth);
+		return -EINVAL;
+	}
+	if (p_param->intra_period > 2047) {
+		dev_err(dev, "intra_period: %d\n", p_param->intra_period);
+		return -EINVAL;
+	}
+	if (p_param->intra_period == 1 && p_param->gop_preset_idx == PRESET_IDX_ALL_I) {
+		dev_err(dev, "intra_period: %d, gop_preset_idx: %d\n",
+			p_param->intra_period, p_param->gop_preset_idx);
+		return -EINVAL;
+	}
+	if (p_param->en_longterm != 1 && p_param->en_longterm != 0) {
+		dev_err(dev, "en_longterm: %d\n", p_param->en_longterm);
+		return -EINVAL;
+	}
+	if (p_param->cpb_size < 10 || p_param->cpb_size > 100000) {
+		dev_err(dev, "cpb_size: %d\n", p_param->cpb_size);
+		return -EINVAL;
+	}
+	if (p_param->en_cu_level_rate_control != 1 && p_param->en_cu_level_rate_control != 0) {
+		dev_err(dev, "en_cu_level_rate_control: %d\n", p_param->en_cu_level_rate_control);
+		return -EINVAL;
+	}
+	if (p_param->en_skip_frame != 1 && p_param->en_skip_frame != 0) {
+		dev_err(dev, "en_skip_frame: %d\n", p_param->en_skip_frame);
+		return -EINVAL;
+	}
+	if (p_param->en_hvs_qp != 1 && p_param->en_hvs_qp != 0) {
+		dev_err(dev, "en_hvs_qp: %d\n", p_param->en_hvs_qp);
+		return -EINVAL;
+	}
+	if (p_param->en_hvs_qp) {
+		if (p_param->hvs_qp_scale_div2 < 1 || p_param->hvs_qp_scale_div2 > 4) {
+			dev_err(dev, "hvs_qp_scale_div2: %d\n", p_param->hvs_qp_scale_div2);
+			return -EINVAL;
+		}
+	}
+	if (p_param->max_delta_qp > 12) {
+		dev_err(dev, "max_delta_qp: %d\n", p_param->max_delta_qp);
+		return -EINVAL;
+	}
+	if (p_param->rc_update_speed > 255) {
+		dev_err(dev, "rc_update_speed: %d\n", p_param->rc_update_speed);
+		return -EINVAL;
+	}
+	if (p_param->max_bitrate > 1500000000) {
+		dev_err(dev, "max_bitrate: %d\n", p_param->max_bitrate);
+		return -EINVAL;
+	}
+	if (p_param->rc_initial_level > 15) {
+		dev_err(dev, "rc_initial_level: %d\n", p_param->rc_initial_level);
+		return -EINVAL;
+	}
+	if (p_param->pic_rc_max_dqp > 51) {
+		dev_err(dev, "pic_rc_max_dqp: %d\n", p_param->pic_rc_max_dqp);
+		return -EINVAL;
+	}
+	if (p_param->en_bg_detect != 1 && p_param->en_bg_detect != 0) {
+		dev_err(dev, "en_bg_detect: %d\n", p_param->en_bg_detect);
+		return -EINVAL;
+	}
+	if (p_param->bg_th_diff > 255) {
+		dev_err(dev, "bg_th_diff: %d\n", p_param->bg_th_diff);
+		return -EINVAL;
+	}
+	if (p_param->bg_th_mean_diff > 255) {
+		dev_err(dev, "bg_th_mean_diff: %d\n", p_param->bg_th_mean_diff);
+		return -EINVAL;
+	}
+	if (p_param->bg_delta_qp < -16 || p_param->bg_delta_qp > 15) {
+		dev_err(dev, "bg_delta_qp: %d\n", p_param->bg_delta_qp);
+		return -EINVAL;
+	}
+	if (p_param->en_dbk != 1 && p_param->en_dbk != 0) {
+		dev_err(dev, "en_dbk: %d\n", p_param->en_dbk);
+		return -EINVAL;
+	}
+	if (p_param->en_scaling_list != 1 && p_param->en_scaling_list != 0) {
+		dev_err(dev, "en_scaling_list: %d\n", p_param->en_scaling_list);
+		return -EINVAL;
+	}
+	if (p_param->qround_intra > 255) {
+		dev_err(dev, "qround_intra: %d\n", p_param->qround_intra);
+		return -EINVAL;
+	}
+	if (p_param->qround_inter > 255) {
+		dev_err(dev, "qround_inter: %d\n", p_param->qround_inter);
+		return -EINVAL;
+	}
+	if (p_param->lambda_dqp_intra < -32 || p_param->lambda_dqp_intra > 31) {
+		dev_err(dev, "lambda_dqp_intra: %d\n", p_param->lambda_dqp_intra);
+		return -EINVAL;
+	}
+	if (p_param->lambda_dqp_inter < -32 || p_param->lambda_dqp_inter > 31) {
+		dev_err(dev, "lambda_dqp_inter: %d\n", p_param->lambda_dqp_inter);
+		return -EINVAL;
+	}
+	if (p_param->en_qround_offset != 1 && p_param->en_qround_offset != 0) {
+		dev_err(dev, "en_qround_offset: %d\n", p_param->en_qround_offset);
+		return -EINVAL;
+	}
+	if (p_param->forced_idr_header > 2) {
+		dev_err(dev, "forced_idr_header: %d\n", p_param->forced_idr_header);
+		return -EINVAL;
+	}
+	if (p_param->num_units_in_tick > INT_MAX) {
+		dev_err(dev, "num_units_in_tick: %d\n", p_param->num_units_in_tick);
+		return -EINVAL;
+	}
+	if (p_param->time_scale > INT_MAX) {
+		dev_err(dev, "time_scale: %d\n", p_param->time_scale);
+		return -EINVAL;
+	}
+	if (p_param->max_intra_pic_bit > 1500000000) {
+		dev_err(dev, "max_intra_pic_bit: %d\n", p_param->max_intra_pic_bit);
+		return -EINVAL;
+	}
+	if (p_param->max_inter_pic_bit > 1500000000) {
+		dev_err(dev, "max_inter_pic_bit: %d\n", p_param->max_inter_pic_bit);
+		return -EINVAL;
+	}
+
+	if (p_param->color.color_range > 1) {
+		dev_err(dev, "color_range: %d\n", p_param->color.color_range);
+		return -EINVAL;
+	}
+	if (p_param->color.matrix_coefficients > 255) {
+		dev_err(dev, "matrix_coefficients: %d\n", p_param->color.matrix_coefficients);
+		return -EINVAL;
+	}
+	if (p_param->color.transfer_characteristics > 255) {
+		dev_err(dev, "transfer_characteristics: %d\n",
+			p_param->color.transfer_characteristics);
+		return -EINVAL;
+	}
+	if (p_param->color.color_primaries > 255) {
+		dev_err(dev, "color_primaries: %d\n", p_param->color.color_primaries);
+		return -EINVAL;
+	}
+	if (inst->std == W_HEVC_ENC) {
+		if (p_param->internal_bit_depth == 10 && !attr->support_hevc10bit_enc) {
+			dev_err(dev, "internal_bit_depth: %d, support_hevc10bit_enc: %d\n",
+				p_param->internal_bit_depth, attr->support_hevc10bit_enc);
+			return -EOPNOTSUPP;
+		}
+		if (p_param->idr_period != 0) {
+			dev_err(dev, "idr_period: %d\n", p_param->idr_period);
+			return -EINVAL;
+		}
+		if (p_param->en_intra_smooth != 1 &&
+		    p_param->en_intra_smooth != 0) {
+			dev_err(dev, "en_intra_smooth: %d\n", p_param->en_intra_smooth);
+			return -EINVAL;
+		}
+		if (p_param->en_const_intra_pred != 1 &&
+		    p_param->en_const_intra_pred != 0) {
+			dev_err(dev, "en_const_intra_pred: %d\n",
+				p_param->en_const_intra_pred);
+			return -EINVAL;
+		}
+		if (p_param->en_temporal_mvp != 1 && p_param->en_temporal_mvp != 0) {
+			dev_err(dev, "en_temporal_mvp: %d\n", p_param->en_temporal_mvp);
+			return -EINVAL;
+		}
+		if (p_param->en_cabac != 0) {
+			dev_err(dev, "en_cabac: %d\n", p_param->en_cabac);
+			return -EINVAL;
+		}
+		if (p_param->en_transform8x8 != 0) {
+			dev_err(dev, "en_transform8x8: %d\n", p_param->en_transform8x8);
+			return -EINVAL;
+		}
+		if (p_param->en_lf_slice_boundary != 1 &&
+		    p_param->en_lf_slice_boundary != 0) {
+			dev_err(dev, "en_lf_slice_boundary: %d\n",
+				p_param->en_lf_slice_boundary);
+			return -EINVAL;
+		}
+		if (p_param->beta_offset_div2 < -6 || p_param->beta_offset_div2 > 6) {
+			dev_err(dev, "beta_offset_div2: %d\n", p_param->beta_offset_div2);
+			return -EINVAL;
+		}
+		if (p_param->tc_offset_div2 < -6 || p_param->tc_offset_div2 > 6) {
+			dev_err(dev, "tc_offset_div2: %d\n", p_param->tc_offset_div2);
+			return -EINVAL;
+		}
+		if (p_param->en_sao != 1 && p_param->en_sao != 0) {
+			dev_err(dev, "en_sao: %d\n", p_param->en_sao);
+			return -EINVAL;
+		}
+		if (p_param->cb_qp_offset < -12 || p_param->cb_qp_offset > 12) {
+			dev_err(dev, "cb_qp_offset: %d\n", p_param->cb_qp_offset);
+			return -EINVAL;
+		}
+		if (p_param->cr_qp_offset < -12 || p_param->cr_qp_offset > 12) {
+			dev_err(dev, "cr_qp_offset: %d\n", p_param->cr_qp_offset);
+			return -EINVAL;
+		}
+		if (p_param->en_still_picture != 1 && p_param->en_still_picture != 0) {
+			dev_err(dev, "en_still_picture: %d\n", p_param->en_still_picture);
+			return -EINVAL;
+		}
+		if (p_param->tier > 1) {
+			dev_err(dev, "tier: %d\n", p_param->tier);
+			return -EINVAL;
+		}
+		if (p_param->profile > HEVC_PROFILE_STILLPICTURE) {
+			dev_err(dev, "profile: %d\n", p_param->profile);
+			return -EINVAL;
+		}
+		if (p_param->internal_bit_depth == 10 && p_param->profile == HEVC_PROFILE_MAIN) {
+			dev_err(dev, "internal_bit_depth: %d, profile: %d\n",
+				p_param->internal_bit_depth, p_param->profile);
+			return -EINVAL;
+		}
+		if (p_param->num_ticks_poc_diff_one < 1 ||
+		    p_param->num_ticks_poc_diff_one > 65535) {
+			dev_err(dev, "num_ticks_poc_diff_one: %d\n",
+				p_param->num_ticks_poc_diff_one);
+			return -EINVAL;
+		}
+		if (p_param->intra_4x4 > 3 || p_param->intra_4x4 == 1) {
+			dev_err(dev, "intra_4x4: %d\n", p_param->intra_4x4);
+			return -EINVAL;
+		}
+	} else if (inst->std == W_AVC_ENC) {
+		if (p_param->internal_bit_depth == 10 && !attr->support_avc10bit_enc) {
+			dev_err(dev, "internal_bit_depth: %d, support_avc10bit_enc: %d\n",
+				p_param->internal_bit_depth, attr->support_avc10bit_enc);
+			return -EOPNOTSUPP;
+		}
+		if (p_param->idr_period > 2047) {
+			dev_err(dev, "idr_period: %d\n", p_param->idr_period);
+			return -EINVAL;
+		}
+		if (p_param->idr_period == 1 && p_param->gop_preset_idx == PRESET_IDX_ALL_I) {
+			dev_err(dev, "idr_period: %d, gop_preset_idx: %d\n",
+				p_param->idr_period, p_param->gop_preset_idx);
+			return -EINVAL;
+		}
+		if (p_param->en_intra_smooth != 0) {
+			dev_err(dev, "en_intra_smooth: %d\n", p_param->en_intra_smooth);
+			return -EINVAL;
+		}
+		if (p_param->en_const_intra_pred != 1 &&
+		    p_param->en_const_intra_pred != 0) {
+			dev_err(dev, "en_const_intra_pred: %d\n",
+				p_param->en_const_intra_pred);
+			return -EINVAL;
+		}
+		if (p_param->en_temporal_mvp != 0) {
+			dev_err(dev, "en_temporal_mvp: %d\n", p_param->en_temporal_mvp);
+			return -EINVAL;
+		}
+		if (p_param->en_cabac != 1 && p_param->en_cabac != 0) {
+			dev_err(dev, "en_cabac: %d\n", p_param->en_cabac);
+			return -EINVAL;
+		}
+		if (p_param->en_transform8x8 != 1 && p_param->en_transform8x8 != 0) {
+			dev_err(dev, "en_transform8x8: %d\n", p_param->en_transform8x8);
+			return -EINVAL;
+		}
+		if (p_param->en_lf_slice_boundary != 1 &&
+		    p_param->en_lf_slice_boundary != 0) {
+			dev_err(dev, "en_lf_slice_boundary: %d\n",
+				p_param->en_lf_slice_boundary);
+			return -EINVAL;
+		}
+		if (p_param->beta_offset_div2 < -6 || p_param->beta_offset_div2 > 6) {
+			dev_err(dev, "beta_offset_div2: %d\n", p_param->beta_offset_div2);
+			return -EINVAL;
+		}
+		if (p_param->tc_offset_div2 < -6 || p_param->tc_offset_div2 > 6) {
+			dev_err(dev, "tc_offset_div2: %d\n", p_param->tc_offset_div2);
+			return -EINVAL;
+		}
+		if (p_param->en_sao != 0) {
+			dev_err(dev, "en_sao: %d\n", p_param->en_sao);
+			return -EINVAL;
+		}
+		if (p_param->cb_qp_offset < -12 || p_param->cb_qp_offset > 12) {
+			dev_err(dev, "cb_qp_offset: %d\n", p_param->cb_qp_offset);
+			return -EINVAL;
+		}
+		if (p_param->cr_qp_offset < -12 || p_param->cr_qp_offset > 12) {
+			dev_err(dev, "cr_qp_offset: %d\n", p_param->cr_qp_offset);
+			return -EINVAL;
+		}
+		if (p_param->en_still_picture != 0) {
+			dev_err(dev, "en_still_picture: %d\n", p_param->en_still_picture);
+			return -EINVAL;
+		}
+		if (p_param->tier != 0) {
+			dev_err(dev, "tier: %d\n", p_param->tier);
+			return -EINVAL;
+		}
+		if (p_param->profile > H264_PROFILE_HIGH10) {
+			dev_err(dev, "profile: %d\n", p_param->profile);
+			return -EINVAL;
+		}
+		if (p_param->profile) {
+			if (p_param->internal_bit_depth == 10 &&
+			    p_param->profile != H264_PROFILE_HIGH10) {
+				dev_err(dev, "internal_bit_depth: %d, profile: %d\n",
+					p_param->internal_bit_depth, p_param->profile);
+				return -EINVAL;
+			}
+		}
+		if (p_param->num_ticks_poc_diff_one != 0) {
+			dev_err(dev, "num_ticks_poc_diff_one: %d\n",
+				p_param->num_ticks_poc_diff_one);
+			return -EINVAL;
+		}
+		if (p_param->intra_4x4 != 0) {
+			dev_err(dev, "intra_4x4: %d\n", p_param->intra_4x4);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.h b/drivers/media/platform/chips-media/wave6/wave6-hw.h
new file mode 100644
index 000000000000..631b3f31364a
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-hw.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 backend interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_HW_H__
+#define __WAVE6_HW_H__
+
+enum product_id {
+	PRODUCT_ID_617,
+	PRODUCT_ID_627,
+	PRODUCT_ID_637,
+	PRODUCT_ID_NONE,
+};
+
+#define COMMAND_QUEUE_DEPTH		1
+#define SINGLE_CORE_IDC			1
+#define SINGLE_CORE			1
+
+#define DECODE_ALL_TEMPORAL_LAYERS	0
+#define DECODE_ALL_SPATIAL_LAYERS	0
+
+#define PIXEL_ORDER_INCREASING		1
+
+#define WTL_RIGHT_JUSTIFIED		0
+#define WTL_LEFT_JUSTIFIED		1
+#define WTL_PIXEL_8BIT			0
+#define WTL_PIXEL_16BIT			1
+#define WTL_PIXEL_32BIT			2
+
+#define MAX_CSC_COEFF_NUM		4
+
+#define CYCLE_PER_TICK_VALUE		256
+
+#define H265_NAL_UNIT_TYPE_IDR_W_RADL	19
+#define H265_NAL_UNIT_TYPE_IDR_N_LP	20
+
+#define H264_NAL_UNIT_TYPE_IDR_PICTURE	5
+
+bool wave6_vpu_is_init(struct vpu_core_device *core);
+int wave6_vpu_get_version(struct vpu_core_device *core);
+void wave6_vpu_enable_interrupt(struct vpu_core_device *core);
+
+int wave6_vpu_dec_check_open_param(struct vpu_instance *inst,
+				   struct dec_open_param *param);
+int wave6_vpu_build_up_dec_param(struct vpu_instance *inst, struct dec_open_param *param);
+int wave6_vpu_dec_register_frame_buffer(struct vpu_instance *inst,
+					struct frame_buffer *fb_arr, enum tiled_map_type map_type,
+					uint32_t count);
+int wave6_vpu_dec_register_display_buffer(struct vpu_instance *inst, struct frame_buffer fb);
+int wave6_vpu_dec_init_seq(struct vpu_instance *inst);
+int wave6_vpu_dec_get_seq_info(struct vpu_instance *inst, struct dec_seq_info *info);
+int wave6_vpu_decode(struct vpu_instance *inst, struct dec_param *option, u32 *fail_res);
+int wave6_vpu_dec_get_result(struct vpu_instance *inst, struct dec_output_info *result);
+int wave6_vpu_dec_fini_seq(struct vpu_instance *inst, u32 *fail_res);
+dma_addr_t wave6_vpu_dec_get_rd_ptr(struct vpu_instance *inst);
+int wave6_vpu_dec_flush(struct vpu_instance *inst);
+
+int wave6_vpu_build_up_enc_param(struct device *dev, struct vpu_instance *inst,
+				 struct enc_open_param *param);
+int wave6_vpu_enc_init_seq(struct vpu_instance *inst);
+int wave6_vpu_enc_change_seq(struct vpu_instance *inst, bool *changed);
+int wave6_vpu_enc_get_seq_info(struct vpu_instance *inst, struct enc_seq_info *info);
+int wave6_vpu_enc_register_frame_buffer(struct vpu_instance *inst,
+					struct frame_buffer *fb_arr);
+int wave6_vpu_encode(struct vpu_instance *inst, struct enc_param *option, u32 *fail_res);
+int wave6_vpu_enc_get_result(struct vpu_instance *inst, struct enc_output_info *result);
+int wave6_vpu_enc_fini_seq(struct vpu_instance *inst, u32 *fail_res);
+int wave6_vpu_enc_check_open_param(struct vpu_instance *inst, struct enc_open_param *pop);
+
+#endif /* __WAVE6_HW_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
new file mode 100644
index 000000000000..59029cbe65dc
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
@@ -0,0 +1,641 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 register definitions
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_REGDEFINE_H__
+#define __WAVE6_REGDEFINE_H__
+
+enum wave6_command {
+	W6_CMD_INIT_VPU		= 0x0001,
+	W6_CMD_WAKEUP_VPU	= 0x0002,
+	W6_CMD_SLEEP_VPU	= 0x0004,
+	W6_CMD_CREATE_INSTANCE	= 0x0008,
+	W6_CMD_FLUSH_INSTANCE	= 0x0010,
+	W6_CMD_DESTROY_INSTANCE	= 0x0020,
+	W6_CMD_INIT_SEQ		= 0x0040,
+	W6_CMD_SET_FB		= 0x0080,
+	W6_CMD_DEC_PIC		= 0x0100,
+	W6_CMD_ENC_PIC		= 0x0100,
+	W6_CMD_ENC_SET_PARAM	= 0x0200,
+	W6_CMD_DEC_SET_DISP	= 0x0400,
+	W6_CMD_INIT_WORK_BUF	= 0x1000,
+	W6_CMD_QUERY		= 0x4000,
+};
+
+enum wave6_init_seq_option {
+	W6_INIT_SEQ_OPT_NORMAL		= 1,
+	W6_INIT_SEQ_OPT_W_THUMBNAIL	= 17,
+};
+
+enum wave6_set_param_option {
+	W6_SET_PARAM_OPT_COMMON		= 0,
+	W6_SET_PARAM_OPT_CHANGE_PARAM	= 1,
+};
+
+enum wave6_dec_pic_option {
+	W6_DEC_PIC_OPT_NORMAL		= 0,
+	W6_DEC_PIC_OPT_W_THUMBNAIL	= 16,
+	W6_DEC_PIC_OPT_SKIP_NON_IRAP	= 17,
+	W6_DEC_PIC_OPT_SKIP_NON_REF_PIC	= 19,
+};
+
+enum wave6_query_option {
+	W6_QUERY_OPT_GET_VPU_INFO	= 0,
+	W6_QUERY_OPT_GET_RESULT		= 2,
+	W6_QUERY_OPT_GET_FLUSH_CMD_INFO	= 10,
+};
+
+enum wave6_interrupt_bit {
+	W6_INT_BIT_INIT_VPU		= 0,
+	W6_INT_BIT_WAKEUP_VPU		= 1,
+	W6_INT_BIT_SLEEP_VPU		= 2,
+	W6_INT_BIT_CREATE_INSTANCE	= 3,
+	W6_INT_BIT_FLUSH_INSTANCE	= 4,
+	W6_INT_BIT_DESTROY_INSTANCE	= 5,
+	W6_INT_BIT_INIT_SEQ		= 6,
+	W6_INT_BIT_SET_FB		= 7,
+	W6_INT_BIT_DEC_PIC		= 8,
+	W6_INT_BIT_ENC_PIC		= 8,
+	W6_INT_BIT_ENC_SET_PARAM	= 9,
+	W6_INT_BIT_SET_DISP		= 10,
+	W6_INT_BIT_REQ_WORK_BUF		= 12,
+	W6_INT_BIT_BSBUF_ERROR		= 15,
+};
+
+#define W6_REG_BASE	0x00000000
+#define W6_CMD_REG_BASE	0x00000200
+#define W6_CMD_REG_END	0x00000600
+
+#define W6_VPU_VCPU_CUR_PC				(W6_REG_BASE + 0x0004)
+#define W6_VPU_VINT_REASON_CLEAR			(W6_REG_BASE + 0x0034)
+#define W6_VPU_HOST_INT_REQ				(W6_REG_BASE + 0x0038)
+#define		HOST_INT_REQ_ON				BIT(0)
+#define W6_VPU_VINT_CLEAR				(W6_REG_BASE + 0x003C)
+#define		VINT_CLEAR				BIT(0)
+#define W6_VPU_VPU_INT_STS				(W6_REG_BASE + 0x0044)
+#define W6_VPU_VINT_ENABLE				(W6_REG_BASE + 0x0048)
+#define W6_VPU_VINT_REASON				(W6_REG_BASE + 0x004C)
+#define W6_VPU_REMAP_CTRL_GB				(W6_REG_BASE + 0x0060)
+#define		REMAP_CTRL_ON				BIT(31)
+#define		REMAP_CTRL_INDEX(x)			FIELD_PREP(GENMASK(15, 12), (x))
+#define		REMAP_CTRL_PAGE_SIZE_ON			BIT(11)
+#define		REMAP_CTRL_PAGE_SIZE(x)			FIELD_PREP(GENMASK(8, 0), ((x) >> 12))
+#define W6_VPU_REMAP_VADDR_GB				(W6_REG_BASE + 0x0064)
+#define W6_VPU_REMAP_PADDR_GB				(W6_REG_BASE + 0x0068)
+#define W6_VPU_REMAP_CORE_START_GB			(W6_REG_BASE + 0x006C)
+#define		REMAP_CORE_START_ON			BIT(0)
+#define W6_VPU_BUSY_STATUS				(W6_REG_BASE + 0x0070)
+#define		BUSY_STATUS_SET				BIT(0)
+#define W6_VPU_RET_PRODUCT_CODE				(W6_REG_BASE + 0x0094)
+
+/* COMMON */
+#define W6_COMMAND_GB					(W6_REG_BASE + 0x104)
+#define W6_COMMAND					(W6_REG_BASE + 0x200)
+#define W6_QUERY_OPTION					(W6_REG_BASE + 0x204)
+#define W6_CMD_INSTANCE_INFO				(W6_REG_BASE + 0x210)
+#define		INSTANCE_INFO_CODEC_STD(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		INSTANCE_INFO_ID(x)			FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0		(W6_REG_BASE + 0x364)
+#define W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0		(W6_REG_BASE + 0x368)
+#define W6_CMD_SET_WORK_BUF_ADDR			(W6_REG_BASE + 0x5F0)
+#define W6_CMD_SET_WORK_BUF_SIZE			(W6_REG_BASE + 0x5F4)
+#define		SET_WORK_BUF_SIZE_ACK			0
+#define W6_RET_SUCCESS					(W6_REG_BASE + 0x208)
+#define W6_RET_FAIL_REASON				(W6_REG_BASE + 0x20C)
+#define W6_RET_INT_INSTANCE_INFO			(W6_REG_BASE + 0x21C)
+#define		INT_INSTANCE_INFO_CLEAR			0
+#define W6_RET_INSTANCE_ID				(W6_REG_BASE + 0x220)
+#define W6_RET_CQ_IN_TICK				(W6_REG_BASE + 0x23C)
+#define W6_RET_FW_RUN_TICK				(W6_REG_BASE + 0x240)
+#define W6_RET_HW_RUN_TICK				(W6_REG_BASE + 0x244)
+#define W6_RET_HW_DONE_TICK				(W6_REG_BASE + 0x248)
+#define W6_RET_FW_DONE_TICK				(W6_REG_BASE + 0x24C)
+#define W6_RET_RQ_OUT_TICK				(W6_REG_BASE + 0x250)
+
+/* COMMON - QUERY : GET_VPU_INFO */
+#define W6_RET_FW_VERSION				(W6_REG_BASE + 0x300)
+#define W6_RET_PRODUCT_NAME				(W6_REG_BASE + 0x304)
+#define W6_RET_PRODUCT_VERSION				(W6_REG_BASE + 0x308)
+#define W6_RET_STD_DEF0					(W6_REG_BASE + 0x30C)
+#define W6_RET_STD_DEF1					(W6_REG_BASE + 0x310)
+#define		STD_DEF1_AVC_DEC(x)			FIELD_GET(GENMASK(3, 3), (x))
+#define		STD_DEF1_HEVC_DEC(x)			FIELD_GET(GENMASK(2, 2), (x))
+#define		STD_DEF1_AVC_ENC(x)			FIELD_GET(GENMASK(1, 1), (x))
+#define		STD_DEF1_HEVC_ENC(x)			FIELD_GET(GENMASK(0, 0), (x))
+#define W6_RET_CONF_FEATURE				(W6_REG_BASE + 0x314)
+#define		CONF_FEATURE_AVC10BIT_ENC(x)		FIELD_GET(GENMASK(11, 11), (x))
+#define		CONF_FEATURE_AVC10BIT_DEC(x)		FIELD_GET(GENMASK(9, 9), (x))
+#define		CONF_FEATURE_HEVC10BIT_ENC(x)		FIELD_GET(GENMASK(3, 3), (x))
+#define		CONF_FEATURE_HEVC10BIT_DEC(x)		FIELD_GET(GENMASK(1, 1), (x))
+#define W6_RET_CONF_DATE				(W6_REG_BASE + 0x318)
+#define W6_RET_CONF_HW_VERSION				(W6_REG_BASE + 0x31C)
+#define W6_RET_CONF_TYPE				(W6_REG_BASE + 0x320)
+#define W6_RET_FW_API_VERSION				(W6_REG_BASE + 0x32C)
+#define W6_RET_SHA_ID					(W6_REG_BASE + 0x330)
+
+/* COMMON - CREATE_INSTANCE */
+#define W6_CMD_CREATE_INST_BS_PARAM			(W6_REG_BASE + 0x310)
+#define W6_CMD_CREATE_INST_SRC_OPT			(W6_REG_BASE + 0x314)
+#define W6_CMD_CREATE_INST_ADDR_EXT			(W6_REG_BASE + 0x318)
+#define W6_CMD_CREATE_INST_DISP_MODE			(W6_REG_BASE + 0x31C)
+#define W6_CMD_CREATE_INST_CORE_INFO			(W6_REG_BASE + 0x330)
+#define		CREATE_INST_CORE_INFO_CQ_DEPTH(x)	FIELD_PREP(GENMASK(10, 8), (x))
+#define		CREATE_INST_CORE_INFO_CORE_IDC(x)	FIELD_PREP(GENMASK(7, 4), (x))
+#define		CREATE_INST_CORE_INFO_CORE_NUM(x)	FIELD_PREP(GENMASK(3, 0), (x))
+#define W6_CMD_CREATE_INST_PRIORITY			(W6_REG_BASE + 0x334)
+#define		CREATE_INST_PRIORITY_SECURITY_FLAG(x)	FIELD_PREP(GENMASK(8, 8), (x))
+#define		CREATE_INST_PRIORITY_VALUE(x)		FIELD_PREP(GENMASK(4, 0), (x))
+#define W6_CMD_CREATE_INST_TEMP_BASE			(W6_REG_BASE + 0x348)
+#define W6_CMD_CREATE_INST_TEMP_SIZE			(W6_REG_BASE + 0x34C)
+#define W6_CMD_CREATE_INST_AR_TABLE_BASE		(W6_REG_BASE + 0x358)
+#define W6_CMD_CREATE_INST_TIMEOUT_CYCLE_COUNT		(W6_REG_BASE + 0x3A8)
+
+/* COMMON - SET_FB */
+#define W6_CMD_SET_FB_OPTION				(W6_REG_BASE + 0x204)
+#define		SET_FB_OPTION_ENDIAN(x)			FIELD_PREP(GENMASK(19, 16), (x))
+#define		SET_FB_OPTION_END			BIT(4)
+#define		SET_FB_OPTION_START			BIT(3)
+#define W6_CMD_SET_FB_PIC_INFO				(W6_REG_BASE + 0x300)
+#define		SET_FB_PIC_INFO_C_FMT_IDC(x)		FIELD_PREP(GENMASK(26, 25), (x))
+#define		SET_FB_PIC_INFO_L_BIT_DEPTH(x)		FIELD_PREP(GENMASK(24, 21), (x))
+#define		SET_FB_PIC_INFO_C_BIT_DEPTH(x)		FIELD_PREP(GENMASK(20, 17), (x))
+#define		SET_FB_PIC_INFO_STRIDE(x)		FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_SET_FB_PIC_SIZE				(W6_REG_BASE + 0x304)
+#define		SET_FB_PIC_SIZE_WIDTH(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_FB_PIC_SIZE_HEIGHT(x)		FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_SET_FB_NUM				(W6_REG_BASE + 0x308)
+#define		SET_FB_NUM_FBC_START_IDX(x)		FIELD_PREP(GENMASK(28, 24), (x))
+#define		SET_FB_NUM_FBC_END_IDX(x)		FIELD_PREP(GENMASK(20, 16), (x))
+#define		SET_FB_NUM_MV_COL_START_IDX(x)		FIELD_PREP(GENMASK(9, 5), (x))
+#define		SET_FB_NUM_MV_COL_END_IDX(x)		FIELD_PREP(GENMASK(4, 0), (x))
+#define W6_CMD_SET_FB_FBC_STRIDE			(W6_REG_BASE + 0x30C)
+#define		SET_FB_FBC_STRIDE_L(x)			FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_FB_FBC_STRIDE_C(x)			FIELD_PREP(GENMASK(15, 0), (x))
+
+/* W6_CMD_SET_FB_FBC_Y(x)
+ * Address range: 0x310, 0x328, ..., 0x478 (step = 0x18)
+ */
+#define W6_CMD_SET_FB_FBC_Y(x)				(W6_REG_BASE + 0x310 + ((x) * 0x18))
+
+/* W6_CMD_SET_FB_FBC_C(x)
+ * Address range: 0x314, 0x32C, ..., 0x47C (step = 0x18)
+ */
+#define W6_CMD_SET_FB_FBC_C(x)				(W6_REG_BASE + 0x314 + ((x) * 0x18))
+
+/* W6_CMD_SET_FB_FBC_Y_OFFSET(x)
+ * Address range: 0x318, 0x330, ..., 0x480 (step = 0x18)
+ */
+#define W6_CMD_SET_FB_FBC_Y_OFFSET(x)			(W6_REG_BASE + 0x318 + ((x) * 0x18))
+
+/* W6_CMD_SET_FB_FBC_C_OFFSET(x)
+ * Address range: 0x31C, 0x334, ..., 0x484 (step = 0x18)
+ */
+#define W6_CMD_SET_FB_FBC_C_OFFSET(x)			(W6_REG_BASE + 0x31C + ((x) * 0x18))
+
+/* W6_CMD_SET_FB_MV_COL(x)
+ * Address range: 0x320, 0x338, ..., 0x488 (step = 0x18)
+ */
+#define W6_CMD_SET_FB_MV_COL(x)				(W6_REG_BASE + 0x320 + ((x) * 0x18))
+
+/* W6_CMD_SET_FB_SUB_SAMPLED(x)
+ * Address range: 0x324, 0x33C, ..., 0x48C (step = 0x18)
+ */
+#define W6_CMD_SET_FB_SUB_SAMPLED(x)			(W6_REG_BASE + 0x324 + ((x) * 0x18))
+#define W6_CMD_SET_FB_DEFAULT_CDF			(W6_REG_BASE + 0x494)
+#define W6_CMD_SET_FB_SEGMAP				(W6_REG_BASE + 0x498)
+#define W6_CMD_SET_FB_MV_COL_PRE_ENT			(W6_REG_BASE + 0x4DC)
+
+/* W6_CMD_SET_FB_FBC_CR(x)
+ * Address range: 0x4F0, 0x4F8, ..., 0x568 (step = 0x8)
+ */
+#define W6_CMD_SET_FB_FBC_CR(x)				(W6_REG_BASE + 0x4F0 + ((x) * 0x8))
+
+/* W6_CMD_SET_FB_FBC_CR_OFFSET(x)
+ * Address range: 0x4F4, 0x4FC, ..., 0x56C (step = 0x8)
+ */
+#define W6_CMD_SET_FB_FBC_CR_OFFSET(x)			(W6_REG_BASE + 0x4F4 + ((x) * 0x8))
+
+/* DECODER - INIT_SEQ */
+#define W6_CMD_DEC_INIT_SEQ_OPTION			(W6_REG_BASE + 0x204)
+#define		INIT_SEQ_OPTION_MODE(x)			FIELD_PREP(GENMASK(5, 0), (x))
+#define W6_CMD_DEC_INIT_SEQ_BS_RD_PTR			(W6_REG_BASE + 0x300)
+#define W6_CMD_DEC_INIT_SEQ_BS_WR_PTR			(W6_REG_BASE + 0x304)
+#define W6_CMD_DEC_INIT_SEQ_BS_OPTION			(W6_REG_BASE + 0x308)
+
+/* DECODER - SET_DISP */
+#define W6_CMD_DEC_SET_DISP_OPTION			(W6_REG_BASE + 0x204)
+#define		SET_DISP_OPTION_ENDIAN(x)		FIELD_PREP(GENMASK(19, 16), (x))
+#define W6_CMD_DEC_SET_DISP_COMMON_PIC_INFO		(W6_REG_BASE + 0x300)
+#define		SET_DISP_COMMON_PIC_INFO_BWB_ON		BIT(28)
+#define		SET_DISP_COMMON_PIC_INFO_C_FMT_IDC(x)	FIELD_PREP(GENMASK(25, 24), (x))
+#define		SET_DISP_COMMON_PIC_INFO_PIXEL_ORDER(x)	FIELD_PREP(GENMASK(23, 23), (x))
+#define		SET_DISP_COMMON_PIC_INFO_OUT_MODE(x)	FIELD_PREP(GENMASK(22, 20), (x))
+#define		SET_DISP_COMMON_PIC_INFO_OUT_FMT(x)	FIELD_PREP(GENMASK(18, 16), (x))
+#define		SET_DISP_COMMON_PIC_INFO_STRIDE(x)	FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_DEC_SET_DISP_PIC_SIZE			(W6_REG_BASE + 0x304)
+#define		SET_DISP_PIC_SIZE_WIDTH(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_DISP_PIC_SIZE_HEIGHT(x)		FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_DEC_SET_DISP_PIC_INFO			(W6_REG_BASE + 0x308)
+#define		SET_DISP_PIC_INFO_L_BIT_DEPTH(x)	FIELD_PREP(GENMASK(25, 22), (x))
+#define		SET_DISP_PIC_INFO_C_BIT_DEPTH(x)	FIELD_PREP(GENMASK(21, 18), (x))
+#define		SET_DISP_PIC_INFO_C_FMT_IDC(x)		FIELD_PREP(GENMASK(17, 16), (x))
+#define W6_CMD_DEC_SET_DISP_Y_BASE			(W6_REG_BASE + 0x30C)
+#define W6_CMD_DEC_SET_DISP_CB_BASE			(W6_REG_BASE + 0x310)
+#define W6_CMD_DEC_SET_DISP_CR_BASE			(W6_REG_BASE + 0x314)
+#define W6_CMD_DEC_SET_DISP_SCL_PARAM			(W6_REG_BASE + 0x318)
+#define W6_CMD_DEC_SET_DISP_SCL_PIC_SIZE		(W6_REG_BASE + 0x31C)
+#define		SET_DISP_SCL_PIC_SIZE_WIDTH(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_DISP_SCL_PIC_SIZE_HEIGHT(x)		FIELD_PREP(GENMASK(15, 0), (x))
+
+/* DECODER - DEC_PIC */
+#define W6_CMD_DEC_PIC_OPTION				(W6_REG_BASE + 0x204)
+#define		DEC_PIC_OPTION_MODE(x)			FIELD_PREP(GENMASK(5, 0), (x))
+#define W6_CMD_DEC_PIC_BS_RD_PTR			(W6_REG_BASE + 0x300)
+#define W6_CMD_DEC_PIC_BS_WR_PTR			(W6_REG_BASE + 0x304)
+#define W6_CMD_DEC_PIC_BS_OPTION			(W6_REG_BASE + 0x308)
+#define		DEC_PIC_BS_OPTION_STREAM_END(x)		FIELD_PREP(GENMASK(1, 1), (x))
+#define		DEC_PIC_BS_OPTION_EXPLICIT_END_ON	BIT(0)
+#define W6_CMD_DEC_PIC_SEC_AXI				(W6_REG_BASE + 0x30C)
+#define		DEC_PIC_SEC_AXI_IP_ENABLE(x)		FIELD_PREP(GENMASK(1, 1), (x))
+#define		DEC_PIC_SEC_AXI_LF_ENABLE(x)		FIELD_PREP(GENMASK(0, 0), (x))
+#define W6_CMD_DEC_PIC_SEQ_CHANGE_ENABLE_FLAG		(W6_REG_BASE + 0x310)
+#define W6_CMD_DEC_PIC_TEMPORAL_ID_PLUS1		(W6_REG_BASE + 0x318)
+#define		DEC_PIC_TEMPORAL_ID_PLUS1_SPATIAL(x)	FIELD_PREP(GENMASK(11, 9), (x))
+#define		DEC_PIC_TEMPORAL_ID_PLUS1(x)		FIELD_PREP(GENMASK(7, 0), (x))
+#define W6_CMD_DEC_PIC_TIMESTAMP_LOW			(W6_REG_BASE + 0x354)
+#define W6_CMD_DEC_PIC_TIMESTAMP_HIGH			(W6_REG_BASE + 0x358)
+
+/* DECODER - QUERY : GET_RESULT */
+#define W6_RET_DEC_BS_RD_PTR				(W6_REG_BASE + 0x30C)
+#define W6_RET_DEC_SEQ_PARAM				(W6_REG_BASE + 0x310)
+#define		DEC_SEQ_PARAM_TIER(x)			FIELD_GET(GENMASK(29, 29), (x))
+#define		DEC_SEQ_PARAM_PROFILE(x)		FIELD_GET(GENMASK(28, 24), (x))
+#define		PROFILE_H264_BP				2
+#define		PROFILE_H264_HP				4
+#define		PROFILE_H264_MP				13
+#define		PROFILE_H264_HIGH10			14
+#define		PROFILE_H264_EXTENDED			24
+#define		DEC_SEQ_PARAM_PROFILE_COMPATIBILITY(x)	FIELD_GET(GENMASK(19, 12), (x))
+#define		PROFILE_COMPATIBILITY_MAIN		BIT(1)
+#define		PROFILE_COMPATIBILITY_MAIN10		BIT(2)
+#define		PROFILE_COMPATIBILITY_STILL_PICTURE	BIT(3)
+#define		DEC_SEQ_PARAM_LEVEL(x)			FIELD_GET(GENMASK(7, 0), (x))
+#define W6_RET_DEC_COLOR_SAMPLE				(W6_REG_BASE + 0x314)
+#define		DEC_COLOR_SAMPLE_ASPECT_RATIO_IDC(x)	FIELD_GET(GENMASK(23, 16), (x))
+#define		DEC_COLOR_SAMPLE_C_FMT_IDC(x)		FIELD_GET(GENMASK(11, 8), (x))
+#define		DEC_COLOR_SAMPLE_C_BIT_DEPTH(x)		FIELD_GET(GENMASK(7, 4), (x))
+#define		DEC_COLOR_SAMPLE_L_BIT_DEPTH(x)		FIELD_GET(GENMASK(3, 0), (x))
+#define W6_RET_DEC_ASPECT_RATIO				(W6_REG_BASE + 0x318)
+#define W6_RET_DEC_BIT_RATE				(W6_REG_BASE + 0x31C)
+#define W6_RET_DEC_FRAME_RATE_NR			(W6_REG_BASE + 0x320)
+#define W6_RET_DEC_FRAME_RATE_DR			(W6_REG_BASE + 0x324)
+#define W6_RET_DEC_NUM_REQUIRED_FBC_FB			(W6_REG_BASE + 0x328)
+#define W6_RET_DEC_NUM_REORDER_DELAY			(W6_REG_BASE + 0x32C)
+#define W6_RET_DEC_NOTIFICATION				(W6_REG_BASE + 0x334)
+#define W6_RET_DEC_PIC_SIZE				(W6_REG_BASE + 0x33C)
+#define		DEC_PIC_SIZE_WIDTH(x)			FIELD_GET(GENMASK(31, 16), (x))
+#define		DEC_PIC_SIZE_HEIGHT(x)			FIELD_GET(GENMASK(15, 0), (x))
+#define W6_RET_DEC_CROP_TOP_BOTTOM			(W6_REG_BASE + 0x340)
+#define		DEC_CROP_TOP(x)				FIELD_GET(GENMASK(31, 16), (x))
+#define		DEC_CROP_BOTTOM(x)			FIELD_GET(GENMASK(15, 0), (x))
+#define W6_RET_DEC_CROP_LEFT_RIGHT			(W6_REG_BASE + 0x344)
+#define		DEC_CROP_LEFT(x)			FIELD_GET(GENMASK(31, 16), (x))
+#define		DEC_CROP_RIGHT(x)			FIELD_GET(GENMASK(15, 0), (x))
+#define W6_RET_DEC_AU_START_POS				(W6_REG_BASE + 0x348)
+#define W6_RET_DEC_AU_END_POS				(W6_REG_BASE + 0x34C)
+#define W6_RET_DEC_PIC_TYPE				(W6_REG_BASE + 0x350)
+#define		DEC_PIC_TYPE_CTU_SIZE(x)		(16 << FIELD_GET(GENMASK(11, 10), (x)))
+#define		DEC_PIC_TYPE_NAL_UNIT_TYPE(x)		FIELD_GET(GENMASK(9, 4), (x))
+#define		DEC_PIC_TYPE_B				BIT(2)
+#define		DEC_PIC_TYPE_P				BIT(1)
+#define		DEC_PIC_TYPE_I				BIT(0)
+#define W6_RET_DEC_PIC_POC				(W6_REG_BASE + 0x354)
+#define W6_RET_DEC_RECOVERY_POINT			(W6_REG_BASE + 0x358)
+#define W6_RET_DEC_DECODED_ADDR				(W6_REG_BASE + 0x360)
+#define W6_RET_DEC_DISPLAY_ADDR				(W6_REG_BASE + 0x364)
+#define W6_RET_DEC_ERR_CTB_NUM				(W6_REG_BASE + 0x370)
+#define W6_RET_DEC_DISPLAY_FLAG				(W6_REG_BASE + 0x3A8)
+#define W6_RET_DEC_RELEASE_IDC				(W6_REG_BASE + 0x3AC)
+#define W6_RET_DEC_DISP_IDC				(W6_REG_BASE + 0x3B0)
+#define W6_RET_DEC_STREAM_END				(W6_REG_BASE + 0x3C0)
+#define W6_RET_DEC_DECODED_FLAG				(W6_REG_BASE + 0x3C4)
+#define W6_RET_DEC_WARN_INFO				(W6_REG_BASE + 0x3CC)
+#define W6_RET_DEC_ERR_INFO				(W6_REG_BASE + 0x3D0)
+#define W6_RET_DEC_DECODING_SUCCESS			(W6_REG_BASE + 0x3D4)
+#define W6_RET_DEC_TIMESTAMP_LOW			(W6_REG_BASE + 0x3D8)
+#define W6_RET_DEC_TIMESTAMP_HIGH			(W6_REG_BASE + 0x3DC)
+#define W6_RET_DEC_LAST_FRAME_FLAG			(W6_REG_BASE + 0x3E0)
+#define W6_RET_DEC_NUM_REQUIRED_COL_BUF			(W6_REG_BASE + 0x3E4)
+
+/* W6_RET_DEC_DISP_LINEAR_ADDR(x)
+ * Address range: 0x3E8, 0x3EC, ..., 0x460 (step = 0x4)
+ */
+#define W6_RET_DEC_DISP_LINEAR_ADDR(x)			(W6_REG_BASE + 0x3E8 + ((x) * 0x4))
+#define W6_RET_DEC_COLOR_CONFIG				(W6_REG_BASE + 0x57C)
+#define		DEC_COLOR_CONFIG_COLOR_RANGE(x)		FIELD_GET(GENMASK(25, 25), (x))
+#define		DEC_COLOR_CONFIG_MATRIX_COEFF(x)	FIELD_GET(GENMASK(24, 17), (x))
+#define		DEC_COLOR_CONFIG_TRANS_CHAR(x)		FIELD_GET(GENMASK(16, 9), (x))
+#define		DEC_COLOR_CONFIG_COLOR_PRIMARIES(x)	FIELD_GET(GENMASK(8, 1), (x))
+#define		DEC_COLOR_CONFIG_COLOR_PRESENT(x)	FIELD_GET(GENMASK(0, 0), (x))
+
+/* DECODER - QUERY : GET_FLUSH_CMD_INFO */
+
+/* W6_RET_DEC_FLUSH_CMD_DISP_ADDR(x)
+ * Address range: 0x300, 0x304, ..., 0x378 (step = 0x4)
+ */
+#define W6_RET_DEC_FLUSH_CMD_DISP_ADDR(x)		(W6_REG_BASE + 0x300 + ((x) * 0x4))
+#define W6_RET_DEC_FLUSH_CMD_BUF_STATE_UNUSED_IDC	(W6_REG_BASE + 0x57C)
+#define W6_RET_DEC_FLUSH_CMD_BUF_STATE_USED_IDC		(W6_REG_BASE + 0x580)
+#define W6_RET_DEC_FLUSH_CMD_BUF_STATE_USING_IDC	(W6_REG_BASE + 0x584)
+
+/* ENCODER - SET_PARAM */
+#define W6_CMD_ENC_SET_PARAM_OPTION			(W6_REG_BASE + 0x204)
+#define W6_CMD_ENC_SET_PARAM_ENABLE			(W6_REG_BASE + 0x300)
+#define		SET_PARAM_ENABLE_RC_TARGET_RATE		BIT(10)
+#define W6_CMD_ENC_SET_PARAM_SRC_SIZE			(W6_REG_BASE + 0x304)
+#define		SET_PARAM_SRC_SIZE_HEIGHT(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_PARAM_SRC_SIZE_WIDTH(x)		FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_MAP_ENDIAN		(W6_REG_BASE + 0x308)
+#define W6_CMD_ENC_SET_PARAM_SPS			(W6_REG_BASE + 0x30C)
+#define		SET_PARAM_SPS_DEFAULT_SCALING_LIST(x)	FIELD_PREP(GENMASK(31, 31), (x))
+#define		SET_PARAM_SPS_STILL_PICTURE(x)		FIELD_PREP(GENMASK(30, 30), (x))
+#define		SET_PARAM_SPS_AUTO_LEVEL_ADJUSTING_ON	BIT(28)
+#define		SET_PARAM_SPS_STRONG_INTRA_SMOOTHING(x)	FIELD_PREP(GENMASK(27, 27), (x))
+#define		SET_PARAM_SPS_INTRA_TRANSFORM_SKIP_ON	BIT(25)
+#define		SET_PARAM_SPS_SAMPLE_ADAPTIVE_OFFSET(x)	FIELD_PREP(GENMASK(24, 24), (x))
+#define		SET_PARAM_SPS_TEMPORAL_MVP(x)		FIELD_PREP(GENMASK(23, 23), (x))
+#define		SET_PARAM_SPS_LONGTERM_REFERENCE(x)	FIELD_PREP(GENMASK(21, 21), (x))
+#define		SET_PARAM_SPS_C_FMT_IDC(x)		FIELD_PREP(GENMASK(20, 19), (x))
+#define		SET_PARAM_SPS_BIT_DEPTH(x)		FIELD_PREP(GENMASK(18, 14), (x))
+#define		SET_PARAM_SPS_TIER(x)			FIELD_PREP(GENMASK(13, 12), (x))
+#define		SET_PARAM_SPS_LEVEL(x)			FIELD_PREP(GENMASK(11, 3), (x))
+#define		SET_PARAM_SPS_PROFILE(x)		FIELD_PREP(GENMASK(2, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_PPS			(W6_REG_BASE + 0x310)
+#define		SET_PARAM_PPS_ENTROPY_CODING_MODE(x)	FIELD_PREP(GENMASK(30, 30), (x))
+#define		SET_PARAM_PPS_TRANSFORM8X8(x)		FIELD_PREP(GENMASK(29, 29), (x))
+#define		SET_PARAM_PPS_CR_QP_OFFSET(x)		FIELD_PREP(GENMASK(23, 19), (x))
+#define		SET_PARAM_PPS_CB_QP_OFFSET(x)		FIELD_PREP(GENMASK(18, 14), (x))
+#define		SET_PARAM_PPS_TC_OFFSET_DIV2(x)		FIELD_PREP(GENMASK(13, 10), (x))
+#define		SET_PARAM_PPS_BETA_OFFSET_DIV2(x)	FIELD_PREP(GENMASK(9, 6), (x))
+#define		SET_PARAM_PPS_DEBLOCKING_FILTER(x)	FIELD_PREP(GENMASK(5, 5), (x))
+#define		SET_PARAM_PPS_LF_SLICE_BOUNDARY(x)	FIELD_PREP(GENMASK(2, 2), (x))
+#define		SET_PARAM_PPS_CONST_INTRA_PREDICTION(x)	FIELD_PREP(GENMASK(1, 1), (x))
+#define W6_CMD_ENC_SET_PARAM_GOP			(W6_REG_BASE + 0x314)
+#define		SET_PARAM_GOP_TEMP_LAYER_CNT(x)		FIELD_PREP(GENMASK(19, 16), (x))
+#define		SET_PARAM_GOP_TEMP_LAYER3_QP_ENABLE(x)	FIELD_PREP(GENMASK(11, 11), (x))
+#define		SET_PARAM_GOP_TEMP_LAYER2_QP_ENABLE(x)	FIELD_PREP(GENMASK(10, 10), (x))
+#define		SET_PARAM_GOP_TEMP_LAYER1_QP_ENABLE(x)	FIELD_PREP(GENMASK(9, 9), (x))
+#define		SET_PARAM_GOP_TEMP_LAYER0_QP_ENABLE(x)	FIELD_PREP(GENMASK(8, 8), (x))
+#define		SET_PARAM_GOP_PRESET_IDX(x)		FIELD_PREP(GENMASK(7, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_INTRA			(W6_REG_BASE + 0x318)
+#define		SET_PARAM_INTRA_PERIOD(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_PARAM_INTRA_HEADER_MODE(x)		FIELD_PREP(GENMASK(10, 9), (x))
+#define		SET_PARAM_INTRA_QP(x)			FIELD_PREP(GENMASK(8, 3), (x))
+#define		SET_PARAM_INTRA_REFRESH_TYPE(x)		FIELD_PREP(GENMASK(2, 0), (x))
+
+/* W6_CMD_ENC_SET_PARAM_INTRA for AVC specific fields */
+#define		SET_PARAM_INTRA_HEADER_MODE_AVC(x)	FIELD_PREP(GENMASK(29, 28), (x))
+#define		SET_PARAM_INTRA_IDR_PERIOD_AVC(x)	FIELD_PREP(GENMASK(27, 17), (x))
+#define		SET_PARAM_INTRA_PERIOD_AVC(x)		FIELD_PREP(GENMASK(16, 6), (x))
+#define		SET_PARAM_INTRA_QP_AVC(x)		FIELD_PREP(GENMASK(5, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_CONF_WIN0			(W6_REG_BASE + 0x31C)
+#define		SET_PARAM_CONF_WIN0_BOTTOM(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_PARAM_CONF_WIN0_TOP(x)		FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_CONF_WIN1			(W6_REG_BASE + 0x320)
+#define		SET_PARAM_CONF_WIN1_RIGHT(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_PARAM_CONF_WIN1_LEFT(x)		FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_RDO			(W6_REG_BASE + 0x324)
+#define		SET_PARAM_RDO_CUSTOM_LAMBDA(x)		FIELD_PREP(GENMASK(22, 22), (x))
+#define		SET_PARAM_RDO_ME_SEARCH_CENTER_ON	BIT(21)
+#define		SET_PARAM_RDO_QROUND_OFFSET(x)		FIELD_PREP(GENMASK(17, 17), (x))
+#define		SET_PARAM_RDO_ADAPTIVE_ROUND_ON		BIT(3)
+#define		SET_PARAM_RDO_HVS_QP(x)			FIELD_PREP(GENMASK(2, 2), (x))
+#define W6_CMD_ENC_SET_PARAM_SLICE			(W6_REG_BASE + 0x328)
+#define		SET_PARAM_SLICE_ARGUMENT(x)		FIELD_PREP(GENMASK(31, 3), (x))
+#define		SET_PARAM_SLICE_MODE(x)			FIELD_PREP(GENMASK(2, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_INTRA_REFRESH		(W6_REG_BASE + 0x32C)
+#define		SET_PARAM_INTRA_REFRESH_ARGUMENT(x)	FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_PARAM_INTRA_REFRESH_MODE(x)		FIELD_PREP(GENMASK(2, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_INTRA_QP			(W6_REG_BASE + 0x330)
+#define		SET_PARAM_INTRA_QP_MAX(x)		FIELD_PREP(GENMASK(11, 6), (x))
+#define		SET_PARAM_INTRA_QP_MIN(x)		FIELD_PREP(GENMASK(5, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_RC_FRAME_RATE		(W6_REG_BASE + 0x334)
+#define W6_CMD_ENC_SET_PARAM_RC_TARGET_RATE		(W6_REG_BASE + 0x338)
+#define W6_CMD_ENC_SET_PARAM_RC				(W6_REG_BASE + 0x33C)
+#define		SET_PARAM_RC_UPDATE_SPEED(x)		FIELD_PREP(GENMASK(31, 24), (x))
+#define		SET_PARAM_RC_INITIAL_LEVEL(x)		FIELD_PREP(GENMASK(23, 20), (x))
+#define		SET_PARAM_RC_INITIAL_QP(x)		FIELD_PREP(GENMASK(19, 14), (x))
+#define		SET_PARAM_RC_MODE(x)			FIELD_PREP(GENMASK(13, 13), (x))
+#define		SET_PARAM_RC_PIC_LEVEL_MAX_DELTA_QP(x)	FIELD_PREP(GENMASK(12, 7), (x))
+#define		SET_PARAM_RC_VBV_OVERFLOW_DROP_FRAME(x)	FIELD_PREP(GENMASK(3, 3), (x))
+#define		SET_PARAM_RC_CU_LEVEL_ENABLE(x)		FIELD_PREP(GENMASK(1, 1), (x))
+#define		SET_PARAM_RC_ENABLE(x)			FIELD_PREP(GENMASK(0, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_HVS			(W6_REG_BASE + 0x340)
+#define		SET_PARAM_HVS_MAX_DELTA_QP(x)		FIELD_PREP(GENMASK(17, 12), (x))
+#define		SET_PARAM_HVS_QP_SCALE(x)		FIELD_PREP(GENMASK(3, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_RC_MAX_BITRATE		(W6_REG_BASE + 0x344)
+#define W6_CMD_ENC_SET_PARAM_RC_VBV_BUFFER_SIZE		(W6_REG_BASE + 0x348)
+#define W6_CMD_ENC_SET_PARAM_INTER_QP			(W6_REG_BASE + 0x34C)
+#define		SET_PARAM_INTER_QP_MAX_B(x)		FIELD_PREP(GENMASK(23, 18), (x))
+#define		SET_PARAM_INTER_QP_MIN_B(x)		FIELD_PREP(GENMASK(17, 12), (x))
+#define		SET_PARAM_INTER_QP_MAX_P(x)		FIELD_PREP(GENMASK(11, 6), (x))
+#define		SET_PARAM_INTER_QP_MIN_P(x)		FIELD_PREP(GENMASK(5, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_ROT_PARAM			(W6_REG_BASE + 0x350)
+#define W6_CMD_ENC_SET_PARAM_NUM_UNITS_IN_TICK		(W6_REG_BASE + 0x354)
+#define W6_CMD_ENC_SET_PARAM_TIME_SCALE			(W6_REG_BASE + 0x358)
+#define W6_CMD_ENC_SET_PARAM_NUM_TICKS_POC_DIFF_ONE	(W6_REG_BASE + 0x35C)
+#define W6_CMD_ENC_SET_PARAM_MAX_INTRA_PIC_BIT		(W6_REG_BASE + 0x360)
+#define W6_CMD_ENC_SET_PARAM_MAX_INTER_PIC_BIT		(W6_REG_BASE + 0x364)
+#define W6_CMD_ENC_SET_PARAM_BG				(W6_REG_BASE + 0x36C)
+#define		SET_PARAM_BG_DELTA_QP(x)		FIELD_PREP(GENMASK(29, 24), (x))
+#define		SET_PARAM_BG_THRESHOLD_MEAN_DIFF(x)	FIELD_PREP(GENMASK(17, 10), (x))
+#define		SET_PARAM_BG_THRESHOLD_MAX_DIFF(x)	FIELD_PREP(GENMASK(9, 1), (x))
+#define		SET_PARAM_BG_ENABLE(x)			FIELD_PREP(GENMASK(0, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_NON_VCL_PARAM		(W6_REG_BASE + 0x370)
+#define		SET_PARAM_NON_VCL_PARAM_ENCODE_VUI	BIT(1)
+#define W6_CMD_ENC_SET_PARAM_VUI_RBSP_ADDR		(W6_REG_BASE + 0x374)
+#define W6_CMD_ENC_SET_PARAM_HRD_RBSP_ADDR		(W6_REG_BASE + 0x378)
+#define W6_CMD_ENC_SET_PARAM_QROUND_OFFSET		(W6_REG_BASE + 0x380)
+#define		SET_PARAM_QROUND_OFFSET_INTER(x)	FIELD_PREP(GENMASK(23, 13), (x))
+#define		SET_PARAM_QROUND_OFFSET_INTRA(x)	FIELD_PREP(GENMASK(12, 2), (x))
+#define W6_CMD_ENC_SET_PARAM_QUANT1			(W6_REG_BASE + 0x384)
+#define W6_CMD_ENC_SET_PARAM_QUANT2			(W6_REG_BASE + 0x388)
+#define		SET_PARAM_QUANT2_LAMBDA_DQP_INTER(x)	FIELD_PREP(GENMASK(19, 14), (x))
+#define		SET_PARAM_QUANT2_LAMBDA_DQP_INTRA(x)	FIELD_PREP(GENMASK(13, 8), (x))
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_GOP			(W6_REG_BASE + 0x38C)
+
+/* W6_CMD_ENC_SET_PARAM_CUSTOM_GOP_PIC(x)
+ * Address range: 0x390, 0x394, ..., 0x3AC (step = 0x4)
+ */
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_GOP_PIC(x)		(W6_REG_BASE + 0x390 + ((x) * 0x4))
+#define		SET_PARAM_CUSTOM_GOP_PIC_TEMP_ID(x)	FIELD_PREP(GENMASK(29, 26), (x))
+#define		SET_PARAM_CUSTOM_GOP_PIC_REF1_POC(x)	FIELD_PREP(GENMASK(25, 20), (x))
+#define		SET_PARAM_CUSTOM_GOP_PIC_REF0_POC(x)	FIELD_PREP(GENMASK(19, 14), (x))
+#define		SET_PARAM_CUSTOM_GOP_PIC_MULTI_REF_P(x)	FIELD_PREP(GENMASK(13, 13), (x))
+#define		SET_PARAM_CUSTOM_GOP_PIC_QP(x)		FIELD_PREP(GENMASK(12, 7), (x))
+#define		SET_PARAM_CUSTOM_GOP_PIC_POC_OFFSET(x)	FIELD_PREP(GENMASK(6, 2), (x))
+#define		SET_PARAM_CUSTOM_GOP_PIC_TYPE(x)	FIELD_PREP(GENMASK(1, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_TILE_PARAM			(W6_REG_BASE + 0x3D0)
+
+/* W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA(x)
+ * Address range: 0x3D4, 0x3D8, ..., 0x4A0 (step = 0x4)
+ */
+#define W6_CMD_ENC_SET_PARAM_CUSTOM_LAMBDA(x)		(W6_REG_BASE + 0x3D4 + ((x) * 0x4))
+#define		SET_PARAM_CUSTOM_LAMBDA_SSD(x)		FIELD_PREP(GENMASK(20, 7), (x))
+#define		SET_PARAM_CUSTOM_LAMBDA_SAD(x)		FIELD_PREP(GENMASK(6, 0), (x))
+
+/* W6_CMD_ENC_SET_PARAM_TEMP_LAYER_QP(x)
+ * Address range: 0x4A4, 0x4A8, ..., 0x4B0 (step = 0x4)
+ */
+#define W6_CMD_ENC_SET_PARAM_TEMP_LAYER_QP(x)		(W6_REG_BASE + 0x4A4 + ((x) * 0x4))
+#define		SET_PARAM_TEMP_LAYER_QP_B(x)		FIELD_PREP(GENMASK(17, 12), (x))
+#define		SET_PARAM_TEMP_LAYER_QP_P(x)		FIELD_PREP(GENMASK(11, 6), (x))
+#define		SET_PARAM_TEMP_LAYER_QP_I(x)		FIELD_PREP(GENMASK(5, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_SCALER_SIZE		(W6_REG_BASE + 0x4B4)
+#define		SET_PARAM_SCALER_SIZE_HEIGHT(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_PARAM_SCALER_SIZE_WIDTH(x)		FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_SCALER			(W6_REG_BASE + 0x4B8)
+#define		SET_PARAM_SCALER_COEF_MODE(x)		FIELD_PREP(GENMASK(2, 1), (x))
+#define		SET_PARAM_SCALER_ENABLE(x)		FIELD_PREP(GENMASK(0, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_COLOR			(W6_REG_BASE + 0x4F8)
+#define		SET_PARAM_COLOR_RANGE(x)		FIELD_PREP(GENMASK(25, 25), (x))
+#define		SET_PARAM_COLOR_MATRIX_COEFF(x)		FIELD_PREP(GENMASK(24, 17), (x))
+#define		SET_PARAM_COLOR_TRANS_CHAR(x)		FIELD_PREP(GENMASK(16, 9), (x))
+#define		SET_PARAM_COLOR_PRIMARIES(x)		FIELD_PREP(GENMASK(8, 1), (x))
+#define		SET_PARAM_COLOR_DESCRIPTION_PRESENT_ON	BIT(0)
+#define W6_CMD_ENC_SET_PARAM_SAR			(W6_REG_BASE + 0x4FC)
+#define		SET_PARAM_SAR_ASPECT_RATIO_IDC(x)	FIELD_PREP(GENMASK(8, 1), (x))
+#define		SET_PARAM_SAR_ASPECT_RATIO_ENABLE(x)	FIELD_PREP(GENMASK(0, 0), (x))
+#define W6_CMD_ENC_SET_PARAM_SAR_EXTENDED		(W6_REG_BASE + 0x500)
+#define		SET_PARAM_SAR_EXTENDED_HEIGHT(x)	FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_PARAM_SAR_EXTENDED_WIDTH(x)		FIELD_PREP(GENMASK(15, 0), (x))
+
+/* ENCODER - ENC_PIC */
+#define W6_CMD_ENC_PIC_BS_START				(W6_REG_BASE + 0x300)
+#define W6_CMD_ENC_PIC_BS_SIZE				(W6_REG_BASE + 0x304)
+#define W6_CMD_ENC_PIC_BS_OPTION			(W6_REG_BASE + 0x308)
+#define W6_CMD_ENC_PIC_SEC_AXI				(W6_REG_BASE + 0x30C)
+#define		ENC_PIC_SEC_AXI_RDO_ENABLE(x)		FIELD_PREP(GENMASK(1, 1), (x))
+#define		ENC_PIC_SEC_AXI_LF_ENABLE(x)		FIELD_PREP(GENMASK(0, 0), (x))
+#define W6_CMD_ENC_PIC_REPORT				(W6_REG_BASE + 0x310)
+#define		ENC_PIC_REPORT_MV_HISTO_ENABLE(x)	FIELD_PREP(GENMASK(1, 1), (x))
+#define W6_CMD_ENC_PIC_MV_HISTO0			(W6_REG_BASE + 0x318)
+#define		ENC_PIC_MV_HISTO0_THRESHOLD0(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		ENC_PIC_MV_HISTO0_THRESHOLD1(x)		FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_ENC_PIC_MV_HISTO1			(W6_REG_BASE + 0x31C)
+#define		ENC_PIC_MV_HISTO1_THRESHOLD2(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		ENC_PIC_MV_HISTO1_THRESHOLD3(x)		FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_ENC_PIC_CUSTOM_MAP_PARAM			(W6_REG_BASE + 0x320)
+#define W6_CMD_ENC_PIC_CUSTOM_MAP_ADDR			(W6_REG_BASE + 0x324)
+#define W6_CMD_ENC_PIC_SRC_PIC_IDX			(W6_REG_BASE + 0x32C)
+#define		ENC_PIC_SRC_PIC_IDX_END			0xFFFFFFFF
+#define W6_CMD_ENC_PIC_SRC_ADDR_Y			(W6_REG_BASE + 0x330)
+#define W6_CMD_ENC_PIC_SRC_ADDR_U			(W6_REG_BASE + 0x334)
+#define W6_CMD_ENC_PIC_SRC_ADDR_V			(W6_REG_BASE + 0x338)
+#define W6_CMD_ENC_PIC_SRC_STRIDE			(W6_REG_BASE + 0x33C)
+#define		ENC_PIC_SRC_STRIDE_L(x)			FIELD_PREP(GENMASK(31, 16), (x))
+#define		ENC_PIC_SRC_STRIDE_C(x)			FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_ENC_PIC_SRC_FMT				(W6_REG_BASE + 0x340)
+#define		ENC_PIC_SRC_FMT_C_FMT_IDC(x)		FIELD_PREP(GENMASK(30, 28), (x))
+#define		ENC_PIC_SRC_FMT_CSC_24BIT(x)		FIELD_PREP(GENMASK(25, 25), (x))
+#define		ENC_PIC_SRC_FMT_CSC_AYUV(x)		FIELD_PREP(GENMASK(24, 24), (x))
+#define		ENC_PIC_SRC_FMT_CSC_ENABLE(x)		FIELD_PREP(GENMASK(20, 20), (x))
+#define		ENC_PIC_SRC_FMT_CSC_FMT_ORDER(x)	FIELD_PREP(GENMASK(19, 16), (x))
+#define		ENC_PIC_SRC_FMT_ENDIAN(x)		FIELD_PREP(GENMASK(15, 12), (x))
+#define		ENC_PIC_SRC_FMT_10BIT_ORDER(x)		FIELD_PREP(GENMASK(6, 6), (x))
+#define		ENC_PIC_SRC_FMT_10BIT_3PIXEL_4BYTE(x)	FIELD_PREP(GENMASK(5, 5), (x))
+#define		ENC_PIC_SRC_FMT_10BIT_ENABLE(x)		FIELD_PREP(GENMASK(4, 4), (x))
+#define		ENC_PIC_SRC_FMT_YUV422_PACKED_ORDER(x)	FIELD_PREP(GENMASK(3, 3), (x))
+#define		ENC_PIC_SRC_FMT_CBCR_ORDER(x)		FIELD_PREP(GENMASK(2, 2), (x))
+#define		ENC_PIC_SRC_FMT_2PLANE(x)		FIELD_PREP(GENMASK(1, 1), (x))
+#define		ENC_PIC_SRC_FMT_YUV422_PACKED(x)	FIELD_PREP(GENMASK(0, 0), (x))
+#define W6_CMD_ENC_PIC_SRC_AXI_SEL			(W6_REG_BASE + 0x348)
+#define		ENC_PIC_SRC_AXI_SEL_PRIMARY_PORT	1
+#define		ENC_PIC_SRC_AXI_SEL_PRP_PORT		0
+#define W6_CMD_ENC_PIC_CODE_OPTION			(W6_REG_BASE + 0x34C)
+#define		ENC_PIC_CODE_OPTION_ENCODE_VCL		BIT(1)
+#define		ENC_PIC_CODE_OPTION_ENCODE_HEADER	BIT(0)
+#define W6_CMD_ENC_PIC_PARAM				(W6_REG_BASE + 0x350)
+#define		ENC_PIC_PARAM_INTRA_4X4(x)		FIELD_PREP(GENMASK(29, 28), (x))
+#define		ENC_PIC_PARAM_FORCE_PIC_TYPE(x)		FIELD_PREP(GENMASK(23, 21), (x))
+#define		ENC_PIC_PARAM_FORCE_PIC_TYPE_ENABLE(x)	FIELD_PREP(GENMASK(20, 20), (x))
+#define		ENC_PIC_PARAM_FORCE_PIC_QP_B(x)		FIELD_PREP(GENMASK(19, 14), (x))
+#define		ENC_PIC_PARAM_FORCE_PIC_QP_P(x)		FIELD_PREP(GENMASK(13, 8), (x))
+#define		ENC_PIC_PARAM_FORCE_PIC_QP_I(x)		FIELD_PREP(GENMASK(7, 2), (x))
+#define		ENC_PIC_PARAM_FORCE_PIC_QP_ENABLE(x)	FIELD_PREP(GENMASK(1, 1), (x))
+#define		ENC_PIC_PARAM_PIC_SKIP_FLAG(x)		FIELD_PREP(GENMASK(0, 0), (x))
+#define W6_CMD_ENC_PIC_LONGTERM_PIC			(W6_REG_BASE + 0x354)
+#define W6_CMD_ENC_PIC_PREFIX_SEI_NAL_ADDR		(W6_REG_BASE + 0x358)
+#define W6_CMD_ENC_PIC_PREFIX_SEI_INFO			(W6_REG_BASE + 0x35C)
+#define W6_CMD_ENC_PIC_SUFFIX_SEI_NAL_ADDR		(W6_REG_BASE + 0x360)
+#define W6_CMD_ENC_PIC_SUFFIX_SEI_INFO			(W6_REG_BASE + 0x364)
+#define W6_CMD_ENC_PIC_CSC_COEFF0			(W6_REG_BASE + 0x374)
+#define		ENC_PIC_CSC_COEFF0_RY(x)		FIELD_PREP(GENMASK(29, 20), (x))
+#define		ENC_PIC_CSC_COEFF0_GY(x)		FIELD_PREP(GENMASK(19, 10), (x))
+#define		ENC_PIC_CSC_COEFF0_BY(x)		FIELD_PREP(GENMASK(9, 0), (x))
+#define W6_CMD_ENC_PIC_CSC_COEFF1			(W6_REG_BASE + 0x378)
+#define		ENC_PIC_CSC_COEFF1_RCB(x)		FIELD_PREP(GENMASK(29, 20), (x))
+#define		ENC_PIC_CSC_COEFF1_GCB(x)		FIELD_PREP(GENMASK(19, 10), (x))
+#define		ENC_PIC_CSC_COEFF1_BCB(x)		FIELD_PREP(GENMASK(9, 0), (x))
+#define W6_CMD_ENC_PIC_CSC_COEFF2			(W6_REG_BASE + 0x37C)
+#define		ENC_PIC_CSC_COEFF2_RCR(x)		FIELD_PREP(GENMASK(29, 20), (x))
+#define		ENC_PIC_CSC_COEFF2_GCR(x)		FIELD_PREP(GENMASK(19, 10), (x))
+#define		ENC_PIC_CSC_COEFF2_BCR(x)		FIELD_PREP(GENMASK(9, 0), (x))
+#define W6_CMD_ENC_PIC_CSC_COEFF3			(W6_REG_BASE + 0x380)
+#define		ENC_PIC_CSC_COEFF3_OFFSET_Y(x)		FIELD_PREP(GENMASK(29, 20), (x))
+#define		ENC_PIC_CSC_COEFF3_OFFSET_CB(x)		FIELD_PREP(GENMASK(19, 10), (x))
+#define		ENC_PIC_CSC_COEFF3_OFFSET_CR(x)		FIELD_PREP(GENMASK(9, 0), (x))
+#define W6_CMD_ENC_PIC_TIMESTAMP_LOW			(W6_REG_BASE + 0x448)
+#define W6_CMD_ENC_PIC_TIMESTAMP_HIGH			(W6_REG_BASE + 0x44C)
+
+/* ENCODER - QUERY : GET_RESULT */
+#define W6_RET_ENC_RD_PTR				(W6_REG_BASE + 0x300)
+#define W6_RET_ENC_WR_PTR				(W6_REG_BASE + 0x304)
+#define W6_RET_ENC_NUM_REQUIRED_FBC_FB			(W6_REG_BASE + 0x308)
+#define W6_RET_ENC_MIN_SRC_BUF_NUM			(W6_REG_BASE + 0x30C)
+#define W6_RET_ENC_PIC_TYPE				(W6_REG_BASE + 0x310)
+#define W6_RET_ENC_PIC_POC				(W6_REG_BASE + 0x314)
+#define W6_RET_ENC_PIC_IDX				(W6_REG_BASE + 0x318)
+#define W6_RET_ENC_PIC_SLICE_NUM			(W6_REG_BASE + 0x31C)
+#define W6_RET_ENC_PIC_SKIP				(W6_REG_BASE + 0x320)
+#define W6_RET_ENC_PIC_NUM_INTRA			(W6_REG_BASE + 0x324)
+#define W6_RET_ENC_PIC_NUM_MERGE			(W6_REG_BASE + 0x328)
+#define W6_RET_ENC_PIC_NON_REF_PIC_FLAG			(W6_REG_BASE + 0x32C)
+#define W6_RET_ENC_PIC_NUM_SKIP				(W6_REG_BASE + 0x330)
+#define W6_RET_ENC_PIC_AVG_CTU_QP			(W6_REG_BASE + 0x334)
+#define W6_RET_ENC_PIC_BYTE				(W6_REG_BASE + 0x338)
+#define W6_RET_ENC_GOP_PIC_IDX				(W6_REG_BASE + 0x33C)
+#define W6_RET_ENC_USED_SRC_IDX				(W6_REG_BASE + 0x340)
+#define W6_RET_ENC_PIC_NUM				(W6_REG_BASE + 0x344)
+#define W6_RET_ENC_VCL_NUT				(W6_REG_BASE + 0x348)
+#define W6_RET_ENC_PIC_DIST_LOW				(W6_REG_BASE + 0x350)
+#define W6_RET_ENC_PIC_DIST_HIGH			(W6_REG_BASE + 0x354)
+#define W6_RET_ENC_PIC_MAX_LATENCY_PICTURES		(W6_REG_BASE + 0x358)
+#define W6_RET_ENC_HISTO_CNT0				(W6_REG_BASE + 0x360)
+#define W6_RET_ENC_HISTO_CNT1				(W6_REG_BASE + 0x364)
+#define W6_RET_ENC_HISTO_CNT2				(W6_REG_BASE + 0x368)
+#define W6_RET_ENC_HISTO_CNT3				(W6_REG_BASE + 0x36C)
+#define W6_RET_ENC_HISTO_CNT4				(W6_REG_BASE + 0x370)
+#define W6_RET_ENC_WARN_INFO				(W6_REG_BASE + 0x3AC)
+#define W6_RET_ENC_ERR_INFO				(W6_REG_BASE + 0x3B0)
+#define W6_RET_ENC_ENCODING_SUCCESS			(W6_REG_BASE + 0x3B4)
+#define W6_RET_ENC_SUM_ME0_X_DIR_LOWER			(W6_REG_BASE + 0x3B8)
+#define W6_RET_ENC_SUM_ME0_X_DIR_HIGHER			(W6_REG_BASE + 0x3BC)
+#define W6_RET_ENC_SUM_ME0_Y_DIR_LOWER			(W6_REG_BASE + 0x3C0)
+#define W6_RET_ENC_SUM_ME0_Y_DIR_HIGHER			(W6_REG_BASE + 0x3C4)
+#define W6_RET_ENC_SUM_ME1_X_DIR_LOWER			(W6_REG_BASE + 0x3C8)
+#define W6_RET_ENC_SUM_ME1_X_DIR_HIGHER			(W6_REG_BASE + 0x3CC)
+#define W6_RET_ENC_SUM_ME1_Y_DIR_LOWER			(W6_REG_BASE + 0x3D0)
+#define W6_RET_ENC_SUM_ME1_Y_DIR_HIGHER			(W6_REG_BASE + 0x3D4)
+#define W6_RET_ENC_SRC_Y_ADDR				(W6_REG_BASE + 0x3E8)
+#define W6_RET_ENC_CUSTOM_MAP_ADDR			(W6_REG_BASE + 0x3EC)
+#define W6_RET_ENC_PREFIX_SEI_NAL_ADDR			(W6_REG_BASE + 0x3F0)
+#define W6_RET_ENC_SUFFIX_SEI_NAL_ADDR			(W6_REG_BASE + 0x3F4)
+#define W6_RET_ENC_NUM_REQUIRED_COL_BUF			(W6_REG_BASE + 0x404)
+#define W6_RET_ENC_TIMESTAMP_LOW			(W6_REG_BASE + 0x44C)
+#define W6_RET_ENC_TIMESTAMP_HIGH			(W6_REG_BASE + 0x450)
+
+#endif /* __WAVE6_REGDEFINE_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vdi.h b/drivers/media/platform/chips-media/wave6/wave6-vdi.h
new file mode 100644
index 000000000000..746a4e128ba8
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vdi.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - low level access interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VDI_H__
+#define __WAVE6_VDI_H__
+
+#include <linux/string.h>
+#include <linux/slab.h>
+#include <linux/device.h>
+#include <media/videobuf2-dma-contig.h>
+#include "wave6-vpuconfig.h"
+
+enum endian_mode {
+	VDI_128BIT_BIG_ENDIAN = 0,
+	VDI_128BIT_BE_BYTE_SWAP,
+	VDI_128BIT_BE_WORD_SWAP,
+	VDI_128BIT_BE_WORD_BYTE_SWAP,
+	VDI_128BIT_BE_DWORD_SWAP,
+	VDI_128BIT_BE_DWORD_BYTE_SWAP,
+	VDI_128BIT_BE_DWORD_WORD_SWAP,
+	VDI_128BIT_BE_DWORD_WORD_BYTE_SWAP,
+	VDI_128BIT_LE_DWORD_WORD_BYTE_SWAP,
+	VDI_128BIT_LE_DWORD_WORD_SWAP,
+	VDI_128BIT_LE_DWORD_BYTE_SWAP,
+	VDI_128BIT_LE_DWORD_SWAP,
+	VDI_128BIT_LE_WORD_BYTE_SWAP,
+	VDI_128BIT_LE_WORD_SWAP,
+	VDI_128BIT_LE_BYTE_SWAP,
+	VDI_128BIT_LITTLE_ENDIAN = 15,
+	VDI_ENDIAN_MAX
+};
+
+/**
+ * struct vpu_buf - VPU buffer for a coherent DMA buffer
+ * @size:	Buffer size
+ * @daddr:	Mapped address for device access
+ * @vaddr:	Kernel virtual address
+ * @dev:	Device pointer for DMA API
+ *
+ * Represents a buffer allocated via dma_alloc_coherent().
+ */
+struct vpu_buf {
+	size_t size;
+	dma_addr_t daddr;
+	void *vaddr;
+	struct device *dev;
+};
+
+static inline void wave6_vdi_writel(void __iomem *base, u32 addr, u32 data)
+{
+	writel(data, base + addr);
+}
+
+static inline unsigned int wave6_vdi_readl(void __iomem *base, u32 addr)
+{
+	return readl(base + addr);
+}
+
+static inline int wave6_vdi_alloc_dma(struct device *dev, struct vpu_buf *vb)
+{
+	void *vaddr;
+	dma_addr_t daddr;
+
+	if (!vb || !vb->size)
+		return -EINVAL;
+
+	vaddr = dma_alloc_coherent(dev, vb->size, &daddr, GFP_KERNEL);
+	if (!vaddr)
+		return -ENOMEM;
+
+	vb->vaddr = vaddr;
+	vb->daddr = daddr;
+	vb->dev = dev;
+
+	return 0;
+}
+
+static inline void wave6_vdi_free_dma(struct vpu_buf *vb)
+{
+	if (!vb || !vb->size || !vb->vaddr)
+		return;
+
+	dma_free_coherent(vb->dev, vb->size, vb->vaddr, vb->daddr);
+
+	memset(vb, 0, sizeof(*vb));
+}
+
+#endif /* __WAVE6_VDI_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.c b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
new file mode 100644
index 000000000000..bb4921ae14a0
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
@@ -0,0 +1,725 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 helper interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#include <linux/bug.h>
+#include "wave6-vpuapi.h"
+#include "wave6-regdefine.h"
+#include "wave6-hw.h"
+#include "wave6-vpu-dbg.h"
+#include "wave6-trace.h"
+
+int wave6_vpu_dec_open(struct vpu_instance *inst, struct dec_open_param *pop)
+{
+	struct dec_info *p_dec_info;
+	int ret;
+	struct vpu_core_device *core = inst->dev;
+
+	ret = wave6_vpu_dec_check_open_param(inst, pop);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&core->hw_lock);
+
+	if (!wave6_vpu_is_init(core))
+		return -ENODEV;
+
+	inst->codec_info = kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
+	if (!inst->codec_info)
+		return -ENOMEM;
+
+	p_dec_info = &inst->codec_info->dec_info;
+	memcpy(&p_dec_info->open_param, pop, sizeof(struct dec_open_param));
+
+	ret = wave6_vpu_build_up_dec_param(inst, pop);
+	if (ret)
+		kfree(inst->codec_info);
+
+	return ret;
+}
+
+int wave6_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
+{
+	int ret;
+
+	if (WARN_ON(!inst->codec_info))
+		return -EINVAL;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	ret = wave6_vpu_dec_fini_seq(inst, fail_res);
+	if (ret) {
+		dev_warn(inst->dev->dev, "dec seq end timed out\n");
+
+		if (*fail_res == WAVE6_SYSERR_VPU_STILL_RUNNING)
+			return ret;
+	}
+
+	dev_dbg(inst->dev->dev, "dec seq end complete\n");
+
+	kfree(inst->codec_info);
+
+	return 0;
+}
+
+int wave6_vpu_dec_issue_seq_init(struct vpu_instance *inst)
+{
+	guard(mutex)(&inst->dev->hw_lock);
+
+	return wave6_vpu_dec_init_seq(inst);
+}
+
+int wave6_vpu_dec_complete_seq_init(struct vpu_instance *inst,
+				    struct dec_seq_info *info)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	int ret;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	ret = wave6_vpu_dec_get_seq_info(inst, info);
+	if (!ret)
+		p_dec_info->seq_info_obtained = true;
+
+	info->rd_ptr = wave6_vpu_dec_get_rd_ptr(inst);
+	info->wr_ptr = p_dec_info->stream_wr_ptr;
+
+	p_dec_info->seq_info = *info;
+
+	return ret;
+}
+
+int wave6_vpu_dec_get_aux_buffer_size(struct vpu_instance *inst,
+				      struct dec_aux_buffer_size_info info,
+				      uint32_t *size)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	int width = info.width;
+	int height = info.height;
+	int buf_size, twice;
+
+	if (info.type == AUX_BUF_FBC_Y_TBL) {
+		switch (inst->std) {
+		case W_HEVC_DEC:
+			buf_size = WAVE6_FBC_LUMA_TABLE_SIZE(width, height);
+			break;
+		case W_AVC_DEC:
+			buf_size = WAVE6_FBC_LUMA_TABLE_SIZE(width, height);
+			break;
+		default:
+			return -EINVAL;
+		}
+		buf_size = ALIGN(buf_size, 16);
+	} else if (info.type == AUX_BUF_FBC_C_TBL) {
+		if (p_dec_info->seq_info.c_fmt_idc == C_FMT_IDC_YUV422)
+			twice = 2;
+		else if (p_dec_info->seq_info.c_fmt_idc == C_FMT_IDC_YUV444)
+			twice = 4;
+		else
+			twice = 1;
+
+		switch (inst->std) {
+		case W_HEVC_DEC:
+			buf_size = WAVE6_FBC_CHROMA_TABLE_SIZE(width, height);
+			break;
+		case W_AVC_DEC:
+			buf_size = WAVE6_FBC_CHROMA_TABLE_SIZE(width, height);
+			break;
+		default:
+			return -EINVAL;
+		}
+		buf_size = buf_size * twice;
+		buf_size = ALIGN(buf_size, 16);
+	} else if (info.type == AUX_BUF_MV_COL) {
+		switch (inst->std) {
+		case W_HEVC_DEC:
+			buf_size = WAVE6_DEC_HEVC_MVCOL_BUF_SIZE(width, height);
+			break;
+		case W_AVC_DEC:
+			buf_size = WAVE6_DEC_AVC_MVCOL_BUF_SIZE(width, height);
+			break;
+		default:
+			return -EINVAL;
+		}
+		buf_size = ALIGN(buf_size, 16);
+	} else {
+		return -EINVAL;
+	}
+
+	*size = buf_size;
+
+	return 0;
+}
+
+int wave6_vpu_dec_register_aux_buffer(struct vpu_instance *inst,
+				      struct aux_buffer_info info)
+{
+	struct dec_info *p_dec_info;
+	struct aux_buffer *aux_bufs = info.buf_array;
+	struct dec_aux_buffer_size_info size_info;
+	unsigned int expected_size;
+	unsigned int i;
+	int ret;
+
+	p_dec_info = &inst->codec_info->dec_info;
+
+	size_info.width = p_dec_info->seq_info.pic_width;
+	size_info.height = p_dec_info->seq_info.pic_height;
+	size_info.type = info.type;
+
+	ret = wave6_vpu_dec_get_aux_buffer_size(inst, size_info, &expected_size);
+	if (ret)
+		return ret;
+
+	switch (info.type) {
+	case AUX_BUF_FBC_Y_TBL:
+		for (i = 0; i < info.num; i++) {
+			if (expected_size > aux_bufs[i].size)
+				return -EINVAL;
+
+			p_dec_info->vb_fbc_y_tbl[aux_bufs[i].index].daddr = aux_bufs[i].addr;
+			p_dec_info->vb_fbc_y_tbl[aux_bufs[i].index].size = aux_bufs[i].size;
+		}
+		break;
+	case AUX_BUF_FBC_C_TBL:
+		for (i = 0; i < info.num; i++) {
+			if (expected_size > aux_bufs[i].size)
+				return -EINVAL;
+
+			p_dec_info->vb_fbc_c_tbl[aux_bufs[i].index].daddr = aux_bufs[i].addr;
+			p_dec_info->vb_fbc_c_tbl[aux_bufs[i].index].size = aux_bufs[i].size;
+		}
+		break;
+	case AUX_BUF_MV_COL:
+		for (i = 0; i < info.num; i++) {
+			if (expected_size > aux_bufs[i].size)
+				return -EINVAL;
+
+			p_dec_info->vb_mv[aux_bufs[i].index].daddr = aux_bufs[i].addr;
+			p_dec_info->vb_mv[aux_bufs[i].index].size = aux_bufs[i].size;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int wave6_vpu_dec_register_frame_buffer_ex(struct vpu_instance *inst,
+					   int num_of_dec_fbs, int stride,
+					   int height, int map_type)
+{
+	struct dec_info *p_dec_info;
+	struct frame_buffer *fb;
+
+	if (num_of_dec_fbs > WAVE6_MAX_FBS)
+		return -EINVAL;
+
+	p_dec_info = &inst->codec_info->dec_info;
+	p_dec_info->stride = stride;
+
+	if (!p_dec_info->seq_info_obtained)
+		return -EINVAL;
+
+	if (stride < p_dec_info->seq_info.pic_width || (stride % 8) ||
+	    height < p_dec_info->seq_info.pic_height)
+		return -EINVAL;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	fb = inst->frame_buf;
+	return wave6_vpu_dec_register_frame_buffer(inst, &fb[0],
+						   COMPRESSED_FRAME_MAP,
+						   num_of_dec_fbs);
+}
+
+int wave6_vpu_dec_register_display_buffer_ex(struct vpu_instance *inst, struct frame_buffer fb)
+{
+	struct dec_info *p_dec_info;
+
+	p_dec_info = &inst->codec_info->dec_info;
+	if (!p_dec_info->seq_info_obtained)
+		return -EINVAL;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	return wave6_vpu_dec_register_display_buffer(inst, fb);
+}
+
+void wave6_vpu_dec_get_bitstream_buffer(struct vpu_instance *inst,
+					dma_addr_t *p_rd_ptr,
+					dma_addr_t *p_wr_ptr)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	dma_addr_t rd_ptr;
+	dma_addr_t wr_ptr;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	rd_ptr = wave6_vpu_dec_get_rd_ptr(inst);
+	wr_ptr = p_dec_info->stream_wr_ptr;
+
+	if (p_rd_ptr)
+		*p_rd_ptr = rd_ptr;
+	if (p_wr_ptr)
+		*p_wr_ptr = wr_ptr;
+}
+
+int wave6_vpu_dec_update_bitstream_buffer(struct vpu_instance *inst, int size)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	dma_addr_t wr_ptr;
+	dma_addr_t rd_ptr;
+
+	wr_ptr = p_dec_info->stream_wr_ptr;
+	rd_ptr = p_dec_info->stream_rd_ptr;
+
+	if (size > 0) {
+		if (wr_ptr < rd_ptr && rd_ptr <= wr_ptr + size)
+			return -EINVAL;
+
+		wr_ptr += size;
+
+		p_dec_info->stream_wr_ptr = wr_ptr;
+		p_dec_info->stream_rd_ptr = rd_ptr;
+	}
+
+	p_dec_info->stream_end = size == 0;
+
+	return 0;
+}
+
+int wave6_vpu_dec_start_one_frame(struct vpu_instance *inst, struct dec_param *param, u32 *res_fail)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+
+	if (!p_dec_info->stride)
+		return -EINVAL;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	return wave6_vpu_decode(inst, param, res_fail);
+}
+
+void wave6_vpu_dec_set_rd_ptr(struct vpu_instance *inst, dma_addr_t addr,
+			      bool update_wr_ptr)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+
+	p_dec_info->stream_rd_ptr = addr;
+	if (update_wr_ptr)
+		p_dec_info->stream_wr_ptr = addr;
+}
+
+int wave6_vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_output_info *info)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	int ret;
+
+	if (WARN_ON(!info))
+		return -EINVAL;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	ret = wave6_vpu_dec_get_result(inst, info);
+	if (ret) {
+		info->rd_ptr = p_dec_info->stream_rd_ptr;
+		info->wr_ptr = p_dec_info->stream_wr_ptr;
+	}
+
+	return ret;
+}
+
+void wave6_vpu_dec_reset_frame_buffer_info(struct vpu_instance *inst)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	int i;
+
+	for (i = 0; i < WAVE6_MAX_FBS; i++) {
+		wave6_vdi_free_dma(&inst->frame_vbuf[i]);
+		memset(&inst->frame_buf[i], 0, sizeof(struct frame_buffer));
+		memset(&p_dec_info->disp_buf[i], 0, sizeof(struct frame_buffer));
+
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_MV_COL][i]);
+		memset(&p_dec_info->vb_mv[i], 0, sizeof(struct vpu_buf));
+
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_Y_TBL][i]);
+		memset(&p_dec_info->vb_fbc_y_tbl[i], 0, sizeof(struct vpu_buf));
+
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_C_TBL][i]);
+		memset(&p_dec_info->vb_fbc_c_tbl[i], 0, sizeof(struct vpu_buf));
+	}
+}
+
+int wave6_vpu_dec_flush_instance(struct vpu_instance *inst)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+
+	if (!p_dec_info->seq_info_obtained)
+		return -EINVAL;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	return wave6_vpu_dec_flush(inst);
+}
+
+int wave6_vpu_enc_open(struct vpu_instance *inst, struct enc_open_param *pop)
+{
+	struct enc_info *p_enc_info;
+	int ret;
+	struct vpu_core_device *core = inst->dev;
+
+	ret = wave6_vpu_enc_check_open_param(inst, pop);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&core->hw_lock);
+
+	if (!wave6_vpu_is_init(core))
+		return -ENODEV;
+
+	inst->codec_info = kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
+	if (!inst->codec_info)
+		return -ENOMEM;
+
+	p_enc_info = &inst->codec_info->enc_info;
+	p_enc_info->open_param = *pop;
+
+	ret = wave6_vpu_build_up_enc_param(core->dev, inst, pop);
+	if (ret)
+		kfree(inst->codec_info);
+
+	return ret;
+}
+
+int wave6_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
+{
+	int ret;
+
+	if (WARN_ON(!inst->codec_info))
+		return -EINVAL;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	ret = wave6_vpu_enc_fini_seq(inst, fail_res);
+	if (ret) {
+		dev_warn(inst->dev->dev, "enc seq end timed out\n");
+
+		if (*fail_res == WAVE6_SYSERR_VPU_STILL_RUNNING)
+			return ret;
+	}
+
+	dev_dbg(inst->dev->dev, "enc seq end timed out\n");
+	kfree(inst->codec_info);
+
+	return 0;
+}
+
+int wave6_vpu_enc_get_aux_buffer_size(struct vpu_instance *inst,
+				      struct enc_aux_buffer_size_info info,
+				      uint32_t *size)
+{
+	struct enc_info *p_enc_info = &inst->codec_info->enc_info;
+	int width, height, buf_size, twice;
+
+	if (inst->std == W_AVC_ENC) {
+		width = ALIGN(info.width, 16);
+		height = ALIGN(info.height, 16);
+		if (p_enc_info->rot_angle == ROT_90 || p_enc_info->rot_angle == ROT_270) {
+			width = ALIGN(info.height, 16);
+			height = ALIGN(info.width, 16);
+		}
+	} else {
+		width = ALIGN(info.width, 8);
+		height = ALIGN(info.height, 8);
+		if ((p_enc_info->rot_angle || p_enc_info->mir_dir) &&
+		    !(p_enc_info->rot_angle == ROT_180 && p_enc_info->mir_dir == MIR_HOR_VER)) {
+			width = ALIGN(info.width, 32);
+			height = ALIGN(info.height, 32);
+		}
+		if (p_enc_info->rot_angle == ROT_90 || p_enc_info->rot_angle == ROT_270) {
+			width = ALIGN(info.height, 32);
+			height = ALIGN(info.width, 32);
+		}
+	}
+
+	if (info.type == AUX_BUF_FBC_Y_TBL) {
+		switch (inst->std) {
+		case W_HEVC_ENC:
+			buf_size = WAVE6_FBC_LUMA_TABLE_SIZE(width, height);
+			break;
+		case W_AVC_ENC:
+			buf_size = WAVE6_FBC_LUMA_TABLE_SIZE(width, height);
+			break;
+		default:
+			return -EINVAL;
+		}
+	} else if (info.type == AUX_BUF_FBC_C_TBL) {
+		if (p_enc_info->c_fmt_idc == C_FMT_IDC_YUV422)
+			twice = 2;
+		else if (p_enc_info->c_fmt_idc == C_FMT_IDC_YUV444)
+			twice = 4;
+		else
+			twice = 1;
+
+		switch (inst->std) {
+		case W_HEVC_ENC:
+			buf_size = WAVE6_FBC_CHROMA_TABLE_SIZE(width, height);
+			break;
+		case W_AVC_ENC:
+			buf_size = WAVE6_FBC_CHROMA_TABLE_SIZE(width, height);
+			break;
+		default:
+			return -EINVAL;
+		}
+		buf_size = buf_size * twice;
+	} else if (info.type == AUX_BUF_MV_COL) {
+		switch (inst->std) {
+		case W_HEVC_ENC:
+			buf_size = WAVE6_ENC_HEVC_MVCOL_BUF_SIZE(width, height);
+			break;
+		case W_AVC_ENC:
+			buf_size = WAVE6_ENC_AVC_MVCOL_BUF_SIZE(width, height);
+			break;
+		default:
+			return -EINVAL;
+		}
+	} else if (info.type == AUX_BUF_SUB_SAMPLE) {
+		switch (inst->std) {
+		case W_HEVC_ENC:
+		case W_AVC_ENC:
+			buf_size = WAVE6_ENC_SUBSAMPLED_SIZE(width, height);
+			break;
+		default:
+			return -EINVAL;
+		}
+	} else {
+		return -EINVAL;
+	}
+
+	*size = buf_size;
+
+	return 0;
+}
+
+int wave6_vpu_enc_register_aux_buffer(struct vpu_instance *inst,
+				      struct aux_buffer_info info)
+{
+	struct enc_info *p_enc_info;
+	struct aux_buffer *aux_bufs = info.buf_array;
+	struct enc_aux_buffer_size_info size_info;
+	unsigned int expected_size;
+	unsigned int i;
+	int ret;
+
+	p_enc_info = &inst->codec_info->enc_info;
+
+	size_info.width = p_enc_info->width;
+	size_info.height = p_enc_info->height;
+	size_info.type = info.type;
+
+	ret = wave6_vpu_enc_get_aux_buffer_size(inst, size_info, &expected_size);
+	if (ret)
+		return ret;
+
+	switch (info.type) {
+	case AUX_BUF_FBC_Y_TBL:
+		for (i = 0; i < info.num; i++) {
+			if (expected_size > aux_bufs[i].size)
+				return -EINVAL;
+
+			p_enc_info->vb_fbc_y_tbl[aux_bufs[i].index].daddr = aux_bufs[i].addr;
+			p_enc_info->vb_fbc_y_tbl[aux_bufs[i].index].size = aux_bufs[i].size;
+		}
+		break;
+	case AUX_BUF_FBC_C_TBL:
+		for (i = 0; i < info.num; i++) {
+			if (expected_size > aux_bufs[i].size)
+				return -EINVAL;
+
+			p_enc_info->vb_fbc_c_tbl[aux_bufs[i].index].daddr = aux_bufs[i].addr;
+			p_enc_info->vb_fbc_c_tbl[aux_bufs[i].index].size = aux_bufs[i].size;
+		}
+		break;
+	case AUX_BUF_MV_COL:
+		for (i = 0; i < info.num; i++) {
+			if (expected_size > aux_bufs[i].size)
+				return -EINVAL;
+
+			p_enc_info->vb_mv[aux_bufs[i].index].daddr = aux_bufs[i].addr;
+			p_enc_info->vb_mv[aux_bufs[i].index].size = aux_bufs[i].size;
+		}
+		break;
+	case AUX_BUF_SUB_SAMPLE:
+		for (i = 0; i < info.num; i++) {
+			if (expected_size > aux_bufs[i].size)
+				return -EINVAL;
+
+			p_enc_info->vb_sub_sam_buf[aux_bufs[i].index].daddr = aux_bufs[i].addr;
+			p_enc_info->vb_sub_sam_buf[aux_bufs[i].index].size = aux_bufs[i].size;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int wave6_vpu_enc_register_frame_buffer_ex(struct vpu_instance *inst, int num, unsigned int stride,
+					   int height, enum tiled_map_type map_type)
+{
+	struct enc_info *p_enc_info = &inst->codec_info->enc_info;
+
+	if (p_enc_info->stride)
+		return -EINVAL;
+
+	if (!p_enc_info->seq_info_obtained)
+		return -EINVAL;
+
+	if (num < p_enc_info->seq_info.min_frame_buffer_count)
+		return -EINVAL;
+
+	if (!stride || stride % 8)
+		return -EINVAL;
+
+	if (height < 0)
+		return -EINVAL;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	p_enc_info->num_frame_buffers = num;
+	p_enc_info->stride = stride;
+
+	return wave6_vpu_enc_register_frame_buffer(inst, &inst->frame_buf[0]);
+}
+
+static int wave6_check_enc_param(struct vpu_instance *inst, struct enc_param *param)
+{
+	struct enc_info *p_enc_info = &inst->codec_info->enc_info;
+	bool is_rgb_format = false;
+
+	if (!param->skip_picture && !param->source_frame)
+		return -EINVAL;
+
+	if (!p_enc_info->open_param.codec_param.bitrate && inst->std == W_HEVC_ENC) {
+		if (param->force_pic_qp) {
+			if (param->force_pic_qp_i < 0 || param->force_pic_qp_i > 63)
+				return -EINVAL;
+
+			if (param->force_pic_qp_p < 0 || param->force_pic_qp_p > 63)
+				return -EINVAL;
+
+			if (param->force_pic_qp_b < 0 || param->force_pic_qp_b > 63)
+				return -EINVAL;
+		}
+		if ((param->pic_stream_buffer_addr % 16 || !param->pic_stream_buffer_size))
+			return -EINVAL;
+	}
+
+	if ((param->pic_stream_buffer_addr % 8 || !param->pic_stream_buffer_size))
+		return -EINVAL;
+
+	if (p_enc_info->open_param.src_format == FORMAT_RGB_32BIT_PACKED ||
+	    p_enc_info->open_param.src_format == FORMAT_RGB_P10_32BIT_PACKED ||
+	    p_enc_info->open_param.src_format == FORMAT_RGB_24BIT_PACKED)
+		is_rgb_format = true;
+
+	if (is_rgb_format) {
+		if (param->csc.coef_ry < -512 || param->csc.coef_ry > 511)
+			return -EINVAL;
+		if (param->csc.coef_gy < -512 || param->csc.coef_gy > 511)
+			return -EINVAL;
+		if (param->csc.coef_by < -512 || param->csc.coef_by > 511)
+			return -EINVAL;
+		if (param->csc.coef_rcb < -512 || param->csc.coef_rcb > 511)
+			return -EINVAL;
+		if (param->csc.coef_gcb < -512 || param->csc.coef_gcb > 511)
+			return -EINVAL;
+		if (param->csc.coef_bcb < -512 || param->csc.coef_bcb > 511)
+			return -EINVAL;
+		if (param->csc.coef_rcr < -512 || param->csc.coef_rcr > 511)
+			return -EINVAL;
+		if (param->csc.coef_gcr < -512 || param->csc.coef_gcr > 511)
+			return -EINVAL;
+		if (param->csc.coef_bcr < -512 || param->csc.coef_bcr > 511)
+			return -EINVAL;
+		if (param->csc.offset_y > 1023)
+			return -EINVAL;
+		if (param->csc.offset_cb > 1023)
+			return -EINVAL;
+		if (param->csc.offset_cr > 1023)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+int wave6_vpu_enc_start_one_frame(struct vpu_instance *inst, struct enc_param *param, u32 *fail_res)
+{
+	struct enc_info *p_enc_info = &inst->codec_info->enc_info;
+	int ret;
+
+	*fail_res = 0;
+
+	if (!p_enc_info->stride)
+		return -EINVAL;
+
+	ret = wave6_check_enc_param(inst, param);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	return wave6_vpu_encode(inst, param, fail_res);
+}
+
+int wave6_vpu_enc_get_output_info(struct vpu_instance *inst, struct enc_output_info *info)
+{
+	if (WARN_ON(!info))
+		return -EINVAL;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	return wave6_vpu_enc_get_result(inst, info);
+}
+
+int wave6_vpu_enc_issue_seq_init(struct vpu_instance *inst)
+{
+	guard(mutex)(&inst->dev->hw_lock);
+
+	return wave6_vpu_enc_init_seq(inst);
+}
+
+int wave6_vpu_enc_issue_seq_change(struct vpu_instance *inst, bool *changed)
+{
+	guard(mutex)(&inst->dev->hw_lock);
+
+	return wave6_vpu_enc_change_seq(inst, changed);
+}
+
+int wave6_vpu_enc_complete_seq_init(struct vpu_instance *inst,
+				    struct enc_seq_info *info)
+{
+	struct enc_info *p_enc_info = &inst->codec_info->enc_info;
+	int ret;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	ret = wave6_vpu_enc_get_seq_info(inst, info);
+	if (ret) {
+		p_enc_info->seq_info_obtained = false;
+		return ret;
+	}
+
+	if (!p_enc_info->seq_info_obtained) {
+		p_enc_info->seq_info_obtained = true;
+		p_enc_info->seq_info = *info;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
new file mode 100644
index 000000000000..6ae0fb195c43
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
@@ -0,0 +1,1026 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 helper interface
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPUAPI_H__
+#define __WAVE6_VPUAPI_H__
+
+#include <linux/kfifo.h>
+#include <linux/idr.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-mem2mem.h>
+#include <media/v4l2-ctrls.h>
+#include "wave6-vpuerror.h"
+#include "wave6-vpuconfig.h"
+#include "wave6-vdi.h"
+#include "wave6-vpu.h"
+
+struct vpu_attr;
+
+enum vpu_instance_type {
+	VPU_INST_TYPE_DEC,
+	VPU_INST_TYPE_ENC
+};
+
+/**
+ * enum vpu_instance_state - VPU instance states
+ * @VPU_INST_STATE_NONE:	Instance is not created or has been destroyed
+ * @VPU_INST_STATE_OPEN:	Instance is created
+ * @VPU_INST_STATE_INIT_SEQ:	For decoder, sequence header is parsed
+ *				For encoder, parameter configuration is complete
+ * @VPU_INST_STATE_PIC_RUN:	Instance is decoding or encoding
+ * @VPU_INST_STATE_SEEK:	Ready to seek a decoding resume point
+ *				Valid only for decoder
+ * @VPU_INST_STATE_STOP:	Decoding or encoding process is stopped
+ */
+enum vpu_instance_state {
+	VPU_INST_STATE_NONE,
+	VPU_INST_STATE_OPEN,
+	VPU_INST_STATE_INIT_SEQ,
+	VPU_INST_STATE_PIC_RUN,
+	VPU_INST_STATE_SEEK,
+	VPU_INST_STATE_STOP
+};
+
+#define WAVE6_MAX_FBS 31
+
+#define WAVE6_DEC_HEVC_MVCOL_BUF_SIZE(_w, _h) \
+	((ALIGN((_w), 256) / 16) * (ALIGN((_h), 64) / 16) * 1 * 16)
+#define WAVE6_DEC_AVC_MVCOL_BUF_SIZE(_w, _h) \
+	((ALIGN((_w), 64) / 16) * (ALIGN((_h), 16) / 16) * 5 * 16)
+#define WAVE6_FBC_LUMA_TABLE_SIZE(_w, _h) \
+	(ALIGN((_w), 256) * ALIGN((_h), 64) / 32)
+#define WAVE6_FBC_CHROMA_TABLE_SIZE(_w, _h) \
+	(ALIGN(((_w) / 2), 256) * ALIGN((_h), 64) / 32)
+#define WAVE6_ENC_AVC_MVCOL_BUF_SIZE(_w, _h) \
+	((ALIGN((_w), 512) / 512) * (ALIGN((_h), 16) / 16) * 16)
+#define WAVE6_ENC_HEVC_MVCOL_BUF_SIZE(_w, _h) \
+	((ALIGN((_w), 64) / 64) * (ALIGN((_h), 64) / 64) * 128)
+#define WAVE6_ENC_SUBSAMPLED_SIZE(_w, _h) \
+	(ALIGN(((_w) / 4), 16) * ALIGN(((_h) / 4), 32))
+
+enum codec_std {
+	W_HEVC_DEC	= 0x00,
+	W_HEVC_ENC	= 0x01,
+	W_AVC_DEC	= 0x02,
+	W_AVC_ENC	= 0x03,
+	STD_UNKNOWN	= 0xFF
+};
+
+#define HEVC_PROFILE_MAIN 1
+#define HEVC_PROFILE_MAIN10 2
+#define HEVC_PROFILE_STILLPICTURE 3
+#define HEVC_PROFILE_MAIN10_STILLPICTURE 2
+
+#define H264_PROFILE_BP 1
+#define H264_PROFILE_MP 2
+#define H264_PROFILE_EXTENDED 3
+#define H264_PROFILE_HP 4
+#define H264_PROFILE_HIGH10 5
+
+#define H264_VUI_SAR_IDC_EXTENDED 255
+
+#define DEC_REFRESH_TYPE_NON_IRAP 0
+#define DEC_REFRESH_TYPE_IDR 2
+
+#define DEFAULT_TEMP_LAYER_CNT 1
+#define DEFAULT_RC_INITIAL_LEVEL 8
+#define DEFAULT_RC_INITIAL_QP -1
+#define DEFAULT_PIC_RC_MAX_DQP 3
+#define DEFAULT_QROUND_INTER 85
+#define DEFAULT_QROUND_INTRA 171
+#define DEFAULT_INTRA_4X4 3
+#define DEFAULT_NUM_TICKS_POC_DIFF 100
+#define DEFAULT_RC_UPDATE_SPEED_CBR 64
+#define DEFAULT_RC_UPDATE_SPEED_VBR 16
+
+#define SEQ_CHANGE_ENABLE_PROFILE BIT(5)
+#define SEQ_CHANGE_ENABLE_SIZE BIT(16)
+#define SEQ_CHANGE_ENABLE_BIT_DEPTH BIT(18)
+#define SEQ_CHANGE_ENABLE_DPB_COUNT BIT(19)
+
+#define SEQ_CHANGE_ENABLE_ALL_HEVC (SEQ_CHANGE_ENABLE_PROFILE | \
+		SEQ_CHANGE_ENABLE_SIZE | \
+		SEQ_CHANGE_ENABLE_BIT_DEPTH | \
+		SEQ_CHANGE_ENABLE_DPB_COUNT)
+
+#define SEQ_CHANGE_ENABLE_ALL_AVC (SEQ_CHANGE_ENABLE_SIZE | \
+		SEQ_CHANGE_ENABLE_BIT_DEPTH | \
+		SEQ_CHANGE_ENABLE_DPB_COUNT)
+
+#define DEC_NOTI_FLAG_NO_FB		BIT(1)
+#define DEC_NOTI_FLAG_SEQ_CHANGE	BIT(0)
+
+#define RECON_IDX_FLAG_ENC_END -1
+#define RECON_IDX_FLAG_ENC_DELAY -2
+#define RECON_IDX_FLAG_HEADER_ONLY -3
+#define RECON_IDX_FLAG_CHANGE_PARAM -4
+
+#define FW_VERSION_MAJOR_MASK	0xFF000000
+#define FW_VERSION_MINOR_MASK	0x00FF0000
+#define FW_VERSION_REL_MASK	0x0000FFFF
+#define FW_VERSION_MAJOR(x)	FIELD_GET(FW_VERSION_MAJOR_MASK, (x))
+#define FW_VERSION_MINOR(x)	FIELD_GET(FW_VERSION_MINOR_MASK, (x))
+#define FW_VERSION_REL(x)	FIELD_GET(FW_VERSION_REL_MASK, (x))
+
+enum mirror_direction {
+	MIR_NONE,
+	MIR_VER,
+	MIR_HOR,
+	MIR_HOR_VER
+};
+
+enum rotation_angle {
+	ROT_0 = 0,
+	ROT_90 = 90,
+	ROT_180 = 180,
+	ROT_270 = 270
+};
+
+enum chroma_format_idc {
+	C_FMT_IDC_YUV400,
+	C_FMT_IDC_YUV420,
+	C_FMT_IDC_YUV422,
+	C_FMT_IDC_YUV444,
+	C_FMT_IDC_RGB
+};
+
+enum csc_format_order {
+	CSC_FMT_ORDER_RGB	= 0,
+	CSC_FMT_ORDER_RBG	= 1,
+	CSC_FMT_ORDER_GRB	= 2,
+	CSC_FMT_ORDER_GBR	= 3,
+	CSC_FMT_ORDER_BGR	= 4,
+	CSC_FMT_ORDER_BRG	= 5,
+
+	CSC_FMT_ORDER_ARGB	= 0,
+	CSC_FMT_ORDER_ARBG	= 1,
+	CSC_FMT_ORDER_AGRB	= 2,
+	CSC_FMT_ORDER_AGBR	= 3,
+	CSC_FMT_ORDER_ABGR	= 4,
+	CSC_FMT_ORDER_ABRG	= 5,
+	CSC_FMT_ORDER_RGBA	= 8,
+	CSC_FMT_ORDER_RBGA	= 9,
+	CSC_FMT_ORDER_GRBA	= 10,
+	CSC_FMT_ORDER_GBRA	= 11,
+	CSC_FMT_ORDER_BGRA	= 12,
+	CSC_FMT_ORDER_BRGA	= 13,
+};
+
+enum frame_buffer_format {
+	FORMAT_ERR = -1,
+
+	FORMAT_420 = 0,
+	FORMAT_422,
+	FORMAT_224,
+	FORMAT_444,
+	FORMAT_400,
+
+	FORMAT_420_P10_16BIT_MSB = 5,
+	FORMAT_420_P10_16BIT_LSB,
+	FORMAT_420_P10_32BIT_MSB,
+	FORMAT_420_P10_32BIT_LSB,
+
+	FORMAT_422_P10_16BIT_MSB,
+	FORMAT_422_P10_16BIT_LSB,
+	FORMAT_422_P10_32BIT_MSB,
+	FORMAT_422_P10_32BIT_LSB,
+
+	FORMAT_444_P10_16BIT_MSB,
+	FORMAT_444_P10_16BIT_LSB,
+	FORMAT_444_P10_32BIT_MSB,
+	FORMAT_444_P10_32BIT_LSB,
+
+	FORMAT_400_P10_16BIT_MSB,
+	FORMAT_400_P10_16BIT_LSB,
+	FORMAT_400_P10_32BIT_MSB,
+	FORMAT_400_P10_32BIT_LSB,
+
+	FORMAT_YUYV,
+	FORMAT_YUYV_P10_16BIT_MSB,
+	FORMAT_YUYV_P10_16BIT_LSB,
+	FORMAT_YUYV_P10_32BIT_MSB,
+	FORMAT_YUYV_P10_32BIT_LSB,
+
+	FORMAT_YVYU,
+	FORMAT_YVYU_P10_16BIT_MSB,
+	FORMAT_YVYU_P10_16BIT_LSB,
+	FORMAT_YVYU_P10_32BIT_MSB,
+	FORMAT_YVYU_P10_32BIT_LSB,
+
+	FORMAT_UYVY,
+	FORMAT_UYVY_P10_16BIT_MSB,
+	FORMAT_UYVY_P10_16BIT_LSB,
+	FORMAT_UYVY_P10_32BIT_MSB,
+	FORMAT_UYVY_P10_32BIT_LSB,
+
+	FORMAT_VYUY,
+	FORMAT_VYUY_P10_16BIT_MSB,
+	FORMAT_VYUY_P10_16BIT_LSB,
+	FORMAT_VYUY_P10_32BIT_MSB,
+	FORMAT_VYUY_P10_32BIT_LSB,
+
+	FORMAT_RGB_32BIT_PACKED = 90,
+	FORMAT_YUV444_32BIT_PACKED,
+	FORMAT_RGB_P10_32BIT_PACKED,
+	FORMAT_YUV444_P10_32BIT_PACKED,
+
+	FORMAT_RGB_24BIT_PACKED = 95,
+	FORMAT_YUV444_24BIT_PACKED,
+	FORMAT_YUV444_24BIT,
+
+	FORMAT_MAX,
+};
+
+enum pic_type {
+	PIC_TYPE_I = 0,
+	PIC_TYPE_P = 1,
+	PIC_TYPE_B = 2,
+	PIC_TYPE_IDR = 5,
+	PIC_TYPE_MAX
+};
+
+enum enc_force_pic_type {
+	ENC_FORCE_PIC_TYPE_I = 0,
+	ENC_FORCE_PIC_TYPE_P = 1,
+	ENC_FORCE_PIC_TYPE_B = 2,
+	ENC_FORCE_PIC_TYPE_IDR = 3,
+	ENC_FORCE_PIC_TYPE_DISABLED = 4,
+};
+
+enum display_mode {
+	DISP_MODE_DISP_ORDER,
+	DISP_MODE_DEC_ORDER,
+};
+
+enum sw_reset_mode {
+	SW_RESET_SAFETY,
+	SW_RESET_FORCE,
+	SW_RESET_ON_BOOT
+};
+
+enum tiled_map_type {
+	LINEAR_FRAME_MAP = 0,
+	COMPRESSED_FRAME_MAP = 17,
+};
+
+enum aux_buffer_type {
+	AUX_BUF_FBC_Y_TBL,
+	AUX_BUF_FBC_C_TBL,
+	AUX_BUF_MV_COL,
+	AUX_BUF_SUB_SAMPLE,
+	AUX_BUF_TYPE_MAX,
+};
+
+enum intra_refresh_mode {
+	INTRA_REFRESH_NONE = 0,
+	INTRA_REFRESH_ROW = 1,
+	INTRA_REFRESH_COLUMN = 2,
+};
+
+struct vpu_attr {
+	u32 product_id;
+	char product_name[8];
+	u32 product_code;
+	u32 product_version;
+	u32 fw_version;
+	u32 fw_revision;
+	u32 hw_version;
+	u32 support_decoders;
+	u32 support_encoders;
+	bool support_avc10bit_dec;
+	bool support_hevc10bit_dec;
+	bool support_avc10bit_enc;
+	bool support_hevc10bit_enc;
+	bool support_dual_core;
+};
+
+struct frame_buffer {
+	dma_addr_t buf_y;
+	dma_addr_t buf_cb;
+	dma_addr_t buf_cr;
+	enum tiled_map_type map_type;
+	unsigned int stride;
+	unsigned int width;
+	unsigned int height;
+	int index;
+	u32 luma_bit_depth: 4;
+	u32 chroma_bit_depth: 4;
+	enum chroma_format_idc c_fmt_idc;
+};
+
+struct vpu_rect {
+	u32 left;
+	u32 top;
+	u32 right;
+	u32 bottom;
+};
+
+struct sar_info {
+	u32 enable;
+	u32 idc;
+	u32 width;
+	u32 height;
+};
+
+struct aux_buffer {
+	int index;
+	int size;
+	dma_addr_t addr;
+};
+
+struct aux_buffer_info {
+	int num;
+	struct aux_buffer *buf_array;
+	enum aux_buffer_type type;
+};
+
+struct instance_buffer {
+	dma_addr_t temp_base;
+	u32 temp_size;
+	dma_addr_t ar_base;
+};
+
+struct report_cycle {
+	u32 host_cmd_s;
+	u32 host_cmd_e;
+	u32 proc_s;
+	u32 proc_e;
+	u32 vpu_s;
+	u32 vpu_e;
+	u32 frame_cycle;
+	u32 proc_cycle;
+	u32 vpu_cycle;
+};
+
+struct color_param {
+	u32 color_range;
+	u32 matrix_coefficients;
+	u32 transfer_characteristics;
+	u32 color_primaries;
+	bool color_description_present;
+	bool video_signal_type_present;
+};
+
+struct sec_axi_info {
+	bool use_dec_ip;
+	bool use_dec_lf_row;
+	bool use_enc_rdo;
+	bool use_enc_lf;
+};
+
+struct dec_aux_buffer_size_info {
+	int width;
+	int height;
+	enum aux_buffer_type type;
+};
+
+struct dec_scaler_info {
+	bool enable;
+	int width;
+	int height;
+};
+
+struct dec_open_param {
+	enum display_mode disp_mode;
+	u32 ext_addr_vcpu: 8;
+	bool is_secure_inst;
+	u32 inst_priority: 5;
+	struct instance_buffer inst_buffer;
+};
+
+struct dec_seq_info {
+	u32 pic_width;
+	u32 pic_height;
+	u32 f_rate_numerator;
+	u32 f_rate_denominator;
+	struct vpu_rect pic_crop_rect;
+	u32 min_frame_buffer_count;
+	u32 req_mv_buffer_count;
+	u32 frame_buf_delay;
+	u32 profile;
+	u32 level;
+	u32 tier;
+	bool is_ext_sar;
+	u32 aspect_rate_info;
+	u32 bitrate;
+	enum chroma_format_idc c_fmt_idc;
+	u32 luma_bit_depth;
+	u32 chroma_bit_depth;
+	u32 err_reason;
+	int warn_info;
+	dma_addr_t rd_ptr;
+	dma_addr_t wr_ptr;
+	unsigned int sequence_no;
+	struct color_param color;
+};
+
+struct dec_param {
+	u64 timestamp;
+};
+
+struct dec_output_info {
+	int nal_type;
+	int pic_type;
+	int disp_pic_width;
+	int disp_pic_height;
+	int dec_pic_width;
+	int dec_pic_height;
+	int decoded_poc;
+	int display_poc;
+	dma_addr_t rd_ptr;
+	dma_addr_t wr_ptr;
+	dma_addr_t byte_pos_frame_start;
+	dma_addr_t byte_pos_frame_end;
+	dma_addr_t frame_decoded_addr;
+	dma_addr_t frame_display_addr;
+	int error_reason;
+	int warn_info;
+	unsigned int sequence_no;
+	struct report_cycle cycle;
+	dma_addr_t release_disp_frame_addr[WAVE6_MAX_FBS];
+	dma_addr_t disp_frame_addr[WAVE6_MAX_FBS];
+	u64 timestamp;
+	u32 notification_flags;
+	u32 release_disp_frame_num: 5;
+	u32 disp_frame_num: 5;
+	u32 ctu_size: 2;
+	bool frame_display;
+	bool frame_decoded;
+	bool stream_end;
+	bool last_frame_in_au;
+	bool decoding_success;
+};
+
+struct dec_info {
+	struct dec_open_param open_param;
+	struct dec_seq_info seq_info;
+	dma_addr_t stream_wr_ptr;
+	dma_addr_t stream_rd_ptr;
+	bool stream_end;
+	struct vpu_buf vb_mv[WAVE6_MAX_FBS];
+	struct vpu_buf vb_fbc_y_tbl[WAVE6_MAX_FBS];
+	struct vpu_buf vb_fbc_c_tbl[WAVE6_MAX_FBS];
+	struct frame_buffer disp_buf[WAVE6_MAX_FBS];
+	int stride;
+	bool seq_info_obtained;
+	struct sec_axi_info sec_axi;
+	struct dec_output_info dec_out_info[WAVE6_MAX_FBS];
+	int seq_change_mask;
+	enum frame_buffer_format wtl_format;
+};
+
+#define MAX_CUSTOM_LAMBDA_NUM 52
+#define MAX_NUM_TEMP_LAYER 7
+#define MAX_CUSTOM_GOP_NUM 8
+#define MAX_NUM_CHANGEABLE_TEMP_LAYER 4
+
+struct custom_gop_pic_param {
+	int pic_type;
+	int poc_offset;
+	int pic_qp;
+	bool multi_ref_p;
+	int ref_poc_l0;
+	int ref_poc_l1;
+	int temporal_id;
+};
+
+struct custom_gop_param {
+	int size;
+	struct custom_gop_pic_param pic[MAX_CUSTOM_GOP_NUM];
+};
+
+struct temporal_layer_param {
+	bool change_qp;
+	u32 qp_i;
+	u32 qp_p;
+	u32 qp_b;
+};
+
+struct enc_aux_buffer_size_info {
+	int width;
+	int height;
+	enum aux_buffer_type type;
+};
+
+struct enc_scaler_info {
+	bool enable;
+	int width;
+	int height;
+	int coef_mode;
+};
+
+struct enc_codec_param {
+	u32 internal_bit_depth;
+	u32 decoding_refresh_type;
+	u32 idr_period;
+	u32 intra_period;
+	u32 gop_preset_idx;
+	u32 frame_rate;
+	u32 bitrate;
+	u32 cpb_size;
+	u32 hvs_qp_scale_div2;
+	u32 max_delta_qp;
+	int rc_initial_qp;
+	u32 rc_update_speed;
+	u32 max_bitrate;
+	u32 rc_mode;
+	u32 rc_initial_level;
+	u32 pic_rc_max_dqp;
+	u32 bg_th_diff;
+	u32 bg_th_mean_diff;
+	int bg_delta_qp;
+	u32 intra_refresh_mode;
+	u32 intra_refresh_arg;
+	int beta_offset_div2;
+	int tc_offset_div2;
+	u32 qp;
+	u32 min_qp_i;
+	u32 max_qp_i;
+	u32 min_qp_p;
+	u32 max_qp_p;
+	u32 min_qp_b;
+	u32 max_qp_b;
+	int cb_qp_offset;
+	int cr_qp_offset;
+	u32 qround_intra;
+	u32 qround_inter;
+	int lambda_dqp_intra;
+	int lambda_dqp_inter;
+	u32 slice_mode;
+	u32 slice_arg;
+	u32 level;
+	u32 tier;
+	u32 profile;
+	struct vpu_rect conf_win;
+	u32 forced_idr_header;
+	u16 lambda_ssd[MAX_CUSTOM_LAMBDA_NUM];
+	u16 lambda_sad[MAX_CUSTOM_LAMBDA_NUM];
+	struct custom_gop_param gop_param;
+	struct temporal_layer_param temp_layer[MAX_NUM_CHANGEABLE_TEMP_LAYER];
+	u32 temp_layer_cnt;
+	u32 mv_histo_th0;
+	u32 mv_histo_th1;
+	u32 mv_histo_th2;
+	u32 mv_histo_th3;
+	u32 num_units_in_tick;
+	u32 time_scale;
+	u32 num_ticks_poc_diff_one;
+	struct color_param color;
+	struct sar_info sar;
+	u32 max_intra_pic_bit;
+	u32 max_inter_pic_bit;
+	u32 intra_4x4;
+
+	u32 en_const_intra_pred: 1;
+	u32 en_longterm: 1;
+	u32 en_rate_control: 1;
+	u32 en_transform8x8: 1;
+	u32 en_hvs_qp: 1;
+	u32 en_bg_detect: 1;
+	u32 en_temporal_mvp: 1;
+	u32 en_cabac: 1;
+	u32 en_dbk: 1;
+	u32 en_sao: 1;
+	u32 en_lf_slice_boundary: 1;
+	u32 en_scaling_list: 1;
+	u32 en_qround_offset: 1;
+	u32 en_still_picture: 1;
+	u32 en_intra_smooth: 1;
+	u32 en_custom_lambda: 1;
+	u32 en_report_mv_histo: 1;
+	u32 en_cu_level_rate_control: 1;
+	u32 en_skip_frame: 1;
+};
+
+struct enc_open_param {
+	int pic_width;
+	int pic_height;
+	struct enc_codec_param codec_param;
+	enum endian_mode source_endian;
+	enum frame_buffer_format src_format;
+	enum frame_buffer_format output_format;
+	u32 ext_addr_vcpu: 8;
+	bool is_secure_inst;
+	u32 inst_priority: 5;
+	struct instance_buffer inst_buffer;
+	enum mirror_direction mir_dir;
+	enum rotation_angle rot_angle;
+};
+
+struct enc_seq_info {
+	u32 min_frame_buffer_count;
+	u32 min_src_frame_count;
+	u32 req_mv_buffer_count;
+	int max_latency_pictures;
+	int err_reason;
+	int warn_info;
+};
+
+struct enc_csc_param {
+	u32 fmt_order;
+	s32 coef_ry;
+	s32 coef_gy;
+	s32 coef_by;
+	s32 coef_rcb;
+	s32 coef_gcb;
+	s32 coef_bcb;
+	s32 coef_rcr;
+	s32 coef_gcr;
+	s32 coef_bcr;
+	u32 offset_y;
+	u32 offset_cb;
+	u32 offset_cr;
+};
+
+struct enc_param {
+	struct frame_buffer *source_frame;
+	bool skip_picture;
+	dma_addr_t pic_stream_buffer_addr;
+	int pic_stream_buffer_size;
+	bool force_pic_qp;
+	int force_pic_qp_i;
+	int force_pic_qp_p;
+	int force_pic_qp_b;
+	bool force_pic;
+	int force_pic_type;
+	int src_idx;
+	bool src_end;
+	u32 bitrate;
+	struct enc_csc_param csc;
+	u64 timestamp;
+};
+
+struct enc_report_fme_sum {
+	u32 lower_x0;
+	u32 higher_x0;
+	u32 lower_y0;
+	u32 higher_y0;
+	u32 lower_x1;
+	u32 higher_x1;
+	u32 lower_y1;
+	u32 higher_y1;
+};
+
+struct enc_report_mv_histo {
+	u32 cnt0;
+	u32 cnt1;
+	u32 cnt2;
+	u32 cnt3;
+	u32 cnt4;
+};
+
+struct enc_output_info {
+	dma_addr_t bitstream_buffer;
+	u32 bitstream_size;
+	int pic_type;
+	int num_of_slices;
+	int recon_frame_index;
+	dma_addr_t rd_ptr;
+	dma_addr_t wr_ptr;
+	int pic_skipped;
+	int num_of_intra;
+	int num_of_merge;
+	int num_of_skip_block;
+	int avg_ctu_qp;
+	int enc_pic_byte;
+	int enc_gop_pic_idx;
+	int enc_pic_poc;
+	int enc_src_idx;
+	int enc_vcl_nut;
+	int enc_pic_cnt;
+	int error_reason;
+	int warn_info;
+	u32 pic_distortion_low;
+	u32 pic_distortion_high;
+	bool non_ref_pic;
+	bool encoding_success;
+	struct enc_report_fme_sum fme_sum;
+	struct enc_report_mv_histo mv_histo;
+	struct report_cycle cycle;
+	u64 timestamp;
+	dma_addr_t src_y_addr;
+	dma_addr_t custom_map_addr;
+	dma_addr_t prefix_sei_nal_addr;
+	dma_addr_t suffix_sei_nal_addr;
+};
+
+enum gop_preset_idx {
+	PRESET_IDX_CUSTOM_GOP = 0,
+	PRESET_IDX_ALL_I = 1,
+	PRESET_IDX_IPP = 2,
+	PRESET_IDX_IBBB = 3,
+	PRESET_IDX_IBPBP = 4,
+	PRESET_IDX_IBBBP = 5,
+	PRESET_IDX_IPPPP = 6,
+	PRESET_IDX_IBBBB = 7,
+	PRESET_IDX_RA_IB = 8,
+	PRESET_IDX_IPP_SINGLE = 9,
+	PRESET_IDX_MAX,
+};
+
+struct enc_info {
+	struct enc_open_param open_param;
+	struct enc_seq_info seq_info;
+	int num_frame_buffers;
+	int stride;
+	enum mirror_direction mir_dir;
+	enum rotation_angle rot_angle;
+	bool seq_info_obtained;
+	struct sec_axi_info sec_axi;
+	struct vpu_buf vb_mv[WAVE6_MAX_FBS];
+	struct vpu_buf vb_fbc_y_tbl[WAVE6_MAX_FBS];
+	struct vpu_buf vb_fbc_c_tbl[WAVE6_MAX_FBS];
+	struct vpu_buf vb_sub_sam_buf[WAVE6_MAX_FBS];
+	u32 width;
+	u32 height;
+	struct enc_scaler_info scaler;
+	enum chroma_format_idc c_fmt_idc;
+};
+
+struct h264_enc_controls {
+	u32 profile;
+	u32 level;
+	u32 min_qp;
+	u32 max_qp;
+	u32 i_frame_qp;
+	u32 p_frame_qp;
+	u32 b_frame_qp;
+	u32 loop_filter_mode;
+	u32 loop_filter_beta;
+	u32 loop_filter_alpha;
+	u32 _8x8_transform;
+	u32 constrained_intra_prediction;
+	u32 chroma_qp_index_offset;
+	u32 entropy_mode;
+	u32 i_period;
+	u32 vui_sar_enable;
+	u32 vui_sar_idc;
+	u32 vui_ext_sar_width;
+	u32 vui_ext_sar_height;
+	u32 cpb_size;
+};
+
+struct hevc_enc_controls {
+	u32 profile;
+	u32 level;
+	u32 min_qp;
+	u32 max_qp;
+	u32 i_frame_qp;
+	u32 p_frame_qp;
+	u32 b_frame_qp;
+	u32 loop_filter_mode;
+	u32 lf_beta_offset_div2;
+	u32 lf_tc_offset_div2;
+	u32 refresh_type;
+	u32 refresh_period;
+	u32 const_intra_pred;
+	u32 strong_smoothing;
+	u32 tmv_prediction;
+};
+
+struct enc_controls {
+	u32 frame_rate;
+	u32 rotation_angle;
+	u32 mirror_direction;
+	u32 bitrate;
+	u32 bitrate_mode;
+	u32 gop_size;
+	u32 frame_rc_enable;
+	u32 mb_rc_enable;
+	u32 slice_mode;
+	u32 slice_max_mb;
+	u32 prepend_spspps_to_idr;
+	u32 intra_refresh_period;
+	struct h264_enc_controls h264;
+	struct hevc_enc_controls hevc;
+	u32 force_key_frame;
+	u32 frame_skip_mode;
+};
+
+/**
+ * struct vpu_irq - VPU interrupt information
+ * @status:	Value of the VPU interrupt status
+ * @inst_idc:	Bitmask of instance IDs for this interrupt
+ */
+struct vpu_irq {
+	u32 status;
+	u32 inst_idc;
+};
+
+/**
+ * struct vpu_core_device - VPU core driver structure
+ * @dev:		Platform device pointer
+ * @vpu:		Parent VPU driver structure
+ * @v4l2_dev:		V4L2 device
+ * @m2m_dev:		V4L2 mem2mem device
+ * @instances:		List of VPU instances
+ * @inst_lock:		Spinlock protecting instance list
+ * @video_dev_dec:	Video device node for decoder
+ * @video_dev_enc:	Video device node for encoder
+ * @dev_lock:		Mutex protecting video_device, src, dst vb2_queue
+ * @hw_lock:		Mutex protecting register access
+ * @attr:		Hardware attributes retrieved after boot
+ * @reg_base:		Base address of MMIO registers
+ * @temp_vbuf:		TEMP buffer
+ * @clks:		Array of clock handles
+ * @num_clks:		Number of entries in @clks
+ * @irq_fifo:		kfifo storing interrupt information
+ * @task_timer:		Workqueue to detect hangs during frame processing
+ * @res:		Device compatible data
+ * @debugfs:		Debugfs entry
+ * @active:		Decoder/encoder active flag
+ */
+struct vpu_core_device {
+	struct device *dev;
+	struct wave6_vpu_device *vpu;
+	struct v4l2_device v4l2_dev;
+	struct v4l2_m2m_dev *m2m_dev;
+	struct list_head instances;
+	spinlock_t inst_lock; /* Protects instance list */
+	struct video_device *video_dev_dec;
+	struct video_device *video_dev_enc;
+	struct mutex dev_lock; /* Protects video_device, src, dst vb2_queue */
+	struct mutex hw_lock; /* Protects register access */
+	struct vpu_attr	attr;
+	void __iomem *reg_base;
+
+	/* Allocates per-core, used during decode/encode process. */
+	struct vpu_buf temp_vbuf;
+
+	struct clk_bulk_data *clks;
+	int num_clks;
+
+	/* Stores interrupt information quickly, consumed in irq_thread. */
+	struct kfifo irq_fifo;
+
+	/* Detects hangs during decode/encode and aborts if needed. */
+	struct delayed_work task_timer;
+
+	const struct wave6_vpu_core_resource *res;
+	struct dentry *debugfs;
+	bool active;
+};
+
+struct vpu_instance;
+
+struct vpu_instance_ops {
+	int (*prepare_process)(struct vpu_instance *inst);
+	int (*start_process)(struct vpu_instance *inst);
+	void (*finish_process)(struct vpu_instance *inst, bool error);
+};
+
+struct vpu_performance_info {
+	ktime_t ts_start;
+	ktime_t ts_first;
+	ktime_t ts_last;
+	s64 latency_first;
+	s64 latency_max;
+	s64 min_process_time;
+	s64 max_process_time;
+	u64 total_sw_time;
+	u64 total_hw_time;
+};
+
+/**
+ * struct vpu_instance - VPU instance structure
+ * @list:		List head for VPU core device instance list
+ * @v4l2_fh:		V4L2 file handler
+ * @v4l2_ctrl_hdl:	V4L2 control handler
+ * @dev:		VPU core driver structure
+ * @irq_done:		Completion for command finish
+ * @src_fmt:		V4L2 pixel format for source
+ * @dst_fmt:		V4L2 pixel format for destination
+ * @crop:		Crop rectangle
+ * @codec_rect:		Actual encoding rectangle
+ * @scaler_info:	Decoder scaler information
+ * @colorspace:		V4L2 colorspace
+ * @xfer_func:		V4L2 transfer function
+ * @ycbcr_enc:		V4L2 YCbCr encoding
+ * @quantization:	V4L2 quantization
+ * @state:		Instance state
+ * @state_in_seek:	Previous state before seek
+ * @type:		Instance type (decoder or encoder)
+ * @ops:		Instance operations
+ * @std:		Codec standard
+ * @id:			Instance id
+ * @enc_info:		Encoder-specific information
+ * @dec_info:		Decoder-specific information
+ * @frame_buf:		Metadata for reference frame buffers
+ * @frame_vbuf:		Reference frame buffers
+ * @aux_vbuf:		Auxiliary buffers
+ * @ar_vbuf:		Auxiliary AR buffer for encoder
+ * @fbc_buf_registered:	Reference frame buffers registration flag
+ * @queued_src_buf_num:	number of queued source buffers
+ * @queued_dst_buf_num:	number of queued destination buffers
+ * @processed_buf_num:	number of processed buffers
+ * @error_buf_num:	number of error buffers
+ * @sequence:		V4L2 buffers sequence number
+ * @next_buf_last:	Next queued buffer last flag
+ * @cbcr_interleave:	CbCr interleave format flag
+ * @nv21:		NV21 format flag
+ * @eos:		End of stream flag
+ * @error_recovery:	Error recovery flag
+ * @disp_mode:		Display mode for decoder V4L2 control
+ * @enc_ctrls:		Encoder V4L2 control and streaming parameters
+ * @performance:	Performance information
+ * @debugfs:		Debugfs entry
+ */
+struct vpu_instance {
+	struct list_head list;
+	struct v4l2_fh v4l2_fh;
+	struct v4l2_ctrl_handler v4l2_ctrl_hdl;
+	struct vpu_core_device *dev;
+
+	/* Signals when INIT_SEQ, SET_PARAM command is done. */
+	struct completion irq_done;
+
+	struct v4l2_pix_format_mplane src_fmt;
+	struct v4l2_pix_format_mplane dst_fmt;
+	struct v4l2_rect crop;
+	struct v4l2_rect codec_rect;
+	struct dec_scaler_info scaler_info;
+	enum v4l2_colorspace colorspace;
+	enum v4l2_xfer_func xfer_func;
+	enum v4l2_ycbcr_encoding ycbcr_enc;
+	enum v4l2_quantization quantization;
+
+	enum vpu_instance_state state;
+	enum vpu_instance_state state_in_seek;
+	enum vpu_instance_type type;
+	const struct vpu_instance_ops *ops;
+
+	enum codec_std std;
+	u32 id;
+	union {
+		struct enc_info enc_info;
+		struct dec_info dec_info;
+	} *codec_info;
+	struct frame_buffer frame_buf[WAVE6_MAX_FBS];
+	struct vpu_buf frame_vbuf[WAVE6_MAX_FBS];
+	struct vpu_buf aux_vbuf[AUX_BUF_TYPE_MAX][WAVE6_MAX_FBS];
+	struct vpu_buf ar_vbuf;
+	u32 fbc_buf_registered;
+	u32 queued_src_buf_num;
+	u32 queued_dst_buf_num;
+	u32 processed_buf_num;
+	u32 error_buf_num;
+	u32 sequence;
+	bool next_buf_last;
+	bool cbcr_interleave;
+	bool nv21;
+	bool eos;
+	bool error_recovery;
+
+	enum display_mode disp_mode;
+	struct enc_controls enc_ctrls;
+
+	struct vpu_performance_info performance;
+	struct dentry *debugfs;
+};
+
+void wave6_vpu_writel(struct vpu_core_device *core, u32 addr, u32 data);
+u32 wave6_vpu_readl(struct vpu_core_device *core, u32 addr);
+
+int wave6_vpu_dec_open(struct vpu_instance *inst, struct dec_open_param *pop);
+int wave6_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res);
+int wave6_vpu_dec_issue_seq_init(struct vpu_instance *inst);
+int wave6_vpu_dec_complete_seq_init(struct vpu_instance *inst, struct dec_seq_info *info);
+int wave6_vpu_dec_get_aux_buffer_size(struct vpu_instance *inst,
+				      struct dec_aux_buffer_size_info info,
+				      uint32_t *size);
+int wave6_vpu_dec_register_aux_buffer(struct vpu_instance *inst, struct aux_buffer_info info);
+int wave6_vpu_dec_register_frame_buffer_ex(struct vpu_instance *inst, int num_of_dec_fbs,
+					   int stride, int height, int map_type);
+int wave6_vpu_dec_register_display_buffer_ex(struct vpu_instance *inst, struct frame_buffer fb);
+int wave6_vpu_dec_start_one_frame(struct vpu_instance *inst, struct dec_param *param,
+				  u32 *res_fail);
+int wave6_vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_output_info *info);
+void wave6_vpu_dec_set_rd_ptr(struct vpu_instance *inst, dma_addr_t addr,
+			      bool update_wr_ptr);
+void wave6_vpu_dec_reset_frame_buffer_info(struct vpu_instance *inst);
+void wave6_vpu_dec_get_bitstream_buffer(struct vpu_instance *inst,
+					dma_addr_t *p_rd_ptr,
+					dma_addr_t *p_wr_ptr);
+int wave6_vpu_dec_update_bitstream_buffer(struct vpu_instance *inst, int size);
+int wave6_vpu_dec_flush_instance(struct vpu_instance *inst);
+
+int wave6_vpu_enc_open(struct vpu_instance *inst, struct enc_open_param *enc_op_param);
+int wave6_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res);
+int wave6_vpu_enc_issue_seq_init(struct vpu_instance *inst);
+int wave6_vpu_enc_issue_seq_change(struct vpu_instance *inst, bool *changed);
+int wave6_vpu_enc_complete_seq_init(struct vpu_instance *inst, struct enc_seq_info *info);
+int wave6_vpu_enc_get_aux_buffer_size(struct vpu_instance *inst,
+				      struct enc_aux_buffer_size_info info,
+				      uint32_t *size);
+int wave6_vpu_enc_register_aux_buffer(struct vpu_instance *inst, struct aux_buffer_info info);
+int wave6_vpu_enc_register_frame_buffer_ex(struct vpu_instance *inst, int num, unsigned int stride,
+					   int height, enum tiled_map_type map_type);
+int wave6_vpu_enc_start_one_frame(struct vpu_instance *inst, struct enc_param *param,
+				  u32 *fail_res);
+int wave6_vpu_enc_get_output_info(struct vpu_instance *inst, struct enc_output_info *info);
+
+#endif /* __WAVE6_VPUAPI_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
new file mode 100644
index 000000000000..8e815681c924
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - product config definitions
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPUCONFIG_H__
+#define __WAVE6_VPUCONFIG_H__
+
+#define WAVE617_CODE	0x6170
+#define WAVE627_CODE	0x6270
+#define WAVE633_CODE	0x6330
+#define WAVE637_CODE	0x6370
+#define WAVE663_CODE	0x6630
+#define WAVE677_CODE	0x6670
+
+#define PRODUCT_CODE_W_SERIES(x) ({					\
+		int c = x;						\
+		((c) == WAVE617_CODE ||	(c) == WAVE627_CODE ||		\
+		 (c) == WAVE633_CODE || (c) == WAVE637_CODE ||		\
+		 (c) == WAVE663_CODE || (c) == WAVE677_CODE);		\
+})
+
+#define MAX_NUM_INSTANCE		32
+
+#define W6_MAX_PIC_STRIDE		(4096U * 4)
+#define W6_PIC_STRIDE_ALIGNMENT		32
+#define W6_FBC_BUF_ALIGNMENT		32
+#define W6_DEC_BUF_ALIGNMENT		32
+#define W6_DEF_DEC_PIC_WIDTH		720U
+#define W6_DEF_DEC_PIC_HEIGHT		480U
+#define W6_MIN_DEC_PIC_WIDTH		64U
+#define W6_MIN_DEC_PIC_HEIGHT		64U
+#define W6_MAX_DEC_PIC_WIDTH		4096U
+#define W6_MAX_DEC_PIC_HEIGHT		4096U
+#define W6_DEC_PIC_SIZE_STEP		1
+
+#define W6_DEF_ENC_PIC_WIDTH		416U
+#define W6_DEF_ENC_PIC_HEIGHT		240U
+#define W6_MIN_ENC_PIC_WIDTH		256U
+#define W6_MIN_ENC_PIC_HEIGHT		128U
+#define W6_MAX_ENC_PIC_WIDTH		4096U
+#define W6_MAX_ENC_PIC_HEIGHT		4096U
+#define W6_ENC_PIC_SIZE_STEP		8
+#define W6_ENC_CROP_X_POS_STEP		32
+#define W6_ENC_CROP_Y_POS_STEP		2
+#define W6_ENC_CROP_STEP		2
+
+#define W6_VPU_POLL_DELAY_US		10
+#define W6_VPU_POLL_TIMEOUT		300000
+#define W6_BOOT_WAIT_TIMEOUT		10000
+#define W6_VPU_TIMEOUT			6000
+#define W6_VPU_TIMEOUT_CYCLE_COUNT	(8000000 * 4 * 4)
+
+#define HOST_ENDIAN			VDI_128BIT_LITTLE_ENDIAN
+#define VPU_STREAM_ENDIAN		HOST_ENDIAN
+#define VPU_USER_DATA_ENDIAN		HOST_ENDIAN
+#define VPU_SOURCE_ENDIAN		HOST_ENDIAN
+
+#define W6_MAX_REMAP_PAGE_SIZE		(1024 * 1024)
+#define W6_ARBUF_SIZE			(1024)
+#define W6_MAX_CODE_BUF_SIZE		(4 * 1024 * 1024)
+#define W6_CODE_BUF_SIZE		(1 * 1024 * 1024)
+#define W6_EXTRA_CODE_BUF_SIZE		(256 * 1024)
+#define W6_TEMPBUF_SIZE			(3 * 1024 * 1024)
+#define W627ENC_WORKBUF_SIZE		(512 * 1024)
+#define W637DEC_WORKBUF_SIZE		(2 * 512 * 1024)
+#define W637DEC_WORKBUF_SIZE_FOR_CQ	(3 * 512 * 1024)
+
+#endif /* __WAVE6_VPUCONFIG_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuerror.h b/drivers/media/platform/chips-media/wave6/wave6-vpuerror.h
new file mode 100644
index 000000000000..ff80dff2efa9
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuerror.h
@@ -0,0 +1,262 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 vpu error values
+ *
+ * Copyright (C) 2025 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPUERROR_H__
+#define __WAVE6_VPUERROR_H__
+
+/* WAVE6 COMMON SYSTEM ERROR (FAIL_REASON) */
+#define WAVE6_SYSERR_QUEUEING_FAIL			0x00000001
+#define WAVE6_SYSERR_DECODER_FUSE			0x00000002
+#define WAVE6_SYSERR_INSTRUCTION_ACCESS_VIOLATION	0x00000004
+#define WAVE6_SYSERR_PRIVILEDGE_VIOLATION		0x00000008
+#define WAVE6_SYSERR_DATA_ADDR_ALIGNMENT		0x00000010
+#define WAVE6_SYSERR_DATA_ACCESS_VIOLATION		0x00000020
+#define WAVE6_SYSERR_ACCESS_VIOLATION_HW		0x00000040
+#define WAVE6_SYSERR_INSTRUCTION_ADDR_ALIGNMENT		0x00000080
+#define WAVE6_SYSERR_UNKNOWN				0x00000100
+#define WAVE6_SYSERR_BUS_ERROR				0x00000200
+#define WAVE6_SYSERR_DOUBLE_FAULT			0x00000400
+#define WAVE6_SYSERR_RESULT_NOT_READY			0x00000800
+#define WAVE6_SYSERR_VPU_STILL_RUNNING			0x00001000
+#define WAVE6_SYSERR_UNKNOWN_CMD			0x00002000
+#define WAVE6_SYSERR_UNKNOWN_CODEC_STD			0x00004000
+#define WAVE6_SYSERR_UNKNOWN_QUERY_OPTION		0x00008000
+#define WAVE6_SYSERR_WATCHDOG_TIMEOUT			0x00020000
+#define WAVE6_SYSERR_NOT_SUPPORT			0x00100000
+#define WAVE6_SYSERR_TEMP_SEC_BUF_OVERFLOW		0x00200000
+#define WAVE6_SYSERR_NOT_SUPPORT_PROFILE		0x00400000
+#define WAVE6_SYSERR_TIMEOUT_CODEC_FW			0x40000000
+#define WAVE6_SYSERR_FATAL_VPU_HANGUP			0xf0000000
+
+/* WAVE6 COMMAND QUEUE ERROR (FAIL_REASON) */
+#define WAVE6_CMDQ_ERR_NOT_QUEABLE_CMD		0x00000001
+#define WAVE6_CMDQ_ERR_SKIP_MODE_ENABLE		0x00000002
+#define WAVE6_CMDQ_ERR_INST_FLUSHING		0x00000003
+#define WAVE6_CMDQ_ERR_INST_INACTIVE		0x00000004
+#define WAVE6_CMDQ_ERR_QUEUE_FAIL		0x00000005
+#define WAVE6_CMDQ_ERR_CMD_BUF_FULL		0x00000006
+
+/* WAVE6 ERROR ON DECODER (ERR_INFO) */
+#define HEVC_SPSERR_SEQ_PARAMETER_SET_ID				0x00001000
+#define HEVC_SPSERR_CHROMA_FORMAT_IDC					0x00001001
+#define HEVC_SPSERR_PIC_WIDTH_IN_LUMA_SAMPLES				0x00001002
+#define HEVC_SPSERR_PIC_HEIGHT_IN_LUMA_SAMPLES				0x00001003
+#define HEVC_SPSERR_CONF_WIN_LEFT_OFFSET				0x00001004
+#define HEVC_SPSERR_CONF_WIN_RIGHT_OFFSET				0x00001005
+#define HEVC_SPSERR_CONF_WIN_TOP_OFFSET					0x00001006
+#define HEVC_SPSERR_CONF_WIN_BOTTOM_OFFSET				0x00001007
+#define HEVC_SPSERR_BIT_DEPTH_LUMA_MINUS8				0x00001008
+#define HEVC_SPSERR_BIT_DEPTH_CHROMA_MINUS8				0x00001009
+#define HEVC_SPSERR_LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4			0x0000100A
+#define HEVC_SPSERR_SPS_MAX_DEC_PIC_BUFFERING				0x0000100B
+#define HEVC_SPSERR_SPS_MAX_NUM_REORDER_PICS				0x0000100C
+#define HEVC_SPSERR_SPS_MAX_LATENCY_INCREASE				0x0000100D
+#define HEVC_SPSERR_LOG2_MIN_LUMA_CODING_BLOCK_SIZE_MINUS3		0x0000100E
+#define HEVC_SPSERR_LOG2_DIFF_MAX_MIN_LUMA_CODING_BLOCK_SIZE		0x0000100F
+#define HEVC_SPSERR_LOG2_MIN_TRANSFORM_BLOCK_SIZE_MINUS2		0x00001010
+#define HEVC_SPSERR_LOG2_DIFF_MAX_MIN_TRANSFORM_BLOCK_SIZE		0x00001011
+#define HEVC_SPSERR_MAX_TRANSFORM_HIERARCHY_DEPTH_INTER			0x00001012
+#define HEVC_SPSERR_MAX_TRANSFORM_HIERARCHY_DEPTH_INTRA			0x00001013
+#define HEVC_SPSERR_SCALING_LIST					0x00001014
+#define HEVC_SPSERR_LOG2_DIFF_MIN_PCM_LUMA_CODING_BLOCK_SIZE_MINUS3	0x00001015
+#define HEVC_SPSERR_LOG2_DIFF_MAX_MIN_PCM_LUMA_CODING_BLOCK_SIZE	0x00001016
+#define HEVC_SPSERR_NUM_SHORTTERM_REF_PIC_SETS				0x00001017
+#define HEVC_SPSERR_NUM_LONGTERM_REF_PICS_SPS				0x00001018
+#define HEVC_SPSERR_GBU_PARSING_ERROR					0x00001019
+#define HEVC_SPSERR_EXTENSION_FLAG					0x0000101A
+#define HEVC_SPSERR_VUI_ERROR						0x0000101B
+#define HEVC_SPSERR_ACTIVATE_SPS					0x0000101C
+#define HEVC_SPSERR_PROFILE_SPACE					0x0000101D
+#define HEVC_PPSERR_PPS_PIC_PARAMETER_SET_ID				0x00002000
+#define HEVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID				0x00002001
+#define HEVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1		0x00002002
+#define HEVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1		0x00002003
+#define HEVC_PPSERR_INIT_QP_MINUS26					0x00002004
+#define HEVC_PPSERR_DIFF_CU_QP_DELTA_DEPTH				0x00002005
+#define HEVC_PPSERR_PPS_CB_QP_OFFSET					0x00002006
+#define HEVC_PPSERR_PPS_CR_QP_OFFSET					0x00002007
+#define HEVC_PPSERR_NUM_TILE_COLUMNS_MINUS1				0x00002008
+#define HEVC_PPSERR_NUM_TILE_ROWS_MINUS1				0x00002009
+#define HEVC_PPSERR_COLUMN_WIDTH_MINUS1					0x0000200A
+#define HEVC_PPSERR_ROW_HEIGHT_MINUS1					0x0000200B
+#define HEVC_PPSERR_PPS_BETA_OFFSET_DIV2				0x0000200C
+#define HEVC_PPSERR_PPS_TC_OFFSET_DIV2					0x0000200D
+#define HEVC_PPSERR_SCALING_LIST					0x0000200E
+#define HEVC_PPSERR_LOG2_PARALLEL_MERGE_LEVEL_MINUS2			0x0000200F
+#define HEVC_PPSERR_NUM_TILE_COLUMNS_RANGE_OUT				0x00002010
+#define HEVC_PPSERR_NUM_TILE_ROWS_RANGE_OUT				0x00002011
+#define HEVC_PPSERR_MORE_RBSP_DATA_ERROR				0x00002012
+#define HEVC_PPSERR_PPS_PIC_PARAMETER_SET_ID_RANGE_OUT			0x00002013
+#define HEVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID_RANGE_OUT			0x00002014
+#define HEVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1_RANGE_OUT	0x00002015
+#define HEVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1_RANGE_OUT	0x00002016
+#define HEVC_PPSERR_PPS_CB_QP_OFFSET_RANGE_OUT				0x00002017
+#define HEVC_PPSERR_PPS_CR_QP_OFFSET_RANGE_OUT				0x00002018
+#define HEVC_PPSERR_COLUMN_WIDTH_MINUS1_RANGE_OUT			0x00002019
+#define HEVC_PPSERR_ROW_HEIGHT_MINUS1_RANGE_OUT				0x00002020
+#define HEVC_PPSERR_PPS_BETA_OFFSET_DIV2_RANGE_OUT			0x00002021
+#define HEVC_PPSERR_PPS_TC_OFFSET_DIV2_RANGE_OUT			0x00002022
+#define HEVC_SHERR_SLICE_PIC_PARAMETER_SET_ID				0x00003000
+#define HEVC_SHERR_ACTIVATE_PPS						0x00003001
+#define HEVC_SHERR_ACTIVATE_SPS						0x00003002
+#define HEVC_SHERR_SLICE_TYPE						0x00003003
+#define HEVC_SHERR_FIRST_SLICE_IS_DEPENDENT_SLICE			0x00003004
+#define HEVC_SHERR_SHORTTERM_REF_PIC_SET_SPS_FLAG			0x00003005
+#define HEVC_SHERR_SHORTTERM_REF_PIC_SET				0x00003006
+#define HEVC_SHERR_SHORTTERM_REF_PIC_SET_IDX				0x00003007
+#define HEVC_SHERR_NUM_LONGTERM_SPS					0x00003008
+#define HEVC_SHERR_NUM_LONGTERM_PICS					0x00003009
+#define HEVC_SHERR_LT_IDX_SPS_IS_OUT_OF_RANGE				0x0000300A
+#define HEVC_SHERR_DELTA_POC_MSB_CYCLE_LT				0x0000300B
+#define HEVC_SHERR_NUM_REF_IDX_L0_ACTIVE_MINUS1				0x0000300C
+#define HEVC_SHERR_NUM_REF_IDX_L1_ACTIVE_MINUS1				0x0000300D
+#define HEVC_SHERR_COLLOCATED_REF_IDX					0x0000300E
+#define HEVC_SHERR_PRED_WEIGHT_TABLE					0x0000300F
+#define HEVC_SHERR_FIVE_MINUS_MAX_NUM_MERGE_CAND			0x00003010
+#define HEVC_SHERR_SLICE_QP_DELTA					0x00003011
+#define HEVC_SHERR_SLICE_QP_DELTA_IS_OUT_OF_RANGE			0x00003012
+#define HEVC_SHERR_SLICE_CB_QP_OFFSET					0x00003013
+#define HEVC_SHERR_SLICE_CR_QP_OFFSET					0x00003014
+#define HEVC_SHERR_SLICE_BETA_OFFSET_DIV2				0x00003015
+#define HEVC_SHERR_SLICE_TC_OFFSET_DIV2					0x00003016
+#define HEVC_SHERR_NUM_ENTRY_POINT_OFFSETS				0x00003017
+#define HEVC_SHERR_OFFSET_LEN_MINUS1					0x00003018
+#define HEVC_SHERR_SLICE_SEGMENT_HEADER_EXTENSION_LENGTH		0x00003019
+#define HEVC_SHERR_WRONG_POC_IN_STILL_PICTURE_PROFILE			0x0000301A
+#define HEVC_SHERR_SLICE_TYPE_ERROR_IN_STILL_PICTURE_PROFILE		0x0000301B
+#define HEVC_SHERR_PPS_ID_NOT_EQUAL_PREV_VALUE				0x0000301C
+#define HEVC_SPECERR_OVER_PICTURE_WIDTH_SIZE				0x00004000
+#define HEVC_SPECERR_OVER_PICTURE_HEIGHT_SIZE				0x00004001
+#define HEVC_SPECERR_OVER_CHROMA_FORMAT					0x00004002
+#define HEVC_SPECERR_OVER_BIT_DEPTH					0x00004003
+#define HEVC_SPECERR_OVER_BUFFER_OVER_FLOW				0x00004004
+#define HEVC_SPECERR_OVER_WRONG_BUFFER_ACCESS				0x00004005
+#define HEVC_ETCERR_INIT_SEQ_SPS_NOT_FOUND				0x00005000
+#define HEVC_ETCERR_DEC_PIC_VCL_NOT_FOUND				0x00005001
+#define HEVC_ETCERR_NO_VALID_SLICE_IN_AU				0x00005002
+#define HEVC_ETCERR_INPLACE_V						0x0000500F
+
+#define AVC_SPSERR_SEQ_PARAMETER_SET_ID					0x00001000
+#define AVC_SPSERR_CHROMA_FORMAT_IDC					0x00001001
+#define AVC_SPSERR_PIC_WIDTH_IN_LUMA_SAMPLES				0x00001002
+#define AVC_SPSERR_PIC_HEIGHT_IN_LUMA_SAMPLES				0x00001003
+#define AVC_SPSERR_CONF_WIN_LEFT_OFFSET					0x00001004
+#define AVC_SPSERR_CONF_WIN_RIGHT_OFFSET				0x00001005
+#define AVC_SPSERR_CONF_WIN_TOP_OFFSET					0x00001006
+#define AVC_SPSERR_CONF_WIN_BOTTOM_OFFSET				0x00001007
+#define AVC_SPSERR_BIT_DEPTH_LUMA_MINUS8				0x00001008
+#define AVC_SPSERR_BIT_DEPTH_CHROMA_MINUS8				0x00001009
+#define AVC_SPSERR_SPS_MAX_DEC_PIC_BUFFERING				0x0000100B
+#define AVC_SPSERR_SPS_MAX_NUM_REORDER_PICS				0x0000100C
+#define AVC_SPSERR_SCALING_LIST						0x00001014
+#define AVC_SPSERR_GBU_PARSING_ERROR					0x00001019
+#define AVC_SPSERR_VUI_ERROR						0x0000101B
+#define AVC_SPSERR_ACTIVATE_SPS						0x0000101C
+#define AVC_PPSERR_PPS_PIC_PARAMETER_SET_ID				0x00002000
+#define AVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID				0x00002001
+#define AVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1			0x00002002
+#define AVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1			0x00002003
+#define AVC_PPSERR_INIT_QP_MINUS26					0x00002004
+#define AVC_PPSERR_PPS_CB_QP_OFFSET					0x00002006
+#define AVC_PPSERR_PPS_CR_QP_OFFSET					0x00002007
+#define AVC_PPSERR_SCALING_LIST						0x0000200E
+#define AVC_PPSERR_MORE_RBSP_DATA_ERROR					0x00002012
+#define AVC_PPSERR_PPS_PIC_PARAMETER_SET_ID_RANGE_OUT			0x00002013
+#define AVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID_RANGE_OUT			0x00002014
+#define AVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1_RANGE_OUT	0x00002015
+#define AVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1_RANGE_OUT	0x00002016
+#define AVC_PPSERR_PPS_CB_QP_OFFSET_RANGE_OUT				0x00002017
+#define AVC_PPSERR_PPS_CR_QP_OFFSET_RANGE_OUT				0x00002018
+#define AVC_SHERR_SLICE_PIC_PARAMETER_SET_ID				0x00003000
+#define AVC_SHERR_ACTIVATE_PPS						0x00003001
+#define AVC_SHERR_ACTIVATE_SPS						0x00003002
+#define AVC_SHERR_SLICE_TYPE						0x00003003
+#define AVC_SHERR_FIRST_MB_IN_SLICE					0x00003004
+#define AVC_SHERR_RPLM							0x00003006
+#define AVC_SHERR_LT_IDX_SPS_IS_OUT_OF_RANGE				0x0000300A
+#define AVC_SHERR_NUM_REF_IDX_L0_ACTIVE_MINUS1				0x0000300C
+#define AVC_SHERR_NUM_REF_IDX_L1_ACTIVE_MINUS1				0x0000300D
+#define AVC_SHERR_PRED_WEIGHT_TABLE					0x0000300F
+#define AVC_SHERR_SLICE_QP_DELTA					0x00003011
+#define AVC_SHERR_SLICE_BETA_OFFSET_DIV2				0x00003015
+#define AVC_SHERR_SLICE_TC_OFFSET_DIV2					0x00003016
+#define AVC_SHERR_DISABLE_DEBLOCK_FILTER_IDC				0x00003017
+#define AVC_SPECERR_OVER_PICTURE_WIDTH_SIZE				0x00004000
+#define AVC_SPECERR_OVER_PICTURE_HEIGHT_SIZE				0x00004001
+#define AVC_SPECERR_OVER_CHROMA_FORMAT					0x00004002
+#define AVC_SPECERR_OVER_BIT_DEPTH					0x00004003
+#define AVC_SPECERR_OVER_BUFFER_OVER_FLOW				0x00004004
+#define AVC_SPECERR_OVER_WRONG_BUFFER_ACCESS				0x00004005
+#define AVC_ETCERR_INIT_SEQ_SPS_NOT_FOUND				0x00005000
+#define AVC_ETCERR_DEC_PIC_VCL_NOT_FOUND				0x00005001
+#define AVC_ETCERR_NO_VALID_SLICE_IN_AU					0x00005002
+#define AVC_ETCERR_ASO							0x00005004
+#define AVC_ETCERR_FMO							0x00005005
+#define AVC_ETCERR_INPLACE_V						0x0000500F
+
+/* WAVE6 WARNING ON DECODER (WARN_INFO) */
+#define HEVC_SPSWARN_MAX_SUB_LAYERS_MINUS1			0x00000001
+#define HEVC_SPSWARN_GENERAL_RESERVED_ZERO_44BITS		0x00000002
+#define HEVC_SPSWARN_RESERVED_ZERO_2BITS			0x00000004
+#define HEVC_SPSWARN_SUB_LAYER_RESERVED_ZERO_44BITS		0x00000008
+#define HEVC_SPSWARN_GENERAL_LEVEL_IDC				0x00000010
+#define HEVC_SPSWARN_SPS_MAX_DEC_PIC_BUFFERING_VALUE_OVER	0x00000020
+#define HEVC_SPSWARN_RBSP_TRAILING_BITS				0x00000040
+#define HEVC_SPSWARN_ST_RPS_UE_ERROR				0x00000080
+#define HEVC_SPSWARN_EXTENSION_FLAG				0x01000000
+#define HEVC_SPSWARN_REPLACED_WITH_PREV_SPS			0x02000000
+#define HEVC_PPSWARN_RBSP_TRAILING_BITS				0x00000100
+#define HEVC_PPSWARN_REPLACED_WITH_PREV_PPS			0x00000200
+#define HEVC_SHWARN_FIRST_SLICE_SEGMENT_IN_PIC_FLAG		0x00001000
+#define HEVC_SHWARN_NO_OUTPUT_OF_PRIOR_PICS_FLAG		0x00002000
+#define HEVC_SHWARN_PIC_OUTPUT_FLAG				0x00004000
+#define HEVC_SHWARN_DUPLICATED_SLICE_SEGMENT			0x00008000
+#define HEVC_ETCWARN_INIT_SEQ_VCL_NOT_FOUND			0x00010000
+#define HEVC_ETCWARN_MISSING_REFERENCE_PICTURE			0x00020000
+#define HEVC_ETCWARN_WRONG_TEMPORAL_ID				0x00040000
+#define HEVC_ETCWARN_ERROR_PICTURE_IS_REFERENCED		0x00080000
+#define HEVC_SPECWARN_OVER_PROFILE				0x00100000
+#define HEVC_SPECWARN_OVER_LEVEL				0x00200000
+#define HEVC_PRESWARN_PARSING_ERR				0x04000000
+#define HEVC_PRESWARN_MVD_OUT_OF_RANGE				0x08000000
+#define HEVC_PRESWARN_CU_QP_DELTA_VAL_OUT_OF_RANGE		0x09000000
+#define HEVC_PRESWARN_COEFF_LEVEL_REMAINING_OUT_OF_RANGE	0x0A000000
+#define HEVC_PRESWARN_PCM_ERR					0x0B000000
+#define HEVC_PRESWARN_OVERCONSUME				0x0C000000
+#define HEVC_PRESWARN_END_OF_SUBSET_ONE_BIT_ERR			0x10000000
+#define HEVC_PRESWARN_END_OF_SLICE_SEGMENT_FLAG			0x20000000
+
+#define AVC_SPSWARN_RESERVED_ZERO_2BITS				0x00000004
+#define AVC_SPSWARN_GENERAL_LEVEL_IDC				0x00000010
+#define AVC_SPSWARN_RBSP_TRAILING_BITS				0x00000040
+#define AVC_PPSWARN_RBSP_TRAILING_BITS				0x00000100
+#define AVC_SHWARN_NO_OUTPUT_OF_PRIOR_PICS_FLAG			0x00002000
+#define AVC_ETCWARN_INIT_SEQ_VCL_NOT_FOUND			0x00010000
+#define AVC_ETCWARN_MISSING_REFERENCE_PICTURE			0x00020000
+#define AVC_ETCWARN_ERROR_PICTURE_IS_REFERENCED			0x00080000
+#define AVC_SPECWARN_OVER_PROFILE				0x00100000
+#define AVC_SPECWARN_OVER_LEVEL					0x00200000
+#define AVC_PRESWARN_MVD_RANGE_OUT				0x00400000
+#define AVC_PRESWARN_MB_QPD_RANGE_OUT				0x00500000
+#define AVC_PRESWARN_COEFF_RANGE_OUT				0x00600000
+#define AVC_PRESWARN_MV_RANGE_OUT				0x00700000
+#define AVC_PRESWARN_MB_SKIP_RUN_RANGE_OUT			0x00800000
+#define AVC_PRESWARN_MB_TYPE_RANGE_OUT				0x00900000
+#define AVC_PRESWARN_SUB_MB_TYPE_RANGE_OUT			0x00A00000
+#define AVC_PRESWARN_CBP_RANGE_OUT				0x00B00000
+#define AVC_PRESWARN_INTRA_CHROMA_PRED_MODE_RANGE_OUT		0x00C00000
+#define AVC_PRESWARN_REF_IDX_RANGE_OUT				0x00D00000
+#define AVC_PRESWARN_COEFF_TOKEN_RANGE_OUT			0x00E00000
+#define AVC_PRESWARN_TOTAL_ZERO_RANGE_OUT			0x00F00000
+#define AVC_PRESWARN_RUN_BEFORE_RANGE_OUT			0x01000000
+#define AVC_PRESWARN_OVERCONSUME				0x01100000
+#define AVC_PRESWARN_MISSING_SLICE				0x01200000
+
+/* WAVE6 WARNING ON ENCODER (WARN_INFO) */
+#define WAVE6_ETCWARN_FORCED_SPLIT_BY_CU8X8	0x000000001
+
+#endif /* __WAVE6_VPUERROR_H__ */
-- 
2.31.1


