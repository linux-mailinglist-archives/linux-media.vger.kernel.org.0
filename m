Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 363B6181418
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 10:08:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728852AbgCKJIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 05:08:09 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:41761 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726934AbgCKJII (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 05:08:08 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud9.xs4all.net with ESMTPA
        id BxLNjPucG9Im2BxLQjdVxA; Wed, 11 Mar 2020 10:08:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1583917686; bh=s1sBjndDIHAEXu0/PNSMdxE40w/cB66faubM3/55Tvk=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=i+b8JpOsxYFAEtsyrD7Z+U6F9yn5ByGn2GdFY7AWVc2cEeiByT79/xD9zKHI0TK2P
         Ok6osrSc0MPWyzIc+RhOWu08c6vK53MIN4G/PJm8UC1OlOSSDkwKpEiNPWjuKvTdUm
         NQ5JJHXZU4gGb5Uwesr14vsZCHCFUpRfDF1Iv5XNchEhrJ3vGZBdGIcKU5Up+7T//t
         3nvgX8fSEWaWHaypxftCHFuVikOV2ajmn5tG8rbGW9co0NGiEGfjGm01LSLb5gfQFn
         2zpb57Wm7oO61mR7puDrUTyBUs4dS5spSUlT6YiD4Hg/nGbGn3aEfXj5OlopgeOHtQ
         tdl2aBmsxScgg==
Subject: Re: [PATCH v12 00/19] TVP5150 Features and Fixes
To:     Marco Felsch <m.felsch@pengutronix.de>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hans.verkuil@cisco.com,
        jacopo+renesas@jmondi.org, robh+dt@kernel.org,
        laurent.pinchart@ideasonboard.com
Cc:     devicetree@vger.kernel.org, kernel@pengutronix.de,
        linux-media@vger.kernel.org
References: <20200309101428.15267-1-m.felsch@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f8261c55-673a-c045-2ed6-5da56e91734b@xs4all.nl>
Date:   Wed, 11 Mar 2020 10:08:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309101428.15267-1-m.felsch@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfJvMAScbhSn1FuPJb+y+UH/0Y5bbqxjLeNAyU6EzyXgTbl+xtru2oE+lYhGC1qqN5bDtTBNh7CCTRVWeBzUGLGijqOAs4CzRhkcfSBnmLnxtvYIA7pMs
 YGwdtJ5w8K9hO71MwNOjSeNWBC8JYdF4bo91EtiolwMyEZpaVGLuvASbtTojZGMx059LCBlrL6LEKHkHc8jv5Nro/6wo761Se6nyf4uz2wjybdDkGxg/33Vg
 1g/x91Qst5aVGQ3bH+b5C09+ar8dbHCVq4oE+leXbwCpWBPyL51nM3NJ2MT1QBMYiNN8SogpDx2MAEySrgaDeIkYMumLkE5kz/IzND54BtkQ/ibDyhf8CCc3
 A8AYldK+behMLUshGJjKtOD2A4Uh+ozLe5wtRMt8MPIn3U9VzN/WwxAMo0pXoXx3KdyvQ37RC5/x+8awqA9Kmu5YkT/AOHZlRBz14wwt1jqPbjgow/LzMTRq
 jpqYx2SaOVs3zpA/InrMcIaojHKXMMSRuJsIAg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/9/20 11:14 AM, Marco Felsch wrote:
> Hi all,
> 
> here is the new and _hopefully_ last version :) This version contains
> the discussion results with Sakari and some minor fixes from the v11.
> 
> Each patch has a dedicate log, so I avoid the details here and give only
> an overview.
> 
> Patch 1-2:
> Those where previously one patch.
> 
> Patch 3-6:
> Prepare and implement the common v4l2-fwnode parsing code. I changed the
> code from a single parse_and_add_links/free to parse/add_links/free. I
> did the split to allow adding multiple links from different devices to a
> _maybe_ coming global connector device. 
> 
> Patch 8:
> I converted the parsing code to the new v4l2-fwnode-connector parsing
> behaviour and fixed a two bugs during remove()
> 
> Patch 13:
> This one is new due to the switch from the s_power() to the pm_runtime
> as Sakari suggested.
> 
> Patch 14:
> Also a new patch.
> 
> Patch 15:
> New patch..
> 
> I've tested the series on a custom imx6-based board which uses the chip
> directly (no-usb). I would appreciate if someone with a usb device can
> test this too.

I'm getting these sparse/smatch warnings:


sparse: WARNINGS
SPARSE:drivers/media/i2c/tvp5150.c:1071:14:  warning: symbol 'tvp5150_get_hmax' was not declared. Should it be static?
drivers/media/i2c/tvp5150.c:1071:14: warning: no previous prototype for 'tvp5150_get_hmax' [-Wmissing-prototypes]


smatch: WARNINGS
drivers/media/v4l2-core/v4l2-fwnode.c:744 v4l2_fwnode_connector_add_link() warn: possible memory leak of 'link'
drivers/media/i2c/tvp5150.c:1071:14: warning: no previous prototype for 'tvp5150_get_hmax' [-Wmissing-prototypes]

Please look at these: the tvp5150.c is probably a missing static, so easy to fix, but the
'possible memory leak' definitely needs closer attention. Based on a quick look of that
function it appears a correct warning, and the error path there needs to be fixed.

Regards,

	Hans

> 
> Regards,
>   Marco
> 
> Javier Martinez Canillas (1):
>   partial revert of "[media] tvp5150: add HW input connectors support"
> 
> Marco Felsch (17):
>   dt-bindings: connector: analog: add sdtv standards property
>   dt-bindings: display: add sdtv-standards defines
>   media: v4l: link dt-bindings and uapi
>   media: v4l2-fwnode: add endpoint id field to v4l2_fwnode_link
>   media: v4l2-fwnode: add v4l2_fwnode_connector
>   media: v4l2-fwnode: add initial connector parsing support
>   media: tvp5150: add input source selection of_graph support
>   media: dt-bindings: tvp5150: Add input port connectors DT bindings
>   media: tvp5150: fix set_selection rectangle handling
>   media: tvp5150: add FORMAT_TRY support for get/set selection handlers
>   media: tvp5150: move irq en-/disable into runtime-pm ops
>   media: tvp5150: add v4l2-event support
>   media: tvp5150: add subdev open/close callbacks
>   media: dt-bindings: tvp5150: cleanup bindings stlye
>   media: dt-bindings: tvp5150: add optional sdtv standards documentation
>   media: tvp5150: add support to limit sdtv standards
>   media: tvp5150: make debug output more readable
> 
> Michael Tretter (1):
>   media: tvp5150: initialize subdev before parsing device tree
> 
>  .../display/connector/analog-tv-connector.txt |   6 +
>  .../devicetree/bindings/media/i2c/tvp5150.txt | 146 +++-
>  drivers/media/i2c/tvp5150.c                   | 802 ++++++++++++++----
>  drivers/media/v4l2-core/v4l2-fwnode.c         | 166 ++++
>  include/dt-bindings/display/sdtv-standards.h  |  76 ++
>  include/dt-bindings/media/tvp5150.h           |   2 -
>  include/media/v4l2-fwnode.h                   | 143 ++++
>  include/uapi/linux/videodev2.h                |   4 +
>  8 files changed, 1146 insertions(+), 199 deletions(-)
>  create mode 100644 include/dt-bindings/display/sdtv-standards.h
> 

