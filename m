Return-Path: <linux-media+bounces-18422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9945E97D6E3
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 16:28:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6B50B214F0
	for <lists+linux-media@lfdr.de>; Fri, 20 Sep 2024 14:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC62917BB3F;
	Fri, 20 Sep 2024 14:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eWXvqCMz"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2076.outbound.protection.outlook.com [40.107.241.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786F417BB21;
	Fri, 20 Sep 2024 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726842525; cv=fail; b=jDHms/3HMgc6m3U2Q9cFhK2SIYmEO7C2Di/rRqqeP+h4+AR9Q3pNHYcD+SduHSiUypMBbSSNDyXoqcau3Yc9cSEzeblmdWtbcf74b+fAp9ccEIaJnIXBPw/K/jsloDexqzv+UWW9S/yWQweCYa2RzckIWd2mtoJPm1I+9jEbkrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726842525; c=relaxed/simple;
	bh=BEzhEwcaYuT94XGR1O1Bcb5jaFstffp5XUBzQKwuUQU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=QqIJ79EACcPvUqN7ddqMS/RsbW7tJV4dv2f1J7+YceI1fpjl6i4BSGfV/WeuxjsQIOMrtO7H3NP5NDN37+EuzlVYg3T8na1WrabNGtDX1OH+00430bRzvvaM/OYnQPLdkOEjdSE84dqFVYG9rY/b9KuMEwe2Dl0vEjEQ3EEImrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eWXvqCMz; arc=fail smtp.client-ip=40.107.241.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCov+kORE3PUlnpyzMlaia1qGMsZeSDGYZ6DX8BSJex01fK9dHfp+wr5z/1nEQk7MBYP+ZWxs0SibD+LrgPlemwmSxHFyo/kLsEMP+2ekP9sw+AnT86gdYrvjLaw5jKbloNfeCcTterPGR+om3pUxC5DXXy7PfsMicr3sWkso+8YyqXnO5no82vma+J1BwEeSVGM3YLCJuDGjfFAT2Kdu8ETJF1Ul4kNfP/q1tQvjhAkwhCWK9JNpkDtA7K/js8Q3QYEpvUXO5ouayBHtqVPSoDPp961/XUdPo0l8gNVJcPjax2vu2+P/kDciZTOkpfX5NlBB69zaIYS6R0JhwX2hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xX9dJxSyQLiDKG6TW4PnAPrB1UXqr1MIkUVpD4mWJos=;
 b=apK/V08iIZrwAvQEWBVsGEwadRx029AHCD273M9Baxuomxx5Ow3N6y6icD+XPN/U1akHjprl0/EHF8nkMxqjtILLcYxrQNm/Ces3tVnaI1rO+bw3C5FCfncYq39tYVl7WPZ1Zfa3FPNiXiy/Ze/vRaO+BfndSf5F7DXXqai8ydYEJbVW0RzwWfpI6fKGdvTvDxauODpKQSRcCKmvZPwzY6I5TaF++lmgNzXIWSklEub4e111K34uQO56t5nSHXxynXHnSX+Ql1bM9iW0cRHUtlOWPDa7M6hRWri6jCeVDl1fak8sA0as54P610eypQGW+YX6Xf9iAdrRBLmr6JkOBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xX9dJxSyQLiDKG6TW4PnAPrB1UXqr1MIkUVpD4mWJos=;
 b=eWXvqCMzqBAJIe68CrHLF+zgqtStUnKDJwTjYh85Zn674DNugf1Ze0jsbMZ6C3FbZdCj1D5J0CACQdQztTXjRO7uwWXnfA2uYNcX1IzQjmci4Db1kcTuJ7dLvSIx17ngMT36j78fqgFwjsN0by51Y9zE+6saYBtzTrQ1K1Nig9SyUhlH2zuaFzy20FX/93H9FGlbwr+SRsspppgbG/tQcD989+LOs1LbP0ujBCNNvngcJaN6gS4Nmjxu2Rdh/rz2XhZehv0j2ip3vHgnsIyhVfgUC/mdVFZFDfYmgNVpeptUnJfcWNve966len7NE/TG5YlOiG9NF0FrD14jQMuQ3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by VI0PR04MB11021.eurprd04.prod.outlook.com (2603:10a6:800:26c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Fri, 20 Sep
 2024 14:28:39 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%7]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 14:28:39 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Christian Hemp <c.hemp@phytec.de>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: nxp: imx8-isi: add m2m usage_count check in streamoff
Date: Fri, 20 Sep 2024 17:27:15 +0300
Message-Id: <20240920142715.2246323-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::6) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|VI0PR04MB11021:EE_
X-MS-Office365-Filtering-Correlation-Id: 8153694e-f6ae-42aa-d66e-08dcd98084fd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?24xOsKTF+0GMH0lR72Oljn/vvTuxEHMnfwoPRHmCuzEtKD4bSi64DI8fHJmQ?=
 =?us-ascii?Q?3nStjTkLy9z4oebs2kOHuFPUGmxBdHV4Bk6jWNKFEJl7jC85REQC2pKxi6yq?=
 =?us-ascii?Q?/KX0Svfc4C9lWymxyvx6ofadr+a07O6RbCsqQZcJ4yzAFXLMxxc4En7t8Ifu?=
 =?us-ascii?Q?XkA0lT1jdwHR7EMaLgm4t933aJ1mpGQJlsYZIs4/u6+OgxenN9Z3+s6VsLSk?=
 =?us-ascii?Q?6Z7w5wSK8Ty0hDAK7EVktDIZ/Krd6dDSGF1smAZGMkASHg8b4uJHypmhUWfk?=
 =?us-ascii?Q?ziYqjHYcuvAZR/wpVoJ7k0+8RybQGvNW7OjqDv2zOGax7Trf64vqfmhNG0Na?=
 =?us-ascii?Q?xHD3jjy/YMIuOY91y6CxDnYCOzxeFxYfYlWwF37KgvxC9+H1A9Vx4HkQnUXU?=
 =?us-ascii?Q?8zhSXLxGlQa0fQMIKjd56PA9wGfLmFmhdd4+kr0QJkn0LV2+rZl/s72ajgpI?=
 =?us-ascii?Q?89uPumVXzwzCvPQMPTM3h2lGiXnTS1y2gwwUr57IfCKiFgkyfTDGWQTy0/6n?=
 =?us-ascii?Q?X7LPksJdbEPNf7E2eHrC3oIIxdY9c2CNW75nqGTVIeCpgG+uP3fWK7z4r0RW?=
 =?us-ascii?Q?qjEneCp4pcdHtBIWXytD6KQtJCWLT/oVY1yK29zfQJaTb0nrD7M+p9sD7yZH?=
 =?us-ascii?Q?pxGEsXVvRWF1rsorgVR2vzC5sNOp0sBh0M/944arHFPdJnQgemsFBhjHR0iu?=
 =?us-ascii?Q?zSkRzB+jBDPw3dM1ywUio8F+nEArtmQL5fB88GwwVwqGi2SWWTFXt7c5wnEo?=
 =?us-ascii?Q?ed2yxJwSI5u7kwku2n2Vj1uMQ7OwQh3SC2KRmcfUQai9f/A6blFUPqZ3PFkX?=
 =?us-ascii?Q?y35HKJ3Mgq/SbnPS5cJ7ZC6b25w4zjfbrZfOw23YNwl0YU4C/IE2sWQAyfyL?=
 =?us-ascii?Q?lr13ExovRN4RA1tasm2srniAjmmYcNNNAwV61GbZlufPnG4tE2LQO6LRN6KA?=
 =?us-ascii?Q?m13Kan2n5D6W4G7EmgSsDvdKEoJTaRQnQ3Go02y7KbOYmTLA1Vp/rRPOAAaC?=
 =?us-ascii?Q?Z5Cohebp2bUWUWQb41bOTWyhYtz+jXDKOvTaUQXQTyIeImIaTP8mYrx08XVx?=
 =?us-ascii?Q?/9R8+lNFvm5sC1LP51ejPiATQLjsePTe0RK1AGVHfgye5UJYGTMm1ZykYnGw?=
 =?us-ascii?Q?Rj5KPLg0KT/4n4WqwGM9nD/LyBT62Ry0mnNQcNsMtHfHcTQN31N1CFATg438?=
 =?us-ascii?Q?PXvUPNlqQjFe+03BksL7OygRl4U/jaeZIxqGatO9wVd+VdhJkxlV9c+zaaFf?=
 =?us-ascii?Q?E/6dupYLRZ6udp5QUf/eOIwRf4lIBBUxfBtEM0MLRnjMM7B3l/tFJzKn89Sz?=
 =?us-ascii?Q?luIxg+Iciucpfg5pcyRios7oHryheP9d04GW/dEUDXc7xg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?TxnKqM40xOoX5BMt+6TgZ61s8SbgXzQukwqe3f78s8pvJkmrhwpyrTRUCfEW?=
 =?us-ascii?Q?flqayti0gJxYCbnUQttckFa8ggZXSwqMhJRP71r4L9CGCXVM2DOEO2TS8lMd?=
 =?us-ascii?Q?PXVeLH36cy0M4FN1w0LuAijE+UyS6cogEewZ/e6i115Kqv2mBVDdn/gxFDs4?=
 =?us-ascii?Q?U3Pz8Dujv6wkKUCsFChTeRcnV9FnIsTd4gnlvD1GCaeffC7oZpAfNdXgQoOe?=
 =?us-ascii?Q?7o7gB59eOMO5fVJNB9O75REz/gKs9PjM0rsN+r+gkpwiEAPLib4EnrOQ4E34?=
 =?us-ascii?Q?dfxox1rD40Zto4ZhA0lVILwXUYlfwtWnrmsftw34lgLzhxB77ssaop7gmmS7?=
 =?us-ascii?Q?PtLfYDKSPGxemZGRKpuxeTRfm++4bpAZaE2lJPmpDWs36/qYmF5UI0pJovTx?=
 =?us-ascii?Q?kV8deQvBDF1zKDjkNYgJZNOZLd2fWktcPdOpmdjj48EqvYaJvp5A2NdzYdvt?=
 =?us-ascii?Q?z+jeQ31NCwYkR/ursGDnaB0nZp5q093xrL/zW9rejRkk87cz1jrfAJIRLgEE?=
 =?us-ascii?Q?ed2uWW6HT1k2iBT6bYHePb7odVFGqu3jpi6p14+DLoSvX6fu0kJcBhieZHpv?=
 =?us-ascii?Q?3/Ee8XIqxov/P7/GpmPVvVPIXS5G5YK9E37FIhpIuv0Y27ilEcxgr3bhDjSn?=
 =?us-ascii?Q?9o3GEoFkY9umAxe3/8QZ7fKc7r1RzLr4vhJ3wUwt7+PuYRjG/kT45anI4nvJ?=
 =?us-ascii?Q?TvjsTgI4mtYc22YD3YTRc+MOUAq6GE2xKEfdcoBVsjNto6ppFqZyMeYUPYh0?=
 =?us-ascii?Q?ECznN1ZWz9D9Y2UgOS/wo1EUJg8eBpu3cNhdrJ0zSAXj+DZ1Gjg1ji0LFtxq?=
 =?us-ascii?Q?qdtWw072E3gLGRSLgJ6xBFsokW4DIglUeTT/YmgLSVEHJDVnxt4STFImZr53?=
 =?us-ascii?Q?GYhmcmAZcfrPG80o7rW94TfMsjM8BSuopppAf5tTzWYXZcdYURjR410boR4w?=
 =?us-ascii?Q?y+iyNTQcGTlZZwTN4eJkhxTSCdcfOiaiwm6wzJaRG7GjG76z5pOXW5uV9eDk?=
 =?us-ascii?Q?OJEBDXuk0e7S6mW97vZeuqc9z2xz0Q6tI5F6xVtanITGx5dEhwAIxK6zkjFK?=
 =?us-ascii?Q?BpEQQXRPTS9yvQq4p6kKd5RcrN5Qwvm9EB/94Vm71q2vN+e3RG2f7eT9bqrk?=
 =?us-ascii?Q?xd7YnaRCUknAHhdYcVAnAMrG8gNH7ULPv4yegwNCo7Wed3XEmxnRj0AL5nJw?=
 =?us-ascii?Q?Ll70HAvZaRrFj9247bNZgde8rbxqBBmjhVeuuLdoG1QKkZQoIRVzddqOPixD?=
 =?us-ascii?Q?9jp61uqd4QVKKw2Knao3gb/75uDYl41ndRL/tZtMMCDYV3M+r4yBvQJAh/zm?=
 =?us-ascii?Q?rTiNkCwgSKsFDcAebDzX1hzTysKY8GojTuKWwHWgZv9ZUFE8RPKWqzNJD+L2?=
 =?us-ascii?Q?JqCA05hUBcZDp0vuPRK2eZX8eA+0lsHskuhplDgq8Y7DtxkYf7LQS3OLXHzr?=
 =?us-ascii?Q?PBadJSV/A0+EOrdLvd4e5ralMv87NtVAEhE+WUUsUirHoSSE0bAX1zZqy6sB?=
 =?us-ascii?Q?d18VYujnI/smnbmoUVuH+NQPkxiNzg7DWGaI4LAljDQhzUpAb7kIcuaZYmAI?=
 =?us-ascii?Q?3ynTWpsGDWlks1ge9QAB/ojJP9EXj+qgzXZOxQgGRGwzkxJyF0y2wm59qRpj?=
 =?us-ascii?Q?Uw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8153694e-f6ae-42aa-d66e-08dcd98084fd
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 14:28:39.2725
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szBGtCqZ2wzFm1TzdaINaFNWHeHipjElsqGN+tGoa/Kso+dnjRxh9sxBCT7ygC3eMbFd0fIeBZsLC1jVjGsm7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11021

Currently, if streamon/streamoff calls are imbalanced we can end up
with a negative ISI m2m usage_count. When that happens, the next
streamon call will not enable the ISI m2m channel.

So, instead of throwing a warning in streamoff when usage_count drops
below 0, just make sure we don't get there.

Fixes: cf21f328fcafac ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index 9745d6219a166..b71195a3ba256 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -575,6 +575,9 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
 
 	mutex_lock(&m2m->lock);
 
+	if (m2m->usage_count == 0)
+		goto unlock;
+
 	/*
 	 * If the last context is this one, reset it to make sure the device
 	 * will be reconfigured when streaming is restarted.
@@ -594,8 +597,7 @@ static int mxc_isi_m2m_streamoff(struct file *file, void *fh,
 		mxc_isi_channel_release(m2m->pipe);
 	}
 
-	WARN_ON(m2m->usage_count < 0);
-
+unlock:
 	mutex_unlock(&m2m->lock);
 
 	return 0;
-- 
2.34.1


