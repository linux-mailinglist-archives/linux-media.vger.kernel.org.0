Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85A221F8662
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2020 05:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgFNDbP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 13 Jun 2020 23:31:15 -0400
Received: from mta-p6.oit.umn.edu ([134.84.196.206]:52662 "EHLO
        mta-p6.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726460AbgFNDbO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 13 Jun 2020 23:31:14 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p6.oit.umn.edu (Postfix) with ESMTP id 49l0Nx1lbXz9vKlq
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2020 03:31:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id pOjFhNH7dI5P for <linux-media@vger.kernel.org>;
        Sat, 13 Jun 2020 22:31:13 -0500 (CDT)
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 49l0Nx05hnz9vKlB
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 22:31:13 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 49l0Nx05hnz9vKlB
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 49l0Nx05hnz9vKlB
Received: by mail-io1-f71.google.com with SMTP id m11so8984348ioj.14
        for <linux-media@vger.kernel.org>; Sat, 13 Jun 2020 20:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=QC4W5Z98ewA9cfGWCJBWYLE1wXoEKo5o/mm76vna++w=;
        b=l4HsWZVRaRopjH5fxsKG9TT3IzKwHNL+SZGvSUbZctyQIkIwpqWDGQahUo239xwFnw
         3jVyma/FVhzgAB2Soj8BMmHUSqOxcfojutn23gUi5UPDgzVKvp9TzpRpcvbIzKGKzQio
         iEV8fgV9t4sMpv//9Sk2DZL27iiQHRFEW2rcX9J6jIyY81nEP9bxeErANWnXarCCLbQq
         g0S9IN4DWUqtIUKU562wT8HHB6WT2+JNVlBnA6zwstLNA6ESlmNq9dMA02ANtLALqQGO
         2so1/KmpDcpbLuZn4n+O0wHa16hNuv6v69Vp6hPICjwU32AgwSIpbAJxSqZUUeI+qm81
         6QqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QC4W5Z98ewA9cfGWCJBWYLE1wXoEKo5o/mm76vna++w=;
        b=sQlsit+iXTEGjztO8rj/57qDYyuTk3qe9hirQsujWV2wFkwgOwDQeTamrjoLljqmsM
         pG+dM7qcgZb4FsYmsqQyypO8UNsAbTPNW+doIzYOPNW/KFmurjsOHoR7TJpaP2CCTPs9
         L6g98ebYwtFnm2mi0LZH6h6C8vfYNRHkVWiucskSqoZH3TUcvFw5/QKLP7VdCBkW1BSn
         d1JTbZRBhIFDeIFp5BaBAhju33jpcH4iMWN32p/LJ3s/K6rWkU4HEjFUkb2CjIKFdKLO
         Vb245uSfXtOWjoc+aD0JZkN/n9hmI6tOzr/S6MqoGFZuDxSKm334z6/iVQt3xrA0WZMh
         +dPA==
X-Gm-Message-State: AOAM530AYXdchKD8ToHjIk6PKcYEs3V26c6rmXjBuGQrbBexohE4737c
        Nvg8ZuuW6iquP+kRBJTnn/agJDQnNZmBypR652YC2Pv7hFN2o7uUctYSKn9RbvV05Orym3nLujT
        HaqWEIDqH6gJKKxvAmCCRowxrNC0=
X-Received: by 2002:a05:6602:2f0f:: with SMTP id q15mr21904794iow.23.1592105472593;
        Sat, 13 Jun 2020 20:31:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyo6BZxfeK7IcN9R8yUusqQP6X7tNMKZlOYtuXMxncOU7fJ+1AEAJ3/fILIO0Q3vy1D8JsQEQ==
X-Received: by 2002:a05:6602:2f0f:: with SMTP id q15mr21904758iow.23.1592105472205;
        Sat, 13 Jun 2020 20:31:12 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
        by smtp.gmail.com with ESMTPSA id t63sm5928233ill.54.2020.06.13.20.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 20:31:11 -0700 (PDT)
From:   wu000273@umn.edu
To:     kjlu@umn.edu
Cc:     wu000273@umn.edu,
        Jean-Christophe Trotin <jean-christophe.trotin@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: sti: Fix reference count leaks
Date:   Sat, 13 Jun 2020 22:31:06 -0500
Message-Id: <20200614033106.426-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code, causing incorrect ref count if
pm_runtime_put_noidle() is not called in error handling paths.
Thus call pm_runtime_put_noidle() if pm_runtime_get_sync() fails.

Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/media/platform/sti/hva/hva-hw.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/sti/hva/hva-hw.c b/drivers/media/platform/sti/hva/hva-hw.c
index 401aaafa1710..bb13348be083 100644
--- a/drivers/media/platform/sti/hva/hva-hw.c
+++ b/drivers/media/platform/sti/hva/hva-hw.c
@@ -272,6 +272,7 @@ static unsigned long int hva_hw_get_ip_version(struct hva_dev *hva)
 
 	if (pm_runtime_get_sync(dev) < 0) {
 		dev_err(dev, "%s     failed to get pm_runtime\n", HVA_PREFIX);
+		pm_runtime_put_noidle(dev);
 		mutex_unlock(&hva->protect_mutex);
 		return -EFAULT;
 	}
@@ -553,6 +554,7 @@ void hva_hw_dump_regs(struct hva_dev *hva, struct seq_file *s)
 
 	if (pm_runtime_get_sync(dev) < 0) {
 		seq_puts(s, "Cannot wake up IP\n");
+		pm_runtime_put_noidle(dev);
 		mutex_unlock(&hva->protect_mutex);
 		return;
 	}
-- 
2.17.1

