Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB3EF4E991D
	for <lists+linux-media@lfdr.de>; Mon, 28 Mar 2022 16:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243704AbiC1OPv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Mar 2022 10:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243692AbiC1OPq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Mar 2022 10:15:46 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-eopbgr140051.outbound.protection.outlook.com [40.107.14.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 981E2DFF0;
        Mon, 28 Mar 2022 07:14:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSUlBnWdDduquVNylM5M/n7n/rd5xCYX4yTNgsgu4aG3XA8EHF9yhLR7BR8x6MYWe55JOrPTZ6dehtSMwXni62C46+L8c/kZulx0CoORKYuoZ+EHzVZHDGTwOjA6d4+bFX7NAnFEOCkAimb+RmF6SwtYMUk3w3uianG2cNjpbeh6XDY6IW7YN3a8zyeNakErV7xgYaGo5brrQS5RXiaj7qnhjHmq764o+f7Mh4EclS0z5IgFg1eCwJu224JRer8XqOw7yOtnWKbcRbni2bP5dPbIyNqpGq+rtSODEB/SbulU6tJribaThH3VfVTqrBMv222fRrkdcYNbi+72hpfP+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQQWdDj/pU3WgIfWXx+KpWAqdLBc+I0xh0KZanhHxIQ=;
 b=YLzB3LA4cVCJA9VcDDUh9vgilRZh2iwgw9aCn7JwUkib/pWoEtVZzydVLDifjr1PeZtd+D7LZspZK6hfmk1DzUPh9Moi38csYqhMbZBtK3ckbNSPbKImZGOSSLE549fheEv6fX7jfmyliCN35KBq3GjvzLRWxXNPvmXtP/YZiifHjCQmC/ikxjkZ2Nt6hqIHctPgZa/jhdmOal/7d+V0ZvvaDm1OPoDtwhTHmRm1jtvT4hRAxxL5hAKb0Od2bKzDF0JkcjcNOBK21WgeSnj3r/fMsbw3uU3TpqQgs8hNI/vjuOU5pN4i8iVESWxk0FTYnDXzI8KTykdStvlr+0aI3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQQWdDj/pU3WgIfWXx+KpWAqdLBc+I0xh0KZanhHxIQ=;
 b=PllPmLLjoQsdT2rWpvrrn3hZ6PP3+piPd8dWdIrenKxbv887bYcBBET+K5NF2PtX3OK2B0UjCGVlRPdlukzfqVX/ufRnEgbcdXIaK+ng8oSEI8YeCj0WZmrJLSkCotrMOZGqU/m55hG3+tpMteGBa5gU7Nxj25vdA/+DmJEBN6E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM0PR04MB4418.eurprd04.prod.outlook.com (2603:10a6:208:6d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Mon, 28 Mar
 2022 14:14:00 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::45a8:8093:26f8:37d2%7]) with mapi id 15.20.5102.022; Mon, 28 Mar 2022
 14:14:00 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 5/9] media: v4l: uapi: Add user control base for DW100 controls
Date:   Mon, 28 Mar 2022 16:13:05 +0200
Message-Id: <20220328141309.177611-6-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
References: <20220328141309.177611-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P193CA0032.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::7) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9aff329-7595-4251-2f62-08da10c5348c
X-MS-TrafficTypeDiagnostic: AM0PR04MB4418:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4418B5F41B9FDB29F45F7B48BA1D9@AM0PR04MB4418.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EcAlYATMwEPL/mbykwFv9ntbSPWPqfejyfm6NO/FMbos+zlxFtUAaPST9D/CmHeS9aOFXegPK0fT7q/p/vVh8hCP3KCUjeusWW5GHJtzfCtOx6FEptPtCHrkmY+Ld19qvOL917e7tSa6pfipcJjkvW6KFKerf4tJtOUp6x4uQVlsZcX/aYTUKEEIFk5NlbCg4JFTMRxk5/iplJD2kglwkGDFKFS0TryQL18CastiJ857OV++FOX6scKRC8kAg0Vggbh+Uywrr2zcsdS+wZ862jnEiASl0/s6lEf9DUmSB6DwyviK/m5DAfpiHWiB/q02mw8PxYeFrWYLR1W09LLopJCi96iERhStyaL1aXuWvPQx42exdvUwok4q1hzhicFXxRlHTS7UbAeKe9aa4gMFIcGmG99QcXSVFgLwqK0Hsg0Y+d1w8TFbwBcbYpy7Selq1zf4Vo+QggMO1baILxjG9V8MMCsP9OYWxkUpZFgvWnBHGRUmv0cqw+wuxwcJWctgd7cmkBxLTznC4VjFLbTifvopMSMEOnWLzrLVne3DoAUUadiGjGLVYpzWRJL3VdrnubBEpWEn+s5OBsZv17vvhJrl3d3mJGxh+zIJzF5TffjMtVixyCpmpcNmssn/wb737JIc5GGVOexpd4No45CpUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(2906002)(86362001)(6512007)(44832011)(52116002)(7416002)(316002)(508600001)(8936002)(4326008)(186003)(6506007)(38100700002)(66476007)(83380400001)(8676002)(6486002)(1076003)(5660300002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o6HxyYCht/cXgftAXf4OVWyayZp4GXbiYE19VJtKOyoqgCKtn2lLLPVD+viN?=
 =?us-ascii?Q?4zgroW459adZuNhf2Qld8tjrwsg9QWOwE/Yop8Gk5nsVa+cKQJJDTp5M7rcH?=
 =?us-ascii?Q?XmP2mz/w4zETxZqgNiSwAx0tTwISqbXAqExR/EKXMWwlQhn5GEgDiP167gDJ?=
 =?us-ascii?Q?0JQ75eVoH5ULgFnCH7kl+po7xnpnG/IADN6lZGoIuT8JzN042HWub4BRV5RE?=
 =?us-ascii?Q?ISeUNhxwtumW140LrblR98p5XS975o93PT4RGyGQQg0th42cT51si12lz5WB?=
 =?us-ascii?Q?n+otyKZbzVVA84kRott9TuI1uQevIshqVvZGv/2oMGukG6fsqTGWWIcGRQrj?=
 =?us-ascii?Q?V6TotOmjJXKkmXrUb2RCF8lTRLQdODc5dA4St77Peg2f3vNVohzkh1r35HNk?=
 =?us-ascii?Q?sZ/S8VmYYcAVJoRnlWqxVPv0VD6NoAHyKJDMdlMs4u2HNGfHwgHAtaEqDupG?=
 =?us-ascii?Q?HqG1iyLK6IU4I+kXB3z9UPgL3EcKQPMTN/FYeJalU+/lynWikk9Roi/6P5y9?=
 =?us-ascii?Q?Omsm/qxUq3Uz14mO6ydUCCQs0V9ALuvWh4hldkn+nagTzUOgK3E6unv+aBB2?=
 =?us-ascii?Q?A39B8WM2HSAydWh86RV7ggACFlPHI1fRMUS/iRcdUqs8YYhq85zHRiPfEqz8?=
 =?us-ascii?Q?2mIGqD2HZebUPuj4r2Wd3HWNCIR7xM/707bkCShC9939+58eUMAIYuGdz4TR?=
 =?us-ascii?Q?IKOIPaAONbaA62ph4uNrrMDgPAC0HBPilBBACnJGru7xXT/TDFe3vxR4G6D7?=
 =?us-ascii?Q?+KdniwHqanNU4GTKTmPYxicDvMYy/vriZ5z/4FBMbuBJgaBD2Zk3rZd3Rv88?=
 =?us-ascii?Q?Lc7Gyf4+0AJqwnq5VKiAwyUzZZWfgGFaEX6PbxfzskZ5WqvACZI8w+vXkvEg?=
 =?us-ascii?Q?Z300PAmh8rRVq+XhuqnCOC19MqI40eyoXhn2lwc8s3Z+wWIBwOiiZfXInPu5?=
 =?us-ascii?Q?1mrzJPPxZvEbZDj7+G9fb9GcWCjUacAKdzvUOA4cILSgmzvWqXC1rC7Id50y?=
 =?us-ascii?Q?42Q9rA/z1othwPNXbWnkFu5B5H4/aLR7R2VxIFY2N816U4S4p82mzF6sm8OR?=
 =?us-ascii?Q?s7sR9HkulWzW44SNYGcknGcXGLCWHqYH4TUP+O0wBrVVwlEwNnXmp6xPUllq?=
 =?us-ascii?Q?hN5hIQTg54ONwzsg9+Xh0RGg3vJOkv0nmuP+oiVdQb9413UCob/Q73dPgeQs?=
 =?us-ascii?Q?MKfpDP7MFXXYjrT6HXxh41CO1WT8c4bsqgG25CYmzH2Gr2KmcDPagbvDBCIc?=
 =?us-ascii?Q?55UTAYEiwgoyjW/h+klIGoGzqwf0GaWJi6vp/HNYvcP3SYMKt1trhyxtvbw+?=
 =?us-ascii?Q?WgRhP0dur6sE5fHR95rKW82V4pQFaCyfqNL9ZurBFdTJmxMxLqVpMoaBeypA?=
 =?us-ascii?Q?e6Rg53omwI9kZH61OgUUl071e1QkCuOFbrSYPQ8y3RPvoUWKQy4rY0K5xAIH?=
 =?us-ascii?Q?68YZO25v3O+hDEnBbBrP7YH5vr3FjWuPYi8idgrRh+Wv/eCfac4mFMDrJtol?=
 =?us-ascii?Q?Gruvv1HOpeVihnOESp4whw+1UUwTpZ/3SG9B5qi5iJ2XfdDdNfvptMHMqdn+?=
 =?us-ascii?Q?dKw5AUgfiIVFR320KFfSLKj3Nzy4UOIlKM4eiVTMcsUD9yRf3olgQIiFmFlo?=
 =?us-ascii?Q?/51SsCilFwnwBB1pk3q+g1MgEEtynnVbGInn9wcx+lTtQQhlHHgitYwf3XOp?=
 =?us-ascii?Q?8tf2JucUx7VJSGGT9ltiK5mzDhytf4W4SrzhhHrVCRCgmUdVxy2Dqic7CpEa?=
 =?us-ascii?Q?taonRf9TAXtLKEXmZ9I9g4X1oGIFCkPKFaomgmslVCkvHO2uThOjsjwxZ0gw?=
X-MS-Exchange-AntiSpam-MessageData-1: pDyUaC2KXUVx/umPJWYAB+CsRUYuKxjAKlM=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9aff329-7595-4251-2f62-08da10c5348c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2022 14:14:00.4112
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XNnKN6PijvbvlB8yRHmUG8aAJHQHyHxMtjml4bhDXxicQWPy8e+YObbp4FB9dFnA3VICLXvaoi1OWvBtQfXpiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4418
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a control base for DW100 driver controls, and reserve 16 controls.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 include/uapi/linux/v4l2-controls.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index bb40129446d4..9ef608a1f9ce 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -218,12 +218,16 @@ enum v4l2_colorfx {
  * We reserve 16 controls for this driver.
  */
 #define V4L2_CID_USER_ALLEGRO_BASE		(V4L2_CID_USER_BASE + 0x1170)
-
 /*
  * The base for the isl7998x driver controls.
  * We reserve 16 controls for this driver.
  */
 #define V4L2_CID_USER_ISL7998X_BASE		(V4L2_CID_USER_BASE + 0x1180)
+/*
+ * The base for DW100 driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_DW100_BASE		(V4L2_CID_USER_BASE + 0x1190)
 
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
-- 
2.35.1

