Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44E071B721
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2019 15:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730176AbfEMNgo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 May 2019 09:36:44 -0400
Received: from mail-lj1-f179.google.com ([209.85.208.179]:35328 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730163AbfEMNgo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 May 2019 09:36:44 -0400
Received: by mail-lj1-f179.google.com with SMTP id m20so10996132lji.2
        for <linux-media@vger.kernel.org>; Mon, 13 May 2019 06:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=BVuWkuJRVxxBIu+ROjURPBDTNuVZik0FjGVxnRhR3Fo=;
        b=pNEAZa2n+1by6rv0kfBb0m7KhKF+6xoBXtCx9C0mmvaqujWd6MZZi0o36ay7YTdkWp
         8z86r1jT/LfzQIjBnQJN0l5Wf2L5NYhU3ttANXatmwejt9e0/J+2ZayeLJhvxbYbR/qL
         54kl55YfLO5Rxm+poLpWtBGc+ukQL8op2geRWUt4LXfLXQHemAL9NCKnG9F7qfNYc4xI
         A5UXN3rnNkJ9E9XwGd2kPbvZluKDsOpVN7MtlJGmxQmzmFv4b9L8kcp5fFaZj+HIlCgz
         pKK3VwIHBBxxYWCrkvZkkPcjqUoaeVHghXfPBmvAjdVxXlIZYPm3Id/lLKYVX2SVqG7W
         0quw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=BVuWkuJRVxxBIu+ROjURPBDTNuVZik0FjGVxnRhR3Fo=;
        b=Qsf5aq8rXDpHIPYufKtxDsrjoIpPfkElC4dDGkaHjawLZncBpXtLYLFfK/VnJEtEFD
         WsSPQb7N5ExhWwxLJpx+PJmqsdkhHyWjVxpU9MjQApB7ocJCU0tX4AdnEEFYYt5Jp1WU
         KrXyj6dyaCBszW8hZH/yb/hCO0MZtjhzV0gIVb25NZmJMNP8wGuK7EmyT+cGgsmZu3Ws
         CwSZe1wHYYa+nacA8bFxoqVo4S96BNJPzZB6qBWx2QdVLo8Cx8PNfsvtAiDpCYMpinCQ
         ML58A3nI0hdrMjM/XcItF17aY1k6HscTqKcFBHbNjNBV4MjlBjGLGypuLzVxQ4LQmoOk
         YU6Q==
X-Gm-Message-State: APjAAAWSxvmUrHunI/k81W2I/E32aE3RxaJj7nAdjMJO3jGHInVlyjoH
        Njg7Fv3aaCvl+Mr/qcHBgfEfY38LcvkYaaYOZbBTaRrxp6g=
X-Google-Smtp-Source: APXvYqx7iTUsSvL5YabfOzpyGgOw20Uj8cIiAbrrP5h7eMuZqf3wPBCBM70VFVRO5aRXQX7yd2mwGbJaTAS2Qmv1Q3g=
X-Received: by 2002:a2e:8796:: with SMTP id n22mr1561551lji.75.1557754602218;
 Mon, 13 May 2019 06:36:42 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 13 May 2019 19:06:31 +0530
Message-ID: <CA+G9fYv+M_8p99c6i=akmuhHSCW6MdF-29CPKrwDsd2EW_LsbQ@mail.gmail.com>
Subject: Format ioctls (Input 1) test Cropping failed: 4.19, 4.14, 4.9 and 4.4
To:     linux-media@vger.kernel.org
Cc:     open list <linux-kernel@vger.kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        paul.kocialkowski@bootlin.com, ezequiel@collabora.com,
        treding@nvidia.com, niklas.soderlund+renesas@ragnatech.se,
        sakari.ailus@linux.intel.com,
        Hans Verkuil <hans.verkuil@cisco.com>, mchehab@kernel.org,
        lkft-triage@lists.linaro.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Format ioctls (Input 1) test Cropping failed on all devices running
4.19, 4.14, 4.9 and 4.4 kernel branches.

Format ioctls (Input 1):

...
test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
fail: ../../../v4l-utils-1.16.0/utils/v4l2-compliance/v4l2-test-formats.cpp(1425):
doioctl(node, VIDIOC_CROPCAP, &cap)
fail: ../../../v4l-utils-1.16.0/utils/v4l2-compliance/v4l2-test-formats.cpp(1447):
testLegacyCrop(node)
test Cropping: FAIL

Test passes on mainline, -next and 5.0
Test failed on 4.19, 4.14, 4.9 and 4.4 for all devices

steps to reproduce:

       # boot 4.19/4.14/4.9 kernel on x86_64 / Juno / hikey /  device
       #  install v4l-utils package
       # modprobe vivid.ko no_error_inj=1
       # v4l2-compliance -v -d /dev/video0

Test results comparison on all branches,
https://qa-reports.linaro.org/_/comparetest/?project=22&project=6&project=58&project=135&project=40&project=23&project=159&suite=v4l2-compliance&test=Cropping

Test output log,
https://lkft.validation.linaro.org/scheduler/job/708755#L2236

Best regards
Naresh Kamboju
