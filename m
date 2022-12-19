Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A58B650CD2
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 14:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbiLSNt4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 08:49:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231515AbiLSNtx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 08:49:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10E465E5;
        Mon, 19 Dec 2022 05:49:52 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 530F3825;
        Mon, 19 Dec 2022 14:49:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671457791;
        bh=bs4Jq4jA6Yl7yQf9XjEEFntSKvqBgZhuzWvPyqJ+/q8=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=QO8ZmKOa5axsP/27qXe7ftd5vdBZMHZ9RXkijypcu/m2m1/FeqYhDyOhRAasHoP+3
         g2klrvB/KXQv8NCF9dGN087JMQvZOMp1nviBvfssHPDEvhfpF+8VHIlvEhJq2odtKj
         emaj5JqheromatffVybx/IYonzDKFi85F8L7G42I=
Message-ID: <dbcaa576-27d4-c555-87e3-cd3c9cfb72a7@ideasonboard.com>
Date:   Mon, 19 Dec 2022 15:49:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 5/7] media: renesas: vsp1: Add new formats (2-10-10-10
 ARGB, Y210)
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20221206133954.397098-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221206133954.397098-6-tomi.valkeinen+renesas@ideasonboard.com>
 <CAMuHMdWVXCy_CEjv2c_ke6x+HNfndNci1c3m1Tn5ROy_mvNhmw@mail.gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <CAMuHMdWVXCy_CEjv2c_ke6x+HNfndNci1c3m1Tn5ROy_mvNhmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/12/2022 16:38, Geert Uytterhoeven wrote:
> Hi Tomi,
> 
> On Tue, Dec 6, 2022 at 2:44 PM Tomi Valkeinen
> <tomi.valkeinen+renesas@ideasonboard.com> wrote:
>> Add new pixel formats: XBGR2101010, ABGR2101010, BGRA1010102 and Y210.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
>> @@ -109,6 +109,56 @@ static void rpf_configure_stream(struct vsp1_entity *entity,
>>          vsp1_rpf_write(rpf, dlb, VI6_RPF_INFMT, infmt);
>>          vsp1_rpf_write(rpf, dlb, VI6_RPF_DSWAP, fmtinfo->swap);
>>
>> +       if ((entity->vsp1->version & VI6_IP_VERSION_MODEL_MASK) == VI6_IP_VERSION_MODEL_VSPD_GEN4) {
>> +               u32 ext_infmt0;
>> +               u32 ext_infmt1;
>> +               u32 ext_infmt2;
>> +
>> +               switch (fmtinfo->fourcc) {
>> +               case V4L2_PIX_FMT_XBGR2101010:
>> +                       ext_infmt0 = VI6_RPF_EXT_INFMT0_BYPP_M1_RGB10;
>> +                       ext_infmt1 = (0 << 24)  | (10 << 16) |
>> +                                    (20 << 8)  | (30 << 0);
> 
> Introducing PACK_CPOS(a, b, c, d)...
> 
>> +                       ext_infmt2 = (10 << 24) | (10 << 16) |
>> +                                    (10 << 8)  | (0 << 0);
> 
> ... and PACK_CLEN(a, b, c, d) macros (or a single PACK4() macro)
> can make this less error-prone.

Thanks. It does, and I found an error in V4L2_PIX_FMT_BGRA1010102 =).

  Tomi

