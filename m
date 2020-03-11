Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5278E181B78
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 15:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729746AbgCKOih (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 10:38:37 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:54673 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729479AbgCKOih (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 10:38:37 -0400
Received: from [IPv6:2001:420:44c1:2577:d578:21fa:bf61:c876]
 ([IPv6:2001:420:44c1:2577:d578:21fa:bf61:c876])
        by smtp-cloud9.xs4all.net with ESMTPA
        id C2VDjSCdG9Im2C2VHjfOTz; Wed, 11 Mar 2020 15:38:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583937515; bh=93gbJEZGv+Vb4LdfY39/SprMTUOXomKvrI3YLTNS7UE=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=ecK7XKc0FRJUertVTKoU5+NVjwWzGBFa6pgSo/bdBmvAs1P62Y/8wGHAyw7W5YW6z
         f0AVQ9+B5ZuWdaSAdpYf/rXlXE2vk/WQHymRwtZImoj3i1gV+HOc9SFz4NCYiE19OD
         xkMpbILNSedD7HLa3K8vFxh6YN+NTINxYFH6AOFglbglD0+c7PNBXiXxXCGCcmYJH3
         ZuTNSlROlcir7/pot1NTl8OYJmc8sSV7PMN3MIi7ye//EhlkKCNcHmXye7j6FTt/KD
         +WVafqSQHEp1Q8d42kNJg7GyMhiYi5NpRmTJ2aXOUX6c59fSJN5EdplShx2oOTlsRd
         iPBXH2aGOrhlA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.7] Various fixes
Message-ID: <bc2880a4-42b7-8dab-241f-b263b26e20e7@xs4all.nl>
Date:   Wed, 11 Mar 2020 15:38:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFZmpodpaDU0eRljgXU8NIkFBZOYoEmTR1q1N8fZUaTxNOhNmJ8CDiK+mVm3MnKLyzWxy18MaEL++lD0Oi3VpZvafrZOVOfjsbG5XI0flQ86N1bwPF0P
 e2t5M6XvvYBrWhSUBuUzvq/H9AlJFldYT+iQuAbYol3aOCZFOhdxLIZ52Ec28S45NJ2Gj4pneZJ/Mm7CJdz8ZXrJkzMuaMgnlZFCU1nYAPQIFNbsCMuMM7ib
 1qlySqf+ZTjmivyHoKbEWn3LqOCsLCNEGUs2EP7pFiAKF3kQPr7m+1JO2r+gDw0x
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 00c43088aa680989407b6afbda295f67b3f123f1:

  media: meson: vdec: add VP9 decoder support (2020-03-05 23:05:34 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.7h

for you to fetch changes up to 08f57612561cd93e9a6834c1b07be780f3e7873d:

  media: am437x-vpfe: exclude illegal values for enum when validing params from user space (2020-03-11 15:26:32 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benoit Parrot (1):
      media: ti-vpe: cal: fix a kernel oops when unloading module

Changming Liu (1):
      media: am437x-vpfe: exclude illegal values for enum when validing params from user space

Hsin-Yi Wang (1):
      media: mtk-vpu: avoid unaligned access to DTCM buffer.

 drivers/media/platform/am437x/am437x-vpfe.c     |  1 +
 drivers/media/platform/mtk-mdp/mtk_mdp_vpu.c    |  9 +++++----
 drivers/media/platform/mtk-vcodec/vdec_vpu_if.c |  6 +++---
 drivers/media/platform/mtk-vcodec/venc_vpu_if.c | 12 ++++++------
 drivers/media/platform/mtk-vpu/mtk_vpu.c        | 45 +++++++++++++++++++++++----------------------
 drivers/media/platform/mtk-vpu/mtk_vpu.h        |  2 +-
 drivers/media/platform/ti-vpe/cal.c             | 13 ++++++++-----
 7 files changed, 47 insertions(+), 41 deletions(-)
