Return-Path: <linux-media+bounces-28234-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D2EA61467
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 16:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A1031B627F0
	for <lists+linux-media@lfdr.de>; Fri, 14 Mar 2025 15:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83A120127D;
	Fri, 14 Mar 2025 15:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="VDHb5qu3"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2086.outbound.protection.outlook.com [40.107.21.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB5D3B7A8;
	Fri, 14 Mar 2025 15:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741964485; cv=fail; b=dsU/vpLB4WV66e1WQYD+O70hH8R54QeP00k0j+1dbxgH+jMxghVHW0hS6RHSWpzfS/zgODs/aV5n4z09poqwAVUursUfxAxmX/8utemRntYQtkbyl9LcQMA2XfPX8GB27ExDwL6RKElq3TV2KmvNLpKfU3oMSItS1tWLbc1YaA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741964485; c=relaxed/simple;
	bh=6imy0pr1kmwdGeAcbkCl0IJXwM4Cih9GVnAoBd6d/Cs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=nfsSvJiR5BMCnaZspUdK5kvw36aqIYs6PkmyWC0d5DugoVtJDBnPWEzTXWdYCuPyDyOQSzr6I9RPAg1YAyxONyGadeRghTT7BreqzWKztxdETzXiWyhGjnD0FK1vlxywyGNj4d3kERuXlTMVeiCqFQ7yWgKxpEy6HLc3jLVvyeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=VDHb5qu3; arc=fail smtp.client-ip=40.107.21.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amv1sLljFbPhL31FsFmZ5TRnejkzQbyJLDr3Iux3Xox7uCQHOYIwSDaa0rRBo8RS4sRvd2cWTqSHEGak8jyyiMdxkMTcqV+3rSLObBddUMDU381Mis/P7T5EcnzBzGWfu9BFykBEhLhKI9r/wPA65Nv+6kH+KdqSgPjLT6Ra/Y5F7IF5U2BDZo585zykV1Ik2433VSah79qbe8lnJRuoSP02OafvshmI0PAr3bzJEGOopo8XUqK6zVWgMQJwc7G9MwQ2SEfUMS/5E1qyAA3GV2TPM4GtzWrXDo+zXoGICdhjfJ28JCPHhPebcMjYL/Dw7uzt4yhlpPXEa7w5hzXtIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=puW2EnqaYvXn7xdz7hgrFsiWv497WSZyjCAHgnWO6x0=;
 b=FufATDEsXHpvmitpAVfhwecCkE6YX9GDm7A/FRTIYe9RV1C25AgGK1KGXma9FetjeSX/fi2Ah0svKpVGzeq/Fq/kNd90taJVR5dl+s4UpZ6S1WPFkY/rBKysAArgLP1PXsfgpPKdHLYeqYvw/nw6K6zU7JhNpNg5Cg3TxKQk7tho9UZbozZcNZgDPbmG0nOm+qjcdkeaYbLxmnnF6sgOuu6aEylL/7dYQ8WcVEXhm4KnYhEn7ABfD051A2m+6RzR4aupUCjYR3SuMh3zJ8TN5XA/Pa79be9fbQVRr6TZ083xegMOmSbsAVnMdU2zvRvHHSzbe2ogZB7m0ZyKBuPgmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puW2EnqaYvXn7xdz7hgrFsiWv497WSZyjCAHgnWO6x0=;
 b=VDHb5qu3te/QPpvXXh61FtuGhGtXacKc2CxEpasML5QJovMbTZtGZhjnUEJkbQ511qGFWDYj5TyjnDtpf6P7WIgnSgcnPVDWlWKbuLWppaVIuBDCHN+njSyCRH6m97SLuT1IIcv1yEMTfCenniNlx+hWxxt3GnnnMWoUIjFHVR/4luW0nqhdJaCVqkkIssNawHiYKE8xizjB/proS2Kcxx2alJpviH9kJiMwa60VlLleOndz9AjG9x43V1kMWsunUCYH5Zlbma5P4O9TKGOg+5FSjqXI/wqoS6wKwJ3oDkYEyrkXrtvTiEZ834Yar6j5X8QZFgjsCjYzktmkZIV0Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by DU0PR03MB8292.eurprd03.prod.outlook.com (2603:10a6:10:320::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 15:01:19 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%4]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 15:01:19 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v3 0/1] media: imx: csi: Parse link configuration from fw_node
Date: Fri, 14 Mar 2025 16:01:07 +0100
Message-Id: <20250314150108.254535-1-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0086.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::16) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|DU0PR03MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 29db4e6a-1209-489b-00a4-08dd630913d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tk2wIYKfLrw9GR9oV0TLeZxaFrXcbSFU1NEDW8NXr6+IzpYd9hR3GiVKWVTp?=
 =?us-ascii?Q?I8FMvzMqkasIM2hODvjfdTHOhEKEkJy57v9mDdlNwVROyJXokY1N5jqVI4TG?=
 =?us-ascii?Q?gBQ7J/gJQL6BxfBLsjzecIPzzrX+KyvKy4cfC+CqTl20GicW9GV+wI5y6Khv?=
 =?us-ascii?Q?kUg8gO0a+G+vw7lnlzE5uADuVyQ4fVRMyqjnnqOg/+FX/XuxlSNRxVkOK4s3?=
 =?us-ascii?Q?kD6W3oaj91i568YaqPIoE07v3CTvjGBY2ELGwH9TkoUT1ZsJPy3lPndAJJro?=
 =?us-ascii?Q?Us8zEkFOcxPtCh4PM4ZdythobJJxEXvDu4bQ0mRQXiJzYBbJqNJ1dofGpxIN?=
 =?us-ascii?Q?gRk2iRnzABK0cxtBv5zGFBr/Jma1tRl4zj20MMqSlZbCxknaxDoe9JogwSSF?=
 =?us-ascii?Q?/6TZyiWrk0xTGdqTl6QOf/TKcE39omX9yh3TdNUEo5kgtNSbq42TGV2UNfS8?=
 =?us-ascii?Q?5TNkJl5VgeTqgLIldfHWPrrFs0t9eP6vTNH2WmE64+MLdKqW33us+SfV0TMu?=
 =?us-ascii?Q?stJJK8Zlte0nke6IlV/HQwP3yHNpP/HEux+yTGqpdakCCICrLHQPGbRpuhHE?=
 =?us-ascii?Q?5AEQmXrVLnzRyaHIOpFsgSCxlMEs4VF57ArYpf1mE18d8HaawvYOvFplP3FZ?=
 =?us-ascii?Q?lPu8c8ioaFwl657adSTC3ufsoy5fOYOeb8iEfa+c+eW2Ai28axy0oDtEPntB?=
 =?us-ascii?Q?WtjuXqfvGhHDne7QD7KCmTPICy2AIHi5hDjx43BIP1l0R+7hQ4bhY2KRAaRQ?=
 =?us-ascii?Q?HJZjNxbzz81QCzQUQADKAlBCJdjYF4jDbZY2x7FnlxJcw8b0ntF9AazmeFSM?=
 =?us-ascii?Q?2Yo7LiNnJitE4tQQPbuZR+EcM4XnUP4UR05p8IlfS0O0k18oqgLaSiALmqiB?=
 =?us-ascii?Q?yxy4bXEUdnqoUJPeZlYXuBE/ml4/gyJXl6yvqjpl4Li4gCKDwAaA13N2A72+?=
 =?us-ascii?Q?Q76nqk0G3tO7xfuiKPG4yoHTBr5KgDBwa3CTYxeVdtvvcpgYnShdkgDezQA0?=
 =?us-ascii?Q?Oje1nttaU0R9VaCgznryjGqhp9MSOA5F9RZJ3Fg8A11fCNNjv3n864rnYZaz?=
 =?us-ascii?Q?4tbdpZTLeQEg8TekgqWgykOUCxI8QmFJV2bTDSfpCGriprOd9dmsFeBJoWJP?=
 =?us-ascii?Q?EsVXkEmgOFBzJzR3lz8As+737Rx28ZvDlqnvZIIWMq8c5Y2cME0ZRjksqeGw?=
 =?us-ascii?Q?vBLMllA+kGoAkkgrQGODddeMPZhEWdu9MsAORPlpTCsWbKXAS2B3IFxuF5ud?=
 =?us-ascii?Q?Q0GfLTWrkXiUGv4nbQTe0XDa07Q8rTNRJ8ad2m/w3eT8yeR8nnGU9N1TaGSP?=
 =?us-ascii?Q?gK6bOvidtU/p/yZ92tYV67O1QGBbjFwMVmh9uKbforbP2pm/DhQHrol4/x+y?=
 =?us-ascii?Q?EdvbAnDWwv++Km2nctPD8qHlhU2ywNDGDUlOyZJkC8TO35ok8lhImpKl2stx?=
 =?us-ascii?Q?8NTNihbp1IFVerIUR50i3QPn6vcbnKlC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JfzDPGpLm3cXblMfxJWl+TJnpTe5uRDHwanVfYbqn7USZlgOG0SZZR0gDQ3T?=
 =?us-ascii?Q?RxMzArLZl7zZbff2PBQrg/t9z8vTwR9sXH7+XTWzRW641miDlHrEgixxhDeE?=
 =?us-ascii?Q?z6Uk3SWF1BH1ggitxLH+s6GreH1YsDvkqhQASTqqznpKzG51T3z1A4HOMJSc?=
 =?us-ascii?Q?7zPYXBgz+CtImvFI9WGw3pXVbbQBSYTRgP7exhLhvSRU06h3nqFVKRjA2XTp?=
 =?us-ascii?Q?iBOH9+9qT5/OnUXgmVrEAU4f2ncEPu4bRA7oz2Kt7r6gnRs2psMztcrXWsxX?=
 =?us-ascii?Q?QmPEALWMPhnp88fy6Li6GpR/8E9/uEAIG/zxPJ06cUppf20AIomAo+VNPc4Q?=
 =?us-ascii?Q?QzT/EVY0K44pdWEpVr9N7NFjeTxV09/akJkZU1qjzQ0c0mOiaWnUsoC+ri31?=
 =?us-ascii?Q?CKQ5ptfBXFtaHJSHO0veRskliebZG+dBZBTmdbndMtlJRntHxXyk1h/dkkmw?=
 =?us-ascii?Q?FRhzTcZiC9W0BIfkkV/JzPn9Wlsyxj6o34dOiBm5BMqJKCGEgPaZXo1w4M2L?=
 =?us-ascii?Q?yzFuNZlKXKPq1OWWjoXPdhYDItXJAqKZgadvXOks3x240YwgffkGmNFi41Ky?=
 =?us-ascii?Q?Jw63GX9knyWtossgksd7aCAL+GBY+jcq60NpBgv4S1wBtv8f9McdlyXN2DoL?=
 =?us-ascii?Q?9/3IXomvfGX5C2Wa1bw0VLYY/i9zSFBo0vhliuiybR5ILTcKuog5GRgLcka2?=
 =?us-ascii?Q?7J5yr6gZ5mxLwwgGFkk7dg2dPF1M3eR7PnFqW/DzEJb4qT49Zi99GjLlI9Sf?=
 =?us-ascii?Q?oRemULf3hzAnmaZtN3XETVlU35ru5igG6dwCNFrUC6oG26sU07dAaZO2SEGY?=
 =?us-ascii?Q?6Xk3J7pd9pmwb6NYxJywyYTzvBak5ZSLHETGyElytbkp5k8+s81vsmoZbsH6?=
 =?us-ascii?Q?oxIC8pMdxJRMs52RsC1FSdFx0JvGPE4RHNqEGN6UgRJnF3FqlmNeYNomzdws?=
 =?us-ascii?Q?ZbIZE/B5FyCMfgRb3FXJoihjK5tdlIkj77ZxRjfr0xtAoqddwJ0aZ2PucBqf?=
 =?us-ascii?Q?kwlEo/oLJMXRaJXkVobUR5JokfB/GxeMeL18xMTnFGbzyi/FiAH7jGDFjvNl?=
 =?us-ascii?Q?/84Rs3WtaXL1TRo2FvDkntAtioHjOGaMXHFra8WC6AeoXYfCQQDOaMVAoSU+?=
 =?us-ascii?Q?vbStgrqzvxnVUenBTdV1M1xppydlGk7qd4HM1T29gXDdWvMPIMR2tqvCOhi0?=
 =?us-ascii?Q?tiekKj/r9goN91iktKohFs6JYfBDu5FrEbobkqnS2BrU+VhUNEhCLANQvMUC?=
 =?us-ascii?Q?WA2mXZvaA/p8I3RUsccFG3CLdJDPFbbaoJqMOYi0GKtuskCNYHRSSUfEDR70?=
 =?us-ascii?Q?T2vVRGRjbj7FF6tQ/w3rwWLWBwwuiHEW9xSpUrjGkhPMPVhWqKuomASSOB1M?=
 =?us-ascii?Q?JNDe4tTiVtf0QkNkIMKYYzGpo6l5Ig2cd1qDM5qVcNs5oQz5A7tdnXjrP3/a?=
 =?us-ascii?Q?WzJeQk/r0D9Nk+1lWO3vYITAdaj80QlcxjjesE6/PPfb/tVsH1Qr2lmIK3zC?=
 =?us-ascii?Q?g0JTQN87OsJdnJvVkoUPNECyAsFGyypZreZdcOLP6WbdOOv22mj8zEvovQMx?=
 =?us-ascii?Q?SWLT47s6ZqmH91jLAGsAP8cjRMt2KNGq50DJFfcC?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29db4e6a-1209-489b-00a4-08dd630913d5
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 15:01:19.6394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wp5bE5dJq/sZVqV6bGS7J9vvcOFNrbk51ZfAQOLy2pPN8OJqq55IujCq+PPXMpQ8TQdc+/Usc8YwrWi394a1iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8292

Hi,

this patch fixes the imx-media-csi driver to work with camera drivers that
do not implement the subdev-pad-operation "get_mbus_format".

Changelog:
v2 -> v3:
- Factor out the function "csi_parse_upstream_fw_link_config" for better
readability.

v1 -> v2:
- No changes (I submitted the wrong patch. I'm sorry for that)

It's the follow up of this discussion:
https://lore.kernel.org/linux-media/Z8AoA6WjbXQufqR6@kekkonen.localdomain/

I tested the changes successfully on an i.MX6DL with an MT9M114 and an
MT9V032 camera. They both use the parallel camera interface.
Sadly, I don't have the hardware to test with a MIPI CSI-2 camera.

Best regards,
Mathis Foerst

Mathis Foerst (1):
  media: imx: csi: Parse link configuration from fw_node

 drivers/staging/media/imx/imx-media-csi.c | 45 +++++++++++++++++++++--
 1 file changed, 42 insertions(+), 3 deletions(-)


base-commit: ac9c34d1e45a4c25174ced4fc0cfc33ff3ed08c7
-- 
2.34.1


