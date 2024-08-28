Return-Path: <linux-media+bounces-17025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE62A96281F
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 15:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29A23B248F7
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2024 13:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08958178CF2;
	Wed, 28 Aug 2024 13:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="YzBN226B"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2078.outbound.protection.outlook.com [40.107.249.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E21E174EDF;
	Wed, 28 Aug 2024 13:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724850093; cv=fail; b=WmRXDrrA7wjEDN3tucGynE9ZF292nOsR+lJ8UKOktG0i6GHUV4nXeEmG4AXz6U5Neq5t99I+ANTXShAOrOTEthmds99t0niB+WTOuzztig/pCtFPvrWAK7O5tkvgwNh75sfXJClkk320KbjRSXYNSRTgWNFl6MuOpXJWxeUHNtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724850093; c=relaxed/simple;
	bh=n22IftWYgTWo9iErCqbfUWxgpDVcNpfsu8IlvLIe1sE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=JrcrJDLggNGtu9hw3OJSMmgP1HeY7mEM6/aoAEDvc+y4QTB1N9Avmg0zNWK91q217UbEUfmH/wo/pVERkBaONVBjkNxUFrrbEYJV2L4Y0VTC4OrI+Hb+6KE0bFPKTcEhTo1ygnQTbS7RaCavbmAnhh0KfNfstsxa9Wzo+LSnngA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=YzBN226B; arc=fail smtp.client-ip=40.107.249.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+JIkLDSXrm2QFcNxI8tppSmXjo+dpI+QGm1grOEc8ECpWPOmmKcVBQAys0HC7JhoIXkM+A2xPI/eq9Gwxd4x8Sus9U01mzucdMglCqb4enkIJs2ORXkShHN1G06qw4cyZOjGooyBpfAZMxYgg6yUa/NQm1dJx+j2YvkDZtN0d5NO/iiaRSo56ZffsSfuSPAt3fypqoyz9d0khFqaOaf0f+5DZSUcfa2pmbVdfWMhDktW/ADWmh+0HBVGeXn5ZEs9Hx50b/6ipIOtvDd6Bg5l6vuU7vEXQm2j81AEBFh2EFn9EWUY09cTqajcwjIZ4MMbuwdBxDyOFDqXepDp9TFEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkGhKGRR3v3XUfCjlYP6EUp0+vnkRdaOnUlyEFTSlzo=;
 b=PhQkgBZGo6qMzwASSqsdKe15DL5VVZYyStVpadigHvvMlS2WLGqQJfloQw+Y4H/4LrPnsR8QXjepG+INIZGjLarURaENseFbVcBZojsfHoENShAk7uWnt96kghmoFtHIkSstih2Ww2YXAaCakRziheXngQ58SHXLlde40YWWiYoXCaBP5Xjeq8trjVg6tsqKR34zoNE6eNcHui7D62lKIHIga/acMyj86Y1Xg8MI46n5ejWp88SVsoN4WJGj5v15X0dJIoNs4mMMDGYD04KO8pl2DbEqlEUT7uJUTCQD9JSgQ5Sx/q8bGa5E/6kArcpNJqW6BcUCpi4ETdrkSzxNBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkGhKGRR3v3XUfCjlYP6EUp0+vnkRdaOnUlyEFTSlzo=;
 b=YzBN226B1RgYD725sqyRNWAKtC1hV9Uz+uODXIQ/7B45pw+7jAS99pYgmG8wX+0JRl8kNCDJS/fn4HsBWuQY4ruZFw8Ao2D606Ot7jGVU8okzQV3cOcjRPcfFxfP5sx36JGs2Pge02dt+EXpaGbvL+AME4DpahS2fTj+Lu/RV4LDG+fb3QJ8TIhnjySXXAGqjUQ0kKnKfpwC6Ih6NymATX++T6s/4WnxEv8HBSzDBr5xdamYiKLDu56x5p4KBTRezt/aFhppf9ehuPf52QPix7GWYfbk5EMHoMaK2DChPiSaDGxcvIRBrUk167AjcK+VbiM0Ro+WIcM82E4YEqlZjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DUZPR04MB10015.eurprd04.prod.outlook.com (2603:10a6:10:4d9::14)
 by AM7PR04MB7029.eurprd04.prod.outlook.com (2603:10a6:20b:118::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 13:01:28 +0000
Received: from DUZPR04MB10015.eurprd04.prod.outlook.com
 ([fe80::25c1:1b75:f601:df1c]) by DUZPR04MB10015.eurprd04.prod.outlook.com
 ([fe80::25c1:1b75:f601:df1c%6]) with mapi id 15.20.7897.027; Wed, 28 Aug 2024
 13:01:28 +0000
From: Mihai Despotovici <mihai.despotovici@oss.nxp.com>
To: ming.qian@nxp.com,
	eagle.zhou@nxp.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: amphion: Guard memory allocation to catch failures
Date: Wed, 28 Aug 2024 16:01:24 +0300
Message-Id: <20240828130124.1923533-1-mihai.despotovici@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR05CA0088.eurprd05.prod.outlook.com
 (2603:10a6:208:136::28) To DUZPR04MB10015.eurprd04.prod.outlook.com
 (2603:10a6:10:4d9::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DUZPR04MB10015:EE_|AM7PR04MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: 427cb367-3c07-4288-7d91-08dcc761877a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ju+y2xd/W7Zqufs0pnJzMao7w1dwMqqCrABkzcRq8v68/iKnCESAzysER5g6?=
 =?us-ascii?Q?4x2yyhowXR6A2YkTE7pgCJPhtVyf79kvaWlni+4V+lwaYtIYsTOtGPoMX1ns?=
 =?us-ascii?Q?tnEgGerxiDtoz5a8d1ExtH8PvXVogHmsNAazmJMElDq2yg9/LWf+Ai4Yr7aZ?=
 =?us-ascii?Q?K5D1KBjRUmlLoxLTXNxy8J/04jGLadD1i+KX7/u9L4JwdBJH9dgROamzFs1I?=
 =?us-ascii?Q?wzfZRl0Uymgxrx9ZJPWG9JkIc267LdknZGi2Y5dNXKztwwHioEjDmXjBuZ0l?=
 =?us-ascii?Q?8aLeVjVWW3iDtfRJgw4cW4oYUBEdMLjmvN5YYk6w78Qlg+wOlgaBhocGJhRH?=
 =?us-ascii?Q?Tir5kL8ytZd73wN+fzs3iOTHrShBcw9hHfbvE6l6vXB6KF+KIwxkNtJEuW73?=
 =?us-ascii?Q?I4Yre7SHVvXkMY70MOK/IwOemYaTWAuHF0Vd+rsXjk/rr5sFLOCgYkQQSae/?=
 =?us-ascii?Q?s/KPLOmT/SNRhn2x55KJqW+YTHtfr1nsQy6XDLEdQtIRS7w/v3NDYrOd1xZt?=
 =?us-ascii?Q?IGcst9sI/u6a6HHddswamxaGZFrnbmcJbz3S0foZTSZzaQU5euJ7TWbmNBUd?=
 =?us-ascii?Q?GrBAwlQa0JK83CMqrBlTaNZfoqmTjTEdEe0AAVBF0x3CwfOTs9AURhqizCGr?=
 =?us-ascii?Q?2pfjuCpxF838Wju0t1y5hcdmOg6Y8GAmQWTOH7UIrQRjEaaHKfRkmjv9PNpg?=
 =?us-ascii?Q?Ru7JZDTKwSabxkm+bJCWxYAdqBSKjQ/I3M+Aa9O0UjSeF+6W8cFIQfb6CrwV?=
 =?us-ascii?Q?/K9xD02wEIeyq5yiCyej8Jl2HKTwbXB3ZoQLCCeoQJnJxr7Ltp+QC9NdFjx0?=
 =?us-ascii?Q?kEbHb0L2AMHbTUoB0VsZbzIDU+PQBATrDhhxfE2jR4XZlabgGToBZdNuD9Ln?=
 =?us-ascii?Q?SxjKfhxhxJU8VPXnICE81sedcY439XEaaFUSbXHiq4Ty01MVfhxlQpIvyJ6s?=
 =?us-ascii?Q?RfRhkakW1XkLw1VcuVZk36uQGzh06hcnsemKaQR0lXnD0gammiS1eieAfeBF?=
 =?us-ascii?Q?IrwkX3ykP7NJRnl/fV4QSSDgOD/wFgu+KxZp7jgLnowz5kU98UxNTHTS98XP?=
 =?us-ascii?Q?UP+mK4wxrZdxsi/FlTMEG3U9yDCxcJx5tMUhP3KkaX7sZZYKheUrzPifA/N9?=
 =?us-ascii?Q?XzlFWZiiE8D9wNestt2v7MX4MJXu8R1OLAStZ2QXefNCUMaxYx6EqOrNWiLe?=
 =?us-ascii?Q?y5oUQTIBLyGQe8PNmk59M1leU/3vvJbJfEcdwZH+tcwTPUbxDRfb0GIAuS5O?=
 =?us-ascii?Q?bKF37tbhS0M7gUHEUUmgJs/ElotDfnqN5vBP/D+F97wVQ45XvZ0YZDkwAPJc?=
 =?us-ascii?Q?7m401KfgWoqwP1GUM5WAvMsUQDbLj9GKgJl5HRJTBEKqNA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DUZPR04MB10015.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W/O8C3Pt9tPhOPaL7NBNbMXA9zMVPUZU8CdomjGSbUX5sia0R6xhzJJIAP5R?=
 =?us-ascii?Q?UoBo2BZC+IVuSjpW2o2Zxww17YYlmhNram1joTB6xxargoLFcZxfz2T3b4RJ?=
 =?us-ascii?Q?wQN6QLiJQ55EjzMntHmYC0LzoHku1jH2o99gPFGfKhE6vp4XLZZALrU/Tous?=
 =?us-ascii?Q?Oo8fvTUmvHPQ5sLevqtCP9toZOkMItn5PJaey677VpLmSSpx9Kt86A2f73/s?=
 =?us-ascii?Q?hUuKXovY2UzGmjIm1zH3jFENXiPx96LNjhGY28ySx7rNWnZJR+1S+Ba8n6IN?=
 =?us-ascii?Q?7pXOE5369PEPOkJLUBpX8ezuBjyLeH5HvgscpKhzr3N4I4wzDMXCfFSSE2pr?=
 =?us-ascii?Q?9/7ETA6txqzVIx/Of/GNAEqhfsNQ4QkfV0jKgBdX0j9qt8dz1blICf3eqyHZ?=
 =?us-ascii?Q?a9iCTRas3kDekIlQnSl0MfMKZF2hZu8tB5POcMeGaTx0g8T2Fmb+cRmFlUDq?=
 =?us-ascii?Q?V/H7E2R/GekgQWI1YhflBxsmcaTglJfmJ2wSI1dOich0FJYDH3VeoJF3y9dD?=
 =?us-ascii?Q?haxF3pLwB65tLuOnce5BN9U+wHYUB+8A2EzbY6zUPTFBpoatldDzI1VznDrK?=
 =?us-ascii?Q?/3w1tCW+86OY6Vx79+NBeHQDOrhuBgBikScdKd2aMc4se8h3swxqcyQ1Zb5k?=
 =?us-ascii?Q?zTXynBXCJetqJh+62UJG2F1PsvmXeuPFDR9HQ40X65Ej0CE4F87oUgLIVdYH?=
 =?us-ascii?Q?QMh+JpPb5KJ/PzV0O9IuHkoQmOxqQYBReV4uz64FKkpW6HUrMf9aZO68fcIi?=
 =?us-ascii?Q?wY3dLIDrsy87cnG+GhSvZZcImmVpvMbF1mPrdIgqWVaDi8H3niFpoKq6Z+Ip?=
 =?us-ascii?Q?8amBckPO3dpMhby5r+Yl5NFLYLMmlCfjbl17yn3fbhjWGrcmQyyn6kuVWXN7?=
 =?us-ascii?Q?lu+ECQaxgcaDddiH4vSnIv258q/Ho6Fnq2vKL6el4tj/b3vI8WVNOTKA992x?=
 =?us-ascii?Q?cVpKWilm++fkiWAWQI70jcWd/7KBmKJO0q08MuxosyzpmAbUYXsjaXTrDTRO?=
 =?us-ascii?Q?Vuud8W39EalJ11eaORtpaZVWjfmDltEWAr9ZOkHPxElNXgIQTgPy5Vu9WZGX?=
 =?us-ascii?Q?q79eLz8AwvtjREjHij/L7Ue+YpR8fXPVFhketOPONBQM+RnTk387CusIUvzk?=
 =?us-ascii?Q?sLiby4x1XTeVJM9VAsQ2C+NVoeZjItFrlRt+UY+QQ1l4p2hiQBSB6xtUyC//?=
 =?us-ascii?Q?vNnD4klR0M+OPSORTh+Gr/1zLn+IMa6Bcc503UxiD1jEGNd+I5De3Wudl1/4?=
 =?us-ascii?Q?xXFC/YS3P9FJWEWxltEUa92Ldy9DHLHGG2MSRYnEaiW0TqShxLFZ4i2a3FaJ?=
 =?us-ascii?Q?U+Q/RxThUg8ClgYINUMTMAuMJwhQ6Q7wtVd67Uxncz+h1xTmc1osirlWCDFD?=
 =?us-ascii?Q?aPZoj9c1H2WsySQd2sQrOi1RxZeaaOFbdSpqelH+AEBzLKax+sVw1Ui5G4SL?=
 =?us-ascii?Q?g9svy2s4ipw90zdG69bhJbXjO6mE6wrDDW0zOrstmAjhUTcc6GcM+UoFYjys?=
 =?us-ascii?Q?lwfCkiIVjanb5XefP2TlSzXjF+MSJSsoBz4SoCYzJy2xvVyIdEdQdnkne5id?=
 =?us-ascii?Q?Ffeg2+36uKLQ/kA5+W7JaZFMP3DjLn+QvkkfxwJEoez2BaKv6mXAIUGOecZM?=
 =?us-ascii?Q?Jvg74Uo+sNrGjBngVKBpGwoIxxeA3PePKkll5UW2Jn02?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 427cb367-3c07-4288-7d91-08dcc761877a
X-MS-Exchange-CrossTenant-AuthSource: DUZPR04MB10015.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 13:01:27.9164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HqLRs4U2w70yVoaRUyk6W741v15UGTel46EJGHVqMC9uvCXMhlOesm4gpgtQlRFIYYVkJyahCwH4QRg42WAWNkJ5HardcNWVqmZtP+NMfHvqiEcMYNyYFONsctlDYsk1ruyEmOcMjnzzo3ewHc+3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7029

From: Ming Qian <ming.qian@nxp.com>

The firmware will ask the driver for memory allocation, but it will not
check the completeness of the task. Therefore, the vpu will crash until
reboot. This code will guard this bug and make the driver fail gracefully
when memory allocation cannot be completed.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Reviewed-by: Zhou Peng <eagle.zhou@nxp.com>
Signed-off-by: Mihai Despotovici <mihai.despotovici@nxp.com>
---
 drivers/media/platform/amphion/venc.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
index 351b4edc8742..c5c1f1fbaa80 100644
--- a/drivers/media/platform/amphion/venc.c
+++ b/drivers/media/platform/amphion/venc.c
@@ -52,6 +52,7 @@ struct venc_t {
 	u32 ready_count;
 	u32 enable;
 	u32 stopped;
+	u32 memory_resource_configured;
 
 	u32 skipped_count;
 	u32 skipped_bytes;
@@ -943,10 +944,19 @@ static int venc_start_session(struct vpu_inst *inst, u32 type)
 	ret = vpu_iface_set_encode_params(inst, &venc->params, 0);
 	if (ret)
 		goto error;
+
+	venc->memory_resource_configured = false;
 	ret = vpu_session_configure_codec(inst);
 	if (ret)
 		goto error;
 
+	if (!venc->memory_resource_configured) {
+		vb2_queue_error(v4l2_m2m_get_src_vq(inst->fh.m2m_ctx));
+		vb2_queue_error(v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx));
+		ret = -ENOMEM;
+		goto error;
+	}
+
 	inst->state = VPU_CODEC_STATE_CONFIGURED;
 	/*vpu_iface_config_memory_resource*/
 
@@ -985,6 +995,7 @@ static void venc_cleanup_mem_resource(struct vpu_inst *inst)
 	u32 i;
 
 	venc = inst->priv;
+	venc->memory_resource_configured = false;
 
 	for (i = 0; i < ARRAY_SIZE(venc->enc); i++)
 		vpu_free_dma(&venc->enc[i]);
@@ -1048,6 +1059,7 @@ static void venc_request_mem_resource(struct vpu_inst *inst,
 		vpu_iface_config_memory_resource(inst, MEM_RES_REF, i, &venc->ref[i]);
 	for (i = 0; i < act_frame_num; i++)
 		vpu_iface_config_memory_resource(inst, MEM_RES_ACT, i, &venc->act[i]);
+	venc->memory_resource_configured = true;
 }
 
 static void venc_cleanup_frames(struct venc_t *venc)

base-commit: 5be63fc19fcaa4c236b307420483578a56986a37
-- 
2.25.1


