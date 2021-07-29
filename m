Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46B373DA0DA
	for <lists+linux-media@lfdr.de>; Thu, 29 Jul 2021 12:11:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235192AbhG2KLY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jul 2021 06:11:24 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:54075 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231488AbhG2KLY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jul 2021 06:11:24 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 930ZmQhCvXTlc930amWGJi; Thu, 29 Jul 2021 12:11:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627553480; bh=nTeBBiN5sE+Ve2dxda/t3FbjIhAlqP3BPbzDaS7KZow=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bYZvHQ4gn2QxH8toKtg/P2ASN2FMjbhSo8vgxbSLsPuR0CwqCpNlrDb1DMRkefVTy
         aKAMshIdaopu4aD/IGWOl63DJwqhL+rtksmAkLPiFYkNIZDQ9gXe9nTob+rExtqN9D
         9Axol0V9idES+WLpXQg6P3V9M8Q3iJ5ytKcmOHGJdoiKHVd1zwM2X35E/SQWS6VYiS
         KuBK7Pa7tZ0yChsTsFCADZCvsSWUKmFEetIgkB97qQ/d7TBOQhONEqh+Xr1MzJb7D5
         HQSmJkOB7Rl5Z/uGQ72pr8D+ZoFTGEp88dChT+8U0hMa5FY01oYskQ0Ssp/YKBG+/9
         +Sqi4y4NPokmA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.15] Various fixes
Message-ID: <361dcfeb-8264-6e7a-dda4-7a942f7cb722@xs4all.nl>
Date:   Thu, 29 Jul 2021 12:11:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfDzs4zLXLedsX4y58+NEFXvYQmHxpzMWeUtHyF0bOICFLY326z2Fd3alJzF2sdqyDiXPcBruoV+gDx6YyPPNeie1Owkus8L+Wuwz79/66YKUvAc0JjRo
 04+wFZvJPTbwFSwdUz/TtavrgC7AG+WHEtiRh6Oab8Q1ynjxHCbwcVfvbfI+TtPH4g6TeKhD3wsKABglZnDAFehPcsGmC9BXCsDeHn2GoDe9rO6vrKTD4OsE
 ZkRSl0C3Okv4r1W6FMCWQHPAaPkpYGqYOa1oAG9jtF8R8USh0IqtQd7QC5VPH4ay0jILnBEMlDZkaoQyn0vTBA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit c3cdc019a6bf03c4bf06fe8252db96eb6e4a3b5f:

  media: atomisp: pci: reposition braces as per coding style (2021-07-23 09:04:03 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.15d

for you to fetch changes up to 2d1dd48d0a674eaad937da83423413d7f2131756:

  media: tegra-cec: Handle errors of clk_prepare_enable() (2021-07-29 12:09:44 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Deborah Brouwer (1):
      media: cec-pin: rename timer overrun variables

Evgeny Novikov (1):
      media: tegra-cec: Handle errors of clk_prepare_enable()

Hans Verkuil (1):
      v4l2-dv-timings.c: fix wrong condition in two for-loops

Krzysztof Hałasa (3):
      Fix cosmetic error in TDA1997x driver
      TDA1997x: fix tda1997x_query_dv_timings() return value
      TDA1997x: report -ENOLINK after disconnecting HDMI source

 drivers/media/cec/core/cec-pin-priv.h        |  4 ++--
 drivers/media/cec/core/cec-pin.c             | 20 ++++++++++----------
 drivers/media/cec/platform/tegra/tegra_cec.c | 10 ++++++----
 drivers/media/i2c/tda1997x.c                 | 10 ++++++----
 drivers/media/v4l2-core/v4l2-dv-timings.c    |  4 ++--
 5 files changed, 26 insertions(+), 22 deletions(-)
