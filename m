Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD0DDEF39
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2019 16:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbfJUOSb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Oct 2019 10:18:31 -0400
Received: from gofer.mess.org ([88.97.38.141]:59693 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727322AbfJUOSa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Oct 2019 10:18:30 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 961DBC6345; Mon, 21 Oct 2019 15:18:29 +0100 (BST)
Date:   Mon, 21 Oct 2019 15:18:29 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR v5.5] imon & SPDX patches
Message-ID: <20191021141829.GA28605@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

Just two tiny patches this week, that's all there is.

Thanks,
Sean

The following changes since commit 6ce1d376d33eb775331b36a38afa28f9f08945e3:

  media: docs-rst: Document m2m stateless video decoder interface (2019-10-21 07:43:45 -0300)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.5iii

for you to fetch changes up to ea1d4160406bdea622d552edf93d96be2cc7906d:

  media: imon: invalid dereference in imon_touch_event (2019-10-21 11:50:32 +0100)

----------------------------------------------------------------
5.5 III

----------------------------------------------------------------
Nishad Kamdar (1):
      media: tuners: Use the correct style for SPDX License Identifier

Sean Young (1):
      media: imon: invalid dereference in imon_touch_event

 drivers/media/rc/imon.c                   | 3 +--
 drivers/media/tuners/tuner-xc2028-types.h | 2 +-
 drivers/media/tuners/tuner-xc2028.h       | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)
