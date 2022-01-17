Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE36149103E
	for <lists+linux-media@lfdr.de>; Mon, 17 Jan 2022 19:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242555AbiAQS1G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jan 2022 13:27:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242520AbiAQS1E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jan 2022 13:27:04 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468AAC06161C
        for <linux-media@vger.kernel.org>; Mon, 17 Jan 2022 10:27:03 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id c71so69218038edf.6
        for <linux-media@vger.kernel.org>; Mon, 17 Jan 2022 10:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b9HA3D5cyg5bWD4oDuWcsu/JI+Ptg0MH6REy+Ohif9Y=;
        b=Il4OMKbfGUBg+KEZ8BqjoIiJr683lIB6ibS0Pu4uvQCReg90DgRUeFmHtzHAo2NQiP
         lDB0uJTMU3jrxRp+HJHjxbnVumispoBOCBdDFTJJd1tGtJbFGA9MlF1ByHhhUwgigm07
         uo7WSc88WAwHTkClkWZZtaKWFcTwWuZrZj9cM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=b9HA3D5cyg5bWD4oDuWcsu/JI+Ptg0MH6REy+Ohif9Y=;
        b=v+bGLDqMbPz/Rv5QVvcBNCHnSKpkBvIr8jZNyLq8ZzN4q1K1fbc5DXtfRVHx725EFt
         b6bTHxbHXfMFS+nysIWoHzERpompdps/Sj63Y8Gq83OilL5wt/klcT3NPLxF+bzKYFR9
         Sm/rgc41ew0P85GThFkOKvjlhOGcBAXSXB4JZIiX3FipAyYFnpmt0FMnJBVEhTZs0Fta
         3DUxlaESzZfM/Agy7yyRhpS7E61M1UucWN7WUKlQCF2qo8hzP04ldpuQgrenSwR4tZMr
         45v3K5kvxAt8PzB69U90IgR1pVJBhQvOOIHeOZge/8awaJoRAQgcASeHRGtg77Mn2jFp
         IRXw==
X-Gm-Message-State: AOAM531vGeWa0p7M21oaOFwPtmENJ8ztM60l4UnxQLYtjbkHU6SyuJv/
        NhCqo2zU9JHJACViyb0Eg2c/dg==
X-Google-Smtp-Source: ABdhPJygt0WIpchrr1rvDqfltJQ+Blld3kZPdfWt/rTvDRLMTtskJ+nGQlmZOemOQn02z6VguxaraA==
X-Received: by 2002:a17:907:72cb:: with SMTP id du11mr3863542ejc.703.1642444021819;
        Mon, 17 Jan 2022 10:27:01 -0800 (PST)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id la10sm4657462ejc.22.2022.01.17.10.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 10:27:01 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/3] Add Meta: to Metadata devices
Date:   Mon, 17 Jan 2022 19:26:55 +0100
Message-Id: <20220117182658.468993-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Metadata devices usually companion "real" devices. In order to
distinguish them properly, add the Meta: prefix to their names.

Also, add a unique suffix to all the uvc devices, to multisensor cameras
do not show the same names for all their devices (IR, RBG....).

v3:

- Add the meta logic to the core


v2: uvc: Restore old vdev name

Ricardo Ribalda (3):
  media: v4l2-dev.c: Add Meta: to the name of metadata devices
  media: Documentation/driver-api: Document device name
  media: uvcvideo: Add a unique suffix to camera names

 Documentation/driver-api/media/v4l2-dev.rst | 4 +++-
 drivers/media/usb/uvc/uvc_driver.c          | 3 ++-
 drivers/media/v4l2-core/v4l2-dev.c          | 9 +++++++++
 3 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.34.1.703.g22d0c6ccf7-goog

