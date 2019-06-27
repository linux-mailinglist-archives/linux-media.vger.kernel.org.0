Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB7BC58A50
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 20:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbfF0S5R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 14:57:17 -0400
Received: from mout.gmx.net ([212.227.15.18]:57611 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726542AbfF0S5P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 14:57:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561661808;
        bh=DXyEL84Fhwic9IwOQd4ecx8Bzy/Ux/PAo++faZcFMWg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=Nr8i+5iIX0Ss7odRtqbnO3Z582pC9O5maYlaVwiPk9aRQ5fe4oRccCmtLNheW+pc5
         FpEm+t3IM0NaSoFpBSBqVKDp2yAqh1GUq/aabo1nwbTe3I60g514EQcbduxmkhCtLN
         upHN8PEl74Irl4ZKh70kkXcTBaLNyiJTU4awV/jk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MN0jA-1heMeG1kE4-006bb9; Thu, 27 Jun 2019 20:56:48 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 00/31] staging: bcm2835-camera: Improvements
Date:   Thu, 27 Jun 2019 20:55:57 +0200
Message-Id: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:8Eqgko+EnTeRwglBG9QqHkcenf6ctqYS1XJThx9/cgBmPM0yjgc
 bJSV21uSZaYRtlnkLtLj70aZ89Xz39nyheGu26ma0Wn+TVzR+Zjbx6RDSNth3ySyIRhxVUn
 ho8Nd87tVSLtZZTc04JZUzTJSiJHbHgn/nINCoLDWBQoqSZ3wdzutUemH61423vFDPOL6at
 Ouw8rkfdKqrNqnWwlSGkg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aYEhy3KH+30=:5ImWLnoveFbbB3DwxG2Otx
 FYq7BDwVzhhJfaOy82+YzNNFYdIRA4Z3hmt9On9UK0UXtRz58UdtEmkDVpUwxkQ23NDi/8kJX
 f4osxGlARFIwXFzCSWXnTisyYKbMFseZsFTUC7R9XKIEZXenM4y3WFG3P3LpOGlehZoVpJ1qK
 ZiabUM+8C9ZzKDsPOwPuSCiGbChPstvbxlCOdu1mEX3rL5hv7X07ii+D9l96inhYqllRcmSFh
 WzmYTbc/bn2Ly2D0RVQMFfbhf8MqrX5cJNpm08iu5ome4drsIDVz3Jyow0GC+GYyeAZaOU0fG
 NK6bXmJIirKbHpz36QSC3y2K0gGDiu0o4bDCGM5Q5ahlm/Vjl+p8fZJ05VvEl113AK3LhTIxS
 zuuAuB6sWirgkYZVoRvB3aC/31y0wmWZ02XRX3eFDz0isPT3Stk2Rf3giN4G3LmboZ51XS2Df
 GsZtVqOylJNVgDktOR+eOrllrZWBPN2zwbX1JImkeJR9n9+bXArLvcVsKvAIfe+/OgM0X9Ixs
 z0exYBANnqgF5oIEL8EvFwICi+Z944+4Lxg1OAscbNQR02s0hLbsIWQOACuD4g6q0gcAfw/ZB
 eAwLrtM7efjD4JFcjwbIWuhQXMnmkuI+yjAV1pyfSHJ8xVefEaDBGD118EC3wOQB3RQMcH1ho
 b4PDd79nLIyFlxJkSdGGl7NJzDkCtT78LMCfx6jv1xtq50YXE0mK5BTR/GWiPaJBMcHT9CDQj
 0NK5Fk8zGp2u8l5CYAu05MTXpVn7tvKosXrD/1xvTyoWjzf2TkonHdlKFi3nEeq+XTl22pwE0
 37+5me83vvdLtOoIDarC3hVgHb2G3VNVNIDeGvlYNhOdhrwNkaCHWN68+FH/Zzb1UvxFyOfhx
 j1vHI0spt7DOp/PtjfUPQBsmF/nIRWLMweggxB9P/bY3yuak4gGtgWUQl7ZzzWnR8rgvIvT5k
 dABQmyDgwyepl/UulX3zv7+upI+vN7N7D+Fed4r/8Re/66TAudvb0L2PxPLDD7i+5eFAlYsZD
 DXkn7bh+bcDYHnVq5xGvnTH3hjFyw9FF3j5pyIxHQ5d/7zDsAC+EQ+deB8FTfcj8RqPiIwo6s
 s/RRnNOQ6UhMcA=
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

Dave Stevenson (31):
  staging: bcm2835-camera: Ensure H264 header bytes get a sensible
    timestamp
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
  staging: bcm2835-camera: Ensure timestamps never go backwards.
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
  staging: bcm2835-camera: Set the field value within ach buffer
  staging: bcm2835-camera: Correct ctrl min/max/step/def to 64bit

 .../vc04_services/bcm2835-camera/bcm2835-camera.c  | 378 ++++++++++++----=
-----
 .../vc04_services/bcm2835-camera/bcm2835-camera.h  |  34 +-
 .../vc04_services/bcm2835-camera/controls.c        | 184 +++++-----
 .../vc04_services/bcm2835-camera/mmal-common.h     |  12 +-
 .../vc04_services/bcm2835-camera/mmal-encodings.h  |   9 +-
 .../vc04_services/bcm2835-camera/mmal-msg-common.h |   9 +-
 .../vc04_services/bcm2835-camera/mmal-msg-format.h | 104 +++---
 .../vc04_services/bcm2835-camera/mmal-msg-port.h   | 133 ++++----
 .../vc04_services/bcm2835-camera/mmal-msg.h        | 150 ++++----
 .../vc04_services/bcm2835-camera/mmal-parameters.h | 286 +++++++++-------
 .../vc04_services/bcm2835-camera/mmal-vchiq.c      | 159 +++++----
 .../vc04_services/bcm2835-camera/mmal-vchiq.h      |  22 +-
 12 files changed, 826 insertions(+), 654 deletions(-)

=2D-
2.7.4

