Return-Path: <linux-media+bounces-13498-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6100590C48D
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 09:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53F011C20E9A
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 07:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F401215D5DF;
	Tue, 18 Jun 2024 07:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="YX9QynTm"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2086.outbound.protection.outlook.com [40.107.104.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D60C7EF04;
	Tue, 18 Jun 2024 07:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718695832; cv=fail; b=hJCjwrpTkjbDKR0IHGTp8mfM++6MoP08UCoXfCo7uFNR5Jwqet01RJGX9XpB32tVOB0VJgC20UnGrnUPIhs/iD53MlWL5/aMI/aKfl4Cnx6X/k6PwKoRELWD/iXi/0zQaGVBx22c/NlfAMi/yh+115HNynQVOcxzyQRiRAIIghE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718695832; c=relaxed/simple;
	bh=ZGIqsJyYC8rAgUWZPgyTytKvzxaTkjsVsJXZBRjYWfU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=tJ6x6FKL0PBttv2xKHu1dCKTPYZ+ZHT5QN+5AMYt/jmdVELoo0raKOvtK0rbypUwoyMXaGhrDBLETOZ6FrlUd696E+bH80VAq267TSym9fJbtKGg4P21Dqr16BoQlfYIPqZODRIu/Sv3RGxxh4A13h8x3hZmsL3xXjezsrGQV94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=YX9QynTm; arc=fail smtp.client-ip=40.107.104.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bE+EVGYkI0UzsAOcw+G8t87iDJrjmmBA3x6fwExsSqUuPKF01DmuDVRIq0wwX/gxpOimWG3AsN7Oivt8wP2GL7fBxPZnHfnkQFGVJnCCxQk75R6c/NNmMZDiNUaQHmu0vDsEpTCwu2a1S4dtnHMwMu4BqbuDmOlhDZihidpJKdKodqh//Ahjkel35Jv0tOMeIwUDqlWUWyr4bzjOVGOXQuoW41yYI55yKpKFNHuun88RJs2sWoh4vHs94UkprnJErKn7zN2TyC8i+vliwvrfUUBlMhAHZfMPmZEuNUmOgBcV0zFjfCQ2VLl1z+YFODEfEL3/yb/n380a7erUQVHiGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51V4zr5gZL1/43Slu7MX442Kddj+wEhGW/vfBT36ACI=;
 b=SSluJfFtwRgW4NnS94Moez/TGGJpbxE0GIbEfGgEXksccdN2vefH1xkwcQ38OxIB11piSJU5/SsYt7hDpQhQfAv2SZxvoH0R6amSEXVerOH8LiEqlONe7SOiVRK3Wx263tkmpgWp6tSlOpv9t5+bgrqtNZvR/sU0kL+lq6xXvRom/DJZlKY+zJjp5dWJ9vsVXe+vbUfaMNe5DwBcFak5VZgnrQXgTIDVF0HW2S13CgUMBTOFY8XYyyIM3ksVtX7wUp+kdVujwgoQ+E0Tg1gP01sjjHZUhzXWCzyyMJD23cBuH7rM/V0KEIOLjre6dNFR1IBnmEiPcxBFNLYiBuE9sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51V4zr5gZL1/43Slu7MX442Kddj+wEhGW/vfBT36ACI=;
 b=YX9QynTmEgJLTTyuoSnQIYnaiIRJoqkOccYh0VbF9Gdw7df6PNi3RuifZekMVMUI4IXmIB0cQ6WD110KLbCk6Lca1zpn1gET0hj8UYkTiK2V0fy8lw2mjpv5AoeFEExCBl5BRszGUlu2gAJyx/sntptHmQTi7CddQroQxPCtIUo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9458.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::20)
 by VE1PR04MB7230.eurprd04.prod.outlook.com (2603:10a6:800:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 07:30:26 +0000
Received: from AS4PR04MB9458.eurprd04.prod.outlook.com
 ([fe80::d15:9362:5a7f:4e19]) by AS4PR04MB9458.eurprd04.prod.outlook.com
 ([fe80::d15:9362:5a7f:4e19%6]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 07:30:26 +0000
From: TaoJiang <tao.jiang_2@nxp.com>
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
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Ming Qian <ming.qian@nxp.com>
Subject: [PATCH] media: videobuf2: sync caches for dmabuf memory
Date: Tue, 18 Jun 2024 13:00:04 +0530
Message-Id: <20240618073004.3420436-1-tao.jiang_2@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0200.apcprd06.prod.outlook.com (2603:1096:4:1::32)
 To AS4PR04MB9458.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9458:EE_|VE1PR04MB7230:EE_
X-MS-Office365-Filtering-Correlation-Id: 430c2753-6b99-4f49-9f14-08dc8f6885f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|376011|7416011|1800799021|52116011|366013|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aL3uaJ/LOR1nI7GTdEcvSYp77rgZvsRfEsCHGfOngC7cs67X5YnUQKJiN/Vx?=
 =?us-ascii?Q?jDJi4RWHoGw3WMOt7G9ElQVRK/KwkdI9BGmB88/KLCPWkwk6mQy67sADuhNb?=
 =?us-ascii?Q?8NkFSSMDN8i459TjWUEAkYQpydYKdmD0N/32ksKVrLFZYjNxybdMfrUjp+Vk?=
 =?us-ascii?Q?KQcDozAlnp/pMT6rN+XD52LHrN7N9oInFlaU0Jrp6ZRMaytKOzWHumtGTIad?=
 =?us-ascii?Q?MM2ig8ivQ2mZiEPGPhXaAbwmB1giSp2MN7mfmfylcBupT19FCD9J++LKTQ22?=
 =?us-ascii?Q?jVqzvvzvlRT9ZBE0b0CarUcAvu/tCv2tqfcV+pmTWwoXIIVuD6tjnuLqAcKy?=
 =?us-ascii?Q?J26ZXjc7dvW/J3CSF+PTDvD/mP6BJFDkkdaKaU4Ed0nCg4VxV53GyfXa17gD?=
 =?us-ascii?Q?pHgBk8v+gs9HEC+b/lPlNIVmBU5ap9hc1n62x1APxVWsx2qvVZvryJqF9sMP?=
 =?us-ascii?Q?8FweJAOmOkWDj3pFZgvegmuESz8KMa7m6624nX0aRjZ4wUgI7qJh5CyryOO9?=
 =?us-ascii?Q?z3mQ7U4gsF1TP5J03fG795YZm+MEMIpyd+Jwgh167We94vFzPkmX749zOJ/4?=
 =?us-ascii?Q?6qm7e4STUfefwygsZJvnhM2YPluBMj7RJ6kb4W2Nu7VKhxczH/lq+bpkxFuc?=
 =?us-ascii?Q?8b/0pKBfbAgGpewcNCrJJzvGb7uLDG1Uu142J9FW9nqEyJ6ULNpfa0i4XTpt?=
 =?us-ascii?Q?+DzQEAjqj8ZU95BgEsz3OnkkWUdE+aerrPb1o453G9iA6grT2ht2biC9AI3b?=
 =?us-ascii?Q?GjgBtojccDbOBLPn/qmQkkKveO5SqFynignkip7rjJItAgG1IG/uOqN/5dKH?=
 =?us-ascii?Q?NyYr3DCB5TA0stanBVxGfiNzaIjMAi+qUV59mvIUnejCBU9WYA0aEadn3ECc?=
 =?us-ascii?Q?rWHeocfF0YLIXfKfK2ZfFR0d7p0GOhkMtoQumFzBVEaUzo+H5IufPf9hUtgO?=
 =?us-ascii?Q?b29p5HLwrPh7S8QRk6Pu6ZQokkW8Sdf0uPug5j72xLJ2lxfVSeVFYy7wuTzX?=
 =?us-ascii?Q?6DLG35Ytjjx9jh2rzmGL98ZDvkViTVTdamCcH3hi1fQn6ejkHdPa1GbQ1Qwf?=
 =?us-ascii?Q?WkYt1TwOjF8+vU7RTgy0wG1xtGxfQslRoHxzRxBqa0V93KBUDVIhti4U3iVC?=
 =?us-ascii?Q?gnNFk6DYkC1TErVulx0lCEyXCeqSg5IX4jqWIyHfy7aibPkfuM7DtlxBjN52?=
 =?us-ascii?Q?il7VyeEtRUZdHj9W9Kx9wK9egKCW57RIFIzO9XOMNYbcT/45CIbeCpviMM2H?=
 =?us-ascii?Q?qhhra1VpzPP8LX7jMf0LXJ7f3lXKjgRmpxhvo4jx5AtSJC++YaVTe5vbyE5y?=
 =?us-ascii?Q?dllraC5DF/nDcstG6B281p46rJW1hHMnIyNj7Y9pEyE2oR8GTXYi/MG1KyE9?=
 =?us-ascii?Q?OEPO1/U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9458.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(7416011)(1800799021)(52116011)(366013)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7etGbpamtuDskdsqWKjS9ZHvHMLeKgikc+qFTdnULCSytYCvilfeCMP/JntR?=
 =?us-ascii?Q?PkneRCi24/hah/CVxrOcd0Fr/mDwTwkPl86GTD5+Qdr8p/1a9zzau+u9nL/N?=
 =?us-ascii?Q?brL44fxQtk2aVZBSQq0LVosDS0HI5IH2tXb7OlgcDEHc+5YYZBuzYsOAf871?=
 =?us-ascii?Q?Sx3aEpEnMaJ0RSnVBH/NvbYeJSht4ZhuuC0WxC69blLWsCWG43/nvCbp9YhE?=
 =?us-ascii?Q?C0P7Ob6dQByoSco/+org9DpoiZ7a5d9n5XhqTZU4SsRN/OeVVkdZTPyLjIO6?=
 =?us-ascii?Q?gsazVRIchhDA1FxAp4EhGtBbt4aVSRysjQxqIRff1iKfw17k8T3uplGZEWe0?=
 =?us-ascii?Q?aO3RG+NycvV5Ku1tOpChC0LJQMdU7WWkSzoNYQQoYW7gKom9UUcUAiNS4Dbf?=
 =?us-ascii?Q?OqN8j+gWeRL5Thp0aTZ+TLPaz3DGwfxr9+OVUTYJ0yHlrrG6gNDkzEM66fCc?=
 =?us-ascii?Q?rMpxwlu5P6XAX9VYAqtpNUULPDYOpQVgiVYU9SU7C8v5MsNGpBS5TdJJzQQP?=
 =?us-ascii?Q?6zRCf+91Z2zoMflkyFhSFSqt2zeFx7hvB3gHgAXivoJGUlWXhAHCSggwMXUq?=
 =?us-ascii?Q?jE1hh/VnlY5ff/KO2kDE5GZCeAcCfSTJXMBKx4t2+VIX0UmgB0cPUSDFTe23?=
 =?us-ascii?Q?2JCMPJhbuO4oA4GhOxsu4RDodddDvZYhIgPGn+sCp69PWv9mkv26uEzVgQ1s?=
 =?us-ascii?Q?BaD+KHvI35tmEcJI3n6uaNJaAy/+KDK26yURzuG/CKwerVO0YrLVpFdn5oZr?=
 =?us-ascii?Q?B5Fw9R1nCAVM81UdHK2gSbeX/H0I8Rsb/ns+4ii1GwY/cpq1vna/jcN9hctd?=
 =?us-ascii?Q?6z+zCyFaRVBJA0QHi8YTGrBtJSPf4wAjvDEWvHz+DMehffPJbt2XOZFcO9TU?=
 =?us-ascii?Q?ZAwBW7wAe1YveXoI/aJd+FcOZ2M+Yum+GRvgQKmbzZagqgDxvEHOGc1J3AVv?=
 =?us-ascii?Q?zJih2WdUHsXVLO1Jnp3cTEKm5021h+GgTXlpnrc5UTS5WQS2YMplCJyQRN1l?=
 =?us-ascii?Q?xXz4HOZt8/fkMpQ1QuAHmHtutP001cgeLnV0vHeF3gqVRZWMnfVgO+KMzYHX?=
 =?us-ascii?Q?ESezQT6X2yelmoTmaDuSg33tM2GYLZU7KkPG90kjGWxb+Z0EJT5/L5UcCOtG?=
 =?us-ascii?Q?CBqT6dF6veb/3ggrjXTwmkXTl5vOAZqgKOwGn/U4S3dJZ0JmZcvPltMZV4z2?=
 =?us-ascii?Q?BMNjNlOwJO+lW9Ekv2yAoYF+9EOoQ27bwUVxwpQe60gzl08BJ6tbVezzzW/1?=
 =?us-ascii?Q?OcyXg4DF2Y46FgYCdKeAF1CYbaPHj+0frRax3BKJLjKXSZSybRfEbL1M4VRj?=
 =?us-ascii?Q?cmqelIXjmwV9GXxQdFUP2k0x9q+ete7lbk2EOHBp1vSR1+ScTAXncWpr6Gei?=
 =?us-ascii?Q?m/GQT8mXpGlO4ywq+3R6mJ0iE3OJeWKtsSdNhB8UTDlQOK9LVN8VwOwdryPM?=
 =?us-ascii?Q?pfqpxKX2LoLXltyMVxN290ltzt05q7hGQyQbv2qBjffM3Z5MZfH/o82tPx/8?=
 =?us-ascii?Q?PC8MKw86xWuBrPR6e1t34IX+bdvifjkLCbooWrZ1mMJeVE9v5TrX7pDFmi5U?=
 =?us-ascii?Q?ioGh0LiupvO6B67YuzwnKt2kJbJb4Zo17SyqfM2i?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 430c2753-6b99-4f49-9f14-08dc8f6885f9
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9458.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2024 07:30:26.8267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TNscUS88qZVGyXgM+6CjXE6VK1C8nafdaIKEwJsgW3+sBfHSuq9jSHwaBvmqgVbukSscHjGWN1xm14rV7S69pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7230

From: Ming Qian <ming.qian@nxp.com>

When the memory type is VB2_MEMORY_DMABUF, the v4l2 device can't know
whether the dma buffer is coherent or synchronized.

The videobuf2-core will skip cache syncs as it think the DMA exporter
should take care of cache syncs

But in fact it's likely that the client doesn't
synchronize the dma buf before qbuf() or after dqbuf(). and it's
difficult to find this type of error directly.

I think it's helpful that videobuf2-core can call
dma_buf_end_cpu_access() and dma_buf_begin_cpu_access() to handle the
cache syncs.

Signed-off-by: Ming Qian <ming.qian@nxp.com>
Signed-off-by: TaoJiang <tao.jiang_2@nxp.com>
---
 .../media/common/videobuf2/videobuf2-core.c   | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 358f1fe42975..4734ff9cf3ce 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -340,6 +340,17 @@ static void __vb2_buf_mem_prepare(struct vb2_buffer *vb)
 	vb->synced = 1;
 	for (plane = 0; plane < vb->num_planes; ++plane)
 		call_void_memop(vb, prepare, vb->planes[plane].mem_priv);
+
+	if (vb->memory != VB2_MEMORY_DMABUF)
+		return;
+	for (plane = 0; plane < vb->num_planes; ++plane) {
+		struct dma_buf *dbuf = vb->planes[plane].dbuf;
+
+		if (!dbuf)
+			continue;
+
+		dma_buf_end_cpu_access(dbuf, vb->vb2_queue->dma_dir);
+	}
 }
 
 /*
@@ -356,6 +367,17 @@ static void __vb2_buf_mem_finish(struct vb2_buffer *vb)
 	vb->synced = 0;
 	for (plane = 0; plane < vb->num_planes; ++plane)
 		call_void_memop(vb, finish, vb->planes[plane].mem_priv);
+
+	if (vb->memory != VB2_MEMORY_DMABUF)
+		return;
+	for (plane = 0; plane < vb->num_planes; ++plane) {
+		struct dma_buf *dbuf = vb->planes[plane].dbuf;
+
+		if (!dbuf)
+			continue;
+
+		dma_buf_begin_cpu_access(dbuf, vb->vb2_queue->dma_dir);
+	}
 }
 
 /*
-- 
2.43.0-rc1


