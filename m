Return-Path: <linux-media+bounces-64693-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id taVnLzkJLGpIKAQAu9opvQ
	(envelope-from <linux-media+bounces-64693-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:27:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B18C679CBD
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 15:27:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=nxp.com header.s=selector1 header.b=YGXrvbyh;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64693-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64693-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=nxp.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78FF931EFD70
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2026 13:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4093F1AD5;
	Fri, 12 Jun 2026 13:21:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60193EDAD5;
	Fri, 12 Jun 2026 13:21:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270464; cv=fail; b=pEz46CRMvnF5R/RqJtHfSCYUthBrI7nYBKg84X6mk9sfQnfuflXpklytThRGyqi7469mob4/wqrPnXQuZFwBX8YCpkW1cdp8zWpIXF4w5/WUe61VHv6fexrzX0TUMEg03nSRZBSqcHJT+5Tp+wt6MZGnCiZuDrPkEKWQ61yty5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270464; c=relaxed/simple;
	bh=jxJ2Urjr1Gqy5nBVn+PubBSEb1SeEuU5gxubmvePbbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oO8iIILilvYC8rx2tP+yGaWixRFWGBawZjJhvl2jH7/52PTXWX6rC4fiB60HDmUIAf9R7ELeOwOLhVXCnljyqPx9Ilz9s9BkJgVsZW/x0nnfFtTKy0szOH8AEPEsdqGBmEKKQ+QkDPAGypXtl54tSKuqkRSm+UU0wAuwknmLDPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YGXrvbyh; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDFrrh0SfCS1HHdXlajlVheNp9ntYS/BiFPmIAaJPzx8/+S32cTOI7MzAdrLHlnSom4OhT4EpIoF3r96pskGSJXBs5SpZWPKiZsF0tpXWpHIUJiqRQy8L5qwqE9banyYFw5yaqloXCY9GOI+Fy0qDzrt3tkfI0oiQ/B9+V/VqJPNAaloiU6hKmEnhjTDAbTOvlaU97VEVkVzRz5OMjIMkhwrBTePTYmFj85SPItx2AbzXJf7trfliO2pc81p9Xbm+k4C2w5Bg55CgznGXJu0yQA/6VM+hGCjN/Dy847LHeiZBG32v5h92mSViQQyWpHGb1qUC9KXhzMqLtG3iiOL0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UdPWwS328qxBWsvVz5I1WqQPinMJqRJVHV18w5JPFug=;
 b=je/2p/N5Gi/Ru/jx+q796VGZWGWdHeHwYvQeJbSklUOd7DmCAcJ6gN9M7HL4qb5OZz/eY+jCNm4h3FmUGZlbeULf+jdNyR/d5l1BRwlujSo4/coZBK2A3qtRdTxIIjyQPS6z1+X/wQg5NOvJBTtLpADbsblO96sWZjhu2VNpeYQoTf4BsfTHD7GIYv6xuaEXLHZlS12kIyV+rCqPAMnpkwWFOrbWEcT3+k+DKfj6v3jqk/m0h6rWYXa6aN4I4+8IRyOp7WmNV4oRFvwROMX9fPezZlIKM992Ptc3QLW2+hecqdx6/B3+VflCbyQLTOJpoXDvR6KocsYZHNSQrG3NmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UdPWwS328qxBWsvVz5I1WqQPinMJqRJVHV18w5JPFug=;
 b=YGXrvbyhpBOwEICuV7/AbNjKq+P6FR4uy9AhHgURSN+k0C+aVd+gAZVX3tKaylBBw9dLRgb2fY/avSjzOPAUG/BE/z6RWXxfoEx8CMjpRgHh4WrBTge5rH9QTqTMmbzGdFuuo4exGhasCzefP8ISm1Iqc1/JX7w18wLuEA7Esvn1COJxaMQE9y5haU7SgBIL6QwS5aAguwv8chSsI2WWSnmNTJvp2aSUDOrOGB518POzmkiAaP5pTlRSEGmdhYPvDXtkocyDUql3QAdb6bDf5Jvo4QByL5uKrU39xKhM8/8XG382r3xCRwZSrMT6NKpHkKhwVZCyJZ4FXe87T5jPuQ==
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by DB9PR04MB8203.eurprd04.prod.outlook.com
 (2603:10a6:10:242::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Fri, 12 Jun
 2026 13:20:56 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 13:20:56 +0000
From: Antoine Bouyer <antoine.bouyer@nxp.com>
To: julien.vuillaumier@nxp.com,
	alexi.birlinger@nxp.com,
	daniel.baluta@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com,
	jacopo.mondi@ideasonboard.com,
	laurent.pinchart@ideasonboard.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	michael.riesch@collabora.com,
	anthony.mcgivern@arm.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	ai.luthra@ideasonboard.com,
	paul.elder@ideasonboard.com,
	geert@linux-m68k.org,
	sakari.ailus@linux.intel.com,
	hverkuil+cisco@kernel.org,
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v3 5/8] media: Documentation: Add NXP neoisp driver documentation
Date: Fri, 12 Jun 2026 15:20:36 +0200
Message-ID: <20260612132039.2089051-6-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
References: <20260612132039.2089051-1-antoine.bouyer@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::6) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|DB9PR04MB8203:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f0139ad-c107-4424-462f-08dec8856f62
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|8126099003|921020|6133799003|18002099003|22082099003|3023799007|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 3TaeGK3rPD/pya+R4Oxyxpihmqhu5zALEQwUSTxE2d7pEzbThQIKgSPzSZfGgKrmoS5xFa9s4VsqxDF13CE0Gw2TU2OVTgMNw2Brx0Oxgr7zBl9LXZnKmbDwHKdoHrScH/2duZgqIocNi297ImALi5p1/nnkdRFXlzzWGicswpTCUNkAj64VfleAyELUaxs7LMZiGG51v33cYdJCK9m2VPUllzo5rPbwQVYpmKx8Cw9WXKJ7UduEhm7INLYtMlpZBZ8uPDlWD2jwaWbgaaXVtzyg+ZCosCaRtSPRiVpm4v8wRBi52jHJzclI5Szs2Q19wtgnbdQZ8x8V8TUD1yGEEuoqcBkuYIrJtiHqmpJw7xoEfJzr9VwcEB+/aKKU8aKjMKLVB+86VBntAhY6JbutOvtx/S7bMYCmUtvCir488sgJU8YUS0MhfLJiDrkKohm4uPhrP6Qy5e2X71iKmv3WPeNWs0lkEZi41D+Ki5BDizkt5MhQ9MmRrDvihF89riUGRQQVtjb2+R6L5rSebwpU2eFD5Nirx/eWxhQDv/LTzd/x53z45FFMYCncyY885SvGHaf+Bd035ktTFhujcL5DCLqBzOzbU6Apj3sCjRPAtrzkgiLF96ZYoo012+6cZL/zaayoAT2fVhE2PeNTOp4wxLvkKyOf7qkd0fer1DJ21bIcQJE4RW4E+SiUQYY12unWw7JHYGWojtHwuFzTGtm5rsdD2cPTS2QN7rkqbWfIIDc=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(8126099003)(921020)(6133799003)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?WA2MnUS+Ut4whM0uUtTkAnOPF2gHTyHvNu/Sr+xFMNJpJpVFddhMTdYq/ykA?=
 =?us-ascii?Q?xl40Vcv3HucuqlVaUfG8ELIn/ogFu9HXZNC3x/iqc+GEUkd+41yGSnG6z3hV?=
 =?us-ascii?Q?KpQ3W1c1YLTbZkfkGMBG1R4PqA5i/34V/8Uwy+T474xFKci2duM6SguTd+J/?=
 =?us-ascii?Q?bo477pEkIPwLmSl7nFyEgaSHm4UTXQDzokBnvbadKB0rSRZ/YF0VZ36OUuta?=
 =?us-ascii?Q?mWTT1sZFszM1RQMBZTHTnW95ODhHIm2ovUe7uitFCy+eQJonLGnGmhRXLCAB?=
 =?us-ascii?Q?ORgMfVR/C+YlcwuNfEEQJl51iGituPycS3uPbGxcR39bPtu0XO8irI2p+3Cf?=
 =?us-ascii?Q?4XoR4Srql6PTX4XC7zr8I/5gNRAZ94Pq40Eg1aNXiG1RBoC9Dy6j9ofkeEkK?=
 =?us-ascii?Q?gO+h/dkDgehb4M18NqBVsQt/0Nls1ronnKM/tJTSA1RWi/fynQJVbMUCdYJB?=
 =?us-ascii?Q?4A+gTE6G5Pjcow3oodSE5C0WUyLLV/29Xzm0veHDzhBoHeU92cngNXbIQEWl?=
 =?us-ascii?Q?mYtx56i3dzsJ5af7KZoxst+DhLC7FcQHDMRMhjWo5GYP7DJyWv7MWPcsSS0G?=
 =?us-ascii?Q?/npkxuJyxsaa3oZzKpI8DXlreR6+42lZ28CCuJpMM7cortime3BU7610S799?=
 =?us-ascii?Q?0yn6B0IxBlAvtnuYvG+vWYPQFaM5lYkd0qLBLnJCw0jcxfpQ894C0YdwIzis?=
 =?us-ascii?Q?IGA/x7VHfQVMe2LA9GZm3CPdONLCuUhBHwWG1Atfo7nusUIWlyH5fsFkQqK/?=
 =?us-ascii?Q?MRhjwEFoLcluYiqEEMHrPomgwStgxKussRDUINpS2NQHhPaWZMjIr8zxgbVv?=
 =?us-ascii?Q?I3VlHwvdYVleqIGoufy0jg0hPnfoCf02aSHe/FdLA6Jt7w8RQ8EkqzawZn04?=
 =?us-ascii?Q?8elw0zmJG9IIYUBAMHNsraCl5OfKiTrb2UWqS/ZKMOsrvofX9OyDj2907xu+?=
 =?us-ascii?Q?s9JgFcu8/9RRmz6f3oD+t4RSA7r9Z29rvEElOyGB6yluvLJSM3wlStKfgD3g?=
 =?us-ascii?Q?CELUmTrYwYpY9WUBqjHV75Cgfa2/O/mvhPPiO4G5ft1XvAZ1ZTCg4dt1dtfB?=
 =?us-ascii?Q?nqiHE48uI2KTGaS9IP9IDrNiHEOETPgpDSh+PHNwRD2hA83Rbn3sX6knrHo2?=
 =?us-ascii?Q?2ZkmyPjNyZxI7uqCMi1ECrssXONOfsw1J+jfJn93uf5iBHGc7Dwfsl5aKTz1?=
 =?us-ascii?Q?QlB1spoI80PVLJ3h6dMmwx1mSukUjTXZiuCQnIVQNd8r/lAnsoPQKkmd6ylC?=
 =?us-ascii?Q?dibVwsB39zmkVNnMekRmTwQAvRN5f4n7YWqZWI9MoXkQlGaL7YTRWwZglsMB?=
 =?us-ascii?Q?q8JRnCtQEscMzwtra5ZezlC5JKZV2ZpWJx+tNtYkFpzV+acjhL9e9uVlPD1S?=
 =?us-ascii?Q?gVO5TeogpuXFZ7evctG8qzRui9optfk/GmrzPZY4mXvyNKbmBB1d4rNDspa2?=
 =?us-ascii?Q?Qr78plUmcDsGwz00EJENGXTLzG5mRF2OU1VHQlWKEJVFoIxrkm0IKyiqRR0t?=
 =?us-ascii?Q?xBbFGIMdOY11PaKZ3oYwuT3iVw77Eel3d7hqMEPzQO0PeFDV55tsvh9aeFKP?=
 =?us-ascii?Q?Ib3gz4FJ0X3PUKLdN+RPhfg3SSzw6hBcytuG7B3x5Kx052lNMoKVmEmmWDPF?=
 =?us-ascii?Q?vRGgzGy3CUOLEGnEkF4JWp0ig3qrhJ7B26jDYMhCGCm7Mx/8q+cmid9s6bOk?=
 =?us-ascii?Q?W57BHLr2h0mHJImXwBi/UUyHe/+BGieduHwHns68uQEGpul1kJK99sAqYksn?=
 =?us-ascii?Q?XVA+lMWgJQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f0139ad-c107-4424-462f-08dec8856f62
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 13:20:55.9671
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tEKV+LoiE3wJTW5DhbMyZVqzUKJW2/PaWJthv9+oI2Qme+tCH2j2ezrU/IWExB0yREOy0ERdcaFfm1OvthGu4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8203
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-64693-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:julien.vuillaumier@nxp.com,m:alexi.birlinger@nxp.com,m:daniel.baluta@nxp.com,m:peng.fan@nxp.com,m:frank.li@nxp.com,m:jacopo.mondi@ideasonboard.com,m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:michael.riesch@collabora.com,m:anthony.mcgivern@arm.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:ai.luthra@ideasonboard.com,m:paul.elder@ideasonboard.com,m:geert@linux-m68k.org,m:sakari.ailus@linux.intel.com,m:hverkuil+cisco@kernel.org,m:antoine.bouyer@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:email,nxp.com:mid,nxp.com:from_mime,nxp-neoisp-diagram.dot:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,nxp-neoisp.dot:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B18C679CBD

Document the NXP neoisp driver both in the admin-guide for neoisp IP
description, and in the userspace-api for neoisp interface description.

Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
---
 .../admin-guide/media/nxp-neoisp-diagram.dot  |  24 +++
 .../admin-guide/media/nxp-neoisp.dot          |  18 ++
 .../admin-guide/media/nxp-neoisp.rst          | 179 ++++++++++++++++++
 .../admin-guide/media/v4l-drivers.rst         |   1 +
 .../userspace-api/media/v4l/meta-formats.rst  |   1 +
 .../media/v4l/metafmt-nxp-neoisp.rst          |  70 +++++++
 6 files changed, 293 insertions(+)
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp-diagram.dot
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp.dot
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp.rst
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst

diff --git a/Documentation/admin-guide/media/nxp-neoisp-diagram.dot b/Documentation/admin-guide/media/nxp-neoisp-diagram.dot
new file mode 100644
index 000000000000..362723d66bc9
--- /dev/null
+++ b/Documentation/admin-guide/media/nxp-neoisp-diagram.dot
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0
+
+digraph G {
+  rankdir = "LR";
+  node [shape=rect];
+  splines = ortho;
+  label = "Neoisp pipeline diagram";
+  {In0, In1 } -> HC -> {HDR_decomp0, HDR_decomp1};
+  HDR_decomp0 -> OBWB0 -> HDR_merge;
+  HDR_decomp1 -> OBWB1 -> HDR_merge;
+  HDR_merge -> RGBIR -> IR_compression;
+  RGBIR -> Statistics;
+  RGBIR -> OBWB2 ->BNR -> Vignetting -> ColorTemp;
+  Vignetting -> Demosaic -> RGB2YUV -> DRC -> AF;
+  DRC-> NR -> EE -> DF -> Gamma -> Packetizer;
+  DRC -> DMAP -> DF[weight=2];
+  DRC -> CCONV -> CAS -> Gamma;
+  {rank = "same"; RGBIR, DRC}
+  {rank = "same"; AF, NR, DMAP}
+  {rank = "same"; IR_compression, Vignetting}
+  IR_compression -> AXIOutDMA;
+  Packetizer -> AXIOutDMA [weight=3];
+  AXIOutDMA -> {"Out0", "Out1"}
+}
diff --git a/Documentation/admin-guide/media/nxp-neoisp.dot b/Documentation/admin-guide/media/nxp-neoisp.dot
new file mode 100644
index 000000000000..79d9090dc1f9
--- /dev/null
+++ b/Documentation/admin-guide/media/nxp-neoisp.dot
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0
+
+digraph board {
+	rankdir=TB
+	n00000001 [label="{{<port0> 0 | <port1> 1 | <port2> 2} | neoisp\n | {<port3> 3 | <port4> 4 | <port5> 5}}", shape=Mrecord, style=filled, fillcolor=green]
+	n00000001:port3 -> n00000020 [style=dashed]
+	n00000001:port4 -> n00000022 [style=dashed]
+	n00000001:port5 -> n00000024 [style=dashed]
+	n0000000a [label="neoisp-input0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+	n0000000a -> n00000001:port0 [style=bold]
+	n00000010 [label="neoisp-input1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+	n00000010 -> n00000001:port1 [style=dashed]
+	n00000016 [label="neoisp-params\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+	n00000016 -> n00000001:port2 [style=dashed]
+	n00000020 [label="neoisp-frame\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+	n00000022 [label="neoisp-ir\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
+	n00000024 [label="neoisp-stats\n/dev/video5", shape=box, style=filled, fillcolor=yellow]
+}
diff --git a/Documentation/admin-guide/media/nxp-neoisp.rst b/Documentation/admin-guide/media/nxp-neoisp.rst
new file mode 100644
index 000000000000..c8e3a2699140
--- /dev/null
+++ b/Documentation/admin-guide/media/nxp-neoisp.rst
@@ -0,0 +1,179 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=======================================
+NXP Neo Image Signal Processor (neoisp)
+=======================================
+
+Introduction
+============
+
+Neoisp performs a set of image processing tasks on the RAW camera stream, where
+the input camera stream and Neoisp processed output image are stored in DDR or
+any system memory fast enough to keep up with Neoisp processing.
+The overall Neoisp operation is frame based, that is 1 complete image frame is
+read and output pixel by pixel, line by line wise.
+
+Revisions
+=========
+
+NXP Neoisp driver supports the Neoisp V2 hw revision, used in i.MX95 Soc family.
+
+Neoisp hardware
+===============
+
+The Neoisp registers and pipeline processing are documented in the NXP Image
+Signal Processor Specification document (under NDA).
+
+The NEO pipeline block diagram is shown below:
+
+.. kernel-figure:: nxp-neoisp-diagram.dot
+    :alt:   Diagram of neoisp pipeline
+    :align: center
+
+It is composed of the following HW blocks:
+
+- a Head Color (HC) selection block,
+- two HDR decompression blocks, one for each input,
+- three Optical Black correction and White Balance (OBWB) blocks at different
+  stages in the pipeline,
+- a HDR merge block for HDR image capture from the 2 input lines,
+- a RGB-IR to RGGB converter,
+- a Bayer Noise Reduction (BNR) block,
+- a Vignetting block, aka Lens Shading Correction (LSC),
+- a Demosaic block for RAW image conversion to RGB,
+- a RGB Color Correction Matrix (CCM) and Color Space Converter aka CSC or
+  RGB2YUV,
+- a Dynamic Range Compression (DRC) block,
+- the Denoising pipeline (composed by multiple blocks for Noise Reduction, Edge
+  Enhancement, Gamma Compensation, etc),
+- a Packetizer used for UV sub-sampling or RGB packing.
+
+All these blocks are controlled by SW through registers. Some of these
+registers are accessible by the uAPI, so that userspace application and Image
+Processing Algorithms (IPA) can configure them through the parameters buffers.
+
+Neoisp driver
+=============
+
+Neoisp driver is located under drivers/media/platform/nxp/neoisp.
+It uses the `V4L2 API` and the `V4L2 subdev API` to register capture and output
+video devices in addition to a subdevice for neoisp that connects the video
+devices into a media graph realized using the `Media Controller (MC) API`.
+
+Driver provides a core registration API that allows registering the neoisp core
+media devices into an external media graph. In this case, the neoisp is fully
+integrated into a main media graph which could include other subdevices such as
+camera sensors, crossbar routing, etc. It also provides a module parameter to
+allow running in standalone mode. In such case, the neoisp registers its media
+devices into its own media graph.
+
+The media topology registered by Neoisp driver is represented below:
+
+.. kernel-figure:: nxp-neoisp.dot
+    :alt:   Diagram of neoisp media device topology
+    :align: center
+
+
+The neoisp registers the following video device nodes:
+
+- neoisp-input0: output device for RAW frames to be submitted to the ISP for processing.
+- neoisp-input1: output device for RAW frames short capture in HDR merge mode.
+- neoisp-params: output meta device for parameters provided by user space 3A algorithms.
+- neoisp-frame: capture device for RGB/YUV pixels of the processed images.
+- neoisp-ir: capture device for the infra-red pixels of the processed images.
+- neoisp-stats: capture meta device for generated image statistics for user space 3A algorithms.
+
+neoisp-input0, neoisp-input1
+----------------------------
+
+Images to be processed by Neoisp are queued to the neoisp-input0 (and
+neoisp-input1 when in HDR mode) output device nodes. Supported image formats
+as input to the ISP are:
+
+- Raw bayer formats:
+
+  - 8 bits raw (V4L2_PIX_FMT_SRGGB8, V4L2_PIX_FMT_SBGGR8, V4L2_PIX_FMT_SGBRG8,
+    V4L2_PIX_FMT_SGRBG8)
+  - 10 bits raw (V4L2_PIX_FMT_SRGGB10, V4L2_PIX_FMT_SBGGR10,
+    V4L2_PIX_FMT_SGBRG10, V4L2_PIX_FMT_SGRBG10)
+  - 12 bits raw (V4L2_PIX_FMT_SRGGB12, V4L2_PIX_FMT_SBGGR12,
+    V4L2_PIX_FMT_SGBRG12, V4L2_PIX_FMT_SGRBG12)
+  - 14 bits raw (V4L2_PIX_FMT_SRGGB14, V4L2_PIX_FMT_SBGGR14,
+    V4L2_PIX_FMT_SGBRG14, V4L2_PIX_FMT_SGRBG14)
+  - 16 bits raw (V4L2_PIX_FMT_SRGGB16, V4L2_PIX_FMT_SBGGR16,
+    V4L2_PIX_FMT_SGBRG16, V4L2_PIX_FMT_SGRBG16)
+
+- Monochrome formats:
+
+  - 8 bits Monochrome (V4L2_PIX_FMT_GREY)
+  - 10 bits Monochrome (V4L2_PIX_FMT_Y10)
+  - 12 bits Monochrome (V4L2_PIX_FMT_Y12)
+  - 14 bits Monochrome (V4L2_PIX_FMT_Y14)
+  - 16 bits Monochrome (V4L2_PIX_FMT_Y16)
+
+.. note::
+   RGBIr camera sensors are supported as well, and can be used through user
+   space activation of the IR block.
+
+.. note::
+   neoisp-input1 link is mutable and should be enabled in case a short capture
+   image buffer is provided to the ISP for HDR merge.
+
+.. _neoisp_params:
+
+neoisp-params
+-------------
+
+The neoisp-params output meta device receives configuration data to be written
+to Neoisp registers and internal memory for desired input image processing.
+This v4l2 device accepts the generic `extensible parameters` format.
+
+In this format, the parameters buffer is defined by the generic
+:c:type:`v4l2_isp_buffer`, and userspace should set
+:ref:`V4L2_META_FMT_NEO_ISP_EXT_PARAMS <v4l2-meta-fmt-neo-isp-ext-params>`
+as dataformat.
+
+When the related media link is disabled, the image decoding will be done based
+on the default parameters of the ISP.
+
+neoisp-frame
+------------
+
+The capture device writes to memory the RGB or YUV pixels of the image processed
+by Neoisp when the media link is enabled. If the related media link is disabled,
+the processed image will be written to dummy buffer and not delivered to the
+neoisp-frame video device node.
+
+neoisp-ir
+---------
+
+The capture device writes to memory the RGBIr pixels of the image processed by
+Neoisp when the media link is enabled. If the related media link is disabled,
+the processed image will not be delivered to the neoisp-ir video device node.
+
+.. _neoisp_stats:
+
+neoisp-stats
+------------
+
+The neoisp-stats capture meta device provides statistics data generated by
+Neoisp hardware while processing the input image. This v4l2 device accepts the
+`extensible statistics` format.
+
+In this format, the statistics buffer is defined by the generic
+:c:type:`v4l2_isp_buffer`, and userspace should set
+:ref:`V4L2_META_FMT_NEO_ISP_EXT_STATS <v4l2-meta-fmt-neo-isp-ext-stats>` as
+dataformat.
+
+When the related media link is disabled, the decoding statistics will not be
+delivered to the neoisp-stats meta device node.
+
+Control
+=======
+
+To support additional neoisp hardware revisions, the read-only bitmask control
+``V4L2_CID_NEOISP_SUPPORTED_PARAMS_BLOCKS`` can be used to query the list of
+supported blocks. Each bit represents the availability of the corresponding
+entry from the :c:type:`neoisp_param_block_type_e` enum. In current driver
+version, default and max values represent the blocks supported by the i.MX95
+SoC.
diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
index 4621eae9fa1e..4ae312b6135a 100644
--- a/Documentation/admin-guide/media/v4l-drivers.rst
+++ b/Documentation/admin-guide/media/v4l-drivers.rst
@@ -22,6 +22,7 @@ Video4Linux (V4L) driver-specific documentation
 	ivtv
 	mali-c55
 	mgb4
+	nxp-neoisp
 	omap3isp
 	philips
 	qcom_camss
diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/Documentation/userspace-api/media/v4l/meta-formats.rst
index 3e0cab153f0a..46268d955d3a 100644
--- a/Documentation/userspace-api/media/v4l/meta-formats.rst
+++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
@@ -18,6 +18,7 @@ These formats are used for the :ref:`metadata` interface only.
     metafmt-d4xx
     metafmt-generic
     metafmt-intel-ipu3
+    metafmt-nxp-neoisp
     metafmt-pisp-be
     metafmt-pisp-fe
     metafmt-rkisp1
diff --git a/Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst b/Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst
new file mode 100644
index 000000000000..c631fd50972a
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst
@@ -0,0 +1,70 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+*****************************************
+V4L2_META_FMT_NEO_ISP_EXT_PARAMS ('nnep')
+*****************************************
+
+The Neoisp image signal processor is configured by userspace through a buffer
+of parameters to :ref:`neoisp-params <neoisp_params>` output device node using
+the :c:type:`v4l2_meta_format` interface.
+
+The parameters buffer uses the generic `extensible parameters` configuration
+format.
+
+.. _v4l2-meta-fmt-neo-isp-ext-params:
+
+Extensible parameters configuration format
+==========================================
+
+When using the `extensible parameters` configuration format, parameters are
+passed to the :ref:`neoisp-params <neoisp_params>` metadata output video node
+using the `V4L2_META_FMT_NEO_ISP_EXT_PARAMS` meta format.
+
+The buffer contains a single instance of the C structure
+:c:type:`v4l2_isp_buffer` defined in `v4l2-isp.h`. The
+:c:type:`v4l2_isp_buffer` structure is designed to allow userspace to
+populate the data buffer with only the configuration data for the Neoisp blocks
+it intends to configure. The extensible parameters format design allows
+developers to define new block types to support new configuration parameters,
+and defines a versioning scheme so that it can be extended and versioned
+without breaking compatibility with existing applications.
+
+****************************************
+V4L2_META_FMT_NEO_ISP_EXT_STATS ('nnes')
+****************************************
+
+The Neoisp image signal processor generates statistics data while processing an
+input image. These statistics are captured in a buffer and provided to
+userspace through the :ref:`neoisp-stats <neoisp_stats>` capture video node
+using the :c:type:`v4l2_meta_format` interface. The statistics data are
+processed by userspace application to produce the next Neoisp parameters.
+
+The statistics buffer uses the generic `extensible statistics` format.
+
+.. _v4l2-meta-fmt-neo-isp-ext-stats:
+
+Extensible statistics format
+============================
+
+When using the `extensible statistics` format, the statistics buffer is passed
+from the :ref:`neoisp-stats <neoisp_stats>` metadata capture video node using
+the `V4L2_META_FMT_NEO_ISP_EXT_STATS` meta format.
+
+The buffer contains a single instance of the C structure
+:c:type:`v4l2_isp_buffer` defined in `v4l2-isp.h`. The
+:c:type:`v4l2_isp_buffer` structure is designed to allow future Neoisp
+driver versions to populate the statistics buffer with future blocks
+statistics, and defines a versioning scheme so that it can be extended and
+versioned without breaking compatibility with existing applications.
+
+**********************
+Neoisp uAPI data types
+**********************
+
+This chapter describes the data types exposed to userspace by Neoisp driver.
+
+Some structure members are in a fixed-point format, in this case the related
+description will be ended by a fixed-point definition between parenthesis.
+
+.. kernel-doc:: include/uapi/linux/media/nxp/nxp_neoisp.h
+
-- 
2.53.0


