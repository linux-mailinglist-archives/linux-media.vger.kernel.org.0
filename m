Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB054838FA
	for <lists+linux-media@lfdr.de>; Tue,  4 Jan 2022 00:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbiACXHY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jan 2022 18:07:24 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:58930 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbiACXHX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Jan 2022 18:07:23 -0500
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A73A4501;
        Tue,  4 Jan 2022 00:07:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641251242;
        bh=dmHr7ISNUEr1ZbclFSX6fjtsqBUcAGvUwRN+APVH3ek=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BAMVP38SQs6Kv4ka0ApxqxeU5rlMHxCQU2A6V96I+wnYEqAEwVqJs9jwxu5hsLTKo
         cih5YQ4+DkYKTwc+HPgnzBSwB0kcVgw7+5shSNpP0h2gBCmFBl42yAAfT52c3zlWFb
         w7YaxqXI9NnV6usucPdygyLkP1174yYB5UxANlQo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YdNoWZ/HddvBhJ4T@karbon.k.g>
References: <20220103110922.715065-1-petko.manolov@konsulko.com> <164121596292.3986460.16005535544209529901@Monstersaurus> <YdNoWZ/HddvBhJ4T@karbon.k.g>
Subject: Re: [PATCH v2 0/5] adds ovm6211 driver to staging
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@iki.fi
To:     Petko Manolov <petko.manolov@konsulko.com>
Date:   Mon, 03 Jan 2022 23:07:19 +0000
Message-ID: <164125123951.210256.14072824027054976116@Monstersaurus>
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Petko Manolov (2022-01-03 21:19:21)
> On 22-01-03 13:19:22, Kieran Bingham wrote:
> > Hi Petko,
> >=20
> > Quoting Petko Manolov (2022-01-03 11:09:17)
> > > v2: Removes an unused function (ovm6211_set_pix_clk) and this patch s=
eries is
> > > now based on media/master; Didn't receive any comments about the RFC =
version,
> > > thus i assume everything is perfect... :P
> >=20
> > Did you see
> > https://lore.kernel.org/linux-media/Ya9XHiz%2FPm4CjQ13@valkosipuli.reti=
isi.eu/?
> >=20
> > Sakari provided quite a few review comments to consider.
>=20
> Nope, somehow his message has slipped from my attention.  I'd like to tha=
nk
> Sakari for the thorough review.  This is my first v4l2 driver and i have =
most
> likely made a lot of mistakes.  I'll address all his comments in v3 of the
> series along with some elaboration on my part.
>=20
> > I don't think we need to add new sensor drivers to the staging director=
y which
> > would simplify your series quite a bit, and Sakari also stated the ovm6=
211
> > KConfig and Makefile entry should be in the patch along with the new dr=
iver
> > code (not in staging).
>=20
> This is the exact opposite to what i've done for the netdev tree, where e=
ach
> change should be in a separate patch.  Anyway, i'll follow the media tree=
 rules.
>=20
> > So you would need to refactor this series to a single patch adding the =
driver
> > do drivers/media/i2c/, and a second patch which adds the DT-bindings
> > accordingly.
>=20
> I am not sure about how practical the DT will be in this case.  The senso=
r was
> used on a custom board and a rather specific reset pin wiring.  I've trie=
d to
> remove this logic from the driver, but it is still reflected in the DT th=
at
> we've been using so far.  I've got to think about this one some more...

That's why the bindings are different from the DT itself. The specifics
of how you connect it up belong to your device tree, but the bindings
are there to state how you describe the hardware.

Think of the bindings as the documentation part for how someone would
write the device-tree nodes for your sensor driver to use it on their
custom platform.

It should be something like:=20
  Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
for example.

As I understand it, any driver which adds a .compatible string must
provide bindings.

--
Kieran
