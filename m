Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47F6E2C3E53
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 11:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgKYKpb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 05:45:31 -0500
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:41263 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726287AbgKYKpa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 05:45:30 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id hsIfkIrvxN7XghsIjkVoNH; Wed, 25 Nov 2020 11:45:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1606301129; bh=5fOmrRyOqOfXz8bdkJWokZ31YNLL/OPiZA2pp8lxu5s=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=v0IIB2cXy+kQCWXfL/bSrhAcMW0jB9vvX2CaMnap14NLGhM6YwRS/2ECnFkS6SkI2
         Vz26TBDdp92QZt/eiBeA7i51g6oQS/Q+B+glszy3hzecpigg0WVIxGUcnuBK52VpWZ
         o6rcjbM2V+BWByd+v90RKYMjWdIzlDohdR9YprmoyzZHOv4uI3mWHUbfKlo2Ry9pT1
         SBXbjttrlzvVWfOUImigMRg9IF8CWACcXQcaJDKQlI8N8ql+KN0t4kenBGuG/K0r/W
         GUaukgOqCNiz8SCsnBB6EKKaNtOTMMEBxsL+mcHR78pOmFT7rLdOaVHEjePVykY4IL
         r3CPS6QHJU8gw==
Subject: Re: [PATCH] media: vidioc-g-ext-ctrls.rst: document
 V4L2_CTRL_CLASS_DETECT
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>
References: <120ae30c-483a-e624-ff3b-45a765968981@xs4all.nl>
Message-ID: <e49401ed-51a0-4e73-59d3-eac2955addbc@xs4all.nl>
Date:   Wed, 25 Nov 2020 11:45:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <120ae30c-483a-e624-ff3b-45a765968981@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfOjSCx9WwQl3foRiI3SLZ2U3E5B6i+ITzJ1ezBQkhaq6A2M3N4/7BVyCV6U7KV/25KpYGEijPRP1EuNybSsWkKySoiSeCUk6QaCxXyDQTg76Xey9tdcw
 wlH4+JT5aZ51N5MS88sXsSYPwWr8m1+mgHh7rILHCFDidhUQlIuWcGySwUopRbFli4Cd3DFvciv45rh0lZe28Wsm13i1PIbchxhgBbpXriZFncVPltYuXhtB
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Ezequiel,

Can you add this to your H264 series for v5 and ensure that the
V4L2_CTRL_CLASS_CODEC_STATELESS control class is documented here
as well?

It makes sense if you just pick up this patch yourself to avoid
merge conflicts.

Regards,

	Hans

On 25/11/2020 11:40, Hans Verkuil wrote:
> V4L2_CTRL_CLASS_DETECT was never documented here, add it.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> index c7aba1b66b6d..8b2029d1390b 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
> @@ -358,6 +358,10 @@ still cause this situation.
>        - 0xa20000
>        - The class containing RF tuner controls. These controls are
>  	described in :ref:`rf-tuner-controls`.
> +    * - ``V4L2_CTRL_CLASS_DETECT``
> +      - 0xa30000
> +      - The class containing motion or object detection controls. These controls
> +        are described in :ref:`detect-controls`.
> 
>  Return Value
>  ============
> 

