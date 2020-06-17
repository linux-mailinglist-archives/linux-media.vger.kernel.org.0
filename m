Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBEC61FCE49
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 15:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgFQNV4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 09:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgFQNV4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 09:21:56 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1747C06174E
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 06:21:55 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id q11so2337845wrp.3
        for <linux-media@vger.kernel.org>; Wed, 17 Jun 2020 06:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kynesim-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:user-agent:mime-version
         :content-transfer-encoding;
        bh=KnDbWxVz7LkSs2qyHKja+9ta2DacnDYFCJSwSIuEmqc=;
        b=GvR81ySwji93l3eeweNyeTK1Fjuvvew/JDBxsT5r5qmiB9vnVZyNo91YbD38h21iI1
         vlW4OhUXHw7jEfm9kEHkVJCv14GKDqCHhxJVtmlZLIAn0tsTaeDRmdEZv9D1bOreyY3Z
         dTiwuqQfPr2HqrZxiaRCgkOpii3H1ZZLgqlkTp3XAVFH5V7P4Vk1wbnSESfi4QUnIDDJ
         l3W326WiIze3Muz2cPwLDkWenRvZ4/4K+he+p9CIdnHMcGdTIIRO9zUs3i9MDeUFc7wy
         7bFHRI7ZFBTnm/wg+sFTaGtH0NrGb6kw9xDkhpzfoDCLtZh+RX76cG9rhS4PDahyZ7DQ
         YNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:user-agent
         :mime-version:content-transfer-encoding;
        bh=KnDbWxVz7LkSs2qyHKja+9ta2DacnDYFCJSwSIuEmqc=;
        b=fYQXwgV9yG01LB4TA/ZVpmW/EGI2HHP6LTMIkR1Rr9XL+o9JQDhpHFfIYRh7jp9spQ
         YVwzvvdfBncbEkxkQ5y10FBQycpA9wbynNU3/UOSI8wyJxKhg25+lgt09dmduUim5AD5
         9QpZar24voA/SUeWoKyMoNFPI+vEzLv57ROEb63ep12YEbNfox2bDM5WCHBnYgUvkwE6
         V5QJwlU0x+1asP4agMmGP3m/plEmrc60qzfjxqXd3rUa6kwTgXhqaCw6ziDe+m+5e+Bf
         Veu/FKzkHQyf4fhtDzc7sRbD0N/ykfHUEGCNjyOwklVrrpQ70S3S69JJZscIyycIWVqb
         EuZg==
X-Gm-Message-State: AOAM533/ovrHPv87/Gf5YuTVjaz3njnySq5TGizmKVYFlXVbhNjI2fwt
        ZmwgWYuPWcjf0TtX5+RhfDbNGH3Atj/icA==
X-Google-Smtp-Source: ABdhPJyOroHIfdkok49JZSS+EHZoj0Fhb6wGVj5J8nRaQ49E80AhK+QzZkg80Vz8fP5Z1QrvPdOCHg==
X-Received: by 2002:a5d:514b:: with SMTP id u11mr5612617wrt.50.1592400113245;
        Wed, 17 Jun 2020 06:21:53 -0700 (PDT)
Received: from CTHALPA.outer.uphall.net (cpc92728-cmbg20-2-0-cust20.5-4.cable.virginm.net. [82.29.14.21])
        by smtp.gmail.com with ESMTPSA id k14sm32565648wrq.97.2020.06.17.06.21.52
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 17 Jun 2020 06:21:52 -0700 (PDT)
From:   John Cox <jc@kynesim.co.uk>
To:     linux-media@vger.kernel.org
Cc:     "Hans Verkuil" <hverkuil@xs4all.nl>
Subject: [PATCH] media: videobuf2: Fix length check for single plane dmabuf queueing
Date:   Wed, 17 Jun 2020 14:21:52 +0100
Message-ID: <gh5kef5bkeel3o6b2dkgc2dfagu9klj4c0@4ax.com>
User-Agent: ForteAgent/8.00.32.1272
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Check against length in v4l2_buffer rather than vb2_buffer when the
buffer is a dmabuf. This makes the single plane test the same as the
existing multiplanar test.

Signed-off-by: John Cox <jc@kynesim.co.uk>
---
 drivers/media/common/videobuf2/videobuf2-v4l2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/common/videobuf2/videobuf2-v4l2.c =
b/drivers/media/common/videobuf2/videobuf2-v4l2.c
index e652f4318284..731c7c99c971 100644
--- a/drivers/media/common/videobuf2/videobuf2-v4l2.c
+++ b/drivers/media/common/videobuf2/videobuf2-v4l2.c
@@ -114,7 +114,8 @@ static int __verify_length(struct vb2_buffer *vb, =
const struct v4l2_buffer *b)
                                return -EINVAL;
                }
        } else {
-               length =3D (b->memory =3D=3D VB2_MEMORY_USERPTR)
+               length =3D (b->memory =3D=3D VB2_MEMORY_USERPTR ||
+                         b->memory =3D=3D VB2_MEMORY_DMABUF)
                        ? b->length : vb->planes[0].length;

                if (b->bytesused > length)
--
2.17.1
