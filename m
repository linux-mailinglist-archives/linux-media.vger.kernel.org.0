Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD98C133DC3
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 10:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbgAHJCO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 04:02:14 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:44673 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgAHJCO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 04:02:14 -0500
Received: by mail-qk1-f193.google.com with SMTP id w127so1929915qkb.11
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2020 01:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=YLJj0mJcsiWZwcGJQfC2/Am8KkGfccyx1B+T1mfpzBE=;
        b=B7I9lf3X8OH5s2QgLQ3VUszD2IKt6VUU85pFa9iNMdrEj2Pb0cry/HqqJQpH+smc2Q
         XWZzpInO4EfR2e6sPAErnlfGEfgLOJjoRhNbWmR1bf/PoNeaizCLcjabgqTUol9rlAYT
         ma76CbkvnWwjeFxZbl5yNP/fLZ1eyjohAIafU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=YLJj0mJcsiWZwcGJQfC2/Am8KkGfccyx1B+T1mfpzBE=;
        b=jQi8RSUF+Hk/sMSHi+2YJgSCznGRYlTTPLgAsrTn/hLFq1MNnk/HZydSuofIMCKc3j
         jb8SiVSb5IVNDkubrK3dyl6zOgPSQVUm41kftt4aUWLK0kI8OzwlJx1D2wLFFliaXvhH
         9nX+AgFrAj0qDqWc81ZcAxRC2GDm4Njsm+xKT0bZydd+vJX6akC9HTB7pUMZZuUQF6GZ
         tOWar1cwLp5gupkVXVUy6sOKMFeRur/aHvdNoYY0ZlE8qXtnchx9Q8OumlEzDc3McPGB
         1mcLQS1g1gB7QEpSBFZY/4NRb/hizRheaREaoyDxcnTEUYlRhjMwkM+qeH7kKvlK5B87
         Ywmg==
X-Gm-Message-State: APjAAAViHktADGsigCgwUd9mMmJXBjVwnS/KBsk1Jmxx5Ibyqww+XNGf
        t2qx1VdtUVNLGfCsW9AAyy0f3ZhZr+3wThLhi0jJqw==
X-Google-Smtp-Source: APXvYqyOhO7E4NDMVSLVTTWbMjBEmnBCWdbVQupSDkJ7fdK3WLAPNZj4EXc3WCQxkYsMxMB5lMPtNcFY2kFCzAPiZ2w=
X-Received: by 2002:a05:620a:817:: with SMTP id s23mr3310134qks.391.1578474133357;
 Wed, 08 Jan 2020 01:02:13 -0800 (PST)
MIME-Version: 1.0
From:   David Stevens <stevensd@chromium.org>
Date:   Wed, 8 Jan 2020 18:02:02 +0900
Message-ID: <CAD=HUj5U-TxqbPJiRRbyMHON21sht75q3nisvwvKrO+Bf=n8ng@mail.gmail.com>
Subject: [virtio-dev][RFC PATCH v1 2/2] virtio-gpu: add the ability to export resources
To:     virtio-dev@lists.oasis-open.org, Gerd Hoffmann <kraxel@redhat.com>,
        Dylan Reid <dgreid@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 virtio-gpu.tex | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/virtio-gpu.tex b/virtio-gpu.tex
index af4ca61..522f478 100644
--- a/virtio-gpu.tex
+++ b/virtio-gpu.tex
@@ -186,12 +186,16 @@ \subsubsection{Device Operation: Request
header}\label{sec:Device Types / GPU De
         VIRTIO_GPU_CMD_UPDATE_CURSOR = 0x0300,
         VIRTIO_GPU_CMD_MOVE_CURSOR,

+        /* misc commands */
+        VIRTIO_GPU_CMD_EXPORT_RESOURCE = 0x0400,
+
         /* success responses */
         VIRTIO_GPU_RESP_OK_NODATA = 0x1100,
         VIRTIO_GPU_RESP_OK_DISPLAY_INFO,
         VIRTIO_GPU_RESP_OK_CAPSET_INFO,
         VIRTIO_GPU_RESP_OK_CAPSET,
         VIRTIO_GPU_RESP_OK_EDID,
+        VIRTIO_GPU_RESP_OK_EXPORT_RESOURCE,

         /* error responses */
         VIRTIO_GPU_RESP_ERR_UNSPEC = 0x1200,
@@ -454,6 +458,31 @@ \subsubsection{Device Operation:
controlq}\label{sec:Device Types / GPU Device /
 This detaches any backing pages from a resource, to be used in case of
 guest swapping or object destruction.

+\item[VIRTIO_GPU_CMD_EXPORT_RESOURCE] Exports a resource for use by other
+  virtio devices. Request data is \field{struct
+    virtio_gpu_export_resource}.  Response type is
+  VIRTIO_GPU_RESP_OK_EXPORT_RESOURCE, response data is \field{struct
+    virtio_gpu_resp_export_resource}.
+
+\begin{lstlisting}
+struct virtio_gpu_export_resource {
+        struct virtio_gpu_ctrl_hdr hdr;
+        le32 resource_id;
+        le32 padding;
+};
+
+struct virtio_gpu_resp_export_resource {
+        struct virtio_gpu_ctrl_hdr hdr;
+        le64 uuid_low;
+        le64 uuid_high;
+};
+\end{lstlisting}
+
+The response contains a uuid which identifies the host private resource to
+other virtio devices. Note that if the resource has an attached backing,
+modifications made to an exported resource by other devices are not visible
+in the attached backing until they are transferred into the backing.
+
 \end{description}

 \subsubsection{Device Operation: cursorq}\label{sec:Device Types /
GPU Device / Device Operation / Device Operation: cursorq}
-- 
2.24.1.735.g03f4e72817-goog
