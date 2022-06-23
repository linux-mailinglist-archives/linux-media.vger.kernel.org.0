Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9585557DE5
	for <lists+linux-media@lfdr.de>; Thu, 23 Jun 2022 16:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbiFWOcm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jun 2022 10:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231922AbiFWOck (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jun 2022 10:32:40 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60050.outbound.protection.outlook.com [40.107.6.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E53FE4578F;
        Thu, 23 Jun 2022 07:32:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RyA5qKy4RZNhrpY2FVsLpq65caBkSFfIA1obzzgVQX6d5fSrsE7dE5QBqqqoS7PIT05dtfyK0D/t5NIMiN+grswbGI/TwyeIEf1eQeo9a24nvqQfXRj2CwDH5fKqj59eWlaHCankAZ5qDfYuH4VxjdjV5rRQlZxi42mEuMPhFNefFmrvgiOJtYtQsbyrpho2y7Xnnum3cVr69MfzYJpRcTTqxg8ORfiREOQxJXs8LGfnMo0bxMa7yZoDxYXjxivkxOMx1NRQsvLJBn4ly/d6V+z7o6NobRNDaj9vwTsLYTeihw0uKUAHf6ZDJ0DU1vcTMwRNYP9ozH6MOBLQkZvPwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fmGxDEt04njvwKMMNcP8XCQYF55GlfvOprSaEwf1L2o=;
 b=UpJ6R9cjxdv9RQ/HmaAM/EKJdGqadKoK7THcj2VctOZHvvRTpPuhHmOh/XF9IcrleFUxmjnQ6+U0EegCcXTz5XdYLUIRNHWuBFQlVs7l08Y3EDSFhTDMSxHB9DjjhgKWEM9VfKvwLOp0d7+MYUqjp+/OmYjbaK0BUX7t8WFXi3U6QhIkAKyvH29BAx51YA5SkZt0UJUF+1+UjfCD0GgVyWBBRa+VdvUzSMsVzTxyTpOf6DCCfEtFBFf8wHHc9j2sXMCX7raPy0xiU6y+mhE44cuxoL11nQfOQOoimXbRjqyhP5NJw+qE2vXCR0a5maD99aWVwrSOyJv24Fnog87Eww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fmGxDEt04njvwKMMNcP8XCQYF55GlfvOprSaEwf1L2o=;
 b=c3937Ug6mtJnE7MYGRDx4GKpBJkDEVqs8HK+uQIC27D8PB4KRTFgzSs39hKOM19xSoIRKbaXc70pGYBOreHzHTax0g508MeYEtrHcVscsuX0ucALAk35bmLDp2Ls3/w/9PO3cee9tujEO0xEgSqvNhj+Y7YxwcjH+tYIz1qZZqk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by VI1PR0401MB2288.eurprd04.prod.outlook.com (2603:10a6:800:28::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Thu, 23 Jun
 2022 14:32:33 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9127:3fe0:f694:9485%5]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 14:32:33 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 05/14] v4l2-ctrls: alloc arrays in ctrl_ref
Date:   Thu, 23 Jun 2022 16:31:06 +0200
Message-Id: <20220623143115.3185297-6-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623143115.3185297-1-xavier.roumegue@oss.nxp.com>
References: <20220623143115.3185297-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR2P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::14) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3b3404d-9569-4307-b67c-08da55253614
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2288:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2288FC90A74037E19FF19A68BAB59@VI1PR0401MB2288.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y1/XUa25vburSrduT0DewbmrY/ZIsggzlEb+FnqAIDs2PoQR8eXKg3Ob/78FtmUZ+kEEFcn2uDu6O2ONCZG4qQCat5I7tGOrgMSx+3Uvq6yXNarhpLDzSFzbhjB+9+J0ysmiKo9bWSVtuHBTrPjYN0n1vrU4u5uk55FdlBMqqTbXESxkAS6h/PT8tb/EJHRNbYmI9N2FgorSZks9BNGlzAJS+V6TFsJp8kdcoTgyoU2KjoTofGG8ueI35gnk6rMJdMoR2wfhXMFAPAihd6yLnWl+G/E60Rlo3suvZ+NMPrHuOKE7GexL1aVoMQ22lYwH/1I8HVLq9pdKYsc0atoaQQR123Pwb4Wxv920NbzhP5bzZGrdO5BbR8XLmZkgR1CD0IRz5/8BvliWL9ak4WwD120N+8HUzjIU3k5n7N5G0p0co+fX0v015qysbxToMyjWwtrMPLEoqrhLAJWM5/wyb8FIdsVHlvxV59TVEgfUoiROeE+Rw5S6+eG71LxNueWGFH/8wmJHjMThcGWBN7GV5t/TT/C3/qiZTzmDJUtdly/RYsioCgkvvLATx4D3RywdtDo9ymt0EqQokt9gtw6B/+iTU53l8YEOpGtmVBQY9k+Kzs78b6FlrgWhare9J+2Dfemiv7gMcY+B9rwD/9pOtlfAUcN1wWxwewL6txE/zLLtsXK1ab9KxJOA4l4k0V2Kf7YPf7jEBPc292/e1rC/kQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(366004)(396003)(39860400002)(52116002)(66476007)(4326008)(6506007)(86362001)(2616005)(38100700002)(6666004)(41300700001)(66556008)(8676002)(66946007)(2906002)(316002)(1076003)(44832011)(478600001)(8936002)(83380400001)(7416002)(6512007)(5660300002)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HQPrUcbJNjBSpBcEnaqs+o9U9V0+2B8mrohUEDfbii40ltoo+f7m9TvZQ0Sd?=
 =?us-ascii?Q?8OdqIO1VeEKliIdaa/vADnHzjJabAGGQJFhtN+WItu/h96Gf22HadqS06MGD?=
 =?us-ascii?Q?LmGK/n1UNNSPeXCsVA+NzTtDtnipVLVroSnfBOVnmxh3pBNCEK4xjqfmLEFv?=
 =?us-ascii?Q?MM4xZA5OSnpMipPvg40Zwr+t0FqJxKgVLE0c9E1npuVICBna0EaIl/4J7Y59?=
 =?us-ascii?Q?/tCtyK64bw5+OBBLVhVCCdNDMqV9r2slYfdJX/KDTgu/l+GdUVijVf7lkiTJ?=
 =?us-ascii?Q?15UnybtGx0in6SqU6EZZInS8V35QOhgv30pINrXqWwVoAPcitga2KOgx40+7?=
 =?us-ascii?Q?FWJhRCFtk4kJHq+KEuwpeFvpjDIBbMz2ddn2xUWGaQ+tOv0xyDJw6JJcKwDZ?=
 =?us-ascii?Q?LQnmdFRyMjlwCPk/yZ4IFlgGYLESzXRDi2JR39IuxByCm61iu1x0N5z/3V0b?=
 =?us-ascii?Q?Q7tefrfdsqL2SCxbhkdoYMoiyrpE1xKDE9+TVK4i8NCCXgHeSrqLKcrHOqfj?=
 =?us-ascii?Q?yV8FXDCIm5MLTHp8n3l+mnthtno/tZwnxgf/lkqCy8g1aKUHssR/s5NdIdLj?=
 =?us-ascii?Q?VXoVXmNypo9jP/tlsH+K8qw4NngtAhwdzRdecJYLgnpNnGCD3HZ6v3BWoTxH?=
 =?us-ascii?Q?ba3WMzUgTqAcfL1FW+4YLh0wB7xo7+sn66eRAVXyrvue5WAPNdo2twTxJOBV?=
 =?us-ascii?Q?B9ZmGfn84xKSkzNdKVsZHWnOnVxybeDSavFZJYmdi/YHrfg6SS16ASaf5LjV?=
 =?us-ascii?Q?9zgLIPHUcVqenKPaRwwvb6i0dpmV/l2Kl+tkfg9eh8S1l20J6zsNK1Iwdp2J?=
 =?us-ascii?Q?RSk56xUqmkPQt62mLX1sfltpqxAXvgwfLlLuLTDeC8bzNWW2RG+f+4VftSMJ?=
 =?us-ascii?Q?xEUyWhWUqWitcKCaI4ISWOiIoxhrw1CY0jZKuk8wJuDbMuSbRVRvCLqxTM07?=
 =?us-ascii?Q?g4nsv18SIi+SlWc+ck49oEHZpcYMIsJuU7rDPcKZyrny9YWIglTRJQD0NkiD?=
 =?us-ascii?Q?c4rGfdyhAkPjXuQXzt65GTWfZwEEtwiT5bvFhasMU8oPt6FIPr4ncQiO9v75?=
 =?us-ascii?Q?X1YwzPZpyvTAAKhHGRbYCV/IbjsDPviZXCQsRTOuCcGFHdNZl51rSGxpO6Pm?=
 =?us-ascii?Q?gwbX5L0lB6FzE/Q/v3Lh+DD+fYkyIjVL6akTTxNfkEVBhuLnJZiViZ8XQFGU?=
 =?us-ascii?Q?D65MU7KrYxNmofvr4enH0lePipbQdeTSdJaDpeQ+rNCMIGuPNzbgDdfgAVtf?=
 =?us-ascii?Q?6cPCGNWNVh+EmRIuvoOIYRESZu+uO+Dit+n4x3z+NCgQn+CeGyDN20AM+eX9?=
 =?us-ascii?Q?I6/DdrtabzYxaQA+IBoY54h56KtFjonXIZ50l90zmk5S/kAn6pMV+XpV2G/X?=
 =?us-ascii?Q?CxzsFEs9RyXLfaL0M8A1g1y1FR5836TAPMiDkUor+Ic8fHWjJaaUDxvE3f/n?=
 =?us-ascii?Q?khc9rR5r5Mpmw6orU5pepotzs21JWi+5SsWltOcsIHiMptm7pmuo2j51Z1Ot?=
 =?us-ascii?Q?zD5SjFiVBfAlN9IR15PVL82Nal2dBok09mSuhf16k+sDlJZLyKi25pQ62eMD?=
 =?us-ascii?Q?sQ+MKLJJ8RY65zJkf7CNdF2Krjb92bkmzNOJ+7977chYLM0Fq9fs4lKxsCv9?=
 =?us-ascii?Q?0tIYT+ZqzWQwPiQucdSQeX3JbPgUBeld/eWiQrs5Vqd1Pg25oG90Lq75dwSf?=
 =?us-ascii?Q?2Pq0KIuYq0mD1YEHg7jCOIdxrGT1zw3F/LwzjmOVOcJaQYm/Fkgzu1hPbfhD?=
 =?us-ascii?Q?K3pHsaRoP/RWGyypWmJ+qwRY1rFPGrUUMMlXtb6MeQhyGBseXmpPLR/Ws2Cl?=
X-MS-Exchange-AntiSpam-MessageData-1: TjuAiO3RCMEYtYlWUZlmp22t9cyYoZvrpkg=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b3404d-9569-4307-b67c-08da55253614
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 14:32:33.6761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7j7wzru3TjatlrqbUF5yBS6/b9t9QwxEZE9gLpaC+gWFCFifWgl6J40kdRC6N2jKLkFhzjVpXPUXWRVBSbcxHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2288
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/v4l2-core/v4l2-ctrls-api.c  |  2 +-
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 31 ++++++++++++++---------
 include/media/v4l2-ctrls.h                | 16 ++++++------
 3 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 1b90bd7c4010..6f1b72c59e8e 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -467,7 +467,7 @@ int v4l2_g_ext_ctrls_common(struct v4l2_ctrl_handler *hdl,
 
 			if (is_default)
 				ret = def_to_user(cs->controls + idx, ref->ctrl);
-			else if (is_request && ref->p_req_dyn_enomem)
+			else if (is_request && ref->p_req_array_enomem)
 				ret = -ENOMEM;
 			else if (is_request && ref->p_req_valid)
 				ret = req_to_user(cs->controls + idx, ref);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 1372b7b45681..38030a7cb233 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1048,23 +1048,26 @@ void cur_to_new(struct v4l2_ctrl *ctrl)
 	ptr_to_ptr(ctrl, ctrl->p_cur, ctrl->p_new, ctrl->new_elems);
 }
 
-static bool req_alloc_dyn_array(struct v4l2_ctrl_ref *ref, u32 elems)
+static bool req_alloc_array(struct v4l2_ctrl_ref *ref, u32 elems)
 {
 	void *tmp;
 
-	if (elems < ref->p_req_dyn_alloc_elems)
+	if (elems == ref->p_req_array_alloc_elems)
+		return true;
+	if (ref->ctrl->is_dyn_array &&
+	    elems < ref->p_req_array_alloc_elems)
 		return true;
 
 	tmp = kvmalloc(elems * ref->ctrl->elem_size, GFP_KERNEL);
 
 	if (!tmp) {
-		ref->p_req_dyn_enomem = true;
+		ref->p_req_array_enomem = true;
 		return false;
 	}
-	ref->p_req_dyn_enomem = false;
+	ref->p_req_array_enomem = false;
 	kvfree(ref->p_req.p);
 	ref->p_req.p = tmp;
-	ref->p_req_dyn_alloc_elems = elems;
+	ref->p_req_array_alloc_elems = elems;
 	return true;
 }
 
@@ -1077,7 +1080,7 @@ void new_to_req(struct v4l2_ctrl_ref *ref)
 		return;
 
 	ctrl = ref->ctrl;
-	if (ctrl->is_dyn_array && !req_alloc_dyn_array(ref, ctrl->new_elems))
+	if (ctrl->is_array && !req_alloc_array(ref, ctrl->new_elems))
 		return;
 
 	ref->p_req_elems = ctrl->new_elems;
@@ -1094,7 +1097,7 @@ void cur_to_req(struct v4l2_ctrl_ref *ref)
 		return;
 
 	ctrl = ref->ctrl;
-	if (ctrl->is_dyn_array && !req_alloc_dyn_array(ref, ctrl->elems))
+	if (ctrl->is_array && !req_alloc_array(ref, ctrl->elems))
 		return;
 
 	ref->p_req_elems = ctrl->elems;
@@ -1123,14 +1126,18 @@ int req_to_new(struct v4l2_ctrl_ref *ref)
 		return 0;
 	}
 
-	/* Not a dynamic array, so just copy the request value */
-	if (!ctrl->is_dyn_array) {
+	/* Not an array, so just copy the request value */
+	if (!ctrl->is_array) {
 		ptr_to_ptr(ctrl, ref->p_req, ctrl->p_new, ctrl->new_elems);
 		return 0;
 	}
 
 	/* Sanity check, should never happen */
-	if (WARN_ON(!ref->p_req_dyn_alloc_elems))
+	if (WARN_ON(!ref->p_req_array_alloc_elems))
+		return -ENOMEM;
+
+	if (!ctrl->is_dyn_array &&
+	    ref->p_req_elems != ctrl->p_array_alloc_elems)
 		return -ENOMEM;
 
 	/*
@@ -1243,7 +1250,7 @@ void v4l2_ctrl_handler_free(struct v4l2_ctrl_handler *hdl)
 	/* Free all nodes */
 	list_for_each_entry_safe(ref, next_ref, &hdl->ctrl_refs, node) {
 		list_del(&ref->node);
-		if (ref->p_req_dyn_alloc_elems)
+		if (ref->p_req_array_alloc_elems)
 			kvfree(ref->p_req.p);
 		kfree(ref);
 	}
@@ -1368,7 +1375,7 @@ int handler_new_ref(struct v4l2_ctrl_handler *hdl,
 	if (hdl->error)
 		return hdl->error;
 
-	if (allocate_req && !ctrl->is_dyn_array)
+	if (allocate_req && !ctrl->is_array)
 		size_extra_req = ctrl->elems * ctrl->elem_size;
 	new_ref = kzalloc(sizeof(*new_ref) + size_extra_req, GFP_KERNEL);
 	if (!new_ref)
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index a2f147873265..e0f32e8b886a 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -324,15 +324,15 @@ struct v4l2_ctrl {
  *		from a cluster with multiple controls twice (when the first
  *		control of a cluster is applied, they all are).
  * @p_req_valid: If set, then p_req contains the control value for the request.
- * @p_req_dyn_enomem: If set, then p_req is invalid since allocating space for
- *		a dynamic array failed. Attempting to read this value shall
- *		result in ENOMEM. Only valid if ctrl->is_dyn_array is true.
- * @p_req_dyn_alloc_elems: The number of elements allocated for the dynamic
- *		array. Only valid if @p_req_valid and ctrl->is_dyn_array are
+ * @p_req_array_enomem: If set, then p_req is invalid since allocating space for
+ *		an array failed. Attempting to read this value shall
+ *		result in ENOMEM. Only valid if ctrl->is_array is true.
+ * @p_req_array_alloc_elems: The number of elements allocated for the
+ *		array. Only valid if @p_req_valid and ctrl->is_array are
  *		true.
  * @p_req_elems: The number of elements in @p_req. This is the same as
  *		ctrl->elems, except for dynamic arrays. In that case it is in
- *		the range of 1 to @p_req_dyn_alloc_elems. Only valid if
+ *		the range of 1 to @p_req_array_alloc_elems. Only valid if
  *		@p_req_valid is true.
  * @p_req:	If the control handler containing this control reference
  *		is bound to a media request, then this points to the
@@ -354,8 +354,8 @@ struct v4l2_ctrl_ref {
 	bool from_other_dev;
 	bool req_done;
 	bool p_req_valid;
-	bool p_req_dyn_enomem;
-	u32 p_req_dyn_alloc_elems;
+	bool p_req_array_enomem;
+	u32 p_req_array_alloc_elems;
 	u32 p_req_elems;
 	union v4l2_ctrl_ptr p_req;
 };
-- 
2.36.1

