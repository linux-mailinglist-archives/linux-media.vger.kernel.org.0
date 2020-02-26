Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABD5F16F7A6
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 06:50:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgBZFuV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 00:50:21 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2220 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgBZFuV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 00:50:21 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e5606f70000>; Tue, 25 Feb 2020 21:49:43 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 25 Feb 2020 21:50:19 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 25 Feb 2020 21:50:19 -0800
Received: from [10.2.163.212] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 26 Feb
 2020 05:50:19 +0000
Subject: Re: [RFC PATCH v3 4/6] media: tegra: Add Tegra210 Video input driver
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>,
        <helen.koike@collabora.com>, <sboyd@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
 <1581704608-31219-5-git-send-email-skomatineni@nvidia.com>
 <b301c247-537d-d78e-b057-a3225b10de7e@xs4all.nl>
 <821f0878-56da-9b51-425a-9d6fb65d2e0c@nvidia.com>
Message-ID: <33d21639-6a61-3870-a160-53482614bd66@nvidia.com>
Date:   Tue, 25 Feb 2020 21:50:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <821f0878-56da-9b51-425a-9d6fb65d2e0c@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1582696183; bh=zmoYF/hHN9NwihR9yTWuBupEPLPHiAKAdLdYXxtU03w=;
        h=X-PGP-Universal:Subject:From:To:CC:References:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=G04LzJcF/JC688sfnGWvlf7iLRwYfdwWlpGoU/TpR5C2Egw7L7i6kM5ZRaeApvIh/
         qBcmjME4d4d8VFjEcdVlcAU3VWyO9twl/AhqrbdGOGbm9U80UySkQnDLHD1KbxM+u6
         tWY8k0AauPQHYGAdoQjSCpr+1D7aSSPNG8piJe68rES1SF6CnxSpz3GGLPwFmXAWWz
         Lqde/4VtcOl9eAH9EqajjPgRT5bGgoCsUdwrqu/ICCPpNFrXK4sE1UqonhhLDtnGcp
         loGgaR0qATfh9vD1WDOsFBwyylOP1cTqyqILzrpWYtCZJxuRIEz1+f8gHN8sRrv0Cj
         fsiEhzrD61DyA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2/25/20 8:49 PM, Sowjanya Komatineni wrote:
>
> On 2/20/20 4:44 AM, Hans Verkuil wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> Hi Sowjanya,
>>
>> Some code review comments below:
>>
>> On 2/14/20 7:23 PM, Sowjanya Komatineni wrote:
>>> Tegra210 contains a powerful Video Input (VI) hardware controller
>>> which can support up to 6 MIPI CSI camera sensors.
>>>
>>> Each Tegra CSI port can be one-to-one mapped to VI channel and can
>>> capture from an external camera sensor connected to CSI or from
>>> built-in test pattern generator.
>>>
>>> Tegra210 supports built-in test pattern generator from CSI to VI.
>>>
>>> This patch adds a V4L2 media controller and capture driver support
>>> for Tegra210 built-in CSI to VI test pattern generator.
>>>
>>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>>> ---
>>> =C2=A0 drivers/staging/media/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 2 +
>>> =C2=A0 drivers/staging/media/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
>>> =C2=A0 drivers/staging/media/tegra/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 10 +
>>> =C2=A0 drivers/staging/media/tegra/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 8 +
>>> =C2=A0 drivers/staging/media/tegra/TODO=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 10 +
>>> =C2=A0 drivers/staging/media/tegra/tegra-common.h |=C2=A0 239 +++++++
>>> =C2=A0 drivers/staging/media/tegra/tegra-csi.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 374 ++++++++++
>>> =C2=A0 drivers/staging/media/tegra/tegra-csi.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 115 ++++
>>> =C2=A0 drivers/staging/media/tegra/tegra-vi.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
 1019=20
>>> ++++++++++++++++++++++++++++
>>> =C2=A0 drivers/staging/media/tegra/tegra-vi.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 79 +++
>>> =C2=A0 drivers/staging/media/tegra/tegra-video.c=C2=A0 |=C2=A0 118 ++++
>>> =C2=A0 drivers/staging/media/tegra/tegra-video.h=C2=A0 |=C2=A0=C2=A0 32=
 +
>>> =C2=A0 drivers/staging/media/tegra/tegra210.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 767=20
>>> +++++++++++++++++++++
>>> =C2=A0 drivers/staging/media/tegra/tegra210.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 190 ++++++
>>> =C2=A0 14 files changed, 2964 insertions(+)
>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/Kconfig
>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/Makefile
>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/TODO
>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-common.h
>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-csi.c
>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-csi.h
>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-vi.c
>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-vi.h
>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-video.c
>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra-video.h
>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra210.c
>>> =C2=A0 create mode 100644 drivers/staging/media/tegra/tegra210.h
>>>
>
>>> +static int chan_capture_kthread_done(void *data)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D data;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_channel_buffer *buf;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 set_freezable();
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 while (1) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 try_to_freeze();
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 wait_event_interruptible(chan->done_wait,
>>> + !list_empty(&chan->done) ||
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 kthread_should_stop());
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (kthread_should_stop())
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>> I think it makes more sense if this test is moved to the end...
>>
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 buf =3D dequeue_buf_done(chan);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (!buf)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;
>> ... and this becomes:
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 if (buf)
>>> + tegra_channel_capture_done(chan, buf);
>> This change simplifies stop_streaming (see below).
>
> With kthread_should_stop check at end, I see sometimes outstanding=20
> buffer in done queue by the time threads are stopped during stream stop.
>
> When I run compliance stream io tests continuously in loop, depending=20
> on time of stream stop request capture thread terminated after=20
> initiating frame capture and moving buffer to done queue while done=20
> thread was still in wait for previous MW_ACK and on seeing=20
> kthread_should_stop done thread terminated with last buffer left in=20
> done queue.
>
> So looks like we need to keep checking for outstanding buffer and=20
> handle it during stop streaming like in v3.
>
Will change in v4 to handle all pending done queue buffers before=20
terminating thread.
>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +
>>> +int tegra210_vi_start_streaming(struct vb2_queue *vq, u32 count)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D vb2_get_drv=
_priv(vq);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct media_pipeline *pipe =3D &chan->video.=
pipe;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 int ret =3D 0;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, VI=
_CG_2ND_LEVEL_EN);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* clear errors */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 vi_csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS,=
 0xFFFFFFFF);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Sync point FIFO full stalls the host =
interface.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Setting NO_STALL will drop INCR_SYNCP=
T methods when fifos are
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * full and the corresponding condition =
bits in INCR_SYNCPT_ERROR
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * register will be set.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * This allows SW to process error recov=
ery.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYN=
CPT_CNTRL,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TEGRA_VI_CFG_VI_INCR_SYNCPT_N=
O_STALL);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* start the pipeline */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D media_pipeline_start(&chan->video.ent=
ity, pipe);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 goto error_pipeline_start;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* program VI registers after TPG, sensors an=
d CSI streaming */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D tegra_channel_set_stream(chan, true);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (ret < 0)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 goto error_set_stream;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 tegra_channel_capture_setup(chan);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 chan->sequence =3D 0;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* start kthreads to capture data to buffer a=
nd return them */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 chan->kthread_capture_done =3D=20
>>> kthread_run(chan_capture_kthread_done,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chan, "%s:1",
>>> + chan->video.name);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(chan->kthread_capture_done)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ret =3D PTR_ERR(chan->kthread_capture_done);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 chan->kthread_capture_done =3D NULL;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 dev_err(&chan->video.dev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "failed capture done kt=
hread: %d\n", ret);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 goto error_kthread_done;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 chan->kthread_capture_start =3D=20
>>> kthread_run(chan_capture_kthread_start,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chan, "%s:0",
>>> + chan->video.name);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(chan->kthread_capture_start)) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 ret =3D PTR_ERR(chan->kthread_capture_start);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 chan->kthread_capture_start =3D NULL;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 dev_err(&chan->video.dev,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "failed capture start k=
thread: %d\n", ret);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 goto error_kthread_start;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>>> +
>>> +error_kthread_start:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 kthread_stop(chan->kthread_capture_done);
>>> +error_kthread_done:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 tegra_channel_set_stream(chan, false);
>>> +error_set_stream:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 media_pipeline_stop(&chan->video.entity);
>>> +error_pipeline_start:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 vq->start_streaming_called =3D 0;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 tegra_channel_release_queued_buffers(chan, VB=
2_BUF_STATE_QUEUED);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> +}
>>> +
>>> +void tegra210_vi_stop_streaming(struct vb2_queue *vq)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_vi_channel *chan =3D vb2_get_drv=
_priv(vq);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 struct tegra_channel_buffer *buf;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (!chan->kthread_capture_start || !chan->kt=
hread_capture_done)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 kthread_stop(chan->kthread_capture_start);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 chan->kthread_capture_start =3D NULL;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 kthread_stop(chan->kthread_capture_done);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 chan->kthread_capture_done =3D NULL;
>>> +
>> With the change in chan_capture_kthread_done() as described above you=20
>> can
>> drop the next 4 lines since that's guaranteed to be done by the thread.
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* wait for last frame MW_ACK_DONE */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 buf =3D dequeue_buf_done(chan);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 if (buf)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 tegra_channel_capture_done(chan, buf);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 tegra_channel_release_queued_buffers(chan, VB=
2_BUF_STATE_ERROR);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 tegra_channel_set_stream(chan, false);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* disable clock gating to enable continuous =
clock */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, 0)=
;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* reset VI MCIF, PF, SENSORCTL, and SHADOW l=
ogic */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0xF=
);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 vi_csi_write(chan, TEGRA_VI_CSI_SW_RESET, 0x0=
);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 vi_csi_write(chan, TEGRA_VI_CSI_IMAGE_DEF, 0)=
;
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 /* enable clock gating so VI can be clock gat=
ed if necessary */
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 tegra_vi_write(chan, TEGRA_VI_CFG_CG_CTRL, VI=
_CG_2ND_LEVEL_EN);
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 vi_csi_write(chan, TEGRA_VI_CSI_ERROR_STATUS,=
 0xFFFFFFFF);
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 media_pipeline_stop(&chan->video.entity);
>>> +}
>>> +
>>> +void tegra210_csi_error_recover(struct tegra_csi_channel *csi_chan)
>>
>> Regards,
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Hans
