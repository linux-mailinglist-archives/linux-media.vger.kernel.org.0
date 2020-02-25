Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFE9A16BCE5
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 10:02:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729637AbgBYJC6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 04:02:58 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:44705 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729153AbgBYJC6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 04:02:58 -0500
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 6W7BjxOEujmHT6W7EjVgxv; Tue, 25 Feb 2020 10:02:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1582621377; bh=rs+xb3eaUW58qvzNrBogDkcg4IkZc34eGHjdRcNbpTU=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Sid83vaOAFs8L5ZbPP2FBcrDkIQCuO34vM1jMiumLCBENTD5+Kok5QxFB+lpSPtZ8
         dIqBVvmD+jEQzSwo76+DOcnQpBp1xtdw5E2KfIUlSSOJY8ua8hlRMGSuhQRruWr9Zf
         vYiJu8wJAzyrxZZxzH4YG/iFjabQdiQZwqVoaxBBxYira1jFyQH6zrH/HRc182+c1v
         Hv/y7MupMuWEKNfbE8j8lxys4BYpOjdUJSMbLBp31/porOstVBUkeLn6jrlnDda7wi
         bfHt1qx4VDOamnA4umwodv2qziOGLRxvwjxGy9wAv1UaLUxKNP0bpC+EZOuAizaWmO
         ook1AyLIKP4Aw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.7] usbvision: move to staging and deprecate
Message-ID: <27eb3328-c18b-5b13-f956-4a713927cf06@xs4all.nl>
Date:   Tue, 25 Feb 2020 10:02:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfCXO4nUXYiLOymj39MOGOIWGtGJTWzIO3XvXdWDKfQz23duYORlckFo7iIwrcHuWT3abRzEJ/DiBQgmQPmFtTZ8EyZ48ExPGnTElLExcMAYQGkrtFH71
 dIM2VrMv6BNl1tBJX8Hc8mqS6+Br5XzBjOGFLTGkP3Xof5QFOpUvpc55TZLA76lbch9+Xsj+ypyVWQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit ef0ed05dcef8a74178a8b480cce23a377b1de2b8:

  media: staging/imx: Missing assignment in imx_media_capture_device_register() (2020-02-24 17:53:22 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-usbvision

for you to fetch changes up to e6b05ca95e056187566c87388271ee5f7e4fe9f6:

  usbvision: deprecate driver (2020-02-25 09:56:45 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
      usbvision: deprecate driver

 MAINTAINERS                                                      |  2 +-
 drivers/media/usb/Kconfig                                        |  1 -
 drivers/media/usb/Makefile                                       |  1 -
 drivers/staging/media/Kconfig                                    |  4 ++++
 drivers/staging/media/Makefile                                   |  1 +
 drivers/{media/usb => staging/media}/usbvision/Kconfig           |  7 ++++++-
 drivers/{media/usb => staging/media}/usbvision/Makefile          |  0
 drivers/staging/media/usbvision/TODO                             | 11 +++++++++++
 drivers/{media/usb => staging/media}/usbvision/usbvision-cards.c |  0
 drivers/{media/usb => staging/media}/usbvision/usbvision-cards.h |  0
 drivers/{media/usb => staging/media}/usbvision/usbvision-core.c  |  0
 drivers/{media/usb => staging/media}/usbvision/usbvision-i2c.c   |  0
 drivers/{media/usb => staging/media}/usbvision/usbvision-video.c |  0
 drivers/{media/usb => staging/media}/usbvision/usbvision.h       |  0
 14 files changed, 23 insertions(+), 4 deletions(-)
 rename drivers/{media/usb => staging/media}/usbvision/Kconfig (57%)
 rename drivers/{media/usb => staging/media}/usbvision/Makefile (100%)
 create mode 100644 drivers/staging/media/usbvision/TODO
 rename drivers/{media/usb => staging/media}/usbvision/usbvision-cards.c (100%)
 rename drivers/{media/usb => staging/media}/usbvision/usbvision-cards.h (100%)
 rename drivers/{media/usb => staging/media}/usbvision/usbvision-core.c (100%)
 rename drivers/{media/usb => staging/media}/usbvision/usbvision-i2c.c (100%)
 rename drivers/{media/usb => staging/media}/usbvision/usbvision-video.c (100%)
 rename drivers/{media/usb => staging/media}/usbvision/usbvision.h (100%)
