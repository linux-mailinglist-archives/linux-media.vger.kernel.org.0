Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCCEE49807
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2019 06:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfFREUa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Jun 2019 00:20:30 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35583 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfFREUa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Jun 2019 00:20:30 -0400
Received: by mail-pg1-f196.google.com with SMTP id s27so6947488pgl.2;
        Mon, 17 Jun 2019 21:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LbbvFzyAk/3ZDe/bSvDvggcgdm6o3bhDdilBCg54z4I=;
        b=RcItK+gfLQn3m5Gtyd91++f+8ka0ruF0rgYKJ8XA5/BTYPpoC3GzJp0F4Xlitdiz90
         eb4H6qLzRAMIWlqT7c/xQYJAYl0zLdGQUXnvk1pmuyNGnyXM/QLM7OhTX25JkqZVTCXI
         LMtsKrDznHdM2G6M2mh/CMkx3mKVe873iiaxoQ5/BzV3ZHO16/6UphVCnMDVl5iPZJo5
         heb8gZBtbsGLDkgy2z2FfzeJgH/eLolY3iPjJXFxL27m7JzrKdsBEKJRCI3yIBpU2mNa
         iV89qoFESFLoBlRyj17SEFqSlt94KKz222lpsrxLOjQvN9vrQZri7qgMUyXJsapbzAk8
         6q0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LbbvFzyAk/3ZDe/bSvDvggcgdm6o3bhDdilBCg54z4I=;
        b=W7l+p1utEtX8Jp5a92UIXDht3TNszvLX4Drd1LvRQTjMMQm43OUwJdHVgncSMbOFps
         xWiOE5wO1zwUhCDOx0vtzw/8P4pzV8mrqCQXEmTWJV9bBjzzJsw80zE04UDgnYOuxD3E
         DOyDhPEW9u08XGHZK23SL8C/tQ44UeyVaIDL2qnNUgVtvMgIxq41IUcCxlCAPVqQNuG7
         qPArzBlsgkR6qXUI0coqu/PW7xWuiAolisPLtNBBcvLZhNBFDuuGx7b8nO/vOhhKlFLM
         EtEzis0coELAvipQClOFN+ySL2xoAHwVCLxrMQNy7+e1Bq7mSnVjDCsmydhFap4uhvDY
         tThQ==
X-Gm-Message-State: APjAAAXcMYqnAuQiR1i8rce220I/jq5pzBkLnJh4+D/pPxTZIroF5W4y
        dws5jGU4i6fP2iy+6dHUQbY=
X-Google-Smtp-Source: APXvYqzaFgEYUFu0k3lhSwDZqW9fQ4Ot24RTXYB/4ZKdkXmvjxy9zlwbjDrV80uwzH4cs86vGKbAaw==
X-Received: by 2002:a17:90a:1c1:: with SMTP id 1mr2877558pjd.72.1560831629494;
        Mon, 17 Jun 2019 21:20:29 -0700 (PDT)
Received: from localhost.localdomain ([112.196.181.128])
        by smtp.googlemail.com with ESMTPSA id e22sm13571288pgb.9.2019.06.17.21.20.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 21:20:28 -0700 (PDT)
From:   Puranjay Mohan <puranjay12@gmail.com>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Puranjay Mohan <puranjay12@gmail.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH RESEND] media: pci: cx88: Change the type of 'missed' to u64
Date:   Tue, 18 Jun 2019 09:49:37 +0530
Message-Id: <20190618041937.8424-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Callers of hrtimer_forward_now() should save the return value in u64.
change type of missed from unsigned long to u64.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
RESEND - Added required mailing lists in CC

 drivers/media/pci/cx88/cx88-input.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx88/cx88-input.c b/drivers/media/pci/cx88/cx88-input.c
index 27f690b54e0c..fa5ce464b0ba 100644
--- a/drivers/media/pci/cx88/cx88-input.c
+++ b/drivers/media/pci/cx88/cx88-input.c
@@ -167,7 +167,7 @@ static void cx88_ir_handle_key(struct cx88_IR *ir)
 
 static enum hrtimer_restart cx88_ir_work(struct hrtimer *timer)
 {
-	unsigned long missed;
+	u64 missed;
 	struct cx88_IR *ir = container_of(timer, struct cx88_IR, timer);
 
 	cx88_ir_handle_key(ir);
-- 
2.21.0

