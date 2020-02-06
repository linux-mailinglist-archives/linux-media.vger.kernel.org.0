Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA6731541C4
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 11:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728279AbgBFKVY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 05:21:24 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:41034 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728263AbgBFKVY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 05:21:24 -0500
Received: by mail-pf1-f196.google.com with SMTP id j9so2894331pfa.8
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2020 02:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=285hGBeyDEuWuK9GHboTvoJ1nNlVTOiPiFz7p6gTZeA=;
        b=IRl6ADxEeaZcVHXBlmaucyLsfDiAsQttS9Aqmb3Aso5XIP9d9q5Aseia8xYcrYSYW8
         BU9m26hP2MM1p+/TqGNNS12aJ+CvdrHetPbo1LXceBgX3iS26BPyIEGwBqSnrQmK3s+7
         nnu+Mk1jFxdbJN1PeVWXtHCr9bJ2r8U0Mytk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=285hGBeyDEuWuK9GHboTvoJ1nNlVTOiPiFz7p6gTZeA=;
        b=e4jRsvBVuYzS+DELxk6VZOzlGcGWpSPCMhhEpUG1+BmYaLLJUZtM3bM5SFY5+sKYut
         BMdFmae6WtkXJEtTZfyfTl5+dlKmdJOYSmL88UNCTPyUTkVXrSY/aj/pdAL3OZsZgNwp
         sLlxa2b68ImBGR3Ega5EaLAMzCE8YUhZaGDSoI6mvmUKdxOM8i6I7OEpJwag05L6uJPQ
         p8yS7oZxO3OhckKJOaSm3RVL4qzXXMHRj/FU498+F8x7YebA4aH+A8VFMtF4DpU/zOf4
         +UBR/zfX+J3DiSKlGgjBiY8qOY6KpugI7TYzMDKmAls2jOOAmQHwr9hx/xb3RA86+5qT
         aZQg==
X-Gm-Message-State: APjAAAUphX5iVEbjj95idk9mrVAzgM7/mNn8CQ5jAXSHDJjJe2oEZCun
        SSgDWxl3YSlF2lyFVN024TfRXg==
X-Google-Smtp-Source: APXvYqwioWvoPL68xYIS9mGhV815DwhJrP/awpaRlx+n3TRUM43A/CgAVvfggHPktEvIamFzeA/7Hw==
X-Received: by 2002:a62:2b8a:: with SMTP id r132mr2895675pfr.56.1580984479973;
        Thu, 06 Feb 2020 02:21:19 -0800 (PST)
Received: from keiichiw1.tok.corp.google.com ([2401:fa00:8f:203:863a:e217:a16c:53f2])
        by smtp.gmail.com with ESMTPSA id v4sm2590270pff.174.2020.02.06.02.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 02:21:19 -0800 (PST)
From:   Keiichi Watanabe <keiichiw@chromium.org>
To:     virtio-dev@lists.oasis-open.org
Cc:     linux-media@vger.kernel.org, acourbot@chromium.org,
        alexlau@chromium.org, daniel@ffwll.ch, dgreid@chromium.org,
        dstaessens@chromium.org, dmitry.sepp@opensynergy.com,
        egranata@google.com, fziglio@redhat.com, hverkuil@xs4all.nl,
        keiichiw@chromium.org, kraxel@redhat.com, marcheu@chromium.org,
        posciak@chromium.org, spice-devel@lists.freedesktop.org,
        stevensd@chromium.org, tfiga@chromium.org, uril@redhat.com,
        samiullah.khawaja@opensynergy.com, kiran.pawar@opensynergy.com
Subject: [PATCH v3 0/2] Virtio video device specification
Date:   Thu,  6 Feb 2020 19:20:56 +0900
Message-Id: <20200206102058.247258-1-keiichiw@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
Here is the 3rd version of virtio-video patches.

This patch set consists of two changes.
The first patch adds the virtio-video protocol. This is an updated version of v2 patch [1].
The second patch adds a new feature to use exported objects from different virtio devices, which are proposed in [2], as video buffers.

PDFs are avaliable below:
* full version [3]
* only virtio-video section (first patch) [4]
* only virtio-video section (first+second patch) [5]

Best regards,
Keiichi

[1] https://markmail.org/thread/yb25fim2dqfuktgf
[2] https://markmail.org/message/2p5zgfanuv3fgwcu
[3] https://drive.google.com/file/d/1Kl3M6weAm0vV1kj9A5dq2yypLXe_6TS2/view?usp=sharing
[4] https://drive.google.com/file/d/1fN_6lft3RPuFKOnBm6P6XCy3fF7wwnu5/view?usp=sharing
[5] https://drive.google.com/file/d/1jOsS2WdVhL4PpcWLO8Zukq5J0fXDiWn-/view?usp=sharing

Changes v2 -> v3:
* Rename controlq -> commandq.
* Add {QUERY,GET,SET}_CONTROL for bitrate, profile and level.
* Update the definition of virtio_video_format_desc.
  - Remove fields for profiles and levels.
  - Define fields for memory layouts.
  - Stop using FOURCC and define enum virtio_video_format.
* Add a feature flag for non-contiguous memories.
* Add a new section for buffer lifecycle.
* Change RESOURCE_DESTROY to RESOURCE_DESTROY_ALL.
* Add fields in virtio_video_config.
* Remove constants like *_UNDEFINED or *_UNSPEC.
* Rename some constants and structs.
* Change structures and orders of subsections and paragraphs.
* Add more detailed description for each command.
* Address review comments.
* Add a feature for exported objects as a separate patch.

Dmitry Sepp (1):
  virtio-video: Add virtio video device specification

Keiichi Watanabe (1):
  virtio-video: Define a feature for exported objects from different
    virtio devices

 .gitignore                        |    1 +
 content.tex                       |    1 +
 images/video-buffer-lifecycle.dot |   18 +
 make-setup-generated.sh           |    8 +
 virtio-video.tex                  | 1030 +++++++++++++++++++++++++++++
 5 files changed, 1058 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 images/video-buffer-lifecycle.dot
 create mode 100644 virtio-video.tex

--
2.25.0.341.g760bfbb309-goog
