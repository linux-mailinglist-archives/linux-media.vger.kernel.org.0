Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEDEA651D1E
	for <lists+linux-media@lfdr.de>; Tue, 20 Dec 2022 10:20:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232896AbiLTJUe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Dec 2022 04:20:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbiLTJUc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Dec 2022 04:20:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7683F9FE3;
        Tue, 20 Dec 2022 01:20:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 070B06111C;
        Tue, 20 Dec 2022 09:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEECAC433EF;
        Tue, 20 Dec 2022 09:20:28 +0000 (UTC)
Message-ID: <b503589a-7b82-3335-8ea3-598d467f5d40@xs4all.nl>
Date:   Tue, 20 Dec 2022 10:20:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 7/7] drm: rcar-du: Add new formats (2-10-10-10 ARGB,
 Y210)
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Sakari Ailus <sakari.ailus@iki.fi>
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221219140139.294245-8-tomi.valkeinen+renesas@ideasonboard.com>
 <Y6Db2C+JehUPYSQp@pendragon.ideasonboard.com>
 <2f252958-1bb1-006a-b450-1315be8a3c9f@xs4all.nl>
 <CAMuHMdXd7Q1WWdo-rwfad1-BwuuH5vxt9Kx2Zv2Ok2rQLvh_wA@mail.gmail.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAMuHMdXd7Q1WWdo-rwfad1-BwuuH5vxt9Kx2Zv2Ok2rQLvh_wA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/12/2022 10:09, Geert Uytterhoeven wrote:
> Hi Hans,
> 
> On Tue, Dec 20, 2022 at 10:01 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>> On 19/12/2022 22:47, Laurent Pinchart wrote:
>>> (CC'ing Sakari and Hans)
>>>
>>> Thank you for the patch.
>>>
>>> On Mon, Dec 19, 2022 at 04:01:39PM +0200, Tomi Valkeinen wrote:
>>>> Add new pixel formats: RGBX1010102, RGBA1010102, ARGB2101010 and Y210.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>> ---
>>>>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 24 +++++++++++++
>>>>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 49 +++++++++++++++++++++++++--
>>>>  2 files changed, 71 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>>>> index 8c2719efda2a..8ccabf5a30c4 100644
>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>>>> @@ -259,6 +259,24 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
>>>>              .bpp = 32,
>>>>              .planes = 1,
>>>>              .hsub = 1,
>>>> +    }, {
>>>> +            .fourcc = DRM_FORMAT_RGBX1010102,
>>>
>>> Ah, here the format makes sense.
>>>
>>>> +            .v4l2 = V4L2_PIX_FMT_XBGR2101010,
>>>
>>> But this is horrible :-( Could we use the same names as DRM for new
>>> formats, when there is no conflict with existing V4L2 formats ?
>>>
>>> Sakari, Hans, what do you think ? Please see patch 1/7 in the series for
>>> the format definitions.
>>
>> V4L2 describes pixel formats based on how they appear in memory from the
>> lowest to highest memory address.
> 
> So that means big endian?

Yes.

> 
>> If I am not mistaken, DRM uses the CPU order. So that explains the difference
>> in naming. I don't think we should hide that difference. And V4L2 has been
>> quite consistent in following memory ordering in the naming (except possibly
>> for some of the really old pixelformats).
> 
> DRM uses little endian.

So not CPU order, but always little endian order? I.e., on a big endian system
a given DRM_FORMAT_ would have the same memory layout as on a little endian
system?

Regards,

	Hans

> 
>> Departing from that would be more of a hindrance than a help, IMHO.
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

