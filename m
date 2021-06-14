Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6B53A6086
	for <lists+linux-media@lfdr.de>; Mon, 14 Jun 2021 12:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233508AbhFNKfT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Jun 2021 06:35:19 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:50053 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233322AbhFNKdm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Jun 2021 06:33:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id sjsUlbkl9hqltsjsYlmZXM; Mon, 14 Jun 2021 12:31:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623666698; bh=TNJqZcRrzeEPdaRFmIOAmhBOKnjBWBut14V74IFBqJc=;
        h=To:From:Subject:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=npNz/ulGPlPd4nwEjoMdzsYqmoN5whL9J9QCMpF/OxAMfwgvN4Empl12M2pgThUGM
         n5y36r0e3Uz7bLoCfUavF35rzMx1w50plra1VMU3LWR9a4DpK5B2hGFxHWL9nLM4dm
         UAfK80NPMqr96UdVVFmA232pMu8TnM70AaawxoO0N1ROLUwJQjl1R65qfI3YlhYx4U
         66vqdRIn4czjlbz2eI3lKka6ZT8F9g8xIqdBQFjeOq54ja+9vXTMe2CK2xU8C3gYgv
         fExUsaEoFPmGjqkqv+WAWPOIdVO0WeyE33Nxg8E0+4Sqq4kQSoZ79yBF6iBwcxD/kz
         2eOmUiLygDdTA==
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Irui Wang <irui.wang@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@google.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Subject: [GIT PULL FOR v5.14] Support H264 4K on MT8192
Message-ID: <f0d85b90-4fd1-50f6-632f-02d5fec120b2@xs4all.nl>
Date:   Mon, 14 Jun 2021 12:31:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfDEwFCVBR94uR2c+kJH0H0O/+XpUYYnQZY+tsAbW8UZxqoH7VvXYiamL6N6vMXvRfFchs9wBQ+0/98ntSRqdKJ4XC5NEG/v/7zlvWeDA5paRP4rIAaBT
 GyMwpVs+ljb6MKebr/OEeBhJTs5MxDjlYg+7vfrZpx8omPXcN+snCg725MBDrcunhlICrjSeYR9AAACAxIErmjD8BNAnfsIGA0Fxt97kHdqg07mpe6i/yHuH
 UfOBwf7lIRqfBgPgNgYTMlu78qGIxCKPggzMF6Pxy3lWIiuCJ9js1H4foYws5R4X
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The following changes since commit 4c6e0976295add7f0ed94d276c04a3d6f1ea8f83:

  media: uvcvideo: Fix pixel format change for Elgato Cam Link 4K (2021-06-11 11:23:56 +0200)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media_tree.git tags/br-v5.14m

for you to fetch changes up to 9834ccfe04154e9920ecb6dce74d8da8b478a871:

  media: mtk-vcodec: Support MT8192 H264 4K encoding (2021-06-14 12:22:46 +0200)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Alexandre Courbot (1):
      media: mtk-vcodec: venc: remove redundant code

Irui Wang (5):
      dt-bindings: media: mtk-vcodec: Add dma-ranges property
      media: mtk-vcodec: Support 34bits dma address for venc
      dt-bindings: media: mtk-vcodec: Add binding for MT8192 VENC
      media: mtk-vcodec: Add MT8192 H264 venc driver
      media: mtk-vcodec: Support MT8192 H264 4K encoding

 Documentation/devicetree/bindings/media/mediatek-vcodec.txt |  2 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h          |  1 +
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c          | 92 ++++++++++++++++++++++++++-----------------
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c      | 17 ++++++++
 drivers/media/platform/mtk-vcodec/venc/venc_h264_if.c       |  4 ++
 5 files changed, 80 insertions(+), 36 deletions(-)
