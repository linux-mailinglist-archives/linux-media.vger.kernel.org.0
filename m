Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB6C92823FC
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 13:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgJCLyN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 07:54:13 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:55079 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725770AbgJCLyN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 3 Oct 2020 07:54:13 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Og6YkjNzmTHgxOg6ck6ewD; Sat, 03 Oct 2020 13:54:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1601726051; bh=OjvydS7R5Nida52/xyeOHfOZcJMnAryyT7nN+Yfstdg=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=nKqNd06SM/IT5ITzxqp57TOeovoxfK8oQk22jaHhfoMBlvnUZaM2hD7hmjwbNNvNd
         aVPloA9x4qaAknVidcX0F6Rp4lgUhPs+6z/zKYgEscUPWamz3KYtxHRk+g5gDaX4hY
         ixTKf6EVT6XPTuiRYHKghU6N4RmM4mjE6EQ5JLHtXSXZS0kmtWbLbSt3GJHrdd0bUS
         2vZao+ZYlNF7VV8vzQ3b7dd6NBfisXYP4eh9JgP0Z92v27Zgqqx7mlnPP8W02aQNRz
         GnVdLx/uA9D0WOunpkQpeoNspgynxGq1heBeoWov2DGu5WuBLM58V3sV+/hywmrDSJ
         vM0AbXZQDqEKA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.10] Four fixes for 5.10.
Message-ID: <b9bad957-0074-a141-bd89-0b291fc6e1d3@xs4all.nl>
Date:   Sat, 3 Oct 2020 13:53:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKBTHGcTyyibUWwe4pJHPUzmCDDeX6FjiAPLkCJwqHhRq0N7rLGKqsv4fUxp+JZ3r8DkbfYsK7+77yQeqZTyG2d/Y+iyapuF4aahJIB8wg2J8QZOaPx3
 o8p0Sc8m99L28EpxZbHQz+bY5kX3Eb/QKN8SlVNXmpbkNl9jz5E3ud9S5gyvfy/3Y9HQUwBrxI/D0Q==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit eb5f6b8ee9e4fcdda3807aff02a3df2d7ca51bbf:

  media: atomisp: fixes build breakage for ISP2400 due to a cleanup (2020-10-01 13:17:26 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.10b

for you to fetch changes up to d2c5ba3192f6f55af5c74339b56dffe673ec3550:

  media: rcar-vin: rcar-dma: Fix setting VNIS_REG for RAW8 formats (2020-10-03 13:17:18 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ezequiel Garcia (1):
      media: v4l2-mem2mem: Fix spurious v4l2_m2m_buf_done

Lad Prabhakar (1):
      media: rcar-vin: rcar-dma: Fix setting VNIS_REG for RAW8 formats

Niklas Söderlund (1):
      staging: rkisp1: uapi: Do not use BIT() macro

Oliver Neukum (1):
      usbtv: Fix refcounting mixup

 drivers/media/platform/rcar-vin/rcar-dma.c        |  8 ++++----
 drivers/media/usb/usbtv/usbtv-core.c              |  3 ++-
 drivers/media/v4l2-core/v4l2-mem2mem.c            |  1 -
 drivers/staging/media/rkisp1/uapi/rkisp1-config.h | 44 ++++++++++++++++++++++----------------------
 4 files changed, 28 insertions(+), 28 deletions(-)
