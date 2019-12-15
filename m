Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1001B11F7CA
	for <lists+linux-media@lfdr.de>; Sun, 15 Dec 2019 13:51:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbfLOMvj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 15 Dec 2019 07:51:39 -0500
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:58743 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726101AbfLOMvj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 15 Dec 2019 07:51:39 -0500
Received: from [IPv6:2001:983:e9a7:1:d442:af00:cde4:f6de]
 ([IPv6:2001:983:e9a7:1:d442:af00:cde4:f6de])
        by smtp-cloud8.xs4all.net with ESMTPA
        id gTN1iAhcHTsDegTN2ipPQK; Sun, 15 Dec 2019 13:51:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576414297; bh=qAPRbfLLRId4KYFa1QVbyFl/QqDoDQgrgs1gML5qcWo=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DERbiC2CjUWcim3+dfi3yiX5gQ7ce6hpF2/1sRVqR1lCIEFwsImzw2bSHvpe9gnMq
         Dtu6t5/eSQn9gDwj6aA+PKvbZq4ooykOj44owhZN240dVF1I7mnaLb6s1NqGTlMMAC
         Ahtbn7bNow8PJrF5eewM7YbcHt/kwb12QJQgkwIJGtKrJWqGt0YD1dRG1bEk25a8UQ
         Dk2cgxYMI5wA4KtkqJrGsr2K2NY4CSt3dJ8jK0cLy8j81W4kFo4nAc+3oxEbyYfGq5
         w9JZ0E8atM31qQWNPv0A1bng89jTfamjeL0hYq1khgODQr1XEt8OhW18izGodu+TCV
         gJT808ywtB2pg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.6] vivid touch fixes
Message-ID: <6836d63c-d7ef-9d63-5293-c9af27538fb7@xs4all.nl>
Date:   Sun, 15 Dec 2019 13:51:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPpsdtdvGPToWdymlj6kqkEQQQUwqJz7rTsNTkMHpNJeNL8OTnuMADnJ7JkgYCYLFfD31ki3GTdbjjwSeYwBcsdxeJLbJOdFeTwLpm8TzibisEM1BOD7
 4gonpUFQTsEuWT6M76GE/sbb3YdEFYcoZIimQ1Ydm/5M+3i5328ZlRaiAl8/9o4lhJXbNepk/CaaFiPdcTJWQUW3gL3svomwY9NUn0WA7sRWDhmlF7UXuk9D
 tyHqsYU+zfTxDtxFfJ/YqKl/OtP0HQK+WEbFA4q8N2o=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Three fixes for vivid touch support:

1) field wasn't set properly
2) the multiplanar API wasn't implemented for touch

With these three fixes the test-media test script passes all tests again.

Regards,

	Hans

The following changes since commit da090bf60370c9ad6ede4e76adbf37ce79b84791:

  media: Drop superfluous ioctl PCM ops (2019-12-13 09:33:22 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.6g

for you to fetch changes up to e1a855c5ab8116c506d75693f5c9629fa736c093:

  vivid: support multiplanar touch devices (2019-12-15 13:14:41 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (3):
      vivid: set field to NONE for touch
      v4l2-ioctl.c: allow multiplanar for touch
      vivid: support multiplanar touch devices

 drivers/media/platform/vivid/vivid-core.c       | 45 +++++++++++++++++++++++++++++++++++++++------
 drivers/media/platform/vivid/vivid-touch-cap.c  | 21 ++++++++++++++++++++-
 drivers/media/platform/vivid/vivid-touch-cap.h  |  1 +
 drivers/media/platform/vivid/vivid-vid-common.c |  2 +-
 drivers/media/v4l2-core/v4l2-ioctl.c            |  2 +-
 5 files changed, 62 insertions(+), 9 deletions(-)
