Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 530EF15531B
	for <lists+linux-media@lfdr.de>; Fri,  7 Feb 2020 08:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgBGHkw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Feb 2020 02:40:52 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46543 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726136AbgBGHkw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Feb 2020 02:40:52 -0500
Received: by mail-pl1-f196.google.com with SMTP id y8so637791pll.13
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2020 23:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/SnnhcW9j2w0zXhHNiNCZH/SGhNXDWdjF8vo2ZrVttU=;
        b=a00yJ7l+XBLCb3bGDzVE/7Cae2c+1+r8yoXH5HGStzsUPSEHocsZz2/dejlhicpLGF
         OtRvZikkIRdcMddH34OfDmCSeHAgBewdVkOXTYFnnI6TST3iF8/rIcFpxcJck8wHLf2I
         algCQguq+ktDwj+91ZQBRqDdqfmfc07yADtus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/SnnhcW9j2w0zXhHNiNCZH/SGhNXDWdjF8vo2ZrVttU=;
        b=PDOnORX9UkoeQGUy5pdIslvRF9gDFHwvfGwXvV/4Ua1tSHXYSP2ImfajIhR7Mi9+Uf
         pMabxuMK2Hcc43P5Lj7hUoPXvE+4bCXxSBFhajz4K9hsfCBbfAxoxhuNHhjvExbIXZ/W
         sELgaXrvZaqgasdl4Qc0PCw8yHvdNAhXWZbLwU5cQgeXvNq4UxeVQtt8alrA9kMs/cv0
         ykfP0dNR2GnxE9im3gGV/BraEyykLWi06QXENMW/5j6gI+XgK5AtRP0CONwT2M70Dy+c
         BCRBToGbNVcEMYLhu+FqTW+bRvE7/Oey0OYooaMDp1Fh1++5PawD1KxiY6tviDO3t7T7
         kUlw==
X-Gm-Message-State: APjAAAWUDFrsqNSglzjqupqwcjTKBQ1aQzqpw9eT79YhfJdEcdIhq59d
        DZi4JjoktDKUpc/0woirMbmAl+BPdNU=
X-Google-Smtp-Source: APXvYqw8ntnBPknPgSFy1QDLWy+btnUDt57+Zj0AU/BkHGN0s4uqX8z+48phCu7XPf9wd2i7CfbRTg==
X-Received: by 2002:a17:90a:bc41:: with SMTP id t1mr2269084pjv.137.1581061251505;
        Thu, 06 Feb 2020 23:40:51 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:1f16:51f4:8631:68b2])
        by smtp.gmail.com with ESMTPSA id u13sm1474937pjn.29.2020.02.06.23.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 23:40:51 -0800 (PST)
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
Subject: [RFC PATCH v3 1/2] content: define what an exported object is
Date:   Fri,  7 Feb 2020 16:40:32 +0900
Message-Id: <20200207074033.172289-2-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200207074033.172289-1-stevensd@chromium.org>
References: <20200207074033.172289-1-stevensd@chromium.org>
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
index b1ea9b9..ad3723c 100644
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
2.25.0.341.g760bfbb309-goog

