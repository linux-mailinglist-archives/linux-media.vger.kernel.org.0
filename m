Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4785946AF3B
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 01:38:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378505AbhLGAmO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Dec 2021 19:42:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357411AbhLGAmM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Dec 2021 19:42:12 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 502E8C0613F8
        for <linux-media@vger.kernel.org>; Mon,  6 Dec 2021 16:38:43 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id y12so49767143eda.12
        for <linux-media@vger.kernel.org>; Mon, 06 Dec 2021 16:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NXKIR4ShytX0tALgioiRUa/C0O1E2qZGhrAtM8+wVCU=;
        b=VmcRrIhZbEKMr6Uyl2IeEUz7d2vsgn86w1wsvjwb+gIRd2ld1Yby8+loXnmkNeotQz
         7Fj7s2AyudylTzYQ49DbsQubu6vTKOPDSHKxbOCocbqHevAeWaehK9HutsCMb/eatgna
         I3P3Ab6K3TMLqmBfq00eii2NsTm2/uMNCGaNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NXKIR4ShytX0tALgioiRUa/C0O1E2qZGhrAtM8+wVCU=;
        b=l/eASG3iFV/muuYcg3teaLdMV9oREowieN0MY/QmFlxSJLueuTVkC86mFgH+LQVDiA
         DJDBy+oq+8N/BSrDXMQ1fudHtF/B9oWj/RLz33SsogfFD3D9Wm1XFaNl/1HcgBqgInzh
         9AEZuyYIzFtibyzR8tGojkkqlKf3jeIEEZ3IgEGHhsDKz4qkhAo4ArSPnWPAhp+Ef+Jm
         X2rGM8xFazTQTled/1rJopFEGCzQM7H98ROvxqGtMaDoTU+XNVrDeCkI799WlhM1/av1
         weHZ8OsW5RWzlf26ujHver2z4el8p1uYCbSvMx5oriPfNHD10guJbymJQICOiJwVB8hL
         cLng==
X-Gm-Message-State: AOAM532A/fDKHbfEQHlJ8uoVKUC4MzJB9z0RS1d8N2aK1owuq7hJH2Vn
        J7H0U1wuWVK8kER/yHuSXxrwbg==
X-Google-Smtp-Source: ABdhPJz//31u0B873vqMLuqK/8zZqYenWGLqXSani8DfAMuVN6VDXAwU47iKA3ruvGE3bbpv6BxPSw==
X-Received: by 2002:a05:6402:348c:: with SMTP id v12mr3852752edc.170.1638837521896;
        Mon, 06 Dec 2021 16:38:41 -0800 (PST)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id hg19sm7422531ejc.1.2021.12.06.16.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 16:38:41 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/4] uvc: Restore old vdev name
Date:   Tue,  7 Dec 2021 01:38:36 +0100
Message-Id: <20211207003840.1212374-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to have unique entity names, we decided to change the name of
the video devices with their functionality.

This has resulted in some (all?) GUIs showing not useful names.

This patchset reverts the original patch and introduces a new one to
allow having different entity and vdev names.

Since some distros have ported the reverted patch to their stable
kernels, it would be great if we can get this sent asap, to avoid making
more people angry ;).

v2:
 - Add Documentation
 - Mark maybe unused variables as __maybe_unused
 - Add Suggested-by

Ricardo Ribalda (4):
  Revert "media: uvcvideo: Set unique vdev name based in type"
  media: v4l2-dev.c: Allow driver-defined entity names
  media: Documentation/driver-api: Document entity name
  media: uvcvideo: Set unique entity name based in type

 Documentation/driver-api/media/v4l2-dev.rst |  4 ++++
 drivers/media/usb/uvc/uvc_driver.c          | 14 +++++++++++---
 drivers/media/v4l2-core/v4l2-dev.c          |  4 +++-
 3 files changed, 18 insertions(+), 4 deletions(-)

-- 
2.34.1.400.ga245620fadb-goog

