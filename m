Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0782EBF35
	for <lists+linux-media@lfdr.de>; Wed,  6 Jan 2021 14:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbhAFNxT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Jan 2021 08:53:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbhAFNxS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Jan 2021 08:53:18 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5828FC06134C
        for <linux-media@vger.kernel.org>; Wed,  6 Jan 2021 05:52:38 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id i9so2520713wrc.4
        for <linux-media@vger.kernel.org>; Wed, 06 Jan 2021 05:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BciaI1ID3gO2H96TGshX7T20+fEkQv1Rz1weIiIZgbo=;
        b=djGQmIGwkmBnuZmJHaHnYmPbIJGgy8ut6gSYmhuGVrnX9suoO3I+DXLGDmbnkYY+F7
         DFwAfX6D3bUewKEzEB+ICEu7xeVbpDUeBAYP2hglVnHY9Ftb4zW/NXH85yi0Ox0tk+oY
         Cgchu9h/SWF8IZz/vSt6MqzEz1LxWvtySJ7fG1ALaM+8DNl00hTiE0QEf9oPIDzWATR7
         JlTKPKRyZ5jcWFt2nVJn1ExNVyIgqgj2POlNiMoVDElkfDk/L9RSPWRu8NepLhJUeAXh
         BCrQaeYBAweOLeacG2EPzh6U/gY5tWhv+0OawXk3fhIuaN6e2Pnztbuv4eiAXuX1baVB
         cpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BciaI1ID3gO2H96TGshX7T20+fEkQv1Rz1weIiIZgbo=;
        b=EpvarhBRhLbkeaqbtHyiVplmkaaQT/CNs+wdeaWp2m4Cc7VqrYr3JRk4khoR+Q0YJS
         phWMV8nTSDyd2EfTdl8urq5h8im52aJb5o9xuPskLfeUJlOktr456sqRJNlww8rP3sj9
         7TjRT9kaxZFKwRAWx8Lk+qJ31FYbidE4rYrdR1n0Dh8QTsxi7U+mGswq7h+6buakg4lc
         r31WW1M+vUZDcGu+u3Rc0DbAz4qiiAj9tUfNOjlPMcnngTSsCK9Eie1h4EBPc2EqqsSW
         kVxaIR0PUEYJg0PIqj3xwnT9HaOl4ADp6MFBAof0I73MF/AmYYoJr5lgqwKCLC1QW6zm
         B4xg==
X-Gm-Message-State: AOAM531Ma/85P+KU5XaA4aok0TpVkXeRFnuGF8/pSVrqTGC+B4nF5l1e
        pb/qnpRiOLwO/NCTfd5CzCVE89YKtM7jfA==
X-Google-Smtp-Source: ABdhPJwjyWI5F8DiIiE5+HazclPyJNp3Nw6ULfraDZoWejXzqayQ5wJLGk4Uz+1Z42bChAIGfxJ0Gg==
X-Received: by 2002:adf:c18d:: with SMTP id x13mr4353558wre.128.1609941156848;
        Wed, 06 Jan 2021 05:52:36 -0800 (PST)
Received: from naushir-VirtualBox.patuck.local ([88.97.76.4])
        by smtp.gmail.com with ESMTPSA id 125sm3227386wmc.27.2021.01.06.05.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 05:52:36 -0800 (PST)
From:   Naushir Patuck <naush@raspberrypi.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com,
        Naushir Patuck <naush@raspberrypi.com>
Subject: [PATCH] Revert "media: videobuf2: Fix length check for single plane dmabuf queueing"
Date:   Wed,  6 Jan 2021 13:52:11 +0000
Message-Id: <20210106135210.12337-1-naush@raspberrypi.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The updated length check for dmabuf types broke existing usage in v4l2
userland clients.

Fixes: 961d3b27 ("media: videobuf2: Fix length check for single plane dmabuf queueing")
Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index 96d3b2b2aa31..3f61f5863bf7 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -118,8 +118,7 @@ static int __verify_length(struct vb2_buffer *vb, const struct v4l2_buffer *b)
 				return -EINVAL;
 		}
 	} else {
-		length = (b->memory == VB2_MEMORY_USERPTR ||
-			  b->memory == VB2_MEMORY_DMABUF)
+		length = (b->memory == VB2_MEMORY_USERPTR)
 			? b->length : vb->planes[0].length;
 
 		if (b->bytesused > length)
-- 
2.25.1

