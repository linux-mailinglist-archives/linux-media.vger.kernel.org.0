Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 279E2321AFD
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 16:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhBVPOU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 10:14:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbhBVPNu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 10:13:50 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52337C061794;
        Mon, 22 Feb 2021 07:12:48 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id v21so785156wml.4;
        Mon, 22 Feb 2021 07:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YByzcYLbOT1FbVq7W/iPz1yV9tO4yNodoZHiZ+8vsb4=;
        b=R5bTKuwSZfiTHw6sQBKH/77xOM7ENB9Wls1sA2mT5ciYD1/ZMOeou2Exj8X3p+MbPY
         cUoivQD3TUa4RigPCyw3YoC3o1vIfe8umtW75zeiIxpZfHKb/h6bxwZVexAZHXWmDLBm
         OEcua6ZvtH4jIMiyhrS56W0+nTqUXMm7bN5XC1qRoxtiJiKLYdQD7gTbCoNU3lS1l0E2
         gIRp+GBzjvJxR3vo1aYTFOBh4bfPnPbk7dx5MsQeOya+siDPjpnDs26vCPWnenTSPN/v
         yVHVAt/sq16RjIBcpQYcl9AiT1IKbIeB3AC7Y+i4njEdWtdOqL0QAaG43ySBwD+7AMlJ
         fI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YByzcYLbOT1FbVq7W/iPz1yV9tO4yNodoZHiZ+8vsb4=;
        b=KPNvnTkPndu4kC2L2XTV4jHVNCzMhtPwUIMAWH/0LahY2NtKx/2K7ajAnUvFm+Uevt
         2fjCs2xXQDct2W2ioY+qxqBZJoEFM9Ejp+/ygAvZz4DTn0fOlgcdDOWPsp3rwaCiiPqF
         Q9PdgBeJVGt7JGgdA9U7HUrdpZIYy02Pxk7c+mymr29w0WzCMfcRRHCLwgKoPOzaf3bL
         fD2oBzBsYcWVTtfprYy4jw5v5W3AFYPhRpXxIuGbyDoZDBNqOSLq85ASEFuVXUd+2ZPH
         SuIs6wnillkR3t+9eygMtwm4mbXdoHseL4gJR+o2Pny9cGGr2VwAQVnaddnGLHmfeFdp
         wbaQ==
X-Gm-Message-State: AOAM532icpWPfVk7JawOaJRAZlRlFbwpfyR0dbY//hxhlL40cnCLP6f8
        lMR8SDGTdgcwMvqcAcJgsj/AtKiO6h9AFQl8nWs=
X-Google-Smtp-Source: ABdhPJxU2vGpa+8wC1SXGOcCy8k2fmqGbntcVq+4bVDVPsoZbAKl5HHMxz/ILTdabK3Q5VQIwNIKDw==
X-Received: by 2002:a7b:c184:: with SMTP id y4mr13880282wmi.1.1614006766877;
        Mon, 22 Feb 2021 07:12:46 -0800 (PST)
Received: from debby (176-141-241-253.abo.bbox.fr. [176.141.241.253])
        by smtp.gmail.com with ESMTPSA id m17sm24783523wmq.5.2021.02.22.07.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 07:12:46 -0800 (PST)
From:   Romain Perier <romain.perier@gmail.com>
To:     Kees Cook <keescook@chromium.org>,
        kernel-hardening@lists.openwall.com,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     Romain Perier <romain.perier@gmail.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/20] dma-buf: Manual replacement of the deprecated strlcpy() with return values
Date:   Mon, 22 Feb 2021 16:12:15 +0100
Message-Id: <20210222151231.22572-5-romain.perier@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210222151231.22572-1-romain.perier@gmail.com>
References: <20210222151231.22572-1-romain.perier@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The strlcpy() reads the entire source buffer first, it is dangerous if
the source buffer lenght is unbounded or possibility non NULL-terminated.
It can lead to linear read overflows, crashes, etc...

As recommended in the deprecated interfaces [1], it should be replaced
by strscpy.

This commit replaces all calls to strlcpy that handle the return values
by the corresponding strscpy calls with new handling of the return
values (as it is quite different between the two functions).

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#strlcpy

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 drivers/dma-buf/dma-buf.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index f264b70c383e..515192f2f404 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -42,12 +42,12 @@ static char *dmabuffs_dname(struct dentry *dentry, char *buffer, int buflen)
 {
 	struct dma_buf *dmabuf;
 	char name[DMA_BUF_NAME_LEN];
-	size_t ret = 0;
+	ssize_t ret = 0;
 
 	dmabuf = dentry->d_fsdata;
 	spin_lock(&dmabuf->name_lock);
 	if (dmabuf->name)
-		ret = strlcpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
+		ret = strscpy(name, dmabuf->name, DMA_BUF_NAME_LEN);
 	spin_unlock(&dmabuf->name_lock);
 
 	return dynamic_dname(dentry, buffer, buflen, "/%s:%s",

