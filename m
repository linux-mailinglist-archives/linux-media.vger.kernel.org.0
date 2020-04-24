Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AEC71B7AAD
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2020 17:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728106AbgDXPxt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Apr 2020 11:53:49 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:51767 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727108AbgDXPxt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Apr 2020 11:53:49 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id S0e7jHcrIlKa1S0eAjPv24; Fri, 24 Apr 2020 17:53:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587743626; bh=HT2YmloE2aU8gylKuK95lBifz+ZtAMS7l3rUqu/z2yM=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Mo87iaFEWL/SkBkog5XxWRrSiNt7GAWnrs86N28ABTGzUmQkmYPyfBVKwwrSvz3XG
         g4weDESJF8TBAGihogo2L7RoqoPFTGiPUGxK2719sOEfxOMppS/hAp++VuTctYuV8S
         a2zjGnESHYuxNFuNsdKqWnxNn/M0ye0kzDkWnBmG7q0mVGGPVKmLQK1qP+aGJeX8EI
         nM6IqjDeHevRBUy5Cw5Jwrf8H2VDrRUZ94ADUY8xQ6Z0lbs1kWxhoIlqCn5vt20HPj
         kD6W3coTRVvvi69i7hxzu+thB0p9t7UBQ2O6ar/RCOKhSzCGBDZ4RDtDy+osAJ2YOb
         8mgU+uqO69oRw==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.8] Add V4L2_CAP_IO_MC, extend VIDIOC_ENUM_FMT
Message-ID: <d999f775-4a4e-b95e-62f3-a306a0c1ad98@xs4all.nl>
Date:   Fri, 24 Apr 2020 17:53:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfGRt/jSHn3At7NFeGypvMs6M1giTxAjGn5wFxxgWmho4QheOSCvWzy+CRl5LOdEF5QWUxkANFodmeiHfXonXoEqUhJvu9WmEJ9VaF3QCk3qNOTw/j2Ag
 EtkT5pgcEHehhAkuN1+P5BQOej9S4kOBnQ5aGUeaFw3GfRDO5G1F9YfNVntU9gCwvAOWzZ5gkrwyoa+8EQ6azVVveM0dqP1L4hPsu2sK3hdwGlpzBGxLiiQg
 6vNvUW1Hr2/Ob9yIwn17J82YrbsD7Cf1c0RMJJ2FwyC8EbxaOv/iOZZXjToB8sQW
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Note: after this is applied v4l2-compliance needs to be synced to these
API changes and two patches have to be applied on top:

https://patchwork.linuxtv.org/patch/63301/
https://patchwork.linuxtv.org/patch/63302/

I'll do that once this PR is merged.

Regards,

	Hans

The following changes since commit 4bdbff4da40584ec2225bb429b7c66ad54d19cda:

  media: tuners: Kconfig: add some missing VIDEO_V4L2 dependencies (2020-04-23 07:57:27 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.8e

for you to fetch changes up to bd0f67f1f204fa7331258feb62f2e22fb14f1dea:

  vimc: Make use of V4L2_CAP_IO_MC (2020-04-24 16:07:27 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Laurent Pinchart (2):
      media: pci: Fill v4l2_fmtdesc with designated initializers
      media: v4l2: Extend VIDIOC_ENUM_FMT to support MC-centric devices

Niklas Söderlund (4):
      v4l2-dev/ioctl: Add V4L2_CAP_IO_MC
      rcar-vin: Make use of V4L2_CAP_IO_MC
      staging/intel-ipu3: Make use of V4L2_CAP_IO_MC
      vimc: Make use of V4L2_CAP_IO_MC

 Documentation/userspace-api/media/v4l/vidioc-enum-fmt.rst    | 27 +++++++++++++---
 Documentation/userspace-api/media/v4l/vidioc-querycap.rst    |  6 ++++
 Documentation/userspace-api/media/videodev2.h.rst.exceptions |  1 +
 drivers/media/pci/cx18/cx18-ioctl.c                          | 22 +++++++++----
 drivers/media/pci/ivtv/ivtv-ioctl.c                          | 26 ++++++++-------
 drivers/media/platform/rcar-vin/rcar-v4l2.c                  | 40 +++++++++++++----------
 drivers/media/test-drivers/vimc/vimc-capture.c               | 14 +++++++--
 drivers/media/v4l2-core/v4l2-dev.c                           | 25 +++++++++++----
 drivers/media/v4l2-core/v4l2-ioctl.c                         | 70 +++++++++++++++++++++++++++++++++++++----
 drivers/staging/media/ipu3/ipu3-v4l2.c                       | 64 +++++--------------------------------
 include/uapi/linux/videodev2.h                               |  5 ++-
 11 files changed, 189 insertions(+), 111 deletions(-)
