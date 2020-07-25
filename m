Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A72E22D892
	for <lists+linux-media@lfdr.de>; Sat, 25 Jul 2020 17:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbgGYPwZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Jul 2020 11:52:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46460 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgGYPwZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Jul 2020 11:52:25 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 183AA296D0C
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Adrian Ratiu <adrian.ratiu@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>, kernel@collabora.com
Subject: [PATCH 0/2] hantro: postproc related fixes
Date:   Sat, 25 Jul 2020 12:52:06 -0300
Message-Id: <20200725155208.897908-1-ezequiel@collabora.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Doing some more extended testing, we found a few
issues when the post-processor is enabled (currently
for color conversion).

The two patches below should fix these issues.

Ezequiel Garcia (2):
  hantro: h264: Get the correct fallback reference buffer
  hantro: postproc: Fix motion vector space allocation

 drivers/staging/media/hantro/hantro_h264.c     | 2 +-
 drivers/staging/media/hantro/hantro_hw.h       | 4 ++--
 drivers/staging/media/hantro/hantro_postproc.c | 4 +++-
 3 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.27.0

