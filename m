Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B117B15531C
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2020 08:40:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbgBGHk6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Feb 2020 02:40:58 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:53634 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbgBGHk6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Feb 2020 02:40:58 -0500
Received: by mail-pj1-f67.google.com with SMTP id n96so559636pjc.3
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2020 23:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K+lFsZ3D7frtdDjFKWe1aGa1gg1H8Ao5Is0znK6p0IQ=;
        b=B2H2rs1re6i1nnY3F52J+pN3K0qSaFUTXsvR/kHlXEC5q+GAsTwamOojZKavCOw06J
         04YDv8/X7jlq0QULXSIqHNVvk6xXg36c/FTbd9jONol/F0ACmVj6f4tkeKEHk4K1ZkIG
         u5j152fRtHwRIWFWySh1j5lmLHd7OmXZ2TQpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K+lFsZ3D7frtdDjFKWe1aGa1gg1H8Ao5Is0znK6p0IQ=;
        b=K27yKpMtpyDqpJFo5XXXsBMprl1snljdRovFHvQjrg1iewMb/q/3ldigxg+QMI36JF
         AGXTaNWEQz+aB+lHas47vgIW1pYJU1H4KJ01ZWhHbCMEheBtAadzgL5TLTOls7ub7tth
         I+wznJIyqcRWWVPiHw636L/dUKAHttOwF87GIvcGsfewYFmngvDG67F6PcAEY7St1vky
         1DdPuq3nw001ZGgCrxPMgG4pGCXnGEySjmSNiU/D+PxRcSYi654kiJ4cmrVyE5Gvqpd+
         7huyMF8rbTnN4yJIK4Z7C2/5u9fGd8NJEx/4f9EDoYgKLh3Iwz2H+gOjnDEHN5xjlNNF
         ntCg==
X-Gm-Message-State: APjAAAXTd0A2l+5bfLB5CyRYRuwyowx6JoBbtvfYVyboWWu+6xg4E3Q5
        QSQCTpOsoMOmSeQygWxJHZdg1w==
X-Google-Smtp-Source: APXvYqwUsuQh7DqVB3QPoHA+aQLMvwcNFHiiFLQVrPJb+M5Yxl0A/kd6Svz1dKsbIQlkD43XLUSFhQ==
X-Received: by 2002:a17:90a:a385:: with SMTP id x5mr2366982pjp.102.1581061257481;
        Thu, 06 Feb 2020 23:40:57 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:1f16:51f4:8631:68b2])
        by smtp.gmail.com with ESMTPSA id dw10sm1482749pjb.11.2020.02.06.23.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 23:40:57 -0800 (PST)
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
Subject: [RFC PATCH v3 2/2] virtio-gpu: add the ability to export resources
Date:   Fri,  7 Feb 2020 16:40:33 +0900
Message-Id: <20200207074033.172289-3-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200207074033.172289-1-stevensd@chromium.org>
References: <20200207074033.172289-1-stevensd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 virtio-gpu.tex | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/virtio-gpu.tex b/virtio-gpu.tex
index af4ca61..e950ad3 100644
--- a/virtio-gpu.tex
+++ b/virtio-gpu.tex
@@ -186,12 +186,16 @@ \subsubsection{Device Operation: Request header}\label{sec:Device Types / GPU De
         VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
         VIRTIO_GPU_CMD_MOVE_CURSOR,
 
+        /* misc commands */
+        VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID = 0x0400,
+
         /* success responses */
         VIRTIO_GPU_RESP_OK_NODATA = 0x1100,
         VIRTIO_GPU_RESP_OK_DISPLAY_INFO,
         VIRTIO_GPU_RESP_OK_CAPSET_INFO,
         VIRTIO_GPU_RESP_OK_CAPSET,
         VIRTIO_GPU_RESP_OK_EDID,
+        VIRTIO_GPU_RESP_OK_RESOURCE_ASSIGN_UUID,
 
         /* error responses */
         VIRTIO_GPU_RESP_ERR_UNSPEC = 0x1200,
@@ -454,6 +458,31 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
 This detaches any backing pages from a resource, to be used in case of
 guest swapping or object destruction.
 
+\item[VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID] Creates an exported object from
+  a resource. Request data is \field{struct
+    virtio_gpu_resource_assign_uuid}.  Response type is
+  VIRTIO_GPU_RESP_OK_RESOURCE_ASSIGN_UUID, response data is \field{struct
+    virtio_gpu_resp_resource_assign_uuid}.
+
+\begin{lstlisting}
+struct virtio_gpu_resource_assign_uuid {
+        struct virtio_gpu_ctrl_hdr hdr;
+        le32 resource_id;
+        le32 padding;
+};
+
+struct virtio_gpu_resp_resource_assign_uuid {
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
2.25.0.341.g760bfbb309-goog

