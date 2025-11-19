Return-Path: <linux-media+bounces-47349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E91C6CEA1
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 07:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 471EF4EDFC7
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 06:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7B031B833;
	Wed, 19 Nov 2025 06:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="HJGf8eqj"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021073.outbound.protection.outlook.com [40.107.42.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734B6314D21;
	Wed, 19 Nov 2025 06:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763533567; cv=fail; b=dE89EKzegwYwahESmw76FO9UJeDXebV00ES827n+g1taV4CtJLq2xiGyHxgtIdBehe+WK+JA631WxB3tORDAM8MvtBllgxWEY8HB+if3j482Mq97Y2bCD2NgYwZlM4p+xw3M3EVGz+9BdqNssW+nUpwwujjf/8r/BccSRCM9vuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763533567; c=relaxed/simple;
	bh=qHE64HhoqMBKETyIEExrW52/09lLsRdCKTvJtCU4t68=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k+yK7wbA1hrkVQCh1apgvi+bBQy5/GWBQQzSPmoi1NCtkNStNOZW19kTXbyup93D86OIvxaqwwJCBmhIR91OimNB2hM+BTy6QX6ZRzLFhxfZmhGLrJzKBJ1CtpZdaQe8LWiUfs7VaJJKwW3qJX3UF2Sg1OA3t55qhmDn1wq/zEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=HJGf8eqj; arc=fail smtp.client-ip=40.107.42.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxdbAI0tm4gZdE6NlVYHr102FqAvGSbzjap6fS3NsBO5M3/0w+umMJG+b3tpVtBdhEWI/Vm15zKDR+HsjCuGjvF6Q7NVcR2pETlW7M2MmFh+ndFun1f7IH/BOdtl+TkVecX1jmRdVS65h1eSQMqXxq4DFp5av8Onm4BiuxuZWlGIEDyLgrTmXnT6THL3J1ybCRJFLFS1UQU2356smF4jD523VmDg/twO3OoYcnz9X3fIVs+vnIPUKAVHznvlm/tuu/0GfMuk58p7nLeSMMlUYfV0rsRPF0f/BID2LQZIO/Gu5vHkSbAJRWvGvo5I/i0AlbG9auPm1CuBWIdmgmYWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dclpbtmveS5RBWbIF/Jmzebb5NCPUCOT7PWk6F4LbKQ=;
 b=gg/z3DeWaMDYK7xmjmbJ/gNJRFjGjj+viRa2qdo7OhrGg7aJ/U1ucNRm4qm/LaxsO89MVgcW/6Q1mmVJhhrV1nFQgVEeYUOY0uZWxFy3U5cIR0unQk9sknUhX5o8u2h94Sn6cKOp3o9PvxkY8T3SGiaBQM1pE9J1v/iTP3akWX7Uq+B1rB3sT+XuSDLwNUM/BQ34MP/8a1NAUb1kPgGFvS5ChFv0gu6Jm2XF6IP+B5gA853x90W/X/gL+9bTZ2iO6BmowpR1b+7dXewRfjR7PCIWD5u/ipF0KrprzstCANwyqMMG+BFzAnsDjI4eMyw8yf/KVyXMuHh1jRRdJNxGxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dclpbtmveS5RBWbIF/Jmzebb5NCPUCOT7PWk6F4LbKQ=;
 b=HJGf8eqjsDtICk8vHssZpgRnpWE5Fr6DdrtFgZ66YvBp9LGVw6RHEV4DuxRZT6lzDMyeLIvA15Jan/JAtzkhr7CRnj/r5G+Q4hILA1LmOk3PXOagFvT9yopTn4DrX4/nFJFJKug6qNa4oBrFz4SFestdBfMmqRfwE+RkJDrLhx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE1P216MB1996.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 06:26:00 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 06:26:00 +0000
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
Subject: [PATCH v7 1/4] media: chips-media: wave5: Fix SError of kernel panic when closed
Date: Wed, 19 Nov 2025 15:25:46 +0900
Message-Id: <20251119062549.51-2-jackson.lee@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 18578353-4a8e-4e74-f15d-08de273480be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ea4pduGkSHaJAgXevk3NVg0umcQOyWnluCi4qYSPgz+nBvWXJept+E3aZWOS?=
 =?us-ascii?Q?aGKL2XI/tcJdsFtnVHxCdtUUvanBXW4ZJ8Vt5Pm4VhhP5PluIxVx/zqQ/yEV?=
 =?us-ascii?Q?tFq74nrZlN0veZpCYFyXHKG3rNbS0DpA6inFgCMVShPwtIAaS8E4OcsgAGGQ?=
 =?us-ascii?Q?zfbnUdfONgq2VffRn/ZUKCoJ9hM3CxzI8xNjKIWYWUPyMWMqSygZgK5er0iC?=
 =?us-ascii?Q?LlZOWOx9uQShwsohKmF+8E0p5VkE1KrrijWcoC+xbBZUNpshh1hCNLN3gSPx?=
 =?us-ascii?Q?Fe9vNsu9Dr4oG9T1wZFXnDMqTHoVkbwo/I/oIzJ35S4oGWc6Up/UEPkZ77TS?=
 =?us-ascii?Q?m5AxHs6KXnLG9tZT6vFZrSf1KCIvDG/xSYEI5CNxdpkuhSux+V7sp6Izzd+i?=
 =?us-ascii?Q?hBUgVp3/4BZ/TbmbhaD9dLnXDTDDTv3yjjNMan/P2eMD+B0GYYIEMOlviYK8?=
 =?us-ascii?Q?q8OE/6LMwhJGAayr9GAScYedY+htP3BxLfIQolA8vBiZgCWGUM5auLWy6Vak?=
 =?us-ascii?Q?hmhs6jOLtxQguClNTRDPU6KQSXbyMIHjYWotYdjQEZygAVCrsADpWj9CzsZv?=
 =?us-ascii?Q?IL+5PT1GvLDfcitms74V37ANzo39TzYNilk1HnNvM/J1tkBI5JNs5Y1R8t17?=
 =?us-ascii?Q?K7yrt27XhhzvhI3oG3pqiz6JklipJoyUFwsozvki7BL2MU+kKlDkt057FgGR?=
 =?us-ascii?Q?X+owFx3Sr4qk+GskM/fT+OBcikoVMbSyUjFpkKlk29QO6U+rhSqg1MmLLfTM?=
 =?us-ascii?Q?NXJQ5PDYMjSEt9GWaw9bCpHnrCxzxr/Ddv0/5PqcBmrDgfr+tHH0+s4vI9fk?=
 =?us-ascii?Q?RuISOxQjVmGbdMLHRL1XtO1MEmpNbCl7qGFX7MjnmDULhMb9izNaZa+UhDqo?=
 =?us-ascii?Q?mcLBdxjlZHIYJh9TGJsP0Dfwlhd65FDHxdFtflU72XyOmgfwZl2CP+gRykVR?=
 =?us-ascii?Q?FV9UdnJ4AV3WKo5j3GYADQR09GJwAvQ3KwRITZ2jRvzEGlCNuJ978QOGTE3w?=
 =?us-ascii?Q?hRQMONfdIOpPSNzLWVS3m8LDk4pAZYh8BNS4eDpyRCbX59weKs8ksnUWZxxB?=
 =?us-ascii?Q?stsI3VikEwLcXaPSAxU7WEvjbSQWkoIjD0eBu3VKPYjoXPNf4ghjAP2nATmB?=
 =?us-ascii?Q?YjVUfwuA4rhHKc79Tnc1cX1GLl9EsaeodM2+KiLMo2cGcAbjnPZ/nzoFNDCI?=
 =?us-ascii?Q?1yWH1ODd/yH1S6RMeigAGEUrUIeb3lUqW+9cwFI6e0aFuV5f9vSac0DfMjU5?=
 =?us-ascii?Q?H9n2wyXaPn2GCIq92uugw9vqnbskUxhCZ2B87Ecy+2kEmM8e0QELBZwFrmMa?=
 =?us-ascii?Q?1apWuI1NLBh3/L2I5t0m8Ug8S/XXb7qW9kPupMLmiyl1avsIpengUPLfjpRk?=
 =?us-ascii?Q?5IyYoYn0odQ6EDavVDAvPuT1F+Wcm5ekh0HMcR+TLTP3f5hf+/U9w3Fmkb0V?=
 =?us-ascii?Q?fKE7/vshzF9ZFWXlra67vdwqj0bOjHB3UhlA4pCWqG7opMb7l0SJwc9C949Z?=
 =?us-ascii?Q?uOwbAar2vUBd/UrJwkLLbRH3j4cMFcu9FKgH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c22sHI2qwLQHngjRje9jIshqej8gqHSPMpmn7YlvDRw/baNkmkJRrYxFzVQD?=
 =?us-ascii?Q?YQVialNG2SqkgJ7HC2JiuozzKSu1beiwMCpSR9ktRu9VF6hHHzjTngbLSiku?=
 =?us-ascii?Q?cRzs9tgZFrjR5ZH3+OYznVu108PbEGkA82oSRGh1C+oGWV8G+9lZ+dLPOGd6?=
 =?us-ascii?Q?i6j5P8IRNjhYI/NL9NOCLX5Zt/25TTA8Zn5wm0h1Isryc4qX0NK6fe9ZXDYt?=
 =?us-ascii?Q?ILKOhpaNzdh1HxtbS8YVYnr3bj1b09qawrP8VwO4vVwpgizz19FH1IPDMMRZ?=
 =?us-ascii?Q?pFgf8Jj++BxzqhrsREwtwB1gjeZ+qbhDk/QrLbyrH0KE0PhqeHeBQZUKQtlS?=
 =?us-ascii?Q?AJbCiBUg/NY0HXg90g/zwRiKwrf29k85ARV2pn7MfeTaLjEzgAjsG+B/Dg0p?=
 =?us-ascii?Q?h2e2aDPEjyN+YgW2OJ/lTjpEI31x3Cor0B2VuNzpGGVETR+cOzosRmTfqUYb?=
 =?us-ascii?Q?nXpcoP0fYW7tS7dRt+HjtE+6DMHwK3jDgxAIm0xBAZ/TVXM40V56x3ZgogCP?=
 =?us-ascii?Q?YOQI7wVAfoZRxx26XV4TuqBHjmMEnvD7vBexdux/U4VPdFIyw9wGPYmwAhBq?=
 =?us-ascii?Q?YLvhdDzBGYg/KG7YFQ4yHBCxKfw/MqZTqSopZt+a58DYZ7PTU52sRvGDtAGR?=
 =?us-ascii?Q?2w0j82oUSGcIkMOM8qVQXVxo1coyy6JJJeSp/D11/iYgA1qtjKnPBJX0lPus?=
 =?us-ascii?Q?6oyhQbhF0Vh35xxvTTe1PeB7Tz7RvegPU1e29hiH0/ZTitHYklhnBDc7tayx?=
 =?us-ascii?Q?M3yQYZzMRmdpnPwj1oCo6G8OTVOxpaiV29wikOzE1gEE/viOalmreVh4Tt3H?=
 =?us-ascii?Q?+xQGgL8uDmWqxVg9cAcX2F7NKJunAME3cG2XTNHNVv6c1JCQdPLBLohQmxwH?=
 =?us-ascii?Q?0qxoY3XaTJRL62fDTIQix468SRmTA1aeYXpQ5bDpJMto7oxCLN8AIqcCd+RM?=
 =?us-ascii?Q?NGfWGJ9+KpvDFGb/3EOgaxn/koNlhMoHiyY0jJZWqwV1p1B3bs7NJW48TgJX?=
 =?us-ascii?Q?BkWDXSoHhi87oOlRRT/A44WItjnd0JucqYsncPAQSrZwkPX21RPngIvniPcb?=
 =?us-ascii?Q?jNX1RPUh1+gtpY0IbteKhnLcekRm69rI6/bu0oi98Oqd0KS/JAdX9aERiN6F?=
 =?us-ascii?Q?yFIdND4N5s3Hr9GqqQhrCE39LGlkNveyCoYGzrQtVuqAeQiOW5nFgkDPgA2i?=
 =?us-ascii?Q?epps4/Xg2ZkiY0X91aZoMpYXQVIbkhKWAP3AvU1STP+o1JRrEr5yiTpkeIl6?=
 =?us-ascii?Q?yogAZK3afEh8MvlAz9rfLKyFrxr3ynd+sEPu8z9zb9V3zs7uYc7yIIXe2aQj?=
 =?us-ascii?Q?vXR71YWBxRhsK1AFbpA0DW3q7nKMeI64FP28UKJHrzDIv3Wjxkfu4X+BuXew?=
 =?us-ascii?Q?sHZIccgHJaPKpnXPbtHFIQOPc5W73FM3iZebFbisv2W8ApJeX2SIUuP+BiD2?=
 =?us-ascii?Q?nuzhVUxCtBP7UwhGZFXCmnK6yWIvi1s4oAoLZOCzLREwAn6YkGAMZFhwxGdg?=
 =?us-ascii?Q?k/taMPnFAyJToV8E0cS+jk3yHrd75ljltHA3yY8xgD4zv1tm8T16ogk2KQFj?=
 =?us-ascii?Q?jukpnfY4pmvnOCNhaJLguta3s6bbGM72Ufx5OBdM1exnRMo1KXGcKNt4KCQ1?=
 =?us-ascii?Q?EA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18578353-4a8e-4e74-f15d-08de273480be
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 06:25:58.6950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pvrl/9uipGRUFs0lpVLuQK/nIARb7CA/cc/ILpFj01zUamz6rNxRp+fFRqY328/LwNUhYLceYui7FS6ZCSqZ3IA4uPOVk5rh17ofVMa/pew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1996

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


