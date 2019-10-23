Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1007E13D6
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2019 10:15:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390034AbfJWIPz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Oct 2019 04:15:55 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:36845 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727574AbfJWIPz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Oct 2019 04:15:55 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id NBo6iLM9pHfodNBo9izMYy; Wed, 23 Oct 2019 10:15:53 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Arthur Moraes do Lago <arthurmoraeslago@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.5] vimc fixes and enhancements
Message-ID: <a4f86608-3ad9-a57b-e399-ed3f1078a0ab@xs4all.nl>
Date:   Wed, 23 Oct 2019 10:15:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLEAmcAYYiolEfTDcinZvQTTaVsByHdetaBguVnA4IZxjgY+IEXNzOKlA+Hsm8OAPMeG+65HDzcva/7M+rsk6y0hZlfMVk10cdcKYS/91DdCblRZ4AQ/
 beaR01w2O519khEK2Vuh5iTmK3MPua2AO4hKF18MHbsdUc3g7eZwA7TnKd0aRq5SaH8ARqA4ZMtAynY6EkhkPeMgusVn8XO3hkgsRWjAc2GQJumfvf4SkvbL
 5nqjMQIZcezThVitnzeA4R4mIAOUIUFqf+tboLa3fvS40wr1M6OcDaYL6tbjYCK7
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 6ce1d376d33eb775331b36a38afa28f9f08945e3:

  media: docs-rst: Document m2m stateless video decoder interface (2019-10-21 07:43:45 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5m

for you to fetch changes up to aed6e513ad8207c7a8bfbe420535c9505cd27131:

  media: vimc: Implement debayer control for mean window size (2019-10-23 09:36:39 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Arthur Moraes do Lago (1):
      media: vimc: Implement debayer control for mean window size

Dafna Hirschfeld (10):
      media: vimc: initialize vim entity pointers to NULL
      media: vimc: cleanup code that assigns entity in entities array
      media: vimc: sen: register subdevice only after initialization
      media: vimc: move media_entity_cleanup to release callbacks
      media: vimc: remove the helper function vimc_ent_sd_unregister
      media: vimc: remove EXPORT_SYMBOL_GPL declarations
      media: vimc: common: remove unused function 'vimc_pipeline_s_stream'
      media: vimc: remove unused struct declaration vimc_platform_data
      media: vimc: embed the pads of entities in the entities' structs
      media: vimc: move the dev field of each entity to vimc_ent_dev

 Documentation/media/v4l-drivers/vimc.rst    |  10 +-----
 drivers/media/platform/vimc/vimc-capture.c  |  26 +++++---------
 drivers/media/platform/vimc/vimc-common.c   |  75 ++-------------------------------------
 drivers/media/platform/vimc/vimc-common.h   |  74 +++++----------------------------------
 drivers/media/platform/vimc/vimc-core.c     |  11 +++---
 drivers/media/platform/vimc/vimc-debayer.c  | 107 +++++++++++++++++++++++++++++++++++++++++++-------------
 drivers/media/platform/vimc/vimc-scaler.c   |  22 ++++++------
 drivers/media/platform/vimc/vimc-sensor.c   |  34 +++++++++---------
 drivers/media/platform/vimc/vimc-streamer.c |   5 ++-
 9 files changed, 138 insertions(+), 226 deletions(-)
