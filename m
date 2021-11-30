Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26418463BDA
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 17:34:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243948AbhK3QiL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 11:38:11 -0500
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:37304 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231822AbhK3QiK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 11:38:10 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 4J3SVg0Dgkz9wKsT
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 16:34:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id p2UqOLd_MBZ7 for <linux-media@vger.kernel.org>;
        Tue, 30 Nov 2021 10:34:50 -0600 (CST)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 4J3SVf5GHRz9wKsQ
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 10:34:50 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 4J3SVf5GHRz9wKsQ
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 4J3SVf5GHRz9wKsQ
Received: by mail-pf1-f200.google.com with SMTP id x9-20020a056a00188900b0049fd22b9a27so13101272pfh.18
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 08:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MYKPwzoyWHGBZEGP0FkOr9CYpQBhpzZCOik0AM0Sdo8=;
        b=RQvZuZ/nafGnDHfmXwZ6cvDchA8m96Wqp83qYLW8PItuj18LiYEUF7E0gGqYAsfEqZ
         Yl1TzRZfWQgYfXflUnI2tZ3pN92A+wMmbW/sQmhYm5wSQo5EUVydtCcVgL7ww3uepPPk
         nKuNDs/h0zTqgCVt5Xwh1DTQxXPa/jNT8qKRmpYc6sPn5JOgMVGH9OSxgqnjvPZ0L09F
         3QXDFI5UV+cGuX0rVJfUe8eT9FXX7z/KG4kasM1j/seDvlHvbzXZckJsH7FkyuBlbr8D
         BBqwXMDnuRSYt4yK4dI9fApDRMEJgmq8HvNoRN0G62+ERrInJ16avofCcp9Cm4M3BOYJ
         y+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MYKPwzoyWHGBZEGP0FkOr9CYpQBhpzZCOik0AM0Sdo8=;
        b=pgwmXcCEQBEp0/8T7fakjPLwFcu09qpPHcN9nepaDRZosq53yj5eWtPvyyzzi2RTJu
         VJlN9ZAWek7I+BiBvpNdICRYPrX0DjBBMMZF4BiKh3JR5KfLNpHHR2AlRODlRfGnNlof
         XHAhcMVxmKiSfFCoSYNbZGaomBBWrSFnPQkcX7wpxGrfcdupIq6tMd7hXAlpvkB6xvme
         eebLPF0JeKMNFeKZ39yDr3AaCPfJRJKH3ECbZdQyP4SWrota9Cbm9dFtNz0KmrqhR9gY
         W4EUsKlKIJdrWLtMcZ8hG5aBXw/Lv9nif2N4ufHc4otTVkV+xv0kHBHZK49PRsUYEZNv
         RgAQ==
X-Gm-Message-State: AOAM531c9aVYqp1K0HYE6tszsSrAVcomJ29x8L0tu3/dDbP6W5gMM0U+
        wo6vUwMX/4wWbJaIHdmuKqzuoP+PWWmSbeQ8Uphu3lErRjZ3nv8+BOJ6umjXI9ZCFhbYe4Cufht
        2OV+Gat2NVsZaNbBiCJLOoASE4S0=
X-Received: by 2002:aa7:9a04:0:b0:4a2:ebcd:89a with SMTP id w4-20020aa79a04000000b004a2ebcd089amr313336pfj.60.1638290090020;
        Tue, 30 Nov 2021 08:34:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+NapTRF+0qmVV/9UAF+h46DreJOU+o0UfalFcHhDwJazFFZuJ6wR8xlNc24zy9KZydggueQ==
X-Received: by 2002:aa7:9a04:0:b0:4a2:ebcd:89a with SMTP id w4-20020aa79a04000000b004a2ebcd089amr313313pfj.60.1638290089808;
        Tue, 30 Nov 2021 08:34:49 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id j127sm21533925pfg.14.2021.11.30.08.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 08:34:49 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: saa7146: mxb: Fix a NULL pointer dereference in mxb_attach()
Date:   Wed,  1 Dec 2021 00:34:44 +0800
Message-Id: <20211130163445.187403-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In mxb_attach(dev, info), saa7146_vv_init() is called to allocate a
new memory for dev->vv_data. saa7146_vv_release() will be called on
failure of mxb_probe(dev). There is a dereference of dev->vv_data
in saa7146_vv_release(), which could lead to a NULL pointer dereference
on failure of saa7146_vv_init().

Fix this bug by adding a check of saa7146_vv_init().

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_VIDEO_MXB=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 03b1930efd3c ("V4L/DVB: saa7146: fix regression of the av7110/budget-av driver")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/media/pci/saa7146/mxb.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/saa7146/mxb.c b/drivers/media/pci/saa7146/mxb.c
index 73fc901ecf3d..bf0b9b0914cd 100644
--- a/drivers/media/pci/saa7146/mxb.c
+++ b/drivers/media/pci/saa7146/mxb.c
@@ -683,10 +683,16 @@ static struct saa7146_ext_vv vv_data;
 static int mxb_attach(struct saa7146_dev *dev, struct saa7146_pci_extension_data *info)
 {
 	struct mxb *mxb;
+	int ret;
 
 	DEB_EE("dev:%p\n", dev);
 
-	saa7146_vv_init(dev, &vv_data);
+	ret = saa7146_vv_init(dev, &vv_data);
+	if (ret) {
+		ERR("Error in saa7146_vv_init()");
+		return ret;
+	}
+
 	if (mxb_probe(dev)) {
 		saa7146_vv_release(dev);
 		return -1;
-- 
2.25.1

