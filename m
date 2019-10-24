Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BEB4E2D79
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 11:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390910AbfJXJfh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 05:35:37 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:49120 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390186AbfJXJfh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 05:35:37 -0400
Received: from localhost.localdomain (2a02-8429-8174-0401-9a7f-8789-6b2c-098e.rev.sfr.net [IPv6:2a02:8429:8174:401:9a7f:8789:6b2c:98e])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 78DB227D7A2;
        Thu, 24 Oct 2019 10:35:36 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        skhan@linuxfoundation.org, hverkuil@xs4all.nl,
        kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH v4 0/2] upon streaming, check that the pipeline starts with a source entity
Date:   Thu, 24 Oct 2019 11:35:23 +0200
Message-Id: <20191024093525.10059-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The first patch in this patchset moves the dev field of each
entity struct to the common struct vimc_ent_device, this is
used by the first and the second patches to have access to 'dev'
in the streamer and replace pr_err with dev_err.

The second patch was first sent alone, then it was sent again
as part of the patchset
"media: vimc: use configfs in order to configure devices topologies"
It fixes a crashing bug when the pipeline does not start with a
source entity.

Fixes from v3:
- set the error value to -EINVAL when the vimc entity pointer
is not found in vimc_streamer_pipeline_init
- have more precise error messages in vimc_streamer_pipeline_init

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
 drivers/media/platform/vimc/vimc-streamer.c | 29 ++++++++++++++-------
 7 files changed, 53 insertions(+), 31 deletions(-)

-- 
2.20.1

