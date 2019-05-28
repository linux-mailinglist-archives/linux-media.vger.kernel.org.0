Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFA902C969
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 17:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbfE1PAW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 11:00:22 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43241 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726371AbfE1PAV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 11:00:21 -0400
Received: from litschi.hi.pengutronix.de ([2001:67c:670:100:feaa:14ff:fe6a:8db5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1hVdaN-0001hB-Pw; Tue, 28 May 2019 17:00:19 +0200
Date:   Tue, 28 May 2019 17:00:16 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org,
        tfiga@chromium.org, dshah@xilinx.com
Subject: Re: [PATCH v7 0/5] Add ZynqMP VCU/Allegro DVT H.264 encoder driver
Message-ID: <20190528170016.68252586@litschi.hi.pengutronix.de>
In-Reply-To: <d0f49d4e-d060-1324-5348-eec0f4336601@xs4all.nl>
References: <20190528130920.4450-1-m.tretter@pengutronix.de>
        <d0f49d4e-d060-1324-5348-eec0f4336601@xs4all.nl>
Organization: Pengutronix
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:feaa:14ff:fe6a:8db5
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 28 May 2019 15:54:58 +0200, Hans Verkuil wrote:
> Hi Michael,
> 
> On 5/28/19 3:09 PM, Michael Tretter wrote:
> > This is v7 of the Allegro DVT H.264 encoder driver found in the EV
> > family of the Xilinx ZynqMP platform.
> > 
> > I moved the driver back to staging, because the v4l2 stateful encoder spec is
> > not finished, yet. Once the spec is finished, this driver shall be tested
> > against the final v4l2-compliance and moved to mainline again.
> > 
> > Further, I converted the allegro vendor prefix to the new json format in
> > vendor-prefixes.yaml.
> > 
> > The observed occasional failures in v4l2-compliance in v6 of this series
> > turned out to be caused by a race condition with v4l2_m2m_poll(). I will send
> > patches to fix this issue as a separate series.  
> 
> I'm getting these smatch warnings:
> 
> drivers/staging/media/allegro-dvt/allegro-core.c:1849:36: warning: constant 0xffffffff00000000 is so big it is unsigned long

The constant is used to calculate an offset, which is used by the
hardware as offset for addresses in mailbox messages. The hardware
expects a 64 bit value, but the driver calculates the value using a
dma_addr_t, which is fine for 64 bit systems (e.g. ZynqMP), but is a
problem on 32 bit systems.

I am currently working on improving the handling of frame addresses and
make it fit for using the PL-RAM (in the FPGA) instead of the normal
system RAM (PS-RAM). I would fix the warning with that patch set, if
it is OK.

> drivers/staging/media/allegro-dvt/nal-h264.c:751: warning: Function parameter or member 'dev' not described in 'nal_h264_write_sps'
> drivers/staging/media/allegro-dvt/nal-h264.c:792: warning: Function parameter or member 'dev' not described in 'nal_h264_read_sps'
> drivers/staging/media/allegro-dvt/nal-h264.c:842: warning: Function parameter or member 'dev' not described in 'nal_h264_write_pps'
> drivers/staging/media/allegro-dvt/nal-h264.c:884: warning: Function parameter or member 'dev' not described in 'nal_h264_read_pps'
> drivers/staging/media/allegro-dvt/nal-h264.c:926: warning: Function parameter or member 'dev' not described in 'nal_h264_write_filler'
> drivers/staging/media/allegro-dvt/nal-h264.c:969: warning: Function parameter or member 'dev' not described in 'nal_h264_read_filler'

I didn't describe the "struct device *dev" parameter, because it really
doesn't add any value.

Michael

> 
> Can you take a look? The nal-h264.c warnings look trivial to fix, the
> allegro-core.c warnings looks more interesting.
> 
> Regards,
> 
> 	Hans
> 
