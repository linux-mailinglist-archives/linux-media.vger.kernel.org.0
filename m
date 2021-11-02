Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCE0442C58
	for <lists+linux-media@lfdr.de>; Tue,  2 Nov 2021 12:17:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhKBLU1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Nov 2021 07:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbhKBLU0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Nov 2021 07:20:26 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7402C061714
        for <linux-media@vger.kernel.org>; Tue,  2 Nov 2021 04:17:51 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id p17so233802pgj.2
        for <linux-media@vger.kernel.org>; Tue, 02 Nov 2021 04:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6BbiYGCWZ9oA11IXsM4g9iCDwy7d2DhEnfzao2K+WyE=;
        b=f3BolyPW6EfXoyWlN7Zlqf31zIr4U9jDAyCud9gmRbcYVlrVwjCfEXHPXKMibAi3Pv
         RNtNMXKUad0EGUsWMeg3dTR5y3XSg0a2xjZDyVyOtWpBcV7VA9u1k8s18VhlzxywKXJe
         OF1MqmGGmsmwfkl+Qn/9YkJTZTeuQ7okYuXQ2n2FCSNhrsNzgGyoARREa6YgkAUA4yOv
         ecMe2qogz4om8rDOhN9dB2GUhWd60LbS/GDUgGookpsHJ2jCuRqaFdvvPzAoGpjvp7T+
         uBH4zByoZSWrldkvLMTGOA1LIsr/xiQVMaAaNUeqqKcwyGweJAr5chVriDFQXuftD6f7
         x3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6BbiYGCWZ9oA11IXsM4g9iCDwy7d2DhEnfzao2K+WyE=;
        b=GWnqre3l/SHZ0PK3hHNjqI1UFpYMXmV69BsiCZ5MgB0c+hJJgFBvS8S138mYn8aW3/
         Etusl1yynPyvUHdEFDmN6IexDfGB3UW9qv3eN1qot2Gb9YSknDO4kEnrf1DhcIMrqOlB
         NNUlQ1YEgTHRHtIAwdixMqnWGhQUKMLuirUlZ02SUsjlhGnbgH83y66wvLBTAivObK2w
         lVZ51fBZNr/KgXytMCg3pI/1PmPmi+gViQq7EsPdzEM1tLA0T9/2u9DPaakwVM1G7jA2
         4G9ONZbGOG4MPEEs+QIhOeuywY8gESVT0LetkVZ8uiIKbxV+vZRmuOmi8F6naNkBHq7Y
         KZsQ==
X-Gm-Message-State: AOAM533JixHk3YMcw1LjkKmwJyQXQ8IqJTbfkODP1s4daNulF7YRWM+Q
        dnAt6HLGJzdwy0UAvYPORjKOgMvzovdJUw==
X-Google-Smtp-Source: ABdhPJwJybFBbKB9ITj7K6tvqIjTSiVvTEa+laeNrYbjXeZA3zXII2zq7Nl+VPPo60kCnRuGhv7+NA==
X-Received: by 2002:aa7:8d09:0:b0:44b:fd25:dd8a with SMTP id j9-20020aa78d09000000b0044bfd25dd8amr36166697pfe.41.1635851871368;
        Tue, 02 Nov 2021 04:17:51 -0700 (PDT)
Received: from localhost.localdomain ([121.165.1.144])
        by smtp.gmail.com with ESMTPSA id a15sm2151206pfv.90.2021.11.02.04.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 04:17:51 -0700 (PDT)
From:   Kwang Son <dev.kwang.son@gmail.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org
Subject: [PATCH] media: docs: Fix newline typo
Date:   Tue,  2 Nov 2021 20:17:47 +0900
Message-Id: <20211102111747.19755-1-dev.kwang.son@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix example code which has missing or double backslash typo.

Signed-off-by: Kwang Son <dev.kwang.son@gmail.com>
---
 .../userspace-api/media/v4l/capture.c.rst     | 52 +++++++++----------
 .../userspace-api/media/v4l/v4l2grab.c.rst    |  8 +--
 2 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/capture.c.rst b/Documentation/userspace-api/media/v4l/capture.c.rst
index ccbd52c3897f..eef6772967a1 100644
--- a/Documentation/userspace-api/media/v4l/capture.c.rst
+++ b/Documentation/userspace-api/media/v4l/capture.c.rst
@@ -56,7 +56,7 @@ file: media/v4l/capture.c
 
     static void errno_exit(const char *s)
     {
-	    fprintf(stderr, "%s error %d, %s\\n", s, errno, strerror(errno));
+	    fprintf(stderr, "%s error %d, %s\n", s, errno, strerror(errno));
 	    exit(EXIT_FAILURE);
     }
 
@@ -201,7 +201,7 @@ file: media/v4l/capture.c
 			    }
 
 			    if (0 == r) {
-				    fprintf(stderr, "select timeout\\n");
+				    fprintf(stderr, "select timeout\n");
 				    exit(EXIT_FAILURE);
 			    }
 
@@ -307,7 +307,7 @@ file: media/v4l/capture.c
 	    buffers = calloc(1, sizeof(*buffers));
 
 	    if (!buffers) {
-		    fprintf(stderr, "Out of memory\\n");
+		    fprintf(stderr, "Out of memory\n");
 		    exit(EXIT_FAILURE);
 	    }
 
@@ -315,7 +315,7 @@ file: media/v4l/capture.c
 	    buffers[0].start = malloc(buffer_size);
 
 	    if (!buffers[0].start) {
-		    fprintf(stderr, "Out of memory\\n");
+		    fprintf(stderr, "Out of memory\n");
 		    exit(EXIT_FAILURE);
 	    }
     }
@@ -341,7 +341,7 @@ file: media/v4l/capture.c
 	    }
 
 	    if (req.count < 2) {
-		    fprintf(stderr, "Insufficient buffer memory on %s\\n",
+		    fprintf(stderr, "Insufficient buffer memory on %s\n",
 			     dev_name);
 		    exit(EXIT_FAILURE);
 	    }
@@ -349,7 +349,7 @@ file: media/v4l/capture.c
 	    buffers = calloc(req.count, sizeof(*buffers));
 
 	    if (!buffers) {
-		    fprintf(stderr, "Out of memory\\n");
+		    fprintf(stderr, "Out of memory\n");
 		    exit(EXIT_FAILURE);
 	    }
 
@@ -401,7 +401,7 @@ file: media/v4l/capture.c
 	    buffers = calloc(4, sizeof(*buffers));
 
 	    if (!buffers) {
-		    fprintf(stderr, "Out of memory\\n");
+		    fprintf(stderr, "Out of memory\n");
 		    exit(EXIT_FAILURE);
 	    }
 
@@ -410,7 +410,7 @@ file: media/v4l/capture.c
 		    buffers[n_buffers].start = malloc(buffer_size);
 
 		    if (!buffers[n_buffers].start) {
-			    fprintf(stderr, "Out of memory\\n");
+			    fprintf(stderr, "Out of memory\n");
 			    exit(EXIT_FAILURE);
 		    }
 	    }
@@ -426,7 +426,7 @@ file: media/v4l/capture.c
 
 	    if (-1 == xioctl(fd, VIDIOC_QUERYCAP, &cap)) {
 		    if (EINVAL == errno) {
-			    fprintf(stderr, "%s is no V4L2 device\\n",
+			    fprintf(stderr, "%s is no V4L2 device\n",
 				     dev_name);
 			    exit(EXIT_FAILURE);
 		    } else {
@@ -435,7 +435,7 @@ file: media/v4l/capture.c
 	    }
 
 	    if (!(cap.capabilities & V4L2_CAP_VIDEO_CAPTURE)) {
-		    fprintf(stderr, "%s is no video capture device\\n",
+		    fprintf(stderr, "%s is no video capture device\n",
 			     dev_name);
 		    exit(EXIT_FAILURE);
 	    }
@@ -443,7 +443,7 @@ file: media/v4l/capture.c
 	    switch (io) {
 	    case IO_METHOD_READ:
 		    if (!(cap.capabilities & V4L2_CAP_READWRITE)) {
-			    fprintf(stderr, "%s does not support read i/o\\n",
+			    fprintf(stderr, "%s does not support read i/o\n",
 				     dev_name);
 			    exit(EXIT_FAILURE);
 		    }
@@ -452,7 +452,7 @@ file: media/v4l/capture.c
 	    case IO_METHOD_MMAP:
 	    case IO_METHOD_USERPTR:
 		    if (!(cap.capabilities & V4L2_CAP_STREAMING)) {
-			    fprintf(stderr, "%s does not support streaming i/o\\n",
+			    fprintf(stderr, "%s does not support streaming i/o\n",
 				     dev_name);
 			    exit(EXIT_FAILURE);
 		    }
@@ -541,7 +541,7 @@ file: media/v4l/capture.c
 	    struct stat st;
 
 	    if (-1 == stat(dev_name, &st)) {
-		    fprintf(stderr, "Cannot identify '%s': %d, %s\\n",
+		    fprintf(stderr, "Cannot identify '%s': %d, %s\n",
 			     dev_name, errno, strerror(errno));
 		    exit(EXIT_FAILURE);
 	    }
@@ -554,7 +554,7 @@ file: media/v4l/capture.c
 	    fd = open(dev_name, O_RDWR /* required */ | O_NONBLOCK, 0);
 
 	    if (-1 == fd) {
-		    fprintf(stderr, "Cannot open '%s': %d, %s\\n",
+		    fprintf(stderr, "Cannot open '%s': %d, %s\n",
 			     dev_name, errno, strerror(errno));
 		    exit(EXIT_FAILURE);
 	    }
@@ -563,17 +563,17 @@ file: media/v4l/capture.c
     static void usage(FILE *fp, int argc, char **argv)
     {
 	    fprintf(fp,
-		     "Usage: %s [options]\\n\\n"
-		     "Version 1.3\\n"
-		     "Options:\\n"
-		     "-d | --device name   Video device name [%s]n"
-		     "-h | --help          Print this messagen"
-		     "-m | --mmap          Use memory mapped buffers [default]n"
-		     "-r | --read          Use read() callsn"
-		     "-u | --userp         Use application allocated buffersn"
-		     "-o | --output        Outputs stream to stdoutn"
-		     "-f | --format        Force format to 640x480 YUYVn"
-		     "-c | --count         Number of frames to grab [%i]n"
+		     "Usage: %s [options]\n\n"
+		     "Version 1.3\n"
+		     "Options:\n"
+		     "-d | --device name   Video device name [%s]\n"
+		     "-h | --help          Print this message\n"
+		     "-m | --mmap          Use memory mapped buffers [default]\n"
+		     "-r | --read          Use read() calls\n"
+		     "-u | --userp         Use application allocated buffers\n"
+		     "-o | --output        Outputs stream to stdout\n"
+		     "-f | --format        Force format to 640x480 YUYV\n"
+		     "-c | --count         Number of frames to grab [%i]\n"
 		     "",
 		     argv[0], dev_name, frame_count);
     }
@@ -659,6 +659,6 @@ file: media/v4l/capture.c
 	    stop_capturing();
 	    uninit_device();
 	    close_device();
-	    fprintf(stderr, "\\n");
+	    fprintf(stderr, "\n");
 	    return 0;
     }
diff --git a/Documentation/userspace-api/media/v4l/v4l2grab.c.rst b/Documentation/userspace-api/media/v4l/v4l2grab.c.rst
index eaa0f95048e7..b38f661da733 100644
--- a/Documentation/userspace-api/media/v4l/v4l2grab.c.rst
+++ b/Documentation/userspace-api/media/v4l/v4l2grab.c.rst
@@ -46,7 +46,7 @@ file: media/v4l/v4l2grab.c
 	    } while (r == -1 && ((errno == EINTR) || (errno == EAGAIN)));
 
 	    if (r == -1) {
-		    fprintf(stderr, "error %d, %s\\n", errno, strerror(errno));
+		    fprintf(stderr, "error %d, %s\n", errno, strerror(errno));
 		    exit(EXIT_FAILURE);
 	    }
     }
@@ -80,11 +80,11 @@ file: media/v4l/v4l2grab.c
 	    fmt.fmt.pix.field       = V4L2_FIELD_INTERLACED;
 	    xioctl(fd, VIDIOC_S_FMT, &fmt);
 	    if (fmt.fmt.pix.pixelformat != V4L2_PIX_FMT_RGB24) {
-		    printf("Libv4l didn't accept RGB24 format. Can't proceed.\\n");
+		    printf("Libv4l didn't accept RGB24 format. Can't proceed.\n");
 		    exit(EXIT_FAILURE);
 	    }
 	    if ((fmt.fmt.pix.width != 640) || (fmt.fmt.pix.height != 480))
-		    printf("Warning: driver is sending image at %dx%d\\n",
+		    printf("Warning: driver is sending image at %dx%d\n",
 			    fmt.fmt.pix.width, fmt.fmt.pix.height);
 
 	    CLEAR(req);
@@ -151,7 +151,7 @@ file: media/v4l/v4l2grab.c
 			    perror("Cannot open image");
 			    exit(EXIT_FAILURE);
 		    }
-		    fprintf(fout, "P6\\n%d %d 255\\n",
+		    fprintf(fout, "P6\n%d %d 255\n",
 			    fmt.fmt.pix.width, fmt.fmt.pix.height);
 		    fwrite(buffers[buf.index].start, buf.bytesused, 1, fout);
 		    fclose(fout);
-- 
2.25.1

