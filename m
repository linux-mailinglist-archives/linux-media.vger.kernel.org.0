Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C473B189CBF
	for <lists+linux-media@lfdr.de>; Wed, 18 Mar 2020 14:21:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbgCRNVs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Mar 2020 09:21:48 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44446 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgCRNVs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Mar 2020 09:21:48 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 60E0429661A
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
        Rob Herring <robh@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 0/8] hantro: set of small cleanups and fixes
Date:   Wed, 18 Mar 2020 10:21:00 -0300
Message-Id: <20200318132108.21873-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

Cleanups and fixes, second iteration.

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

Changes v2:

* Fix compile warning introduced by patch 6.

* I'm adding two additional patches this time.
  Patch 7 converts the binding to json-schema,
  and patch 8 puts linux-rockchip mailing list in MAINTAINERS. 

Thanks,
Ezequiel

Ezequiel Garcia (8):
  v4l2-mem2mem: return CAPTURE buffer first
  hantro: Set buffers' zeroth plane payload in .buf_prepare
  hantro: Use v4l2_m2m_buf_done_and_job_finish
  hantro: Remove unneeded hantro_dec_buf_finish
  hantro: Move H264 motion vector calculation to a helper
  hantro: Refactor for V4L2 API spec compliancy
  dt-bindings: rockchip-vpu: Convert bindings to json-schema
  hantro: Add linux-rockchip mailing list to MAINTAINERS

 .../bindings/media/rockchip-vpu.txt           |  43 -------
 .../bindings/media/rockchip-vpu.yaml          |  82 +++++++++++++
 MAINTAINERS                                   |   3 +-
 drivers/media/v4l2-core/v4l2-mem2mem.c        |  11 +-
 drivers/staging/media/hantro/hantro.h         |   7 +-
 drivers/staging/media/hantro/hantro_drv.c     |  37 ++----
 drivers/staging/media/hantro/hantro_hw.h      |  31 +++++
 drivers/staging/media/hantro/hantro_v4l2.c    | 111 +++++++++---------
 8 files changed, 194 insertions(+), 131 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/rockchip-vpu.txt
 create mode 100644 Documentation/devicetree/bindings/media/rockchip-vpu.yaml

-- 
2.25.0

