Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87479144C5F
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 08:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgAVHQg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 02:16:36 -0500
Received: from mail-qv1-f45.google.com ([209.85.219.45]:43419 "EHLO
        mail-qv1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbgAVHQg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 02:16:36 -0500
Received: by mail-qv1-f45.google.com with SMTP id p2so2764610qvo.10
        for <linux-media@vger.kernel.org>; Tue, 21 Jan 2020 23:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=IvHhZTaEUivWZW7zpZ8DN7CQvbWtXPcmSa5wCq98Ixw=;
        b=P8ugtCzbkP+LO9jzvfAgOeaiG9+8w6QYuAgDVCuEBVTCjwol8ntvM1zLsctTH4ueyf
         9ROg+UEB9idsIrOVHCdx+ihRYEXdd9tF4dqyB9jChAibTKSNlWptCgmckOb+qppc2lIa
         qWFGBnuG8IwjSCQ6c0YWH7PbgvLOLfzGR/ddM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=IvHhZTaEUivWZW7zpZ8DN7CQvbWtXPcmSa5wCq98Ixw=;
        b=nvuso8owAnpBgr6H5GOsEjUOhxm1Ia/OK/WvjshTccsUwbfrRI6ZFkckG5vUTA9hgr
         fU4lG+O3+2rnuFNRN4pYb8BK0JkaVrSPWQhGFmIkgQ14N4ZdyP8qL9+gSrONRnBpfs82
         Q+1ecPmxsKmp6nIb7IjRD1WevEnK32DcqpvooYnu6i/QMYmYddAzC/uij6iGQnCZN4O1
         eoJgLyi2ypLV6UZH1PP3vzK7Tfero0nXKLO++x0HwbFrJibpF4Pctdzi3qzItIb0NMf/
         sJHDjcxLisL4pA5sMTHTqj2UIxyH+uRdMHrM64B7/ZB6DMcED+fbsNa1TZ7DmTS9h/b7
         8+8A==
X-Gm-Message-State: APjAAAWO5zEApBjE3AEVR4RWs3EtNOtJDCNU5zfghGynPaQK9COsma3t
        eHHxQqpE6YGB6mAnBxKnnQOphBvPTDYNfbpSuVqBZg==
X-Google-Smtp-Source: APXvYqx4RcN53n670UPjMJvlSwx4cAxbVDFWfbUJ+hfzwTe5JQ7PUS6PtSim2s67oYcZ7Rgpqyh668b+ckkT+d6OFio=
X-Received: by 2002:a05:6214:10c1:: with SMTP id r1mr9111779qvs.70.1579677395313;
 Tue, 21 Jan 2020 23:16:35 -0800 (PST)
MIME-Version: 1.0
From:   David Stevens <stevensd@chromium.org>
Date:   Wed, 22 Jan 2020 16:16:24 +0900
Message-ID: <CAD=HUj640QfNwO4J_tdcSx36YOVAVT_dZUXYuKPaCKvZVWeHsg@mail.gmail.com>
Subject: [virtio-dev][RFC PATCH v1 1/2] content: define what an exported
 object is
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

Define a mechanism for sharing objects between different virtio
devices.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 content.tex | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/content.tex b/content.tex
index b1ea9b9..6c6dd59 100644
--- a/content.tex
+++ b/content.tex
@@ -373,6 +373,24 @@ \section{Driver Notifications}
\label{sec:Virtqueues / Driver notifications}

 \input{shared-mem.tex}

+\section{Exporting Objects}\label{sec:Basic Facilities of a Virtio
Device / Exporting Objects}
+
+When an object created by one virtio device needs to be
+shared with a seperate virtio device, the first device can
+export the object by generating a \field{uuid} which the
+guest can pass to the second device to identify the object.
+
+What constitutes an object, how to export objects, and
+how to import objects are defined by the individual device
+types. The generation method of a \field{uuid} is dependent
+upon the implementation of the exporting device.
+
+Whether a particular exported object can be imported into
+a device is dependent upon the implementations of the exporting
+and importing devices. Generally speaking, the guest should
+have some knowledge of the host configuration before trying to
+use exported objects.
+
 \chapter{General Initialization And Device
Operation}\label{sec:General Initialization And Device Operation}

 We start with an overview of device initialization, then expand on the
-- 
2.25.0.341.g760bfbb309-goog
