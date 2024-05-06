Return-Path: <linux-media+bounces-10841-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 022988BCA02
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 10:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 820712836E4
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 08:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EE2A142624;
	Mon,  6 May 2024 08:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="aXVQ41h1"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2061.outbound.protection.outlook.com [40.107.6.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B7C1420D4;
	Mon,  6 May 2024 08:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.6.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714985399; cv=fail; b=o/wf8y6I1cQsMLL/UXdOndzC4Py0dx5PmeTV5S/zpaVFfXg9VKLQwLaCbuT8bT0gv8lSWVGxw4JxFDJTkcd8vjhvAMF17ubwz5gEswY0sh7SB9GUMwliGw241JQ5l2xH0NcaAsvwZpQoVtIpB32YnStA1/WLiR7nYuEDQpnL3tU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714985399; c=relaxed/simple;
	bh=7o5LklYkNT4DDbw7IMxikm22P0938dZhqSk4MlnLvno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FedILeRxLawtq8AC+V8IQixmoDwPXUSaCEUNgCgnzghCMqnikDIOmboZXNBtgEyFOg+ZdhPRIsFDbCGW7LUymaj2X5bwrdlgUGyoFaqkVVeNXmh2Aq9Is/szP5BWtp8ti943cFB53ng7SDBWCyAdutBC0hfBoCAJOuirKNLuyoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=aXVQ41h1; arc=fail smtp.client-ip=40.107.6.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iezDbPtP8WNYJKsa6tJzEzGbWNZ9RQjFJTBsN2pOgzGKxo94wCaQKVhobqeyfhKb4Mys/1fx0mvTvpZvgekePFwsHJfnZc3YpgY7cjIIHqp3+zqXiLXnWwdXXEUnQBb2I3OZ6USzi6/KZy6nUVUifld/ktTF8LGK5Z3/Zp5c6IcSBrNdM47vzyJTPseyiDGm0TdroI4hkCNVy6evbzeeJ5BNjyuvXNv9YHx20CRlNmRj1J8V7zZDIAKKSlXqPkzDaZL5bcohwUxiOt07kyJEmQUaBgCaWp+fg8B52tZix5OuL44e5wt5x+QdwdpFfs3Y+pycM/e5vqtrWgWuWNfuBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9YfFe3rFeY2EoSGpF23QQWQydVBAsyfl7fdO+m0dyU=;
 b=b8KuG8n59+loPrpQ4UuPbAqqWhiXPDuLgiWSUX7q8MLj0lSaYJmRi6Nad/ztg+IxkpIqO30qJXCy5fo2z1ykAsKxZ9b7jxCeO6ER9R5S9KEs9Q833TWawgLlaIayTColnNZWHIQJ57pUjtp8Jg+vXVunmIqpExgCYp4e+px1CqBAv092oMj/kCnmHH+7/SLFuM01nLXUfpbJlVDKMqHAWiJsIluAb40jWDrZvvevWd2Q2mMdgRQxkZpucYLtfoPlfIuhFiWSyfRC1wjMB0MDnG9BIEg5Jj9B4Q3QdXnJzTZWtC7WWWeHa1lAy0LpwTy5neWGJzSnAvJCmX8Jk6ezEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9YfFe3rFeY2EoSGpF23QQWQydVBAsyfl7fdO+m0dyU=;
 b=aXVQ41h1+IOgo1nOy/UNJHRbhHABSL5z0eOMMG+3t6sxd3r9VDNI4NiMnzYCORIXxXryTjVib2GLbk36DO8IOa/z6towtHfCMp3YruiFdr+XwduCXISUiS7h3C7HFzRE2spQQJtIVK3rTwJJRQaKSHF+tZnJqySfkUJyZUg9gOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AM8PR04MB7812.eurprd04.prod.outlook.com (2603:10a6:20b:245::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 08:49:54 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::8589:eb00:ecf3:b4ca]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::8589:eb00:ecf3:b4ca%6]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 08:49:54 +0000
From: Ming Qian <ming.qian@nxp.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
	robh+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@oss.nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/3] media: amphion: Remove lock in s_ctrl callback
Date: Mon,  6 May 2024 17:49:17 +0900
Message-ID: <20240506084918.799544-2-ming.qian@nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20240506084918.799544-1-ming.qian@nxp.com>
References: <20240506084918.799544-1-ming.qian@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0178.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::34) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AM8PR04MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: 690063c6-884d-463c-a301-08dc6da97f9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|1800799015|7416005|376005|52116005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ksdd0OiTYRSmozho9ZndmnEQ62evfmTT09hsuSlRlNZzjh3UcVjuhN+Ihftv?=
 =?us-ascii?Q?vaGZDB63bLCH6wDYqWQ5ff0sAThd1d/b0ZWuRZJajGNLkcB/onjH7X3M/J78?=
 =?us-ascii?Q?K3R2xIbA/Shg3tXgkdO57SkvRVfHClay3M7/0FzAJd2T/UVXgpibU5J0wRuv?=
 =?us-ascii?Q?6ouXhRECh/hpvyBVd+D+rYp33EJSK1+oJ9MbNHRJ8x0HebHJakcAlFmwTQqN?=
 =?us-ascii?Q?+guAfhU55m79gvViYCT+jvBOXUoGu/KY/45xKUTSxPBuQoFPrq7ETDM+uu9L?=
 =?us-ascii?Q?K1UndtLBRE5xSYqsxZLqbfpiAh8mO0gNXuHkgytGheNinDHGXEWir26JHRNq?=
 =?us-ascii?Q?ZOcpbqIEAGzWTMazn1YqhPXu9rzRZLjtJ5ut/00GgCtnZO3bi4c6247CWCmp?=
 =?us-ascii?Q?82VxXrvIc9XmQxTjJ/j4h2/PqA9EJiUQhyWu2+A56tsEoWfSBhOrgMzc8O/u?=
 =?us-ascii?Q?E8qkp0aZg78B+v6Hon1Vw7fI7kb+w2dldjCdfKDr8wOazSCIJTDickDNU0Hi?=
 =?us-ascii?Q?et+IuQP+CWl3nS5fnH2CPOIA2mQfPcrkWEdY2xLMjC+IKJ9jnuEaij6QntoF?=
 =?us-ascii?Q?n4V31JhnJAb7e1Tj/EoGKtKNoyhl43xc6ibVaZb9bdz6Q0LtLgYDBSbBlObf?=
 =?us-ascii?Q?f/0RQbJifqonoi7JOShksuwlkp4lUtl1rutik7W+Y1d0HTId3iFkxHwZl1FR?=
 =?us-ascii?Q?ZifiY6/dclegrGMU4JS33CLnu9fvrDg1Q99OFkIMQLh5c+ICYhsj3F5+rG4b?=
 =?us-ascii?Q?HNjRB2PvV3L25QDwOBFT5F0qBTaBj0KIdecs2tiwbBJS01apmtVD0Mrk3fz/?=
 =?us-ascii?Q?XE79DqjOd2/+fnlylB8CXGY8nDKe4k46ERoPj1xR5B1pnf3AVYTpcFChglic?=
 =?us-ascii?Q?juC3vXtgRMngx9DDlu4D7AT8Oj5pXJWLgi+PwUSL5PVtHepeZ8SHA+WzRa8x?=
 =?us-ascii?Q?g1emxRoWl/tVREqI5R02FWQiryHTgg+ESDNsu1B0tV8WWBAOjevjPJ4uDpYi?=
 =?us-ascii?Q?I6RAawlkE5TvE4INYyyce+idzqiXwssjE8686lZl9eFeQ13tlX2pDcB6Qtii?=
 =?us-ascii?Q?Apmm2+1bJcfrR9Yp2nIUmeJhN+2is3PjU7+YBodj3DJixh2ztAmF65HaPmcO?=
 =?us-ascii?Q?tsPIdsOYNv9RmPvWPUeAVtuV9Rpa0xtlqSBdLWS4W8wDjVXDAOxqUuZBcGg5?=
 =?us-ascii?Q?8hUvQKFERkq8iWrGJlHB2BqDTjyVX5eP/nZna5MziZeXEUt2i4kIH2OaEl5m?=
 =?us-ascii?Q?FoeS/zIqlXZeSVq3nf1am0GRbj8JhLVxDDrMaWifLg4h99OSBabNe0Qkxv3l?=
 =?us-ascii?Q?1GG8vx8RQ1aQROEkwIHycIx0ULeSBcpz4qlv2NqZydTDKg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(7416005)(376005)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C0I4oeI6xD9xQpi39ORammHOqoftGzNgyGAfhVAVOiVAnmWTHw3LtEuREG41?=
 =?us-ascii?Q?l3DX3ElY0yZ4cbq9U5MvApxxLmV+xWE+c/cKaMLp8stDAHshnrVZ8EOztgrL?=
 =?us-ascii?Q?p2t4wbq1G3+sXYHGyZXjaNS2X/mK519CX6VBV1rIpldLzI22DJcA39O46Qdf?=
 =?us-ascii?Q?rWDeYgNqPC7PjhyeqzEabM3RSx+4jNro3Jnft8D/Eg1jn7jN4eGr1Uv9bh5l?=
 =?us-ascii?Q?muU3XAEwWfJNBcQlbDj1nyWqmjC4aSagcm9PrR735dUYw8T3zEzLuAZl9reK?=
 =?us-ascii?Q?20RMDnzr8L/VqXadEv44Z3igTdd00mqriYC9xtjrC6qsiNGKm0uBt1fVXfa5?=
 =?us-ascii?Q?rYcHm4dXhz3A3KMtcdpeRx90qDlOvUJp93zb+dghxv3DuiDAU8jmKFBD7o9u?=
 =?us-ascii?Q?ceLGhI/4jWER9kcwQsFfA2g9X1VSzYMXGHYm8PUKHXBDJPwnXYG7oHJk6rFM?=
 =?us-ascii?Q?1Cxa5/4qttLTuDU0HvCIHVX2XoOPZunvKj+AOqfJVJRBYtDdiG2Gw7QCdSIh?=
 =?us-ascii?Q?/rEo3b9HfIu7XA7YRNJ4QpyHJNSa5u2VbU1J0q74BGvzVxSrq0qvlLFZwPq8?=
 =?us-ascii?Q?rVAlyY5P2foV/3tQoOM3zxvctaMzCcCbZP5aRLnAlz0B+cpaQBagesHevq0K?=
 =?us-ascii?Q?QXY/DMEMMAE6YnsRXb3+e37Oa9OTSoxJAijGtCnQ2hk9VtdsLMPWl9iwLdMK?=
 =?us-ascii?Q?gwSY6cjp49WarBaeMf+qDRHILgb5ZuwEH+A/1RFyrMEeXpHVJHHvpIs1BIpf?=
 =?us-ascii?Q?V/HPd8KGNaO8OT2mzxppQLaJHSRrbPil/HaV8XSpHtn9uNYrr5ckYI+yIf7W?=
 =?us-ascii?Q?Tb9lEjcODiDmaOq4t7qJ6rAKd8b+kl2lhRc/4rOCUz2rmrzqceBFGrIvajCy?=
 =?us-ascii?Q?/Ux8apBZDY7XeNOY0GktNi6MgoJh0ipiSBqSbA9Cdc5Ph8V6JMNXWNB9tD5L?=
 =?us-ascii?Q?ObB7OHgiGhrXbkhQ0q0X6UEJVaqVDucMRcSaAujXROrE08zco085Y3r+tkGO?=
 =?us-ascii?Q?7lKGPyraFpDQxciq6DqWUAKGaMqdhTBz0/rDEhv1kF4AlqWv/TTmhI/30l40?=
 =?us-ascii?Q?CN/3oj/+RLuxKm5yAm32gbEtbnoanF3MFyGHLh9Fn/BCU6L4TAdw2nBwtVbV?=
 =?us-ascii?Q?oZuMg6E7kE6g+gPCs7EHF4qtTVnXuqC2V3VbZ6FilTr2xhBX+8Jy7fCmJiRR?=
 =?us-ascii?Q?1B8yF8zA+NO/kT3focdc+9pW15zNppLTnCMFG1rwzvr5oENFdF+LnD+MFOIE?=
 =?us-ascii?Q?oW8YIYCmNajUFbSH2GcyIdRULc0j7BLf/Qy76GIgyntbZDIygR4kIlBaENQU?=
 =?us-ascii?Q?QE58jV5DSpv2ZkLpXXijjuDElYWwvTR3WG05t3w7Nr2AArUcmNg047yXoft5?=
 =?us-ascii?Q?xmcGIjVjNKIAnlMLiWBZfFC0YmSUMbsf1pQER6ELX2kI38Oc+G4NWy6sxaFy?=
 =?us-ascii?Q?eVhV0SdP8Cp/vez4zyhIFdQp1qDk6vQ2/G/S7+aPGZ6nhDkY00j14QrUfYK1?=
 =?us-ascii?Q?WZFBiXtn4SEq5VAKcryxkcBSh65EfW9shxN8fOysg7unvx3qoCdFeusBaUeL?=
 =?us-ascii?Q?A5Pkh1jzmbiUiUQ9X4+qS1IJT42LunAYRHSk2ViR?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 690063c6-884d-463c-a301-08dc6da97f9e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 08:49:54.0846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jflz+0+tGm1mbSDv12wxwrzU/afIrD4V0+eOAtZzwCpi+DvvF0aUpoci2jsNGh9mH3bza1fnY6AXQCy5+4LdoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7812

There is no need to add lock in s_ctrl callback, it has been
synchronized by the ctrl_handler's lock, otherwise it may led to
deadlock if driver call v4l2_ctrl_s_ctrl().

Signed-off-by: Ming Qian <ming.qian@nxp.com>
---
v3
- move this patch from 3/3 to 2/3 to avoid confusion

 drivers/media/platform/amphion/vdec.c | 2 --
 drivers/media/platform/amphion/venc.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index a57f9f4f3b87..6a38a0fa0e2d 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -195,7 +195,6 @@ static int vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct vdec_t *vdec = inst->priv;
 	int ret = 0;
 
-	vpu_inst_lock(inst);
 	switch (ctrl->id) {
 	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:
 		vdec->params.display_delay_enable = ctrl->val;
@@ -207,7 +206,6 @@ static int vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = -EINVAL;
 		break;
 	}
-	vpu_inst_unlock(inst);
 
 	return ret;
 }
diff --git a/drivers/media/platform/amphion/venc.c b/drivers/media/platform/amphion/venc.c
index 4eb57d793a9c..16ed4d21519c 100644
--- a/drivers/media/platform/amphion/venc.c
+++ b/drivers/media/platform/amphion/venc.c
@@ -518,7 +518,6 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct venc_t *venc = inst->priv;
 	int ret = 0;
 
-	vpu_inst_lock(inst);
 	switch (ctrl->id) {
 	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
 		venc->params.profile = ctrl->val;
@@ -579,7 +578,6 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		ret = -EINVAL;
 		break;
 	}
-	vpu_inst_unlock(inst);
 
 	return ret;
 }
-- 
2.43.0-rc1


