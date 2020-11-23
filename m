Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B7D2C0EA4
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 16:20:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389453AbgKWPS4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 10:18:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389439AbgKWPSz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 10:18:55 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F8A2C0613CF;
        Mon, 23 Nov 2020 07:18:54 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id 34so14526332pgp.10;
        Mon, 23 Nov 2020 07:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NNasNs00AK0Yo+C2qGS7Dxw3i5eNX9nf2aLAmRKkISU=;
        b=tc0kLkDTnpKDWiA8VHLSPIZSIanxKRHplWD4XaAbfHi1rDZFWP9DPsTtXrgryxuwfz
         D1nP5lvY+k3aqkcNWCEy2PP3xiKoiRIPHJGXJJRw01JVvEJ5SWC7GeTT8DFClvYUtxBm
         616py4n7U2Tp3oC174b+rHBKciS3QBE6r4wfb6k7b7Jy8RMx1ojk3DwABjWzT9Rm9g3X
         5Yr5hXQaN5ZQsKtudwL45dJpWDalFR/xF6b8HId3U1KbdQMwz4hjuo/0IlBCf0X31l0t
         YhsnzYjsuwoituu855GGGhqD+d0mqwSKV25a9Uk1y0jeEfhx/5KMTpkkvZyCtth6RZ7P
         Pd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NNasNs00AK0Yo+C2qGS7Dxw3i5eNX9nf2aLAmRKkISU=;
        b=DX+gwA9az1VdDXoKIQktn942O7DDd9rAMEQu6uZjmDe8bJPSr+rTOSp8+PJxvG+i2e
         q9BWup9pSYXjIkjkpnmswiwFE+6StzxhyWPcelqJYrIlyN7D1Qay5IGjaANoPxSsgrS1
         g+qX5zcIuft/FaG9vvRe9fn4JozxaUCo9jvPhMffNgySo3EJ5pjg+1edbvJ/Dn8H46NF
         OmKRiUftFr+qGWG3wmmiR+VECJSap+8uH8unePyMPRfmXBhj/MVofcX+Ed1h4bsp+1uL
         80x9VG0thpYo8Io0qVdFp3RaHNTlMlUkrvIQYHQvr/Z1zvVUEG1Eo3Vio8JoGT9LwS5D
         /49Q==
X-Gm-Message-State: AOAM533TNa7d0oEXW6EyrvTR1EqIbGVW6vnG0j6Gv5YYjyIFtS+6aOgR
        wFqNAswLjuuA6dyQHQPM7fQ=
X-Google-Smtp-Source: ABdhPJwlQupOnOmuK68DWrIbDGLZZVpew5pd9Rb3Nz/IxYlV3sXj1Ji0prLxh1d4UrAlvE3lHR15Dw==
X-Received: by 2002:a62:61c2:0:b029:197:f5ee:6ffa with SMTP id v185-20020a6261c20000b0290197f5ee6ffamr8040757pfb.18.1606144733480;
        Mon, 23 Nov 2020 07:18:53 -0800 (PST)
Received: from localhost.localdomain ([240d:1a:8f0:6c00:89cb:88d1:b6b2:3345])
        by smtp.gmail.com with ESMTPSA id r130sm5038399pfc.41.2020.11.23.07.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 07:18:52 -0800 (PST)
From:   Alexandre Courbot <gnurou@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexandre Courbot <gnurou@gmail.com>
Subject: [PATCH v2 0/2] media: always call poll_wait() on queues
Date:   Tue, 24 Nov 2020 00:18:41 +0900
Message-Id: <20201123151843.798205-1-gnurou@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

do_poll()/do_select() seem to set the _qproc member of poll_table to
NULL the first time they are called on a given table, making subsequent
calls of poll_wait() on that table no-ops. This behavior causes a bug
with the current poll implementations of vb2 and mem2mem, which only
call poll_wait() if a queue-related (EPOLLIN or EPOLLOUT) event if
present: if there is none during the first call (e.g. because userspace
only wanted to listen to EPOLLPRI), then EPOLLIN and EPOLLOUT will never
be signaled, event if they are requested later.

This can be fixed by making the call to poll_wait() unconditional, thus
making sure it will also be invoked during the first call.

The issue has been discussed in more detail on
https://www.spinics.net/lists/linux-media/msg179618.html.

Alexandre Courbot (2):
  media: videobuf2: always call poll_wait() on queues
  media: v4l2-mem2mem: always call poll_wait() on queues

 drivers/media/common/videobuf2/videobuf2-core.c | 11 +++++++++--
 drivers/media/v4l2-core/v4l2-mem2mem.c          | 15 ++++++++++++---
 2 files changed, 21 insertions(+), 5 deletions(-)

--
2.29.2

