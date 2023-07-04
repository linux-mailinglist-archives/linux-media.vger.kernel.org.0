Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE54574759F
	for <lists+linux-media@lfdr.de>; Tue,  4 Jul 2023 17:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231481AbjGDPwA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Jul 2023 11:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjGDPv7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Jul 2023 11:51:59 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57194B2
        for <linux-media@vger.kernel.org>; Tue,  4 Jul 2023 08:51:57 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-440b9d60606so1950462137.1
        for <linux-media@vger.kernel.org>; Tue, 04 Jul 2023 08:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1688485916; x=1691077916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwSy7+fEjy/2IZZj7haKoYwSrepNjF3/kDNWSG1rRK0=;
        b=ILcQUuBBJBPXor2nTdVrlCXwBfyF4JCo3PLi2YZ5MYIST8UuFD8VV86qNYteycu8m1
         Ck8OQSxNkdVoh75icJNODsdJpk08573nQD7izCuR7wDtMCkHjrDF7BhO/Ws3uzfQZTui
         /7+waScVo6QCm0UmGU6mfUSUOw6XzgE63YGPk8c/ZRJAIo9wbBcoWUz/UqYC8UtRUjiR
         cO4kRuVaEW5X3Nj0B6INNhho9SqrM+X2W91NdWTSwIOy9zvFX5caBo5KpiMsTukE/mPU
         y+fqyyJ60ilfXlu/n/kRT5pLP7gzoc4lKXGoWlvjl/58dn1FcEFToDiM2KVUru60ciuS
         p5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688485916; x=1691077916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IwSy7+fEjy/2IZZj7haKoYwSrepNjF3/kDNWSG1rRK0=;
        b=Vwm37vwobIcDDsZBKNoS14C2FgdhK2KQkHq1SSMHxRLe4EpK4blpSSXlkNRfOSPQKE
         d1Gj0Q7s6HVdzxl6+sQV21n3VJpwQEmEjBtDS3PRpIiIpYdYnKu2a1OzGJvJHg+HmFsh
         zsI1eLBf9HMwa030ImaSO3v8952asSsnPn3pDLgMqG8Wbcx/w4L8AchynfQIC49s5UdC
         DvYB9SWFx2qJWPMe0lgcBT8RFXNIyv7zDaUuz3M9EJYB0JnvW/o3GP0UY5lcfNElNqm9
         d/qI03694TKgb+6yVrZrwg/+/bhQnrJnOo290V9RJR1g5+Q0lO6FsUYHlu0SUNkQH+pR
         Mw/w==
X-Gm-Message-State: ABy/qLY6Q9JWx6ga2li2n/ZEp9zFF1e4cGrwJRDq5ZHoSAlJjtYn6oz7
        vJaEcF+GQHqQGIVN2PuqVkJAZJ0I7BWTNqMp6jODr8n54xi/kSrk7Pc=
X-Google-Smtp-Source: APBJJlGuwC2whC388OGyillNEv69hkJE7rKYFEmIORwHw84NtBsZ/6Da2Xy83oqGXYANPrCRkCl7ROrvbQ4Q9tL9usg=
X-Received: by 2002:a05:6102:50d:b0:437:e5ce:7e8f with SMTP id
 l13-20020a056102050d00b00437e5ce7e8fmr6869622vsa.4.1688485916396; Tue, 04 Jul
 2023 08:51:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230703202910.31142-1-jacopo.mondi@ideasonboard.com>
 <20230703202910.31142-2-jacopo.mondi@ideasonboard.com> <CAPY8ntAqOtabsfju53cmcZoogL67N=a2YYy_-yG8j7D87yKZKw@mail.gmail.com>
 <bnk6t3td26dlrik54gw4jf33anajvfpgah4qut6nn4bstxd6zu@b2ajma7t4hf5>
 <CAPY8ntAx5VXQD_NTpSq9D3B-MOSY21P=hA0p5ktkuJK3Ah1VbQ@mail.gmail.com> <20230704145616.GA7503@pendragon.ideasonboard.com>
In-Reply-To: <20230704145616.GA7503@pendragon.ideasonboard.com>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Tue, 4 Jul 2023 16:51:40 +0100
Message-ID: <CAPY8ntDto94FmXtdG8fQK05_B3frP-AzdP4zidxOUhLkyxTjTw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Documentation: v4l: Flip handling for RAW sensors
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent

On Tue, 4 Jul 2023 at 15:56, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Jul 04, 2023 at 12:03:00PM +0100, Dave Stevenson wrote:
> > On Tue, 4 Jul 2023 at 11:24, Jacopo Mondi wrote:
> > > On Tue, Jul 04, 2023 at 10:58:11AM +0100, Dave Stevenson wrote:
> > > > Hi Jacopo
> > > >
> > > > Thanks for adding documentation.
> > > > Sorry I couldn't be at your presentation, but I'll find the slides
> > > > (and recording if there is one).
> > >
> > > videos and slides should be already available for attendees. If not I
> > > can send you the slide deck, but trust me, there is nothing new for
> > > you there.
> > >
> > > > On Mon, 3 Jul 2023 at 21:29, Jacopo Mondi wrote:
> > > > >
> > > > > Document the requirement of notifying to userspace the possible
> > > > > re-ordering of the color sample components when a vertical or hor=
izontal
> > > > > flip is applied to a RAW camera sensor.
> > > > >
> > > > > Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > > > > ---
> > > > >  Documentation/driver-api/media/camera-sensor.rst | 16 ++++++++++=
++++++
> > > > >  1 file changed, 16 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/driver-api/media/camera-sensor.rst b/D=
ocumentation/driver-api/media/camera-sensor.rst
> > > > > index 93f4f2536c25..ee4a7fe5f72a 100644
> > > > > --- a/Documentation/driver-api/media/camera-sensor.rst
> > > > > +++ b/Documentation/driver-api/media/camera-sensor.rst
> > > > > @@ -173,3 +173,19 @@ V4L2_CID_VFLIP controls with the values prog=
rammed by the register sequences.
> > > > >  The default values of these controls shall be 0 (disabled). Espe=
cially these
> > > > >  controls shall not be inverted, independently of the sensor's mo=
unting
> > > > >  rotation.
> > > > > +
> > > > > +Flip handling for raw camera sensors
> > > > > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > >
> > > > Possibly "for colour raw camera sensors".
> > > > Mono sensors are still raw in that they need processing for black
> > > > level, lens shading, etc, but they won't change the colour ordering=
.
> > >
> > > Thanks, good point
> > >
> > > > > +
> > > > > +Applying vertical and horizontal flips on raw camera sensors inv=
erts the color
> > > > > +sample reading direction on the sensor's pixel array. This cause=
s the
> > > > > +re-ordering of the color samples on the sensor's output frame.
> > > >
> > > > This *may* cause the re-ordering....
> > > >
> > > > Not all sensors do. Some shift the readout by one line/column to ke=
ep
> > > > the Bayer order the same, and technically should update the selecti=
on.
> > > > OnSemi sensors in particular seem to do this, as do the Sony
> > > > IMX327/290/462 family.
> > >
> > > Is it the driver doing the shift or is it the sensor automatically
> > > adjusting ?
> >
> > The sensor does it.
>
> Both cases exist, some drivers do the adjustments internally. That's not
> something I would recommend, but it was implemented to allow changing
> the flip controls during streaming as we lacked (and still lack) a
> solution to this problem.

I'll believe you, but had never noticed it in a mainline driver.

> There are also sensors that make this behaviour configurable, with a
> register bit to indicate if the crop rectangle should be adjusted
> automatically.
>
> While moving the crop rectangle by one pixel in a large resolution
> sensor could seem difficult to notice, it can have very noticeable
> effects. For instance, defective pixel correction that operates on a
> list of known bad pixels will require adjustement.
>
> > For IMX290, the array is defined horizontally as:
> > 4 ignored pixels
> > 8 pixels margin for colour processing
> > 1920 recording pixel area
> > 9 pixels margin for colour processing
> > 4 ignored pixels
> > (3 dummy pixels)
>
> Do you know what those dummy pixels are, and how they differ from the
> ignored pixels that are not supposed to be read out either ?

Going off topic for this documentation thread, but c'est la vie.

I'm assuming you have a datasheet for IMX290 or 327 as you've
previously worked on the driver.

"Drive Timing Chart for Full HD 1080p mode (CSI-2 serial output)" on
(for me) page 62 says that there are1948 pixels are being produced per
line - 4 side ignored area, 8 margin for colour processing, 1920
active, 9 margin for colour processing, 4 side ignored area, and 3
dummy. The dummy ones are not numbered, so presumably aren't actually
read from the pixel array.
Vertically it says you're getting lines 3-12 (optical black), and then
13-1109 (8 + 1080 + 9) as active lines.

The Drive Timing Chart for the 720p mode (page 76) says that it's
sending pixels 321 to 1625 (inclusive) per line as 4 ignored, 8
margin, 1280 active, 9 margin, 4 ignored, and then 3 dummy area
samples (again not numbered).
Vertically it says you're getting lines 3-6 (optical black), and then
197-925 as active lines.

Looking again at that diagram, it lists out exactly which pixels/lines
are sent in normal and inverted modes, so the shift-by-1 is explicitly
stated. The OB lines always stay at the top of the image.
OB data appears to be sent with data type 0x37, so at least for Unicam
it won't end up in the image buffer.

Further comparison between the datasheet and driver show that for
1080p the datasheet intends X_OUT_SIZE =3D 0x79c (1948) and Y_OUT_SIZE =3D
0x449 (1097), and for the 720p mode 0x51c (1308) x 0x2d9 (729). The
driver is setting those to 1920x1080 and 1280x720 respectively,
therefore the output FOV may well not be that which is expected. I
seem to recall making a comment along those lines when I upstreamed
the last load of patches for imx290, but have never had the time to
fully investigate.

  Dave

> > Ignoring the dummy ones, that gives a width of 1945 pixels.
> >
> > Vertically is similar with 1109 pixels total (9 colour margin / 1080
> > active / 8 colour margin).
> >
> > That means it is a red pixel in all 4 corners of the full 1945x1109
> > array, and it keeps the 8 pixels margin on the left of the image read
> > out in all circumstances, and 8 at the top too so that readout always
> > follows that.
> > It's slightly weird as a sensor in that it has presets for 1080p and
> > 720p, as well as a windowed mode where you can arbitrarily crop from
> > the whole array. The driver only uses the two presets, so exactly what
> > is going on is partly reverse engineering.
> >
> > With regard OnSemi, we asked them about it several years ago, and the
> > response was that there was no way to change that behaviour for the
> > sensor we were looking at.
> > From that datasheet:
> > "While the sensor=E2=80=99s format is W =C3=97 H, the additional active=
 columns and
> > active rows are included for use when horizontal or vertical mirrored
> > readout is enabled, to allow readout to start on the same pixel. The
> > pixel adjustment is always performed for monochrome or color versions"
> > Definition of the VERT_FLIP bit
> > "1: Readout is flipped (mirrored) vertically so that the row specified
> > by y_addr_end_ (+1) is read out of the sensor first"
> > and HORIZ_MIRROR bit
> > "1: Readout is mirrored horizontally so that the column specified by
> > x_addr_end_ (+1) is read out of the sensor first."
> >
> > Having just checked a different OnSemi datasheet, that doesn't state
> > that it alters the pixel read out first when flipped. It possibly
> > depends on the target market for the sensor, and how configurable they
> > anticipate the ISPs to be.
> >
> > > > > As an example, a
> > > > > +raw camera sensor with a Bayer pattern color filter array and a =
native RGGB
> > > > > +Bayer order will produce frames with GRBG component ordering whe=
n a vertical
> > > > > +flip is applied.
> > > >
> > > > Vertical flip of RGGB would be GBRG as the RG and GB get swapped, n=
ot
> > > > GRBG (which would be horizontal flip).
> > >
> > > I clearly mean horizontal sorry. I'll fix.
> > >
> > > > > Camera sensor drivers where inverting the reading order
> > > > > +direction causes a re-ordering of the color components are reque=
sted to register
> > > > > +the ``V4L2_CID_VFLIP`` and ``V4L2_CID_HFLIP`` controls with the
> > > > > +``V4L2_CTRL_FLAG_MODIFY_LAYOUT`` flag enabled to notify userspac=
e that enabling
> > > > > +a flip can potentially change the output buffer content layout. =
Flips should
> > > > > +also be taken into account when enumerating and handling media b=
us formats
> > > > > +on the camera sensor source pads.
>
> --
> Regards,
>
> Laurent Pinchart
