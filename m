Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB5B23387E5
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 09:51:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232487AbhCLIu2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 03:50:28 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:38933 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232344AbhCLIuA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 03:50:00 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id KdUZlzNNh4ywlKdUcl2Tqt; Fri, 12 Mar 2021 09:49:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615538998; bh=NGK2EPESfCiclfH5XrDNBvTY5/wvFk2zHhR9JTyxkes=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=C8k8S7bVh4fDjkT6jgZrVooZADvbOtJcJH0I+6/I14Ab1PCxjqyWC7OKE8N8/apiw
         mahhJpdV8Xs2STR47xDSkSqu6L/9UGKricApz7/p/dB4iKVSDoG9W8QUoU1wSAfbLe
         Pye82ca5ACDklaGeg+kxRzNQJpmwb2gCOX/elHgLTHpzIAeAj3sV+p38LQe/AP2PYD
         pNlPozWf1kt61owrlZY5qq1pHgpHMHj00n4nbmx3B+YgrfCVbEbnAhmtYZNSoCaP6v
         O3Y9J057Qh72aKjoNNySCDt5/Xgku/D4XFXuwScvWGXfaxqGOb5Q9yglwo6u+g7vEt
         7wumlC1/so+sQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] v4l2-ctrls.c: initialize flags field of p_fwht_params
Message-ID: <2b0585f5-672c-3a67-b38d-d47ce9e5473e@xs4all.nl>
Date:   Fri, 12 Mar 2021 09:49:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfC6rWS+5JyM7qXXrm9Oxz67GOI6r6PHBq7irY5PC9yfRB64JgErgtMaRjzrKNrj1wqa29GXBbOxpif+ioJf+PrZVz6Nm7i6PtmfVNc3+rwuYHbVImDsr
 Sh051W/IzI9e1sqx7J9Q6euU/JWHMdik84WSW4uztSEn7OhT+atZde+JXQn8N0RwPz6YtwnpJDfT3x8H7iJFgKiykvub5wvOcI8=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The V4L2_CID_STATELESS_FWHT_PARAMS compound control was missing a
proper initialization of the flags field, so after loading the vicodec
module for the first time, running v4l2-compliance for the stateless
decoder would fail on this control because the initial control value
was considered invalid by the vicodec driver.

Initializing the flags field to sane values fixes this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 016cf6204cbb..77f63773096e 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1675,6 +1675,8 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		p_fwht_params->version = V4L2_FWHT_VERSION;
 		p_fwht_params->width = 1280;
 		p_fwht_params->height = 720;
+		p_fwht_params->flags = V4L2_FWHT_FL_PIXENC_YUV |
+			(2 << V4L2_FWHT_FL_COMPONENTS_NUM_OFFSET);
 		break;
 	}
 }
