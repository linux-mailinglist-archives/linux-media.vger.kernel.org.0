Return-Path: <linux-media+bounces-30533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 911D0A934EE
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 10:55:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A1A219E60D7
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 08:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 758E8270EAC;
	Fri, 18 Apr 2025 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rcAF4KVy"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2049.outbound.protection.outlook.com [40.107.105.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30C426B2BF;
	Fri, 18 Apr 2025 08:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744966518; cv=fail; b=V/KfwNkLfbuOmmv81W0PQ0GRsWcbAaI7/ODecosJAnZrlfZ7RexYYXmpIu6vYglTI/T3nC+wihw6nO5jYLANgGICmTLKAnYZlS6YYXxLSeCz3A931NqSdc4P42/Q5VeOwi0XFxOf34BgHCKQW/zwP95Ji+GgIoEvWMwfTE7Hi8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744966518; c=relaxed/simple;
	bh=Du/ZEy1xzyN+kAuJxgErVYK23LVjJkUcbw1cPp1bpME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ejc5uBLNCCYYcjD4PIMonGIzcHyVTZ1rZsEE9maMSV39YZ5TzU0ISKpfTSfADDjUeL7KPKwHCtdH8s3aIHDu21oaHNr2/fLxZopHGRMzTkFunV7TdAtSCLHvMlk49Pg22yQl5HuyliO637JyeWx0V99cBTxQKobBHcYyUjxFrQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rcAF4KVy; arc=fail smtp.client-ip=40.107.105.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btmfuVCKKtRntykH4xrfSRIzr1pPxQNiEx0FEuqgLzQ+53yvx2/1J+bkU1+LvbqcObeXzDP9j5YBVF0CZ+SHhSstL/e3MjVYi61yN5exp+JfNAwiRj5KNS/+fgdj9ROE7y7sjj46FbAM6OlYnPMSEruIwv75OXMbeUKDU4Pt1cArBczYv2OzF2/LNXp9zjK1c6YR15w13DCpRcX3I9L/nLoB31d8oYi8jUWwI85rV2h3VC2HSC+8AGTRXd0GDu9JxBdUVBmkh9DyrE8dEiwHZZM8up83tUgmFeJ8ZykbqWI8IGOy2jhcvxbKzpRiMcv9dqBVzts0Lq4YDs6gxu/Wvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIQSkq+wDta2lUmn0nqSCSFiu7vaB1pMOxPo4BOLauQ=;
 b=ipUsIbnH1lBw9N5w/gED5VtjRAY0f0qPhuW982qTDWaZmZyQzYF3Jq5Aelt/BTe4HgoiDMxqHdg8tgq+E8e2p1jaUNL35SzjTnIWvqLf5QyOORuTBf1TAfCVSONKmZQ3ra6cYuvjeCJ1p0INckJ0n44+0gFQOLWgXRefdVMCO/Qp777xcsIc4QHj1r+XrnGxtbcGalux96hC2d69LtF3O+4ltOGJRQGS2KHXaaVSSOkkj+hEWllTLh89L6NEDFwIgxK8Aed1kd0DWZXdA03fkSOkFBshuOGSPX+4uczRzDWT7EfIPBfIqSfKLUejLBy95wLx+lKri9qckZktbwovzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIQSkq+wDta2lUmn0nqSCSFiu7vaB1pMOxPo4BOLauQ=;
 b=rcAF4KVyd1awYN92oNVM/1fYMhMyurWgvPzpZL6+4lqxUoKm14NMeQfV4q+ozvsNbXlz7Yr09UuugJLtA9wu00MfdzV56K8az04FQDNQBP1cVQjr6vsap97j/9CGF1SchgRuDxxQFQbGq58Ss/XHOjN7qK6r7m1uFaU9tnaXFxfLSWxCPIWSQDarQkHiS11peZTr/P0Zwu607ZJ2m39Rrtpwcs4nO+c30v4cuW1g6lOLPue7Eo0CWODwNBxNZLlb9cW21CJaO+XYYeSsXJ70b3vmq+BcpLUCHKzeEVeGXc+EMseAwNeJrxzJgVc2bMxf/9rG5bGbbBbOhY1w6jHFTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI0PR04MB10638.eurprd04.prod.outlook.com (2603:10a6:800:268::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 08:55:13 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 08:55:13 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/4] media: amphion: Clear last_buffer_dequeued flag for DEC_CMD_START
Date: Fri, 18 Apr 2025 16:54:18 +0800
Message-ID: <20250418085422.193-3-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250418085422.193-1-ming.qian@oss.nxp.com>
References: <20250418085422.193-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0130.apcprd03.prod.outlook.com
 (2603:1096:4:91::34) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI0PR04MB10638:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ccb4815-0f74-45c2-3034-08dd7e56bae3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Srd9ywzGX+mO+oXr9trvg0pz4pd0Q/cNWuB6xy2KBdoNpclctN2L+IU7T2kc?=
 =?us-ascii?Q?ATGhY2Jkf8uwKspH/AKWoQjN6wRhD9mCNTUlK5kaibWKQW1Be0JLZJV69VWP?=
 =?us-ascii?Q?iH++RLm+6Iuc3KKVQe/TjmzBPdEPGxow2GySssq9rUuSy1Guq14zly1S2qZA?=
 =?us-ascii?Q?I3TDIzD1PhHKW/56pNF5Z7OB4olkDdgXUQaq9bgx9JgJjQdWutawJg2EG2Ho?=
 =?us-ascii?Q?kCWZyR51iIZWdZS1IGdg6TfrY3lSNy34wUeOE5RxNkjdT+rXXulaba3J8keI?=
 =?us-ascii?Q?em8BR0OsO+3I8R8NyA0NItm7lCAM1xxnhxAIGzqVoTf97Sh4SaoMBE2zNr5A?=
 =?us-ascii?Q?fgv4g5CWxtGrzq3X9TiLphH9JMpYti/jdprvUdJGYHZCuQYsu51VawXPwdUz?=
 =?us-ascii?Q?YZSKnybVyCLHBuYGBUic2AcnOIbU9EgqWMqE5hBMWT4Yvw1gi6L/uaLatS6C?=
 =?us-ascii?Q?1+oYiMuOdvO/ux8b/VJxQxT0ydkaKpYO0rBIrwvPfm28hIwd4uwIVugbX38D?=
 =?us-ascii?Q?lLsgVLolkb29MYcD/AbKtDXNiZNj0bP8MvWE61od6/f9dwcgEsO9rYqxcQTD?=
 =?us-ascii?Q?NGwWrG6JNxhaF5pAIIOjRzfYrDs/AqKwHT87DnZOTFrDL/UAqmYroaGbKnAW?=
 =?us-ascii?Q?bfryokba4akf/ZvuNFkQN9h5GISps/mxJ2vRVNoqMdOg0DJh21173Zsu472i?=
 =?us-ascii?Q?MeGhSHVXKsFtFndeaApraALI26gGiPy6X+qf+R+sLA4U0wLQkPHvJLDuENtz?=
 =?us-ascii?Q?91Sc6ZKWslZLQ6Fog8iYAv1l7TjD8ZRAnl5bpF6rBk2d+rN8mxGYFfP30Z2c?=
 =?us-ascii?Q?TqucKdFnLY7GpidK6i/+cYJeUe8838W5CiRFVkQhulCKHDKOmofrA5efrUJ+?=
 =?us-ascii?Q?DBPPudNobERRvDeaw7sHIUqotdsMl0eLzhMby601HBgEjQY0TGRM0V4z0kKF?=
 =?us-ascii?Q?1nBrTBD+F6qNF+2zZNSMXdh8i9NM7e/FOhS5+NmB/dWOtidGrE7xV7V1dXLS?=
 =?us-ascii?Q?rvVeCOshE5IJLuyJSQdnw1SwTDZugfGwax21ByepPtqwTkQoezkSdn4HrYSF?=
 =?us-ascii?Q?jhviqeNPRLuxxW082NDjFdnfLIAcLONjFvCq7fnWYS5xU9zstTUkLxqKJqjO?=
 =?us-ascii?Q?SGq4Wqwgj+95bXGIHpEzC6X2ey4zYgAgpXmYETAizXVm83cbP1ECFPvdCVdG?=
 =?us-ascii?Q?Mk/+YCZi2uehVUU8Zekm4ESzLGBLsZN3xDiXWJGiCI2lUz44cD5lr4xvbetC?=
 =?us-ascii?Q?d5s6feN6JHLwjBj/NDEhZi1DtNUzj8eNzShGQuQFLoylOv1R/oLGFC5cRvGW?=
 =?us-ascii?Q?WytmF+Ik3wQ7GALFXV0ADvq8/zsqC+c1rIdfvd3pMRFFCedvneJDpzayHIFW?=
 =?us-ascii?Q?drMotoR/dRNtjCzEWXN5kAH1raPEvUWiiqJYmdNYK+Aoc5VlsyPZvrgBLZb5?=
 =?us-ascii?Q?uFzCAiR6p9k0Qw5IpObzDMMgfPpz1WhcKVh4pi1Xj5rQ1l6tdL+OWBN8AE/c?=
 =?us-ascii?Q?Cru31Y5EuQCSmcM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7xVc+UOzxoRe5vJ0d+MtfGhKtnyWc0dppT0w+YSdE+9XrJBHHmfCbWnNy4pO?=
 =?us-ascii?Q?kMiP7BR/wjlaO/mcRGvMwH9H0Xi/rgbsrzzM3gT07sn7XSqz1QUMFWU7U6Ki?=
 =?us-ascii?Q?Lg2c06sZhn+ZgYeGg9qNX2C1llnn5aXfzwNj3scJw1J1EWs/XJ43bqugtxBL?=
 =?us-ascii?Q?Z50O5xPc77hEChU7QJtdfDtAU2q0aAtM7O13aVTiBtM8rTuai1wLxDX/bSxE?=
 =?us-ascii?Q?CXnYq6uXCA5YsfvPY0o/c7hRCGHtGc+risHETkxM5AvmQTy8noRI0ZzokGaV?=
 =?us-ascii?Q?psSfrW4JQSpLlsgqZ8a3rR4VIZ7PY28tS+g4T+/z0JKckM+hVS9HnoFxKaG3?=
 =?us-ascii?Q?P+oo5ZNQh+yxTjQo6BcvW2FRXGCMZ5XYjuZrK8vg1odQ8g+794rhdaTl4IDg?=
 =?us-ascii?Q?qj9i4hZUCpYj7m/qZ2hW0wLDBevwWFEOmZhH1emIyZNFN/ou7pzwuySU0fA6?=
 =?us-ascii?Q?BAT627HMru2zEZxKXMfzNhPiRsUuHGIHU0ZgnPeVi19WZRy/vZUOtrLsyO8y?=
 =?us-ascii?Q?kdNJN4eorZDNLxhbOYJ0/ura4ytvJNx+BrVS5427X/U5B4D4c8Wca3wmDMVK?=
 =?us-ascii?Q?m6dN2/wUTSkgJrYaFHcMdcSEMQOoA4UepNbcYynRZBc+Bt4Lu1Bu5OQF8uwg?=
 =?us-ascii?Q?vA59Cv4iXb3O2S3xr6j599pKVwxNGzzdBHzi1V74dHsOwTQbSDkGVUWsJMk9?=
 =?us-ascii?Q?tcchNtQMzF1L5M3u8dxkVuW2wkesipIjHjWO1sj6GATJyTY5Jlm+iUfnjryR?=
 =?us-ascii?Q?7i6mpMEE5Fam8B07jCf6V1X9VJDK8lkq4KTB6sRhh8tSJgGokGlv2deDGLVV?=
 =?us-ascii?Q?k6XBSbFSf8//twl12sRVl3KAiYnDHZhraB5XNQ3Ttsg/hNcQhuawVj+i59uu?=
 =?us-ascii?Q?pqAp5gY/HpTt/vduJs6mmqrZiMnNMVuseIMAz77ROPizKHq8lin9znvWE//C?=
 =?us-ascii?Q?jGG7hGlpIwI4jqiVvCbFgATBEkFEds15IwHyLZl6PCu4Os28TdsTM3vtTb8t?=
 =?us-ascii?Q?IIyaXEruqPf17nlnTaeWMgKTO0Dkc94hVEdsOzXR+5UdqzpOyeV578PIz8pg?=
 =?us-ascii?Q?P03bMQt7vja4gnn7Chzbrtb9sQZKcsSn56q2req6dK0gnZ20N44BdpICsPgS?=
 =?us-ascii?Q?GbJl4FCifWTN3sMqnJohui6pnDUC9HICfSIeT6YrJtBx8cO6nQCrB/YI3zNK?=
 =?us-ascii?Q?uCNnCvPwKrums6ze4wfzEp7ImuhD80Y2O15S+bWZGXtafZac8O462//k/mZA?=
 =?us-ascii?Q?KkwPngXgeKr0aDirTjRyCewhKjN8VRpoON5LH1wrCM1ND5+9koi2980mm3be?=
 =?us-ascii?Q?pWoEpsHUbZTEI+ACmKpZfvzPynOccEmHTd9pvFXXpMhghe7OuZdslEmKZd3G?=
 =?us-ascii?Q?f8LvIZnFV7nRgUQGog0SvnUOCBOs5KrISylAOIjsEmywMUpLIYOpO9zDTsVB?=
 =?us-ascii?Q?K7nkj1O/61rdRsTT8HqXFm9ZJPPNINUoaY+2g4QikmId8oEjua40UYHiaZjv?=
 =?us-ascii?Q?iafA0lbMv3ZPMwH5HM/r68a6fmYrFDNfpWmmNkErFQdh6cGonrbP5x4V47YV?=
 =?us-ascii?Q?VYtC29IpLlv1XVg1miI6C9nSZMXCyNaHLbk1BoEN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ccb4815-0f74-45c2-3034-08dd7e56bae3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 08:55:13.3406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KGiCOcFb198UTkwdkWqlA269rklYlCjCNwmwMDONPZZFNOpIhXYlRy704bQK0ql9oAWmVW+2BLOan0t6BEdfjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10638

From: Ming Qian <ming.qian@oss.nxp.com>

The V4L2_DEC_CMD_START command may be used to handle the dynamic source
change, which will triggers an implicit decoder drain.
The last_buffer_dequeued flag is set in the implicit decoder drain,
so driver need to clear it to continue the following decoding flow.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vdec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index d812b86f001e..ee0a7572ed15 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -728,6 +728,7 @@ static int vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd
 	switch (cmd->cmd) {
 	case V4L2_DEC_CMD_START:
 		vdec_cmd_start(inst);
+		vb2_clear_last_buffer_dequeued(v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx));
 		break;
 	case V4L2_DEC_CMD_STOP:
 		vdec_cmd_stop(inst);
-- 
2.43.0-rc1


