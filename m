Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3B19B216B
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 15:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391703AbfIMNud (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 09:50:33 -0400
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:42031 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391619AbfIMNuc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 09:50:32 -0400
Received: from [IPv6:2001:420:44c1:2577:888a:538c:8dda:557b] ([IPv6:2001:420:44c1:2577:888a:538c:8dda:557b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8lxziWzcjV17O8ly2i2yQo; Fri, 13 Sep 2019 15:50:30 +0200
Subject: Re: [PATCH v3 03/11] dt-bindings: video-interfaces: Expand rotation
 description
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz, Rob Herring <robh+dt@kernel.org>
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, devicetree@vger.kernel.org
References: <20190912201055.13964-1-jacopo@jmondi.org>
 <20190912201055.13964-4-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <b69060da-9f14-c0d1-0fc1-a930d9f0c82f@xs4all.nl>
Date:   Fri, 13 Sep 2019 15:50:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912201055.13964-4-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFNvbmfl2LbRg58hBnxLSRiMeNNNOz1D+5ZZgD++7jvLy94mRjYooqtXnMrAC6AeWadlHC8gVKPjyOifjGYqbO4xWdSJlfdrpCcse5WnAsiQTJNwV4Ng
 m7r3DaIv9EfytLmHjCGb9YJAgfpCBxRyp4exTH/42voOoRzrCYa4g21Guh63EGFABrfve86lL25SylEHvyyAEbx4v3Vc8oye9srjnkmA9PKtUYL6G0VokYgK
 zv9MiQKEo5GOVosSM6boaXnuOA/vpxwJVr1snVBlyfV8MOeTEwglZe92MY9gmkAiK5f9rGDYGybU+HII5OVLrJkzXxRJJtpi51c+UU7sulzPA1LEaGEsyx23
 ymMeonzsGB9R9xOR39blr8Be1MQbak1kqCBoDTd0qBt1ybwcjQNWgbnY5tBxvUQQ0JCkhzLk0KMAaGt6zoVMx98u139D1xmyHpxipthqmfJfFQIdJK28rUpb
 c72BFYU6Iv2nDWQdiKClA4+USmBpOYIRh47VSxl3ODmJ549mdcuQB9cg/ALAozDZ/sACgO09ByeIX9AO2r6qDteYcDSNVr8d5NvbLA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/12/19 10:10 PM, Jacopo Mondi wrote:
> Expand the 'rotation' property description to define the direction and
> orientation of the axis around which the device mounting rotation is
> expressed.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../devicetree/bindings/media/video-interfaces.txt        | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index e71b90a29d7a..8ab51e0bb63e 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -85,9 +85,11 @@ Optional properties
> 
>  - lens-focus: A phandle to the node of the focus lens controller.
> 
> -- rotation: The device, typically an image sensor, is not mounted upright,
> -  but a number of degrees counter clockwise. Typical values are 0 and 180
> -  (upside down).
> +- rotation: The device, typically an image sensor, mounting rotation expressed
> +  as counterclockwise rotation degrees along the axis perpendicular to
> +  the device mounting surface directed away from it. Typical values are
> +  0 degrees for upright mounted devices and 180 degrees for devices mounted
> +  upside down.

Same as with patch 1/11:

"The mount rotation of the device (typically an image sensor) expressed..."

Regards,

	Hans

> 
>  - location: The device, typically an image sensor or a flash LED, mounting
>    location expressed as a position relative to the usage orientation of the
> --
> 2.23.0
> 

