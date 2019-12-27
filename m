Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0FAC12B1C4
	for <lists+linux-media@lfdr.de>; Fri, 27 Dec 2019 07:32:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbfL0Gck (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Dec 2019 01:32:40 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44413 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbfL0Gck (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Dec 2019 01:32:40 -0500
Received: by mail-pf1-f194.google.com with SMTP id 195so13427805pfw.11;
        Thu, 26 Dec 2019 22:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2aAZsrFg19vll1emaW6XpIeha1H0m56azXvY0CR3CNI=;
        b=QVLqmpEAbgO2c42Y8tN7yjEwEflGvvFkcpiVcMD3XIqLRILUAeL2JgE94lP0d2l6Jo
         8Olnde1TWqU37CNeGWvivKNnyz2cP4Hwd2dzMYqXlB6DHV56xEmF/XZO0a1Mhp591qHJ
         mvrM/dnOi92oltV+os0KafIuom1VBvkfu30pivZzaFTDpeM6K1nLYhUN/Sy5EVtqVfSr
         7hexdgBSXUopcPY9xUp3khH7XPKs9RJTovJ/mmCKwWcE+7GwuP1GBI2yti1SkprgbHaf
         iU70Y1IKvUbosCXMhnpvOvCl233EWQzCNc08hlvDR/ahyEG4gHsXFb53b+45hLer3iG/
         ZBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2aAZsrFg19vll1emaW6XpIeha1H0m56azXvY0CR3CNI=;
        b=hbSjwunGcmTvAWLDsEIKmh6ZS3n2QxusLjnpAgdIqkyzrF76T9h5G+6OualvKkNHQN
         WEiQJuWOlB+qP+axYvFBAsp+MRpTiX2cg9mSMSFfSREmlpAbxfLpyijWqrrvKTdm3NMV
         dsXhq64TO7pjR1+tDmWXP96O9VuXrvj7o6kNbFZ0bth1j/js8Ek48clNlBFHSpjkYCwn
         1xFR6zNTGAeNYdnJ3KHMnOVGmUeufDCD53Ypscvu/8ZUusg7O9hlbg/oGw9L0h+XlxLz
         /fFnO/4pzWCKsgP6mX3j5L7xpLVkjTruER1yl/qxcQbdXCk34/RdF3U3FmR4UW5ZTBRL
         g57w==
X-Gm-Message-State: APjAAAWcikk0r6gXeskLZCbGyEtGEDREfihVZZqbH72+BSsg5YBnTgqw
        4C/HUwMvKBca5Dxm1Nim+mSGebwY
X-Google-Smtp-Source: APXvYqzpfH2rh0jD8O3cY2+AVWY6TqBk7XZZSc+kF3cJWPXyqCwoDqf0/S76vRyOMV17qmNwfXnOOw==
X-Received: by 2002:a63:215f:: with SMTP id s31mr51237960pgm.27.1577428359435;
        Thu, 26 Dec 2019 22:32:39 -0800 (PST)
Received: from tw-172-25-31-76.office.twttr.net ([8.25.197.24])
        by smtp.gmail.com with ESMTPSA id s18sm34388938pfh.179.2019.12.26.22.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 22:32:38 -0800 (PST)
From:   Cong Wang <xiyou.wangcong@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Cong Wang <xiyou.wangcong@gmail.com>,
        syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com,
        Greg Hackmann <ghackmann@google.com>,
        Chenbo Feng <fengc@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH] dma-buf: free dmabuf->name in dma_buf_release()
Date:   Thu, 26 Dec 2019 22:32:04 -0800
Message-Id: <20191227063204.5813-1-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

dma-buff name can be set via DMA_BUF_SET_NAME ioctl, but once set
it never gets freed.

Free it in dma_buf_release().

Fixes: bb2bb9030425 ("dma-buf: add DMA_BUF_SET_NAME ioctls")
Reported-by: syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com
Cc: Greg Hackmann <ghackmann@google.com>
Cc: Chenbo Feng <fengc@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
---
 drivers/dma-buf/dma-buf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index ce41cd9b758a..2427398ff22a 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -108,6 +108,7 @@ static int dma_buf_release(struct inode *inode, struct file *file)
 		dma_resv_fini(dmabuf->resv);
 
 	module_put(dmabuf->owner);
+	kfree(dmabuf->name);
 	kfree(dmabuf);
 	return 0;
 }
-- 
2.21.0

