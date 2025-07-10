Return-Path: <linux-media+bounces-37430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE5AB00E79
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 00:07:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D8FC586048
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 22:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7363129553A;
	Thu, 10 Jul 2025 22:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b6BKywh5"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2C835897;
	Thu, 10 Jul 2025 22:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752185240; cv=fail; b=YIErS95CDgAvGDt7KLL2X9k+Ht9gWc3pCUB5k0s3gmGSgJAX6Y4vUIRi3ZUVLt02mCJTSWclOSdJW8j9TsUjo02qKUiokss/LmmVQNuKTAXIN5RAAkSCtNIvG68k0f7cwg6ylzxZODfpxP7REqTRMBQVCTfdLhSsARCz2+S+Vtw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752185240; c=relaxed/simple;
	bh=ScLvesw48iDmZ0EyZ9speWzsnBEEBHqno56U8iO6Wvs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=J0vtD9MJgYnmkHp1dPqncMrKVNOgQn8XZoSg76y3y/VlFDkmJx6pkNOdev1yQ1fRXW1FcxCtvWYIdzV24CDGsNuhoLb2cBrtwgkViPZouhs63MTJjJbVXT+kzgI56naLXAFvNY3lHKT+ZB6saGRcUS8ESgg+Wc+f0dGKmenAWEQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b6BKywh5; arc=fail smtp.client-ip=52.101.65.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSYOIqlzD++Qsn5XoNlIjADdhri5c5ja7DGx9RqW3pyz2C/I80hvqhuIJqkhyNhvNhPskn2z5oPQRH3or/OgAEBtWbanczOQgI30ihHDZwi4gnMjDNfJoEgJNwxMb7c9rWF0wpQipZtmjSpTTwDwYqvsdNYxm6qNA52lEVSyl6L/Pib5JApObnWnPyPVX69I1iqj4CX0BY8Hz5FjTPcx7mu6SoaIO9j7Jhu3ryTxMWZyhD59IPA/x2uoj1F6hU8aFjDZUmCIqoRBwSiLDxXk+vsmsNpZNouss9j/VV4+C4nOKMXQt/REW4zyxkNSAf6ABVXp/lBTyq+2PhxjZbdmWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWbmchnCgxuT7loXGlLhzZU2FN92gAW3odHBXPLQczs=;
 b=Ny6OfQpnEJyD0VzYarw8ALj171GWJPpjw22rXvqz8mIdeb1JB83vEVdcSP9kzVwOPQ2FsNiChxlspwo8DxpZupMpQi1bw/hgjk3ThEUHxamoSuK0iv6ol1Z3db6bjihp38o9iTeGhT1B4rdm/tzbkhQT/RCU0RWly+Zq7uXNLpZzx9APrkQbNjRk6Rk2nsGACLr9X3taL5rmnpFfe5Lq+YlLD/Bkrfphm1Okpnxb3gYRdltt/ZXAdVi8itc/DBWmsFX0NmGu88suuzmVVHYDC4fAQdCstxBWBuF3m+eAGNGizL0aEybXpU9o1eDRiXgycN+qgtRXgMMXI9kYpbNYsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWbmchnCgxuT7loXGlLhzZU2FN92gAW3odHBXPLQczs=;
 b=b6BKywh57hRiS41sBPdyDMdCaORTw55zTk7eYWwWQ1zv6mMOc7xWrUfZ7qRLEg7ZyZsyYBrt1huY7ZbYff/noVIBLZ19rCK2s2XRuPJrQX0onRNtN8oBO/HgQQ5X1lqiG6upsHilS/LxtuYeC8fCKjlABOebcLfHhRg8iQpC/L0p4ZWwUr0zZISlLD2CApZZ792xBkSz4fznSHa8NH8J56kWkf7c1nIC51UAMTRyYqmP9md6OKMjx8dAMW42bgqpvi7juFd4DMAPk/yaKo0TEXqPN2V2YZ5UvNzeqHDP+RkPODxRHT5N2G/Ssyvia2Yx1jBzB0bAicni+SZmuUoWHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AS1PR04MB9582.eurprd04.prod.outlook.com (2603:10a6:20b:471::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 10 Jul
 2025 22:07:14 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 22:07:14 +0000
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
Subject: [RFC 0/2] Add standard exposure and gain controls for multiple captures
Date: Fri, 11 Jul 2025 01:05:42 +0300
Message-ID: <20250710220544.89066-1-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0211.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::7) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AS1PR04MB9582:EE_
X-MS-Office365-Filtering-Correlation-Id: 686a213d-45b7-4f51-d3b5-08ddbffe2091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GwWbCXqfqBH5ZU0HnUzXRdeGjWcVI3x0Xw33O6GPHBJFn/1uXyDgmFTKb7LK?=
 =?us-ascii?Q?jsmQ0ospIoLqkMlBriFSILBv+T4wqvqHsCB/er7f2NK4GQmUAMNDezjGruEq?=
 =?us-ascii?Q?M7wQcZ2+bTChOGmDfwgCkQnNx/4gtX3K31eVOFQUvZeHba7haxSK7yXo9nsc?=
 =?us-ascii?Q?N1OsfaZEkB08dP3h5r9r0IhKKEvHEP0UYsEoTIKmpEjn+a+EbFWdeAxucayH?=
 =?us-ascii?Q?38jUFNWOSWyOw8hTw291aZMKFOaFyH/xYSyFINunQB5A0xpXVRren+2Siqt/?=
 =?us-ascii?Q?pMLQdAQPumOJdPJrDc43rkKoEmb1aVE0YqsDkxstzlWbIgNjhywZVnS7kaoT?=
 =?us-ascii?Q?34zRJ6WcYu+o/BYKcWduMFjyCp2BZ2OHCfIS7EwHASUO+976i3iag1LSb6Zw?=
 =?us-ascii?Q?aU4F2jr7jcYLLpPidRXahzvaDXXv/lyI+7JtWheyV5IOmT7U2lzhAtteqz74?=
 =?us-ascii?Q?U22SxPeBithAQT8s1ZzS2Irm9RGYGPi42w8u8n4wTX1N5botBKH/Y7zXtWtH?=
 =?us-ascii?Q?nT9SA2OVoR8SyJuzia9DU4tpIUGmK9ixyStsdm+1GZ9fWpRiQjjDoAXuj4Ii?=
 =?us-ascii?Q?KuafCoohZ62DE3jCHiLZNJ5Z9adL1K1v+EtXNtpCt3IbOK10+pjS0UjcqUBM?=
 =?us-ascii?Q?cN7uB//8plbo8XtOOIpDM7f7GFyKEpsKoXc1fzvPYq80csAkVA+oK57p/GQR?=
 =?us-ascii?Q?Y9E50E9UcbndMYdkaYXfXw2v+EH/1Jo556wJAf4MksPeT/VoqsBttSfB7yDd?=
 =?us-ascii?Q?BlDzV2mV6xBHQpGjzNcqYoBTEP7+ooHW6U+jach1Xh5ZkIwVMGHbSq9ZOBPA?=
 =?us-ascii?Q?BGqXXTD77Lmj3P6L4pSevrDCDv7URvSG3GSG783ES8spDn4B+3z76UX5uZZw?=
 =?us-ascii?Q?s/W3wyd5HSVGBUG+sAc75X3/D5OjE6XQSRCKPQ3xEMi4hTavvzwIq+1GIrLw?=
 =?us-ascii?Q?PnqtJv7+R7eEwcofUXLpXnfVGkgr5wXA/WvVqEM+EHWXJaqeV3L2sdCBaxLP?=
 =?us-ascii?Q?6ZrcMRRlfq03NAwbrnMRq67/fc7lCCxl/KMeahnb9/yFMbIKM3A0t5in5JIa?=
 =?us-ascii?Q?W5smTLFYpqZhMcWJhmJ1mrUSSBnTH0CDS+0BZzy1u3Htxao56ZUKlHOSrRbI?=
 =?us-ascii?Q?iydUZo9AALbZf75nD2haTagaARhHJ5YW7Y3uXR9bwxL6BDEYIwvvVuehgkPv?=
 =?us-ascii?Q?LWGHEIb+T2/Asulgmjg9A3DghnkoAD3HxK7yithZaB04F2CK94llzyEQzQp3?=
 =?us-ascii?Q?oL4xnH91Xp3SUYqnJlkZgTWibo8YC99RWffAvOeSN3zWdtipHXVYuFp6a1r3?=
 =?us-ascii?Q?U5AO7u/ddlouiKkg7IAcTMtEwfHlvxiPmg6dhswg/9GpLXF7LRM8oJLX90QB?=
 =?us-ascii?Q?6fStZ61S0yBGdga5QPkDmpJh+aUy0HItEslQNq9xjYJ8nA6NxBYuuHaev3P2?=
 =?us-ascii?Q?NszlcWXCg8++08ziZ0ZFFoVVWPmB8KomAXS8zXdJVmaqhnSIsdL5OA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v5OX7sypxBJAP6NjuvOmmdHT0DWf5JbVnlWyBaFwizYAnhl5pFaexfWmc/rT?=
 =?us-ascii?Q?U/nQpHULHSVydMcTQ5GhRUvOZj7+zEe1sQDBAKDaPDYhawVNEudvku+lfX+a?=
 =?us-ascii?Q?WDDC9M4+QoAMn/VLVZiXQF6A0qKpp9NjO+hbJ8wtWDHYsPL10C11idUk6MVt?=
 =?us-ascii?Q?usYC2tlJIX9a40jMIMa3cT9MO0OrazGS0OJobTunjY7if+yjSDZJNueFewfF?=
 =?us-ascii?Q?Rql+GO3uwyzkTd/yaGR6lpeyxm9VZWV8MWD6eDCL4gL0Cw3h5GqULyRz1NHv?=
 =?us-ascii?Q?BkUTts9PvCI3eOpNd1IshWhZcv/23onJrMZFkOIH545gMr3FLVANLtX616n2?=
 =?us-ascii?Q?SwJ3UvZSb65QRFL2s0I9OWwnVcbYIdb7UZJawUqqlRYhmJMd4huOtuPUmarO?=
 =?us-ascii?Q?P2pqgXxl0rJvvzXY7ElrbxfXrWg9KpnP4ts2BdGZUG/1DvhsrxZfRl6WiTKp?=
 =?us-ascii?Q?lOIt8l3T6hjb31tqlie8BtwOaiwpIP/TBg/OdRKi1OeflN1h1PVtS7tExSrn?=
 =?us-ascii?Q?7nzIsNGlSiZ0m8dW8jIHZReOE7465DnWChamWSXU2F23uJ2uQXY5klTAZj18?=
 =?us-ascii?Q?hNFwIeZ1sOZUMTzpLZP3fj8+WT/Cpyd0D9EkhMe3sX9a30c8K2zVpZifWciX?=
 =?us-ascii?Q?CQVBfxNEGVLLzcxWXmxw/4pv513OztdnF7B3IrU3fAdIGX4RDY2yp4Hc0Obq?=
 =?us-ascii?Q?0DIJMvxc20zs4jhbGz9aeG+XBCWSj2q9qP7Y6dbBm0SLb+O2NGqIh07rdp/a?=
 =?us-ascii?Q?DUGjdX5HPDwgZRwfhpWTa6iWb8BtouqFzQiMwH0U6BxizViQ7Vhbo1R6+sFn?=
 =?us-ascii?Q?dS3FZ3pfqhsQH7ncI8KPZopp2QBgxv/H+KZ9H1tgLutd4EB2htXO9G0YAosU?=
 =?us-ascii?Q?XE9LJufLqKCoboDQorZtOVhgtmKUcGlOHIsLVZloAEmigZKz+pH145vASDTL?=
 =?us-ascii?Q?4p6rvim2bHa0+014j3Br/1zFfXwH95fRIHEnnqXG/mJ8UaIifu7pkvLhOix3?=
 =?us-ascii?Q?cNHw/NhAQvOMp+fFZpCoWDudK9caGGgwzjghD0CFtzZAPX4XfRpxq+Yl9C8C?=
 =?us-ascii?Q?lqSma08oRI7jhWdRBmh9VHPs+u8SNohGRmAE4gwlsUjbb+j4Eq0S+Csn9JiM?=
 =?us-ascii?Q?xA2fLyVQN42+NabVOx463AmrlcYht2gJcyAHbOC5DIdcfGbHkq0TfIngm/p6?=
 =?us-ascii?Q?MbJow8usWpwD6Ge+YWJF561r2i8w4rhOAde4+Ho1xaXaYxXZAuE+QLM0Mm6A?=
 =?us-ascii?Q?Lj2z1UDSsL4mzhfzUPRWGF/JCdd7JgRUG/UBZU3rO/gCxp5CJ6fd8N8ijfc1?=
 =?us-ascii?Q?tP2Irdifp5DDgg8UKnqQDY5SCFmY/QL6u4I7kaGuu+DnFo/sBuPyJr6BrkV4?=
 =?us-ascii?Q?EEi9aEYfCB4/4fi6bzmT9ZnH4XxASx/wBHzpLppO8U2KV7GXZkxT7wLaPdr9?=
 =?us-ascii?Q?g7d3OknCRDs5oNwBs50PmzSM3nXmr4JX+DueqkWXDe0F/yVbuwYS9yB3MIEA?=
 =?us-ascii?Q?fr2LA/VA+NYxosedPOwkYQLgpbBryEDncxfvV8kGBWfZGoF3By5zRmV/k4+s?=
 =?us-ascii?Q?U9QGFPg+06FX2gHiW45MeLM/h8sVRzx2nmLZ1Y0L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 686a213d-45b7-4f51-d3b5-08ddbffe2091
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 22:07:14.7582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jqnJeED94j+aojdaKEh7nMyeaL/FRnl2m9/CDgTpANuvBs/293DwwIfKiLH2EZu7swv4n3OSSVIGIIC9QiXhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9582

Add new standard controls as U32 arrays, for sensors with multiple
captures: V4L2_CID_EXPOSURE_MULTI, V4L2_CID_AGAIN_MULTI and
V4L2_CID_DGAIN_MULTI. These will be particularly useful for sensors
that have multiple captures, but the HDR merge is done inside the sensor,
in the end exposing a single stream, but still requiring AEC control
for all captures.

All controls are in the same class, so they could all be set
atomically via VIDIOC_S_EXT_CTRLS, this could turn out to be
useful in case of sensors with context switching.

Each element of the array will hold an u32 value (exposure or gain)
for one capture. The size of the array is up to the sensor driver which
will implement the controls and initialize them via v4l2_ctrl_new_custom().
With this approach, the user-space will have to set valid values
for all the captures represented in the array.

The v4l2-core only supports one scalar min/max/step value for the
entire array, and each element is validated and adjusted to be within
these bounds in v4l2_ctrl_type_op_validate(). The significance for the
maximum value for the exposure control could be "the max value for the
long exposure" or "the max value for the sum of all exposures". If none
of these is ok, the sensor driver can adjust the values as supported and
the user space can use the TRY operation to query the sensor for the
minimum or maximum values.

Mirela Rabulea (2):
  LF-15161-6: media: Add exposure and gain controls for multiple
    captures
  LF-15161-7: Documentation: media: Describe exposure and gain controls
    for multiple captures

 .../media/v4l/ext-ctrls-image-source.rst             | 12 ++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c            |  8 ++++++++
 include/uapi/linux/v4l2-controls.h                   |  3 +++
 3 files changed, 23 insertions(+)

-- 
2.43.0


