Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E95E4EE0B3
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2019 14:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729152AbfKDNKJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Nov 2019 08:10:09 -0500
Received: from mail-lj1-f174.google.com ([209.85.208.174]:45085 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728741AbfKDNKI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Nov 2019 08:10:08 -0500
Received: by mail-lj1-f174.google.com with SMTP id n21so3892909ljg.12;
        Mon, 04 Nov 2019 05:10:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=T+OjJ+6/I6gUD391Oea+4W1UmtPnSSXB5pb5k146uYU=;
        b=IqyPoXHGeBVO046+L7s4B45oDmzC0caWCsFS6u/7LEXJuLwsZY5cYNnKW8nCoMwD3V
         o+DGCuoJOoXGp2FOcPOuQRzwm7tRjxH37XOEMr3mzl2/Kbkb4/PAu913cpa4zzKOxs3m
         xZEpKhl6zCwa+P+RAGohqrnNBsVJrU7GNJoicXgcqkqKG/nrSOhZRZDzTBZ5yVYoqAN0
         mSV73q5VrqihbPxmCrPor2Yks6e70nJtIMCtam/TPHevVTWXTO94+vYJmytqL5v0t+Gi
         BbUVFKpmj+J7fatWX/r2ylgMYCIOWLyPdcmq4uWhzpbu+BA7tODsog52NppWxR65CAje
         49tw==
X-Gm-Message-State: APjAAAV+7diWo8pcWVzVIIKf13cpcuRtcn58V6dvAZYyjQ4AlkFyu86m
        d45lkRto0rCfsgVk0rqHZzQ=
X-Google-Smtp-Source: APXvYqwhkzL0mXb3lFP375fkPZPQRM79RegodUiRbelQjvnFHqUCfDyhrsZuohmx2OjxRc74rzr7zw==
X-Received: by 2002:a2e:9449:: with SMTP id o9mr18241139ljh.110.1572873005318;
        Mon, 04 Nov 2019 05:10:05 -0800 (PST)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z3sm5931801ljz.51.2019.11.04.05.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 05:10:04 -0800 (PST)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v2 1/3] v4l2-ctl: Support query V4L2_CTRL_TYPE_AREA controls
Date:   Mon,  4 Nov 2019 14:09:58 +0100
Message-Id: <20191104131000.22359-1-ribalda@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tested with vivid:

$ v4l2-ctl -l | grep area
                           area 0x0098f90b (area)   : flags=has-payload

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 utils/v4l2-ctl/v4l2-ctl-common.cpp | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
index 651917e7..b1c12b35 100644
--- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
@@ -458,6 +458,9 @@ static void print_qctrl(int fd, struct v4l2_query_ext_ctrl *queryctrl,
 				queryctrl->minimum, queryctrl->maximum,
 				queryctrl->step, queryctrl->default_value);
 		break;
+	case V4L2_CTRL_TYPE_AREA:
+		printf("%31s %#8.8x (area)   :", s.c_str(), queryctrl->id);
+		break;
 	default:
 		printf("%31s %#8.8x (unknown): type=%x",
 				s.c_str(), queryctrl->id, queryctrl->type);
-- 
2.24.0.rc1

