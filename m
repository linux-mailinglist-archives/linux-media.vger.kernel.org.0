Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D54D2D0DEB
	for <lists+linux-media@lfdr.de>; Mon,  7 Dec 2020 11:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726459AbgLGKWR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Dec 2020 05:22:17 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:60325 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725852AbgLGKWR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Dec 2020 05:22:17 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id mDe7kFEDwarN7mDeAkz7qe; Mon, 07 Dec 2020 11:21:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1607336495; bh=L1Bgkiyyo3V7YJvEXdX6aU51DtPuoog00qmagaSsNRc=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=kWsl6sYWzghaB/Z1eiaaOjPK6F2GDLvchuX9nAqZuP/3Z9eq6QHoQWaOvbwBr/6oJ
         CuXopTyXgQDBTlqnhd/arJyxSGh9SkYWvY01ACGda9dGLguFP7hll2QMrlrH4JqGdR
         SnqELxZY+ZXpIQYAeXVMEJjLq0Ya9gmoAaohgRyHFIBBbg39/Z1zvQmuGFNRtK38iu
         UNVlXoQJZNW9a/BAipMJoSbUSzu8mcNMBvKeY1hHFo6YIx5OOg3Lr+bNGOM4m7JXxT
         Ash9CctVbHgknSYc4/9JFlQSjSD7Q3Xtk18G/bFnwtmC1oBjw4IILV4eTnGENG08g9
         74t5pgftK194A==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.12] ti-vpe: cal: prepare for adding MC support
Message-ID: <b5f50e63-0c79-d613-fc8b-c3a529dcd446@xs4all.nl>
Date:   Mon, 7 Dec 2020 11:21:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPrmqtypqjHLVKXAVMWg7no+YeS3puyYm69c7/t16MIwWm6IqwPGzvOlOVTEVdcnoBT1jPEAEtNLXi8TQRYV0RBrq30gmTze+vRpbTbPeeYX3Vy7y1U/
 KX/TAXQUfOa0ysxdsuVeIqUTvrh/ohopdrkr0rP2/R2SlmyihBAOBbAZBf+qnjviap9Wet/hNAOclRYarLdHOSCnEv6e39+dxWqNx2QWV6PRd/5ahykrMVhr
 oX1Xc2clE9lVqYsqpq77bg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This PR merges all except for the final patch of the ti-vpe cal MC series:

https://patchwork.linuxtv.org/project/linux-media/cover/20201206235353.26968-1-laurent.pinchart@ideasonboard.com/

It is very likely that by the time this PR can be merged there will be a v2
of this PR containing the last patch as well, but for now I want to post this
to ensure that at least these patches will be merged.

Regards,

	Hans

The following changes since commit 63288c829b1a5991d8f8c15cab596108ed206ba6:

  media: pixfmt-compressed.rst: fix 'bullet' formatting (2020-12-03 12:27:34 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.12a

for you to fetch changes up to e385a8f247331d5a1fd1cbe51ef8032106445f66:

  media: ti-vpe: cal: Simplify the context API (2020-12-07 10:50:08 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Laurent Pinchart (23):
      media: ti-vpe: cal: Create subdev for CAMERARX
      media: ti-vpe: cal: Drop cal_ctx m_fmt field
      media: ti-vpe: cal: Move format handling to cal.c and expose helpers
      media: ti-vpe: cal: Rename MAX_(WIDTH|HEIGHT)_* macros with CAL_ prefix
      media: ti-vpe: cal: Replace hardcoded BIT() value with macro
      media: ti-vpe: cal: Iterate over correct number of CAMERARX instances
      media: ti-vpe: cal: Implement subdev ops for CAMERARX
      media: ti-vpe: cal: Use CAMERARX subdev s_stream op in video device code
      media: ti-vpe: cal: Don't pass format to cal_ctx_wr_dma_config()
      media: ti-vpe: cal: Rename struct cal_fmt to cal_format_info
      media: ti-vpe: cal: Refactor interrupt enable/disable
      media: ti-vpe: cal: Fold PPI enable in CAMERARX .s_stream()
      media: ti-vpe: cal: Stop write DMA without disabling PPI
      media: ti-vpe: cal: Use spin_lock_irq() when starting or stopping stream
      media: ti-vpe: cal: Share buffer release code between start and stop
      media: ti-vpe: cal: Drop V4L2_CAP_READWRITE
      media: ti-vpe: cal: Drop unneeded check in cal_calc_format_size()
      media: ti-vpe: cal: Remove DMA queue empty check at start streaming time
      media: ti-vpe: cal: Use list_first_entry()
      media: ti-vpe: cal: Group all DMA queue fields in struct cal_dmaqueue
      media: ti-vpe: cal: Set cal_dmaqueue.pending to NULL when no pending buffer
      media: ti-vpe: cal: Store buffer DMA address in dma_addr_t
      media: ti-vpe: cal: Simplify the context API

 drivers/media/platform/ti-vpe/cal-camerarx.c | 373 +++++++++++++++++++++++++++++++++++++++++++++++++++++--------------
 drivers/media/platform/ti-vpe/cal-video.c    | 394 ++++++++++++++++++++++++-----------------------------------------------
 drivers/media/platform/ti-vpe/cal.c          | 385 +++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------
 drivers/media/platform/ti-vpe/cal.h          | 103 +++++++++++++------
 4 files changed, 809 insertions(+), 446 deletions(-)
