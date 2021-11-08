Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 462D04498FD
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 17:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239466AbhKHQFi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 11:05:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239380AbhKHQFg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 11:05:36 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CDCC061767
        for <linux-media@vger.kernel.org>; Mon,  8 Nov 2021 08:02:51 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id d27so27767955wrb.6
        for <linux-media@vger.kernel.org>; Mon, 08 Nov 2021 08:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qyp9SrPyLgYIMuwT9MuDBXOOdH5XssHnAfufE4fLJtg=;
        b=teDNng7JJhTgR6g//mAv6tFTA1F2vNBlEujo2RboVanS1aqq2v4MkPHC6ALJXenAMz
         rB9Vp8uLnztnLunjD05H6IQFuoXn7aUYpacPx8js0xETcPHHZcnkkykzYn0h/k3K6nzA
         T2wb046BpRLZD/WIFzKgqFIMPO323ntLKIMTt07jg6blQDWy2UHE4RCLsY2xu5hoICHg
         0gFLKLgWHnI2Cw4X1F78xs16J0tPkIKjqjFY4Yow5pK5z2qPe4IqIEmXNtQc0tODCIUN
         PQOsSFAYJVUUBiWA6kugzTNlLR2XkNu2amwTQQmu1OoAGgkSgK7ryS1FxAQsqE6rMPkV
         VaIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qyp9SrPyLgYIMuwT9MuDBXOOdH5XssHnAfufE4fLJtg=;
        b=uM/7YPatWHUtlvJVXevYceUowB7yyhSLaNVIH3/gll/yWHAYZD1M90PCXdYTADB5C4
         Zs6jbyCLOGZh7b7kCBFFbWRDFXM8XXjTK/wFdM4yzOuFzk9RoaY6ewNfDYWBhVFyX6ki
         +zlZWXPUYIX/RkPdbH8oJJBQIakupVx07WxXo5CPp6fcGNZ/dd0pd3UAXRIcoTGjTexy
         34o59Zvp87NeyOlkDs9sA9sFLuoWICvHeKP8zDDhmJcje0WImV+1/4MB59/b4UaeyM8t
         igCAbm5Teaib4KZHzZNW7yzEDCT/GSz7gUn3aRUJwru1qfMK3wIMnz9SnCp7+O0fMb1F
         m83Q==
X-Gm-Message-State: AOAM533xlP7iezpe3Ab8fzQ9/mbrukW7LyTLlIfq7ZiP9SF/IffCwQmv
        MUEnNPAwEuzNedIn4zwcP1Fc50cn/Cyu0iWR
X-Google-Smtp-Source: ABdhPJzgV6DxAZiDjIs+PPHKUUwVqT+TIl1sbEIpjk8sXV0LxUM75hu0sHADPa+HtDYeSpyeSGQgvg==
X-Received: by 2002:a05:6000:1b8f:: with SMTP id r15mr246622wru.27.1636387370197;
        Mon, 08 Nov 2021 08:02:50 -0800 (PST)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id d16sm12703176wmb.37.2021.11.08.08.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 08:02:49 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 3/4] rcar-vin: Stop stream when subdevice signal transfer error
Date:   Mon,  8 Nov 2021 17:02:19 +0100
Message-Id: <20211108160220.767586-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
References: <20211108160220.767586-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When a subdevice signals a transfer error stop the VIN in addition to
informing user-space of the event.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
* Changes since v3
- Switch to new V4L2_EVENT_XFER_ERROR from V4L2_EVENT_EOS.
- Call vb2_queue_error() when encountering the event.

* Changes since v2
- Log using vin_dbg() instead of v4l2_info().
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index a5bfa76fdac6e55a..bf17fdefe90aabf5 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -992,9 +992,24 @@ void rvin_v4l2_unregister(struct rvin_dev *vin)
 static void rvin_notify_video_device(struct rvin_dev *vin,
 				     unsigned int notification, void *arg)
 {
+	const struct v4l2_event *event;
+
 	switch (notification) {
 	case V4L2_DEVICE_NOTIFY_EVENT:
-		v4l2_event_queue(&vin->vdev, arg);
+		event = arg;
+
+		switch (event->type) {
+		case V4L2_EVENT_XFER_ERROR:
+			vin_dbg(vin,
+				"Subdevice signaled transfer error, stopping.\n");
+			rvin_stop_streaming(vin);
+			vb2_queue_error(&vin->queue);
+			break;
+		default:
+			break;
+		}
+
+		v4l2_event_queue(&vin->vdev, event);
 		break;
 	default:
 		break;
-- 
2.33.1

