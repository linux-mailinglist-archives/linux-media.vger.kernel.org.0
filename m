Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DA5E37822A
	for <lists+linux-media@lfdr.de>; Mon, 10 May 2021 12:31:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232132AbhEJKcv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 May 2021 06:32:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:32832 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231859AbhEJKap (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 May 2021 06:30:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3B8461926;
        Mon, 10 May 2021 10:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620642444;
        bh=/5KMYe58DrtVU6l39giXpj+U2gVE007fTByxX+3Tg3c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ouvWHnUkWNIek6ysDZyOLr0orzQJUsSM8F8wrl+uiRMvNbKSPC7MeEXnDeDqjHe0p
         5uiQ56iJ+5zDgQOB5CDlcR4Ujp8RWoJUrBWtB6pFI+R294nrQNinF15XHAgxs0fMGY
         peTHkiJqz+lotfT9CzM0o+Ykfrb53WF8tQ6VJRhvQa+edVR4IdJRHRmAvrZ5MiKjV/
         gy+NxdTtxOCYNcMAknc7K9huM+yAQD60dG0yQY5Fxr0ZJ1hodjRR6RBwZJM7lPEf04
         nzOsfCRTxilgDc1TXHfWHXrhoDlmo/skvw+JApgekIcVml9K91BflNXE2tANCztzt7
         EYf43lP2VZ70A==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lg38D-000UPM-3K; Mon, 10 May 2021 12:27:21 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Corentin Labbe <clabbe@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mjpeg-users@lists.sourceforge.net
Subject: [PATCH 16/53] docs: driver-api: media: drivers: avoid using UTF-8 chars
Date:   Mon, 10 May 2021 12:26:28 +0200
Message-Id: <572748e2c82217ca8e7ffb8417389365b526b947.1620641727.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620641727.git.mchehab+huawei@kernel.org>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While UTF-8 characters can be used at the Linux documentation,
the best is to use them only when ASCII doesn't offer a good replacement.
So, replace the occurences of the following UTF-8 characters:

	- U+00ad ('­'): SOFT HYPHEN
	- U+00b4 ('´'): ACUTE ACCENT
	- U+2014 ('—'): EM DASH

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../driver-api/media/drivers/sh_mobile_ceu_camera.rst     | 8 ++++----
 Documentation/driver-api/media/drivers/vidtv.rst          | 4 ++--
 Documentation/driver-api/media/drivers/zoran.rst          | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/driver-api/media/drivers/sh_mobile_ceu_camera.rst b/Documentation/driver-api/media/drivers/sh_mobile_ceu_camera.rst
index 822fcb8368ae..280a322c34c6 100644
--- a/Documentation/driver-api/media/drivers/sh_mobile_ceu_camera.rst
+++ b/Documentation/driver-api/media/drivers/sh_mobile_ceu_camera.rst
@@ -30,10 +30,10 @@ Generic scaling / cropping scheme
 	|                       `. .6--
 	|
 	|                        . .6'-
-	|                      .´
-	|           ... -4'- .´
-	|       ...´             - -7'.
-	+-5'- .´               -/
+	|                      .'
+	|           ... -4'- .'
+	|       ...'             - -7'.
+	+-5'- .'               -/
 	|            -- -3'- -/
 	|         --/
 	|      --/
diff --git a/Documentation/driver-api/media/drivers/vidtv.rst b/Documentation/driver-api/media/drivers/vidtv.rst
index 673bdff919ea..abb454302ac5 100644
--- a/Documentation/driver-api/media/drivers/vidtv.rst
+++ b/Documentation/driver-api/media/drivers/vidtv.rst
@@ -458,8 +458,8 @@ Add a way to test video
 
 Currently, vidtv can only encode PCM audio. It would be great to implement
 a barebones version of MPEG-2 video encoding so we can also test video. The
-first place to look into is *ISO 13818-2: Information technology — Generic
-coding of moving pictures and associated audio information — Part 2: Video*,
+first place to look into is *ISO 13818-2: Information technology - Generic
+coding of moving pictures and associated audio information - Part 2: Video*,
 which covers the encoding of compressed video in MPEG Transport Streams.
 
 This might optionally use the Video4Linux2 Test Pattern Generator, v4l2-tpg,
diff --git a/Documentation/driver-api/media/drivers/zoran.rst b/Documentation/driver-api/media/drivers/zoran.rst
index 83cbae9cedef..b205e10c3154 100644
--- a/Documentation/driver-api/media/drivers/zoran.rst
+++ b/Documentation/driver-api/media/drivers/zoran.rst
@@ -319,7 +319,7 @@ Conexant bt866 TV encoder
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 
 - is used in AVS6EYES, and
-- can generate: NTSC/PAL, PAL­M, PAL­N
+- can generate: NTSC/PAL, PAL-M, PAL-N
 
 The adv717x, should be able to produce PAL N. But you find nothing PAL N
 specific in the registers. Seem that you have to reuse a other standard
-- 
2.30.2

