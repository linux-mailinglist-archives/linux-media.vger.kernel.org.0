Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29EA01CD4E7
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2020 11:29:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgEKJ3o (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 May 2020 05:29:44 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:44549 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725790AbgEKJ3o (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 May 2020 05:29:44 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Y4kmj9o81hEkrY4knjFozN; Mon, 11 May 2020 11:29:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1589189382; bh=xFvyyrWYxH6Qmyya4EjMcLwgC/PXvwYMJBP6pqQh8iQ=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=JtOdx00O/Typm6wUT0EgDt12T4rlIMRp8lBNpqG/0XXvx6te5ChzNT1XcD+7vw3Jp
         097K1O9oAPjvULkDZgQKbixPhzbF2SjnUNstaWDT5YzRoBmrwqzCh4bgt9b+0Kqn9l
         eUAg+VdTh2Teuqb67SILhKbXTL0y67dA/PaKE/LoJTO0UIIAVjsAbARU1eKDWe9OBH
         B+4u3i7Sji8lCE7/9UWxAGGmy00FsGujuvVZaLvdKRvf9yKTmxDMTSOTJscFQaaeqR
         OfiCrDyDRcbVlY9vU1tcd1qqWuOodHSMrJQlspodDEFq1BwsRdnA16e56IqfCv3cui
         G3GyKrBImLDKQ==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.8] Report camera properties
Message-ID: <6ad6a156-8a13-d093-b554-7edb1012ad2f@xs4all.nl>
Date:   Mon, 11 May 2020 11:29:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLtLn8bL6mmbeTdkJT8T35otQkl7hocAPQkTseDid07ZFoMfRDy27QxkZUmP+RmNpc5gphFyoTkO4wgyzzrLv7PpHp24q5ZBKgOYyZJGhN4OC11D5UAH
 617F9LTkUVbgcbIkHdPayh2dCEPpqcT6WBCGLYdtfGjEcvRY42Wn0T5blIraLU2kYEaSDTtN09XPZWfHS8hkWeY/EAprdnVt5dqpcMdLiMid17NTb9NszfZ5
 krdXp3ex+XGikH7J/Ws8ELlEelTFpJjJuFBUNYFjYoTAfzf7hxp/crVz9AC2bw9NBi6NdA9aNiFBHSGyZKEd8w==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This merges v11 of this patch series:

https://patchwork.linuxtv.org/cover/63700/

with the exception of the last patch ("dt-bindings: Add media properties")
which is independent of the other patches and which needs more work.

Regards,

	Hans

The following changes since commit 5b9f8e4ac9473962fa0e824fd1f04138600d459d:

  media: ipu3.rst: fix a build warning (2020-05-06 14:49:41 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.8h

for you to fetch changes up to e1bf50999c26223bba8df1fcd595ba11f9aa0948:

  media: i2c: imx219: Parse and register properties (2020-05-11 09:24:47 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Jacopo Mondi (12):
      dt-bindings: video-interfaces: Document 'orientation' property
      dt-bindings: video-interface: Replace 'rotation' description
      media: v4l2-ctrl: Document V4L2_CID_CAMERA_ORIENTATION
      media: v4l2-ctrl: Document V4L2_CID_CAMERA_SENSOR_ROTATION
      media: v4l2-ctrls: Add camera orientation and rotation
      media: v4l2-fwnode: Add helper to parse device properties
      include: v4l2-ctrl: Sort forward declarations
      media: v4l2-ctrls: Sort includes alphabetically
      media: v4l2-ctrls: Add helper to register properties
      media: i2c: ov5670: Parse and register properties
      media: i2c: ov13858: Parse and register properties
      media: i2c: imx219: Parse and register properties

 Documentation/devicetree/bindings/media/video-interfaces.txt | 372 ++++++++++++++++++++++++++++++++++++++++++-
 Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst   | 151 ++++++++++++++++++
 drivers/media/i2c/imx219.c                                   |  12 +-
 drivers/media/i2c/ov13858.c                                  |  13 +-
 drivers/media/i2c/ov5670.c                                   |  14 +-
 drivers/media/v4l2-core/v4l2-ctrls.c                         |  61 ++++++-
 drivers/media/v4l2-core/v4l2-fwnode.c                        |  42 +++++
 include/media/v4l2-ctrls.h                                   |  34 +++-
 include/media/v4l2-fwnode.h                                  |  47 ++++++
 include/uapi/linux/v4l2-controls.h                           |   7 +
 10 files changed, 738 insertions(+), 15 deletions(-)
