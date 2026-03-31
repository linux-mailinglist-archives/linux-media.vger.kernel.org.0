Return-Path: <linux-media+bounces-57721-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOG9Beh3y2k3HwYAu9opvQ
	(envelope-from <linux-media+bounces-57721-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:29:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 160E63652F4
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 950AE301370E
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D943BE164;
	Tue, 31 Mar 2026 07:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UREpwd5G"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013061.outbound.protection.outlook.com [40.107.162.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999983BADB6;
	Tue, 31 Mar 2026 07:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941901; cv=fail; b=IQbLlye98qFqXLK/pe/ycU+4DiGEadOC0+KLHXmb40wg6RhNi12QxibNonIsOz0gHC6mDE5VMgGuDjk4vOqEFDXQT1Az7aq+/uxGN+NbfWoooxUCaO1KtYT91AC9aAL4brfq3+3704pUI0jHImpLn93Tm1V4oIP/eMqINX6EyYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941901; c=relaxed/simple;
	bh=x7zRWdL2n76ZRmc2XJgHID/RkyDPOpwdsCRAk+lraNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Xgyye1YWUgB1BWTaTBrNuNWzXlGsNWDB7m86wIn9kGedoOScJyuclWJ54vW8TdgG/NEPZ4Ra7VsogiRhepYc5ztwQGevixaJKwZYF2LYG7lVdqP2hqvw5Jfa+yGkyLXIYCN5HdSZHEhYxBN+rXnTywobUNN+LshR7xUMZAKV1jQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UREpwd5G; arc=fail smtp.client-ip=40.107.162.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMY933ypeNBCx7kRmrwC7DIf5zf1RbqctskE8caLAWmzI3Gy1PUO8U1OAuZ9wWonBI2IxKUx+tJenwleONGqN8Fm7qKs2TcDALJaKGDnkDSg8uzDuyJIEWUAdfeuk60wHwi6Q4qW6mVF/sGvkcmZRydYj7hz9Wo8PDMhHuWCv/qSvdDLSUJ5HfLDjzsxCr9pryVARA01CIX8kPKviUl5PIM1VXQZxK13yjKn467zmep8WWBF5+zNTHgzHgS7tMmRJKaOVDyGTPfUtsj7o31fdUwQhBybcM/hyOCxB/blO7wiBudDM1Xe6GcivGssjNz5mawUqDXWjlu9zf/wEeYpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojCzOytFjq9FbqhDOY0WTjoDgITSoCxrAc62GoQgR8I=;
 b=tolEptZ/P/6k6Q/3+l6gz4YSFRiHVPygDXVwH27S9EEhhSwaOo8lVXbh2+8EInCg44pAFRL/W+UQG8GsnIn3Nt+zhLP1gfWVAD/b/YIxF0x8/DgKsXeMhua34oinKO993MkpAGMLH40MIdCDaWEPdeu+qNPHbB/Mb+xZj60aBwZwX97q4q1wbrDXB1d8IVlSmaaiuluiTSKrUpUQPAoQ6soV3cRr/QWc4zBzR4H9GfbrUXUFG1YGweSrd/eyXXTUpMDyez2bcQ9UnP8PjG09fFCuboSSYULoAQ0iHuN/xo1dcXM3L0dSPPnwFk0LC/awTAFDVCPzsBXmqfM3hUp7Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojCzOytFjq9FbqhDOY0WTjoDgITSoCxrAc62GoQgR8I=;
 b=UREpwd5GFuIk4qV/c/GrPLiRIUV1kTNiVZP2jfGQfNiUCl68U1Jh69r7msnQfg8lGdiE4cjlHAk1dUl28O0XMOhOlqmDDuI5oHl1NaVpkKIdWle+JWGTbVGitBHirGdWMzk2UmaY0fknYTO9uXM7V1C/OKvehVNUqj/gp0tI0AUbKdp3oXXV9fcMdcNermpcijgoCYnQkLOy4Ry0fY4We7O0hnXuWgk54eq5G4IAw+L7WZpyhltGPF8S1a3LGvsl8Z8CiGHGQ4WPSqBuZjz/GGxSgSsff6OYnWfRhPXpnWkLu806BIuyaIi8MIKMGuakkZi8kR8w4L765T/5THJoeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com (2603:10a6:20b:8::21)
 by DUZPR04MB9968.eurprd04.prod.outlook.com (2603:10a6:10:4d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 07:24:56 +0000
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc]) by AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc%5]) with mapi id 15.20.9632.017; Tue, 31 Mar 2026
 07:24:56 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 0/7] media: amphion: Add DMA memory tracking support
Date: Tue, 31 Mar 2026 15:23:10 +0800
Message-ID: <20260331072347.253-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA0P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::16) To AM6PR04MB5110.eurprd04.prod.outlook.com
 (2603:10a6:20b:8::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5110:EE_|DUZPR04MB9968:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8d545a-9681-4421-8fa2-08de8ef69b9f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	q3wwAd9APEpUxrtJVhM/z4l5G1/Lkf9b5rgNQhhl/3JqkUzxO/sJ8ZHpSpUKfQTHB3Xw4NmgWeHyhMOcywYJR5doii8xEdzhNSdIOKkjXIw+kZybWvSfjKixOhE+majs9t7nLUB3Pn/AL/MmHqMKale71wZA4v41Gla2C44C3D/czNibbmAjfWfJjb6Uadkhw+jggp6i+Mq1GgNeKEDOdLyvBRD+DUGWPoWwHxsJk0CtB6N3tSnKhDdJOW2M2aAWXWQptaangF3vt1jH1BnQgXN2lKC87kdVtJfPYTdK9TtSACzbkVLeSVNzACCweubDf+0iSI+JsYe6P9qSgsdU0S3hIcfgUk5UH6xUL0CIfas+ZWJCtSwfYjbBf6ewp2weGwcFP31VQsosIhXwZlnid32lIfQ14cHBtPCyGWMAsZTYGLNqOe3TFUpUchKj7x2EX5DA52OPN/FXMUjSGWnGXw49mOqXRTideEHGSm6pNf4GcE4hM0HxHJprSTCPRpZIPJpC59e5Pdi5EisC05k1OdfsE3UEVn3WoLXBIhE1W1Tj0r8YabnpCxU9nPOfP1ka3a4FeAg/hWZmN/sHKG4X7rZBVdfezkZpxRRW/4ucWfYkx6Hn1sZaEEe/Be1kmcYL5H1LGi6/NxcOdMnvq4IvXUdjPp8IZjuIcE4QolPH9fQrF8u8YbZTwD1rLISt8hW9PLyKYIFEI7NmZXSW8r6eHNK1XYl2Q4vVYnkHmGsnUGbNUmLgsb++A2XtDp+/Ld4N4eocjXBjS8KRf72slGl9OEM09wXer69HrujdfuivMSY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5110.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BKz+AS8lkTfz3V+b/jX1KA0FDT1JSUpgv8uls2bXLFzEnc46FeFdvZ6/JAFD?=
 =?us-ascii?Q?tcBQulpjxRMeAXrJt60XVWHRjA31scOF7+AJdTCOIlhrWGVwhTJK/VESGwmD?=
 =?us-ascii?Q?BpgT2zO47B1T9rH8BPAhCSCzwuZo0rdMqktYUdP7xrKuZeKXBwn0taXVOFiQ?=
 =?us-ascii?Q?TQswBkC8lQ0Ux8t8bCW4PCBEYRrHCxq6vvvd1x2BmW5KOGstLpuI3D0grY4H?=
 =?us-ascii?Q?hwp4tGPUUWz7XN7zifaMkh/jFpOhJqNo/+vJShtGcSce17rqRKsjAzFz3cRx?=
 =?us-ascii?Q?yyD5wuy6DXevdOSdqx0Pq/NN0m6gEcajHJEXQ0ISc4BqMSvhKqs83WvfPfcN?=
 =?us-ascii?Q?v5uqNs7iU8bA0W9omO07OiPI/b/sRxoodBEdQYJp7kQtXVX/3aty0U+bWioZ?=
 =?us-ascii?Q?jVH+EYAoBExzfXmo6NOhAXRVoBSgaWYFF0mDxAXBJb/2iKN/ixFxxPEyeeVd?=
 =?us-ascii?Q?gEN5unodz+nH0aBMQ6iASFspSXtfUCtG0Yc68+vfLLJQQsvytf35OcFf5HVE?=
 =?us-ascii?Q?eONtQsy2UJpkw5/1QDYEG1kK2mtSNA+LZzhFKrPBN6vodtmlnU1tDDdi4qhh?=
 =?us-ascii?Q?+U7XPQSmy5MQY1g4OGTQDRYd6r4s7FIXR9a5TYmtFuHic2apRSbTrsXzPJIr?=
 =?us-ascii?Q?w6PkUwFo2sFY6JTueu1zm2d1YMKC7aNJQ58AYXRzUajWLQzocyLZK275a5/c?=
 =?us-ascii?Q?hOFkmud1gBUHXv+mtrJmF7dhk5holn91+8U7n1EvtzUUneCbPsJhocQ9evcS?=
 =?us-ascii?Q?SCoecOIl2JphNbI6dFX071czkuUD0JT33MRHVLCh4pBxdX+SUSdv+remgRwp?=
 =?us-ascii?Q?XXgmwsiRKZztuq/GcoFbsfm7EBRum2G1Of7CzANSA3OYrZp1unanRQGqmKA6?=
 =?us-ascii?Q?5ZEi9b1KFulXgzUJwy18/mGnAOQ8I9LjF/wGfpyHd+ZSldStK9RFtDPCGkCv?=
 =?us-ascii?Q?J7E+4g/Y7XyO/JLPf+C9zO59bJFiiSv4Hc1vugYKAHlRswV+HWY6V0x9dgce?=
 =?us-ascii?Q?wSNZG3zb1GtVO/rYSVtOzdQYDg8GavdiD/i8ZPGu0Slnc8xQ35Z40fwDK+dw?=
 =?us-ascii?Q?syScp+8JjIukKPn/6DH8AB5LE98ObraMb/68bLj5NHKfPSLJKrq19COLMBCD?=
 =?us-ascii?Q?Jmuqm9AZC9ycndkH/CIA6srOxhY23T+oaGyeuc+d959hJSvfx6LeG1NjG4jP?=
 =?us-ascii?Q?jYeittqcPpupNwmDVG9InCdvIQTRilQfABCGzOkTeGMcQR1L0IdreH3XUMkM?=
 =?us-ascii?Q?404x0dxZvdV4D6eV6kEdJE8+rycv7Bzqb+1Ez9LCQYqhMqjlHtSNG/R09zT5?=
 =?us-ascii?Q?j4L4M6ONW1GtNBWgAwenQV3m79RtfbLJvKcT4bs2i5i5sJikWldKeVfA0URd?=
 =?us-ascii?Q?+llL4Lo/zvokpMGFR4/4fIYKp7ZA1AYahdXsXnlQBBAPVIdVmRNkeVa0hXbQ?=
 =?us-ascii?Q?SmIdBkh8DnFIzId1sMWUpfQGCHOWNxjN75svKO9NBEw+7PIVtJFOhfC+YzZj?=
 =?us-ascii?Q?zEagt57vveQTzUa+N2Kjfx8sqhrzxSuhyZcpdokOVImP5+myjyIYH+9eFSvs?=
 =?us-ascii?Q?uu/Q3lO5cqyvOJQ1eECFI9R2ICY1BbaMv+jKMZmeZPooZJuQ6GdIwtoF8CHx?=
 =?us-ascii?Q?u4yihYy8S5hn+BaPQ71khjrlEMRBK1UJCLvojzYeDwAD+ctFN8e9A6c7fu0T?=
 =?us-ascii?Q?+60073Ke0usfcoeWL/Q286vJkdv+9qxlRBi5mt+v89NrtqNFAPMBnxaediaq?=
 =?us-ascii?Q?VCkR8eKtCw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8d545a-9681-4421-8fa2-08de8ef69b9f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5110.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 07:24:56.0399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fngj1J3YWi9hcUCiFnxQO1k2hmSRR2WZLZAGgaRNe2uoDQOVfssgzsBRu0th13O/zzAWwTctPN1ucDECGU9Q2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9968
X-Spamd-Result: default: False [1.94 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,ndufresne.ca,collabora.com,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57721-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.nxp.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: 160E63652F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ming Qian <ming.qian@oss.nxp.com>

This series adds DMA memory tracking support to the Amphion VPU driver,
allowing userspace to monitor memory consumption of codec instances.

To implement this feature in a reusable way, a new V4L2 memory tracking
infrastructure (v4l2-memtrack) is introduced, which can be adopted by
other V4L2 drivers in the future.

Background
==========

The Amphion VPU codec driver allocates various DMA buffers internally:

- Firmware boot region and RPC buffers
- Stream ring buffers
- Codec-specific buffers (MBI, DCP, reference frames)
- Encoder/decoder working buffers

These allocations are not visible to userspace, making it difficult to
debug memory issues or monitor resource usage in multi-instance scenarios
(e.g., transcoding servers with multiple simultaneous streams).

Solution
========

This series introduces:

1. V4L2_CID_MEMORY_USAGE control
   - New read-only control reporting memory usage in bytes
   - Standard V4L2 interface, queryable via VIDIOC_G_CTRL

2. v4l2-memtrack infrastructure
   - Hierarchical memory tracking (device -> instance -> queue)
   - debugfs interface at /sys/kernel/debug/v4l2-memtrack/
   - Reusable by other V4L2 drivers

3. videobuf2 integration
   - Automatic tracking of vb2 buffer allocations

4. Amphion VPU integration
   - Tracks all internal DMA allocations
   - Organized as: device -> instance -> buffers

Ming Qian (7):
  media: v4l2-ctrls: Add V4L2_CID_MEMORY_USAGE control
  docs: media: v4l2-ctrls: Add V4L2_CID_MEMORY_USAGE control
  media: v4l2-memtrack: Add V4L2 memory tracking infrastructure
  docs: media: v4l2-memtrack: Add driver API documentation
  MAINTAINERS: Add entry for V4L2 memory usage tracker
  media: videobuf2: Add memory tracking support
  media: amphion: Add V4L2 memory tracking support

 Documentation/driver-api/media/v4l2-core.rst  |   1 +
 .../driver-api/media/v4l2-memtrack.rst        | 140 +++
 .../userspace-api/media/v4l/control.rst       |  22 +-
 MAINTAINERS                                   |   8 +
 drivers/media/common/Kconfig                  |   1 +
 drivers/media/common/Makefile                 |   2 +-
 drivers/media/common/v4l2-memtrack/Kconfig    |  19 +
 drivers/media/common/v4l2-memtrack/Makefile   |   3 +
 .../common/v4l2-memtrack/v4l2-memtrack.c      | 825 ++++++++++++++++++
 .../media/common/videobuf2/videobuf2-core.c   |  13 +
 drivers/media/platform/amphion/Kconfig        |   1 +
 drivers/media/platform/amphion/vdec.c         |   9 +
 drivers/media/platform/amphion/venc.c         |   9 +
 drivers/media/platform/amphion/vpu.h          |   7 +
 drivers/media/platform/amphion/vpu_core.c     |   6 +
 drivers/media/platform/amphion/vpu_dbg.c      |   5 +
 drivers/media/platform/amphion/vpu_drv.c      |   2 +
 drivers/media/platform/amphion/vpu_v4l2.c     |  35 +-
 drivers/media/v4l2-core/v4l2-ctrls-defs.c     |   8 +
 include/media/v4l2-memtrack.h                 | 220 +++++
 include/media/videobuf2-core.h                |   4 +
 include/uapi/linux/v4l2-controls.h            |   4 +-
 22 files changed, 1340 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/driver-api/media/v4l2-memtrack.rst
 create mode 100644 drivers/media/common/v4l2-memtrack/Kconfig
 create mode 100644 drivers/media/common/v4l2-memtrack/Makefile
 create mode 100644 drivers/media/common/v4l2-memtrack/v4l2-memtrack.c
 create mode 100644 include/media/v4l2-memtrack.h


base-commit: 4fbeef21f5387234111b5d52924e77757626faa5
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.53.0


