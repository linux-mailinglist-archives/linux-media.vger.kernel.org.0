Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E152C7DE140
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 14:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343647AbjKAMli (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 08:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235151AbjKAMlh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 08:41:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B20DE4
        for <linux-media@vger.kernel.org>; Wed,  1 Nov 2023 05:41:28 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 13C6A8D;
        Wed,  1 Nov 2023 13:41:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1698842470;
        bh=3sKhmu2b0/Eyr9sY4M7BTzXnYLZ/OxDCyp1zoa4D13o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kiulq7DxYyWlWX9ioPKddlToydZ/g8hopYj6dVoJIkOKTHNuDSl5gVhXQgcLG8kiT
         MoCUZ6chf65r08DbSEU9G/q8ZN+XoEnnAUJ33gmcKwjAH4SUqodkmiMyXA60sdh7oi
         7rYvyoH1VXZJNtLjXOoooQVLG9PvBFxOmMguk3Ls=
Date:   Wed, 1 Nov 2023 14:41:33 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-media@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
        "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
Subject: Re: [RFC] regmap_range_cfg usage with v4l2-cci
Message-ID: <20231101124133.GK12764@pendragon.ideasonboard.com>
References: <20231030173637.GA2977515@gnbcxd0016.gnb.st.com>
 <962d6d0c-2263-fe59-011c-09068a6a4cef@redhat.com>
 <20231031170530.GA2989927@gnbcxd0016.gnb.st.com>
 <1d3f2440-6572-4311-893e-952562e51e30@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1d3f2440-6572-4311-893e-952562e51e30@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Tue, Oct 31, 2023 at 06:26:58PM +0100, Hans de Goede wrote:
> On 10/31/23 18:05, Alain Volmat wrote:
> > On Tue, Oct 31, 2023 at 10:53:16AM +0100, Hans de Goede wrote:
> >> <resend with Alain added to the To: for some reason reply-to-all did not add Alain>
> > 
> > No pb, I also received it via the mailing-list ;-)
> > 
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
> >> 	struct regmap *map;
> >> 	long flags;
> >> }
> >>
> >> And then change the prototype for devm_cci_regmap_init_i2c() to:
> >>
> >> struct v4l2_cci *devm_cci_regmap_init_i2c(struct i2c_client *client,
> >>                                           int reg_addr_bits, long flags);
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
> >> #define V4L2_CCI_DATA_LE	BIT(0)
> >>
> >> to include/media/v4l2-cci.h and make v4l2-cci.h honor
> >> this flag solving the IMX scenario.
> > 
> > I understand that in case of IMX sensors, ALL the multi-registers
> > value are encoded in little-endian right ?
> 
> Yes I believe so, Laurent, Kieran ?
> 
> > In case of the GalaxyCore
> > GC2145, most of the registers (page 0 / 1 and 2) are correctly
> > encoded in big-endian, however page 3 (MIPI configuration) are
> > 2 or 3 registers in little-endian.  So far maybe this is minor
> > case, but the approach of having the endianness part of the v4l2_cci
> > struct wouldn't allow to address such case ?
> > 
> > Originally I thought we could have CCI_REG macros for little endian
> > as well, such as CCI_REG16_LE etc etc since we anyway still have spare
> > space I guess on top of the width part.  Drawback is that in drivers
> > for IMX we would end-up with longer macros CCI_REG16_LE(...) instead
> > of CCI_REG16(...).
> 
> Hmm, that (CCI_REG16_LE etc) is an interesting proposal, that
> would avoid the need to add a struct with flags and if I understand
> things correctly then you would also not need any extra data
> on top of the regmap, right ?
> 
> I did not take the mixed endian case for data registers into
> account yet. Since that apparently is a thing I think that
> your CCI_REG16_LE etc proposal is better then adding a struct
> with flags.
> 
> Laurent, Kieran what do you think ?
> 
> > Or maybe as you proposed we can have the "default" encoding described
> > in the flags variable and have a CCI_REG16_REV or any other naming
> > just to indicate that for THAT precise register the endianess is not
> > the default one.
> 
> If we are going to deal with mixed endianess with a flag encoded
> in the high bits of the register then I greatly favor just
> putting the encoding in the high bits and not having
> a default endianness + a flag for reverse endianess, that
> just feels wrong and the code to implement this will also
> be less then ideal.

I'm in two minds about that. It's annoying to have to mark every single
register with _LE, but at the same time, these are CCI helpers, so
making life more difficult for LE sensors could be considered
reasonable. Except, of course, that it will make life more difficult for
us, not for the sensor vendors. We need a way to share the pain, but
that's another discussion.

We could also consider that the few GC2145 registers that use a
different endianness should be handled as 8-bit registers by CCI, and
managed by the gc2145 driver. If this situation is very rare, it may not
be worth it trying to handle it in v4l2-cci if it makes life more
complicated for everybody.

> > Are you aware of other sensors having "mixed" endianness registers ?
> 
> Nope this is all new to me. 

-- 
Regards,

Laurent Pinchart
