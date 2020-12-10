Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEF6B2D5535
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 09:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387777AbgLJITG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 03:19:06 -0500
Received: from comms.puri.sm ([159.203.221.185]:35960 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387534AbgLJITF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 03:19:05 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id EC5DFE11FD;
        Thu, 10 Dec 2020 00:17:54 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id BU_arEOzImWl; Thu, 10 Dec 2020 00:17:53 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: question: CSI on imx8mq with (any) CSI2 camera / experience with
 mx6s_capture?
To:     "rogerio.silva@nxp.com" <rogerio.silva@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-media@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
        "kernel@puri.sm" <kernel@puri.sm>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Message-ID: <9e09ca8b-d1bc-eaa9-d296-c4ee98882c06@puri.sm>
Date:   Thu, 10 Dec 2020 09:17:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

hi,

TL;DR: did you use the NXP "mx6s_capture" csi bridge driver with other 
cameras?

I try to use a CSI2 camera (hi846 I'm writing a driver for) on imx8mq: 
Using NXP's CSI bridge driver
https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/mxc/capture/mx6s_capture.c?h=imx_5.4.0_8dxlphantom_er 
as well as the CSI driver itself:
https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/imx8/mxc-mipi-csi2_yav.c?h=imx_5.4.0_8dxlphantom_er 
works fine when using the ov5640 camera with this driver:
https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/mxc/capture/ov5640_mipi_v2.c?h=imx_5.4.0_8dxlphantom_er

(I realize there is a CSI bridge driver in staging, but that need more 
work to be actually used. Of course after this the goal is to fix and 
use it; and mainline a CSI phy driver too.)

Now I use said NXP's CSI drivers on mainline without problems with the 
ov5640. For the hi846 (as an example), I want to use a different 
pixelformat and CSI media bus format. Describing, say, 
MEDIA_BUS_FMT_SBGGR10_1X10 in the driver lets mx6s_capture find it; but 
as soon as I try to add a different pixelformat than V4L2_PIX_FMT_UYVY in:
https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/media/platform/mxc/capture/mx6s_capture.c?h=imx_5.4.0_8dxlphantom_er#n244
streaming won't start anymore: "not negotiated, -4" and the 
"mx6s_vidioc_enum_framesizes" ioctl is not called anymore. Why so?

I didn't find much when comparing strace from "gst-launch-1.0 v4l2src ! 
video/x-raw,width=1280,height=720 ! videoconvert ! xvimagesink" (which 
is how I test).

When I simply use V4L2_PIX_FMT_UYVY I *do* get interrupts (in mx6s) but 
only "FIELD0_INT" (and drawing at this point suggests that buffer 1 is 
not yet full and "distorted" in a wrong format, which could explain why 
DMA is never completed in order to create a full frame).

Now this is details, but the hi846 camera uses a 10bit CSI format and 
therefore I need to set PIXEL_BIT in cr1 too, but when I do that for 
example, I don't get "FIELD0_INT" anymore (only SFF_OR_INT and of course 
the "base address switching Change Err").

Do you have experience with using this driver with other cameras and can 
point me in a direction that might help me?

If you want to look at the work-in-progress driver:
https://source.puri.sm/martin.kepplinger/linux-next/-/blob/hi846/drivers/media/i2c/hi846.c

thanks a lot,

                               martin


