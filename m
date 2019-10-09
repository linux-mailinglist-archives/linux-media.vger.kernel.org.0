Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 243AED1342
	for <lists+linux-media@lfdr.de>; Wed,  9 Oct 2019 17:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730674AbfJIPxk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Oct 2019 11:53:40 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34962 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729883AbfJIPxk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Oct 2019 11:53:40 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 89E93290475
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, andre.almeida@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v3 0/2] media: vimc: upon streaming, check that the pipeline starts with a source entity
Date:   Wed,  9 Oct 2019 17:53:13 +0200
Message-Id: <20191009155315.14280-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The first patch in this patchset moves the dev field of each
entity struct to the common sturct vimc_ent_device, this is
used by the first and the second patch to have access to 'dev'
in the streamer and replace pr_err with dev_err.

The second patch was first sent alone, then it was sent again
as part of the patchset
"media: vimc: use configfs in order to configure devices topologies"
I send it now again since it is not directly related to that patchset
and it fixes a crashing bug.

It has the following fixes due to Shuah Khan's comments:
- add the panic message to the commit message
- move the function vimc_is_source to the vimc-common.c file
- replace pr_err with dev_err

Dafna Hirschfeld (2):
  media: vimc: move the dev field of each entity to vimc_ent_dev
  media: vimc: upon streaming, check that the pipeline starts with a
    source entity

 drivers/media/platform/vimc/vimc-capture.c  |  7 +++--
 drivers/media/platform/vimc/vimc-common.c   | 10 +++++++
 drivers/media/platform/vimc/vimc-common.h   |  7 +++++
 drivers/media/platform/vimc/vimc-debayer.c  | 15 +++++------
 drivers/media/platform/vimc/vimc-scaler.c   | 11 ++++----
 drivers/media/platform/vimc/vimc-sensor.c   |  5 ++--
 drivers/media/platform/vimc/vimc-streamer.c | 29 ++++++++++++---------
 7 files changed, 51 insertions(+), 33 deletions(-)

-- 
2.20.1

