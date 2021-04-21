Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7EF73666A6
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 10:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234178AbhDUIDP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 04:03:15 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:40649 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234185AbhDUICp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 04:02:45 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id Z7oAl8qajXsivZ7oElttR8; Wed, 21 Apr 2021 10:02:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1618992126; bh=wlingVNC36bQIuwnzlO+URI1FtfyDhHAzUhVeNC0c+g=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=D7A2MIijmhGXgaGnTUcA4c5ATqrR7jjjlNH5+GX2qC41PlF3Gxkqr1Zbp9UWqfDpO
         VUNoceVyZhgAzIiC2p31utng4XJ9WDfGM+9AIWcd8wZ3rLCwW4V452wgHq8+djzr0I
         2Hncc2o3b+b4VBhnai7GbJT43s9A5OfpFjYeC/IuLo70IvcSGWk++7r0as7fCgZgOx
         mrOZpPc7wrUfNLMdlMEWrRsq2G4gSnf2uWxu7srWKBSmR4IQfU/vQFS6Wr4cVaIsec
         hGXQtIzWaouCwe2XRnAkkhanJr0R5iNIFUeVbJSIsxafLKyaq+I3kwu/xVTqzhpm8I
         lGnKr/738uOXg==
Subject: Re: [PATCH 7/8] v4l2-utils: turn mbus_names into const vector
To:     Rosen Penev <rosenp@gmail.com>, linux-media@vger.kernel.org
References: <20210421072035.4188497-1-rosenp@gmail.com>
 <20210421072035.4188497-7-rosenp@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c39a54f8-1e35-5d93-3e24-2f06ca47464f@xs4all.nl>
Date:   Wed, 21 Apr 2021 10:02:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210421072035.4188497-7-rosenp@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNwT5W7JlojAnud/PdmBlVc8tABZefO9HZXfv18goVk03bhL3mBeIS/dpwfNudgF36YEU2J6wxRoWxiDuvn+HB8f9tBSCjUzznCvfIKTUSwjfAO2KN1Z
 lwi54KAVSnV216Ia3ytDP3zdJSudZGg6zZOqhMVlFKPJslH11xVS5CCnjbhgpbrZ/SlBCHXSUxKhu9LTgkz/E4mZ0gYWk6Ex2iKFnfHV4vRZo9GIUDvlq6Lb
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/04/2021 09:20, Rosen Penev wrote:
> Allows usage of a more standard for loop.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  utils/v4l2-ctl/v4l2-ctl-subdev.cpp | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> index d0f391bba..f2be9442c 100644
> --- a/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> +++ b/utils/v4l2-ctl/v4l2-ctl-subdev.cpp
> @@ -1,3 +1,5 @@
> +#include <vector>
> +
>  #include "v4l2-ctl.h"
>  
>  struct mbus_name {
> @@ -5,10 +7,9 @@ struct mbus_name {
>  	__u32 code;
>  };
>  
> -static struct mbus_name mbus_names[] = {
> +static const std::vector<mbus_name> mbus_names{
>  	{ "Fixed", MEDIA_BUS_FMT_FIXED },
>  #include "media-bus-format-names.h"
> -	{ nullptr, 0 }
>  };

I see no reason for this change, there is nothing wrong with the
current array that I can see (other than that it should have been
const, but I'll add that).

>  
>  /* selection specified */
> @@ -343,9 +344,9 @@ static void print_framefmt(const struct v4l2_mbus_framefmt &fmt)
>  {
>  	__u32 colsp = fmt.colorspace;
>  	__u32 ycbcr_enc = fmt.ycbcr_enc;
> -	unsigned int i;
> +	size_t i;
>  
> -	for (i = 0; mbus_names[i].name; i++)
> +	for (i = 0; i < mbus_names.size(); i++)
>  		if (mbus_names[i].code == fmt.code)
>  			break;
>  	printf("\tWidth/Height      : %u/%u\n", fmt.width, fmt.height);
> @@ -554,9 +555,9 @@ void subdev_get(cv4l_fd &_fd)
>  
>  static void print_mbus_code(__u32 code)
>  {
> -	unsigned int i;
> +	size_t i;
>  
> -	for (i = 0; mbus_names[i].name; i++)
> +	for (i = 0; i < mbus_names.size(); i++)
>  		if (mbus_names[i].code == code)
>  			break;
>  	if (mbus_names[i].name)
> @@ -568,9 +569,8 @@ static void print_mbus_code(__u32 code)
>  
>  static void print_mbus_codes(int fd, __u32 pad)
>  {
> -	struct v4l2_subdev_mbus_code_enum mbus_code;
> +	struct v4l2_subdev_mbus_code_enum mbus_code = {};
>  
> -	memset(&mbus_code, 0, sizeof(mbus_code));

This one is nice to have, though. But it's independent of the other
changes.

Regards,

	Hans


>  	mbus_code.pad = pad;
>  	mbus_code.which = V4L2_SUBDEV_FORMAT_TRY;
>  
> 

