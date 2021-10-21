Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6B84363A9
	for <lists+linux-media@lfdr.de>; Thu, 21 Oct 2021 16:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbhJUODG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Oct 2021 10:03:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbhJUODF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Oct 2021 10:03:05 -0400
Received: from lb2-smtp-cloud9.xs4all.net (lb2-smtp-cloud9.xs4all.net [IPv6:2001:888:0:108::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AA1EC0613B9
        for <linux-media@vger.kernel.org>; Thu, 21 Oct 2021 07:00:48 -0700 (PDT)
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id dYcamkw1iqPdpdYcdmw6HM; Thu, 21 Oct 2021 16:00:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1634824844; bh=Zw4xw7M47O3RfYaxFwqut4PZ1L8Te4JIgsXf0qPcnkw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=IpcOgnithZkDEuF6PQt6hNduZo/CkvxVDnT1nDyd4aEGtG6G5pqmsDh6TS8sbUpSh
         pu9Wz+l00zru5DIEwVuHG+is4g44HCQFPx1lGTWka2jI4B3k85bYSRhIlzDIMbDsOI
         kzkwG2Ja85nqW/ar/s6F0BaccISTocZjLb0f2/VJN4mKna6EZju0FAo55A4TjlZdG9
         4FjaoMufmMCUye/N3C6Y0oqHUDyokjRCo2Bbl6nncxW8l3VbWSedog4EGMe/C5A4EC
         9fFFckFgtOyRRYVrGezjDq8boiEPzLW7AZPP8+vBpzJOb6BZBgm8rfpHkKIfrk0nN8
         jdACmhK+3Am2w==
Subject: Re: [PATCH] media: Document coding style requirements
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
References: <20211013092005.14268-1-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f48bbc19-9285-befe-e1cc-4c71d2735994@xs4all.nl>
Date:   Thu, 21 Oct 2021 16:00:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211013092005.14268-1-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfLa2xlmAXQyaGkcGNZKmekFwfciC5oIoZmsF4N7qj2wXxpkUtnC8UOkep5H/ILoWsEiSEI8qn+aYwmXQRXhbIxPRZKvTRTtASGyVQaqL5EN7WJ1mmSRg
 sGlClanzt0dxrKn4SRuAlyX2WWpyX4mkej1iwtM8OB67XbeoQMeE6X8weXp9RmziF98VnwYP9Ff/CuGboU9WktznzZ+uyrx0+lnvhYAwDoMzRzkSnq5Xsr3R
 omUaRfubTH/Ahco81P6kKA7uL1NMtZpbjZ4gy9xsZTsg6/N5p7elzE87cV1uS/uWLQTGTHTLvmGblGhkReNvQJh1iVnOVhAIbT4SIPNNyiruSyVqsoiyh8MY
 AB1yHji1p8FZedzeAQKGZsqF/QPE6A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 13/10/2021 11:20, Jacopo Mondi wrote:
> There are a few additional coding style conventions in place in
> the media subsystem. If they do not get documented, it's hard to enforce
> them during review as well as it is hard for developers to follow them
> without having previously contributed to the subsystem.
> 
> Add them to the subsystem profile documentation.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
> 
> All points are up for discussion ofc.
> 
> But the idea is to get to have more requirement defined, as otherwise
> it's very hard to enforce them during review.
> 
> Thanks
>    j
> 
> ---
>  .../media/maintainer-entry-profile.rst        | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> index eb1cdfd280ba..9c376f843e1c 100644
> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> @@ -180,6 +180,30 @@ In particular, we accept lines with more than 80 columns:
>      - when they avoid a line to end with an open parenthesis or an open
>        bracket.
> 
> +There are a few additional requirements which are not enforced by tooling
> +but mostly during the review process:
> +
> +    - C++ style comments are not allowed, if not for SPDX headers;

if not -> except

> +    - hexadecimal values should be spelled using lowercase letters;
> +    - one structure/enum member declaration per line;
> +    - one variable declaration per line;

Hmm, I don't mind something like: int i, j;

But for anything more complex I too prefer one declaration per line.

> +    - prefer variable declaration order in reverse-x-mas-tree over
> +      initialization at variable declare time;

Add something like:

...unless there are dependencies or other readability reasons to
depart from this.

> +
> +      As an example, the following style is preferred::
> +
> +         struct priv_struct *priv = container_of(....)
> +         struct foo_struct *foo = priv->foo;
> +         int b;
> +
> +         b = a_very_long_operation_name(foo, s->bar)
> +
> +      over the following one::
> +
> +         struct priv_struct *priv = container_of(....)
> +         struct foo_struct *foo = priv->foo;
> +         int b = a_very_long_operation_name(foo, s->bar)

I'm not sure if this is what you typically see.

Perhaps this is a better example:

	int i;
	struct foo_struct *foo = priv->foo;
	int result;

should be written as:

	struct foo_struct *foo = priv->foo;
	int result;
	int i;

Regards,

	Hans

> +
>  Key Cycle Dates
>  ---------------
> 
> --
> 2.33.0
> 

