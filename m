Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 362C12F68EB
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 19:08:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728462AbhANSF1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 13:05:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbhANSF0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 13:05:26 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587D0C061794;
        Thu, 14 Jan 2021 10:05:05 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id E11481F45C6D
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org, hans.verkuil@cisco.com,
        kernel@collabora.com, linux-kernel@vger.kernel.org,
        tfiga@chromium.org
Subject: [PATCH 0/3] v4l2 framework minor improvements
Date:   Thu, 14 Jan 2021 15:01:46 -0300
Message-Id: <20210114180149.1755892-1-helen.koike@collabora.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just minor things.
Add capabilities to v4l_print_create_buffers(), clarify docs and remove
a redundant check.

Helen Koike (3):
  media: v4l2-ioctl: print capabilities in v4l_print_create_buffers()
  media: videodev2.h: clarify v4l2_pix_format_mplane.sizeimage docs when
    to set to zero
  media: videobuf2-v4l2: remove redundant error test

 drivers/media/common/videobuf2/videobuf2-v4l2.c | 5 -----
 drivers/media/v4l2-core/v4l2-ioctl.c            | 6 +++---
 include/uapi/linux/videodev2.h                  | 1 +
 3 files changed, 4 insertions(+), 8 deletions(-)

-- 
2.29.2

