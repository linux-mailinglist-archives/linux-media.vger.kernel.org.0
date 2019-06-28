Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2FF59C52
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 15:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727212AbfF1NBH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 09:01:07 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:40596 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727216AbfF1NAh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 09:00:37 -0400
Received: by mail-wm1-f66.google.com with SMTP id v19so8896483wmj.5
        for <linux-media@vger.kernel.org>; Fri, 28 Jun 2019 06:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/R2v+8TpXScwDvoUwTQ+DYnf6CWYu7956kORYsc7udM=;
        b=MOqIunXyl2CU/i32HIF3+ixSLh9DS96LVGO5I+JmUdbfMibDIDbmg+sRsWopc8cgCE
         9qtE+tC7H6BydqLvfRkmzFaNO/ol+OmjNzlNZXWudGpw6l7n46EHluju0TVVqqbDiO5+
         aKma7viTE1x6DUn5NOFpD/X1hliLP5Je23Y7x7S2p2zKo29VdrQ2YP4diZzxjp+LkYrp
         nPAHlRoSTOGRaTPpFKWlYdSvzMC2IPFSb9gx9u3kaoi8lUSmXstXQbcQxwE5FyS/SLo9
         4y/qCLg/ijGyWWGzyioBt83WGDxsnTvLsT1FrzEO5w36K2bQglWkh3sWUB3ueot2hDwX
         hkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/R2v+8TpXScwDvoUwTQ+DYnf6CWYu7956kORYsc7udM=;
        b=p5b0xfznSoy68+rP7qFI0ke0UWNUV54dDA/THOOgdrGnoB+VUXIKRFzvLn6SwK8SUo
         BjPWD/ZP5IdyYbhl+JUMBXNfIVfiZCP9IFjwz6NAjle8REfI6Lt4hC2KOPWMgI96BZqO
         pyHCytUTHNOtpNYUXwrbTbaiQYxoDGpwc7hOotEY+eH4WvK7wr/RhVpZray0uoD24IfY
         +qgct3RNhfsHiz3HW1LSfLtDxiCz9dY/SuR9SalpKvfOOY0djFkTzenerCHPZ5694uBd
         V781Ie2HGd4W3tPaTMyf9VVoGxT84IHVk+rfxqdPniDGp5IFV/JUZK18xBWJDH8sfLyr
         BqNw==
X-Gm-Message-State: APjAAAVMnecOXkTNxyBAvYr6OhOfz4OLi3ZwgoAqk8v2IunuFWUIZSP3
        ydMa73bwTLm1oooR0ORuy2m/0kEhbmQ=
X-Google-Smtp-Source: APXvYqzjUM9HPfSq1Rl5vK8m3SrIQAbqkdvVWKrAMIcQ1R9Y0NuwqXMn990yjFW21GfpYI4dun5zUQ==
X-Received: by 2002:a1c:9cd1:: with SMTP id f200mr7006239wme.157.1561726835808;
        Fri, 28 Jun 2019 06:00:35 -0700 (PDT)
Received: from localhost.localdomain ([37.157.136.206])
        by smtp.gmail.com with ESMTPSA id w20sm3717174wra.96.2019.06.28.06.00.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 28 Jun 2019 06:00:35 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 07/11] venus: vdec_ctrls: get real minimum buffers for capture
Date:   Fri, 28 Jun 2019 15:59:58 +0300
Message-Id: <20190628130002.24293-8-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
References: <20190628130002.24293-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Until now we returned num_output_bufs set during reqbuf but
that could be wrong when we implement stateful Codec API. So
get the minimum buffers for capture from HFI. This is supposed
to be called after stream header parsing, i.e. after dequeue
v4l2 event for change resolution.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/vdec_ctrls.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/vdec_ctrls.c b/drivers/media/platform/qcom/venus/vdec_ctrls.c
index 300350bfe8bd..3a963cbd342a 100644
--- a/drivers/media/platform/qcom/venus/vdec_ctrls.c
+++ b/drivers/media/platform/qcom/venus/vdec_ctrls.c
@@ -7,6 +7,7 @@
 #include <media/v4l2-ctrls.h>
 
 #include "core.h"
+#include "helpers.h"
 #include "vdec.h"
 
 static int vdec_op_s_ctrl(struct v4l2_ctrl *ctrl)
@@ -38,7 +39,9 @@ static int vdec_op_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct venus_inst *inst = ctrl_to_inst(ctrl);
 	struct vdec_controls *ctr = &inst->controls.dec;
+	struct hfi_buffer_requirements bufreq;
 	union hfi_get_property hprop;
+	enum hfi_version ver = inst->core->res->hfi_version;
 	u32 ptype = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT;
 	int ret;
 
@@ -62,7 +65,9 @@ static int vdec_op_g_volatile_ctrl(struct v4l2_ctrl *ctrl)
 		ctrl->val = ctr->post_loop_deb_mode;
 		break;
 	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
-		ctrl->val = inst->num_output_bufs;
+		ret = venus_helper_get_bufreq(inst, HFI_BUFFER_OUTPUT, &bufreq);
+		if (!ret)
+			ctrl->val = HFI_BUFREQ_COUNT_MIN(&bufreq, ver);
 		break;
 	default:
 		return -EINVAL;
-- 
2.17.1

