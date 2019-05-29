Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DF212D96C
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 11:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726399AbfE2JtI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 05:49:08 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:48033 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725861AbfE2JtI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 05:49:08 -0400
Received: from [IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae] ([IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae])
        by smtp-cloud7.xs4all.net with ESMTPA
        id VvCjh5LNL3qlsVvCkhsjEz; Wed, 29 May 2019 11:49:06 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] Various fixes
Message-ID: <40e92b58-c725-f854-50b4-9b9bd7cbb450@xs4all.nl>
Date:   Wed, 29 May 2019 11:49:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBHzG6kWYkDSzEYPh1B85UX74r5UuebLx4Gn9vW3L+JreBJSOmCputAvesZ8PjJTnpVB47JHAutQV30KHUegjkFUlWM/6A9jAi2F1HvlX9dGPC0E8W5Y
 x/KChSr5bWN3nSaFUdDtI5opR85cn7GWRYUPrItthuk84zMMaFFbYKuWhTlMrG0FcMxuq7JqMlU0J71I0oU4jJDv7GlUTFWS4uMuRxFMF98KYGRNT7GhYH1j
 jMG0LuTEXYIHT1bW/vqsqDqPx2V/JkaT0kHMjdkifgU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Note: this includes two regressions for 5.3:

      mc-device.c: don't memset __user pointer contents
      cec-adap: fix regression in ping sanity check

Regards,

	Hans

The following changes since commit 39cb46751e2fbb72e0698f80e339db1fd4e1f50e:

  media: imx7-media-csi: Change imx7_csi_enable() to void (2019-05-28 14:20:12 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3h

for you to fetch changes up to 6d40d995f877ef1cec20bec1135207f0dfac4c5a:

  cec-adap: fix regression in ping sanity check (2019-05-29 11:41:05 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (4):
      videobuf2-vmalloc: get_userptr: buffers are always writable
      media-ioc-enum-links.rst: fix incorrect reserved field documentation
      mc-device.c: don't memset __user pointer contents
      cec-adap: fix regression in ping sanity check

Kefeng Wang (1):
      media: saa7164: fix remove_proc_entry warning

Wen Yang (2):
      media: mtk-vpu: fix leaked of_node references
      media: mtk-vcodec: fix leaked of_node references

 Documentation/media/uapi/mediactl/media-ioc-enum-links.rst |  7 ++++++-
 drivers/media/cec/cec-adap.c                               |  2 +-
 drivers/media/common/videobuf2/videobuf2-dma-contig.c      |  3 +--
 drivers/media/common/videobuf2/videobuf2-dma-sg.c          |  3 +--
 drivers/media/common/videobuf2/videobuf2-memops.c          |  9 ++-------
 drivers/media/common/videobuf2/videobuf2-vmalloc.c         |  3 +--
 drivers/media/mc/mc-device.c                               |  5 +++--
 drivers/media/pci/saa7164/saa7164-core.c                   | 33 ++++++++++++++++++++++-----------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c      |  2 +-
 drivers/media/platform/mtk-vpu/mtk_vpu.c                   |  2 +-
 include/media/videobuf2-memops.h                           |  3 +--
 11 files changed, 40 insertions(+), 32 deletions(-)
