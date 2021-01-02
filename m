Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F28982E86E2
	for <lists+linux-media@lfdr.de>; Sat,  2 Jan 2021 11:13:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbhABKMw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Jan 2021 05:12:52 -0500
Received: from gofer.mess.org ([88.97.38.141]:38137 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726327AbhABKMv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 2 Jan 2021 05:12:51 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 34903C6437; Sat,  2 Jan 2021 10:12:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1609582330; bh=e728LlDLWOx0ZXDnQaTHT/79Jh/E0R99hPS1DU9XoS0=;
        h=Date:From:To:Subject:From;
        b=lRxa5uhwAadx6wIdVW5eetvUl2bRQ76/ZtWEkp8lqttgHDzeiFfHZnz4u7/BQBplV
         VMzv33kS/p+JBGcG1yGQk5675iG3VW02VKkmyTVpTvhYUS+zherPzP9NaQJu2QDRmJ
         7K1MnL6v9FesallioBK+Ka5bAfadkm5J6t/HCS2kLlfgaMaSjn54jkHgqJLUk+xZ6L
         w/jFAIaK5xWhqTSTnGTntpvnscIMb8dE2eUUEdE8XWsl0Ua3C4UWrZ9rqTjgNmKM6p
         8A+EbWKpoARIXAjh+s4oK+7U7mV0Zj4tHMuBk+KldUyf9fo8SLrwmT/06TetObWA26
         qe+UzT9IBoLBA==
Date:   Sat, 2 Jan 2021 10:12:10 +0000
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT FIXES FOR v5.11] rc: race condition on rc register
Message-ID: <20210102101209.GA32435@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

There is a race condition where udevd does not run ir-keytable when a
device is plugged in.

Thanks,

Sean


The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.11e

for you to fetch changes up to 6b8148483230a449f9e97042a5464bff205c0612:

  media: rc: ensure that uevent can be read directly after rc device register (2021-01-02 10:05:58 +0000)

----------------------------------------------------------------
v5.11e

----------------------------------------------------------------
Sean Young (1):
      media: rc: ensure that uevent can be read directly after rc device register

 drivers/media/rc/rc-main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
