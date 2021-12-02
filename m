Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1252446678D
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 17:04:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347840AbhLBQIB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Dec 2021 11:08:01 -0500
Received: from mta-p5.oit.umn.edu ([134.84.196.205]:58082 "EHLO
        mta-p5.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240974AbhLBQIA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Dec 2021 11:08:00 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J4gkt0Gybz9vFPk
        for <linux-media@vger.kernel.org>; Thu,  2 Dec 2021 16:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1nyXIdYT1XBm for <linux-media@vger.kernel.org>;
        Thu,  2 Dec 2021 10:04:37 -0600 (CST)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J4gks5G20z9vFPn
        for <linux-media@vger.kernel.org>; Thu,  2 Dec 2021 10:04:37 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J4gks5G20z9vFPn
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J4gks5G20z9vFPn
Received: by mail-pl1-f200.google.com with SMTP id k9-20020a170902c40900b001421e921ccaso11849831plk.22
        for <linux-media@vger.kernel.org>; Thu, 02 Dec 2021 08:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tSFdJHmjZmGwK0hgeK/BuhdxfmOuNZpb1fLDoMSMoIA=;
        b=L7C0+RHzWtzjba9VBc3MozgNXqhPdafl2LWHWHVzAggMUfoWrZALHvx2I8tzb0mZJD
         uH27GBysDh6p8PYn+9IbSvpazYZDH5AnsPUyf5xseBrxm9ERd/u65z+8bOekTU8dXr35
         JVg25OtUunTatma0lA9H+Xz93wlAOGSbUduvHPMHz81iMY9vlsYWZpSPxd6CHG0tZwu3
         D6iAWEhHB2C0HOC5Iflfa6sPTLscRTvsfwSfjXaWH3EzHspoFClknTsEXh0yU/ppbJ+V
         dXo1B0bKaNRS5+Wj/fNKp6HPZJ4+RcKEEs4vmzmouvuVv/EMH8fzet07v9ElecC6ZQF8
         ObVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tSFdJHmjZmGwK0hgeK/BuhdxfmOuNZpb1fLDoMSMoIA=;
        b=hHcMn1uSXS5hT7Oa841HEQ89vAhBAgCXaaUdUbTIvc9mmoqKNaFv9S3nV2vwYtgdDA
         sd5NkuwbTUs5lp9VOghuKtSgfNQ4NsmIIY+ILtFpVG0t6XVvGHQxG9NFK4p0HjkkXwNL
         aBau9LnNMdIKidDLO/gf9iBp0wmxhc3sjguSjFbKlvp3yfhIW/Uq9B44K+RCCRUD7e1i
         DI+yhF1hJlKaBOg7kGo7JcPJn4m0ILskHbKHD4rqZyREiC7rZLbShUHFzNwuVG0K9aL8
         GkoPmAxQj5U2ec83h82opyPUIGZso0eDzJV6AhWWbJqNV9G/nxOG9fCxCHki4GyW0sC7
         yL5A==
X-Gm-Message-State: AOAM530A/7TUgZAe96i4niXkKiJ8s2/yDgIHuG2GDVFGm0nLINxfSCvn
        f7SdA0JPl5bjyU7TwWvxrz5VrA6cAtEhelLPSTWNv6tlk4iX9UM8mnrLhWbuf1Ycny3UypQF4u3
        AUfPnySSrMLKrrJbpLzekJr4UXrk=
X-Received: by 2002:a63:1754:: with SMTP id 20mr23996pgx.559.1638461077018;
        Thu, 02 Dec 2021 08:04:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWtFMeKAwpw/3fOXWwvMLF/51H2uFNuH5A00e7CrM7Jjwcdxc5Efn+9134CUiC/P7QgYHbNw==
X-Received: by 2002:a63:1754:: with SMTP id 20mr23947pgx.559.1638461076514;
        Thu, 02 Dec 2021 08:04:36 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.93.212])
        by smtp.gmail.com with ESMTPSA id a22sm236765pfh.111.2021.12.02.08.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 08:04:36 -0800 (PST)
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
Subject: [PATCH v2] media: meson: vdec: Fix a NULL pointer dereference in amvdec_add_ts()
Date:   Fri,  3 Dec 2021 00:03:57 +0800
Message-Id: <20211202160357.75173-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201084108.GE9522@kadam>
References: <20211201084108.GE9522@kadam>
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
Changes in v2:
  -  Delete dev_err() message

 drivers/staging/media/meson/vdec/vdec_helpers.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index b9125c295d1d..ac60514c475b 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -234,6 +234,9 @@ void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
 	unsigned long flags;
 
 	new_ts = kzalloc(sizeof(*new_ts), GFP_KERNEL);
+	if (!new_ts)
+		return;
+
 	new_ts->ts = ts;
 	new_ts->tc = tc;
 	new_ts->offset = offset;
-- 
2.25.1

