Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6982195E5
	for <lists+linux-media@lfdr.de>; Fri, 10 May 2019 02:00:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfEJAAh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 May 2019 20:00:37 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:42276 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726694AbfEJAAg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 May 2019 20:00:36 -0400
Received: by mail-qt1-f202.google.com with SMTP id z7so4454934qtb.9
        for <linux-media@vger.kernel.org>; Thu, 09 May 2019 17:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=M35jpHh+HUdAc93UKOjDO7JbyHiHSckhQH2gYDGobXY=;
        b=tSZ3t6N4Z1hNAMYvgS92eIL566ndUhmt5xsPPoUSXPzweWrogmxc+KJ10EVf3pttkF
         merVBSZHG0xLznvz4TKUL7L/GZ2cjBzn9Uqwa07TqFu+hek4xO0PQZfpn+9AYYxEqHRe
         iG61HVtIimI9EQNzmCMq2HhMo1YFeWooHmUb1dCm4Km/pTzPbAhRn7WUXoNAQprfpOYl
         KpalQjheFynt2AC8LlfdwPcJT2Dd9exlL1kqGHdpBmSVkj/RAc0c7GLZHzWoZStRx/DU
         OVyvgiKkjGPP01EUrs0iwK5npCTDem8hdHBbtbZEpi9IcUifRkYzYt5ron+RYMbsxchS
         oAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=M35jpHh+HUdAc93UKOjDO7JbyHiHSckhQH2gYDGobXY=;
        b=n49BFG/gKlh4dA0q7kh/QKJ0neULp++jGwodwDsRIdI6WqlzKtJyEcUO75ZH05+xcX
         WQkMLFTgSF0RHcQomUZd6ytxuaKy5zZo7jZuX32pX3qA+EgK14iZPIZnMZukuMW9AAyC
         x3AtORlYNKrrScG6pOrD1cIAigHnMGCoTMeQKA2GljB/dVW0XlerWlJVnbLyNfxlvgtF
         KYnSIUZFdMX+KkKyZ6XVjD4ta6bYkAfs/LtjiicdVoKpE31s4JYe0q23kQIjVlB1R/yJ
         sDH8VtfA7LiCcmhI++7xIZy7IbUog+H1rlkU1yoq2Gjo9SBw4z2HhjCMsS366N6odvnj
         CYQw==
X-Gm-Message-State: APjAAAUDgsD0Kg/S5Ia0Ue1DkTtEEXqyRPpx9Cf2pwm3uOzSJo2lufL6
        BnQK3ST0j9WkaLiIBEkUuoZmKfVYGA==
X-Google-Smtp-Source: APXvYqxnWMeG08te3Sc05EXGTxd8eHwJqSeZWK3/hm9AqvlKOJ36EdgmCBMpQKg7lKin0TXW98MNSIkgsQ==
X-Received: by 2002:ac8:29af:: with SMTP id 44mr6461067qts.352.1557446435276;
 Thu, 09 May 2019 17:00:35 -0700 (PDT)
Date:   Thu,  9 May 2019 17:00:29 -0700
Message-Id: <20190510000032.40749-1-fengc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
Subject: [dma-buf v3 0/3] Improve the dma-buf tracking
From:   Chenbo Feng <fengc@google.com>
To:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-media@vger.kernel.org
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>, erickreyes@google.com,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, all dma-bufs share the same anonymous inode. While we can count
how many dma-buf fds or mappings a process has, we can't get the size of
the backing buffers or tell if two entries point to the same dma-buf. And
in debugfs, we can get a per-buffer breakdown of size and reference count,
but can't tell which processes are actually holding the references to each
buffer.

To resolve the issue above and provide better method for userspace to track
the dma-buf usage across different processes, the following changes are
proposed in dma-buf kernel side. First of all, replace the singleton inode
inside the dma-buf subsystem with a mini-filesystem, and assign each
dma-buf a unique inode out of this filesystem.  With this change, calling
stat(2) on each entry gives the caller a unique ID (st_ino), the buffer's
size (st_size), and even the number of pages assigned to each dma-buffer.
Secoundly, add the inode information to /sys/kernel/debug/dma_buf/bufinfo
so in the case where a buffer is mmap()ed into a process=E2=80=99s address =
space
but all remaining fds have been closed, we can still get the dma-buf
information and try to accociate it with the process by searching the
proc/pid/maps and looking for the corresponding inode number exposed in
dma-buf debug fs. Thirdly, created an ioctl to assign names to dma-bufs
which lets userspace assign short names (e.g., "CAMERA") to buffers. This
information can be extremely helpful for tracking and accounting shared
buffers based on their usage and original purpose. Last but not least, add
dma-buf information to /proc/pid/fdinfo by adding a show_fdinfo() handler
to dma_buf_file_operations. The handler will print the file_count and name
of each buffer.

Change in v2:
* Add a check to prevent changing dma-buf name when it is attached to
  devices.
* Fixed some compile warnings

Change in v3:
* Removed the GET_DMA_BUF_NAME ioctls, add the dma_buf pointer to dentry
  d_fsdata so the name can be displayed in proc/pid/maps and
  proc/pid/map_files.

Greg Hackmann (3):
  dma-buf: give each buffer a full-fledged inode
  dma-buf: add DMA_BUF_{GET,SET}_NAME ioctls
  dma-buf: add show_fdinfo handler

 drivers/dma-buf/dma-buf.c    | 122 +++++++++++++++++++++++++++++++++--
 include/linux/dma-buf.h      |   5 +-
 include/uapi/linux/dma-buf.h |   3 +
 include/uapi/linux/magic.h   |   1 +
 4 files changed, 124 insertions(+), 7 deletions(-)

--=20
2.21.0.1020.gf2820cf01a-goog

