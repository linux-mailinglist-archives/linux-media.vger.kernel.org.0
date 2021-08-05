Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562213E177D
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 17:04:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238221AbhHEPFB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 11:05:01 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:47563 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230183AbhHEPFB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Aug 2021 11:05:01 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id BevMmsEadW9QyBevNmU0dE; Thu, 05 Aug 2021 17:04:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1628175885; bh=e8swoyi6Smi3dJxxh8i3OwKBvOBSuwIOJ5bzMUmfe/A=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wlA+uV0KTFY9tFXONxehoFBjzxzz6MDmbOzleNDTzYVLvFdCUGB5G33YgFXESY08c
         8qxsQ2YUL8jzHf35GQs899fTbjJ1mKOAQIr+HwwDGa/F28Vflo8ZpirVtPMV9Kejkb
         V/CHnlTk0oDeq+9ucDngNmo8uagxIVPnSgUGcnSuiVzKZ3VkLkEIkXCJZcetdQFxfF
         hqsk8MLCR/jZDDmoqAb4KvGlrvN6As4BLaMf6Ch+DvkedoMTB5G/myHPnZ7eY5fD4n
         BhcIC99zZt/oIHX7yEE03hpSx9nwPw1Eehb5zONYZny4KdFzI6F1icyBcC22Y6JHYh
         XckZi7VcdPheQ==
Subject: Re: [PATCH v3 2/2] media: v4l2-ctrls: Document
 V4L2_CID_NOTIFY_GAIN_XXX controls
To:     David Plowman <david.plowman@raspberrypi.com>,
        linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20210722121249.16483-1-david.plowman@raspberrypi.com>
 <20210722121249.16483-3-david.plowman@raspberrypi.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <46a868e2-a761-7401-2653-b6acf3b07557@xs4all.nl>
Date:   Thu, 5 Aug 2021 17:04:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722121249.16483-3-david.plowman@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfD1NpzDRdOGs4YO9PSNU3oVxp8bIqEX2xYKN8By/x+2pS615EiNie6/2PmWcoMrEUn1X2RIzBw2oRFRkfI/PUALlVu4BuqbOR6pIJGFK4ChiujtUs1zE
 O+a/ZC7OtwcNFD4wu5VTqLZjS0aMxPMwiEE3R23xf82JRsyj2VCBLKCaRot1t4EnogrdtxgYXeavUswlJGVeX0WZYsFdQoH27ScLdIqUbf+WgcL9HN1wmptP
 BYpJr2ckpeKPkiwJy0+YnX37wQ1sSaPRkaTssdK4vmW6gj+Zqw4HsNe4XfkJyIzWl9HJJW9+PyM9z9qr5QMtYY2UVLyPPIHfazlNl/OKKoTfDVd/Dx4LsmIF
 yg4B+R1E2ihkenSG87GDdpKI2gsjvT3zCCrfOpvIEhGgkTKklld2109yiROhrqMzigdYabrjd6EF18zANs6v9qCxmA9zPKmPgWY7BEqasFXBSLCmx7MfumI0
 hH6WGb+COHcfvhOcuQc5IB1ALyhx7p9ESuyMlw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 22/07/2021 14:12, David Plowman wrote:
> Add documentation for each of the controls
> 
> V4L2_CID_NOTIFY_GAIN_RED
> V4L2_CID_NOTIFY_GAIN_GREENR
> V4L2_CID_NOTIFY_GAIN_BLUE
> V4L2_CID_NOTIFY_GAIN_GREENB
> 
> These controls are required by sensors that need to know what colour
> gains will be applied to pixels by downstream processing (such as by
> an ISP), though the sensor does not apply these gains itself.
> 
> Signed-off-by: David Plowman <david.plowman@raspberrypi.com>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  .../media/v4l/ext-ctrls-image-source.rst      | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index de43f5c8486d..d50b56156a8e 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -72,3 +72,28 @@ Image Source Control IDs
>      * - __u32
>        - ``height``
>        - Height of the area.
> +
> +``V4L2_CID_NOTIFY_GAIN_RED (integer)``
> +    Please refer to ``V4L2_CID_NOTIFY_GAIN_GREENB`` below.
> +
> +``V4L2_CID_NOTIFY_GAIN_GREENR (integer)``
> +    Please refer to ``V4L2_CID_NOTIFY_GAIN_GREENB`` below.
> +
> +``V4L2_CID_NOTIFY_GAIN_BLUE (integer)``
> +    Please refer to ``V4L2_CID_NOTIFY_GAIN_GREENB`` below.
> +
> +``V4L2_CID_NOTIFY_GAIN_GREENB (integer)``
> +    Note: this description covers all four ``V4L2_CID_NOTIFY_GAIN``
> +    controls, according to the Bayer channel indicated at the end of
> +    the control name.
> +
> +    The sensor is notified what gain will be applied to this Bayer
> +    channel by subsequent processing (such as by an ISP). The sensor
> +    is merely informed of this value in case it performs processing
> +    that requires it, but it does not apply it to the output pixels
> +    themselves.
> +
> +    The units for the gain value are linear, with the default value
> +    being shared between all four controls and representing a gain of
> +    exactly 1. Other control properties, such as ranges, should also
> +    be common.
> 

