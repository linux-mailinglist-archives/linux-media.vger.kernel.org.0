Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1896146E888
	for <lists+linux-media@lfdr.de>; Thu,  9 Dec 2021 13:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231889AbhLIMil (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Dec 2021 07:38:41 -0500
Received: from ewsoutbound.kpnmail.nl ([195.121.94.168]:38986 "EHLO
        ewsoutbound.kpnmail.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbhLIMik (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Dec 2021 07:38:40 -0500
X-KPN-MessageId: 602a57a7-58ec-11ec-8862-005056aba152
Received: from smtp.kpnmail.nl (unknown [10.31.155.40])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 602a57a7-58ec-11ec-8862-005056aba152;
        Thu, 09 Dec 2021 13:34:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:subject:from:to:mime-version:date:message-id;
        bh=66R4QDGCpCnG8WRpTzyjrpLcQW5XP2hIWbzjjLQUKGE=;
        b=a6+zETT/lAnNWXr0mF2yVQNWPXISE9g21/2v4Ke3mDP3pAAoUv3ZMBCUEaaeHY1PMbztLtxxZbfKU
         MZolXa6iMpPxBntzKm7c/7+Qy0/cG2+C01TzZtlPPmIoxeoyn5XCZd1rXeU+rBGqIdAlBwJ11ByRbc
         Ew+xAQcQTotcRoIXyYWNs5tjW42m9H2SNRBxxVZWqqK12ri/5RMeJFqCnxsSnbSBmeB3QvZGbzoFog
         lbDQISq/xNPQe9+lkZiM78AVdDbTT+W9fXzR4un/yqt5CcC0tGXSoYgI5CYGhX2qwwhbCvU2FH7bM7
         u1shVZ65FhvJC5/iC0X8OkX8KJTADbA==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|EoyNT5T2Jer7vf35uT09oGtSjMbnEuDfN5Xk0YLYCl+VpejbQWh/JbemyJLurhU
 PC7wNzY0rPim7lnByXOIQKg==
X-Originating-IP: 193.91.129.219
Received: from [192.168.2.10] (cdb815bc1.dhcp.as2116.net [193.91.129.219])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 6fe3c63a-58ec-11ec-b76f-005056ab7584;
        Thu, 09 Dec 2021 13:35:06 +0100 (CET)
Message-ID: <7baad561-92de-5ad8-209f-75fc52de344e@xs4all.nl>
Date:   Thu, 9 Dec 2021 13:35:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.17] hantro fix
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 9b4d7b5c81a2578e080da33b5cddc3149fa611aa:

  media: bttv: use DEVICE_ATTR_RO() helper macro (2021-12-07 11:29:58 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.17g

for you to fetch changes up to 59c2cecf7c879ef6f0648a07ee5a2f87678e8b13:

  media: hantro: Fix G2/HEVC negotiated pixelformat (2021-12-09 12:50:33 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Benjamin Gaignard (1):
      media: hantro: Fix G2/HEVC negotiated pixelformat

 drivers/staging/media/hantro/hantro_g2_hevc_dec.c | 25 ++++++++------------
 drivers/staging/media/hantro/hantro_hevc.c        | 79 ++++++++++-----------------------------------------------------
 drivers/staging/media/hantro/hantro_hw.h          | 11 +++++++++
 drivers/staging/media/hantro/hantro_postproc.c    |  3 +++
 drivers/staging/media/hantro/hantro_v4l2.c        | 19 ++++-----------
 5 files changed, 41 insertions(+), 96 deletions(-)
