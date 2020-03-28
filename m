Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B07FF196450
	for <lists+linux-media@lfdr.de>; Sat, 28 Mar 2020 08:53:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgC1HxD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Mar 2020 03:53:03 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40952 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgC1HxD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Mar 2020 03:53:03 -0400
Received: from localhost.localdomain (unknown [IPv6:2a02:810a:1140:6758:90b5:2774:1094:333f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5B6CE28D4DE;
        Sat, 28 Mar 2020 07:53:02 +0000 (GMT)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH 0/5] media: vimc: various fixes
Date:   Sat, 28 Mar 2020 08:52:49 +0100
Message-Id: <20200328075254.4616-1-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Various fixes and improvements for vimc driver.

Patches summary:

patch 1: remove the function vimc_unregister
patch 2: if vimc_add_subdevs fails then the cleanup should be inside the function
patch 3: return the error code if a callback fails instead of NULL
patch 4: fix some typos in the docs
patch 5: adds a struct vimc_cap_type that holds the callbacks of each vimc entity type,
since for each type the set of callbacks is always the same.

Dafna Hirschfeld (5):
  media: vimc: remove the function vimc_unregister
  media: vimc: handle error in vimc_add_subdevs
  media: vimc: keep the error value when adding an entity fails
  media: vimc: fix issues in documentation in vimc-common.h
  media: vimc: add vimc_ent_type struct for the callbacks of entities

 drivers/media/platform/vimc/vimc-capture.c | 10 ++-
 drivers/media/platform/vimc/vimc-common.h  | 53 ++++++-------
 drivers/media/platform/vimc/vimc-core.c    | 90 ++++++++++------------
 drivers/media/platform/vimc/vimc-debayer.c |  9 ++-
 drivers/media/platform/vimc/vimc-scaler.c  |  9 ++-
 drivers/media/platform/vimc/vimc-sensor.c  |  9 ++-
 6 files changed, 93 insertions(+), 87 deletions(-)

-- 
2.17.1

