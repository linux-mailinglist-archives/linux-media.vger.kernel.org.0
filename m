Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A5723D980
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 12:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729385AbgHFKjT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 06:39:19 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59268 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729341AbgHFKfv (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 06:35:51 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 7D5C22993C9
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v3 0/5] media: staging: rkisp1: document rkisp1-common.h
Date:   Thu,  6 Aug 2020 12:34:12 +0200
Message-Id: <20200806103417.18154-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset extends the documentation of rkisp1-common.h, together with some cleanup patches.
It adds a line description of every struct and every field, and also
a line description of every lock.

change since v2:

first 3 patches were already accepted and are not in this version.

patch 5 from v2 was removed

in patch 6 - add document field 'yuv_seq' in rkisp1_isp_mbus_info

Dafna Hirschfeld (5):
  media: staging: rkisp1: don't define vaddr field in rkisp1_buffer as
    an array
  media: staging: rkisp1: unify (un)register functions to have the same
    parameters
  media: staging: rkisp1: remove declaration of unimplemented function
    'rkisp1_params_isr_handler'
  media: staging: rkisp1: group declaration of similar functions
    together
  media: staging: rkisp1: improve documentation of rkisp1-common.h

 drivers/staging/media/rkisp1/TODO            |   1 -
 drivers/staging/media/rkisp1/rkisp1-common.h | 265 ++++++++++++++-----
 drivers/staging/media/rkisp1/rkisp1-dev.c    |  15 +-
 drivers/staging/media/rkisp1/rkisp1-isp.c    |   5 +-
 drivers/staging/media/rkisp1/rkisp1-params.c |  14 +-
 drivers/staging/media/rkisp1/rkisp1-stats.c  |  14 +-
 6 files changed, 226 insertions(+), 88 deletions(-)

-- 
2.17.1

