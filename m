Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39226381DEF
	for <lists+linux-media@lfdr.de>; Sun, 16 May 2021 12:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232274AbhEPKUD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 16 May 2021 06:20:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:37558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230192AbhEPKTw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 16 May 2021 06:19:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 671C5611BD;
        Sun, 16 May 2021 10:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621160317;
        bh=KkW/7nbwWkyWdFUNcytqxDFBTFIc9rHCdM7IZE9+lWQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qpGd0UaOdwdEt4q7M09CMjnC28KJiVtNOtteSe/SC+xsKMN/NwTY0XPht8YcYm/Tr
         z7+6UdJHU4cmkP6zrwsOkq6rLPlbxbd+Uwk1pmEx1Hpkr8m8h80WKOZXEgpKInq5s5
         nyntv80XL6OHHpPhj2Fn+ebGiruSTZVDSiq71IH6OLKH5lzHCZIJt4M6vkWwgCqB1D
         KWVL9U92WVFXuvja0xJOoBta6S82E81CAQcXzgPmuvK1A007OxJncRuHzoGAzgHAet
         tQE5Tg3ZGLZCSJb46USsFxVhLwHyjH7yLJiBuSZNNS7xjam+sAFXU0lzd48ustC1Qw
         XN/Brn+qVn5+g==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1liDr1-003o8a-ER; Sun, 16 May 2021 12:18:35 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v3 07/16] docs: userspace-api: media: v4l: dev-decoder.rst: replace some characters
Date:   Sun, 16 May 2021 12:18:24 +0200
Message-Id: <5f8891ecd376b613fd2658e008af27780f41fa72.1621159997.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621159997.git.mchehab+huawei@kernel.org>
References: <cover.1621159997.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The conversion tools used during DocBook/LaTeX/html/Markdown->ReST
conversion and some cut-and-pasted text contain some characters that
aren't easily reachable on standard keyboards and/or could cause
troubles when parsed by the documentation build system.

Replace the occurences of the following characters:

	- U+00a0 (' '): NO-BREAK SPACE
	  as it can cause lines being truncated on PDF output

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/userspace-api/media/v4l/dev-decoder.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
index 3d4138a4ba69..7de5705c07f8 100644
--- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
@@ -288,7 +288,7 @@ Initialization
 
       Changing the ``OUTPUT`` format may change the currently set ``CAPTURE``
       format. How the new ``CAPTURE`` format is determined is up to the decoder
-      and the client must ensure it matches its needs afterwards.
+      and the client must ensure it matches its needs afterwards.
 
 2.  Allocate source (bytestream) buffers via :c:func:`VIDIOC_REQBUFS` on
     ``OUTPUT``.
-- 
2.31.1

