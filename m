Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4CE23DEA1
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730387AbgHFR2H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:28:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729815AbgHFRBX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 13:01:23 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250E6C06138F
        for <linux-media@vger.kernel.org>; Thu,  6 Aug 2020 04:55:44 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id EC441298808
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com, tfiga@chromium.org
Subject: [PATCH v2 0/4] rkisp1: improve uapi
Date:   Thu,  6 Aug 2020 13:50:29 +0200
Message-Id: <20200806115033.32475-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patchset groups 4 patches for the rkisp1 uapi that were previously sent separately.

change since v2:
* the patch "media: staging: rkisp1: comment each define (RKISP1_CIF_ISP_MODULE_*), explaining what the abbreviation means"
is merged into the patch "media: staging: rkisp1: improve documentation in file rkisp1-config.h"

In patch "media: staging: rkisp1: improve documentation in file rkisp1-config.h":
- remove references to REF_1,
- add documentation to rkisp1_cif_isp_lsc_config
- remove redundant newlines

Dafna Hirschfeld (4):
  media: staging: rkisp1: replace 9 coeff* fields with a 3x3 array
  media: staging: rkisp1: replace 3 fields 'ct_offset_*' with one array
  media: staging: rkisp1: rename RKISP1_CIF_ISP_STAT_AFM_FIN to
    RKISP1_CIF_ISP_STAT_AFM
  media: staging: rkisp1: improve documentation in file rkisp1-config.h

 drivers/staging/media/rkisp1/rkisp1-params.c  |  24 ++-
 drivers/staging/media/rkisp1/rkisp1-stats.c   |   2 +-
 .../staging/media/rkisp1/uapi/rkisp1-config.h | 149 +++++++++++++-----
 3 files changed, 120 insertions(+), 55 deletions(-)

-- 
2.17.1

