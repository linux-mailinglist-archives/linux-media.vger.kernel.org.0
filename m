Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94144766E30
	for <lists+linux-media@lfdr.de>; Fri, 28 Jul 2023 15:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236758AbjG1N0T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jul 2023 09:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234277AbjG1N0G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jul 2023 09:26:06 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B6544483;
        Fri, 28 Jul 2023 06:25:51 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36S9Kvwj008893;
        Fri, 28 Jul 2023 13:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=tI8WQiJsc3snSCqoYqTYhp9DaiBIcpXw30eJ4gxkENw=;
 b=JF8iePRd7nkSd1oFJqhCbPRAKDOqTVh7PoZF61YjcR0BGbW7XM8qa6apY963LUQUqtgm
 GavePD2pZQMj97nQRTfvBRZIQGr/z5+mViQK1NVQcjZcEGf4jNCX/ebba3amayrH3ZaJ
 OvDfZqIasUMPQSpD5UWpgntDzX773dxCcziuhfnTaI9xmrGG2V/78mNqj//cta8Pge+k
 FzrxEtWXMEnvy6h3ylpvBi36UHYZ3MHCVlhMkpEOoTwz+p61g3VV1/1uQXkobjRRfube
 ksSB5iNl34eYe/2LXln8dFdWJnMK5W372LOMhRCyCXprbMPYC+DFZvJTg7JgMQyFw8o+ nA== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s447kh7td-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Jul 2023 13:25:42 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36SDPgMe002901
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 28 Jul 2023 13:25:42 GMT
Received: from hu-vgarodia-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 28 Jul 2023 06:25:38 -0700
From:   Vikash Garodia <quic_vgarodia@quicinc.com>
To:     <stanimir.k.varbanov@gmail.com>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mchehab@kernel.org>, <hans.verkuil@cisco.com>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
CC:     <quic_dikshita@quicinc.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>
Subject: [PATCH 09/33] iris: vidc: add control files
Date:   Fri, 28 Jul 2023 18:53:20 +0530
Message-ID: <1690550624-14642-10-git-send-email-quic_vgarodia@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com>
References: <1690550624-14642-1-git-send-email-quic_vgarodia@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3BQuUU7g_UxNy4uQga8ZNF_Hp8PqPr7X
X-Proofpoint-GUID: 3BQuUU7g_UxNy4uQga8ZNF_Hp8PqPr7X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307280124
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This implements supported v4l2 encoder and decoder controls.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
---
 .../platform/qcom/iris/vidc/inc/msm_vidc_control.h |  26 +
 .../platform/qcom/iris/vidc/src/msm_vidc_control.c | 824 +++++++++++++++++++++
 2 files changed, 850 insertions(+)
 create mode 100644 drivers/media/platform/qcom/iris/vidc/inc/msm_vidc_control.h
 create mode 100644 drivers/media/platform/qcom/iris/vidc/src/msm_vidc_control.c

diff --git a/drivers/media/platform/qcom/iris/vidc/inc/msm_vidc_control.h b/drivers/media/platform/qcom/iris/vidc/inc/msm_vidc_control.h
new file mode 100644
index 0000000..08ba77d
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/vidc/inc/msm_vidc_control.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _MSM_VIDC_CONTROL_H_
+#define _MSM_VIDC_CONTROL_H_
+
+#include "msm_vidc_inst.h"
+#include "msm_vidc_internal.h"
+
+int msm_vidc_ctrl_handler_init(struct msm_vidc_inst *inst, bool init);
+int msm_vidc_ctrl_handler_deinit(struct msm_vidc_inst *inst);
+int msm_v4l2_op_s_ctrl(struct v4l2_ctrl *ctrl);
+int msm_v4l2_op_g_volatile_ctrl(struct v4l2_ctrl *ctrl);
+int msm_vidc_s_ctrl(struct msm_vidc_inst *inst, struct v4l2_ctrl *ctrl);
+int msm_vidc_prepare_dependency_list(struct msm_vidc_inst *inst);
+int msm_vidc_adjust_v4l2_properties(struct msm_vidc_inst *inst);
+int msm_vidc_set_v4l2_properties(struct msm_vidc_inst *inst);
+bool is_valid_cap_id(enum msm_vidc_inst_capability_type cap_id);
+bool is_valid_cap(struct msm_vidc_inst *inst,
+		  enum msm_vidc_inst_capability_type cap_id);
+enum msm_vidc_inst_capability_type msm_vidc_get_cap_id(struct msm_vidc_inst *inst,
+						       u32 id);
+#endif
diff --git a/drivers/media/platform/qcom/iris/vidc/src/msm_vidc_control.c b/drivers/media/platform/qcom/iris/vidc/src/msm_vidc_control.c
new file mode 100644
index 0000000..73b0db6
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/vidc/src/msm_vidc_control.c
@@ -0,0 +1,824 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "msm_venc.h"
+#include "msm_vidc_debug.h"
+#include "msm_vidc_driver.h"
+#include "msm_vidc_internal.h"
+#include "msm_vidc_platform.h"
+
+static inline bool has_children(struct msm_vidc_inst_cap *cap)
+{
+	return !!cap->children[0];
+}
+
+static inline bool is_leaf(struct msm_vidc_inst_cap *cap)
+{
+	return !has_children(cap);
+}
+
+bool is_valid_cap_id(enum msm_vidc_inst_capability_type cap_id)
+{
+	return cap_id > INST_CAP_NONE && cap_id < INST_CAP_MAX;
+}
+
+bool is_valid_cap(struct msm_vidc_inst *inst,
+		  enum msm_vidc_inst_capability_type cap_id)
+{
+	if (cap_id <= INST_CAP_NONE || cap_id >= INST_CAP_MAX)
+		return false;
+
+	return !!inst->capabilities[cap_id].cap_id;
+}
+
+static inline bool is_all_childrens_visited(struct msm_vidc_inst_cap *cap,
+					    bool lookup[INST_CAP_MAX])
+{
+	bool found = true;
+	int i;
+
+	for (i = 0; i < MAX_CAP_CHILDREN; i++) {
+		if (cap->children[i] == INST_CAP_NONE)
+			continue;
+
+		if (!lookup[cap->children[i]]) {
+			found = false;
+			break;
+		}
+	}
+	return found;
+}
+
+static int add_node_list(struct list_head *list, enum msm_vidc_inst_capability_type cap_id)
+{
+	struct msm_vidc_inst_cap_entry *entry = NULL;
+
+	entry = vzalloc(sizeof(*entry));
+	if (!entry) {
+		d_vpr_e("%s: allocation failed\n", __func__);
+		return -ENOMEM;
+	}
+
+	INIT_LIST_HEAD(&entry->list);
+	entry->cap_id = cap_id;
+	list_add(&entry->list, list);
+
+	return 0;
+}
+
+static int add_node(struct list_head *list, struct msm_vidc_inst_cap *lcap,
+		    bool lookup[INST_CAP_MAX])
+{
+	int rc = 0;
+
+	if (lookup[lcap->cap_id])
+		return 0;
+
+	rc = add_node_list(list, lcap->cap_id);
+	if (rc)
+		return rc;
+
+	lookup[lcap->cap_id] = true;
+	return 0;
+}
+
+static int msm_vidc_add_capid_to_fw_list(struct msm_vidc_inst *inst,
+					 enum msm_vidc_inst_capability_type cap_id)
+{
+	struct msm_vidc_inst_cap_entry *entry = NULL;
+	int rc = 0;
+
+	/* skip adding if cap_id already present in firmware list */
+	list_for_each_entry(entry, &inst->firmware_list, list) {
+		if (entry->cap_id == cap_id) {
+			i_vpr_l(inst,
+				"%s: cap[%d] %s already present in fw list\n",
+				__func__, cap_id, cap_name(cap_id));
+			return 0;
+		}
+	}
+
+	rc = add_node_list(&inst->firmware_list, cap_id);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static int msm_vidc_add_children(struct msm_vidc_inst *inst,
+				 enum msm_vidc_inst_capability_type cap_id)
+{
+	struct msm_vidc_inst_cap *cap;
+	int i, rc = 0;
+
+	cap = &inst->capabilities[cap_id];
+
+	for (i = 0; i < MAX_CAP_CHILDREN; i++) {
+		if (!cap->children[i])
+			break;
+
+		if (!is_valid_cap_id(cap->children[i]))
+			continue;
+
+		rc = add_node_list(&inst->children_list, cap->children[i]);
+		if (rc)
+			return rc;
+	}
+
+	return rc;
+}
+
+static int msm_vidc_adjust_cap(struct msm_vidc_inst *inst,
+			       enum msm_vidc_inst_capability_type cap_id,
+			       struct v4l2_ctrl *ctrl, const char *func)
+{
+	struct msm_vidc_inst_cap *cap;
+	int rc = 0;
+
+	/* validate cap_id */
+	if (!is_valid_cap_id(cap_id))
+		return 0;
+
+	/* validate cap */
+	cap = &inst->capabilities[cap_id];
+	if (!is_valid_cap(inst, cap->cap_id))
+		return 0;
+
+	/* check if adjust supported */
+	if (!cap->adjust) {
+		if (ctrl)
+			msm_vidc_update_cap_value(inst, cap_id, ctrl->val, func);
+		return 0;
+	}
+
+	/* call adjust */
+	rc = cap->adjust(inst, ctrl);
+	if (rc) {
+		i_vpr_e(inst, "%s: adjust cap failed for %s\n", func, cap_name(cap_id));
+		return rc;
+	}
+
+	return rc;
+}
+
+static int msm_vidc_set_cap(struct msm_vidc_inst *inst,
+			    enum msm_vidc_inst_capability_type cap_id,
+			    const char *func)
+{
+	struct msm_vidc_inst_cap *cap;
+	int rc = 0;
+
+	/* validate cap_id */
+	if (!is_valid_cap_id(cap_id))
+		return 0;
+
+	/* validate cap */
+	cap = &inst->capabilities[cap_id];
+	if (!is_valid_cap(inst, cap->cap_id))
+		return 0;
+
+	/* check if set supported */
+	if (!cap->set)
+		return 0;
+
+	/* call set */
+	rc = cap->set(inst, cap_id);
+	if (rc) {
+		i_vpr_e(inst, "%s: set cap failed for %s\n", func, cap_name(cap_id));
+		return rc;
+	}
+
+	return rc;
+}
+
+static int msm_vidc_adjust_dynamic_property(struct msm_vidc_inst *inst,
+					    enum msm_vidc_inst_capability_type cap_id,
+					    struct v4l2_ctrl *ctrl)
+{
+	struct msm_vidc_inst_cap_entry *entry = NULL, *temp = NULL;
+	struct msm_vidc_inst_cap *cap;
+	s32 prev_value;
+	int rc = 0;
+
+	cap = &inst->capabilities[0];
+
+	/* sanitize cap_id */
+	if (!is_valid_cap_id(cap_id)) {
+		i_vpr_e(inst, "%s: invalid cap_id %u\n", __func__, cap_id);
+		return -EINVAL;
+	}
+
+	if (!(cap[cap_id].flags & CAP_FLAG_DYNAMIC_ALLOWED)) {
+		i_vpr_h(inst,
+			"%s: dynamic setting of cap[%d] %s is not allowed\n",
+			__func__, cap_id, cap_name(cap_id));
+		return -EBUSY;
+	}
+	i_vpr_h(inst, "%s: cap[%d] %s\n", __func__, cap_id, cap_name(cap_id));
+
+	prev_value = cap[cap_id].value;
+	rc = msm_vidc_adjust_cap(inst, cap_id, ctrl, __func__);
+	if (rc)
+		return rc;
+
+	if (cap[cap_id].value == prev_value && cap_id == GOP_SIZE) {
+		/*
+		 * Ignore setting same GOP size value to firmware to avoid
+		 * unnecessary generation of IDR frame.
+		 */
+		return 0;
+	}
+
+	/* add cap_id to firmware list always */
+	rc = msm_vidc_add_capid_to_fw_list(inst, cap_id);
+	if (rc)
+		goto error;
+
+	/* add children only if cap value modified */
+	if (cap[cap_id].value == prev_value)
+		return 0;
+
+	rc = msm_vidc_add_children(inst, cap_id);
+	if (rc)
+		goto error;
+
+	list_for_each_entry_safe(entry, temp, &inst->children_list, list) {
+		if (!is_valid_cap_id(entry->cap_id)) {
+			rc = -EINVAL;
+			goto error;
+		}
+
+		if (!cap[entry->cap_id].adjust) {
+			i_vpr_e(inst, "%s: child cap must have ajdust function %s\n",
+				__func__, cap_name(entry->cap_id));
+			rc = -EINVAL;
+			goto error;
+		}
+
+		prev_value = cap[entry->cap_id].value;
+		rc = msm_vidc_adjust_cap(inst, entry->cap_id, NULL, __func__);
+		if (rc)
+			goto error;
+
+		/* add children if cap value modified */
+		if (cap[entry->cap_id].value != prev_value) {
+			/* add cap_id to firmware list always */
+			rc = msm_vidc_add_capid_to_fw_list(inst, entry->cap_id);
+			if (rc)
+				goto error;
+
+			rc = msm_vidc_add_children(inst, entry->cap_id);
+			if (rc)
+				goto error;
+		}
+
+		list_del_init(&entry->list);
+		vfree(entry);
+	}
+
+	/* expecting children_list to be empty */
+	if (!list_empty(&inst->children_list)) {
+		i_vpr_e(inst, "%s: child_list is not empty\n", __func__);
+		rc = -EINVAL;
+		goto error;
+	}
+
+	return 0;
+error:
+	list_for_each_entry_safe(entry, temp, &inst->children_list, list) {
+		i_vpr_e(inst, "%s: child list: %s\n", __func__, cap_name(entry->cap_id));
+		list_del_init(&entry->list);
+		vfree(entry);
+	}
+	list_for_each_entry_safe(entry, temp, &inst->firmware_list, list) {
+		i_vpr_e(inst, "%s: fw list: %s\n", __func__, cap_name(entry->cap_id));
+		list_del_init(&entry->list);
+		vfree(entry);
+	}
+
+	return rc;
+}
+
+static int msm_vidc_set_dynamic_property(struct msm_vidc_inst *inst)
+{
+	struct msm_vidc_inst_cap_entry *entry = NULL, *temp = NULL;
+	int rc = 0;
+
+	list_for_each_entry_safe(entry, temp, &inst->firmware_list, list) {
+		rc = msm_vidc_set_cap(inst, entry->cap_id, __func__);
+		if (rc)
+			goto error;
+
+		list_del_init(&entry->list);
+		vfree(entry);
+	}
+
+	return 0;
+error:
+	list_for_each_entry_safe(entry, temp, &inst->firmware_list, list) {
+		i_vpr_e(inst, "%s: fw list: %s\n", __func__, cap_name(entry->cap_id));
+		list_del_init(&entry->list);
+		vfree(entry);
+	}
+
+	return rc;
+}
+
+int msm_vidc_ctrl_handler_deinit(struct msm_vidc_inst *inst)
+{
+	i_vpr_h(inst, "%s(): num ctrls %d\n", __func__, inst->num_ctrls);
+	v4l2_ctrl_handler_free(&inst->ctrl_handler);
+	memset(&inst->ctrl_handler, 0, sizeof(struct v4l2_ctrl_handler));
+
+	return 0;
+}
+
+int msm_vidc_ctrl_handler_init(struct msm_vidc_inst *inst, bool init)
+{
+	int rc = 0;
+	struct msm_vidc_inst_cap *cap;
+	struct msm_vidc_core *core;
+	int idx = 0;
+	struct v4l2_ctrl_config ctrl_cfg = {0};
+	int num_ctrls = 0, ctrl_idx = 0;
+	u64 codecs_count, step_or_mask;
+
+	core = inst->core;
+	cap = &inst->capabilities[0];
+
+	if (!core->v4l2_ctrl_ops) {
+		i_vpr_e(inst, "%s: no control ops\n", __func__);
+		return -EINVAL;
+	}
+
+	for (idx = 0; idx < INST_CAP_MAX; idx++) {
+		if (cap[idx].v4l2_id)
+			num_ctrls++;
+	}
+	if (!num_ctrls) {
+		i_vpr_e(inst, "%s: no ctrls available in cap database\n",
+			__func__);
+		return -EINVAL;
+	}
+
+	if (init) {
+		codecs_count = is_encode_session(inst) ?
+			core->enc_codecs_count :
+			core->dec_codecs_count;
+		rc = v4l2_ctrl_handler_init(&inst->ctrl_handler,
+					    INST_CAP_MAX * codecs_count);
+		if (rc) {
+			i_vpr_e(inst, "control handler init failed, %d\n",
+				inst->ctrl_handler.error);
+			goto error;
+		}
+	}
+
+	for (idx = 0; idx < INST_CAP_MAX; idx++) {
+		struct v4l2_ctrl *ctrl;
+
+		if (!cap[idx].v4l2_id)
+			continue;
+
+		if (ctrl_idx >= num_ctrls) {
+			i_vpr_e(inst,
+				"%s: invalid ctrl %#x, max allowed %d\n",
+				__func__, cap[idx].v4l2_id,
+				num_ctrls);
+			rc = -EINVAL;
+			goto error;
+		}
+		i_vpr_l(inst,
+			"%s: cap[%d] %24s, value %d min %d max %d step_or_mask %#x flags %#x v4l2_id %#x hfi_id %#x\n",
+			__func__, idx, cap_name(idx),
+			cap[idx].value,
+			cap[idx].min,
+			cap[idx].max,
+			cap[idx].step_or_mask,
+			cap[idx].flags,
+			cap[idx].v4l2_id,
+			cap[idx].hfi_id);
+
+		memset(&ctrl_cfg, 0, sizeof(struct v4l2_ctrl_config));
+
+		/*
+		 * few controls might have been already initialized in instance initialization,
+		 * so modify the range values for them instead of initializing them again
+		 */
+		if (!init) {
+			struct msm_vidc_ctrl_data ctrl_priv_data;
+
+			ctrl = v4l2_ctrl_find(&inst->ctrl_handler, cap[idx].v4l2_id);
+			if (ctrl) {
+				step_or_mask = (cap[idx].flags & CAP_FLAG_MENU) ?
+					~(cap[idx].step_or_mask) :
+					cap[idx].step_or_mask;
+				memset(&ctrl_priv_data, 0, sizeof(struct msm_vidc_ctrl_data));
+				ctrl_priv_data.skip_s_ctrl = true;
+				ctrl->priv = &ctrl_priv_data;
+				v4l2_ctrl_modify_range(ctrl,
+						       cap[idx].min,
+						       cap[idx].max,
+						       step_or_mask,
+						       cap[idx].value);
+				/* reset private data to null to ensure s_ctrl not skipped */
+				ctrl->priv = NULL;
+				continue;
+			}
+		}
+
+		if (cap[idx].flags & CAP_FLAG_MENU) {
+			ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler,
+						      core->v4l2_ctrl_ops,
+						      cap[idx].v4l2_id,
+						      cap[idx].max,
+						      ~(cap[idx].step_or_mask),
+						      cap[idx].value);
+		} else {
+			ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler,
+						 core->v4l2_ctrl_ops,
+						 cap[idx].v4l2_id,
+						 cap[idx].min,
+						 cap[idx].max,
+						 cap[idx].step_or_mask,
+						 cap[idx].value);
+		}
+		if (!ctrl) {
+			i_vpr_e(inst, "%s: invalid ctrl %#x cap %24s\n", __func__,
+				cap[idx].v4l2_id, cap_name(idx));
+			rc = -EINVAL;
+			goto error;
+		}
+
+		rc = inst->ctrl_handler.error;
+		if (rc) {
+			i_vpr_e(inst,
+				"error adding ctrl (%#x) to ctrl handle, %d\n",
+				cap[idx].v4l2_id,
+				inst->ctrl_handler.error);
+			goto error;
+		}
+
+		if (cap[idx].flags & CAP_FLAG_VOLATILE)
+			ctrl->flags |= V4L2_CTRL_FLAG_VOLATILE;
+
+		ctrl->flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
+		ctrl_idx++;
+	}
+	inst->num_ctrls = num_ctrls;
+	i_vpr_h(inst, "%s(): num ctrls %d\n", __func__, inst->num_ctrls);
+
+	return 0;
+error:
+	msm_vidc_ctrl_handler_deinit(inst);
+
+	return rc;
+}
+
+static int
+msm_vidc_update_buffer_count_if_needed(struct msm_vidc_inst *inst,
+				       enum msm_vidc_inst_capability_type cap_id)
+{
+	int rc = 0;
+	bool update_input_port = false, update_output_port = false;
+
+	switch (cap_id) {
+	case LAYER_TYPE:
+	case ENH_LAYER_COUNT:
+	case LAYER_ENABLE:
+		update_input_port = true;
+		break;
+	default:
+		update_input_port = false;
+		update_output_port = false;
+		break;
+	}
+
+	if (update_input_port) {
+		rc = msm_vidc_update_buffer_count(inst, INPUT_PORT);
+		if (rc)
+			return rc;
+	}
+	if (update_output_port) {
+		rc = msm_vidc_update_buffer_count(inst, OUTPUT_PORT);
+		if (rc)
+			return rc;
+	}
+
+	return rc;
+}
+
+int msm_v4l2_op_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
+{
+	int rc = 0;
+	struct msm_vidc_inst *inst;
+
+	if (!ctrl) {
+		d_vpr_e("%s: invalid ctrl parameter\n", __func__);
+		return -EINVAL;
+	}
+
+	inst = container_of(ctrl->handler,
+			    struct msm_vidc_inst, ctrl_handler);
+	inst = get_inst_ref(g_core, inst);
+	if (!inst) {
+		d_vpr_e("%s: could not find inst for ctrl %s id %#x\n",
+			__func__, ctrl->name, ctrl->id);
+		return -EINVAL;
+	}
+	client_lock(inst, __func__);
+	inst_lock(inst, __func__);
+
+	rc = msm_vidc_get_control(inst, ctrl);
+	if (rc) {
+		i_vpr_e(inst, "%s: failed for ctrl %s id %#x\n",
+			__func__, ctrl->name, ctrl->id);
+		goto unlock;
+	} else {
+		i_vpr_h(inst, "%s: ctrl %s id %#x, value %d\n",
+			__func__, ctrl->name, ctrl->id, ctrl->val);
+	}
+
+unlock:
+	inst_unlock(inst, __func__);
+	client_unlock(inst, __func__);
+	put_inst(inst);
+	return rc;
+}
+
+static int
+msm_vidc_update_static_property(struct msm_vidc_inst *inst,
+				enum msm_vidc_inst_capability_type cap_id,
+				struct v4l2_ctrl *ctrl)
+{
+	int rc = 0;
+
+	/* update value to db */
+	msm_vidc_update_cap_value(inst, cap_id, ctrl->val, __func__);
+
+	if (cap_id == ROTATION) {
+		struct v4l2_format *output_fmt;
+
+		output_fmt = &inst->fmts[OUTPUT_PORT];
+		rc = msm_venc_s_fmt_output(inst, output_fmt);
+		if (rc)
+			return rc;
+	}
+
+	if (cap_id == BITSTREAM_SIZE_OVERWRITE) {
+		rc = msm_vidc_update_bitstream_buffer_size(inst);
+		if (rc)
+			return rc;
+	}
+
+	if (cap_id == ENH_LAYER_COUNT && inst->codec == MSM_VIDC_HEVC) {
+		u32 enable;
+
+		/* enable LAYER_ENABLE cap if HEVC_HIER enh layers > 0 */
+		if (ctrl->val > 0)
+			enable = 1;
+		else
+			enable = 0;
+
+		msm_vidc_update_cap_value(inst, LAYER_ENABLE, enable, __func__);
+	}
+
+	rc = msm_vidc_update_buffer_count_if_needed(inst, cap_id);
+
+	return rc;
+}
+
+int msm_vidc_s_ctrl(struct msm_vidc_inst *inst, struct v4l2_ctrl *ctrl)
+{
+	enum msm_vidc_inst_capability_type cap_id;
+	struct msm_vidc_inst_cap *cap;
+	int rc = 0;
+	u32 port;
+
+	cap = &inst->capabilities[0];
+
+	i_vpr_h(inst, FMT_STRING_SET_CTRL,
+		__func__, state_name(inst->state), ctrl->name, ctrl->id, ctrl->val);
+
+	cap_id = msm_vidc_get_cap_id(inst, ctrl->id);
+	if (!is_valid_cap_id(cap_id)) {
+		i_vpr_e(inst, "%s: invalid cap_id for ctrl %s\n", __func__, ctrl->name);
+		return -EINVAL;
+	}
+
+	/* mark client set flag */
+	cap[cap_id].flags |= CAP_FLAG_CLIENT_SET;
+
+	port = is_encode_session(inst) ? OUTPUT_PORT : INPUT_PORT;
+	if (!inst->bufq[port].vb2q->streaming) {
+		/* static case */
+		rc = msm_vidc_update_static_property(inst, cap_id, ctrl);
+		if (rc)
+			return rc;
+	} else {
+		/* dynamic case */
+		rc = msm_vidc_adjust_dynamic_property(inst, cap_id, ctrl);
+		if (rc)
+			return rc;
+
+		rc = msm_vidc_set_dynamic_property(inst);
+		if (rc)
+			return rc;
+	}
+
+	return rc;
+}
+
+int msm_v4l2_op_s_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct msm_vidc_inst *inst;
+	struct msm_vidc_ctrl_data *priv_ctrl_data;
+	int rc = 0;
+
+	if (!ctrl) {
+		d_vpr_e("%s: invalid ctrl parameter\n", __func__);
+		return -EINVAL;
+	}
+
+	/*
+	 * v4l2_ctrl_modify_range may internally call s_ctrl
+	 * which will again try to acquire lock leading to deadlock,
+	 * Add check to avoid such scenario.
+	 */
+	priv_ctrl_data = ctrl->priv ? ctrl->priv : NULL;
+	if (priv_ctrl_data && priv_ctrl_data->skip_s_ctrl) {
+		d_vpr_l("%s: skip s_ctrl (%s)\n", __func__, ctrl->name);
+		return 0;
+	}
+
+	inst = container_of(ctrl->handler, struct msm_vidc_inst, ctrl_handler);
+	inst = get_inst_ref(g_core, inst);
+	if (!inst) {
+		d_vpr_e("%s: invalid instance\n", __func__);
+		return -EINVAL;
+	}
+
+	client_lock(inst, __func__);
+	inst_lock(inst, __func__);
+	rc = inst->event_handle(inst, MSM_VIDC_S_CTRL, ctrl);
+	if (rc)
+		goto unlock;
+
+unlock:
+	inst_unlock(inst, __func__);
+	client_unlock(inst, __func__);
+	put_inst(inst);
+	return rc;
+}
+
+int msm_vidc_prepare_dependency_list(struct msm_vidc_inst *inst)
+{
+	struct list_head leaf_list, opt_list;
+	struct msm_vidc_inst_cap *cap, *lcap, *temp_cap;
+	struct msm_vidc_inst_cap_entry *entry = NULL, *temp = NULL;
+	bool leaf_visited[INST_CAP_MAX];
+	bool opt_visited[INST_CAP_MAX];
+	int tmp_count_total, tmp_count, num_nodes = 0;
+	int i, rc = 0;
+
+	cap = &inst->capabilities[0];
+
+	if (!list_empty(&inst->caps_list)) {
+		i_vpr_h(inst, "%s: dependency list already prepared\n", __func__);
+		return 0;
+	}
+
+	/* init local list and lookup table entries */
+	INIT_LIST_HEAD(&leaf_list);
+	INIT_LIST_HEAD(&opt_list);
+	memset(&leaf_visited, 0, sizeof(leaf_visited));
+	memset(&opt_visited, 0, sizeof(opt_visited));
+
+	/* populate leaf nodes first */
+	for (i = 1; i < INST_CAP_MAX; i++) {
+		lcap = &cap[i];
+		if (!is_valid_cap(inst, lcap->cap_id))
+			continue;
+
+		/* sanitize cap value */
+		if (i != lcap->cap_id) {
+			i_vpr_e(inst, "%s: cap id mismatch. expected %s, actual %s\n",
+				__func__, cap_name(i), cap_name(lcap->cap_id));
+			rc = -EINVAL;
+			goto error;
+		}
+
+		/* add all leaf nodes */
+		if (is_leaf(lcap)) {
+			rc = add_node(&leaf_list, lcap, leaf_visited);
+			if (rc)
+				goto error;
+		} else {
+			rc = add_node(&opt_list, lcap, opt_visited);
+			if (rc)
+				goto error;
+		}
+	}
+
+	/* find total optional list entries */
+	list_for_each_entry(entry, &opt_list, list)
+		num_nodes++;
+
+	/* used for loop detection */
+	tmp_count_total = num_nodes;
+	tmp_count = num_nodes;
+
+	/* sort final outstanding nodes */
+	list_for_each_entry_safe(entry, temp, &opt_list, list) {
+		/* initially remove entry from opt list */
+		list_del_init(&entry->list);
+		opt_visited[entry->cap_id] = false;
+		tmp_count--;
+		temp_cap = &cap[entry->cap_id];
+
+		/**
+		 * if all child are visited then add this entry to
+		 * leaf list else add it to the end of optional list.
+		 */
+		if (is_all_childrens_visited(temp_cap, leaf_visited)) {
+			list_add(&entry->list, &leaf_list);
+			leaf_visited[entry->cap_id] = true;
+			tmp_count_total--;
+		} else {
+			list_add_tail(&entry->list, &opt_list);
+			opt_visited[entry->cap_id] = true;
+		}
+
+		/* detect loop */
+		if (!tmp_count) {
+			if (num_nodes == tmp_count_total) {
+				i_vpr_e(inst, "%s: loop detected in subgraph %d\n",
+					__func__, num_nodes);
+				rc = -EINVAL;
+				goto error;
+			}
+			num_nodes = tmp_count_total;
+			tmp_count = tmp_count_total;
+		}
+	}
+
+	/* expecting opt_list to be empty */
+	if (!list_empty(&opt_list)) {
+		i_vpr_e(inst, "%s: opt_list is not empty\n", __func__);
+		rc = -EINVAL;
+		goto error;
+	}
+
+	/* move elements to &inst->caps_list from local */
+	list_replace_init(&leaf_list, &inst->caps_list);
+
+	return 0;
+error:
+	list_for_each_entry_safe(entry, temp, &opt_list, list) {
+		i_vpr_e(inst, "%s: opt_list: %s\n", __func__, cap_name(entry->cap_id));
+		list_del_init(&entry->list);
+		vfree(entry);
+	}
+	list_for_each_entry_safe(entry, temp, &leaf_list, list) {
+		i_vpr_e(inst, "%s: leaf_list: %s\n", __func__, cap_name(entry->cap_id));
+		list_del_init(&entry->list);
+		vfree(entry);
+	}
+	return rc;
+}
+
+int msm_vidc_adjust_v4l2_properties(struct msm_vidc_inst *inst)
+{
+	struct msm_vidc_inst_cap_entry *entry = NULL, *temp = NULL;
+	int rc = 0;
+
+	/* adjust all possible caps from caps_list */
+	list_for_each_entry_safe(entry, temp, &inst->caps_list, list) {
+		i_vpr_l(inst, "%s: cap: id %3u, name %s\n", __func__,
+			entry->cap_id, cap_name(entry->cap_id));
+
+		rc = msm_vidc_adjust_cap(inst, entry->cap_id, NULL, __func__);
+		if (rc)
+			return rc;
+	}
+
+	return rc;
+}
+
+int msm_vidc_set_v4l2_properties(struct msm_vidc_inst *inst)
+{
+	struct msm_vidc_inst_cap_entry *entry = NULL, *temp = NULL;
+	int rc = 0;
+
+	/* set all caps from caps_list */
+	list_for_each_entry_safe(entry, temp, &inst->caps_list, list) {
+		rc = msm_vidc_set_cap(inst, entry->cap_id, __func__);
+		if (rc)
+			return rc;
+	}
+
+	return rc;
+}
-- 
2.7.4

