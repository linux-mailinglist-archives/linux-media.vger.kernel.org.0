Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7B221F3F45
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 17:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730108AbgFIP3H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jun 2020 11:29:07 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49918 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728822AbgFIP3G (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jun 2020 11:29:06 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id E054F2A3B13
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v2 0/4] media: staging: rkisp1: bugs fixes and vars renames
Date:   Tue,  9 Jun 2020 17:28:21 +0200
Message-Id: <20200609152825.24772-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The first two patches in this patchset are two bug fixes related to the enumeration and
settings of the sink format of the resizer entity.
The two other patches are renaming of macros and the variables.

changes from v1:
- added "Fixes: 56e3b29f9f6b "media: staging: rkisp1: add streaming paths"
to the commit log of the first two patches.
- added two patches. One patch rename the macros "RKISP1_DIR_*"
to "RKISP1_ISP_SD_*", another that rename the field 'direction'
in 'struct rkisp1_isp_mbus_info' to 'isp_pads_flags'

Dafna Hirschfeld (4):
  media: staging: rkisp1: rsz: supported formats are the isp's src
    formats, not sink formats
  media: staging: rkisp1: rsz: set default format if the given format is
    not RKISP1_DIR_SRC
  media: staging: rkisp1: rename macros 'RKISP1_DIR_*' to
    'RKISP1_ISP_SD_*'
  media: staging: rkisp1: rename the field 'direction' in
    'rkisp1_isp_mbus_info' to 'isp_pads_flags'

 drivers/staging/media/rkisp1/rkisp1-common.h  |  6 ++-
 drivers/staging/media/rkisp1/rkisp1-isp.c     | 50 +++++++++----------
 drivers/staging/media/rkisp1/rkisp1-resizer.c |  6 +--
 3 files changed, 31 insertions(+), 31 deletions(-)

-- 
2.17.1

