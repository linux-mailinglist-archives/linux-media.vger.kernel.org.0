Return-Path: <linux-media+bounces-16101-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C69694E698
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 08:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 153A72824E8
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 06:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0901153565;
	Mon, 12 Aug 2024 06:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="iQ02uT+G"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021079.outbound.protection.outlook.com [40.107.42.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3E914EC7C;
	Mon, 12 Aug 2024 06:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723444178; cv=fail; b=A2mGm0v3PTnlteU2uO1MKjXOsGyEmKOLv16lxByn9/IdOJpTrGS/vz9GK2pQVO+D/NfqMO+KTmWPWtUol/rnKyLdxpxS9/LK+8JIeTOzorGwIX09wNjkNQp79BihgsFiW8UmZwinZn/GhYWtuS0XioTtlYf6/lkr1Bu6LwTfFt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723444178; c=relaxed/simple;
	bh=u8jZRLT9Kb/i64ChAlUUq4TiXNsoXK8TbCqEpbEsFJw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=iHVryup1iKPNDMDQ/ic9AuD2pzmpi86SthYpe4Gnm5J6TUpgikKpFrxw1H7QKKarQvUBkp7S4MTc1yDiO308slbtkH0ByiPipj3UjIOWeJmbCUTzojNeUKd3LaQ0IHaJzLKsgCc6ahXzwH6vH2+15tX7iQiKvIV2CDJ3Aj4wllk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=iQ02uT+G; arc=fail smtp.client-ip=40.107.42.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAcazxQcbP+hYy2KlabsBl+Pn/MAsOK8/a0Re97L9fse9gyXea3OsJu3DQGuY7EAeY0gxteNvmV2/POKmTCBdYJbHHQuo7I57QzEECPtiSJxjB+57wZx7ess8Be6pyqDtdDjsMAOj6N7D/VHQSd8NDcTDW2nROt3G8W0kD3zge79rr3MNRXR9BIyBpulX9eIWklub3Orh+2kEQIxXuBxQlJrxjLhsZRIGOV/G9VTTvi2YkqiRGBfVUMUJsjFOgqVHY5a9a6YypygVEx998M1H2x2MwlH2jH2ToWv5WecBkXZnuCxQWlz9nyl+aF+D+6NOZZxMt73QXmgB5EjTiP3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0M+B2gn4Nz///ceFIbKp9sH7OoJMOWgaOr17LAZ/G8=;
 b=Ah18nI4Q4xf1VVhLzwlAFq8tq9rKtmdbwDvFnQeulYy0QLj9zQqRnvizvXAW3/CeofP7uwZNbRTBAlVN7RXHfhFBPnjnSAk+oNc7QcMa40CdPq+2AaJnqyez5SwbP+S4d3Z94FD07fhcrLElBlJqWbwvFMcvYZ46a+RGSeomfL4ScIH2c5tAlhgQx4aEi6AV/d7AA7FIkpPTrxWeuKZxq5bPgNgV7/HGzK3FkWkAUYqgFoIKJhbcuIla3T/Wt9elXBVzaA2BoBPBfnuxa1LvD2l4otD+g5dPF2/4ftBzuyDeQaKfzJyIkuTD8FjLvmDK7zSod7R4AXrP1vp8wPxL5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0M+B2gn4Nz///ceFIbKp9sH7OoJMOWgaOr17LAZ/G8=;
 b=iQ02uT+GQlTVH8oeFXI8s2oa3UCWbna3TiGXACJXZlyxvXI6yMhqVzK3D3Q9gJ3V2HEn8VmwXLvC/goc4ouBcPZhBfw7EmYGJE0JqTCVr/NYWccJUxN8cPnqwC+2jY1S9L/kViLcvbgCLIv+Hc3syz61gIpwnhQhK22uKUx26ns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE2P216MB1812.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f8::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.20; Mon, 12 Aug 2024 06:29:29 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%7]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 06:29:29 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	jackson.lee@chipsnmedia.com
Subject: [PATCH v7 0/4] Add features to an existing driver
Date: Mon, 12 Aug 2024 15:29:15 +0900
Message-Id: <20240812062919.78-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0044.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::11) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SE2P216MB1812:EE_
X-MS-Office365-Filtering-Correlation-Id: cf26be96-5ab1-423c-cb10-08dcba981eb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A09hyDkzgkx/syrF6UHCutvpOaikXMchySGIb25LdaIeiho8JUw+GwwSKp6V?=
 =?us-ascii?Q?Zm6Cw6Lx/rgRV2W+OTX+TkjWi+OBlOpmsGNKoGjd+CgbObl+6x8z9RUXn0hy?=
 =?us-ascii?Q?c0+wJ76tth/DJSKFYRXFurQuFY/1673niwjCpOjGdlRtjsq+XTWE584sagGV?=
 =?us-ascii?Q?Xj3krAEY3Tf9DQz9t+9icgOk8loNR5N6vWLL9IYOHmz5TnTns80OVvnBRLAZ?=
 =?us-ascii?Q?Dh4JNRi7Lb8Ep7HbgUR4basIg9CVb/7F8IT5Ef+FdE/3quhqpH6fMADfwn9N?=
 =?us-ascii?Q?9oIVjmKTxQXPdVMapLbkD9Lb7JWdig0dkxY5USGUEPBAA9z1J+KVimoClHQf?=
 =?us-ascii?Q?U+zWyosQBuv2PuyWQ56q5e5rG/fBA758+bBz/L60YvtrJXuf6juerqYMKZep?=
 =?us-ascii?Q?GH+a9jG6cOD7lG020PFBZHMijVIzrk3e7LRefPzJy1GlsKeZDg+v/D5a6fjk?=
 =?us-ascii?Q?iKwaWOtsTGwhMbK0CfH1jrpMvnOyOiO2VJws+Pd1sHzeHOLsh2Yt7CrQE4Ch?=
 =?us-ascii?Q?72Y3rQlzfN5IiWQLdD0u0dr2HOqK7gvJ9ERVrxODnLcSxT7SJPXxQW2VSqQC?=
 =?us-ascii?Q?8HfW/r02y3RCtZz9G+nNDZPtxpYCIU3BjvgAwb4909C0WT8Sgkus3vVfgXWq?=
 =?us-ascii?Q?Msj5KGTmjdlqmpxlH9LNZ0r47UcREecu/GccZ/kn/GiPUMsZX6Vna/zRmKST?=
 =?us-ascii?Q?+XQNPvjbIVY8y0dSncBgAUey8N3favf8u7d81HScjGbfnvmU2dYyiEV236mX?=
 =?us-ascii?Q?pW5W9vKm1gbMGDrWVyikKB2oNyorCHLlMCoukgFsY5GGmsLaCxEgmiAWwljQ?=
 =?us-ascii?Q?/Tq1xllUugl2dBoYkN93eQd/7qVaCCl7sjVZ/+xAhu4av9HmRT84Kk1XlA6l?=
 =?us-ascii?Q?xHG40qomyPe/T6AxPzgF9VwT8dWEsaWBEUAecSDHNnI5Fz1jCro9oDgQHcHM?=
 =?us-ascii?Q?jHCrplEVn/CQuFF4+q+4bbT8GpcDeVHz9iteDHJYm3EHJEUjht45u440IOg3?=
 =?us-ascii?Q?2unIBF2juxPoiNzMC6INooNYmArDwR5tl8iZbSedUSryj5DWzb7d67X0zRbF?=
 =?us-ascii?Q?nZrC/b3BP8OkUpdm/+6BL/8iAarMeYl2P9rFD1Av8e6CT0+nkEOwAEj+8Rn+?=
 =?us-ascii?Q?RyPNfu7Jx4bWwZNhFrdjqSIFIvgi+5mm7JALQ7UWNnW82WL/kmFSK7ggExxT?=
 =?us-ascii?Q?e2iUMYXwrCeXPxhTw76bMwig2ouTADj4i6mbJQhiDJJweMUX/V/vdX1odnBd?=
 =?us-ascii?Q?QTrNLmiEfTpD0rlNhFlaz9Ik19iJg1tT3sUWBTNIIRaIPGKagdstS0F7xfIt?=
 =?us-ascii?Q?i55hW1liWe5loyrjGogWGX1VPCXC4pAWLHm9NT1YfbQGRkDHVv+0IT8c+KLP?=
 =?us-ascii?Q?kV+Q0Vv1BE3PJtwWkLt0193pg4kFBkZUMoQ24HkttKK3Ch8tQg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3B/XBy3JgojI0tsJ7S+FPOzaZ/qIelhrnz/zT+nFIKU6rWnHWkg17jpLDbSO?=
 =?us-ascii?Q?/efIYcKZwIlR5gC6wIhAWZQct/WFSaE2RBpSTSu1gRPXhH7LydMe/GWXo5TF?=
 =?us-ascii?Q?G77eLElWkvwj4lLMWeDhEvXbpAFxfGGlyxSoJtm3vi70GI5OHkRq/u++4OPA?=
 =?us-ascii?Q?KkHSdHClbK+qUeNKPu92BAIsmlb0CX+8rFZXjBtWPDDI8dSDNAEINH5JC3/5?=
 =?us-ascii?Q?P4DIRnhf9t2Comqp2zu0oboMIf1nrl4j0jFp53PB/GzHZRuY8rgEUB4aGlh4?=
 =?us-ascii?Q?WBCAmcszbU7EP9ZnOLKHzuKGwr/L7gXXErlUXSHTxGpIX13E+R6GHj/gfxW+?=
 =?us-ascii?Q?uubZXgusTiBUEh/cgaYQwXNHt1jqB5+Fp3YHs+a8W3KsxHuKmQJNadBtDZXB?=
 =?us-ascii?Q?nzElgEZBNQBrDE4MhbkmZx8TgRuH88/XkUNTN9OwPBnfEDoW45cPckMjJkH9?=
 =?us-ascii?Q?ZeFu0HrJxD+vWcTHkFp1phej1A3hBhHfdM01cqC+RjWnFraXLJJ5HJxXG7gs?=
 =?us-ascii?Q?2b+q40pH9ipzrIFEgqyfZ3SkBslqgcZAKFz9hDgUhNYGqB7M2t1QL8rY6TrO?=
 =?us-ascii?Q?sUuHhd/7T985KG0Yn7FBxpAz1JrgzdVjMjvLLJFIGBn6g/vjoOyz0yJhDI/R?=
 =?us-ascii?Q?pXYurJs+3FmteG9gVJx2bJu0h/9s6o8um02g/6QPAaa+ej4P69xnRjKzP9RS?=
 =?us-ascii?Q?PjLY9x+YNrdDvuTMwTRu5w5i7jzEu7WNxKrZYfTC0COBttp3gcwtAtnv+b8B?=
 =?us-ascii?Q?KAQComuJlq47TwxyaPeENMfNMz5Mri4ZcRu/Qf6glpaDOaNJxftCNGl+URaO?=
 =?us-ascii?Q?Z7QiZzGNgK7iewl6r1014fhKPTy9mqim3jH8sy1b1GDgOZjnPZ6+EoQpqXwa?=
 =?us-ascii?Q?NnX2NTN6YR3s+QOuLZzKt76xTEF6Z1qGdXx8mCsljw4rUa5RTVi7j6G8/MgU?=
 =?us-ascii?Q?UMKoQtmC+5U4nAluqh+cUTxm17wmW47bs2pt5YFVf1VAokhizcugehu795yX?=
 =?us-ascii?Q?RRpNnuMQo+BDA7sWJMSssslQA4BXxXql+Fqvyu8AoZLmMCiQLeeKm5U3hFfk?=
 =?us-ascii?Q?gnksZNctY3InIkcmAybNm/gKyvz1dtFunnvJx/eFaSH5KCHrKQl4w7oypPIj?=
 =?us-ascii?Q?fk9qVhVoKiHtb/7D19g0DEsdBUK+P9RNRUOvoYTagtNO6HfKlk2irjwlbXB1?=
 =?us-ascii?Q?6Lt6RbLSXGd9Q1ZYy5AYjh4QaGjf9r6eAGl1WcJdTzGRe3WBRaxGCSEkfZ2Q?=
 =?us-ascii?Q?Prb112HuLYsYORmGhacabRGpDdKz/xR/wj+8TuUEDwapSBheigE4uCmTD1sp?=
 =?us-ascii?Q?2KnB6kX9BniaOGsDmM3ErgKmOX8MDGjOa3ac65pUJZbEMaATxmG1fs15uqOv?=
 =?us-ascii?Q?rbyWx4EWPR+q5ljdETaE1l+8P/TXdpwOUAZuGf89df9iyNEihCXFCdE/gSr7?=
 =?us-ascii?Q?wl/hrxa554jskYWyi/u52yxJnjA7qx5aVrPk3KVyvYqpF52+VaaUrGM3P2zk?=
 =?us-ascii?Q?bPq3y/R87DaJmHr7S5v/5fX1TjE8Ln7XE50wDzS+VjnYZrmvHdeLreYrMqx2?=
 =?us-ascii?Q?y81rDsGYgPih4us3+uQ6q6pJvZ61ieW/HNv+sZUfuj5/oaCKJ8CLgHhEEHh2?=
 =?us-ascii?Q?ZQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf26be96-5ab1-423c-cb10-08dcba981eb3
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 06:29:29.3750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X67s9oa2fLMyhSFQQovyqRrr06J3+tjCWretnT6eK+7OV5h1Ifk+AecpkZnpoCrI5evs4Y5er5nHO7o8js+wY+G9JNaW7W0tKFit9MCP68Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB1812

The wave5 codec driver is a stateful encoder/decoder.
The following patches is for supporting yuv422 inpuy format,
supporting runtime suspend/resume feature and extra things.

v4l2-compliance results:
========================

v4l2-compliance 1.24.1, 64 bits, 64-bit time_t

Buffer ioctls:
       warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supported
       warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supported
    test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
    test VIDIOC_EXPBUF: OK
    test Requests: OK (Not Supported)

Total for wave5-dec device /dev/video0: 45, Succeeded: 45, Failed: 0, Warnings: 2
Total for wave5-enc device /dev/video1: 45, Succeeded: 45, Failed: 0, Warnings: 0

Fluster test results:
=====================

Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.0 Using 1 parallel job(s)
Ran 132/147 tests successfully               in 89.870 secs

(1 test fails because of not supporting to parse multi frames, 1 test fails because of a missing frame and slight corruption,
 2 tests fail because of sizes which are incompatible with the IP, 11 tests fail because of unsupported 10 bit format)

Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Using 1 parallel job(s)
Ran 77/135 tests successfully               in 30.364 secs

(58 fail because the hardware is unable to decode  MBAFF / FMO / Field / Extended profile streams.)

Change since v6:
================
* For [PATCH v4 2/4] media: chips-media: wave5: Support runtime suspend/resume
 - Change autosuspend delay to 100ms
 - Add to enable/disable hrtimer in the runtime suspend/resume function for hw not using irq 

Change since v5:
================
* For [PATCH v4 3/4] media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage.
 - Fix v4l2-compliance error for the vidioc_enum_framesizes

* For [PATCH v4 1/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
 - Remove warning messages for the checkpatch.pl script

Change since v4:
================
* For [PATCH v4 2/4] media: chips-media: wave5: Support runtime suspend/resume
 - Fix warning message

* For [PATCH v4 3/4] media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage.
 - Fix warning message
 - add Reviewed-By tag

* For [PATCH v4 4/4] media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder
 - add Reviewed-By tag

Change since v3:
=================

* For [PATCH v4 1/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
 - add Reviewed-By tag

* For [PATCH v4 2/4] media: chips-media: wave5: Support runtime suspend/resume
 - add Reviewed-By tag

* For [PATCH v4 3/4] media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage.
 - modify the commit message
 - define three framesize structures for decoder

* For [PATCH v4 4/4] media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder
 - modify the commit message
 - use the v4l2_format_info to calculate luma, chroma size

Change since v2:
=================

* For [PATCH v3 0/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
 - add the suggested _SHIFT suffix

* For [PATCH v3 1/4] media: chips-media: wave5: Support runtime suspend/resume
 - change a commit message

* For [PATCH v3 2/4] media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage
 - add pix_fmt_type parameter into wave5_update_pix_fmt function
 - add min/max width/height values into dec_fmt_list 

Change since v1:
=================

* For [PATCH v2 0/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
 - define a macro for register addresses

* For [PATCH v2 1/4] media: chips-media: wave5: Support runtime suspend/resume
 - add auto suspend/resume

* For [PATCH v2 2/4] media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage
 - use helper functions to calculate bytesperline and sizeimage

* For [PATCH v2 3/4] media: chips-media: wave5: Support YUV422 raw pixel-formats on the encoder
 - remove unnecessary codes

Change since v0:
=================
The DEFAULT_SRC_SIZE macro was defined using multiple lines, To make a simple define, tab and multiple lines has been removed, The macro is defined using one line.

Jackson.lee (4):
  media: chips-media: wave5: Support SPS/PPS generation for each IDR
  media: chips-media: wave5: Support runtime suspend/resume
  media: chips-media: wave5: Use helpers to calculate bytesperline and
    sizeimage.
  media: chips-media: wave5: Support YUV422 raw pixel-formats on the
    encoder.

 .../platform/chips-media/wave5/wave5-helper.c |  37 +-
 .../platform/chips-media/wave5/wave5-helper.h |   5 +
 .../platform/chips-media/wave5/wave5-hw.c     |  30 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 322 +++++++-----------
 .../chips-media/wave5/wave5-vpu-enc.c         | 313 +++++++++--------
 .../platform/chips-media/wave5/wave5-vpu.c    |  50 +++
 .../platform/chips-media/wave5/wave5-vpu.h    |   5 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  33 +-
 .../platform/chips-media/wave5/wave5-vpuapi.h |   1 +
 .../chips-media/wave5/wave5-vpuconfig.h       |  27 +-
 .../media/platform/chips-media/wave5/wave5.h  |   3 +
 11 files changed, 461 insertions(+), 365 deletions(-)

-- 
2.43.0


