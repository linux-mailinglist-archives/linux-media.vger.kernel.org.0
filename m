Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F00419C957
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 21:04:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389517AbgDBTE2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 15:04:28 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46034 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387819AbgDBTE2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 15:04:28 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:1140:6758:20a2:167a:3b62:26be])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id EBC82294108;
        Thu,  2 Apr 2020 20:04:26 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2 0/5] media: staging: rkisp1: cap: various fixes for capture formats
Date:   Thu,  2 Apr 2020 21:04:14 +0200
Message-Id: <20200402190419.15155-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset fixes various issues related to
the supported formats in the rkisp1 capture.

Patches summary:

patches 1,2 - fixes a wrong assignments to the register that swaps the
'u', 'v' planes in YUV semiplanar formats.

patch 3 - sets the register from patch 1 only if the format is semiplanar.

patch 4 - adds support to planar YUV formats with swapped u,v planes
by swapping the addresses of the planes

patch 5 - removes some packed YUV formats that are not supported
by the driver.

changes from v1:
- split the first patch from v1 into two separate patches, the first is a cleanup patch
the second fixes a bug.

Dafna Hirschfeld (5):
  media: staging: rkisp1: cap: cleanup in mainpath config for uv swap
    format
  media: staging: rkisp1: cap: fix value written to uv swap register in
    selfpath
  media: staging: rkisp1: cap: support uv swap only for semiplanar
    formats
  media: staging: rkisp1: cap: support uv swapped plane formats
  media: staging: rkisp1: cap: remove unsupported formats

 drivers/staging/media/rkisp1/rkisp1-capture.c | 55 ++++++++++---------
 1 file changed, 28 insertions(+), 27 deletions(-)

-- 
2.17.1

