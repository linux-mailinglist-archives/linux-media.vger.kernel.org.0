Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4CFD333ACD
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 11:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbhCJK4v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 05:56:51 -0500
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:42575 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229948AbhCJK4W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 05:56:22 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id JwVklFS1eOruFJwVnlWgVw; Wed, 10 Mar 2021 11:56:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1615373781; bh=T2z8iRwgzPKRYyiLx8pGyG+AwTiDVz8h0QnQEsOwTM0=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=gGBjpvFANxlHLsQIywppLIG9zBjzRQmAMAz8Lm4siPSjuNJXfehJ+EE3j7ymlVVRA
         PSXU5jpjmH9IQXBNBL5Ghmt9d/T4G+MNvskTrhZ0Weo0xCA7U1ZQAIVZmnAL+kdKcs
         fmJWiNTScUkAh/Gfkypv/aDGKYI7gyBgiDQufTExDXDilp3kiaAVq92Rba3Y1C0Ols
         XLrhXS0rNDdodsqZZTy5mxvQW8Dh0XnKdBXgOgRzoyMFdoNrhiSyHBB3me4w6dQq6Q
         TKwdnHnprpAROr2BZZJ3hByO8PHGAcEwhVVMpIKXKwO1GonwPjSK+KNT8NQRdQbtJk
         HIsar8ZU78JYA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Marco Felsch <m.felsch@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.12] coda: fix macroblocks count control usage
Message-ID: <9e1a6ca6-7a52-0fc4-1ae5-ca73a0ff493a@xs4all.nl>
Date:   Wed, 10 Mar 2021 11:56:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfPjqDWL2zdA1JjRV9CX8/osWBdS4FHTXk5aDWFFFGgUQ5m6pPxgzq38mftsaQc6D5oa1jW+ODCckWaUbJvlFXtwKbKiB94FI46x8Pt3D7TBowbgGY3T4
 ylHup+UwXsAq9B8H7WFBWpzv0CtjH6faNNrYxJAKBBhNml3RpaqrCyZbSjbJMzgSMPURoALaWq40iM3FwMBqyVOgMVEo5SAw3T5ARXDtcQIeowREEwmH/w1W
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 1c5ab1e2286f4ca6347744e9d4cace5fad5ffa39:

  Merge tag 'v5.12-rc2' into patchwork (2021-03-07 17:46:50 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.12b

for you to fetch changes up to 51bb6b66bc283774896e75d9e7fbd259c630fa7f:

  media: coda: fix macroblocks count control usage (2021-03-10 11:27:54 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Marco Felsch (1):
      media: coda: fix macroblocks count control usage

 drivers/media/platform/coda/coda-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
