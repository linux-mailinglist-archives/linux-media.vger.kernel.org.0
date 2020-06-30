Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A314020F415
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 14:02:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732746AbgF3MCJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 08:02:09 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:52995 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729924AbgF3MCJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 08:02:09 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id B89EB200008;
        Tue, 30 Jun 2020 12:01:59 +0000 (UTC)
Date:   Tue, 30 Jun 2020 14:05:28 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
        roman.kovalivskyi@globallogic.com, dave.stevenson@raspberrypi.org,
        naush@raspberrypi.com, mrodin@de.adit-jv.com,
        hugues.fruchet@st.com, mripard@kernel.org, aford173@gmail.com,
        sudipi@jp.adit-jv.com, andrew_gabbasov@mentor.com,
        erosca@de.adit-jv.com, linux-media@vger.kernel.org,
        libcamera-devel@lists.libcamera.org,
        dafna Hirschfeld <dafna3@gmail.com>
Subject: Re: [PATCH 20/25] media: ov5647: Program mode only if it has changed
Message-ID: <20200630120528.xffvivfriblc6a2y@uno.localdomain>
References: <20200623100815.10674-1-jacopo@jmondi.org>
 <20200623165550.45835-1-jacopo@jmondi.org>
 <80139e40-914f-c547-922f-91fe3f611202@collabora.com>
 <20200630074305.soctqoaqirfdnvv2@uno.localdomain>
 <e3dfbf68-f81b-3349-b3ad-dd9e5f6a0f5f@collabora.com>
 <20200630100651.ikjcazgbvoq2hab4@uno.localdomain>
 <de712b61-4b20-cfbd-ab79-d71bd1b7fc56@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <de712b61-4b20-cfbd-ab79-d71bd1b7fc56@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Tue, Jun 30, 2020 at 12:56:44PM +0200, Dafna Hirschfeld wrote:
>
>
> On 30.06.20 12:06, Jacopo Mondi wrote:
> > Hi Dafna,
> >
> > On Tue, Jun 30, 2020 at 11:32:12AM +0200, Dafna Hirschfeld wrote:
> > >
> > >
> > > On 30.06.20 09:43, Jacopo Mondi wrote:
> > > > Hi Dafna,
> > > >
> > > > On Mon, Jun 29, 2020 at 07:48:16PM +0200, Dafna Hirschfeld wrote:
> > > > >
> > > > >
> > > > > On 23.06.20 18:55, Jacopo Mondi wrote:
> > > > > > Store in the driver structure a pointer to the currently applied mode
> > > > > > and program a new one at s_stream(1) time only if it has changed.
> > > > >
> > > > > Hi,
> > > > > I think this can be more readably implemented with a 'is_streaming' boolean
> > > > > field.
> > > >
> > > > How would you like to use an 'is_streaming' flag to decide if the
> > > > sensor mode has to be updated ?
> > >
> > > since 'current_mode' is set to NULL upon `ov5647_stream_off`
> > > and you return from 'ov5647_set_stream' immediately if 'mode == current_mode'
> > > it seem very similar to returning immediately from 'ov5647_set_stream' if the
> > > device is currently streaming.
> >
> > No, the code returns immediately from ov5647_set_mode() if mode ==
> > current_mode. The modes comparison makes sure the sensor is not
> > reprogrammed if the mode hasn't changed. The remaning part of
> > s_stream() is executed regardless of the mode configuration. Am I
> > missing some part of the picture ?
> >
> > >
> > > But actually in this patch it seems to be possible to change the mode
> > > while streaming, if the callbacks are executed:
> > >
> > > s_stream(1)
> > > s_fmt
> > > s_stream(1)
> > >
> > > which is maybe a bug?
> >
> > The new format is stored in sensor->mode, and applied at the next
> > s_stream(1) operation if it differs from the already programmed one,
> > at least, this is how it is intended to work, have you found any
> > failing s_stream/set_fmt/s_stream which could be caused by a bug ?
>
> What I meant is that there could be valid sequence of calls
>
> s_stream(enable=1)
> s_fmt
> s_stream(enable=1)
>
> For example if two video devices are connected to the sensor and they
> stream simultaneously. There was a discussion about adding a code to the core

I'm not sure it is possible, given that the subdev has a single source
pad

> to follow the s_stream callback and call it only if the subdev is not streaming
> but currently subdevs should support it themselves.
>

Oh, so you're concerned about the fact userspace can call s_stream(1)
twice consecutively! it's indipendent from s_ftm if I got your point.

In this case a flag to control if the device is streaming already should
help, yes, I overlooked that indeed.

Thanks
  j

>
> Thanks,
> Dafna
>
> >
> > Thanks
> >    j
> > >
> > > Thanks,
> > > Dafna
> > >
> > > >
> > > > Thanks
> > > >      j
> > > >
> > > >
> > > > >
> > > > > Thanks,
> > > > > Dafna
> > > > >
> > > > > >
> > > > > > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > > > > > ---
> > > > > >     drivers/media/i2c/ov5647.c | 16 +++++++++++++++-
> > > > > >     1 file changed, 15 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> > > > > > index 39e320f321bd8..ac114269e1c73 100644
> > > > > > --- a/drivers/media/i2c/ov5647.c
> > > > > > +++ b/drivers/media/i2c/ov5647.c
> > > > > > @@ -96,6 +96,7 @@ struct ov5647 {
> > > > > >     	bool				clock_ncont;
> > > > > >     	struct v4l2_ctrl_handler	ctrls;
> > > > > >     	struct ov5647_mode		*mode;
> > > > > > +	struct ov5647_mode		*current_mode;
> > > > > >     };
> > > > > >     static inline struct ov5647 *to_sensor(struct v4l2_subdev *sd)
> > > > > > @@ -750,9 +751,13 @@ static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
> > > > > >     static int ov5647_set_mode(struct v4l2_subdev *sd)
> > > > > >     {
> > > > > >     	struct i2c_client *client = v4l2_get_subdevdata(sd);
> > > > > > +	struct ov5647 *sensor = to_sensor(sd);
> > > > > >     	u8 resetval, rdval;
> > > > > >     	int ret;
> > > > > > +	if (sensor->mode == sensor->current_mode)
> > > > > > +		return 0;
> > > > > > +
> > > > > >     	ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
> > > > > >     	if (ret < 0)
> > > > > >     		return ret;
> > > > > > @@ -778,6 +783,8 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
> > > > > >     			return ret;
> > > > > >     	}
> > > > > > +	sensor->current_mode = sensor->mode;
> > > > > > +
> > > > > >     	return 0;
> > > > > >     }
> > > > > > @@ -816,6 +823,7 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
> > > > > >     static int ov5647_stream_off(struct v4l2_subdev *sd)
> > > > > >     {
> > > > > > +	struct ov5647 *sensor = to_sensor(sd);
> > > > > >     	int ret;
> > > > > >     	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, MIPI_CTRL00_CLOCK_LANE_GATE |
> > > > > > @@ -827,7 +835,13 @@ static int ov5647_stream_off(struct v4l2_subdev *sd)
> > > > > >     	if (ret < 0)
> > > > > >     		return ret;
> > > > > > -	return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
> > > > > > +	ret = ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
> > > > > > +	if (ret < 0)
> > > > > > +		return ret;
> > > > > > +
> > > > > > +	sensor->current_mode = NULL;
> > > > > > +
> > > > > > +	return 0;
> > > > > >     }
> > > > > >     static int set_sw_standby(struct v4l2_subdev *sd, bool standby)
> > > > > >
