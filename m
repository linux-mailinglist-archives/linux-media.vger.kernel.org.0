Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8D72CA306
	for <lists+linux-media@lfdr.de>; Tue,  1 Dec 2020 13:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387499AbgLAMpf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Dec 2020 07:45:35 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:58927 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727852AbgLAMpe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 1 Dec 2020 07:45:34 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id k51SkssSADuFjk51Yk2RZW; Tue, 01 Dec 2020 13:44:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606826692; bh=mt5bsHjinTMK9UeaLEBSzlWAehCdkQv0m8nPyh/7k4Y=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=V5J5slFU1SmuQJ6ej80igbipy2/r3BcX2JOQn9UnmofHYPRzS3lhClWHcDWdiQ4Lw
         zii//mzWTgnCDsTiiIcyxHV8SMkwlINqbWBJSzMuvVC9cXR+/j7sIvhowPVd8pl02I
         qXB17nO07TnV02bVw49DJgYxmf4iMSc5sVeToU5CrZot4faSSk4c8Yha7Rp+mRqovD
         HTvYOiyi1YMPHdMEadlmAJmSllGt/rWwCiU8jMKlJlPP7jg6RVZWHfBLPfvNe4764T
         6/lenJrmjsxwhcDAJ7rNYcYnsv4+kJ9Huk7KyyA/guWYhoHC+HXk3yC33vCsZJIDO1
         uF3d/+d1emWOA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Alexandre Courbot <gnurou@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv3 7/7] cec: add EPOLLPRI in poll() when dev is unregistered
Date:   Tue,  1 Dec 2020 13:44:46 +0100
Message-Id: <20201201124446.448595-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201124446.448595-1-hverkuil-cisco@xs4all.nl>
References: <20201201124446.448595-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfMpvkjAk6HI2j3BveW2MEiCLvzzeRn4nnBO1V+ZM2q1Y2N6RUcSw8tTmOeRBj720LACdfRQKS6lKxmZf0IA1VBi176pkOz94HuIUN5ejM+oQDNve9s2j
 FT/XqBztnHKZqx7uUyd4pwR0S6tIPGDzzwA7xgVn7c/LeKSY+gnXNsmLzw5HOTL2MWcXoaze0r0+PnSI3u3uZzUMrYLvah+1NqcbUsnrYnyw5CTF1POWvWj5
 iIfUzUGIFnPwd+jQq6loI/HX7KoQKJSH8XtwhtS8rvKvtXsmn3pF17jScEBzdmH+8vlxZI1DG/o6rvgJBh72CtGC12ghXWXpvLxcfsX5P+A=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If the CEC device was unregistered, then add EPOLLPRI to
the poll() mask. Otherwise a select() that only waits for
exceptions will not wake up. A select() that waits for
read and/or write events *will* wake up on an EPOLLERR, but
not (for some reason) if it just waits for exceptions.

Strangly the epoll functionality will wakeup on EPOLLERR if
you just wait for an exception, so in this respect select()
and epoll differ.

In the end it doesn't really matter, what matters is that
polling file handles are woken up on device unregistration.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/cec/core/cec-api.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/cec/core/cec-api.c b/drivers/media/cec/core/cec-api.c
index f922a2196b2b..769e6b4cddce 100644
--- a/drivers/media/cec/core/cec-api.c
+++ b/drivers/media/cec/core/cec-api.c
@@ -40,7 +40,7 @@ static __poll_t cec_poll(struct file *filp,
 
 	poll_wait(filp, &fh->wait, poll);
 	if (!cec_is_registered(adap))
-		return EPOLLERR | EPOLLHUP;
+		return EPOLLERR | EPOLLHUP | EPOLLPRI;
 	mutex_lock(&adap->lock);
 	if (adap->is_configured &&
 	    adap->transmit_queue_sz < CEC_MAX_MSG_TX_QUEUE_SZ)
-- 
2.29.2

