Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A193218AA98
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 03:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgCSCSl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 22:18:41 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36334 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgCSCSl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 22:18:41 -0400
Received: by mail-pg1-f195.google.com with SMTP id z72so348856pgz.3
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2020 19:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1C8jLhXuPfBb7h90RHOdI3Yy2sESPpspTtCUaNxuRxE=;
        b=ab9aZhwV8Ief16HW0MRvphHu2sqdH+8TGCXu2J/DZM2sTVAcH82y5neSsPEP+v4s/g
         kKOhY1f8E1gjgR7A75Y5DkfTT00HG+m9S9p44G5AO7UyphRi0nUwZXnpRcJ4/qBxtqM/
         gXiqeeT6GPF6I/JHU0G2kMo9Xp3OFyMnF8MB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1C8jLhXuPfBb7h90RHOdI3Yy2sESPpspTtCUaNxuRxE=;
        b=JofWp+1UHyW4a9EI/U7WSYQUXO3oh5qLgAYK0O5ah6YUPIooCwua0P7VjEPbzLprpP
         28CoM2hSMtqxIoCDB8p8wJlxGKrEqtKZLHkztOWxg6BiUguASgRIlemIYvFnaEw3yG02
         ytkhQIpls3uPXqTs65Q5BCzDEkyWU9/ZrgnDVFNMznXfCTo3wfbARSed8SWT/7XWnvgA
         42z0Ucsk7PNNt307SKDyDEB9iU5WkzvXc10siwv0grT4zzAyoo+kE1rhqFNvVT/xVfBP
         10yvjCcRImSKBpspjIZE8ZkzDftaJw1ZVokAUHvHll9eOErp1vxp+bBk4i2lFs2CN+5X
         SVtg==
X-Gm-Message-State: ANhLgQ2hqvjNjyMqwVhJ7XcEWLNCvovcfXclAqDAwEeqRD+cW/yqefqm
        E/qAWcWeon3+N1ogk97mge8uQw==
X-Google-Smtp-Source: ADFU+vsA3Do93d+fKRKpI4+KnCX1CyGpYNhUlFZFW824PU6sMlngpOx8GyHpGZj6qH3Whemhlg7jTw==
X-Received: by 2002:aa7:870f:: with SMTP id b15mr1443454pfo.190.1584584318862;
        Wed, 18 Mar 2020 19:18:38 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
        by smtp.gmail.com with ESMTPSA id m18sm327988pgd.39.2020.03.18.19.18.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2020 19:18:38 -0700 (PDT)
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
Subject: [PATCH v4 1/2] content: define what an exported object is
Date:   Thu, 19 Mar 2020 11:18:22 +0900
Message-Id: <20200319021823.57219-2-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200319021823.57219-1-stevensd@chromium.org>
References: <20200319021823.57219-1-stevensd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Define a mechanism for sharing objects between different virtio
devices.

Signed-off-by: David Stevens <stevensd@chromium.org>
---
 content.tex      | 12 ++++++++++++
 introduction.tex |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/content.tex b/content.tex
index b1ea9b9..c8a367b 100644
--- a/content.tex
+++ b/content.tex
@@ -373,6 +373,18 @@ \section{Driver Notifications} \label{sec:Virtqueues / Driver notifications}
 
 \input{shared-mem.tex}
 
+\section{Exporting Objects}\label{sec:Basic Facilities of a Virtio Device / Exporting Objects}
+
+When an object created by one virtio device needs to be
+shared with a seperate virtio device, the first device can
+export the object by generating a UUID which can then
+be passed to the second device to identify the object.
+
+What constitutes an object, how to export objects, and
+how to import objects are defined by the individual device
+types. It is RECOMMENDED that devices generate version 4
+UUIDs as specified by \hyperref[intro:rfc4122]{[RFC4122]}.
+
 \chapter{General Initialization And Device Operation}\label{sec:General Initialization And Device Operation}
 
 We start with an overview of device initialization, then expand on the
diff --git a/introduction.tex b/introduction.tex
index 40f16f8..fc2aa50 100644
--- a/introduction.tex
+++ b/introduction.tex
@@ -40,6 +40,10 @@ \section{Normative References}\label{sec:Normative References}
 	\phantomsection\label{intro:rfc2119}\textbf{[RFC2119]} &
 Bradner S., ``Key words for use in RFCs to Indicate Requirement
 Levels'', BCP 14, RFC 2119, March 1997. \newline\url{http://www.ietf.org/rfc/rfc2119.txt}\\
+	\phantomsection\label{intro:rfc4122}\textbf{[RFC4122]} &
+Leach, P., Mealling, M., and R. Salz, ``A Universally Unique
+IDentifier (UUID) URN Namespace'', RFC 4122, DOI 10.17487/RFC4122,
+July 2005. \newline\url{http://www.ietf.org/rfc/rfc4122.txt}\\
 	\phantomsection\label{intro:S390 PoP}\textbf{[S390 PoP]} & z/Architecture Principles of Operation, IBM Publication SA22-7832, \newline\url{http://publibfi.boulder.ibm.com/epubs/pdf/dz9zr009.pdf}, and any future revisions\\
 	\phantomsection\label{intro:S390 Common I/O}\textbf{[S390 Common I/O]} & ESA/390 Common I/O-Device and Self-Description, IBM Publication SA22-7204, \newline\url{http://publibfp.dhe.ibm.com/cgi-bin/bookmgr/BOOKS/dz9ar501/CCONTENTS}, and any future revisions\\
 	\phantomsection\label{intro:PCI}\textbf{[PCI]} &
-- 
2.25.1.481.gfbce0eb801-goog

