Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8055E124782
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2019 14:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbfLRNCb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Dec 2019 08:02:31 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:37976 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbfLRNCb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Dec 2019 08:02:31 -0500
Received: by mail-pj1-f68.google.com with SMTP id l35so852648pje.3
        for <linux-media@vger.kernel.org>; Wed, 18 Dec 2019 05:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JzaO5WtpgwLAmsU8nrkRKlactThbvdf9yWb4bZzd9rc=;
        b=ggip1Gf2w1baqbQS4dPCE3q1Xqo5Q4689csRCQMDxOI/vijCYIMp1Oox6ul3Sdm0VW
         u60YB4kuZTNnacJzX1EC9oyKYFrpOtlrmzmsHYKJxUJ4WQuLRE9gUQ63sYI9VmpjxbTV
         hqDcX5XhL/8sUIHdsgee0el4UyNHZ3B+aT6FY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JzaO5WtpgwLAmsU8nrkRKlactThbvdf9yWb4bZzd9rc=;
        b=tDy6YQ7RCWaCs5QTtG12Dv9O6XNL12aDY3BY00fHxEWBLjCkobE3NpK5mVKfIylKba
         GcXHSK/olCwR7H+J/jBtFhlrsOmyhDNHyjd9jL6CBiBKijZK194nDUoHCt/8yu5mD2XA
         I1jVepsxDnsM/pEKBlBu5FTUvBPktkSd6a9ojuF8VDIebzeHUQ2ZWE4VR5v2S5/+63cQ
         b/acBlf3U9SBCkGfnvcoSS0MBqAxmmr0yBnPmjo4qjvCCjBfjK80vUnZQmH6Vk+FQv+k
         CJ4bKgMn3Nz+oEHJ9WniHqAmp7IhThcKpMPNbsxb203P+CXUGx3AU/rgP0Dgdnu8C8ot
         FTjA==
X-Gm-Message-State: APjAAAVYHEafWiDTgBgLhabLRC8YmoVZ+uhlLGn2x/rT0UuBBEPQi6o8
        nn4hjbssJ7sa4QFTLsDw84VnAg==
X-Google-Smtp-Source: APXvYqwKenAGbhdh9Zb7DJKpUcOwRRwak1iLnbY4ofgN7GrJutJu2vCrM7ulrIUbIN6KNrYkDJhGOw==
X-Received: by 2002:a17:902:9a8e:: with SMTP id w14mr2482069plp.315.1576674150416;
        Wed, 18 Dec 2019 05:02:30 -0800 (PST)
Received: from keiichiw1.tok.corp.google.com ([2401:fa00:8f:203:863a:e217:a16c:53f2])
        by smtp.gmail.com with ESMTPSA id p17sm3283796pfn.31.2019.12.18.05.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 05:02:29 -0800 (PST)
From:   Keiichi Watanabe <keiichiw@chromium.org>
To:     virtio-dev@lists.oasis-open.org
Cc:     linux-media@vger.kernel.org, acourbot@chromium.org,
        alexlau@chromium.org, daniel@ffwll.ch, dgreid@chromium.org,
        dmitry.sepp@opensynergy.com, egranata@google.com,
        fziglio@redhat.com, hverkuil@xs4all.nl, keiichiw@chromium.org,
        kraxel@redhat.com, marcheu@chromium.org, posciak@chromium.org,
        spice-devel@lists.freedesktop.org, stevensd@chromium.org,
        tfiga@chromium.org, uril@redhat.com
Subject: [PATCH v2 0/1] VirtIO video device specification
Date:   Wed, 18 Dec 2019 22:02:13 +0900
Message-Id: <20191218130214.170703-1-keiichiw@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,
This is the 2nd version of virtio-video patch. The PDF is available in [1].
The first version was sent at [2].

Any feedback would be appreciated. Thank you.

Best,
Keiichi

[1]: https://drive.google.com/drive/folders/1eT5fEckBoor2iHZR4f4GLxYzFMVapOFx?usp=sharing
[2]: https://markmail.org/message/gc6h25acct22niut

Change log:

v2:
* Removed functionalities except encoding and decoding.
* Splited encoder and decoder into different devices that use the same protocol.
* Replaced GET_FUNCS with GET_CAPABILITY.
* Updated structs for capabilities.
  - Defined new structs and enums such as image formats, profiles, range (min,
  max, step), etc
    * For virtio_video_pixel_format, chose a naming convention that is used
      in DRM. We removed XBGR, NV21 and I422, as they are not used in the
      current draft implementation. https://lwn.net/Articles/806416/
  - Removed virtio_video_control, whose usage was not documented yet and which
    is not necessary for the simplest decoding scenario.
  - Removed virtio_video_desc, as it is no longer needed.
* Updated struct virtio_video_config for changes around capabilities.
* Added a way to represent supported combinations of formats.
  - A field "mask" in virtio_video_format_desc plays this role.
* Removed VIRTIO_VIDEO_T_STREAM_{START,STOP} because they don't play any meaningful roles.
* Removed VIRTIO_VIDEO_T_STREAM_{ATTACH, DETACH}_BACKING and merged them into RESOURCE_{CREATE, DESTROY}.
* Added a way to notify/specify resource creation method.
  - Added a feature flag.
  - Defined enum virtio_video_mem_type.
  - Added new fields in video_stream_create.
* Modified fields in virtio_video_params.
  - Added crop information.
* Removed enum virtio_video_channel_type because we can get this information by image format.
* Renamed virtio_video_pin to virtio_video_buf_type.
  - It's similar to V4L2_BUF_TYPE_VIDEO_{OUTPUT, CAPTURE}.
* Added an error event.
* Reordered some subsections.
* Changed styles to make it consistent with other devices.

Dmitry Sepp (1):
  virtio-video: Add virtio video device specification

 content.tex      |   1 +
 virtio-video.tex | 579 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 580 insertions(+)
 create mode 100644 virtio-video.tex

--
2.24.1.735.g03f4e72817-goog
