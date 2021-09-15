Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4412440CDAD
	for <lists+linux-media@lfdr.de>; Wed, 15 Sep 2021 22:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbhIOUGt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 16:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231487AbhIOUGs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 16:06:48 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64413C061574
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 13:05:29 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id g21so7947077edw.4
        for <linux-media@vger.kernel.org>; Wed, 15 Sep 2021 13:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FMfDF8y2VYr8QlOzL882g0OKnSWvdcup8yqkf22NHiU=;
        b=DBlrZdqPhfgSzjImeRo8iS2LoidF5Upyg6ryhvcXuuENGLseiA9CTgE5S13nNBlZI3
         ODCYmMZVbbcqjXR0W4d7pKyx2OudzIuAR/pIly+5zSIBksCzvmqaIvE1S21x0iEbOgl2
         UBqwZvBFbUlAOvfO6xCbIBmp6SfnlmsOrhFLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FMfDF8y2VYr8QlOzL882g0OKnSWvdcup8yqkf22NHiU=;
        b=dSMjswxHWqdl8CNldJuNSB6yfxT3Pxi8f3ZK1mSARguFSSBRdY6UXk64x5ttWwOuS3
         K/e/0jl/wV7WXTRK0J6v7weudx9C+u5kg5GOzKHQgUCO3fpkmYOdelGK+RL9HxQwHWH4
         Kl2ohiI3tjhI30KJXPJDBPqrXKZIThWX+AlTNGNxEEVombAS6Kz6GwInQInTsu9nSXzu
         Y91nX7tvKs1pXml4NwWZAqEzY+3Smvv/4JnitQ1sUPHNYO6juEEwMA/bAQMNYIgqORhB
         9wEsc1j2zonJ89TbV/2CqM3BvtUOhjAwDN0XI6JFF1zUUJ5lgI2Bcw9ymkWYQ1/NZ5dz
         UxWA==
X-Gm-Message-State: AOAM531szIH4AW+4Tnti3Z8MZLfSdVhd4UkvI5tsXiJ1WLvJoE/pxrIi
        FvzI5NtI16VKNTDaC/clQKsdFQ==
X-Google-Smtp-Source: ABdhPJzDJI0zViH0rTKUGwDES0EDl64/rmYOifBwqxwsa6l3Wi0qHBB0LUCQwene1tiJX5QkR7D4Rg==
X-Received: by 2002:aa7:cad0:: with SMTP id l16mr1972238edt.16.1631736328082;
        Wed, 15 Sep 2021 13:05:28 -0700 (PDT)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id m17sm393336ejn.108.2021.09.15.13.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 13:05:27 -0700 (PDT)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hn.chen@sunplusit.com
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] uvcvideo: Fix hw timestamp in Sunplus modules
Date:   Wed, 15 Sep 2021 22:05:22 +0200
Message-Id: <20210915200525.448941-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a quirk to fix the hardware timestamping in Sunplus camera modules.

Ricardo Ribalda (3):
  media: uvc: Extend documentation of uvc_video_clock_decode()
  media: uvc: Allow quirking by entity guid
  media: uvc: Create UVC_QUIRK_IGNORE_EMPTY_TS quirk

 drivers/media/usb/uvc/uvc_driver.c | 36 ++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvc_video.c  | 11 +++++++++
 drivers/media/usb/uvc/uvcvideo.h   |  1 +
 3 files changed, 48 insertions(+)

-- 
2.33.0.309.g3052b89438-goog

