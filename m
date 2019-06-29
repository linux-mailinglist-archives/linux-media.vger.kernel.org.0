Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5502F5AAB3
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 14:14:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbfF2MOg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 08:14:36 -0400
Received: from mout.gmx.net ([212.227.17.21]:43857 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727039AbfF2MOf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 08:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561810444;
        bh=IgtQslhkTRAPZTdIBjC2QqunwNN90a5/Hkx+p3JH1so=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=NAA7PjMUI5GHjC17OvfXGa+jyv2yw8+ASxKtbfPUbCVKO5UtecE99tDi7oPYu0Epx
         LLSiS+5A4+Pnu6scz55sIHdZJ+U/hftYdegjwN2hxJRZQyh4tyHMgFeUcIUIMcPZLe
         36yos/uT8uQ68Q0D701JmZwLzBMO9w5/FRQ7K6AI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx103 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0LwJko-1id2261skA-0185Vs; Sat, 29 Jun 2019 14:14:04 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 00/29] staging: bcm2835-camera: Improvements
Date:   Sat, 29 Jun 2019 14:13:15 +0200
Message-Id: <1561810410-8829-1-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:P7U/wtS7v06WxFnAVxhWHIE9GlgDT9jYUUoPl+qegISrELkH2qI
 TLdd4N26rGGApPf6GhIj8Reio5vXmnEl7JHHKd/6fuS0rh8keHsidukJBioOLPPm+XRkh/s
 hMUEk34chSkhS4eoZteSeXyZgi0+tjBVfoGf4PIzUCEnCxeEYZt/J0LHUnNQUKMzb8p397w
 cftwDolL+MHP58LV5OI0Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Cu+rMgQ67QE=:SPPHy4ODqLgCN6NyTmZdxY
 dNt2t7uJ8unPlQo2skoClrCSY2yB86U5PVE1aw29ocKPSz2EnIEh40IwK4ktvU/P1J0TRdKos
 ez6fSMaIifQ1r5vm6O4SQLp1ltBkq3YarGtqq6gg1xk2ffjM3utgVIswx2cwG1t8HAe2/g3q1
 dCq047X/P61NTnc98PSt2eLnpptU0rGcvEGeJdE/aiSJ181Q3qaQQ1Syd43oAQuPMduhys7xt
 xyZ4estYZZHYeAcp1xdNdx6D5y5fQN5pPz+BXh6Xk013DqXcp5L0yTM125RnSs9ztE9l/teqp
 GSbC42OeIMtKG/o9IQc7Vz6DtiurVKxajdsDzUcffTkhxJOETHzpkdQPg3y/JT1jzif76k4Ro
 niWDI1b3fg3jeTFt9acukepeVVxGF5qqLP+IzZqJqrsMwu+JpHKPI6o2QeV54NWZ+SrIqa4sg
 F3N9GUotSzvPrH/hnr3FJ1B3gtp78yXY9MHwJcbHzXn+9ijfVoluEJyX0Gq8oghJ0gXC4zWet
 WQrNfZ3qnKINwt2QnhuRMAJCOujrTEXwd86nkCZRSHF1YGvBxuUYzQGx/2CHM2QuYfhyZuwtI
 zouijWcHeE77tj+tbhybn6v7RyKW9Hs0JS/VUL34I0GUAjbcniFXpQuO2/0R5VqmWXOwpzakO
 T2CrWt9B1tqH+kmeiYDI+nE31W5GseYswpGQQsfPTsWeP1e/hGA/IrITzRSOaXUHKUH8o3N3d
 PfxXVRjQjDuozWv485NbKQg1UIKy0TbgEVCdcAV9NSWZH6X8TQRxWYChuiPjs1oorMY4Rlyks
 2s9JotR16VLl9rcQa1UsZQtWzf101xJP7TM84rXZoN6YvZi7NJCHMhq4hm9IImPBHX7MnLuPe
 B4MhpN0D1Qinqn9ICGAC4qyZYOWeEFovcilaEpoXhI+Kva45QHZs+1rt0p9nhS6hSdVLxi2P2
 VaRtfWvZxtrYtDCYO/afKQALP76VgGj3/QJywiN5LiyqEUG1rztWc2EeSM4PDR7s0kLYsLTTD
 bdfiI45irdyy36Jfku4AD9hdVeD1odoiTdcE3rjFX0B7R4USmjWEj51+Zm5gtHG3OgiULbL06
 5+XUfxE4RVCaLM=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This is an attempt to help Dave Stevenson to get all the fixes and
improvements of the bcm2835-camera driver into mainline.

Mostly i only polished the commit logs for upstream.

The series based on the latest bugfix V2 of staging: bcm2835-camera: Resto=
re
return behavior of ctrl_set_bitrate().

Changes in V2:
- add my own SOB
- drop H264 timestamp patches (1,19 from V1) from series
- addressed Dan's and Hans' comments in patch 6, 29 and 30

Dave Stevenson (29):
  staging: bcm2835-camera: Check the error for REPEAT_SEQ_HEADER
  staging: bcm2835-camera: Replace spinlock protecting context_map with
    mutex
  staging: bcm2835-camera: Do not bulk receive from service thread
  staging: bcm2835-camera: Correctly denote key frames in encoded data
  staging: bcm2835-camera: Return early on errors
  staging: bcm2835-camera: Remove dead email addresses
  staging: bcm2835-camera: Fix comment style violations.
  staging: bcm2835-camera: Fix spacing around operators
  staging: bcm2835-camera: Reduce length of enum names
  staging: bcm2835-camera: Fix multiple line dereference errors
  staging: bcm2835-camera: Fix brace style issues.
  staging: bcm2835-camera: Fix missing lines between items
  staging: bcm2835-camera: Fix open parenthesis alignment
  staging: bcm2835-camera: Ensure all buffers are returned on disable
  staging: bcm2835-camera: Remove check of the number of buffers
    supplied
  staging: bcm2835-camera: Handle empty EOS buffers whilst streaming
  staging: bcm2835-camera: Set sequence number correctly
  staging: bcm2835-camera: Add multiple inclusion protection to headers
  staging: bcm2835-camera: Unify header inclusion defines
  staging: bcm2835-camera: Fix multiple assignments should be avoided
  staging: bcm2835-camera: Fix up mmal-parameters.h
  staging: bcm2835-camera: Use enums for max value in controls
  staging: bcm2835-camera: Correct V4L2_CID_COLORFX_CBCR behaviour
  staging: bcm2835-camera: Remove/amend some obsolete comments
  staging: mmal-vchiq: Avoid use of bool in structures
  staging: bcm2835-camera: Fix stride on RGB3/BGR3 formats
  staging: bcm2835-camera: Add sanity checks for queue_setup/CREATE_BUFS
  staging: bcm2835-camera: Set the field value within each buffer
  staging: bcm2835-camera: Correct ctrl min/max/step/def to 64bit

 .../vc04_services/bcm2835-camera/bcm2835-camera.c  | 366 ++++++++++++----=
-----
 .../vc04_services/bcm2835-camera/bcm2835-camera.h  |  32 +-
 .../vc04_services/bcm2835-camera/controls.c        | 184 +++++------
 .../vc04_services/bcm2835-camera/mmal-common.h     |  12 +-
 .../vc04_services/bcm2835-camera/mmal-encodings.h  |   9 +-
 .../vc04_services/bcm2835-camera/mmal-msg-common.h |   9 +-
 .../vc04_services/bcm2835-camera/mmal-msg-format.h | 104 +++---
 .../vc04_services/bcm2835-camera/mmal-msg-port.h   | 133 ++++----
 .../vc04_services/bcm2835-camera/mmal-msg.h        | 150 +++++----
 .../vc04_services/bcm2835-camera/mmal-parameters.h | 286 +++++++++-------
 .../vc04_services/bcm2835-camera/mmal-vchiq.c      | 159 +++++----
 .../vc04_services/bcm2835-camera/mmal-vchiq.h      |  22 +-
 12 files changed, 809 insertions(+), 657 deletions(-)

=2D-
2.7.4

