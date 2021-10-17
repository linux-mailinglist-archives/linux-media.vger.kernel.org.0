Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1148E430A8E
	for <lists+linux-media@lfdr.de>; Sun, 17 Oct 2021 18:21:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344135AbhJQQXW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 12:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344103AbhJQQXQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 12:23:16 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF26AC06176C;
        Sun, 17 Oct 2021 09:21:06 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 133so13550028pgb.1;
        Sun, 17 Oct 2021 09:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kPQMaAl18vlXvtzY3u2mFwVBriklZfpAQgwXY9rKh7o=;
        b=nMgftG/DJnSH7FCQYuApWdUYV+mxq1ZnJSRJjmHhsiR1b/igSdXAML30k1n/UfRUx7
         P/Cxy1p3Kl5tx2kDt6hrTthg0WnjWP6YykTL9HvhPkp2adma+BPr9W1zS5Y1sfXaGKLy
         jBdOdtDMKDC8x7fWcqQ+t9prMgAyQwOtpnEblfAPyVENuPdZObTboG2xnRG6BX5Ldb6J
         wvxbEmthg3ey5k+sX4MJQ+y/DTpd9IsYZZihsvf8wO97Y13FcsgnVc8i9iaAu8HzB/8g
         5U+C7Gf4UGvQPSOcyeYLpx40dGvyBZdPXGyq2/1ldP+EUlOBWUwj7a6nMTfdxhpeSnl3
         iQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kPQMaAl18vlXvtzY3u2mFwVBriklZfpAQgwXY9rKh7o=;
        b=gx+W+oL0Ki3uTWzYAEVa4rE5k1ToSq3R+NKPz1c3GeiFPA0ZZSW1u1SvQaf1wjodDH
         gluEPo5rt9nrs8LDQboXRmwffDgMpNApsBF6rIAbxVphUWNSLEVomADrPxHXEsEu+qbO
         cgxOGpqcJ0GVSXwRHnMGgEL6Xk0+i78YkZl1mNwGgYPI2Ew75MFqAiD0C6eMeR7MwRSe
         WsSTgOr6obKGLjCzE3e1wGteA7A77zzgPKSc6nj9/TpKDDgUk/lDXyOXH1xXQhxz4N/V
         mVeYfyaPjeyE9M32OzWLBXq8x21VtHtGoLYzuXq/Sa+amORG1X22JUoupTeaKLUtzhhF
         h1TQ==
X-Gm-Message-State: AOAM530vFTGWGrsRfQC7noNMlX0qMjQrOxvoPhWkEqBWLYW5NslInoOn
        Wuqe1s1zdQGYaDjxZriTn/A=
X-Google-Smtp-Source: ABdhPJwylO8lupxyYn8xSrX8xDfdHl+dQQeZXlCuVVmcKZ/ex48H0ClPY3krGCeMRZNLTxdK7A5Sng==
X-Received: by 2002:a62:1c4e:0:b0:44d:76b:de98 with SMTP id c75-20020a621c4e000000b0044d076bde98mr24413785pfc.16.1634487666153;
        Sun, 17 Oct 2021 09:21:06 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:21:05 -0700 (PDT)
From:   Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Alan <alan@linux.intel.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Deepak R Varma <drv@mailo.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/17] media: atomisp: pci: fix inverted error check for ia_css_mipi_is_source_port_valid()
Date:   Mon, 18 Oct 2021 01:19:45 +0900
Message-Id: <20211017161958.44351-6-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function ia_css_mipi_is_source_port_valid() returns true if the port
is valid. So, we can't use the existing err variable as is.

To fix this issue while reusing that variable, invert the return value
when assigning it to the variable.

Fixes: 3c0538fbad9f ("media: atomisp: get rid of most checks for ISP2401 version")
Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 65fc93c5d56b..c1f2f6151c5f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -423,10 +423,12 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 		return 0; /* AM TODO: Check  */
 	}
 
-	if (!IS_ISP2401)
+	if (!IS_ISP2401) {
 		port = (unsigned int)pipe->stream->config.source.port.port;
-	else
-		err = ia_css_mipi_is_source_port_valid(pipe, &port);
+	} else {
+		/* Returns true if port is valid. So, invert it */
+		err = !ia_css_mipi_is_source_port_valid(pipe, &port);
+	}
 
 	assert(port < N_CSI_PORTS);
 
@@ -553,10 +555,12 @@ free_mipi_frames(struct ia_css_pipe *pipe)
 			return err;
 		}
 
-		if (!IS_ISP2401)
+		if (!IS_ISP2401) {
 			port = (unsigned int)pipe->stream->config.source.port.port;
-		else
-			err = ia_css_mipi_is_source_port_valid(pipe, &port);
+		} else {
+			/* Returns true if port is valid. So, invert it */
+			err = !ia_css_mipi_is_source_port_valid(pipe, &port);
+		}
 
 		assert(port < N_CSI_PORTS);
 
@@ -665,10 +669,12 @@ send_mipi_frames(struct ia_css_pipe *pipe)
 		/* TODO: AM: maybe this should be returning an error. */
 	}
 
-	if (!IS_ISP2401)
+	if (!IS_ISP2401) {
 		port = (unsigned int)pipe->stream->config.source.port.port;
-	else
-		err = ia_css_mipi_is_source_port_valid(pipe, &port);
+	} else {
+		/* Returns true if port is valid. So, invert it */
+		err = !ia_css_mipi_is_source_port_valid(pipe, &port);
+	}
 
 	assert(port < N_CSI_PORTS);
 
-- 
2.33.1

