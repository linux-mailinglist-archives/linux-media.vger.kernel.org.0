Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6667A4E3423
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 00:22:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbiCUXOV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Mar 2022 19:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234277AbiCUXOP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Mar 2022 19:14:15 -0400
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (mail-am5eur03on062c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe08::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5C913409A9
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 16:02:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFX43GH4l48tiwngJUjBVVQ6kLpr2OZbgUaILNR3hlf2kuc++ZDxkscgV+SqyGIfKNUZr/0pEqRpTWf3lhwWm/B3r+eFXJ+SnLdhVEwct2LFy4J8HyNWCV4TiR5Kv11+QvvSRl+6mARCHmftryXVRgIza+6MUpH0aPXOWgEW+UN5B9xc2o2zJEjFpoUzwan0PWwkHvxMygx6fiuLxNefSX+9D+OMdslarVdi8bvFF6cx9a3HM7SP7djDJlgR2qj/hWJ1Aalke9/qEA36ksvStiNtrOQfLirKe3g6Z92VqSDJ/WMADpdGi+WAo8lsn1mZuYDiH8s+YKhbzw7DVFII+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8Z+Z4Hf6KznScoR0yfd9pr2BabTvWeyJpjHV+fwzDo=;
 b=iVIBtk/NcUTjU1iFqRvi/4XHmhDUj2CPNy5eYZcdLnTg0nTG6W49azW8qxUu/fkl2vHr6FpdzjGcbmLzyXLOPkbXSOjIGwHdsJy57iX2/jKgoFs3DO8T+Be9dFxdZYW4JkvB6mgDbsKNZwcFvx7rb68WUxKRhXbhFgeCYFX9D7uSWIQBO9mSx/Pe17SlMu3mzqGZft9FlkF5zV4N0vjQiWDCWKNAhnmAlUIKrwEfDENA60EmkVkgzVK9M2hMFrvHEFqbYRKZm6/ZUbfWUQ8FxyTEaJ27c8Ui2GmTQpZENJ3/EynDhbJA9KX+7dT7jLP25XEI8UNefqK5Z0VbAw5hjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8Z+Z4Hf6KznScoR0yfd9pr2BabTvWeyJpjHV+fwzDo=;
 b=ToUokBnAouDBkOPWIQGqFmXwYJUZETEpFYEf4Enilp9sMAZsz+J5lyFA+qJZ4PqXI2NT1i3i/r7zwEXjh6rUhKqS+83pURMcB8Nw82NiPpW4cElUpaPsAI7ia3ty0oUuFSh+dMLuunkOHH9BdD4zs11MB01ph2papsZZSrwegMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM6PR04MB4534.eurprd04.prod.outlook.com (2603:10a6:20b:24::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.23; Mon, 21 Mar
 2022 23:01:34 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::38:f60d:ad2e:ccbd]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::38:f60d:ad2e:ccbd%5]) with mapi id 15.20.5081.023; Mon, 21 Mar 2022
 23:01:34 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     hverkuil-cisco@xs4all.nl, mchehab@kernel.org
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org
Subject: [PATCH] v4l2-utils: read/write full frame from/to file for m2m non codec driver
Date:   Tue, 22 Mar 2022 00:00:48 +0100
Message-Id: <20220321230048.372594-1-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P189CA0022.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::27) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a05f9a63-f398-4f3d-aa8a-08da0b8ebea9
X-MS-TrafficTypeDiagnostic: AM6PR04MB4534:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB45343DFBE56C7961D7D48575BA169@AM6PR04MB4534.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mqt1NNJD+W53iKiQ+yLfZXR6OeXPARIZX9XKj2yhE7h4YW2eyuzF3V400u8eavzEPQLgUjFz6A5smDDtCvX0/fNucsERf1hmSkIT6Ut+j115bkyE98tbHmpxSZGyhMGllTn+//rR91Ytnn+16movl8sXpNP52OZl2HnbE+WQLLCJmZQV50mvE2sBSH5/p4Z6/JFklfjXWC8Lb2n/U1in8ynKnCb5D9UqdcWKZSLmkHtcLmpf9cRbQuCjyTPl424RcQJGVPefWZTverX+8l/NhqplD8BHb/D0fvLPSwt8jxN9wpEv0J2fEQOfe90NITZNj5FxEXLtpbhqab0hrxwX814xQt8Rgh2oRpoNUOzfNTA3RkrbM4fsbp3XlbsUAuHzRg4vUgkxuk3YLg8muNxs328xTuqws04APAf0zIui/3DluLkNWFnmFNG5sfZ5Y+gsl8No+zOifnW+kVedsyB/pUp0jiuwtoPGjNt3otciVJAITgBv97Z+hNST2yqPQJkmc2eJiEer11yj5XyC6qg+8HVYkOCQPDSry/heXQuFf+k/rypzLVvY7nxziVgEcQ3zyRkI0qGBgoDE3IMAc/HC0ro286SZteCHCaKvuWadAMZJmuIDGTxfH+Z8b/fD3j0ImD395626f1Kd501T2YrhTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(508600001)(8936002)(6666004)(44832011)(83380400001)(316002)(86362001)(6486002)(4326008)(66476007)(66556008)(8676002)(66946007)(38100700002)(186003)(2616005)(6512007)(2906002)(1076003)(52116002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pxCtMrTfD4US1nO69/+qQTO8NJKdzbKMm9NHel7/soHVXLF7Ljg2Sy2pdNFQ?=
 =?us-ascii?Q?SXtZKXblXxi8TytMHV2phgDHvFeL2sawkaitwTUhN45Sq/HiIBC2DMyjzREd?=
 =?us-ascii?Q?StpvlCzlPSWc+M/Dx3jyD/aOEpQBf01nWBERENJ1d/3oi9rD3FSjxb75CCOd?=
 =?us-ascii?Q?J3w+gwxUD2CjGg4S9LdYyfSlob+OYYMMwq9Fjv7mV+jf4+zp4LrvI0wzzHZj?=
 =?us-ascii?Q?48sFGtxpUjI7SqO1aGJgOxf8dGhffmevC+3Gq1OdkvO5CJPduZvev5QTSq3J?=
 =?us-ascii?Q?K4K+sqfTOr24+2n6clIpQWZMzCdmp/GWKtQcmD7U3tJby946VzU0bCxzfSm9?=
 =?us-ascii?Q?O7Wg1dCU0rtiHZfV9FX00USYXT8HUkIHdg59e/cOUqfWwWoddmqvlbv7ig9y?=
 =?us-ascii?Q?V9vZxduGxWcKMefH9KWDCW0eX0Pn7smC8foFs9UnfiEcgBVOBK+XTv1PwtVK?=
 =?us-ascii?Q?enEeRMacjo6qrYv8p/HTPFvxex94EvQ8ER3ppzStWE47y7qpF+3RysdKSEdX?=
 =?us-ascii?Q?+3gowqrkArpJYwsq5gBDQDNEb3GJKqjX4xQvzRfc0vBWz986gTWbjJPc7yQ5?=
 =?us-ascii?Q?FsEqqWTKvrdjoI57XPDSjYRSJElH35dHqNFfeGOtIMbXVDr0oSLkyrCq3v+7?=
 =?us-ascii?Q?L7/7I4BqNmHzFx4pS383xykos/nf+Kjdo3Y3v4SYlizQQl8TxkvrfRwWGnit?=
 =?us-ascii?Q?8tpEVnN6UTk0YLwrJRHBgP3GF4m1uoS3bigJzxnQ3vgqGldh6/FvbSXF/gQC?=
 =?us-ascii?Q?3YCupYH9e3NntLm8J+7Vj2PS66mivLvI5qLWwf+AaDSm4H2QvdnWXK2eP/iQ?=
 =?us-ascii?Q?p5rM111d2mlM5kM/5kYfcA/GbrUUk8WkPml8HrVXrFHnElvacpF3c8ODLawI?=
 =?us-ascii?Q?v+SfVMBtO0MBKCK9fytP+UHff6nFFn5hPe7e0tYKIWWERoBu69XUqpph6ucF?=
 =?us-ascii?Q?oVKBMTPvrBZh5K5toKgii+yvu1RztxGuoyWJugLQNVfZbE/gL4LuYldyr9xC?=
 =?us-ascii?Q?JBvi9TpOCBI3snv3mEX3RFf/gvkYSMNKkktrbF2bZrLcLVV3sh5SLAp0jYAy?=
 =?us-ascii?Q?vhdlNJZZHodwuhi2uEKMB+DzQA8yB+0yTJ0qtkeVnXaoOAt3Xb7j0uo0O8B/?=
 =?us-ascii?Q?qLPun38asfftX5lstUWEqybE+uwfHbeToz543yotMBTvhYIGeCAIMe2g95D9?=
 =?us-ascii?Q?bqb2FkGzDzUs25wx/3w7rsx+XIAMy3YxetT9Ks/3M8X/KdKrbVOLYvt2s3YA?=
 =?us-ascii?Q?/qFgE2/CMqHeNawo7h/SafmuEaxJgcAx3es2Qb+bpGG7VqnQv4qRIMT8KTgT?=
 =?us-ascii?Q?J6OXt3XgtSFBqeCogvCLeqFD/pCuuGRLuKhKxOXoskyFafkMnFHBq9kBB4Wb?=
 =?us-ascii?Q?avMosHLpXlsq+9BPyWOCwsgpnQQtTJo8wLVPleYDaMBXJST91obsjF6z50Cz?=
 =?us-ascii?Q?PYXh/zspNazlJkuwJY/lDXNNAPSACxf0qnsPuVev2a5eBCMirLifqJyI876A?=
 =?us-ascii?Q?d4pZZvx3l8+HSEIPbQmL12xl5/Uqjg9G/DdA1qwDCYghKsCpF3F73oioUg?=
 =?us-ascii?Q?=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a05f9a63-f398-4f3d-aa8a-08da0b8ebea9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2022 23:01:34.1223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vkYyMflWKFUFgjf/bZyAee7qeSWMP0mTlYXbZJ/7+6csKCDYnvvn2sPHw/P+1IV9MhxdeWDtRa1hKtierkE0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4534
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,
        T_SPF_PERMERROR autolearn=no autolearn_force=no version=3.4.6
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
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 7f6482d6..ae0fa127 100644
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
+static enum codec_type _get_codec_type(cv4l_fd &fd)
 {
 	cv4l_disable_trace dt(fd);
 	struct v4l2_fmtdesc fmt_desc = {};
@@ -394,6 +396,11 @@ static enum codec_type get_codec_type(cv4l_fd &fd)
 	return NOT_CODEC;
 }
 
+static void get_codec_type(cv4l_fd &fd)
+{
+    codec_type = _get_codec_type(fd);
+}
+
 static int get_cap_compose_rect(cv4l_fd &fd)
 {
 	cv4l_disable_trace dt(fd);
@@ -1109,7 +1116,8 @@ restart:
 		if (fmt.g_pixelformat() == V4L2_PIX_FMT_FWHT_STATELESS)
 			res = read_fwht_frame(fmt, static_cast<unsigned char *>(buf), fin,
 					      sz, expected_len, buf_len);
-		else if (support_out_crop && v4l2_fwht_find_pixfmt(fmt.g_pixelformat()))
+		else if (codec_type != NOT_CODEC && support_out_crop
+				&& v4l2_fwht_find_pixfmt(fmt.g_pixelformat()))
 			res = read_write_padded_frame(fmt, static_cast<unsigned char *>(buf),
 						      fin, sz, expected_len, buf_len, true);
 		else
@@ -1369,7 +1377,8 @@ static void write_buffer_to_file(cv4l_fd &fd, cv4l_queue &q, cv4l_buffer &buf,
 		}
 		if (host_fd_to >= 0)
 			sz = fwrite(comp_ptr[j] + offset, 1, used, fout);
-		else if (support_cap_compose && v4l2_fwht_find_pixfmt(fmt.g_pixelformat()))
+		else if (codec_type != NOT_CODEC && support_cap_compose
+				&& v4l2_fwht_find_pixfmt(fmt.g_pixelformat()))
 			read_write_padded_frame(fmt, static_cast<u8 *>(q.g_dataptr(buf.g_index(), j)) + offset,
 						fout, sz, used, used, false);
 		else
@@ -2262,7 +2271,6 @@ static void stateful_m2m(cv4l_fd &fd, cv4l_queue &in, cv4l_queue &out,
 
 	bool have_eos = subscribe_event(fd, V4L2_EVENT_EOS);
 	bool is_encoder = false;
-	enum codec_type codec_type = get_codec_type(fd);
 	bool ignore_count_skip = codec_type == ENCODER;
 
 	if (have_eos) {
@@ -2868,6 +2876,7 @@ void streaming_set(cv4l_fd &fd, cv4l_fd &out_fd, cv4l_fd &exp_fd)
 
 	get_cap_compose_rect(fd);
 	get_out_crop_rect(fd);
+	get_codec_type(fd);
 
 	if (do_cap && do_out && out_fd.g_fd() < 0)
 		streaming_set_m2m(fd, exp_fd);
-- 
2.35.1

