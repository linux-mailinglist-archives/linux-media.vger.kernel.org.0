Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4B792CE259
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 00:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729348AbgLCXIh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 18:08:37 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:39066 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgLCXIh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 18:08:37 -0500
Received: by mail-il1-f196.google.com with SMTP id q1so3537603ilt.6;
        Thu, 03 Dec 2020 15:08:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LeacMz729s9Mefz97pA0lBt22l3MK4f6PWexH9xQxrY=;
        b=IZJZ6r+tJ/KclQSX6PT0W5taSekjjr4DcsVaBtsVX34+VhALcF9hUES/5KwITfERnT
         jP6ukAf/y9D3WkiDtdbv3HZC2c+kIfV9r09WqT8RB9Z7xWV7vN4nRgywNpbbUnJFfGa2
         E/yGJ2Tb2VjeNLQ4alE0SrnUqS7GpSPAlGJIFvv+c6kjeJvCrs67p2tL1/hx2OAmVOgA
         9ysCftE8zDOlA3IUwubqQOUpzHphzacsp47Z8gHxPlIXdqdFLbLDCJg423hSwTujH6Xd
         wCExe61UvNncuYXovO/Eg1nCnKuhOdbm/zl4mdOpyHHCxYHk07UHKL0LE4VIaBN4ILhL
         44yQ==
X-Gm-Message-State: AOAM533bBBgrZCB4iYgNVpysBgS29VWzYMecDxUcJ4s0NQDo65GB8Pl+
        SqM7xH8ZUnA23OYADPMl/A==
X-Google-Smtp-Source: ABdhPJz4o82APeDvBRfG095nKcwnGf3SzxDuUZ/kjbrdAc3uGjY6B4hhCExG0+/EV/4+V3lEj+Hw6w==
X-Received: by 2002:a92:c785:: with SMTP id c5mr2020457ilk.298.1607036873650;
        Thu, 03 Dec 2020 15:07:53 -0800 (PST)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id b12sm402847ilc.21.2020.12.03.15.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 15:07:52 -0800 (PST)
Received: (nullmailer pid 1011469 invoked by uid 1000);
        Thu, 03 Dec 2020 23:07:51 -0000
Date:   Thu, 3 Dec 2020 16:07:51 -0700
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: Convert video-interfaces.txt
 properties to schemas
Message-ID: <20201203230751.GC2644458@robh.at.kernel.org>
References: <20201203001302.3407476-1-robh@kernel.org>
 <20201203001302.3407476-2-robh@kernel.org>
 <20201203175040.ml7fo4xp3ofauojq@uno.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201203175040.ml7fo4xp3ofauojq@uno.localdomain>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 03, 2020 at 06:50:40PM +0100, Jacopo Mondi wrote:
> Hi Rob,
> 
> On Wed, Dec 02, 2020 at 05:13:01PM -0700, Rob Herring wrote:
> > Convert video-interfaces.txt to DT schema. As it contains a mixture of
> > device level and endpoint properties, split it up into 2 schemas.
> >
> > Binding schemas will need to reference both the graph.yaml and
> > video-interfaces.yaml schemas. The exact schema depends on how many
> > ports and endpoints for the binding. A single port with a single
> > endpoint looks similar to this:
> >
> >   port:
> >     $ref: /schemas/graph.yaml#/$defs/port-base
> >
> >     properties:
> >       endpoint:
> >         $ref: video-interfaces.yaml#
> >         unevaluatedProperties: false
> >
> >         properties:
> >           bus-width:
> >             enum: [ 8, 10, 12, 16 ]
> >
> >           pclk-sample: true
> >           hsync-active: true
> >           vsync-active: true
> >
> >         required:
> >           - bus-width
> >
> >     additionalProperties: false
> >
> > Cc: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Jacopo Mondi <jacopo@jmondi.org>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > I need acks for dual licensing from the listed maintainers.
> 
> For video-interface-devices.yaml
> Acked-by: Jacopo Mondi <jacopo@jmondi.org>
> 
> > ---
> >  .../media/video-interface-devices.yaml        | 405 +++++++++++
> >  .../bindings/media/video-interfaces.txt       | 640 +-----------------
> >  .../bindings/media/video-interfaces.yaml      | 344 ++++++++++
> >  3 files changed, 750 insertions(+), 639 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/media/video-interface-devices.yaml
> >  create mode 100644 Documentation/devicetree/bindings/media/video-interfaces.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> > new file mode 100644
> > index 000000000000..037b93d62651
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> > @@ -0,0 +1,405 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/video-interface-devices.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Common bindings for video receiver and transmitter devices
> > +
> > +maintainers:
> > +  - Jacopo Mondi <jacopo@jmondi.org>
> 
> I'm pleased to help, but I only have added two properties there (well,
> we have 4 in total :)

Well, line wise you have 95% of it. :)

> > Should Sakari which afaict defined the other ones be listed here too ?

Yes, I'll add him.

> > +properties:
> > +  flash-leds:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    description:
> > +      An array of phandles, each referring to a flash LED, a sub-node of the LED
> > +      driver device node.
> > +
> > +  lens-focus:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      A phandle to the node of the focus lens controller.
> > +
> > +  rotation:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 0, 90, 180, 270 ]
> > +    description: |
> > +      The camera rotation is expressed as the angular difference in degrees
> > +      between two reference systems, one relative to the camera module, and one
> > +      defined on the external world scene to be captured when projected on the
> > +      image sensor pixel array.
> > +
> > +      A camera sensor has a 2-dimensional reference system 'Rc' defined by its
> > +      pixel array read-out order. The origin is set to the first pixel being
> > +      read out, the X-axis points along the column read-out direction towards
> > +      the last columns, and the Y-axis along the row read-out direction towards
> > +      the last row.
> > +
> > +      A typical example for a sensor with a 2592x1944 pixel array matrix
> > +      observed from the front is:
> > +
> > +              2591       X-axis          0
> > +                <------------------------+ 0
> > +                .......... ... ..........!
> > +                .......... ... ..........! Y-axis
> > +                           ...           !
> > +                .......... ... ..........!
> > +                .......... ... ..........! 1943
> > +                                         V
> > +
> > +      The external world scene reference system 'Rs' is a 2-dimensional
> > +      reference system on the focal plane of the camera module. The origin is
> > +      placed on the top-left corner of the visible scene, the X-axis points
> > +      towards the right, and the Y-axis points towards the bottom of the scene.
> > +      The top, bottom, left and right directions are intentionally not defined
> > +      and depend on the environment in which the camera is used.
> > +
> > +      A typical example of a (very common) picture of a shark swimming from left
> > +      to right, as seen from the camera, is:
> > +
> > +               0               X-axis
> > +             0 +------------------------------------->
> > +               !
> > +               !
> > +               !
> > +               !           |\____)\___
> > +               !           ) _____  __`<
> > +               !           |/     )/
> > +               !
> > +               !
> > +               !
> > +               V
> > +             Y-axis
> > +
> > +      with the reference system 'Rs' placed on the camera focal plane:
> > +
> > +                                  ¸.·˙!
> > +                              ¸.·˙    !
> > +                  _       ¸.·˙        !
> > +               +-/ \-+¸.·˙            !
> > +               | (o) |                ! Camera focal plane
> > +               +-----+˙·.¸            !
> > +                          ˙·.¸        !
> > +                              ˙·.¸    !
> > +                                  ˙·.¸!
> > +
> > +      When projected on the sensor's pixel array, the image and the associated
> > +      reference system 'Rs' are typically (but not always) inverted, due to the
> > +      camera module's lens optical inversion effect.
> > +
> > +      Assuming the above represented scene of the swimming shark, the lens
> > +      inversion projects the scene and its reference system onto the sensor
> > +      pixel array, seen from the front of the camera sensor, as follows:
> > +
> > +            Y-axis
> > +               ^
> > +               !
> > +               !
> > +               !
> > +               !            |\_____)\__
> > +               !            ) ____  ___.<
> > +               !            |/    )/
> > +               !
> > +               !
> > +               !
> > +             0 +------------------------------------->
> > +               0               X-axis
> > +
> > +      Note the shark being upside-down.
> > +
> > +      The resulting projected reference system is named 'Rp'.
> > +
> > +      The camera rotation property is then defined as the angular difference in
> > +      the counter-clockwise direction between the camera reference system 'Rc'
> > +      and the projected scene reference system 'Rp'. It is expressed in degrees
> > +      as a number in the range [0, 360[.
> > +
> > +      Examples
> > +
> > +      0 degrees camera rotation:
> > +
> > +
> > +                    Y-Rp
> > +                     ^
> > +              Y-Rc   !
> > +               ^     !
> > +               !     !
> > +               !     !
> > +               !     !
> > +               !     !
> > +               !     !
> > +               !     !
> > +               !     !
> > +               !   0 +------------------------------------->
> > +               !     0               X-Rp
> > +             0 +------------------------------------->
> > +               0               X-Rc
> > +
> > +
> > +                                X-Rc                0
> > +               <------------------------------------+ 0
> > +                           X-Rp                 0   !
> > +           <------------------------------------+ 0 !
> > +                                                !   !
> > +                                                !   !
> > +                                                !   !
> > +                                                !   !
> > +                                                !   !
> > +                                                !   !
> > +                                                !   !
> > +                                                !   V
> > +                                                !  Y-Rc
> > +                                                V
> > +                                               Y-Rp
> > +
> > +      90 degrees camera rotation:
> > +
> > +               0        Y-Rc
> > +             0 +-------------------->
> > +               !   Y-Rp
> > +               !    ^
> > +               !    !
> > +               !    !
> > +               !    !
> > +               !    !
> > +               !    !
> > +               !    !
> > +               !    !
> > +               !    !
> > +               !    !
> > +               !  0 +------------------------------------->
> > +               !    0              X-Rp
> > +               !
> > +               !
> > +               !
> > +               !
> > +               V
> > +              X-Rc
> > +
> > +      180 degrees camera rotation:
> > +
> > +                                            0
> > +       <------------------------------------+ 0
> > +                        X-Rc                !
> > +              Y-Rp                          !
> > +               ^                            !
> > +               !                            !
> > +               !                            !
> > +               !                            !
> > +               !                            !
> > +               !                            !
> > +               !                            !
> > +               !                            V
> > +               !                           Y-Rc
> > +             0 +------------------------------------->
> > +               0              X-Rp
> > +
> > +      270 degrees camera rotation:
> > +
> > +               0        Y-Rc
> > +             0 +-------------------->
> > +               !                                        0
> > +               !    <-----------------------------------+ 0
> > +               !                    X-Rp                !
> > +               !                                        !
> > +               !                                        !
> > +               !                                        !
> > +               !                                        !
> > +               !                                        !
> > +               !                                        !
> > +               !                                        !
> > +               !                                        !
> > +               !                                        V
> > +               !                                       Y-Rp
> > +               !
> > +               !
> > +               !
> > +               !
> > +               V
> > +              X-Rc
> > +
> > +
> > +      Example one - Webcam
> > +
> > +      A camera module installed on the user facing part of a laptop screen
> > +      casing used for video calls. The captured images are meant to be displayed
> > +      in landscape mode (width > height) on the laptop screen.
> > +
> > +      The camera is typically mounted upside-down to compensate the lens optical
> > +      inversion effect:
> > +
> > +                    Y-Rp
> > +              Y-Rc   ^
> > +               ^     !
> > +               !     !
> > +               !     !       |\_____)\__
> > +               !     !       ) ____  ___.<
> > +               !     !       |/    )/
> > +               !     !
> > +               !     !
> > +               !     !
> > +               !   0 +------------------------------------->
> > +               !     0           X-Rp
> > +             0 +------------------------------------->
> > +               0            X-Rc
> > +
> > +      The two reference systems are aligned, the resulting camera rotation is
> > +      0 degrees, no rotation correction needs to be applied to the resulting
> > +      image once captured to memory buffers to correctly display it to users:
> > +
> > +               +--------------------------------------+
> > +               !                                      !
> > +               !                                      !
> > +               !                                      !
> > +               !             |\____)\___              !
> > +               !             ) _____  __`<            !
> > +               !             |/     )/                !
> > +               !                                      !
> > +               !                                      !
> > +               !                                      !
> > +               +--------------------------------------+
> > +
> > +      If the camera sensor is not mounted upside-down to compensate for the lens
> > +      optical inversion, the two reference systems will not be aligned, with
> > +      'Rp' being rotated 180 degrees relatively to 'Rc':
> > +
> > +
> > +                        X-Rc                0
> > +       <------------------------------------+ 0
> > +                                            !
> > +              Y-Rp                          !
> > +               ^                            !
> > +               !                            !
> > +               !       |\_____)\__          !
> > +               !       ) ____  ___.<        !
> > +               !       |/    )/             !
> > +               !                            !
> > +               !                            !
> > +               !                            V
> > +               !                           Y-Rc
> > +             0 +------------------------------------->
> > +               0            X-Rp
> > +
> > +      The image once captured to memory will then be rotated by 180 degrees:
> > +
> > +               +--------------------------------------+
> > +               !                                      !
> > +               !                                      !
> > +               !                                      !
> > +               !              __/(_____/|             !
> > +               !            >.___  ____ (             !
> > +               !                 \(    \|             !
> > +               !                                      !
> > +               !                                      !
> > +               !                                      !
> > +               +--------------------------------------+
> > +
> > +      A software rotation correction of 180 degrees should be applied to
> > +      correctly display the image:
> > +
> > +               +--------------------------------------+
> > +               !                                      !
> > +               !                                      !
> > +               !                                      !
> > +               !             |\____)\___              !
> > +               !             ) _____  __`<            !
> > +               !             |/     )/                !
> > +               !                                      !
> > +               !                                      !
> > +               !                                      !
> > +               +--------------------------------------+
> > +
> > +      Example two - Phone camera
> > +
> > +      A camera installed on the back side of a mobile device facing away from
> > +      the user. The captured images are meant to be displayed in portrait mode
> > +      (height > width) to match the device screen orientation and the device
> > +      usage orientation used when taking the picture.
> > +
> > +      The camera sensor is typically mounted with its pixel array longer side
> > +      aligned to the device longer side, upside-down mounted to compensate for
> > +      the lens optical inversion effect:
> > +
> > +               0        Y-Rc
> > +             0 +-------------------->
> > +               !   Y-Rp
> > +               !    ^
> > +               !    !
> > +               !    !
> > +               !    !
> > +               !    !            |\_____)\__
> > +               !    !            ) ____  ___.<
> > +               !    !            |/    )/
> > +               !    !
> > +               !    !
> > +               !    !
> > +               !  0 +------------------------------------->
> > +               !    0                X-Rp
> > +               !
> > +               !
> > +               !
> > +               !
> > +               V
> > +              X-Rc
> > +
> > +      The two reference systems are not aligned and the 'Rp' reference system is
> > +      rotated by 90 degrees in the counter-clockwise direction relatively to the
> > +      'Rc' reference system.
> > +
> > +      The image once captured to memory will be rotated:
> > +
> > +               +-------------------------------------+
> > +               |                 _ _                 |
> > +               |                \   /                |
> > +               |                 | |                 |
> > +               |                 | |                 |
> > +               |                 |  >                |
> > +               |                <  |                 |
> > +               |                 | |                 |
> > +               |                   .                 |
> > +               |                  V                  |
> > +               +-------------------------------------+
> > +
> > +      A correction of 90 degrees in counter-clockwise direction has to be
> > +      applied to correctly display the image in portrait mode on the device
> > +      screen:
> > +
> > +                        +--------------------+
> > +                        |                    |
> > +                        |                    |
> > +                        |                    |
> > +                        |                    |
> > +                        |                    |
> > +                        |                    |
> > +                        |   |\____)\___      |
> > +                        |   ) _____  __`<    |
> > +                        |   |/     )/        |
> > +                        |                    |
> > +                        |                    |
> > +                        |                    |
> > +                        |                    |
> > +                        |                    |
> > +                        +--------------------+
> > +
> > +  orientation:
> > +    description:
> > +      The orientation of a device (typically an image sensor or a flash LED)
> > +      describing its mounting position relative to the usage orientation of the
> > +      system where the device is installed on.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum:
> > +        # Front. The device is mounted on the front facing side of the system. For
> > +        # mobile devices such as smartphones, tablets and laptops the front side
> > +        # is the user facing side.
> > +      - 0
> > +        # Back. The device is mounted on the back side of the system, which is
> > +        # defined as the opposite side of the front facing one.
> > +      - 1
> > +        # External. The device is not attached directly to the system but is
> > +        # attached in a way that allows it to move freely.
> > +      - 2
> 
> Can yaml provide defines so users can write more explicit
> "FRONT_CAMERA" instead of <0> ?

No, I don't think so.

> 
> cf: https://patchwork.linuxtv.org/project/linux-media/patch/20200509090456.3496481-14-jacopo@jmondi.org/
> 
> > +
> > +additionalProperties: true
> > +
> > +...
> > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > index 3920f25a9123..8fcf5f52bf5b 100644
> > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > @@ -1,639 +1 @@
> > -Common bindings for video receiver and transmitter interfaces
> > -
> > -General concept
> > ----------------
> > -
> > -Video data pipelines usually consist of external devices, e.g. camera sensors,
> > -controlled over an I2C, SPI or UART bus, and SoC internal IP blocks, including
> > -video DMA engines and video data processors.
> > -
> > -SoC internal blocks are described by DT nodes, placed similarly to other SoC
> > -blocks.  External devices are represented as child nodes of their respective
> > -bus controller nodes, e.g. I2C.
> > -
> > -Data interfaces on all video devices are described by their child 'port' nodes.
> > -Configuration of a port depends on other devices participating in the data
> > -transfer and is described by 'endpoint' subnodes.
> > -
> > -device {
> > -	...
> > -	ports {
> > -		#address-cells = <1>;
> > -		#size-cells = <0>;
> > -
> > -		port@0 {
> > -			...
> > -			endpoint@0 { ... };
> > -			endpoint@1 { ... };
> > -		};
> > -		port@1 { ... };
> > -	};
> > -};
> > -
> > -If a port can be configured to work with more than one remote device on the same
> > -bus, an 'endpoint' child node must be provided for each of them.  If more than
> > -one port is present in a device node or there is more than one endpoint at a
> > -port, or port node needs to be associated with a selected hardware interface,
> > -a common scheme using '#address-cells', '#size-cells' and 'reg' properties is
> > -used.
> > -
> > -All 'port' nodes can be grouped under optional 'ports' node, which allows to
> > -specify #address-cells, #size-cells properties independently for the 'port'
> > -and 'endpoint' nodes and any child device nodes a device might have.
> > -
> > -Two 'endpoint' nodes are linked with each other through their 'remote-endpoint'
> > -phandles.  An endpoint subnode of a device contains all properties needed for
> > -configuration of this device for data exchange with other device.  In most
> > -cases properties at the peer 'endpoint' nodes will be identical, however they
> > -might need to be different when there is any signal modifications on the bus
> > -between two devices, e.g. there are logic signal inverters on the lines.
> > -
> > -It is allowed for multiple endpoints at a port to be active simultaneously,
> > -where supported by a device.  For example, in case where a data interface of
> > -a device is partitioned into multiple data busses, e.g. 16-bit input port
> > -divided into two separate ITU-R BT.656 8-bit busses.  In such case bus-width
> > -and data-shift properties can be used to assign physical data lines to each
> > -endpoint node (logical bus).
> > -
> > -Documenting bindings for devices
> > ---------------------------------
> > -
> > -All required and optional bindings the device supports shall be explicitly
> > -documented in device DT binding documentation. This also includes port and
> > -endpoint nodes for the device, including unit-addresses and reg properties where
> > -relevant.
> > -
> > -Please also see Documentation/devicetree/bindings/graph.txt .
> > -
> > -Required properties
> > --------------------
> > -
> > -If there is more than one 'port' or more than one 'endpoint' node or 'reg'
> > -property is present in port and/or endpoint nodes the following properties
> > -are required in a relevant parent node:
> > -
> > - - #address-cells : number of cells required to define port/endpoint
> > -		    identifier, should be 1.
> > - - #size-cells    : should be zero.
> > -
> > -
> > -Optional properties
> > --------------------
> > -
> > -- flash-leds: An array of phandles, each referring to a flash LED, a sub-node
> > -  of the LED driver device node.
> > -
> > -- lens-focus: A phandle to the node of the focus lens controller.
> > -
> > -- rotation: The camera rotation is expressed as the angular difference in
> > -  degrees between two reference systems, one relative to the camera module, and
> > -  one defined on the external world scene to be captured when projected on the
> > -  image sensor pixel array.
> > -
> > -  A camera sensor has a 2-dimensional reference system 'Rc' defined by
> > -  its pixel array read-out order. The origin is set to the first pixel
> > -  being read out, the X-axis points along the column read-out direction
> > -  towards the last columns, and the Y-axis along the row read-out
> > -  direction towards the last row.
> > -
> > -  A typical example for a sensor with a 2592x1944 pixel array matrix
> > -  observed from the front is:
> > -
> > -              2591       X-axis          0
> > -                <------------------------+ 0
> > -                .......... ... ..........!
> > -                .......... ... ..........! Y-axis
> > -                           ...           !
> > -                .......... ... ..........!
> > -                .......... ... ..........! 1943
> > -                                         V
> > -
> > -  The external world scene reference system 'Rs' is a 2-dimensional
> > -  reference system on the focal plane of the camera module. The origin is
> > -  placed on the top-left corner of the visible scene, the X-axis points
> > -  towards the right, and the Y-axis points towards the bottom of the
> > -  scene. The top, bottom, left and right directions are intentionally not
> > -  defined and depend on the environment in which the camera is used.
> > -
> > -  A typical example of a (very common) picture of a shark swimming from
> > -  left to right, as seen from the camera, is:
> > -
> > -               0               X-axis
> > -             0 +------------------------------------->
> > -               !
> > -               !
> > -               !
> > -               !           |\____)\___
> > -               !           ) _____  __`<
> > -               !           |/     )/
> > -               !
> > -               !
> > -               !
> > -               V
> > -             Y-axis
> > -
> > -  with the reference system 'Rs' placed on the camera focal plane:
> > -
> > -                                  ¸.·˙!
> > -                              ¸.·˙    !
> > -                  _       ¸.·˙        !
> > -               +-/ \-+¸.·˙            !
> > -               | (o) |                ! Camera focal plane
> > -               +-----+˙·.¸            !
> > -                          ˙·.¸        !
> > -                              ˙·.¸    !
> > -                                  ˙·.¸!
> > -
> > -  When projected on the sensor's pixel array, the image and the associated
> > -  reference system 'Rs' are typically (but not always) inverted, due to
> > -  the camera module's lens optical inversion effect.
> > -
> > -  Assuming the above represented scene of the swimming shark, the lens
> > -  inversion projects the scene and its reference system onto the sensor
> > -  pixel array, seen from the front of the camera sensor, as follows:
> > -
> > -            Y-axis
> > -               ^
> > -               !
> > -               !
> > -               !
> > -               !            |\_____)\__
> > -               !            ) ____  ___.<
> > -               !            |/    )/
> > -               !
> > -               !
> > -               !
> > -             0 +------------------------------------->
> > -               0               X-axis
> > -
> > -  Note the shark being upside-down.
> > -
> > -  The resulting projected reference system is named 'Rp'.
> > -
> > -  The camera rotation property is then defined as the angular difference
> > -  in the counter-clockwise direction between the camera reference system
> > -  'Rc' and the projected scene reference system 'Rp'. It is expressed in
> > -  degrees as a number in the range [0, 360[.
> > -
> > -  Examples
> > -
> > -  0 degrees camera rotation:
> > -
> > -
> > -                    Y-Rp
> > -                     ^
> > -              Y-Rc   !
> > -               ^     !
> > -               !     !
> > -               !     !
> > -               !     !
> > -               !     !
> > -               !     !
> > -               !     !
> > -               !     !
> > -               !   0 +------------------------------------->
> > -               !     0               X-Rp
> > -             0 +------------------------------------->
> > -               0               X-Rc
> > -
> > -
> > -                                X-Rc                0
> > -               <------------------------------------+ 0
> > -                           X-Rp                 0   !
> > -           <------------------------------------+ 0 !
> > -                                                !   !
> > -                                                !   !
> > -                                                !   !
> > -                                                !   !
> > -                                                !   !
> > -                                                !   !
> > -                                                !   !
> > -                                                !   V
> > -                                                !  Y-Rc
> > -                                                V
> > -                                               Y-Rp
> > -
> > -  90 degrees camera rotation:
> > -
> > -               0        Y-Rc
> > -             0 +-------------------->
> > -               !   Y-Rp
> > -               !    ^
> > -               !    !
> > -               !    !
> > -               !    !
> > -               !    !
> > -               !    !
> > -               !    !
> > -               !    !
> > -               !    !
> > -               !    !
> > -               !  0 +------------------------------------->
> > -               !    0              X-Rp
> > -               !
> > -               !
> > -               !
> > -               !
> > -               V
> > -              X-Rc
> > -
> > -  180 degrees camera rotation:
> > -
> > -                                            0
> > -       <------------------------------------+ 0
> > -                        X-Rc                !
> > -              Y-Rp                          !
> > -               ^                            !
> > -               !                            !
> > -               !                            !
> > -               !                            !
> > -               !                            !
> > -               !                            !
> > -               !                            !
> > -               !                            V
> > -               !                           Y-Rc
> > -             0 +------------------------------------->
> > -               0              X-Rp
> > -
> > -  270 degrees camera rotation:
> > -
> > -               0        Y-Rc
> > -             0 +-------------------->
> > -               !                                        0
> > -               !    <-----------------------------------+ 0
> > -               !                    X-Rp                !
> > -               !                                        !
> > -               !                                        !
> > -               !                                        !
> > -               !                                        !
> > -               !                                        !
> > -               !                                        !
> > -               !                                        !
> > -               !                                        !
> > -               !                                        V
> > -               !                                       Y-Rp
> > -               !
> > -               !
> > -               !
> > -               !
> > -               V
> > -              X-Rc
> > -
> > -
> > -  Example one - Webcam
> > -
> > -  A camera module installed on the user facing part of a laptop screen
> > -  casing used for video calls. The captured images are meant to be
> > -  displayed in landscape mode (width > height) on the laptop screen.
> > -
> > -  The camera is typically mounted upside-down to compensate the lens
> > -  optical inversion effect:
> > -
> > -                    Y-Rp
> > -              Y-Rc   ^
> > -               ^     !
> > -               !     !
> > -               !     !       |\_____)\__
> > -               !     !       ) ____  ___.<
> > -               !     !       |/    )/
> > -               !     !
> > -               !     !
> > -               !     !
> > -               !   0 +------------------------------------->
> > -               !     0           X-Rp
> > -             0 +------------------------------------->
> > -               0            X-Rc
> > -
> > -  The two reference systems are aligned, the resulting camera rotation is
> > -  0 degrees, no rotation correction needs to be applied to the resulting
> > -  image once captured to memory buffers to correctly display it to users:
> > -
> > -               +--------------------------------------+
> > -               !                                      !
> > -               !                                      !
> > -               !                                      !
> > -               !             |\____)\___              !
> > -               !             ) _____  __`<            !
> > -               !             |/     )/                !
> > -               !                                      !
> > -               !                                      !
> > -               !                                      !
> > -               +--------------------------------------+
> > -
> > -  If the camera sensor is not mounted upside-down to compensate for the
> > -  lens optical inversion, the two reference systems will not be aligned,
> > -  with 'Rp' being rotated 180 degrees relatively to 'Rc':
> > -
> > -
> > -                        X-Rc                0
> > -       <------------------------------------+ 0
> > -                                            !
> > -              Y-Rp                          !
> > -               ^                            !
> > -               !                            !
> > -               !       |\_____)\__          !
> > -               !       ) ____  ___.<        !
> > -               !       |/    )/             !
> > -               !                            !
> > -               !                            !
> > -               !                            V
> > -               !                           Y-Rc
> > -             0 +------------------------------------->
> > -               0            X-Rp
> > -
> > -  The image once captured to memory will then be rotated by 180 degrees:
> > -
> > -               +--------------------------------------+
> > -               !                                      !
> > -               !                                      !
> > -               !                                      !
> > -               !              __/(_____/|             !
> > -               !            >.___  ____ (             !
> > -               !                 \(    \|             !
> > -               !                                      !
> > -               !                                      !
> > -               !                                      !
> > -               +--------------------------------------+
> > -
> > -  A software rotation correction of 180 degrees should be applied to
> > -  correctly display the image:
> > -
> > -               +--------------------------------------+
> > -               !                                      !
> > -               !                                      !
> > -               !                                      !
> > -               !             |\____)\___              !
> > -               !             ) _____  __`<            !
> > -               !             |/     )/                !
> > -               !                                      !
> > -               !                                      !
> > -               !                                      !
> > -               +--------------------------------------+
> > -
> > -  Example two - Phone camera
> > -
> > -  A camera installed on the back side of a mobile device facing away from
> > -  the user. The captured images are meant to be displayed in portrait mode
> > -  (height > width) to match the device screen orientation and the device
> > -  usage orientation used when taking the picture.
> > -
> > -  The camera sensor is typically mounted with its pixel array longer side
> > -  aligned to the device longer side, upside-down mounted to compensate for
> > -  the lens optical inversion effect:
> > -
> > -               0        Y-Rc
> > -             0 +-------------------->
> > -               !   Y-Rp
> > -               !    ^
> > -               !    !
> > -               !    !
> > -               !    !
> > -               !    !            |\_____)\__
> > -               !    !            ) ____  ___.<
> > -               !    !            |/    )/
> > -               !    !
> > -               !    !
> > -               !    !
> > -               !  0 +------------------------------------->
> > -               !    0                X-Rp
> > -               !
> > -               !
> > -               !
> > -               !
> > -               V
> > -              X-Rc
> > -
> > -  The two reference systems are not aligned and the 'Rp' reference
> > -  system is rotated by 90 degrees in the counter-clockwise direction
> > -  relatively to the 'Rc' reference system.
> > -
> > -  The image once captured to memory will be rotated:
> > -
> > -               +-------------------------------------+
> > -               |                 _ _                 |
> > -               |                \   /                |
> > -               |                 | |                 |
> > -               |                 | |                 |
> > -               |                 |  >                |
> > -               |                <  |                 |
> > -               |                 | |                 |
> > -               |                   .                 |
> > -               |                  V                  |
> > -               +-------------------------------------+
> > -
> > -  A correction of 90 degrees in counter-clockwise direction has to be
> > -  applied to correctly display the image in portrait mode on the device
> > -  screen:
> > -
> > -                        +--------------------+
> > -                        |                    |
> > -                        |                    |
> > -                        |                    |
> > -                        |                    |
> > -                        |                    |
> > -                        |                    |
> > -                        |   |\____)\___      |
> > -                        |   ) _____  __`<    |
> > -                        |   |/     )/        |
> > -                        |                    |
> > -                        |                    |
> > -                        |                    |
> > -                        |                    |
> > -                        |                    |
> > -                        +--------------------+
> > -
> > -- orientation: The orientation of a device (typically an image sensor or a flash
> > -  LED) describing its mounting position relative to the usage orientation of the
> > -  system where the device is installed on.
> > -  Possible values are:
> > -  0 - Front. The device is mounted on the front facing side of the system.
> > -  For mobile devices such as smartphones, tablets and laptops the front side is
> > -  the user facing side.
> > -  1 - Back. The device is mounted on the back side of the system, which is
> > -  defined as the opposite side of the front facing one.
> > -  2 - External. The device is not attached directly to the system but is
> > -  attached in a way that allows it to move freely.
> > -
> > -Optional endpoint properties
> > -----------------------------
> > -
> > -- remote-endpoint: phandle to an 'endpoint' subnode of a remote device node.
> > -- slave-mode: a boolean property indicating that the link is run in slave mode.
> > -  The default when this property is not specified is master mode. In the slave
> > -  mode horizontal and vertical synchronization signals are provided to the
> > -  slave device (data source) by the master device (data sink). In the master
> > -  mode the data source device is also the source of the synchronization signals.
> > -- bus-type: data bus type. Possible values are:
> > -  1 - MIPI CSI-2 C-PHY
> > -  2 - MIPI CSI1
> > -  3 - CCP2
> > -  4 - MIPI CSI-2 D-PHY
> > -  5 - Parallel
> > -  6 - Bt.656
> > -- bus-width: number of data lines actively used, valid for the parallel busses.
> > -- data-shift: on the parallel data busses, if bus-width is used to specify the
> > -  number of data lines, data-shift can be used to specify which data lines are
> > -  used, e.g. "bus-width=<8>; data-shift=<2>;" means, that lines 9:2 are used.
> > -- hsync-active: active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
> > -- vsync-active: active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.
> > -  Note, that if HSYNC and VSYNC polarities are not specified, embedded
> > -  synchronization may be required, where supported.
> > -- data-active: similar to HSYNC and VSYNC, specifies data line polarity.
> > -- data-enable-active: similar to HSYNC and VSYNC, specifies the data enable
> > -  signal polarity.
> > -- field-even-active: field signal level during the even field data transmission.
> > -- pclk-sample: sample data on rising (1) or falling (0) edge of the pixel clock
> > -  signal.
> > -- sync-on-green-active: active state of Sync-on-green (SoG) signal, 0/1 for
> > -  LOW/HIGH respectively.
> > -- data-lanes: an array of physical data lane indexes. Position of an entry
> > -  determines the logical lane number, while the value of an entry indicates
> > -  physical lane, e.g. for 2-lane MIPI CSI-2 bus we could have
> > -  "data-lanes = <1 2>;", assuming the clock lane is on hardware lane 0.
> > -  If the hardware does not support lane reordering, monotonically
> > -  incremented values shall be used from 0 or 1 onwards, depending on
> > -  whether or not there is also a clock lane. This property is valid for
> > -  serial busses only (e.g. MIPI CSI-2).
> > -- clock-lanes: an array of physical clock lane indexes. Position of an entry
> > -  determines the logical lane number, while the value of an entry indicates
> > -  physical lane, e.g. for a MIPI CSI-2 bus we could have "clock-lanes = <0>;",
> > -  which places the clock lane on hardware lane 0. This property is valid for
> > -  serial busses only (e.g. MIPI CSI-2). Note that for the MIPI CSI-2 bus this
> > -  array contains only one entry.
> > -- clock-noncontinuous: a boolean property to allow MIPI CSI-2 non-continuous
> > -  clock mode.
> > -- link-frequencies: Allowed data bus frequencies. For MIPI CSI-2, for
> > -  instance, this is the actual frequency of the bus, not bits per clock per
> > -  lane value. An array of 64-bit unsigned integers.
> > -- lane-polarities: an array of polarities of the lanes starting from the clock
> > -  lane and followed by the data lanes in the same order as in data-lanes.
> > -  Valid values are 0 (normal) and 1 (inverted). The length of the array
> > -  should be the combined length of data-lanes and clock-lanes properties.
> > -  If the lane-polarities property is omitted, the value must be interpreted
> > -  as 0 (normal). This property is valid for serial busses only.
> > -- strobe: Whether the clock signal is used as clock (0) or strobe (1). Used
> > -  with CCP2, for instance.
> > -
> > -Example
> > --------
> > -
> > -The example snippet below describes two data pipelines.  ov772x and imx074 are
> > -camera sensors with a parallel and serial (MIPI CSI-2) video bus respectively.
> > -Both sensors are on the I2C control bus corresponding to the i2c0 controller
> > -node.  ov772x sensor is linked directly to the ceu0 video host interface.
> > -imx074 is linked to ceu0 through the MIPI CSI-2 receiver (csi2). ceu0 has a
> > -(single) DMA engine writing captured data to memory.  ceu0 node has a single
> > -'port' node which may indicate that at any time only one of the following data
> > -pipelines can be active: ov772x -> ceu0 or imx074 -> csi2 -> ceu0.
> > -
> > -	ceu0: ceu@fe910000 {
> > -		compatible = "renesas,sh-mobile-ceu";
> > -		reg = <0xfe910000 0xa0>;
> > -		interrupts = <0x880>;
> > -
> > -		mclk: master_clock {
> > -			compatible = "renesas,ceu-clock";
> > -			#clock-cells = <1>;
> > -			clock-frequency = <50000000>;	/* Max clock frequency */
> > -			clock-output-names = "mclk";
> > -		};
> > -
> > -		port {
> > -			#address-cells = <1>;
> > -			#size-cells = <0>;
> > -
> > -			/* Parallel bus endpoint */
> > -			ceu0_1: endpoint@1 {
> > -				reg = <1>;		/* Local endpoint # */
> > -				remote = <&ov772x_1_1>;	/* Remote phandle */
> > -				bus-width = <8>;	/* Used data lines */
> > -				data-shift = <2>;	/* Lines 9:2 are used */
> > -
> > -				/* If hsync-active/vsync-active are missing,
> > -				   embedded BT.656 sync is used */
> > -				hsync-active = <0>;	/* Active low */
> > -				vsync-active = <0>;	/* Active low */
> > -				data-active = <1>;	/* Active high */
> > -				pclk-sample = <1>;	/* Rising */
> > -			};
> > -
> > -			/* MIPI CSI-2 bus endpoint */
> > -			ceu0_0: endpoint@0 {
> > -				reg = <0>;
> > -				remote = <&csi2_2>;
> > -			};
> > -		};
> > -	};
> > -
> > -	i2c0: i2c@fff20000 {
> > -		...
> > -		ov772x_1: camera@21 {
> > -			compatible = "ovti,ov772x";
> > -			reg = <0x21>;
> > -			vddio-supply = <&regulator1>;
> > -			vddcore-supply = <&regulator2>;
> > -
> > -			clock-frequency = <20000000>;
> > -			clocks = <&mclk 0>;
> > -			clock-names = "xclk";
> > -
> > -			port {
> > -				/* With 1 endpoint per port no need for addresses. */
> > -				ov772x_1_1: endpoint {
> > -					bus-width = <8>;
> > -					remote-endpoint = <&ceu0_1>;
> > -					hsync-active = <1>;
> > -					vsync-active = <0>; /* Who came up with an
> > -							       inverter here ?... */
> > -					data-active = <1>;
> > -					pclk-sample = <1>;
> > -				};
> > -			};
> > -		};
> > -
> > -		imx074: camera@1a {
> > -			compatible = "sony,imx074";
> > -			reg = <0x1a>;
> > -			vddio-supply = <&regulator1>;
> > -			vddcore-supply = <&regulator2>;
> > -
> > -			clock-frequency = <30000000>;	/* Shared clock with ov772x_1 */
> > -			clocks = <&mclk 0>;
> > -			clock-names = "sysclk";		/* Assuming this is the
> > -							   name in the datasheet */
> > -			port {
> > -				imx074_1: endpoint {
> > -					clock-lanes = <0>;
> > -					data-lanes = <1 2>;
> > -					remote-endpoint = <&csi2_1>;
> > -				};
> > -			};
> > -		};
> > -	};
> > -
> > -	csi2: csi2@ffc90000 {
> > -		compatible = "renesas,sh-mobile-csi2";
> > -		reg = <0xffc90000 0x1000>;
> > -		interrupts = <0x17a0>;
> > -		#address-cells = <1>;
> > -		#size-cells = <0>;
> > -
> > -		port@1 {
> > -			compatible = "renesas,csi2c";	/* One of CSI2I and CSI2C. */
> > -			reg = <1>;			/* CSI-2 PHY #1 of 2: PHY_S,
> > -							   PHY_M has port address 0,
> > -							   is unused. */
> > -			csi2_1: endpoint {
> > -				clock-lanes = <0>;
> > -				data-lanes = <2 1>;
> > -				remote-endpoint = <&imx074_1>;
> > -			};
> > -		};
> > -		port@2 {
> > -			reg = <2>;			/* port 2: link to the CEU */
> > -
> > -			csi2_2: endpoint {
> > -				remote-endpoint = <&ceu0_0>;
> > -			};
> > -		};
> > -	};
> > +This file has moved to video-interfaces.yaml and video-interface-devices.yaml.
> > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.yaml b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > new file mode 100644
> > index 000000000000..7415a4df1576
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/video-interfaces.yaml
> > @@ -0,0 +1,344 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/video-interfaces.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Common bindings for video receiver and transmitter interface endpoints
> > +
> > +maintainers:
> > +  - Guennadi Liakhovetski <g.liakhovetski@gmx.de>
> > +  - Sakari Ailus <sakari.ailus@linux.intel.com>
> > +
> > +description: |
> > +  Video data pipelines usually consist of external devices, e.g. camera sensors,
> > +  controlled over an I2C, SPI or UART bus, and SoC internal IP blocks, including
> > +  video DMA engines and video data processors.
> > +
> > +  SoC internal blocks are described by DT nodes, placed similarly to other SoC
> > +  blocks.  External devices are represented as child nodes of their respective
> > +  bus controller nodes, e.g. I2C.
> > +
> > +  Data interfaces on all video devices are described by their child 'port' nodes.
> > +  Configuration of a port depends on other devices participating in the data
> > +  transfer and is described by 'endpoint' subnodes.
> > +
> > +  device {
> > +      ...
> > +      ports {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +
> > +          port@0 {
> > +              ...
> > +              endpoint@0 { ... };
> > +              endpoint@1 { ... };
> > +          };
> > +          port@1 { ... };
> > +      };
> > +  };
> > +
> > +  If a port can be configured to work with more than one remote device on the same
> > +  bus, an 'endpoint' child node must be provided for each of them.  If more than
> > +  one port is present in a device node or there is more than one endpoint at a
> > +  port, or port node needs to be associated with a selected hardware interface,
> > +  a common scheme using '#address-cells', '#size-cells' and 'reg' properties is
> > +  used.
> > +
> > +  All 'port' nodes can be grouped under optional 'ports' node, which allows to
> > +  specify #address-cells, #size-cells properties independently for the 'port'
> > +  and 'endpoint' nodes and any child device nodes a device might have.
> > +
> > +  Two 'endpoint' nodes are linked with each other through their 'remote-endpoint'
> > +  phandles.  An endpoint subnode of a device contains all properties needed for
> > +  configuration of this device for data exchange with other device.  In most
> > +  cases properties at the peer 'endpoint' nodes will be identical, however they
> > +  might need to be different when there is any signal modifications on the bus
> > +  between two devices, e.g. there are logic signal inverters on the lines.
> > +
> > +  It is allowed for multiple endpoints at a port to be active simultaneously,
> > +  where supported by a device.  For example, in case where a data interface of
> > +  a device is partitioned into multiple data busses, e.g. 16-bit input port
> > +  divided into two separate ITU-R BT.656 8-bit busses.  In such case bus-width
> > +  and data-shift properties can be used to assign physical data lines to each
> > +  endpoint node (logical bus).
> > +
> > +  Documenting bindings for devices
> > +  --------------------------------
> > +
> > +  All required and optional bindings the device supports shall be explicitly
> > +  documented in device DT binding documentation. This also includes port and
> > +  endpoint nodes for the device, including unit-addresses and reg properties
> > +  where relevant.
> > +
> > +  Please also see Documentation/devicetree/bindings/graph.txt .
> > +
> > +allOf:
> > +  - $ref: /schemas/graph.yaml#/$defs/endpoint-base
> > +
> > +properties:
> > +  slave-mode:
> > +    type: boolean
> > +    description:
> > +      Indicates that the link is run in slave mode. The default when this
> > +      property is not specified is master mode. In the slave mode horizontal and
> > +      vertical synchronization signals are provided to the slave device (data
> > +      source) by the master device (data sink). In the master mode the data
> > +      source device is also the source of the synchronization signals.
> > +
> > +  bus-type:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum:
> > +      - 1 # MIPI CSI-2 C-PHY
> > +      - 2 # MIPI CSI1
> > +      - 3 # CCP2
> > +      - 4 # MIPI CSI-2 D-PHY
> > +      - 5 # Parallel
> > +      - 6 # Bt.656
> > +    description:
> > +      Data bus type.
> > +
> > +  bus-width:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    maximum: 64
> > +    description:
> > +      Number of data lines actively used, valid for the parallel busses.
> > +
> > +  data-shift:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    maximum: 64
> > +    description:
> > +      On the parallel data busses, if bus-width is used to specify the number of
> > +      data lines, data-shift can be used to specify which data lines are used,
> > +      e.g. "bus-width=<8>; data-shift=<2>;" means, that lines 9:2 are used.
> > +
> > +  hsync-active:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 0, 1 ]
> > +    description:
> > +      Active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
> > +
> > +  vsync-active:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 0, 1 ]
> > +    description:
> > +      Active state of the VSYNC signal, 0/1 for LOW/HIGH respectively. Note,
> > +      that if HSYNC and VSYNC polarities are not specified, embedded
> > +      synchronization may be required, where supported.
> > +
> > +  data-active:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 0, 1 ]
> > +    description:
> > +      Similar to HSYNC and VSYNC, specifies data line polarity.
> > +
> > +  data-enable-active:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 0, 1 ]
> > +    description:
> > +      Similar to HSYNC and VSYNC, specifies the data enable signal polarity.
> > +
> > +  field-even-active:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 0, 1 ]
> > +    description:
> > +      Field signal level during the even field data transmission.
> > +
> > +  pclk-sample:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 0, 1 ]
> > +    description:
> > +      Sample data on rising (1) or falling (0) edge of the pixel clock signal.
> > +
> > +  sync-on-green-active:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 0, 1 ]
> > +    description:
> > +      Active state of Sync-on-green (SoG) signal, 0/1 for LOW/HIGH respectively.
> > +
> > +  data-lanes:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 1
> > +    maxItems: 4
> > +    items:
> > +      # Assume up to 4 data and 1 clock lane
> > +      maximum: 4
> > +    description:
> > +      An array of physical data lane indexes. Position of an entry determines
> > +      the logical lane number, while the value of an entry indicates physical
> > +      lane, e.g. for 2-lane MIPI CSI-2 bus we could have "data-lanes = <1 2>;",
> > +      assuming the clock lane is on hardware lane 0. If the hardware does not
> > +      support lane reordering, monotonically incremented values shall be used
> > +      from 0 or 1 onwards, depending on whether or not there is also a clock
> > +      lane. This property is valid for serial busses only (e.g. MIPI CSI-2).
> 
> This won't flag [1, 3] as wrong, right ?

Right. In theory you could have hardware that does this, right? You 
could pick and choose which lanes to use. 

> I guess the only alternative is the ugly:
> 
>             anyOf:
>               - items:
>                 - const: 1
>               - items:
>                 - const: 1
>                 - const: 2
>               - items:
>                 - const: 1
>                 - const: 2
>                 - const: 3
>               - items:
>                 - const: 1
>                 - const: 2
>                 - const: 3
>                 - const: 4
> 
> As we express "monotonically incremented" I think it's fine, even if
> validation won't catch it.
> 
> Also, sakari just pointed me to the just merged
> Documentation/devicetree/bindings/media/i2c/mipi-ccs.yaml:
> 
>           data-lanes:
>             minItems: 1
>             maxItems: 8
> 
> sakari, where does 8 come from ? Afaik D-PHY supports 4 differential
> data lanes, and C-PHY 3 'trios'

Okay, let me know what values to put here.

> > +  clock-lanes:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    # Assume up to 4 data and 1 clock lane
> > +    maximum: 4
> > +    description:
> > +      Physical clock lane index. Position of an entry determines
> > +      the logical lane number, while the value of an entry indicates physical
> > +      lane, e.g. for a MIPI CSI-2 bus we could have "clock-lanes = <0>;", which
> > +      places the clock lane on hardware lane 0. This property is valid for
> > +      serial busses only (e.g. MIPI CSI-2).
> > +
> > +  clock-noncontinuous:
> > +    type: boolean
> > +    description:
> > +      Allow MIPI CSI-2 non-continuous clock mode.
> > +
> > +  link-frequencies:
> > +    $ref: /schemas/types.yaml#/definitions/uint64-array
> > +    description:
> > +      Allowed data bus frequencies. For MIPI CSI-2, for instance, this is the
> > +      actual frequency of the bus, not bits per clock per lane value. An array
> > +      of 64-bit unsigned integers.
> > +
> > +  lane-polarities:
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    items:
> > +      enum: [ 0, 1 ]
> > +    description:
> > +      An array of polarities of the lanes starting from the clock lane and
> > +      followed by the data lanes in the same order as in data-lanes. Valid
> > +      values are 0 (normal) and 1 (inverted). The length of the array should be
> > +      the combined length of data-lanes and clock-lanes properties. If the
> > +      lane-polarities property is omitted, the value must be interpreted as 0
> > +      (normal). This property is valid for serial busses only.
> > +
> 
> Shouldn't this be an array of maximum 5 items (as we have 4 data lanes
> + 1 clock lane) and a maximum value per item of 1 ?

Yes.


> > +  strobe:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [ 0, 1 ]
> > +    description:
> > +      Whether the clock signal is used as clock (0) or strobe (1). Used with
> > +      CCP2, for instance.
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  # The example snippet below describes two data pipelines.  ov772x and imx074
> > +  # are camera sensors with a parallel and serial (MIPI CSI-2) video bus
> > +  # respectively. Both sensors are on the I2C control bus corresponding to the
> > +  # i2c0 controller node.  ov772x sensor is linked directly to the ceu0 video
> > +  # host interface. imx074 is linked to ceu0 through the MIPI CSI-2 receiver
> > +  # (csi2). ceu0 has a (single) DMA engine writing captured data to memory.
> > +  # ceu0 node has a single 'port' node which may indicate that at any time
> > +  # only one of the following data pipelines can be active:
> > +  # ov772x -> ceu0 or imx074 -> csi2 -> ceu0.
> > +  - |
> > +    ceu@fe910000 {
> > +        compatible = "renesas,sh-mobile-ceu";
> > +        reg = <0xfe910000 0xa0>;
> > +        interrupts = <0x880>;
> > +
> > +        mclk: master_clock {
> > +            compatible = "renesas,ceu-clock";
> > +            #clock-cells = <1>;
> > +            clock-frequency = <50000000>;  /* Max clock frequency */
> > +            clock-output-names = "mclk";
> > +        };
> > +
> > +        port {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            /* Parallel bus endpoint */
> > +            ceu0_1: endpoint@1 {
> > +                reg = <1>;    /* Local endpoint # */
> > +                remote-endpoint = <&ov772x_1_1>;  /* Remote phandle */
> > +                bus-width = <8>;  /* Used data lines */
> > +                data-shift = <2>;  /* Lines 9:2 are used */
> > +
> > +                /* If hsync-active/vsync-active are missing,
> > +                   embedded BT.656 sync is used */
> 
> I think we should use bus-type in example to encourage new bindings to
> use it and reduce the needs for autoguessing. But that's a change that
> should go on-top.
> 
> I would also make it mandatory, but this would break validation of
> older DTS.

I don't agree. IMO, it should only be specified if there's more than 1 
option. In any case, let's save that for another day.

Rob
