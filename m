Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4795F12FFCD
	for <lists+linux-media@lfdr.de>; Sat,  4 Jan 2020 01:55:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727082AbgADAzy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jan 2020 19:55:54 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:54861 "EHLO
        wout2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726911AbgADAzy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Jan 2020 19:55:54 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id E9C48444;
        Fri,  3 Jan 2020 19:55:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Fri, 03 Jan 2020 19:55:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arewethere.net;
         h=date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=EmnK41g4MkjOOXmh8d31100+0UA
        TejWaLhjsuDlBS4E=; b=oSPDs8+Ug2CSPR791DLdyI9oB/WNy3DdO6mABv4h1MC
        zVEDDbH1wMisHxXothfOPvpO3HbLoT3zGRry5dRiWviqhlxDQ+L2urkb+iTDQpWd
        ItE/MCEx8zcMdwPDaKPVXhX37QXEQf3wqOhAPXbHDFGgzhXhzMQgwQp4wDat56SK
        sHA2624XoE9k+kVrY0rAmP890cIs5MVGGBUfF0U/TUvWQv5TxfoQf7km9DUOc/Jv
        EajG8WFy8ppZX7oCaCbDcAgpNeZo8MhoNPqTykWUsE94jr/H8+h5w42LeQhEgO8n
        6W2Dwmm5oeaRzY46whowstBlerJ4CFEFnH7vpAJO+rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=EmnK41
        g4MkjOOXmh8d31100+0UATejWaLhjsuDlBS4E=; b=o8LGqylcwgmCHSGidnfGnL
        LiM0N9gf1SxHE3JsleFQipuoofSUN4SbA8J7lIFea22U+4EF3NLnzMHz2O3D/IIB
        SG4Cp9CSLVEULIb5+dbgMbbgMZlkZAn1z83982DLCXy1f6KcwQi692CBqT0md6Re
        E8dQgC4IsJemvz7AtFthvyEEQAeOBt62b7rUVR+Hw+gWopR6vzweWVRR63G3DKyR
        DyrMsKuzlXC5Twk/A0XpBS3n91rsjhBvtBMkGbvPK3teB/DNYyvJDDhnCr3XW1Hz
        RO2Is+aGqiIM6AeBRbPzRliReYY+0CTIPhnIHkqT/njbjRcmmabD+ziJq6X7mqVg
        ==
X-ME-Sender: <xms:mOIPXh0ql2ydwS298pynMTZrIsubIbg2ECZkmaEfLEEv1B1a4jVSxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeggedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujggfsehttd
    ertddtredvnecuhfhrohhmpehmvgguihgrsegrrhgvfigvthhhvghrvgdrnhgvthenucff
    ohhmrghinheplhhinhhugihtvhdrohhrghenucfkphepuddruddvledrudekkedrvdehvd
    enucfrrghrrghmpehmrghilhhfrhhomhepmhgvughirgesrghrvgifvghthhgvrhgvrdhn
    vghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:mOIPXlzcSq6QjTRJOJWyFWUfjhaNmtXBMDHImfCynaG8OD5MUVpREg>
    <xmx:mOIPXp9iOdNw-JSLFQjjnwUtBKOSIceerRVfjLtnrE7NNlzsDlYpSg>
    <xmx:mOIPXnO6DoZbNuOgw4X-B8iVLgZY3Xq_1i9WQRoZJwU13q_b8Ke29w>
    <xmx:mOIPXqO5htQdmLaMKeI2yLZG0RiQj8k03wBtnPTNPHWEgLUSNF92mw>
Received: from ubuntu.windy (unknown [1.129.188.252])
        by mail.messagingengine.com (Postfix) with ESMTPA id 09F0D8005C;
        Fri,  3 Jan 2020 19:55:50 -0500 (EST)
Date:   Sat, 4 Jan 2020 11:55:20 +1100
From:   media@arewethere.net
To:     Michal Zatloukal <myxal.mxl@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: Building own DVB-T channel file from frequencies (w_scan issues)?
Message-ID: <20200104005519.GA14330@ubuntu.windy>
References: <CAKKZj2A2JZ43hkCAF3PMwLfpcSJmTgZGMG01zMgSAwaF-KahkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKKZj2A2JZ43hkCAF3PMwLfpcSJmTgZGMG01zMgSAwaF-KahkA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 03, 2020 at 07:30:02PM +0100, Michal Zatloukal wrote:
>
> Is there something that works like manual tuning in VLC, or NextPVR,
> ie. enter frequency, bandwidth, and see if you get a signal + program
> listing? (edit: dvbtune can do this apparently, though the format is
> different from the normal channel list). Or perhaps an option to
> w_scan to ignore NIT frequency if delta from scanning frequency is >
> BW?

dvbv5-scan defaults to using the input frequency,
but you can make it use the NIT frequency if desired.
Debian packge is dvb-tools, but you may want to try and build the
git version (git://linuxtv.org/v4l-utils.git)
You will need the input multiplex lists from the dtv-scan-tables
package as well.

dvbv5-zap may do the manual tuning you desire.

Cheers
