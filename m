Return-Path: <linux-media+bounces-269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB49A7EA086
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 16:50:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07D4D1C20935
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 15:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E7321A02;
	Mon, 13 Nov 2023 15:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC425219F2
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 15:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7677C433C9;
	Mon, 13 Nov 2023 15:50:29 +0000 (UTC)
Message-ID: <9e5d4200-9fc7-4dcc-accb-f8f59ed6eb50@xs4all.nl>
Date: Mon, 13 Nov 2023 16:50:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, nl
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Jack Zhu <jack.zhu@starfivetech.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v6.8] Add StarFive Camera Subsystem driver
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This adds the starfive staging driver.

Regards,

	Hans

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.8b

for you to fetch changes up to 84448ae2eedb93cd2ebb121f182b169402b1a4cd:

  media: staging: media: starfive: camss: Add TODO file (2023-11-13 13:29:42 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Jack Zhu (9):
      media: dt-bindings: Add JH7110 Camera Subsystem
      media: admin-guide: Add starfive_camss.rst for Starfive Camera Subsystem
      media: staging: media: starfive: camss: Add core driver
      media: staging: media: starfive: camss: Add video driver
      media: staging: media: starfive: camss: Add ISP driver
      media: staging: media: starfive: camss: Add capture driver
      media: staging: media: starfive: camss: Add interrupt handling
      media: staging: media: starfive: camss: Register devices
      media: staging: media: starfive: camss: Add TODO file

 Documentation/admin-guide/media/starfive_camss.rst                 |  72 ++++++
 Documentation/admin-guide/media/starfive_camss_graph.dot           |  12 +
 Documentation/admin-guide/media/v4l-drivers.rst                    |   1 +
 Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml | 180 +++++++++++++
 MAINTAINERS                                                        |   9 +
 drivers/staging/media/Kconfig                                      |   2 +
 drivers/staging/media/Makefile                                     |   1 +
 drivers/staging/media/starfive/Kconfig                             |   5 +
 drivers/staging/media/starfive/Makefile                            |   2 +
 drivers/staging/media/starfive/camss/Kconfig                       |  17 ++
 drivers/staging/media/starfive/camss/Makefile                      |  13 +
 drivers/staging/media/starfive/camss/TODO.txt                      |   4 +
 drivers/staging/media/starfive/camss/stf-camss.c                   | 436 ++++++++++++++++++++++++++++++++
 drivers/staging/media/starfive/camss/stf-camss.h                   | 134 ++++++++++
 drivers/staging/media/starfive/camss/stf-capture.c                 | 603 ++++++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/starfive/camss/stf-capture.h                 |  87 +++++++
 drivers/staging/media/starfive/camss/stf-isp-hw-ops.c              | 445 ++++++++++++++++++++++++++++++++
 drivers/staging/media/starfive/camss/stf-isp.c                     | 382 ++++++++++++++++++++++++++++
 drivers/staging/media/starfive/camss/stf-isp.h                     | 428 +++++++++++++++++++++++++++++++
 drivers/staging/media/starfive/camss/stf-video.c                   | 572 +++++++++++++++++++++++++++++++++++++++++
 drivers/staging/media/starfive/camss/stf-video.h                   | 100 ++++++++
 21 files changed, 3505 insertions(+)
 create mode 100644 Documentation/admin-guide/media/starfive_camss.rst
 create mode 100644 Documentation/admin-guide/media/starfive_camss_graph.dot
 create mode 100644 Documentation/devicetree/bindings/media/starfive,jh7110-camss.yaml
 create mode 100644 drivers/staging/media/starfive/Kconfig
 create mode 100644 drivers/staging/media/starfive/Makefile
 create mode 100644 drivers/staging/media/starfive/camss/Kconfig
 create mode 100644 drivers/staging/media/starfive/camss/Makefile
 create mode 100644 drivers/staging/media/starfive/camss/TODO.txt
 create mode 100644 drivers/staging/media/starfive/camss/stf-camss.c
 create mode 100644 drivers/staging/media/starfive/camss/stf-camss.h
 create mode 100644 drivers/staging/media/starfive/camss/stf-capture.c
 create mode 100644 drivers/staging/media/starfive/camss/stf-capture.h
 create mode 100644 drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
 create mode 100644 drivers/staging/media/starfive/camss/stf-isp.c
 create mode 100644 drivers/staging/media/starfive/camss/stf-isp.h
 create mode 100644 drivers/staging/media/starfive/camss/stf-video.c
 create mode 100644 drivers/staging/media/starfive/camss/stf-video.h

