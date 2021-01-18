Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C417B2FA208
	for <lists+linux-media@lfdr.de>; Mon, 18 Jan 2021 14:48:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404811AbhARNsL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Jan 2021 08:48:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42226 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404790AbhARNro (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Jan 2021 08:47:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610977577;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=X4UKy1ZlErLNFqSWKqt0fMjDDkpt5JLUt2TOmRC3MUA=;
        b=V/k8NME4DHRTgy3ICLXxuXGVI3PlANgqATyakuaHcXCdJ9tZUjs7qsYZmgAyOWi6tcQXmV
        7nFBtyYGa/eySTG9W71AftEE2SJxiMjxg/ZVX8ShZu2rxtiyZBFqt9zTAesxE7XYHKXHFc
        E3LEcnWgu/+FZLQQEdyI8sN5+Ab2CPY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-zhpqICeWNFaT_6DtviTkzA-1; Mon, 18 Jan 2021 08:46:16 -0500
X-MC-Unique: zhpqICeWNFaT_6DtviTkzA-1
Received: by mail-qt1-f199.google.com with SMTP id k12so15307160qth.23
        for <linux-media@vger.kernel.org>; Mon, 18 Jan 2021 05:46:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X4UKy1ZlErLNFqSWKqt0fMjDDkpt5JLUt2TOmRC3MUA=;
        b=nEP5TUna49l5BSErAArYrnqJ0daghNCQp3ccVcG2SX93Swu/BUq/AECwbKtklD2cya
         OxY96PKasQ27Bb3b+JAD9iqMkLvyrei3F+TpCg+nApW6jqnliWe7cYeh1gu28KQBnb9D
         k+iKg+rGGUGwgtIXZkHhTRoshgwk+8eaNxNzmBDjl7GflQTeKuEh/pRvQ0ab48/5t2fz
         ANfMzvk8dC+fYyGduM6SvyNkLpyShQUdzlA7JRbzqq6rQvKdL4+jCevP7QYiMUsa/eNj
         oMeP8ylqMrth5YZQaBNzPG1RZtumWWzItSXjrAmEbomT7/jYt0JoptIUwZXXWKJ2h4/b
         qJug==
X-Gm-Message-State: AOAM533WJIAFD4GFG31J3MYl5oMzNZjkNcs5KDpvoaVmvyOKOmLfDFNj
        DRpvWNDGv39FCDJ4uhVKGVBphBMjEZ5FjRdLh2Op+IDk3goEMjApz9PuQ1trtymcsHDNE95pcSC
        fuhBgAnG43CKNys7f2HwD9aI=
X-Received: by 2002:a0c:8304:: with SMTP id j4mr24266753qva.18.1610977575150;
        Mon, 18 Jan 2021 05:46:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfTxYTWOMK1FOKD7X9onRCJISzmAUfQaJXpGwZwHEk8ttsMbuo7RxaMz2e+7c5NBGily/iGQ==
X-Received: by 2002:a0c:8304:: with SMTP id j4mr24266551qva.18.1610977571564;
        Mon, 18 Jan 2021 05:46:11 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id o21sm11026169qko.9.2021.01.18.05.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 05:46:10 -0800 (PST)
From:   trix@redhat.com
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        peter.ujfalusi@ti.com, robert.jarzmik@free.fr,
        romain.perier@gmail.com, jacopo+renesas@jmondi.org,
        allen.lkml@gmail.com, dan.carpenter@oracle.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] media: pxa_camera: declare variable when DEBUG is defined
Date:   Mon, 18 Jan 2021 05:45:13 -0800
Message-Id: <20210118134513.613097-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Tom Rix <trix@redhat.com>

When DEBUG is defined this error occurs

drivers/media/platform/pxa_camera.c:1410:7: error:
  ‘i’ undeclared (first use in this function)
  for (i = 0; i < vb->num_planes; i++)
       ^
The variable 'i' is missing, so declare it.

Fixes: 6f28435d1c15 ("[media] media: platform: pxa_camera: trivial move of functions")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/media/platform/pxa_camera.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/pxa_camera.c b/drivers/media/platform/pxa_camera.c
index b664ce7558a1..75fad9689c90 100644
--- a/drivers/media/platform/pxa_camera.c
+++ b/drivers/media/platform/pxa_camera.c
@@ -1386,6 +1386,9 @@ static int pxac_vb2_prepare(struct vb2_buffer *vb)
 	struct pxa_camera_dev *pcdev = vb2_get_drv_priv(vb->vb2_queue);
 	struct pxa_buffer *buf = vb2_to_pxa_buffer(vb);
 	int ret = 0;
+#ifdef DEBUG
+	int i;
+#endif
 
 	switch (pcdev->channels) {
 	case 1:
-- 
2.27.0

