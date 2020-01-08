Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D450133DC2
	for <lists+linux-media@lfdr.de>; Wed,  8 Jan 2020 10:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbgAHJCK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jan 2020 04:02:10 -0500
Received: from mail-qk1-f181.google.com ([209.85.222.181]:41803 "EHLO
        mail-qk1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726891AbgAHJCJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jan 2020 04:02:09 -0500
Received: by mail-qk1-f181.google.com with SMTP id x129so1949962qke.8
        for <linux-media@vger.kernel.org>; Wed, 08 Jan 2020 01:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=MvBXFmubHjfTSZqX6gGxSDOdnp6QUUqOLQUXD/uSqGE=;
        b=DYbgTGSP4mdzTCAqDQe0ONLDdXBCvCrs3Gf/qEYQ3nonNazP44qqR3UAJhoN3bcQWX
         bQ2M/rSn1WnKbQ+SA+qoy1OFUAwukrU7HbG4Inels53VYSIMMPYpRV2TcKUFdlz7IZ+s
         BlgcIAJI+EA2lI+1aLJOK0EB7NrpI9sWVCWq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=MvBXFmubHjfTSZqX6gGxSDOdnp6QUUqOLQUXD/uSqGE=;
        b=mbp1wO/0BwOYNiZqXTU0KhT7orLJEXYL2e3pAXnp32Q8iHZQqLWlawGoRL2EQHo6yr
         o6hP2V2iomHcmAfClWN/uvt08TrDJY3GITZzMf1iuWrfFeSsca1uXEB7h0klWbQE39no
         r7z7/xzejy/KhI2FqRzE8tAy6jDOArzW5a192olOvqY+IT+MDM1j3mDZ3OVnrnoKJu9c
         uZ1a6UupdSyZm8Df06wuwzFhRkIJwbItQwuKngU+++0ysOQXJwZR3mm7Ko05qTRot1rz
         hdfc37A3Pfvm6bzi4FojB0fPZbnSXHza/tHlI6yqdlCfkmz267x5BKJ417/jqJj9vO7w
         vdAA==
X-Gm-Message-State: APjAAAXdydAYIlqOxbM6PZ2UOtKwS0a3TxilNNMmT5GTKVBKVEQP0IBF
        V8I3Ny+jb3mQI8ZX9YB8guGpD3Ti5LqLj0PcreZVqw==
X-Google-Smtp-Source: APXvYqweJlXV88c+PKT192DC2KihUtPe6TwZU6GCiLW50z8aM6eR4XRmfbWIQhisZ6FPS+0icbkxvHNLUyZA9fpTYc4=
X-Received: by 2002:a05:620a:101b:: with SMTP id z27mr3076885qkj.241.1578474128857;
 Wed, 08 Jan 2020 01:02:08 -0800 (PST)
MIME-Version: 1.0
From:   David Stevens <stevensd@chromium.org>
Date:   Wed, 8 Jan 2020 18:01:58 +0900
Message-ID: <CAD=HUj6FA3VoTJqNa+gmAgVOv9zS7Qk9pdg46EY9NvtJOdz5_A@mail.gmail.com>
Subject: [virtio-dev][RFC PATCH v1 1/2] content: define what exporting a
 resource is
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

Define a mechanism for sharing resources between different virtio
devices.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 content.tex | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/content.tex b/content.tex
index b1ea9b9..73bd28e 100644
--- a/content.tex
+++ b/content.tex
@@ -373,6 +373,24 @@ \section{Driver Notifications}
\label{sec:Virtqueues / Driver notifications}

 \input{shared-mem.tex}

+\section{Exporting Resources}\label{sec:Basic Facilities of a Virtio
Device / Exporting Resources}
+
+When a resource created by one virtio device needs to be
+shared with a seperate virtio device, the first device can
+export the resource by generating a \field{uuid} which the
+guest can pass to the second device to identify the resource.
+
+What constitutes a resource, how to export resources, and
+how to import resources are defined by the individual device
+types. The generation method of a \field{uuid} is dependent
+upon the implementation of the exporting device.
+
+Whether a particular exported resource can be imported into
+a device is dependent upon the implementations of the exporting
+and importing devices. Generally speaking, the guest should
+have some knowledge of the host configuration before trying to
+use exported resources.
+
 \chapter{General Initialization And Device
Operation}\label{sec:General Initialization And Device Operation}

 We start with an overview of device initialization, then expand on the
-- 
2.24.1.735.g03f4e72817-goog
