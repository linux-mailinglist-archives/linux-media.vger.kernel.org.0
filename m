Return-Path: <linux-media+bounces-47353-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EAABEC6CF0B
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 07:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 543982E1EA
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 06:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836F83246E6;
	Wed, 19 Nov 2025 06:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="TarcEyFO"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021073.outbound.protection.outlook.com [40.107.42.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181D231ED96;
	Wed, 19 Nov 2025 06:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763533578; cv=fail; b=Vhq+0mfwfJOzDtOcilj5kwt9GFLTl6Gpje8788q/zYkErvf3RnAsl/xDj7ktjqVeMXA96FG2C6KI45m1HFqLfgtELzLDCPijGXW3wPt6hlEO71nq2+ZZitJi2LS8UlOeMKnSVy2snWIk3FQDr+Dp3LVPWuIWkdcgGKbWoL7G76E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763533578; c=relaxed/simple;
	bh=m1eR+8iJVg3Ggt0mz+Cty9ZMFN0Ycyrh7e4nex+muIc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A0O3NE8GYE+iiugx2dK9y0WYpJqWxkxw3EE1h0NZSnO5EQKCmztbmShOWs1qsWkU4oc6ltoSkiHd7en0BT/jPxxYN/Ig1J8wuUBWO1hRgsq/QntlPhtQbiVQbZTtO/JWlgWvCymkSUxX3xxDmo2fGLYQPTRCRNv/6A4JmWT9vyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=TarcEyFO; arc=fail smtp.client-ip=40.107.42.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oy3GZ7UQRfS+mWDNcRmzpMKt+EACOFfaHPahk5+b0CnOYxosPBRsHdjdslQtluXBKwUTFOyNo2zZC5f1u032aUq3sZnPseZKzdSGIIwLzHpBjJi44aU5phXMqWtGoxZBa0tbXowiSMRaTbvRQwWnRkKLu8S67WDvI6/tN68n3y/gmat791gx9R5J1nDX+XtdtblqyAdx+U/j3hP1lbZ+SnA8LyDbA5zakS8e4DW1OJYrf+ee1BJXSvgzH01n/8yLbYwQ1V0zKLnoTjsNKTKQgCMsOVQdr5NACHdWnknzahFiASAuq3GZh0sXL2JmszCIXWH41xuNqWy7ro1zi1wn3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnTi5ZRUO7yvx9rXmLJxhQUEtpm4pMlslFJknOuMPeM=;
 b=w/pV+XqM86OgkicmXpkg2r/KngFEF9BEkzoAEfIPUgZK37exkj6vpFdP/TEXkiOCR+d17iyGdRNjivj/MBo39WyWzeTj6TsNYgXsnAYdFjiajADCgdQ0u790J/nKqxU9CaW71Q6dkRN6+FHMtAakbUmGgyWStERGt++z2usQcCWZUvs/s4QjblirAeWCXUnT+/qn1AwW0hBLO/UL+gV48oubmcejG7gd1iSU+UiaqnYVgq8UWR63oCgpXT6ULt/KK5S+XoFUgOeoralzYXjpQkAKDbU2JgyKur1CLPpApetF/Ux3QUjXj6IdyMU8G/ncwrOlOYwNY2LOg1MN/4Ge1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnTi5ZRUO7yvx9rXmLJxhQUEtpm4pMlslFJknOuMPeM=;
 b=TarcEyFOszvwEAPcX9KAq9ywX6i3paqygYertGkY6oLNuR12zOWC/n59BAX1PFBmRM1vYmGzQHAXbqSyU5slYGhGb3K7fRd6vEkI9DLVU4qUMnkts0KnWdEJXmC4xs2VAZhhwN/u4fNQmReE3F8MGhsiOkARW0jECcBKv/ZiwO0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE1P216MB1996.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 06:26:01 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 06:26:01 +0000
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
Subject: [PATCH v7 4/4] media: chips-media: wave5: Improve performance of decoder
Date: Wed, 19 Nov 2025 15:25:49 +0900
Message-Id: <20251119062549.51-5-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119062549.51-1-jackson.lee@chipsnmedia.com>
References: <20251119062549.51-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0122.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::6) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SE1P216MB1996:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d6f79a4-c2c9-460b-f667-08de27348170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UjFC43g0KAeo6oB6HC+5Oz9GfwwSrLPjF/mFO1d0smrslQtpDjSdoYIqWIyd?=
 =?us-ascii?Q?TGa4mIDGT6AdhCZa6mVl3LQ0ViFr1qQymLYAwO+wQ4Nt0LmviO0pxvrT/c+g?=
 =?us-ascii?Q?1NbryXZ+z2VIGnYDLJDtcF88LFEQq5ZS9wBmXYN49TU6Z3n9Bc+cjM1FNM++?=
 =?us-ascii?Q?HHKt/z0hyr06BdA/Vz1m3GnJKLYWbqPVW8lAL0cJkVek9+dLfl/lCAiqOsro?=
 =?us-ascii?Q?l2TLlB1BTaRxoRZDKMaJuhP2d4ox1r4Fi15g3zFpdVoEVjX+GbgznKkqvzEA?=
 =?us-ascii?Q?ZC4lvrTQ6wPn6OaH6cmoqXIjJScKar+HqnZ7KKripg4goweqJY+XJoIV9sMC?=
 =?us-ascii?Q?+eVAoqBgy26sU4kNCHuhg5XhSNM9/uh04r6CsFhISKaDdyyzf7dMLouNUi3t?=
 =?us-ascii?Q?A6mOTDKlwdxSOafCf0EVYx0f9QpnF04bX5Iz66+ySZvydNQyql8yvlvNdBxy?=
 =?us-ascii?Q?eezv6cE8u2slysKc/6MHXavDBoqsJkYxrBcer67mPLJ4g31SN5cx+eMwBJ7G?=
 =?us-ascii?Q?UqC3kCIlKuxkVjvOqGBwEilKgoMzwceJgL1Oq5DtjJQPJkyCDd4MgWmClpSP?=
 =?us-ascii?Q?OaKe/bhuUT5QFEdMfXuGySj4mJlxQkl2vOb0xKDonzp5SnGz8hQTlL+Tl5hn?=
 =?us-ascii?Q?D0cmgzZKKw5V1QqwRf5wW6BTaN5MhoD6ywdo13BeugSxG42MBeskyFJ7k0Fd?=
 =?us-ascii?Q?nr9FeSeI7387ErI+dPYG0LUvWP9dve30/gOXOT4YVxqbHQJG3jDvWxqPJwwt?=
 =?us-ascii?Q?brp0QOk0AG5K/ONfAgwrW3UzMEckTjTrZBjQrMljolKlah/Xmbq3AQaP06Yw?=
 =?us-ascii?Q?anxcZrSoPzBgphsUk+DwwA2XZSoMcwlNed6ZvdxTIsWQWrsItIMslL/EkPda?=
 =?us-ascii?Q?q9zq71EeeaehbubNe7n6+PMubYpdbdMAj1l/jBcHf0dsa8TZdOykzinbeNy3?=
 =?us-ascii?Q?h8XwgLtOOfCQnMGVzD1W9TT6CW+pf1TAk5EBIj+zDn+o8FxPcgzlBePEjh+T?=
 =?us-ascii?Q?iqE73T+cuhLpx47UK6s9cM4Rr7Vpjws6ESvS2LWaFifwZL7ueV2I3qF9fsUG?=
 =?us-ascii?Q?BuQ2S07/Zeh7j/xnlyZnl4g3NagL0oV14EkHKTQjtsdRI5c5CQTzpmJRNMTi?=
 =?us-ascii?Q?78A0wPb+CBKQzRjpMTBXYsvsuza0DQm3RGqQD9670yFOD1VdEskHhT8dfpgb?=
 =?us-ascii?Q?hZNvRsEkyIyyv8U2t7ggEs79ln3WcO2OWL2wrc7WrIqmUYWivpM77HzkIRea?=
 =?us-ascii?Q?2iZhebxkjmYw2Ae7Z0NMgqAwwY5cCqSWHehDTSITmopSg8kWyOK+urfljoGC?=
 =?us-ascii?Q?jSt5L0LGtBOfIKLvmLd5IP+2TO/Z0YYnZQB+C8QtPCdkBFf0QwaaxQ8ST1CU?=
 =?us-ascii?Q?B09YWhyJGfv65LmmKEADK/LKTzZYBqL9PYC9dEpJL385lNt337YlsXqjGaW5?=
 =?us-ascii?Q?gXgCZFI5ynfE/QgqXet0Zet+pvZga4sqFNpgUe0GAxhVJ2ARX1I6hyoqjc8c?=
 =?us-ascii?Q?yE5A+dslB8GfzIWDr5oZuZ9cnDmkKmRmEWTl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DsalD5Fb6dMBbxsPga2TwxfZ8LN7P7GOESRYnayUgg/W7D6HEdxCWyeK2Kxe?=
 =?us-ascii?Q?zKA9eij4tvUBjNB3odL2MjFl15G9Kz1OFNOCEwt+pxKtZsJ/XAZBiV/NoFrK?=
 =?us-ascii?Q?X9kyyvFeNn8QAY6y65rb7MPNebHwahU8GJYzqds1av1Sb77XPBKBkXaznaij?=
 =?us-ascii?Q?wzPmDYbXDwpQCrH5bC2Fra7fEsg4TsiTpHBcXokosz71Xwuber4qoRf5ZMVK?=
 =?us-ascii?Q?uaPZLicgRPEMQr2P6nf9VgnO7Bgoo5ekugbf5Rj+JeTOCno+Bplee6MFOHMt?=
 =?us-ascii?Q?e4DUqwGyt6MuFvvtYbrOs5LJU5ZNlEGthxzKEZ+GmMP9ZVBgaRv/WjKjmdRv?=
 =?us-ascii?Q?KttSmV9cFvyBHBNNaZAkZ2Farjs5rIjcqVkhom2AZoyV5MIVtUItmGi54ONG?=
 =?us-ascii?Q?qfSqzLBi4GDZ9cvH2X0Yo79jfPqv1XuD50HzoBTC+WbNYN2jbMR6xM3mH0s+?=
 =?us-ascii?Q?0qadfsTcssqt1bQrTmUJEEfr03PLFUF/heJf7f4vgbwjI45b1sdRdSNOrIwg?=
 =?us-ascii?Q?oUaQJjM/gtoqxQPZIcKhQh4xZuO8Rqu1iRlF5Nrg4GXlJh5sFvdHnHS6xSsU?=
 =?us-ascii?Q?V88WbdsJHOcIn5uV0lxcqaDu3H1yJZqJMhbSAxiR/bc0ZCQMUDBdkk21tQTz?=
 =?us-ascii?Q?dCGnHwfQyTky5S+tj+otK/tpKwwCeRgNjfJbF4ydhWwIDW6qxAkrJvorspV5?=
 =?us-ascii?Q?vrK9KXMvq8fHpEPe0hHl/gryt7hzoT92Gekj0b2jW2uDYAr6/A9qDeDdYvzN?=
 =?us-ascii?Q?7zlHl0N6r7zYqB2Z7ry4DnvgOnFE7IGv90EBhXBt3EY/IgP7CjSDgb255Uig?=
 =?us-ascii?Q?/s3FDMVkAnI6+srfrnhjkKbkV0fvHE3vj6rILpuBLGj84TtfTbj7F6hxNdIk?=
 =?us-ascii?Q?0ZP/sRXGJvXhyrTiDNE8/lq6fHfKeQhcwf9EQQ5D6DKBJvlNtaGvKiNyGrv1?=
 =?us-ascii?Q?if5t37uUfMKnDGUchdl3BR/NB7shvnSZVAOy1nlqHahoFcNq6KyffiLrRcZi?=
 =?us-ascii?Q?YDjyEy7KC8B0JtTQrP8qHMLNlgJt7trvZ2vojWpZuGodVoSeArYI6EsxGHyy?=
 =?us-ascii?Q?/aV5WreB+6Yj2IIx904ZDpuAd33xKQpLywFikwRK/isXsG8kri11T1h+rZV6?=
 =?us-ascii?Q?U7BlrXHxFyte5PPvPqFxTwqkySHOR9UF9epSMC5tTxpzMfA80mwtWFGs6Dt4?=
 =?us-ascii?Q?05IrzW7icKCHVPgAVpk4jehfhqGYxQuUw9ZfL39fjiQoy8EMZ/DhDnpMSrDC?=
 =?us-ascii?Q?G8SNCncCJEKgTWEiPmwbgl6qOEnbNr6o3oKz4iTd/fFfj29IwqbtPw6A14sR?=
 =?us-ascii?Q?SUZL4HRnsRIKsLTFSrn+4QAoU/QTlT8WXPi2slg7wokGaSflolM+P5C5sy5U?=
 =?us-ascii?Q?aWVQJ5FR09I0VKf4VBLCG1wHYYt1ZZLvC4U+nmnVLNaFlcl4Ul4eN2qrKKfH?=
 =?us-ascii?Q?MfXnXYX06betPsjBSg2lNJIgAegGhfg+kuT4K7Mv/dk/7hD8AXRUzmza2kh6?=
 =?us-ascii?Q?G9Dto6roOqIp+zH5qIJ215oAlkU9Qprm9dxKkPbgNUsy1uMxaudJOypIxCEF?=
 =?us-ascii?Q?ntt946DceDR0P5KxxcqmxTdooqVvK0PfvULDDc/uQRaNqtX9MSsi71H1mQe1?=
 =?us-ascii?Q?dA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d6f79a4-c2c9-460b-f667-08de27348170
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 06:25:59.8083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgwwweU0ZsDuL5OwmP0PKPiDMIF7LxW+1SwKp/Mq3IKSPNzXeraMOlsoQPdCoOo668RVLLY15CRA4dzWMgLIZ3mpI9MYddTWO1Rg5EZXlrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1996

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The current decoding method  was to wait until each frame was
decoded after feeding a bitstream. As a result, performance was low
and Wave5 could not achieve max pixel processing rate.

Update driver to use an asynchronous approach for decoding and feeding a
bitstream in order to achieve full capabilities of the device.

WAVE5 supports command-queueing to maximize performance by pipelining
internal commands and by hiding wait cycle taken to receive a command
from Host processor.

Instead of waiting for each command to be executed before sending the
next command, Host processor just places all the commands in the
command-queue and goes on doing other things while the commands in the
queue are processed by VPU.

While Host processor handles its own tasks, it can receive VPU interrupt
request (IRQ).
In this case, host processor can simply exit interrupt service routine
(ISR) without accessing to host interface to read the result of the
command reported by VPU.
After host processor completed its tasks, host processor can read the
command result when host processor needs the reports and does
response processing.

To achieve this goal, the device_run() calls v4l2_m2m_job_finish
so that next command can be sent to VPU continuously, if there is
any result, then irq is triggered and gets decoded frames and returns
them to upper layer.
Theses processes work independently each other without waiting
a decoded frame.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../platform/chips-media/wave5/wave5-hw.c     |   2 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 180 +++++++++++++-----
 .../platform/chips-media/wave5/wave5-vpu.h    |   2 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  53 ++++--
 .../platform/chips-media/wave5/wave5-vpuapi.h |   6 +
 .../chips-media/wave5/wave5-vpuconfig.h       |   1 +
 6 files changed, 178 insertions(+), 66 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index d94cf84c3ee5..687ce6ccf3ae 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -102,7 +102,7 @@ static void _wave5_print_reg_err(struct vpu_device *vpu_dev, u32 reg_fail_reason
 		dev_dbg(dev, "%s: queueing failure: 0x%x\n", func, reg_val);
 		break;
 	case WAVE5_SYSERR_RESULT_NOT_READY:
-		dev_err(dev, "%s: result not ready: 0x%x\n", func, reg_fail_reason);
+		dev_dbg(dev, "%s: result not ready: 0x%x\n", func, reg_fail_reason);
 		break;
 	case WAVE5_SYSERR_ACCESS_VIOLATION_HW:
 		dev_err(dev, "%s: access violation: 0x%x\n", func, reg_fail_reason);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index b10396fa2379..e75770912e21 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -136,6 +136,18 @@ static int switch_state(struct vpu_instance *inst, enum vpu_instance_state state
 	return 0;
 }
 
+static int set_instance_state(struct vpu_instance *inst, enum vpu_instance_state state)
+{
+	unsigned long flags;
+	int ret;
+
+	spin_lock_irqsave(&inst->state_spinlock, flags);
+	ret = switch_state(inst, state);
+	spin_unlock_irqrestore(&inst->state_spinlock, flags);
+
+	return ret;
+}
+
 static int wave5_vpu_dec_set_eos_on_firmware(struct vpu_instance *inst)
 {
 	int ret;
@@ -227,7 +239,7 @@ static int start_decode(struct vpu_instance *inst, u32 *fail_res)
 		src_buf = v4l2_m2m_src_buf_remove(m2m_ctx);
 		if (src_buf)
 			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
-		switch_state(inst, VPU_INST_STATE_STOP);
+		set_instance_state(inst, VPU_INST_STATE_STOP);
 
 		dev_dbg(inst->dev->dev, "%s: pic run failed / finish job", __func__);
 		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
@@ -268,6 +280,7 @@ static void send_eos_event(struct vpu_instance *inst)
 
 	v4l2_event_queue_fh(&inst->v4l2_fh, &vpu_event_eos);
 	inst->eos = false;
+	inst->sent_eos = true;
 }
 
 static int handle_dynamic_resolution_change(struct vpu_instance *inst)
@@ -347,13 +360,12 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 	struct vb2_v4l2_buffer *dec_buf = NULL;
 	struct vb2_v4l2_buffer *disp_buf = NULL;
 	struct vb2_queue *dst_vq = v4l2_m2m_get_dst_vq(m2m_ctx);
-	struct queue_status_info q_status;
 
 	dev_dbg(inst->dev->dev, "%s: Fetch output info from firmware.", __func__);
 
 	ret = wave5_vpu_dec_get_output_info(inst, &dec_info);
 	if (ret) {
-		dev_warn(inst->dev->dev, "%s: could not get output info.", __func__);
+		dev_dbg(inst->dev->dev, "%s: could not get output info.", __func__);
 		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 		return;
 	}
@@ -442,18 +454,17 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 		spin_unlock_irqrestore(&inst->state_spinlock, flags);
 	}
 
-	/*
-	 * During a resolution change and while draining, the firmware may flush
-	 * the reorder queue regardless of having a matching decoding operation
-	 * pending. Only terminate the job if there are no more IRQ coming.
-	 */
-	wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
-	if (q_status.report_queue_count == 0 &&
-	    (q_status.instance_queue_count == 0 || dec_info.sequence_changed)) {
-		dev_dbg(inst->dev->dev, "%s: finishing job.\n", __func__);
-		pm_runtime_put_autosuspend(inst->dev->dev);
-		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
+	if (inst->sent_eos &&
+	    v4l2_m2m_get_curr_priv(inst->v4l2_m2m_dev)) {
+		struct queue_status_info q_status;
+
+		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
+		if (q_status.report_queue_count == 0 &&
+		    q_status.instance_queue_count == 0)
+			v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 	}
+
+	inst->queuing_fail = false;
 }
 
 static int wave5_vpu_dec_querycap(struct file *file, void *fh, struct v4l2_capability *cap)
@@ -1142,11 +1153,30 @@ static int write_to_ringbuffer(struct vpu_instance *inst, void *buffer, size_t b
 	return 0;
 }
 
+static struct vpu_src_buffer *inst_src_buf_remove(struct vpu_instance *inst)
+{
+	struct vpu_src_buffer *b;
+	int ret;
+
+	ret = mutex_lock_interruptible(&inst->feed_lock);
+	if (ret)
+		return NULL;
+
+	if (list_empty(&inst->avail_src_bufs)) {
+		mutex_unlock(&inst->feed_lock);
+		return NULL;
+	}
+	b = list_first_entry(&inst->avail_src_bufs, struct vpu_src_buffer, list);
+	list_del_init(&b->list);
+	mutex_unlock(&inst->feed_lock);
+	return b;
+}
+
 static int fill_ringbuffer(struct vpu_instance *inst)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
-	struct v4l2_m2m_buffer *buf, *n;
-	int ret;
+	struct vpu_src_buffer *vpu_buf;
+	int ret = 0;
 
 	if (m2m_ctx->last_src_buf)  {
 		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(m2m_ctx->last_src_buf);
@@ -1157,9 +1187,8 @@ static int fill_ringbuffer(struct vpu_instance *inst)
 		}
 	}
 
-	v4l2_m2m_for_each_src_buf_safe(m2m_ctx, buf, n) {
-		struct vb2_v4l2_buffer *vbuf = &buf->vb;
-		struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(vbuf);
+	while ((vpu_buf = inst_src_buf_remove(inst)) != NULL) {
+		struct vb2_v4l2_buffer *vbuf = &vpu_buf->v4l2_m2m_buf.vb;
 		struct vpu_buf *ring_buffer = &inst->bitstream_vbuf;
 		size_t src_size = vb2_get_plane_payload(&vbuf->vb2_buf, 0);
 		void *src_buf = vb2_plane_vaddr(&vbuf->vb2_buf, 0);
@@ -1219,9 +1248,12 @@ static int fill_ringbuffer(struct vpu_instance *inst)
 			dev_dbg(inst->dev->dev, "last src buffer written to the ring buffer\n");
 			break;
 		}
+
+		inst->queuing_num++;
+		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
@@ -1230,10 +1262,16 @@ static void wave5_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct vpu_src_buffer *vpu_buf = wave5_to_vpu_src_buf(vbuf);
+	int ret;
 
 	vpu_buf->consumed = false;
 	vbuf->sequence = inst->queued_src_buf_num++;
-
+	ret = mutex_lock_interruptible(&inst->feed_lock);
+	if (ret)
+		return;
+	INIT_LIST_HEAD(&vpu_buf->list);
+	list_add_tail(&vpu_buf->list, &inst->avail_src_bufs);
+	mutex_unlock(&inst->feed_lock);
 	v4l2_m2m_buf_queue(m2m_ctx, vbuf);
 }
 
@@ -1288,10 +1326,13 @@ static void wave5_vpu_dec_buf_queue(struct vb2_buffer *vb)
 		__func__, vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
 		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
 
-	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
 		wave5_vpu_dec_buf_queue_src(vb);
-	else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		if (inst->empty_queue)
+			inst->empty_queue = false;
+	} else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		wave5_vpu_dec_buf_queue_dst(vb);
+	}
 }
 
 static int wave5_vpu_dec_allocate_ring_buffer(struct vpu_instance *inst)
@@ -1385,6 +1426,12 @@ static int streamoff_output(struct vb2_queue *q)
 	dma_addr_t new_rd_ptr;
 	struct dec_output_info dec_info;
 	unsigned int i;
+	struct vpu_src_buffer *vpu_buf;
+
+	inst->retry = false;
+	inst->queuing_num = 0;
+	while ((vpu_buf = inst_src_buf_remove(inst)) != NULL)
+		;
 
 	for (i = 0; i < v4l2_m2m_num_dst_bufs_ready(m2m_ctx); i++) {
 		ret = wave5_vpu_dec_set_disp_flag(inst, i);
@@ -1470,21 +1517,21 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 {
 	struct vpu_instance *inst = vb2_get_drv_priv(q);
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+
 	bool check_cmd = TRUE;
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
 	pm_runtime_resume_and_get(inst->dev->dev);
-
+	inst->empty_queue = true;
 	while (check_cmd) {
 		struct queue_status_info q_status;
 		struct dec_output_info dec_output_info;
 
 		wave5_vpu_dec_give_command(inst, DEC_GET_QUEUE_STATUS, &q_status);
-
-		if (q_status.report_queue_count == 0)
-			break;
-
-		if (wave5_vpu_wait_interrupt(inst, VPU_DEC_TIMEOUT) < 0)
+		if ((inst->state == VPU_INST_STATE_STOP ||
+		     inst->state == VPU_INST_STATE_INIT_SEQ ||
+		     q_status.instance_queue_count == 0) &&
+			q_status.report_queue_count == 0)
 			break;
 
 		if (wave5_vpu_dec_get_output_info(inst, &dec_output_info))
@@ -1498,6 +1545,8 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 	else
 		streamoff_capture(q);
 
+	inst->empty_queue = false;
+	inst->sent_eos = false;
 	pm_runtime_put_autosuspend(inst->dev->dev);
 }
 
@@ -1579,10 +1628,18 @@ static void wave5_vpu_dec_device_run(void *priv)
 
 	dev_dbg(inst->dev->dev, "%s: Fill the ring buffer with new bitstream data", __func__);
 	pm_runtime_resume_and_get(inst->dev->dev);
-	ret = fill_ringbuffer(inst);
-	if (ret) {
-		dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
-		goto finish_job_and_return;
+	if (!inst->retry) {
+		ret = fill_ringbuffer(inst);
+		if (ret < 0) {
+			dev_warn(inst->dev->dev, "Filling ring buffer failed\n");
+			goto finish_job_and_return;
+		} else if (!inst->eos &&
+				inst->queuing_num == 0 &&
+				inst->state == VPU_INST_STATE_PIC_RUN) {
+			dev_dbg(inst->dev->dev, "%s: no bitstream for feeding, so skip ", __func__);
+			inst->empty_queue = true;
+			goto finish_job_and_return;
+		}
 	}
 
 	switch (inst->state) {
@@ -1607,7 +1664,7 @@ static void wave5_vpu_dec_device_run(void *priv)
 			}
 			spin_unlock_irqrestore(&inst->state_spinlock, flags);
 		} else {
-			switch_state(inst, VPU_INST_STATE_INIT_SEQ);
+			set_instance_state(inst, VPU_INST_STATE_INIT_SEQ);
 		}
 
 		break;
@@ -1618,8 +1675,7 @@ static void wave5_vpu_dec_device_run(void *priv)
 		 * we had a chance to switch, which leads to an invalid state
 		 * change.
 		 */
-		switch_state(inst, VPU_INST_STATE_PIC_RUN);
-
+		set_instance_state(inst, VPU_INST_STATE_PIC_RUN);
 		/*
 		 * During DRC, the picture decoding remains pending, so just leave the job
 		 * active until this decode operation completes.
@@ -1633,14 +1689,12 @@ static void wave5_vpu_dec_device_run(void *priv)
 		ret = wave5_prepare_fb(inst);
 		if (ret) {
 			dev_warn(inst->dev->dev, "Framebuffer preparation, fail: %d\n", ret);
-			switch_state(inst, VPU_INST_STATE_STOP);
+			set_instance_state(inst, VPU_INST_STATE_STOP);
 			break;
 		}
 
-		if (q_status.instance_queue_count) {
-			dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
-			return;
-		}
+		if (q_status.instance_queue_count)
+			goto finish_job_and_return;
 
 		fallthrough;
 	case VPU_INST_STATE_PIC_RUN:
@@ -1649,28 +1703,45 @@ static void wave5_vpu_dec_device_run(void *priv)
 			dev_err(inst->dev->dev,
 				"Frame decoding on m2m context (%p), fail: %d (result: %d)\n",
 				m2m_ctx, ret, fail_res);
-			break;
+			goto finish_job_and_return;
+		}
+
+		if (fail_res == WAVE5_SYSERR_QUEUEING_FAIL) {
+			inst->retry = true;
+			inst->queuing_fail = true;
+		} else {
+			inst->retry = false;
+			if (!inst->eos)
+				inst->queuing_num--;
 		}
-		/* Return so that we leave this job active */
-		dev_dbg(inst->dev->dev, "%s: leave with active job", __func__);
-		return;
-	default:
-		WARN(1, "Execution of a job in state %s illegal.\n", state_to_str(inst->state));
 		break;
+	default:
+		dev_dbg(inst->dev->dev, "Execution of a job in state %s illegal.\n",
+			state_to_str(inst->state));
 	}
 
 finish_job_and_return:
 	dev_dbg(inst->dev->dev, "%s: leave and finish job", __func__);
 	pm_runtime_put_autosuspend(inst->dev->dev);
-	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
+	/*
+	 * After receiving CMD_STOP, there is no input, but we have to run device_run
+	 * to send DEC_PIC command until display index == -1, so job_finish was always
+	 * called in the device_run to archive it, the logic was very wasteful
+	 * in power and CPU time.
+	 * If EOS is passed, device_run will not call job_finish no more, it is called
+	 * only if HW is idle status in order to reduce overhead.
+	 */
+	if (!inst->sent_eos)
+		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 }
 
 static void wave5_vpu_dec_job_abort(void *priv)
 {
 	struct vpu_instance *inst = priv;
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
 	int ret;
 
-	ret = switch_state(inst, VPU_INST_STATE_STOP);
+	ret = set_instance_state(inst, VPU_INST_STATE_STOP);
 	if (ret)
 		return;
 
@@ -1678,6 +1749,8 @@ static void wave5_vpu_dec_job_abort(void *priv)
 	if (ret)
 		dev_warn(inst->dev->dev,
 			 "Setting EOS for the bitstream, fail: %d\n", ret);
+
+	v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
 }
 
 static int wave5_vpu_dec_job_ready(void *priv)
@@ -1713,10 +1786,15 @@ static int wave5_vpu_dec_job_ready(void *priv)
 				"No capture buffer ready to decode!\n");
 			break;
 		} else if (!wave5_is_draining_or_eos(inst) &&
-			   !v4l2_m2m_num_src_bufs_ready(m2m_ctx)) {
+			   (!v4l2_m2m_num_src_bufs_ready(m2m_ctx) ||
+			    inst->empty_queue)) {
 			dev_dbg(inst->dev->dev,
 				"No bitstream data to decode!\n");
 			break;
+		} else if (inst->state == VPU_INST_STATE_PIC_RUN &&
+			   !wave5_is_draining_or_eos(inst) &&
+			   inst->queuing_fail) {
+			break;
 		}
 		ret = 1;
 		break;
@@ -1753,6 +1831,8 @@ static int wave5_vpu_open_dec(struct file *filp)
 	inst->ops = &wave5_vpu_dec_inst_ops;
 
 	spin_lock_init(&inst->state_spinlock);
+	mutex_init(&inst->feed_lock);
+	INIT_LIST_HEAD(&inst->avail_src_bufs);
 
 	inst->codec_info = kzalloc(sizeof(*inst->codec_info), GFP_KERNEL);
 	if (!inst->codec_info)
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.h b/drivers/media/platform/chips-media/wave5/wave5-vpu.h
index 5943bdaa9c4c..99c3be882192 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.h
@@ -22,8 +22,8 @@
 
 struct vpu_src_buffer {
 	struct v4l2_m2m_buffer	v4l2_m2m_buf;
-	struct list_head	list;
 	bool			consumed;
+	struct list_head	list;
 };
 
 struct vpu_dst_buffer {
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index 5b10f9f49b9f..d26ffc942219 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -52,11 +52,12 @@ int wave5_vpu_init_with_bitcode(struct device *dev, u8 *bitcode, size_t size)
 int wave5_vpu_flush_instance(struct vpu_instance *inst)
 {
 	int ret = 0;
+	int mutex_ret = 0;
 	int retry = 0;
 
-	ret = mutex_lock_interruptible(&inst->dev->hw_lock);
-	if (ret)
-		return ret;
+	mutex_ret = mutex_lock_interruptible(&inst->dev->hw_lock);
+	if (mutex_ret)
+		return mutex_ret;
 	do {
 		/*
 		 * Repeat the FLUSH command until the firmware reports that the
@@ -80,11 +81,16 @@ int wave5_vpu_flush_instance(struct vpu_instance *inst)
 
 			mutex_unlock(&inst->dev->hw_lock);
 			wave5_vpu_dec_get_output_info(inst, &dec_info);
-			ret = mutex_lock_interruptible(&inst->dev->hw_lock);
-			if (ret)
-				return ret;
-			if (dec_info.index_frame_display > 0)
+			mutex_ret = mutex_lock_interruptible(&inst->dev->hw_lock);
+			if (mutex_ret)
+				return mutex_ret;
+			if (dec_info.index_frame_display >= 0) {
+				mutex_unlock(&inst->dev->hw_lock);
 				wave5_vpu_dec_set_disp_flag(inst, dec_info.index_frame_display);
+				mutex_ret = mutex_lock_interruptible(&inst->dev->hw_lock);
+				if (mutex_ret)
+					return mutex_ret;
+			}
 		}
 	} while (ret != 0);
 	mutex_unlock(&inst->dev->hw_lock);
@@ -207,6 +213,8 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
 	int i;
+	struct dec_output_info dec_info;
+	int ret_mutex;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -214,10 +222,10 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 
 	pm_runtime_resume_and_get(inst->dev->dev);
 
-	ret = mutex_lock_interruptible(&vpu_dev->hw_lock);
-	if (ret) {
+	ret_mutex = mutex_lock_interruptible(&vpu_dev->hw_lock);
+	if (ret_mutex) {
 		pm_runtime_put_sync(inst->dev->dev);
-		return ret;
+		return ret_mutex;
 	}
 
 	do {
@@ -227,11 +235,26 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 			goto unlock_and_return;
 		}
 
-		if (*fail_res == WAVE5_SYSERR_VPU_STILL_RUNNING &&
-		    retry++ >= MAX_FIRMWARE_CALL_RETRY) {
+		if (ret == 0)
+			break;
+
+		if (*fail_res != WAVE5_SYSERR_VPU_STILL_RUNNING) {
+			dev_warn(inst->dev->dev, "dec_finish_seq timed out\n");
+			goto unlock_and_return;
+		}
+
+		if (retry++ >= MAX_FIRMWARE_CALL_RETRY) {
 			ret = -ETIMEDOUT;
 			goto unlock_and_return;
 		}
+
+		mutex_unlock(&vpu_dev->hw_lock);
+		wave5_vpu_dec_get_output_info(inst, &dec_info);
+		ret_mutex = mutex_lock_interruptible(&vpu_dev->hw_lock);
+		if (ret_mutex) {
+			pm_runtime_put_sync(inst->dev->dev);
+			return ret_mutex;
+		}
 	} while (ret != 0);
 
 	dev_dbg(inst->dev->dev, "%s: dec_finish_seq complete\n", __func__);
@@ -248,6 +271,8 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
 
+	mutex_destroy(&inst->feed_lock);
+
 unlock_and_return:
 	mutex_unlock(&vpu_dev->hw_lock);
 	pm_runtime_put_sync(inst->dev->dev);
@@ -460,11 +485,11 @@ int wave5_vpu_dec_set_rd_ptr(struct vpu_instance *inst, dma_addr_t addr, int upd
 dma_addr_t wave5_vpu_dec_get_rd_ptr(struct vpu_instance *inst)
 {
 	int ret;
-	dma_addr_t rd_ptr;
+	dma_addr_t rd_ptr = 0;
 
 	ret = mutex_lock_interruptible(&inst->dev->hw_lock);
 	if (ret)
-		return ret;
+		return rd_ptr;
 
 	rd_ptr = wave5_dec_get_rd_ptr(inst);
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index bc101397204d..c64135769869 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -818,6 +818,12 @@ struct vpu_instance {
 	bool cbcr_interleave;
 	bool nv21;
 	bool eos;
+	bool sent_eos; /* check if EOS is sent to application */
+	bool retry; /* retry to feed bitstream if failure reason is WAVE5_SYSERR_QUEUEING_FAIL*/
+	int queuing_num; /* count of bitstream queued */
+	struct mutex feed_lock; /* lock for feeding bitstream buffers */
+	bool queuing_fail; /* if there is the queuing failure */
+	bool empty_queue;
 	struct vpu_buf bitstream_vbuf;
 	dma_addr_t last_rd_ptr;
 	size_t remaining_consumed_bytes;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
index 1ea9f5f31499..4ebd48d5550e 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
@@ -59,6 +59,7 @@
 //  application specific configuration
 #define VPU_ENC_TIMEOUT                 60000
 #define VPU_DEC_TIMEOUT                 60000
+#define VPU_DEC_STOP_TIMEOUT            10
 
 // for WAVE encoder
 #define USE_SRC_PRP_AXI         0
-- 
2.43.0


