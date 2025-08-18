Return-Path: <linux-media+bounces-40180-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D28F4B2AD93
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 17:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9270B189FF33
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 15:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55723337684;
	Mon, 18 Aug 2025 15:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aaVJzp/k"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013033.outbound.protection.outlook.com [40.107.159.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3C53375D1;
	Mon, 18 Aug 2025 15:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755532714; cv=fail; b=dw8adCU5FOsnWl4jpdAL1htS85EQHzmdoBDn08P32L3G2+zG+BGiIX8S222B5yUo6/ux4IExrev1q/T2tRZ95FqVl52H0mFT3J4MXDcmIcDVIh7OLxNdIUwcOADdzaXFMoX3n6m8ZVKmCL1Fl9Ba8XOs5iwSxb+6wCCYPjRO/m4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755532714; c=relaxed/simple;
	bh=bmi4PyFYQcUfDw2a3TKJkStlpCiVDYgxSWpaB2yEfgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ttvBgp7N12ZMfN9NRAx+9JiqWAAAQDkBD41tRqLONkPkKix3kt8QMNMmSjI9CLLnCyjq7fYm4Ng3HBlqoLK6TreT/XebYw/+HksMHfo17rGknPHKbkttAgV/9MmyjagWIwFqRad61bqTPpz56clfPUJAv+ky3WjV8waSvRyQkZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aaVJzp/k; arc=fail smtp.client-ip=40.107.159.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXBnOcElzrm8O2fqIk5cVylSFndKADOFdJ9WZoq1AahhIcn1N5NOlO019FxbXfNkwBxzzbMcqAXed+3t39Rfl+h16BEWK7fXCS3DsFfOYtJRCYWM+6+DAmUHPDX21JN+Z5rKtUq/pVuCf2teUeVTaaWcQqAjHnqfGHm7vuvoEu3jrSvmgRpr2l/VyAzB0+qZxQCpBBDWW0C4RP7uKMLwxpqrBDp5+q8ZuOktbA8jfb1fOQW6qphQVdyqvpeTa8izhH0tdyWMSMcYa2K3gT2Idln6RAV1wgmDg1Z+OBszcHPY4oQZax3XMLsex95ekYRMDqTnjrjoidXiyrDCnV4jFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GnKI2UnKN6nMk3JCKT8gNCaBO6QVvSjHS6rllL0SZs=;
 b=aUAHJJMUhUo+0VCiQlxmVVOnphXuO73kTvAZM+q6vsaTe1yPjaWmeKCsaptmcO09JTzb+P7H/kNClZcKC9i7I2yrnZaOqAnfyytUjqHLepIwVq655Pn/C6SdRxdfJBMqMN0rckeJ33Rv7Y+cJcpGHSmu/5O2jqLAN0daBsGT6US/n4i8WfcDoeLabQFtcr5RwEc+2tevt84IPQO/cbzvADIy7qy15LAhiyBkHG3cTWdLhEa4WpxChxqgi83xKJH4LEL4J3wP8Ejp20GvbLpm4WjBgJZdv+mSqcSA1iFFkGwRjbhoxfLgU+fuVnozM00RGTT8cvVXEUG0sghevXYNBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GnKI2UnKN6nMk3JCKT8gNCaBO6QVvSjHS6rllL0SZs=;
 b=aaVJzp/kNHALbKptPSE8hyp05c3R/jQQBc+7/sUZzDFwefNk9E2oR/Pf0Z9bmCSFB4/10HA452DPN72PR+Z6bENfnLE4ufeORvMz3GGYH4YnnGaEO5CoSpuc2TPj8tmOEs682AKnIrPcyBeIXvsBwTDKH9zSJj/znwfxs3pvnOASocycGJvS08aWoYLBJZU6K+SuU5W+6PXHc1FvM7GubRc5qSJqF2YKsCjAo8atVAg5clnMg58f72xCV/l2f9Px5Gia5+NxPlAaovGnSKZfGDyJNFyaiERyo3TdewXnfRWI9gZT+LfpaEo/iuonTKrdesZAEG+ouTxxkB3BgZgfDg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by GV4PR04MB11305.eurprd04.prod.outlook.com (2603:10a6:150:297::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 18 Aug
 2025 15:58:27 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.9052.011; Mon, 18 Aug 2025
 15:58:27 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	ribalda@chromium.org,
	jai.luthra@ideasonboard.com,
	laurentiu.palcu@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	julien.vuillaumier@nxp.com,
	celine.laurencin@nxp.com
Subject: [RFC v2 2/5] Documentation: media: Describe exposure and gain controls for multiple captures
Date: Mon, 18 Aug 2025 18:58:06 +0300
Message-ID: <20250818155809.469479-3-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818155809.469479-1-mirela.rabulea@nxp.com>
References: <20250818155809.469479-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0256.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::19) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|GV4PR04MB11305:EE_
X-MS-Office365-Filtering-Correlation-Id: ece628f1-de8f-4429-4eb8-08ddde70116d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|19092799006|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W54KP6VukUFBZJhgV8pPYg7HYhZfh3O0AtUbpmN3fCoifkmNqBGp2Pk6ARTu?=
 =?us-ascii?Q?hIq8hVBZ4Za4QN2cg4DBddk9eyqfOUAepYh0GFyjQHJhyP9ubnoI7zGSwS+I?=
 =?us-ascii?Q?RE3pEuRi22//83zs1K3NcTQ5UFX1c3OFhA3FHiNjMKDSnxPN4F8jWDd9BH5b?=
 =?us-ascii?Q?9/7M9oyEkkgYljeSYdjztZSqLcGOPI00RxYD+FzT4Ev9Oq+ZBpTm6CaYStCI?=
 =?us-ascii?Q?0hikmQUojbeuwvsupdT4jq5tohgc1fBqJITfhtMf2gyeHsjuNArWZG9smWe4?=
 =?us-ascii?Q?rNJOvce11aDEzgPyRLUhpEhY3ZKdmG3hB9l0t7Xm/+3J/NLFP6eQD0zq0FdK?=
 =?us-ascii?Q?2DHh3/PkQDlkPV19Fi4kZrZVEREqvGDbgZ556jS+/N+PmbFZplf+fLG3Qzbk?=
 =?us-ascii?Q?uh+VUIQoDTMdAggzGtAmwhOOe5Ov7cQelC+i8210lnQaKVDUhvzota2I7dBn?=
 =?us-ascii?Q?u8EylaiPjq4KwXP1Byb1espELo4UtVvXKj3PFjpD+9U3wbSfejwgaOeGwSTv?=
 =?us-ascii?Q?1QkyQdnVBtAAqqP3gi10ieofbe3nK7dhxh7qAIiAVfSL++gZolB9rWwtxajX?=
 =?us-ascii?Q?WecGW2A5VjHUPGPSOF+mhGn/GOLF6cw5KdZ5rE505l8E6wePFkCq6C6iGDKu?=
 =?us-ascii?Q?qlrhKVlOm5Q0pRM6oWeiKFwAGpIUf4+HIRO2FhbCEOee4UeMhFwCcS+ldHmp?=
 =?us-ascii?Q?km3yA91lXF7J37vfyy7TnOXiHNZvO2ROp+z9uEWfmFL0y1HQe5BmwbRcvCvP?=
 =?us-ascii?Q?TH2ltloRPFUy4r3wyFZuMZymrsFhKwIu5h/vk4n29zKSD9x4XuZ5eQsIyWJp?=
 =?us-ascii?Q?x9WOiAPJ42qZO3KFtJZkRAjWgINDLhJF2mfXtHCND2/KrJzCT9EcNtDtnzkc?=
 =?us-ascii?Q?Z3/foNQufIF+XmtNAE+sDbZRYMVCCn/E+OndkP4+6ehI1RSJjp3qTtYjfZ2T?=
 =?us-ascii?Q?94lvfDsBYvAa3EcVRWC17Shdyvrw2Yui8MmpJN5MO76KLoXcbLtaollRMtNM?=
 =?us-ascii?Q?nTmbjyKZTEArEZ4U8OijDcG8fPL+DJLL7HP5BKVngYS4UvoaWDmo0YQsW7j4?=
 =?us-ascii?Q?Uh76Jo0esYPOAJ7MTh9pf79017smHD9TGWgo2EyQtf98VCOV2ozqfYk1QBwz?=
 =?us-ascii?Q?sJG4vBAko4fhVE2ghQDQclwkvrDlAMnxwThvOKTcGkPUOSP1rXU1serzR60V?=
 =?us-ascii?Q?YQh6uBfdGcZEf/FDHryBzLXL9Z9UW5xCf1OwNJlo7Gg0epFgE5YPI2rc6wGK?=
 =?us-ascii?Q?TG0YBZL34owyOQJseM7y2K1oTN8t70FFuUiRax+1xPspUEBAiUj5oK+M59BB?=
 =?us-ascii?Q?zVIeZB7xVjLAfhzswBeEoRar0wDm6kZdhKjs9hvjg+I2S2hcpW0MDpXuBu8y?=
 =?us-ascii?Q?s8JLT687D6XRsNt9fxPAgSXeBUoLcV1b1wUzuISa7taWP59DCPq6mgm6mmgc?=
 =?us-ascii?Q?6l95vIzVsxkRbc1NUvvTjXYcwlU/+t9tjznS7G2QkfJdKjkrTDg04A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IyTFn0EEZIkxKa/YL0nXg5Ev0uQNPTcw9NsH7+KKCWHh1QPiHzUyOP1PDCtC?=
 =?us-ascii?Q?Sd9H0Iz8MAICBbXIe4AocQvRMSNsmX5IVednn7QRPNB+ge2kCoruW0euWeHM?=
 =?us-ascii?Q?EtlPrtWdkR+/Hph6dLqjUbmpN1CNYdlmDaClyq1eZBov6SdLAauDN24pjyyv?=
 =?us-ascii?Q?xyJGwl/vip/gw7+X2TlbZIj5VIoYuh6d4oFs5/Vt01w+DmVNBdhaG9+SLaf2?=
 =?us-ascii?Q?qtV9nAGwUnFoUlG0DPZUllmlfwzlDzZ2IGXLyBZEaSVyoVdVA14HBFkTdJpP?=
 =?us-ascii?Q?7oXCm5gCtIgxHKRNLEiXMHohlpcsHARUsxw/xkWM2dyhMJqs3R13HNhxYpHY?=
 =?us-ascii?Q?ICqWkk+YxR+MCEwik/zBwE1D/czFa6966LfmWGtOgUaMWXBb6pr35bZ2bXAn?=
 =?us-ascii?Q?f/Hgdbl8jdJHxmcsecV2ERZZm4QlzpKzTgsPefci90E3QJ7Ib7lF9i7GI/c0?=
 =?us-ascii?Q?SVS4xMMtGjHHeZfphTVizBbzROa13rwZ4eaPG/Pmptohf6afEnZGcamsGoHP?=
 =?us-ascii?Q?Y60OfIvhE/7sLV/C7pFqG4LxBMMlmMtO6MdPd0hInbd4JlMOApgtoBIu1hKy?=
 =?us-ascii?Q?z+7yOUXA8cBaoy8aQDApjs9M08vck0sDJl54NT3OgGJL6rO24P+HugmZF/en?=
 =?us-ascii?Q?Ka5DYKHJgOC/r7HqKPvomxawd6bRfMlSHGxkJxb0eNFoP4sVnFzUhSHNdMoL?=
 =?us-ascii?Q?uHgX7LMp49sbXQsPXuU2kON3uULAs2FS+pOgBbm4VZJm+VHXSQnJP9gLwjD7?=
 =?us-ascii?Q?VTK4619ZWa/79o2uBtbHFU1mEHV+tgTKMITspBhGU/r1tgXZlkb0/bY2Wv46?=
 =?us-ascii?Q?alCSTYtxfRx1uuUgD9oZDTW/CPHYh5Wiyn0KqRpLJM+rUKuxZEBfigdjMj+C?=
 =?us-ascii?Q?lUs8zt6MrGdaXUPkODG8KdNzLNq8q5GvlPQVaMa3tjMcdLLX4TNGYlq3ZoDO?=
 =?us-ascii?Q?sXiKDHUu12jrcSEutAXstu2DUnkeonZ5Io6C+x/APCGolSKslU9jPXklEFrE?=
 =?us-ascii?Q?rR2dQWDT2ciZ8DWB20GOpsAnphpQgR0+GVZknHMrcU98InFqt0j1jD9avO7x?=
 =?us-ascii?Q?nTtPQLVGvjGOgKq5DDx4nfx0tOHcPAcuPXKBnkixjYV2C5TxvoMsBlmZMI7W?=
 =?us-ascii?Q?Wh9Z3M7F40DN7RMq0CLqAEsWeQPcuxRpjpckSoKsiJo83m5+++hxCfZ9ApVv?=
 =?us-ascii?Q?UonXcKakyPMyKFJoqHXSaZCZgW0U//CIwp2/rj7j3KSVYdmHnslPeTTaMZnY?=
 =?us-ascii?Q?qty8H944GvHvOMCisv470efdCJz4aVrWXCwMvMS9UWDXPa/ofgAWUe1AxAeJ?=
 =?us-ascii?Q?dbagB4AaCFtdkP0CR0Eg7Zlp0aTUB9jEnydiWfbRiQmmPBsqBNe+4xQ8c9/B?=
 =?us-ascii?Q?PKHITkd5XtuR5jzU1XlGZiq4d8vTLmVCTKpTYylrqjpZfuCXmP0HpD+TCEfE?=
 =?us-ascii?Q?gy3QkIIwkKSrdyLXzMG8ZEbjOkPXxMEJ1nb0qORMOSrlublkMHnTiBHb/Zds?=
 =?us-ascii?Q?KpkBFfc4foY5cYZVMXuVrz6kXYPUwFxADMbXNBbfxTZtgP3t1B+pn+XlnubV?=
 =?us-ascii?Q?7LOw1ifBAd2P8cdk0Dca9eHdRGniu3LAHP3ywmE0BbxvytjxBP0hcDA+TTuv?=
 =?us-ascii?Q?LQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ece628f1-de8f-4429-4eb8-08ddde70116d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 15:58:26.9352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTjbQXbYcsEwlmHiSOjQjimtTvp0rtcTfCzuLgn4qKvF6PJW67u9xGOVKj9K2Dy9eON7r/Qi6cfYWVougrCxxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11305

The standard controls for exposure and gains allow a
single value, for a single capture. For sensors with HDR
capabilities or context switching, this is not enough, so
add new controls that allow multiple values, one for each
capture.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---

Changes in v2:
	Mention order inside array, from longest to shortest exposure
	Mention not to implement the -single controls if -multi controls are implemented

 .../media/v4l/ext-ctrls-image-source.rst      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 71f23f131f97..2526d4d19cbb 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -92,3 +92,24 @@ Image Source Control IDs
     representing a gain of exactly 1.0. For example, if this default value
     is reported as being (say) 128, then a value of 192 would represent
     a gain of exactly 1.5.
+
+``V4L2_CID_EXPOSURE_MULTI (__u32 array)``
+    Same as V4L2_CID_EXPOSURE, but for multiple exposure sensors. Each
+    element of the array holds the exposure value for one capture, from
+    the longest to the shortest exposure. Drivers for HDR sensors that
+    implement the V4L2_CID_EXPOSURE_MULTI control should not implement
+    V4L2_CID_EXPOSURE.
+
+``V4L2_CID_AGAIN_MULTI (__u32 array)``
+    Same as V4L2_CID_ANALOGUE_GAIN, but for multiple exposure sensors. Each
+    element of the array holds the analog gain value for one capture, from
+    the longest to the shortest exposure. Drivers for HDR sensors that
+    implement the V4L2_CID_AGAIN_MULTI control should not implement
+    V4L2_CID_ANALOGUE_GAIN.
+
+``V4L2_CID_DGAIN_MULTI (__u32 array)``
+    Same as V4L2_CID_DIGITAL_GAIN, but for multiple exposure sensors. Each
+    element of the array holds the digital gain value for one capture, from
+    the longest to the shortest exposure. Drivers for HDR sensors that
+    implement the V4L2_CID_DGAIN_MULTI control should not implement
+    V4L2_CID_DIGITAL_GAIN.
-- 
2.43.0


