Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F1E168EA19
	for <lists+linux-media@lfdr.de>; Wed,  8 Feb 2023 09:42:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbjBHImp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Feb 2023 03:42:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjBHImo (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Feb 2023 03:42:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18E8A11163
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 00:42:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BECF5B81C6C
        for <linux-media@vger.kernel.org>; Wed,  8 Feb 2023 08:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1AACC433EF;
        Wed,  8 Feb 2023 08:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675845760;
        bh=u0CL2VmqHTJEUIYsStGnX6dWGDWJiwVSKCmNmilbv8o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=f+q7RV9ULFnVAJB0ZdQRI7TZCol7Q9nAC4E9cv6WpnqG6Z/OLgerNPqfQhmewLT5x
         nsGOS664xR57NZgdK9jWeo+EqyZBnn3tNNBj6m/7E8xkxtDlclzWrIgnwnr5aWK3hu
         l6h1DTlTDxaAHgLGN6AmdVPajSzhBiZKV2HQCbNUoRAGCpbp6ibon3pLtSYE+RGVFy
         IbLcOR5e09+0QlomJeBFIhEx9fgHNW/OfobPzDEDIUCce2rMuFNf27xLD8HTY02PRV
         IPd4dOv3Xxghe6vLgh9oE2dDjBy+e1bU+k+6suyH8nqSA8XyuE3P0GYLHlm8PDrRRq
         WQN4Y16d+TFKA==
Date:   Wed, 8 Feb 2023 09:42:35 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Soeren Moch <smoch@web.de>,
        Stefan Herdler <herdler@nurfuerspam.de>,
        linux-media@vger.kernel.org, Manu Abraham <abraham.manu@gmail.com>,
        Tomasz Maciej Nowak <tmn505@gmail.com>,
        Corinna Vinschen <vinschen@redhat.com>
Subject: Re: Future of the SAA7146 drivers
Message-ID: <20230208094235.42cbd2fc@coco.lan>
In-Reply-To: <cd679afe-765b-4da7-56bf-a1cf995f815c@xs4all.nl>
References: <c78a2740-1b80-2ea2-dc5c-4ead440ff9ed@nurfuerspam.de>
        <c093e775-e863-f886-e819-e8a929775a89@xs4all.nl>
        <a24d4645-ac78-9990-92c3-7c04282f190e@nurfuerspam.de>
        <20ceeb7f-336a-b51c-8cc8-128cc9ebcd2e@xs4all.nl>
        <014db0ee-55fe-2966-a531-b8c23e97b402@web.de>
        <d9197b80-335c-ee70-eccc-ad04c026cbc9@xs4all.nl>
        <e7ee8b9f-eb4b-de7a-7cf8-fb385b2cdec2@web.de>
        <cd679afe-765b-4da7-56bf-a1cf995f815c@xs4all.nl>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed, 1 Feb 2023 17:37:12 +0100
Hans Verkuil <hverkuil-cisco@xs4all.nl> escreveu:

> On 01/02/2023 16:20, Soeren Moch wrote:
> >=20
> >=20
> > On 01.02.23 14:51, Hans Verkuil wrote: =20
> >> Hi S=C3=B6ren,
> >>
> >> On 01/02/2023 12:35, Soeren Moch wrote:
> >>
> >> <snip>
> >> =20
> >>>>>> Obviously, if someone wants to do the vb2 conversion, then that wo=
uld be
> >>>>>> perfect. I was looking at removing analog video support, and that =
doesn't
> >>>>>> look as easy as I thought it would be.
> >>>>>> =20
> >>> I only own full-featured (Nexus) cards, modified to also support a mo=
de
> >>> of operation like budget cards. In full-featured cards there is a
> >>> possibility to re-read the decoded video output signal back, which co=
uld
> >>> be similar to how analog cards work. But I never had access to
> >>> analog/hybrid saa7146 cards, so I'm not sure I can test this mode. I
> >>> also don't know anybody with such card who could help testing.
> >>> I personally do not care much about analog card support in the driver,
> >>> but will at least check which part of analog functionality is used in
> >>> full-featured cards. Maybe the support for analog/hybrid cards and so=
me
> >>> test coverage comes for free with full support for full-featured card=
s. =20
> >> It's the analog video streaming that uses vb2, so being able to test t=
hat
> >> is critical.
> >>
> >> So I decided to do this differently:
> >>
> >> 1) I'll revert the move of saa7146 to staging, it will go back to
> >> =C2=A0=C2=A0=C2=A0 mainline. av7110 stays in staging for now (that mig=
ht change, I
> >> =C2=A0=C2=A0=C2=A0 just don't want to make more changes than strictly =
necessary). =20
> > Hm, you wrote earlier, all this staging is about vb2 conversion.
> > There is no videobuf in av7110. Why this part needs to stay in staging?
> >=20
> > How can I help here? =20
>=20
> Right, there are two different issues here: av7110 in staging (and I wasn=
't
> aware that these boards have no analog support) and the removal of the ol=
d videobuf.
>=20
> I have not really been involved in the move of av7110 to staging, but
> given the fact that it is still used, I think it would make sense to just
> make the 'problematic' part of the API an av7110 driver-specific API, and
> then it can be moved back.

Heh, if I'm not mistaken, you were the one who wrote the patc moving it
to staging ;-)

The av7110 is in staging for two reasons:
- It is the only in-kernel driver that (partially) uses the=20
  full-featured DVB API;
- Several IOCTLs used there are deprecated. See, for instance,
  AUDIO_BILINGUAL_CHANNEL_SELECT documentation:

	" This ioctl is obsolete. Do not use in new drivers. It has been replaced
	  by the V4L2 ``V4L2_CID_MPEG_AUDIO_DEC_MULTILINGUAL_PLAYBACK`` control
	  for MPEG decoders controlled through V4L2. "

- the full-featured DVB API were never fully/properly documented. We did an
  effort to document what it was possible, but there are still documentation
  gaps.
- there are some parts of the full-featured API that aren't used on av7110,
  which makes hard to have them documented. I guess those bits are used only
  on some DVB settop boxes.
- there's a goal to use MC and V4L2 API for several of the features there.
  However, as this didn't actually happen, I guess we can consider such
  API as av7110-specific API when the time comes to move it from staging.

Now, before moving av7110 out of staging, the API should be clearly
documented (and/or the unused parts of the API should be removed).

So, for now, I'm ok to move saa7146 out of "deprecated" part, but
we should keep av7110 in staging (and all parts of saa7146 that
may depend on av7110) while we don't fix the API documentation.

Thanks,
Mauro
