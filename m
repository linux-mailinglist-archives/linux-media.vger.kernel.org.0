Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 299791093BA
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 19:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbfKYSvW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 13:51:22 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38895 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbfKYSvV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 13:51:21 -0500
Received: by mail-pg1-f196.google.com with SMTP id t3so7182152pgl.5;
        Mon, 25 Nov 2019 10:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=aiHz+U1DS3plGSVGA4dIIZPJHtpeKsop13dxvM844KA=;
        b=hCiw9xd4cwhMo0WHdTJ5D91kTIesTR33OmEeGm1ZECd0F6p3Rim1k1lX8PUOWUxecq
         SsF8M6lr+KNzCdHRZ1/X3mQJnLNi3hUIXw9rSo2hw8//I3HdQwLjgPTvv0X4ZhMNwpP1
         4ieF60L1VsLBZ552L9RvDdjjOmSYggJYTNLDVXX1BtzoPD5lKnAbJ2F5+KRZjaSNkxRB
         479KeXVYhtg5NqHdKsOMYMIDCMZP32ESgCNpqytP4qQWZD+uf+2bmm5JXNH1+LUXD/w/
         HrPGRIqdIsWhzgcrN2LwaZQBQyeDvioTGJdD2wj2H1UvLvir+2QovwBOhDPUvfQbmphL
         82KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=aiHz+U1DS3plGSVGA4dIIZPJHtpeKsop13dxvM844KA=;
        b=DBSpzY1S4e98I9kyheea0m15Pu4y0aiS1TokwylNHS37l5aI2sDJM3Qb5/JNCmfhbg
         eJNJuLsqtZd1mgkYk5XcfcMcxv9JygAZXxKdnZTWy52DOPUVuIky2IHIfyQlE7PDKw2I
         eaURHSeWh4rKUB51XM3D2m6QmZNAZNQxeBh4rmT0gCG+e4m7FX17Cbo0qpFMonJNOq/w
         jZGSNYXML0/1V94YWkq1Pt0LuLohOKvOp5ZM2gZmcBkLCJjhjvVTfFSxnKZLxR/84mAA
         xeuhvlcOhe2DorWVU5UOgguM21b3s4HZlfjcnDRdNt1fejhn3Q3mjNPmHxbdPgmhaIO0
         /UZQ==
X-Gm-Message-State: APjAAAWkuWEvPb440mzr1S+FazNwmBNqvz4c6ovHhXdguxD5QhPnvhqa
        eTPh+DZB1GGjn5W3x+hu3UO1kynv
X-Google-Smtp-Source: APXvYqych5ocZIVeEl4Q7I5NG2/0c1GC4FPBCRB3ie1NfIioi5lvdaq94j3YTHJE8kESQ9cF5G0KTQ==
X-Received: by 2002:a62:1944:: with SMTP id 65mr484468pfz.151.1574707880861;
        Mon, 25 Nov 2019 10:51:20 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id k4sm9486580pfa.25.2019.11.25.10.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 10:51:19 -0800 (PST)
Date:   Mon, 25 Nov 2019 10:51:17 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-input@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Nick Dyer <nick@shmanahar.org>,
        Lucas Stach <l.stach@pengutronix.de>,
        Christopher Heiny <cheiny@synaptics.com>,
        Vandana BN <bnvandana@gmail.com>
Subject: Re: [PATCH 3/5] pixfmt-tch-td16/tu16.rst: document that this is
 little endian
Message-ID: <20191125185117.GI248138@dtor-ws>
References: <20191119105118.54285-1-hverkuil-cisco@xs4all.nl>
 <20191119105118.54285-4-hverkuil-cisco@xs4all.nl>
 <c1e0aa48-f22d-afcf-d9a1-1ab4302d0ee6@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1e0aa48-f22d-afcf-d9a1-1ab4302d0ee6@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Sat, Nov 23, 2019 at 05:12:43PM +0100, Hans Verkuil wrote:
> Hi Dmitry,
> 
> Is it OK with you I merge this patch via the media subsystem?

Yes, absolutely. It does not touch any of the input bits so I actually
expected it to go through media tree.

Thanks!

-- 
Dmitry
