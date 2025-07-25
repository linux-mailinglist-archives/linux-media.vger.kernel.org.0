Return-Path: <linux-media+bounces-38438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB5AB11988
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 10:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 125CF1CC6D9B
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 08:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14752BD5B2;
	Fri, 25 Jul 2025 08:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="l41L+BYA"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013035.outbound.protection.outlook.com [52.101.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D59AF9D6;
	Fri, 25 Jul 2025 08:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753430882; cv=fail; b=DUQvXg3wIVnInvBxUC7V38bxYsAuUpKadXQj+Mt5jS2RwcKQZz9AtJZXJw6Q2m+oJR7QeMpVvh9/gSIWCCiYxnKoLxUyeMI1WuKzh4Uc6dOUrzGk1DZ8u8tOPLnpPbWahmKq1o/zJPcX9WMRGxlgYp0WXANo7o9Z0s0fX7fi79M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753430882; c=relaxed/simple;
	bh=Q23GGMnx2a6nnwN1agTZ2J1pC2XK3wAABZshf21vWlg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=PHT6XZZy56G8FrP7nDPuA8nSMpbPaCDt3EuYronK2xk+No6cLgUbC3FwfS7TVqeKeirY0WdH6lgYuu6NZI1Q19FTg/j9XNiyFGDGQzBfyGfa6YHUyN0iu7iHTR79rynvBBeWyx7ZNDdROSO3tZMTnShE1vW7PeQKOo20eIJNlck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=l41L+BYA; arc=fail smtp.client-ip=52.101.72.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEUbLQtVRGR54z7zJek6DzA6RksO/H7MtRLjgPXu66R3hSgRJw8BZ5YyWwHM7iOBuw8rdo8ya8OX5HcVjxCASq6LroxWoels6gVGIsyiCFGU/leAXpy7oaBvRyDX8kIT05mq32LVC6CsS/XQT95jlx4FZlg8qRUs55QStlRiLaXIHPmYf9FGSox2UOGZ5pmjixMwAPbRvjA+EsggkBDscifa4OhrEPCtv/ffrQ1164YzjqPi6MKD011jCklempSusRIlGz4ssW1V65OY12KbTaSRCeDsrY1wB0e4p1E0GSPJbuQw853MuhJllJDDbaVctKugqhtOm6EmF8CMieogww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJ+4Pc9UPh35dx/B20CetxzUQTeyZP1kLq7x7lCN/ZQ=;
 b=Fmj0saYM3KsZjNyB0VDe9J/OeBrkzZE0SNK0fw0HyU1RB+iYoiUwilEhQXojAl4Elat4NE0okv2dc1uYy3e7D6I6GBMV4lqliAfJdlRPr1LkDD1KVRwnkw3I9+91nDCZlQl5kpT8itxyUcIZWYBaiQYOeDeGLi+uUt1GO8EQkAVW0+57pIz1XUv6Mk4ZqUL208IdEFJBCF3Dn9858vVYJS9OVoF+PVLH4T+xRRgdm6g0/AxG3vCz7mbZ+dB5mM6tDK4y7u0jYCyMPcaXVemlCxOv4Yzqt2YZyQenlt/eCJE2aIf7qBHruKiAls9P7x7xpH3JeMwgiNfSR8HM3NE5+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJ+4Pc9UPh35dx/B20CetxzUQTeyZP1kLq7x7lCN/ZQ=;
 b=l41L+BYAydEvicXogvf164E0yYn5yUBTGIltlMRbe71v0vyLlnTeD87nbrI7HbBEz2nupBqmB8ZLxhCpPnj9SXvnJ/K1+n/SG6PeH96yBm0Nm7lqr9qALyqZLLYepFjPtMvVeqaB3l1CUrL2dZtW3/4QA7VixSxlZvVCxNisPy3IkU4y9FEOafxtQBSPngJMSwO3/QPCh5KzKeUlZxWeCGrRyqmEVmSkCt8L56HryCy5ckvb+xEt3Pd3LyTSmGFy/8m+GPT3LbyrH2uAOjyTUGrsYE6EsY44qnaKzMj8laAh5qM9xcaBNaY5bd6ymf0I+uc+hpIE1nJAKiRnDYxizg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI0PR04MB10392.eurprd04.prod.outlook.com (2603:10a6:800:21b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Fri, 25 Jul
 2025 08:07:55 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%7]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 08:07:55 +0000
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
Subject: [PATCH] media: amphion: Drop the sequence header after seek for VC1L
Date: Fri, 25 Jul 2025 16:07:11 +0800
Message-ID: <20250725080712.1705-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P220CA0006.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::11) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI0PR04MB10392:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f0fef18-2742-4cf6-e82a-08ddcb525c08
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K2kJJvGBU/dckI0/9ucYwkE7hMm8xmIWSelrQf+4K+fqziSnglHNLC07z6KJ?=
 =?us-ascii?Q?51cA6jpEMDZD3f3jJfOWUR8WXXH+P5KfQ0S4PZiOVxLxw74kTaaHlwPk8ccj?=
 =?us-ascii?Q?DHWa0IupF0MolmsKpECEJ6h6KVoPRfl8hSDIGBztszM6UGMNeDgjTo52SrwT?=
 =?us-ascii?Q?zKGce5laHf42aL9hMJEDEDW3CPMfpn5Q0zsI17mfRjSrV8KQILf+nDx285Y+?=
 =?us-ascii?Q?lPHVx8ATZNNiTtjaoPBULD83KSfLq75SykNe9VDGy09zP2wdegik2aPGr0fK?=
 =?us-ascii?Q?/ZLyTybRQG1rGl6blpH7MNAds90tz/W1Xxbv9l15AtBRjZFwk7aL9EoBENvw?=
 =?us-ascii?Q?vHAqAwdhe6H2OHnItwdQWUrjNtUCOwf3OE/Cu1M82GeCsfl9qPy/Bt/0sBed?=
 =?us-ascii?Q?m2yLb8oc5FToDzzVCaflA02RTg3nwHZnGbOmr9/cQvx0EAe+WyOX0Wlyn1Z7?=
 =?us-ascii?Q?RKADQAielphlchxB5SdgSOx5hv4EDQqOZIilxOHcPnyJy3F5vno65rTNbtXx?=
 =?us-ascii?Q?73tpCBYst/w/sBGPq8JoqXw6ar7/SRbY58Mwcz/Ef9fUPpqtubFlqBEVgmul?=
 =?us-ascii?Q?b2nkmq7a6AawVitRjmMXOW41eBX0EMu4lEE94pUuLQq5+QOzUWfSEZlefLCB?=
 =?us-ascii?Q?q//wIaZqVNRDk2cuJXBPSB1IipTClwEVseIGj9subM6okRBdhVJHMW3Ws30T?=
 =?us-ascii?Q?4SJ7PDnoUBFtbbnnWnIV0K60jOKCpstVoLxwpMK+cg3LBsloegOkUlgCulN1?=
 =?us-ascii?Q?HbljiJSZgEvnnKR34zo6FqtlyeoNKv6DB6clkGRhw7TzM0KuiV9oRLBIFbZE?=
 =?us-ascii?Q?uLg6UYp72vwn2JLkcG2G7fzYzqlKswZCtONG206NP2A0teYn0g8lAqQE5NzY?=
 =?us-ascii?Q?nt07pfb/LiNYitWwT5pm753+ZG7gZufxX1Qcd6TStWNZbdy6QQdxVxtKpb5g?=
 =?us-ascii?Q?k8BZwrgokmqB2GmwT7N10ztZ6g61o4qzB0rfkuvHz5m3k/m7q+jM9zpVRkc6?=
 =?us-ascii?Q?5BqeAww8mG84fqAdrLWDy+4kV12cSnA8B638OVBfDy7t2SCHTy8wCGQt3mdP?=
 =?us-ascii?Q?yVsvnuLPLvtjxcJRae1rkDHZa07zErfUOrBfJfZkqe6OcCcXhUSZI49AZtyd?=
 =?us-ascii?Q?6LP9QNTtINdXl8ee5auARLOM2zw8cIjKgGxcmkhpQbRBBdlnzimdbvGE+wOu?=
 =?us-ascii?Q?uO3c3vg4J1XPUPFbGvyFKmLNAf3y+P7/P5D4aI0s2ddCqNuhzlE1bj3fqrkX?=
 =?us-ascii?Q?lp27CDVfNATNa5QyszDe1NEVq3sMCxGc1fua5LuszzPEcLp7ykkvNiOAF4wm?=
 =?us-ascii?Q?3vRL4qTF8AGHb2Ct7EpsrjDb8ZZIXQerloD263SjO8ZzYhFBIUH0M79ScLJX?=
 =?us-ascii?Q?S9yzTQZuWJvNsIbpLE7zblremZR60De1Rst6cTq/637AUnH/JmsHmoQqgx0v?=
 =?us-ascii?Q?DeKbZ78UT+UHedf7ZiQ/xbiblb8nH6EH/XdNq2kcM6ygRqtC5rBSbQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JS9QzUSTx4iQb4FqoBNDvrPHIF43MQBfp3YemG8/MOqJCyEZJHzp4wSpbwCU?=
 =?us-ascii?Q?f4PYT8r/jbvTdl6z3ClKg5VaUDTp3HZBFo1oBL9Cl0Rtlq7rQvK9x7IZfB7k?=
 =?us-ascii?Q?WQKB8yOCgPBfANUVzxFFWgRpTJh3YYuai8ifI5doc70mh/hH5pfIElG0QtDl?=
 =?us-ascii?Q?fLNP0o6EzE9M2xBdGYYixJhoCDOj2PHjv5fsLb/lXuNY4vKEzAZ/fVKP3O0Q?=
 =?us-ascii?Q?pFeRQPd3EcR+rgIkrlutLi5Vi2pPLEPnqT84P07f5F5EhkBJ1hUSFpFa0Ezj?=
 =?us-ascii?Q?lU3X+MzImddeuugnWTEC/n/q94yyY0LuELVrm/QP0rSU9cpubjaieomdXJu1?=
 =?us-ascii?Q?IQcMnMpLYpB+eHTBDHcGqfhvIIEYkIfWrD8zYkzM85WGm8tTQtA4FDBRoQaQ?=
 =?us-ascii?Q?xNiyvJjJzTCgcoEgvG1+c53nQFReYhEsUQA1P6GctxM2oMgmPKSev+H4C5s6?=
 =?us-ascii?Q?J4Hn6vn6qp4WJgRILMIdSb1c4vOC+bLQdmT0nhgI0zUf4EHA9sYqLlWUMq0E?=
 =?us-ascii?Q?JAALf6Fv8TienUXDT1m49+d7LZEjXfj9wE1dM0jdC54ZWj47oDl1O7yqOVsX?=
 =?us-ascii?Q?tMbyzdWm4vlHGh5oFarvLjslVwEnTdqn8Oq1tvgCOB790MvSF/WlBtf+bQU0?=
 =?us-ascii?Q?L0PDJAl2lGySBwW7eX9GNdsJ9YRgJdd598PWRmMezpFzpn0LQXIgiTeuS83v?=
 =?us-ascii?Q?CZCs7qxfh6GOqU/p29ly1ZJ+lsSzLCRfgHrEsW/OvWSw/v5MiTU77bQRHVTK?=
 =?us-ascii?Q?lZD29O/PV6/IDePj2HfUxkCzNKgPf/MAX+gFAzyE4siyORRp1tCHOBlNQOKf?=
 =?us-ascii?Q?FK6QrgGYNz5VyGBWqRRLbne95ub+YPnGsa830rKZuzb5Kag2/oihIQsq2sgC?=
 =?us-ascii?Q?s52hNf6NqoPih6bh5Zq0Og7ZsCfZdHZy3nsTR6ZEUrGI8qd8qP731veDmSh+?=
 =?us-ascii?Q?jR8XkY6gYNHJvKtJ8sIlWhS0IGNvhzRUxPZJid0jqQVin6jMHT9FoL3Qhrjz?=
 =?us-ascii?Q?oLqCCBiymo3pN1LWjbTHmmGtLMtz4kZHIkmyi9rIJkE98KHSMy8zdqSAFYYm?=
 =?us-ascii?Q?ZbEtr9pQUf6UMWOwNTUeSXBJVPNKxLjBcqiF76M8HWgTqrqmQAZbbeK3c17Z?=
 =?us-ascii?Q?oLUrmnPG8twf3cIEiaHyZlPcQg9cl0gAmGvwCPNqBn11IsFIsEx1eOveXx/H?=
 =?us-ascii?Q?XToqNWGrN7wegopcb5grOGzy8uLf7270xYZo/kvLsWSremwYBpY2TwJpx7jp?=
 =?us-ascii?Q?IvRI8dcC/H2s/bKLhclgYZCSKOE4dQzO/LLuEWpYW0EOSdKiWqCfP7Up9qAl?=
 =?us-ascii?Q?2EPEDQuoaet4NcTfI4OPgdMnCVY+QR7Op8WmqW4u9Dluq7mtKAZUEXVwrUUX?=
 =?us-ascii?Q?CDjLTjpz2yLUoK3zMPULtI9/c8Re5EvsXKbHB4Uf7RH4tlsIU3+Hfwf6pyzD?=
 =?us-ascii?Q?MLL+swNXnhxhSqqFiyNhtxEKAnJiRkTgOkjrb5X9v7P0+lJahrLSmGXy0JM2?=
 =?us-ascii?Q?Ng+Bby0kxjXIMehlafdHEiqJKsKBltERTia2jMBOvWzGPXTyJoJQY1xUJhnn?=
 =?us-ascii?Q?JsvvbmxZrC9umcbC+XisUWLEl8ZDaRimswK8I7sl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0fef18-2742-4cf6-e82a-08ddcb525c08
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 08:07:55.6548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zswAsLk76AJ4cpxU0jmMLzX3AfjRej8CyBtsS82YSsf2ahpCYwXo+gtRolKsf+rgZDkETFJm4Vo8dA7iIIPl0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10392

From: Ming Qian <ming.qian@oss.nxp.com>

For Simple and Main Profiles of VC-1 format stream, the amphion vpu
requires driver to discard the sequence header, but insert a custom
sequence start code at the beginning.
The first buffer after a seek always contains only the sequence header.
But vpu_vb_is_codecconfig() always return false as there is currently no
flag indicating that the buffer contains only sequence header data and
not frame data.
So driver needs to drop the first buffer after seek, otherwise the driver
will treat the sequence header as a frame, which will cause the image to
be corrupted after the vpu decodes.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vpu_malone.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
index ba688566dffd..a4c423600d70 100644
--- a/drivers/media/platform/amphion/vpu_malone.c
+++ b/drivers/media/platform/amphion/vpu_malone.c
@@ -1373,11 +1373,9 @@ static int vpu_malone_insert_scode_vc1_l_seq(struct malone_scode_t *scode)
 	int size = 0;
 	u8 rcv_seqhdr[MALONE_VC1_RCV_SEQ_HEADER_LEN];
 
-	if (vpu_vb_is_codecconfig(to_vb2_v4l2_buffer(scode->vb)))
-		scode->need_data = 0;
+	scode->need_data = 0;
 	if (scode->inst->total_input_count)
 		return 0;
-	scode->need_data = 0;
 
 	ret = vpu_malone_insert_scode_seq(scode, MALONE_CODEC_ID_VC1_SIMPLE, sizeof(rcv_seqhdr));
 	if (ret < 0)
-- 
2.34.1


