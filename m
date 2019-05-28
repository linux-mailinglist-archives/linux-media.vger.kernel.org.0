Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D77132C82A
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2019 15:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727090AbfE1NzC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 May 2019 09:55:02 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:50175 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726867AbfE1NzC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 May 2019 09:55:02 -0400
Received: from [IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae] ([IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae])
        by smtp-cloud9.xs4all.net with ESMTPA
        id VcZ8hizLksDWyVcZ9hdj7f; Tue, 28 May 2019 15:55:00 +0200
Subject: Re: [PATCH v7 0/5] Add ZynqMP VCU/Allegro DVT H.264 encoder driver
To:     Michael Tretter <m.tretter@pengutronix.de>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     kernel@pengutronix.de, robh+dt@kernel.org, mchehab@kernel.org,
        tfiga@chromium.org, dshah@xilinx.com
References: <20190528130920.4450-1-m.tretter@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <d0f49d4e-d060-1324-5348-eec0f4336601@xs4all.nl>
Date:   Tue, 28 May 2019 15:54:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528130920.4450-1-m.tretter@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfDQhOnCR1l2VQrV8/pTVrVX567xUMSObhXn2Yia5AomYyVXviAcPGZBJ+8pv4UPw4dGPe6NBpiggrDRrSc6Z16lQWTtvaFemKTp1W+/PWng8Io4NrbM2
 9NEPi1OZIUlPW1WJ8mqY79BW3733t0T8axkXnGfqKOIYQtsBZgYugeJEFstQNGO/zDWlxXvT1IHtAqCCHSSz9Ch5azKLHrM55+o6UjlHlgrjZZU9UZwvg2AN
 ++lmLZuvL51Ob8ARXuQhLQDXcv020GEBqnWGUDAFVPyLCyRxjp9NokfZSdJuidy3Lv8DZn1HHbC50J51tFqlWAv34FaLT0KDKc+FbilPrXLu1vhDcIiP3jfm
 2blsID8RS9dW7go4IctnMou1vYor1cyIA9AZ+Z5hjsG2W1K0zggQgLAzsIRDuqf1B35BlKODltKgYVFWBM0nm6Dicrt+j1jKv02zNfElGzyW13p5xwGlchjZ
 TUNTRbsJOHJmpq2v6R97b9xzswZTvUXoWg9feA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Michael,

On 5/28/19 3:09 PM, Michael Tretter wrote:
> This is v7 of the Allegro DVT H.264 encoder driver found in the EV
> family of the Xilinx ZynqMP platform.
> 
> I moved the driver back to staging, because the v4l2 stateful encoder spec is
> not finished, yet. Once the spec is finished, this driver shall be tested
> against the final v4l2-compliance and moved to mainline again.
> 
> Further, I converted the allegro vendor prefix to the new json format in
> vendor-prefixes.yaml.
> 
> The observed occasional failures in v4l2-compliance in v6 of this series
> turned out to be caused by a race condition with v4l2_m2m_poll(). I will send
> patches to fix this issue as a separate series.

I'm getting these smatch warnings:

drivers/staging/media/allegro-dvt/allegro-core.c:1849:36: warning: constant 0xffffffff00000000 is so big it is unsigned long
drivers/staging/media/allegro-dvt/nal-h264.c:751: warning: Function parameter or member 'dev' not described in 'nal_h264_write_sps'
drivers/staging/media/allegro-dvt/nal-h264.c:792: warning: Function parameter or member 'dev' not described in 'nal_h264_read_sps'
drivers/staging/media/allegro-dvt/nal-h264.c:842: warning: Function parameter or member 'dev' not described in 'nal_h264_write_pps'
drivers/staging/media/allegro-dvt/nal-h264.c:884: warning: Function parameter or member 'dev' not described in 'nal_h264_read_pps'
drivers/staging/media/allegro-dvt/nal-h264.c:926: warning: Function parameter or member 'dev' not described in 'nal_h264_write_filler'
drivers/staging/media/allegro-dvt/nal-h264.c:969: warning: Function parameter or member 'dev' not described in 'nal_h264_read_filler'

Can you take a look? The nal-h264.c warnings look trivial to fix, the
allegro-core.c warnings looks more interesting.

Regards,

	Hans
