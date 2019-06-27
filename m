Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03F4057D78
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 09:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbfF0Htz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 03:49:55 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:39347 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725787AbfF0Htz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 03:49:55 -0400
Received: from [192.168.2.10] ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id gPAEhdjJiF85OgPAHhnCdj; Thu, 27 Jun 2019 09:49:53 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.3] Various fixes
Message-ID: <b275f27c-32fd-da99-6cb1-ea8e1a86f2d5@xs4all.nl>
Date:   Thu, 27 Jun 2019 09:49:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDSCOYl4I82Xp8uHMMsqVlAVFsKA9BNbNahRL4u1mvw7gEPt6SBA59plCqApiYCSL7F37Z7xsfSEH9RM9YwNvMKizxVJwUlR5dK67iiXEGAtxbNcQpr6
 mqQc0PvBXd4NM1xmEOm+KnC1CWC+KwI3irjObwCqIMCIfpRVCPWUbpbiXBGil8tUTjne0yDZ7m35rw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Just three patches this time.

Regards,

	Hans

The following changes since commit 86d617d6c79d79288ca608b6fb0a2467b0e8ddbb:

  media: MAINTAINERS: Add maintainers for Media Controller (2019-06-24 15:07:51 -0400)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.3u

for you to fetch changes up to 696b7cfaa9954fa0c91ddf79206aa399bbdea1e1:

  media: allegro: use new v4l2_m2m_ioctl_try_encoder_cmd funcs (2019-06-27 09:41:23 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Bastien Nocera (1):
      doc-rst: Fix typos

Luke Nowakowski-Krijger (1):
      radio-raremono: change devm_k*alloc to k*alloc

Michael Tretter (1):
      media: allegro: use new v4l2_m2m_ioctl_try_encoder_cmd funcs

 Documentation/media/uapi/rc/rc-tables.rst        | 10 +++++-----
 drivers/media/radio/radio-raremono.c             | 30 +++++++++++++++++++++++-------
 drivers/staging/media/allegro-dvt/allegro-core.c | 22 ++--------------------
 3 files changed, 30 insertions(+), 32 deletions(-)
