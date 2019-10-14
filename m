Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E142FD5A22
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 06:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbfJNERZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 00:17:25 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:34788 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725536AbfJNERY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 00:17:24 -0400
Received: by mail-oi1-f195.google.com with SMTP id 83so12671799oii.1
        for <linux-media@vger.kernel.org>; Sun, 13 Oct 2019 21:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E8+OyL/49ZzbRUfRWkCTYla7ZdusykuaKlEUSx6AX5U=;
        b=NfTJIJKuvdR9qXiCv2smltkwDfUjqse/CrA/i6x3IPzJFnDxDUrOcOyFu79sVwDUaF
         aUxC8JalG5at5/TJSEKJV9WHKsEDFGGCv4PI30E1a7KvBaK4rsFxWysiS/jqCJWT9SOg
         H9ulKzgffrdR+JxYmng1Y5JrGaMiRZnwx8nexXwZ/V3bXEsLQgA5UAP7GYiDfZ/UX4jR
         pH0dp68jeL8/tQQ6o27WP3L4IgIu1hem8AFeJ/IHKZdqJw6mCEZsptZWNNWzmfs3bXgM
         p/Y0O9/9GsaE8gFktwS1P4sB9EAToefJsSYPxVbLFmC7by1SyNAtRALxU9mx3dblqWDG
         W4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E8+OyL/49ZzbRUfRWkCTYla7ZdusykuaKlEUSx6AX5U=;
        b=Dif1OVAe1P1+O/z6lp9c37qBjl241vLDfu9uYLFTrXdyUB4Dx0LNTibXI3T4RhIw9p
         lY0goW2Y5N1FzzIyHzq/fhOrg0JprNUP3U4hBStZb6bShFg49FANg1RJ6jz4Ff0Jb947
         ygjE5+54oBiu6mwct44FnhNKCvFRaS+jbCLxQwxnMDUSf8Vcwn3otsXymthpAk2hCD39
         zO6a8SQZVTNunGxJUAVCZWLrfMupS454v2HAcl4BFHfVyUAgpVh4I6qKUvaSocN52wJQ
         ryR/3Sl4bWkBZhCLJqRlfkhnbW+pkoF1QY8tKNV7g35XR6QXFnvFw14UGlZxwlxR+O2H
         UW4Q==
X-Gm-Message-State: APjAAAXaHIXP8z/ubT7JYWcKrOyQvAAhIx3kGBXpHf3fJN9CLU4FV3kW
        U9iy7VpIoGWivysg9OLc0/uakLT0
X-Google-Smtp-Source: APXvYqwxt6tdu4mqNBS2pXVyDuSiXEDreE3u9qleHNZitLuZcNr4X8yEt4qP2USlft6nivbVxfWUsw==
X-Received: by 2002:aca:2207:: with SMTP id b7mr21699372oic.120.1571026643661;
        Sun, 13 Oct 2019 21:17:23 -0700 (PDT)
Received: from rYz3n.attlocal.net ([2600:1700:210:3790::40])
        by smtp.googlemail.com with ESMTPSA id l19sm4887918oie.22.2019.10.13.21.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Oct 2019 21:17:22 -0700 (PDT)
From:   Jiunn Chang <c0d1n61at3@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl
Subject: [PATCH 1/8] cec-follower: fix analog tuner device info update
Date:   Sun, 13 Oct 2019 23:17:14 -0500
Message-Id: <20191014041721.52025-2-c0d1n61at3@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014041721.52025-1-c0d1n61at3@gmail.com>
References: <20191014041721.52025-1-c0d1n61at3@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

With the addition of digital tuner control support, analog update
needs to set is_analog and tuner_display_info.

Signed-off-by: Jiunn Chang <c0d1n61at3@gmail.com>
---
 utils/cec-follower/cec-tuner.cpp | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/cec-follower/cec-tuner.cpp b/utils/cec-follower/cec-tuner.cpp
index 46acccf4..b3b20b89 100644
--- a/utils/cec-follower/cec-tuner.cpp
+++ b/utils/cec-follower/cec-tuner.cpp
@@ -131,6 +131,8 @@ static void analog_update_tuner_dev_info(struct node *node, unsigned int idx)
 	unsigned int freq_khz;
 
 	node->state.freq_idx = idx;
+	info->tuner_display_info = CEC_OP_TUNER_DISPLAY_INFO_ANALOGUE;
+	info->is_analog = true;
 	info->analog.ana_bcast_type = node->state.freq_idx / tot_freqs;
 	info->analog.bcast_system =
 		(node->state.freq_idx - (tot_freqs * info->analog.ana_bcast_type)) / NUM_ANALOG_FREQS;
-- 
2.23.0

