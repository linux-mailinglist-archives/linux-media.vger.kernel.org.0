Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F25C2DBEA
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 13:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726875AbfE2LdB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 07:33:01 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35652 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbfE2LdB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 07:33:01 -0400
Received: by mail-wm1-f65.google.com with SMTP id w9so1365057wmi.0
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 04:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=fghY+BZG9jzLH9CkfdGMJemIUFdCRHcuHHhTEZX8sh0=;
        b=L+C/lE+FoHWyOoKPusjaa84mUfC5vwra665gmIPOHxtpeKaROW6pH6HWhk7bB99zDx
         0pTtMvF4Ey0i4wH88VMwcD5bz3bSDGlMesqI/bW7UJzVjpAFV1XpvVPkW+F5baqsncXe
         A5RkrHuYBJxrWlfomO4FDAIFqItODvK2WIgYe5B0+Fj/y9ITA1Gw5GJxEZ/dQ7YPOzXG
         htCeZbJhccM4fT+tdo6xXN/McOmQVTH8rrOLHGNVYpWiAxKxcxp9leWir5f9rt3M6o8Y
         AeFALuV7F022LnFUNFCIEWx7RgXkGBgVIMg3jXEawHzIhAed8IvmrYGoxD/0Cw+2Eqry
         pPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=fghY+BZG9jzLH9CkfdGMJemIUFdCRHcuHHhTEZX8sh0=;
        b=luHVQ6Z6t2nK8nbazcA5/gnvw4HR1XdBm7N6oyXRgXIOTO0rI80QOCohScCN4j8iBL
         aV0zkcHm1EO+BZEF44rzI/SQslKTny3Jm5GJoLFp12MxJDeUPlcwdm4azTOqU4jrKxzv
         NopVLAz5wpmNncSPtVmv3IUL5QZIOFAIb6/h7/4wjHXrz0/QJZiPJXLm3ddeHh/Lo2pl
         pBVzUMCGmNf0RBw+OQzCYzoHwQbYqNwyz7mygC1SnlCBrmCq4bFyduWMzdMp/tSnGCJn
         kL3/mNlwEXmDg+EYDT8DWeho7Dudx6C9wFfO+KAMqnoP+72xJeKg7foZabSmuAoq7xHP
         VrTA==
X-Gm-Message-State: APjAAAV9FAb4LCrGN8eU0P8JjSb46e96Wu40vYF4aszkk8uf6AFSWrl3
        IC2bFT+FLhqfNXhKoQ9u90GSVw==
X-Google-Smtp-Source: APXvYqxjNj2+u5xGz/WmE+sFhfaNSVZwlhC/y4svXXUWEjG6Pe2nusU5fvTjI8ygUg0gNdTV1HYmSw==
X-Received: by 2002:a1c:cb49:: with SMTP id b70mr7029966wmg.80.1559129578915;
        Wed, 29 May 2019 04:32:58 -0700 (PDT)
Received: from hackbox2.linaro.org ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t6sm12253565wmt.34.2019.05.29.04.32.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 04:32:58 -0700 (PDT)
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
To:     stable@vger.kernel.org
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        linux-kernel@vger.kernel.org,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH] media: v4l2-ioctl: clear fields in s_parm
Date:   Wed, 29 May 2019 12:32:47 +0100
Message-Id: <20190529113247.21188-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hans.verkuil@cisco.com>

commit 8a7c5594c02022ca5fa7fb603e11b3e1feb76ed5 upstream.

Zero the reserved capture/output array.

Zero the extendedmode (it is never used in drivers).

Clear all flags in capture/outputmode except for V4L2_MODE_HIGHQUALITY,
as that is the only valid flag.

Cc: <stable@vger.kernel.org> # v4.9 v4.14
Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 4510e8a37244..699e5f8e0a71 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1959,7 +1959,22 @@ static int v4l_s_parm(const struct v4l2_ioctl_ops *ops,
 	struct v4l2_streamparm *p = arg;
 	int ret = check_fmt(file, p->type);
 
-	return ret ? ret : ops->vidioc_s_parm(file, fh, p);
+	if (ret)
+		return ret;
+
+	/* Note: extendedmode is never used in drivers */
+	if (V4L2_TYPE_IS_OUTPUT(p->type)) {
+		memset(p->parm.output.reserved, 0,
+		       sizeof(p->parm.output.reserved));
+		p->parm.output.extendedmode = 0;
+		p->parm.output.outputmode &= V4L2_MODE_HIGHQUALITY;
+	} else {
+		memset(p->parm.capture.reserved, 0,
+		       sizeof(p->parm.capture.reserved));
+		p->parm.capture.extendedmode = 0;
+		p->parm.capture.capturemode &= V4L2_MODE_HIGHQUALITY;
+	}
+	return ops->vidioc_s_parm(file, fh, p);
 }
 
 static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
-- 
2.17.1

