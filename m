Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C22E33A383
	for <lists+linux-media@lfdr.de>; Sun, 14 Mar 2021 09:24:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234831AbhCNIYE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Mar 2021 04:24:04 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:53199 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234973AbhCNIXn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Mar 2021 04:23:43 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id LM2ElprFUC40pLM2HlXDyg; Sun, 14 Mar 2021 09:23:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615710222; bh=2WtOOkxT5qZOLcj3QL327sY5LvygJjrDkGAiZv80J1M=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=QffshD4IJILs24d0RgpN3S1lxYiI6ZyxwlJkli3pKuaE0+b+vNEOBsP3O8CKQJ2F3
         vYSJWcDdeLhw9xPrivrokX7Ahw4bLHlo/foM7nQRfuTU9kVc9wcYQlniUkZ7RVpzB8
         +8C0XJ7WCXDlHoj1mLT/7CSivKxWkzZZFgUJxt61dx6JiPw3QGYKrQ63yuJgIfuyPQ
         SKcVpoziN9G4VBs3LWBANQBzFq32TGm9OSDoqJDqnyWKaEJ5LTciID7+APA3wiGV9y
         6xOnlt0ldINxk0MNDCarDuTA8EeaOJw9bViQWXNRzaz9+CP8g+GkDi4LGtaYRRk5FX
         MR3VQDkvJrznw==
Subject: [PATCH 16/15] ext-ctrls-codec.rst: update note at start of codec
 section
To:     linux-media@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
References: <20210313144323.143600-1-hverkuil-cisco@xs4all.nl>
 <20210313144323.143600-16-hverkuil-cisco@xs4all.nl>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <af1117cd-8bae-3b6d-41d9-876614425793@xs4all.nl>
Date:   Sun, 14 Mar 2021 09:23:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210313144323.143600-16-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEeDnXjE2x45TX5OPdibwflTV+u02t4G5n5cdkpn+13jS2+M9e1iIu5a10amsu/vMqTgMRGFyslKPrh8D9EZ5Ozp69tC2bKM9hg3Q5s87++FPg0xC4++
 g1XAxi7A7AcpYmBa4k+8aYTNrw9GWERzYDL9izNMwS+FTCGcfcK+I8mCOWsWr2Lk7CpezNykB+AHqyn8JJ2i3KZWUMV28BpQozwwS3A7kNYYcIGYP65lXwwE
 VO+o1nVYkk+ldICLiTB5LOO0l1Y3Kvw/MoNVSTtsIngqZ/KaCDKOumurH4AWDhwkRB40xNMZXWuucibUorewAQEy5ihNIHidmw95Lc5aCwE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The note at the start of the Codec Control Reference section was
changed to explain the prefix naming change.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst       | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 34884a785d76..528b97c989c7 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -11,10 +11,13 @@ the generic controls, then controls specific for certain hardware.

 .. note::

-   These controls are applicable to all codecs and not just MPEG. The
-   defines are prefixed with V4L2_CID_MPEG/V4L2_MPEG as the controls
-   were originally made for MPEG codecs and later extended to cover all
-   encoding formats.
+   Originally these defines, enum names and struct names were prefixed with
+   V4L2_CID_MPEG/V4L2_MPEG/v4l2_mpeg instead of
+   V4L2_CID_CODEC/V4L2_CODEC/v4l2_codec as the codec controls were initially
+   made for just the MPEG codec and only later extended to cover more codecs.
+
+   The old names are still available to prevent breaking existing code and the
+   ``v4l2-controls.h`` header redefines them to the new names.


 Generic Codec Controls
-- 
2.30.1


