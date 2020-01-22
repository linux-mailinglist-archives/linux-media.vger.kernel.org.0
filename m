Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E02B7144C60
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 08:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726231AbgAVHQr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 02:16:47 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:46467 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgAVHQq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 02:16:46 -0500
Received: by mail-qk1-f196.google.com with SMTP id r14so5420719qke.13
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2020 23:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=ruTth2SibQcS4nk9Gf6g9LTfMVTSZKHhb1gYl0J71UE=;
        b=WUTU484rqARIGpOr209E6p6EtWXiw3rCoM/7LGnsB+Udc1fuDNKvJnxaPCf3xJct/0
         ZBr2o3wgiKDJ7evtT++c3Optb1vklYeurO5XXbe8X8ax3JjPYmIt6yeyEp0iCWiJWi5e
         1B/++Q55mz8TxogKqa0W09ib6Fmc8IK7oG1zM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=ruTth2SibQcS4nk9Gf6g9LTfMVTSZKHhb1gYl0J71UE=;
        b=JHCy7rNQQlW42UiBlGN7XapW+edu7yC1xxBYcAFvNGNr4vzY/MYbjSa2APf4rQEUvy
         YEown2RX2RJQkzBXaT4Zt+TRapBQ7D/WWLzluNKzazD6K8waXSgt8JiVBJSgJrd4o4P+
         7BlVTDRcCioiACRt65kO8/2OprQIr0To+9h5Jt1Hbs5m4SThPdXvehZ5txjpY3D/xcXt
         hQNFr0gEJrFC32SfIxAnl+Nu2Ca0jDctsbe9UkQdhz1gq4kk/HPi03hpkX2xGw3GhBka
         5jDQCksyrzcFgh4QdEJGOt/DWB1taDSIuekzwjcPBfL2xPU29zFBmNJSBVzh6ox99mGK
         E5OA==
X-Gm-Message-State: APjAAAVkJUebmfA02JMvOjH8TT6Zz4ZCH4JebzRSdzjndBBVp0dO5KYe
        znQlwd5VM5byp/5gHh9wfJl+8RLj9ZYmZSPovjeyKA==
X-Google-Smtp-Source: APXvYqxMdoQBEZzRhyTMnhf8TLG9ar6fdpwRZltYldYlEOkgyU4Jw9cUYTNHnaqSyrJprSWLpXLpo2br6QqFcOdBoYQ=
X-Received: by 2002:a05:620a:101b:: with SMTP id z27mr8188226qkj.241.1579677405843;
 Tue, 21 Jan 2020 23:16:45 -0800 (PST)
MIME-Version: 1.0
From:   David Stevens <stevensd@chromium.org>
Date:   Wed, 22 Jan 2020 16:16:35 +0900
Message-ID: <CAD=HUj7N8dpEvf0Be8fg-qpFFTQOqzZX_kVoFB=BWp8S4uEFvg@mail.gmail.com>
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
 virtio-gpu.tex | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/virtio-gpu.tex b/virtio-gpu.tex
index af4ca61..a1f0210 100644
--- a/virtio-gpu.tex
+++ b/virtio-gpu.tex
@@ -186,12 +186,16 @@ \subsubsection{Device Operation: Request
header}\label{sec:Device Types / GPU De
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
@@ -454,6 +458,32 @@ \subsubsection{Device Operation:
controlq}\label{sec:Device Types / GPU Device /
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
+        le64 uuid_low;
+        le64 uuid_high;
+};
+\end{lstlisting}
+
+The response contains a uuid which identifies the exported object created from
+the host private resource. Note that if the resource has an attached backing,
+modifications made to the host private resource through the exported object by
+other devices are not visible in the attached backing until they are
transferred
+into the backing.
+
 \end{description}

 \subsubsection{Device Operation: cursorq}\label{sec:Device Types /
GPU Device / Device Operation / Device Operation: cursorq}
-- 
2.25.0.341.g760bfbb309-goog
