Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9580B43DB99
	for <lists+linux-media@lfdr.de>; Thu, 28 Oct 2021 08:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbhJ1HBR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Oct 2021 03:01:17 -0400
Received: from mout02.posteo.de ([185.67.36.66]:57389 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229626AbhJ1HBR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Oct 2021 03:01:17 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id D4578240101
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 08:58:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1635404328; bh=a0ojWObMAc1ry5zisq0shIf373J0BrDl9nD0ZJmKwyE=;
        h=Date:From:To:Subject:From;
        b=o1gvFYsSxP5dWqa2wGwFn7E3TmctzcW827f9b4rHGjOKsbwezYa191VAn4S/2B+Z2
         /2PW8USMiELCvrtzsG6DEs7fZlv+b236ib9P6YAZs3OhTPmmexi7nYBSxqIMpzgoLs
         +2bq2sxY4JlqGvUc1+KrQx2krpDUHezG9tZIwUX/rZlYqZDMHutpW+LQQEnZiTll46
         M9S73WO299Jnsnocso3+eryu7oTCf7czReFP8B0ZIthlO4MvVMFbwsK+5sdoU7Kw6x
         f6IsLpZGfyx/7ugd+4lBY79tdOJ+WGKExW1HSnkAbHLRH/7TdtQUT23O91a+ynbG1r
         enHQPx1T3EBsg==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4HfxHD1GnLz9rxF
        for <linux-media@vger.kernel.org>; Thu, 28 Oct 2021 08:58:47 +0200 (CEST)
Date:   Thu, 28 Oct 2021 06:58:47 +0000
From:   Patrick Boettcher <patrick.boettcher@posteo.de>
To:     linux-media@vger.kernel.org
Subject: Re: Kernel 5.10 - imx-media does not create /dev/media0
Message-ID: <20211028085847.34ebce79@yaise-pc1>
In-Reply-To: <20211028010412.49a3c812@yaise-pc1>
References: <20211028010412.49a3c812@yaise-pc1>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 27 Oct 2021 23:04:12 +0000
Patrick Boettcher <patrick.boettcher@posteo.de> wrote:

>Hi list,
>
>(long time no see!)
>
>I switched from a Freescale kernel 5.4 to a vanilla 5.10 on IMX6Solo
>board. The device is using a ADV7280 as analog-video-ADC.
>
>I tried to apply the good options to my kernel-config, but I'm unable
>to get the media-controller device appear. I see  
>
> [  757.594463] irq: type mismatch, failed to map hwirq-21 for
> gpio@20a8000! [  757.655328] adv7180 2-0021: chip found @ 0x21
> (21a8000.i2c)
>
>that the adv7280 is found and attached, as well as the ipu and it's
>video-devices.
>
> [   11.069123] videodev: Linux video capture interface: v2.00
> [   12.553347] ipu1_csi0: Registered ipu1_csi0 capture as /dev/video0
> [   12.681897] ipu1_ic_prpenc: Registered ipu1_ic_prpenc capture as
> /dev/video1 [   12.785205] ipu1_ic_prpvf: Registered ipu1_ic_prpvf
> capture as /dev/video2 [   12.914702] ipu1_csi1: Registered ipu1_csi1
> capture as /dev/video3

Here's a list of all modules which got loaded:

  adv7180                20480  0
  snd_soc_sgtl5000       28672  0
  pfuze100_regulator     28672  0
  regmap_i2c             16384  2
  imx6_media_csi         28672  2
  snd_soc_imx_sgtl5000    16384  
  fec                    53248  0
  snd_soc_fsl_asoc_card    24576 
  v4l2_fwnode            24576  1
  ptp                    28672  1
  pps_core               20480  1
  of_mdio                16384  2
  snd_soc_imx_audmux     16384  2
  fixed_phy              16384  1
  i2c_imx                20480  0
  libphy                126976  4
  imx6_media             49152  0
  video_mux              16384  0
  mux_core               16384  1
  imx_media_common       40960  2
  videobuf2_dma_contig    16384  
  v4l2_mem2mem           36864  1
  videobuf2_memops       16384  1
  videobuf2_v4l2         32768  3
  snd_soc_fsl_asrc       24576  0
  videobuf2_common       57344  5
  snd_soc_fsl_ssi        24576  0
  imx_pcm_dma            16384  1
  videodev              233472  9
  i2c_core               69632  8

Maybe it'll help to spot the problem immediately.

--
Patrick.
