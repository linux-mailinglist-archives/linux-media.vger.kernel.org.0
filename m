Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1AC51A52C2
	for <lists+linux-media@lfdr.de>; Sat, 11 Apr 2020 18:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgDKQGM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Apr 2020 12:06:12 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59538 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgDKQGM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Apr 2020 12:06:12 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 2FD7C2A11D7
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH v4 0/6] media: staging: rkisp1: cap: various fixes for capture formats
Date:   Sat, 11 Apr 2020 18:05:56 +0200
Message-Id: <20200411160602.14637-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset fixes various issues related to
the supported formats in the rkisp1 capture.

This patchset is rebased on top of v3 of the patchset:
"rkisp1: use enum v4l2_pixel_encoding instead of rkisp1_fmt_pix_type"

Patches summary:

patches 1,2 - fixes a wrong assignments to the register that swaps the
'u', 'v' planes in YUV semiplanar formats.

patch 3 - writes to the uv swap with "off" if swapping is not needed.

patch 4 - sets the uv swap register only if the format is semiplanar.

patch 5 - adds support to planar YUV formats with swapped u,v planes
by swapping the addresses of the planes

patch 6 - removes some packed YUV formats that are not supported
by the driver.

changes from v1:
- split the first patch from v1 into two separate patches, the first is a cleanup patch
the second fixes a bug.

changes from v2:
- rebasing the patchset on top of v3 of
"rkisp1: use enum v4l2_pixel_encoding instead of rkisp1_fmt_pix_type"
- patches 1,2: replace "reg = reg | .." with "reg |= .."
- adding patch 3 to change the logic of wrrting to uv swap reg
- patches 4,5: checking if format is (semi)planar using the info pointer and not using the write_format value
- patch 4: using the "swap" define to swap the cb, cr addresses

changes from v3:
- In patch 5 in the doc and log message: s/plane formats/planar formats/





Dafna Hirschfeld (6):
  media: staging: rkisp1: cap: cleanup in mainpath config for uv swap
    format
  media: staging: rkisp1: cap: fix value written to uv swap register in
    selfpath
  media: staging: rkisp1: cap: change the logic for writing to uv swap
    register
  media: staging: rkisp1: cap: support uv swap only for semiplanar
    formats
  media: staging: rkisp1: cap: support uv swapped planar formats
  media: staging: rkisp1: cap: remove unsupported formats

 drivers/staging/media/rkisp1/rkisp1-capture.c | 50 +++++++++----------
 1 file changed, 24 insertions(+), 26 deletions(-)

-- 
2.20.1

