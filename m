Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4D52DBDB8
	for <lists+linux-media@lfdr.de>; Wed, 16 Dec 2020 10:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgLPJcd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Dec 2020 04:32:33 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:41527 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726189AbgLPJcc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Dec 2020 04:32:32 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id pT9ukOhErynrEpT9ykpZG5; Wed, 16 Dec 2020 10:31:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1608111110; bh=RUuScSR7psjoUAve/Mf5NhASfRK/v40HTdk9VlHCDKw=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=nZlQn927HXcZPE2ScpHN/a/Sjqy+RTcGRVtth4lCVqMb/CWAKutFoJgV8I3hL/dSO
         YbHosJ656xOClLBHaCq4Z58VZ2ezljTBaZCQle6DvcvXVMrTr/OwoRDXVB3jgYkTrW
         lkofcV3TawRKgAgXorgZkR7hJ4bZLoxZ4Jm7S/VO3Cdp1dGg7fzh/jm3OvZq1KhkZ7
         pOwUoGwCZsArA+zBtGKJXVHsUszWk5qxNSkMQ+Psk2aYtmVV+x5i7ZXHLVTcHQM5sx
         56TVt82Q4toST71xmYvaq1VS+zI9r1HOmV5kuWEQVvk36cmdGx6sE46lDwStF5ecRR
         EamMjMBxHYKLQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Alexandre Courbot <acourbot@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.12] Poll fixes
Message-ID: <9a344c9b-54b8-6716-00ad-18464fdd2dec@xs4all.nl>
Date:   Wed, 16 Dec 2020 10:31:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfJQC5/0WajXRteYUMOJZfNlIuLC9W3U+jO/HIsUx05pWHe+0qGlbfDOAc+mrijlCHIrqc1igHYlxpgl6SEkYaiXJeKshFJdmQHPxiUSY2bU7g+FWF+ky
 8tLjW5W5JMFt0AufX4C7XKRkhFsuW7tdhamOddAGx4eK7jxXpU0aT9VfyicToBSMnJubgbQ1eeGyv5hnq5m3dJelpdWo/PsBo2FGpj3h+w5Y0uNLt1D9OtaZ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes various subtle corner cases with poll().

Regards,

	Hans

The following changes since commit fab0fca1da5cdc48be051715cd9787df04fdce3a:

  Merge tag 'media/v5.11-1' of git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media (2020-12-14 11:47:37 -0800)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.12c

for you to fetch changes up to fd6f2a6f84c80fd5bc066c8837f4611663724a8f:

  cec: add EPOLLPRI in poll() when dev is unregistered (2020-12-16 10:24:39 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alexandre Courbot (2):
      media: videobuf2: always call poll_wait() on queues
      media: v4l2-mem2mem: always call poll_wait() on queues

Hans Verkuil (4):
      v4l2-dev/event: add v4l2_event_wake_all()
      vivid: call v4l2_event_wake_all() on disconnect
      v4l2-dev: add EPOLLPRI in v4l2_poll() when dev is unregistered
      cec: add EPOLLPRI in poll() when dev is unregistered

 drivers/media/cec/core/cec-api.c                |  2 +-
 drivers/media/common/videobuf2/videobuf2-core.c | 11 +++++++++--
 drivers/media/test-drivers/vivid/vivid-ctrls.c  | 38 ++++++++++++++++++--------------------
 drivers/media/v4l2-core/v4l2-dev.c              | 15 ++++++++++-----
 drivers/media/v4l2-core/v4l2-event.c            | 17 +++++++++++++++++
 drivers/media/v4l2-core/v4l2-mem2mem.c          | 15 ++++++++++++---
 include/media/v4l2-event.h                      | 13 +++++++++++--
 7 files changed, 78 insertions(+), 33 deletions(-)
