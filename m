Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 037CF2A234B
	for <lists+linux-media@lfdr.de>; Mon,  2 Nov 2020 04:10:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbgKBDKY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 1 Nov 2020 22:10:24 -0500
Received: from mail-am6eur05on2083.outbound.protection.outlook.com ([40.107.22.83]:60192
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727450AbgKBDKX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 1 Nov 2020 22:10:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXCcVosIGOzr3y4Mv/I+FSLTtkeu/avB7+PpPatWJuJECQJfHR22nBmJCZ0i9eLOC7wWnRKuU+OONTYERUQif5N8coewWJ9L03kRtoW1uT89yfo0i7g2rc7cTU5nyvDZfIjJFJE+WhO3cvp8pF1S+z2UlBIywp7d4JcNg8igL7XayLULcXEe4ja08MHxTwN7gCbIxeltjvfapLVnBILr8k8o+m0kWpIITKG2Jq4Q0zJ9MRw9a5X2TXgtDyCV2+YSYZIrLIxMbj3Nk86MRQL5hAEV5nFUyIf+QN0LGjlrshzwRa7cac0ujZONGFeQhaHQ05pk80/wtdncYz+eHtqdYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWnDWlmv+OZ7PMdjC0dRjDnTLiMzQj93Wzq2GDIW6sY=;
 b=iEpaJGmmPyIiyTul0lTbZ/ZbyeMXsBDXR7S88Te2lmCrbfXUqyIvRw5Qym5M2NUkZY7NI3GJf3ipfoL3QKt5Hd6xpNpc/eWPWRD4Qwi2T/B/dDer6RaH6mr8sJjplxn7jy+gyyVyVzyTtfo4WBrDGQG52rfORett/dI7i/5TFxmKZT2b2p/kc1stUAdVgkVUzerdNgUBGrPrxnu+oKo6ZtRHMdlEmYyUFZtMAfRbzr/pTGwQ1ikoY62APvqeJuRXCMaWzeJ1oJ/Ly9uhbmWpT9z5DjbpBh00axBxur/zn7FrXnAKtG9zw6ZEjSXOpWjbF/7aUX1Ocobga6vmA5tjOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWnDWlmv+OZ7PMdjC0dRjDnTLiMzQj93Wzq2GDIW6sY=;
 b=RRm3jmcWFGqxmprlvU6ji9HUoP2K0gKAfK/dJPv94pITjaUgRoOQY7DSsHbfc4lXVgOYszkGGEYIX42ME73vt9Vn2ozK40PiDnEPrw4Hsld//ReqLYM1vHzL5uGIOMfGUoqgjzKp7kqEIcmUPAL7Bl8V7PY05TgOtMOniaN7sjc=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB5173.eurprd04.prod.outlook.com (2603:10a6:20b:d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Mon, 2 Nov
 2020 03:10:06 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::2d75:aaf5:5aa6:5de9%6]) with mapi id 15.20.3499.029; Mon, 2 Nov 2020
 03:10:06 +0000
From:   "Mirela Rabulea (OSS)" <mirela.rabulea@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, shawnguo@kernel.org,
        robh+dt@kernel.org
Cc:     paul.kocialkowski@bootlin.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, aisheng.dong@nxp.com,
        daniel.baluta@nxp.com, robert.chiras@nxp.com,
        laurentiu.palcu@nxp.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, p.zabel@pengutronix.de,
        ezequiel@collabora.com, laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dafna.hirschfeld@collabora.com,
        Mirela Rabulea <mirela.rabulea@nxp.com>
Subject: [PATCH v4 07/11] media: imx-jpeg: Fix v4l2-compliance streaming tests on decoder
Date:   Mon,  2 Nov 2020 05:08:17 +0200
Message-Id: <20201102030821.3049-8-mirela.rabulea@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
References: <20201102030821.3049-1-mirela.rabulea@oss.nxp.com>
Content-Type: text/plain
X-Originating-IP: [86.124.170.94]
X-ClientProxiedBy: AM0PR06CA0128.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::33) To AM5PR04MB3137.eurprd04.prod.outlook.com
 (2603:10a6:206:c::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-134.ea.freescale.net (86.124.170.94) by AM0PR06CA0128.eurprd06.prod.outlook.com (2603:10a6:208:ab::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19 via Frontend Transport; Mon, 2 Nov 2020 03:10:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b9e8f3d2-694d-4eb3-78ec-08d87edcccb7
X-MS-TrafficTypeDiagnostic: AM6PR04MB5173:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB51735A19CB3270DB7DC89D0ACE100@AM6PR04MB5173.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GGRZprbcS0Zm4IQ/l0wTIgU+afX+W/ydZ+nwA3F5suN7SpT0thZwIHulp6c22P9X/LzXB89cZxhR5if6wrmS1sknELCg1yOo74DNvZQnr/NMMj14Rn26gm40M8ap/tZyPDxuMU0CfJRB9gEpy8rbRvDA3uKfMwSoKQ9kQL1q/gx36GN9+SqziJNoWypqQ5m5Lks+Idj1H8yKUN4hJfhHnhqomkCaSen+be1WmX5aflof1whxqiVzd2kcrGjwhrPaieqJPyTcOIShouXAf8CDUm3MG/1y5tgGxW9pAeCEZWXCJtsPunp46hjZh1nF04j4AQT4n5IGuG1ua4bL26lgew==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(366004)(136003)(5660300002)(478600001)(86362001)(16526019)(186003)(8936002)(83380400001)(6512007)(6666004)(26005)(2906002)(6486002)(316002)(4326008)(66946007)(8676002)(52116002)(956004)(6506007)(1076003)(66476007)(2616005)(7416002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: tlfsELMZ7P93dHDOT0AlokJpe87qaMNF5Ixloy3cvyDSU2mwscmUwrOk0ZhxVRdS346gUBLcNIeOkzUtdblOZgjFq5JDdB3NueYfnIgbxSpzJZvSM3XKSuACZMWFXkVNdrgblcqTh8yqaQLJp77UySIjrQ3jb8Dx+oQs+uyCXpeprntZtnkK4qSKu6FPLqneAmpeia06SwbJXAvlaG89vzT7dWVQQcip9tgkQMJVT4bsMLvAJHxOm2jzHNXa14J3xKqoPKBLDpyy6UWPX1UUIwgPfL8hwFmNGPu5QrEsQ1q0vfBNdUVxes9nkQJZGDVMSUA643JgSzldyeFa4jmDMV9iSr2Ik0yBzdjnkLH3FUfHUcY495tJLUGeTmOxb9HGEy9iukt8LQR6nDWLL3LPfzryNZyuSBOmdvkviEjrlWcBSd4onF9nzhzfOql9UBWMpk+pAkz7VSxk/tCzSQhA9LY++1ktTJRkYwsRAyR4uMgqnsWhcJc71ix+JPapRzqazH3ezOJH35RJBQg3vyoV+CpaCkrVhbG5r7seqsEu6Js8AyKKZnLyl73KA4NaAVAaYVMEDCqiaOzIHnsC9RZJIXWx0eUA9LGa9CTgvbkHemrp5Ax7bK5beZnNvPoy192CQJq/c+BZqxPO+KtQTEYfBA==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9e8f3d2-694d-4eb3-78ec-08d87edcccb7
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 03:10:06.7764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1m1T1w9T/u08h8jU3ZLQGXBu/ISEIXsPccy5kCFGcOFDftilmLFCZFw9bQDmT7DSdegL2/tQ3Xxa3J1OejCODQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5173
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mirela Rabulea <mirela.rabulea@nxp.com>

Streaming tests were faling on decoder, due to errors on
jpeg parse. Let the error be, until device_run, there
check for errors and finish job.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 drivers/media/platform/imx-jpeg/mxc-jpeg.c | 25 ++++++++++++++++------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
index 8535da246a63..d87f99caf124 100644
--- a/drivers/media/platform/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/imx-jpeg/mxc-jpeg.c
@@ -249,6 +249,7 @@ struct mxc_jpeg_src_buf {
 
 	/* mxc-jpeg specific */
 	bool			dht_needed;
+	bool			jpeg_parse_error;
 };
 
 static inline struct mxc_jpeg_src_buf *vb2_to_mxc_buf(struct vb2_buffer *vb)
@@ -929,6 +930,7 @@ static void mxc_jpeg_device_run(void *priv)
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	unsigned long flags;
 	struct mxc_jpeg_q_data *q_data_cap, *q_data_out;
+	struct mxc_jpeg_src_buf *jpeg_src_buf;
 
 	spin_lock_irqsave(&ctx->mxc_jpeg->hw_lock, flags);
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
@@ -949,6 +951,19 @@ static void mxc_jpeg_device_run(void *priv)
 
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
 
+	jpeg_src_buf = vb2_to_mxc_buf(&src_buf->vb2_buf);
+	if (jpeg_src_buf->jpeg_parse_error) {
+		jpeg->slot_data[ctx->slot].used = false;
+		v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+		v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
+		spin_unlock_irqrestore(&ctx->mxc_jpeg->hw_lock, flags);
+		v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
+
+		return;
+	}
+
 	/*
 	 * TODO: this reset should be removed, once we figure out
 	 * how to overcome hardware issues both on encoder and decoder
@@ -1483,17 +1498,13 @@ static void mxc_jpeg_buf_queue(struct vb2_buffer *vb)
 		goto end;
 
 	jpeg_src_buf = vb2_to_mxc_buf(vb);
+	jpeg_src_buf->jpeg_parse_error = false;
 	ret = mxc_jpeg_parse(ctx,
 			     (u8 *)vb2_plane_vaddr(vb, 0),
 			     vb2_get_plane_payload(vb, 0),
 			     &jpeg_src_buf->dht_needed);
-	if (ret) {
-		v4l2_err(&ctx->mxc_jpeg->v4l2_dev,
-			 "driver does not support this resolution/format\n");
-		vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
-
-		return;
-	}
+	if (ret)
+		jpeg_src_buf->jpeg_parse_error = true;
 
 end:
 	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
-- 
2.17.1

