Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55EE12F2C14
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 11:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728915AbhALKAc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 05:00:32 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:12675 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbhALKAa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 05:00:30 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 820DD24001D;
        Tue, 12 Jan 2021 09:59:44 +0000 (UTC)
Date:   Tue, 12 Jan 2021 11:00:01 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: Re: [PATCH v6 5/5] media: i2c: max9286: Configure reverse channel
 amplitude
Message-ID: <20210112100001.uksbn3ql6m7hzxja@uno.localdomain>
References: <20201215170957.92761-1-jacopo+renesas@jmondi.org>
 <20201215170957.92761-6-jacopo+renesas@jmondi.org>
 <X9pCSfxE722rnPHE@pendragon.ideasonboard.com>
 <20210111104311.e6nyxhzhvlyjjxxw@uno.localdomain>
 <X/wvc26LXz2VsCkp@pendragon.ideasonboard.com>
 <20210111112023.brrhxgfedo5fer53@uno.localdomain>
 <X/0triYZZJiXaf07@pendragon.ideasonboard.com>
 <20210112090805.myglp2lpozo3blq5@uno.localdomain>
 <CAMuHMdV3Cz_spPi=fMnsJ15On_MEhW15NArc8=6CsbJ7XfNZYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdV3Cz_spPi=fMnsJ15On_MEhW15NArc8=6CsbJ7XfNZYA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert

On Tue, Jan 12, 2021 at 10:10:39AM +0100, Geert Uytterhoeven wrote:
> Hi Jacopo,
>
> On Tue, Jan 12, 2021 at 10:07 AM Jacopo Mondi <jacopo@jmondi.org> wrote:
> > On Tue, Jan 12, 2021 at 07:03:42AM +0200, Laurent Pinchart wrote:
> > > On Mon, Jan 11, 2021 at 12:20:23PM +0100, Jacopo Mondi wrote:
> > > > On Mon, Jan 11, 2021 at 12:58:59PM +0200, Laurent Pinchart wrote:
> > > > > On Mon, Jan 11, 2021 at 11:43:11AM +0100, Jacopo Mondi wrote:
> > > > >> On Wed, Dec 16, 2020 at 07:22:17PM +0200, Laurent Pinchart wrote:
> > > > >>> On Tue, Dec 15, 2020 at 06:09:57PM +0100, Jacopo Mondi wrote:
> > > > >>>> Adjust the initial reverse channel amplitude parsing from
> > > > >>>> firmware interface the 'maxim,reverse-channel-microvolt'
> > > > >>>> property.
> > > > >>>>
> > > > >>>> This change is required for both rdacm20 and rdacm21 camera
> > > > >>>> modules to be correctly probed when used in combination with
> > > > >>>> the max9286 deserializer.
> > > > >>>>
> > > > >>>> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > > >>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> > > > >>>> ---
> > > > >>>>  drivers/media/i2c/max9286.c | 23 ++++++++++++++++++++++-
> > > > >>>>  1 file changed, 22 insertions(+), 1 deletion(-)
> > > > >>>>
> > > > >>>> diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
> > > > >>>> index 021309c6dd6f..9b40a4890c4d 100644
> > > > >>>> --- a/drivers/media/i2c/max9286.c
> > > > >>>> +++ b/drivers/media/i2c/max9286.c
> > > > >>>> @@ -163,6 +163,8 @@ struct max9286_priv {
> > > > >>>>        unsigned int mux_channel;
> > > > >>>>        bool mux_open;
> > > > >>>>
> > > > >>>> +      u32 reverse_channel_mv;
> > > > >>>> +
> > > > >>>>        struct v4l2_ctrl_handler ctrls;
> > > > >>>>        struct v4l2_ctrl *pixelrate;
> > > > >>>>
> > > > >>>> @@ -557,10 +559,14 @@ static int max9286_notify_bound(struct v4l2_async_notifier *notifier,
> > > > >>>>         * All enabled sources have probed and enabled their reverse control
> > > > >>>>         * channels:
> > > > >>>>         *
> > > > >>>> +       * - Increase the reverse channel amplitude to compensate for the
> > > > >>>> +       *   remote ends high threshold, if not done already
> > > > >>>>         * - Verify all configuration links are properly detected
> > > > >>>>         * - Disable auto-ack as communication on the control channel are now
> > > > >>>>         *   stable.
> > > > >>>>         */
> > > > >>>> +      if (priv->reverse_channel_mv < 170)
> > > > >>>> +              max9286_reverse_channel_setup(priv, 170);
> > > > >>>
> > > > >>> I'm beginning to wonder if there will be a need in the future to not
> > > > >>> increase the reverse channel amplitude (keeping the threshold low on the
> > > > >>> remote side). An increased amplitude increases power consumption, and if
> > > > >>> the environment isn't noisy, a low amplitude would work. The device tree
> > > > >>> would then need to specify both the initial amplitude required by the
> > > > >>> remote side, and the desired amplitude after initialization. What do you
> > > > >>> think ? Is it overkill ? We don't have to implement this now, so
> > > > >>>
> > > > >>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > > >>>
> > > > >>> but if this feature could be required later, we may want to take into
> > > > >>> account in the naming of the new DT property to reflect the fact that it
> > > > >>> is the initial value.
> > > > >>
> > > > >> I had the same thought when I initially proposed
> > > > >> "maxim,initial-reverse-channel-mV"
> > > > >>
> > > > >> Having to use the standard unit suffix that would have become
> > > > >> "maxim,initial-reverse-channel-microvolt"
> > > > >> which is extremely long.
> > > > >>
> > > > >> I can't tell if there will be any need to adjust the amplitude later.
> > > > >> In any case, I would not rely on a DTS property to do so, as once we
> > > > >> have probed the remote we have a subdev where to call
> > > > >> 'get_mbus_config()' on, and from there we can report the high threshold
> > > > >> status of the serializer and adjust the deser amplitude accordingly.
> > > > >
> > > > > I don't think that's the point. The threshold of the serializer is
> > > > > something we can configure at runtime. What voltage level to use after
> > > >
> > > > How so ? I mean, we can add an API for this, but currently it's
> > > > configured at probe time and that's it. Its configuration might as
> > > > well come from a DT property like we do on the deserializer here but I
> > > > fail to see why it's different. Both settings depends on the required
> > > > noise immunity of th system.
> > >
> > > The voltage level configuration need to match between the tserializer
> > > (transmitter) and the deserializer (receiver). The serializer is
> > > configured with a voltage level, and the deserializer needs to be
> > > configured with a corresponding threshold.
> > >
> >
> > If I'm not mistaken it's actually the other way around, at least for
> > the chips we're dealing with.
> >
> > The serializer (MAX9271) has an "Reverse Channel Receiver High
> > Threshold Enable" bit (register 0x08[0]) undocumented in the chip
> > manual but described in the "MAX9286 Programming Guide 2 10.pdf"
> > document in the "Important Registers" section.
> >
> > The deserializer (MAX9286) has instead a configurable setting for the reverse
> > channel signal amplitude, which is what we are controlling in this
> > series.
> >
> > The deserializer reverse channel amplitude has to match the remote
> > side 'high threshold enable' setting. If it is enabled the amplitude
> > has to be increased to be able to probe the remote side. If it's not
> > a lower amplitude has to be used to make comunication reliable.
> >
> > As you said, some models (RDACM20) might be pre-programmed with the
> > 'high threshold enable' bit set, and so the deserializer reverse
> > channel amplitude has to be adjusted accordingly to be able to
> > comunicate on the reverse channel.
> >
> > > The voltage level of the serializer is configurable on the camera side
> > > when the system is powered up. The RDACM20 has a microcontroller which
> > > can configure the serializer, and other cameras may have similar
> > > mechanisms. As the deserializer can't query the information from the
> > > serializer (communication is unreliable if the threshold has an
> > > incorrect value), we need a DT property to tell the deserializer what
> > > threshold is initially used by the camera when it gets powered up.
> > >
> >
> > That's what this series does, yes.
> >
> > > This only covers initialization. A camera could boot up with a low
> > > voltage level, but we may want to increase the voltage level (and thus
> > > the threshold on the deserializer side) to increase noise immunity. Or,
> > > if the system environment isn't noisy, we may want to keep a low voltage
> > > level, or even decrease it if the camera boots up with a high voltage
> > > level. This runtime voltage level depends on the system design and its
> > > susceptibility to noise, and is thus a system property. Should we want
> > > to make it configurable, it should be specified in DT, and it's separate
> > > from the initial voltage level that is used to establish communication.
> > >
> >
> > And that's what I meant. Assuming we handle initialization correctly
> > with this series, the serializers 'high threshold' configuration
> > -after- initialization can be specified with a DT property on the
> > -serializer- side. Then, to adjust the deserializer reverse channel
> > amplitude, once we the remote has probed and we have a subdevice
> > registered for it, we can query the 'high threshold' configuration
> > using get_mbus_config() (or another API if we think it's better) and
> > adjust the deserializer accordingly.
> >
> > All in all:
> > - yes, I think there might be a need to control the noise immunity
> >   settings after initialization
> > - I think it should be done on the serializer side, possibly with a DT
> >   property, possibly something like a boolean 'maxim,high-threshold-enable'
>
> Can the needed voltage level be calibrated at runtime, cfr. DDR
> link training?

I'm not familiar with the mechanism you mention here, but being the
voltages levels a tuning parameters meant to maximize the reliability
of a communication channel which might show failure that cannot be
recovered easily [1] I fear it hardly can be run-time
calibrated but it's rather a decision that system integrators have to
make, depending on their usage environment and possibly a lot of
reliability testing.

Thanks
   j


[1] To give a simple example, if the deserializer detects it cannot
communicate with the remote side (and that's also hard to guess, as
the start-up phase requires auto-ack of i2c messages transmitted on
the reverse channel) how could it 'suggest' to the remote side that it
should enable its noise immunity threshold ?

>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
