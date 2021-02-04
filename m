Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51B9030F750
	for <lists+linux-media@lfdr.de>; Thu,  4 Feb 2021 17:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237797AbhBDQKo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Feb 2021 11:10:44 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:39337 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237801AbhBDQKe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Feb 2021 11:10:34 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 7hCFlJIUSW4yN7hCIlcy1G; Thu, 04 Feb 2021 17:09:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1612454974; bh=fxdqfezkmzx8x+8ALIgj19RWKsnvXZmG7lqFhLbO73Y=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=XpgH1lhBcskkQAb/e660EWrw2yYJXfibnj8jpXqeIqDHsKM8xyrUv+jdtZs+oxm/e
         lH2GllZkd6iBQ7VScnUdNTLZAsZQflUzpEfrtexdSxeTNwk8Z+t70palGYzomog8y3
         zif2/cavqoSbNQ26qEZ5wEy4CBDfGR9ToeOWwEwbv3XRSr9Sk62xs1jRu6c/R3O7kx
         8WehWPtCnQrIETvKKY3ybI1dEhiJc6ljpD70nL1BNyIZVSfiUf+W84Fdv7aEC4b30t
         zA4YIsMEzugsuLSr3rRjUQ4pxvnnu4LqIEoqeMCvN9ISiCiYltnNSp5IDAi6fqDTA8
         PhN1wxv7ZI3Yg==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.12] Various fixes
Message-ID: <54287eeb-4617-dc1a-d77c-1870e81d5ca8@xs4all.nl>
Date:   Thu, 4 Feb 2021 17:09:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNBvA+7WKLYYpWBF+hMyM1fnKqDiyY1T0mDfYmOexzOLY3KF+gIrpol+AE/bVzLOjlZ+BL3HfYyxfPAIqkcNGUj4K0rb1jN99QGgcitbV114VxTx4p1k
 qqS1ufkfGJXZo1q0J4D0kUImzoulEbfKChI3nYAIeS2+TTC7k1tRQptl47i7EKrZ4nZtsnkop6zONm6NOwOqiIzSpVSy97FcNkM=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 0b9112a58836ad6a7e84eebec06a2de9778b7573:

  Merge tag 'v5.11-rc6' into patchwork (2021-02-01 10:03:45 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.12g

for you to fetch changes up to 241a77ef4be4e81eb28ffa1434d905ed34dc5261:

  uvc: strncpy -> strscpy (2021-02-04 16:29:10 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (3):
      media/dvb/dvbstb.svg: Antena -> Antenna
      vidtv: adapter->mdev was set too late
      uvc: strncpy -> strscpy

Helen Koike (1):
      media: doc: pixfmt-yuv: Fix 4:4:4 subsampling info

dingsenjie (1):
      media/pci: fix spelling typo of frimware

 Documentation/userspace-api/media/dvb/dvbstb.svg            |  2 +-
 Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst |  6 +++---
 drivers/media/pci/saa7164/saa7164.h                         |  2 +-
 drivers/media/test-drivers/vidtv/vidtv_bridge.c             | 18 ++++++++++--------
 drivers/media/usb/uvc/uvc_driver.c                          |  2 +-
 5 files changed, 16 insertions(+), 14 deletions(-)
