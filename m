Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC0711BB1C9
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 01:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgD0XCx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Apr 2020 19:02:53 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:42127 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgD0XCx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Apr 2020 19:02:53 -0400
Date:   Mon, 27 Apr 2020 23:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1588028569;
        bh=j/6gQ7g8eXIunOpgenLWkuAMisfz4Ev0v5T6VrKg0bQ=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=YC79boMjvYrTIFrpPt5gAAIPjDD9ySNxBuCesHL7N+zfWnmLoeAQ0XavTFma+TtPa
         WJ5uw4Qyf0Of/FEnCtSPSkCGAuG7cWfVAGKCasUTPOT6RthonRJnzO+EFGx3SUoHqF
         /VR06P9UfLZSE8PJz0pfqB8WbROtqlaHYCY+rkqo=
To:     linux-media@vger.kernel.org
From:   =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
        <nfraprado@protonmail.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
Reply-To: =?UTF-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= 
          <nfraprado@protonmail.com>
Subject: [PATCH v3 0/3] media: vimc: Add support for {RGB,BGR,GBR}888 bus formats on debayer source pad
Message-ID: <20200427230234.3114565-1-nfraprado@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series adds support for the missing RGB888_*, BGR888_* and GBR88=
8_*
media bus formats on the source pad of debayer subdevices of the vimc drive=
r.
These additional bus formats enable a wider range of formats to be configur=
ed
on the topologies, making it possible to test more real use cases.
It also enables video to be streamed in the BGR pixelformat on /dev/video3.

The first patch makes it possible to have multiple media bus codes mapping =
to
the same pixelformat, so that, for example, all RGB888_* media bus formats =
use
the same RGB24 pixelformat.

The second patch maps the missing RGB888_*, BGR888_* and GBR888_* media bus
codes to the RGB24 and BGR24 pixelformats.
Since there isn't a GBR24 pixelformat, the GBR888_1X24 bus code maps to the
RGB24 pixelformat.

The third patch enables the source pad of the debayer subdevice to use the
added media bus formats.

This patch series passed all tests of v4l2-compliance:
$ compliance_git -m /dev/media0
v4l2-compliance SHA: 81e45d957c4db39397f893100b3d2729ef39b052, 64 bits, 64-=
bit time_t
Grand Total for vimc device /dev/media0: 461, Succeeded: 461, Failed: 0, Wa=
rnings: 0

As a side note, when listing the pads containing the new formats added, I
noticed that MEDIA_BUS_FMT_RGB888_3X8 doesn't have its name displayed by
v4l2-ctl, but from my understanding that should be a bug in v4l-utils.

$ v4l2-ctl -d /dev/v4l-subdev2 --list-subdev-mbus-codes 1
ioctl: VIDIOC_SUBDEV_ENUM_MBUS_CODE (pad=3D1)
=090x1014: MEDIA_BUS_FMT_GBR888_1X24
=090x1013: MEDIA_BUS_FMT_BGR888_1X24
=090x101b: MEDIA_BUS_FMT_BGR888_3X8
=090x100a: MEDIA_BUS_FMT_RGB888_1X24
=090x100b: MEDIA_BUS_FMT_RGB888_2X12_BE
=090x100c: MEDIA_BUS_FMT_RGB888_2X12_LE
=090x101c
=090x1011: MEDIA_BUS_FMT_RGB888_1X7X4_SPWG
=090x1012: MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA
=090x100f: MEDIA_BUS_FMT_RGB888_1X32_PADHI

Changes in v3:
- Make loop in vimc_mbus_code_by_index() clearer by using break instead of =
if
- Suggested by Helen:
    - Rename vimc_deb_is_src_code_invalid() to vimc_deb_src_code_is_valid()
    - Change vimc_deb_src_code_is_valid() to return bool
- Suggested by Shuah:
    - Use VIMC_PIX_FMT_MAX_CODES define instead of hardcoded value for the
      size of code array in struct vimc_pix_map

Changes in v2:
- Fix vimc_mbus_code_by_index not checking code array bounds
- Change commit messages to reflect v2 changes
- Suggested by Helen:
    - Rename variables
    - Fix array formatting
    - Change code array size
    - Add comment about vimc_mbus_code_by_index return value
    - Add vimc_deb_is_src_code_valid function
    - Add other BGR888 and RGB888 formats to BGR24 and RGB24 pixelformats
    - Add other BGR888 and RGB888 formats to debayer source pad supported
      formats
- Suggested by Ezequiel:
    - Change cover letter to better explain this patch series

You can find v1 here: https://patchwork.linuxtv.org/cover/61391/

N=C3=ADcolas F. R. A. Prado (3):
  media: vimc: Support multiple media bus codes for each pixelformat
  media: vimc: Add missing {RGB,BGR,GBR}888 media bus codes
  media: vimc: deb: Add support for {RGB,BGR,GBR}888 bus formats on
    source pad

 drivers/media/test-drivers/vimc/vimc-common.c | 83 +++++++++++++------
 drivers/media/test-drivers/vimc/vimc-common.h | 13 ++-
 .../media/test-drivers/vimc/vimc-debayer.c    | 61 +++++++++++---
 drivers/media/test-drivers/vimc/vimc-scaler.c | 10 ++-
 drivers/media/test-drivers/vimc/vimc-sensor.c |  6 +-
 5 files changed, 129 insertions(+), 44 deletions(-)

--=20
2.26.1


