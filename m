Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0966244D926
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 16:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233823AbhKKP3p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 10:29:45 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46232 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230177AbhKKP3p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 10:29:45 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 9D15A1F45A55
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1636644415; bh=LSQ4vsDKd6G8b1rNyV+HBOrtvzdMvqTYv4ba0O87Ixw=;
        h=From:To:Cc:Subject:Date:From;
        b=jxvN5YRJfiJb7T5MHfAAi/bCXmle3CXPoMBU7Ya29M0d81VOeMbU1dyyLnMth/3Ah
         rq1ULaAW/luWmZd6byGGZe1PrRiN1WWQq8Ikwka0AZIugZTZb8KjT799UmcwK0wWaM
         tqeSKAX0q1xpxiIbe/ZWU9wvFM8FKwqftmHRJC32/jvFPsMPEbyDPwiz0IqoXqT/0v
         BkPAhPguSzOfsX7UnHP2CDKypnwaNmYxZHvaSZTNH8MpVflW1OZn8uPvZoN5g7iz0y
         RD9lMjIF48DS2Xgl8HHPH8FsijWuYWQiKQbr0zCnKkCKJYjQ7JaxCIvFPX8/a0zE+Y
         ONGPuEqRISCGA==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        kernel@collabora.com, laurent.pinchart@ideasonboard.com,
        hverkuil@xs4all.nl, dafna3@gmail.com, sakari.ailus@linux.intel.com,
        mchehab@kernel.org
Subject: [PATCH v2 0/2] media: videobuf2: make sure bytesused is smaller than the buffer size
Date:   Thu, 11 Nov 2021 17:26:38 +0200
Message-Id: <20211111152640.1537-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a WARN_ON_ONCE in vb2_set_plane_payload if bytesused is bigger than length
and clamp the bytesused to lenth.
Also change places where bytesused is set directly with that function.
This help find/eliminate possible buffer overflow.

chnages since v2:
* replace WARN_ON with WARN_ON_ONCE
* clamp the bytesused to the buffer length if it is bigger
* add inline doc

Dafna Hirschfeld (2):
  media: replace setting of bytesused with vb2_set_plane_payload
  media: videobuf2: add WARN_ON if bytesused is bigger than buffer
    length

 drivers/media/platform/allegro-dvt/allegro-core.c  |  2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 10 +++++-----
 drivers/media/test-drivers/vicodec/vicodec-core.c  |  2 +-
 drivers/media/usb/go7007/go7007-driver.c           |  2 +-
 drivers/staging/media/meson/vdec/vdec_helpers.c    | 10 +++++-----
 include/media/videobuf2-core.h                     |  8 +++++++-
 6 files changed, 20 insertions(+), 14 deletions(-)

-- 
2.17.1

