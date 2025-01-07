Return-Path: <linux-media+bounces-24316-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65222A03767
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 06:37:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48C4B162DE5
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 05:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E631D88AC;
	Tue,  7 Jan 2025 05:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WhreyhTw"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2064.outbound.protection.outlook.com [40.107.22.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE2D4C9D;
	Tue,  7 Jan 2025 05:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736228222; cv=fail; b=FJHVzVuQSXH6tpz65yGtTZfTyfENIKY7IDdQAhi08Evuxt5ATgeyuZAa+SrQy4EDc/+yJZsZiFDE4nYKYzyao7BOTz797W70pV5f6NiRtUWOMVg7LNvXNUp49t37ozlilI8Q7hWZLjUGuB8teTzAtjLg2KWfmfFHOAo8e6LnxRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736228222; c=relaxed/simple;
	bh=ZHP1QGjg2MbUwcm+uOT5mLJDajA3Q155WMIMMxbwlXc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=P3vQXgoZOXNYAS5qspEdu73cXR7339tu9AmvIK2okc2Osj3l6y4FE1wWDD9BTZ0y5YbraFqWtRU6g/B/g+dgjjEKVKMYx5IWne+WrFRvrtVdqiUrBVkwcuBlYi3eMEV3UBFYU0CUsNDpBy83nJmRJc4hfV7c4kXXEJjJ/wwXc2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WhreyhTw; arc=fail smtp.client-ip=40.107.22.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WHeIqblt78PQ/VR4rCZDoXdY+pNntDdSPW0HQKRmXXDb/H4Kv7hbqa//ihPJArL9Kv6ck1MyhYMeJ9uxzjEh34blIM0Po6gBz5BmAB8b9z5380GXM5ec3i8s6DdE25QVM/M/xgl9Gs6d8/DKFzWcbSLEV0PkYtfMMB3vSGE3lAFLGod0fYFOFOwnsHXAFojHm7nfM/2467ddjqZItwHEzbNUK/KTOz9tywFAlv0UuKKGcgSTnobWm/sVHzTgK64XzYhNjzZ2wAgcq9Y8ut8xNZaBMLA8mG7o4claVX7J7pPPcArZ4ZZdkyqF7BLEm3haQv9fCsJ/Jid1H0kz0r6ofg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3MP6JHmlaNHP/7AavyUg43Yw7XKOwSWm6Sy658nX6w=;
 b=x+0z4n55GETMnwnGtJEQD1oX0Ugvw1bdZpvxzMsdOWMADtr/nlz6gNCEJgIbLs+6U621QeISpPK6I/PvrQ3XM2jNXg/iraohdKP6VBzwYtLMyqFUso3+rGGJrnw2vturnJvcrajFaRSp2Q0h3kaA1Ur3AGy9Du29PBLYpV0Cguv9xr0TU484OV4pr+rj5sROX6QwiiWudS6R3Rgrihkp7n0/hwUbTS25VmWlbk00o4jCSOxohUM1KMhO3za3b4NAxnlmUkbaZUf/J0bzGVuquHbunGEYMJVM4dt2Fv6m4tgI9igacCcAyHMTvAj6STCvoTLx+ePvGf+NyteHJS+QJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3MP6JHmlaNHP/7AavyUg43Yw7XKOwSWm6Sy658nX6w=;
 b=WhreyhTwrhFkadO089xvRYbrhSWTu8YRx4HVWDAh12w3Pu73qsvPqlP/tk49ekSf3uH/0D9VUvjBr2JPMDfiBfppUrl/ujaOQ2rIE2qM35SaH4mftc2+SPUG8u/gwuXMZeEAJuQG8TEQVazS89rZ0sMRtIMSVJKJIrJ57dhk7hwL+0jZjDYQk5LZMmse0Sk1t0B3Dvd+QMD3yN6ZHmUlLBHoSfryCQ21xFPNCcQVsnxnclaTln74LQgBw+mYsk0rvCvD9KuZ9yvjsXBBjXiVbbo+zKU9z6ejJBzQjexUO+Jxc0d/dUCPyrSTterr5QV7CIO2di9YUma9SFWE02GCpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VE1PR04MB7342.eurprd04.prod.outlook.com (2603:10a6:800:1a0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 05:36:52 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 05:36:51 +0000
From: Ming Qian <ming.qian@oss.nxp.com>
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
Subject: [PATCH] media: docs: dev-decoder: Trigger dynamic source change for colorspace
Date: Tue,  7 Jan 2025 14:36:22 +0900
Message-ID: <20250107053622.1287461-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VE1PR04MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f48b2fd-02b6-457f-368b-08dd2edd4951
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wdl/uYWUxJuEnHf1CL9Rhqyemi1I16wcpYbqEQ2oAlU/JOIJN735RrayIrd8?=
 =?us-ascii?Q?ppPiYVmktDAtalBl3kmucudXYhCoc1kcyyegJ0HBKQ8e4DtJlEv45ywCqgqx?=
 =?us-ascii?Q?OrERG8cJTkRt2Gyu/iSuFgsDp34yjb4tUFuuzsjHVhMiKoll27pIfVnZOb7u?=
 =?us-ascii?Q?IWX9c0qCSJDE2eP/YwkJB5YSU3sSDNJCflNvkSgRVJeEbwZRqdkTL4UtzVMZ?=
 =?us-ascii?Q?6wXeynwHfMV3bDqYtJv0i54Z5NUrQHlwWiA+E6AfHutgTq2qw7e+Ht8e+FuL?=
 =?us-ascii?Q?gVbgZDEIZPxocceh50lgr1jq43wXzBwpVbpfBTWuPkzvunSetH0sSI1Y7rqy?=
 =?us-ascii?Q?+O1sSJlIke7fMSEPFMpWvZKbgLUsSGtvKdXml0TzZfsAmnXY1BV0ey9BsBxG?=
 =?us-ascii?Q?CG1Pu8AfPZg4lrm3ww2ZXZMzd5tpJa+0SVpJIz0HO0X0OBy6Sv3iDO8ZY1ea?=
 =?us-ascii?Q?mIIVx266WJ0kcD8kULlZeRUoMK30sSXJbBiAEdCj6OAhSoBQIdWNmDZ3P+gL?=
 =?us-ascii?Q?E1lfZ5T1KSQK4V1R/3+S8jrWnZSSEOrodz4b0CHuXjNvHTq5rleI69YZuygD?=
 =?us-ascii?Q?Hj6WHDBOfXzjad1QdMpSdeftOvD9efmFH5WOH6HMbMyuTlMOb/AmFfvJkUNO?=
 =?us-ascii?Q?Y4gfm55q6WtRG+RMKQ9/ENi5Ynkv5XXn1IaEMZQEQswcnT1oVXtyyYGvAIkl?=
 =?us-ascii?Q?KUiU49eva13OE6ERKPuid0dNxmt2sl73OCvYU1MRdQXE17feNDHBT9FnDSHM?=
 =?us-ascii?Q?eUuwIZemttcb9gCGm9CcDpNv8hy59LCv+teTSB7qrpDw3BZauGuoKWbVKMrp?=
 =?us-ascii?Q?ltYWAaIJ1Fa4pWumcZO2Gr6xcxIriA6k7cvHWAxK1tYEQQz0P6gReUNRX4iR?=
 =?us-ascii?Q?iUvccATxWLFl4GkA/IWxneM+PMSlUWkYzjGiQqGcBgIgcodmjkCra3OpEKOv?=
 =?us-ascii?Q?vV/4mhwZrmkbAU9DCox3Tmfs5KpnRxp5ZnnYz3Jlx98tryw3EgRl7miB5F3a?=
 =?us-ascii?Q?2o99OXtDyA1f1caiOa7cf3f0SMQQX/U6TM93ra9BUgeBQLcm27GsFPyHft2P?=
 =?us-ascii?Q?nHk3B7XtM8e98kec7zy6upamCYLxlNqcphC0r1YUf7GtHDslpZv392b17f8F?=
 =?us-ascii?Q?10c5cc7qPbz4T+HmAesxFzNL43j6H+HWNU+DnxMmqFs+oMWqaT5gzAQS8cl4?=
 =?us-ascii?Q?LbrMd+ZTG6sAtOauUU4xUVcZkYBQKIkGFDJNyS+B8zF8CPH2KC1kcoV9Fq/s?=
 =?us-ascii?Q?JSqpjpeT73duLaU2DiZddmSIJOhObtevRN3a5f4Ff0dWHbVwOpKz4tQj5Sev?=
 =?us-ascii?Q?9oHK8F3oVi81tlTNlkS6PIGiCdlSzeFy66FL6jMxIyQi2N2h7pGUk9KpedSe?=
 =?us-ascii?Q?UWHR+N5l68yRBskUpbdL/8p1EXp//G6EB7m7WghzxjXVOjjhJshxSIvZImOd?=
 =?us-ascii?Q?vYhpCvIzJHB32Sf1dcuCu2mEhq1U8Ie9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xo7rfFGF9nKSzP3ewVAvjuFo26N0xrBhh5LSNDOiWmGqbQYoL7cuW/oDIDye?=
 =?us-ascii?Q?Is69WpyEkrICCcK9+TDKoSPjSHabJTfjr34AYuHGofYKkQbm3HsxlLE3WNCy?=
 =?us-ascii?Q?Xz7lmDs8cEFF8FbdRAGklbtlrAHxgSySzR2eF0fHdRDWsd3qCo5TVTTroaM1?=
 =?us-ascii?Q?YV4CpUbg19lRJppPL+lCdHt4VrBqKJOmst0A/eUQVuPF+omq/NUl97omboti?=
 =?us-ascii?Q?RSBpw/ChoHTGL1+6zlR0ShbeJcIDPkyckjY64+YAqNA9pQbt/TCQYAPZyrRO?=
 =?us-ascii?Q?P3IqLbmGujgm60cnXloh0twzp5Ha9wyOCHyJLNNUFaIZnP1YrI80uPqkeABj?=
 =?us-ascii?Q?g1zGMxoh1rUTzZs8A2dbT9H2FyuI0yHubN3O06x3KZcQKjtdM6iIw3BoGqoZ?=
 =?us-ascii?Q?1LMYylOaLW7ezuaIhuWngUQ66OaKmNuLJG45E4pUWcVz3h0Rigq8jtp+FIbB?=
 =?us-ascii?Q?cB+twLzJXC+tyUXuZJFeDZspGQbuIB/Eqp6I+d5W5k53pajVtUyHp2OHuFN2?=
 =?us-ascii?Q?8caWxrNL+qLnDtgj6dgQfOZlNJncrE7rl6DB9a2kS0hgrs9514PxElsj48qx?=
 =?us-ascii?Q?ppN+KFpsdwNDSuZuXunWfq4nFosol+EQHCjrvg/O6Xae0pmXEVCbCbCpA8OQ?=
 =?us-ascii?Q?bncgrC+saI3S9V7qnRQQachqK4i3rgPzm+O3ux0ObbAxkHza5j0UYrBOW4gC?=
 =?us-ascii?Q?ELftaHCooy9GlSHotzeibq0vpRstuDr1vVv676Xj42T01RKsX7Qr6u05TwZs?=
 =?us-ascii?Q?eUkpm/Tjq/8TQB2RGdmhSFurRIveW88cD8fdWNjbjRIj7OEFPNDIpK6pcrcV?=
 =?us-ascii?Q?kVyVyiZSIdjhR3A5MDGMEW3DWXAcPqQWiJx6LMUkU3/mUXPpR+3Txfi/YzFQ?=
 =?us-ascii?Q?HKOIEwEEU27H9taOa7pItzE961z2OrU8o6ltyuGqIzo9QQP6ivPOUNvdWdOs?=
 =?us-ascii?Q?ZHQD+4ouy4RLNgXcKvsk0/G9sn4bzMg2/vEHynCpJqX8OpFR4nsf2XNrytKh?=
 =?us-ascii?Q?iQOQw/Fi9Nm9Y7u/QyG9gMXX2CHjH0ar3wYAb10gE0vuIB2FSb5egld+weVr?=
 =?us-ascii?Q?PRpVcY5Vb2fbkJF++qBFpvawuLeo+2BCIOnvNmeVp6BKpIiqNKRKKYn6FHyq?=
 =?us-ascii?Q?F7ay3A+yPwVARTYJcftn0ybgu4rRkUzSBMUrOVs+KaPjO8IO1eEz3fu3cdi+?=
 =?us-ascii?Q?HUsbVVOZ5+5y0pzzfYZZkih+pVYHGni1Vaqr1QmWIUsNfQV0oPA5OHR8oHDq?=
 =?us-ascii?Q?JIQcVBokRfjpLqXTFd/Bw22j/aSqHd1gAz6mpJSqyjHrECa/L9qmreqnKvYb?=
 =?us-ascii?Q?n6UsYlUQRCOVDQr+RRqcMlMfhdsfh4iNziuI24WzlZgTBR6whBhuizZnCsQg?=
 =?us-ascii?Q?cefmT8S+WVZPvMBd6EkXr8Hd4QpdrrZNmVptTNRc81Fo3SjE3FeMjvJ3gjL3?=
 =?us-ascii?Q?4eJFZLI5nNlAtT0J3l6O+qG1HJtr8kVsLH8XOaXDXYD6PConZLkVLQ5xG9n7?=
 =?us-ascii?Q?uCYzuDTvTFV82srzaUlHenDosr3clKVbfeAelCiPu/GztLZJT9eyMKBNJlEt?=
 =?us-ascii?Q?N8fC1sDNqnfJZFMAMMdC6PTRzb4E0okUkUdf6PVJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f48b2fd-02b6-457f-368b-08dd2edd4951
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 05:36:51.2076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMw71jwrBr3wVKHycR1ox53QsLlvG/6Clvbp2MbqJ2NsHoSyWDwKmkFyxJnfbaTqJA8SsL0h9A2PpZOKxuZydw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7342

If colorspace changes, the client needs to renegotiate the pipeline,
otherwise the decoded frame may not be displayed correctly.

If it can trigger an source change event, then client can switch to the
correct stream setting. And each frame can be displayed properly.

So add colorspace as a trigger parameter for dynamic resolution change.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 Documentation/userspace-api/media/v4l/dev-decoder.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
index ef8e8cf31f90..49566569ad26 100644
--- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
@@ -932,7 +932,9 @@ reflected by corresponding queries):
 
 * the minimum number of buffers needed for decoding,
 
-* bit-depth of the bitstream has been changed.
+* bit-depth of the bitstream has been changed,
+
+* colorspace of the bitstream has been changed.
 
 Whenever that happens, the decoder must proceed as follows:
 
-- 
2.43.0-rc1


