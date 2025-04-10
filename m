Return-Path: <linux-media+bounces-29827-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D406A8357A
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 03:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFDA1465DF2
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 01:10:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3191E1DA63D;
	Thu, 10 Apr 2025 01:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="I4esTL8+"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021134.outbound.protection.outlook.com [40.107.42.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D656F1C8633;
	Thu, 10 Apr 2025 01:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744247325; cv=fail; b=CbqZzoUsj8eIXyG4KJ/dn9LyrY1rkwSxUAd4rrwY15Q+qbPGnm3HNFfeQ8H+EN8QWl01oaSWYr6AJiekIZrlF/xpQBWa65VoWV50b03AzYL6d8hqoXuNHsbeH+w5wP+Q70KF28eAQxR5VrSKTE9Zno4XIJpPsmSMLEaXbXPuXG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744247325; c=relaxed/simple;
	bh=xg/PA/9gRUsESu99tTSwUeXsaGFNFWmJRfwJNaKyy9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mlqNm6fK6wWZKUfURS3D5uJ0fgEjot87QxhDLk4vjzJe+wyYkfUhwIcJ9wREuGqpJbL9eVzkblCxa5hnqPqzaC0Ov7tSvkKseCyVuDq7ZVg4xbClYh1PygJ5FgCQxCeVtT7gwhlSx38JSj6gW4nu0eKJMRGzi4SANmWdEv8cRLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=I4esTL8+; arc=fail smtp.client-ip=40.107.42.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNQ7O7dJSGLAdF+8wxVRyGoncEQHiKE5/YoilzjunW4nbyb19nboFK/slwD9u+/PdmYk0MY10sbHMA6O986ryTDtdz4cj4dKdjFWN4CEeIwnkhyJOYuyYYH7E8zEoX1DeM8f8ttMhRT4HzyA6+mEeiJcffXce6+Pfzg67StolFCC77wMLDmf+emr2VaABnIfzJfbjJGCYmymotkLWRTB6/iAQR3WoEyb94WM3D5vLQA4uYXQVgQ3Q1PXMjj59ylCtwRZ64A24XjTKkkEl7BpWrZ26Jf8/KWQ53O+xvG7VG/KzfcLHTAIhICtFOr4M/dCfUngp/ESMedqtZ/CdA51GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FT1C53ahmCMpbiN6CEJD58lrxkwXSk8IKWpcgRM+nM=;
 b=sGRtpXTpYeJmEe+ctvPfsV1X95wSWgj79rMwBZ3PUYXQm+epr7pJJveUJCA9tmAQ6FCJ24M+/bHTJ1/iuGaX4Rh13YzFM82N4DjWRT0d/Fb6R+j35d4c7H8oqg2c13btJ8Ge6XK3frj4FbkDMVKQgjc0ntVxH3Ibas9N2qsfxGHU7Me08IYtaUV4LBxDgA9X7hvtSzxQgtPMNFhv4s0FBD2aDV6ar7bLghBkz/F5+ndhNbq32nDFWNgaJZjFhKgyYgLBvMkjOFSqe9ovWTrmwimi70HCDIXeakU80TC0/uABuLBVf84urOmEJBSgHuXQPeih9LCuZ+Wj30S0fkN2qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0FT1C53ahmCMpbiN6CEJD58lrxkwXSk8IKWpcgRM+nM=;
 b=I4esTL8+hx7nLq1Heb5jGEfuMOhTt7aTUSsJDT9nMlVpRn0MhYcU3agR8vQHB9wVemoL4QdWXFJ5H1E9HWcBbjZI2ftlNhPx03Nk0Xsqvr2g9y0J/nLGyA6STSN7FsktNrA2UHyF6JE9Y/xy6EXdFQ3Jm2GRmiyiMBQYuYPn5lY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::13)
 by SL2P216MB1403.KORP216.PROD.OUTLOOK.COM (2603:1096:101:32::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 10 Apr
 2025 01:08:33 +0000
Received: from PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386]) by PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 ([fe80::d095:716:2d14:f386%7]) with mapi id 15.20.8632.021; Thu, 10 Apr 2025
 01:08:33 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	sebastian.fricke@collabora.com,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com,
	dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v1 6/7] media: chips-media: wave5: Reduce high CPU load
Date: Thu, 10 Apr 2025 10:08:20 +0900
Message-Id: <20250410010821.52-7-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410010821.52-1-jackson.lee@chipsnmedia.com>
References: <20250410010821.52-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0151.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::6) To PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:73::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PS2P216MB1297:EE_|SL2P216MB1403:EE_
X-MS-Office365-Filtering-Correlation-Id: d34d0939-3e35-4106-2050-08dd77cc36cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FnXuwcqR4DXRAg/WS26Q8FVDiHHBva/fsM9eZoUBI3Q5d/LnSWMMymNVWC9s?=
 =?us-ascii?Q?RbMNM6zf6wq3elnt82aBt1wuJrGFjsCgxlXMetcxFl0wS5Zo8wPECJbIMX9S?=
 =?us-ascii?Q?44os5TumRPvpruyxn+IhtZX1HcMAr9NYYFtj1FD+EWDsLnk+j2JRLS6f91+v?=
 =?us-ascii?Q?hyNUn4kgrLn73wfW3Vp4YFQ15HatlKFEVVwpCOqvs91trQOsFv2tDjlhiO74?=
 =?us-ascii?Q?eT9ERQ1kgU0KJCL+di5IdCVj3uQl5cb7AluYTSxHv30Ixz6gYiyGr8GwAQ2n?=
 =?us-ascii?Q?RN75nby548keNN1XBmIPlQNKtOuGJrpCoC3muQ+FWrcP6HBRrylNZrjzyC3A?=
 =?us-ascii?Q?erguMERVwsl/f8CCCNvbbgp5oZQUp43OYx8P9ymGVWLdxZHeHbEHAav+dmFg?=
 =?us-ascii?Q?tUUcPHrP9Z2NOFw8+ICztjyN9ek/WZNPpD1xpalJjgcyhGpIrDoChSxE4G0u?=
 =?us-ascii?Q?Jcb4CPGPJ75EEtFANBsW7mUhIzFgDtnxFq2JPOgjWxwh/4gd1xp6/kfs8gZj?=
 =?us-ascii?Q?ZzdgKyX577ZGaWgGYCi91s1E9qbtKfFiFAQNNL/FSKIN7nyvWIRr8/gQU5l1?=
 =?us-ascii?Q?6mO6im9C2RmcfScLyklMYd2Ll2bnkcWmmroOS5mwv1kvY/mwYPenDn0COylQ?=
 =?us-ascii?Q?pLxXJhOdOjK+akvLkGY90IHzOtdk4vmCPKqlHf3My0LYkRhY4K1Kuoyi1mP9?=
 =?us-ascii?Q?FQVLh0jiQrT5iN7R320hqbj5MjtqKpqFO1DzQxHS9oInfuwqx31JROVAiUSV?=
 =?us-ascii?Q?LZgqxkes2fDLa/6BPGNADT3gMBSMqHPOnOxHIq+os5WlZG7nr86a3esWjAr/?=
 =?us-ascii?Q?gp82BgEXtdcYJIGcvxkhv2bAFD2BDc/tFxBdrPQYvGpPOsrBIkUNZLJ7bFes?=
 =?us-ascii?Q?36n+UsUEzHezXL3l8Uw0AOcvA6XrJZbyLFlWaycrfcU/47OAE7lJzcsqXNlq?=
 =?us-ascii?Q?q193Hv8t2Kpj6zznTTUl7A6Z0IumfPPejmSgCxCmJq0wrcciGNkjobC/vtUM?=
 =?us-ascii?Q?ExMNP6sZkLnxrVs3N46vckU5oJi6b101zc0nJ+iAW5sVacECTc1oSA4JJ14r?=
 =?us-ascii?Q?O3r899ckocgyuRotv/TPFA3va0ZFCS3znqgFnAVBuUcAdIWTeVTuJ5e+e7gB?=
 =?us-ascii?Q?PZSXP2jh4povNNGCCgiHmDmrQ16oN4x2LES7Cd0gI0jxGEV5TRlkBvvhLM+E?=
 =?us-ascii?Q?D1RLow9mZJ1Y/+EH/OBGGz0XcyIQYX3CUxVCGJN/Obxu1f8vYU0Zt+XA106g?=
 =?us-ascii?Q?+R9rlNbZHysTcOH4UOjwQV9okClMw4xj9USlADRTsfDzMPZVE6KijA2MakyQ?=
 =?us-ascii?Q?4LvrW/RbQk0p2zkwjOWOR+fp+IDNKZS9fPKJEl3FV7jXfg7gRfOcVRbxeOY4?=
 =?us-ascii?Q?7DFxRVCrgLw4dKQtQo7/VrYr9mf94PP0ziaYUDUdqJFNC7ETspA3IvjhJr7z?=
 =?us-ascii?Q?MJ3oo+hfDaUQVeH9uKgdiv5r4orxgO1Sdy8yMrk//mfA9Zfr6gHwvw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS2P216MB1297.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e7C/o6/nLLPjh3DJLxfQz/iqz0dD/muUrPxAZK0MyNexYaMx0bt/ygTB/l35?=
 =?us-ascii?Q?mhjNWFOIib3Mof2rQA1Hk1imwj/d8OgSNttcFeQXw7nHRMj21rGhdd+l6qk0?=
 =?us-ascii?Q?+UWTJEAb+PWrQxI2nlRVms5Mh+NzN1wyAk0Nqs+TW2SHD8MNSzwOcs7IsGgz?=
 =?us-ascii?Q?rELg28p7cJOEx7jKVVss3J2Hk/JCz/e+xZShYAFFNb18SUHf4nvseCUC1kbl?=
 =?us-ascii?Q?g4mcacCmExGcX9J6kCpwK6+sapydVAkdCkIVSr3+dbVlmFRcAZK68cyujmJg?=
 =?us-ascii?Q?ewxB7Ywm3WqeS1+NxCYqhJLjICeib6Y6TKmU30hyqU3yJmhyBMwOu5Hwwvwg?=
 =?us-ascii?Q?D1+Qi2l70V2PxuDfgMkv3UuKeVlU/NfWo5EL9jKyvAZh63u3eKKO2QOKSaRj?=
 =?us-ascii?Q?quwxwbmBbdL9LfU+kW8bokQ/Djyr7EP6F+rDUR7uwXV35O4u9JJCNRKGiLJF?=
 =?us-ascii?Q?HG5P4A/KT+Km1+pOSuTk1hBAHAsBZNDw8jit7CXU4OVRqR0KqYWfqbx38W9z?=
 =?us-ascii?Q?LVzz2BFBoONXjgvE82fqXIUJ92j1LOI8rfHIS4CPP5ryVVer4SkDrOpHUTln?=
 =?us-ascii?Q?UkGURfICFrg+bmKR8Xh2StxsIAzZNfH/BRjYqLy9XcNE+9anP+a8OHvm5510?=
 =?us-ascii?Q?W6F9dOAgT1XKUdWz0IvE4rpWo33ZNei6/iRq0iqcK7qKQX2aytSzsTv5rj4f?=
 =?us-ascii?Q?mFx5gphZNMX6LkyAgQdpid83osDZ+XuGBDq8rutMsTgYiXpsWnpZU06DKA2r?=
 =?us-ascii?Q?aK32Sa3rAWAdSLu5Ss9XPyljbgPQaTavD841MXdHNSOuTBLSLzHbnte05OI8?=
 =?us-ascii?Q?OJvlDIoSiEttGSySbwy3sZRuilu4ep3LhJshI3TufTX4ciO7BrgvlKSKr+Fw?=
 =?us-ascii?Q?oCUbDjTPl/lqV7rBk3YJlfJBnMDZJgZ+qeS0MmxkB25X+vO4lxJ/12FcuIM5?=
 =?us-ascii?Q?o+1b9nn70yi2ChWdyMT4z/6WLEZOfGzy+4rU2CINXaZjOQAB3f37YkRNQF/G?=
 =?us-ascii?Q?5WvjQxcAof9YQeuYt/S2HnRjcv2dH/H2Ga5bi6EtHFkOwHZQiISPDQBA18Nm?=
 =?us-ascii?Q?n8/3YDdrK3TD0ib9K6T6q5EivgCz+CCLtcqTBtzi2AKNMygnjpsAFCBa+W7i?=
 =?us-ascii?Q?1nMZyZYcAgATpejszR7q8MFe4VuVtlNHmJGZVKLzEinHg/W4kGyyUZOnm3nR?=
 =?us-ascii?Q?Yv/LS8MAb7vYxf2pm+Dr2ZBGRcc9Bx+4C63toUYMVFHtcnqosRMWo2fW3xvV?=
 =?us-ascii?Q?1ZKE7FXaGVK3VHCBINPFwKz6hI849Kp+GIG7E4iCXP57pu4UC/79OPMBKuE5?=
 =?us-ascii?Q?Ajw7faKV8WLa6MQthHeeH0Z+boygvEvrR5Sd8vMwOIfCRt5xAQwhdpAu2Eft?=
 =?us-ascii?Q?tk/2pEnCqRJ6eIyszWPDgP8fpti94OqHWMFkWaWtZyJ/GXj9P/Jva4RrBpiZ?=
 =?us-ascii?Q?QjznDjwA9NbPavfZ+8n9LserdlGngd/03MLPjN15IWmzaDaQ34g4SJb/+vYO?=
 =?us-ascii?Q?psQlYuJPe0B/ZZPMuvs1jxpgE2gE0GIYv2LGlhJdrZ0okhiMg67H4ACW00Xk?=
 =?us-ascii?Q?cRyTOFEWBMiwJtGgwnVxlWa19cZximDAybgx85mSWb/KXnS6QNDIi5MPP52I?=
 =?us-ascii?Q?Nw=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d34d0939-3e35-4106-2050-08dd77cc36cf
X-MS-Exchange-CrossTenant-AuthSource: PS2P216MB1297.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 01:08:33.4614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Ewq3Q4lKd8qgtMnXbeyOAWCfhpm2NGeaWb8wVeDzE14R1HX+n9EB0O97v2xIENbcF4803mLn8XbHviji5/eYqjB4dURZukbpc8pfdp7ArA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1403

From: Jackson Lee <jackson.lee@chipsnmedia.com>

Since applying changes for performance improvement of decoder,
there was a problem related to high CPU load.
CPU load was more than 4 times when comparing CPU load.
The root cause was the device_run was called many times even if
there was no bitstream which should be queued.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../media/platform/chips-media/wave5/wave5-vpu-dec.c | 12 +++++++++---
 .../media/platform/chips-media/wave5/wave5-vpuapi.h  |  1 +
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 485320db9bdc..58340fddcd04 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1280,10 +1280,13 @@ static void wave5_vpu_dec_buf_queue(struct vb2_buffer *vb)
 		__func__, vb->type, vb->index, vb2_plane_size(&vbuf->vb2_buf, 0),
 		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
 
-	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+	if (vb->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		if (inst->empty_queue)
+			inst->empty_queue = false;
 		wave5_vpu_dec_buf_queue_src(vb);
-	else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+	} else if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		wave5_vpu_dec_buf_queue_dst(vb);
+	}
 }
 
 static int wave5_vpu_dec_allocate_ring_buffer(struct vpu_instance *inst)
@@ -1474,6 +1477,7 @@ static void wave5_vpu_dec_stop_streaming(struct vb2_queue *q)
 
 	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
 	pm_runtime_resume_and_get(inst->dev->dev);
+	inst->empty_queue = false;
 
 	while (check_cmd) {
 		struct queue_status_info q_status;
@@ -1592,6 +1596,7 @@ static void wave5_vpu_dec_device_run(void *priv)
 				inst->queuing_num == 0 &&
 				inst->state == VPU_INST_STATE_PIC_RUN) {
 			dev_dbg(inst->dev->dev, "%s: no bitstream for feeding, so skip ", __func__);
+			inst->empty_queue = true;
 			goto finish_job_and_return;
 		}
 	}
@@ -1737,7 +1742,8 @@ static int wave5_vpu_dec_job_ready(void *priv)
 				"No capture buffer ready to decode!\n");
 			break;
 		} else if (!wave5_is_draining_or_eos(inst) &&
-			   !v4l2_m2m_num_src_bufs_ready(m2m_ctx)) {
+			   (!v4l2_m2m_num_src_bufs_ready(m2m_ctx) ||
+			    inst->empty_queue)) {
 			dev_dbg(inst->dev->dev,
 				"No bitstream data to decode!\n");
 			break;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index fd0aef0bac4e..f2596af08cdf 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -821,6 +821,7 @@ struct vpu_instance {
 	bool retry; /* retry to feed bitstream if failure reason is WAVE5_SYSERR_QUEUEING_FAIL*/
 	int queuing_num; /* check if there is input buffer or not */
 	struct mutex feed_lock; /* lock for feeding bitstream buffers */
+	bool empty_queue;
 	struct vpu_buf bitstream_vbuf;
 	dma_addr_t last_rd_ptr;
 	size_t remaining_consumed_bytes;
-- 
2.43.0


