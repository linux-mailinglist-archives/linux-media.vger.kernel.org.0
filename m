Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49BEB425202
	for <lists+linux-media@lfdr.de>; Thu,  7 Oct 2021 13:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240964AbhJGLcu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Oct 2021 07:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240939AbhJGLct (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Oct 2021 07:32:49 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0350C061746
        for <linux-media@vger.kernel.org>; Thu,  7 Oct 2021 04:30:55 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 71B10C6342; Thu,  7 Oct 2021 12:30:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1633606252; bh=FXunSqMfhK43eMKtPL3JFZJlflvcXYQYF5/f+CT00mc=;
        h=Date:From:To:Subject:From;
        b=WTn5t5H2MbvFmr9I2GklHanGfN+Ig95WEzpkJyKVTYpeRv6rpHm0h/8aw0qas9elZ
         itZh8TuX86+OL+LSM6ibgCio2xtseZ4pDyFGrfVICAIPpqKH7JGjMq/kOYO/GRd9F3
         v4rjXhsVWOf9w/L5Dz+jlU9wvcRETrkhVwjBs84ORSoDksCIHdC9nev4X89doZsgfR
         ik6kT9M44pXZWEjrTB1uSWRhQVeAkKr4HvNgyyng9tzJS3LMOJAfUh1ubvMJTzBhe4
         CBs4OpmZYnWGmC2+H1iKMnQjMzmeRPP4zZ/qc5fs8pONMFyzThG6JTPmphF73B5v4A
         lOpoWANVeYhfQ==
Date:   Thu, 7 Oct 2021 12:30:52 +0100
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [GIT PULL FOR 5.16] Last DVB fixes
Message-ID: <20211007113052.GA11952@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit ff93780378831cd12010f796ccd688ba4b9dd6e4:

  media: imx-jpeg: Remove soft reset between frames encoding (2021-10-05 09:43:14 +0200)

are available in the Git repository at:

  git://linuxtv.org/syoung/media_tree.git tags/v5.16b

for you to fetch changes up to b812e1650ff8a88eb607b41e68c5bd4ba73930f1:

  media: remove myself from dvb media maintainers (2021-10-07 12:19:19 +0100)

----------------------------------------------------------------
v5.16b

----------------------------------------------------------------
Anant Thazhemadam (1):
      media: usb: dvd-usb: fix uninit-value bug in dibusb_read_eeprom_byte()

Colin Ian King (1):
      media: mb86a20s: make arrays static const

Evgeny Novikov (1):
      media: dvb-frontends: mn88443x: Handle errors of clk_prepare_enable()

Nil Yi (1):
      media: rtl2832_sdr: clean the freed pointer and counter

Sean Young (1):
      media: remove myself from dvb media maintainers

 .../driver-api/media/maintainer-entry-profile.rst      |  2 +-
 drivers/media/dvb-frontends/mb86a20s.c                 |  4 ++--
 drivers/media/dvb-frontends/mn88443x.c                 | 18 +++++++++++++++---
 drivers/media/dvb-frontends/rtl2832_sdr.c              |  5 ++++-
 drivers/media/usb/dvb-usb/dibusb-common.c              |  2 +-
 5 files changed, 23 insertions(+), 8 deletions(-)
