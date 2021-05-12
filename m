Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A285237BD02
	for <lists+linux-media@lfdr.de>; Wed, 12 May 2021 14:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231549AbhELMxB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 May 2021 08:53:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:52580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231308AbhELMwv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 May 2021 08:52:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CA0C613FE;
        Wed, 12 May 2021 12:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620823902;
        bh=gBojUuAxkEIMMYcr4yqiMf2CAE+iYREtTJ0SySLQafU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RS2dnaaG4Peowz7mEncXM71htgkxYx4eu7bN4QiWUF1PpM0CqPkD8YUD02Bjz/M+l
         c1vyG3OBlLEBjlsHdhplqDN4koCozEOswNOS1PNzOKLzjtqrfeEOig+tXQ1AIq1u7j
         P64PUf5HTtBZbf+QMBNcsjakFcxLZTbwhw18S+3c9xMIsXNi02HnLHA1fsHdf6/2Py
         6TNuRp/89vvS4U8+arJgh7/vtKoj0Hy9Bid+rRBCQHxLhcFz5iZld7iLI9617g5lMr
         uNNs1Elhvu3yQvcpQU5s1cdmUKnyjaY/m0YuWTXuGWYMqrtKwqR+ASkdtRq1PgQPg8
         iFkLRxeJIlBSQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lgoKy-0018hN-CM; Wed, 12 May 2021 14:51:40 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Corentin Labbe <clabbe@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        mjpeg-users@lists.sourceforge.net
Subject: [PATCH v2 09/40] docs: driver-api: media: drivers: Use ASCII subset instead of UTF-8 alternate symbols
Date:   Wed, 12 May 2021 14:50:13 +0200
Message-Id: <99228c03965f3347cd910e20f7c914e14c7243b7.1620823573.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620823573.git.mchehab+huawei@kernel.org>
References: <cover.1620823573.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The conversion tools used during DocBook/LaTeX/Markdown->ReST conversion
and some automatic rules which exists on certain text editors like
LibreOffice turned ASCII characters into some UTF-8 alternatives that
are better displayed on html and PDF.

While it is OK to use UTF-8 characters in Linux, it is better to
use the ASCII subset instead of using an UTF-8 equivalent character
as it makes life easier for tools like grep, and are easier to edit
with the some commonly used text/source code editors.

Also, Sphinx already do such conversion automatically outside literal blocks:
   https://docutils.sourceforge.io/docs/user/smartquotes.html

So, replace the occurences of the following UTF-8 characters:

	- U+00ad ('­'): SOFT HYPHEN
	- U+00b4 ('´'): ACUTE ACCENT

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../driver-api/media/drivers/sh_mobile_ceu_camera.rst     | 8 ++++----
 Documentation/driver-api/media/drivers/zoran.rst          | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

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

