Return-Path: <linux-media+bounces-56282-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AXCB3WKu2nHlQIAu9opvQ
	(envelope-from <linux-media+bounces-56282-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 06:32:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7492C63BA
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 06:32:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C0C78301804A
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 05:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59A33446C7;
	Thu, 19 Mar 2026 05:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="Ky6xIIbC"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021139.outbound.protection.outlook.com [40.107.42.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109AF186284;
	Thu, 19 Mar 2026 05:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773898345; cv=fail; b=AyfTV9cEZxVjGUa/V1ZmzAlAypepaNot9x8CqzmXnP/2BEsXvRJaf5681r8urgyGPXc7n94fmfKtHe8f3q/II6DGHb3VWkCxf9AG1S6jpdadEVLL+ktpaK0/4j3eQN8H05c+0S3aX/9qXL+WceFQb/OcM1JanrDaC6q04yLgT+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773898345; c=relaxed/simple;
	bh=vcVfhaBEtenyqHsuCgM71Cgdi+cJQFVqjSOxOVL0GPo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b2V/ZK1OXeVABWzubecLVnsTvT74NIT7FJbBM2pjgDbUfIC+pNVNSCak7fiPO3fXggTlVL4MYPc4TwLRaBnwRJLJFnOQt+AqHyTvsOiWnLM2IVgzqzuoLaaVKRQVCceF/fiJ+BO/Ea/9sOGKn7ao5NeWwrdW81In+hCyHDMFx08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=Ky6xIIbC; arc=fail smtp.client-ip=40.107.42.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iddg5NqLsT+TOaqQkm5A2M7Ms2+sEbJVNVpr2vSiCKirEUJiyWnDV9zv0R02lAsWyv2sNytk8TGubkiYeD6CEcaEpvn2yaipVYBA0FYkcZQgA8ckYI1Sv0B9DEtfWj7qaVMeAFkvASOeEkCAFFURzMZsfbiXEZxgEpxMcpQjBDgLKTVaXP6A/g2xsv2JQBf2xBoxXhQjp97WoUbrtGIiSgACKtuasZh9BX47mP8HFg65MQsbhy3K04mP2q+B+SVYYGB9HWh2lzn0FM6azZ2cGmb/J84cMUKGZxzW+z4Lb4fqW626MC6lXpQqFSQBGKzoCZYnohA9JRWoMRRRQqfkNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSnydWBm3oR70dCcPbeailW5ErP92dOFBBGmMDZtUQE=;
 b=E2xADm3OoCAU6IfXJU9PBSQNfQVQQrGpQdArxLPXU0G2wim6OLXQghaTKSCPfRUpjP92kdrC4qZt4lbUnZVfx7PEwX0M5OiMQD8G+XtMkwWvtxNhWRhjVW/DqLruU4brwWyIyjePDNJR5IoVGeNMHoEZyZJDMpFrp4uKjKhGXSG/yhtt62QcSPp4YgK/wQePGTj6Epsa85Eng0Hr4jJ5cZsVmu6mxxydBKhAtDUxIWgvSPIaJ3IFGtGVMfq/UZ2g+sAesFm630IjuN/Dz8ihGRO0AQfdRduZsdfYHR2zKjeHHUtd6JVg6Zt9VGgyZNlLEmICs/WOqB/dBeMdlwG4SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSnydWBm3oR70dCcPbeailW5ErP92dOFBBGmMDZtUQE=;
 b=Ky6xIIbCEysaM67xx7IaAtAJ99UZP5LUyfwfvBSLny5SmDlnRTXk43gwlj6j0mahA2oL/y+ExHbMNpN02g2c6qEvyMSXBXvHu/YegWaBrETj2Tzr48ACkV0F/MiBY0kgvJ4nlD7D51cGjFmHvoVE+4u3Ld9R/fmNJgpzcYrGQwI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 PS2P216MB1345.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19; Thu, 19 Mar 2026 05:32:19 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%3]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 05:32:19 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v0 1/3] media: chips-media: wave5: Add Support for Background Detection
Date: Thu, 19 Mar 2026 14:32:08 +0900
Message-Id: <20260319053210.90-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319053210.90-1-jackson.lee@chipsnmedia.com>
References: <20260319053210.90-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0036.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b5::9) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|PS2P216MB1345:EE_
X-MS-Office365-Filtering-Correlation-Id: b63cd4f2-8030-474a-ae97-08de8578e346
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	JVHDtiEv4zsN37WiypqcZyYWLDiaO6MGPoadh5jcegziHMuShqYmv8m21gN+/vtvPV8sBbRedhG8V3YeST1viAUPcQ8Ds8Z1L7ovY9uioo4GtKRR5SaXiDk6uk/fWZoKDNamAxymkuCEjGuHoJgvw2UUv+S7Wl2cONuYBJV+08S6omrYoki/0dMoYus5EUPP2/f7I/1ZeW/09BgCgFRGYXa0FQEGWA3O81tUTWcwOpeX8vKrGxavKrZuEFdLL4xtvOKEgM51biak80GOOAVEbAEdQcXLmYjrEaLZB+69bGkZzVyKSmv7McpkmVgkV53zBAyviZiGfodT2cLsi8hs7/xyTfE7IfuhzY+Tk8DNc7M5TPyxFhD3/4WFmaA/r5NEXouSWn6lqW1ilL3eqP0WfbmKsaLd33zomYgz49gYG5buQZrtgWIK5kZAe5klw/RMvGvw3dDvAZWNYcuU2WezIoMTthBFbKuCcaR5iiz31pbswA0iWzEnbgOnut70wmMLc5ln8oDVCMNwkWg5+cHj4Fpqx+bfh9bYBYXlrRAYKlfi0cYwqFuI09JH3OnMCwHJL7STyy49BuDjxhd/CVgMh1NtCVP8OEviaTNpZQ1b9uzNSJ5cpj7B12psAWMOvxKNpPzLGVrpXAmZUmMSjTAkoswwb6J+WURuNaVxFSU3yFNZpBsurQPrs6UY2d9/lP//SfbJbFymh9G4qJ/F/J/k3AJw+MZweiTyoERESMACKJhKK4RuV5PNCoyFuAoATFcmK372+6vBfqV7z631++Sql3WOoqXxnGXeOw2w9W80Tow=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wrgvGf4du6X0f28o9J5kDQA7YaZIYkrjiGkucveBbTaGd3Iya+ztNCToG71+?=
 =?us-ascii?Q?r7jhJkhQrwt4CnuqgxQrzp8TKfEE8GNzKjSsUwUCMICz3Syxa5mOYh9nWi5+?=
 =?us-ascii?Q?mliH6/IOeAov2XRlzc9esUQRDvsPfC/byyK1ao9+cpvqPcziu13JpSzjXisy?=
 =?us-ascii?Q?Ni7lKB8yPNVJ3tOQNNodGK9D3fi+vc1V8VVblz+JmKMJoFK+d0iBkYg1O1Aa?=
 =?us-ascii?Q?3lMvAkuFP8ZNY2eyp69LFZjFQoO6nISNM/jeKQNfAOQ/mx43m0GwvolvhIRT?=
 =?us-ascii?Q?VMpnRcyFcsWq6FNBdZPfBT1XzRrc3U+EuhNAqc6habvoSIA/RH2xr72JILId?=
 =?us-ascii?Q?z9hJ8PH0zsBKw7g5CYFQMZbg+RZRzFAsfz8YG51+qlfxJq6gg4XwfpJQxCb7?=
 =?us-ascii?Q?XysNlvBd6FKZid40ImmnMO/9qX+f1MYhD/BC40ynvun1BRve7CvtxX/utf70?=
 =?us-ascii?Q?PpxLwAEPtlZKBBW3kQLapGL3CHvDktJIRbyjiWZ167+GSic68ehgdoBxngsW?=
 =?us-ascii?Q?cHCatQszEEbm4Q6AJgvN3zV8PS/uc6YDOzCDvS3JRUylHW/zx4tWfaF3vxqF?=
 =?us-ascii?Q?JLw6I2NMIMH4CqfYXQP27w+y9liWytI8fYAqwPxNDrkm2d0niI0ufqozZHm8?=
 =?us-ascii?Q?3CHfbv8+DqjoCyKQ6gJkLrqWSZjnfl5KMrEiQixwiIK+gTbtNt24kQ4s0S76?=
 =?us-ascii?Q?cFTq5zWY19vMR6yN7aJLbrjg3LBsVD1uAEyQbtX6j1S5bPL4H5yqYD11d0Gx?=
 =?us-ascii?Q?YBWo8QuZvc9vZbBX7sp3WnzX8i1S59auN3ljVEJjeaIdGqUyN+Gq9eId3XQG?=
 =?us-ascii?Q?/5kcTyiUIZofjH72GOqE8ENJtSDNi9eHQbmyzbVhMNcju5451JyK3kzOTv4n?=
 =?us-ascii?Q?rTbl68LfIRVEN3Lh7dwJlAdxpq2FBZRVUF0vdeVk7MueIpnOr9OKCMnglSqS?=
 =?us-ascii?Q?GBmI0+VRQjhStsk+4D/LlgzROH2P2CtOFvQGfhHcDhxMcjRms5fmXVirmN8e?=
 =?us-ascii?Q?/6dgRBMh6ZEAzqCoC35znWOxHhlwEuS6Xd83/ag3tbUUZiHMOYmky9kFIxG2?=
 =?us-ascii?Q?dm48RBayL8QTF3gAR0Wt65c92Skcf+Iedq04Ozv9JcvZQMjgPV5WVQkBSd7p?=
 =?us-ascii?Q?2YqPOFF7hh3NpwVpGKmaveHZeUB59eyn0R2Zh91iALWzfvXcpNteUMeMk3i2?=
 =?us-ascii?Q?p+g3pqHnLfyoFyJSVolqqYZ9d9A5CLlP/kvdqGINH1LKo/vxv/c+LHGXsSR+?=
 =?us-ascii?Q?82RfwShnP1DS+AwwgfgCvpXqA69S56IMypz3rBIqJvENeCWTE7z8JItRHTGH?=
 =?us-ascii?Q?3sabGQ4j6xh6/DhjlW2TRx+Z5fvZO22RiqGpb+J0DZIyp1Ke69R7CF4sEJc5?=
 =?us-ascii?Q?qkRa63h7h+IQXx76b4tdi4RmRuLjrmw+/uGNsg9poGVjKnuYhZ8HpJrnVoDk?=
 =?us-ascii?Q?VzaDDxKtyfpT3DIPMX2HY6Ry6hqucyH93Bh6iWqbP/F1eWPhk/ihZ6mCH3Rl?=
 =?us-ascii?Q?NvhLs8jfvjdlVH3eBFyRdfb8lj+xdMYXrK59UDBuc6bkCdZ+TorsztoXn0Jb?=
 =?us-ascii?Q?eLpqlatPwNssZ122RN/7tr42GmWM+MqcWJIMvOsbC1JAMAYLumNgfGrNNN4E?=
 =?us-ascii?Q?4+5R2NcEZpXWRQx1i6PLp8h4uOd30WCSi0zL6sXVPtqbsDstiEfaerryzMxZ?=
 =?us-ascii?Q?F01prRzK+ZSdP3CW8JVyp2OTlyhxE1mRcfwPfxu5yZ9LCZI+Ejr7oEPohdZc?=
 =?us-ascii?Q?bC9vps9H77B3Q9qjkvqvGL/nGOwpK0k=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b63cd4f2-8030-474a-ae97-08de8578e346
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 05:32:19.0026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhWwhVi+PRkN7kvQ0Pf8qGGUSKBKOZGtkP5jHauEraUipWBq6lU0Ozm/becwKCdrq0z+/JFu/i5G2Xs9FELwQmyweaDQ5AkWxYBRDWPshzU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB1345
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,ti.com,xs4all.nl];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,collabora.com];
	DMARC_NA(0.00)[chipsnmedia.com];
	TAGGED_FROM(0.00)[bounces-56282-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.982];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D7492C63BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jackson Lee <jackson.lee@chipsnmedia.com>

Wave5 encoder can be configured to detect a background region in a frame.
If a background region is detected, it will use less bits or skip mode to
encode that region. This can assist in lowering the video bitrate for a
given stream.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 5 +++++
 drivers/media/platform/chips-media/wave5/wave5-hw.c       | 4 +++-
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c  | 7 +++++++
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.h   | 1 +
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                 | 2 ++
 include/uapi/linux/v4l2-controls.h                        | 2 ++
 6 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index c8890cb5e00a..b992a0d5c7bf 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -605,6 +605,11 @@ enum v4l2_mpeg_video_frame_skip_mode -
     chosen data limit then the frame will be skipped. Possible values
     are:
 
+``V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION (boolean)``
+    If enabled then, the encoder detect a background region in frame and
+    use low bits or skip mode to encode the background region.
+    If a lot of scenes are stationary or background, It may help to
+    reduce the video bitrate. Applicable to the encoder.
 
 .. tabularcolumns:: |p{8.2cm}|p{9.3cm}|
 
diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index 687ce6ccf3ae..c516d125f553 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -49,6 +49,7 @@
 
 #define FASTIO_ADDRESS_MASK		GENMASK(15, 0)
 #define SEQ_PARAM_PROFILE_MASK		GENMASK(30, 24)
+#define SEQ_BG_PARAM_REG_DATA		0x3800410
 
 static void _wave5_print_reg_err(struct vpu_device *vpu_dev, u32 reg_fail_reason,
 				 const char *func);
@@ -1838,7 +1839,8 @@ int wave5_vpu_enc_init_seq(struct vpu_instance *inst)
 	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_RC_BIT_RATIO_LAYER_4_7, 0);
 	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_ROT_PARAM, rot_mir_mode);
 
-	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_BG_PARAM, 0);
+	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_BG_PARAM,
+		      SEQ_BG_PARAM_REG_DATA | p_param->bg_detection);
 	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_CUSTOM_LAMBDA_ADDR, 0);
 	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_CONF_WIN_TOP_BOT,
 		      p_param->conf_win_bot << 16 | p_param->conf_win_top);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 7613fcdbafed..6fe01217233f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -780,6 +780,9 @@ static int wave5_vpu_enc_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_BITRATE:
 		inst->bit_rate = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION:
+		inst->enc_param.bg_detection = ctrl->val;
+		break;
 	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
 		inst->enc_param.avc_idr_period = ctrl->val;
 		break;
@@ -1205,6 +1208,7 @@ static int wave5_set_enc_openparam(struct enc_open_param *open_param,
 	open_param->wave_param.beta_offset_div2 = input.beta_offset_div2;
 	open_param->wave_param.decoding_refresh_type = input.decoding_refresh_type;
 	open_param->wave_param.intra_period = input.intra_period;
+	open_param->wave_param.bg_detection = input.bg_detection;
 	if (inst->std == W_HEVC_ENC) {
 		if (input.intra_period == 0) {
 			open_param->wave_param.decoding_refresh_type = DEC_REFRESH_TYPE_IDR;
@@ -1700,6 +1704,9 @@ static int wave5_vpu_open_enc(struct file *filp)
 	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
 			  V4L2_CID_MPEG_VIDEO_AU_DELIMITER,
 			  0, 1, 1, 1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION,
+			  0, 1, 1, 0);
 	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
 			  V4L2_CID_HFLIP,
 			  0, 1, 1, 0);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index c64135769869..dc31689e0d27 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -570,6 +570,7 @@ struct enc_wave_param {
 	u32 transform8x8_enable: 1; /* enable 8x8 intra prediction and 8x8 transform */
 	u32 mb_level_rc_enable: 1; /* enable MB-level rate control */
 	u32 forced_idr_header_enable: 1; /* enable header encoding before IDR frame */
+	u32 bg_detection: 1; /* enable background detection */
 };
 
 struct enc_open_param {
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 551426c4cd01..e062f2088490 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -889,6 +889,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY:		return "Display Delay";
 	case V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE:	return "Display Delay Enable";
 	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:			return "Generate Access Unit Delimiters";
+	case V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION:		return "Background Detection";
 	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
@@ -1296,6 +1297,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:
 	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:
 	case V4L2_CID_MPEG_VIDEO_AU_DELIMITER:
+	case V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION:
 	case V4L2_CID_WIDE_DYNAMIC_RANGE:
 	case V4L2_CID_IMAGE_STABILIZATION:
 	case V4L2_CID_RDS_RECEPTION:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 68dd0c4e47b2..939f796261c0 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -464,6 +464,8 @@ enum v4l2_mpeg_video_intra_refresh_period_type {
 	V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC	= 1,
 };
 
+#define V4L2_CID_MPEG_VIDEO_BACKGROUND_DETECTION	(V4L2_CID_CODEC_BASE+238)
+
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
 enum v4l2_mpeg_video_mpeg2_level {
-- 
2.43.0


