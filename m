Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE91932C744
	for <lists+linux-media@lfdr.de>; Thu,  4 Mar 2021 02:10:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348056AbhCDAbX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Mar 2021 19:31:23 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:41967 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238243AbhCCOvH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Mar 2021 09:51:07 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id HSg9lajYLqY4WHSgClTTj4; Wed, 03 Mar 2021 15:40:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614782449; bh=34QjDGxShPeyOd1iqVXoK3B0Qft1fHOivLjw9CD1wBk=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=a9r1xilzvJ7TOCbqL4GBhlim5PG6LYxRtKQnn06aK1lL1FVvlr6zO6MnZ46rsmzJh
         td8ZfE32qnq/BIDgw/R+oU/euwtk7gscGyjtOfQ4ufD79e7ucJWZqhZnRQJ2xuQbdZ
         bAyoPM41IwyoH88J6fmXhV+dxY63l1nJ3hPGc+R22RL4ATPMmTN2Suz5b1YupkpBY3
         0WqU5dKnsgZbSXmnj7KynPaBYb48QfRe8zWOa39agMi98XLVNr+YQV/XopeQTPJzSO
         /u4T3i+g5jL012zu1bLlxKFM+0yKXivfPiScYXy+Z05lbhBWRhj1WtXgHs0qHcekLV
         5Kv0aIUCoTRFA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.12] Various fixes
Message-ID: <af2a4322-7194-94ca-062e-e19de9b81f7c@xs4all.nl>
Date:   Wed, 3 Mar 2021 15:40:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfI9G2Sls15S0msiRF21rmAvIO9jq0CHLwfAAfRjVR/tiqFhJrPgDlRu0UVEuJoh+PAxJE4wfva1SjkNqMgVNjm/nwEBUJF5zdrNE1UJGa3pmITXysGIg
 TikEyNRW9omyC7NfBcwIu6ig/Za3M+zFNGBNNGF8W4mOG87uMWd8nTrCH+FRCxE/DHyK+U+4Q3/TeaHfsRDqsycFhnL80mtuu3Y=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.12a

for you to fetch changes up to c30a2a48371d728fbb5d1c59da57f9375b431869:

  media: rkisp1: params: fix wrong bits settings (2021-03-03 15:33:52 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Biju Das (2):
      media: v4l: vsp1: Fix bru null pointer access
      media: v4l: vsp1: Fix uif null pointer access

Dafna Hirschfeld (1):
      media: rkisp1: params: fix wrong bits settings

Maxim Mikityanskiy (1):
      media: usbtv: Fix deadlock on suspend

 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 1 -
 drivers/media/platform/vsp1/vsp1_drm.c                 | 6 +++---
 drivers/media/usb/usbtv/usbtv-audio.c                  | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)
