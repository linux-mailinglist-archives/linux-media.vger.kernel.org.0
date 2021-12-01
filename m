Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5C8465997
	for <lists+linux-media@lfdr.de>; Wed,  1 Dec 2021 23:57:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234771AbhLAXAj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 18:00:39 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40978 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353734AbhLAXAh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 18:00:37 -0500
Received: from localhost.localdomain (unknown [IPv6:2a00:c281:1409:4a00:c103:6980:2c3:d021])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3A7D41F45F91;
        Wed,  1 Dec 2021 22:57:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1638399421; bh=eTXEvigX2GVG5L2ru3lby/E+t5W6fFoFwv/vQONw3cM=;
        h=From:To:Cc:Subject:Date:From;
        b=dznbAO5FlPpOrNSvFavHD9u5wuw+NoY0UV13XEJlVolKd5Jrg3cyI7nqLg5cdoT+M
         TUXVo47sHf2M0ypoVEo//2bKOekdh0NYn5sA/FC13yZ1CzZ031D6cauc7OGmz48CiR
         azWR/P4/Kl+O7bVq3kHdeN3x1ow+/AOOcmcqVA2Vo7LjisQ3Qga1x3Zyt+txfwKHFF
         h82Ck6RjMQN5elZoK/pyrGMEXftVex9eKRNT5i5NtmTw0HGpdKjYiP7fgku3NB0fd7
         4CxO14LdqziC0FeIy0MJJC1vyYlROgDCiQm/8ibuzBpBaI51IgRBMNzgo24lQqeCqc
         0oCnOJ/VeirTg==
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        laurent.pinchart@ideasonboard.com, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, mchehab@kernel.org
Subject: [PATCH v3 0/2] media: videobuf2: make sure bytesused is smaller than the buffer size
Date:   Thu,  2 Dec 2021 00:56:49 +0200
Message-Id: <20211201225651.29830-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a WARN_ON_ONCE in vb2_set_plane_payload if bytesused is bigger than length
and clamp the bytesused to length.
Also change places where bytesused is set directly with that function.
This help find/eliminate possible buffer overflow.

changes since v2:
* Fix compilations issues on drivers/staging/media/meson/vdec/vdec_helpers.c
* clamp the bytesused to the buffer length if it is bigger
* update subject of second commit WARN_ON -> WARN_ON_ONCE

changes since v1:
* replace WARN_ON with WARN_ON_ONCE
* add inline doc

Dafna Hirschfeld (2):
  media: replace setting of bytesused with vb2_set_plane_payload
  media: videobuf2: add WARN_ON_ONCE if bytesused is bigger than buffer
    length

 drivers/media/platform/allegro-dvt/allegro-core.c  |  2 +-
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 10 +++++-----
 drivers/media/test-drivers/vicodec/vicodec-core.c  |  2 +-
 drivers/media/usb/go7007/go7007-driver.c           |  2 +-
 drivers/staging/media/meson/vdec/vdec_helpers.c    | 10 +++++-----
 include/media/videobuf2-core.h                     |  9 ++++++++-
 6 files changed, 21 insertions(+), 14 deletions(-)

-- 
2.17.1

