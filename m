Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE13CE328
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 15:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbfJGNVB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 09:21:01 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42480 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727324AbfJGNVB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Oct 2019 09:21:01 -0400
Received: by mail-lj1-f196.google.com with SMTP id y23so13599129lje.9;
        Mon, 07 Oct 2019 06:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B0ycQG3+LMWmEUo25NF7us/Cn/ZyGvcKYuOKAcoY2Nw=;
        b=LU66QDFKpb3kbaZeRzxxpeLNRPF93nH5WIe/X90mwNtclauejuLg8z/ib63g+x+gvx
         GxhrfbvUEuTkO2a3a4Zk6vVkhfe3SSA4SRfcQRHWe9pEA+szzUHk5SuVqqhiP+leGkVH
         0LSWVX/Ijuo86DtHepBlc2pW84aAFLh2PPLeg4mLSdGp+LGqACZ2VgtNL9ewGLtDvB52
         0bh7Hj0MlZts6VZJHLSplp0oeitu9I+5woCOic/SZQFeVg48X/+lBwtZL+HedewUIJSi
         Pfj9E3s9QA+SsO+7H8FB47F/siv5SNB2H4UNBbVm6dqwhKpBdoZmhNpMxaSWgcYg1/AX
         duqw==
X-Gm-Message-State: APjAAAUIZSgo98zZqaweNuVi8WkX9EkyVeemOvhMIawsgyrJnAJWqKhk
        ldfaAJeq69Ik6xPlYsEr1H4=
X-Google-Smtp-Source: APXvYqyAgDiVoPygX9FC5R8yba0eh0Im6+tqrhDhqTUSjsix/NO8TsyVRSyRbNcPP2LxnR7RNH9fKg==
X-Received: by 2002:a2e:9094:: with SMTP id l20mr18976621ljg.35.1570454458909;
        Mon, 07 Oct 2019 06:20:58 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id z14sm2687360lfh.30.2019.10.07.06.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2019 06:20:57 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v7 1/6] ad5820: Define entity function
Date:   Mon,  7 Oct 2019 15:20:39 +0200
Message-Id: <20191007132050.27298-2-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007132050.27298-1-ribalda@kernel.org>
References: <20191007132050.27298-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Without this patch, media_device_register_entity throws a warning:

dev_warn(mdev->dev,
	 "Entity type for entity %s was not initialized!\n",
	 entity->name);

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ad5820.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ad5820.c b/drivers/media/i2c/ad5820.c
index 925c171e7797..7a49651f4d1f 100644
--- a/drivers/media/i2c/ad5820.c
+++ b/drivers/media/i2c/ad5820.c
@@ -309,6 +309,7 @@ static int ad5820_probe(struct i2c_client *client,
 	v4l2_i2c_subdev_init(&coil->subdev, client, &ad5820_ops);
 	coil->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	coil->subdev.internal_ops = &ad5820_internal_ops;
+	coil->subdev.entity.function = MEDIA_ENT_F_LENS;
 	strscpy(coil->subdev.name, "ad5820 focus", sizeof(coil->subdev.name));
 
 	ret = media_entity_pads_init(&coil->subdev.entity, 0, NULL);
-- 
2.23.0

