Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E94DF4D206F
	for <lists+linux-media@lfdr.de>; Tue,  8 Mar 2022 19:49:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349642AbiCHSuH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Mar 2022 13:50:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349638AbiCHSuF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Mar 2022 13:50:05 -0500
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50046.outbound.protection.outlook.com [40.107.5.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BE7252E3C;
        Tue,  8 Mar 2022 10:49:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fe1kLzvAzW9K1K/mogQuXHXOUwN2jgjJ1SFa8gR0miGQw0xgHfk/rsUoSc31OxWiSAsbXQudO9qtLNNxmtbXvMUMSFwD49/qEep6+WXPUqbvjEONidxegoRKk9Ut60EuKHQJjWU+J4Y7qqNJuF573iikhARvIIvxNLLTUZtCsRrR+YXPC9VJlPOvcx9h3V7xwA+j1JtsOQG6iN0kFZWOBekq2QlO2ISWtQ0Q3Bgg0VyWXuSObqZzn7RYEN7r0qhTLs+uFyldGPNhz1XXW3LlRNofr7B08gOFCTkUhybiJs0IOdRpvInBp3xPV7JjtpJSUaSSSQwX7YT54h8hE+C8WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cW4qrzOcNxgGKlKzqqlU2sNKw1Qe/UX6a7HAmeMO8xs=;
 b=D/f8YlezGa16D8OhHmU53GyqRU0+8oEqiz41tebDrl2ilGYk38VKCMQpYL9Y/KaOnqoA/Nr2k+5hlhmwyMblu/HwLH0OQlZIrVnNhdlA63cVbaCMnIDgRT7n0w7aB/qCF01enj5KsB2lXLfC1pZbg+5LRdC5unZX+A3rB1daqID8X9U15BygWZm5SJD1kE5D7eWWDjdASJ4svzPwT1mXlKmBDy9vUiHwgAJv5M0PmLLg7kVCPIYNv07k9xpTIE1f4n8OVX+OBYF8lCqkvwkHH/MDtclIY7CgCiyK8/PK01ysWk20XTkZKuKTiV0m03ApindMtHC6Kr9xNWXtIA4aJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cW4qrzOcNxgGKlKzqqlU2sNKw1Qe/UX6a7HAmeMO8xs=;
 b=IYUYE7mRP/u+Ah+cEsgjewh3Lh9kywSl7m4GtV6YuRYdOkM6ffWqinUAVp2ZAhhs4rqSIBJXeLb8PHpbBCy7FzUdp+64QJlE5XSC9yyYo/cUWJAvXuIIzQW8QidS9ClO59i+c/j10K5cP+f97L75pDQoRCOO3yMHAbgSjK2fnqI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by AM6PR04MB4311.eurprd04.prod.outlook.com (2603:10a6:209:40::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Tue, 8 Mar
 2022 18:49:03 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::a037:bc8:44b:5965%3]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 18:49:03 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 3/9] vivid: add dynamic array test control
Date:   Tue,  8 Mar 2022 19:48:23 +0100
Message-Id: <20220308184829.38242-4-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220308184829.38242-1-xavier.roumegue@oss.nxp.com>
References: <20220308184829.38242-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0131.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::23) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3aa6ab82-6be1-4cbf-6697-08da01345116
X-MS-TrafficTypeDiagnostic: AM6PR04MB4311:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB43118A6CE59D35E44AACD868BA099@AM6PR04MB4311.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZAEPCleqbkObTnWRCymmyVzsCOJWuYiw2scjmv802ffiNRar+iws6YdfAueRo3OlDsbsHjTumeR53p7HVGL1fJLbex2mz+eOmCsKZTzQhGR0Yl/fthoUO8cbvsXCo6JlcBbXzyk/u2JcjsMmiilkHfX5herX5/dMhFIyGMuwNNXNqCq0nnV6Fxv82B40fvjxD6PeCRJKBCUbIM//+/7nzcWmbjTUFdQ826Gkd9/Bna27er1J1D3ig7ubCZKwebOTkBYh8sr1xVKY5IsS7euv+xvnodB02Wu/z1qX+Qz0RSjggmCd1uOGRkaH5wCFFgSf9rycYxovRHCTQFQXbvj+7Jo0Ic+y0WONNrxtXXItLPfXkaPxbqA6/eAVixL8xdI4L4bSn3Q94oEZNCWV2IKVo1x1uOAmMJ+rDHPHviMiO7P+HE9Exd6m2Qsh4cmlXB8U9SOrXShkIfKU6Ud28XfqJkviNF5Az97Ff9gmStqPBkYY8646IsPbPbBRTFFVPdV4seOkS2uAek5ieOeZodgb608VeBqbbyvl33j2ucdTvmtFGBZ8bL+ozYOC5Uim+LbXBpwYOpIXmRjz0wr1aJQg6czc1dNikAwtnZ1BN9JDKxRKQbyxwO0t0NOUs9o402nRDU8MkUDslvVxVHoPhlVogg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66476007)(4326008)(186003)(1076003)(6486002)(86362001)(5660300002)(8676002)(66556008)(38100700002)(2906002)(44832011)(498600001)(8936002)(6512007)(52116002)(6666004)(6506007)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HkgtvTnces1ovYarsReFc4QIlYwUXsw5D/F1XxX3OC+WKmMBSrMvqbJhY4hd?=
 =?us-ascii?Q?VW9stFg+svF7AZ5+dPGw+zOhy492FQwJcv0sgRS8fP+eIvmBiFQvKj5FemMI?=
 =?us-ascii?Q?Oq6kF1iPbNhQ5dnIyHOzPOSdzvYDBCyZIgJgMv1aoLJfNnOkBkr8gaLJN4tB?=
 =?us-ascii?Q?0RZPwvMN2pB1pU3IvXpJCSDSixx2TnX2Zyks0/6CLLq4cGX+TBbp3/tihwMA?=
 =?us-ascii?Q?HqcGpHspVM5BcTwR3FNVw8QDdqDjDjKWuOCUByhEmCIbrLnnXiIlt0Fsj3Pd?=
 =?us-ascii?Q?8ZOmzHox4KLoqvuydbS9zPfv29x2XkCfvXK3iroA6UxZFoU+VJet4xSCHfc6?=
 =?us-ascii?Q?sNxkQnIUqFhPU1aCphOGEmpgDmEDn2Jt9BMXIJVBG91rJ9UTYDP1egwq8iR6?=
 =?us-ascii?Q?PzWUREF8Z3t4V2XDCtNV9/crKbI8QRuv3aXDPnN5tAV/3g7IInWWJfDMMf/y?=
 =?us-ascii?Q?EM+1Ue8EgmIbufGSAx3ZiwV0g5sDY26X7HwIBGeVZKvmZgauaNUg/4O1hgEI?=
 =?us-ascii?Q?D79oC9jyl0Y3ACZBGAqESagU0Vnpu3aYZ0QArQpr3pjX7Tf99dDeIMfUz2CS?=
 =?us-ascii?Q?NXVm65jNGNXddrZ0d/l0DXaPfKeD6AuARm5z4pU0+zjlBXhxN7e+KsgrpDSP?=
 =?us-ascii?Q?6/cYRsUu+vt29WxnXQhHO4PnUa+B+ppzGtieAqTWVcQEXhfXvp6boxNZ4BZv?=
 =?us-ascii?Q?GT3dmyvXMLeHS/kJ/9AwFzQvHmRcvvynaIRVzuuVYocQLyEAKbeBUSaRexf0?=
 =?us-ascii?Q?IQeNqlCaPqsr679JfyIoKOmntbRtrKqinAwOWkIVw0nsqGho6NMkcCAqujVw?=
 =?us-ascii?Q?w7wLPqw4IuIABoYgMrCd8PaWM/UM2KDzZt6ZnapoEbctLZusVwcmNKFCCUko?=
 =?us-ascii?Q?RZz57lvKZ9xM5YxQyOM3FiSuidbTjRi0aU4iiUnzEhNoiu26fCfc13qivPLa?=
 =?us-ascii?Q?SCOiLnYujBNHOfqptngAQnGqkunzlqT+QxK9yPpeKi8EuU1NGMdT5VF3LQ54?=
 =?us-ascii?Q?Aqvcq/Tc8qnQNuRUP5yIGgF+FPObrr4qq+g84KFmLwt2v7tovJTyODUJcD3c?=
 =?us-ascii?Q?Dvi5CSG7UtIbG53jcESR2Y9b56wFZjP6U2cEm1ipq0WGDITmXZkFHIYURLBc?=
 =?us-ascii?Q?CE7vzI25h3oCjDzSrH8RHgEn4gzDZG7ELUUUNR4s0UrLVtM7XNoXDGH720Z0?=
 =?us-ascii?Q?kIpTlWv/SgeUWBPDlicb5RCu8CDkyGFk7h5JD38XGuZYPc2YYy70xrl4MJzK?=
 =?us-ascii?Q?HZ01jEgm41mXZG1bEo+liUFBf4o0XXkA6lZvaRcsdLOhBd7MyTLaznp8JT7i?=
 =?us-ascii?Q?ayc+su3dWUnUBg3EAIdfuXcaFV0PXw76LbqZzBZ00eM8ZOO+d4bZzChIgCHY?=
 =?us-ascii?Q?JxMzSMTpSrElXRMWWg5kwhHo6PoyyLD2GdlUq9QLSyCSr7IvC/KewvUWXdFF?=
 =?us-ascii?Q?481SKTYaFn7HoFNrf5BtI3TbSGJwXGURJuuve9Jhk7S3DpMzEdDlygnCPo9H?=
 =?us-ascii?Q?lUiLOLf571yvfoFyFXev8lptMdLHsD9GhG9IRCQV80UmQufzFKLflmPB0CEz?=
 =?us-ascii?Q?aUmiDMDMCjGb3Xu/iNHSdHAmJ6w/7fJvkfddp5q0IQ8T/SAJx1u33eL3/fmt?=
 =?us-ascii?Q?DDegNNgUHRmmpO9HxLRyYm0bppEWlM/2+BftT/rpGx9Yo/TGR+hREGhuvawj?=
 =?us-ascii?Q?UtZSJTZ+XojP6zt9JDrljfUUUbY=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa6ab82-6be1-4cbf-6697-08da01345116
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 18:49:03.7945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EJWZsizcpgOBdTFJFQcdiwNDEnFb2yHTnqa/+suRWW+D1eiohfTcPM30ToIwYpTtiEovEr/vTd3hjak+Qiknyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4311
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Add a dynamic array test control to help test support for this
feature.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-ctrls.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-ctrls.c b/drivers/media/test-drivers/vivid/vivid-ctrls.c
index e7516dc1227b..7267892dc18a 100644
--- a/drivers/media/test-drivers/vivid/vivid-ctrls.c
+++ b/drivers/media/test-drivers/vivid/vivid-ctrls.c
@@ -34,6 +34,7 @@
 #define VIVID_CID_U8_4D_ARRAY		(VIVID_CID_CUSTOM_BASE + 10)
 #define VIVID_CID_AREA			(VIVID_CID_CUSTOM_BASE + 11)
 #define VIVID_CID_RO_INTEGER		(VIVID_CID_CUSTOM_BASE + 12)
+#define VIVID_CID_U32_DYN_ARRAY		(VIVID_CID_CUSTOM_BASE + 13)
 
 #define VIVID_CID_VIVID_BASE		(0x00f00000 | 0xf000)
 #define VIVID_CID_VIVID_CLASS		(0x00f00000 | 1)
@@ -189,6 +190,19 @@ static const struct v4l2_ctrl_config vivid_ctrl_u32_array = {
 	.dims = { 1 },
 };
 
+static const struct v4l2_ctrl_config vivid_ctrl_u32_dyn_array = {
+	.ops = &vivid_user_gen_ctrl_ops,
+	.id = VIVID_CID_U32_DYN_ARRAY,
+	.name = "U32 Dynamic Array",
+	.type = V4L2_CTRL_TYPE_U32,
+	.flags = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
+	.def = 50,
+	.min = 10,
+	.max = 90,
+	.step = 1,
+	.dims = { 100 },
+};
+
 static const struct v4l2_ctrl_config vivid_ctrl_u16_matrix = {
 	.ops = &vivid_user_gen_ctrl_ops,
 	.id = VIVID_CID_U16_MATRIX,
@@ -1612,6 +1626,7 @@ int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
 	dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
+	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
 	v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
 
-- 
2.35.1

