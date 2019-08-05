Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0E0F8209D
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 17:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbfHEPqA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 11:46:00 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34578 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfHEPqA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 11:46:00 -0400
Received: by mail-wr1-f68.google.com with SMTP id 31so84937420wrm.1
        for <linux-media@vger.kernel.org>; Mon, 05 Aug 2019 08:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=a4ZZo1KUS4v5eA927ZZztm7GQeLvgm0C/yGY+IBScNk=;
        b=c8lKjumQ802qAfCvsp5WXfL6BHjFMbZ03rSET63kgSVQxwL/Si4kP11+H9pHt9SeC8
         NBKpD0r8ULstE6FSP+fQdLCvtGGyH/qMhQUScICPY7e3ZLr8bDXUj4R1Scn6dYI4pOyn
         eL+OWq0smywS6iFlWZQnphIY48FUqJ1Iv4D+S0hk/xSnywiDLWApC4PmPVswHUxzp2Dt
         AdA6MQwxUQquKYm66Vcv4+HKNz6Bcw1v1VndIYGPs7OEDiryqfcp8AaS+qzZQQWKhyD4
         SI4xZu/j0j7DktO6fvtfDA9+/bdcwg5kx5ZXqeP2JEQpJHyjvFJGoA1i9OUPXvDWBwmr
         UhNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a4ZZo1KUS4v5eA927ZZztm7GQeLvgm0C/yGY+IBScNk=;
        b=JBz1a6YiXDJHUMztHupxVoP61wqd8WNfTOtOtgZzco3cQ1b6b2qeOO/MgN7Q7PNHyn
         UdPR4iq/9DIETF38+Dw6+bk9jEvmNcoaauqoNoJ15dv+q5Q1dsAM9qhG25vD4zWObyhO
         u/ufks5GnudBicOrb3GqWd+OUK/KgEC+NWaYkkC/gXxQoJIIha23+yRDqzBltc3ccxn7
         vLIEfcOsLEiY86S/M7KfOW8+99sY6JB+Hv1KExfi6XqWP/S5OEA0vhrSuZ9Kss0ZlSIr
         c7q+nLaeqNT8xYh5kdTLo9KBYby7cRGcQyVYM0G4GsgzuvX+Nupd47untpZS4MHt81Tr
         QtZg==
X-Gm-Message-State: APjAAAU68tCiWh4Wb/lj5yFJUwfMQaMgCsdjbFbkThvKMDN2c+k0lRa7
        u1nHkKI+NOUhbOGsRCYwOCI=
X-Google-Smtp-Source: APXvYqyKtWz2oAW1/rv7hSkrkd2h3z7inIhLfCt8NJpgwvZgCZQvI+8ki0rdQlhG46LV+7qztvPF4w==
X-Received: by 2002:a5d:6389:: with SMTP id p9mr1126311wru.297.1565019958875;
        Mon, 05 Aug 2019 08:45:58 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fdbd:6233:4990:5a8d])
        by smtp.gmail.com with ESMTPSA id 91sm171836865wrp.3.2019.08.05.08.45.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 08:45:58 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        chris@chris-wilson.co.uk
Subject: [PATCH 4/5] dma-buf: simplify reservation_object_get_fences_rcu a bit
Date:   Mon,  5 Aug 2019 17:45:53 +0200
Message-Id: <20190805154554.3476-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805154554.3476-1-christian.koenig@amd.com>
References: <20190805154554.3476-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We can add the exclusive fence to the list after making sure we got
a consistent state.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/reservation.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/dma-buf/reservation.c b/drivers/dma-buf/reservation.c
index 6eaca469005f..69c826553c72 100644
--- a/drivers/dma-buf/reservation.c
+++ b/drivers/dma-buf/reservation.c
@@ -426,13 +426,6 @@ int reservation_object_get_fences_rcu(struct reservation_object *obj,
 				if (!dma_fence_get_rcu(shared[i]))
 					break;
 			}
-
-			if (!pfence_excl && fence_excl) {
-				shared[i] = fence_excl;
-				fence_excl = NULL;
-				++i;
-				++shared_count;
-			}
 		}
 
 		if (i != shared_count || read_seqcount_retry(&obj->seq, seq)) {
@@ -447,6 +440,11 @@ int reservation_object_get_fences_rcu(struct reservation_object *obj,
 		rcu_read_unlock();
 	} while (ret);
 
+	if (pfence_excl)
+		*pfence_excl = fence_excl;
+	else if (fence_excl)
+		shared[++shared_count] = fence_excl;
+
 	if (!shared_count) {
 		kfree(shared);
 		shared = NULL;
@@ -454,9 +452,6 @@ int reservation_object_get_fences_rcu(struct reservation_object *obj,
 
 	*pshared_count = shared_count;
 	*pshared = shared;
-	if (pfence_excl)
-		*pfence_excl = fence_excl;
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(reservation_object_get_fences_rcu);
-- 
2.17.1

