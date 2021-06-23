Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD8E3B23B2
	for <lists+linux-media@lfdr.de>; Thu, 24 Jun 2021 00:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbhFWW4A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Jun 2021 18:56:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbhFWW4A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Jun 2021 18:56:00 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44DFAC061574
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 15:53:41 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id v7so3056461pgl.2
        for <linux-media@vger.kernel.org>; Wed, 23 Jun 2021 15:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PhW/5nWJvry34gWtMWlmqOr4aezNJfCGGSSwW1Z44S4=;
        b=Y7dexCHKupR8VvExygST6Sg82BTOYcmprRQLLuqPd75nZzlyfrWQ+VQd0nxsE9zU+N
         vCnTJw9wcJDApxd+2hBcksBmXAmNfb8iJGVe4INj6W+SZvfkFTwERl2tEXkRghzQFcAD
         2EsK2VLjaeZJJ/gx7GASNoXImTxNqKVW1z9pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PhW/5nWJvry34gWtMWlmqOr4aezNJfCGGSSwW1Z44S4=;
        b=kN7fbYF5ETYA/0kwxIAYEHnItGdz/WuaKLAqzey+5JjtbTd3XLRxyOh26nnJWigRD3
         oUBfDuNUN1eREnySwvBrza0KDUuiCJuJ60iqOlIMXUK7bKntVUjhYorZHqZ70ClCBNIe
         ZW6++g0bC7gQq0WDyLhGPD7Rei8qtCstcnYE9AhgTN0lcw8lBpC25RpsRIUmQ7IMzi5n
         fc2PUy7NIYOkFb/GiVGqdcdiLSt05RGFzneV0c1Rzp3wwzRlgHpd0BUp2v0Eo4b8Ezvs
         m6wFkSvfSxDuGTY2SPC5xes/CzJobTtHjTnGnOBSN2VaRqOQKzVQSrY+9JoQQtjNQXfk
         vKDA==
X-Gm-Message-State: AOAM533xw/m3yj3TnWNyMcR15jBqLi3b4/NemqJOQaGAYR5Nc/nfKyab
        5j3QA9fgrtsv04ClrS72ih0dlg==
X-Google-Smtp-Source: ABdhPJyUyFjDry9tl4mZDYoGZYq+Q9Sraxpjh2Y81MlBuLC2ZQWwKA6AWu5eqk4J8lc5YD4TqsG/8A==
X-Received: by 2002:a63:755:: with SMTP id 82mr1681659pgh.209.1624488820844;
        Wed, 23 Jun 2021 15:53:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u13sm148169pga.64.2021.06.23.15.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 15:53:39 -0700 (PDT)
Date:   Wed, 23 Jun 2021 15:53:38 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: omap3isp: Extract struct group for memcpy() region
Message-ID: <202106231547.1212335D@keescook>
References: <20210616185938.1225218-1-keescook@chromium.org>
 <YMpUR34kFSbiyi+q@pendragon.ideasonboard.com>
 <202106162119.859E9A80B@keescook>
 <YNOxuybjpLxr6sin@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNOxuybjpLxr6sin@pendragon.ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 24, 2021 at 01:12:11AM +0300, Laurent Pinchart wrote:
> Hi Kees,
> 
> On Wed, Jun 16, 2021 at 09:22:23PM -0700, Kees Cook wrote:
> > On Wed, Jun 16, 2021 at 10:43:03PM +0300, Laurent Pinchart wrote:
> > > On Wed, Jun 16, 2021 at 11:59:38AM -0700, Kees Cook wrote:
> > > > Avoid writing past the end of a structure member by wrapping the target
> > > > region in a common named structure. This additionally fixes a
> > > > misalignment of the copy (since the size of "buf" changes between 64-bit
> > > > and 32-bit).
> > > 
> > > Could you have been mislead by the data64 name ? The difference between
> > > omap3isp_stat_data_time and omap3isp_stat_data_time32 is the size of the
> > > ts field, using 32-bit timestamps with legacy userspace, and 64-bit
> > > timestamps with more recent userspace. In both cases we're dealing with
> > > a 32-bit platform, as the omap3isp is not used in any 64-bit ARM SoC.
> > > The size of void __user *buf is thus 4 bytes in all cases, as is __u32
> > > buf.
> > 
> > Ah, yes, that's true. I was hitting this on arm64 builds
> > (CONFIG_COMPILE_TEST) where __user *buf is 64-bit. So, the "additionally
> > fixes" bit above is misleading in the sense that nothing was ever built
> > in the real world like that.
> > 
> > The patch still fixes the compile-time warnings, though.
> 
> I What's the compile-time warning ? I tried compiling the driver for
> ARM64 and didn't notice any.

Sorry, I didn't include the background well enough in the commit log,
but it's part of a tightening of memcpy() under FORTIFY_SOURCE and
also -Warray-bounds enablement. Here's what I've been saying on other
patches (this one was different because it seemed to be just broken
code):

  In preparation for FORTIFY_SOURCE performing compile-time and run-time
  field bounds checking for memcpy(), memmove(), and memset(), avoid
  intentionally writing across neighboring fields.

Anyway, I can carry this until the full series is posted, but I'm still
working through a few more fixes before I send the whole thing. This
patch was one of a handful that didn't have any series dependencies.

-Kees

-- 
Kees Cook
