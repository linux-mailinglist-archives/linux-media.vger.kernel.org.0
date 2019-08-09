Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC85E879D5
	for <lists+linux-media@lfdr.de>; Fri,  9 Aug 2019 14:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406813AbfHIMXN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Aug 2019 08:23:13 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37184 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406789AbfHIMXN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Aug 2019 08:23:13 -0400
Received: by mail-lj1-f196.google.com with SMTP id z28so37693548ljn.4
        for <linux-media@vger.kernel.org>; Fri, 09 Aug 2019 05:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=aANeZXMgkBF3/v6aeB6SAIlu91D1yiNeNAPNapY7vxw=;
        b=myL20rDwIA7uB6htAKf/A7RSvi/nR2P5txGRB7cUyeyT0ei1uwOUKcPnENsrQRnBWC
         X4fjg+uCmT379bK5Hy5QWWP8dn327arysQwC0GZ8rouFUzaKYfIBOkU9g3FXkER4atvk
         DlaQd5aA8ZaBl+ckuyD3W5Xp87DNi1jei0NDTokswP3tM7jm941oYz1s0l7nLV0K2h5u
         B6LoEtB73SW3i9CygR0+h8GV6M8ebvD5LXbuxolKI7ievfkFRrRKDlH2M/XPXvjZNjn+
         zskuNN6xylxW6o5GkvN+QmMqgSBw/raluvu4VcpLiMzq8IgvZwacQvDMSL1ec6OaBoaS
         4O4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=aANeZXMgkBF3/v6aeB6SAIlu91D1yiNeNAPNapY7vxw=;
        b=uTpjVRawULx3jhOWgzTpTS3xvwGcLaNprAckHqXY6JbHbhQKioXoY/4wqQ1fCqdOF8
         7armEfyeFORNePRqOgZFCKfeMa9g+6I+ciSmdjLzzI6Mzz60jsXtpE0AI94fkr8U/pwl
         /nVZf0ZmZOBAs3L2oLGF8yThfY72LM5kEu8Fs8eFpie0a3gu/3kKL2cjc99TH6/LGwjO
         g5RkGrbMtNYhPb8XGQy6hkAyXdNeIP2t/65L3hwyypGvJOmhGUF+qvc39AY1l9kMire1
         w/L5QfRm39nMxDxvtQwMhE8HA2vJGMwTJO+iS7iraKaZ9Tdyyj62G7DUaZR0LJkusZTs
         ybGQ==
X-Gm-Message-State: APjAAAWYf+yXwaJKm+apva4rPZZJWiekQUduTwSm88Hw45fy9xekKqV8
        5AoEe9o3NqHCS5vLyyUE1HQb8A==
X-Google-Smtp-Source: APXvYqxjx7IEH09f3KwYkB3X8EKR5voemCyHakEOVgXJ0kceq/PN+VTDIEZVRnO4wuWdPlsCMm0cgg==
X-Received: by 2002:a2e:9788:: with SMTP id y8mr11056601lji.41.1565353391854;
        Fri, 09 Aug 2019 05:23:11 -0700 (PDT)
Received: from localhost (customer-145-14-112-32.stosn.net. [145.14.112.32])
        by smtp.gmail.com with ESMTPSA id 2sm19374385lji.94.2019.08.09.05.23.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 05:23:11 -0700 (PDT)
Date:   Fri, 9 Aug 2019 14:23:11 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] max9286: Add MAX9286 driver
Message-ID: <20190809122311.GF24385@bigcity.dyn.berto.se>
References: <20190809040558.10698-1-niklas.soderlund+renesas@ragnatech.se>
 <20190809040558.10698-3-niklas.soderlund+renesas@ragnatech.se>
 <5a640d94-799a-71ed-9f02-014adaabd595@ideasonboard.com>
 <20190809120429.GE24385@bigcity.dyn.berto.se>
 <8f5ce55a-666a-2350-b557-c275a69218c0@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8f5ce55a-666a-2350-b557-c275a69218c0@ideasonboard.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

On 2019-08-09 13:12:49 +0100, Kieran Bingham wrote:
> On 09/08/2019 13:04, Niklas Söderlund wrote:
> > Hi Kieran,
> > 
> > Thanks for your feedback.
> > 
> > On 2019-08-09 09:09:43 +0100, Kieran Bingham wrote:
> >> Hi Niklas,
> >>
> >> This should be at least v5.
> > 
> > I don't agree ;-) This is a "new" series where multiple streams are not 
> > supported and there are no external dependencies. To indicate this I 
> 
> I'm afraid there's nothing new about a version of this series with
> support for only a single stream.
> 
> See version 2 of my series:
> 
> https://lore.kernel.org/linux-media/20180808165559.29957-4-kieran.bingham@ideasonboard.com/

Was not aware of this posting, then yes I do agree with you this should 
have been v5. Sorry about that.

> 
> 
> > reset the version. I don't feel strongly about this next submission can 
> > remedy this if you do feel strongly about it.
> 
> I find it very confusing to have reset the version but kept exactly the
> same patch title.
> 
> It's a fork of the series :D

:-)

I think this proves we need to get this driver upstream so we can start 
submitting patches towards something and not brew our our brand of stuff 
we have laying around and find all over the place.

> 
> >> Did you take the last v4 and work from there?
> >> I have made changes since the last posting. Did you get an update from
> >> my branches?
> >>
> >> What changes have you made to this posting compared to whichever
> >> patch-base you have taken to start from?
> > 
> > I took my latest known good state and diffed it with all gmsl branches i 
> > could find picked what seamed most recent. Then I removed multiplexed 
> > stream support, fixed a few todos in error paths to clean up notifiers 
> > and unified naming of the private data structure.
> 
> 
> I'll diff your version with my latest.
> 
> There were other review comments worked on from Sakari too., and there
> is an outstanding comment from Rob to complete on the bindings from v4.
> 
> --
> Kieran
> 
> 
> 

-- 
Regards,
Niklas Söderlund
