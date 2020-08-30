Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6A6256F57
	for <lists+linux-media@lfdr.de>; Sun, 30 Aug 2020 18:31:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgH3Qa5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 30 Aug 2020 12:30:57 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:28640 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726046AbgH3Qax (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 30 Aug 2020 12:30:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598805052;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=mYvzFBs63TbpVmhIX3wGRs+LwFoNle22iFtiQP17T/I=;
        b=ZmIEJrIqWyC7TJN3xmi6QVnEESG2SAOZSNWwkDtYnmhFMHcZEpqwiQ13I/YgwOQrB/E2X8
        0d1Pfy0vWEzX6kMplfHXNidlv6MQ5XaMsaKPgcaomqfxFVu28HmN8FGOGhbtRZjfUleTqM
        lBAZ5nBOR2rUcKQokz/jvkCcyFdrQ8I=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-FExsLZlNOKu8DjtdGkCl9Q-1; Sun, 30 Aug 2020 12:30:48 -0400
X-MC-Unique: FExsLZlNOKu8DjtdGkCl9Q-1
Received: by mail-il1-f198.google.com with SMTP id 2so3401479ill.10
        for <linux-media@vger.kernel.org>; Sun, 30 Aug 2020 09:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=mYvzFBs63TbpVmhIX3wGRs+LwFoNle22iFtiQP17T/I=;
        b=UvZg6ZsHdiRmSPd5Xdw9V8g21wdb4KwTVaDfSR1uYIW3reRC4SDRvYUTCdny1qImVt
         CeoTOGDOaceQ8vur+Z1tbBvGpWI9TS4XPQ7c2wC5cs02HKQwTgp1rEGWbUDdqdeo+zvm
         YsvBXYw/SUECiPsAo4YLay1uYKYpitbwW5MqqUqk7Qd84HG+M7mcBiNDCAlKyxyKSkoK
         zT7pmmNur1BqwmpiShP7Sizb3omoEVgbHegLqHutfpTeIPJPTmNvSBk4hG4jRg48f5rj
         6R/DfTQoNHsmtbvF9NzMZCwiOEir+23MEhVT4D2Xz6SBbf4yCsA3cKbInsAohLPPP7t2
         wD2g==
X-Gm-Message-State: AOAM530JvquddN0ktlW8UV7SQEvk/9f8NUH2O9CJizonRU5bhGJIaRW6
        JEiEFeG3R8IIrDD5/tes1UAcXjQtlVa48SscS6VAJR3sIJ9vrsfZUJaJXQQGiczRROmQNoVpKvU
        a/egOZlxBp8UBb2WqwBpQ3SQ=
X-Received: by 2002:a5e:8c0c:: with SMTP id n12mr5694767ioj.147.1598805048117;
        Sun, 30 Aug 2020 09:30:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwObfN6L0TDNnE8gtLMDpGDLrvSEVrNnpNznkakgT9w+mf7UKzkbWb/k5DT7vV3OKKAEbjvCQ==
X-Received: by 2002:a5e:8c0c:: with SMTP id n12mr5694763ioj.147.1598805047936;
        Sun, 30 Aug 2020 09:30:47 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id k18sm3104399ils.42.2020.08.30.09.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 09:30:47 -0700 (PDT)
From:   trix@redhat.com
To:     matrandg@cisco.com, mchehab@kernel.org, natechancellor@gmail.com,
        ndesaulniers@google.com, p.zabel@pengutronix.de,
        hans.verkuil@cisco.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] media: tc358743: initialize variable
Date:   Sun, 30 Aug 2020 09:30:43 -0700
Message-Id: <20200830163043.10317-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

clang static analysis flags this error

tc358743.c:1468:9: warning: Branch condition evaluates
  to a garbage value
        return handled ? IRQ_HANDLED : IRQ_NONE;
               ^~~~~~~
handled should be initialized to false.

Fixes: d747b806abf4 ("[media] tc358743: add direct interrupt handling")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/i2c/tc358743.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index a03dcab5ce61..c724bd1591de 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -1461,7 +1461,7 @@ static int tc358743_isr(struct v4l2_subdev *sd, u32 status, bool *handled)
 static irqreturn_t tc358743_irq_handler(int irq, void *dev_id)
 {
 	struct tc358743_state *state = dev_id;
-	bool handled;
+	bool handled = false;
 
 	tc358743_isr(&state->sd, 0, &handled);
 
-- 
2.18.1

