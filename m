Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80EE1EE0B2
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 14:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729233AbfKDNKJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 08:10:09 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36947 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728905AbfKDNKJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 08:10:09 -0500
Received: by mail-lj1-f193.google.com with SMTP id v2so17529754lji.4;
        Mon, 04 Nov 2019 05:10:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DaGUTMZTPvVQG7pcnt9rSBQcYcHWYKS+V0DM0nxl4Tk=;
        b=JKgTPYzZH+LX1jPkQTz+QQjdEqj+hUvxvKav+3k4omrEZqHXNvCkT1PKwiMWLdsbcg
         BIeo7JBZYKTvYjsvFyuOMzSit81ZejYL0bLjXvSiwhEOKawpQLnJDFX91iWweQo9gRLP
         7Jz8T5i1IL6uFScb5sixG/s+iLtVBSFtUGL39C/HRbjbaZ69k7su9H9JYsqHIyYIF9+F
         kJRCLjwX1FrOiid66l9jV7eSB5ISuEFCT5QHkAESBsCDTLShA7ToTai5paBvm6Ju217s
         IjbmG7kVvkjJAfQ4SvYZlWhfC1GwVvgqyBOAvt4cqPvVUAIzQoKVq+O1Twy1TgYA1Vlm
         5/wQ==
X-Gm-Message-State: APjAAAWwgRgO6Lu4HCo9UQi+BTa6nrRbNtwO08STf0dNu8deuioQqUR2
        tcSVXFAcPiiutdxtz24G0g2RgsRraMk=
X-Google-Smtp-Source: APXvYqwttHpEeyFYXr19zdC+Qle+rn5YWM+8K5IlESpXcz+Jv3c2UkUuLNzCpSf2/IspyeDiSN+uiQ==
X-Received: by 2002:a2e:9194:: with SMTP id f20mr7455672ljg.154.1572873007465;
        Mon, 04 Nov 2019 05:10:07 -0800 (PST)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z3sm5931801ljz.51.2019.11.04.05.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 05:10:06 -0800 (PST)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v2 2/3] v4l2-ctl: Support getting  V4L2_CTRL_TYPE_AREA controls
Date:   Mon,  4 Nov 2019 14:09:59 +0100
Message-Id: <20191104131000.22359-2-ribalda@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191104131000.22359-1-ribalda@kernel.org>
References: <20191104131000.22359-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tested with vivid:

v4l2-ctl -C area -d /dev/video1
area: 51966x727837

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 utils/v4l2-ctl/v4l2-ctl-common.cpp | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index b1c12b35..95339561 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -1150,6 +1150,11 @@ void common_get(cv4l_fd &_fd)
 							printf("%s: '%s'\n", name.c_str(),
 								safename(ctrl.string).c_str());
 							break;
+						case V4L2_CTRL_TYPE_AREA:
+							printf("%s: %dx%d\n", name.c_str(),
+							       ctrl.p_area->width,
+							       ctrl.p_area->height);
+							break;
 						default:
 							fprintf(stderr, "%s: unsupported payload type\n",
 									qc.name);
-- 
2.24.0.rc1

