Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE006EC1BC
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2019 12:25:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730451AbfKALZP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 Nov 2019 07:25:15 -0400
Received: from mail-lf1-f46.google.com ([209.85.167.46]:46004 "EHLO
        mail-lf1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727184AbfKALZP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 1 Nov 2019 07:25:15 -0400
Received: by mail-lf1-f46.google.com with SMTP id v8so6945762lfa.12;
        Fri, 01 Nov 2019 04:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T+OjJ+6/I6gUD391Oea+4W1UmtPnSSXB5pb5k146uYU=;
        b=fvJr7Y4CS1qIN32RvWTw6FTxmABdWAh5puUmSeaxWlV+S9quZgBbce7XaTl1FztFU8
         HF0EVOnlh6iPw6PLl72kxQxgT4pQ+f1HyIpZW0rfACQNe4qwpeWKPZov+YlDo9iM4m9a
         MfcKM2RNzMa59hLPDpJcyNHQthFvvo5xp7glPkcuH9kj5KMENRyPglUR7fGYPyMNXQXS
         ChtgTNpMjip6pkyPu3ACvKpOdYJAb02UVuMIRhHyjTnTccyfEAS0/V3NmL9144pgaBYX
         Y9oenpeYyKMZNtmwK/tzmPN5/rhAeDz1tHKYsA1eTmuAVGj35/KAOjV0a/3iP6w8kcSW
         heUA==
X-Gm-Message-State: APjAAAUoRkUp3eLND9B1lbmId56R215ncQpinfx3SedZswFhu2peLYpO
        c4Ai4lj/wLBe39Wb6j9rEpQ=
X-Google-Smtp-Source: APXvYqxVT0p8cgPj+Lcwa9qVKd/R1TvqPheEiF0FEbi4THkyKtdMRRyaUpc5oRuimc8RHdbotDulBQ==
X-Received: by 2002:a19:f107:: with SMTP id p7mr6745585lfh.91.1572607512894;
        Fri, 01 Nov 2019 04:25:12 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id u13sm1851775ljl.71.2019.11.01.04.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 04:25:11 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH 2/4] v4l2-ctl: Support query V4L2_CTRL_TYPE_AREA controls
Date:   Fri,  1 Nov 2019 12:25:07 +0100
Message-Id: <20191101112509.29723-2-ribalda@kernel.org>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191101112509.29723-1-ribalda@kernel.org>
References: <20191101112509.29723-1-ribalda@kernel.org>
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

