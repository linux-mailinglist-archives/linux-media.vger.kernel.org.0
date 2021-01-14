Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5C82F5C35
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 09:12:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727745AbhANIJz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 03:09:55 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:53295 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727721AbhANIJy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 03:09:54 -0500
X-Originating-IP: 93.61.96.190
Received: from uno.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 9F3A2C0025;
        Thu, 14 Jan 2021 08:09:09 +0000 (UTC)
Date:   Thu, 14 Jan 2021 09:09:27 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        kieran.bingham+renesas@ideasonboard.com,
        laurent.pinchart+renesas@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se, geert@linux-m68k.org,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hyun Kwon <hyunk@xilinx.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sergei.shtylyov@gmail.com
Subject: Re: [PATCH v6 5/5] media: i2c: max9286: Configure reverse channel
 amplitude
Message-ID: <20210114080927.idz5v472ex25p5r4@uno.localdomain>
References: <20201215170957.92761-1-jacopo+renesas@jmondi.org>
 <20201215170957.92761-6-jacopo+renesas@jmondi.org>
 <X9pCSfxE722rnPHE@pendragon.ideasonboard.com>
 <20210111104311.e6nyxhzhvlyjjxxw@uno.localdomain>
 <X/wvc26LXz2VsCkp@pendragon.ideasonboard.com>
 <20210111112023.brrhxgfedo5fer53@uno.localdomain>
 <X/0triYZZJiXaf07@pendragon.ideasonboard.com>
 <20210112090805.myglp2lpozo3blq5@uno.localdomain>
 <X//cYHkyELaH4XHb@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <X//cYHkyELaH4XHb@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On Thu, Jan 14, 2021 at 07:53:36AM +0200, Laurent Pinchart wrote:
> Hi Jacopo,
>
> >
> > All in all:
> > - yes, I think there might be a need to control the noise immunity
> >   settings after initialization
> > - I think it should be done on the serializer side, possibly with a DT
> >   property, possibly something like a boolean 'maxim,high-threshold-enable'
> > - the deserializer can query that information with a kAPI like
> >   get_mbus_config() after the remote has probed
> > - Because of that there is no need for an additional deserializer property
> >
> > Hope this makes sense
>
> Now I get what you meant. Sorry for missing the point.
>
> While it would be technically feasible to query the property from the
> serializer at runtime, there's the additional issue that the
> deserializer has a single reverse channel amplitude setting for all the
> channels. We would need to ensure that the property is set to the same
> value in all camera DT nodes. Wouldn't it be best to then set it once
> only, in the deserializer node ?
>

To be honest I wouldn't mind a run-time error, or a fallback like "the
first one to probe is the authoritative one, the rest have to follow".
And don't forget we would need a serializer property anyway to tell
the chip if it has to enable its noise immunity threshold or not.

But anyway, the here introduced new property already requires
knwoledge on the deserializer about which camera is connected on the
other side. It's not so bad, as if cameras are described in a .dtsi or
.dtbo the deserializer property can be overridden. We can do the same
for an additional property.

ie. a deserializer-serializer 'maxim,high-threshold-enable' property

RDACM20: pre-programmed high threshold enable

-------------- rdacm20.dtsi -------------------
&gmsl {
        maxim,reverse-channel-microvolt = <170000>;

        i2c-mux {
                i2c@0 {
                        camera@51 {
                                ....

                        }

                }

        }
};
-------------------------------------------------

RDACM21: no pre-programmed high-threshold, high threshold enabled
after camera probe

-------------- rdacm21.dtsi -------------------
&gmsl {
        maxim,reverse-channel-microvolt = <100000>;
        maxim,high-threshold-enable;

        i2c-mux {
                i2c@0 {
                        camera@51 {
                                maxim,high-threshold-enable;
                                ....

                        }

                }

        }
};
-------------------------------------------------

RDACM21: no high-threshold enabled at all

-------------- rdacm21.dtsi -------------------
&gmsl {
        maxim,reverse-channel-microvolt = <100000>;

        i2c-mux {
                i2c@0 {
                        camera@51 {
                                ....

                        }

                }

        }
};
-------------------------------------------------

For the serializer it's a boolean, for the deser we might need to
specify a voltage, so it might become an uint32
'maxim,high-threshold-microvolt' there.

-------------- rdacm21.dtsi -------------------
&gmsl {
        maxim,reverse-channel-microvolt = <100000>;
        maxim,high-threshold-microvolt = <170000>;

        i2c-mux {
                i2c@0 {
                        camera@51 {
                                maxim,high-threshold-enable;
                                ....

                        }

                }

        }
};
-------------------------------------------------

> --
> Regards,
>
> Laurent Pinchart
