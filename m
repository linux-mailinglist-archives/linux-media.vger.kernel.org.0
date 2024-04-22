Return-Path: <linux-media+bounces-9846-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 284DE8AC6E1
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 10:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0747F1F210EC
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 08:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F101750282;
	Mon, 22 Apr 2024 08:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GIFq92qW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9554CB2E
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 08:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713774345; cv=none; b=Su8aBlJ6QJORniRfU8bHty/upKaLq0QC13ObFIN8DiolweRrWJhwB+/sVsCc2Ly4oH9bApO+vYP+0WfjleaKI502ev0fFgE/xqdd9TyG92kNAw0w6aDX2/cPF3ke6Fisn1ty3K+DG7/+iYJ7JztJi3hdy4WLGfhcSDVHIewQJk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713774345; c=relaxed/simple;
	bh=qyR9LTOa9GN4UN32+7KbJ6r7uiSxwnbxKQSS7BEVW8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Smj6ImckuLJQQnO/FtXu6TxVFP/essMafvb5p+Az5gpcvAFVCPtJu1U3CTH9FBNuRYjXCyKlXAqot7e2LDbowdsAF9On1tfaF5DqyiW27nqDPlv2ydn89Zmr5pZUSxJiLh/5fX+u7LnWjaWX4UQO5IA0mGoo9370UUGc8rtM7K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GIFq92qW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.106] (unknown [103.251.226.10])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 567466B3;
	Mon, 22 Apr 2024 10:24:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1713774291;
	bh=qyR9LTOa9GN4UN32+7KbJ6r7uiSxwnbxKQSS7BEVW8U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GIFq92qWDk3iMp/E/BBi7CqkJnWitHZJGan8W6cpGya293DkbWRHLT4FpEPMuxMbN
	 nGSycOtv2McR4lRF5UXQy4i/3i5/hw22dZS9SCMQsEIvRnA1HIYehLO5G6fISZ93Vh
	 Yd9QDeqibxLWfBEUWpAln2B0JP73l5OO/VGyDtvk=
Message-ID: <8fb8e455-20a9-49aa-a3cb-164bd5f4ac3a@ideasonboard.com>
Date: Mon, 22 Apr 2024 13:55:33 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT FIXES FOR 6.10] Mainly camera sensor patches, but V4L2 and
 MC too
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@iki.fi>,
 linux-media@vger.kernel.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <Zh-bIY-er6cH25tI@valkosipuli.retiisi.eu>
 <87587fa4-b74a-4978-9709-3500339ea864@xs4all.nl>
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <87587fa4-b74a-4978-9709-3500339ea864@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Hans,

On 22/04/24 1:39 pm, Hans Verkuil wrote:
> Hi Sakari, Kieran, Umang,
>
> On 17/04/2024 11:49, Sakari Ailus wrote:
>> Hi Hans, Mauro,
>>
>> Here's a set of mainly camera sensor related patches for 6.10. In
>> particular, there are ov2680 and hi556 fixes form Hans and Fabio, your own
>> MC patch, fixes for imx335 from Kieran and Umang, DT fixes from Alexander
>> Stein and one Cadence csi2rx fix from Pratyush and finally my random series
>> of framework and ipu3-imgu driver fixes.
>>
>> Please pull.
> I get these compiler warnings when building:
>
> drivers/media/i2c/imx335.c:219: warning: Function parameter or struct member 'cci' not described in 'imx335'
> drivers/media/i2c/imx335.c:219: warning: Function parameter or struct member 'lane_mode' not described in 'imx335'
>
> Can you take a look?

I see why.
>
> If it is something trivial, then let me know what to add and I can make the
> fix.

Can you please consider the following fixup! for this:

diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
index 0b06e86583f2..990d74214cc2 100644
--- a/drivers/media/i2c/imx335.c
+++ b/drivers/media/i2c/imx335.c
@@ -176,6 +176,7 @@ struct imx335_mode {
   * @pad: Media pad. Only one pad supported
   * @reset_gpio: Sensor reset gpio
   * @supplies: Regulator supplies to handle power control
+ * @cci: CCI register map
   * @inclk: Sensor input clock
   * @ctrl_handler: V4L2 control handler
   * @link_freq_ctrl: Pointer to link frequency control
@@ -185,7 +186,7 @@ struct imx335_mode {
   * @exp_ctrl: Pointer to exposure control
   * @again_ctrl: Pointer to analog gain control
   * @vblank: Vertical blanking in lines
- * @lane_mode Mode for number of connected data lanes
+ * @lane_mode: Mode for number of connected data lanes
   * @cur_mode: Pointer to current selected sensor mode
   * @mutex: Mutex for serializing sensor controls
   * @link_freq_bitmap: Menu bitmap for link_freq_ctrl

>
> Regards,
>
> 	Hans
>
>>
>> The following changes since commit 836e2548524d2dfcb5acaf3be78f203b6b4bde6f:
>>
>>    media: usb: siano: Fix allocation of urbs (2024-04-16 00:02:53 +0200)
>>
>> are available in the Git repository at:
>>
>>    git://linuxtv.org/sailus/media_tree.git tags/for-6.10-2-signed
>>
>> for you to fetch changes up to eba1e47919b66797eb2479b7a7e39df0473003ce:
>>
>>    media: hi556: Add support for avdd regulator (2024-04-17 10:58:10 +0300)
>>
>> ----------------------------------------------------------------
>> V4L2 patches for 6.10
>>
>> ----------------------------------------------------------------
>> Alexander Stein (2):
>>        media: dt-bindings: sony,imx290: Allow props from video-interface-devices
>>        media: dt-bindings: i2c: use absolute path to other schema
>>
>> Fabio Estevam (1):
>>        media: ov2680: Do not fail if data-lanes property is absent
>>
>> Hans Verkuil (1):
>>        media: mc: mark the media devnode as registered from the, start
>>
>> Hans de Goede (9):
>>        media: ov2680: Stop sending more data then requested
>>        media: ov2680: Drop hts, vts ov2680_mode struct members
>>        media: ov2680: Add vblank control
>>        media: ov2680: Add hblank control
>>        media: ov2680: Add camera orientation and sensor rotation controls
>>        media: hi556: Return -EPROBE_DEFER if no endpoint is found
>>        media: hi556: Add support for reset GPIO
>>        media: hi556: Add support for external clock
>>        media: hi556: Add support for avdd regulator
>>
>> Jai Luthra (1):
>>        media: ti: j721e-csi2rx: Fix races while restarting DMA
>>
>> Kieran Bingham (2):
>>        media: imx335: Support 2 or 4 lane operation modes
>>        media: imx335: Parse fwnode properties
>>
>> Pratyush Yadav (1):
>>        media: cadence: csi2rx: configure DPHY before starting source stream
>>
>> Sakari Ailus (4):
>>        media: v4l: Don't turn on privacy LED if streamon fails
>>        media: staging: ipu3-imgu: Update firmware path
>>        media: v4l2-ctrls: Return handler error in creating new fwnode properties
>>        media: v4l: Guarantee non-NULL return from v4l2_find_nearest_size()
>>
>> Umang Jain (4):
>>        media: imx335: Use V4L2 CCI for accessing sensor registers
>>        media: imx335: Use integer values for size registers
>>        media: imx335: Fix active area height discrepency
>>        media: imx335: Limit analogue gain value
>>
>>   .../bindings/media/i2c/galaxycore,gc0308.yaml      |   2 +-
>>   .../bindings/media/i2c/galaxycore,gc2145.yaml      |   2 +-
>>   .../devicetree/bindings/media/i2c/sony,imx214.yaml |   2 +-
>>   .../devicetree/bindings/media/i2c/sony,imx290.yaml |   5 +-
>>   .../devicetree/bindings/media/i2c/sony,imx415.yaml |   2 +-
>>   drivers/media/i2c/Kconfig                          |   1 +
>>   drivers/media/i2c/hi556.c                          | 105 +++-
>>   drivers/media/i2c/imx335.c                         | 636 ++++++++++-----------
>>   drivers/media/i2c/ov2680.c                         |  97 +++-
>>   drivers/media/mc/mc-devnode.c                      |   5 +-
>>   drivers/media/platform/cadence/cdns-csi2rx.c       |  26 +-
>>   .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  |   5 +-
>>   drivers/media/v4l2-core/v4l2-common.c              |   2 +-
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c          |   3 +
>>   drivers/media/v4l2-core/v4l2-subdev.c              |  22 +-
>>   drivers/staging/media/ipu3/ipu3-css-fw.c           |   4 +-
>>   drivers/staging/media/ipu3/ipu3-css-fw.h           |   2 +
>>   17 files changed, 515 insertions(+), 406 deletions(-)
>>


