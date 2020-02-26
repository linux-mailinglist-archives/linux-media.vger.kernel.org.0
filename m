Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 866D316F6A0
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 05:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgBZEtu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 23:49:50 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:8458 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726046AbgBZEtu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 23:49:50 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e55f8de0000>; Tue, 25 Feb 2020 20:49:34 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 25 Feb 2020 20:49:48 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 25 Feb 2020 20:49:48 -0800
Received: from [10.2.163.212] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 26 Feb
 2020 04:49:47 +0000
Subject: Re: [RFC PATCH v3 4/6] media: tegra: Add Tegra210 Video input driver
To:     Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>,
        <helen.koike@collabora.com>, <sboyd@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
 <1581704608-31219-5-git-send-email-skomatineni@nvidia.com>
 <b301c247-537d-d78e-b057-a3225b10de7e@xs4all.nl>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <821f0878-56da-9b51-425a-9d6fb65d2e0c@nvidia.com>
Date:   Tue, 25 Feb 2020 20:49:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b301c247-537d-d78e-b057-a3225b10de7e@xs4all.nl>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582692574; bh=Bv83nIVhE0DgqB7FO17S5t98nsvMOJ3o/2ZyNDehyzg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=qCpI9+Zp92w5sb+wPXYm6kDoU/UAG+tyk7dFkGCQzzVCQIUtGGKhLpjXutodBltSl
         7ZoYNR8D7mMrg6SjNhw2Urtko4+qrNfIOVXqY4jVI+yA9fhuEGUu76bbC5+gJjqNHY
         sHacgJ1ce69XAGPZk7W/nK0je9hqQ5l/8Df/+XV6/rVVljvbKcRLy0KiJbOztY1jRR
         2VnUX3ULKBy4IoCuY9fL5+imgciq4So+HN1uQI7LAg2WYREwdghIa3DIiGXcgGWPQd
         4gUeJrRyBymLJuB0ngoM0xhqUqY56nEFUoIX/VlqB4VMXH00P5few/kw5mC0bnwbxn
         YgpCAoV4yumOw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2/20/20 4:44 AM, Hans Verkuil wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Sowjanya,
>
> Some code review comments below:
>
> On 2/14/20 7:23 PM, Sowjanya Komatineni wrote:
>> Tegra210 contains a powerful Video Input (VI) hardware controller
>> which can support up to 6 MIPI CSI camera sensors.
>>
>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>> capture from an external camera sensor connected to CSI or from
>> built-in test pattern generator.
>>
>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>
>> This patch adds a V4L2 media controller and capture driver support
>> for Tegra210 built-in CSI to VI test pattern generator.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>   drivers/staging/media/Kconfig              |    2 +
>>   drivers/staging/media/Makefile             |    1 +
>>   drivers/staging/media/tegra/Kconfig        |   10 +
>>   drivers/staging/media/tegra/Makefile       |    8 +
>>   drivers/staging/media/tegra/TODO           |   10 +
>>   drivers/staging/media/tegra/tegra-common.h |  239 +++++++
>>   drivers/staging/media/tegra/tegra-csi.c    |  374 ++++++++++
>>   drivers/staging/media/tegra/tegra-csi.h    |  115 ++++
>>   drivers/staging/media/tegra/tegra-vi.c     | 1019 ++++++++++++++++++++++++++++
>>   drivers/staging/media/tegra/tegra-vi.h     |   79 +++
>>   drivers/staging/media/tegra/tegra-video.c  |  118 ++++
>>   drivers/staging/media/tegra/tegra-video.h  |   32 +
>>   drivers/staging/media/tegra/tegra210.c     |  767 +++++++++++++++++++++
>>   drivers/staging/media/tegra/tegra210.h     |  190 ++++++
>>   14 files changed, 2964 insertions(+)
>>   create mode 100644 drivers/staging/media/tegra/Kconfig
>>   create mode 100644 drivers/staging/media/tegra/Makefile
>>   create mode 100644 drivers/staging/media/tegra/TODO
>>   create mode 100644 drivers/staging/media/tegra/tegra-common.h
>>   create mode 100644 drivers/staging/media/tegra/tegra-csi.c
>>   create mode 100644 drivers/staging/media/tegra/tegra-csi.h
>>   create mode 100644 drivers/staging/media/tegra/tegra-vi.c
>>   create mode 100644 drivers/staging/media/tegra/tegra-vi.h
>>   create mode 100644 drivers/staging/media/tegra/tegra-video.c
>>   create mode 100644 drivers/staging/media/tegra/tegra-video.h
>>   create mode 100644 drivers/staging/media/tegra/tegra210.c
>>   create mode 100644 drivers/staging/media/tegra/tegra210.h
>>

>> +static int chan_capture_kthread_done(void *data)
>> +{
>> +     struct tegra_vi_channel *chan = data;
>> +     struct tegra_channel_buffer *buf;
>> +
>> +     set_freezable();
>> +
>> +     while (1) {
>> +             try_to_freeze();
>> +
>> +             wait_event_interruptible(chan->done_wait,
>> +                                      !list_empty(&chan->done) ||
>> +                                      kthread_should_stop());
>> +
>> +             if (kthread_should_stop())
>> +                     break;
> I think it makes more sense if this test is moved to the end...
>
>> +
>> +             buf = dequeue_buf_done(chan);
>> +             if (!buf)
>> +                     continue;
> ... and this becomes:
>
>                  if (buf)
>> +                     tegra_channel_capture_done(chan, buf);
> This change simplifies stop_streaming (see below).

With kthread_should_stop check at end, I see sometimes outstanding 
buffer in done queue by the time threads are stopped during stream stop.

When I run compliance stream io tests continuously in loop, depending on 
time of stream stop request capture thread terminated after initiating 
frame capture and moving buffer to done queue while done thread was 
still in wait for previous MW_ACK and on seeing kthread_should_stop done 
thread terminated with last buffer left in done queue.

So looks like we need to keep checking for outstanding buffer and handle 
it during stop streaming like in v3.


>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +int tegra210_vi_start_streaming(struct vb2_queue *vq, u32 count)
>> +{
>> +     struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
>> +     struct media_pipeline *pipe = &chan->video.pipe;
>> +     int ret = 0;
>> +
>> +     tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, VI_CG_2ND_LEVEL_EN);
>> +
>> +     /* clear errors */
>> +     vi_csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS, 0xFFFFFFFF);
>> +
>> +     /*
>> +      * Sync point FIFO full stalls the host interface.
>> +      * Setting NO_STALL will drop INCR_SYNCPT methods when fifos are
>> +      * full and the corresponding condition bits in INCR_SYNCPT_ERROR
>> +      * register will be set.
>> +      * This allows SW to process error recovery.
>> +      */
>> +     tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT_CNTRL,
>> +                    TEGRA_VI_CFG_VI_INCR_SYNCPT_NO_STALL);
>> +
>> +     /* start the pipeline */
>> +     ret = media_pipeline_start(&chan->video.entity, pipe);
>> +     if (ret < 0)
>> +             goto error_pipeline_start;
>> +
>> +     /* program VI registers after TPG, sensors and CSI streaming */
>> +     ret = tegra_channel_set_stream(chan, true);
>> +     if (ret < 0)
>> +             goto error_set_stream;
>> +
>> +     tegra_channel_capture_setup(chan);
>> +
>> +     chan->sequence = 0;
>> +
>> +     /* start kthreads to capture data to buffer and return them */
>> +     chan->kthread_capture_done = kthread_run(chan_capture_kthread_done,
>> +                                              chan, "%s:1",
>> +                                              chan->video.name);
>> +     if (IS_ERR(chan->kthread_capture_done)) {
>> +             ret = PTR_ERR(chan->kthread_capture_done);
>> +             chan->kthread_capture_done = NULL;
>> +             dev_err(&chan->video.dev,
>> +                     "failed capture done kthread: %d\n", ret);
>> +             goto error_kthread_done;
>> +     }
>> +
>> +     chan->kthread_capture_start = kthread_run(chan_capture_kthread_start,
>> +                                               chan, "%s:0",
>> +                                               chan->video.name);
>> +     if (IS_ERR(chan->kthread_capture_start)) {
>> +             ret = PTR_ERR(chan->kthread_capture_start);
>> +             chan->kthread_capture_start = NULL;
>> +             dev_err(&chan->video.dev,
>> +                     "failed capture start kthread: %d\n", ret);
>> +             goto error_kthread_start;
>> +     }
>> +
>> +     return 0;
>> +
>> +error_kthread_start:
>> +     kthread_stop(chan->kthread_capture_done);
>> +error_kthread_done:
>> +     tegra_channel_set_stream(chan, false);
>> +error_set_stream:
>> +     media_pipeline_stop(&chan->video.entity);
>> +error_pipeline_start:
>> +     vq->start_streaming_called = 0;
>> +     tegra_channel_release_queued_buffers(chan, VB2_BUF_STATE_QUEUED);
>> +     return ret;
>> +}
>> +
>> +void tegra210_vi_stop_streaming(struct vb2_queue *vq)
>> +{
>> +     struct tegra_vi_channel *chan = vb2_get_drv_priv(vq);
>> +     struct tegra_channel_buffer *buf;
>> +
>> +     if (!chan->kthread_capture_start || !chan->kthread_capture_done)
>> +             return;
>> +
>> +     kthread_stop(chan->kthread_capture_start);
>> +     chan->kthread_capture_start = NULL;
>> +     kthread_stop(chan->kthread_capture_done);
>> +     chan->kthread_capture_done = NULL;
>> +
> With the change in chan_capture_kthread_done() as described above you can
> drop the next 4 lines since that's guaranteed to be done by the thread.
>
>> +     /* wait for last frame MW_ACK_DONE */
>> +     buf = dequeue_buf_done(chan);
>> +     if (buf)
>> +             tegra_channel_capture_done(chan, buf);
>> +
>> +     tegra_channel_release_queued_buffers(chan, VB2_BUF_STATE_ERROR);
>> +
>> +     tegra_channel_set_stream(chan, false);
>> +
>> +     /* disable clock gating to enable continuous clock */
>> +     tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, 0);
>> +
>> +     /* reset VI MCIF, PF, SENSORCTL, and SHADOW logic */
>> +     vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0xF);
>> +     vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0x0);
>> +     vi_csi_write(chan, TEGRA_VI_CSI_IMAGE_DEF, 0);
>> +
>> +     /* enable clock gating so VI can be clock gated if necessary */
>> +     tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, VI_CG_2ND_LEVEL_EN);
>> +     vi_csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS, 0xFFFFFFFF);
>> +
>> +     media_pipeline_stop(&chan->video.entity);
>> +}
>> +
>> +void tegra210_csi_error_recover(struct tegra_csi_channel *csi_chan)
>
> Regards,
>
>          Hans
