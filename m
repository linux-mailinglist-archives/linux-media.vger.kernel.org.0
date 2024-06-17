Return-Path: <linux-media+bounces-13420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5705990ABB3
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 12:44:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD4D71F27113
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 10:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772151957F4;
	Mon, 17 Jun 2024 10:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="SMmyjnMl"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11020003.outbound.protection.outlook.com [52.101.154.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3657D1946D1;
	Mon, 17 Jun 2024 10:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718620939; cv=fail; b=G9PqdsAW0wN8gkW9lwcGsiDOOUpR+NN9YxcibF5B/wjvbXv+k4eFm5yNzuievleCBxpobR11Lenn1gIli8hvU55G5Pfmub4ptW4T21aq0M8y4YDfzg7KvaZk4wXYjFDf0oKyN+oKFqKvtirOK7hi7lc6m5j8fkNXZRlEcOav0xQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718620939; c=relaxed/simple;
	bh=cj6k7FJ+TvoYwSUkcIV0CMR+aNYb4h5Mo+7wFSSnkQY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FxkGx4/5muo91cZ7tWh28yr4nhisjYBF04np9gUw9W6k6bzWFchSZ16MX5gXaqEd/+pnZR64AnKa+pd69h/ybOb2xl3ccnrJrvKK7bVWbxGAUXvZdezLQxAtO1H9i4PuzlcrRnREaOhlwB2GtZ2UDo3y76ZUhA7uaA+lGoNg5wM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=SMmyjnMl; arc=fail smtp.client-ip=52.101.154.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJVJ+H3rB/DcA2cW+iTaNE0jmpNExL+ZXP6S+nyg8TIjr+d8lm3luv+eta3ncRzPAr26PWNExOndYUV1Y+B4gAKvLkYvpxxMYPG8ML0kDu6YvKVmM7X9569XiuMYl0dOo04oGqzeQxmAYW2rWfSkVrqw8k8Cbvye+ZK+xWLZj4X1ORXCs0C6Ghi2baG1EP1Xt7dwjFw0gk2qnXLrFcN9Ax06hthSHfHp98rJnVfLmb/uE82xRI7zmLTNEi0isTd3McvkI0EiHwfcUkJQ9FQ8e30Bejiobl+ugVqhvVeN3jLiWPSV6iSiekivGwhE7Vjm8GC8U2pYOn44OYGMgYi80A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P88Dc8EteJWw9uikve/h1QIxOpXc7QN+d7J7umr0PEQ=;
 b=lVfuU4eeXAqciHBhBr0qoilf0GeBToPEZErGedaW8MbR0ajVlt6CAPNP2al91xq5x/551CUsgU1+yPRrTPykLAMbIeGWSsXssrotzOipCJofjBV9mzzObXzlAcPZWkucSsgPQvhqOX9eHNHJM7UBzLgN56GAjDi6+dR5lhwQMcgOxA23iGxTkeZ0UuT9rmOWQE64044w7oZfdV2fjPf7odHN0+t8p2qksgXBu1kEfa/KrWhL9Knu3JsqJnJVgyNdYfvHIkSigL/nAGANRPbAm/ubK/OPL1QS8mPFLlKRQ5oU5SmLi/iwGpGUnGw/cVRdb+J4SLkEzWMNmXeafU8bGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P88Dc8EteJWw9uikve/h1QIxOpXc7QN+d7J7umr0PEQ=;
 b=SMmyjnMlkrWJzoEqvf97vqUb/QebnqsDKA55l9MOibghOJckjvDU+Sa1xY6pLBOQvXOhtAG4WsNVhL3EYSx4k5mPSQTr6VHSO13CgiEtdgng4s4tSXrrZyta/fRGScFW1+UGJaqdCQef58X+Kd4mJ1f/KobjorRs6oRjsMbY2II=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB3099.KORP216.PROD.OUTLOOK.COM (2603:1096:101:282::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Mon, 17 Jun 2024 10:42:04 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 10:42:04 +0000
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
	jackson.lee@chipsnmedia.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v6 3/4] media: chips-media: wave5: Use helpers to calculate bytesperline and sizeimage.
Date: Mon, 17 Jun 2024 19:41:54 +0900
Message-Id: <20240617104155.153-4-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617104155.153-1-jackson.lee@chipsnmedia.com>
References: <20240617104155.153-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0185.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::9) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SL2P216MB3099:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b4a0bbc-6fd7-474c-5fc8-08dc8eba20bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|52116011|376011|1800799021|366013|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yaJtV+fKjP6H1+2w0nde2L+CV9IoJveO2SDH5MuOdey+OW/NcznQo46JtUE9?=
 =?us-ascii?Q?BnRs5fKp+8n+PdZFVXMRChR82d3IhUvu2DzwLa3IifSlL1meclx30/oh7fHN?=
 =?us-ascii?Q?IKD53IHdNXuzIGOD0+vgN6udhobyRsqoo8TthcDKzOVPx83mvml7T/fIkULQ?=
 =?us-ascii?Q?/7X7cLEHU2Net4q0ellfP3u0hMNxQSwLEHr6MXNrt7owF5kXKXNsvG0JT3Wg?=
 =?us-ascii?Q?MOBdrN9QBfOmd6Zi0f/YAcV16Q8asY0EAaU9ZtH44pFhi7XlF+P+42Abbw3M?=
 =?us-ascii?Q?bUmgqZfVhPRm7AtSCxXWDy/k5cUxSEsbYukGnN8XA7199S3oIuQd6to+Ca+S?=
 =?us-ascii?Q?BV/BxqTkthHUdDWC3KTez8189wNfRtcg0R/UbGskOodyL5Vqv3II0w/l425d?=
 =?us-ascii?Q?muAVUKwuFKnOIVfD1rmgku2qy82bNyqOymm3ZluHXLraJ5/fqjdFodvbc16F?=
 =?us-ascii?Q?jnwgv9GJaWEUQD8AbhE9SX8/8gvt6XzPE+I0qCZVHqA8+n2XnubHKpP8F2oP?=
 =?us-ascii?Q?8fiKI/mN5TmteQk4YtYWM564bhTQQYLNFOsU8iDzZnU6XDkwsqOZNT7ofcQa?=
 =?us-ascii?Q?N0/laQqO6b620myGEUDHVwVnq1IMCY+Amgf87k2VHqJyc1m/aQ7bLHHk3Zmz?=
 =?us-ascii?Q?RTPmTUuO0o7hIToFBtxFE4W7GvurDc4LcPKTXKLnO5Lu6KnK+wL05GeJ7JRU?=
 =?us-ascii?Q?3OnIql/Po3DxzOXJdWIxDvxJcgDCCMii0yLjaOEm60xRyC05CcXKoMmRsubX?=
 =?us-ascii?Q?1Ax3eOHWhKVdnrkhoBM2lrT1t0eqowEnpnAmdHyPrDNcm/zNhxcO7Nc0kPtr?=
 =?us-ascii?Q?ixZXuJdIWBHwNcTRyF/hTEBgUAgfrk5DqXdc6geCqT+SrV9qM2YvfHN0fNW0?=
 =?us-ascii?Q?2fWQVr8a5rfxnHhK4E+vGYs0KinwS2esjviSeKN1E+3ioTB2Lr3UICGcdqxA?=
 =?us-ascii?Q?oYcgmuLWxoYmFdpyXkZ50wmugdrjgJm2s8PXOisNEOOF2jMKg7SbD9S7xkk7?=
 =?us-ascii?Q?2yRsH6SjqU2I2w5oYEy5Lba2SlIe6nhCpUoVLSUMIf+mdBrjIbKbcutNcB/o?=
 =?us-ascii?Q?rb23pZCNvY0JKahZFL9gMqREgEJpk0omQkI6H+7zJoi3ay+Ixp6USr8OTwfv?=
 =?us-ascii?Q?Eg2Q2IoNBqxm+qd4NZV1YUF4O2mrlbQePpRmlNzNcgeVhuLWZJVv4NndTQ39?=
 =?us-ascii?Q?tHGUY4131ez7EwRm+E+GVgJQ3iHSeFqccmQc7ui0I4opp/lFc55g81hlubxi?=
 =?us-ascii?Q?IeX1OeIdAK8OaTiKQh0+WI9emP3FgXdPqT+fzx2QA5+lHFu26onA9Vb92ZG5?=
 =?us-ascii?Q?xmN0F0qNtXfnm0kkhVzQhik+u9A3wJM1umw8opP1mD8DcXx8tC8UabKLzeCf?=
 =?us-ascii?Q?htu0La4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(52116011)(376011)(1800799021)(366013)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?v5hcDizc0EpqhYC9GRmqtNpSmHY4imwJ3Hof4TN3f7wrpN22rsEFnLm63UW6?=
 =?us-ascii?Q?v8IJp2zWC+9v9RRWo8i0owpjz0cxYfYxIIdMiorbC8ZCmo7cY4rOgX9M1Hn2?=
 =?us-ascii?Q?IAkINvtfPHnB+uBuRQgFl9HarRjptHImgVcaRJcE4dqfZafZ6rzRM72si5yc?=
 =?us-ascii?Q?ehuEFUSo3Sx9cq2WjLzJKKVj3y3/y4OVZ+LSGS1q9R6Lcl6ITNZa9cCIPWYE?=
 =?us-ascii?Q?dSrVYpH6Uo3hRxkSt6eJfADLIw2XVLNNp+EspAW2q6iYaflMq8FSL/yvyx6Z?=
 =?us-ascii?Q?4/sVwWn5a9iImb6r3g5hLv958w15XyX19YG9s99OGp6vsBxz5v5vggTizHeS?=
 =?us-ascii?Q?OLbmf689baMI+bJ1h/bNyJHBRWyG95xIw7MoHPgY7MkFXLchEsZdfKgXr+mV?=
 =?us-ascii?Q?uqDs7P7+VHMIgqDMGzyP44nA91o+0D+PNE650WZdmMArDKT4c2PJ5CZf5U6j?=
 =?us-ascii?Q?lLfcwBovvJu9augUx6sp82scpzhagu6LshecTtPXs73p1T8TzQNDEJ4GOlVf?=
 =?us-ascii?Q?eZ5ZyX+0rKDNETefatSZT5KiFOYjfsTL2qCmfTkwBDGAjfaQ9gmXs8JhiGLo?=
 =?us-ascii?Q?tFhbLFKkoHfuoQSMpEM8OMe0TvY2F1JRl69tjg3VFMW4xK2Lr1NqWHQRpivI?=
 =?us-ascii?Q?fSSmPA1a+tFf0++7jDYAOf88hQU5s0Qq3CUqKvuRrBGo53pNgFgO94Xx70KT?=
 =?us-ascii?Q?4Q0/nSXnr+zg5w1uOcVIT2nxJWonZhuSKWEsBbQmvg7cSaCh6twMst2i7Rzr?=
 =?us-ascii?Q?8i198dWMzPau57tadCunfuoO3LOr5owVHI5N1erJ6VNrVWd0e2/T/wKS/Sei?=
 =?us-ascii?Q?SH5b0VfWLA5G5LvbGAAuRe2su20IydAFb83//s+TGkOWirnl5hvET3JQeiOi?=
 =?us-ascii?Q?mCRZwXd9BFRkd5YSIGU0e8IlMjKd7Z8CwKgeKhkvfn3NNxJzWDE60LHoBwPd?=
 =?us-ascii?Q?sIoc6yt/Uk3HvpX++IcVP9LU2YtrTGS5hGLvdQJACZ3XONBZl3F0JkiP1DjA?=
 =?us-ascii?Q?ZWiZCRNE+htF6SAv9eR71Mc/yO/Cy1O2iPg3WFqVKCabpHrIsFBlpA1yqoNK?=
 =?us-ascii?Q?4+/K8jqRXKDTEgeloaXOmIVFfX9JvSQ7VU41YvV2cEaHNXpRsn5iGCfZDmpJ?=
 =?us-ascii?Q?HBAVZCuw91/9eEKpnXQDZTcO1CjHff+syjpWBS3wh9ewX8a3BqQ31fsXi9BD?=
 =?us-ascii?Q?lzt7tnnRp0bOJQ4Y9s40mTcxOTnBGGGjtH+15k/sFYEnCJXNRVH3e8u0Cl3Y?=
 =?us-ascii?Q?8qsXxXIJxAg1Aoi0dLwNu7okK56OSmbZwyLvFTo/pM2f8LGKwzYrdljgxB2J?=
 =?us-ascii?Q?iFYmZ/8TWRh5/JJMZcMItjpMRmwov1hE7Z7qfdnos476tB7QX4W8pFknRsnZ?=
 =?us-ascii?Q?aBQUHspYXanWUvveH0bsKHf+dfH8D/gkmaMCzGqWGTj9zqR+8a8vEbuGBQ9i?=
 =?us-ascii?Q?kz5AStbV5ALWlzn8cFHCH5B+sq2R1vXODLbY8D7VbFtUIr7/9wrZhCekM1U1?=
 =?us-ascii?Q?nkp6XfGFbrmxJO78O9vLj+UKphjIfdnHIJzUvD975BFc1jJfN9Q43jwsfYD1?=
 =?us-ascii?Q?R8sdajfNfZ4oPBZlhYacVqKmmg5XTAP+uy+DPjHzYK8veXOYlL59YYlg/8jU?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b4a0bbc-6fd7-474c-5fc8-08dc8eba20bf
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 10:42:04.5654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s1Y5f9oZkCVpMWJWB8pFWY4qXaS9hWmv4CKCt5uwjibLNodb0c9rrepOdJlVuqcQQkk2Yho3INxKIdtGeT8KM4b6LETymoEYQk2bMhG6vxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB3099

From: "jackson.lee" <jackson.lee@chipsnmedia.com>

Use v4l2-common helper functions to calculate bytesperline and sizeimage,
instead of calculating in a wave5 driver directly.

In case of raw(YUV) v4l2_pix_format, the wave5 driver updates
v4l2_pix_format_mplane struct through v4l2_fill_pixfmt_mp() function.

Encoder and Decoder need same bytesperline and sizeimage values
for same v4l2_pix_format.
So, a wave5_update_pix_fmt is refactored to support both together.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/chips-media/wave5/wave5-helper.c |  24 ++
 .../platform/chips-media/wave5/wave5-helper.h |   5 +
 .../chips-media/wave5/wave5-vpu-dec.c         | 301 +++++++-----------
 .../chips-media/wave5/wave5-vpu-enc.c         | 197 +++++-------
 .../platform/chips-media/wave5/wave5-vpu.h    |   5 +-
 .../chips-media/wave5/wave5-vpuconfig.h       |  27 +-
 6 files changed, 240 insertions(+), 319 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index 7e0f34bfa5be..b20ab69cd341 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -7,6 +7,8 @@
 
 #include "wave5-helper.h"
 
+#define DEFAULT_BS_SIZE(width, height) ((width) * (height) / 8 * 3)
+
 const char *state_to_str(enum vpu_instance_state state)
 {
 	switch (state) {
@@ -224,3 +226,25 @@ void wave5_return_bufs(struct vb2_queue *q, u32 state)
 		v4l2_m2m_buf_done(vbuf, state);
 	}
 }
+
+void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
+			  int pix_fmt_type,
+			  unsigned int width,
+			  unsigned int height,
+			  const struct v4l2_frmsize_stepwise *frmsize)
+{
+	v4l2_apply_frmsize_constraints(&width, &height, frmsize);
+
+	if (pix_fmt_type == VPU_FMT_TYPE_CODEC) {
+		pix_mp->width = width;
+		pix_mp->height = height;
+		pix_mp->num_planes = 1;
+		pix_mp->plane_fmt[0].bytesperline = 0;
+		pix_mp->plane_fmt[0].sizeimage = max(DEFAULT_BS_SIZE(width, height),
+						     pix_mp->plane_fmt[0].sizeimage);
+	} else {
+		v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, width, height);
+	}
+	pix_mp->flags = 0;
+	pix_mp->field = V4L2_FIELD_NONE;
+}
diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.h b/drivers/media/platform/chips-media/wave5/wave5-helper.h
index 6cee1c14d3ce..9937fce553fc 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.h
@@ -28,4 +28,9 @@ const struct vpu_format *wave5_find_vpu_fmt_by_idx(unsigned int idx,
 						   const struct vpu_format fmt_list[MAX_FMTS]);
 enum wave_std wave5_to_vpu_std(unsigned int v4l2_pix_fmt, enum vpu_instance_type type);
 void wave5_return_bufs(struct vb2_queue *q, u32 state);
+void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
+			  int pix_fmt_type,
+			  unsigned int width,
+			  unsigned int height,
+			  const struct v4l2_frmsize_stepwise *frmsize);
 #endif
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 861a0664047c..1aa5b6788266 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -11,111 +11,92 @@
 #define VPU_DEC_DEV_NAME "C&M Wave5 VPU decoder"
 #define VPU_DEC_DRV_NAME "wave5-dec"
 
-#define DEFAULT_SRC_SIZE(width, height) ({			\
-	(width) * (height) / 8 * 3;					\
-})
+static const struct v4l2_frmsize_stepwise dec_hevc_frmsize = {
+	.min_width = W5_MIN_DEC_PIC_8_WIDTH,
+	.max_width = W5_MAX_DEC_PIC_WIDTH,
+	.step_width = W5_DEC_CODEC_STEP_WIDTH,
+	.min_height = W5_MIN_DEC_PIC_8_HEIGHT,
+	.max_height = W5_MAX_DEC_PIC_HEIGHT,
+	.step_height = W5_DEC_CODEC_STEP_HEIGHT,
+};
+
+static const struct v4l2_frmsize_stepwise dec_h264_frmsize = {
+	.min_width = W5_MIN_DEC_PIC_32_WIDTH,
+	.max_width = W5_MAX_DEC_PIC_WIDTH,
+	.step_width = W5_DEC_CODEC_STEP_WIDTH,
+	.min_height = W5_MIN_DEC_PIC_32_HEIGHT,
+	.max_height = W5_MAX_DEC_PIC_HEIGHT,
+	.step_height = W5_DEC_CODEC_STEP_HEIGHT,
+};
+
+static const struct v4l2_frmsize_stepwise dec_raw_frmsize = {
+	.min_width = W5_MIN_DEC_PIC_8_WIDTH,
+	.max_width = W5_MAX_DEC_PIC_WIDTH,
+	.step_width = W5_DEC_RAW_STEP_WIDTH,
+	.min_height = W5_MIN_DEC_PIC_8_HEIGHT,
+	.max_height = W5_MAX_DEC_PIC_HEIGHT,
+	.step_height = W5_DEC_RAW_STEP_HEIGHT,
+};
 
 static const struct vpu_format dec_fmt_list[FMT_TYPES][MAX_FMTS] = {
 	[VPU_FMT_TYPE_CODEC] = {
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_HEVC,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_hevc_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_H264,
-			.max_width = 8192,
-			.min_width = 32,
-			.max_height = 4320,
-			.min_height = 32,
+			.v4l2_frmsize = &dec_h264_frmsize,
 		},
 	},
 	[VPU_FMT_TYPE_RAW] = {
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422P,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61M,
-			.max_width = 8192,
-			.min_width = 8,
-			.max_height = 4320,
-			.min_height = 8,
+			.v4l2_frmsize = &dec_raw_frmsize,
 		},
 	}
 };
@@ -234,74 +215,6 @@ static void wave5_handle_src_buffer(struct vpu_instance *inst, dma_addr_t rd_ptr
 	inst->remaining_consumed_bytes = consumed_bytes;
 }
 
-static void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp, unsigned int width,
-				 unsigned int height)
-{
-	switch (pix_mp->pixelformat) {
-	case V4L2_PIX_FMT_YUV420:
-	case V4L2_PIX_FMT_NV12:
-	case V4L2_PIX_FMT_NV21:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height * 3 / 2;
-		break;
-	case V4L2_PIX_FMT_YUV422P:
-	case V4L2_PIX_FMT_NV16:
-	case V4L2_PIX_FMT_NV61:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height * 2;
-		break;
-	case V4L2_PIX_FMT_YUV420M:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[1].sizeimage = width * height / 4;
-		pix_mp->plane_fmt[2].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[2].sizeimage = width * height / 4;
-		break;
-	case V4L2_PIX_FMT_NV12M:
-	case V4L2_PIX_FMT_NV21M:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[1].sizeimage = width * height / 2;
-		break;
-	case V4L2_PIX_FMT_YUV422M:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[1].sizeimage = width * height / 2;
-		pix_mp->plane_fmt[2].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[2].sizeimage = width * height / 2;
-		break;
-	case V4L2_PIX_FMT_NV16M:
-	case V4L2_PIX_FMT_NV61M:
-		pix_mp->width = round_up(width, 32);
-		pix_mp->height = round_up(height, 16);
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = width * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[1].sizeimage = width * height;
-		break;
-	default:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = 0;
-		pix_mp->plane_fmt[0].sizeimage = max(DEFAULT_SRC_SIZE(width, height),
-						     pix_mp->plane_fmt[0].sizeimage);
-		break;
-	}
-}
-
 static int start_decode(struct vpu_instance *inst, u32 *fail_res)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
@@ -389,6 +302,8 @@ static int handle_dynamic_resolution_change(struct vpu_instance *inst)
 	}
 
 	if (p_dec_info->initial_info_obtained) {
+		const struct vpu_format *vpu_fmt;
+
 		inst->conf_win.left = initial_info->pic_crop_rect.left;
 		inst->conf_win.top = initial_info->pic_crop_rect.top;
 		inst->conf_win.width = initial_info->pic_width -
@@ -396,10 +311,27 @@ static int handle_dynamic_resolution_change(struct vpu_instance *inst)
 		inst->conf_win.height = initial_info->pic_height -
 			initial_info->pic_crop_rect.top - initial_info->pic_crop_rect.bottom;
 
-		wave5_update_pix_fmt(&inst->src_fmt, initial_info->pic_width,
-				     initial_info->pic_height);
-		wave5_update_pix_fmt(&inst->dst_fmt, initial_info->pic_width,
-				     initial_info->pic_height);
+		vpu_fmt = wave5_find_vpu_fmt(inst->src_fmt.pixelformat,
+					     dec_fmt_list[VPU_FMT_TYPE_CODEC]);
+		if (!vpu_fmt)
+			return -EINVAL;
+
+		wave5_update_pix_fmt(&inst->src_fmt,
+				     VPU_FMT_TYPE_CODEC,
+				     initial_info->pic_width,
+				     initial_info->pic_height,
+				     vpu_fmt->v4l2_frmsize);
+
+		vpu_fmt = wave5_find_vpu_fmt(inst->dst_fmt.pixelformat,
+					     dec_fmt_list[VPU_FMT_TYPE_RAW]);
+		if (!vpu_fmt)
+			return -EINVAL;
+
+		wave5_update_pix_fmt(&inst->dst_fmt,
+				     VPU_FMT_TYPE_RAW,
+				     initial_info->pic_width,
+				     initial_info->pic_height,
+				     vpu_fmt->v4l2_frmsize);
 	}
 
 	v4l2_event_queue_fh(fh, &vpu_event_src_ch);
@@ -545,15 +477,16 @@ static int wave5_vpu_dec_enum_framesizes(struct file *f, void *fh, struct v4l2_f
 		vpu_fmt = wave5_find_vpu_fmt(fsize->pixel_format, dec_fmt_list[VPU_FMT_TYPE_RAW]);
 		if (!vpu_fmt)
 			return -EINVAL;
+		return -ENOTTY;
 	}
 
 	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
-	fsize->stepwise.min_width = vpu_fmt->min_width;
-	fsize->stepwise.max_width = vpu_fmt->max_width;
-	fsize->stepwise.step_width = 1;
-	fsize->stepwise.min_height = vpu_fmt->min_height;
-	fsize->stepwise.max_height = vpu_fmt->max_height;
-	fsize->stepwise.step_height = 1;
+	fsize->stepwise.min_width = vpu_fmt->v4l2_frmsize->min_width;
+	fsize->stepwise.max_width = vpu_fmt->v4l2_frmsize->max_width;
+	fsize->stepwise.step_width = W5_DEC_CODEC_STEP_WIDTH;
+	fsize->stepwise.min_height = vpu_fmt->v4l2_frmsize->min_height;
+	fsize->stepwise.max_height = vpu_fmt->v4l2_frmsize->max_height;
+	fsize->stepwise.step_height = W5_DEC_CODEC_STEP_HEIGHT;
 
 	return 0;
 }
@@ -576,6 +509,7 @@ static int wave5_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
 	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
 	int width, height;
 
@@ -589,14 +523,12 @@ static int wave5_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 		width = inst->dst_fmt.width;
 		height = inst->dst_fmt.height;
 		f->fmt.pix_mp.pixelformat = inst->dst_fmt.pixelformat;
-		f->fmt.pix_mp.num_planes = inst->dst_fmt.num_planes;
+		frmsize = &dec_raw_frmsize;
 	} else {
-		const struct v4l2_format_info *info = v4l2_format_info(vpu_fmt->v4l2_pix_fmt);
-
-		width = clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->max_width);
-		height = clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt->max_height);
+		width = f->fmt.pix_mp.width;
+		height = f->fmt.pix_mp.height;
 		f->fmt.pix_mp.pixelformat = vpu_fmt->v4l2_pix_fmt;
-		f->fmt.pix_mp.num_planes = info->mem_planes;
+		frmsize = vpu_fmt->v4l2_frmsize;
 	}
 
 	if (p_dec_info->initial_info_obtained) {
@@ -604,9 +536,8 @@ static int wave5_vpu_dec_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 		height = inst->dst_fmt.height;
 	}
 
-	wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
-	f->fmt.pix_mp.flags = 0;
-	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_RAW,
+			     width, height, frmsize);
 	f->fmt.pix_mp.colorspace = inst->colorspace;
 	f->fmt.pix_mp.ycbcr_enc = inst->ycbcr_enc;
 	f->fmt.pix_mp.quantization = inst->quantization;
@@ -718,7 +649,9 @@ static int wave5_vpu_dec_enum_fmt_out(struct file *file, void *fh, struct v4l2_f
 static int wave5_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
+	int width, height;
 
 	dev_dbg(inst->dev->dev,
 		"%s: fourcc: %u width: %u height: %u num_planes: %u colorspace: %u field: %u\n",
@@ -727,20 +660,19 @@ static int wave5_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 
 	vpu_fmt = wave5_find_vpu_fmt(f->fmt.pix_mp.pixelformat, dec_fmt_list[VPU_FMT_TYPE_CODEC]);
 	if (!vpu_fmt) {
+		width = inst->src_fmt.width;
+		height = inst->src_fmt.height;
 		f->fmt.pix_mp.pixelformat = inst->src_fmt.pixelformat;
-		f->fmt.pix_mp.num_planes = inst->src_fmt.num_planes;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, inst->src_fmt.width, inst->src_fmt.height);
+		frmsize = &dec_hevc_frmsize;
 	} else {
-		int width = clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->max_width);
-		int height = clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt->max_height);
-
+		width = f->fmt.pix_mp.width;
+		height = f->fmt.pix_mp.height;
 		f->fmt.pix_mp.pixelformat = vpu_fmt->v4l2_pix_fmt;
-		f->fmt.pix_mp.num_planes = 1;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
+		frmsize = vpu_fmt->v4l2_frmsize;
 	}
 
-	f->fmt.pix_mp.flags = 0;
-	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_CODEC,
+			     width, height, frmsize);
 
 	return 0;
 }
@@ -748,6 +680,7 @@ static int wave5_vpu_dec_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 static int wave5_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	const struct vpu_format *vpu_fmt;
 	int i, ret;
 
 	dev_dbg(inst->dev->dev,
@@ -782,7 +715,13 @@ static int wave5_vpu_dec_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 	inst->quantization = f->fmt.pix_mp.quantization;
 	inst->xfer_func = f->fmt.pix_mp.xfer_func;
 
-	wave5_update_pix_fmt(&inst->dst_fmt, f->fmt.pix_mp.width, f->fmt.pix_mp.height);
+	vpu_fmt = wave5_find_vpu_fmt(inst->dst_fmt.pixelformat, dec_fmt_list[VPU_FMT_TYPE_RAW]);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	wave5_update_pix_fmt(&inst->dst_fmt, VPU_FMT_TYPE_RAW,
+			     f->fmt.pix_mp.width, f->fmt.pix_mp.height,
+			     vpu_fmt->v4l2_frmsize);
 
 	return 0;
 }
@@ -1005,6 +944,7 @@ static int wave5_vpu_dec_queue_setup(struct vb2_queue *q, unsigned int *num_buff
 	struct vpu_instance *inst = vb2_get_drv_priv(q);
 	struct v4l2_pix_format_mplane inst_format =
 		(q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) ? inst->src_fmt : inst->dst_fmt;
+	unsigned int i;
 
 	dev_dbg(inst->dev->dev, "%s: num_buffers: %u | num_planes: %u | type: %u\n", __func__,
 		*num_buffers, *num_planes, q->type);
@@ -1018,31 +958,9 @@ static int wave5_vpu_dec_queue_setup(struct vb2_queue *q, unsigned int *num_buff
 		if (*num_buffers < inst->fbc_buf_count)
 			*num_buffers = inst->fbc_buf_count;
 
-		if (*num_planes == 1) {
-			if (inst->output_format == FORMAT_422)
-				sizes[0] = inst_format.width * inst_format.height * 2;
-			else
-				sizes[0] = inst_format.width * inst_format.height * 3 / 2;
-			dev_dbg(inst->dev->dev, "%s: size[0]: %u\n", __func__, sizes[0]);
-		} else if (*num_planes == 2) {
-			sizes[0] = inst_format.width * inst_format.height;
-			if (inst->output_format == FORMAT_422)
-				sizes[1] = inst_format.width * inst_format.height;
-			else
-				sizes[1] = inst_format.width * inst_format.height / 2;
-			dev_dbg(inst->dev->dev, "%s: size[0]: %u | size[1]: %u\n",
-				__func__, sizes[0], sizes[1]);
-		} else if (*num_planes == 3) {
-			sizes[0] = inst_format.width * inst_format.height;
-			if (inst->output_format == FORMAT_422) {
-				sizes[1] = inst_format.width * inst_format.height / 2;
-				sizes[2] = inst_format.width * inst_format.height / 2;
-			} else {
-				sizes[1] = inst_format.width * inst_format.height / 4;
-				sizes[2] = inst_format.width * inst_format.height / 4;
-			}
-			dev_dbg(inst->dev->dev, "%s: size[0]: %u | size[1]: %u | size[2]: %u\n",
-				__func__, sizes[0], sizes[1], sizes[2]);
+		for (i = 0; i < *num_planes; i++) {
+			sizes[i] = inst_format.plane_fmt[i].sizeimage;
+			dev_dbg(inst->dev->dev, "%s: size[%u]: %u\n", __func__, i, sizes[i]);
 		}
 	}
 
@@ -1564,20 +1482,15 @@ static const struct vb2_ops wave5_vpu_dec_vb2_ops = {
 static void wave5_set_default_format(struct v4l2_pix_format_mplane *src_fmt,
 				     struct v4l2_pix_format_mplane *dst_fmt)
 {
-	unsigned int dst_pix_fmt = dec_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt;
-	const struct v4l2_format_info *dst_fmt_info = v4l2_format_info(dst_pix_fmt);
-
 	src_fmt->pixelformat = dec_fmt_list[VPU_FMT_TYPE_CODEC][0].v4l2_pix_fmt;
-	src_fmt->field = V4L2_FIELD_NONE;
-	src_fmt->flags = 0;
-	src_fmt->num_planes = 1;
-	wave5_update_pix_fmt(src_fmt, 720, 480);
-
-	dst_fmt->pixelformat = dst_pix_fmt;
-	dst_fmt->field = V4L2_FIELD_NONE;
-	dst_fmt->flags = 0;
-	dst_fmt->num_planes = dst_fmt_info->mem_planes;
-	wave5_update_pix_fmt(dst_fmt, 736, 480);
+	wave5_update_pix_fmt(src_fmt, VPU_FMT_TYPE_CODEC,
+			     W5_DEF_DEC_PIC_WIDTH, W5_DEF_DEC_PIC_HEIGHT,
+			     &dec_hevc_frmsize);
+
+	dst_fmt->pixelformat = dec_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt;
+	wave5_update_pix_fmt(dst_fmt, VPU_FMT_TYPE_RAW,
+			     W5_DEF_DEC_PIC_WIDTH, W5_DEF_DEC_PIC_HEIGHT,
+			     &dec_raw_frmsize);
 }
 
 static int wave5_vpu_dec_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 703fd8d1c7da..a470f24cbabe 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -11,65 +11,60 @@
 #define VPU_ENC_DEV_NAME "C&M Wave5 VPU encoder"
 #define VPU_ENC_DRV_NAME "wave5-enc"
 
+static const struct v4l2_frmsize_stepwise enc_frmsize[FMT_TYPES] = {
+	[VPU_FMT_TYPE_CODEC] = {
+		.min_width = W5_MIN_ENC_PIC_WIDTH,
+		.max_width = W5_MAX_ENC_PIC_WIDTH,
+		.step_width = W5_ENC_CODEC_STEP_WIDTH,
+		.min_height = W5_MIN_ENC_PIC_HEIGHT,
+		.max_height = W5_MAX_ENC_PIC_HEIGHT,
+		.step_height = W5_ENC_CODEC_STEP_HEIGHT,
+	},
+	[VPU_FMT_TYPE_RAW] = {
+		.min_width = W5_MIN_ENC_PIC_WIDTH,
+		.max_width = W5_MAX_ENC_PIC_WIDTH,
+		.step_width = W5_ENC_RAW_STEP_WIDTH,
+		.min_height = W5_MIN_ENC_PIC_HEIGHT,
+		.max_height = W5_MAX_ENC_PIC_HEIGHT,
+		.step_height = W5_ENC_RAW_STEP_HEIGHT,
+	},
+};
+
 static const struct vpu_format enc_fmt_list[FMT_TYPES][MAX_FMTS] = {
 	[VPU_FMT_TYPE_CODEC] = {
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_HEVC,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_CODEC],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_H264,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_CODEC],
 		},
 	},
 	[VPU_FMT_TYPE_RAW] = {
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420M,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12M,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 		{
 			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
-			.max_width = W5_MAX_ENC_PIC_WIDTH,
-			.min_width = W5_MIN_ENC_PIC_WIDTH,
-			.max_height = W5_MAX_ENC_PIC_HEIGHT,
-			.min_height = W5_MIN_ENC_PIC_HEIGHT,
+			.v4l2_frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW],
 		},
 	}
 };
@@ -106,46 +101,6 @@ static int switch_state(struct vpu_instance *inst, enum vpu_instance_state state
 	return -EINVAL;
 }
 
-static void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp, unsigned int width,
-				 unsigned int height)
-{
-	switch (pix_mp->pixelformat) {
-	case V4L2_PIX_FMT_YUV420:
-	case V4L2_PIX_FMT_NV12:
-	case V4L2_PIX_FMT_NV21:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = round_up(width, 32) * height * 3 / 2;
-		break;
-	case V4L2_PIX_FMT_YUV420M:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = round_up(width, 32) * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[1].sizeimage = round_up(width, 32) * height / 4;
-		pix_mp->plane_fmt[2].bytesperline = round_up(width, 32) / 2;
-		pix_mp->plane_fmt[2].sizeimage = round_up(width, 32) * height / 4;
-		break;
-	case V4L2_PIX_FMT_NV12M:
-	case V4L2_PIX_FMT_NV21M:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[0].sizeimage = round_up(width, 32) * height;
-		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32);
-		pix_mp->plane_fmt[1].sizeimage = round_up(width, 32) * height / 2;
-		break;
-	default:
-		pix_mp->width = width;
-		pix_mp->height = height;
-		pix_mp->plane_fmt[0].bytesperline = 0;
-		pix_mp->plane_fmt[0].sizeimage = width * height / 8 * 3;
-		break;
-	}
-}
-
 static int start_encode(struct vpu_instance *inst, u32 *fail_res)
 {
 	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
@@ -360,13 +315,8 @@ static int wave5_vpu_enc_enum_framesizes(struct file *f, void *fh, struct v4l2_f
 			return -EINVAL;
 	}
 
-	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
-	fsize->stepwise.min_width = vpu_fmt->min_width;
-	fsize->stepwise.max_width = vpu_fmt->max_width;
-	fsize->stepwise.step_width = 1;
-	fsize->stepwise.min_height = vpu_fmt->min_height;
-	fsize->stepwise.max_height = vpu_fmt->max_height;
-	fsize->stepwise.step_height = 1;
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise = enc_frmsize[VPU_FMT_TYPE_CODEC];
 
 	return 0;
 }
@@ -391,7 +341,9 @@ static int wave5_vpu_enc_enum_fmt_cap(struct file *file, void *fh, struct v4l2_f
 static int wave5_vpu_enc_try_fmt_cap(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
+	int width, height;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
 		__func__, f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
@@ -399,20 +351,19 @@ static int wave5_vpu_enc_try_fmt_cap(struct file *file, void *fh, struct v4l2_fo
 
 	vpu_fmt = wave5_find_vpu_fmt(f->fmt.pix_mp.pixelformat, enc_fmt_list[VPU_FMT_TYPE_CODEC]);
 	if (!vpu_fmt) {
+		width = inst->dst_fmt.width;
+		height = inst->dst_fmt.height;
 		f->fmt.pix_mp.pixelformat = inst->dst_fmt.pixelformat;
-		f->fmt.pix_mp.num_planes = inst->dst_fmt.num_planes;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, inst->dst_fmt.width, inst->dst_fmt.height);
+		frmsize = &enc_frmsize[VPU_FMT_TYPE_CODEC];
 	} else {
-		int width = clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->max_width);
-		int height = clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt->max_height);
-
+		width = f->fmt.pix_mp.width;
+		height = f->fmt.pix_mp.height;
 		f->fmt.pix_mp.pixelformat = vpu_fmt->v4l2_pix_fmt;
-		f->fmt.pix_mp.num_planes = 1;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
+		frmsize = vpu_fmt->v4l2_frmsize;
 	}
 
-	f->fmt.pix_mp.flags = 0;
-	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
+	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_CODEC,
+			     width, height, frmsize);
 	f->fmt.pix_mp.colorspace = inst->colorspace;
 	f->fmt.pix_mp.ycbcr_enc = inst->ycbcr_enc;
 	f->fmt.pix_mp.quantization = inst->quantization;
@@ -499,7 +450,9 @@ static int wave5_vpu_enc_enum_fmt_out(struct file *file, void *fh, struct v4l2_f
 static int wave5_vpu_enc_try_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	const struct v4l2_frmsize_stepwise *frmsize;
 	const struct vpu_format *vpu_fmt;
+	int width, height;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
 		__func__, f->fmt.pix_mp.pixelformat, f->fmt.pix_mp.width, f->fmt.pix_mp.height,
@@ -507,28 +460,26 @@ static int wave5_vpu_enc_try_fmt_out(struct file *file, void *fh, struct v4l2_fo
 
 	vpu_fmt = wave5_find_vpu_fmt(f->fmt.pix_mp.pixelformat, enc_fmt_list[VPU_FMT_TYPE_RAW]);
 	if (!vpu_fmt) {
+		width = inst->src_fmt.width;
+		height = inst->src_fmt.height;
 		f->fmt.pix_mp.pixelformat = inst->src_fmt.pixelformat;
-		f->fmt.pix_mp.num_planes = inst->src_fmt.num_planes;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, inst->src_fmt.width, inst->src_fmt.height);
+		frmsize = &enc_frmsize[VPU_FMT_TYPE_RAW];
 	} else {
-		int width = clamp(f->fmt.pix_mp.width, vpu_fmt->min_width, vpu_fmt->max_width);
-		int height = clamp(f->fmt.pix_mp.height, vpu_fmt->min_height, vpu_fmt->max_height);
-		const struct v4l2_format_info *info = v4l2_format_info(vpu_fmt->v4l2_pix_fmt);
-
+		width = f->fmt.pix_mp.width;
+		height = f->fmt.pix_mp.height;
 		f->fmt.pix_mp.pixelformat = vpu_fmt->v4l2_pix_fmt;
-		f->fmt.pix_mp.num_planes = info->mem_planes;
-		wave5_update_pix_fmt(&f->fmt.pix_mp, width, height);
+		frmsize = vpu_fmt->v4l2_frmsize;
 	}
 
-	f->fmt.pix_mp.flags = 0;
-	f->fmt.pix_mp.field = V4L2_FIELD_NONE;
-
+	wave5_update_pix_fmt(&f->fmt.pix_mp, VPU_FMT_TYPE_RAW,
+			     width, height, frmsize);
 	return 0;
 }
 
 static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_format *f)
 {
 	struct vpu_instance *inst = wave5_to_vpu_inst(fh);
+	const struct vpu_format *vpu_fmt;
 	int i, ret;
 
 	dev_dbg(inst->dev->dev, "%s: fourcc: %u width: %u height: %u num_planes: %u field: %u\n",
@@ -568,7 +519,15 @@ static int wave5_vpu_enc_s_fmt_out(struct file *file, void *fh, struct v4l2_form
 	inst->quantization = f->fmt.pix_mp.quantization;
 	inst->xfer_func = f->fmt.pix_mp.xfer_func;
 
-	wave5_update_pix_fmt(&inst->dst_fmt, f->fmt.pix_mp.width, f->fmt.pix_mp.height);
+	vpu_fmt = wave5_find_vpu_fmt(inst->dst_fmt.pixelformat, enc_fmt_list[VPU_FMT_TYPE_CODEC]);
+	if (!vpu_fmt)
+		return -EINVAL;
+
+	wave5_update_pix_fmt(&inst->dst_fmt, VPU_FMT_TYPE_CODEC,
+			     f->fmt.pix_mp.width, f->fmt.pix_mp.height,
+			     vpu_fmt->v4l2_frmsize);
+	inst->conf_win.width = inst->dst_fmt.width;
+	inst->conf_win.height = inst->dst_fmt.height;
 
 	return 0;
 }
@@ -584,12 +543,17 @@ static int wave5_vpu_enc_g_selection(struct file *file, void *fh, struct v4l2_se
 	switch (s->target) {
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-	case V4L2_SEL_TGT_CROP:
 		s->r.left = 0;
 		s->r.top = 0;
 		s->r.width = inst->dst_fmt.width;
 		s->r.height = inst->dst_fmt.height;
 		break;
+	case V4L2_SEL_TGT_CROP:
+		s->r.left = 0;
+		s->r.top = 0;
+		s->r.width = inst->conf_win.width;
+		s->r.height = inst->conf_win.height;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -612,8 +576,10 @@ static int wave5_vpu_enc_s_selection(struct file *file, void *fh, struct v4l2_se
 
 	s->r.left = 0;
 	s->r.top = 0;
-	s->r.width = inst->src_fmt.width;
-	s->r.height = inst->src_fmt.height;
+	s->r.width = min(s->r.width, inst->dst_fmt.width);
+	s->r.height = min(s->r.height, inst->dst_fmt.height);
+
+	inst->conf_win = s->r;
 
 	return 0;
 }
@@ -1151,8 +1117,8 @@ static void wave5_set_enc_openparam(struct enc_open_param *open_param,
 	open_param->wave_param.lambda_scaling_enable = 1;
 
 	open_param->line_buf_int_en = true;
-	open_param->pic_width = inst->dst_fmt.width;
-	open_param->pic_height = inst->dst_fmt.height;
+	open_param->pic_width = inst->conf_win.width;
+	open_param->pic_height = inst->conf_win.height;
 	open_param->frame_rate_info = inst->frame_rate;
 	open_param->rc_enable = inst->rc_enable;
 	if (inst->rc_enable) {
@@ -1456,20 +1422,15 @@ static const struct vb2_ops wave5_vpu_enc_vb2_ops = {
 static void wave5_set_default_format(struct v4l2_pix_format_mplane *src_fmt,
 				     struct v4l2_pix_format_mplane *dst_fmt)
 {
-	unsigned int src_pix_fmt = enc_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt;
-	const struct v4l2_format_info *src_fmt_info = v4l2_format_info(src_pix_fmt);
-
-	src_fmt->pixelformat = src_pix_fmt;
-	src_fmt->field = V4L2_FIELD_NONE;
-	src_fmt->flags = 0;
-	src_fmt->num_planes = src_fmt_info->mem_planes;
-	wave5_update_pix_fmt(src_fmt, 416, 240);
+	src_fmt->pixelformat = enc_fmt_list[VPU_FMT_TYPE_RAW][0].v4l2_pix_fmt;
+	wave5_update_pix_fmt(src_fmt, VPU_FMT_TYPE_RAW,
+			     W5_DEF_ENC_PIC_WIDTH, W5_DEF_ENC_PIC_HEIGHT,
+			     &enc_frmsize[VPU_FMT_TYPE_RAW]);
 
 	dst_fmt->pixelformat = enc_fmt_list[VPU_FMT_TYPE_CODEC][0].v4l2_pix_fmt;
-	dst_fmt->field = V4L2_FIELD_NONE;
-	dst_fmt->flags = 0;
-	dst_fmt->num_planes = 1;
-	wave5_update_pix_fmt(dst_fmt, 416, 240);
+	wave5_update_pix_fmt(dst_fmt, VPU_FMT_TYPE_CODEC,
+			     W5_DEF_ENC_PIC_WIDTH, W5_DEF_ENC_PIC_HEIGHT,
+			     &enc_frmsize[VPU_FMT_TYPE_CODEC]);
 }
 
 static int wave5_vpu_enc_queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
@@ -1733,6 +1694,8 @@ static int wave5_vpu_open_enc(struct file *filp)
 	v4l2_ctrl_handler_setup(v4l2_ctrl_hdl);
 
 	wave5_set_default_format(&inst->src_fmt, &inst->dst_fmt);
+	inst->conf_win.width = inst->dst_fmt.width;
+	inst->conf_win.height = inst->dst_fmt.height;
 	inst->colorspace = V4L2_COLORSPACE_REC709;
 	inst->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
 	inst->quantization = V4L2_QUANTIZATION_DEFAULT;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.h b/drivers/media/platform/chips-media/wave5/wave5-vpu.h
index 32b7fd3730b5..3847332551fc 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.h
@@ -38,10 +38,7 @@ enum vpu_fmt_type {
 
 struct vpu_format {
 	unsigned int v4l2_pix_fmt;
-	unsigned int max_width;
-	unsigned int min_width;
-	unsigned int max_height;
-	unsigned int min_height;
+	const struct v4l2_frmsize_stepwise *v4l2_frmsize;
 };
 
 static inline struct vpu_instance *wave5_to_vpu_inst(struct v4l2_fh *vfh)
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
index d9751eedb0f9..8e11d93ca38f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuconfig.h
@@ -30,10 +30,29 @@
 
 #define MAX_NUM_INSTANCE                32
 
-#define W5_MIN_ENC_PIC_WIDTH            256
-#define W5_MIN_ENC_PIC_HEIGHT           128
-#define W5_MAX_ENC_PIC_WIDTH            8192
-#define W5_MAX_ENC_PIC_HEIGHT           8192
+#define W5_DEF_DEC_PIC_WIDTH            720U
+#define W5_DEF_DEC_PIC_HEIGHT           480U
+#define W5_MIN_DEC_PIC_8_WIDTH          8U
+#define W5_MIN_DEC_PIC_8_HEIGHT         8U
+#define W5_MIN_DEC_PIC_32_WIDTH         32U
+#define W5_MIN_DEC_PIC_32_HEIGHT        32U
+#define W5_MAX_DEC_PIC_WIDTH            8192U
+#define W5_MAX_DEC_PIC_HEIGHT           4320U
+#define W5_DEC_CODEC_STEP_WIDTH         1U
+#define W5_DEC_CODEC_STEP_HEIGHT        1U
+#define W5_DEC_RAW_STEP_WIDTH           32U
+#define W5_DEC_RAW_STEP_HEIGHT          16U
+
+#define W5_DEF_ENC_PIC_WIDTH            416U
+#define W5_DEF_ENC_PIC_HEIGHT           240U
+#define W5_MIN_ENC_PIC_WIDTH            256U
+#define W5_MIN_ENC_PIC_HEIGHT           128U
+#define W5_MAX_ENC_PIC_WIDTH            8192U
+#define W5_MAX_ENC_PIC_HEIGHT           8192U
+#define W5_ENC_CODEC_STEP_WIDTH         8U
+#define W5_ENC_CODEC_STEP_HEIGHT        8U
+#define W5_ENC_RAW_STEP_WIDTH           32U
+#define W5_ENC_RAW_STEP_HEIGHT          16U
 
 //  application specific configuration
 #define VPU_ENC_TIMEOUT                 60000
-- 
2.43.0


