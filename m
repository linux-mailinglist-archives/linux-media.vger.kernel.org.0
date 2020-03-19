Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48EB918AA99
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 03:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgCSCSr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 22:18:47 -0400
Received: from mail-pl1-f180.google.com ([209.85.214.180]:39497 "EHLO
        mail-pl1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgCSCSr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 22:18:47 -0400
Received: by mail-pl1-f180.google.com with SMTP id m1so348436pll.6
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2020 19:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N1Zou9g3kOpovEPiLX1RjUrhPNeCP8eY2KNWCUQTCG4=;
        b=aAYKaD5hXQz4nJWmWdoEb5Skgi/qTb9l9vp+6LzCAZRNfaJe8kilk2IdLVZHFqQvsX
         xEMJNJezpcGfyHocz8a64j12ZNDFBnZRXEv41Hg4aXctgy4Jdk0vZ+46q+ygPv/g+AI7
         qcwpL4XBMW33MXM12kYQuh/1TgiT3ewv/29d0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N1Zou9g3kOpovEPiLX1RjUrhPNeCP8eY2KNWCUQTCG4=;
        b=izmsz5J6ZyjxPIblG0UO3ZBThjhH2SI9QLfAAiw++DR5Eg4rpszfbqHmPoGxU+1UfR
         ry1ioReyLU0f9vs7RKrx1zZb9F7atL4t0gXL7oTQGXaDeHn/rIVrY5KVFX6kHVimHaaO
         vJlHUnwGG83QHv/wwBIxjV3X3N8Zav2G+omi8b64epmlumUlGQ1YKGBfGXaWzkKtbryP
         dKWqT2kFR0eFxvg3rNV3EgzZEXXhab5ALZ9V0G1FB9w58yqp/H8IppJhVBayHlRzpB3O
         y0NkP13z4lvB1FJ+PzoW+nTyBOlMce+OvUou/bg60gSByRYrNeJABlO2lckgGJudUiw2
         9ZeA==
X-Gm-Message-State: ANhLgQ3B/vahDDSGMBRehjrHF490NnSLCM2d9B5z59rARF6S7SvP8SZK
        jigiM/D2c/tVsVEBbdoJQ6lnEQ==
X-Google-Smtp-Source: ADFU+vtE7S8SgklW7D0s/jGCM8v62Wug2+KP+L5Qt3hs5eR8MSAtHC0RMzYyuHEp+K2oo2rbMWIgNQ==
X-Received: by 2002:a17:90a:7105:: with SMTP id h5mr1329758pjk.54.1584584324391;
        Wed, 18 Mar 2020 19:18:44 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
        by smtp.gmail.com with ESMTPSA id q9sm325194pgs.89.2020.03.18.19.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2020 19:18:44 -0700 (PDT)
From:   David Stevens <stevensd@chromium.org>
To:     virtio-comment@lists.oasis-open.org
Cc:     Gerd Hoffmann <kraxel@redhat.com>,
        Dylan Reid <dgreid@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        David Stevens <stevensd@chromium.org>
Subject: [PATCH v4 2/2] virtio-gpu: add the ability to export resources
Date:   Thu, 19 Mar 2020 11:18:23 +0900
Message-Id: <20200319021823.57219-3-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200319021823.57219-1-stevensd@chromium.org>
References: <20200319021823.57219-1-stevensd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 virtio-gpu.tex | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/virtio-gpu.tex b/virtio-gpu.tex
index af4ca61..e75aafa 100644
--- a/virtio-gpu.tex
+++ b/virtio-gpu.tex
@@ -35,6 +35,8 @@ \subsection{Feature bits}\label{sec:Device Types / GPU Device / Feature bits}
 \begin{description}
 \item[VIRTIO_GPU_F_VIRGL (0)] virgl 3D mode is supported.
 \item[VIRTIO_GPU_F_EDID  (1)] EDID is supported.
+\item[VIRTIO_GPU_F_RESOURCE_UUID (2)] assigning resources UUIDs for export
+  to other virtio devices is supported.
 \end{description}
 
 \subsection{Device configuration layout}\label{sec:Device Types / GPU Device / Device configuration layout}
@@ -181,6 +183,7 @@ \subsubsection{Device Operation: Request header}\label{sec:Device Types / GPU De
         VIRTIO_GPU_CMD_GET_CAPSET_INFO,
         VIRTIO_GPU_CMD_GET_CAPSET,
         VIRTIO_GPU_CMD_GET_EDID,
+        VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID,
 
         /* cursor commands */
         VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
@@ -192,6 +195,7 @@ \subsubsection{Device Operation: Request header}\label{sec:Device Types / GPU De
         VIRTIO_GPU_RESP_OK_CAPSET_INFO,
         VIRTIO_GPU_RESP_OK_CAPSET,
         VIRTIO_GPU_RESP_OK_EDID,
+        VIRTIO_GPU_RESP_OK_RESOURCE_UUID,
 
         /* error responses */
         VIRTIO_GPU_RESP_ERR_UNSPEC = 0x1200,
@@ -454,6 +458,32 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
 This detaches any backing pages from a resource, to be used in case of
 guest swapping or object destruction.
 
+\item[VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID] Creates an exported object from
+  a resource. Request data is \field{struct
+    virtio_gpu_resource_assign_uuid}.  Response type is
+  VIRTIO_GPU_RESP_OK_RESOURCE_UUID, response data is \field{struct
+    virtio_gpu_resp_resource_uuid}. Support is optional and negotiated
+    using the VIRTIO_GPU_F_RESOURCE_UUID feature flag.
+
+\begin{lstlisting}
+struct virtio_gpu_resource_assign_uuid {
+        struct virtio_gpu_ctrl_hdr hdr;
+        le32 resource_id;
+        le32 padding;
+};
+
+struct virtio_gpu_resp_resource_uuid {
+        struct virtio_gpu_ctrl_hdr hdr;
+        u8 uuid[16];
+};
+\end{lstlisting}
+
+The response contains a UUID which identifies the exported object created from
+the host private resource. Note that if the resource has an attached backing,
+modifications made to the host private resource through the exported object by
+other devices are not visible in the attached backing until they are transferred
+into the backing.
+
 \end{description}
 
 \subsubsection{Device Operation: cursorq}\label{sec:Device Types / GPU Device / Device Operation / Device Operation: cursorq}
-- 
2.25.1.481.gfbce0eb801-goog

