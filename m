Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E74445069A
	for <lists+linux-media@lfdr.de>; Mon, 15 Nov 2021 15:20:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232109AbhKOOXg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Nov 2021 09:23:36 -0500
Received: from aposti.net ([89.234.176.197]:50666 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232227AbhKOOWb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Nov 2021 09:22:31 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Alexandru Ardelean <ardeleanalex@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 00/15] iio: buffer-dma: write() and new DMABUF based API
Date:   Mon, 15 Nov 2021 14:19:10 +0000
Message-Id: <20211115141925.60164-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonathan,

This patchset introduces a new userspace interface based on DMABUF
objects, to complement the existing fileio based API.

The advantage of this DMABUF based interface vs. the fileio
interface, is that it avoids an extra copy of the data between the
kernel and userspace. This is particularly userful for high-speed
devices which produce several megabytes or even gigabytes of data per
second.

The first few patches [01/15] to [03/15] are not really related, but
allow to reduce the size of the patches that introduce the new API.

Patch [04/15] to [06/15] enables write() support to the buffer-dma
implementation of the buffer API, to continue the work done by
Mihail Chindris.

Patches [07/15] to [12/15] introduce the new DMABUF based API.

Patches [13/15] and [14/15] add support for cyclic buffers, only through
the new API. A cyclic buffer will be repeated on the output until the
buffer is disabled.

Patch [15/15] adds documentation about the new API.

For now, the API allows you to alloc DMABUF objects and mmap() them to
read or write the samples. It does not yet allow to import DMABUFs
parented to other subsystems, but that should eventually be possible
once it's wired.

This patchset is inspired by the "mmap interface" that was previously
submitted by Alexandru Ardelean and Lars-Peter Clausen, so it would be
great if I could get a review from you guys. Alexandru's commit was
signed with his @analog.com address but he doesn't work at ADI anymore,
so I believe I'll need him to sign with a new email.

Cheers,
-Paul

Alexandru Ardelean (1):
  iio: buffer-dma: split iio_dma_buffer_fileio_free() function

Paul Cercueil (14):
  iio: buffer-dma: Get rid of incoming/outgoing queues
  iio: buffer-dma: Remove unused iio_buffer_block struct
  iio: buffer-dma: Use round_down() instead of rounddown()
  iio: buffer-dma: Enable buffer write support
  iio: buffer-dmaengine: Support specifying buffer direction
  iio: buffer-dmaengine: Enable write support
  iio: core: Add new DMABUF interface infrastructure
  iio: buffer-dma: Use DMABUFs instead of custom solution
  iio: buffer-dma: Implement new DMABUF based userspace API
  iio: buffer-dma: Boost performance using write-combine cache setting
  iio: buffer-dmaengine: Support new DMABUF based userspace API
  iio: core: Add support for cyclic buffers
  iio: buffer-dmaengine: Add support for cyclic buffers
  Documentation: iio: Document high-speed DMABUF based API

 Documentation/driver-api/dma-buf.rst          |   2 +
 Documentation/iio/dmabuf_api.rst              |  94 +++
 Documentation/iio/index.rst                   |   2 +
 drivers/iio/adc/adi-axi-adc.c                 |   3 +-
 drivers/iio/buffer/industrialio-buffer-dma.c  | 670 ++++++++++++++----
 .../buffer/industrialio-buffer-dmaengine.c    |  42 +-
 drivers/iio/industrialio-buffer.c             |  49 ++
 include/linux/iio/buffer-dma.h                |  43 +-
 include/linux/iio/buffer-dmaengine.h          |   5 +-
 include/linux/iio/buffer_impl.h               |   8 +
 include/uapi/linux/iio/buffer.h               |  30 +
 11 files changed, 783 insertions(+), 165 deletions(-)
 create mode 100644 Documentation/iio/dmabuf_api.rst

-- 
2.33.0

