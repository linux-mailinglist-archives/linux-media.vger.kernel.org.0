Return-Path: <linux-media+bounces-58670-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WM01DjQU3WkOZQkAu9opvQ
	(envelope-from <linux-media+bounces-58670-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:05:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5D73EE49A
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 18:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12E74300BC99
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 16:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7747125DB12;
	Mon, 13 Apr 2026 16:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iLlsPUQG"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5FA24E4AF;
	Mon, 13 Apr 2026 16:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776096276; cv=fail; b=qFx0vBc7Fej8XFsLBcq1jkqWSCME3NprbrM/YWNCkXierl56Fd7l1/Vm1cA2/2KvaHx/OjFJK+y2o9g5AZ4RBQIEryxVNFIYH8wMyF9Uu2TmP08WDw6y41f9qm0CAQ5bTilR2fqJF8E90imrPRuPYjxC32VvdCilDuQ6Tye+HFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776096276; c=relaxed/simple;
	bh=ItDuSstHo4BZLSzxSom9Fpz2BqwY/LxPs3YmhO+/+wM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=uz/gDEHd7cd8QHka99Zn2HxKWDhXSjsXtC/sth0W2DgECf5QMNbodxg3DlvM6Foqbc78mhxSpSDM6k5hnnSiylLisy1TVTgqCIsLtXHOgWUxpyg0w00jJ/VGs6oVQB+VFBHCHgxlb3d3a/8ZXtXnQMUnkSBYJ1p0B+DL926X4Us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iLlsPUQG; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvnLUEt6NtAu/GrUxAh3hmoCo4i8EpucjzeNu1ErIrwBwTQhNXqCIvgE+MqsYCX2BwSEYe61C+FsbzC48ELnH8Ul50uBrMAxbEMMI62zJpQ3sJ90oOVlKZ3jTo3FYUpR3yM0MeTgf451hZ2Erid4D/yniTERVj90t0pWAW4wcvsgySttFui8Hqixy30LNSz7FSWwwfoNdP8AADOtRlzfNymiFuEAB54ksDw3NozraDAc+w64wgFajHx/w74J6pduSDXtmZTWtDr9MMjAQoknsMumW56YiHBVQEhsxd9o7Q0tdHqzMDHs9zs4SL6p1wDDNINvb2IDSGG60XWTM6TWTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5HrGpumKKOgQkiVff6pEwkccp0dRpkKOS5fv2Sgg+vc=;
 b=gtgonV76tam+h2D369paK3rMfAAb+qFzHuKBqUAeq+lvPZ3D8n7+P5rWBlqASD9jZu7AQRU7EnQQuQpOknWlWuHurtkkyZAk6HjROXDirU7L6z2M8miCN5V6h+hv146sGUzFhnwRfYEuzi0H9E56K0yTpTv9JgKW9oPJX3+BwmTJqcJTizJFOmzppr+mXNGCLD8zvRFakQ/jR3hSxt0dwE2dfsfSNxeQDxg7UNXjWqJnW3RHdQ/R4VZqcB6FdJ/5B6W1tQ26DU7dQNHAMo1UQq5Tfc1h9xICYrSkUQAm3KfCBoapchlSvHgQLZYPEPL+TfQfC1OMx8ow9M+sp4hzDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5HrGpumKKOgQkiVff6pEwkccp0dRpkKOS5fv2Sgg+vc=;
 b=iLlsPUQGmoK7v3zfK76QFugQsOblMReVhxjLGcOhJslcEcjWG1jZHw1vh7+CLQIfSXpmoATDjDfZSl7sYT+c+3oGCHBM5v5Gel816/h9+uxR/pWQoFV51BvjhV1WNz6cbdM807VA+ShV1SvDQPDZF0CPrPXqsnJbrSkPxKk3kHzFwuiK8Z/YnekW7/soJA9mUiwRFrFciZ5wy9rr1IEYqeArrMVl+ESczRqMj+sMP3jzHf7AlsmnEJDtNbOlPD+WCgbS9vxfoGb3Dygc14qYT/JqAykmU5Tfxl7ceQwMxe6wAUW26ZvFBrZiq8OOWnT9m5gHTCljIrVOAuIqaqHbCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by MIYPR04MB12599.eurprd04.prod.outlook.com
 (2603:10a6:290:7b::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 16:04:30 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9769.046; Mon, 13 Apr 2026
 16:04:30 +0000
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
	Antoine Bouyer <antoine.bouyer@nxp.com>
Subject: [PATCH v1 00/11] media: Add iMX95 neoisp driver
Date: Mon, 13 Apr 2026 18:03:20 +0200
Message-ID: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P189CA0012.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d7::15) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|MIYPR04MB12599:EE_
X-MS-Office365-Filtering-Correlation-Id: 065a9bb4-63c9-4e57-ca81-08de99765882
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|52116014|376014|38350700014|921020|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 NkX67076W/Bh29nyhXqo10T9ZQ0zc9ubUA2S/8APMtJtferCi1mSsEbgYrF9J6u9P5XOxmN+YR0i4m1t+qyasq4ogvGl1OVl+ibKPHAvXpCiGsq/31SoiHBH8cNeXLNeWMEGTD6vd4519Z0qD+h/JofzmkmFWAVTJ/hKt84PA4hoj54KT4oeZWOBMn2GrShUzfQp1qmSURal0hfTpCcYS+XB53zz8sB3cqkIvagmc5IHNQLbJIMz9R7amCK3zCoe+//D/2YbWWn4lYGTDtEKNUEVQH/cQzVJ3yu+FyuaoLmlHacJ2LY7YU/RDgQiu0ENo6zpsq6n3/E9j8O7AzLACcuN6lQaGqTXYInmg00wDRP/clpHhz1TL/DF9xSocrDfROpNoG0ZemLzrOE9SR1EoKYk7rX5dWgg/jc8+8/OsvmIa0PCp1wGf+EfA3IY9WUQ+cub4Rm0Rp6Qk7OmlT2kmf/Fi9ficCrGpFOxhYccKuGyUW4YTxBlZFrgga831WeQ1NJTAaQ9Mtz5ptFjMGl8ZfXC7yk+O5fWENiPswpKfiMqaj7oo+9/bOfVOfea4tUdpPCszHeBkuxfMxjNUMFZhvp9McMfMvis1Kwx7/LM4C9hib86/SrRbbqLfRLIDiSwGUEFwCPC9wpdEbKd2WoteOWJAMMQ9qu+VBlpYiBOgwHmP2QgqoPQVLBytcoUlWi/csYhLCfE7pPAO4uMObEEa1h6P1kJ+zRrBRDcltPSKvtGZO2KapGAC0IGrDoWX4JYBRRdKcpbLKgVz0gWtrQX6Glc6hO01fLNP0xlSNq40ItWhSkXaY/aud24LbwaCNsA
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(52116014)(376014)(38350700014)(921020)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?o0F2ZXR1ghohhrcrFrsLc7koAY8QfJ6mJfjOVq56d3cRC9DaiwKByOFRTJeP?=
 =?us-ascii?Q?eH2an2I7Kb+d8SUPGTFmuy3eluZx/T/XBfCGeosKq3rBPRi7Vq2u0S3xavTl?=
 =?us-ascii?Q?+A1xfEDAhC+4xyrXvMeUlH+NfgB0okG5KCAGu6wpJ6IOzCyDttCBbPki38vr?=
 =?us-ascii?Q?fuvFXUUKdfwzgQ2R2ZGXGlInQkwjIqP7RlAwjfPiL5+LLpXU8J73rgfK6UBc?=
 =?us-ascii?Q?/Yd3KxIQqM7pzvpCi6qEaLSsn9lTNXhSgE91zrL/RIeP0BWiFXD+uZdp/8UU?=
 =?us-ascii?Q?Bkm77w0JQzFVoEtCmTyjPFU0JEZ9Iju8UChH5Sm2ryNCKjXm28wDBtqIrXBK?=
 =?us-ascii?Q?P8o53BjT4skPoJDcmLWBoLBObUyK2po168ixAtd6uER5+VVHgvIaYUg7ygyH?=
 =?us-ascii?Q?BgZ33tmqJS+popUy8s2c00E+LZD/p9sKmBvNK+7y9MVBOW4ROXQurTwR46BI?=
 =?us-ascii?Q?1xb5WVNvq9Jx7NtICyqFp0b7eVWZMsqiK64Wa/N640nXd56sFQaCnAvsPnzM?=
 =?us-ascii?Q?XS9eMzF3Zd7CqGrA6WC3JcGSByxLaP6WBR17E0BQ67ETUTYNDavWyfwtJ7bf?=
 =?us-ascii?Q?WG/TGj/bl3SOe4H2JHmKn7sJGWI48UvsfYl9BPyHBK4jYV4F1AvMKvAyz7B9?=
 =?us-ascii?Q?an9K0Xl98hA4QUc+cOL06mXCN6PrrqaMLdlhTDnX8ZcNtD2jNzxazbrGe05k?=
 =?us-ascii?Q?8tpUJsZ0/nU4x3clnTRtQulZXA3cLaB+bizJJVi/8dKWXF8ISjuoABB69NcC?=
 =?us-ascii?Q?Kb8686dyChrHxWNoDd3IjYJNw/7e5BA0m/oL1sqWqDiAm9JPcje4RWawJybo?=
 =?us-ascii?Q?HBvEo6QrEY2lyPyEA7q6d2spBOB70G2RRealr++HLp5yXEkGmu4/Nzk6UYvI?=
 =?us-ascii?Q?I/jwA6HST1amQczKiNpvAmkOQIBz3xiDjV36FNIGRsn8rGPOZw3Of/1901FY?=
 =?us-ascii?Q?rRq5HqjMjx0xIkIaj+GGLEjK9Lmbg+b+IVuJ5O9D1pGjEEHIlmse5ZOilbWE?=
 =?us-ascii?Q?oH6PHhzAvn/tStGQFqzUwTUG9vVML46+A7rYsUilEdKkO8C3Nu+boUzFPFL8?=
 =?us-ascii?Q?waxBYmuy4IazVdSwP+8Qme8aPU1Olzk4jYyjcmCyTtP05EfynGLdgaF32Dr9?=
 =?us-ascii?Q?vBFovABzPspXS92ALaLIVJN85Z8SSCacmFuinYnShiIh9le3Gu368gtCBpYm?=
 =?us-ascii?Q?z+IJKcYQpEo1Pumah3YR32xClGAz2d0lu9+F+sBMqb4QURMptFeRTt28lzDF?=
 =?us-ascii?Q?3rNMcPgd+zucr64HT7XyR6+sDqGxspeJ4TdR8a45X9NRvhKvqmL28MWE9X4c?=
 =?us-ascii?Q?xR134wt3Gc6KXSFpdCeQbrWCe68LkLRERgByUgQBeX95VtTpUXOGAlaPVBWj?=
 =?us-ascii?Q?mHfQXwhpw7IarW3rum7536LtO0y9cdIP+ZoKKVptoJ+LohdPjA119QfRi2q4?=
 =?us-ascii?Q?MiEl6wTR/YO3Yg6hARtiRYZ2011JyiuX6AazTCVKQFkIDnQRML5+VlHfJCAD?=
 =?us-ascii?Q?kuccSh5viO5EKVhwFV9DWhaYO4AG6V+5GFRKKkBq8+zreYJF+Gsko/S/+p89?=
 =?us-ascii?Q?htIaDpbQkWw6v4LYeV6fLhsseBsJg9Hv48+twQlXmk7Dlz3YcTv34wtrmkV+?=
 =?us-ascii?Q?8pxLo8zimqlOm1Y1CZiMbgF1bXSy1UKzwSIff+WKnQTYZerUJtv49riEZc7p?=
 =?us-ascii?Q?qvQz5IpWquqKdaTesOAaK1zstf+vbvKC82ycyelTYxiK4j3KOrzfFNhGvIKq?=
 =?us-ascii?Q?nphnm9sB9Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 065a9bb4-63c9-4e57-ca81-08de99765882
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 16:04:30.5335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3A/reE1L6k0vhbHIGWzvnKUnwhYQnh9RcA3FbCvkpdx+Qcsj7nLh7RFAjbQx0EeyHCU1WTFQPT7FdClVHXCZ5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIYPR04MB12599
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58670-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CC5D73EE49A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello

This patch series introduces the NXP Neo Image Signal Processor (ISP)
driver, used in the NXP i.MX95 SoC and future devices in the i.MX9 family.
The series also includes updates to the generic v4l2-isp interface to
support extended statistics required by the Neo ISP.

The Neo ISP processes one or more camera streams, converting RAW formats
into YUV or RGB outputs. Its architecture is largely influenced by the
PISP driver. To limit the number of v4l2 devices, the driver supports only
one context, with three sink pads (main input, second input for HDR, and
parameter buffers) and three source pads (RGB output, IR output, and
statistics metadata).

The driver supports the generic extensible v4l2-isp framework for
parameters, similar to rkisp1 and mali-c55, and applies the same approach
to statistics buffers. The generic v4l2-isp framework is modified to
factorize structure definitions and versioning, so that both parameters
and statistics buffers share the same mechanisms.

The driver currently supports M2M operation; inline mode (CSI-to-ISP
streaming) is still under evaluation.

This series integrates several comments raised during RFC [1] review:
 * The major change is that neoisp now provides the
   `neoisp_core_media_register` API to register itself into an existing
   media graph, instead of creating its own. The goal is to prepare for
   supporting inline mode alongside M2M mode, and to allow userspace to
   select between these modes at runtime (the 2 modes cannot run together
   at same time because of hardware constraints).
 * The driver now configures only one Neo ISP context, whereas the RFC
   version prepared height contexts.
 * A module parameter has been added to support a standalone mode. When
   enabled, neoisp registers its own media graph. The goal is to allow
   testing the Neo ISP IP without a camera or other subdevice drivers,
   such as ISI, pixel formatter, etc.
 * The legacy mode using fixed-size buffers for parameters and statistics
   has been removed; only the generic extensible framework is supported.
 * Support for hardware version 1 has also been removed.

A few checkpatch errors in v4l2-ioctl.c remain intentionally, to stay
consistent with the existing style in that file.

Testing was performed on the i.MX95 EVK using the media/next kernel in
standalone mode, with a vivid (Virtual Video Device) instance and a
libcamera neo pipeline handler. An engineering version of the libcamera
pipeline handler is under preparation, and can be shared as dedicated
branch if needed.

End-to-end camera-to-ISP capture, using a single media graph, has been
validated using the downstream NXP kernel, as some hardware dependencies
are not yet upstreamed.

Thanks,
Antoine

[1] RFC: https://lore.kernel.org/linux-media/20260123080938.3367348-1-antoine.bouyer@nxp.com/

-----
Here are v4l2-compliance test results (in standalone mode):

v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for neoisp device /dev/media0:

Media Driver Info:
	Driver name      : neoisp
	Model            : neoisp
	Serial           :
	Bus info         : platform:4ae00000.isp
	Media version    : 7.0.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.0.0

Required ioctls:
	test MEDIA_IOC_DEVICE_INFO: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/media0 open: OK
	test MEDIA_IOC_DEVICE_INFO: OK
	test for unlimited opens: OK

Media Controller ioctls:
	test MEDIA_IOC_G_TOPOLOGY: OK
	Entities: 7 Interfaces: 7 Pads: 12 Links: 13
	test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
	test MEDIA_IOC_SETUP_LINK: OK

Total for neoisp device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for neoisp device /dev/video2:

Driver Info:
	Driver name      : neoisp
	Card type        : neoisp
	Bus info         : platform:4ae00000.isp
	Driver version   : 7.0.0
	Capabilities     : 0x8ca03000
		Video Capture Multiplanar
		Video Output Multiplanar
		Metadata Capture
		Metadata Output
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : neoisp
	Model            : neoisp
	Serial           :
	Bus info         : platform:4ae00000.isp
	Media version    : 7.0.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.0.0
Interface Info:
	ID               : 0x0300000a
	Type             : V4L Video
Entity Info:
	ID               : 0x00000008 (8)
	Name             : neoisp-input0
	Function         : V4L2 I/O
	Pad 0x01000009   : 0: Source
	  Link 0x0200000c: to remote pad 0x1000002 of entity 'neoisp' (Image Signal Processor): Data, Enabled, Immutable

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video2 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for neoisp device /dev/video2: 48, Succeeded: 48, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for neoisp device /dev/video3:

Driver Info:
	Driver name      : neoisp
	Card type        : neoisp
	Bus info         : platform:4ae00000.isp
	Driver version   : 7.0.0
	Capabilities     : 0x8ca03000
		Video Capture Multiplanar
		Video Output Multiplanar
		Metadata Capture
		Metadata Output
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04202000
		Video Output Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : neoisp
	Model            : neoisp
	Serial           :
	Bus info         : platform:4ae00000.isp
	Media version    : 7.0.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.0.0
Interface Info:
	ID               : 0x03000010
	Type             : V4L Video
Entity Info:
	ID               : 0x0000000e (14)
	Name             : neoisp-input1
	Function         : V4L2 I/O
	Pad 0x0100000f   : 0: Source
	  Link 0x02000012: to remote pad 0x1000003 of entity 'neoisp' (Image Signal Processor): Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video3 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for neoisp device /dev/video3: 48, Succeeded: 48, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for neoisp device /dev/video4:

Driver Info:
	Driver name      : neoisp
	Card type        : neoisp
	Bus info         : platform:4ae00000.isp
	Driver version   : 7.0.0
	Capabilities     : 0x8ca03000
		Video Capture Multiplanar
		Video Output Multiplanar
		Metadata Capture
		Metadata Output
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x0c200000
		Metadata Output
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : neoisp
	Model            : neoisp
	Serial           :
	Bus info         : platform:4ae00000.isp
	Media version    : 7.0.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.0.0
Interface Info:
	ID               : 0x03000016
	Type             : V4L Video
Entity Info:
	ID               : 0x00000014 (20)
	Name             : neoisp-params
	Function         : V4L2 I/O
	Pad 0x01000015   : 0: Source
	  Link 0x02000018: to remote pad 0x1000004 of entity 'neoisp' (Image Signal Processor): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video4 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for neoisp device /dev/video4: 48, Succeeded: 48, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for neoisp device /dev/video5:

Driver Info:
	Driver name      : neoisp
	Card type        : neoisp
	Bus info         : platform:4ae00000.isp
	Driver version   : 7.0.0
	Capabilities     : 0x8ca03000
		Video Capture Multiplanar
		Video Output Multiplanar
		Metadata Capture
		Metadata Output
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : neoisp
	Model            : neoisp
	Serial           :
	Bus info         : platform:4ae00000.isp
	Media version    : 7.0.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.0.0
Interface Info:
	ID               : 0x0300001c
	Type             : V4L Video
Entity Info:
	ID               : 0x0000001a (26)
	Name             : neoisp-frame
	Function         : V4L2 I/O
	Pad 0x0100001b   : 0: Sink
	  Link 0x0200001e: from remote pad 0x1000005 of entity 'neoisp' (Image Signal Processor): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video5 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for neoisp device /dev/video5: 48, Succeeded: 48, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for neoisp device /dev/video6:

Driver Info:
	Driver name      : neoisp
	Card type        : neoisp
	Bus info         : platform:4ae00000.isp
	Driver version   : 7.0.0
	Capabilities     : 0x8ca03000
		Video Capture Multiplanar
		Video Output Multiplanar
		Metadata Capture
		Metadata Output
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04201000
		Video Capture Multiplanar
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : neoisp
	Model            : neoisp
	Serial           :
	Bus info         : platform:4ae00000.isp
	Media version    : 7.0.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.0.0
Interface Info:
	ID               : 0x03000022
	Type             : V4L Video
Entity Info:
	ID               : 0x00000020 (32)
	Name             : neoisp-ir
	Function         : V4L2 I/O
	Pad 0x01000021   : 0: Sink
	  Link 0x02000024: from remote pad 0x1000006 of entity 'neoisp' (Image Signal Processor): Data

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video6 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for neoisp device /dev/video6: 48, Succeeded: 48, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for neoisp device /dev/video7:

Driver Info:
	Driver name      : neoisp
	Card type        : neoisp
	Bus info         : platform:4ae00000.isp
	Driver version   : 7.0.0
	Capabilities     : 0x8ca03000
		Video Capture Multiplanar
		Video Output Multiplanar
		Metadata Capture
		Metadata Output
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04a00000
		Metadata Capture
		Streaming
		Extended Pix Format
Media Driver Info:
	Driver name      : neoisp
	Model            : neoisp
	Serial           :
	Bus info         : platform:4ae00000.isp
	Media version    : 7.0.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.0.0
Interface Info:
	ID               : 0x03000028
	Type             : V4L Video
Entity Info:
	ID               : 0x00000026 (38)
	Name             : neoisp-stats
	Function         : V4L2 I/O
	Pad 0x01000027   : 0: Sink
	  Link 0x0200002a: from remote pad 0x1000007 of entity 'neoisp' (Image Signal Processor): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video7 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)

Total for neoisp device /dev/video7: 48, Succeeded: 48, Failed: 0, Warnings: 0
--------------------------------------------------------------------------------
Compliance test for neoisp device /dev/v4l-subdev0:

Driver Info:
	Driver version   : 7.0.0
	Capabilities     : 0x00000000
	Client Capabilities: 0x0000000000000002
interval-uses-which Media Driver Info:
	Driver name      : neoisp
	Model            : neoisp
	Serial           :
	Bus info         : platform:4ae00000.isp
	Media version    : 7.0.0
	Hardware revision: 0x00000000 (0)
	Driver version   : 7.0.0
Interface Info:
	ID               : 0x0300002c
	Type             : V4L Sub-Device
Entity Info:
	ID               : 0x00000001 (1)
	Name             : neoisp
	Function         : Image Signal Processor
	Pad 0x01000002   : 0: Sink
	  Link 0x0200000c: from remote pad 0x1000009 of entity 'neoisp-input0' (V4L2 I/O): Data, Enabled, Immutable
	Pad 0x01000003   : 1: Sink
	  Link 0x02000012: from remote pad 0x100000f of entity 'neoisp-input1' (V4L2 I/O): Data
	Pad 0x01000004   : 2: Sink
	  Link 0x02000018: from remote pad 0x1000015 of entity 'neoisp-params' (V4L2 I/O): Data, Enabled
	Pad 0x01000005   : 3: Source
	  Link 0x0200001e: to remote pad 0x100001b of entity 'neoisp-frame' (V4L2 I/O): Data, Enabled
	Pad 0x01000006   : 4: Source
	  Link 0x02000024: to remote pad 0x1000021 of entity 'neoisp-ir' (V4L2 I/O): Data
	Pad 0x01000007   : 5: Source
	  Link 0x0200002a: to remote pad 0x1000027 of entity 'neoisp-stats' (V4L2 I/O): Data, Enabled

Required ioctls:
	test MC information (see 'Media Driver Info' above): OK
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev0 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device ioctls (Sink Pad 0):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 1):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Sink Pad 2):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 3):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 4):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 5):
	Try Stream 0
	test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	Active Stream 0
	test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
	test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 1 Private Controls: 1

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for neoisp device /dev/v4l-subdev0: 88, Succeeded: 88, Failed: 0, Warnings: 0

Grand Total for neoisp device /dev/media0: 384, Succeeded: 384, Failed: 0, Warnings: 0


-----
Antoine Bouyer (11):
  media: Documentation: uapi: Update V4L2 ISP for extensible stats
  media: uapi: v4l2-isp: Add v4l2 ISP extensible statistics definitions
  media: v4l2-isp: Add helper function to compute extended stats size
  media: Documentation: Add NXP neoisp driver documentation
  dt-bindings: media: Add nxp neoisp support
  media: v4l2-ctrls: Add user control base for NXP neoisp controls
  media: Add meta formats supported by NXP neoisp driver
  media: uapi: Add NXP NEOISP user interface header file
  media: platform: Add NXP Neoisp Image Signal Processor
  media: platform: neoisp: Add debugfs support
  arm64: dts: freescale: imx95: Add NXP neoisp device tree node

 .../admin-guide/media/nxp-neoisp-diagram.dot  |   22 +
 .../admin-guide/media/nxp-neoisp.dot          |   16 +
 .../admin-guide/media/nxp-neoisp.rst          |  179 ++
 .../admin-guide/media/v4l-drivers.rst         |    1 +
 .../bindings/media/nxp,imx95-neoisp.yaml      |   62 +
 .../userspace-api/media/v4l/meta-formats.rst  |    1 +
 .../media/v4l/metafmt-nxp-neoisp.rst          |   70 +
 .../userspace-api/media/v4l/v4l2-isp.rst      |   39 +-
 MAINTAINERS                                   |    9 +
 .../boot/dts/freescale/imx95-19x19-evk.dts    |    4 +
 arch/arm64/boot/dts/freescale/imx95.dtsi      |   11 +
 drivers/media/platform/nxp/Kconfig            |    1 +
 drivers/media/platform/nxp/Makefile           |    1 +
 drivers/media/platform/nxp/neoisp/Kconfig     |   15 +
 drivers/media/platform/nxp/neoisp/Makefile    |    8 +
 drivers/media/platform/nxp/neoisp/neoisp.h    |  263 ++
 .../media/platform/nxp/neoisp/neoisp_core.h   |   30 +
 .../media/platform/nxp/neoisp/neoisp_ctx.c    | 2630 +++++++++++++++++
 .../media/platform/nxp/neoisp/neoisp_ctx.h    |   78 +
 .../platform/nxp/neoisp/neoisp_debugfs.c      |  494 ++++
 .../media/platform/nxp/neoisp/neoisp_fmt.h    |  495 ++++
 drivers/media/platform/nxp/neoisp/neoisp_hw.h |  557 ++++
 .../media/platform/nxp/neoisp/neoisp_main.c   | 1898 ++++++++++++
 .../media/platform/nxp/neoisp/neoisp_nodes.h  |   54 +
 .../media/platform/nxp/neoisp/neoisp_regs.h   | 2498 ++++++++++++++++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 include/media/v4l2-isp.h                      |   13 +
 include/uapi/linux/media/nxp/nxp_neoisp.h     | 1761 +++++++++++
 include/uapi/linux/media/v4l2-isp.h           |  148 +-
 include/uapi/linux/v4l2-controls.h            |    6 +
 include/uapi/linux/videodev2.h                |    4 +
 31 files changed, 11318 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp-diagram.dot
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp.dot
 create mode 100644 Documentation/admin-guide/media/nxp-neoisp.rst
 create mode 100644 Documentation/devicetree/bindings/media/nxp,imx95-neoisp.yaml
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst
 create mode 100644 drivers/media/platform/nxp/neoisp/Kconfig
 create mode 100644 drivers/media/platform/nxp/neoisp/Makefile
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_core.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.c
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_debugfs.c
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_fmt.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_hw.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_main.c
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_nodes.h
 create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_regs.h
 create mode 100644 include/uapi/linux/media/nxp/nxp_neoisp.h

-- 
2.51.0


