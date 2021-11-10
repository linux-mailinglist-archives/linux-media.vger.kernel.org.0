Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0330744BD42
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 09:46:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbhKJItL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 03:49:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbhKJItL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 03:49:11 -0500
Received: from lb1-smtp-cloud9.xs4all.net (lb1-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 167C0C061764
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 00:46:23 -0800 (PST)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id kjFLmlg5SfwDFkjFOmFKOl; Wed, 10 Nov 2021 09:46:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1636533982; bh=wLaIbes0VHB9PXGjKvKFEyE9UK3Ko8iW8K8UWQg0BOA=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=fkVp4xeNKKc41vukF5b0BVCc0o25bVUFbkkOoOqKuQ3zbrQMozaZzQZQrEUwr3F3r
         EbyY6qEoeCH0HLaJtsNmQ2xGKFq3tGd+EQX9tFXgaE2CUV8lJeET4wzx6XlJppryMO
         ixKW5ukpQzmgAx7Y1dzrVK79VdiehJvPaI/2me8hR4UgwmV4NKF7RFHh2zZBasCWgt
         BaE4a57vJea7QMhyiFRrmWdo2OvmZjxqSMzFuEzGQrVMaQqWcAjXx61oXq/l7Glbvl
         z0O9KAGR2aQ3spQFmMzZxOdrawJ0LfnfbP1z9C62ttivY+FC06mvO5icUzKHI1vQnO
         SzEBH7tLD9XQw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.16] Three fixes for v5.16
Message-ID: <a5b6d1ca-a38c-924d-fbf2-ee38274f0ef3@xs4all.nl>
Date:   Wed, 10 Nov 2021 09:46:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfEWIrhqLbod8EYTNHpIf72q7qeIp8tcNdb74wgYSwJ8PPltpccHnkZHlOVt2x9QuWS0CF+Y9riUT4AXV957V7qDXyI8sg8oV41QIxEDToCXjWM5FL7iS
 sEQaX2RgzDK94hZ8S2feMlVH6YNaeHnP8rD985MSUzTranXI70SkDShmhp+Tqj9TkWlqmG3KNZX9lM2YyJzCjk98UNNq6+NQ1ITraRU8hL+UxLcsdaiDn/KJ
 U396VrjFwWxJYYh7wyCstA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 3c7a2a27549c97f36d698791dcfa4f349b499f95:

  media: atomisp: register first the preview devnode (2021-11-06 12:10:49 +0000)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.16a

for you to fetch changes up to dc99c6733ae8e3caa91e09fcc9e2431451afbf2d:

  cec: copy sequence field for the reply (2021-11-10 09:42:41 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Arnd Bergmann (1):
      media: v4l2-core: fix VIDIOC_DQEVENT handling on non-x86

Hans Verkuil (1):
      cec: copy sequence field for the reply

Hans de Goede (1):
      media: videobuf2-dma-sg: Fix buf->vb NULL pointer dereference

 drivers/media/cec/core/cec-adap.c                 |  1 +
 drivers/media/common/videobuf2/videobuf2-dma-sg.c |  2 ++
 drivers/media/v4l2-core/v4l2-compat-ioctl32.c     | 41 +++++++++++++++++------------------------
 3 files changed, 20 insertions(+), 24 deletions(-)
