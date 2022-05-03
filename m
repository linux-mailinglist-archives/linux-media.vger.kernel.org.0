Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98F4B5186E9
	for <lists+linux-media@lfdr.de>; Tue,  3 May 2022 16:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237197AbiECOmr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 May 2022 10:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237201AbiECOmp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 May 2022 10:42:45 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140075.outbound.protection.outlook.com [40.107.14.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D1A35A92
        for <linux-media@vger.kernel.org>; Tue,  3 May 2022 07:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtQO76er1LSqoXLdqRrhJ5ZQv//ZxR9Au5FFZaWKevWDhtEExMcfcYj1LdJczroOzZ5F5CsaFatLOPErKE35ZLijZn/uK/2d72oxCfEU2IH2EZtYI1LctYQyAbyg2fRlVzQ7RU2hJZKmBT/IS7F5pWTA4h+LO6EGFoo89/hYjoOSmAOGzthzXYjdoct4f6j3mabFAW3dv9DFRqDnnVNXAq3M5TWa3abf6NPhFb8sVfHtlAOlxx6ykchhbOpztlYe+WD/SVzpQKKOoUkhGEUWNs2JK/BaxYICH+ERmCjPPq+QYJOqJ26uX86a1NY/F5XEjjzDH+FAmFKu3K9SF0yfHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5pC33qTD9J9dlBpMN40I+7o0AvFKozoFnNBhwLcjNE=;
 b=fZAxoacRmEV1S1BSC1QsXHM78+tMQ98PiNvqls+BYMcDbAu9azPZPiDGe1CTi8qeHFdc6d8hDD7pSURWz9ugAVvyr65z/k4kw2a8AglTg29PHEcRA/vZnj6X8sKvTmDi+H/IbObewlNvVKtryigoZUVWkgbtxHmWC9z9hxGkbjUD/jKItoo2vsmdRcXIsdCoSmlQrBhz00hf2SFG9v5Bmun/Xv3gLFRzRMv8VlXFF4OfqW5PeXCLAVcR9HxYwCNHhscwZN/apfS7DdMPrKDc1bTw12YsULwOitB0umOVRvsUxhRnJFAd7/SKtbAABTVJ3wDsNdPLQ3yhbaSfjj0UoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5pC33qTD9J9dlBpMN40I+7o0AvFKozoFnNBhwLcjNE=;
 b=OgaNr+UpYR8k48UXTx1q/wOyQAzSaHUSNv9xdg73v0+bQHfskRt/go+ykB2x0wSeFnEA0Y3DwrpfG5qXaFzFNCOKb7Om2UJuSCSE597/I2wvpT9Fve6oAleF5QAlwm9JAwRD2oPhickFnEbO4jxgq0tlweGWBvVSL1kLj5ZqWoQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com (2603:10a6:20b:43f::8)
 by VI1PR04MB3133.eurprd04.prod.outlook.com (2603:10a6:802:9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:39:09 +0000
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c]) by AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c%7]) with mapi id 15.20.5206.014; Tue, 3 May 2022
 14:39:08 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 2/2] v4l2-utils: read/write full frame from/to file for m2m non codec driver
Date:   Tue,  3 May 2022 16:38:12 +0200
Message-Id: <20220503143812.982985-2-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503143812.982985-1-xavier.roumegue@oss.nxp.com>
References: <20220503143812.982985-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0196.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::16) To AM9PR04MB8700.eurprd04.prod.outlook.com
 (2603:10a6:20b:43f::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 545859f6-9a88-45ae-9a88-08da2d12ae11
X-MS-TrafficTypeDiagnostic: VI1PR04MB3133:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB3133242C24CBCC505072A649BAC09@VI1PR04MB3133.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PnghuvHC+rOrRdlH92UdQNyYgyG5fKCwPm0i9zx2AldnnPOAQxVrD+VEwevH5pJyVo4UiRHwMO6ToBO6jk51G25mW7zWSADnWU4kdEJk36jRTjj3WQuWiyzUbfQe11slB0eaHUpvdQ2YdXdJgtrnF5Leb8UwsbMR08rL1rs2tBlZ4dt6u1usWplGZf7liDbTJPjkfBOwBZamSlb7PSIwFOuo3B3BG5l17JSfqw0f3ZrjPcYfbQRFnx58+GPlf9MLy8meOH5Oj91qYBL7sKTRs1vHmd/JUAgs1FMEzOPeg+IU6FBRxLvbTXDckPNGg+axH66V/6+DB8dLfXKWWEplNxwAfaMcGmScLCEas+zSXcRHjNjdcpuehmMhAAhH3lDqlk2m4ZCODz6H2kF17vCz8e8ARzhaKKcsLkEfIej4dRwHYoOq6t98N8FvegK6Zpj3cTDaqV7guCooF4+/SDO1Qs+jZh7YDQ/VKl0JHq7FvQ0H5SUiKpAZsMh147qMmY9xQvhE/HWLmxqOeBubX/IdXuJRdszY+tC5yF4LocuodlkL49nt0FApV8NF9bYbRs1db/QpKr1pSX/yJCONm+L2EZ6Bkn+Jkn4b6pSm59yRIxv28UPum2jSRioB0HvPZ0gvBwnB0rTSSo9xLeaC24WzIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8700.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(6666004)(6512007)(83380400001)(508600001)(6506007)(6486002)(186003)(1076003)(5660300002)(44832011)(8936002)(2906002)(316002)(8676002)(66476007)(66946007)(66556008)(52116002)(38100700002)(86362001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ABbZOZDlgpib0dvcy6labbF2U/KQ7rw5cfJh+ULQRayIrMAJQ0rtFM6So+S1?=
 =?us-ascii?Q?B2NDNPa733gX4xmdohNgkaqLzNFiykDXlODNi+78Xt11PIAaS4G7d2h7ei10?=
 =?us-ascii?Q?smofuclEoZL+X0lIoVpGE2o8AWHCBJXJSIzwmdbzl2rjNUGQaqXvLv332FM/?=
 =?us-ascii?Q?PFhArLiPPQuT/1fKPPV9Co7WbowvuPQ/pXzmrCX/r2OTadGcf8k6qAkB+9H7?=
 =?us-ascii?Q?xDagyGQ8f78carGvPVOZyk/6wPK9xEUZLRIyvNiM1uuto4WNS9e2ny1xKUKw?=
 =?us-ascii?Q?lg4/yPCY2YsqYJ66TDp0XIgVzPbGw46xnm8EOEQu6EhgWAMIOak3h7eHV1Iy?=
 =?us-ascii?Q?nxg9FDwgW1f84rzOGkWmUVOTB3+BCdriiJ6BrEk1MxgYc+24LXHRVlXwNDtB?=
 =?us-ascii?Q?djhT7jl4CuKCnva02wL28i5cOKJO0z9ckvZI2AR1YL5JSJ+6Jfn6ZYHiDiXl?=
 =?us-ascii?Q?wSwkAM20ycVV/JTHv2YEeObt51G980ZCHS0Cu2P7AjM9xDnx7BxA9OvQ+spZ?=
 =?us-ascii?Q?GxXETSfajS7rYWNC6KtFbtZmImA8wo1sDKoLHKjH0pEqRqSdy5LdgOnzRfbd?=
 =?us-ascii?Q?uGQEoaEa/L7jYKWgnl8RjFHrIIMATr0kJQgmMGxFvJH4bHbwqHfpUYFfd3s2?=
 =?us-ascii?Q?wsu9v5BV6aEiMUhDsytDQSwSLs5OzWHYioFc7qHNZiXJaAtVWM9aPcPHDr88?=
 =?us-ascii?Q?tRCU9n00rt4JLzadMTPX2k3s+hEgh2x5TvoaCnBjGGFtYSIkBZiqNur5o3T/?=
 =?us-ascii?Q?J8BhOxJ9J/eQD6437Mue7mu0/FFXfwqKLhCQSiZnmUmILG3bf4UALeQRAl/i?=
 =?us-ascii?Q?DxHoRK82ig6HY93QmdQmTl4TtuZjzw/rbtUP3Sg+74YdwWgKaj64W+i6NepO?=
 =?us-ascii?Q?p138PtHPL11lIKKLLcZY4QU0huNeQFMU8a+FSwJgXs+n+49TQKLf/O5TaHih?=
 =?us-ascii?Q?A9+rZBUgiCJRxciBu7GGshhLrBs1U9vf27jH32f6ro4LTXjLZbq3ScXcmeHc?=
 =?us-ascii?Q?e4gXuwWLd2Mm9FN4jKfR64Ny/JOF9WSD6en0UpJpXR7pOgHLc8sO/Xi2TIJt?=
 =?us-ascii?Q?XjrJLRvbXb6/RP5X01wXS08jtrFDAIvKwbhT3nD3Zs7u3sqxrzo1nFLO1cM5?=
 =?us-ascii?Q?mDy2BIwNPcT6WOINHPjGUyB4bmfjHZKnzcK6dzs3dQAOm4/25xb2O19kyU+V?=
 =?us-ascii?Q?KkhHKU6bGHg2Z1wtz7cAFT3Q6KcFlFRD8abA4Rzdi5XnJkrFYD0zMQ+grfby?=
 =?us-ascii?Q?GExMkfLNHbqYKtzP30FXMjLrgVK319CT6iZ2PnQs5GNTm0vgrwb/e+uidKkC?=
 =?us-ascii?Q?zOqXNOkB7NtvpZ3OaMIja3nKht2PVJfO4OokW8Kahmhp3qA5yspZuiCQwsP9?=
 =?us-ascii?Q?LJzWgC1/xRlpbxa0dVjIhD5gsVnTZkqdHajVXMOu3z3fxb3Z3dgmhK5ZbyaP?=
 =?us-ascii?Q?TwdEI1zi6rLL0SymxwUV3Wtjt6SzQg7aYVDJRUWdwSBNrjSZg1gaYc5oEYPz?=
 =?us-ascii?Q?jFfPxaC9FRG4H+JZgKSaIJtbiAYPwUcwMigkTe/wgUWa/suTcB3eI2rUZ9c6?=
 =?us-ascii?Q?F9UWFQGwCHPUgaVVhnCDbSDCoiXfIHncadPRlwrRuPwFfpUV9UuPTK3v6g9v?=
 =?us-ascii?Q?uAA4fn9NEyfW219x73dxwBrvL7vNXQy34nyenQYxF+v/GT643gscbpAZjeJK?=
 =?us-ascii?Q?AEpdcBGA0x6wh1oOjxO1B8lCjMoaIzwDaY2pSRtCiK39wGJSPSxFDWEsGQXp?=
 =?us-ascii?Q?aXchNMNdQH4Fq5T6+Ne8QqFGtiffAcsKfELCLjqzSQM0+agAyONY/enxfH5C?=
X-MS-Exchange-AntiSpam-MessageData-1: OqDVDOXAzH9kKqYjQS388FYvcb9jn2l6WjY=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 545859f6-9a88-45ae-9a88-08da2d12ae11
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8700.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:39:08.9240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wAcfvR28pfLEhlKMkof12Gdh1iGCz0eC1mBB5bgj2ykqvupZQsH3a/9qpm3bPLasxk+xGm/B5SDhLgMSkhK/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3133
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In case of m2m operations with a non codec capable driver, the entire
frame should be read/written from/to the file while writing/reading the
output/capture buffer in case of crop/compose operations.

fixes: d1b18e65fbdf (v4l2-ctl: Add support for crop and compose selection in streaming)

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 28 ++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 8a06c754..0f9f31f5 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -89,6 +89,8 @@ enum codec_type {
 	DECODER
 };
 
+static enum codec_type codec_type;
+
 #define QUEUE_ERROR -1
 #define QUEUE_STOPPED -2
 
@@ -352,7 +354,7 @@ void streaming_usage()
 	       	V4L_STREAM_PORT);
 }
 
-static enum codec_type get_codec_type(cv4l_fd &fd)
+static void get_codec_type(cv4l_fd &fd)
 {
 	cv4l_disable_trace dt(fd);
 	struct v4l2_fmtdesc fmt_desc = {};
@@ -361,11 +363,13 @@ static enum codec_type get_codec_type(cv4l_fd &fd)
 	int num_out_fmts = 0;
 	int num_compressed_out_fmts = 0;
 
+	codec_type = NOT_CODEC;
+
 	if (!fd.has_vid_m2m())
-		return NOT_CODEC;
+		return;
 
 	if (fd.enum_fmt(fmt_desc, true, 0, fd.g_type()))
-		return NOT_CODEC;
+		return;
 
 	do {
 		if (fmt_desc.flags & V4L2_FMT_FLAG_COMPRESSED)
@@ -375,7 +379,7 @@ static enum codec_type get_codec_type(cv4l_fd &fd)
 
 
 	if (fd.enum_fmt(fmt_desc, true, 0, v4l_type_invert(fd.g_type())))
-		return NOT_CODEC;
+		return;
 
 	do {
 		if (fmt_desc.flags & V4L2_FMT_FLAG_COMPRESSED)
@@ -384,14 +388,14 @@ static enum codec_type get_codec_type(cv4l_fd &fd)
 	} while (!fd.enum_fmt(fmt_desc));
 
 	if (num_compressed_out_fmts == 0 && num_compressed_cap_fmts == num_cap_fmts) {
-		return ENCODER;
+		codec_type = ENCODER;
+		return;
 	}
 
 	if (num_compressed_cap_fmts == 0 && num_compressed_out_fmts == num_out_fmts) {
-		return DECODER;
+		codec_type = DECODER;
+		return;
 	}
-
-	return NOT_CODEC;
 }
 
 static void get_cap_compose_rect(cv4l_fd &fd)
@@ -1105,7 +1109,8 @@ restart:
 		if (fmt.g_pixelformat() == V4L2_PIX_FMT_FWHT_STATELESS)
 			res = read_fwht_frame(fmt, static_cast<unsigned char *>(buf), fin,
 					      sz, expected_len, buf_len);
-		else if (support_out_crop && v4l2_fwht_find_pixfmt(fmt.g_pixelformat()))
+		else if (codec_type != NOT_CODEC &&
+				support_out_crop && v4l2_fwht_find_pixfmt(fmt.g_pixelformat()))
 			res = read_write_padded_frame(fmt, static_cast<unsigned char *>(buf),
 						      fin, sz, expected_len, buf_len, true);
 		else
@@ -1365,7 +1370,8 @@ static void write_buffer_to_file(cv4l_fd &fd, cv4l_queue &q, cv4l_buffer &buf,
 		}
 		if (host_fd_to >= 0)
 			sz = fwrite(comp_ptr[j] + offset, 1, used, fout);
-		else if (support_cap_compose && v4l2_fwht_find_pixfmt(fmt.g_pixelformat()))
+		else if (codec_type != NOT_CODEC &&
+				support_cap_compose && v4l2_fwht_find_pixfmt(fmt.g_pixelformat()))
 			read_write_padded_frame(fmt, static_cast<u8 *>(q.g_dataptr(buf.g_index(), j)) + offset,
 						fout, sz, used, used, false);
 		else
@@ -2258,7 +2264,6 @@ static void stateful_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 
 	bool have_eos = subscribe_event(fd, V4L2_EVENT_EOS);
 	bool is_encoder = false;
-	enum codec_type codec_type = get_codec_type(fd);
 	bool ignore_count_skip = codec_type == ENCODER;
 
 	if (have_eos) {
@@ -2864,6 +2869,7 @@ void streaming_set(cv4l_fd &fd, cv4l_fd &out_fd, cv4l_fd &exp_fd)
 
 	get_cap_compose_rect(fd);
 	get_out_crop_rect(fd);
+	get_codec_type(fd);
 
 	if (do_cap && do_out && out_fd.g_fd() < 0)
 		streaming_set_m2m(fd, exp_fd);
-- 
2.35.1

