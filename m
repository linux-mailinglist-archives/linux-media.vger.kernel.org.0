Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04D337157C
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 11:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730949AbfGWJtB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Jul 2019 05:49:01 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41127 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfGWJtA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 05:49:00 -0400
Received: by mail-wr1-f67.google.com with SMTP id c2so39240941wrm.8
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=wtfHhe7Z/vdyxnW+i9lj5nwCu8luAeSdCDm5dJa8/uA=;
        b=ScyqGi9phHk5mHjCPMPN/6HnpUql6BHgTERkXnYV4umiaSqDyWT4ABHBtfZIzYXb8I
         fVRx5apgCAqu9U8D/HSFCqBbLwYOFAE4sjE4cAf5Z4graxkEB/I3MuFLWT62MgeBljul
         MluZuZ2vls3IFkVE+e2Lo5xiHTrg2woLSco5HDyZBsoo104YxBJI92QZMKvxqQaDphDK
         tSHmz3xghQB0zL/+4ks68lbvuMRh0lPKNOs2U+IM0G6OP8ktaQqoCcN+rGjIZhqXzdBQ
         2MVb8uz/ppuZ6ScKZaO2GBpzzzAQphJFJGVGxOXwbJ3DbY8p8dB94tMDRL7eexWueQRd
         oz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=wtfHhe7Z/vdyxnW+i9lj5nwCu8luAeSdCDm5dJa8/uA=;
        b=QaguArj8Q0ZSH7CZPhrwce/Zt1nxRG2DSr07WeNixUCdiKFSC26kPpisQU7cZJGLHk
         WShVQja2oPZRK5rKihAWg5eOKT+mP36qgS/f9ISIH1MaiZQZge1GVScRKimI4dqqmTBZ
         5SQm9LOkVoLBAUz9ZLx4IzKZD/BqCwTAT9oR9OxGqq+bxS3k8Oyc72fXOnOmfqEyfgpy
         OSTyJ2QyZtYs20gSKaurIHbds2/UuRSnG1UUpySVjeGcwSV0Tgna03kfLOPo3wb0DjA1
         oWDjCJkdpEgbmmmY+iZdEyXdiXXav8y1n1Sv5ZEaPxhdMBCDZcibFkwRgGB9Je000Sjb
         CXsA==
X-Gm-Message-State: APjAAAXpu3usJPKISpEXmH1/kCaYpqYbJ/t3/VIUpx1dQDv4F/Ua0G94
        Ce9c6qq5+2tjhTNkgq5tl5I=
X-Google-Smtp-Source: APXvYqwHw1m6oiNE4m/LOWyp6HQ9CiRvOu5j8tRvEz9fNtqa9q1zGjqrOS/tSDcjLV0x7bzIBce0AA==
X-Received: by 2002:adf:ed41:: with SMTP id u1mr76826127wro.162.1563875338934;
        Tue, 23 Jul 2019 02:48:58 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id g11sm44509759wrq.92.2019.07.23.02.48.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2019 02:48:57 -0700 (PDT)
Date:   Tue, 23 Jul 2019 11:48:56 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [RFC] Removal of drivers/staging/media/bcm2048
Message-ID: <20190723094856.rlwt3rns3yt6q6uz@pali>
References: <e78d190f-5185-f37a-c212-b88af2198f55@xs4all.nl>
 <20190723090952.GB30669@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190723090952.GB30669@amd>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tuesday 23 July 2019 11:09:53 Pavel Machek wrote:
> On Tue 2019-07-23 10:51:52, Hans Verkuil wrote:
> > This staging driver is now almost 6 years old, but hasn't seen any real
> > development for a long time.
> > 
> > I think it is time to remove it, unless someone plans to do work on this
> > in the near future.
> > 
> > If anyone wants to work on this, please let us know.
> 
> So... unfortunately this one depends on bluetooth driver, which is
> quite complex. Unfortunately, that one was removed from staging while
> it was being worked upon, and seen little progress since that.

There is already a new bluetooth driver hci_nokia for bcm2048:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bluetooth/hci_nokia.c
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/omap3-n900.dts

-- 
Pali Rohár
pali.rohar@gmail.com
