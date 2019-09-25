Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF78BD9CF
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2019 10:27:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442737AbfIYI1v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Sep 2019 04:27:51 -0400
Received: from mail-pg1-f182.google.com ([209.85.215.182]:38193 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438134AbfIYI1v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Sep 2019 04:27:51 -0400
Received: by mail-pg1-f182.google.com with SMTP id x10so2789476pgi.5
        for <linux-media@vger.kernel.org>; Wed, 25 Sep 2019 01:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BcLR8fFB2JP+Hk8Hne+IfCrwjjYbglOmsJCk4fc8AOw=;
        b=I3pWPzyzbZvugX0QfkhgE9i286FLFg2KaaBh1rPcX1hGBoB71zm+Xggf46OIUXSL3N
         dPe4wjWXCYxCElGe7MTFuyCtKoZOKhM++lWvz1HDYVKoiHN+V1HyJBnvdl0AO7+iKfwX
         9a7yoZGqOBgLK5ckzdcBEonR8sPM+RUql7PumWjKXm7kEDZ2GODyetMZAihuYAwK2UU2
         zRhWTl4EyQmOJOafbqu1Dj6oe20bQBGScK1rXmkzhCwTvGIlYh2ZTw5k8k1MUsfR22zT
         6o2pQHu35rKj+3xg7dKtj472TylA3KgbO2T6FLo71CTr6tctDnIogAm/iMGYrmK3ZE4X
         UWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BcLR8fFB2JP+Hk8Hne+IfCrwjjYbglOmsJCk4fc8AOw=;
        b=S/ylrSaWIka+7vY5j5yuQP7MFMfFOqpUz7oCpWSEOf3WnRp+aNep3mw27WZJy7WowG
         xFGbTECfywXnSRoz2EKTKJUNK57ciUq/ZWYhEx4+tetQALrocgiTo1rgYqAwXyhAVyAF
         ZOHTIxDLswdMM+/gS3s0CicxpeDbsKrGuscLnUtkPntltUjQFisASq+WezveDyhRXAMK
         svV6vp5WA3JaMcS0ddjxSc709dtwIg7mDxnqTrdYIjIFO9mlumdotHUR/WFlwv7fOxZJ
         EZHFPd8+Mx6kI0rqwb/shU9c0Lz+vn6LZBZqEmGXUFx+nepSW4f3jDX+BJPMqVUVbcgO
         n3kg==
X-Gm-Message-State: APjAAAU4U8ZTaUv/lRt1gmVtMpkev+WNlimozjEoZNew3CCrhMOi7JAK
        Zx4JSWzrOlFUnUUc38a1koJBbTpQ
X-Google-Smtp-Source: APXvYqx5fuMbVN4eFP8I0kf4+qr1rTvWMowzkUGRpvTBXI++wBokPVag5e6Ft5lSIiTP5hE8Hv/wOw==
X-Received: by 2002:a63:521f:: with SMTP id g31mr7328152pgb.254.1569400070354;
        Wed, 25 Sep 2019 01:27:50 -0700 (PDT)
Received: from localhost.localdomain ([49.206.9.88])
        by smtp.gmail.com with ESMTPSA id e10sm7789346pfh.77.2019.09.25.01.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2019 01:27:49 -0700 (PDT)
From:   Vandana BN <bnvandana@gmail.com>
To:     linux-media@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Cc:     hverkuil@xs4all.nl, Vandana BN <bnvandana@gmail.com>
Subject: [PATCH v7 0/2] vivid: Add metadata capture support
Date:   Wed, 25 Sep 2019 13:57:28 +0530
Message-Id: <20190925082730.15550-1-bnvandana@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <bbef8158-e603-7f80-308a-129d76c68a1b@xs4all.nl>
References: <bbef8158-e603-7f80-308a-129d76c68a1b@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This Patch series adds support for emulation of metadata capture in vivid
driver.
UVCH metadata format is supported as it is widely used in webcams.
https://hverkuil.home.xs4all.nl/spec/uapi/v4l/pixfmt-meta-uvc.html

Regards,
Vandana.

Hans Verkuil (1):
  vivid:  fixes for v4l2-compliance issues.

Vandana BN (1):
  vivid: Add metadata capture support

 drivers/media/platform/vivid/Makefile         |   2 +-
 drivers/media/platform/vivid/vivid-core.c     | 107 +++++++++-
 drivers/media/platform/vivid/vivid-core.h     |  14 ++
 drivers/media/platform/vivid/vivid-ctrls.c    |  64 ++++++
 .../media/platform/vivid/vivid-kthread-cap.c  |  52 ++++-
 drivers/media/platform/vivid/vivid-meta-cap.c | 201 ++++++++++++++++++
 drivers/media/platform/vivid/vivid-meta-cap.h |  29 +++
 drivers/media/platform/vivid/vivid-vid-cap.c  |   5 +-
 8 files changed, 462 insertions(+), 12 deletions(-)
 create mode 100644 drivers/media/platform/vivid/vivid-meta-cap.c
 create mode 100644 drivers/media/platform/vivid/vivid-meta-cap.h

-- 
2.17.1

