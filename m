Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73576518161
	for <lists+linux-media@lfdr.de>; Tue,  3 May 2022 11:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233774AbiECJo2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 May 2022 05:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233953AbiECJoE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 May 2022 05:44:04 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80074.outbound.protection.outlook.com [40.107.8.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F2A387A5;
        Tue,  3 May 2022 02:39:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEUWlorjxnUgZ2mERzZbn8UJC2GO/cYmpHp4AF4Z8vpVrmXr33qrPn1xedwXaecjKaZWGF+RmJm4oLtJXY2arVD4ml1oQ4W77w/UpfKnaER/ZexBTYfowJMno6irW4sHUWiEG3N4OAvCF1QNDL5VGTB9tGcMRkIiHLJRt64eUWTeJlUSjkU91EMnIUIC8gxyHyX2WQonUiuQIQoPPIkiZ9MqumT7ib/Jy7zQ9dJmM8C0Fz9KPRlqdHMLHgHjndvFqre2FQAgBhgHIGS1w9umJQJvD7YeBm20K3y1f914VkUBOeXXyf/kpVZ+4o8KMFH2T8M/A3+dnaknrLX0SVYShA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QDdgCkenIpJPTuk6FcogltUIoi7U+GDFMTPw6uKmlI=;
 b=Gn1l1nupuQfoYOPbO9sJ7FyJeOeoCXIgJJMOg5xfw6+NRkXegWDrw86LUxCJbljrPcjt4OqKqODLoHkf2NoB/mgK8yGpU+3nQoODUs5GNNH5rJzrDRthcfWEvFRjVB9Ox/4C5r87NMiw+HynTH4OgRzkgQpPtO8Cmk/eVRJXo0GBllSRp+m6Dz0+rRI0l0vmW68y/QDsdl/vn09N9faJoaUFg7q9hITa+DWU9f3q34nRGVAdTMaObE3xU7W1zLukH1NGE+ebZnxEqgqDYvASuyyhFBHrEjMjt0ULP/EtLG+cv/46qzjhXCfWll8sK+RHfJV2yW+kF+qzUolgMIiUQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QDdgCkenIpJPTuk6FcogltUIoi7U+GDFMTPw6uKmlI=;
 b=cm5XRrwGSJTjsg7MF9MRoQSqMxKNOD/XBl7YEztcQVkVBBI/cmmNwL7k7DhE4W+bjtHuzc7yyDnnYhXcO2IBRNgqjHhG02dj43AksyvfMVkszS1S9TCLGgcy3h4maskZnH/8pOznULK8IpgxQv4Q4/jXY79LO1Z96Z6TzKn9M/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com (2603:10a6:20b:43f::8)
 by VI1PR0401MB2559.eurprd04.prod.outlook.com (2603:10a6:800:57::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 09:39:48 +0000
Received: from AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c]) by AM9PR04MB8700.eurprd04.prod.outlook.com
 ([fe80::9120:6407:db5d:462c%7]) with mapi id 15.20.5206.014; Tue, 3 May 2022
 09:39:48 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 2/9] v4l2-ctrls: add support for dynamically allocated arrays.
Date:   Tue,  3 May 2022 11:39:18 +0200
Message-Id: <20220503093925.876640-3-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com>
References: <20220503093925.876640-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0111.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::27) To AM9PR04MB8700.eurprd04.prod.outlook.com
 (2603:10a6:20b:43f::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13ac4481-3a69-45a8-ce8f-08da2ce8dd39
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2559:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2559F3A9AD99214320D27E0BBAC09@VI1PR0401MB2559.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LiwyNoWZq2Zw20ntKgw+APBmjgNzZr4kztxjjyc8miyOj7qt2nwP/0fZFTImadP4Dx43zvXUjMdp8QQxBVzR/Lr99vLO1GIbM4KGvNhO8BEz3j6dkBb2xl/8ytnHTa+/JvZlwLypmazk0H8//OR1szfZd35XIi+f2pDsZWNQfXhlzkJhR7pgH6njQZvkZY9R+kQeRKHpG5D87pD8Av3lep5sqAWQ7kl/DuJ5lUtMLwR2mPOBEoMCej/fgM0lAmBgFNG1sfBNiA7u7PIjZ1vtN4tVRE3umStjXtaaAW0aPddnPlXZQLfatUEmL/u6D737cThn/wXZEMR8MGhTleTpB1dD04R/xyusGArxqi7ng/Rs84rUCF4Kn32K4X9rtlLS3S7KtWzD5pHG4ShgraGlBqEjkfuIK7oQxQnmCZ2tH8Q8mtNAIFuRnzaDUkDQvPKj+eoNUnzW3MQWTGaiM42xHJ7KkFHuMfILjzQccOkBACDuRD+NhEus7tIjbRjIW34+UQR0ieB5+QPpI2+5NG0gclPD1GQxtaqknO402K0XC618SwGRTkOqR6EQAFwVWj+FqfaT/sFIFdEf6Gz1v4dIy2hsy39jendyRjmD1RmyX2Ao034da5BbCnkL0MY8bhNP625pJo+gh3EU9lKG7bKpEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8700.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52116002)(8936002)(83380400001)(508600001)(2906002)(316002)(66946007)(6486002)(2616005)(1076003)(30864003)(5660300002)(7416002)(186003)(86362001)(44832011)(8676002)(4326008)(66556008)(66476007)(6506007)(6512007)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TlSOIMglKlQhD0bGaZPlI/aQdJ3SbECEE8GaVRAJI0eCVUEXfLauJif0P+L3?=
 =?us-ascii?Q?gArJO9W/mdVVHC3ouoQzL6yA23L/n3WxwXKRGlwpseMdYBWMSSS2N5VmrRuV?=
 =?us-ascii?Q?qxLNVcXEXDmhE9GEMMMYQ1lW6BJPOpW2UwPAVAMEnNd7gqbhKQfmPqOel/r2?=
 =?us-ascii?Q?DddidcZUZsLK2Ru+ngWJhXpIPCg4BIgzaj5c6MzzXVlPRaFDE5WrswhNCoKK?=
 =?us-ascii?Q?QavnKxnWw5bT1VcwbV44id/+kRXwHaad5wQ+c76Zf5qOal5+Rj9D/cgJ7Mxw?=
 =?us-ascii?Q?KmKIONkk45eMdT5REqed+5p+MeGBbFSOQcFfbUAdr5T/h/SQ+e9/JjuDSE9T?=
 =?us-ascii?Q?OTBF+roDXeuveaPhCezwDgFiI0bMb8m7QynBGpcVhOvWoDCggFDOZVZQBeum?=
 =?us-ascii?Q?lFKEuFQsE6cEroYYvgYNcXjP6qWgF/8c211UCsGpaUunX318P6I3Lv5uCsBN?=
 =?us-ascii?Q?pf/wTX1IbFlbwwRk3V60D0uhDAgVD18MTDNUDFEp/+c3UfMs+a425nkhTyCD?=
 =?us-ascii?Q?nydWN36r3S076GupY6/2JBW6Myc71wkEPTLlmna3ovdTPxlZNdlnZ0twZk80?=
 =?us-ascii?Q?uEPSKm15w/LLUMo6SAMGrsSoZuB9LIheuGqj2jBsFPlQWWSqXkDvmX7Md7WH?=
 =?us-ascii?Q?NrbbAig/OUSfeXky4VenpWPrXYz41BVpQPVHdMz0Wk8cRBtX1IzZ3I0X3EEi?=
 =?us-ascii?Q?c8L21eoYizSfZDXfA+Y78ptoI5xHl532LJLKo+KARPl6ps5mA5p4RZczFVTK?=
 =?us-ascii?Q?f0a2CGD+n9YNvJCtgurQLxWv/VeDGTk+k/ZHzFwUKe6K5IYKQETRbb30CDS6?=
 =?us-ascii?Q?5SBxTPtkNxiWCe3zakpyq/yAQJl172E74gKn1VUVy6JfJPq/TqA6yU4P1Fzn?=
 =?us-ascii?Q?DcJgBgu+408pHR8PLOLIXn0CEkSwWyRG+q1jMJgxWNLzlrCXPLXeSNzvJLeW?=
 =?us-ascii?Q?ApsLVv+YVLI7jDUAdZgcoarehdatla8iTaHb96OpgghZEbLjerwptkPYZ2CX?=
 =?us-ascii?Q?b7u4dyxG5NquGk390K2v5fI9cHRsYsqsSfi5mz+V7lpAgUdkfKyf4LOO3yAH?=
 =?us-ascii?Q?uf4D4ANTkVJNVz1P3UtlQe+gdk68jOLIr6G5r1xS2weZQ45O/W1+NAHytGJC?=
 =?us-ascii?Q?b4iCcywlHEtSliGi3Jv3SKy4nyn+7zJDIb0L3Qg0pJSvnEjORA1MGfIy24QP?=
 =?us-ascii?Q?/sjZg73Q9ujWAWdWhtOuemw5AnLGUULwYQuDQFjRrKvENMB9JO38hPPG48oW?=
 =?us-ascii?Q?r4pgf1dEDUbt83ouwkDSC66lJEvA2bSwumMmX74oHPi0wt3z8jd/bkQ2PqwQ?=
 =?us-ascii?Q?Eq2CsatXckn+AAhrwgZVmvORoZk4kHEPlGt8KYt5m0GSqvOyxesz6/4rXgcR?=
 =?us-ascii?Q?FX/6CkFCDSk11VznBA/zbAj2FhMCc3lt+c4SBeQCEqSAqYz2OqOaGo7mOWeq?=
 =?us-ascii?Q?IokDA9nTFNozHQ6k/O8WTbMH/FXT987H+qG64Wsh1kzgXMD08Gm5z4Cb+G0Z?=
 =?us-ascii?Q?sM71WMwr9MoV1syIbqQDCnapgjUs5DW5RLcNF3X4AHKAL69kCQ3G8EhzToat?=
 =?us-ascii?Q?8OLR2Y4mK6bifSBX/Kp2aGFFV9aIGdDWgNbOOOoCHIJ2LeGatHhWOyGKL3aj?=
 =?us-ascii?Q?p9itEMcnPZD2RunOZdI8H2ctffF69QD6ghVdO23BvcqSvN5sIQ9Hr4EDBpgw?=
 =?us-ascii?Q?BPcAvhBAHae5g5Bx4KkeQEPvq9sE34povncwqxq7AKzDnLf2ystnRQ1TfxNH?=
 =?us-ascii?Q?cT279xw6qAZq1LdsDbTXazd6Z8PG3PQrfQmaN1e5EeLcKj95RZsMMunrv9M5?=
X-MS-Exchange-AntiSpam-MessageData-1: Tfp65+xgf4cyYQ99LDCkagBzeSkeg8i49Wo=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ac4481-3a69-45a8-ce8f-08da2ce8dd39
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8700.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 09:39:48.3652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GIcjiurrfQzfkC/pCI0yqqIn6WIrScq2NXayxJuxTgqq9McI6U881Ds7DsbNQyX1EjQ+UkLS5G4YL4sqXvVr/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2559
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Implement support for dynamically allocated arrays.

Most of the changes concern keeping track of the number of elements
of the array and the number of elements allocated for the array and
reallocating memory if needed.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c     | 103 ++++++++---
 drivers/media/v4l2-core/v4l2-ctrls-core.c    | 182 +++++++++++++++----
 drivers/media/v4l2-core/v4l2-ctrls-priv.h    |   3 +-
 drivers/media/v4l2-core/v4l2-ctrls-request.c |  13 +-
 include/media/v4l2-ctrls.h                   |  42 ++++-
 5 files changed, 272 insertions(+), 71 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index db9baa0bd05f..50d012ba3c02 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -97,29 +97,47 @@ static int def_to_user(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 	return ptr_to_user(c, ctrl, ctrl->p_new);
 }
 
-/* Helper function: copy the caller-provider value to the given control value */
-static int user_to_ptr(struct v4l2_ext_control *c,
-		       struct v4l2_ctrl *ctrl,
-		       union v4l2_ctrl_ptr ptr)
+/* Helper function: copy the caller-provider value as the new control value */
+static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
 {
 	int ret;
 	u32 size;
 
-	ctrl->is_new = 1;
+	ctrl->is_new = 0;
+	if (ctrl->is_dyn_array &&
+	    c->size > ctrl->p_dyn_alloc_elems * ctrl->elem_size) {
+		void *old = ctrl->p_dyn;
+		void *tmp = kvzalloc(2 * c->size, GFP_KERNEL);
+
+		if (!tmp)
+			return -ENOMEM;
+		memcpy(tmp, ctrl->p_new.p, ctrl->elems * ctrl->elem_size);
+		memcpy(tmp + c->size, ctrl->p_cur.p, ctrl->elems * ctrl->elem_size);
+		ctrl->p_new.p = tmp;
+		ctrl->p_cur.p = tmp + c->size;
+		ctrl->p_dyn = tmp;
+		ctrl->p_dyn_alloc_elems = c->size / ctrl->elem_size;
+		kvfree(old);
+	}
+
 	if (ctrl->is_ptr && !ctrl->is_string) {
+		unsigned int elems = c->size / ctrl->elem_size;
 		unsigned int idx;
 
-		ret = copy_from_user(ptr.p, c->ptr, c->size) ? -EFAULT : 0;
-		if (ret || !ctrl->is_array)
-			return ret;
-		for (idx = c->size / ctrl->elem_size; idx < ctrl->elems; idx++)
-			ctrl->type_ops->init(ctrl, idx, ptr);
+		if (copy_from_user(ctrl->p_new.p, c->ptr, c->size))
+			return -EFAULT;
+		ctrl->is_new = 1;
+		if (ctrl->is_dyn_array)
+			ctrl->new_elems = elems;
+		else if (ctrl->is_array)
+			for (idx = elems; idx < ctrl->elems; idx++)
+				ctrl->type_ops->init(ctrl, idx, ctrl->p_new);
 		return 0;
 	}
 
 	switch (ctrl->type) {
 	case V4L2_CTRL_TYPE_INTEGER64:
-		*ptr.p_s64 = c->value64;
+		*ctrl->p_new.p_s64 = c->value64;
 		break;
 	case V4L2_CTRL_TYPE_STRING:
 		size = c->size;
@@ -127,32 +145,27 @@ static int user_to_ptr(struct v4l2_ext_control *c,
 			return -ERANGE;
 		if (size > ctrl->maximum + 1)
 			size = ctrl->maximum + 1;
-		ret = copy_from_user(ptr.p_char, c->string, size) ? -EFAULT : 0;
+		ret = copy_from_user(ctrl->p_new.p_char, c->string, size) ? -EFAULT : 0;
 		if (!ret) {
-			char last = ptr.p_char[size - 1];
+			char last = ctrl->p_new.p_char[size - 1];
 
-			ptr.p_char[size - 1] = 0;
+			ctrl->p_new.p_char[size - 1] = 0;
 			/*
 			 * If the string was longer than ctrl->maximum,
 			 * then return an error.
 			 */
-			if (strlen(ptr.p_char) == ctrl->maximum && last)
+			if (strlen(ctrl->p_new.p_char) == ctrl->maximum && last)
 				return -ERANGE;
 		}
 		return ret;
 	default:
-		*ptr.p_s32 = c->value;
+		*ctrl->p_new.p_s32 = c->value;
 		break;
 	}
+	ctrl->is_new = 1;
 	return 0;
 }
 
-/* Helper function: copy the caller-provider value as the new control value */
-static int user_to_new(struct v4l2_ext_control *c, struct v4l2_ctrl *ctrl)
-{
-	return user_to_ptr(c, ctrl, ctrl->p_new);
-}
-
 /*
  * VIDIOC_G/TRY/S_EXT_CTRLS implementation
  */
@@ -254,7 +267,31 @@ static int prepare_ext_ctrls(struct v4l2_ctrl_handler *hdl,
 			have_clusters = true;
 		if (ctrl->cluster[0] != ctrl)
 			ref = find_ref_lock(hdl, ctrl->cluster[0]->id);
-		if (ctrl->is_ptr && !ctrl->is_string) {
+		if (ctrl->is_dyn_array) {
+			unsigned int max_size = ctrl->dims[0] * ctrl->elem_size;
+			unsigned int tot_size = ctrl->elem_size;
+
+			if (cs->which == V4L2_CTRL_WHICH_REQUEST_VAL)
+				tot_size *= ref->p_req_elems;
+			else
+				tot_size *= ctrl->elems;
+
+			c->size = ctrl->elem_size * (c->size / ctrl->elem_size);
+			if (get) {
+				if (c->size < tot_size) {
+					c->size = tot_size;
+					return -ENOSPC;
+				}
+				c->size = tot_size;
+			} else {
+				if (c->size > max_size) {
+					c->size = max_size;
+					return -ENOSPC;
+				}
+				if (!c->size)
+					return -EFAULT;
+			}
+		} else if (ctrl->is_ptr && !ctrl->is_string) {
 			unsigned int tot_size = ctrl->elems * ctrl->elem_size;
 
 			if (c->size < tot_size) {
@@ -346,7 +383,7 @@ static int class_check(struct v4l2_ctrl_handler *hdl, u32 which)
  *
  * Note that v4l2_g_ext_ctrls_common() with 'which' set to
  * V4L2_CTRL_WHICH_REQUEST_VAL is only called if the request was
- * completed, and in that case valid_p_req is true for all controls.
+ * completed, and in that case p_req_valid is true for all controls.
  */
 int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 			    struct v4l2_ext_controls *cs,
@@ -430,7 +467,9 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 
 			if (is_default)
 				ret = def_to_user(cs->controls + idx, ref->ctrl);
-			else if (is_request && ref->valid_p_req)
+			else if (is_request && ref->p_req_dyn_enomem)
+				ret = -ENOMEM;
+			else if (is_request && ref->p_req_valid)
 				ret = req_to_user(cs->controls + idx, ref);
 			else if (is_volatile)
 				ret = new_to_user(cs->controls + idx, ref->ctrl);
@@ -457,6 +496,17 @@ int v4l2_g_ext_ctrls(struct v4l2_ctrl_handler *hdl, struct video_device *vdev,
 }
 EXPORT_SYMBOL(v4l2_g_ext_ctrls);
 
+/* Validate a new control */
+static int validate_new(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr p_new)
+{
+	unsigned int idx;
+	int err = 0;
+
+	for (idx = 0; !err && idx < ctrl->new_elems; idx++)
+		err = ctrl->type_ops->validate(ctrl, idx, p_new);
+	return err;
+}
+
 /* Validate controls. */
 static int validate_ctrls(struct v4l2_ext_controls *cs,
 			  struct v4l2_ctrl_helper *helpers,
@@ -872,6 +922,9 @@ int __v4l2_ctrl_s_ctrl_compound(struct v4l2_ctrl *ctrl,
 	/* It's a driver bug if this happens. */
 	if (WARN_ON(ctrl->type != type))
 		return -EINVAL;
+	/* Setting dynamic arrays is not (yet?) supported. */
+	if (WARN_ON(ctrl->is_dyn_array))
+		return -EINVAL;
 	memcpy(ctrl->p_new.p, p, ctrl->elems * ctrl->elem_size);
 	return set_ctrl(NULL, ctrl, 0);
 }
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 8968cec8454e..cb709c74e01e 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -991,11 +991,12 @@ EXPORT_SYMBOL(v4l2_ctrl_notify);
 
 /* Copy the one value to another. */
 static void ptr_to_ptr(struct v4l2_ctrl *ctrl,
-		       union v4l2_ctrl_ptr from, union v4l2_ctrl_ptr to)
+		       union v4l2_ctrl_ptr from, union v4l2_ctrl_ptr to,
+		       unsigned int elems)
 {
 	if (ctrl == NULL)
 		return;
-	memcpy(to.p, from.p_const, ctrl->elems * ctrl->elem_size);
+	memcpy(to.p, from.p_const, elems * ctrl->elem_size);
 }
 
 /* Copy the new value to the current value. */
@@ -1008,8 +1009,11 @@ void new_to_cur(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl, u32 ch_flags)
 
 	/* has_changed is set by cluster_changed */
 	changed = ctrl->has_changed;
-	if (changed)
-		ptr_to_ptr(ctrl, ctrl->p_new, ctrl->p_cur);
+	if (changed) {
+		if (ctrl->is_dyn_array)
+			ctrl->elems = ctrl->new_elems;
+		ptr_to_ptr(ctrl, ctrl->p_new, ctrl->p_cur, ctrl->elems);
+	}
 
 	if (ch_flags & V4L2_EVENT_CTRL_CH_FLAGS) {
 		/* Note: CH_FLAGS is only set for auto clusters. */
@@ -1039,36 +1043,122 @@ void cur_to_new(struct v4l2_ctrl *ctrl)
 {
 	if (ctrl == NULL)
 		return;
-	ptr_to_ptr(ctrl, ctrl->p_cur, ctrl->p_new);
+	if (ctrl->is_dyn_array)
+		ctrl->new_elems = ctrl->elems;
+	ptr_to_ptr(ctrl, ctrl->p_cur, ctrl->p_new, ctrl->new_elems);
+}
+
+static bool req_alloc_dyn_array(struct v4l2_ctrl_ref *ref, u32 elems)
+{
+	void *tmp;
+
+	if (elems < ref->p_req_dyn_alloc_elems)
+		return true;
+
+	tmp = kvmalloc(elems * ref->ctrl->elem_size, GFP_KERNEL);
+
+	if (!tmp) {
+		ref->p_req_dyn_enomem = true;
+		return false;
+	}
+	ref->p_req_dyn_enomem = false;
+	kvfree(ref->p_req.p);
+	ref->p_req.p = tmp;
+	ref->p_req_dyn_alloc_elems = elems;
+	return true;
 }
 
 /* Copy the new value to the request value */
 void new_to_req(struct v4l2_ctrl_ref *ref)
 {
+	struct v4l2_ctrl *ctrl;
+
 	if (!ref)
 		return;
-	ptr_to_ptr(ref->ctrl, ref->ctrl->p_new, ref->p_req);
-	ref->valid_p_req = true;
+
+	ctrl = ref->ctrl;
+	if (ctrl->is_dyn_array && !req_alloc_dyn_array(ref, ctrl->new_elems))
+		return;
+
+	ref->p_req_elems = ctrl->new_elems;
+	ptr_to_ptr(ctrl, ctrl->p_new, ref->p_req, ref->p_req_elems);
+	ref->p_req_valid = true;
 }
 
 /* Copy the current value to the request value */
 void cur_to_req(struct v4l2_ctrl_ref *ref)
 {
+	struct v4l2_ctrl *ctrl;
+
 	if (!ref)
 		return;
-	ptr_to_ptr(ref->ctrl, ref->ctrl->p_cur, ref->p_req);
-	ref->valid_p_req = true;
+
+	ctrl = ref->ctrl;
+	if (ctrl->is_dyn_array && !req_alloc_dyn_array(ref, ctrl->elems))
+		return;
+
+	ref->p_req_elems = ctrl->elems;
+	ptr_to_ptr(ctrl, ctrl->p_cur, ref->p_req, ctrl->elems);
+	ref->p_req_valid = true;
 }
 
 /* Copy the request value to the new value */
-void req_to_new(struct v4l2_ctrl_ref *ref)
+int req_to_new(struct v4l2_ctrl_ref *ref)
 {
+	struct v4l2_ctrl *ctrl;
+
 	if (!ref)
-		return;
-	if (ref->valid_p_req)
-		ptr_to_ptr(ref->ctrl, ref->p_req, ref->ctrl->p_new);
-	else
-		ptr_to_ptr(ref->ctrl, ref->ctrl->p_cur, ref->ctrl->p_new);
+		return 0;
+
+	ctrl = ref->ctrl;
+
+	/*
+	 * This control was never set in the request, so just use the current
+	 * value.
+	 */
+	if (!ref->p_req_valid) {
+		if (ctrl->is_dyn_array)
+			ctrl->new_elems = ctrl->elems;
+		ptr_to_ptr(ctrl, ctrl->p_cur, ctrl->p_new, ctrl->new_elems);
+		return 0;
+	}
+
+	/* Not a dynamic array, so just copy the request value */
+	if (!ctrl->is_dyn_array) {
+		ptr_to_ptr(ctrl, ref->p_req, ctrl->p_new, ctrl->new_elems);
+		return 0;
+	}
+
+	/* Sanity check, should never happen */
+	if (WARN_ON(!ref->p_req_dyn_alloc_elems))
+		return -ENOMEM;
+
+	/*
+	 * Check if the number of elements in the request is more than the
+	 * elements in ctrl->p_dyn. If so, attempt to realloc ctrl->p_dyn.
+	 * Note that p_dyn is allocated with twice the number of elements
+	 * in the dynamic array since it has to store both the current and
+	 * new value of such a control.
+	 */
+	if (ref->p_req_elems > ctrl->p_dyn_alloc_elems) {
+		unsigned int sz = ref->p_req_elems * ctrl->elem_size;
+		void *old = ctrl->p_dyn;
+		void *tmp = kvzalloc(2 * sz, GFP_KERNEL);
+
+		if (!tmp)
+			return -ENOMEM;
+		memcpy(tmp, ctrl->p_new.p, ctrl->elems * ctrl->elem_size);
+		memcpy(tmp + sz, ctrl->p_cur.p, ctrl->elems * ctrl->elem_size);
+		ctrl->p_new.p = tmp;
+		ctrl->p_cur.p = tmp + sz;
+		ctrl->p_dyn = tmp;
+		ctrl->p_dyn_alloc_elems = ref->p_req_elems;
+		kvfree(old);
+	}
+
+	ctrl->new_elems = ref->p_req_elems;
+	ptr_to_ptr(ctrl, ref->p_req, ctrl->p_new, ctrl->new_elems);
+	return 0;
 }
 
 /* Control range checking */
@@ -1110,17 +1200,6 @@ int check_range(enum v4l2_ctrl_type type,
 	}
 }
 
-/* Validate a new control */
-int validate_new(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr p_new)
-{
-	unsigned idx;
-	int err = 0;
-
-	for (idx = 0; !err && idx < ctrl->elems; idx++)
-		err = ctrl->type_ops->validate(ctrl, idx, p_new);
-	return err;
-}
-
 /* Set the handler's error code if it wasn't set earlier already */
 static inline int handler_set_err(struct v4l2_ctrl_handler *hdl, int err)
 {
@@ -1165,6 +1244,8 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
 	/* Free all nodes */
 	list_for_each_entry_safe(ref, next_ref, &hdl->ctrl_refs, node) {
 		list_del(&ref->node);
+		if (ref->p_req_dyn_alloc_elems)
+			kvfree(ref->p_req.p);
 		kfree(ref);
 	}
 	/* Free all controls owned by the handler */
@@ -1172,6 +1253,7 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
 		list_del(&ctrl->node);
 		list_for_each_entry_safe(sev, next_sev, &ctrl->ev_subs, node)
 			list_del(&sev->node);
+		kvfree(ctrl->p_dyn);
 		kvfree(ctrl);
 	}
 	kvfree(hdl->buckets);
@@ -1287,7 +1369,7 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
 	if (hdl->error)
 		return hdl->error;
 
-	if (allocate_req)
+	if (allocate_req && !ctrl->is_dyn_array)
 		size_extra_req = ctrl->elems * ctrl->elem_size;
 	new_ref = kzalloc(sizeof(*new_ref) + size_extra_req, GFP_KERNEL);
 	if (!new_ref)
@@ -1461,7 +1543,6 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 			elem_size = sizeof(s32);
 		break;
 	}
-	tot_ctrl_size = elem_size * elems;
 
 	/* Sanity checks */
 	if (id == 0 || name == NULL || !elem_size ||
@@ -1482,17 +1563,33 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 		handler_set_err(hdl, -EINVAL);
 		return NULL;
 	}
+	if (flags & V4L2_CTRL_FLAG_DYNAMIC_ARRAY) {
+		/*
+		 * For now only support this for one-dimensional arrays only.
+		 *
+		 * This can be relaxed in the future, but this will
+		 * require more effort.
+		 */
+		if (nr_of_dims != 1) {
+			handler_set_err(hdl, -EINVAL);
+			return NULL;
+		}
+		/* Start with just 1 element */
+		elems = 1;
+	}
 
+	tot_ctrl_size = elem_size * elems;
 	sz_extra = 0;
 	if (type == V4L2_CTRL_TYPE_BUTTON)
 		flags |= V4L2_CTRL_FLAG_WRITE_ONLY |
 			V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
 	else if (type == V4L2_CTRL_TYPE_CTRL_CLASS)
 		flags |= V4L2_CTRL_FLAG_READ_ONLY;
-	else if (type == V4L2_CTRL_TYPE_INTEGER64 ||
-		 type == V4L2_CTRL_TYPE_STRING ||
-		 type >= V4L2_CTRL_COMPOUND_TYPES ||
-		 is_array)
+	else if (!(flags & V4L2_CTRL_FLAG_DYNAMIC_ARRAY) &&
+		 (type == V4L2_CTRL_TYPE_INTEGER64 ||
+		  type == V4L2_CTRL_TYPE_STRING ||
+		  type >= V4L2_CTRL_COMPOUND_TYPES ||
+		  is_array))
 		sz_extra += 2 * tot_ctrl_size;
 
 	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const)
@@ -1521,7 +1618,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	ctrl->is_ptr = is_array || type >= V4L2_CTRL_COMPOUND_TYPES || ctrl->is_string;
 	ctrl->is_int = !ctrl->is_ptr && type != V4L2_CTRL_TYPE_INTEGER64;
 	ctrl->is_array = is_array;
+	ctrl->is_dyn_array = !!(flags & V4L2_CTRL_FLAG_DYNAMIC_ARRAY);
 	ctrl->elems = elems;
+	ctrl->new_elems = elems;
 	ctrl->nr_of_dims = nr_of_dims;
 	if (nr_of_dims)
 		memcpy(ctrl->dims, dims, nr_of_dims * sizeof(dims[0]));
@@ -1534,6 +1633,16 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	ctrl->cur.val = ctrl->val = def;
 	data = &ctrl[1];
 
+	if (ctrl->is_dyn_array) {
+		ctrl->p_dyn_alloc_elems = elems;
+		ctrl->p_dyn = kvzalloc(2 * elems * elem_size, GFP_KERNEL);
+		if (!ctrl->p_dyn) {
+			kvfree(ctrl);
+			return NULL;
+		}
+		data = ctrl->p_dyn;
+	}
+
 	if (!ctrl->is_int) {
 		ctrl->p_new.p = data;
 		ctrl->p_cur.p = data + tot_ctrl_size;
@@ -1543,7 +1652,10 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	}
 
 	if (type >= V4L2_CTRL_COMPOUND_TYPES && p_def.p_const) {
-		ctrl->p_def.p = ctrl->p_cur.p + tot_ctrl_size;
+		if (ctrl->is_dyn_array)
+			ctrl->p_def.p = &ctrl[1];
+		else
+			ctrl->p_def.p = ctrl->p_cur.p + tot_ctrl_size;
 		memcpy(ctrl->p_def.p, p_def.p_const, elem_size);
 	}
 
@@ -1553,6 +1665,7 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	}
 
 	if (handler_new_ref(hdl, ctrl, NULL, false, false)) {
+		kvfree(ctrl->p_dyn);
 		kvfree(ctrl);
 		return NULL;
 	}
@@ -1890,6 +2003,9 @@ static int cluster_changed(struct v4l2_ctrl *master)
 			continue;
 		}
 
+		if (ctrl->elems != ctrl->new_elems)
+			ctrl_changed = true;
+
 		for (idx = 0; !ctrl_changed && idx < ctrl->elems; idx++)
 			ctrl_changed = !ctrl->type_ops->equal(ctrl, idx,
 				ctrl->p_cur, ctrl->p_new);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-priv.h b/drivers/media/v4l2-core/v4l2-ctrls-priv.h
index d4bf2c716f97..aba6176fab6c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-priv.h
+++ b/drivers/media/v4l2-core/v4l2-ctrls-priv.h
@@ -57,10 +57,9 @@ void cur_to_new(struct v4l2_ctrl *ctrl);
 void cur_to_req(struct v4l2_ctrl_ref *ref);
 void new_to_cur(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl, u32 ch_flags);
 void new_to_req(struct v4l2_ctrl_ref *ref);
-void req_to_new(struct v4l2_ctrl_ref *ref);
+int req_to_new(struct v4l2_ctrl_ref *ref);
 void send_initial_event(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl);
 void send_event(struct v4l2_fh *fh, struct v4l2_ctrl *ctrl, u32 changes);
-int validate_new(const struct v4l2_ctrl *ctrl, union v4l2_ctrl_ptr p_new);
 int handler_new_ref(struct v4l2_ctrl_handler *hdl,
 		    struct v4l2_ctrl *ctrl,
 		    struct v4l2_ctrl_ref **ctrl_ref,
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-request.c b/drivers/media/v4l2-core/v4l2-ctrls-request.c
index 7d098f287fd9..c637049d7a2b 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-request.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-request.c
@@ -143,7 +143,7 @@ v4l2_ctrl_request_hdl_ctrl_find(struct v4l2_ctrl_handler *hdl, u32 id)
 {
 	struct v4l2_ctrl_ref *ref = find_ref_lock(hdl, id);
 
-	return (ref && ref->valid_p_req) ? ref->ctrl : NULL;
+	return (ref && ref->p_req_valid) ? ref->ctrl : NULL;
 }
 EXPORT_SYMBOL_GPL(v4l2_ctrl_request_hdl_ctrl_find);
 
@@ -373,7 +373,7 @@ void v4l2_ctrl_request_complete(struct media_request *req,
 			v4l2_ctrl_unlock(master);
 			continue;
 		}
-		if (ref->valid_p_req)
+		if (ref->p_req_valid)
 			continue;
 
 		/* Copy the current control value into the request */
@@ -442,7 +442,7 @@ int v4l2_ctrl_request_setup(struct media_request *req,
 				struct v4l2_ctrl_ref *r =
 					find_ref(hdl, master->cluster[i]->id);
 
-				if (r->valid_p_req) {
+				if (r->p_req_valid) {
 					have_new_data = true;
 					break;
 				}
@@ -458,7 +458,11 @@ int v4l2_ctrl_request_setup(struct media_request *req,
 				struct v4l2_ctrl_ref *r =
 					find_ref(hdl, master->cluster[i]->id);
 
-				req_to_new(r);
+				ret = req_to_new(r);
+				if (ret) {
+					v4l2_ctrl_unlock(master);
+					goto error;
+				}
 				master->cluster[i]->is_new = 1;
 				r->req_done = true;
 			}
@@ -490,6 +494,7 @@ int v4l2_ctrl_request_setup(struct media_request *req,
 			break;
 	}
 
+error:
 	media_request_object_put(obj);
 	return ret;
 }
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index b3ce438f1329..f4105de8a8d2 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -185,6 +185,8 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  *		and/or has type %V4L2_CTRL_TYPE_STRING. In other words, &struct
  *		v4l2_ext_control uses field p to point to the data.
  * @is_array: If set, then this control contains an N-dimensional array.
+ * @is_dyn_array: If set, then this control contains a dynamically sized 1-dimensional array.
+ *		If this is set, then @is_array is also set.
  * @has_volatiles: If set, then one or more members of the cluster are volatile.
  *		Drivers should never touch this flag.
  * @call_notify: If set, then call the handler's notify function whenever the
@@ -205,6 +207,9 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  * @step:	The control's step value for non-menu controls.
  * @elems:	The number of elements in the N-dimensional array.
  * @elem_size:	The size in bytes of the control.
+ * @new_elems:	The number of elements in p_new. This is the same as @elems,
+ *		except for dynamic arrays. In that case it is in the range of
+ *		1 to @p_dyn_alloc_elems.
  * @dims:	The size of each dimension.
  * @nr_of_dims:The number of dimensions in @dims.
  * @menu_skip_mask: The control's skip mask for menu controls. This makes it
@@ -223,15 +228,21 @@ typedef void (*v4l2_ctrl_notify_fnc)(struct v4l2_ctrl *ctrl, void *priv);
  *		:math:`ceil(\frac{maximum - minimum}{step}) + 1`.
  *		Used only if the @type is %V4L2_CTRL_TYPE_INTEGER_MENU.
  * @flags:	The control's flags.
- * @cur:	Structure to store the current value.
- * @cur.val:	The control's current value, if the @type is represented via
- *		a u32 integer (see &enum v4l2_ctrl_type).
- * @val:	The control's new s32 value.
  * @priv:	The control's private pointer. For use by the driver. It is
  *		untouched by the control framework. Note that this pointer is
  *		not freed when the control is deleted. Should this be needed
  *		then a new internal bitfield can be added to tell the framework
  *		to free this pointer.
+ * @p_dyn:	Pointer to the dynamically allocated array. Only valid if
+ *		@is_dyn_array is true.
+ * @p_dyn_alloc_elems: The number of elements in the dynamically allocated
+ *		array for both the cur and new values. So @p_dyn is actually
+ *		sized for 2 * @p_dyn_alloc_elems * @elem_size. Only valid if
+ *		@is_dyn_array is true.
+ * @cur:	Structure to store the current value.
+ * @cur.val:	The control's current value, if the @type is represented via
+ *		a u32 integer (see &enum v4l2_ctrl_type).
+ * @val:	The control's new s32 value.
  * @p_def:	The control's default value represented via a union which
  *		provides a standard way of accessing control types
  *		through a pointer (for compound controls only).
@@ -260,6 +271,7 @@ struct v4l2_ctrl {
 	unsigned int is_string:1;
 	unsigned int is_ptr:1;
 	unsigned int is_array:1;
+	unsigned int is_dyn_array:1;
 	unsigned int has_volatiles:1;
 	unsigned int call_notify:1;
 	unsigned int manual_mode_value:8;
@@ -272,6 +284,7 @@ struct v4l2_ctrl {
 	s64 minimum, maximum, default_value;
 	u32 elems;
 	u32 elem_size;
+	u32 new_elems;
 	u32 dims[V4L2_CTRL_MAX_DIMS];
 	u32 nr_of_dims;
 	union {
@@ -284,6 +297,8 @@ struct v4l2_ctrl {
 	};
 	unsigned long flags;
 	void *priv;
+	void *p_dyn;
+	u32 p_dyn_alloc_elems;
 	s32 val;
 	struct {
 		s32 val;
@@ -309,12 +324,22 @@ struct v4l2_ctrl {
  *		the control has been applied. This prevents applying controls
  *		from a cluster with multiple controls twice (when the first
  *		control of a cluster is applied, they all are).
- * @valid_p_req: If set, then p_req contains the control value for the request.
+ * @p_req_valid: If set, then p_req contains the control value for the request.
+ * @p_req_dyn_enomem: If set, then p_req is invalid since allocating space for
+ *		a dynamic array failed. Attempting to read this value shall
+ *		result in ENOMEM. Only valid if ctrl->is_dyn_array is true.
+ * @p_req_dyn_alloc_elems: The number of elements allocated for the dynamic
+ *		array. Only valid if @p_req_valid and ctrl->is_dyn_array are
+ *		true.
+ * @p_req_elems: The number of elements in @p_req. This is the same as
+ *		ctrl->elems, except for dynamic arrays. In that case it is in
+ *		the range of 1 to @p_req_dyn_alloc_elems. Only valid if
+ *		@p_req_valid is true.
  * @p_req:	If the control handler containing this control reference
  *		is bound to a media request, then this points to the
  *		value of the control that must be applied when the request
  *		is executed, or to the value of the control at the time
- *		that the request was completed. If @valid_p_req is false,
+ *		that the request was completed. If @p_req_valid is false,
  *		then this control was never set for this request and the
  *		control will not be updated when this request is applied.
  *
@@ -329,7 +354,10 @@ struct v4l2_ctrl_ref {
 	struct v4l2_ctrl_helper *helper;
 	bool from_other_dev;
 	bool req_done;
-	bool valid_p_req;
+	bool p_req_valid;
+	bool p_req_dyn_enomem;
+	u32 p_req_dyn_alloc_elems;
+	u32 p_req_elems;
 	union v4l2_ctrl_ptr p_req;
 };
 
-- 
2.35.1

