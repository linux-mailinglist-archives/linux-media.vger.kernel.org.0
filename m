Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3B90B2156
	for <lists+linux-media@lfdr.de>; Fri, 13 Sep 2019 15:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391761AbfIMNpk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Sep 2019 09:45:40 -0400
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:36069 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388489AbfIMNpk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Sep 2019 09:45:40 -0400
Received: from [IPv6:2001:420:44c1:2577:888a:538c:8dda:557b] ([IPv6:2001:420:44c1:2577:888a:538c:8dda:557b])
        by smtp-cloud9.xs4all.net with ESMTPA
        id 8ltGiWxy1V17O8ltJi2xMV; Fri, 13 Sep 2019 15:45:38 +0200
Subject: Re: [PATCH v3 01/11] dt-bindings: video-interfaces: Document
 'location' property
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        tfiga@google.com, pavel@ucw.cz, Rob Herring <robh+dt@kernel.org>
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, devicetree@vger.kernel.org
References: <20190912201055.13964-1-jacopo@jmondi.org>
 <20190912201055.13964-2-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <49ed4e5c-af42-5243-9f28-73f9c9b8729e@xs4all.nl>
Date:   Fri, 13 Sep 2019 15:45:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190912201055.13964-2-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfLvUNPxTVeAYJtmQSsmNA+RRFqSwy82AnddCwpWKtZ84nZzEhbo9p9w7GXou20dWjoIPjuId4dIuFxxVX4ZgqYqXMVvL6jraH6s+pkZazqW/6bzhzmim
 Y3ajqfcWPS6OERalEOR5+4sk2hRr0nze3s3xHITl2lo4Y+T+pnFAJxOLBaRleIfcZdXHOE7L0pTPeLnuIxJBWOblVi6APTq3xVb1EdibDuunIVnJrHdr3KIY
 pqRUuVbm16SMulDJic8IhmN6OtdlS9/wkYOpJ/JOX2LK29yGXXxyDDJ2bUQqWb/SkMO+JNXpL09yBdxp4ErHM1xfeQrQV8nwsKDqrMIDLl21u+J/M3Qhq2Bc
 aN6Yr7W4nfP9+hooNZuP89omw7AD9vqQ6trJjTNz5RveHEFjxRnyIkTs2e+yDiYkKHds8K/TpwdxU9+LALvsubHPjdA+AVCuUbUyoW9wYTqZqu5YxoWQihdi
 Ynov18cU3gGB5jMN1Ze3ULMIHTeIiQnwNWHVUS/AdMdA1yKfE5qcujBZ1jBqCGJSR0GRWY8nPh9SFwoRaHCU+qLlTti3UeJhYZf0gw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 9/12/19 10:10 PM, Jacopo Mondi wrote:
> Add the 'location' device property, used to specify a device mounting
> position. The property is particularly meaningful for mobile devices
> with a well defined usage orientation.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  .../devicetree/bindings/media/video-interfaces.txt    | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index f884ada0bffc..e71b90a29d7a 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -89,6 +89,17 @@ Optional properties
>    but a number of degrees counter clockwise. Typical values are 0 and 180
>    (upside down).
> 
> +- location: The device, typically an image sensor or a flash LED, mounting
> +  location expressed as a position relative to the usage orientation of the
> +  system where the device is installed on.

This sentence is a bit awkward. How about this:

location: The mount location of a device (typically an image sensor or a flash LED)
expressed as a position relative to the usage orientation of the system where the
device is installed on.

> +  Possible values are:
> +  0 - Front. The device is mounted on the front facing side of the system For

system For -> system. For

Actually, I'd move the For to the next line.

> +  mobile devices such as smartphones, tablets and laptops the front side is the
> +  user facing side.
> +  1 - Back. The device is mounted on the back side of the system, which is
> +  defined as the opposite side of the front facing one.
> +  2 - External. The device is not attached directly to the system, or is

I think you mean 'but is' instead of 'or is'.

> +  attached in a way that allows it to move freely.
> 
>  Optional endpoint properties
>  ----------------------------
> --
> 2.23.0
> 

Regards,

	Hans
