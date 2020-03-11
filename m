Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1F8B181FE6
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 18:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730610AbgCKRrL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 13:47:11 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:33042 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730487AbgCKRrL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 13:47:11 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id A91D02912DA
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH 0/6] hantro: set of small cleanups and fixes
Date:   Wed, 11 Mar 2020 14:42:54 -0300
Message-Id: <20200311174300.19407-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Here's a few patches with some cleanups and fixes.

The main idea here is to address two issues, and while
at it, clean the driver a bit.

The first issue can be found in Patch 1, when the Request
API is used, the CAPTURE buffer should be returned _before_
the OUTPUT buffer, to avoid waking up userspace prematurely.

I noticed this issue while working on the rkvdec driver,
but this time I've decided to tackle it at the core,
in v4l2_m2m_buf_done_and_job_finish().

The second issue is a simple compliance issue, which is solved
by refactoring the driver, dealing with internal set format
properly.

I suspect it's really late for v5.7, but if we are still
in time, that would be lovely.

Thanks,
Ezequiel

Ezequiel Garcia (6):
  v4l2-mem2mem: return CAPTURE buffer first
  hantro: Set buffers' zeroth plane payload in .buf_prepare
  hantro: Use v4l2_m2m_buf_done_and_job_finish
  hantro: Remove unneeded hantro_dec_buf_finish
  hantro: Move H264 motion vector calculation to a helper
  hantro: Refactor for V4L2 API spec compliancy

 drivers/media/v4l2-core/v4l2-mem2mem.c     |  11 +-
 drivers/staging/media/hantro/hantro.h      |   4 -
 drivers/staging/media/hantro/hantro_drv.c  |  37 ++-----
 drivers/staging/media/hantro/hantro_hw.h   |  31 ++++++
 drivers/staging/media/hantro/hantro_v4l2.c | 111 +++++++++++----------
 5 files changed, 108 insertions(+), 86 deletions(-)

-- 
2.25.0

