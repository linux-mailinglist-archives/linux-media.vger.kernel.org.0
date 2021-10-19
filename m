Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5FA43322D
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 11:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234871AbhJSJ1N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 19 Oct 2021 05:27:13 -0400
Received: from mga14.intel.com ([192.55.52.115]:62412 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234961AbhJSJ1M (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 19 Oct 2021 05:27:12 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10141"; a="228737848"
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; 
   d="scan'208";a="228737848"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 02:24:56 -0700
X-IronPort-AV: E=Sophos;i="5.85,384,1624345200"; 
   d="scan'208";a="494017603"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2021 02:24:43 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 4852120316;
        Tue, 19 Oct 2021 12:24:41 +0300 (EEST)
Date:   Tue, 19 Oct 2021 12:24:41 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>, Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH] media: Document coding style requirements
Message-ID: <YW6O2Yl3YVyrTwO2@paasikivi.fi.intel.com>
References: <20211013092005.14268-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013092005.14268-1-jacopo@jmondi.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thanks for the patch.

On Wed, Oct 13, 2021 at 11:20:05AM +0200, Jacopo Mondi wrote:
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

Thanks for the patch.

Aren't these all common and/or preferred practices outside the media tree
as well? I suppose not each one of these is universally enforced though.

The coding style guide is lacking documentation on such things though.

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
> +    - hexadecimal values should be spelled using lowercase letters;
> +    - one structure/enum member declaration per line;
> +    - one variable declaration per line;
> +    - prefer variable declaration order in reverse-x-mas-tree over
> +      initialization at variable declare time;
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

I wouldn't say this is required or even preferred if you have a dependency
between the variables.

Rather I'd say the latter is undesirable if a_very_long_operation_name()
can fail. But that's a bit out of scope now.

> +
>  Key Cycle Dates
>  ---------------

-- 
Kind regards,

Sakari Ailus
