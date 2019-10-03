Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECFAC9C97
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 12:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729299AbfJCKpD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 06:45:03 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39386 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728919AbfJCKpD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 06:45:03 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id BAF1328FA8E
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v2 0/5] media: vimc: bug fixes related to memory management
Date:   Thu,  3 Oct 2019 12:44:04 +0200
Message-Id: <20191003104409.15756-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changes since v1:
fixes due to Helen Koike and Andrzej Pietrasiewicz's comments (thanks for the review!):

 - split the first patch into two patches, one that fixes the bug and one cleanup patch
 - fix allignment issue
 - add a last patch that removes vimc_ent_sd_unregister since it is not needed anymore

Dafna Hirschfeld (5):
  media: vimc: initialize vim entity pointers to NULL
  media: vimc: cleanup code that assigns entity in entities array
  media: vimc: sensor: register subdevice only after initialization
  media: vimc: move media_entity_cleanup to release callbacks
  media: vimc: remove the helper function vimc_ent_sd_unregister

 drivers/media/platform/vimc/vimc-capture.c |  2 +-
 drivers/media/platform/vimc/vimc-common.c  |  6 ------
 drivers/media/platform/vimc/vimc-common.h  | 12 -----------
 drivers/media/platform/vimc/vimc-core.c    | 11 ++++-------
 drivers/media/platform/vimc/vimc-debayer.c |  3 ++-
 drivers/media/platform/vimc/vimc-scaler.c  |  3 ++-
 drivers/media/platform/vimc/vimc-sensor.c  | 23 +++++++++++-----------
 7 files changed, 21 insertions(+), 39 deletions(-)

-- 
2.20.1

