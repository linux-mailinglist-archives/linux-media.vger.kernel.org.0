Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0A143D3706
	for <lists+linux-media@lfdr.de>; Fri, 23 Jul 2021 10:49:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234483AbhGWIIc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Jul 2021 04:08:32 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:42085 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234276AbhGWIIa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Jul 2021 04:08:30 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 6qrdmWn3cXTlc6qremAOPS; Fri, 23 Jul 2021 10:49:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1627030142; bh=HXahCBWhsxCXk9WRb5V0XD/vAj7NUOOwa5HNuAsYmrs=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=k7/3Qab3slPYOBfLS66bBQBYe0wFLQPkUeeidCe7kIFDDbBuv4lZE2Ze6yVeDhGCB
         KrDZHdwx4VSH6ts2Q5CtJiUn0xtLNjumWBZwlHnIfND07Ryb77SKITxb+cSO4NXqb1
         9jq1auqpeA6yS3LM6LSqINXHZa2it1TZTqnpb+fTBbBnvSA/w/TEbPbVr/6wA77cbY
         s2eEMPrM5B0vbL4UGdy+LfQrzTdFYvZ87XTruPksM+6d2gtAZe+X8FLDxXqH2hsNqo
         g57xjD5pu7Toq9sSSGqmeUF8+xz5jDeIJm2etGeQdX/NW4nmRFcupl4TkzmAf5iTRT
         5TSPzhLDZZCyQ==
Subject: Re: [PATCH REPOST] TDA1997x: replace video detection routine
To:     =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
References: <m3k0lmejlw.fsf@t19.piap.pl>
 <68bd6e41-4c32-240f-aa83-fd2b96929d45@xs4all.nl> <m3mtqedfsg.fsf@t19.piap.pl>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <798b2128-24a6-1a62-f98c-f228134e8d5c@xs4all.nl>
Date:   Fri, 23 Jul 2021 10:49:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <m3mtqedfsg.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfNEq1EtzebInsdpHKuFMkWFtfyV27oxkA4/1eTPcBhvmNMPqvlqrHmFu5e2iaNP8NIpUsBKBmMFbYeIKltYME0pFVh13X3Cq0Mt8PRLWEAl/xfYGaf5t
 Yj/N1OA7boTOeME85S18RkNvdmypcHeuVpddZzdFoWwpfAwkm/VXkOMOyXceiwGkHCwhcaq14ad572qdgjs3fN/Qfjx9SxJrqRCJnBIKZZrxeYpmiTkQemwo
 uvachFnKdOE4osKjatBPPFdqGwWAa2NC3YHkXEAhkDNxsWD7mLKm1i+eMPY+rJKui3c/WSPBp9sHXyzWk8lC1Z/nNo1RYMQdB0PmH2todKxPRzwCSpqzCTaM
 rRvooEQzLWmz1/ibyrve60hLmBc4MkRNZhCftc+bjMo5s4ylxp58oqmCfllf5FXt+rhXDvR/
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/07/2021 08:27, Krzysztof Hałasa wrote:
> Hans,
> 
> I have a problem with matching H/V sync polarities. It appears the
> standard modes use different polarity settings, and HDMI doesn't have
> separate sync lines, it uses in-band signaling. I don't know what
> polarity should I set for the v4l2_find_dv_timings_cap() ->
> v4l2_match_dv_timings() to succeed.

The tda1997x doesn't have any method of obtaining the sync polarities?

HSync and VSync are, as you say, using in-band signaling, but the 'polarity'
still matters when it comes to detecting timings. All HDMI receivers I have
ever seen have a register that reports the polarities. I find it *very* hard
to imagine that this device doesn't support that.

Do you have a datasheet for this device?

> 
> 1. I can try all 4 combinations (+/+, +/-, -/+, -/-) and see if there is
> a match. Seems weird to me.
> 
> 2. I can add a flag to v4l2_find_dv_timings_cap() ->
> v4l2_match_dv_timings() which asks for the polarities to be ignored.
> 
> 3. I could add
>  #define V4L2_DV_VSYNC_POS_POL   0x00000001
>  #define V4L2_DV_HSYNC_POS_POL   0x00000002
> +#define V4L2_DV_VSYNC_ANY_POL   0x00000004
> +#define V4L2_DV_HSYNC_ANY_POL   0x00000008
> 
> and v4l2_match_dv_timings() would skip comparing them. A bit hacky.
> 
> 4. I could also add
>  #define V4L2_DV_VSYNC_POS_POL   0x00000001
>  #define V4L2_DV_HSYNC_POS_POL   0x00000002
> +#define V4L2_DV_VSYNC_NEG_POL   0x00000004
> +#define V4L2_DV_HSYNC_NEG_POL   0x00000008
> 
> and, likewise, v4l2_match_dv_timings() would know what to do. This is
> IMHO cleaner but requires much more changes in other code (like
> drivers).
> 
> Any other idea?
> Perhaps I should do "2"?

If there really is no register that reports the polarities, then option 2 is
the best approach. There are other reasons why you might want to ignore the
polarities: not all video sources use the correct polarities.

What I think would be best is to make a flags argument that allows the
match code to skip certain tests:

#define V4L2_DV_TIM_IGNORE_POLARITIES	BIT(0)
#define V4L2_DV_TIM_IGNORE_HPORCHES	BIT(1)
#define V4L2_DV_TIM_IGNORE_VPORCHES	BIT(2)
#define V4L2_DV_TIM_IGNORE_HSYNC	BIT(3)
#define V4L2_DV_TIM_IGNORE_VSYNC	BIT(4)

IGNORE_HPORCHES would just check hsync and total horizontal blanking,
IGNORE_HSYNC would just check total horizontal blanking.
IGNORE_HSYNC implies IGNORE_HPORCHES.

Regards,

	Hans
