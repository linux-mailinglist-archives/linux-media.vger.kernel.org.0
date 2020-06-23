Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5100205038
	for <lists+linux-media@lfdr.de>; Tue, 23 Jun 2020 13:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732432AbgFWLNy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jun 2020 07:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732422AbgFWLNx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jun 2020 07:13:53 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B37D0C061573
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2020 04:13:53 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id z5so1244934pgb.6
        for <linux-media@vger.kernel.org>; Tue, 23 Jun 2020 04:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vs5XUJzvkJIHrDgSjdP9AEUpDRbS7dLc5yf3Nfubc+Y=;
        b=j2ZTnHDDOE5BxhGIPivq1oS3G4ugg6PEdsY9fUUkbHwtSMcJNgLDflV+OHz5meZQF3
         BFAQmwIt0G+lcbyEkwwmMNm7/vux7K+FZ0uRnQISZ09kjbCn/yV63vPhIS32uH8xizXK
         8ohVd/20zC1V22dGwN4iISXB7Kf3T+aPL4KEU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Vs5XUJzvkJIHrDgSjdP9AEUpDRbS7dLc5yf3Nfubc+Y=;
        b=CFlINoJNMiZ5apToL0y5jjWpzGAtPwfyxA1ZZXq4ksW061IlUbsJX80YB36L1Nt2/r
         ceUj20SBMkSZH/N0GYq+GyhAXc4yvRlQ+E81KysChUQ0jGFAMrCAWbmh5s7Ag0mLaDrF
         EhxsgYrQaU5rCygSIVp4iCsNkxMuNcprJQlyrhqkW268Dc7hYYTFZq7cHi6mrrD/xI62
         5Oybnv+1wzWwCQaOOiPy+in31IDZtNaGTLynCsoN2cUEmbet3HlYTBErJXfo9uYFEgJY
         4O5mdeckSlARLGNsUHx1i0Ul0VD8I7nrquEue7atHLwM0QzC9XlBSksAxn4daqUu/30s
         iUPg==
X-Gm-Message-State: AOAM533LCc9ufQWfLC/3AxF4ASG6BRm+17CEZdYjeji6/rkhzAvmPCtT
        mWcPkqJKThmwlH+oMKxRpyMeXw==
X-Google-Smtp-Source: ABdhPJyjuzFWyFsqcggGTQa+mnGCYe+I+9HBzTLFe/W0YPKMzkC56ZajA1SosfEXeuZpU6IhBH9fag==
X-Received: by 2002:a63:2a8a:: with SMTP id q132mr16268818pgq.279.1592910829274;
        Tue, 23 Jun 2020 04:13:49 -0700 (PDT)
Received: from keiichiw1.tok.corp.google.com ([2401:fa00:8f:203:863a:e217:a16c:53f2])
        by smtp.gmail.com with ESMTPSA id i22sm16816053pfo.92.2020.06.23.04.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 04:13:48 -0700 (PDT)
From:   Keiichi Watanabe <keiichiw@chromium.org>
To:     virtio-dev@lists.oasis-open.org
Cc:     linux-media@vger.kernel.org, acourbot@chromium.org,
        alexlau@chromium.org, daniel@ffwll.ch, dgreid@chromium.org,
        dstaessens@chromium.org, dmitry.sepp@opensynergy.com,
        egranata@google.com, fziglio@redhat.com, hverkuil@xs4all.nl,
        keiichiw@chromium.org, kraxel@redhat.com, marcheu@chromium.org,
        posciak@chromium.org, spice-devel@lists.freedesktop.org,
        stevensd@chromium.org, tfiga@chromium.org, uril@redhat.com,
        samiullah.khawaja@opensynergy.com, kiran.pawar@opensynergy.com,
        saket.sinha89@gmail.com, laurent.pinchart@ideasonboard.com,
        nicolas@ndufresne.ca, mst@redhat.com
Subject: [PATCH RFC v4 0/1] Virtio Video Device Specification
Date:   Tue, 23 Jun 2020 20:13:24 +0900
Message-Id: <20200623111325.237158-1-keiichiw@chromium.org>
X-Mailer: git-send-email 2.27.0.111.gc72c7da667-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is the v4 RFC of virtio video device specification.
PDF versions are available at [1, 2].

Note that this patch depends on a recent patchset "Cross-device resource
sharing" [3].

Here is a list of major changes from v3:
* Redesingned struct definitions for each command and request based on
  discussions at [4].
* Renamed commands/structs/enums to more descriptive names.
* Had different structs and fields for image formats and bitstream formats.
* Added more detailed specification for supported video codecs.
* Made stream_id be allocated by the device.
* Had a single parameter struct per-stream instead of per-queue parameters and
  controls.
* Allowed the driver to specify the number of buffers to use via
  "cur_{image,bitstream}_buffers".
* Renamed RESOURCE_CREATE command to RESOURCE_ATTACH command and allow the
  driver to use this command when replacing backing memories as well.

[5] is the diff of the header file from v3. Note that it only contains changes
in the header. We haven't updated the driver nor device implementation to focus
on protocol design discussion first.

While it may appear that many parts have been changed since the previous
revision, these changes are to address the issues raised in previous discussions
or/and to make the protocol simpler and easier to prevent misuse.
I'd appreciate any types of feedback.

Best regards,
Keiichi

[1] (full): https://drive.google.com/file/d/1DiOJZfUJ5wvFtnNFQicxt0zkp4Ob1o9C/view?usp=sharing
[2] (only video section): https://drive.google.com/file/d/188uAkIWE0BsXETECez98y5fJKw8rslj3/view?usp=sharing
[3] https://lists.oasis-open.org/archives/virtio-comment/202003/msg00035.html
[4] https://markmail.org/thread/c6h3e3zn647qli3w
[5] https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2164411

Keiichi Watanabe (1):
  virtio-video: Add virtio video device specification

 .gitignore                        |    1 +
 content.tex                       |    1 +
 images/video-buffer-lifecycle.dot |   18 +
 make-setup-generated.sh           |    8 +
 virtio-video.tex                  | 1163 +++++++++++++++++++++++++++++
 5 files changed, 1191 insertions(+)
 create mode 100644 .gitignore
 create mode 100644 images/video-buffer-lifecycle.dot
 create mode 100644 virtio-video.tex

--
2.27.0.111.gc72c7da667-goog
