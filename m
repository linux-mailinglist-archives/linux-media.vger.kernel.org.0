Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5152D1C5733
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 15:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729087AbgEENlV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 May 2020 09:41:21 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42310 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729070AbgEENlV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 May 2020 09:41:21 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id ED3432A085A
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        gustavo.padovan@collabora.com,
        Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v3 0/3] media: rkvdec: Add a VP9 backend
Date:   Tue,  5 May 2020 10:41:07 -0300
Message-Id: <20200505134110.3435-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.26.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Third iteration of the VP9 stateless codec uAPI, plus
support for Rockchip VDEC.

This series addresses an issue I found while testing,
not sure how it slipped before! See patch 1.

Keep in mind the same issue should likely be fixed
on Hantro and Cedrus. We can create a helper for it
as a follow-up.

Other than that, minor documentation and smatch-detected
warnings are fixed.

Thanks!
Ezequiel

Changelog
---------

v3:

* Fix documentation issues found by Hans.
* Fix smatch detected issues as pointed out by Hans.
* Added patch to fix wrong bytesused set on .buf_prepare.

v2:

* Documentation style issues pointed out by Nicolas internally.
* s/VP9_PROFILE_MAX/V4L2_VP9_PROFILE_MAX/
* Fix wrong kfree(ctx).
* constify a couple structs on rkvdec-vp9.c

Boris Brezillon (2):
  media: uapi: Add VP9 stateless decoder controls
  media: rkvdec: Add the VP9 backend

Ezequiel Garcia (1):
  media: rkvdec: Fix .buf_prepare

 .../userspace-api/media/v4l/biblio.rst        |   10 +
 .../media/v4l/ext-ctrls-codec.rst             |  581 ++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          |  242 +++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    1 +
 drivers/staging/media/rkvdec/Makefile         |    2 +-
 drivers/staging/media/rkvdec/rkvdec-vp9.c     | 1577 +++++++++++++++++
 drivers/staging/media/rkvdec/rkvdec.c         |   66 +-
 drivers/staging/media/rkvdec/rkvdec.h         |    6 +
 include/media/v4l2-ctrls.h                    |    1 +
 include/media/vp9-ctrls.h                     |  510 ++++++
 10 files changed, 2991 insertions(+), 5 deletions(-)
 create mode 100644 drivers/staging/media/rkvdec/rkvdec-vp9.c
 create mode 100644 include/media/vp9-ctrls.h

-- 
2.26.0.rc2

