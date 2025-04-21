Return-Path: <linux-media+bounces-30571-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A10A94CBF
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 09:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64BA0188F15A
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 07:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA42259CB9;
	Mon, 21 Apr 2025 07:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="I5ORO4v4"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013043.outbound.protection.outlook.com [52.101.67.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F0825745A;
	Mon, 21 Apr 2025 07:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745219214; cv=fail; b=SqEl/pfL67fI77tYm27LZ/AEdsEY52uqTImJFRun8mn74vg8cj+U/ddqcCEBreFGnyiGTNsfbdrmekfjp87yiV7YWHppQC4wS3rNU18f4AdUIcrgQBe1t27XE8uqVH1yQFJg5NIIsyY9EggUk3IOxkxO2tjx1vMlBIPOTUd+WyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745219214; c=relaxed/simple;
	bh=6YfdHY2S1LQcQKZMCFDKGUahusOENMCsK70WETyXO8c=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rKprJ9uNamlxmwp0B7AA1+rjCEGFLNG1hSSNK3XlwOue7BlMrSib6FQPF25JPRMHkCL+2P1j8FIk6LyC+sL39O29PNJwIR/Xq7JuxI6CB2kPSPOQITKnaJHEfGRFNEUQ40He/xrb3atUMjTeu70og1GrL4hIwbcnN12p+g6EseA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=I5ORO4v4; arc=fail smtp.client-ip=52.101.67.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WbobTIDEwFsZBOoyyGlqzWVP4vNK5PugIgFnDwjpRMg6CN8zFZaUSwuJpzr7yJVOTJD6Jk5NuQbE4dafqKqhPJXeUJDOnRsvBYaMDeWsriZtKbTxLzjY6jcqkAREOnI/bDnjpTzBCRoPid1Z9MKArE6gXa0IhuAdZZCq6TskqYSQeu6yTjuYAvbWp2BIMRi66BEeel4Ppy14myH8gZXrxYsECNeIUcpTcupf1jT1zFzHWnf3CW1JYOwrpFGRLCnXTGexAJpEDplOuf7ZKBhYQxdqR0SmJhv2rXccw0PtOZJOFU33/BY6bLricM702faL8FXGeR+BcCAxl05hIBcCLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7HWVkdBcg6XoizxXNtG+0rTBt86/6g+1d1useql4Xiw=;
 b=PHgfW2WPt3Jl3VsNdT0BK9Yr1Ce3KiNtnLV5Uz9LA4dDylahyAC5Mbzn//J/m8B1gn1Y5Khvd52Z5KJA7V2yWP8sC4pRCvK9dVxsvhIeNsSUQx88XhwhOFH6tv3tZUDVBiMDszXnRiPNEW4zxobaxXyGaXRfM4dy5Bjrk3Usrc1wbkhp7f/9ASRGGDDUAXOtgrq0uOfELvOYrkGiU9T/2m02YuXO9qnAnewieP4XYqVjnTBXhFdXkT5O35PTPNCryA1qLep+5l/rgPp/qEwXYDhcJXUXNFFpiA7ywBem/QztOKbnVnTYU6BaITlk8xTjjuENELczV/TWjrJZ7sBlFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7HWVkdBcg6XoizxXNtG+0rTBt86/6g+1d1useql4Xiw=;
 b=I5ORO4v4NIxuBmcGIPw+jWJfkAckyiFsXtipXi8qsaS4R+1pws1ftevl9xFp2pGfrdRO4OT1RhlZFp/7HNuqZaM788S9RDUfIzTjzEpHPJGms6g4Ms+S674jNAwxBOiACBOUn9oG8rOWYZ43OErewsPJ4NIENzEeoBsWbAMAWfJBWlHpPaF0VzC2N2kf9lhkOuXTgpg6T79K5kGjQ8q72JkuHj/7U+6F2O/K6ffsszfyQSb6Gnbqs47E6gtZrNb6QhRiuZadlLN09AGZYkvJH5MFs3bDGeLsUixMA+H/Dsba4jbrY/6VUxw7zufOq0yPtVwSkSr8BHg77YwdBoiZ+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by GV1PR04MB11040.eurprd04.prod.outlook.com (2603:10a6:150:206::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 07:06:49 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 07:06:49 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] media: imx-jpeg: Drop the first error frames
Date: Mon, 21 Apr 2025 15:06:12 +0800
Message-ID: <20250421070613.1263-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG3P274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::31)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|GV1PR04MB11040:EE_
X-MS-Office365-Filtering-Correlation-Id: aa68dd7d-d07d-4983-059b-08dd80a315a3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U88bx6CZqTtRkRfJLu0Dj/JlcRdPFgLcKBOvgJ6OxsYoS+8QT852pPU4/FrK?=
 =?us-ascii?Q?vEUXeHR8tDtSPuEBchA9UVSQEXWVRxqhokUAfKn2z7y/+Hh5SWZJ4zUxsv1S?=
 =?us-ascii?Q?qUTprVjGbNdIQCLnt9Za6pYNPPKLeyKW/6y/m63qiSx4y/Rzv3e/133OPyoG?=
 =?us-ascii?Q?jWjZDYPsyo3iCcVWPVCvDaDku6/ebGlFolUQZcRLLQg3cHO2dkhJ3PoQFXFW?=
 =?us-ascii?Q?YSbBXKgtPOfnUpiwFSqSL6ptJTCuzo/UcnjrHVbL6uTygh3W1/MgseTrbo6p?=
 =?us-ascii?Q?uNjZMK/dpATa8jLYhmJbG+OumjZPbJ8NA90Vy1cNAXmcLoyAvczEEhP15BC5?=
 =?us-ascii?Q?LvzCD6wmqKqI27nVc3dmo20lqIm5mVTDPm53I0RQyZQ0+5IZ/Y44Th+NXmIY?=
 =?us-ascii?Q?LF00EmPvkdP+DzuD+UpTinh8rEWpMunQRecLBOlWRgpe8bNEUAx0bJCT+49C?=
 =?us-ascii?Q?RjlmsX7lb/Xazmv2U68cb01CUtLHxGM0W51eeNL+I2fNdNHOc8HLPfMaE1sH?=
 =?us-ascii?Q?IVzDNSONv4D+wTE67kroaxY/Nckdp377hq3fwppOYTyBZLm1O5myfTSoKJKm?=
 =?us-ascii?Q?9xi3qDjU+8FAIuySHMXw7Cwyzi6YbXsxmIMpNw+RXNp3Qc/MyiX+Z03EzaKD?=
 =?us-ascii?Q?ThpCQtVUWppcU0BIq134151D/fQY+hfm+SrEHHQRnDnzyurnxFovOEMUIPWg?=
 =?us-ascii?Q?XzV0MdZbUXa3QacMusHrvFx7k3DwaKYGhMNu0FKRwhiMYWALQ0+Ouqx4aOw8?=
 =?us-ascii?Q?gJTnU9/WrwiijKaFzmWYIV6dLS/DAAEkBo4SLOCIhRmyNIMyyIbI6q8kyQxj?=
 =?us-ascii?Q?B+W1kKVhtNrpJblbPnz8x7eEqe2YAvUoQ1H/lrkhRxXRmLKC6ZUmGGaqEuMx?=
 =?us-ascii?Q?i/B1kJtLOgsqboEncfwxbbMBBMYABG0UqcTyIUDG0xy126ZPZkAF1jlD19RC?=
 =?us-ascii?Q?PqLCsyJUUMvS6FqWilxpEHKgBk+y+9rNQv6oed6SQn9kW1Tr9w2e68fQPNA9?=
 =?us-ascii?Q?zRyX0gUJDv7ogZPkQ0u/ZDrWUEs4999XmKBdIkw+Z9zve0afvBUlXYSaZvoB?=
 =?us-ascii?Q?ibUyDLiTOUNR87pHdIz8bGbzd4XK6ETTI8LXV4u+PurZU6/81vpZjhoRko7W?=
 =?us-ascii?Q?YW49HD/K0C9236JO7Dtn13tMZcUoPBp8S0KcR9hts9jkrtEXY66151UzM4ra?=
 =?us-ascii?Q?8Nebaznb7DuX1ANcAzGTqvvtCPjbQhnyDw8aGuPBqG8CvXBiXFSPMZ9dCfLt?=
 =?us-ascii?Q?QO8ZhUHVNr84DutgnJLwONIUcHAoU8bzbB2XzSM7xoF7lIdQ2abpKkoBOYIR?=
 =?us-ascii?Q?BygK2GmO/TCbMqCvOUE4zZDXViIZOHSdgltouKgyeLMYOPAJhkzS+KrXGLYi?=
 =?us-ascii?Q?6LtS65TWtypr6plDpSSEle6VDEuEEDyWfLdo/1lZi/veiM0B9zyzmVTXsWFi?=
 =?us-ascii?Q?AhHbiekjypLqg9MKZ7j/OxYZZTds9mBH6qHYvdFUprGK4acp/YXJKKWQUCwa?=
 =?us-ascii?Q?kmnMEah7k80k7go=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zoNj+M8UjjD4TAl882h1W3FwsUYseXB5zUJ++6vVw24W/WefhXaynZQWsCGq?=
 =?us-ascii?Q?eO1dfh+P554DNiA4EyNHfQ5yacqFt8dmMUKVdgnX6XwtkDtxQfRv+RIXM6ia?=
 =?us-ascii?Q?FOvnYwGQQp0CWDRmSL2scmcF5eNbhhp/ox3Gqx1FWrBMdm0F07ShikQrG6Hf?=
 =?us-ascii?Q?iufiDIvMzBfLhg0Rult7XCk3hXPJfv1tK9uNyWQIj/J8ib3Zw59yBDwRwgE2?=
 =?us-ascii?Q?jU2ODoP54c9ycRhpL6HXA7JB0BXX31AYSYZH2pddk6mknRfyKBqShE7HQnyV?=
 =?us-ascii?Q?oSFdDq3g9abLuADcbPJ4uyy7fVmrZyUGbWoniJsJjm28rQL/pleFVUgOQv4w?=
 =?us-ascii?Q?QKHES7sRNmRtGh82CJpDte7btWARFAHYJnTBMGBrdy/H+cKmHhBQUDB6NOZH?=
 =?us-ascii?Q?EPR3Mn+/+QwLNdBnvUXqIm8Nm5YK1wtk0uJtaFhdhfn2TWy7Rmx/d/6h3UYO?=
 =?us-ascii?Q?yRLOPv4PZtT3Gk4LRksnCQzEzUDLO8L/z0y6GuMJ35chYVn1QGwClFwXMBjR?=
 =?us-ascii?Q?fBMUvh7WQydsetznBMGbiHc/EoJ7ves6Lo2F4EyVYRe651T4rn0Yb27jVQgT?=
 =?us-ascii?Q?ZCqAQhB/CMB8yKXIr/4fF8Qd6+LWuxV8TAIGgXKT5nNrCaBNLdg/rxw6Ykca?=
 =?us-ascii?Q?NjnUweO1tojpXF9UzOxoo8XsCNvAccAeW+gTOcJYj5H6c75+Awi+iYmI2K8v?=
 =?us-ascii?Q?eBlOJqg/avcZl+rXYIENZAFQ948VsM+ecVlefjso9Ho+vLu+7pHj7DU3tEdv?=
 =?us-ascii?Q?5vUuyV/51Jubk8qxEoZB+I3wWLq5+Nspe/lz783AfKgC4EInmyK/dIbLmnoh?=
 =?us-ascii?Q?9swkBT4zNGH0AsDZ/9MKWXw05AZrztHS8+8AW271BpEiT1mvdt9tJFZo/8Qz?=
 =?us-ascii?Q?nfaug9uQ59jNC6R7OSXFfP/lWpZoir7XXXSwnbGOQHI4rTaYDHobApTzBFU1?=
 =?us-ascii?Q?xF9FX1SHK34gkuxUztC/Y+2wUl+YaByMFaCY62MWP3XTDLWMCu/uf3dufZUu?=
 =?us-ascii?Q?KomkRnqT51Bpv1a2wiWWXG/hr1ZqDIT8uiZjV2yaa93Zn9K3QYmUR+5a4SZ9?=
 =?us-ascii?Q?CtxW1+QAnVpT4CvYR2OaDrzwVBs9hjzbL3gJJrU8fR/sZk+oSOLbWKxoXru3?=
 =?us-ascii?Q?Z0QGikAxEyuNeXs8nHfQyubKUyjL8/8dR0UfDRT/5aNlkSjeupqO18u7coeG?=
 =?us-ascii?Q?1y3gKRX3AtKQYtzzAMvbVS8hX7awtcEnGb5FQX2sCBel3iuNNtPW0kAw0b8h?=
 =?us-ascii?Q?kCxkKK/cYLsrksqhjsDOFolg5RQ8ewjZ0J6vLHE4KzeTzlathIC580k0CX46?=
 =?us-ascii?Q?c65S73HCrdu6hy96V6211jiAP0ZPuEW+2LwRee0ImUV1cy69nNOKarTrpC6s?=
 =?us-ascii?Q?8VHb5GfcfUTnyN0JzvqNl41uYAEa9loqwtQeAr3tog+230FcrfVGH0mdXRq1?=
 =?us-ascii?Q?aw40Ud/3x2bT3x3QHu6MEONd2KX5IPCXV3yDTEvm6VwT/L0WDTGdJMjE7B50?=
 =?us-ascii?Q?A4oAUlEoOjS2kFShU0HABCJIYBQHG7UxGcex+ieENoqTpLu7jeSWiTiHIk4M?=
 =?us-ascii?Q?OzFsGbSA0qxTsZmeK+h1AioC4scxnvghXrYM3cfe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa68dd7d-d07d-4983-059b-08dd80a315a3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 07:06:49.1366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UcHE6izNrw0Mu/Hm4OhIEBA8b5Yi9eHPaLJIX4LLphm0P0d3YXoaQsBdhWKG1o1+16uxQ67AusSUkkmWB0aCVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11040

From: Ming Qian <ming.qian@oss.nxp.com>

When an output buffer contains error frame header,
v4l2_jpeg_parse_header() will return error, then driver will mark this
buffer and a capture buffer done with error flag in device_run().

But if the error occurs in the first frames, before setup the capture
queue, there is no chance to schedule device_run(), and there may be no
capture to mark error.

So we need to drop this buffer with error flag, and make the decoding
can continue.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
v2
- Add missed Fixes tag
- Apply Nicolas's suggestion

 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 6ea4add00b3a..5c17bc58181e 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -1980,9 +1980,19 @@ static void mxc_jpeg_buf_queue(struct vb2_buffer *vb)
 	jpeg_src_buf = vb2_to_mxc_buf(vb);
 	jpeg_src_buf->jpeg_parse_error = false;
 	ret = mxc_jpeg_parse(ctx, vb);
-	if (ret)
+	if (ret) {
 		jpeg_src_buf->jpeg_parse_error = true;
 
+		/*
+		 * if the capture queue is not setup, the device_run() won't be scheduled,
+		 * need to drop the error buffer, so that the decoding can continue
+		 */
+		if (!vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx))) {
+			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+			return;
+		}
+	}
+
 end:
 	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
 }
-- 
2.43.0-rc1


