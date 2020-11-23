Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6322C191F
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 00:15:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388131AbgKWXDT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 18:03:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388123AbgKWXDT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 18:03:19 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E014C061A4E
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 15:03:19 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id 10so878672wml.2
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2020 15:03:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=iQ5bInMQHEd3mry/pnJUmeAGZvhgJKRP74BEVfnU10U=;
        b=OiNTiGSS5/LF9CfoR+WnFhenvR/4NniWfWQwswHpPxLxZUsQ0a+wRzk+uXc7J5dhHv
         miy02vvzYop//5DKzFtHgqUXk1zfIDc0LZLyv6V8ftwzeFeWn+Fj12381zIe8g+Uku/X
         V28evtG18FULftcR7O6FsssAaIf1OCBAd34IqsH3CnDcKV2smLRYfJThbE6esY/m0xvz
         94ODSao14NPUcPJlq4sz39B3Td6i0OeeGqiVZ678J2FbXooJ0w46zMWXadEVCdxc9Kut
         nfih8ajhVVBc9ebXJLNxTa5kr4xvjO/b+DGEsTVWklds95K4Z/XjD6lZlrMx8HSqR45j
         8caQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=iQ5bInMQHEd3mry/pnJUmeAGZvhgJKRP74BEVfnU10U=;
        b=OUYof2BwD9zoa+pq4VaZ724v0BrAytLOhhmtARupVzPqX1bW350EPLBEqTqRp7COp5
         bDUUbuU7MCXen8IISt9qaXq0GkEfBdv3ui3HLgVV0ZXtGC1ywQiglfdJqWpUMk/UL6Tx
         THxPJrPSHy++txGDVAR/muDRPvyJpA2M2e8RJ1bS+SjoVcxeH9o1JF6LKY1Hl0xrYcnH
         OzY9dgLmHb3AexydddinHndBa+e1OlxX7EH6qiv2V/tdL1Jh9UfuRohJUAdXxEAMmZ3I
         bOd7NgjOsLYL7aV2S5xexHgI0Lru8BOd6OtUN352YYf2rShiH0XU9dV4MxJPCwpZWEyh
         0Fbw==
X-Gm-Message-State: AOAM533Kb+yjYiv99EIzlZFiFW6Yxb1S2ZyDaFfB7UJhMBY5BojuXCEL
        UvIR9VfP74KnOk49bAeJP38F6v6uw/dwRK2i
X-Google-Smtp-Source: ABdhPJyA0nf7pxUIMJ28zOQAgOgSLORmK9/qdRewiPJ94F284kqUl1gm7GQIPWuJXSwKKzwLh9f0Ng==
X-Received: by 2002:a1c:a986:: with SMTP id s128mr1158308wme.94.1606172597529;
        Mon, 23 Nov 2020 15:03:17 -0800 (PST)
Received: from localhost.localdomain (hst-221-74.medicom.bg. [84.238.221.74])
        by smtp.gmail.com with ESMTPSA id q66sm1501463wme.6.2020.11.23.15.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 15:03:16 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 0/3] HDR10 static metadata
Date:   Tue, 24 Nov 2020 01:02:54 +0200
Message-Id: <20201123230257.31690-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

Changes since v1:
 * moved the controls in hdr10-ctrls.h header.
 * the structure fields documentation clearer.
 * fixed some typos.

Some thoughts, because these two CLL and Mastering Display controls
are borrowed from SEI messages we can introduce sei-ctrls.h instead
of hdr10-ctrls.h. What you think?

Comments are welcome!

regards,
Stan

Stanimir Varbanov (3):
  v4l: Add HDR10 static metadata controls
  docs: media: Document CLL and Mastering display
  venus: venc: Add support for CLL and Mastering display controls

 .../media/v4l/ext-ctrls-codec.rst             | 71 +++++++++++++++++++
 drivers/media/platform/qcom/venus/core.h      |  3 +
 drivers/media/platform/qcom/venus/hfi_cmds.c  |  8 +++
 .../media/platform/qcom/venus/hfi_helper.h    | 20 ++++++
 drivers/media/platform/qcom/venus/venc.c      | 29 ++++++++
 .../media/platform/qcom/venus/venc_ctrls.c    | 16 ++++-
 drivers/media/v4l2-core/v4l2-ctrls.c          | 62 ++++++++++++++++
 include/media/hdr10-ctrls.h                   | 55 ++++++++++++++
 include/media/v4l2-ctrls.h                    |  3 +
 9 files changed, 266 insertions(+), 1 deletion(-)
 create mode 100644 include/media/hdr10-ctrls.h

-- 
2.17.1

