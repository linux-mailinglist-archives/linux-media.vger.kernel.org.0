Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A44E22790C9
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730180AbgIYSf4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728423AbgIYSfz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:35:55 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3A88C0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:35:55 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z18so4032971pfg.0
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=S9MzB7+azPxcpMxlGiEMSs7z6RlW8asusze1qBJiaHc=;
        b=GiTZpxH0lW8zLiNCaHQKJWiu/l4nzYYVhfD4Q+FRYUWHufVBRmH/PLycl8xGFZ04vD
         a9cS10XGg+E+Ffx7MlqM0tgXpeQ/JTvNvsevtW+j/jINep15ZyAKN4W0VpUUcfINb1aX
         IkYbGf8RmvMHMSD0Js0G1erkBco6DXrGwbr6unqxZ5fo0kNbH7413bqRcXCr6gs3dpQs
         CInR2PPf8FjQnWLtFAOke4X1mgf+gWJRKnWOCueDeC15Xv4KW8TgmAni+ec0MptpiNkQ
         wPLLqWHXCG3weNTaaJ7mG3yf4AQ5KdiT2d9D6tIap/o5L4Gc5YVoHrYgnUbkq/H1+WxG
         Gq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=S9MzB7+azPxcpMxlGiEMSs7z6RlW8asusze1qBJiaHc=;
        b=WhbanrpLUOhKFdAVoFd3q2lodlkmJ4WMCeo8YP/Mvq6CRkrswVTL/R59x4vmXB5drA
         ov9FozNxdthulI14lI7RZrNLP24IVYXo2qSs08J9WUagv3orxq1ZXm/ZRqKXBf8pKwog
         RWDHlUcNQUUKuv7KIIUtNcOktdtVF1XQPGCoYzmnJ+IOniuIJxT3c/nStQLv8PFVay7f
         TqnhncczqgR2dasBn4Q/dQTC4yLdAZMsF6AwIe+oR2hJPs40q+yE2D8wdoFKOcZQSZFt
         LbwTzT52/Y9fRMCd4TKfe0hujdj27RQtAOF3STeNj11ZBaf7oPfRRuP5pJxKlkS9BQgH
         PwfQ==
X-Gm-Message-State: AOAM532uxgvyq1SdLejit36mceFybJH28t6LkKf4tH5cyt3PEDfei/EM
        ml4nihFhahcSb0l75T7eab1RJA==
X-Google-Smtp-Source: ABdhPJxXOC4LKM9TnKO9HWTZJm0lMuRnGb9ccLgz0ZV43d4dkGVMSIn5UxNpkVjJF3tt+R99Y88jjA==
X-Received: by 2002:a17:902:8c8b:b029:d2:42fe:370a with SMTP id t11-20020a1709028c8bb02900d242fe370amr671414plo.83.1601058955266;
        Fri, 25 Sep 2020 11:35:55 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.35.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:35:54 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 47/47] staging: media: zoran: update TODO
Date:   Fri, 25 Sep 2020 18:30:57 +0000
Message-Id: <1601058657-14042-48-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update the TODO of the zoran driver

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/TODO | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/zoran/TODO b/drivers/staging/media/zoran/TODO
index 54464095d0d7..6992540d3e53 100644
--- a/drivers/staging/media/zoran/TODO
+++ b/drivers/staging/media/zoran/TODO
@@ -1,4 +1,19 @@
-The zoran driver is marked deprecated. It will be removed
-around May 2019 unless someone is willing to update this
-driver to the latest V4L2 frameworks (especially the vb2
-framework).
+
+How to test the zoran driver:
+- RAW capture
+	mplayer tv:///dev/video0 -tv driver=v4l2
+
+- MJPEG capture (compression)
+	mplayer tv:///dev/video0 -tv driver=v4l2:outfmt=mjpeg
+	TODO: need two test for both Dcim path
+
+- MJPEG play (decompression)
+	ffmpeg -i test.avi -vcodec mjpeg -an -f v4l2 /dev/video0
+	Note: only recent ffmpeg has the ability of sending non-raw video via v4l2
+
+	The original way of sending video was via mplayer vo_zr/vo_zr2, but it does not compile
+	anymore and is a dead end (usage of some old private ffmpeg structures).
+
+TODO
+- fix the v4l compliance "TRY_FMT cannot handle an invalid pixelformat"
+- Filter JPEG data to made output work
-- 
2.26.2

