Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6609719FE9A
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 22:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgDFUAa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 16:00:30 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14025 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725895AbgDFUAa (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 16:00:30 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e8b8a500001>; Mon, 06 Apr 2020 13:00:16 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 06 Apr 2020 13:00:29 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 06 Apr 2020 13:00:29 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr
 2020 20:00:29 +0000
Received: from [10.2.164.193] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 6 Apr 2020
 20:00:27 +0000
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Dmitry Osipenko <digetx@gmail.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <sboyd@kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <0809c1ae-57c9-508e-2959-724acc4ae068@gmail.com>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <378f0327-c5cd-6910-7d30-533354e89e7c@nvidia.com>
Date:   Mon, 6 Apr 2020 13:00:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0809c1ae-57c9-508e-2959-724acc4ae068@gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1586203216; bh=a+B6toPknxL+WZOxNj0oDHih81hp/Y5Auh402g2jYb8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=OkVibJfMkE97WaSQikxdiNt2CxvlYQJiuDU+50dmhHRAhQ/HUs5g2OTg1/FJNVZHs
         +DOwlzkOY0x0M5OrIyjg/XLhsD4u5ngTnPJ07OXiqMlARZ+mB14xhKUU5hACZzXDav
         oosatc90HiYPfPsY6gQcZHaOGcfz2jtOiezvJ9fNWKaZnEkUGEpivM7mygCFQcV287
         Z77kO2bRCobMVWqD76GojdjYTujckIGe2PzjkQn4Nz4LuI/x+jJnYkKOzdvV5oEOtK
         IWZa12wS6RP/UvSUItQvQtWna06N3/jWQwZJBUVvovh+saMDaeRSjvA65tvfL/WL+h
         sQdqg9MNWc0uw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 4/6/20 12:48 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>
>
> 04.04.2020 04:25, Sowjanya Komatineni =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> +static int tegra_channel_capture_frame(struct tegra_vi_channel *chan,
>> +                                    struct tegra_channel_buffer *buf)
>> +{
>> +     int err =3D 0;
>> +     u32 thresh, value, frame_start, mw_ack_done;
>> +     int bytes_per_line =3D chan->format.bytesperline;
>> +
>> +     /* program buffer address by using surface 0 */
>> +     vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_MSB,
>> +                  (u64)buf->addr >> 32);
>> +     vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_OFFSET_LSB, buf->addr);
>> +     vi_csi_write(chan, TEGRA_VI_CSI_SURFACE0_STRIDE, bytes_per_line);
>> +
>> +     /*
>> +      * Tegra VI block interacts with host1x syncpt for synchronizing
>> +      * programmed condition of capture state and hardware operation.
>> +      * Frame start and Memory write acknowledge syncpts has their own
>> +      * FIFO of depth 2.
>> +      *
>> +      * Syncpoint trigger conditions set through VI_INCR_SYNCPT registe=
r
>> +      * are added to HW syncpt FIFO and when the HW triggers, syncpt
>> +      * condition is removed from the FIFO and counter at syncpoint ind=
ex
>> +      * will be incremented by the hardware and software can wait for
>> +      * counter to reach threshold to synchronize capturing frame with =
the
>> +      * hardware capture events.
>> +      */
>> +
>> +     /* increase channel syncpoint threshold for FRAME_START */
>> +     thresh =3D host1x_syncpt_incr_max(chan->frame_start_sp, 1);
>> +
>> +     /* Program FRAME_START trigger condition syncpt request */
>> +     frame_start =3D VI_CSI_PP_FRAME_START(chan->portno);
>> +     value =3D VI_CFG_VI_INCR_SYNCPT_COND(frame_start) |
>> +             host1x_syncpt_id(chan->frame_start_sp);
>> +     tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
>> +
>> +     /* increase channel syncpoint threshold for MW_ACK_DONE */
>> +     buf->mw_ack_sp_thresh =3D host1x_syncpt_incr_max(chan->mw_ack_sp, =
1);
>> +
>> +     /* Program MW_ACK_DONE trigger condition syncpt request */
>> +     mw_ack_done =3D VI_CSI_MW_ACK_DONE(chan->portno);
>> +     value =3D VI_CFG_VI_INCR_SYNCPT_COND(mw_ack_done) |
>> +             host1x_syncpt_id(chan->mw_ack_sp);
>> +     tegra_vi_write(chan, TEGRA_VI_CFG_VI_INCR_SYNCPT, value);
>> +
>> +     /* enable single shot capture */
>> +     vi_csi_write(chan, TEGRA_VI_CSI_SINGLE_SHOT, SINGLE_SHOT_CAPTURE);
>> +     chan->capture_reqs++;
>> +
>> +     /* wait for syncpt counter to reach frame start event threshold */
>> +     err =3D host1x_syncpt_wait(chan->frame_start_sp, thresh,
>> +                              TEGRA_VI_SYNCPT_WAIT_TIMEOUT, &value);
> What is the point of waiting for the frame-start? Why just not to wait
> for the frame-end?

Tegra vi supports double buffering where up on receiving frame start=20
before HW received frame end and finish writing capture data to memory,=20
we can issue next frame as well a head.

Also MW_ACK timeout can happen incase of HDMI2CSI bridges as well when=20
hdmi hot plug happens.

For some sensors down the road we may need to skip few frames in case of=20
frame start timeout as well which comes later with subsequent patch series.

