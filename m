Return-Path: <linux-media+bounces-54762-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gELCJV3KqmlWXAEAu9opvQ
	(envelope-from <linux-media+bounces-54762-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:36:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B2775220BED
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 13:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2A0A8303075B
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 12:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3FCE29A9FE;
	Fri,  6 Mar 2026 12:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="L+BA5yc+"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021105.outbound.protection.outlook.com [40.107.51.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9448C2848A8;
	Fri,  6 Mar 2026 12:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800479; cv=fail; b=H2UF+JbMAYmZ2VLuKvsGCXKoAiH5NxYLrmnd80xtTrvafIFS7xPgWeIRR34TVjer+CnUntjfgWMqlD0eh84pwdXmMJ4isP493oqkUBYYf+uHDiWNYAzRH5cX77a+P8LRKWkVzlbNjzxrLZUBht79E+hlIY8LSx9C7ZyngMlPcL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800479; c=relaxed/simple;
	bh=hVmBI08svfxC13TZjWhd8MA8+eHxJfeP3uKmyjpHZGs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fGxGfPRg5xBKb1eJ/UdpWYhVlPlTGevcWSDB1UYQxE9azjMhYBgkO2i7gvJwjtzgiROa626/K7IjClgNb3OmCZ0zo/Kr/cByo/ah0QsiT5P11OkTCW0Q74JiJK+GszyqkH8Es+09QFmLtsY0XElfRF2PCKe8/n5fdfE7HwwXauo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=L+BA5yc+; arc=fail smtp.client-ip=40.107.51.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwgxhaNNG9fyrEnDqDTUIb0Y7bNxaYmrmlqfpY6Oq58XYvFto7bhUVExKalCH5fpX/9p0BaHziKmkQ2YyPfpuwaQcDjUyM+Ix64SV+OB+b8k+f55+x0IECMRPmf2tVv0HzoAtZt/LY0Kpt+oxuTcvhk/UT/23eV1KaNkQpVneFPvb5H0cd/qfMpIMOqHjyCJ6lk3OT9blp4KSlqIiRPyZnv2Lq2iwWlhrNWqiWclW6ffhOWHA3FRMY8zwYzAY/pTlB2tuOI+J4c768rr/V9rIb3NwctY/oF4mahla0zubH2CavztQKdTHMvq+8U+7mSyWJV71WNK+toEelNkNIpViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22dTkebjDElSlUQsAkELWOUsw9+ckofKL6X7DOEZSmE=;
 b=eksgeYrrsS5lcWHqPNsY2+1on93rkfhScEiDV36h3q3vPUEXCTWHT5NHFda+KEzBNr4nYGnmZf+ySrmfs0vVkGoIfeZcdaqAL2JgXqinUUEwmf3lkPhAyHoFMeaGD57U+jg1z12+yZFyadCl72S1f/L9Mf62+5ugqtoRsxzdAUud3xgf4hUYCzIVTNJeFB59vTkXvay5C0RgCljvwjivqrVi8N8RxFU1VOft3j00TGk+yIOcCIc2PqWmbUuzgOJNCYceqI8fOufzyLrpzGISmg1rkgYVUea7a14tYTb7EEGnZ93q8jNwG8XjgoCetmEa7BeIV3KN3ER/zKngdObrAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22dTkebjDElSlUQsAkELWOUsw9+ckofKL6X7DOEZSmE=;
 b=L+BA5yc+z66dZsmpFPEdN5fDojOOBTy8sIsc5hKjfBCGOaI/UpU9sGo5UcIf0+nhINu5OeW52t/J82r+IinpOP9as/uZAONitiASM3atYv1rlZhRVC9i660RF1tF1lOEaHTcB7n0ckwTZ0xWrPq3RkWLNuBRDdCmJj8vs0CZtLTXqzdCe/4sd65JN48WpAEJHFSwlAswgucDH6Xx6du3P7Ejy8h6mrIixeYQyurxaNC115zKpvNwd4SyYjGfz23nK+0/soG3G0hhArTE+KUGsG6zRARqXvMMF0cvh6HmGIA18Knmyhi7bEpvABVIVZjhyLf/xd/Vyb9pLWu2TSobBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PNYP287MB5365.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:30b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Fri, 6 Mar
 2026 12:34:32 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 12:34:31 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: mehdi.djait@linux.intel.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/13] media: i2c: os05b10: update pixel rate on 10/12-bit mode switch
Date: Fri,  6 Mar 2026 18:02:58 +0530
Message-Id: <20260306123304.76722-9-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306123304.76722-1-tarang.raval@siliconsignals.io>
References: <20260306123304.76722-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:273::17) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PNYP287MB5365:EE_
X-MS-Office365-Filtering-Correlation-Id: cf8bf35b-d909-4f11-e637-08de7b7cb779
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	boCzr78lI79sr/2nV7VLy5b/TDnnxyo3nqrajIgbiWaMsO8gjePwhaLuUssfjD+0uHaQA6YDS63n25JmNz7NZF1KhwLHekdTy3h25f8PD+/gyv7tPfCv59OU3TghcktChL/ziuJvI30qAnkp/oNMur3CX+aY257ouXvlAeCZvEuXHAaHaIKywLPxsBXB/h++QS2OBWbs56J2bdKh2L8W3BVERXRRRocJrkVmL3669QOGwOi42kUIoL+e7W6SZZ6FwC4VJwG0JkVvIwO2GpzgKRHUfvv0I0tEAZfC9Zkwy8vQ2twxRaLMOat19uA8ZnZgOdBKxe9eBWu+wVGuiqU92k9H991gvBzopsyh+9gV8kBucYv3dlKDBjkbibFOcI4SEJxcrmYEcjKlLJiQW2uF+/YTlzuVSrRbE0hxMXC37qTAJ4tUK0OoxQOdCIrgttM66cUESH/Za3f2UOh5TD8wI81iSaOERcYWu8tcFrKRAcfCc4A8mcJIgrychxV6iMqaAba9fZq5PKavRAN4KJ7161nWNTF7h5RzsUoi/LuTjqka+9tDkDnt9F3kDfqRA9kZIUkN+VXH53uKcD8oRiS8B4wCoCmW+cuVo//nF/fxZAUv8zhM+8fIwvr1tQ3mEDre0QafBVr81h4yMUxTnwjgma38s7iSwLBa4mQd+56+RGDi0VPAj1/3WFMVtr+dUepoQYpyBBK67gw2lse56xNbBIte1qKPZSQZ1Scoa1uVsMBFzBByLBYToLy5hFpw9GcUkoQXK2Zfg1GOmd0pe5WvLC3gH5u1eEK0y33jBJ9dfYs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LYJYVaOZ6byNfrEXs2f8hmsYvlN4c8mPT/HKoB860LvA49/+FabWatyWoUiV?=
 =?us-ascii?Q?hqq81ckt4CaQFFHEX/7bfo9g4NqQQb2FrNPV2uPX8j93J7CN+AS8RJSucZc7?=
 =?us-ascii?Q?bYmrxbj+NAY5yCgENSGSHMVo9NH9csitEzT9jHOX2hLS7bR5pEVqDC+/ji+W?=
 =?us-ascii?Q?eE+5qUMVLanoUZ5mbjbaI7/ISUtJ6u+0RBrNFvkc6A+grQTTIhf4DS1FTvz3?=
 =?us-ascii?Q?pLkMwDUAEBm+nw9NfJ+nMGU/Ryy2BQvyW3XIjGWHqedsMhKY8bMoRT9DKhCH?=
 =?us-ascii?Q?KFCDioEPbPjIaiE7oQn770qwnWvEycetY6SckkZVqa4TYJLk7lyfQ3ZnQJ8s?=
 =?us-ascii?Q?eEPZSSieB61Vo35uc8VCL9GdqxJKF3azbu9rHPlIaGS2p7Kz+MTVI3EYrRnm?=
 =?us-ascii?Q?1EKS+n5d/ysodySk87COKxF9ABHL67U18McnOlBx8F6UXScIZR4GBDjmuk5D?=
 =?us-ascii?Q?Rq+HWJEPvOQoqzSrXn/Mn3G4bbZhZtaqgISyAC3YFwYdZDm/l6MqXdG80/na?=
 =?us-ascii?Q?R37btfREiX98+3u+g+ZtRPpGb5bfh+gse39P+WKSO7hluy0DtLMfVD5+1Qxa?=
 =?us-ascii?Q?GILnHAj/eFipIsdEHKy2Ing0UqnJg3iknKAXWTap94QN39p/f4iESvLqGRHY?=
 =?us-ascii?Q?5oL0tMgbvh8yGQDCHpCoTcTnlscJt9zI0F/LP9INFtTTWsWkVij9R3tR3gTP?=
 =?us-ascii?Q?E2t7apwibpECbwKcZGFx7++rR0mrHR0AQ2P0xYD9pPCMabLb/VlIlELyPU/m?=
 =?us-ascii?Q?DcIhW4yVKkrdrCB88D97VEPoqcf+oZez6K2V8VO63bvIRCUwXpgp1OCCa8t5?=
 =?us-ascii?Q?4OTRs2tj/powdNJXdEb2M38Dyv+pc4ILmVEE8kKxp2xkiist3LiHCXGZ46Kb?=
 =?us-ascii?Q?f9gFmRceKYkrxCO0QlpY6Y53vltuHR8Rf2FnPO7i/Uv5M/w34hkQDwvypsHa?=
 =?us-ascii?Q?kmoSvC+x+hwUOjcVNP5bL4JwGgPmmYmvm15H2YBOCz1HGds420s+euBXAUJ+?=
 =?us-ascii?Q?m4mIQjnlDOFloGLOwByb4aadxOubdN+NXSGlM03HoiCbZKwnvVAq0TeDq1DQ?=
 =?us-ascii?Q?iotWnNb75NTPwTDo0g+8hIUGVjXcR84TJzlfvVsFQviWs4h7mlBqA3QpHU2b?=
 =?us-ascii?Q?BKohl3ery6YFiQK7YDN6Sao0d3i7/DkjuW3HJDmEwbX8f2MIiAUCtJmmpwXK?=
 =?us-ascii?Q?x1V0ZjSjoLT16SCHgx89s8xahS9LWmvDbuMQ1jdKxzQzxY5xsrXs2kuPJmj5?=
 =?us-ascii?Q?HU57CsAGS+SEruJ3utGzY6X348VeD8UBj0255ZEe2c8lR5yq0QrCHaBzoahy?=
 =?us-ascii?Q?1ijzrOnV7rihup4ZfD6cS7QZV3tOxi2f5cBGmWmXeN888J+9esmUBblNy41v?=
 =?us-ascii?Q?Xki0TQvJ8MfdrLEGX3fezLRtte+TszmCpwPjQhBu/1tdRQt+eRD3fcYt3i/M?=
 =?us-ascii?Q?yZ3WTHnWGSA4DSLv28Cn0n2A58Kh1X4TlqsPnDSQvxK/1o5yNPcJ3JDlkhRH?=
 =?us-ascii?Q?Go1AOF4u/BTSPKaRBMBsI1i0GT+pRvbSPz4ZFhFIPMtaSCLbyLkZVzbpFIg2?=
 =?us-ascii?Q?yJwZvB6ra9+yBn/uix+REHLYEO3Ck3tsSmt0lUlnXn20Zoo2Cy8VmYrH3/0a?=
 =?us-ascii?Q?RZ1FasjYmxSckgYjLnI+SJPXz6Jsc5WPWYpPnpVpcgbvUe/JgDP947SvEGxu?=
 =?us-ascii?Q?S2SAEnaZDr5Snw8R1EJrfS7G9qTfQnwkh6L1Ko1hBqriA06O/WrBqNeolpSi?=
 =?us-ascii?Q?T0mMyJyJbj9O8+NykOTZJsY1BwTUtkA=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8bf35b-d909-4f11-e637-08de7b7cb779
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:34:31.9321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXHgeAh3ue+sgvpZL07LiiIDSbiaBHprkp/yCvD2QYI44rhgXwJKLNaSB5zHS/YS4/u9AMF5lkiJREIUpqCsTOrNn1+o21OBT2YEEm9Y+7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB5365
X-Rspamd-Queue-Id: B2775220BED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-54762-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

After adding 12-bit RAW support, the pixel rate depends on the selected
mode bpp. Store the V4L2_CID_PIXEL_RATE control pointer and update its
range/value when the mode changes so 10/12-bit switching reports the
correct pixel rate.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 41 ++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index d51b7d18d28a..5ffc7aef0ed1 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -474,6 +474,7 @@ struct os05b10 {
 	/* V4L2 Controls */
 	struct v4l2_ctrl_handler handler;
 	struct v4l2_ctrl *link_freq;
+	struct v4l2_ctrl *pixel_rate;
 	struct v4l2_ctrl *hblank;
 	struct v4l2_ctrl *vblank;
 	struct v4l2_ctrl *gain;
@@ -680,12 +681,35 @@ static int os05b10_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
+			      const struct os05b10_mode *mode)
+{
+	u64 link_freq = link_frequencies[os05b10->link_freq_index];
+	u64 pixel_rate = div_u64(link_freq * 2 * os05b10->data_lanes, mode->bpp);
+
+	dev_dbg(os05b10->dev,
+		"link_freq=%llu bpp=%u lanes=%u pixel_rate=%llu\n",
+		link_freq, mode->bpp, os05b10->data_lanes, pixel_rate);
+
+	return pixel_rate;
+}
+
 static int os05b10_set_framing_limits(struct os05b10 *os05b10,
 				      const struct os05b10_mode *mode)
 {
+	u64 pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	u32 hblank, vblank, vblank_max, max_exp;
 	int ret;
 
+	ret = __v4l2_ctrl_modify_range(os05b10->pixel_rate, pixel_rate,
+				       pixel_rate, 1, pixel_rate);
+	if (ret)
+		return ret;
+
+	ret = __v4l2_ctrl_s_ctrl_int64(os05b10->pixel_rate, pixel_rate);
+	if (ret)
+		return ret;
+
 	hblank = mode->hts - mode->width;
 	ret = __v4l2_ctrl_modify_range(os05b10->hblank, hblank, hblank, 1,
 				       hblank);
@@ -1058,18 +1082,6 @@ static int os05b10_parse_endpoint(struct os05b10 *os05b10)
 	return ret;
 }
 
-static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
-			      const struct os05b10_mode *mode)
-{
-	u64 link_freq = link_frequencies[os05b10->link_freq_index];
-	u64 pixel_rate = div_u64(link_freq * 2 * os05b10->data_lanes, mode->bpp);
-
-	dev_dbg(os05b10->dev,
-		"link_freq=%llu bpp=%u lanes=%u pixel_rate=%llu\n",
-		link_freq, mode->bpp, os05b10->data_lanes, pixel_rate);
-
-	return pixel_rate;
-}
 
 static int os05b10_init_controls(struct os05b10 *os05b10)
 {
@@ -1083,8 +1095,9 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	v4l2_ctrl_handler_init(ctrl_hdlr, 12);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
-	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
-			  pixel_rate, pixel_rate, 1, pixel_rate);
+	os05b10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops,
+						V4L2_CID_PIXEL_RATE, pixel_rate,
+						pixel_rate, 1, pixel_rate);
 
 	os05b10->link_freq = v4l2_ctrl_new_int_menu(ctrl_hdlr, &os05b10_ctrl_ops,
 						    V4L2_CID_LINK_FREQ,
-- 
2.34.1


