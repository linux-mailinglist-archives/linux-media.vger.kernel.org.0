Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64D1D16F056
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 21:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729442AbgBYUpH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 15:45:07 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34303 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727624AbgBYUpH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 15:45:07 -0500
Received: by mail-pf1-f194.google.com with SMTP id i6so193833pfc.1;
        Tue, 25 Feb 2020 12:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rTrYdgShUxjhTgN/M+5vDyiCIj0nQYIb/LpyI8hkLng=;
        b=qaiVU/umPhZpHouJrJKxTpm7lGWegiVkyARizWMrBascabBG7bhdKuD5gXNY0Lxf+C
         Tw8SNBSWfUJVIb60Yl/iHWZI7+fSaA/nfIjuPo2KO//ezjPHPK783YjWvZD/fqAScKTS
         pduUK/KUxzQO0mqeX11wj3YfM03olD8Rm9wSCfNSNYpCeibRLkVX9407/W+o3DHFoqEL
         Bozx4v2hVD/aEFJyfM7E4UXpDupBznLQNVJ/zgIcee0QEq794v1OTHQz43gavHOl3RJi
         Svdh9kFemOS+j3gyKYfDt9AK7ra+N3epuUToyoq9YkVhPM67JKbkyXXzYTEuZW+tikNH
         uNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rTrYdgShUxjhTgN/M+5vDyiCIj0nQYIb/LpyI8hkLng=;
        b=q2sgamDCPi6nmM/cKryz1pHJi6SZh3sJUsfmFbZTeBK1tC3oZ/0SOaPBP19LBnFDwE
         EmjJaB/7JiQoNNdiiCQ8EiGF8yV1bOoBEqDyM4E2p/u+jIASdLvcK426PQr51AlJ0Ghq
         6VD0ynnvGH0taxrbbsUyGys95yhd3qPNUcphHy3rUnMYMkSQY+RFLwyd2YmJ/vY8GUh9
         LXuXkUCLilcv9RPW3/Zt08GsW23MRRQ4JYxecNp9R/Eu4dCqaZA5qvox/U6yK9QLi6e1
         83HGvyYrw0y6+hkdDYPK2a/eRGd/2A0u3ecr4PSAUO3uHoV058qYTZFlgJK+TsIIS4Xm
         TNaA==
X-Gm-Message-State: APjAAAWL8Fzfw0JIjuh6dIr/oTquTfYCkoFSB5Lz/FGzeVB6JaCOCkJz
        JJeiCX+1Fkcoa7lAnhACPCpy6h/YmFM=
X-Google-Smtp-Source: APXvYqyGvajkwKcLRMSWOmO2kJ/LSy6jL5WbReeJGFI6FCRLEOWLDc8sBXYbmFRvsoP8IHmCn35vOQ==
X-Received: by 2002:a63:3d44:: with SMTP id k65mr327215pga.349.1582663506812;
        Tue, 25 Feb 2020 12:45:06 -0800 (PST)
Received: from tw-172-25-31-76.office.twttr.net ([8.25.197.24])
        by smtp.gmail.com with ESMTPSA id e2sm4047954pjs.25.2020.02.25.12.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 12:45:06 -0800 (PST)
From:   Cong Wang <xiyou.wangcong@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Cong Wang <xiyou.wangcong@gmail.com>,
        syzbot+b2098bc44728a4efb3e9@syzkaller.appspotmail.com,
        Chenbo Feng <fengc@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] dma-buf: free dmabuf->name in dma_buf_release()
Date:   Tue, 25 Feb 2020 12:44:46 -0800
Message-Id: <20200225204446.11378-1-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.21.1
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
Acked-by: Chenbo Feng <fengc@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Cong Wang <xiyou.wangcong@gmail.com>
---
 drivers/dma-buf/dma-buf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index d4097856c86b..c343c7c10b4c 100644
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
2.21.1

