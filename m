Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0E5B20D58
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 18:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727367AbfEPQtL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 12:49:11 -0400
Received: from casper.infradead.org ([85.118.1.10]:35514 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfEPQtK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 12:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=tKk911ROe0tCzfs+bPSmBKTBLaoEpyGgcQBfu96Z0/A=; b=o+KMLHQcUSCKeA1ZIZKrnKMdM/
        2nBNKGsEqWbYOWDUBEJtN6ARs6K3xOzhRIbBu2ouzL9VarJ/1dPQ0hq48iBBvLE86aeYUccksRnwa
        DZGA5XVXUwaLaCgj1B/uhN70TY+TH1m7aip/IQUcYt47KNOaVevs1pqlAZfD9b8NIslR6ush0LUlx
        z+ILLXF0w0RH7YmF2uviGbTRmkMpMpIVDeWUBQq9unDNurrRbP41/m0GNMtsFWnv90dzfkvpntmAx
        uQoOdmEczCNaohZ/EG3SplP0ZH4U6SeKzq6CS5evW6pLT6IcewLG75WKabgEzVoORfVjyfJaAqoiY
        doYP8aOg==;
Received: from 179.186.99.85.dynamic.adsl.gvt.net.br ([179.186.99.85] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hRJZ6-0001JX-EY; Thu, 16 May 2019 16:49:08 +0000
Date:   Thu, 16 May 2019 13:49:02 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v5.2-rc1] media fixes
Message-ID: <20190516134902.59a3a855@coco.lan>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linus,

Please pull from:
  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.2-1

For some fixes for some platform drivers (rockchip, atmel, omap, daVinci,
tegra-cec, coda and rcar).=20

It also includes a fix on one of the V4L2 uAPI doc, explaining a border cas=
e.

Thanks!
Mauro

The following changes since commit 0d672fffb447aa1699d76fdacd90dc31eeb66d97:

  media: dt-bindings: aspeed-video: Add missing memory-region property (201=
9-04-30 13:53:12 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media tags/me=
dia/v5.2-1

for you to fetch changes up to fc8670d1f72b746ff3a5fe441f1fca4c4dba0e6f:

  media: rockchip/vpu: Fix/re-order probe-error/remove path (2019-05-15 05:=
38:22 -0400)

----------------------------------------------------------------
media updates for v5.2-rc1

----------------------------------------------------------------
Boris Brezillon (2):
      media: rockchip/vpu: Get vdev from the file arg in vidioc_querycap()
      media: rockchip/vpu: Initialize mdev->bus_info

Dan Carpenter (2):
      media: omap_vout: potential buffer overflow in vidioc_dqbuf()
      media: davinci/vpbe: array underflow in vpbe_enum_outputs()

Eugen Hristev (3):
      media: atmel: atmel-isc: limit incoming pixels per frame
      media: atmel: atmel-isc: fix INIT_WORK misplacement
      media: atmel: atmel-isc: fix asd memory allocation

Hans Verkuil (2):
      media: field-order.rst: clarify FIELD_ANY and FIELD_NONE
      media: tegra-cec: fix cec_notifier_parse_hdmi_phandle return check

Jonas Karlman (3):
      media: rockchip/vpu: Do not request id 0 for our video device
      media: rockchip/vpu: Add missing dont_use_autosuspend() calls
      media: rockchip/vpu: Fix/re-order probe-error/remove path

Niklas S=C3=B6derlund (2):
      media: rcar-csi2: restart CSI-2 link if error is detected
      media: rcar-csi2: Propagate the FLD signal for NTSC and PAL

Philipp Zabel (1):
      media: coda: fix unset field and fail on invalid field in buf_prepare

Rui Miguel Silva (1):
      media: staging/imx: add media device to capture register

 Documentation/media/uapi/v4l/field-order.rst       | 16 +++--
 drivers/media/platform/atmel/atmel-isc-regs.h      | 19 ++++++
 drivers/media/platform/atmel/atmel-isc.c           | 46 +++++++++++++--
 drivers/media/platform/coda/coda-common.c          | 10 ++++
 drivers/media/platform/davinci/vpbe.c              |  2 +-
 drivers/media/platform/omap/omap_vout.c            | 15 ++---
 drivers/media/platform/rcar-vin/rcar-csi2.c        | 68 ++++++++++++++++++=
++--
 drivers/media/platform/tegra-cec/tegra_cec.c       |  4 +-
 drivers/staging/media/imx/imx-ic-prpencvf.c        |  2 +-
 drivers/staging/media/imx/imx-media-capture.c      |  6 +-
 drivers/staging/media/imx/imx-media-csi.c          |  2 +-
 drivers/staging/media/imx/imx-media.h              |  3 +-
 drivers/staging/media/imx/imx7-media-csi.c         |  2 +-
 .../staging/media/rockchip/vpu/rockchip_vpu_drv.c  | 14 +++--
 .../staging/media/rockchip/vpu/rockchip_vpu_enc.c  |  3 +-
 include/media/davinci/vpbe.h                       |  2 +-
 16 files changed, 172 insertions(+), 42 deletions(-)

