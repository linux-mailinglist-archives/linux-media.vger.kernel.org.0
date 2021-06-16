Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE313A9BAD
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 15:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbhFPNKf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 09:10:35 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:58983 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233145AbhFPNKe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 09:10:34 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id tVHKlvM8NhqlttVHOlwLld; Wed, 16 Jun 2021 15:08:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623848906; bh=w/KiJg39imppRsHBHOcN5ZbyrEfDh+J3SdG70/fsufc=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vA86lBQ3sY8awFrg+i+CL5+a7z+2yufjvWO62Yn3vB6siWNOkDDXaQ+3kuzAr2qMZ
         Lqc/9mYpbJ0UFB/jJpuIjQLvtx86ZkMRzQilxOG5pROL8gSJHCIGj8+Duljc+Iuw9h
         G9ONfzYEFJt4S8M+0yitrO+hIyWeOHyzwQ3oi0AIPJPZpNll2IUY+VyQ+1X44xsY9w
         b0R9XtJsXctxWg1a5Ig1Hbs4dMyFSqQj5338Hqup1w5umpEb2Qf4zdyRWKee8jQR3T
         QMgfoXVGfjLncz2esD9XfTFTk7mgxDKKUDGzqcpGgYJal0SqHR1OvIjdqKtQHRXS6Y
         xAmEdrl9A+kmg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     jacopo mondi <jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] gmsl: Reliability improvements
Message-ID: <26aa3fed-ec7f-fbcc-3f05-5660d12750dd@xs4all.nl>
Date:   Wed, 16 Jun 2021 15:08:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfE3FfqZjkIW79kPL4n2QmW8UtnoSD9oxpFIjzPa4ZV3H1N505KIwxR5i+OIuICcSDLe9Dx1Cri7ikDDIdXlFraTcP0/b5iXgUBbyLUZuJ+mvyzGQHhtA
 wKTrb9AV+BWg78BvskJLXUYX0DubD3knIYhvHgtza+XO8eA7McGpe+Z6OdN/snU64EbJHBwhLevIvGYrpBDmUq4jtLqfXhIdWFHr6+B5PIQElcSi1o0IeFeR
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 45040f675041956ad763f9ef139ecee3647aa8bb:

  media: hantro: IMX8M: add variant for G2/HEVC codec (2021-06-08 16:13:53 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14p

for you to fetch changes up to 3bada38185f153cc1ca1abef788dac918d37455e:

  media: i2c: rdacm20: Re-work ov10635 reset (2021-06-16 15:02:35 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Jacopo Mondi (15):
      media: i2c: max9286: Adjust parameters indent
      media: i2c: max9286: Rename reverse_channel_mv
      media: i2c: max9286: Cache channel amplitude
      media: i2c: max9286: Define high channel amplitude
      media: i2c: max9286: Rework comments in .bound()
      media: i2c: max9271: Check max9271_write() return
      media: i2c: max9271: Introduce wake_up() function
      media: i2c: rdacm21: Add delay after OV490 reset
      media: i2c: rdacm21: Fix OV10640 powerup
      media: i2c: rdacm21: Power up OV10640 before OV490
      media: i2c: rdacm20: Enable noise immunity
      media: i2c: rdacm20: Embed 'serializer' field
      media: i2c: rdacm20: Report camera module name
      media: i2c: rdacm20: Check return values
      media: i2c: rdacm20: Re-work ov10635 reset

 drivers/media/i2c/max9271.c | 42 +++++++++++++++++++++++++++++++-------
 drivers/media/i2c/max9271.h |  9 ++++++++
 drivers/media/i2c/max9286.c | 41 ++++++++++++++++++++-----------------
 drivers/media/i2c/rdacm20.c | 84 ++++++++++++++++++++++++++++++++++++++++++++-------------------------------
 drivers/media/i2c/rdacm21.c | 67 +++++++++++++++++++++++++++++++++++++++++-------------------
 5 files changed, 161 insertions(+), 82 deletions(-)
