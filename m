Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8360937615D
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 09:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235632AbhEGHrR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 03:47:17 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:51490 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231165AbhEGHrQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 03:47:16 -0400
X-UUID: dabb758a172b4f50a8b0f6e7c7624a13-20210507
X-UUID: dabb758a172b4f50a8b0f6e7c7624a13-20210507
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <louis.kuo@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 213113289; Fri, 07 May 2021 15:46:12 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 15:46:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 7 May 2021 15:46:10 +0800
From:   Louis Kuo <louis.kuo@mediatek.com>
To:     <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>, <mchehab@kernel.org>,
        <matthias.bgg@gmail.com>, <hverkuil-cisco@xs4all.nl>,
        <arnd@arndb.de>, <louis.kuo@mediatek.com>,
        <sergey.senozhatsky@gmail.com>, <helen.koike@collabora.com>,
        <niklas.soderlund+renesas@ragnatech.se>, <yepeilin.cs@gmail.com>
CC:     <frederic.chen@mediatek.com>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Subject: [RESENT PATCH V0 0/4] media: some framework interface extension for new feature of Mediatek Camsys driver
Date:   Fri, 7 May 2021 15:46:00 +0800
Message-ID: <20210507074604.15079-1-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

This is the first version of the patch series extending V4L2 and media
framework to support some advanced camera function, for example, to change
the sensor when ISP is still streaming. A typical scenario is the wide-angle
sensor and telephoto sensor switching in camera application. When the user
is using the zooming UI, the application needs to switch the sensor from
wide-angle sensor to telephoto sensor smoothly.

To finish the function, we may need to modify the links of a pipeline and
the format of pad and video device per request. Currently, the link,
pad and video device format and selection settings are not involved in
media request's design. Therefore, we try to extend the related interface
to support the request-based operations. In the early version, we added
request fd to the parameters of MEDIA_IOC_SETUP_LINK,
VIDIOC_S_FMT, VIDIOC_SUBDEV_S_SELECTION, VIDIOC_SUBDEV_S_FMT.
The driver uses media_request_get_by_fd() to retrieve the media request
and save the pending change in it, so that we can apply the pending change
in req_queue() callback then.

Here is an example:

int mtk_cam_vidioc_s_selection(struct file *file, void *fh,
				struct v4l2_selection *s)
{
	struct mtk_cam_device *cam = video_drvdata(file);
	struct mtk_cam_video_device *node = file_to_mtk_cam_node(file);
	struct mtk_cam_request_stream_data *stream_data;
	struct mtk_cam_request *cam_req;
	struct media_request *req;
	s32 fd;

	fd = s->request_fd;
	if (fd < 0)
		return -EINVAL;

	req = media_request_get_by_fd(&cam->media_dev, fd);

	/* .... */
 
	cam_req = to_mtk_cam_req(req);
	stream_data = &cam_req->stream_data[node->uid.pipe_id];
	stream_data->vdev_selection_update |= (1 << node->desc.id);
	stream_data->vdev_selection[node->desc.id] = *s;

	/* .... */

	media_request_put(req);

	return 0;
}

I posted interface change to discuss first and would like some
review comments.

Thank you very much.

  media: v4l2-core: extend the v4l2 format to support request
  media: subdev: support which in v4l2_subdev_frame_interval
  media: v4l2-ctrl: Add ISP Camsys user control
  media: pixfmt: Add ISP Camsys formats

 drivers/media/mc/mc-device.c         |   7 +-
 drivers/media/v4l2-core/v4l2-ioctl.c | 153 ++++++++++++++++++++++++++-
 include/media/media-entity.h         |   3 +
 include/uapi/linux/media.h           |   3 +-
 include/uapi/linux/v4l2-controls.h   |   4 +
 include/uapi/linux/v4l2-subdev.h     |   8 +-
 include/uapi/linux/videodev2.h       | 109 ++++++++++++++++++-
 7 files changed, 275 insertions(+), 12 deletions(-)


