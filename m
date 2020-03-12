Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2E2183003
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 13:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgCLMNg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 08:13:36 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:39991 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726395AbgCLMNf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 08:13:35 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id CMiQjwwHGhVf8CMiTjMQcI; Thu, 12 Mar 2020 13:13:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1584015214; bh=iMMmpzaewMqTxlsvphdwNMzOi9JXO7q1yCjLBDHnGkQ=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=l1ZMD6CqwSYj7ccbVX0H3Tv+ayIzlPfRHvfw1tLsbtf+zOOWV0fFMnxzu+azImVWv
         yYZQh4q9vX4C0VY9PJA3rN/vNTuBi/6AdPUV8Otv1DgGRHazPfbvBJ/4M1NfFC3v7l
         Dvg9fnvRGox7LnMjkOGBlvcxwVQZgv/Jj7ZX83WDcj3uvN187f5E6VzJPQ6z7evZqc
         Z82G5hb3d5l3tkPnboL6yKWtWi9SROW6+PkkwYyIJBZ61bTsasiIOdbWpVr3BEJRat
         OgdyrxdGGI++Axr9dzFDD9bKRxzaGOjOik0AC45FkTiVrA50KcLt7v/ijsztYdeoa4
         K/AvTx7mTShyg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Johan Hovold <johan@kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.7] Various fixes
Message-ID: <b8db3a3f-33d4-99d3-f03f-25b968ba1907@xs4all.nl>
Date:   Thu, 12 Mar 2020 13:13:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDk8mHGazj8sYRp4EbkmAgASR6oA0TLbn9XfiFBgRl0Ib5ZHMcqWyvY1QYv/NHGYA9Z2bnz55vhBfjboYpm4LQdRGoc41fZNuj/BsQ3hFKdcdPJPDJZq
 Z7Rj2hbw5zcTGiFwRZBJoIvmnfyEBZAPBCdCPfLgoHO4SsGYDjoSE18tDre0YZSdx0cMEK03sqpsYVdSauUYuHe2HTYcopP2WjY=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit eceeea5481d4eeb6073e8ccb2f229bb0dd14a44d:

  media: lmedm04: remove redundant assignment to variable gate (2020-03-12 09:47:33 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.7i

for you to fetch changes up to 7b03d504269160d7fe68724b970a74b658c150fa:

  media: mtk-mdp: Check return value of of_clk_get (2020-03-12 12:48:29 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alexandre Courbot (1):
      media: videobuf2-core: fix dprintk level

Etienne Carriere (2):
      media: platform: stm32: defer probe for auxiliary clock
      media: platform: stm32: don't print an error on probe deferral

Johan Hovold (3):
      media: ov519: add missing endpoint sanity checks
      media: stv06xx: add missing descriptor sanity checks
      media: xirlink_cit: add missing descriptor sanity checks

Matthias Brugger (1):
      media: mtk-mdp: Check return value of of_clk_get

Ricardo Ribalda Delgado (1):
      imx214: Remove redundant code

Sebastian Gross (1):
      media: i2c: s5c73m3: Fix number in auto focus cluster

 drivers/media/common/videobuf2/videobuf2-core.c  |  4 ++--
 drivers/media/i2c/imx214.c                       |  1 -
 drivers/media/i2c/s5c73m3/s5c73m3-ctrls.c        |  2 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c    |  6 ++++++
 drivers/media/platform/stm32/stm32-cec.c         | 10 ++++++++--
 drivers/media/usb/gspca/ov519.c                  | 10 ++++++++++
 drivers/media/usb/gspca/stv06xx/stv06xx.c        | 19 ++++++++++++++++++-
 drivers/media/usb/gspca/stv06xx/stv06xx_pb0100.c |  4 ++++
 drivers/media/usb/gspca/xirlink_cit.c            | 18 +++++++++++++++++-
 9 files changed, 66 insertions(+), 8 deletions(-)
