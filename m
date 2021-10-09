Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC996427D56
	for <lists+linux-media@lfdr.de>; Sat,  9 Oct 2021 22:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230003AbhJIUgj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Oct 2021 16:36:39 -0400
Received: from meesny.iki.fi ([195.140.195.201]:60328 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229806AbhJIUgj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 Oct 2021 16:36:39 -0400
Received: from hillosipuli.retiisi.eu (89-27-103-169.bb.dnainternet.fi [89.27.103.169])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 893AC2022B;
        Sat,  9 Oct 2021 23:34:39 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1633811679;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cwgfcscAVjJ/fmxUFVQni0ETup14UF01zfhz8STAAZc=;
        b=zJiRqYMfd12n4I1zDx2l5zyQ2ImarnRg1bxKc9Q2ja1EIjLrDhoRtKkjsDnSEQDgiGgjWR
        vwEK8gGM31M14hlyTdUn5lpuBIsop/mG+5057ZnQz9sV0e14pUksZ0+MzpEZEUDleio0AR
        gWgxl+ygTFv/r+6+cQSWmYux7Qp7eco=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 14037634C90;
        Sat,  9 Oct 2021 23:34:38 +0300 (EEST)
Date:   Sat, 9 Oct 2021 23:34:37 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        "joe@perches.com" <joe@perches.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
Message-ID: <YWH83W8uVbU6RzVe@valkosipuli.retiisi.eu>
References: <m3fstfoexa.fsf@t19.piap.pl>
 <YV3YkXAKxiLmPYwL@valkosipuli.retiisi.eu>
 <m3zgrlkxn6.fsf@t19.piap.pl>
 <20211009090749.hujuwamgkjw2tfcx@uno.localdomain>
 <a8bd12e5-cdb5-ee85-d0a9-03ede990f5d2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8bd12e5-cdb5-ee85-d0a9-03ede990f5d2@infradead.org>
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1633811679; a=rsa-sha256; cv=none;
        b=JZF/R1HDdB3Elg609SYrw0bz12+J9me/dbwMC4Vj2lSnRCMb03OE3LnwSdyr3aSMPFmb8t
        cwJAxGdqDYIWggBhs2rJ9JteTZ5Q3OicKkYAR54YYzosHfmdK4ZV7rVGRLTuuA/PLdBQaw
        e3p/UPSt/9uv3MyPQ/ARjhpPXB2wbKI=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1633811679;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cwgfcscAVjJ/fmxUFVQni0ETup14UF01zfhz8STAAZc=;
        b=OxWkEl7DnxjgJQiMfzv3YWz932M/mEMn1WiHxkqLMB/DwcpGvgblQGjUCb9mVcXMR8vdVm
        /GNOchnk+/7rcerKHpCaQg/PeuFAtrdekr/q6t0gO0eJxjOboDzuzujjozAgDkZrqnA6DS
        yE45gHP5CsiigkECYEPL2WBxMLkW62M=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Randy, others,

On Sat, Oct 09, 2021 at 01:18:50PM -0700, Randy Dunlap wrote:
> On 10/9/21 2:07 AM, Jacopo Mondi wrote:
> > Hi Krzysztof,
> > 
> >     I've been testing this driver in the last few days, thanks for your
> > effort in upstreaming it!
> > 
> > I'll separately comment on what I had to change to have it working for
> > my use case, but let me continue the discussion from where it was left
> > pending here to add my 2 cents.
> > 
> > On Thu, Oct 07, 2021 at 11:11:09AM +0200, Krzysztof Hałasa wrote:
> > > Hi Sakari,
> > > 
> > > Thanks for your input.
> > > 
> > > > Where's the corresponding DT binding patch? Ideally it would be part of the
> > > > same set.
> > > 
> > > Well I've sent it a moment before this one. Will make them a set next
> > > time.
> > > 
> > > > > +#define AR0521_WIDTH_BLANKING_MIN     572u
> > > > > +#define AR0521_HEIGHT_BLANKING_MIN     28u // must be even
> > > > 
> > > > Please use /* */ for comments. The SPDX tag is an exception.
> > > 
> > > As far as I know, this is no longer the case, the C99 comments are now
> > > permitted and maybe even encouraged. Or was I dreaming?
> > > 
> > > checkpatch doesn't protest either.
> > 
> > To my understanding the C99 standard added support for the //
> > commenting style and tollerate them, but they're still from C++ and I
> > see very few places where they're used in the kernel, and per as far I
> > know they're still not allowed by the coding style
> > https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting
> 
> http://lkml.iu.edu/hypermail/linux/kernel/1607.1/00627.html
> 
> Maybe we should update coding-style then.

That's not really a statement for C++ (//) comments as it's against other
/* ... */ multi-line comment styles some of which are used by the
networking stack.

I haven't read all the discussion but I see coding-style.rst still
documents a different multi-line comment style for the network stack.

What comes to // comments, almost all the cases that exist in the kernel
currently outside SPDX tags are either adjacent copyright notices or the
AMD DRM driver. Based on this, I'd rather not adopt that style in a sensor
driver.

-- 
Regards,

Sakari Ailus
