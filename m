Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF970E3552
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 16:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405487AbfJXOQA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 10:16:00 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53012 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbfJXOP7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 10:15:59 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 2091D2905AC
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v5 0/2] upon streaming, check that the pipeline starts with a source entity
Date:   Thu, 24 Oct 2019 16:15:52 +0200
Message-Id: <20191024141554.15248-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The first patch in this patchset moves the dev field of each
entity struct to the common struct vimc_ent_device.

The second patch fixes a crashing bug when the pipeline does not start with a
source entity.

Fixes from v4:

- NO changes in the first patch since v4

- The function vimc_streamer_pipeline_init now gets the media_entity
as parameter and I changed the while loop to "while(ent)" since this the
valid behaviour: loop until the source of the pipeline.
All other cases should return from the while loop with "goto err".
Also, after calling v4l2_subdev_call, if  'ret' is ENOIOCTCMD then
it is set to 0 to make sure that ret is 0 when no error occurred.

Dafna Hirschfeld (2):
  media: vimc: move the dev field of each entity to vimc_ent_dev
  media: vimc: upon streaming, check that the pipeline starts with a
    source entity

 drivers/media/platform/vimc/vimc-capture.c  |  7 +-
 drivers/media/platform/vimc/vimc-common.c   | 10 +++
 drivers/media/platform/vimc/vimc-common.h   |  7 ++
 drivers/media/platform/vimc/vimc-debayer.c  | 15 ++---
 drivers/media/platform/vimc/vimc-scaler.c   | 11 ++--
 drivers/media/platform/vimc/vimc-sensor.c   |  5 +-
 drivers/media/platform/vimc/vimc-streamer.c | 73 +++++++++++++--------
 7 files changed, 78 insertions(+), 50 deletions(-)

-- 
2.20.1

