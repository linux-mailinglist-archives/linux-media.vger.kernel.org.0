Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6B5C5186E8
	for <lists+linux-media@lfdr.de>; Tue,  3 May 2022 16:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237199AbiECOmp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 May 2022 10:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235833AbiECOmn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 May 2022 10:42:43 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70055.outbound.protection.outlook.com [40.107.7.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29B53585B
        for <linux-media@vger.kernel.org>; Tue,  3 May 2022 07:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l6b7F076lzojY3JEarSsLbFT3b91KFl8aAzDNWEq23Q3vyNrbJ5LdLtSoOH2hCl2MGWOBP3lm9tu54mpC0VxuuYA3ev+nYo7USrUjdm3gvS12M4pzh4EqwGOYLbvPbzzLRC2D8v9o0iiqH6yleSsIZpmOp+LODLfC9lc79lYMtQeUIYiGAleZZCpsI5pR0mJO0hm/U0CAFkTb1PB2cx4kT5vJRlF8GaLr6JF7zs2pRJpwr3oN5JmzDKvKApOiVwvSNVdKCbaRT2hI8UHw3vzWBraLlHMpUC6k9xcwrKeZh1WV4tGS1u/Ia+2MLMTKNjgIcI/LOlZs8WNrYaPkxHVlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1ifANULpNERXTFDtyaVjdR2acqQk8YXcMLSAvBOSaQ=;
 b=O3wdfegh/cCXJQToLEz41YqFKX3NW4TlogRsMqrOMI3BgrSkS1K/BgDymzUiQWYRtua6mwVO97C2NA+XOzcbLLJqQ6mBW0hvYJMn9n70EfobfKXX6HFF2g7C1Z6CgSr0kWZVqTYpvgGLKKhUOE2ZLhqVqKcgckQhwJeyyYPG/q8lG9vil8G4g6NjWEZgQzjXg+lLVyXtyj3my4A6EWvrIGO4X/a/nemgbZR7QBSC2oraCKxjWDeQzL8bDqv9Fmq9/x7yaUiwxtQd1gdewyVY0wrZKlzeZ8pLrWTEDF7iC6wTJTEpSGpBqhzBusA3E/6joHsxOvyQdFMYMwGs9VBVdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1ifANULpNERXTFDtyaVjdR2acqQk8YXcMLSAvBOSaQ=;
 b=bgLPmbAyIWmP8q6TZx/0uHNn0GfxRPQ++gQLtsi1TfuZy3NdGfs3CoWwYTrkmsnmmz4j2KLo451m3h59lXXdvd4Xc4Xezzw9RmFQn++1ZDF88d9eYmYJ+CiQdY0V1r6VAeUXomntl+qO12LQIQPpJxgnb5OanAjaxLCNt9lfNQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com (2603:10a6:20b:43f::8)
 by DBBPR04MB7836.eurprd04.prod.outlook.com (2603:10a6:10:1f3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:39:07 +0000
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c]) by AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c%7]) with mapi id 15.20.5206.014; Tue, 3 May 2022
 14:39:07 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 1/2] v4l2-utils: Change get_(cap_compose|out_crop)_rect() return type to void
Date:   Tue,  3 May 2022 16:38:11 +0200
Message-Id: <20220503143812.982985-1-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0196.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::16) To AM9PR04MB8700.eurprd04.prod.outlook.com
 (2603:10a6:20b:43f::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf9b3f68-0429-46a7-c690-08da2d12ad08
X-MS-TrafficTypeDiagnostic: DBBPR04MB7836:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB7836EB8A6178F9F008FCDBEEBAC09@DBBPR04MB7836.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: krHEuFnMZJOiKnYp6J8nu8012rckmSuC0DWHpV8jRVh4EjoaHAXXTYTw4chHN12l+1DP1hQiTrfPJsJa4/aDeaVg/7f1DWp09L2vEZlrdtZFvrebzbYHbIdaqmxbmZTAau2WWjizz7qY6Z7DWdYnYWe5GTR3E7Z4H4CAVrMd6LjjVhhZwhHeXQVckyNRFqnudYlh+s2MkRMPATdHvOz1PntY2LbduClQXy9qcvljTKYCi1y5/IpDXh3s1mZooSdBQxIX9Te1eL6GQcJukHP1YYWxc0CZRESV7rQKwZb2BUdjuPSh+U2uMWv+/bV1IAo06ilu3bLdWFyAUMuVwlchIqrJstGLHGo9qVWXcOOrW5VMcwKE5Wc5JrNff7ZosXRCk5gjoUUh4BfIh60ckE8Kh+KN/LWzT8//GEgBR3AM1NhU7VVR+z8Qb93ncSALg/JDzqrd3o1qHZzg1YQN51/DF8UJSq81xLgJlfb655vGKfQXMqeIgM7X6asFlMKnkgyO3un7FRccebtPn87Cs4EJvdNM/yGQCGCpjHC0+0MK8GUWdxDC8hYbFgok77EqOCZQ8j2L8wjg6InCCHRTJzZvyPAjN7E7Ox3i33TwKm7FRzfbuMMJEpXGNhAj3LW+kocHI4TNGpELUObDzVl5qd2Qig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8700.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(8936002)(5660300002)(83380400001)(316002)(66946007)(8676002)(66476007)(66556008)(4326008)(186003)(44832011)(2616005)(1076003)(52116002)(6666004)(6506007)(6512007)(38100700002)(508600001)(6486002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?idwZotH6h97ghNT/XHnevDrETAxI+j8x9H5oq/rvVSzAKqulE6PdsT0QdNVY?=
 =?us-ascii?Q?5q9Cf0efYceMYNca3X9LYLL+eqB2ZGFhwreaIrow+ZmWyeRmVQOmiorG9o6z?=
 =?us-ascii?Q?7ba7939RSzc6A48o9TTlECjmpNKNOvwrNaKIqLMO1OtB6y05N4XddQ1bpico?=
 =?us-ascii?Q?sWWA74bVRcUpAqFi99/oYktBP5VwNNS8v6LTXAsNE25ftx9rOSMRrZDZdGP5?=
 =?us-ascii?Q?20V/6q5dQq3Hf9lcC4R2uiPeuLk6Jiah7s1GSLE3hB+L7U0GEclOgCV6yCOC?=
 =?us-ascii?Q?ZItbAQy9wfzWFHreyEBL0aC1kpVg0Tn9eOvPDGr6fVb4QMEo8ldDQB1Nh7/U?=
 =?us-ascii?Q?7YW/32+znwbBzXf6BMeRtk+E2SCrjvJO90injPni/aO0bScv/5iibC1Q1E1I?=
 =?us-ascii?Q?kcl9aDc5x+IQt0C2X0PW9Q7o93GZrUiA5epfmhRXU9C6g7bzyQV8QSzdEMvY?=
 =?us-ascii?Q?IW+Q3L4bhRkGBVhmjzKZCHiRvqrtqzTtCLiofQyDQ24cBPE0h08Hjj+ckOWk?=
 =?us-ascii?Q?3z8HmxJYL/DpPW8YuG/txKqwijG1cjqfQbZyl+SEj2uSHaiDfnCav8JCBAnD?=
 =?us-ascii?Q?xcsqAr+UOyfHDlvRwTjcw/gMqdA+R8I7Ot5mLv6uG+FOxkcHLj9JeM96YfUC?=
 =?us-ascii?Q?UjNWb/prmfIziKJbZGuDGEJ8iFzEKAR+I0gn+2zXbDw9h/AQEh2MpIi7Kv+M?=
 =?us-ascii?Q?6mlYrMZTfrS77sW/saSm7L+J6DCpVDTmHUi9TV8MbE39WEC7PrxXXrU/8pWT?=
 =?us-ascii?Q?+ze1Eg4o9VTasvMNqCntOQKS+pxpih3u+OhGXajpKbrnP3JT2knyubLtw7Vo?=
 =?us-ascii?Q?xWOtCL9m/fXWtTl5XqxTVFPVCfSTg+qNrX+S5pBPds57p/Vfcr1WuvaIwJPG?=
 =?us-ascii?Q?YG1geDROrj5/KQpatswGn0JpSUCqMUW5TV7sLtl2GqPnryF+Btckqv98ySQZ?=
 =?us-ascii?Q?paVEI5oDu2G5jwTdxxtDPHuG3UOpl5sxVaoUMqp5yi+x/fhlxk5ouRqyr/s+?=
 =?us-ascii?Q?bCx1EqThJE0BJzDr0H3bcByZaMTPDTaib7N7UTXIP2UiiTpkiD75RY1c4oyI?=
 =?us-ascii?Q?ydrBUu/2sqCvfLAD5sf+CMQLfFE0IttOIT5ugcJor5TyAYnDufIeJBUJytiL?=
 =?us-ascii?Q?Pg5/ezzVrEzOazQGcd0bvWGbzWepuNkSGutqxGyNyY3WAO7BspawWInBLPFQ?=
 =?us-ascii?Q?YUv5pVa2XIgC+KTbe31BWkcc57cUkQqGvHlbw139lXh9Kp4KbBWgCR62w/4D?=
 =?us-ascii?Q?XDCls6bjKH+C2gyRuAYKN05iHqocuGThuCx/ugLtaPI2vWqh5r1Joel8pECm?=
 =?us-ascii?Q?SakcYqty6Lwe/JJmsN0UlfUxw0XAcPmO+AJL5n9eOikuF+N1J4+xa82C30Gb?=
 =?us-ascii?Q?K4f4kO+AOpQVvxXA+zV8fj5eEHzyGmeBZW/rKjBqZds2Hw+QOOMt3zs11Y16?=
 =?us-ascii?Q?FoS1ZJgf08BRftTWfUzpulX7u+2Hal89Ro0lYF4QEb7F2PBn3bxXIUXj8kTa?=
 =?us-ascii?Q?DqvJrqrvaP31+qZpMx9CHUg3qapJGV/Z1S4ejxhF6OHFTdyoqTAvA5SoHxSB?=
 =?us-ascii?Q?Fp77ykGbodruwh6fvLoIcum+UWpWBvOQDYm5YzCFBR4VLaoe3ogrVbzDQOiM?=
 =?us-ascii?Q?vTlADpZzE9lIcdhTmyLBxjebIFpNBjJch7yBXdsHgFdt1CwTzK5dBmfgUt7S?=
 =?us-ascii?Q?B7IiSWNmoa3IzSWsL+f10YETvhxW/UNnOuI4bfU+0jI3Mcg+D9StmOzWve5U?=
 =?us-ascii?Q?jvuB7QnIHSAoyKUq80lBfCnWDBrXyfXLbWM+V5Br0jsU0HDYPD+S4Qy2+1AE?=
X-MS-Exchange-AntiSpam-MessageData-1: rC1b7509GVm1aymLKGEotCuB+mgflWRgnbU=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9b3f68-0429-46a7-c690-08da2d12ad08
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8700.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:39:07.1728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L77YeEFchQk7aoHs28On/YMNKEc/thXenDhqRync8PRopaWQK+V1p22Ab9Ah3M8vgxl84Mx8wMiz5LXcreBkSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7836
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Those functions always return 0, hence change their prototype to void.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 utils/v4l2-ctl/v4l2-ctl-streaming.cpp | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index 7f6482d6..8a06c754 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -394,7 +394,7 @@ static enum codec_type get_codec_type(cv4l_fd &fd)
 	return NOT_CODEC;
 }
 
-static int get_cap_compose_rect(cv4l_fd &fd)
+static void get_cap_compose_rect(cv4l_fd &fd)
 {
 	cv4l_disable_trace dt(fd);
 	v4l2_selection sel;
@@ -407,14 +407,12 @@ static int get_cap_compose_rect(cv4l_fd &fd)
 		support_cap_compose = true;
 		composed_width = sel.r.width;
 		composed_height = sel.r.height;
-		return 0;
-	}
-
-	support_cap_compose = false;
-	return 0;
+	} else {
+		support_cap_compose = false;
+    }
 }
 
-static int get_out_crop_rect(cv4l_fd &fd)
+static void get_out_crop_rect(cv4l_fd &fd)
 {
 	cv4l_disable_trace dt(fd);
 	v4l2_selection sel;
@@ -427,11 +425,9 @@ static int get_out_crop_rect(cv4l_fd &fd)
 		support_out_crop = true;
 		cropped_width = sel.r.width;
 		cropped_height = sel.r.height;
-		return 0;
+	} else {
+		support_out_crop = false;
 	}
-
-	support_out_crop = false;
-	return 0;
 }
 
 static void set_time_stamp(cv4l_buffer &buf)
-- 
2.35.1

