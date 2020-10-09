Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D28B2885D3
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 11:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732712AbgJIJQV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 05:16:21 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:34445 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731262AbgJIJQV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Oct 2020 05:16:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id QoVckGijFTHgxQoVfkJdrV; Fri, 09 Oct 2020 11:16:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1602234979; bh=nNmzWT+aol5wqTc1iV3II4rfiwXpoRUzZajJ5opaHF8=;
        h=From:Subject:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=f92YVMzVwOxXrBloXnZZ5zhLYwjIqlgKKh7bfq5G1lqkapfQTebiVlR+G4Xy5ktM0
         IY2zPDv9uzh2csqkPQpv61wpO5XPenAsxkepSFS4y6IRE+64vezFUNDWWX16y9kaZl
         AY6C7ixs4g3vmxL4d0Y7dUWngv7guFmTe4VxA/FfWymbGPC4kk6NznPDM34mffzvIf
         hzPipkw0H24cld6JG7DSM1MaJIXx/siE9Faqo0TbIF2OYAl7PwWrAiHwFyRoiF066T
         wSgo8tBDeipVZ5TdntAD9hRGOay1ACBBGpBEP1+UzqZtQa7XlxMPiOA/WWhDYcSoR4
         E20++CcOJLGEw==
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH] cec-core: first mark device unregistered, then wake up fhs
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Message-ID: <77df9930-f50a-be6d-0d12-04e44cc350b0@xs4all.nl>
Date:   Fri, 9 Oct 2020 11:16:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJep8NAaKDAHd6mGQ2+DtZ4liw2PPGdWKLJNPOmhk/oz4R9XkZo++ygJ4fvBYpm2VY80TAeigNFdN5uFu0wpmDa4a351BzZ5r8o0tEusESA5d+79+Bt9
 YU91zzhgsUqP5HvRj6sWQBKFgmgfZWh9HG4YsEvoqAJjF0AUIYLu3wG5glFWu4Uz9nk7ElzisChTow==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If a CEC device node is unregistered, then it should be marked as
unregistered before waking up any filehandles that are waiting for
an event.

This ensures that there is no race condition where an application can
call CEC_DQEVENT and have the ioctl return 0 instead of ENODEV.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index ece236291f35..551689d371a7 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -166,12 +166,12 @@ static void cec_devnode_unregister(struct cec_adapter *adap)
 		mutex_unlock(&devnode->lock);
 		return;
 	}
+	devnode->registered = false;
+	devnode->unregistered = true;

 	list_for_each_entry(fh, &devnode->fhs, list)
 		wake_up_interruptible(&fh->wait);

-	devnode->registered = false;
-	devnode->unregistered = true;
 	mutex_unlock(&devnode->lock);

 	mutex_lock(&adap->lock);

