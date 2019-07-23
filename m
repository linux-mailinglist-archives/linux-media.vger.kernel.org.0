Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F9077146D
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 10:53:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387527AbfGWIxR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 04:53:17 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:43633 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730819AbfGWIxR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 04:53:17 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id pqXohu5buLqASpqXrhIBTG; Tue, 23 Jul 2019 10:53:15 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v5.4] cec: use cec_notifier_cec_adap_(un)register
Message-ID: <57a8703f-f861-b300-33ca-b440a592c121@xs4all.nl>
Date:   Tue, 23 Jul 2019 10:53:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKn/8NOpHHuS+858Ws5JvX/ZJwmgXOR+kP6Dx2KeScp/C67N53jPleZ+TW9ZSPweKV4C+9K76HS2QdF0KEV3TYzU6+DOtYNoXQjK3VryLSdphiG+/pYf
 Z4JE6KSdR09Rh4f+ufsUQXZlwLKBBOuN2nbHp3iG7TvB2Bwdd2eRz+taB4zKzVLcXkjo+6KPMpvbvw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 66193b24514c91aeda88da744554b2665471aeae:

  media: dvbsky: add support for Mygica T230C v2 (2019-07-22 15:33:30 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-cec-conn-media

for you to fetch changes up to 64e55689233b75f400d1d3d658f932804da2b369:

  tegra-cec: use cec_notifier_cec_adap_(un)register (2019-07-23 10:34:37 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (6):
      meson/ao-cec: use cec_notifier_cec_adap_(un)register
      cros-ec-cec: use cec_notifier_cec_adap_(un)register
      seco-cec: use cec_notifier_cec_adap_(un)register
      s5p-cec: use cec_notifier_cec_adap_(un)register
      stih-cec: use cec_notifier_cec_adap_(un)register
      tegra-cec: use cec_notifier_cec_adap_(un)register

 drivers/media/platform/cros-ec-cec/cros-ec-cec.c | 69 +++++++++++++++++++++++++++++-----------------------
 drivers/media/platform/meson/ao-cec-g12a.c       | 48 ++++++++++++++++++------------------
 drivers/media/platform/meson/ao-cec.c            | 44 +++++++++++++++------------------
 drivers/media/platform/s5p-cec/s5p_cec.c         | 23 +++++++++++-------
 drivers/media/platform/seco-cec/seco-cec.c       | 55 ++++++++++++++++++++++-------------------
 drivers/media/platform/sti/cec/stih-cec.c        | 32 +++++++++++++++---------
 drivers/media/platform/tegra-cec/tegra_cec.c     | 35 +++++++++++++-------------
 7 files changed, 163 insertions(+), 143 deletions(-)
