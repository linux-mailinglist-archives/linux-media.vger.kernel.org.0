Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C36851AD866
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 10:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729607AbgDQISv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 04:18:51 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:34435 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729176AbgDQISu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 04:18:50 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id PMCyjhz6n7xncPMD1j9nHt; Fri, 17 Apr 2020 10:18:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1587111527; bh=OSua5WnWFDiV3TO7fjRTWjE0lX/MQBHo3qPLIHe6aaM=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=NWssYpZJ8DnBZmNzP3mnE2FP7jP5Oef/ud4nt7lv3dAXCqnqujJrd+DT/2RASyL0J
         vd1FB2uAt50PBwukqFPpxbnCEMjfllU2EPHsdXjacXPe74eobTbS1Gc1lT+K7wYg6/
         flsj1AZCRwtqF4BhVQdNT7e4xNzuOLNT8uJchEJAnOWQ8voaU9eBEU1f8cdEfzOdYW
         AGDFVgIeBAPLRsieYGxfxyAOp3aRPBnRiN1MVOkGBCgVUoLIcOfClf6FC1rl/g47G0
         AGE7R+horPJJc80s9eWECtvvCVPsoy2iplMUegzPMWhdNnwsYi4zOGxX5ahmn5CTUb
         wHusuqs229eXA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.8] Various fixes/enhancements
Message-ID: <6a56ccf7-4c26-b3ad-eb3a-0647944c2f95@xs4all.nl>
Date:   Fri, 17 Apr 2020 10:18:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMC4dWMPZNMsdTCvhE+iQwAojfeWKkR+G2t23mcme+VTMylt8noo9MJtPEYL1AjbG2QIbvSJ/RwvE5zSz54Nq1nwqr7F2SC6WvWZkCRbE6vlTPJLhTha
 H9u9ePN1+KeAXEOtj9d9laVhPwzxAWW4ndG3+3aoL4t9GJdnOdhei9dB66YqEWoXUq683imZrtJ1Qe/v4HmZmyICdAeIT1UQnhXhbPOCkvRol1ujv7Qaf9nP
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit ceab3ac1e60d70afb4e25147d60817c513f235f7:

  media: dvb-frontends: DUMMY_FE should depends on DVB_CORE (2020-04-17 09:21:47 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.8c

for you to fetch changes up to 0f72df4db95844184f49bbdfeaae013919c12c1b:

  dt-bindings: media: rockchip-rga: add power-domains property (2020-04-17 10:05:10 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Dafna Hirschfeld (8):
      media: staging: rkisp1: remove mbus field from rkisp1_sensor_async
      media: staging: rkisp1: replace the call to v4l2_async_notifier_parse_fwnode_endpoints_by_port
      media: staging: rkisp1: cap: cleanup in mainpath config for uv swap format
      media: staging: rkisp1: cap: fix value written to uv swap register in selfpath
      media: staging: rkisp1: cap: change the logic for writing to uv swap register
      media: staging: rkisp1: cap: support uv swap only for semiplanar formats
      media: staging: rkisp1: cap: support uv swapped planar formats
      media: staging: rkisp1: cap: remove unsupported formats

Hans Verkuil (2):
      v4l2-ctrls: v4l2_ctrl_g/s_ctrl*(): don't continue when WARN_ON
      v4l2-ctrls: add __v4l2_ctrl_s_ctrl_compound()

Helen Koike (2):
      media: staging: rkisp1: cap: fix return values from pm functions
      media: staging: rkisp1: cap: serialize start/stop stream

Johan Jonker (2):
      dt-bindings: media: convert rockchip rga bindings to yaml
      dt-bindings: media: rockchip-rga: add power-domains property

Marco Felsch (1):
      media: v4l2-image-sizes: add HD and Full-HD definitions

Philipp Zabel (1):
      media: coda: add RC enable controls

 Documentation/devicetree/bindings/media/rockchip-rga.txt  |  34 --------------
 Documentation/devicetree/bindings/media/rockchip-rga.yaml |  83 +++++++++++++++++++++++++++++++++
 MAINTAINERS                                               |   1 +
 drivers/media/platform/coda/coda-bit.c                    |   9 +++-
 drivers/media/platform/coda/coda-common.c                 |  10 ++++
 drivers/media/platform/coda/coda.h                        |   2 +
 drivers/media/v4l2-core/v4l2-ctrls.c                      |  26 +++++++----
 drivers/staging/media/rkisp1/TODO                         |   3 --
 drivers/staging/media/rkisp1/rkisp1-capture.c             |  67 ++++++++++++++-------------
 drivers/staging/media/rkisp1/rkisp1-common.h              |   5 +-
 drivers/staging/media/rkisp1/rkisp1-dev.c                 | 106 ++++++++++++++++++++++---------------------
 drivers/staging/media/rkisp1/rkisp1-isp.c                 |  52 +++++++--------------
 include/media/v4l2-ctrls.h                                |  49 ++++++++++++--------
 include/media/v4l2-image-sizes.h                          |   6 +++
 14 files changed, 265 insertions(+), 188 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/rockchip-rga.txt
 create mode 100644 Documentation/devicetree/bindings/media/rockchip-rga.yaml
