Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2DAED6477
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2019 15:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732166AbfJNNyi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Oct 2019 09:54:38 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:46490 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730477AbfJNNyh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Oct 2019 09:54:37 -0400
Received: by mail-qk1-f195.google.com with SMTP id 201so15912769qkd.13
        for <linux-media@vger.kernel.org>; Mon, 14 Oct 2019 06:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JeTCgLHc+ukJBcflVyUC0D1v6F9HtoL+KQcpGeRi07U=;
        b=pk/b2fowOWTb+Kc3fYaYAmKISr7NXetcPyz8+BJUvLltmVbCnZ2hf0I+FaAktabmPz
         RI1FYr6U7YtE5SytE6aUChbO1+wWMmDe2vXDfc3JKFCiadeHThhno1nsnf/986KqYans
         BRGzC3X8VFkErLr2DyPemLYFdgnJKCqbB5vilsoDb/9BKPIQ9n/vqjEZ9NXjFw1f0FPi
         0ERZ5Z6uMpuRsB1Qfh1b+4JQPUQ7VPQFhL8j65iYts4j9QHb/dWqjmV5vnQFqkmsn3/e
         oU0aoRdcvNYlQlw+qTbAFPTF66SURosYE2q0SR1l9NecSZtNTcAlb/FX9BJjLd/5Q9KZ
         NtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JeTCgLHc+ukJBcflVyUC0D1v6F9HtoL+KQcpGeRi07U=;
        b=CKXBs8Q55MrFIrWsHvTQZIgcZSwqB2k/bPqY5a6/3GMHtuxRwZhxcf5kHjQam6P0A7
         gb7A59H+Xf0tkfPgO5h/IMjGT5KmyO8DWdGJoCGgTDhP/Z/TtocSOcxCR/b4ZHQI2jhG
         W4FHHIYaSUKWTUU8R8KkkpoF5SN5GyGUxLv3rqYLtw8Mx1BVuDgh2+zq5I2oGMieJBPx
         xxGK4xyEJo9C5gAaeHWNmUmisJ8dl3Nf6OarSHrKyUUVYoznTxLwgetf2KhfBTFKcDgT
         oGesyLcfQSx+B7zf7wTgflTGUQUuVzRdfxbJt+l1YBVcWVf7hiXi0znOXayOn0nxHbZk
         Rfvw==
X-Gm-Message-State: APjAAAX82FfviwEuGSlaWVlJKr4TLqEwBbdIBvfr1L5nGKdWFNrR2RG8
        CMmSuhYOny54KzTVAs/GuKU=
X-Google-Smtp-Source: APXvYqwiqZXncyCgyW0kQXb4214/b7KfzRiiD1Y0jq6oHw68x067slnYXo7WUOapzudMY5jjQRsM/w==
X-Received: by 2002:a05:620a:2158:: with SMTP id m24mr30262112qkm.250.1571061276654;
        Mon, 14 Oct 2019 06:54:36 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:99::1])
        by smtp.gmail.com with ESMTPSA id n21sm8501666qka.83.2019.10.14.06.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2019 06:54:35 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, p.zabel@pengutronix.de, slongerbeam@gmail.com,
        tharvey@gateworks.com, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 2/3] media: imx.rst: Provide a real example for the output format
Date:   Mon, 14 Oct 2019 10:54:23 -0300
Message-Id: <20191014135424.7000-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191014135424.7000-1-festevam@gmail.com>
References: <20191014135424.7000-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the i.MX6Q sabreauto pipeline example, it is better to provide
a real example for the output format, so do it just like in the
previous lines for consistency.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Make this change as part of a single patch

 Documentation/media/v4l-drivers/imx.rst | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/media/v4l-drivers/imx.rst b/Documentation/media/v4l-drivers/imx.rst
index 3d72e411b93d..36e8d1226ac6 100644
--- a/Documentation/media/v4l-drivers/imx.rst
+++ b/Documentation/media/v4l-drivers/imx.rst
@@ -547,8 +547,6 @@ This example configures a pipeline to capture from the ADV7180
 video decoder, assuming PAL 720x576 input signals, with Motion
 Compensated de-interlacing. The adv7180 must output sequential or
 alternating fields (field type 'seq-tb' for PAL, or 'alternate').
-$outputfmt can be any format supported by the ipu1_ic_prpvf entity
-at its output pad:
 
 .. code-block:: none
 
@@ -565,7 +563,7 @@ at its output pad:
    media-ctl -V "'ipu1_csi0':1 [fmt:AYUV32/720x576]"
    media-ctl -V "'ipu1_vdic':2 [fmt:AYUV32/720x576 field:none]"
    media-ctl -V "'ipu1_ic_prp':2 [fmt:AYUV32/720x576 field:none]"
-   media-ctl -V "'ipu1_ic_prpvf':1 [fmt:$outputfmt field:none]"
+   media-ctl -V "'ipu1_ic_prpvf':1 [fmt:AYUV32/720x576 field:none]"
 
 Streaming can then begin on the capture device node at
 "ipu1_ic_prpvf capture". The v4l2-ctl tool can be used to select any
-- 
2.17.1

