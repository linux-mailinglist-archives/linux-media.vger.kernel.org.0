Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6E1E77F12A
	for <lists+linux-media@lfdr.de>; Thu, 17 Aug 2023 09:27:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348452AbjHQH0d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Aug 2023 03:26:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbjHQH0D (ORCPT
        <rfc822;linux-media@vger.Kernel.org>);
        Thu, 17 Aug 2023 03:26:03 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C4A1BFB
        for <linux-media@vger.Kernel.org>; Thu, 17 Aug 2023 00:26:02 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d683c5f5736so4387578276.3
        for <linux-media@vger.Kernel.org>; Thu, 17 Aug 2023 00:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692257161; x=1692861961;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z42d69f6YIGMcnsYnj5xPGU0hi6rZ6NjGpWHa63fkeY=;
        b=vXwY2voKWK71AN7sQxKTJFpO9CCnX7iljdLgzZGrHlzU3bE7/8gEG+gvqj8LIGQ++C
         t7RfyRC3gU0I6HD2YfXOWmn73zwIBKwqTOPU7QJdJ+nUNCStkkLAU8x/XXf8FlVT/E94
         vFB+b18V8+G6Wa/HrhYFYJRKd2Y0/TeP0ZYIQf/w4yaoqXHT2Rfdwi5yQsS6FPlwJgkK
         R3+nDblSqPMXbaRtDwJVRoS7c+c+9biMJfTSjTb+oLit/kMSGNykYViI+IbYnO1cAaw7
         QrOb5Q8Q/+6EEQISRGBUY5kZM47GtE44TI1CADLsJG48sml7Gs6wcnQfunvOEsKrE+ew
         K5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692257161; x=1692861961;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z42d69f6YIGMcnsYnj5xPGU0hi6rZ6NjGpWHa63fkeY=;
        b=YrhRzCn2hJLcgvJRET+XGRzJ30MLCdYkTf+q42qDWtzr2T4p0v9gClREzLkZdsCjc9
         36dWS1WIptF843taab3dSnYYyglf00DamXwldAoZTI6cW91Px89/Dt7HqcDzPBSRzJsm
         FKcwJP/s6k+sLkRriQi0/67iwfUueeEWJzzjWTHHvslFWyZVUYX6WT9Hk0Aoio36AR2o
         pDZ3kjjImj6sYtnL5pncsRIng1aQqn0Jlj+71nqNK5V1jPse1kcVTe/nBhMDi6q9818t
         SifZXzmB3tic4N1skRWrJ9MMSKvgdeF0XojefShbMcUUeQpb8KxeJIPQtLdchnkljvxn
         6Scg==
X-Gm-Message-State: AOJu0YxPlP/XWM041NimEjG2KRxytfislM8rdA9akP7SGtY7vs7PfE60
        OQ5XFzrtySMnN+QHcxgjhcW+bbB/by27lckTG1i/rg69i4WQEB9axmoKmUiR9GnEQZsHP08Ep0x
        MOkAgwTOEkSxFyqIqRd9sdboWZ05ikNuFclpek1CVzrTrqnWSwE5pvJO41GGBHQqM8GO5
X-Google-Smtp-Source: AGHT+IFc//5H+1RW8WGoXgPDIyEGFT6subuv1rNDIEPvbBTYdYTG1dP/KDiuFTaBCrp3u9+jOHS38w8xsdA=
X-Received: from yunkec1.tok.corp.google.com ([2401:fa00:8f:203:cb5f:f997:f2a2:88c6])
 (user=yunkec job=sendgmr) by 2002:a05:6902:41:b0:d07:e80c:412e with SMTP id
 m1-20020a056902004100b00d07e80c412emr51682ybh.12.1692257161230; Thu, 17 Aug
 2023 00:26:01 -0700 (PDT)
Date:   Thu, 17 Aug 2023 16:25:34 +0900
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.694.ge786442a9b-goog
Message-ID: <20230817072537.2837504-1-yunkec@google.com>
Subject: [PATCH 0/2] Support V4L2_CTRL_TYPE_RECT and V4L2_CTRL_WHICH_MIN/MAX_VAL
From:   Yunke Cao <yunkec@google.com>
To:     linux-media@vger.Kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Yunke Cao <yunkec@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

This patchset adds basic support for V4L2_CTRL_TYPE_RECT
and V4L2_CTRL_WHICH_MIN/MAX_VAL in v4l2-ctl and v4l2-compliance.

The corresponding linux kernel patchset can be found at
https://lore.kernel.org/linux-media/20230817071750.2830271-1-yunkec@google.com/

Yunke Cao (2):
  v4l2-ctl: Support V4L2_CTRL_TYPE_RECT
  v4l2-utils: Support V4L2_CTRL_WHICH_MIN/MAX_VAL

 include/linux/videodev2.h                    |  5 ++++
 utils/common/v4l2-info.cpp                   |  1 +
 utils/v4l2-compliance/v4l2-test-controls.cpp | 29 ++++++++++++++++++++
 utils/v4l2-ctl/v4l2-ctl-common.cpp           | 15 ++++++++++
 4 files changed, 50 insertions(+)

-- 
2.41.0.694.ge786442a9b-goog

