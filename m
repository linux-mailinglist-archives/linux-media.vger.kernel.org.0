Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A00F061538
	for <lists+linux-media@lfdr.de>; Sun,  7 Jul 2019 16:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbfGGOYq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Jul 2019 10:24:46 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45621 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726921AbfGGOYq (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 7 Jul 2019 10:24:46 -0400
Received: by mail-pl1-f195.google.com with SMTP id y8so2169105plr.12
        for <linux-media@vger.kernel.org>; Sun, 07 Jul 2019 07:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=RzgqI621aWGbDHGCfudOESl9Mn0+99CKDMGTJU72pEQ=;
        b=CwB7zMo8m+w+lYJl2AfFe4HLR6Af2kKEyirdj9kyWsC7IuEg47plHvVYVf7qJZN6zl
         WC15Aw1sKoacOYgHqBYdZDpY78sPn9+yY46HBFwrVctnLEODvL6dYPImuk1dhzlqyM6/
         LrJIonOcgzJRi8yLkivwfPhfI8s0uUdmlL2fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RzgqI621aWGbDHGCfudOESl9Mn0+99CKDMGTJU72pEQ=;
        b=Qok6j5/H/g/eTUH1BOexYBFvNG574swntz4A9C86JkppyFGYQOyPNbi/QEkyLqUUzp
         xv/dDe2/giSihz67HDniEFpZJGHYkmRtWZ8UVeTb++rTIv4/FBId/Wp1n1PGqQTlSCcW
         baMg3ARS1+kNEss7C5TuPWMYzfqyceZ0YLIpYGIWGD8XBwffj0f5wRwBXbE0USlifkoh
         dwhZdC6+qb1QKZe284vNbmiol/2vWungpDBLRgowOkq434jvvSR0fUjIsUQxt+uFlQsO
         6nGk1kPzJqUd6wvefZasIkmzEydA/DVfKwzchDadcQuDd8OCRfHiWrjonuKJP/0Mk5MA
         GDnQ==
X-Gm-Message-State: APjAAAWfPeqFqTOldMDHEENDerp6mKC22aLfvllbaO5LVTZRzxpPJuj6
        Afhy974dvM14orAe1Q5o3JEmdQ==
X-Google-Smtp-Source: APXvYqx/KLfLzgxok3IhCJQT8wSp+mQC4QkBTbVOByzEJOpol9aJ+serMXQ14efyX1cj2R2UxTTeNA==
X-Received: by 2002:a17:902:e40f:: with SMTP id ci15mr17885407plb.103.1562509485880;
        Sun, 07 Jul 2019 07:24:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b29sm30544119pfr.159.2019.07.07.07.24.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 07 Jul 2019 07:24:44 -0700 (PDT)
Date:   Sun, 7 Jul 2019 07:24:43 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Boris Brezillon <boris.brezillon@collabora.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>,
        kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org,
        ZhiChao Yu <zhichao.yu@rock-chips.com>
Subject: Re: [PATCH v2 2/2] media: hantro: Add support for VP8 decoding on
 rk3288
Message-ID: <201907070704.D6C5A32D@keescook>
References: <20190702170016.5210-1-ezequiel@collabora.com>
 <20190702170016.5210-3-ezequiel@collabora.com>
 <1562164006.4604.7.camel@pengutronix.de>
 <20190704091934.3524f019@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190704091934.3524f019@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jul 04, 2019 at 09:19:34AM +0200, Boris Brezillon wrote:
> Hm, I fear we have the same problem in other places (including the
> patch series adding support for H264). Kees, I wonder if there's some
> kind of safe array iterator macro, something like
> 
> #define for_each_static_array_entry_safe(_array, _iter, _max_user) 		\
> 	_max_user = min_t(typeof(_max_user), _max_user,	ARRAY_SIZE(_array));	\
> 	for (_iter = 0; _iter < _max_user; _iter++)

This seems like a good idea to add, yes. As you've hinted in the macro
name, it won't work for allocated arrays (though perhaps we could add
support for such things with some kind of new array allocator that
included the allocation count, but that's a separate issue).

I bet static analysis could find cases to use for the above macro too.

> The problem with this approach is that it's papering over the real
> issue, which is that hdr->num_dct_parts should be checked and the
> driver/core should return an error when it's > 7 instead of silently
> iterating over the 8 entries of the dct[] arrays. Static code analysis
> tools can probably detect such issues too.

To avoid the papering-over bit, the macro could be like this instead,
where the clamping would throw a WARN():

#define clamp_warn(val, lo, hi)	({		\
	typeof(val) __val;			\
	__val = clamp_t(typeof(val), lo, hi);	\
	WARN_ONCE(__val != val);		\
	__val })

#define for_each_static_array_entry_safe(_array, _iter, _max_user) \
	_max_user = clamp_warn(_max_user, 0, ARRAY_SIZE(_array)); \
	for (_iter = 0; _iter < _max_user; _iter++)

This does have the side-effect of clamping _max_user to
ARRAY_SIZE(_array), though that might be good in most cases?

(Also, is the "entry_safe" name portion the right thing here? It's not
doing anything "safe" like the RCU versions, and there is no "entry"
since the expectation is to use the _iter value?)

> Any advice on how to detect such problems early on?

Doing static analysis on this means a tool would need to know the range
of values coming in. I wonder if Coverity noticed this problem?

-- 
Kees Cook
