Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CABF1E1F5F
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2020 12:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731863AbgEZKJk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 May 2020 06:09:40 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:53329 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731775AbgEZKJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 May 2020 06:09:39 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id dWWajU9GZDazBdWWfjeM9r; Tue, 26 May 2020 12:09:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1590487777; bh=RdA4ogKp8+0hqRSxs2lzJ3PBCJyzQCF63Vdjpnd4WgA=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=NkpUkg+VTfVdTCN5+z+MqM+VUdP+TWODYQllB03s3BKNskA9GXrocqLMiARe6O7SE
         GIsYFdmsT2bpPnURHDMt88pF1StoTyy4S7XXIA6WlS3eexns7id79t1Ygxv342JFbU
         VabG8AQuCoC/PSTVZbxPpZE/vrTtP/LNMiCAhHuiL4fKuSoy/JTg504vW6jXp+DDO9
         e+CGrh3m8qU+XR2W3vMrt0p9B6cHpHyBEivJB+B0EkxBmRm+Gv3YSYnDGvH34XllD5
         CF/Eiuma/6ScidO+cgNC1rh6Seh7mr7AppgI8YMq5+TgkjuOFy3qJjkU4qFyGITnic
         yhwrylPftPigA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 3/5] dev-decoder.rst: small fixes
Date:   Tue, 26 May 2020 12:09:30 +0200
Message-Id: <20200526100932.2626420-4-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
References: <20200526100932.2626420-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfFFJmlHXpgKGDNrYZdF1OaHQVZiT1uBUnwp0YrrrYa2ptm9gJu2cB5hK+AvULzer4Y+ymp2iiHlIC42NyQscauzzg8YKZUNbfq+oAXXaf73t4cSDl5/r
 bKNbdzMCKY5jKDJShEoK5Rg9AdM73fJnfD7v8QIkeT2vprTjYKvhGdZvvdy3KeON3x8Mv0d4NZPujVDVhaR5vVlHYmkX2O2iPGpMC5tNnepBITDHVqTyhKW1
 HO0dOU6oELXAjKLVj4k21NXU+rGc5O7anEDwEPboBGAyGTK4HCTZIV2oHgWdsvTC0AjxpY1PjtOQN7OdUhWHFSK7+w7FyRqxQcG6DoWhSAU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add missing periods at the end of two sentences.

Although mandatory -> Although not mandatory

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/userspace-api/media/v4l/dev-decoder.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
index 606b54947e10..04034dbc0b3e 100644
--- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
@@ -247,7 +247,7 @@ Querying Capabilities
 Initialization
 ==============
 
-1. Set the coded format on ``OUTPUT`` via :c:func:`VIDIOC_S_FMT`
+1. Set the coded format on ``OUTPUT`` via :c:func:`VIDIOC_S_FMT`.
 
    * **Required fields:**
 
@@ -803,7 +803,7 @@ it may be affected as per normal decoder operation.
    * The decoder will drop all the pending ``OUTPUT`` buffers and they must be
      treated as returned to the client (following standard semantics).
 
-2. Restart the ``OUTPUT`` queue via :c:func:`VIDIOC_STREAMON`
+2. Restart the ``OUTPUT`` queue via :c:func:`VIDIOC_STREAMON`.
 
    * **Required fields:**
 
@@ -1059,7 +1059,7 @@ sequence was started.
    ``V4L2_DEC_CMD_STOP`` again while the drain sequence is in progress and they
    will fail with -EBUSY error code if attempted.
 
-   Although mandatory, the availability of decoder commands may be queried
+   Although not mandatory, the availability of decoder commands may be queried
    using :c:func:`VIDIOC_TRY_DECODER_CMD`.
 
 End of Stream
-- 
2.25.1

