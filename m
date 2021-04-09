Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 573D2359C8B
	for <lists+linux-media@lfdr.de>; Fri,  9 Apr 2021 13:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233583AbhDILBs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Apr 2021 07:01:48 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:42873 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233519AbhDILBp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Apr 2021 07:01:45 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id UotElMDig43ycUotHlV1NG; Fri, 09 Apr 2021 13:01:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1617966091; bh=WD0cHkSg4vVAO84bxInvpMAWM9KhqtqwyZy2v9FW06Y=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=GAFt+U2IGEG3hDTGo4sgyMlMW3IAyF7KPgzI6XL8q19a16ywL2YYuFcsm20ICFSkw
         hTKi9WBrmVJ1BxqYWOluZZgivEkdOyCl+3OS1J4zh+SiS5ZEYhe4fSLzLpGVnD0+ep
         GZbrSkLc224sJWFdmJv+2n1AcyEsWJN0K3Sw1SaIispj4XIpxgE9Dp6IDSmWdraL6A
         dPl2JIBM9UHoVc1EqilqzQhd4nJ4NPG6QQeIWMjAt95BTwukBKZAwivTwK/vMuczkw
         z9VH6HxX8Y62yN2m6sbyqfBtOvXV6l+8a9Bonu1DEUgx8sP10bIQ8OKfM6kMWrjKvz
         l8aaE+XNO95MA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>,
        Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.13] Various staging cleanups from the Outreachy
 project
Message-ID: <c09890cf-9499-8a89-d616-9349733cdbe0@xs4all.nl>
Date:   Fri, 9 Apr 2021 13:01:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfKNyPuCsnlcEYjIxH2j/Qi5YaGW/2KheTUsZB6lOXeA7EBajodAMejopxmFUw/y1a2Vst32tXHgQNvApxxr3tx4eAVlnOhgsDkdYyLSS0RYbDYq42nZU
 02NV91FpLC1/sCw2lVDc5JUNsSGPu9MEwBYkq6c8yRUXuUc2G23t5gzuAPzd2TsfOUqxbbzN4zxl98WOSOzORBn9TKmnlfEWjdJ3TTbaEFE0c3kPry/9mYih
 H1ZFsPVDFR6IeLlmKCf18ICEsbLgvlyZkO3tE1EnTWKdScuem9gckIVEOHw3tgnJ
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit c1c1d437b1f0a84de6b53416026f7ea1ef3df996:

  MAINTAINERS: update ovti,ov2680.yaml reference (2021-04-07 10:01:07 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.13-out1

for you to fetch changes up to ec2e34ea1112ba83c574c718a99a744981ddc6a4:

  staging: media: zoran: Rename 'He' to 'he' (2021-04-07 16:38:42 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Beatriz Martins de Carvalho (1):
      staging: media: omap4iss: align arguments with open parenthesis

Zhansaya Bagdauletkyzy (7):
      staging: media: zoran: Rename 'HEnd' to 'h_end'
      staging: media: zoran: Rename 'VEnd' to 'v_end'
      staging: media: zoran: Rename 'DispMode' to 'disp_mode'
      staging: media: zoran: Rename 'VidWinWid' to 'vid_win_wid'
      staging: media: zoran: Rename 'VidWinHt' to 'vid_win_ht'
      staging: media: zoran: Rename 'We' to 'we'
      staging: media: zoran: Rename 'He' to 'he'

 drivers/staging/media/omap4iss/iss.c       |  2 +-
 drivers/staging/media/zoran/zoran_device.c | 48 ++++++++++++++++++++++++------------------------
 2 files changed, 25 insertions(+), 25 deletions(-)
