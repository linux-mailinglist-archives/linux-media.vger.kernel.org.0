Return-Path: <linux-media+bounces-5190-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA6B855C65
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 09:24:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7893D1F22FD7
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 08:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6268214AA9;
	Thu, 15 Feb 2024 08:22:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C374DDDC
	for <linux-media@vger.kernel.org>; Thu, 15 Feb 2024 08:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707985344; cv=none; b=RUk5xs3rRajY6eatVJRwNlr3/qqn3Bl8Iyrw+RfBPKTSNzSJIATTRU0R7HwenqtXdlKVJ6jK/PSDqcAOsGh8rl5OYrdRM1NTUGOPddpZezYf3ZGbewPDJGl6HGrL1DRVgiZ62jhlaZ0ZdpgHJmFsRiDzkxuThRyc+EcprpflSW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707985344; c=relaxed/simple;
	bh=lh4ci0E1cB6FrU+GDwOflacnqzBiVhvMjhDmX8KF0TA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OuFdkxwviNdlR6Sy6PpT6jUZbUon8ipnosT0vfgldu5RfxmNXlUGZ+Hm/yeCFxkxKRlOe7f6jBQR+NHU19ARl+U5fl5MRSV+vmn7h+grbhVl62lyj9yWLx81x3t6sF8+hGk5CGVwNMSzqo9KPK+QB+dHAf8AwB24xRyMJzG7GVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FF2C433C7;
	Thu, 15 Feb 2024 08:22:22 +0000 (UTC)
Message-ID: <36bd1223-224b-42c1-8144-16d9fe3ecf32@xs4all.nl>
Date: Thu, 15 Feb 2024 09:22:20 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL FOR v6.9] Various fixes and enhancements
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, =?UTF-8?Q?Jernej_=C5=A0krabec?=
 <jernej.skrabec@gmail.com>
References: <12e4850c-0ae2-4d9f-83b7-8c762e6e3756@xs4all.nl>
 <11131784.CDJkKcVGEf@arisu>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <11131784.CDJkKcVGEf@arisu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Detlev,

On 14/02/2024 17:40, Detlev Casanova wrote:
> Hi Hans,
> 
> I see that my visl patches on that branch are the v4. But I recently sent a 
> v5, fixing a checkpatch warning (but also fixed by you) and removing unnecessary 
> code changes: https://lore.kernel.org/linux-media/20240117151202.405426-1-detlev.casanova@collabora.com/
> 
> These are not big changes, so I don't mind keeping v4 and dropping v5 if that 
> is easier for you.

I somehow missed the v5. I've replaced the v4 with your v5 in my upcoming PR.
I needed to make another change to the PR anyway, so this was easy to do.

Thank you for letting me know.

Regards,

	Hans

> 
> Regards,
> Detlev
> 
> On Wednesday, February 14, 2024 10:17:54 A.M. EST Hans Verkuil wrote:
>> If there are no comments, then I'll push this tomorrow or Friday.
>>
>> Regards,
>>
>> 	Hans
>>
>> The following changes since commit 8c64f4cdf4e6cc5682c52523713af8c39c94e6d5:
>>
>>   media: edia: dvbdev: fix a use-after-free (2024-02-07 06:06:03 +0100)
>>
>> are available in the Git repository at:
>>
>>   git://linuxtv.org/hverkuil/media_tree.git tags/br-v6.9d
>>
>> for you to fetch changes up to 10a934521ad37903bc290ed9b5fac5cd3c1e26a0:
>>
>>   media: v4l: marvell: select CONFIG_V4L2_ASYNC where needed (2024-02-14
>> 16:14:11 +0100)
>>
>> ----------------------------------------------------------------
>> Tag branch
>>
>> ----------------------------------------------------------------
>> Andrzej Pietrasiewicz (1):
>>       media: videobuf2: Add missing doc comment for waiting_in_dqbuf
>>
>> Arnd Bergmann (3):
>>       media: sta2x11: fix irq handler cast
>>       media: pvrusb2: fix pvr2_stream_callback casts
>>       media: v4l: marvell: select CONFIG_V4L2_ASYNC where needed
>>
>> Changhuang Liang (1):
>>       staging: media: starfive: Set 16 bpp for capture_raw device
>>
>> Colin Ian King (2):
>>       media: tda18271: remove redundant assignment to variable bcal
>>       media: i2c: st-vgxy61: remove redundant initialization of pointer mode
>>
>> Daniil Dulov (2):
>>       media: go7007: add check of return value of go7007_read_addr()
>>       media: pvrusb2: remove redundant NULL check
>>
>> Detlev Casanova (4):
>>       media: visl,vidtv: Set parameters permissions to 0444
>>       media: visl: Add a tpg_verbose parameter
>>       doc: media: visl: Document tpg_verbose parameter
>>       media: visl: Add codec specific variability on output frames
>>
>> Hans Verkuil (3):
>>       media: staging: imx: controls are from another device, mark this
>>       media: v4l2-ctrls-core.c: check min/max for menu, controls
>>       media: core: v4l2-ioctl.c: use is_valid_ioctl()
>>
>> Hsia-Jun(Randy) Li (1):
>>       media: v4l2-mem2mem: fix mem order in last buf
>>
>> Jernej Skrabec (4):
>>       media: cedrus: h265: Fix configuring bitstream size
>>       media: sun8i-di: Fix coefficient writes
>>       media: sun8i-di: Fix power on/off sequences
>>       media: sun8i-di: Fix chroma difference threshold
>>
>> Kells Ping (1):
>>       media: platform: cros-ec: Add Dita to the match table
>>
>> Kevin Hao (3):
>>       media: dvb_frontend: Use wait_event_freezable_timeout() for freezable
>> kthread media: msp3400: Use wait_event_freezable_timeout() in msp_sleep()
>> media: pvrusb2: Use wait_event_freezable() for freezable kthread
>>
>> Lucas Stach (1):
>>       media: imx: csc/scaler: fix v4l2_ctrl_handler memory leak
>>
>> Markus Elfring (1):
>>       media: ti: Use devm_platform_ioremap_resource() in ti_csi2rx_probe()
>>
>> Matthias Schwarzott (1):
>>       media: zl10036: Fix my email address
>>
>> Ming Qian (2):
>>       media: imx-jpeg: Support for negotiating bytesperline with client
>>       media: amphion: Abort vpu parsing directly in seek
>>
>> Niklas Söderlund (1):
>>       media: rcar-csi2: Move driver to renesas directory
>>
>> Ricardo B. Marliere (1):
>>       media: bt8xx: make bttv_sub_bus_type const
>>
>> Vincenzo Mezzela (1):
>>       docs: media: fix typo in docs
>>
>> XueBing Chen (4):
>>       media: dvb-frontends: Clean up errors in cx24110.h
>>       media: stv6110x: Clean up errors in stv6110x.h
>>       media: Clean up errors in bcm3510_priv.h
>>       media: dvb-frontends: Clean up errors in tda8083.h
>>
>> Yang Li (1):
>>       media: mediatek: vcodec: Remove unneeded semicolon
>>
>>  Documentation/admin-guide/media/visl.rst                                  |
>>  12 +- Documentation/driver-api/media/v4l2-subdev.rst                      
>>      |   2 +- MAINTAINERS                                                  
>>             |   1 + drivers/media/cec/platform/cros-ec/cros-ec-cec.c       
>>                   |   2 + drivers/media/dvb-core/dvb_frontend.c            
>>                         |  13 +- drivers/media/dvb-frontends/bcm3510_priv.h
>>                                |   6 +-
>> drivers/media/dvb-frontends/cx24110.h                                     |
>>   8 +- drivers/media/dvb-frontends/stv6110x_priv.h                         
>>      |   8 +- drivers/media/dvb-frontends/tda8083.h                        
>>             |   8 +- drivers/media/dvb-frontends/zl10036.c                 
>>                    |   2 +- drivers/media/dvb-frontends/zl10036.h          
>>                           |   2 +- drivers/media/i2c/msp3400-driver.c      
>>                                  |  20 +--
>> drivers/media/i2c/msp3400-driver.h                                        |
>>   2 +- drivers/media/i2c/st-vgxy61.c                                       
>>      |   2 +- drivers/media/pci/bt8xx/bttv-gpio.c                          
>>             |   2 +- drivers/media/pci/bt8xx/bttvp.h                       
>>                    |   2 +- drivers/media/pci/sta2x11/sta2x11_vip.c        
>>                           |   9 +- drivers/media/platform/amphion/vdec.c   
>>                                  |   4 +-
>> drivers/media/platform/marvell/Kconfig                                    |
>>   2 +
>> drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c |
>>  14 +- drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c                      
>>      |  16 ++ drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.h               
>>             |   1 + drivers/media/platform/renesas/Kconfig                 
>>                   |  16 ++ drivers/media/platform/renesas/Makefile         
>>                          |   1 + drivers/media/platform/renesas/{rcar-vin
>> => }/rcar-csi2.c                 |   0
>> drivers/media/platform/renesas/rcar-vin/Kconfig                           |
>>  16 -- drivers/media/platform/renesas/rcar-vin/Makefile                    
>>      |   1 - drivers/media/platform/sunxi/sun8i-di/sun8i-di.c              
>>            |  69 ++++----
>> drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c                     |
>>   5 +- drivers/media/test-drivers/vidtv/vidtv_bridge.c                     
>>      |  26 +-- drivers/media/test-drivers/visl/visl-core.c                 
>>              |  15 +- drivers/media/test-drivers/visl/visl-dec.c           
>>                     | 344 +++++++++++++++++++++++-----------------
>> drivers/media/test-drivers/visl/visl.h                                    |
>>   1 + drivers/media/tuners/tda18271-fe.c                                   
>>     |   1 - drivers/media/usb/go7007/go7007-usb.c                          
>>           |   4 +- drivers/media/usb/pvrusb2/pvrusb2-context.c             
>>                  |   8 +- drivers/media/usb/pvrusb2/pvrusb2-dvb.c          
>>                         |  12 +- drivers/media/usb/pvrusb2/pvrusb2-v4l2.c  
>>                                |  11 +-
>> drivers/media/v4l2-core/v4l2-ctrls-api.c                                  |
>>   2 +- drivers/media/v4l2-core/v4l2-ctrls-core.c                           
>>      |   5 +- drivers/media/v4l2-core/v4l2-ioctl.c                         
>>             |   2 +- drivers/media/v4l2-core/v4l2-mem2mem.c                
>>                    |   4 +-
>> drivers/staging/media/imx/imx-media-csc-scaler.c                          |
>>   1 + drivers/staging/media/imx/imx-media-fim.c                            
>>     |   2 +- drivers/staging/media/starfive/camss/stf-capture.c            
>>            |   8 +- drivers/staging/media/sunxi/cedrus/cedrus_h265.c       
>>                   |  10 +- include/media/videobuf2-core.h                  
>>                          |  13 +- 47 files changed, 398 insertions(+), 317
>> deletions(-)
>>  rename drivers/media/platform/renesas/{rcar-vin => }/rcar-csi2.c (100%)
> 


