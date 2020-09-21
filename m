Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 327AE27206A
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgIUKV0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727036AbgIUKVU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:21:20 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAF90C0613D1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:19 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id b79so12014025wmb.4
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=S9MzB7+azPxcpMxlGiEMSs7z6RlW8asusze1qBJiaHc=;
        b=cqXso1WeXMsOQTSMJsnRpwW6vw8vb52dEKHkPuvZGM4VKop5MTyriQZCa2VAmgKXOr
         6c1e4BDDBKbJYdmtHs7EAJGjgrXlmHeffln/7gNXCUsNiyp/6bnDDzABtDtvgm83WBbu
         wpeVMsoLT2gdb7UfQkoUQ+K0wPFRtw0xbm6wokBSi3Zrb1vr1VOl0O94XHk98PWCgDnx
         HdNgaO/cwSEPz6RWMBmR8iMS3WJt8dd5N2QRjE1KkALT17HYzXNJug5lQ14x3Kcx3RF2
         dWxYAgtv5XGlFBpF/dOyX+MNmI88hbCjsdHMzpXpyHEVYOfX7Swy8MPkhGJHhh31ycDS
         Rxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=S9MzB7+azPxcpMxlGiEMSs7z6RlW8asusze1qBJiaHc=;
        b=fXXCSUadq54FgowD7XOKFjsiPv3S4iBjfF52S74GOWtIlxqZ9be2X5cplKwwt2tAYX
         Lfi8k9DHLPwMEXx3WwqlzL5PKfUPkoaUBbyEsvlzMmkerlFDfPCvKo0w+EvChcUvGdj5
         Ewk3HGeJjX28uzX+nf1HkWIJKI+8ZiV24rErAKP75q+rA0Ksxi5xju9M7s09SZyEr3zt
         b/WFYR3JB+VBMxoWfbztdtiLul15/jNUIZjQXeLdGeea0n3Lz83bJ87PDofAwKZdZIMH
         SDXSfHP/ZKwKbwk7DYhkK740VJ1YpQ5wqpk+fY3EVadVr1Z74cb62bcTlpobX7NGREHr
         xLAg==
X-Gm-Message-State: AOAM530CKHO7t4F5AJ0c34For7Fz5MFkUODpScyprDxoflYOdO/QYcn0
        3uwBcNZhB30+hLQUj6S1RtZtNUj16u8xFg==
X-Google-Smtp-Source: ABdhPJwLLiqE0xL9dMMevVsNtAO5akGgDxGF9LqBxoG4mXvA7KUeZ9nz/B8s78vAAAQzdhd3oK38Ig==
X-Received: by 2002:a7b:c317:: with SMTP id k23mr28413581wmj.44.1600683678660;
        Mon, 21 Sep 2020 03:21:18 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.21.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:21:18 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 49/49] staging: media: zoran: update TODO
Date:   Mon, 21 Sep 2020 10:20:24 +0000
Message-Id: <1600683624-5863-50-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
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

