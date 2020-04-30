Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 581C71BF6F2
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 13:38:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgD3LiX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 07:38:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726520AbgD3LiX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 07:38:23 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB604C035494
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2020 04:38:22 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id w20so6144643ljj.0
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2020 04:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=mgHhRJbwqTNvkXVnYSbUKCsO5fBMvxs+N/nP9TNMU1A=;
        b=YVIHRWVWEDT0JKZW2ERZiU9dL3JzB7Klk6Ln0LcUpy1C43jg8tHByD5B11ceI6/KcZ
         O/kvCe639NKsqraa5iiMO7bHlIy0+Gj1YOZFzJ2NBs+JumUSSpxyTgZE16emY20lpR/3
         XWLoilAG+jDwrLn1mY8QiGoGKHuqU2sgL6LdzJFgLUYqshSxxHKfzcKiFeRKWEr57uVu
         gf3LqO0qMqj+JkqVSYQCz0D6+b2+vRLMnnoYeXynjN0CZA9uP60/Z44fVDDJJv0Zso9/
         ucpAP+nfR1wBKjHwLM5v7pIFs7ZVZQaDB8CzpAoB5DudQpBF4LaRsAitTSZxDx8wfheV
         uyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mgHhRJbwqTNvkXVnYSbUKCsO5fBMvxs+N/nP9TNMU1A=;
        b=jeZsxgXHqMcFdK7RBRKx0/5j3Kd+fWW7OWjiYA1fvX3hCR68iQcFiUs5AsQ8LSFfDc
         0U+SfftuDaT3dL9LN5JThv0p+2Gnm3GEnCLpy/GopTJjZ78h0TeVdgjSjnkfbCUHd6lS
         Le2kUktEfl9hOylfUbVq5yzPvmwODEJlamgDUCUy/BcCmoJO6s6vvV3k9OwoE0Broppk
         qAN9j/A685phQaOA0j8Qqtphk1X743DOqDZZIVbZuSyYg032vbdw0sN2m3rDmvMoOC9Y
         5dCEv2xN8IqZUqXHZxa3MvQVzC5i85F3q041rxS6CqDNHvOiuaMU3KmuDSjoGvmEUp2q
         /VBg==
X-Gm-Message-State: AGi0PuZClUeyby8CBI2jLuOKxuZw59nE7ygxAk/WwmptAu4hU0VQ0MpQ
        LL8rrghU8+SxR2yJfNmyyEs79hNRAU4hOQ==
X-Google-Smtp-Source: APiQypL723DAVMYUjPEqGxdhP0M3FzS3Poal5JaQXuN23do27qbcExP5wGJP6I/8C2ZDN7r320VN6g==
X-Received: by 2002:a2e:80da:: with SMTP id r26mr1936469ljg.38.1588246700385;
        Thu, 30 Apr 2020 04:38:20 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-103.ip.btc-net.bg. [212.5.158.103])
        by smtp.gmail.com with ESMTPSA id f4sm4761648lfa.24.2020.04.30.04.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 04:38:19 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [RFC] docs: dev-decoder: Add two more reasons for dynamic change
Date:   Thu, 30 Apr 2020 14:38:09 +0300
Message-Id: <20200430113809.14872-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Here we add two more reasons for dynamic-resolution-change state
(I think the name is misleading espesially "resolution" word, maybe
dynamic-bitstream-change is better to describe).

The first one which could change in the middle of the stream is the
bit-depth. For worst example the stream is 8bit at the begging but
later in the bitstream it changes to 10bit. That change should be
propagated to the client so that it can take appropriate  action. In
this case most probably it has to stop the streaming on the capture
queue and re-negotiate the pixel format and start the streaming
again.

The second new reason is colorspace change. I'm not sure what action
client should take but at least it should be notified for such change.
One possible action is to notify the display entity that the colorspace
and its parameters (y'cbcr encoding and so on) has been changed.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 Documentation/userspace-api/media/v4l/dev-decoder.rst | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
index 606b54947e10..bf10eda6125c 100644
--- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
@@ -906,7 +906,11 @@ reflected by corresponding queries):
 
 * visible resolution (selection rectangles),
 
-* the minimum number of buffers needed for decoding.
+* the minimum number of buffers needed for decoding,
+
+* bit-depth of the bitstream has been changed,
+
+* colorspace (and its properties) has been changed.
 
 Whenever that happens, the decoder must proceed as follows:
 
-- 
2.17.1

