Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92C407DD5C7
	for <lists+linux-media@lfdr.de>; Tue, 31 Oct 2023 19:07:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344776AbjJaSHQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 31 Oct 2023 14:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230479AbjJaSHP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 31 Oct 2023 14:07:15 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98602A2
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 11:07:12 -0700 (PDT)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4EDED3D6;
        Tue, 31 Oct 2023 19:06:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698775612;
        bh=Ocozmijv1EGZ+TEez+xhyokFa3rIrYwN7NKwCLAB9zs=;
        h=In-Reply-To:References:Subject:From:To:Date:From;
        b=r0XQraMHyjX0hYEdKO3FEtzxGVqhpl+/GG23JcUxGvsGKl36+YjA85pB//T4XRkTw
         6WWAtSiu2BSBFWC+IZr2wi8omORD9iDMH0xBTBh4uSO5hNMFkTakdzmuDSXu/B9S7f
         ET80xMeTU1uKXkDfM1zWDgGTPmNAxjOmXofBtU4k=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1d3f2440-6572-4311-893e-952562e51e30@redhat.com>
References: <20231030173637.GA2977515@gnbcxd0016.gnb.st.com> <962d6d0c-2263-fe59-011c-09068a6a4cef@redhat.com> <20231031170530.GA2989927@gnbcxd0016.gnb.st.com> <1d3f2440-6572-4311-893e-952562e51e30@redhat.com>
Subject: Re: [RFC] regmap_range_cfg usage with v4l2-cci
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sre@kernel.org>, linux-media@vger.kernel.org
Date:   Tue, 31 Oct 2023 18:07:05 +0000
Message-ID: <169877562554.1476798.3907804152294865485@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Hans de Goede (2023-10-31 17:26:58)
> Hi,
>=20
> On 10/31/23 18:05, Alain Volmat wrote:
> > Hi Hans,
> >=20
> > On Tue, Oct 31, 2023 at 10:53:16AM +0100, Hans de Goede wrote:
> >> <resend with Alain added to the To: for some reason reply-to-all did n=
ot add Alain>
> >=20
> > No pb, I also received it via the mailing-list ;-)
> >=20
> >>
> >> Hi Alain,
> >>
> >> On 10/30/23 18:36, Alain Volmat wrote:
> >>> Hi,
> >>>
> >>> Goal of this email is to get first comments prior to posting a patch.
> >>>
> >>> Could we consider enhancements within the v4l2-cci in order to also
> >>> allow regmap_range_cfg usage for paged register access ?
> >>
> >> Yes definitely.
> >>
> >> Extending v4l2-cci for other use cases was already briefly discussed
> >> between Kieran (Cc-ed) and me:
> >>
> >> The CCI part of the MIPI CSI spec says that multi-byte registers are
> >> always in big endian format, but some of the Sony IMX sensors actually
> >> use little-endian format for multi-byte registers.
> >>
> >> The main reason why we need v4l2-cci and cannot use regmap directly is
> >> because of the variable register width in CCI, where as regmap only
> >> supports a single width. v4l2 cci uses 8 bits width in the underlying
> >> regmap-config and then takes care of multy-byte registers by e.g.
> >> reading multiple bytes and calling e.g. get_unaligned_be16() on
> >> the read bytes.
> >>
> >> For the IMX scenario the plan is to add the notion of v4l2-cci
> >> flags by adding this to include/media/v4l2-cci.h :
> >>
> >> struct v4l2_cci {
> >>      struct regmap *map;
> >>      long flags;
> >> }
> >>
> >> And then change the prototype for devm_cci_regmap_init_i2c() to:
> >>
> >> struct v4l2_cci *devm_cci_regmap_init_i2c(struct i2c_client *client,
> >>                                           int reg_addr_bits, long flag=
s);
> >>
> >> And have devm_cci_regmap_init_i2c():
> >> 1. devm_kmalloc() a struct v4l2_cci
> >> 2. store the regmap there
> >> 3. copy over flags from the function argument
> >>
> >> Combined with modifying all the other functions to take
> >> "struct v4l2_cci *cci" as first argument instead of
> >> "struct regmap *map".
> >>
> >> This change will require all existing sensor drivers using
> >> v4l2-cci to be converted for the "struct regmap *map" ->
> >> "struct v4l2_cci *cci" change, this all needs to be done
> >> in one single commit adding the new struct + flags argument
> >> to avoid breaking the compilation.
> >>
> >> Then once we have this a second patch can add:
> >>
> >> /* devm_cci_regmap_init_i2c() flags argument defines */
> >> #define V4L2_CCI_DATA_LE     BIT(0)
> >>
> >> to include/media/v4l2-cci.h and make v4l2-cci.h honor
> >> this flag solving the IMX scenario.
> >=20
> > I understand that in case of IMX sensors, ALL the multi-registers
> > value are encoded in little-endian right ?
>=20
> Yes I believe so, Laurent, Kieran ?

I'm not 100% sure here, I think there are some IMX sensors with Little
Endian - and some with Big Endian ... because all the same would be too
easy.

I haven't seen a single device with mixed big and little endian yet
though.


> > In case of the GalaxyCore
> > GC2145, most of the registers (page 0 / 1 and 2) are correctly
> > encoded in big-endian, however page 3 (MIPI configuration) are
> > 2 or 3 registers in little-endian.  So far maybe this is minor
> > case, but the approach of having the endianness part of the v4l2_cci
> > struct wouldn't allow to address such case ?
> >=20
> > Originally I thought we could have CCI_REG macros for little endian
> > as well, such as CCI_REG16_LE etc etc since we anyway still have spare
> > space I guess on top of the width part.  Drawback is that in drivers
> > for IMX we would end-up with longer macros CCI_REG16_LE(...) instead
> > of CCI_REG16(...).
>=20
> Hmm, that (CCI_REG16_LE etc) is an interesting proposal, that
> would avoid the need to add a struct with flags and if I understand
> things correctly then you would also not need any extra data
> on top of the regmap, right ?
>=20
> I did not take the mixed endian case for data registers into
> account yet. Since that apparently is a thing I think that
> your CCI_REG16_LE etc proposal is better then adding a struct
> with flags.
>=20
> Laurent, Kieran what do you think ?

Especially given there are some devices with multiple encodings, I like
this.

I think it can simplify things if we don't need a separate=20
struct v4l2_cci allocated too.


> > Or maybe as you proposed we can have the "default" encoding described
> > in the flags variable and have a CCI_REG16_REV or any other naming
> > just to indicate that for THAT precise register the endianess is not
> > the default one.
>=20
> If we are going to deal with mixed endianess with a flag encoded
> in the high bits of the register then I greatly favor just
> putting the encoding in the high bits and not having
> a default endianness + a flag for reverse endianess, that
> just feels wrong and the code to implement this will also
> be less then ideal.
>=20
> > Are you aware of other sensors having "mixed" endianness registers ?
>=20
> Nope this is all new to me.=20

I haven't seen any others yet - but I haven't been looking out for them
yet either. Most of the time all the writes are done as 8-bit writes
from tables. ... so this is all coming up new in a lot of cases I think.

--
Kieran
