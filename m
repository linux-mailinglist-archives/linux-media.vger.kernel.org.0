Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2257618AA97
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2020 03:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgCSCSh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 22:18:37 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:39898 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbgCSCSg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 22:18:36 -0400
Received: by mail-pl1-f196.google.com with SMTP id m1so348274pll.6
        for <linux-media@vger.kernel.org>; Wed, 18 Mar 2020 19:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6bBz5V/WtkwwqhyJmsiCB2xh086GQ/HDrZAoGycCDqY=;
        b=FyBQtPsq8bx5OCsSO0dGRPlcZN4yQ4dilDnc0G/EjPeWrM+7Z9NNLmLnKUTTpEgpOW
         fotqM6GXOjifswMfDoV4MXousDAWQo2iZFgpf7jXcx8OEy8uSQ1pzPHzCqDztZHpAR1a
         ZJkUESD3QWhQ6MTVbTdcaYamhKJnqPErNPakQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6bBz5V/WtkwwqhyJmsiCB2xh086GQ/HDrZAoGycCDqY=;
        b=fRjo8NZ1zhAhPy+zdQ3pyBB1YZu/TSuxCQg7ByKMVt5fFaVwY8q3RDaLB3oYhjF+U8
         uq4G9uEnW+Y1Un7D5xK/FWQ89WP80s2PtdSTo7n0ad4UdUNquMlZybTbdnFb8SQqMQ5e
         2Tt19XUZSsFkc8/uhHWOftIh45ER6QpruxXI5WSiufYJv8r2CZ5MZg0g522H0j+2W+WH
         fmaNWXROeS2Py6s6JhD6cirEudYQlC3JacMLu7xFeghqSN23pngvtaCb1qrqYrMLXqFP
         Sffy8Wjl0AmdmLo6NY5Q8IY1Tad3YHKHlK0VM+KJVZGk9ea7/YFqQKOj1IH5SnR6Rrxu
         y9MA==
X-Gm-Message-State: ANhLgQ3Zm9a8mJpwFSlHv7j4+MmPndiREs7GrQFQ7UkkjMfw+ilEOEJY
        oMgIznTsPL9Qa+0c93kfImkU3eeCRXg=
X-Google-Smtp-Source: ADFU+vu185Om/KiLaJ5I6R9LggSBMYF/vdJXMV0dPyaYDQ0gYr8yH5gFBEPHWK46VajxmqHXBz9gGA==
X-Received: by 2002:a17:90a:730b:: with SMTP id m11mr1305446pjk.195.1584584314128;
        Wed, 18 Mar 2020 19:18:34 -0700 (PDT)
Received: from localhost ([2401:fa00:8f:203:30f2:7a9c:387e:6c7])
        by smtp.gmail.com with ESMTPSA id d11sm305928pfo.39.2020.03.18.19.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2020 19:18:33 -0700 (PDT)
From:   David Stevens <stevensd@chromium.org>
To:     virtio-comment@lists.oasis-open.org
Cc:     Gerd Hoffmann <kraxel@redhat.com>,
        Dylan Reid <dgreid@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Zach Reizner <zachr@chromium.org>,
        Keiichi Watanabe <keiichiw@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Alex Lau <alexlau@chromium.org>,
        =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>,
        Pawel Osciak <posciak@chromium.org>,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        David Stevens <stevensd@chromium.org>
Subject: [PATCH v4 0/2] Cross-device resource sharing
Date:   Thu, 19 Mar 2020 11:18:21 +0900
Message-Id: <20200319021823.57219-1-stevensd@chromium.org>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

This is the next iteration of patches for adding support for sharing
resources between different virtio devices. The corresponding Linux
implementation is [1].

In addition to these patches, the most recent virtio-video patchset
includes a patch for importing objects into that device [2].

[1] https://markmail.org/thread/bfy6uk4q4v4cus7h
[2] https://markmail.org/message/wxdne5re7aaugbjg

Changes v3 -> v4:
 - Add virtio-gpu feature bit
 - Move virtio-gpu assign uuid command into 2d command group
 - Rename virtio-gpu uuid response

David Stevens (2):
  content: define what an exported object is
  virtio-gpu: add the ability to export resources

 content.tex      | 12 ++++++++++++
 introduction.tex |  4 ++++
 virtio-gpu.tex   | 29 +++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+)

-- 
2.25.1.481.gfbce0eb801-goog

