Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C514D449C9B
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 20:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237732AbhKHTmc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 14:42:32 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41800 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236276AbhKHTma (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 8 Nov 2021 14:42:30 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 023F21F41460
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1636400384; bh=wVV0fcvXn+UZ/+hFA6M8kPAY3hj5EfltX4rVDceZ4Y0=;
        h=From:To:Cc:Subject:Date:From;
        b=f89Vd3XEoqukyBSGyRahwA/C/bbMy1KhzxouUOgsPDt45T8rplFWBvBehoGk0oXBS
         33QZvRu8TU6WdXfGgV1BDuqVHIZoaaumALEgQXpF7c5srxbuz3iab7k/ipWMnleLRR
         tdeb9kkgaDUjJKnBGt8xoI0J4snX6xAVofsDYurjd16PQAqN+tfBLqVunbt5xQH64y
         o3A4s42W/4tWFwzBheqhEUSkYDvdxrAdxnMh+yb14hvJK/YopMI52l+6W8YGuFiPw5
         M6KWG2uR8A1d1bBYL1HaWg5f2HQ6soW5Z1JxZ0cGTYLlalbstE+fknzadRfjBwypbC
         wDpIfbpmPhejg==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, dafna3@gmail.com, sakari.ailus@linux.intel.com,
        mchehab@kernel.org
Subject: [PATCH 0/2] media: videobuf2: make sure bytesused is smaller than the buffer size
Date:   Mon,  8 Nov 2021 21:39:31 +0200
Message-Id: <20211108193933.20369-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a WARN_ON in vb2_set_plane_payload if bytesused is bigger than length.
Also change places where bytesused is set directly with that function.
This help find/eliminate possible buffer overflow.

Dafna Hirschfeld (2):
  media: replace setting of bytesused with vb2_set_plane_payload
  media: videobuf2: add WARN_ON if bytesused is bigger than buffer
    length

 drivers/media/platform/allegro-dvt/allegro-core.c  |  2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 10 +++++-----
 drivers/media/test-drivers/vicodec/vicodec-core.c  |  2 +-
 drivers/media/usb/go7007/go7007-driver.c           |  2 +-
 drivers/staging/media/meson/vdec/vdec_helpers.c    | 10 +++++-----
 include/media/videobuf2-core.h                     |  4 +++-
 6 files changed, 16 insertions(+), 14 deletions(-)

-- 
2.17.1

