Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F82F337262
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 13:21:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233142AbhCKMVE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 07:21:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233141AbhCKMUt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 07:20:49 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA80C061760
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:49 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id p8so45765382ejb.10
        for <linux-media@vger.kernel.org>; Thu, 11 Mar 2021 04:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E+KNBZ7REWHEPMEYGabkE6Q+CytCIw0tnZHRNytamFc=;
        b=Tct1qP1En8JHx9Nj1KTwbp//IA5BpMyGDQZVotvomrcQS4N4h8oSRIqIiJRB7Vuht7
         sAqsCzAsuVeGFrwa0AD5DObzALcNOC2Xi6gKM9KnrSzHoAsBWCtPnBXZ8vlS6qT4PLfi
         c3JTW4v5NuCZSwqVd+ruTxSqEUpyXiNeeJEzs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E+KNBZ7REWHEPMEYGabkE6Q+CytCIw0tnZHRNytamFc=;
        b=Z+hQpSEy8YHiK9NCHXnDn2Ixnt2A0VgspVu5J/Tn3w3InYeNYK55VkUO3zQb08Rlag
         1chxAwAx6uQkysZz5HiDOODoc6kZSrrzF/jDTiFuZEMeUjISRPy+DzuRBPctHVkUJRnH
         nZO0QzNtSCLaPV7yPbzQAKX9+2GL4/58/1wGuMEED1AuaIRjHAAdt58XoDjip0TNQjJ1
         Rly6r58O8f/iklbi1gasR1BxsPPjFCMoYyK8BsWPf7DwIapNGN8ihfzh8cKt0TGihmtL
         4SyQtJHRtpy5y3H8yrZSyPq5Vlh+RXxZInYjKXzQxVpkHa+G/Q4XllTSjP9TeY6i7Vor
         LaDg==
X-Gm-Message-State: AOAM532RvVKrPhVmmMjkEIKib1gU/buW4xZNPU6q+F306JY08pT0l8yG
        jLBgVZ6dl9sSy8M9BrBUGnT6Tw==
X-Google-Smtp-Source: ABdhPJwm4sLiGnNCtk6Xv0aD6B7aV+f3MF4koBw0bmpELVWq9+MFQ17QtCSUiokH99iIbAloAeEqlg==
X-Received: by 2002:a17:906:2710:: with SMTP id z16mr2868707ejc.176.1615465248453;
        Thu, 11 Mar 2021 04:20:48 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id u13sm1264126ejy.31.2021.03.11.04.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 04:20:48 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, senozhatsky@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 09/10] media: uvcvideo: Do not create initial events for class ctrls
Date:   Thu, 11 Mar 2021 13:20:39 +0100
Message-Id: <20210311122040.1264410-11-ribalda@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210311122040.1264410-1-ribalda@chromium.org>
References: <20210311122040.1264410-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2_CTRL_TYPE_CTRL_CLASS do not generate events.

Fixes v4l2-compliance:
Control ioctls (Input 0):
                fail: v4l2-test-controls.cpp(844): found event for control class 'User Controls'
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index 273eccc136b8..433342efc63f 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1456,6 +1456,7 @@ static void uvc_ctrl_send_events(struct uvc_fh *handle,
 	}
 }
 
+static const u8 uvc_ctrl_class_guid[16] = UVC_GUID_CTRL_CLASS;
 static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 {
 	struct uvc_fh *handle = container_of(sev->fh, struct uvc_fh, vfh);
@@ -1474,7 +1475,8 @@ static int uvc_ctrl_add_event(struct v4l2_subscribed_event *sev, unsigned elems)
 	}
 
 	list_add_tail(&sev->node, &mapping->ev_subs);
-	if (sev->flags & V4L2_EVENT_SUB_FL_SEND_INITIAL) {
+	if ((sev->flags & V4L2_EVENT_SUB_FL_SEND_INITIAL) &&
+	    memcmp(ctrl->info.entity, uvc_ctrl_class_guid, 16)) {
 		struct v4l2_event ev;
 		u32 changes = V4L2_EVENT_CTRL_CH_FLAGS;
 		s32 val = 0;
-- 
2.31.0.rc2.261.g7f71774620-goog

