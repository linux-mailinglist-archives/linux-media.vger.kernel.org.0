Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF25717DCF
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 13:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235424AbjEaLOw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 07:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235487AbjEaLOs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 07:14:48 -0400
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D95D7129
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 04:14:43 -0700 (PDT)
X-KPN-MessageId: 5715b014-ffa4-11ed-8e3d-005056aba152
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
        by ewsoutbound.so.kpn.org (Halon) with ESMTPS
        id 5715b014-ffa4-11ed-8e3d-005056aba152;
        Wed, 31 May 2023 13:14:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xs4all.nl; s=xs4all01;
        h=content-type:subject:from:to:mime-version:date:message-id;
        bh=u8GSUUNo3DX7zgfvyb62hzxevqjYerVLF9b2LXRQj7o=;
        b=t/s2ceiMvj0o+Wap13u+wVkpyhS+hl7Ro4w5gknc0HbdS/t+LYjCuSVcmb+ogUhiJFWCqCOhRH7z+
         yEWk5YcKEqIHpg/BqSa04Ult5sAidHHva4SPogEgW1PWmbKAt4Y7ryob9jT5wDRWPTThWUypSXqHkt
         jOslbEHszdwbzuTgmuHuwB+v+4pzP+cAJrClL17yAYbsD9/7v6idHZnU9k7xNO+rLIP1iKVHmnDNFz
         PJ2mtqGKU6sNgwI53eCqw0W/PBVdGrLaNdWbCVAaL5Hq5QXuUNI4QDnNSOS+9/MZHIWZ/59bjM5jKH
         4QW888JaKXVH3d++w3Ydy82/fflvWMg==
X-KPN-MID: 33|wWr9mK8aj57HRdZ59Hg+WIJr+RPtewX6rpY+s1emNk3hPMGuhsbA5M8upmg82Cc
 YO/qNFkY7ruWtYw/L07Zj6kLouM9dPFgHvCFA+5wrb0s=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|60NHEvzc0K28c/whZJef/aLKG8h+bYL+X213+I7oUfRwM0sGn06YSk+u0uWm6Sg
 x8eeR3II7VVbdpojindZmDg==
X-Originating-IP: 173.38.220.44
Received: from [10.47.77.214] (unknown [173.38.220.44])
        by smtp.xs4all.nl (Halon) with ESMTPSA
        id 56b09921-ffa4-11ed-bcfb-005056ab7447;
        Wed, 31 May 2023 13:14:41 +0200 (CEST)
Message-ID: <29b5049c-7fa3-cd90-47b1-7be9ce997eb1@xs4all.nl>
Date:   Wed, 31 May 2023 13:14:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Ming Qian <ming.qian@nxp.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [GIT PULL FOR v6.5] mediatek/imx changes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit aafeeaf3d2a8a91a5407c774c578abec79dcff00:

  media: video-mux: update driver to active state (2023-05-26 10:58:18 +0100)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.5h

for you to fetch changes up to 742d5c5f8552daa70818b65363da7055db8c88d3:

  media: imx-jpeg: Support to assign slot for encoder/decoder (2023-05-31 12:33:09 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Ming Qian (1):
      media: imx-jpeg: Support to assign slot for encoder/decoder

Yunfei Dong (8):
      media: mediatek: vcodec: Add debugfs interface to get debug information
      media: mediatek: vcodec: Add debug params to control different log level
      media: mediatek: vcodec: Add a debugfs file to get different useful information
      media: mediatek: vcodec: Get each context resolution information
      media: mediatek: vcodec: Get each instance format type
      media: mediatek: vcodec: Change dbgfs interface to support encode
      media: mediatek: vcodec: Add encode to support dbgfs
      media: mediatek: vcodec: Add dbgfs help function

 drivers/media/platform/mediatek/vcodec/Makefile             |   6 +++
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c   | 215 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h   |  74 +++++++++++++++++++++++++++++
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c |   4 ++
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h     |   4 ++
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.c |   2 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.c    |   8 ++++
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h    |  26 +++++++++--
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg-hw.h           |   1 -
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c              | 135 ++++++++++++++++++++++++++---------------------------
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h              |   5 +-
 11 files changed, 404 insertions(+), 76 deletions(-)
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
 create mode 100644 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.h
