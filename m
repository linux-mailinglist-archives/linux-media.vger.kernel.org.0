Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDB011AC078
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 13:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634165AbgDPL5n (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 07:57:43 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:45031 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2634550AbgDPL5c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 07:57:32 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id P392jcd7f7xncP396j7Yns; Thu, 16 Apr 2020 13:57:28 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587038248; bh=i43vZHOxVgg5MjEH4lxnjv5BEsXA8HiiVD/p8kJCIfg=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Ay0e08pRRiJPxqxiD8kOnm9U8dJMhmAb3jayM9c77OE4t8PT6JvS2QeV4pzFXBAm/
         3vakayU5u4JOZgAjhEjHb37yi+s1K+hjASuHYtULzcWmfU70M2Al30vc2f3Et0cicD
         tD8poZ4gMJJhMD5M5sF8jjorA4CLduOfnZW9hqHjNuIMc03kINABkoJrIuDpEd1ZJx
         B7yO/rgPixxxrJ/4NF1O2Tn3z92HEWTYYfgTY7NagBQZrjAtZndVRIKIRGosvtyUCk
         lws4Np/LL9D9k+6dJuHOFpUjOJavnVIN7xywL5Ux0mVoPIckj/UKcXCdZYBOSxFzJo
         MvadFHy/0+GBg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Boris Brezillon <boris.brezillon@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.8] Add rkvdec codec
Message-ID: <f77fa7ee-c9d2-d2ee-5db7-d15fee15c04f@xs4all.nl>
Date:   Thu, 16 Apr 2020 13:57:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfIJktkungGiay06oVerCihryX91SjVIt6T2HFpFzXsAqCi2M2Q+88aqce4ndUBFp0IX3TihUEygjxoOtW9bk0RSPd8Da9GP77Gh4ghS0JhtbMDLY34h9
 tKZacU4CwcQ54PLPkY6Zf4basAyV6sTrX/nlqeKmUMGpcCDeW7hTNRMwuHrfHTtrnf3a4vSmKr0cgWyzry8IH/lbaTpr4WV2XLxPjlyOoaq7mkoDAMnfcnfV
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit dacca5f0fa69f04c2e70aad9847e8250b459971c:

  media: media/test_drivers: rename to test-drivers (2020-04-16 10:38:31 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.8b

for you to fetch changes up to ccd9a402bf87e3ca1b2491898b96221303300c36:

  media: rkvdec: Add the rkvdec driver (2020-04-16 13:14:20 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Boris Brezillon (4):
      media: v4l2-core: Add helpers to build the H264 P/B0/B1 reflists
      media: hantro: h264: Use the generic H264 reflist builder
      media: dt-bindings: rockchip: Document RK3399 Video Decoder bindings
      media: rkvdec: Add the rkvdec driver

 Documentation/devicetree/bindings/media/rockchip,vdec.yaml |   73 +++
 MAINTAINERS                                                |    7 +
 drivers/media/v4l2-core/Kconfig                            |    4 +
 drivers/media/v4l2-core/Makefile                           |    1 +
 drivers/media/v4l2-core/v4l2-h264.c                        |  270 ++++++++++
 drivers/staging/media/Kconfig                              |    2 +
 drivers/staging/media/Makefile                             |    1 +
 drivers/staging/media/hantro/Kconfig                       |    1 +
 drivers/staging/media/hantro/hantro_h264.c                 |  237 +--------
 drivers/staging/media/rkvdec/Kconfig                       |   15 +
 drivers/staging/media/rkvdec/Makefile                      |    3 +
 drivers/staging/media/rkvdec/TODO                          |   11 +
 drivers/staging/media/rkvdec/rkvdec-h264.c                 | 1156 +++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/rkvdec/rkvdec-regs.h                 |  223 ++++++++
 drivers/staging/media/rkvdec/rkvdec.c                      | 1103 +++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/rkvdec/rkvdec.h                      |  121 +++++
 include/media/h264-ctrls.h                                 |    8 +-
 include/media/v4l2-h264.h                                  |   85 +++
 18 files changed, 3091 insertions(+), 230 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip,vdec.yaml
 create mode 100644 drivers/media/v4l2-core/v4l2-h264.c
 create mode 100644 drivers/staging/media/rkvdec/Kconfig
 create mode 100644 drivers/staging/media/rkvdec/Makefile
 create mode 100644 drivers/staging/media/rkvdec/TODO
 create mode 100644 drivers/staging/media/rkvdec/rkvdec-h264.c
 create mode 100644 drivers/staging/media/rkvdec/rkvdec-regs.h
 create mode 100644 drivers/staging/media/rkvdec/rkvdec.c
 create mode 100644 drivers/staging/media/rkvdec/rkvdec.h
 create mode 100644 include/media/v4l2-h264.h
