Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBD8B42BA26
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 10:25:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238394AbhJMI1z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 04:27:55 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:39345 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbhJMI1x (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 04:27:53 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 954906000B;
        Wed, 13 Oct 2021 08:25:46 +0000 (UTC)
Date:   Wed, 13 Oct 2021 10:26:34 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
Message-ID: <20211013082634.53zh5j26gucddome@uno.localdomain>
References: <m3fstfoexa.fsf@t19.piap.pl>
 <20211009102446.jrvrdr7whtd2rv4z@uno.localdomain>
 <m3mtnflpna.fsf@t19.piap.pl>
 <20211011143420.vm6ncl5gdv44nsn3@uno.localdomain>
 <m3a6jel9ce.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <m3a6jel9ce.fsf@t19.piap.pl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof

On Tue, Oct 12, 2021 at 02:24:17PM +0200, Krzysztof Hałasa wrote:
> Jacopo,
>
> > I'll pretend I haven't read this not to be dragged in tangential
> > discussions. My whole point was such a commit message is useless as I
> > assume if you submit a driver for inclusion you have tested it.
>
> Fine, I will remove that very commit comment.
>
> > I think the clock rate should be assigned in DTS and you should verify
> > it falls in the supported clock ranges.
>
> Which driver does that, please?
> clk_set_rate() appears to be used by multiple drivers, I was thinking
> I can use it.
> I can see clock frequencies in DTS, but they usually refer to fixed
> clocks (e.g. crystal-based). The clock I use is IMX6QDL_CLK_CKO, some
> sort of a shared generic clock from inside of the CPU. I don't know if
> I could even set its frequency in DTS.
>
> >> total_width = max(sensor->fmt.width + AR0521_WIDTH_BLANKING_MIN, AR0521_TOTAL_WIDTH_MIN);
> >> But this needs verifying.
> >
> > There's usually a minimum amount of blankings to be respected, not a
> > total, even less if the sensor capable of producing smaller modes
> > through subsampling. Is this sensor different ? I haven't found any
> > mention in the datasheet.
>
> I got these values experimentally. But it was few years ago and I have
> to look at them again.
>
> > Everyone has preferences. I do have mine, and they DON'T MATTER when I
> > submit code for inclusion.
>
> This is a straw man argument, I don't force anyone to my prefs (like
> e.g. 4-chars tabs). What we have here is a written coding-style
> document, and documented amendments from high profile developers.
> Now there are additional, informal and previously unknown to me
> requirements, of unknown source, which I'm apparently required to
> follow, so my questions shouldn't came as a surprise, should they?
>

You have never been told before, while submitting code to Linux, not
to use C++ comments ? Are you surprised someone contests that ?

> > "We" is me reporting what I've been told in these years from people
> > that spent their time reviewing my code and making sure the result is
> > consistent among the whole subsystem. The style of this driver is
> > totally alien to any convention in place here, and if you can ignore
> > my comments as I'm just a random idiot on the internet, you have been
> > told the same by the other people that cared enough to look into your
> > code.
>
> Well I must say I wasn't told that "style of this driver is totally
> alien to any convention in place here" by anyone else yet.
>

It is.

No driver in media (which I'm aware of) uses C++ comments.
Your one is entirely commented with C++ comments.

They all try to stay in the 80-cols limit.
Yours have lines that span to 140 cols and goes regularly over 100.

Lowercase hex is preferred (based on the review I read on the list)
but not enforced, I give you that.

> > It all really sounds like "it's better my way, please don't annoy me".
> > I don't find this a productive way to operate in a cooperative space
> > :)
>
> I have already changed a lot of stuff, based on the feedback by several
> people, and will probably change a lot more. Is it really like you say?
> I don't think so.
> Now swap the seats and tell me that what you say isn't now true.
>
> Think about it.
>

Ok, I give up then, feels like a waste of time reviewing a driver
(for the only sake of code consistency) and have every single comment
contested.

I don't have interest in blocking this driver, the contrary, if it's
fine for everyone else the way it is. Let me just point you to

Documentation/driver-api/media/maintainer-entry-profile.rst

and has there suggested have the patch go through
./scripts/checkpatch.pl --strict --max-line-length=80

Then I'll stop bothering about style and I'll let maintainers decide
what to pick up.

> >> Even on otherwise idle I2C bus this would add unnecessary latency.
> >> I prefer to have a much faster code, even if using that be() macro
> >> (which isn't ugly IMHO).
> >
> > 'be()' is bad as it is only used in this driver, modifying the
> > register tables requires to handle the be() macro. I had tested this
> > by moving register tables to and from a different driver and I had to
> > manually insert the be() thing and remove it on the other way around.
> >
> > For one that writes code there are tens that reads, use and modify it.
> > And you should be mostly concerned about them.
>
> I think I have to be most concerned about the operation of the driver.
> What good is a nicely looking code if it doesn't work?
> Also, I would think the author (me in this case) is the person who reads
> his/her code most often, though obviously it may be much less that all
> others combined.
>
> I'd love to get rid of the be(), though. What do you propose instead?
>

Mode based sensor drivers usually rely on long register tables, whose
writing is an expensive operation to be done at streamon time. Power
up is usually done at devnode open time but you relay on the legacy
s_power() here, so it's in control of the receiver driver which
depending on the implemenation might call it at open() time or stream
on. Sorry, I didn't notice that, has you register a devnode I assumed
you had an open() function, which you don't.

You have two tables of registers:
- the initial settings (70 register) that you write in pairs (which
  means 280 bytes on the bus)
- recommended timings (216 registers) that you write in a single i2c
  transaction. A third of those registers is 0x0000 (no be() is
  needed).

There are more or less 15 other occurrences of be(), which are for
registers writes at streamon time (timings, pll and gains mostly).

The efficiency argument holds as long as we are in an hot path and I
understand writing 216 registers in pairs has an overhead which to
me, at open devnode open time is marginal, but if done at streamon time
should be avoided.

Please keep the suggested timings table declared as big endian in
place then. I would not use be() to write the handful of registers for
pll and gains at runtime, but up to you.

> > The long table writes should be done once at power-up time, not in any
> > hot path.
>
> Power-up isn't "once" anymore. It looks like it's to be done before
> every start of capture operation (my device will not do that).
>

As said, as your driver registers a subdev devnode, but also support
operations with a devnode-centric receivers, you're not in control of
when s_power() is called.

> > That said, if the efficiency argument holds for others, feel free to
> > keep it the way it is.
>
> It's just how the 1982 hardware thing work.
>
> > I tested with that yes, I can try remove the already programmed totals
> > and see if it's only 0x300c that makes a difference
>
> Just tested it and it works for me in 1920x1080p30 without any changes.
> Would it be possible it's the gain/exposure settings? If not, what exact
> clock frequency (for the chip) do you use?

24Mhz

> (I haven't yet a chance to test this 0x300c register, but will do).

I tested it again, and programming the right 0x300c (or the mirror
register) makes a difference between having completely dark images or
good ones.

Also I got mangled frames before I changed the streamon sequence to
what I've shared. But I need to verify that again as the receiver code
was moving too.

>
> > Do you know why registers are mirrored ? I haven't find any reference
> > to register shadowing in the manual.
>
> I think the first set follows some standard, but it lacks something -
> thus a new set. Or maybe it's how the chip was build from blocks - I
> don't know.
>

The difference is that the 0x3xxx ones are frame synchronized and
apply to 'bad frames' too.

> >> When you disable streaming, the clock lanes are apparently in LP-11
> >> state, however data lanes are LP-00.
> >
> > I see. Reading this and your below reply I get you need to enable test
> > mode, force the lines in LP-11 state and then disable the test mode
> > and start streaming. Feels like an ack, but maybe that's how the
> > sensor is intended to be operated.
>
> I don't think so. I think, in proprietary development, nobody cares
> about what does the chip send while not streaming.
>

afaict only imx6 has this check enforced (but I might be wrong)

> > I anyway think doing this here is not the best idea. "We" have a
> > pre_streamon() operation but it's also usually done at s_stream(0)
> > which you can call at device node open time to coax the lines in
> > LP-11. You already do most of these things, so I would move the test
> > mode handling to s_stream(0) and start/stop stream by just toggling
> > the RESET_STREAM bit as suggested in the s_stream() code snippet I've
> > shared in my previous reply.
>
> I don't get it completely. However I see I could use the pre_stream()
> to put the sensor in LP-11 mode (doing this in s_stream(0) would then be
> pointless). I will see if it works.

Be aware that relying on pre_streamon() requires the receiver driver
to be instrumented to call the operation. Doing that at s_stream(0)
time works with all receivers.

> RESET_STREAM must be already set to 1 (ACTIVE STREAMING) before
> s_stream(1) is called.
>
> >> > This register controls the HiSPI interface while my understanding is
> >> > that everything is MIPI CSI-2 in the rest of the driver. Why is it
> >> > here ? does it play any role in your setup ?
> >>
> >> Yes, it also controls MIPI mode.
> >
> > Maybe by accident, as a consequence enabling/disabling the test modes on
> > the CSI-2 lanes ?
>
> I guess it simply enables/disables the chosen test mode in the CSI-2
> lanes :-)
> I've chosen the test mode to be, well, LP-11 on all lines.
>
> >> >> +	return ar0521_write_reg(sensor, AR0521_REG_RESET,
> >> >> +				AR0521_REG_RESET_DEFAULTS |
> >> >> +				AR0521_REG_RESET_RESTART |
> >> >> +				AR0521_REG_RESET_STREAM);
> >> >> +}
> >>
> >> That's correct. It's the only way I have found.
> >
> > I think it's wrong. RESTART as per its definition interrupts the frame
> > and re starts the stream. START enables/disable streaming. You set
> > them both, even at s_stream(0) time, and things might work by
> > accident because you enable/disable the test mode at s_stream() time.
> >
> > As suggested I would rather coax the data lanes in LP-11 state at
> > s_stream(0) time by enabling test mode after having disabled streaming
> > by clearing the RESET_STREAM bit in AR0521_REG_RESET.
>
> How would you do that?
> If you disable streaming, LP-11 is gone.
> You need STREAMING to actually "stream" LP-11.
>

Even for test mode ? So for you streamoff is:
- Enable test mode (programmed to be LP-11)
- Start stream
?

Anyway, should the AR0521_REG_RESET_RESTART bit be dropped ?

> > Similarly at
> > s_stream(1) time I would disable the test mode (I bet it could be done
> > by clearing bits [9:6] in 0x3066 without touching the HiSpi control
> > register) and the start streaming by setting RESET_STREAM.
>
> You lost your bet :-)
> Clearing these bits disables test on data lanes only.

Ack

> To disable clock lane test you have to clear 0x31C6.
> This is what I do in s_stream(1):
>
>                 // normal output on clock and data lanes
>                 ret = ar0521_write_reg(sensor, AR0521_REG_HISPI_CONTROL_STATUS, 0);
>
> 0x31C6 = AR0521_REG_HISPI_CONTROL_STATUS which is a misnomer and perhaps
> I should call it AR0521_REG_MIPI_AND_HISPI_CONTROL_STATUS.
>

I don't have a way to test LP-11 state, but it feels really weird to
have to go through a test mode, programmed through a register
dedicated to HiSPi handling, to be able to have lanes in that state.
But sensors are weird, and if this works for you it's fine.

I would just try to centralize it in s_stream()

> >> I wonder if you can call set_fmt() etc. when the sensor is streaming.
> >> Why not?
> >
> > Because
> > https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-subdev-g-fmt.html?highlight=subdev_s_fmt#c.V4L.VIDIOC_SUBDEV_S_FMT
> >
> > EBUSY
> > The format can’t be changed because the pad is currently busy. This
> > can be caused, for instance, by an active video stream on the pad. The
> > ioctl must not be retried without performing another action to fix the
> > problem first. Only returned by VIDIOC_SUBDEV_S_FMT
>
> But it doesn't say EBUSY MUST BE returned when the sensor is streaming,
> only that it MAY BE returned. Looking at the code, I can see nothing
> forcing the EBUSY (subdev_do_ioctl(VIDIOC_SUBDEV_S_FMT) ->

There's nothing in the core that has the notion of 'active streaming'

> v4l2_subdev_call(set_fmt)). It also appears several drivers update
> registers in their set_fmt(), so I think it's the desirable action
> there.
>

I hardly see a case where changing format on the sensor through an
operation on the subdev while streaming, is a good idea.

Also, you have a devnode, so you can change the format on the subdev
only, without informing the receiver.

Also, your s_fmt() and s_frame_interval() call write_mode() which
stops the streaming and it doesn't get restarted. I think that's
wrong and it's an undesired side effect.

(Also had a chat with Hans about this, the takeaway is that it's a
really bad idea and you need very strong reasons to allow that. It
could be considered for extreme cases like changing the color spaces of
reducing the image size as the allocated buffers are big enough but
again, you need very strong reasons to do so)

> >> >> +	ret = ar0521_write_reg(sensor, AR0521_REG_ROW_SPEED, 0x110 | 4 / sensor->lane_count);
> >> >
> >> > I wasn't able to interpret this register right
> >> >
> >> > pc_speed
> >> > Slows down the internal pixel clock frequency relative to the system
> >> > clock frequency.  A programmed value of N gives a pixel clock period
> >> > of N system clocks.  Only values 1, 2 and 4 are supported.
> >> >
> >> > Shouldn't this be part of the PLL calculation ?
> >>
> >> Well, this doesn't seem to be part of the PLL, and it's constant (as
> >> long as MIPI lane# is constant). Why do you think it belongs there?
> >
> > Because seems like a clock downscaler intended to be used to adapt the CSI-2
> > clock frequency (lane dependent) to the pixel clock and could be
> > programmed once.
>
> Exactly. This "programmed once" (per power-up) is exactly why I set it
> in ar0521_power_on() instead of calc_pll().
> First, calc_pll is calculations-only, no hw access (suggested by Laurent
> IIRC, and it plays well). Second, calc_pll() is called multiple times.
>
> > Also note that the number of data lanes in use can actually be modified at
> > run time but it's not something that has to be considered here.
>
> Yes, #lanes is constant here, though variable lane count could be
> useful - for tests, and in my other (unpublished) experiments. I don't
> know if it was possible back then, when I wrote the driver.
>
> [initial_regs]
>
> >> You know, I try not to throw unnecessary traffic at I2C bus, too.
> >
> > So this could moved to the register tables ? :)
>
> The truth is, I've considered doing exactly that. But they're quite
> fragmented (pixel_timing_recommended is linear) and well, perhaps I
> didn't want to complicate code too much. I may still do it, though.
> Guess I should.
>
> > i think you can remove any reference to events
>
> Good :-)
>
> > You should probably also support init_cfg as you expose a subdev video
> > device and you can have an init_format() or similar to be called there
> > for the try format and called here for the active format.
>
> Will have a look.
>
> > Maybe I'm wrong but calling set_suspend() after pm_runtime() had been
> > disabled seems pointless. A minor anyway as it's in the driver's
> > remove function.
>
> Daniel already posted a comment about this, however the whole
> pm_runtime*() in this driver is a bit fragile and I'd welcome someone
> who know how does this PM stuff work looking at it...
> ... with the following quick patch applied on top of v5:
>
> -	pm_runtime_idle(&client->dev);
> +	if (pm_runtime_idle(&client->dev) == -ENOSYS) {
> +		ret = ar0521_power_on(sensor);
> +		if (ret)
> +			goto disable;
> +	}
>  	dev_dbg(dev, "AR0521 driver initialized, master clock frequency: %u MHz, %u MIPI data lanes\n",
>  		sensor->extclk_freq, sensor->lane_count);
>  	return 0;
>
> +disable:
> +	v4l2_async_unregister_subdev(&sensor->sd);
> +	media_entity_cleanup(&sensor->sd.entity);
>  free_ctrls:
>  	v4l2_ctrl_handler_free(&sensor->ctrls.handler);
>  entity_cleanup:
>
> (Power is only needed after probe()).
>
> I'll post v6 eventually, of course, but have to squeeze this in
> somewhere.
> --
> Krzysztof "Chris" Hałasa
>
> Sieć Badawcza Łukasiewicz
> Przemysłowy Instytut Automatyki i Pomiarów PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa
