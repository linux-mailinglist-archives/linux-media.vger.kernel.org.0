Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0900120F79C
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 16:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389111AbgF3Ox0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 10:53:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726839AbgF3OxX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 10:53:23 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CBE8C061755
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 07:53:23 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id 17so19878691wmo.1
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 07:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vU8QJtiplqTmSqw8ypzasx0YbzBFm0BcQC4xxxr4HG8=;
        b=QFkotrxeRALEX9g7O3TGucCppkOo4DtRy3iZKCuQHnfKpsS3CKbq4QFvbl/swW/L1x
         jLBKMATVqXL7m5kGFn/958mWVAY/tzNagsfvKBgJKFxYmrO2wRyTe4qf8VWS2rlEDO12
         f808nRgr3jcdWVlWCISfY8vyxMrKsXd6bcHgN0pNu3qbF9ZhkvqIqw+uk4W6rzm3LZXw
         xcTwwx8sjBpsi2evcSgk+jIWQnrUOAfxXjB81lqwsZfnr3Xg1XkD6yHkBBieyjRkA6Du
         c+SMsi2PcxAm95ENcETtphATMtazlo+jhXRpAuQ2DUFscjF4gsMPMYvETAR4fWV47U3H
         pEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vU8QJtiplqTmSqw8ypzasx0YbzBFm0BcQC4xxxr4HG8=;
        b=NBV5YXpRFuZO99slDQb/zrexhoAnDyGkB/C/PWpabfh1Mg9YtCGZ0r1FMqeH3P0ost
         3n2mnjuR7MoYV0C9oWEBALA4DSao7JLXRbQGRbQ6SSdwBPqIE3WtnlZGC76AVbisVJc4
         4KaF3M5NnOfRLkwPJiqqnywEdxL4gLMScoWN8DydqrMzkpTH1VKARD7++i3SQdXITw7v
         pS+pdJ3fdN9MB7TCjxethqYG728+rEDxDoEkZ/hmeknDOayBg4Ue7/Y1tSk98dyAgnsW
         NHBLwl1BBzcCBQGluUiZLqzlZKH9ciNk/3zq3fjaSlBTboxfN/qdsj7khvsPlSUrVk72
         uCGw==
X-Gm-Message-State: AOAM531M1yNTEJxGOtpOkf7E2CzSqsLTBsztTCBKcmsH+MdpbCCNXWzg
        15kBXFJMEob3ZN0Jj1RudGWCL5gUPq6dEDYCp9a0ag==
X-Google-Smtp-Source: ABdhPJxVjn7hkQZM5GrsQu1KMVEr4+tZ7MRpq6N10mB2DFFWlDrXNyQ3iRUZh4jNmvfSDB2RAQYRmeXkrE01C85Gw0I=
X-Received: by 2002:a05:600c:d7:: with SMTP id u23mr20682460wmm.183.1593528802015;
 Tue, 30 Jun 2020 07:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200623100815.10674-1-jacopo@jmondi.org> <20200623165550.45835-1-jacopo@jmondi.org>
 <80139e40-914f-c547-922f-91fe3f611202@collabora.com> <20200630074305.soctqoaqirfdnvv2@uno.localdomain>
 <e3dfbf68-f81b-3349-b3ad-dd9e5f6a0f5f@collabora.com> <20200630100651.ikjcazgbvoq2hab4@uno.localdomain>
 <de712b61-4b20-cfbd-ab79-d71bd1b7fc56@collabora.com> <20200630120528.xffvivfriblc6a2y@uno.localdomain>
 <ae93796f-dd9d-730b-008a-13f90ff1f5cd@collabora.com>
In-Reply-To: <ae93796f-dd9d-730b-008a-13f90ff1f5cd@collabora.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 30 Jun 2020 15:53:06 +0100
Message-ID: <CAPY8ntAtTpvh=20d+tda+H5nodSNeNiHOL8xtAsgi92ctW3BLw@mail.gmail.com>
Subject: Re: [libcamera-devel] [PATCH 20/25] media: ov5647: Program mode only
 if it has changed
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>, andrew_gabbasov@mentor.com,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        mrodin@de.adit-jv.com, erosca@de.adit-jv.com,
        Maxime Ripard <mripard@kernel.org>,
        Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>,
        libcamera-devel@lists.libcamera.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        hugues.fruchet@st.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
        aford173@gmail.com, sudipi@jp.adit-jv.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna

On Tue, 30 Jun 2020 at 14:01, Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
> Hi,
>
>
> On 30.06.20 14:05, Jacopo Mondi wrote:
> > Hi Dafna,
> >
> > On Tue, Jun 30, 2020 at 12:56:44PM +0200, Dafna Hirschfeld wrote:
> >>
> >>
> >> On 30.06.20 12:06, Jacopo Mondi wrote:
> >>> Hi Dafna,
> >>>
> >>> On Tue, Jun 30, 2020 at 11:32:12AM +0200, Dafna Hirschfeld wrote:
> >>>>
> >>>>
> >>>> On 30.06.20 09:43, Jacopo Mondi wrote:
> >>>>> Hi Dafna,
> >>>>>
> >>>>> On Mon, Jun 29, 2020 at 07:48:16PM +0200, Dafna Hirschfeld wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 23.06.20 18:55, Jacopo Mondi wrote:
> >>>>>>> Store in the driver structure a pointer to the currently applied mode
> >>>>>>> and program a new one at s_stream(1) time only if it has changed.
> >>>>>>
> >>>>>> Hi,
> >>>>>> I think this can be more readably implemented with a 'is_streaming' boolean
> >>>>>> field.
> >>>>>
> >>>>> How would you like to use an 'is_streaming' flag to decide if the
> >>>>> sensor mode has to be updated ?
> >>>>
> >>>> since 'current_mode' is set to NULL upon `ov5647_stream_off`
> >>>> and you return from 'ov5647_set_stream' immediately if 'mode == current_mode'
> >>>> it seem very similar to returning immediately from 'ov5647_set_stream' if the
> >>>> device is currently streaming.
> >>>
> >>> No, the code returns immediately from ov5647_set_mode() if mode ==
> >>> current_mode. The modes comparison makes sure the sensor is not
> >>> reprogrammed if the mode hasn't changed. The remaning part of
> >>> s_stream() is executed regardless of the mode configuration. Am I
> >>> missing some part of the picture ?
> >>>
> >>>>
> >>>> But actually in this patch it seems to be possible to change the mode
> >>>> while streaming, if the callbacks are executed:
> >>>>
> >>>> s_stream(1)
> >>>> s_fmt
> >>>> s_stream(1)
> >>>>
> >>>> which is maybe a bug?
> >>>
> >>> The new format is stored in sensor->mode, and applied at the next
> >>> s_stream(1) operation if it differs from the already programmed one,
> >>> at least, this is how it is intended to work, have you found any
> >>> failing s_stream/set_fmt/s_stream which could be caused by a bug ?
> >>
> >> What I meant is that there could be valid sequence of calls
> >>
> >> s_stream(enable=1)
> >> s_fmt
> >> s_stream(enable=1)
> >>
> >> For example if two video devices are connected to the sensor and they
> >> stream simultaneously. There was a discussion about adding a code to the core
> >
> > I'm not sure it is possible, given that the subdev has a single source
> > pad
>
> Video devices should not be connected directly to the sensor,

That's an odd statement as it is exactly the situation we have on the
Pi. The CSI2 receiver writes data to RAM, therefore it is a video
device.
Did you intend to say that it isn't necessarily connected directly to
the sensor?

> they can also
> be connected to the sensor through an isp entity that is connected to the sensor
> from one side and to two video devices from the other side.

It's true that some platforms will route the received CSI2 data
straight through the ISP, and only write the processed image(s) to
RAM. If there are multiple output video devices from the ISP then yes
they will VIDIOC_STREAMON at different points.
However is it really valid to call s_stream(1) on the sensor subdev
for each of them? Doesn't that mean you really need refcounting of the
number of s_stream(1)'s (and s_stream(0)'s) within each sensor driver,
so that it only actually stops streaming on the last s_stream(0), not
the first. A simple boolean isn't sufficient, otherwise
VIDIOC_STREAMON(NODE_A);
VIDIOC_STREAMON(NODE_B);
VIDIOC_STREAMOFF(NODE_B);
leaves you with no data from NODE_A even though it has never called
VIDIOC_STREAMOFF.

Anyway this patch was to remove excess writing of the mode registers if you did
s_fmt
s_stream(1)
s_stream(0)
s_stream(1)

The driver uses the s_power call rather than pm_runtime as that was an
acceptable approach when it was written in 2017, so the power, and
hence register settings, can be maintained between multiple s_stream
calls.

  Dave

> Thanks,
> D
>
> >
> >> to follow the s_stream callback and call it only if the subdev is not streaming
> >> but currently subdevs should support it themselves.
> >>
> >
> > Oh, so you're concerned about the fact userspace can call s_stream(1)
> > twice consecutively! it's indipendent from s_ftm if I got your point.
> >
> > In this case a flag to control if the device is streaming already should
> > help, yes, I overlooked that indeed.
> >
> > Thanks
> >    j
> >
> >>
> >> Thanks,
> >> Dafna
> >>
> >>>
> >>> Thanks
> >>>     j
> >>>>
> >>>> Thanks,
> >>>> Dafna
> >>>>
> >>>>>
> >>>>> Thanks
> >>>>>       j
> >>>>>
> >>>>>
> >>>>>>
> >>>>>> Thanks,
> >>>>>> Dafna
> >>>>>>
> >>>>>>>
> >>>>>>> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> >>>>>>> ---
> >>>>>>>      drivers/media/i2c/ov5647.c | 16 +++++++++++++++-
> >>>>>>>      1 file changed, 15 insertions(+), 1 deletion(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> >>>>>>> index 39e320f321bd8..ac114269e1c73 100644
> >>>>>>> --- a/drivers/media/i2c/ov5647.c
> >>>>>>> +++ b/drivers/media/i2c/ov5647.c
> >>>>>>> @@ -96,6 +96,7 @@ struct ov5647 {
> >>>>>>>         bool                            clock_ncont;
> >>>>>>>         struct v4l2_ctrl_handler        ctrls;
> >>>>>>>         struct ov5647_mode              *mode;
> >>>>>>> +       struct ov5647_mode              *current_mode;
> >>>>>>>      };
> >>>>>>>      static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> >>>>>>> @@ -750,9 +751,13 @@ static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
> >>>>>>>      static int ov5647_set_mode(struct v4l2_subdev *sd)
> >>>>>>>      {
> >>>>>>>         struct i2c_client *client = v4l2_get_subdevdata(sd);
> >>>>>>> +       struct ov5647 *sensor = to_sensor(sd);
> >>>>>>>         u8 resetval, rdval;
> >>>>>>>         int ret;
> >>>>>>> +       if (sensor->mode == sensor->current_mode)
> >>>>>>> +               return 0;
> >>>>>>> +
> >>>>>>>         ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
> >>>>>>>         if (ret < 0)
> >>>>>>>                 return ret;
> >>>>>>> @@ -778,6 +783,8 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
> >>>>>>>                         return ret;
> >>>>>>>         }
> >>>>>>> +       sensor->current_mode = sensor->mode;
> >>>>>>> +
> >>>>>>>         return 0;
> >>>>>>>      }
> >>>>>>> @@ -816,6 +823,7 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
> >>>>>>>      static int ov5647_stream_off(struct v4l2_subdev *sd)
> >>>>>>>      {
> >>>>>>> +       struct ov5647 *sensor = to_sensor(sd);
> >>>>>>>         int ret;
> >>>>>>>         ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, MIPI_CTRL00_CLOCK_LANE_GATE |
> >>>>>>> @@ -827,7 +835,13 @@ static int ov5647_stream_off(struct v4l2_subdev *sd)
> >>>>>>>         if (ret < 0)
> >>>>>>>                 return ret;
> >>>>>>> -       return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
> >>>>>>> +       ret = ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
> >>>>>>> +       if (ret < 0)
> >>>>>>> +               return ret;
> >>>>>>> +
> >>>>>>> +       sensor->current_mode = NULL;
> >>>>>>> +
> >>>>>>> +       return 0;
> >>>>>>>      }
> >>>>>>>      static int set_sw_standby(struct v4l2_subdev *sd, bool standby)
> >>>>>>>
> _______________________________________________
> libcamera-devel mailing list
> libcamera-devel@lists.libcamera.org
> https://lists.libcamera.org/listinfo/libcamera-devel
