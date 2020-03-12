Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D812C182F26
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2020 12:29:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgCLL3V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Mar 2020 07:29:21 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35105 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgCLL3V (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Mar 2020 07:29:21 -0400
Received: by mail-lj1-f196.google.com with SMTP id u12so6011896ljo.2;
        Thu, 12 Mar 2020 04:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OAB6gMFhzcwV5kl/BeI0JFOF2f+1j5wU7pBRkTaOMms=;
        b=ba9QbPYTFtD80twZyp20xPwaLRb2wWYzVtnxKSTyKqvKa40VmWqbhmDyU6j6UWQGfR
         RCqtof/uX13eCypXBzE6e/T6x+YrcJg5bChqKzcwrB7Gk8wOYMRqjdWzCQgdYMY1o/DH
         y2D7bHNanL7N4x5doVrnW3RPsbRAbW/Am3yu1P4OUuZw7UUpJBRB2bsOyILXcA5XE1gM
         MVaiejCMujxV+KqLDI2VvceH9xpKVjkHNmUAdg9HVXcOnVi1upyditsR63BGK+uEfoAR
         vMm8i5gOVaAgJb1uiMoQ4rRMdexhdfe84WeQI2Qb6zo4i4FBnw70bmTrE6+5XM88x+ja
         U+tQ==
X-Gm-Message-State: ANhLgQ1xs7p/JIM3GFo4WjmEVpXNzrwLwHkzY/HjfTC3A51rQozLBk7y
        /umCgmQspIxMepSglw3yRRNULOjO
X-Google-Smtp-Source: ADFU+vsJP7t4xJ7Am4mlVefGnSM8da6qHpJKNrhjHxIcIFcm1xif9tjnNVK425LKCeM/0vb7SFVMsg==
X-Received: by 2002:a2e:8597:: with SMTP id b23mr4997656lji.181.1584012557059;
        Thu, 12 Mar 2020 04:29:17 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id u16sm7597252lfl.37.2020.03.12.04.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 04:29:16 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jCM1R-0005rr-13; Thu, 12 Mar 2020 12:29:05 +0100
Date:   Thu, 12 Mar 2020 12:29:05 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Johan Hovold <johan@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sean Young <sean@mess.org>, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] media: fix USB descriptor issues
Message-ID: <20200312112905.GQ14211@localhost>
References: <20200103163513.1229-1-johan@kernel.org>
 <20200214080254.GK4150@localhost>
 <20200312112330.GO14211@localhost>
 <82e0041b-be4b-1681-c016-d4eeea37abea@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82e0041b-be4b-1681-c016-d4eeea37abea@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 12, 2020 at 12:26:35PM +0100, Hans Verkuil wrote:
> On 3/12/20 12:23 PM, Johan Hovold wrote:
> > On Fri, Feb 14, 2020 at 09:02:54AM +0100, Johan Hovold wrote:
> >> On Fri, Jan 03, 2020 at 05:35:07PM +0100, Johan Hovold wrote:
> >>> This series fixes a number of issues due to missing or incomplete sanity
> >>> checks that could lead to NULL-pointer dereferences, memory corruption
> >>> or driver misbehaviour when a device has unexpected descriptors.
> >>
> >>> Johan Hovold (6):
> >>>   media: flexcop-usb: fix endpoint sanity check
> >>>   media: ov519: add missing endpoint sanity checks
> >>>   media: stv06xx: add missing descriptor sanity checks
> >>>   media: xirlink_cit: add missing descriptor sanity checks
> >>>   media: dib0700: fix rc endpoint lookup
> >>>   media: iguanair: fix endpoint sanity check
> >>
> >> Just sending a reminder about these as it seems only the last one has
> >> made into mainline (and stable) yet.
> > 
> > Another month, another reminder. Three of the above patches still hasn't
> > been applied.
> 
> I've delegated these to me and will make a PR today/tomorrow.

Thanks, Hans!

Johan
