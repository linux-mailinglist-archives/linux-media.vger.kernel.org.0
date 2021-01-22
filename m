Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8BD6300990
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 18:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728967AbhAVQzF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 11:55:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:36588 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729682AbhAVQYm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 11:24:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9E26223A9A;
        Fri, 22 Jan 2021 16:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611332639;
        bh=2whAAbr75qsEPJ/cPgDjSo+A30+9EG9cLI3t+j6B5G0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=W+Ho9qeo17r7953ARIL1AFkTtfiVvk+WIQk2Sls0IJo4tzmJ89KCbNj7+dnvaeDsS
         6dkradfMyXmCYN4C0yjbYWep2eA6rvuuAADP6+xLeGbvJU3UKRdoSVVnr9RiGF3kc1
         5914KEhfO4TM9Bw5Bq5tdm03nMUS5bBxkUqfrUqA78aOMR3op4Cu1k4beRsZ8oQNiA
         8GVeeEAqXkfs14tCmDL4zKmuxoy6x7fLyr3BkYVn+13VdzeBjiHn3zj1EKjukXZd2w
         CnxvK3enhwoc3tznRTmUhl2fSorZgogFE3wzkCLFOaNJA+KC/MhWDMSzxYrpUWwgkt
         LOfQjY+WF7k1w==
Received: by mail-ed1-f42.google.com with SMTP id f1so7171449edr.12;
        Fri, 22 Jan 2021 08:23:58 -0800 (PST)
X-Gm-Message-State: AOAM530xVXADY+onrN2EPI0Ofs+rthBLzLTNlTlDZ6qAOvYM4yOkf6j7
        hBTvux6dAyCpIYxr5VVcxTD0OhtqMf6xClHSMg==
X-Google-Smtp-Source: ABdhPJwTXZ1VLb3HvkLYp6UQ+/xgv9E98/JlnIhmf+M4kIDYhORdSM9nzzwCwFPNQ+5OlQTjK27opgD6pHFUDl/zU+0=
X-Received: by 2002:a05:6402:1b11:: with SMTP id by17mr3708096edb.373.1611332636280;
 Fri, 22 Jan 2021 08:23:56 -0800 (PST)
MIME-Version: 1.0
References: <20210104165808.2166686-1-robh@kernel.org> <20210104165808.2166686-2-robh@kernel.org>
In-Reply-To: <20210104165808.2166686-2-robh@kernel.org>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 22 Jan 2021 10:23:44 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+dpVvA0iOMzaPf50Decc1hj7zH0eq-RyuVkdzp729vEQ@mail.gmail.com>
Message-ID: <CAL_Jsq+dpVvA0iOMzaPf50Decc1hj7zH0eq-RyuVkdzp729vEQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] media: dt-bindings: Convert video-interfaces.txt
 properties to schemas
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jan 4, 2021 at 10:58 AM Rob Herring <robh@kernel.org> wrote:
>
> Convert video-interfaces.txt to DT schema. As it contains a mixture of
> device level and endpoint properties, split it up into 2 schemas.

Ping!

Can this please be applied to the media tree so I can tell folks to
use it in reviews of media bindings.

> Binding schemas will need to reference both the graph.yaml and
> video-interfaces.yaml schemas. The exact schema depends on how many
> ports and endpoints for the binding. A single port with a single
> endpoint looks similar to this:
>
>   port:
>     $ref: /schemas/graph.yaml#/$defs/port-base
>
>     properties:
>       endpoint:
>         $ref: video-interfaces.yaml#
>         unevaluatedProperties: false
>
>         properties:
>           bus-width:
>             enum: [ 8, 10, 12, 16 ]
>
>           pclk-sample: true
>           hsync-active: true
>           vsync-active: true
>
>         required:
>           - bus-width
>
>     additionalProperties: false
>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Jacopo Mondi <jacopo@jmondi.org>
> Acked-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>
> v4:
> - drop graph.txt ref
> - s/Bt.656/BT.656/
> - Replace Guennadi with Laurent as maintainer
>
> v3:
> - Support up to 9 physical lanes
> - Set lane-polarities array bounds
> ---
>  .../media/video-interface-devices.yaml        | 406 +++++++++++
>  .../bindings/media/video-interfaces.txt       | 640 +-----------------
>  .../bindings/media/video-interfaces.yaml      | 344 ++++++++++
>  3 files changed, 751 insertions(+), 639 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/media/video-interfa=
ce-devices.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/video-interfa=
ces.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/video-interface-devi=
ces.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.=
yaml
> new file mode 100644
> index 000000000000..4527f56a5a6e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/video-interface-devices.yam=
l
> @@ -0,0 +1,406 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/video-interface-devices.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common bindings for video receiver and transmitter devices
> +
> +maintainers:
> +  - Jacopo Mondi <jacopo@jmondi.org>
> +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> +
> +properties:
> +  flash-leds:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      An array of phandles, each referring to a flash LED, a sub-node of=
 the LED
> +      driver device node.
> +
> +  lens-focus:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to the node of the focus lens controller.
> +
> +  rotation:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 90, 180, 270 ]
> +    description: |
> +      The camera rotation is expressed as the angular difference in degr=
ees
> +      between two reference systems, one relative to the camera module, =
and one
> +      defined on the external world scene to be captured when projected =
on the
> +      image sensor pixel array.
> +
> +      A camera sensor has a 2-dimensional reference system 'Rc' defined =
by its
> +      pixel array read-out order. The origin is set to the first pixel b=
eing
> +      read out, the X-axis points along the column read-out direction to=
wards
> +      the last columns, and the Y-axis along the row read-out direction =
towards
> +      the last row.
> +
> +      A typical example for a sensor with a 2592x1944 pixel array matrix
> +      observed from the front is:
> +
> +              2591       X-axis          0
> +                <------------------------+ 0
> +                .......... ... ..........!
> +                .......... ... ..........! Y-axis
> +                           ...           !
> +                .......... ... ..........!
> +                .......... ... ..........! 1943
> +                                         V
> +
> +      The external world scene reference system 'Rs' is a 2-dimensional
> +      reference system on the focal plane of the camera module. The orig=
in is
> +      placed on the top-left corner of the visible scene, the X-axis poi=
nts
> +      towards the right, and the Y-axis points towards the bottom of the=
 scene.
> +      The top, bottom, left and right directions are intentionally not d=
efined
> +      and depend on the environment in which the camera is used.
> +
> +      A typical example of a (very common) picture of a shark swimming f=
rom left
> +      to right, as seen from the camera, is:
> +
> +               0               X-axis
> +             0 +------------------------------------->
> +               !
> +               !
> +               !
> +               !           |\____)\___
> +               !           ) _____  __`<
> +               !           |/     )/
> +               !
> +               !
> +               !
> +               V
> +             Y-axis
> +
> +      with the reference system 'Rs' placed on the camera focal plane:
> +
> +                                  =C2=B8.=C2=B7=CB=99!
> +                              =C2=B8.=C2=B7=CB=99    !
> +                  _       =C2=B8.=C2=B7=CB=99        !
> +               +-/ \-+=C2=B8.=C2=B7=CB=99            !
> +               | (o) |                ! Camera focal plane
> +               +-----+=CB=99=C2=B7.=C2=B8            !
> +                          =CB=99=C2=B7.=C2=B8        !
> +                              =CB=99=C2=B7.=C2=B8    !
> +                                  =CB=99=C2=B7.=C2=B8!
> +
> +      When projected on the sensor's pixel array, the image and the asso=
ciated
> +      reference system 'Rs' are typically (but not always) inverted, due=
 to the
> +      camera module's lens optical inversion effect.
> +
> +      Assuming the above represented scene of the swimming shark, the le=
ns
> +      inversion projects the scene and its reference system onto the sen=
sor
> +      pixel array, seen from the front of the camera sensor, as follows:
> +
> +            Y-axis
> +               ^
> +               !
> +               !
> +               !
> +               !            |\_____)\__
> +               !            ) ____  ___.<
> +               !            |/    )/
> +               !
> +               !
> +               !
> +             0 +------------------------------------->
> +               0               X-axis
> +
> +      Note the shark being upside-down.
> +
> +      The resulting projected reference system is named 'Rp'.
> +
> +      The camera rotation property is then defined as the angular differ=
ence in
> +      the counter-clockwise direction between the camera reference syste=
m 'Rc'
> +      and the projected scene reference system 'Rp'. It is expressed in =
degrees
> +      as a number in the range [0, 360[.
> +
> +      Examples
> +
> +      0 degrees camera rotation:
> +
> +
> +                    Y-Rp
> +                     ^
> +              Y-Rc   !
> +               ^     !
> +               !     !
> +               !     !
> +               !     !
> +               !     !
> +               !     !
> +               !     !
> +               !     !
> +               !   0 +------------------------------------->
> +               !     0               X-Rp
> +             0 +------------------------------------->
> +               0               X-Rc
> +
> +
> +                                X-Rc                0
> +               <------------------------------------+ 0
> +                           X-Rp                 0   !
> +           <------------------------------------+ 0 !
> +                                                !   !
> +                                                !   !
> +                                                !   !
> +                                                !   !
> +                                                !   !
> +                                                !   !
> +                                                !   !
> +                                                !   V
> +                                                !  Y-Rc
> +                                                V
> +                                               Y-Rp
> +
> +      90 degrees camera rotation:
> +
> +               0        Y-Rc
> +             0 +-------------------->
> +               !   Y-Rp
> +               !    ^
> +               !    !
> +               !    !
> +               !    !
> +               !    !
> +               !    !
> +               !    !
> +               !    !
> +               !    !
> +               !    !
> +               !  0 +------------------------------------->
> +               !    0              X-Rp
> +               !
> +               !
> +               !
> +               !
> +               V
> +              X-Rc
> +
> +      180 degrees camera rotation:
> +
> +                                            0
> +       <------------------------------------+ 0
> +                        X-Rc                !
> +              Y-Rp                          !
> +               ^                            !
> +               !                            !
> +               !                            !
> +               !                            !
> +               !                            !
> +               !                            !
> +               !                            !
> +               !                            V
> +               !                           Y-Rc
> +             0 +------------------------------------->
> +               0              X-Rp
> +
> +      270 degrees camera rotation:
> +
> +               0        Y-Rc
> +             0 +-------------------->
> +               !                                        0
> +               !    <-----------------------------------+ 0
> +               !                    X-Rp                !
> +               !                                        !
> +               !                                        !
> +               !                                        !
> +               !                                        !
> +               !                                        !
> +               !                                        !
> +               !                                        !
> +               !                                        !
> +               !                                        V
> +               !                                       Y-Rp
> +               !
> +               !
> +               !
> +               !
> +               V
> +              X-Rc
> +
> +
> +      Example one - Webcam
> +
> +      A camera module installed on the user facing part of a laptop scre=
en
> +      casing used for video calls. The captured images are meant to be d=
isplayed
> +      in landscape mode (width > height) on the laptop screen.
> +
> +      The camera is typically mounted upside-down to compensate the lens=
 optical
> +      inversion effect:
> +
> +                    Y-Rp
> +              Y-Rc   ^
> +               ^     !
> +               !     !
> +               !     !       |\_____)\__
> +               !     !       ) ____  ___.<
> +               !     !       |/    )/
> +               !     !
> +               !     !
> +               !     !
> +               !   0 +------------------------------------->
> +               !     0           X-Rp
> +             0 +------------------------------------->
> +               0            X-Rc
> +
> +      The two reference systems are aligned, the resulting camera rotati=
on is
> +      0 degrees, no rotation correction needs to be applied to the resul=
ting
> +      image once captured to memory buffers to correctly display it to u=
sers:
> +
> +               +--------------------------------------+
> +               !                                      !
> +               !                                      !
> +               !                                      !
> +               !             |\____)\___              !
> +               !             ) _____  __`<            !
> +               !             |/     )/                !
> +               !                                      !
> +               !                                      !
> +               !                                      !
> +               +--------------------------------------+
> +
> +      If the camera sensor is not mounted upside-down to compensate for =
the lens
> +      optical inversion, the two reference systems will not be aligned, =
with
> +      'Rp' being rotated 180 degrees relatively to 'Rc':
> +
> +
> +                        X-Rc                0
> +       <------------------------------------+ 0
> +                                            !
> +              Y-Rp                          !
> +               ^                            !
> +               !                            !
> +               !       |\_____)\__          !
> +               !       ) ____  ___.<        !
> +               !       |/    )/             !
> +               !                            !
> +               !                            !
> +               !                            V
> +               !                           Y-Rc
> +             0 +------------------------------------->
> +               0            X-Rp
> +
> +      The image once captured to memory will then be rotated by 180 degr=
ees:
> +
> +               +--------------------------------------+
> +               !                                      !
> +               !                                      !
> +               !                                      !
> +               !              __/(_____/|             !
> +               !            >.___  ____ (             !
> +               !                 \(    \|             !
> +               !                                      !
> +               !                                      !
> +               !                                      !
> +               +--------------------------------------+
> +
> +      A software rotation correction of 180 degrees should be applied to
> +      correctly display the image:
> +
> +               +--------------------------------------+
> +               !                                      !
> +               !                                      !
> +               !                                      !
> +               !             |\____)\___              !
> +               !             ) _____  __`<            !
> +               !             |/     )/                !
> +               !                                      !
> +               !                                      !
> +               !                                      !
> +               +--------------------------------------+
> +
> +      Example two - Phone camera
> +
> +      A camera installed on the back side of a mobile device facing away=
 from
> +      the user. The captured images are meant to be displayed in portrai=
t mode
> +      (height > width) to match the device screen orientation and the de=
vice
> +      usage orientation used when taking the picture.
> +
> +      The camera sensor is typically mounted with its pixel array longer=
 side
> +      aligned to the device longer side, upside-down mounted to compensa=
te for
> +      the lens optical inversion effect:
> +
> +               0        Y-Rc
> +             0 +-------------------->
> +               !   Y-Rp
> +               !    ^
> +               !    !
> +               !    !
> +               !    !
> +               !    !            |\_____)\__
> +               !    !            ) ____  ___.<
> +               !    !            |/    )/
> +               !    !
> +               !    !
> +               !    !
> +               !  0 +------------------------------------->
> +               !    0                X-Rp
> +               !
> +               !
> +               !
> +               !
> +               V
> +              X-Rc
> +
> +      The two reference systems are not aligned and the 'Rp' reference s=
ystem is
> +      rotated by 90 degrees in the counter-clockwise direction relativel=
y to the
> +      'Rc' reference system.
> +
> +      The image once captured to memory will be rotated:
> +
> +               +-------------------------------------+
> +               |                 _ _                 |
> +               |                \   /                |
> +               |                 | |                 |
> +               |                 | |                 |
> +               |                 |  >                |
> +               |                <  |                 |
> +               |                 | |                 |
> +               |                   .                 |
> +               |                  V                  |
> +               +-------------------------------------+
> +
> +      A correction of 90 degrees in counter-clockwise direction has to b=
e
> +      applied to correctly display the image in portrait mode on the dev=
ice
> +      screen:
> +
> +                        +--------------------+
> +                        |                    |
> +                        |                    |
> +                        |                    |
> +                        |                    |
> +                        |                    |
> +                        |                    |
> +                        |   |\____)\___      |
> +                        |   ) _____  __`<    |
> +                        |   |/     )/        |
> +                        |                    |
> +                        |                    |
> +                        |                    |
> +                        |                    |
> +                        |                    |
> +                        +--------------------+
> +
> +  orientation:
> +    description:
> +      The orientation of a device (typically an image sensor or a flash =
LED)
> +      describing its mounting position relative to the usage orientation=
 of the
> +      system where the device is installed on.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +        # Front. The device is mounted on the front facing side of the s=
ystem. For
> +        # mobile devices such as smartphones, tablets and laptops the fr=
ont side
> +        # is the user facing side.
> +      - 0
> +        # Back. The device is mounted on the back side of the system, wh=
ich is
> +        # defined as the opposite side of the front facing one.
> +      - 1
> +        # External. The device is not attached directly to the system bu=
t is
> +        # attached in a way that allows it to move freely.
> +      - 2
> +
> +additionalProperties: true
> +
> +...
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt=
 b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index 3920f25a9123..8fcf5f52bf5b 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -1,639 +1 @@
> -Common bindings for video receiver and transmitter interfaces
> -
> -General concept
> ----------------
> -
> -Video data pipelines usually consist of external devices, e.g. camera se=
nsors,
> -controlled over an I2C, SPI or UART bus, and SoC internal IP blocks, inc=
luding
> -video DMA engines and video data processors.
> -
> -SoC internal blocks are described by DT nodes, placed similarly to other=
 SoC
> -blocks.  External devices are represented as child nodes of their respec=
tive
> -bus controller nodes, e.g. I2C.
> -
> -Data interfaces on all video devices are described by their child 'port'=
 nodes.
> -Configuration of a port depends on other devices participating in the da=
ta
> -transfer and is described by 'endpoint' subnodes.
> -
> -device {
> -       ...
> -       ports {
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
> -
> -               port@0 {
> -                       ...
> -                       endpoint@0 { ... };
> -                       endpoint@1 { ... };
> -               };
> -               port@1 { ... };
> -       };
> -};
> -
> -If a port can be configured to work with more than one remote device on =
the same
> -bus, an 'endpoint' child node must be provided for each of them.  If mor=
e than
> -one port is present in a device node or there is more than one endpoint =
at a
> -port, or port node needs to be associated with a selected hardware inter=
face,
> -a common scheme using '#address-cells', '#size-cells' and 'reg' properti=
es is
> -used.
> -
> -All 'port' nodes can be grouped under optional 'ports' node, which allow=
s to
> -specify #address-cells, #size-cells properties independently for the 'po=
rt'
> -and 'endpoint' nodes and any child device nodes a device might have.
> -
> -Two 'endpoint' nodes are linked with each other through their 'remote-en=
dpoint'
> -phandles.  An endpoint subnode of a device contains all properties neede=
d for
> -configuration of this device for data exchange with other device.  In mo=
st
> -cases properties at the peer 'endpoint' nodes will be identical, however=
 they
> -might need to be different when there is any signal modifications on the=
 bus
> -between two devices, e.g. there are logic signal inverters on the lines.
> -
> -It is allowed for multiple endpoints at a port to be active simultaneous=
ly,
> -where supported by a device.  For example, in case where a data interfac=
e of
> -a device is partitioned into multiple data busses, e.g. 16-bit input por=
t
> -divided into two separate ITU-R BT.656 8-bit busses.  In such case bus-w=
idth
> -and data-shift properties can be used to assign physical data lines to e=
ach
> -endpoint node (logical bus).
> -
> -Documenting bindings for devices
> ---------------------------------
> -
> -All required and optional bindings the device supports shall be explicit=
ly
> -documented in device DT binding documentation. This also includes port a=
nd
> -endpoint nodes for the device, including unit-addresses and reg properti=
es where
> -relevant.
> -
> -Please also see Documentation/devicetree/bindings/graph.txt .
> -
> -Required properties
> --------------------
> -
> -If there is more than one 'port' or more than one 'endpoint' node or 're=
g'
> -property is present in port and/or endpoint nodes the following properti=
es
> -are required in a relevant parent node:
> -
> - - #address-cells : number of cells required to define port/endpoint
> -                   identifier, should be 1.
> - - #size-cells    : should be zero.
> -
> -
> -Optional properties
> --------------------
> -
> -- flash-leds: An array of phandles, each referring to a flash LED, a sub=
-node
> -  of the LED driver device node.
> -
> -- lens-focus: A phandle to the node of the focus lens controller.
> -
> -- rotation: The camera rotation is expressed as the angular difference i=
n
> -  degrees between two reference systems, one relative to the camera modu=
le, and
> -  one defined on the external world scene to be captured when projected =
on the
> -  image sensor pixel array.
> -
> -  A camera sensor has a 2-dimensional reference system 'Rc' defined by
> -  its pixel array read-out order. The origin is set to the first pixel
> -  being read out, the X-axis points along the column read-out direction
> -  towards the last columns, and the Y-axis along the row read-out
> -  direction towards the last row.
> -
> -  A typical example for a sensor with a 2592x1944 pixel array matrix
> -  observed from the front is:
> -
> -              2591       X-axis          0
> -                <------------------------+ 0
> -                .......... ... ..........!
> -                .......... ... ..........! Y-axis
> -                           ...           !
> -                .......... ... ..........!
> -                .......... ... ..........! 1943
> -                                         V
> -
> -  The external world scene reference system 'Rs' is a 2-dimensional
> -  reference system on the focal plane of the camera module. The origin i=
s
> -  placed on the top-left corner of the visible scene, the X-axis points
> -  towards the right, and the Y-axis points towards the bottom of the
> -  scene. The top, bottom, left and right directions are intentionally no=
t
> -  defined and depend on the environment in which the camera is used.
> -
> -  A typical example of a (very common) picture of a shark swimming from
> -  left to right, as seen from the camera, is:
> -
> -               0               X-axis
> -             0 +------------------------------------->
> -               !
> -               !
> -               !
> -               !           |\____)\___
> -               !           ) _____  __`<
> -               !           |/     )/
> -               !
> -               !
> -               !
> -               V
> -             Y-axis
> -
> -  with the reference system 'Rs' placed on the camera focal plane:
> -
> -                                  =C2=B8.=C2=B7=CB=99!
> -                              =C2=B8.=C2=B7=CB=99    !
> -                  _       =C2=B8.=C2=B7=CB=99        !
> -               +-/ \-+=C2=B8.=C2=B7=CB=99            !
> -               | (o) |                ! Camera focal plane
> -               +-----+=CB=99=C2=B7.=C2=B8            !
> -                          =CB=99=C2=B7.=C2=B8        !
> -                              =CB=99=C2=B7.=C2=B8    !
> -                                  =CB=99=C2=B7.=C2=B8!
> -
> -  When projected on the sensor's pixel array, the image and the associat=
ed
> -  reference system 'Rs' are typically (but not always) inverted, due to
> -  the camera module's lens optical inversion effect.
> -
> -  Assuming the above represented scene of the swimming shark, the lens
> -  inversion projects the scene and its reference system onto the sensor
> -  pixel array, seen from the front of the camera sensor, as follows:
> -
> -            Y-axis
> -               ^
> -               !
> -               !
> -               !
> -               !            |\_____)\__
> -               !            ) ____  ___.<
> -               !            |/    )/
> -               !
> -               !
> -               !
> -             0 +------------------------------------->
> -               0               X-axis
> -
> -  Note the shark being upside-down.
> -
> -  The resulting projected reference system is named 'Rp'.
> -
> -  The camera rotation property is then defined as the angular difference
> -  in the counter-clockwise direction between the camera reference system
> -  'Rc' and the projected scene reference system 'Rp'. It is expressed in
> -  degrees as a number in the range [0, 360[.
> -
> -  Examples
> -
> -  0 degrees camera rotation:
> -
> -
> -                    Y-Rp
> -                     ^
> -              Y-Rc   !
> -               ^     !
> -               !     !
> -               !     !
> -               !     !
> -               !     !
> -               !     !
> -               !     !
> -               !     !
> -               !   0 +------------------------------------->
> -               !     0               X-Rp
> -             0 +------------------------------------->
> -               0               X-Rc
> -
> -
> -                                X-Rc                0
> -               <------------------------------------+ 0
> -                           X-Rp                 0   !
> -           <------------------------------------+ 0 !
> -                                                !   !
> -                                                !   !
> -                                                !   !
> -                                                !   !
> -                                                !   !
> -                                                !   !
> -                                                !   !
> -                                                !   V
> -                                                !  Y-Rc
> -                                                V
> -                                               Y-Rp
> -
> -  90 degrees camera rotation:
> -
> -               0        Y-Rc
> -             0 +-------------------->
> -               !   Y-Rp
> -               !    ^
> -               !    !
> -               !    !
> -               !    !
> -               !    !
> -               !    !
> -               !    !
> -               !    !
> -               !    !
> -               !    !
> -               !  0 +------------------------------------->
> -               !    0              X-Rp
> -               !
> -               !
> -               !
> -               !
> -               V
> -              X-Rc
> -
> -  180 degrees camera rotation:
> -
> -                                            0
> -       <------------------------------------+ 0
> -                        X-Rc                !
> -              Y-Rp                          !
> -               ^                            !
> -               !                            !
> -               !                            !
> -               !                            !
> -               !                            !
> -               !                            !
> -               !                            !
> -               !                            V
> -               !                           Y-Rc
> -             0 +------------------------------------->
> -               0              X-Rp
> -
> -  270 degrees camera rotation:
> -
> -               0        Y-Rc
> -             0 +-------------------->
> -               !                                        0
> -               !    <-----------------------------------+ 0
> -               !                    X-Rp                !
> -               !                                        !
> -               !                                        !
> -               !                                        !
> -               !                                        !
> -               !                                        !
> -               !                                        !
> -               !                                        !
> -               !                                        !
> -               !                                        V
> -               !                                       Y-Rp
> -               !
> -               !
> -               !
> -               !
> -               V
> -              X-Rc
> -
> -
> -  Example one - Webcam
> -
> -  A camera module installed on the user facing part of a laptop screen
> -  casing used for video calls. The captured images are meant to be
> -  displayed in landscape mode (width > height) on the laptop screen.
> -
> -  The camera is typically mounted upside-down to compensate the lens
> -  optical inversion effect:
> -
> -                    Y-Rp
> -              Y-Rc   ^
> -               ^     !
> -               !     !
> -               !     !       |\_____)\__
> -               !     !       ) ____  ___.<
> -               !     !       |/    )/
> -               !     !
> -               !     !
> -               !     !
> -               !   0 +------------------------------------->
> -               !     0           X-Rp
> -             0 +------------------------------------->
> -               0            X-Rc
> -
> -  The two reference systems are aligned, the resulting camera rotation i=
s
> -  0 degrees, no rotation correction needs to be applied to the resulting
> -  image once captured to memory buffers to correctly display it to users=
:
> -
> -               +--------------------------------------+
> -               !                                      !
> -               !                                      !
> -               !                                      !
> -               !             |\____)\___              !
> -               !             ) _____  __`<            !
> -               !             |/     )/                !
> -               !                                      !
> -               !                                      !
> -               !                                      !
> -               +--------------------------------------+
> -
> -  If the camera sensor is not mounted upside-down to compensate for the
> -  lens optical inversion, the two reference systems will not be aligned,
> -  with 'Rp' being rotated 180 degrees relatively to 'Rc':
> -
> -
> -                        X-Rc                0
> -       <------------------------------------+ 0
> -                                            !
> -              Y-Rp                          !
> -               ^                            !
> -               !                            !
> -               !       |\_____)\__          !
> -               !       ) ____  ___.<        !
> -               !       |/    )/             !
> -               !                            !
> -               !                            !
> -               !                            V
> -               !                           Y-Rc
> -             0 +------------------------------------->
> -               0            X-Rp
> -
> -  The image once captured to memory will then be rotated by 180 degrees:
> -
> -               +--------------------------------------+
> -               !                                      !
> -               !                                      !
> -               !                                      !
> -               !              __/(_____/|             !
> -               !            >.___  ____ (             !
> -               !                 \(    \|             !
> -               !                                      !
> -               !                                      !
> -               !                                      !
> -               +--------------------------------------+
> -
> -  A software rotation correction of 180 degrees should be applied to
> -  correctly display the image:
> -
> -               +--------------------------------------+
> -               !                                      !
> -               !                                      !
> -               !                                      !
> -               !             |\____)\___              !
> -               !             ) _____  __`<            !
> -               !             |/     )/                !
> -               !                                      !
> -               !                                      !
> -               !                                      !
> -               +--------------------------------------+
> -
> -  Example two - Phone camera
> -
> -  A camera installed on the back side of a mobile device facing away fro=
m
> -  the user. The captured images are meant to be displayed in portrait mo=
de
> -  (height > width) to match the device screen orientation and the device
> -  usage orientation used when taking the picture.
> -
> -  The camera sensor is typically mounted with its pixel array longer sid=
e
> -  aligned to the device longer side, upside-down mounted to compensate f=
or
> -  the lens optical inversion effect:
> -
> -               0        Y-Rc
> -             0 +-------------------->
> -               !   Y-Rp
> -               !    ^
> -               !    !
> -               !    !
> -               !    !
> -               !    !            |\_____)\__
> -               !    !            ) ____  ___.<
> -               !    !            |/    )/
> -               !    !
> -               !    !
> -               !    !
> -               !  0 +------------------------------------->
> -               !    0                X-Rp
> -               !
> -               !
> -               !
> -               !
> -               V
> -              X-Rc
> -
> -  The two reference systems are not aligned and the 'Rp' reference
> -  system is rotated by 90 degrees in the counter-clockwise direction
> -  relatively to the 'Rc' reference system.
> -
> -  The image once captured to memory will be rotated:
> -
> -               +-------------------------------------+
> -               |                 _ _                 |
> -               |                \   /                |
> -               |                 | |                 |
> -               |                 | |                 |
> -               |                 |  >                |
> -               |                <  |                 |
> -               |                 | |                 |
> -               |                   .                 |
> -               |                  V                  |
> -               +-------------------------------------+
> -
> -  A correction of 90 degrees in counter-clockwise direction has to be
> -  applied to correctly display the image in portrait mode on the device
> -  screen:
> -
> -                        +--------------------+
> -                        |                    |
> -                        |                    |
> -                        |                    |
> -                        |                    |
> -                        |                    |
> -                        |                    |
> -                        |   |\____)\___      |
> -                        |   ) _____  __`<    |
> -                        |   |/     )/        |
> -                        |                    |
> -                        |                    |
> -                        |                    |
> -                        |                    |
> -                        |                    |
> -                        +--------------------+
> -
> -- orientation: The orientation of a device (typically an image sensor or=
 a flash
> -  LED) describing its mounting position relative to the usage orientatio=
n of the
> -  system where the device is installed on.
> -  Possible values are:
> -  0 - Front. The device is mounted on the front facing side of the syste=
m.
> -  For mobile devices such as smartphones, tablets and laptops the front =
side is
> -  the user facing side.
> -  1 - Back. The device is mounted on the back side of the system, which =
is
> -  defined as the opposite side of the front facing one.
> -  2 - External. The device is not attached directly to the system but is
> -  attached in a way that allows it to move freely.
> -
> -Optional endpoint properties
> -----------------------------
> -
> -- remote-endpoint: phandle to an 'endpoint' subnode of a remote device n=
ode.
> -- slave-mode: a boolean property indicating that the link is run in slav=
e mode.
> -  The default when this property is not specified is master mode. In the=
 slave
> -  mode horizontal and vertical synchronization signals are provided to t=
he
> -  slave device (data source) by the master device (data sink). In the ma=
ster
> -  mode the data source device is also the source of the synchronization =
signals.
> -- bus-type: data bus type. Possible values are:
> -  1 - MIPI CSI-2 C-PHY
> -  2 - MIPI CSI1
> -  3 - CCP2
> -  4 - MIPI CSI-2 D-PHY
> -  5 - Parallel
> -  6 - Bt.656
> -- bus-width: number of data lines actively used, valid for the parallel =
busses.
> -- data-shift: on the parallel data busses, if bus-width is used to speci=
fy the
> -  number of data lines, data-shift can be used to specify which data lin=
es are
> -  used, e.g. "bus-width=3D<8>; data-shift=3D<2>;" means, that lines 9:2 =
are used.
> -- hsync-active: active state of the HSYNC signal, 0/1 for LOW/HIGH respe=
ctively.
> -- vsync-active: active state of the VSYNC signal, 0/1 for LOW/HIGH respe=
ctively.
> -  Note, that if HSYNC and VSYNC polarities are not specified, embedded
> -  synchronization may be required, where supported.
> -- data-active: similar to HSYNC and VSYNC, specifies data line polarity.
> -- data-enable-active: similar to HSYNC and VSYNC, specifies the data ena=
ble
> -  signal polarity.
> -- field-even-active: field signal level during the even field data trans=
mission.
> -- pclk-sample: sample data on rising (1) or falling (0) edge of the pixe=
l clock
> -  signal.
> -- sync-on-green-active: active state of Sync-on-green (SoG) signal, 0/1 =
for
> -  LOW/HIGH respectively.
> -- data-lanes: an array of physical data lane indexes. Position of an ent=
ry
> -  determines the logical lane number, while the value of an entry indica=
tes
> -  physical lane, e.g. for 2-lane MIPI CSI-2 bus we could have
> -  "data-lanes =3D <1 2>;", assuming the clock lane is on hardware lane 0=
.
> -  If the hardware does not support lane reordering, monotonically
> -  incremented values shall be used from 0 or 1 onwards, depending on
> -  whether or not there is also a clock lane. This property is valid for
> -  serial busses only (e.g. MIPI CSI-2).
> -- clock-lanes: an array of physical clock lane indexes. Position of an e=
ntry
> -  determines the logical lane number, while the value of an entry indica=
tes
> -  physical lane, e.g. for a MIPI CSI-2 bus we could have "clock-lanes =
=3D <0>;",
> -  which places the clock lane on hardware lane 0. This property is valid=
 for
> -  serial busses only (e.g. MIPI CSI-2). Note that for the MIPI CSI-2 bus=
 this
> -  array contains only one entry.
> -- clock-noncontinuous: a boolean property to allow MIPI CSI-2 non-contin=
uous
> -  clock mode.
> -- link-frequencies: Allowed data bus frequencies. For MIPI CSI-2, for
> -  instance, this is the actual frequency of the bus, not bits per clock =
per
> -  lane value. An array of 64-bit unsigned integers.
> -- lane-polarities: an array of polarities of the lanes starting from the=
 clock
> -  lane and followed by the data lanes in the same order as in data-lanes=
.
> -  Valid values are 0 (normal) and 1 (inverted). The length of the array
> -  should be the combined length of data-lanes and clock-lanes properties=
.
> -  If the lane-polarities property is omitted, the value must be interpre=
ted
> -  as 0 (normal). This property is valid for serial busses only.
> -- strobe: Whether the clock signal is used as clock (0) or strobe (1). U=
sed
> -  with CCP2, for instance.
> -
> -Example
> --------
> -
> -The example snippet below describes two data pipelines.  ov772x and imx0=
74 are
> -camera sensors with a parallel and serial (MIPI CSI-2) video bus respect=
ively.
> -Both sensors are on the I2C control bus corresponding to the i2c0 contro=
ller
> -node.  ov772x sensor is linked directly to the ceu0 video host interface=
.
> -imx074 is linked to ceu0 through the MIPI CSI-2 receiver (csi2). ceu0 ha=
s a
> -(single) DMA engine writing captured data to memory.  ceu0 node has a si=
ngle
> -'port' node which may indicate that at any time only one of the followin=
g data
> -pipelines can be active: ov772x -> ceu0 or imx074 -> csi2 -> ceu0.
> -
> -       ceu0: ceu@fe910000 {
> -               compatible =3D "renesas,sh-mobile-ceu";
> -               reg =3D <0xfe910000 0xa0>;
> -               interrupts =3D <0x880>;
> -
> -               mclk: master_clock {
> -                       compatible =3D "renesas,ceu-clock";
> -                       #clock-cells =3D <1>;
> -                       clock-frequency =3D <50000000>;   /* Max clock fr=
equency */
> -                       clock-output-names =3D "mclk";
> -               };
> -
> -               port {
> -                       #address-cells =3D <1>;
> -                       #size-cells =3D <0>;
> -
> -                       /* Parallel bus endpoint */
> -                       ceu0_1: endpoint@1 {
> -                               reg =3D <1>;              /* Local endpoi=
nt # */
> -                               remote =3D <&ov772x_1_1>; /* Remote phand=
le */
> -                               bus-width =3D <8>;        /* Used data li=
nes */
> -                               data-shift =3D <2>;       /* Lines 9:2 ar=
e used */
> -
> -                               /* If hsync-active/vsync-active are missi=
ng,
> -                                  embedded BT.656 sync is used */
> -                               hsync-active =3D <0>;     /* Active low *=
/
> -                               vsync-active =3D <0>;     /* Active low *=
/
> -                               data-active =3D <1>;      /* Active high =
*/
> -                               pclk-sample =3D <1>;      /* Rising */
> -                       };
> -
> -                       /* MIPI CSI-2 bus endpoint */
> -                       ceu0_0: endpoint@0 {
> -                               reg =3D <0>;
> -                               remote =3D <&csi2_2>;
> -                       };
> -               };
> -       };
> -
> -       i2c0: i2c@fff20000 {
> -               ...
> -               ov772x_1: camera@21 {
> -                       compatible =3D "ovti,ov772x";
> -                       reg =3D <0x21>;
> -                       vddio-supply =3D <&regulator1>;
> -                       vddcore-supply =3D <&regulator2>;
> -
> -                       clock-frequency =3D <20000000>;
> -                       clocks =3D <&mclk 0>;
> -                       clock-names =3D "xclk";
> -
> -                       port {
> -                               /* With 1 endpoint per port no need for a=
ddresses. */
> -                               ov772x_1_1: endpoint {
> -                                       bus-width =3D <8>;
> -                                       remote-endpoint =3D <&ceu0_1>;
> -                                       hsync-active =3D <1>;
> -                                       vsync-active =3D <0>; /* Who came=
 up with an
> -                                                              inverter h=
ere ?... */
> -                                       data-active =3D <1>;
> -                                       pclk-sample =3D <1>;
> -                               };
> -                       };
> -               };
> -
> -               imx074: camera@1a {
> -                       compatible =3D "sony,imx074";
> -                       reg =3D <0x1a>;
> -                       vddio-supply =3D <&regulator1>;
> -                       vddcore-supply =3D <&regulator2>;
> -
> -                       clock-frequency =3D <30000000>;   /* Shared clock=
 with ov772x_1 */
> -                       clocks =3D <&mclk 0>;
> -                       clock-names =3D "sysclk";         /* Assuming thi=
s is the
> -                                                          name in the da=
tasheet */
> -                       port {
> -                               imx074_1: endpoint {
> -                                       clock-lanes =3D <0>;
> -                                       data-lanes =3D <1 2>;
> -                                       remote-endpoint =3D <&csi2_1>;
> -                               };
> -                       };
> -               };
> -       };
> -
> -       csi2: csi2@ffc90000 {
> -               compatible =3D "renesas,sh-mobile-csi2";
> -               reg =3D <0xffc90000 0x1000>;
> -               interrupts =3D <0x17a0>;
> -               #address-cells =3D <1>;
> -               #size-cells =3D <0>;
> -
> -               port@1 {
> -                       compatible =3D "renesas,csi2c";   /* One of CSI2I=
 and CSI2C. */
> -                       reg =3D <1>;                      /* CSI-2 PHY #1=
 of 2: PHY_S,
> -                                                          PHY_M has port=
 address 0,
> -                                                          is unused. */
> -                       csi2_1: endpoint {
> -                               clock-lanes =3D <0>;
> -                               data-lanes =3D <2 1>;
> -                               remote-endpoint =3D <&imx074_1>;
> -                       };
> -               };
> -               port@2 {
> -                       reg =3D <2>;                      /* port 2: link=
 to the CEU */
> -
> -                       csi2_2: endpoint {
> -                               remote-endpoint =3D <&ceu0_0>;
> -                       };
> -               };
> -       };
> +This file has moved to video-interfaces.yaml and video-interface-devices=
.yaml.
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yam=
l b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> new file mode 100644
> index 000000000000..0a7a73fd59f2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> @@ -0,0 +1,344 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/video-interfaces.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Common bindings for video receiver and transmitter interface endp=
oints
> +
> +maintainers:
> +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> +
> +description: |
> +  Video data pipelines usually consist of external devices, e.g. camera =
sensors,
> +  controlled over an I2C, SPI or UART bus, and SoC internal IP blocks, i=
ncluding
> +  video DMA engines and video data processors.
> +
> +  SoC internal blocks are described by DT nodes, placed similarly to oth=
er SoC
> +  blocks.  External devices are represented as child nodes of their resp=
ective
> +  bus controller nodes, e.g. I2C.
> +
> +  Data interfaces on all video devices are described by their child 'por=
t' nodes.
> +  Configuration of a port depends on other devices participating in the =
data
> +  transfer and is described by 'endpoint' subnodes.
> +
> +  device {
> +      ...
> +      ports {
> +          #address-cells =3D <1>;
> +          #size-cells =3D <0>;
> +
> +          port@0 {
> +              ...
> +              endpoint@0 { ... };
> +              endpoint@1 { ... };
> +          };
> +          port@1 { ... };
> +      };
> +  };
> +
> +  If a port can be configured to work with more than one remote device o=
n the same
> +  bus, an 'endpoint' child node must be provided for each of them.  If m=
ore than
> +  one port is present in a device node or there is more than one endpoin=
t at a
> +  port, or port node needs to be associated with a selected hardware int=
erface,
> +  a common scheme using '#address-cells', '#size-cells' and 'reg' proper=
ties is
> +  used.
> +
> +  All 'port' nodes can be grouped under optional 'ports' node, which all=
ows to
> +  specify #address-cells, #size-cells properties independently for the '=
port'
> +  and 'endpoint' nodes and any child device nodes a device might have.
> +
> +  Two 'endpoint' nodes are linked with each other through their 'remote-=
endpoint'
> +  phandles.  An endpoint subnode of a device contains all properties nee=
ded for
> +  configuration of this device for data exchange with other device.  In =
most
> +  cases properties at the peer 'endpoint' nodes will be identical, howev=
er they
> +  might need to be different when there is any signal modifications on t=
he bus
> +  between two devices, e.g. there are logic signal inverters on the line=
s.
> +
> +  It is allowed for multiple endpoints at a port to be active simultaneo=
usly,
> +  where supported by a device.  For example, in case where a data interf=
ace of
> +  a device is partitioned into multiple data busses, e.g. 16-bit input p=
ort
> +  divided into two separate ITU-R BT.656 8-bit busses.  In such case bus=
-width
> +  and data-shift properties can be used to assign physical data lines to=
 each
> +  endpoint node (logical bus).
> +
> +  Documenting bindings for devices
> +  --------------------------------
> +
> +  All required and optional bindings the device supports shall be explic=
itly
> +  documented in device DT binding documentation. This also includes port=
 and
> +  endpoint nodes for the device, including unit-addresses and reg proper=
ties
> +  where relevant.
> +
> +allOf:
> +  - $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +
> +properties:
> +  slave-mode:
> +    type: boolean
> +    description:
> +      Indicates that the link is run in slave mode. The default when thi=
s
> +      property is not specified is master mode. In the slave mode horizo=
ntal and
> +      vertical synchronization signals are provided to the slave device =
(data
> +      source) by the master device (data sink). In the master mode the d=
ata
> +      source device is also the source of the synchronization signals.
> +
> +  bus-type:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 1 # MIPI CSI-2 C-PHY
> +      - 2 # MIPI CSI1
> +      - 3 # CCP2
> +      - 4 # MIPI CSI-2 D-PHY
> +      - 5 # Parallel
> +      - 6 # BT.656
> +    description:
> +      Data bus type.
> +
> +  bus-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 64
> +    description:
> +      Number of data lines actively used, valid for the parallel busses.
> +
> +  data-shift:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    maximum: 64
> +    description:
> +      On the parallel data busses, if bus-width is used to specify the n=
umber of
> +      data lines, data-shift can be used to specify which data lines are=
 used,
> +      e.g. "bus-width=3D<8>; data-shift=3D<2>;" means, that lines 9:2 ar=
e used.
> +
> +  hsync-active:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]
> +    description:
> +      Active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
> +
> +  vsync-active:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]
> +    description:
> +      Active state of the VSYNC signal, 0/1 for LOW/HIGH respectively. N=
ote,
> +      that if HSYNC and VSYNC polarities are not specified, embedded
> +      synchronization may be required, where supported.
> +
> +  data-active:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]
> +    description:
> +      Similar to HSYNC and VSYNC, specifies data line polarity.
> +
> +  data-enable-active:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]
> +    description:
> +      Similar to HSYNC and VSYNC, specifies the data enable signal polar=
ity.
> +
> +  field-even-active:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]
> +    description:
> +      Field signal level during the even field data transmission.
> +
> +  pclk-sample:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]
> +    description:
> +      Sample data on rising (1) or falling (0) edge of the pixel clock s=
ignal.
> +
> +  sync-on-green-active:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]
> +    description:
> +      Active state of Sync-on-green (SoG) signal, 0/1 for LOW/HIGH respe=
ctively.
> +
> +  data-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 8
> +    items:
> +      # Assume up to 9 physical lane indices
> +      maximum: 8
> +    description:
> +      An array of physical data lane indexes. Position of an entry deter=
mines
> +      the logical lane number, while the value of an entry indicates phy=
sical
> +      lane, e.g. for 2-lane MIPI CSI-2 bus we could have "data-lanes =3D=
 <1 2>;",
> +      assuming the clock lane is on hardware lane 0. If the hardware doe=
s not
> +      support lane reordering, monotonically incremented values shall be=
 used
> +      from 0 or 1 onwards, depending on whether or not there is also a c=
lock
> +      lane. This property is valid for serial busses only (e.g. MIPI CSI=
-2).
> +
> +  clock-lanes:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    # Assume up to 9 physical lane indices
> +    maximum: 8
> +    description:
> +      Physical clock lane index. Position of an entry determines the log=
ical
> +      lane number, while the value of an entry indicates physical lane, =
e.g. for
> +      a MIPI CSI-2 bus we could have "clock-lanes =3D <0>;", which place=
s the
> +      clock lane on hardware lane 0. This property is valid for serial b=
usses
> +      only (e.g. MIPI CSI-2).
> +
> +  clock-noncontinuous:
> +    type: boolean
> +    description:
> +      Allow MIPI CSI-2 non-continuous clock mode.
> +
> +  link-frequencies:
> +    $ref: /schemas/types.yaml#/definitions/uint64-array
> +    description:
> +      Allowed data bus frequencies. For MIPI CSI-2, for instance, this i=
s the
> +      actual frequency of the bus, not bits per clock per lane value. An=
 array
> +      of 64-bit unsigned integers.
> +
> +  lane-polarities:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 9
> +    items:
> +      enum: [ 0, 1 ]
> +    description:
> +      An array of polarities of the lanes starting from the clock lane a=
nd
> +      followed by the data lanes in the same order as in data-lanes. Val=
id
> +      values are 0 (normal) and 1 (inverted). The length of the array sh=
ould be
> +      the combined length of data-lanes and clock-lanes properties. If t=
he
> +      lane-polarities property is omitted, the value must be interpreted=
 as 0
> +      (normal). This property is valid for serial busses only.
> +
> +  strobe:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [ 0, 1 ]
> +    description:
> +      Whether the clock signal is used as clock (0) or strobe (1). Used =
with
> +      CCP2, for instance.
> +
> +additionalProperties: true
> +
> +examples:
> +  # The example snippet below describes two data pipelines.  ov772x and =
imx074
> +  # are camera sensors with a parallel and serial (MIPI CSI-2) video bus
> +  # respectively. Both sensors are on the I2C control bus corresponding =
to the
> +  # i2c0 controller node.  ov772x sensor is linked directly to the ceu0 =
video
> +  # host interface. imx074 is linked to ceu0 through the MIPI CSI-2 rece=
iver
> +  # (csi2). ceu0 has a (single) DMA engine writing captured data to memo=
ry.
> +  # ceu0 node has a single 'port' node which may indicate that at any ti=
me
> +  # only one of the following data pipelines can be active:
> +  # ov772x -> ceu0 or imx074 -> csi2 -> ceu0.
> +  - |
> +    ceu@fe910000 {
> +        compatible =3D "renesas,sh-mobile-ceu";
> +        reg =3D <0xfe910000 0xa0>;
> +        interrupts =3D <0x880>;
> +
> +        mclk: master_clock {
> +            compatible =3D "renesas,ceu-clock";
> +            #clock-cells =3D <1>;
> +            clock-frequency =3D <50000000>;  /* Max clock frequency */
> +            clock-output-names =3D "mclk";
> +        };
> +
> +        port {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            /* Parallel bus endpoint */
> +            ceu0_1: endpoint@1 {
> +                reg =3D <1>;    /* Local endpoint # */
> +                remote-endpoint =3D <&ov772x_1_1>;  /* Remote phandle */
> +                bus-width =3D <8>;  /* Used data lines */
> +                data-shift =3D <2>;  /* Lines 9:2 are used */
> +
> +                /* If hsync-active/vsync-active are missing,
> +                   embedded BT.656 sync is used */
> +                hsync-active =3D <0>;  /* Active low */
> +                vsync-active =3D <0>;  /* Active low */
> +                data-active =3D <1>;  /* Active high */
> +                pclk-sample =3D <1>;  /* Rising */
> +            };
> +
> +            /* MIPI CSI-2 bus endpoint */
> +            ceu0_0: endpoint@0 {
> +                reg =3D <0>;
> +                remote-endpoint =3D <&csi2_2>;
> +            };
> +        };
> +    };
> +
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        camera@21 {
> +            compatible =3D "ovti,ov772x";
> +            reg =3D <0x21>;
> +            vddio-supply =3D <&regulator1>;
> +            vddcore-supply =3D <&regulator2>;
> +
> +            clock-frequency =3D <20000000>;
> +            clocks =3D <&mclk 0>;
> +            clock-names =3D "xclk";
> +
> +            port {
> +                /* With 1 endpoint per port no need for addresses. */
> +                ov772x_1_1: endpoint {
> +                    bus-width =3D <8>;
> +                    remote-endpoint =3D <&ceu0_1>;
> +                    hsync-active =3D <1>;
> +                    vsync-active =3D <0>; /* Who came up with an
> +                               inverter here ?... */
> +                    data-active =3D <1>;
> +                    pclk-sample =3D <1>;
> +                };
> +            };
> +        };
> +
> +        camera@1a {
> +            compatible =3D "sony,imx074";
> +            reg =3D <0x1a>;
> +            vddio-supply =3D <&regulator1>;
> +            vddcore-supply =3D <&regulator2>;
> +
> +            clock-frequency =3D <30000000>;  /* Shared clock with ov772x=
_1 */
> +            clocks =3D <&mclk 0>;
> +            clock-names =3D "sysclk";    /* Assuming this is the
> +                       name in the datasheet */
> +            port {
> +                imx074_1: endpoint {
> +                    clock-lanes =3D <0>;
> +                    data-lanes =3D <1 2>;
> +                    remote-endpoint =3D <&csi2_1>;
> +                };
> +            };
> +        };
> +    };
> +
> +    csi2: csi2@ffc90000 {
> +        compatible =3D "renesas,sh-mobile-csi2";
> +        reg =3D <0xffc90000 0x1000>;
> +        interrupts =3D <0x17a0>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        port@1 {
> +            compatible =3D "renesas,csi2c";  /* One of CSI2I and CSI2C. =
*/
> +            reg =3D <1>;      /* CSI-2 PHY #1 of 2: PHY_S,
> +                       PHY_M has port address 0,
> +                       is unused. */
> +            csi2_1: endpoint {
> +                clock-lanes =3D <0>;
> +                data-lanes =3D <2 1>;
> +                remote-endpoint =3D <&imx074_1>;
> +            };
> +        };
> +        port@2 {
> +            reg =3D <2>;      /* port 2: link to the CEU */
> +
> +            csi2_2: endpoint {
> +                remote-endpoint =3D <&ceu0_0>;
> +            };
> +        };
> +    };
> +
> +...
> --
> 2.27.0
>
