Return-Path: <linux-media+bounces-21275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D71EF9C4C60
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 03:17:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDACF2832DE
	for <lists+linux-media@lfdr.de>; Tue, 12 Nov 2024 02:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBEB208222;
	Tue, 12 Nov 2024 02:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="X9HGrINd"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022128.outbound.protection.outlook.com [40.107.43.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A627020495C;
	Tue, 12 Nov 2024 02:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731377733; cv=fail; b=fVKgQIuYj5fBAhU/dRScpQTEgJPvunSBEGMLnzZmiPqC9CHtA01ErmiVrHkGTTdEGBu9ddhkdWgI4ss/GECSMyhs4SYgL6Ub9vMEfxcfK4ze5JhkujChA+IjfRebI2jhXAAUdnCMoztQCjQ3ZCtMnpqs5oUilyizkQ+LRJVukEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731377733; c=relaxed/simple;
	bh=6Jo/sF+cOaN5tzi7stLcpLUnnPM1GRltVyH0XACHYdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E0Rb0jW5yMerhEc6XQbyEQyjr2Z3BZipsivpVA7tdydSyocTPB5NbtGed4BxpYTlRWuVLm32Y9b+TMSMdbTl5DGrlVNGMtY7oWQTBDty8P6L9HYkwPhBIdf4KqxRj3qwYDWtFhH2DCFlpla5OYwmDwe4qzN5c13viUb0hEtNTQY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=X9HGrINd; arc=fail smtp.client-ip=40.107.43.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JLtrbcnwT1wn2xRQb9tdESaDPFGknwW2RROFyAJFA5+clhr0SovNxn/FviEQD1D25uxFTMAae5RqPaBitvF1gbXYkLevNSeJftaWYLycCjeMAO2YeqeCRG0eKDJBaqFEEq/pzFGO8Q+LvB3JCOXvXLXx+XOB2yXd4BshcxVI2OHJlsvHh7TfM+xm4Wa2hc9toNUlDpx/nEKNL6R9jD/Gp3mwfB/HU2Vyof+S24zO+/2CTuxzSSNLglDx13t7kBUf4XpAdRaKzNEVBAjoc4nE2ngVazLccgMrXg8+RuIX7XjhvnhaFVQEC3Z0S5k6aNJhpSN5xPS9CNZyCVHxTy4mCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PjPtAm/hRnUMCrkhdL3i4MNXAHVNv8jzN/M99OmObOE=;
 b=XBxUf0KREylxTLXFdVaCg6zan6Teju/orzXujnPXa8jSoUXwlAHO5tBYMrpq8hdjm6+5ZaHs29DAqJV153kRLCs/ETjLWf/9OCecRwamXfTpdTYFZ59HtHKknzU2L9vGHBa5SajSbuGxmW24HuEwUfYqZ7GvHy/DC2H84xtbb0Tnc4kHmdAS693AWPJTVNp/E2kqNRg6rzM+vNVx00h6aZVjcmGjpJ+j5mb1jUiLXMd2KwC6JRhztBTX8ST5glbg6vpL2HVA8Gh92lqzBKVFj4cFfQDkF3WvpPN+zbYHozC+j1VQCJ/i6lJgl5NT9iLqJW2+EJdODXRjY4K5apWRzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PjPtAm/hRnUMCrkhdL3i4MNXAHVNv8jzN/M99OmObOE=;
 b=X9HGrINdbuiTzZSCEYrqVRvdQHUpTJRtOLAGwSV9qv7e5HGugRvRmsQMMWW6eDriZTtpwyFiWUnm0rukhpeofrfN15iHlQWbeduF5Zu66JtPLV0740lLf3cplespOvKUqteBWS2vOGCBGyexj9eIT9Eg8Y6z5CfbTRuXlh0TIXY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB1900.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f8::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8137.29; Tue, 12 Nov 2024 02:15:25 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 02:15:25 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	jackson.lee@chipsnmedia.com
Subject: [PATCH v0 1/6] media: chips-media: wave5: Fix to display gray color on screen
Date: Tue, 12 Nov 2024 11:15:12 +0900
Message-Id: <20241112021517.121-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112021517.121-1-jackson.lee@chipsnmedia.com>
References: <20241112021517.121-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0042.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::7) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE2P216MB1900:EE_
X-MS-Office365-Filtering-Correlation-Id: ed2d9298-7fc3-4edc-cbee-08dd02bfdee2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sqS+Ve+BF2LVE9NLProHdqR/t/dJdRrvxzVCYLPefHTW9OjwszWkkgAUvEmh?=
 =?us-ascii?Q?3LOMfg8Blm715cjaHc8p5Z+/M2o55INlQI3BF2UNUXpoLtpG8ghTpLHr8TOq?=
 =?us-ascii?Q?IsmQRlmEw3p3JN/JFVZZLg1AXU6BOTMqY5kLcWEWfKHc7WmugRwlgn+eFGts?=
 =?us-ascii?Q?bgfWnJyI7TZ69dqBMTdcTHA9r3mTGOe9KhcHOskeiv0gO7cPj2nGpIuISopm?=
 =?us-ascii?Q?VByegx4virt+wpslFoDvxQCsZQNnT2HsRmmxqcY6+VY3JdjBLxXujkqCQmar?=
 =?us-ascii?Q?rNR+1k2fkce7wnbdwwKicw3Xzj6PakkTjQogNyqxCZNUARKuPVu+8dGwW4DM?=
 =?us-ascii?Q?Dudec7QEWdRO3ot55+3Nz8LPNvFSTpITdA5dtYQNOT7MB6vlshgSqZeNcgiT?=
 =?us-ascii?Q?CFgzKUnG7QeReqU696MgCIwp8a40hcI69lv18n0fixuYljoZUn+fhu+bFsDe?=
 =?us-ascii?Q?wIZ2LTpg/vp49aipJjwfn6i0resF8TTDOl+MR+Uw3goXDO6Z1R17fY/ptFPn?=
 =?us-ascii?Q?Mdw7L4bYZmRONCDht5I8xo/VVIUmnfZB4zu8Et2QmzByyJkDJ53zVFXCxgdL?=
 =?us-ascii?Q?97+uXpvEQBoZ3OBqk1p7Mw9Xog3qKr7ywIsc1inPUI0IPGUIeXLrMAZfyONu?=
 =?us-ascii?Q?XJ0EIVB3rZ1XqqXs0587+UnMSIkdvuQK6vmVaocLviK3p6b5myygxijPKdXC?=
 =?us-ascii?Q?Tt54NRAUWzNDXD9bUJ80UKGHb4Z/VcbDHuX1km4j//aI/4UfEOUXQ3D/ZJIT?=
 =?us-ascii?Q?pl083UVxyshgVso3HZYs4xeWySi+XR5fMXqLkOzO1390tGH3XaPiHL4rvMRJ?=
 =?us-ascii?Q?dtAxa8thTvUUVveTbuYxV3ST4F2WTpyoGw6UfZ1LaT9pAZkUQyAQtt3uAMbF?=
 =?us-ascii?Q?2+7e5HbXOQQmV3mm1RHyqBXc6zOsxdMP6fCV8aMfhk5UQpoCcMQQRQ7shY+l?=
 =?us-ascii?Q?ktX8dM5uyliqwj0ttOCzk2fM1CGonk9L3qg8nz4NuVwHcBnAIoj0rCVtP306?=
 =?us-ascii?Q?GLkOAksxD+Fy7X/5PUwPshOh8GITG98kTVkNPty8SYF223+7TYY+0fn/QzEG?=
 =?us-ascii?Q?iFKfTHZcjpz1vgFiz/vHa6n4h7S+BC7LCMce2IAYlhNAnCyOIGXufPwwgNy2?=
 =?us-ascii?Q?+wftxaAwh3Xwzpk3gRr6D+9+H/DG7Ja1flCRwVNi9fr2m+zTSO0BRekoLcQD?=
 =?us-ascii?Q?H/R+PoKZEGc4K8lUbpF8KEaBJRTzztNs+gFh2wzbTlbumiNtjndc3wcXlyBx?=
 =?us-ascii?Q?+KyyHkaM0EAveoaxdtqs6+BOgpORBEnRi2pF1f7lZaCuFhnJUNY7ccSLGnWh?=
 =?us-ascii?Q?I0rcfUWY2vFNrf+TD8LAbvyUwbdWS/0lVoiuZP819Y65uIGZ12uTzH/P6XYp?=
 =?us-ascii?Q?cpUx0x0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o4uJC7+7i+ul1LNvPLJnzzN2iWFRuirDNI4eWG5gd1dxejUtlQC43VUJiMrn?=
 =?us-ascii?Q?S6P8JRbqhf7ZuGOWw9iKMyKYs6RLBtt9yB70qqKQAluIqDnwK1pnZuyGi/zZ?=
 =?us-ascii?Q?38zgsKd47BPziNA/HscGfD/7t6UdFkPcAO7QOaI9X3asf0siI0Jr+PxcQzYl?=
 =?us-ascii?Q?UVNPpqZffpc3ffCaf7HInD0nyBiJij5Pt9GmYsthdwF+0Iw6I5Fm1e/uuxxK?=
 =?us-ascii?Q?FCEo8zZmOMrR6ArQzXdnqNbWVRuVBEOxu+S0axZAMTsrZkFkdKdpI3gfD4vk?=
 =?us-ascii?Q?O+dIpIcPvDHn5e6NAc5OtNFB4ifEc19rHxHMau4x/6AmlkdABpm041T2Qxxk?=
 =?us-ascii?Q?ubEpksbZadv/AFfsIaySSaiRT4msvBUSogbRv5OgSe7GKnXIiOyBtcuJSQn4?=
 =?us-ascii?Q?kvSawSdX+67wOtNdfQzSlGupTupF6Qge2QLlBdifK5M5/biRhECjpwx/evlu?=
 =?us-ascii?Q?w+WiXnBIsgUiAvebVQ2Kpok4mkd/jz8CazVlDzUb/Sa0ynkFpiS32aETNoEC?=
 =?us-ascii?Q?34mtJ7YbncWnr6HQYY/QjSr6ljeSez07ETuqXWumDL6eS2agxnGxo0DgKdKw?=
 =?us-ascii?Q?HeO/+a7Hov3RH4uFv4vZwaAZpIcNWKdqRfc7EsIVVIhJD3AyiEtBKL9krsyS?=
 =?us-ascii?Q?cNG9gRAUN2xZMKri3UYg3ALM0k450hRFW5GpSCl5Cg6R4WuxmIXc0KsangXM?=
 =?us-ascii?Q?AgQK5qoZUQowY7Tx7dP0frI0K8OC71WuvBA5TMYrD/dkinx79oaM6PTl4Pqo?=
 =?us-ascii?Q?H6RcbXCJMkm0UlF9Ymn2RkYwhh/+59wYUfdx+dbEK8Xm+Dg+kSDKKStC5DZT?=
 =?us-ascii?Q?Yo/G6jCoT++ySRGpnSmkOwwoQMXlg1asUJ5C86p0df59Dmiy/1gnM0piWXmS?=
 =?us-ascii?Q?2oTIlv6mkKqkhaEnbHr0MAF1rv82Nmqi8k0pWzybXBRj5N/JUN8jz+1aOwSl?=
 =?us-ascii?Q?nWSovzasSM5H9Q1ME6CMFQi6gbzRo1bxsqrIK22swaP2eq/BphUI2Lu7l06L?=
 =?us-ascii?Q?SBuOv4zeUkFCbv5iB2bYc3bz6G9f89XhWlzQhjQ+pGGXiz/pNnIQiVh7ACZU?=
 =?us-ascii?Q?C0A//qAx+DxR+cfiSiR7ueAGJGHN3eA9LQUmGEMj2D66URQ34P785Kxqr6uh?=
 =?us-ascii?Q?TNecLPCLjLorYziUIBKcytQCfSWIPPfplJOIj39qJfUe17NvoXPAVrxe/zdU?=
 =?us-ascii?Q?WIOScVqZg1tiieruYihQg9Bko18kPn+fIMIto16xWi8moRl5umbcnv1lyJBq?=
 =?us-ascii?Q?I36dotIc7l1vwKloUCdGqBtfQN4mNkN3A7tGfL7jvwlhmvgyuBZo4Ba9gPjS?=
 =?us-ascii?Q?PEgGAfJj5+jahMAHK44Zc//AplDsSmxtn80WvXtHiuZZmM42lqmYpbNDierg?=
 =?us-ascii?Q?qI0fm3Fa+bwH8xdGZoYT1HtBjEqI70caQUtOcnogzJWDb+d5w8wk+npPoTVh?=
 =?us-ascii?Q?yeYA3RvfQha60AVDOrsSQS+yP4DM0aBZUT3isnp5pB2NT45GqKrwalqodZJH?=
 =?us-ascii?Q?AyFS4BOAn5LfYkPzBNLdY0k+0xaMJLTefEcGWXRConpttF6oM9Z6YQeMrQIY?=
 =?us-ascii?Q?Weqw/ABH375lxsmc1lFdCh3Y2WAJh0IrLBBC2VcvQh+HnQ3ZJbqX6JB8J2Ss?=
 =?us-ascii?Q?LQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2d9298-7fc3-4edc-cbee-08dd02bfdee2
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 02:15:25.8874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: El3UKR5Xqv/RLV4/H1k3brrzYV7uC9rdGnEVwcl/eKXlfH5JC1n2jU3Lv2X0WpPwFKUqbawlZ+i4Q9iaOgs7eDBey2CBsHNDx0QL3vCJ/y0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1900

When a decoder instance is created, W5_CMD_ERR_CONCEAL register should be
initialized to 0. If not set to 0, gray color can occasionally be displayed
on screen while decoding.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index c8a905994109..d94cf84c3ee5 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -585,7 +585,7 @@ int wave5_vpu_build_up_dec_param(struct vpu_instance *inst,
 		vpu_write_reg(inst->dev, W5_CMD_NUM_CQ_DEPTH_M1,
 			      WAVE521_COMMAND_QUEUE_DEPTH - 1);
 	}
-
+	vpu_write_reg(inst->dev, W5_CMD_ERR_CONCEAL, 0);
 	ret = send_firmware_command(inst, W5_CREATE_INSTANCE, true, NULL, NULL);
 	if (ret) {
 		wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_work);
-- 
2.43.0


