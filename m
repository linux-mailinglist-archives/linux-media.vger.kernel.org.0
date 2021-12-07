Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E0446AF40
	for <lists+linux-media@lfdr.de>; Tue,  7 Dec 2021 01:39:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378541AbhLGAmS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Dec 2021 19:42:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378510AbhLGAmO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Dec 2021 19:42:14 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C2C8C0613F8
        for <linux-media@vger.kernel.org>; Mon,  6 Dec 2021 16:38:45 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id t5so50035926edd.0
        for <linux-media@vger.kernel.org>; Mon, 06 Dec 2021 16:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rZ8QpBf2biMuMXCRBVugY0vgtYK9Kkf5AKuFBkLz2xg=;
        b=gRII6l4QN0/96xlw9ErXrJx41GPd606dLDQ+m/IfVmIUafTixM/1M25JswAx0/sQbe
         /QPyuSHY66/CR9npP1/SFupTrhBCLBUaSK+qpEkDIv43ILfdghnPr6IUtr+Jr9OrFZ32
         IhStwMKc4XxBGGaWNGlSTY6Tevql1sKXo+n0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rZ8QpBf2biMuMXCRBVugY0vgtYK9Kkf5AKuFBkLz2xg=;
        b=f+XnEhtYGN4J/hSYb3fucxMLSPUp2jxLYKpByaqzZKeK7DuG095ftbsGaXdT7JxTPN
         SO3RgTTcgifcRNH/ED4okvOkH3UtrlJIo/5BOrZ1ETvwl4n5pbGsm7FBjKVQ9VR3vU3N
         1HXZAqgBjvodf7M7u4YP041yY9SfcN9WkiIOUxSEk2jKpC4ZN4n+gvOsBKvBw4SNfAHe
         umEFdxg5yDqIbGtkgXo4aJ5GNq0/EQetDR9T2FgCcZFRXr5x9H/+CZEGHm56jppbyYxl
         CrvBP8xmYbleD0J+p465/FAvjL7DDGQp8Om+L5EwkZ3kXBZrWXRulPGOAgVzWw6ov47W
         6fVQ==
X-Gm-Message-State: AOAM5312UBMlJ9rJFuOOdncLx1TmTuqknBh8dTf+grgmcUfjQ3QIq56S
        jQDTbS2tBDkwDdYlDBVxZjXuSA==
X-Google-Smtp-Source: ABdhPJyNVJOvCTsZ9sTSjk94cgl5lWeuMmWOPI9/I9Ela6IO+fjOLU9XaeE+Kae/boRfckP+eUdd8w==
X-Received: by 2002:a50:d49d:: with SMTP id s29mr3757515edi.55.1638837523688;
        Mon, 06 Dec 2021 16:38:43 -0800 (PST)
Received: from alco.lan (80.71.134.83.ipv4.parknet.dk. [80.71.134.83])
        by smtp.gmail.com with ESMTPSA id hg19sm7422531ejc.1.2021.12.06.16.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 16:38:43 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 3/4] media: Documentation/driver-api: Document entity name
Date:   Tue,  7 Dec 2021 01:38:39 +0100
Message-Id: <20211207003840.1212374-4-ribalda@chromium.org>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
In-Reply-To: <20211207003840.1212374-1-ribalda@chromium.org>
References: <20211207003840.1212374-1-ribalda@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Now the entity name can be configured by the driver to a value different
than vdev->name. Document it accordingly.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/driver-api/media/v4l2-dev.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/driver-api/media/v4l2-dev.rst b/Documentation/driver-api/media/v4l2-dev.rst
index 99e3b5fa7444..22120b60b0a9 100644
--- a/Documentation/driver-api/media/v4l2-dev.rst
+++ b/Documentation/driver-api/media/v4l2-dev.rst
@@ -134,6 +134,10 @@ manually set the struct media_entity type and name fields.
 A reference to the entity will be automatically acquired/released when the
 video device is opened/closed.
 
+The entity name can be configured by setting the `vdev->entity.name` pointer
+to the desired value. If it is set to NULL, the entity will be named as the
+video device.
+
 ioctls and locking
 ------------------
 
-- 
2.34.1.400.ga245620fadb-goog

