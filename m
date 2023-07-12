Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC2F075030A
	for <lists+linux-media@lfdr.de>; Wed, 12 Jul 2023 11:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbjGLJ1b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jul 2023 05:27:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232772AbjGLJ1a (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jul 2023 05:27:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB8EAFB
        for <linux-media@vger.kernel.org>; Wed, 12 Jul 2023 02:27:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AA0557E;
        Wed, 12 Jul 2023 11:26:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1689153997;
        bh=VQBawMs5v5Cuzb4i/VMoUE9m4V0htg8NIpT63e9XsZs=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=dQDcmI8XDRM7X+/DXAjS4ANroUKQ3Ye0CeHrQAq9YIegkTeeAvC8mB/fsukJdf5y4
         mmlMjFIpLkSOGjw50Nd1iGbnfBPoFWVmag7dw9GjfVukMNiBHVb1WfZa7f6y/8XRrY
         PyoYk3NjzKvmjQYTE+usR+qfQjBTIxz7JC6qXUoI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAJ+vNU111GKHpu4pkTUpgXCxV2iOQ-kQ4OL7mHgBRJ+3SX18PA@mail.gmail.com>
References: <CAJ+vNU1xHpuFZjG5ySAkg9aPxxMsp581aA+bZzHqhp8c=QGpFg@mail.gmail.com> <CAHCN7xKy8gNz5V+9rdh-GhdYbEAsWpRbhNK-HD-C9D=BSO14+w@mail.gmail.com> <CAJ+vNU3gpU6ESBpn1n8+0KxRDOJGXQmZohkQ-iCULr6CVQKu4g@mail.gmail.com> <CAHCN7xJmSDsxUdazrKM8Qqk+tVRTW951hHL_cUgj-1YWEho4RA@mail.gmail.com> <CAJ+vNU1G0Z-4B9-42fgPFcO+ByA_s3Okpw-8ggcJP3a9+_j1-A@mail.gmail.com> <168911579461.688351.285047948246635641@Monstersaurus> <CAJ+vNU111GKHpu4pkTUpgXCxV2iOQ-kQ4OL7mHgBRJ+3SX18PA@mail.gmail.com>
Subject: Re: imx8mp mipi csi camera overlay: Unable to retrieve endpoint for port@1
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Adam Ford <aford173@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Schrempf Frieder <frieder.schrempf@kontron.de>
To:     Tim Harvey <tharvey@gateworks.com>
Date:   Wed, 12 Jul 2023 10:27:23 +0100
Message-ID: <168915404389.540247.12034155743376705581@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Tim Harvey (2023-07-12 00:45:10)
> On Tue, Jul 11, 2023 at 3:49=E2=80=AFPM Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
> >
> > Hi Tim,
> >

<snip>

> > >
> > > Hi Adam,
> > >
> > > Thanks, this helped point me in the right direction and proves the
> > > video capture device works with v4l2.
> > >
> > > For the imx219 which can capture 640x480 raw 8bit bayer:
> > > # configure media entities for 8-bit raw bayer 640x480
> > > media-ctl -v -V "'imx219 3-0010':0 [fmt:SRGGB8/640x480 field:none]"
> > > media-ctl -v -V "'crossbar':0 [fmt:SRGGB8/640x480 field:none]"
> > > media-ctl -v -V "'mxc_isi.0':0 [fmt:SRGGB8/640x480 field:none]"
> > > # configure for RGGB (8-bit bayer) 640x480
> > > v4l2-ctl --device /dev/video0
> > > --set-fmt-video=3Dwidth=3D640,height=3D480,pixelformat=3DRGGB --verbo=
se
> > > # capture a frame
> > > v4l2-ctl --device /dev/video0 --stream-mmap --stream-to=3Dframe.raw
> > > --stream-count=3D1
> > > convert -size 640x480 -depth 8 gray:frame.raw frame.png # convert to =
png
> > > # stream to display
> > > gst-launch-1.0 v4l2src ! \
> > >       video/x-bayer,format=3Drggb,width=3D640,height=3D480,framerate=
=3D10/1 ! \
> > >       bayer2rgb ! fbdevsink
> > >
> >
> > I would expect if that's all working then libcamera with the ISI
> > pipeline handler would be able to handle all of the media-ctl
> > configuration for you.
> >
> > You should be able to use this directly (without needing calls to media=
-ctl):
> >
> > gst-launch-1.0 libcamerasrc ! \
> >         video/x-bayer,format=3Drggb,width=3D640,height=3D480 ! \
> >         bayer2rgb ! fbdevsink
> >
> > in the same way.
> >
> > If it does work, I'd be interested to hear that, and if it doesn't -
> > then lets fix it!
> >
> > Note I removed the framerate=3D10/1 as that's the part I would suspect
> > might cause issues in the libcamerasrc. It's likely worth trying both
> > with and without it.
>=20
> Hi Kieran,
>=20
> I've never looked into libcamera before but I love the idea of not
> needing to deal with media-ctl pipelines. I don't see a libcamerasrc

Indeed, that's one of the key points of libcamera - to handle all this
complexity of routing, configuration, and format propogation for every
platform on behalf of each application. (As well as manage any connected
ISP).

There's a few out of tree patches I believe, but it doesn't take much to
get libcamera running the ISP on the i.MX8MP as well so then you can
have hardware accelerated debayering and image processing too.


> in gstreamer 1.20.3 which I'm using. A quick look at the libcamera
> docs [1] seems to indicate building from source isn't necessary when
> libcamera is installed but I've installed libcamera-tools/libcamera0
> and there is still no libcamerasrc shown in gstreamer?

libcamerasrc is currently built as part of the libcamera project, not
gstreamer. I don't know what package libcamera-tools/libcamera0 refers
to - but look to see if your distribution package the gstreamer
component of libcamera separately. Once that's installed it should be
available.

Feel free to find us in the IRC/Matrix channels too if you get stuck for
a realtime support channel to get things running.

--
Kieran


>=20
> best regards,
>=20
> Tim
> [1] https://libcamera.org/getting-started.html
