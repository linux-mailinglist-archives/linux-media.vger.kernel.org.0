Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75BCB375EE1
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 04:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbhEGCyr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 22:54:47 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:44095 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229663AbhEGCyr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 22:54:47 -0400
X-UUID: 85cb6e1275724f86bd0e99d5a0625899-20210507
X-UUID: 85cb6e1275724f86bd0e99d5a0625899-20210507
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
        (envelope-from <john.wei@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1295018239; Fri, 07 May 2021 10:53:46 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 10:53:44 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 7 May 2021 10:53:44 +0800
From:   <john.wei@mediatek.com>
To:     <john.wei@mediatek.com>, <louis.kuo@mediak.com>,
        <mchehab@kernel.org>, <matthias.bgg@gmail.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>
Subject: [RFC PATCH V0 0/2] media: v4l2: extend framework to support advanced feature of Mediatek Camsys driver
Date:   Fri, 7 May 2021 10:53:35 +0800
Message-ID: <1620356017-26486-1-git-send-email-john.wei@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This is the first version of the RFC patch series to v4l2 and media framework
to support virtual channel (an advanced feature of MIPI CSI). Virtual channel
was used commonly among modern image sensor. It was used to transfer
metadata of an image such as statistical data of AE or AF.Some advanced
features of camera such as HDR (High dynamic range), PDAF (Phase Detection
Auto Focus) were achieved by virtual channel. Medaitek made some modification
to frame descriptor based on https://patchwork.kernel.org/patch/10875875/ and
https://patchwork.kernel.org/patch/10875875/.We extend the struct
v4l2_mbus_frame_desc_entry by add enable, hsize, vsize and user_data_desc.
With this modification, frame descriptor are now more powerful to meet all
kinds of need among different applications. Here is an example that we use
frame descriptor to describe all data streams in a frame output by a
 stagger sensor.

static struct v4l2_mbus_frame_desc_entry frame_desc_cus1[] = {
        {
                .bus.csi2 = {
                        .channel = 0,
                        .data_type = 0x2b,
                        .enable = 1,
                        .hsize = 0xF00,
                        .vsize = 0x870,
                        .user_data_desc = V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_HDR_LE,
                },
        },
        {
                .bus.csi2 = {
                        .channel = 1,
                        .data_type = 0x2b,
                        .enable = 1,
                        .hsize = 0xF00,
                        .vsize = 0x870,
                        .user_data_desc = V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_HDR_SE,
                },
        },
};

The first data stream, data for long exposure was transfer by channel 0 with
data type 0x2b and the resolution was 0xF00 by horizontal and 0x870 by vertical.
The second data stream, data for short exposure was transfer by channel 1
with data type 0x2b and the resolution was also 0xF00 by horizontal and 0x870
by vertical. Both long exposure and short exposure data will be fused in ISP
stage to output a HDR image.

  media: v4l2: Add fields to frame descriptors
  media: v4l2-ctrl: Add user defined base for ISP user control

 include/media/v4l2-subdev.h        |   25 ++++++++++++++++++++++++-
 include/uapi/linux/v4l2-controls.h |   10 ++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)

