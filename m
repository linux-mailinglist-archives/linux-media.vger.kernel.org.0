Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAE77E2B42
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 09:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408679AbfJXHly (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 03:41:54 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:46627 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2408661AbfJXHly (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 03:41:54 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id NXkjiqNDdfrRWNXkmiTNxH; Thu, 24 Oct 2019 09:41:52 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@siol.net>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.5] Add AllWinner deinterlace driver
Message-ID: <53668630-da7b-fc23-dd05-275234d7a0d3@xs4all.nl>
Date:   Thu, 24 Oct 2019 09:41:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfHdPBd+kQmKI2Ehcvl6w8ZCHldvvEMZ3NRT8v3OHKv6C32wN2G+RrES9vnL4m3JruhZpHDn48HFny0D2p91GoQnDzznoAQedIymt+qNnUGvNKzreN+8C
 DjHvopWtqaYc7N/iL0/WjXif7gdSUBU3yWK6HKK0WbVqUIi5PVXLDSfYEAerZWMWDUrfUhTPdnwhZAlvY/HOCxaiA0VRqe/5Xm0=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 6ce1d376d33eb775331b36a38afa28f9f08945e3:

  media: docs-rst: Document m2m stateless video decoder interface (2019-10-21 07:43:45 -0300)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.5n

for you to fetch changes up to 79ed94cde557d2bc7fb27b9d2ab42d40891e98d9:

  media: sun4i: Add H3 deinterlace driver (2019-10-24 09:28:00 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Jernej Skrabec (2):
      dt-bindings: media: Add Allwinner H3 Deinterlace binding
      media: sun4i: Add H3 deinterlace driver

 .../devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml    |   76 +++
 MAINTAINERS                                                          |    8 +
 drivers/media/platform/Kconfig                                       |   13 +
 drivers/media/platform/sunxi/Makefile                                |    1 +
 drivers/media/platform/sunxi/sun8i-di/Makefile                       |    2 +
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c                     | 1028 ++++++++++++++++++++++++++++++
 drivers/media/platform/sunxi/sun8i-di/sun8i-di.h                     |  237 +++++++
 7 files changed, 1365 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allwinner,sun8i-h3-deinterlace.yaml
 create mode 100644 drivers/media/platform/sunxi/sun8i-di/Makefile
 create mode 100644 drivers/media/platform/sunxi/sun8i-di/sun8i-di.c
 create mode 100644 drivers/media/platform/sunxi/sun8i-di/sun8i-di.h
