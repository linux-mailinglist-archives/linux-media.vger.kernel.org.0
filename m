Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30B8542AF8C
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 00:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235833AbhJLWNw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Oct 2021 18:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235360AbhJLWNw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Oct 2021 18:13:52 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBAFCC061570;
        Tue, 12 Oct 2021 15:11:49 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id j5so2883814lfg.8;
        Tue, 12 Oct 2021 15:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PB0eDMKhk86i0GI1+A0jAKhTWNFDGyw5uusrHp5qJ1o=;
        b=S1OiTP1dWe72LOR+oSOBC80jt1H1zlBIVX4x6c0VO9fYYYYlJV9jIoBJcmiir1CgZa
         n/UUUUjfYZoqNE0vw4ZzgPB03GAJ/j3ffCDPLwoImscEzNeP1RHSPBBEzZPgSdiGdqte
         3t0C6qwdCyPPsdinRhIx5a2du9iE4zGl3E4Xfo95x6xJsFA+w+0t3ocBUBxxYcBfdP7V
         XSKTRGeldYrhJ66ILf7kPHtvZOAgZAXqCn6r0T04NxuMnKbeDnqo9wj9Dy31ydqxc1k2
         qSTFz71PGVYfV0nBypO0UDPSUH69CV6KxE2YRgrwtk9TZZUxfOgq2cZcJ80d6UdaEaPa
         Fg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PB0eDMKhk86i0GI1+A0jAKhTWNFDGyw5uusrHp5qJ1o=;
        b=dzIhLdG9joVJYSdDMN6deendWlAz4wvrk5QnZfd4f5vNpydZfg9Z685PEB6iRUhxDU
         MjYobU75dAJYiglpH0/Fpj1AwJBPqukVaG7jUFW+GZFkxeVZLq5buQQoLgjRyZueZuvE
         my+Rc/i5N899B+rll/HkKy7T4/jN9JiUZ0TfPImyRcpCrpGYZkOHlWky3GZJO51u9d/G
         f+LwCKZCccJ6RHTGEu1vsq5sRhGo25obsi4TlRYL2zoecZ9ChRflXIlz+E8NOYIggL++
         /lJAbXVoWdOdQX6hv4p3JGFFpDrx1PjfI6Eor7kANIwQ/EELVE3VUlxsZq1F/RSEXEUP
         42kg==
X-Gm-Message-State: AOAM530JWgKVi0T97FptvehEIHVgKzDga82SSOSlwcD6EEDoRw84AS+f
        BhuIrhyIJqmwOnWDkhqszAQ=
X-Google-Smtp-Source: ABdhPJzhfBx5c1yogIsQxrarVmSKN6V4lDQZbMNMVOMA7DFH4f6xxS3aIqwHk7TFuKFe4AJ/YqRnpQ==
X-Received: by 2002:a2e:8756:: with SMTP id q22mr24920778ljj.271.1634076708253;
        Tue, 12 Oct 2021 15:11:48 -0700 (PDT)
Received: from localhost.localdomain (h-158-174-22-5.NA.cust.bahnhof.se. [158.174.22.5])
        by smtp.gmail.com with ESMTPSA id v2sm645467lfo.119.2021.10.12.15.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 15:11:47 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] staging: media: rkvdec: Constify static struct v4l2_m2m_ops
Date:   Wed, 13 Oct 2021 00:11:44 +0200
Message-Id: <20211012221144.30638-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The only usage of rkvdec_m2m_ops is to pass its address to v4l2_m2m_init(),
which takes a pointer to const v4l2_m2m_ops as argument. Make it const
to allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/staging/media/rkvdec/rkvdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index bf00fe6534a3..28aab5c7fe33 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -677,7 +677,7 @@ static void rkvdec_device_run(void *priv)
 		rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
 }
 
-static struct v4l2_m2m_ops rkvdec_m2m_ops = {
+static const struct v4l2_m2m_ops rkvdec_m2m_ops = {
 	.device_run = rkvdec_device_run,
 };
 
-- 
2.33.0

