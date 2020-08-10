Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAC02240FEA
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 21:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730360AbgHJT0I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 15:26:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27738 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728357AbgHJT0G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 15:26:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597087564;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=jW0fem5Jmjj0Zx6/HwTIZV0/DFfxiDU26zPyQGABhVY=;
        b=Yz7YFxUR3R5ksjmhFHisv3/JzH+GaIJa8/W5pmku3jZL+wZbZ2rxtwykq7x5UNJdeprWnl
        nd7co9k0e1LAa3LBsED8bjyxxDxHiEepbomWYZJ8yFL88utH4KO4OiJKpOR89VhOxeeLEU
        r1jTdnuOD6ASu7QZwcXDAPvr7wArWjM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-X1-schQHM_6KbM9mJTHWpg-1; Mon, 10 Aug 2020 15:26:01 -0400
X-MC-Unique: X1-schQHM_6KbM9mJTHWpg-1
Received: by mail-qv1-f69.google.com with SMTP id d19so7913337qvm.23
        for <linux-media@vger.kernel.org>; Mon, 10 Aug 2020 12:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jW0fem5Jmjj0Zx6/HwTIZV0/DFfxiDU26zPyQGABhVY=;
        b=kCkY06G7V6Xr49/NwpvBvaJ5joLB8xVK524ypl0SpOqB5Pef33819aUn17bH6+LIbM
         f80csLuPMFNJNLcoO/kST9zm4yPWXC18XWWKsr8AQiCLGg+bTXsyVZI9oIZYP51UflmL
         9t02YPg9iPMLllg21BcoCcJYSLeuUueBxNXgfr5QntDN/HwyZShtQXl9qRiUBWfPKiZN
         HT+yLmc0Y1hH/253TEYRx5129HEr9nA6VHW/LobeTeRwXVSLZ4fBzJAO++/8beKykDo9
         7ISAfoomFZlXubYWFMtx7HjdTw0l5YZnuwPcc8Gx9LRjQ1YxRANDEe8oJObJ72P0JLwK
         D2ew==
X-Gm-Message-State: AOAM533Gdpt/S9gSrxAYixTGuPlURkpdUxphMFMU8RxjDdUg889eIo5p
        5POmPP8pnjaG7gzvZmeMbpop1SkIIAHRoC3AT+R2ckuXVPKxgASWV76D2eJrgvolsT0zsrkLtMH
        lCv9NJAAaPPZrCJZOxoqechI=
X-Received: by 2002:a0c:f681:: with SMTP id p1mr22661601qvn.248.1597087560680;
        Mon, 10 Aug 2020 12:26:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZu5Y1a7ZFALxLczh2/NRooWYBVXrMgno7Bp8kSPcXz04fI7U/kb7Ai6dmhiMH/so/YqBlaQ==
X-Received: by 2002:a0c:f681:: with SMTP id p1mr22661586qvn.248.1597087560490;
        Mon, 10 Aug 2020 12:26:00 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id 139sm14690740qkl.13.2020.08.10.12.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2020 12:25:59 -0700 (PDT)
From:   trix@redhat.com
To:     maintainers@bluecherrydvr.com, anton@corp.bluecherry.net,
        andrey.utkin@corp.bluecherry.net, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] media: tw5864: check status of tw5864_frameinterval_get
Date:   Mon, 10 Aug 2020 12:25:18 -0700
Message-Id: <20200810192518.8822-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

clang static analysis reports this problem

tw5864-video.c:773:32: warning: The left expression of the compound
  assignment is an uninitialized value.
  The computed value will also be garbage
        fintv->stepwise.max.numerator *= std_max_fps;
        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^

stepwise.max is set with frameinterval, which comes from

	ret = tw5864_frameinterval_get(input, &frameinterval);
	fintv->stepwise.step = frameinterval;
	fintv->stepwise.min = frameinterval;
	fintv->stepwise.max = frameinterval;
	fintv->stepwise.max.numerator *= std_max_fps;

When tw5864_frameinterval_get() fails, frameinterval is not
set. So check the status and fix another similar problem.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/pci/tw5864/tw5864-video.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/pci/tw5864/tw5864-video.c b/drivers/media/pci/tw5864/tw5864-video.c
index ec1e06da7e4f..a65114e7ca34 100644
--- a/drivers/media/pci/tw5864/tw5864-video.c
+++ b/drivers/media/pci/tw5864/tw5864-video.c
@@ -767,6 +767,9 @@ static int tw5864_enum_frameintervals(struct file *file, void *priv,
 	fintv->type = V4L2_FRMIVAL_TYPE_STEPWISE;
 
 	ret = tw5864_frameinterval_get(input, &frameinterval);
+	if (ret)
+		return ret;
+
 	fintv->stepwise.step = frameinterval;
 	fintv->stepwise.min = frameinterval;
 	fintv->stepwise.max = frameinterval;
@@ -785,6 +788,9 @@ static int tw5864_g_parm(struct file *file, void *priv,
 	cp->capability = V4L2_CAP_TIMEPERFRAME;
 
 	ret = tw5864_frameinterval_get(input, &cp->timeperframe);
+	if (ret)
+		return ret;
+
 	cp->timeperframe.numerator *= input->frame_interval;
 	cp->capturemode = 0;
 	cp->readbuffers = 2;
-- 
2.18.1

