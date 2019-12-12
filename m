Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4EC11C87C
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2019 09:50:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbfLLIu1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Dec 2019 03:50:27 -0500
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:59507 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728229AbfLLIu1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Dec 2019 03:50:27 -0500
Received: from [IPv6:2001:983:e9a7:1:1c4a:480a:7ba1:9c65]
 ([IPv6:2001:983:e9a7:1:1c4a:480a:7ba1:9c65])
        by smtp-cloud9.xs4all.net with ESMTPA
        id fKAyiYGZ6GyJwfKAzixLrU; Thu, 12 Dec 2019 09:50:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1576140625; bh=8xB88MUTfHBdmGkmkMKhVlu1WApEvPvs8TwQznuLwLU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=bwyM047TQQGsUWUVNInO58//FCplWC6hZQmwcYQDJ1YSFOoBSFuRHTBR4HATnU9V3
         NNdCSvrwrt2zD7B2F35THsIrtPfZw5MhKV3/Nm/oQcnbImpMM9CeaiqbOS6Xz6zumH
         Tb5EogFAgEqzS9h/Up6iLaL8HnqYxujp17OsT/cTPZGuD8R5vqCY+mQPWD2mmfaKha
         vkvWEhF0WXxBdFuyp0mMA0B8BeToToSCyXJv8HrXmse4vnLb+B5d0E6aEVv3Nbnvud
         Pb2cxa93LzAh4O0t9zMWNqZdA7egdcpF3vpspOdgoOttZ8s+X740ESW5IX1MRIt4V5
         hgFYAP5WWWBSg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT FIXES FOR v5.5 (v2)] cec: four fixes
Message-ID: <adef53aa-ee1c-392e-4961-f6b39d662dcd@xs4all.nl>
Date:   Thu, 12 Dec 2019 09:50:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfL75RcwM6eSNuP5DqEXXcfIEtZSz/zX8Reg7sRDFA1XjQHqETcFEFiTEm10hWaY8dhVDhjiTHZ7QpCuPuvtCVK9VQSR87Svv1O7UDvFn8GZyveAM8DtW
 illygdiswM8eo9dCP8WCLPfbSupYVJd9fAG7tyJU+FEqBRas+snwJT742y73qeaSvAJ9viwPc6phxVPTYYnHcVw6tmDqhWxk1kUWFS4ZeZlTgE2k2aoOyxBp
 PntNloR4bl2l3YoX6/tLXvld5ysFqBQTja0MgW9lRjc=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Three fixes for the CEC framework, and one for the pulse8-cec driver.

All were found in the last two weeks during extensive testing with the
pulse8-cec driver.

All these fixes have a CC to stable since they should all be backported.

Regards,

	Hans

Changes since v1: realized that patch 2 was missing a CC to stable.


The following changes since commit 2099ef02c6c024751e4d16ace67dd6b910c875e4:

  media: dt-bindings: media: cal: convert binding to yaml (2019-12-09 11:43:47 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5a

for you to fetch changes up to f63b69719cbe0297d5dd24298258122218c509cd:

  pulse8-cec: fix lost cec_transmit_attempt_done() call (2019-12-12 09:46:52 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (4):
      cec: CEC 2.0-only bcast messages were ignored
      cec: avoid decrementing transmit_queue_sz if it is 0
      cec: check 'transmit_in_progress', not 'transmitting'
      pulse8-cec: fix lost cec_transmit_attempt_done() call

 drivers/media/cec/cec-adap.c              | 40 +++++++++++++++++++++++++++-------------
 drivers/media/usb/pulse8-cec/pulse8-cec.c | 17 +++++++++++++----
 2 files changed, 40 insertions(+), 17 deletions(-)
