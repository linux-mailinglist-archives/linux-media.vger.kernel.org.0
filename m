Return-Path: <linux-media+bounces-32299-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEB4AB350B
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 12:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15EC519E00B3
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 10:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1E6267AE3;
	Mon, 12 May 2025 10:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dX51Dzd8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4549D26771F;
	Mon, 12 May 2025 10:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747046334; cv=none; b=qD8InXl5C0qxbSvbaScyHRvtxHd40RjA6lvSAvtG7/qrf+9no4QDaPruf4MUrShhcblLtJqAZ4WjkM0k9THr4mVxIOdMSb7n/aBgPAq4yp62Qg/hlk4C/QsYWoCo4JfxFQqNlMOtDRT/WxR3j9AHUwMqmlRiv/YK2sXl0nfJnTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747046334; c=relaxed/simple;
	bh=iW/wplXTc+WCOl+hVCWuG8beuASak99+ZL5vBFewCfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FH1Q3nwXqbGu2hwbGG9JP3VNsth12ngjMNZYJPXc5FkpIXXkqFNBOYJP4KaS6BRWwLc8lXrK/hl/EVh/hr1laWueMstRqVikE7POPxriVINxgOfazhLtw3sA7wmJwnMB+ur1SwH/q4N31pyKHZsDpRGdy5hkT3LX/FXcHhnh9Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dX51Dzd8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5ADC4CEE7;
	Mon, 12 May 2025 10:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747046334;
	bh=iW/wplXTc+WCOl+hVCWuG8beuASak99+ZL5vBFewCfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dX51Dzd80ESQXt191CjcbSoH1N9Eoe7BcLpyLEb1rb04Up4gGw8OSZfalzxB97r4D
	 ud0DRgZCbIghUpuG85s0JYe7Oe3r+NsCNMp2P56t9yd2C8SPu+1/OteD8jdF16jGY1
	 c4ERS+MJAvPaBpWeo6holHQlSNtOI5YF901/w+Qw=
Date: Mon, 12 May 2025 12:38:20 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Krzysztof Opasiak <krzysztof.opasiak@neat.no>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	balbi@kernel.org, paul.elder@ideasonboard.com,
	kernel@pengutronix.de, nicolas@ndufresne.ca,
	kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 0/4] usb: gadget: uvc: parse configfs entries and
 implement v4l2 enum api calls
Message-ID: <2025051253-trimmer-displease-1dde@gregkh>
References: <20220909221335.15033-1-m.grzeschik@pengutronix.de>
 <Y4u+9g/gIneGZrlZ@pendragon.ideasonboard.com>
 <Y4xaXHLoiPupWM6V@kroah.com>
 <b2e943a1-fc0e-4dd2-b38e-a1d77ed00109@neat.no>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2e943a1-fc0e-4dd2-b38e-a1d77ed00109@neat.no>

On Mon, May 12, 2025 at 12:19:07PM +0200, Krzysztof Opasiak wrote:
> Hi Greg,
> 
> On 4.12.2022 09:29, Greg KH wrote:
> > On Sat, Dec 03, 2022 at 11:26:14PM +0200, Laurent Pinchart wrote:
> > > Hi Michael,
> > > 
> > > On Sat, Sep 10, 2022 at 12:13:31AM +0200, Michael Grzeschik wrote:
> > > > This series improves the uvc video gadget by parsing the configfs
> > > > entries. With the configfs data, the userspace now is able to use simple
> > > > v4l2 api calls like enum and try_format to check for valid configurations
> > > > initially set by configfs.
> > > 
> > > I've realized that this whole series got merged, despite my multiple
> > > attempts to explain why I think it's not a good idea. The UVC gadget
> > > requires userspace support, and there's no point in trying to move all
> > > these things to the kernel side. It only bloats the kernel, makes the
> > > code more complex, more difficult to maintain, and will make UVC 1.5
> > > support more difficult.
> > 
> > I can easily revert them, but I did not see any objections to them
> > originally and so I merged them as is the normal method :)
> > 
> 
> I know that it's already 2025 and I'm very late to the game but this series
> breaks our userspace scripts as it implicitly adds a requirement to name a
> streaming header directory as "h" which previously was a user-selected name.
> This requirement is coming from here:
> 
> +
> +       streaming = config_group_find_item(&opts->func_inst.group,
> "streaming");
> +       if (!streaming)
> +               goto err_config;
> +
> +       header = config_group_find_item(to_config_group(streaming),
> "header");
> +       config_item_put(streaming);
> +       if (!header)
> +               goto err_config;
> +
> +       h = config_group_find_item(to_config_group(header), "h");
> +       config_item_put(header);
> +       if (!h)
> +               goto err_config;
> 
> If you name this directory as "header" gadget just fails to link to a
> configuration. Although this isn't a big deal on its own as we could simply
> rename the dir in our code but this is just the tip of the iceberg.
> 
> To my understanding, this patch broke an important feature of UVC ConfigFS
> interface which is allowing to present different list of available formats
> for different USB speeds as for example, it does not make sense to expose
> 1080p30 in high speed as it simply just does not fit into the ISO bandwidth
> of HS. For example what we've been using previously:
> 
> mkdir uvc.nf/streaming/uncompressed/hsu
> mkdir uvc.nf/streaming/uncompressed/hsu/360p
> 
> mkdir uvc.nf/streaming/uncompressed/ssu
> mkdir uvc.nf/streaming/uncompressed/ssu/360p
> mkdir uvc.nf/streaming/uncompressed/ssu/720p
> mkdir uvc.nf/streaming/uncompressed/ssu/1080p
> 
> symlink uvc.nf/streaming/uncompressed/hsu \
>         uvc.nf/streaming/header/hsh/hsu
> 
> symlink uvc.nf/streaming/uncompressed/ssu \
>         uvc.nf/streaming/header/ssh/hsu
> 
> symlink uvc.nf/streaming/header/hsh \
>         uvc.nf/streaming/class/hs/h
> symlink uvc.nf/streaming/header/ssh \
>         uvc.nf/streaming/class/ss/h
> 
> no longer works as the patch requires presence of "h" directory inside
> "streaming/header" and even if we rename one of the headers directory to h
> the patch would be actually wrong as it would expose via v4l2 calls only
> formats available in the "h" directory and not in any other. (and at least
> on our adroid kernel it makes the kernel crash but haven't tested if that
> would be the case for mainline as well)
> 
> Given the limitations of the v4l2 interface I kind of don't see a way how we
> could fix this series to present proper formats to the userspace using v4l2
> calls as the list of formats can change when the speed changes and userspace
> would have no way of knowing that.
> 
> Given that I'd like to suggest that it seems to actually make sense to
> revert this unless there are some ideas how to fix it.

Sorry about this, can you submit a patch series that reverts the
offending commits?  As it was years ago, I don't exactly know what you
are referring to anymore.

thanks,

greg k-h

