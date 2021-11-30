Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27141463B5F
	for <lists+linux-media@lfdr.de>; Tue, 30 Nov 2021 17:12:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233543AbhK3QP5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Nov 2021 11:15:57 -0500
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:43632 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238341AbhK3QPw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Nov 2021 11:15:52 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4J3S0v59gVz9vJrl
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 16:12:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KEbWTp_fg792 for <linux-media@vger.kernel.org>;
        Tue, 30 Nov 2021 10:12:31 -0600 (CST)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4J3S0v38Rgz9vJrh
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 10:12:31 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4J3S0v38Rgz9vJrh
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4J3S0v38Rgz9vJrh
Received: by mail-pj1-f69.google.com with SMTP id iq9-20020a17090afb4900b001a54412feb0so10093210pjb.1
        for <linux-media@vger.kernel.org>; Tue, 30 Nov 2021 08:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+InRof0/uIdyh184kbNfYTG/vjRoi2ITuATxWqrIaCg=;
        b=QQFpZIXv7DEivrF4SMIk84Xm86N1CjjIpvc3cSlX1cmd9Sy8GbGFq63zL0k5PKJa7i
         bIy7HFYuOq4jGsE4d4RTL4AxAt94zHyzsAjCw35b/P0HQ3vEJmrPcyPSxJRpH7d86KRS
         cu71acBcYj4CJebZkc2z1XlMBRaARx9RlgIlaA14r23AloLlHYesN/0Hdr7EAaieLnBr
         6GfBi4W0uurDwOAhtRKeMvYzmsyocF5Nn923hEE5t5ldSiT38+pR0WEDDTBdDUSSAs43
         s4J9TuzlbvUd7iuwKIOVUeuLVEdepQQyQJKJjvUjghseEyj0mXcL9z6BaHLeGZS3MIf6
         31OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+InRof0/uIdyh184kbNfYTG/vjRoi2ITuATxWqrIaCg=;
        b=md13j43/W9zD3eYUMAnhbFnlXrRxT1ZkVuaTFNOXjGydc05jbnD1VjPQ75ntqB3Q8O
         v1G2NI/RzIcqixXupNqZgOrfC5S4BE5O0MPR1C8XHWJbUZQXXApdeGSYgSW4BdNSNIVR
         Zq/ZsLO+lZw/q/I4f/EPj8iAfVBWnTJYfihDQ5XPjPoCj3Ef3vN806jZ0yCWPUM5wVcv
         2l8PqZbQbxhLbkOfrU2gCrUx05LfIikpf7B5UVbopwCz0b6z1T8thvxmxXEYWwuIAO5V
         wynegDn+NOEsl1OVrQKN2j7Dhh/9Wxx60Sq1ODHe56pYJT1D2lFfFar/Z/OrMgzro8Iw
         uAkg==
X-Gm-Message-State: AOAM532e8kCqXtIiX4zYlV7a5epIWMVjmSgJ3Guqfe0uaxUhIz2CPpN3
        VlXWm7JUXAT2BqgEqW7TCe05minDYvguI7Lj0WOyjiO7pFv5dWdFBkBMIPvmgcwjIx0yROj/TC7
        81kSGiHy8C1E0J6IfwKH1Y7aCZmQ=
X-Received: by 2002:a05:6a00:24d2:b0:49f:bbce:7bc1 with SMTP id d18-20020a056a0024d200b0049fbbce7bc1mr155706pfv.37.1638288750618;
        Tue, 30 Nov 2021 08:12:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+GKwKQHK7uXFjfxjVBqjeb+jOkdeK3mPEahrfjDgFy1kG8HcnLoSHVfN3RaX0GqrIAbyeRQ==
X-Received: by 2002:a05:6a00:24d2:b0:49f:bbce:7bc1 with SMTP id d18-20020a056a0024d200b0049fbbce7bc1mr155680pfv.37.1638288750395;
        Tue, 30 Nov 2021 08:12:30 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
        by smtp.gmail.com with ESMTPSA id lx15sm3380968pjb.44.2021.11.30.08.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Nov 2021 08:12:30 -0800 (PST)
From:   Zhou Qingyang <zhou1615@umn.edu>
To:     zhou1615@umn.edu
Cc:     kjlu@umn.edu, Neil Armstrong <narmstrong@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Maxime Jourdan <mjourdan@baylibre.com>,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: meson: vdec: Fix a NULL pointer dereference in amvdec_add_ts()
Date:   Wed,  1 Dec 2021 00:12:23 +0800
Message-Id: <20211130161224.181519-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In amvdec_add_ts(), there is a dereference of kzalloc(), which could lead
to a NULL pointer dereference on failure of kzalloc().

I fix this bug by adding a NULL check of new_ts.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_VIDEO_MESON_VDEC=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 876f123b8956 ("media: meson: vdec: bring up to compliance")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/staging/media/meson/vdec/vdec_helpers.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index b9125c295d1d..41297c2f8f9a 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -234,6 +234,11 @@ void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
 	unsigned long flags;
 
 	new_ts = kzalloc(sizeof(*new_ts), GFP_KERNEL);
+	if (!new_ts) {
+		dev_err(sess->core->dev_dec,
+			"No enough memory in %s\n", __func__);
+		return;
+	}
 	new_ts->ts = ts;
 	new_ts->tc = tc;
 	new_ts->offset = offset;
-- 
2.25.1

