Return-Path: <linux-media+bounces-47033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4F5C5AE5B
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 02:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 407AA4E74F3
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 01:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C5532652A4;
	Fri, 14 Nov 2025 01:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="BwxLfwHF"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021081.outbound.protection.outlook.com [40.107.42.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F2A260565;
	Fri, 14 Nov 2025 01:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763083314; cv=fail; b=LY+7mYAyItRXIyM8SkXygMHFoCpvMFoGoH9cWhV7A9poRWBvK7G9nvTcpdWPDmlCM9+puky3h3+umYmGV+xJd+75W2MzbhoABfly0RcYCyesRAXQSAll6ghmQozvVGrNaMqw0FToA1ecq416XT49midhZn+4mcDyBOIiMSVvmlA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763083314; c=relaxed/simple;
	bh=RQl0JPIm4DXUGoKD8Lqny40Lyo2ZsPsKTEgg1XnRB40=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m50zwiC7THC5VVx0GrlHIkZGq1TzwhrgZeWTF6mbFACyIy9k8GuDAdKqnz9ie0rh2RdJeSBt1987YPJjklTaACfmmnBMV6PMwpxS9Y7qRq9u5kjzdO+v6J0W3Ow+80Z8eE+DtM933dsOTEOlactnisROOpMujkpvN3/a153dorg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=BwxLfwHF; arc=fail smtp.client-ip=40.107.42.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mx3WH4w3gJP5lwIH6Lh/ZbqxAXZaydIwNvQH9hjCaujHZgBiJFxoIv+LBSMd3BYvyVfFm/boEq8rJa/KT3B5Ym4g6EoGsshFB/g6hspALABQwG5qWf8HPYjhWQbq3Gbi87LyPaDJQET4rpFRStgohcoCTS3n7pav6Fnu2uUFLwhOmZ981b752NtX3YNCUkjFT4dORXNF8+pOSl5WV2JMXQNB6JDYqU2OgHRHej3hWivPYk37JaFbBc+kkNzQTQtIDhTF/SKhBzfRgrVvkKobGb+BCusO4fii02/OoXBCOni0w6AssH40W9rYZ5n+g7dicZlzFR//Grr6LTp2xGL4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qej6knGnE79bS40DsnYcieU0Sr87uDS+XRcLsEF7Rg=;
 b=M3lxNLInGoK8B9/WUSwUMb7/hrysuHRwlPqRMAkN4VuPVlVewJ8DIZ/I8tWcjFgS0jOZtPG3+FSjJxzpH5ENC3wLa2bwqAsA1BuiL9SnNF3ehy1p3O2oM5AC6sqrRrS8ZP8NRvsTBFVRcQB0r5laTtwkoWM305LkVW2bExWWSkerekqK7R9/Cwxm0afvnIC2PyU+i8h+yVbqWnaimLxXVHavBAk5HpZN6K9LDvf9nrs7tQgJlK5URjBsZfinVKTDNxHx+97OSOBzFwQOT1GvYqg9SJH0wVDIgBkehNDvEnqZ0LUtUk8vMpnaLY30uIC9JjP1uA0Y6tQiKDaeZ3EyBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qej6knGnE79bS40DsnYcieU0Sr87uDS+XRcLsEF7Rg=;
 b=BwxLfwHFhDCIfZXYA8T3Tp23nEN/m7033ve9CoGWoh2ELRtZdA1YXObKyPcGROoxe+OCrZatzfokkWob//1aNjKQXLP2XEw40mk68nZf1OEh8RRz39hslnyxqLHc+0xVHe8Eir8aMz6zI7041Te5FSXGFV5KhkV0SVFGAy/xuHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE2P216MB2850.KORP216.PROD.OUTLOOK.COM (2603:1096:101:290::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Fri, 14 Nov 2025 01:21:47 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 01:21:47 +0000
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
Subject: [PATCH v6 3/4] media: chips-media: wave5: Add WARN_ON to check if dec_output_info is NULL
Date: Fri, 14 Nov 2025 10:21:29 +0900
Message-Id: <20251114012130.59-4-jackson.lee@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5cc7926a-8330-482a-23a8-08de231c2e31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/YeJCRJMXKpUhDC938zd4et12sbpdCyrOiwRccZLUAHGfTfqsVu9YhtGYkOu?=
 =?us-ascii?Q?4u2ZY9caPpaeXV0e5Sj/HYCKV/AxiTMMBcZSQwcU/NHANPGdgJJSErdB69yf?=
 =?us-ascii?Q?EQe76oKGkjiHGiVIHKNAr9ettH62jGMFUVO8ZMTqwt7jPJnqguKqMYPoi4LF?=
 =?us-ascii?Q?DEYehfIEMGggU6B6gdfsdjCnrrt9wDCYXbWdUDZe8H13vZykkZ3dbQ5o+sP0?=
 =?us-ascii?Q?Iob7LrvBjHQuZrN5BlA0Cfc8RrdAbCDSB9AVkCKLcxrT9Me1LG8gIp1/oRq6?=
 =?us-ascii?Q?wUdgf5vmbbzH7op/Sk68/AVEyNU/3asDNt7RYgjzFOs126CNATCYLW25khM4?=
 =?us-ascii?Q?ZK1aFUyxzlgnCk0TvJgKP4KhmTGroEaLqKyPJIE1H6FU+NNYdTuDVvpckk1o?=
 =?us-ascii?Q?zG0LWQ1wmvjZMMf6elBZLVJUB8WN/eH7R3TyD2KEQAWIdW6xUTHlAyiMlcJW?=
 =?us-ascii?Q?vhkvpMySGWu5CCDNuiOG5ntMyCRxD4oPFB/6O9xYw5TunDA5KTnyGHBGuoKO?=
 =?us-ascii?Q?YhlAuzmd0v/xHWira+YlonAcWzlkM8R7uo6fpNtXTocs0nFViWezZKgLILde?=
 =?us-ascii?Q?D8hSr5nxPSldwNjKieCuzkmvm6V8E+Un2o8kBoSN83ud0RtbTKdH/pF5T/e6?=
 =?us-ascii?Q?18qL6ImOCE0sZwFxKtGfTyCDcmIBaB3mYsjNgynwSIP9vwr2EZcTdmcFk+UU?=
 =?us-ascii?Q?qyz0lB1jeZFr1nZnPksV4Q9QzyaMVQq4GyVFTlwFosvERlP/a1ofYcBghM7j?=
 =?us-ascii?Q?2kwTkxNedYnq/aTKkiBHL5K7KwHJgEx7G1lYmdZQCdt5oQd6JqciZqdTcomj?=
 =?us-ascii?Q?La0SE6/Lwt4CDx0a9aWzJU5EsCwPd0ahUNqjasDLiU0UjPruSFUL8DTKFL/0?=
 =?us-ascii?Q?JxhTciA1jovPqkbPO+vOJuph37hbc4iOEijM1Qx4OY/BK9lChELAkKmjUaq7?=
 =?us-ascii?Q?hTWEvd1aTowgriWCXf92K31M/tcD/4p2z3MR56Jg+bxjbKmGjbIFer94qnZY?=
 =?us-ascii?Q?Jppgt1bwWH+vF1HHSOvPf+2GhZefzMlm9AwqZlAHDVNf1r9uC5tss8RL26yc?=
 =?us-ascii?Q?9cUrm5zPLnw93RcEfmnPW5hO9CZhPcAPrCUaRZ0PWtxfzv26HkJoyVOH6LEX?=
 =?us-ascii?Q?ejTA7UL2kgX9rbfvzEksxN218yy+Unf2qbxaD47zgk8Qz3zj/gM4dWt2uXyV?=
 =?us-ascii?Q?LBKkULo5nKs7+80SExkuu4yUSW9OJ97GTkB9a7IUcewSZ8AeqxkaT1trKtYy?=
 =?us-ascii?Q?nn7OzpTwreWqFHz5cO9hUFD1Fd4V/q5eeofedfe1booGjjMzWnhDQuaoiW+j?=
 =?us-ascii?Q?Gu5Na/Uxg4ufKXd9dS5jp0Ne+jA2RJYKdImBr6nOvN2geT2GMU2HSd7xHUHg?=
 =?us-ascii?Q?BLCv1kM0xP1WEyJiwO1syuLN6IbSFeoUXlfvqUNXjM4/+fGV5iyCZLJ1k6UF?=
 =?us-ascii?Q?KvMN37jRcN1kpFgO758rwXmNnZh0DAWHHWlY4DHNWVfeZMbNv/Otq7CYKQg8?=
 =?us-ascii?Q?P0D7RN9Qt6elnviaFiEOjlbtr3Cs1Cva7p+S?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B/ayoBSBmzrO+S+8w4ac9bcG2+85/QkULm2EQcz4hCjhtHD3CefqHTAbCskR?=
 =?us-ascii?Q?u2T1kyVLoC22ejUgzc2sfjHQ8HvBUTlXF8h2+o+A1QvkuuYX9PmpTTp0u4tv?=
 =?us-ascii?Q?rACDVfNV6Y8D7r88M5mprxxSXP+PAD/6VlmFgf4xSdCrRR4no/1w1TGzYN3P?=
 =?us-ascii?Q?gOIRLfkyZILD96BJ4fvjg6WZnvhTJ2DyT5bwCGHj9bCC8VQaHazU7fJsXJ35?=
 =?us-ascii?Q?mzM447Mpraz35v8cskjG3OMuUwXf+G52AbMqyx/4or9ax7yfvuSY/4Qxl2zg?=
 =?us-ascii?Q?5D1CDL+Fj1L5O/ghiUAt3FJjPxkPoygSbL2DXQtSDbnLvPOUHD6vfIopPHUX?=
 =?us-ascii?Q?Jcrt7FW39pKDSaGE1dPNYqsubJAL6SQSYcDAYylA/xKDTI4FvAUCct8lfXen?=
 =?us-ascii?Q?EwcdHXSUXA0lpxsgRoVuxKjc33rprfa4dtfESfe9TcVdU1OT+UuBsiXaMX6E?=
 =?us-ascii?Q?ukigEqrQ2dfRAGhW3Dw9qGom9TikIpoxvv+VK6z4/0j/7ga7yxj1MXssiGG7?=
 =?us-ascii?Q?ZvDYcUK0XTs78PexIhZ+2nNs24xIF5jhAlJVDzM5lY+igqSvGhBTUGFuB1PO?=
 =?us-ascii?Q?fYlFApxHVJoic19eGF3FPW5wQg/IvhRSDk7WOSI7L5yAXOBwCQAANKqA7C2q?=
 =?us-ascii?Q?Hqj8jj8gmygxDLCmTae8Nd2k4xjQEz39BjJQDGaHjvpwKugMw3A7/bK2AbJi?=
 =?us-ascii?Q?3TpcJuiwe+rflP9uG2S9xymIbHkbhy2mI0F1shE/7sQD2RUhfglJGk6Iirhs?=
 =?us-ascii?Q?dex7UfdM0aUMNH5kZY+1G9idvEUPfQVTVzbEtZ1uvMQ9AkF3PepAxg3PyZuH?=
 =?us-ascii?Q?N2kdfK4lePZhk+yKQNd4vNIxc3ALDH7v7ZExcrv+dI4HAEtOqloenSGkbnC+?=
 =?us-ascii?Q?ZpQmWKkKWk8ypHTtLqv0h/lfsiPVbRGRKN2EUdtXCfBLAA3EW8wAwLgrYHtI?=
 =?us-ascii?Q?RGV5LSLfi6/fx6KXU4r8TiMXJpqKBkK/UMn6S5FDR8l8VGuAtqEUfuEBTx5h?=
 =?us-ascii?Q?RgfSuz/Ye9yJhODi0WnEqxLCOEncyzbH0u+bT5EWCEC7UT8vcmW3t/cH/Git?=
 =?us-ascii?Q?r7wB+4K/8ba33ww1U0MxlPquNS62+Ol+lFosWGroYtAcljacG2mrHHk7SVUo?=
 =?us-ascii?Q?0U6DBa1ZmWx6KfqSeIYEzvT+c2sgl/NBDQC28V8+uU2AiMdvt2zzNUXGkL20?=
 =?us-ascii?Q?YaZuL7XX8ixg5r7zX20rs3synfzQQ18ceH3eordizk0d3BYYQ1+IeTXkB/mU?=
 =?us-ascii?Q?zyIK0jG3lyvPPBpJoGt+jxetzt2xx0WM1O/vUMjqvgGKTgg4SIAG1S1T/Euo?=
 =?us-ascii?Q?/SQmVTHQGu29Bzz5GlRnUIg2xEl88tBjFSeQUhVTXy5yURXo+1V+4yyxkXuH?=
 =?us-ascii?Q?QckDlTHzr9qvqGKetATnh9LfNbMizpq3tZc7rl3e+JtVJKmRG5ios9wqJV8C?=
 =?us-ascii?Q?eqOewL4uN+c1957mgy9TQruCUWPchUIsfUvkmPFcQl9VpjdWXb7cNCMw73Vp?=
 =?us-ascii?Q?MKLvRQswbwDXaszN8ncMT1aOTzpXMa+qvNwFwO7GMBaKfoBXGc8dX09ZxwoH?=
 =?us-ascii?Q?lzsyeI21q3s0gicf4M56TeI3mJ6wF3Bu0K0Ob9LieT4BCXaQ5u7VQLvtDZUU?=
 =?us-ascii?Q?MQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc7926a-8330-482a-23a8-08de231c2e31
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 01:21:47.5110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 53zgSeQXRPyg4BM6vOYEpDrphhI3KPaTcpdyceSHijmn4FFvYnZPTCnpOYuTz/kdyd0mVWiZjv+MQOyWT09E1nFN0GQtTl4ul5RZ57+SZTE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2850

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The dec_output_info should not be a null pointer, WARN_ON around it to
indicates a driver issue.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index e94d6ebc9f81..5b10f9f49b9f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -485,7 +485,7 @@ int wave5_vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_output_i
 	struct vpu_device *vpu_dev = inst->dev;
 	struct dec_output_info *disp_info;
 
-	if (!info)
+	if (WARN_ON(!info))
 		return -EINVAL;
 
 	p_dec_info = &inst->codec_info->dec_info;
-- 
2.43.0


