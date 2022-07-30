Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 724B7585A0E
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 12:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232749AbiG3KZH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 06:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231687AbiG3KZG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 06:25:06 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACBB02C119;
        Sat, 30 Jul 2022 03:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qvm7cyjCw/4y4Wkh2RHrQV/gYQ4SJC1yDga98LfZHdPeSI6BgXwGHABEHqdEvpd1d0gV3XGXxB7Uwi6+2BY80RiV0e72F1lSPQCefrrw16DP7YuJ9Tt8bhM5xwKCciqWrZkXQf8CMUcmO+luFsbgpSvF86YAA2Q+mIIUUJaDgxIKl4ZmVfBo7m2uahRH6KEE7jagST2tO3J280b9DiTcUSs1LA5UrA1UvUpahKGuGtub0IgMnVIZz40rUWXtP1wG21JMqcOfmhHxM+TsDgZxEKBJ31SjyC0aPZycJZQQbvpinPjv1SO8BfG5dCOKQnPgH4bXsoeZn6wDIjBhvdWLEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sJySvM2RzQ8yfyLYrCcr+UHM3X0MJ5/VdC5P5rgGc7E=;
 b=miOe4xtPka0+rY7UWWdN2VAqpZALsNzElzv4zPKfXWPW1MnGP5DnzEIZVT4UCli/RjEeXTUiCO7+ZsPQWx4iYQqPivqg3GJiWPrKqgt+HHLIaN99S4KLGrRS8UtTPi3mvas87kIKyPP9DfCDHaprMjM2VeTU3MQQVKeK5HkmBCmbWgdUr71un1Z15MmlONTzJ4DHAZjz5KxVXrcNF0XfwCxEUl4Dh47zqTzJwmPfALOmqMp+X7IycOVwJ4ZumqcKE9vTuJAPU0e8h4ZXT5IEh7rnr8f1ZnBwGAxeznLQ6Dhbpc5mXaxidAzY6uq+bL9g6es9nM8vJ5s6QaKmw5W5vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sJySvM2RzQ8yfyLYrCcr+UHM3X0MJ5/VdC5P5rgGc7E=;
 b=Cclxo9qRDeePnQWheGaPFCF6w9gFuVmG0boeXlPRb/UHAzEmb5HDX/HCSldb9WjYWGUfTyruEgiaIwiK6vbAK/pr43G+21/gsN8jm5Eb+tig38Sjq7mnWy5ajkp+LevKJr6rxcLEyNULaDva0AT3wjnJNf3sk1GPZiep4OG1uS8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by PAXPR04MB8621.eurprd04.prod.outlook.com (2603:10a6:102:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Sat, 30 Jul
 2022 10:25:01 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f%9]) with mapi id 15.20.5482.014; Sat, 30 Jul 2022
 10:25:01 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v9 2/8] v4l2-ctrls: Export default v4l2_ctrl_type_ops callbacks
Date:   Sat, 30 Jul 2022 12:24:07 +0200
Message-Id: <20220730102413.547698-3-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220730102413.547698-1-xavier.roumegue@oss.nxp.com>
References: <20220730102413.547698-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0067.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cc::9) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4052ba4-a990-4d35-d8e7-08da7215c288
X-MS-TrafficTypeDiagnostic: PAXPR04MB8621:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zxfc9jxisnl6nc6XC789ITVm6pnFSI8tZ7LvXPDdjuCsLmC4RMKiakC3moUqqBhLehB0fpZoha1gnwr8csZBBPs/RqJPc5rEJm1xcRcSbmCGdmhkBx28RCs/gz0Etgu+5Na5yLh61ui3IAwk0v/NgLajji7pWEF3BuOdqW6GivQRYCl8jsq1GV4LIxNsHgRYZwBd3JwY9gRTOZiPfppMvb39oBm30bJeNZG0aPgenwxuet503jqVE2e5bVqexf89/4OocXMqetqpD25yLbzLYLsI6jq0f1oBvrsKsz6oqNwGB4ni33o7CIzRQO/Ze88pdlCOqSDjoyei3A3hopoMT7qWaN18p9vAf67/lBD8UQ5cHHUL6kH67u4eIwQoYYoT2LeWGYvkP3pbV7X8zm/fV6gZBx76VJ++DYjJEqQnvCIR+7VN8uEGUHtFngECxZNMlvOkhSGVn4v0c+K73EXyTmbbmpd9ezCHt2rSi+lnGhL1UFNUMzlXXwKKNGZjbUwhtjAatGJ9h3lyRLxYJopbv8LoGy1qZyqXmg+Es6rOMYJNseQk/ViMTzVC7vPaUjxzq46JVuP/f0qyArAONrTZCaHaV9cV38mfoiGQlYipXMRZ539k/T9Shs57DEwnN6iV8MaqsvAI/wjuuT2/lJ4KFOPg57NwHU1YrKF5usB51OWWcoe+zCMlp+/WYEk/o7j96Oddl8lyAH9k3iKUb61E1ellbTmQyf/JvPW2o49rcV93MKLuE6SS2Hz1B95EfZDB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(7416002)(6512007)(4326008)(8676002)(44832011)(186003)(83380400001)(52116002)(66556008)(6506007)(38100700002)(66476007)(66946007)(2906002)(86362001)(8936002)(41300700001)(5660300002)(478600001)(1076003)(6486002)(2616005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dv7iky23mJkUDe3+biYTWCjauI5WWdsmxH+QAYrjz5TLUslFZpz+1zploFLZ?=
 =?us-ascii?Q?xr7VcFdZVXaozfwWPwajXkbPO8go3FMzycZqiFkeLOVhr+IJY0GA3hsE26WA?=
 =?us-ascii?Q?RMP+zb1YU1R56QGFUKrDURmJcUSWXXLqRyfJ4QF7Ob+B41JC8O3wKmggw7Pj?=
 =?us-ascii?Q?RwPDy1U9Vkx5CbiP8mU9irbaexcs4NLCmtg0Q1jpsq9KRDUWE/vBPfT6s2jM?=
 =?us-ascii?Q?ywTqRPR7+ajUO+KtUFsap/68CBxDrHfayD23KZVDLaXCihiBViPLxiK7YsEw?=
 =?us-ascii?Q?ziroZqpf0766e/YEN5fFswrfHFkB8IOz44oeyEyuHWJzdkgs8f6tqw7JMMzp?=
 =?us-ascii?Q?2BfzKHHhC2HSdq4zJFI/BHastRK4wbjQJBbZ+rvxULNSEZVwM5SrYxYGnj97?=
 =?us-ascii?Q?AZZvC9F1/7mq0aB+oIMUMKk9uFnrAZC4fu7GFX79wJ+UbqPkACkzJvRpGaiz?=
 =?us-ascii?Q?AvjxLH6Y8f7aFbbwRK9/XhFcQ3zCCaKjGEtj3S8v4rgViS9rN7n18cpMODY3?=
 =?us-ascii?Q?+ipvQJPXgQRuI6bGeoFREcui54yzytv4INP1d1CmiXeEzqklO8iuSwxV2qUN?=
 =?us-ascii?Q?8gGkH/ctQcx4eiF5hLjScbUCMlMGtv5LyxkZvwyNxWAgNC8MIrXzGeTf33/l?=
 =?us-ascii?Q?dNAFvf1tgi61aXmMu3zzglRIi8izNnoz7euhdOZxSZcMMNpkrd4arZ/z7Agr?=
 =?us-ascii?Q?x3txJ6bS57K1HctEOqkEYfu0W87kXSTXR1c7vNJuM/gjZrsqjmE6FjqdAyjb?=
 =?us-ascii?Q?t1fDrsiGmX9ExCRovuxu+AqYJGWtSz5MO8nqyrQ8dRR0AVXA17Qe2O2dR/C7?=
 =?us-ascii?Q?lboSYi3fOJ3P9LTDR37a1ji+PpfvhNONIIpa8xFm26Llj+/GUr//rfIJhJof?=
 =?us-ascii?Q?rzjNC6v6XCEhHBwbZMOM6PqGBX6yxINJ9yDEDGe0eMw/ogxZ/UXUEQC2rF7E?=
 =?us-ascii?Q?ekIcsqu9ANXt8Fw8aIv6AfBkn1r4aLdZVLWuuYbc1RQLtyoletXbvUtdlJOd?=
 =?us-ascii?Q?dQ3NU8IfXaERWzD8wIlEzWY860iMiwEOhl2yOrdC+7s9alByKO7rH20dWatS?=
 =?us-ascii?Q?XgEw8duyW0DJDjL8kvSj0EIKlvfDcsZlw2HxydKyosuDmvLSygmk5AtVw9mE?=
 =?us-ascii?Q?A2U5ANpxNapBYc3rpirgbRr7l4ixOSr8Xbr8oBh8cCCYkJrvy9ZUGb+tZMCy?=
 =?us-ascii?Q?B91m/HZ4RuR6etP68ju7JMt+Vki1evBP5WJQyrQptxvgJb0wG2T2GaWKI4Oq?=
 =?us-ascii?Q?oZS2ZZtkCnNX6tQIHT7jZarQtaPc1yiqTBn/G03kBzRyOaKwnNlEgP07oaZS?=
 =?us-ascii?Q?5t9cVZ6Pbjkxdz8dtrbXVElpNUIz25mlUoMkWJ4JIunkkxyhbnsIckZ80Y6q?=
 =?us-ascii?Q?EVrQt6BWZO7fkH9XbscrrmDsAVyaTWaNnuNC7R1j7oR7/BrA3XNHFQU1/hJ/?=
 =?us-ascii?Q?zpmbz+6jZu74lA6GUMirJicU0IZfVCH0yWbatGDPfftq1FkN5IpjIBtQQ/PH?=
 =?us-ascii?Q?7Y5cxxNXP0+Nu25CZVGOTfGdp3OtRk0L8MeQfMKcIrN1HqSbkquhTYNuyF8/?=
 =?us-ascii?Q?sPPvt0E/Euh790IlzoRrA/zPOI6d6tNZXh1i+dpZiA4kwTHjPktEwke10COI?=
 =?us-ascii?Q?VhtdwF4Wk5vxR5n3IzxQWb+XmDML8lBMzMgTvOFZBNBUa0n0ljIxC0SGcGEc?=
 =?us-ascii?Q?ZC+BPw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4052ba4-a990-4d35-d8e7-08da7215c288
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 10:25:01.1536
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZO8BIu9CVRXdTyQew97lYDUnNibsfo1BAf3Xfl4KfDXSq0OqAXOyBRXWdhKCADXoqXHUs9uX8Q8HijjOAiFSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8621
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Export the callback functions of the default v4l2 control type operations
such as a driver defining its own operations could reuse some of them.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 30 ++++++++------
 include/media/v4l2-ctrls.h                | 48 +++++++++++++++++++++++
 2 files changed, 65 insertions(+), 13 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 4faba8ffe426a..ead5159f39c77 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -65,9 +65,8 @@ void send_event(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl, u32 changes)
 			v4l2_event_queue_fh(sev->fh, &ev);
 }
 
-static bool std_equal(const struct v4l2_ctrl *ctrl, u32 elems,
-		      union v4l2_ctrl_ptr ptr1,
-		      union v4l2_ctrl_ptr ptr2)
+bool v4l2_ctrl_type_op_equal(const struct v4l2_ctrl *ctrl, u32 elems,
+			     union v4l2_ctrl_ptr ptr1, union v4l2_ctrl_ptr ptr2)
 {
 	unsigned int i;
 
@@ -88,6 +87,7 @@ static bool std_equal(const struct v4l2_ctrl *ctrl, u32 elems,
 			       elems * ctrl->elem_size);
 	}
 }
+EXPORT_SYMBOL(v4l2_ctrl_type_op_equal);
 
 /* Default intra MPEG-2 quantisation coefficients, from the specification. */
 static const u8 mpeg2_intra_quant_matrix[64] = {
@@ -177,8 +177,8 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	}
 }
 
-static void std_init(const struct v4l2_ctrl *ctrl, u32 from_idx, u32 elems,
-		     union v4l2_ctrl_ptr ptr)
+void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			    u32 elems, union v4l2_ctrl_ptr ptr)
 {
 	unsigned int i;
 
@@ -240,8 +240,9 @@ static void std_init(const struct v4l2_ctrl *ctrl, u32 from_idx, u32 elems,
 		break;
 	}
 }
+EXPORT_SYMBOL(v4l2_ctrl_type_op_init);
 
-static void std_log(const struct v4l2_ctrl *ctrl)
+void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 {
 	union v4l2_ctrl_ptr ptr = ctrl->p_cur;
 
@@ -334,6 +335,7 @@ static void std_log(const struct v4l2_ctrl *ctrl)
 		break;
 	}
 }
+EXPORT_SYMBOL(v4l2_ctrl_type_op_log);
 
 /*
  * Round towards the closest legal value. Be careful when we are
@@ -527,7 +529,8 @@ validate_vp9_frame(struct v4l2_ctrl_vp9_frame *frame)
 
 /*
  * Compound controls validation requires setting unused fields/flags to zero
- * in order to properly detect unchanged controls with std_equal's memcmp.
+ * in order to properly detect unchanged controls with v4l2_ctrl_type_op_equal's
+ * memcmp.
  */
 static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 				 union v4l2_ctrl_ptr ptr)
@@ -989,8 +992,8 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
 
 }
 
-static int std_validate(const struct v4l2_ctrl *ctrl, u32 elems,
-			union v4l2_ctrl_ptr ptr)
+int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl, u32 elems,
+			       union v4l2_ctrl_ptr ptr)
 {
 	unsigned int i;
 	int ret = 0;
@@ -1019,12 +1022,13 @@ static int std_validate(const struct v4l2_ctrl *ctrl, u32 elems,
 		ret = std_validate_elem(ctrl, i, ptr);
 	return ret;
 }
+EXPORT_SYMBOL(v4l2_ctrl_type_op_validate);
 
 static const struct v4l2_ctrl_type_ops std_type_ops = {
-	.equal = std_equal,
-	.init = std_init,
-	.log = std_log,
-	.validate = std_validate,
+	.equal = v4l2_ctrl_type_op_equal,
+	.init = v4l2_ctrl_type_op_init,
+	.log = v4l2_ctrl_type_op_log,
+	.validate = v4l2_ctrl_type_op_validate,
 };
 
 void v4l2_ctrl_notify(struct v4l2_ctrl *ctrl, v4l2_ctrl_notify_fnc notify, void *priv)
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 62052e1874bdf..121ea19d3da8c 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -1544,4 +1544,52 @@ int v4l2_ctrl_subdev_log_status(struct v4l2_subdev *sd);
 int v4l2_ctrl_new_fwnode_properties(struct v4l2_ctrl_handler *hdl,
 				    const struct v4l2_ctrl_ops *ctrl_ops,
 				    const struct v4l2_fwnode_device_properties *p);
+
+/**
+ * v4l2_ctrl_type_op_equal - Default v4l2_ctrl_type_ops equal callback.
+ *
+ * @ctrl: The v4l2_ctrl pointer.
+ * @elems: The number of elements to compare.
+ * @ptr1: A v4l2 control value.
+ * @ptr2: A v4l2 control value.
+ *
+ * Return: true if values are equal, otherwise false.
+ */
+bool v4l2_ctrl_type_op_equal(const struct v4l2_ctrl *ctrl, u32 elems,
+			     union v4l2_ctrl_ptr ptr1, union v4l2_ctrl_ptr ptr2);
+
+/**
+ * v4l2_ctrl_type_op_init - Default v4l2_ctrl_type_ops init callback.
+ *
+ * @ctrl: The v4l2_ctrl pointer.
+ * @from_idx: Starting element index.
+ * @elems: The number of elements to initialize.
+ * @ptr: The v4l2 control value.
+ *
+ * Return: void
+ */
+void v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
+			    u32 elems, union v4l2_ctrl_ptr ptr);
+
+/**
+ * v4l2_ctrl_type_op_log - Default v4l2_ctrl_type_ops log callback.
+ *
+ * @ctrl: The v4l2_ctrl pointer.
+ *
+ * Return: void
+ */
+void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl);
+
+/**
+ * v4l2_ctrl_type_op_validate - Default v4l2_ctrl_type_ops validate callback.
+ *
+ * @ctrl: The v4l2_ctrl pointer.
+ * @elems: The number of elements in the control.
+ * @ptr: The v4l2 control value.
+ *
+ * Return: 0 on success, a negative error code on failure.
+ */
+int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl, u32 elems,
+			       union v4l2_ctrl_ptr ptr);
+
 #endif
-- 
2.37.1

