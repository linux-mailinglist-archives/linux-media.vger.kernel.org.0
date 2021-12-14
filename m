Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27C3747407A
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 11:33:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233060AbhLNKdO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 05:33:14 -0500
Received: from meesny.iki.fi ([195.140.195.201]:48486 "EHLO meesny.iki.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233058AbhLNKdN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 05:33:13 -0500
Received: from hillosipuli.retiisi.eu (dkvn5pty0gzs3nltj987t-3.rev.dnainternet.fi [IPv6:2001:14ba:4457:9640:1e2d:1f75:a607:ef37])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id B47382022D;
        Tue, 14 Dec 2021 12:33:10 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1639477990;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dBURt7D01PsN/w8K3Zj7k92UaYtfMSx8V2AUx1/WEc0=;
        b=VvWBGrgwYHW1yVZbzwZD+GBJdl6Lbbi6yaqtEzCAIxdUtiJ+TzSgWZNnCTjE6GF3fgdcWG
        V1YrtbV5jiGzwIYTBE7Vkp0JAg819+K67XhOrY45BMNeQJWu8qvskR6KXOSnf4pHquuN/V
        WvIxD4ixlh6L94LfPSlzeEMYOlX9HG4=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 39796634C90;
        Tue, 14 Dec 2021 12:33:10 +0200 (EET)
Date:   Tue, 14 Dec 2021 12:33:10 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linux-media@vger.kernel.org
Subject: Re: [GIT PULL FOR 5.17] V4L2 patches
Message-ID: <Ybhy5qKkZskE/Kue@valkosipuli.retiisi.eu>
References: <YbdPdh/ivnjZKIOA@valkosipuli.retiisi.eu>
 <20211214112131.6ccc4a5b@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211214112131.6ccc4a5b@coco.lan>
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1639477990; a=rsa-sha256; cv=none;
        b=LQXkw/Gdmircm9cTcLP2IQcfTNPfTeEr2cVhM2wMGcyz25RshxnQvCr+Z1ngNDTW2XcbnU
        8HNoQeuAaCpGKYrg1JkFJNxsnc5S+OcOPmeigegztd6A4sw/M3qEcFDr3JBRMfYggxF4Ea
        8A9W2iBNsbJCPxdaH0E51i6pJ67yLYw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1639477990;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=dBURt7D01PsN/w8K3Zj7k92UaYtfMSx8V2AUx1/WEc0=;
        b=Rfz/xyINgw24OCOb39o8N4ykpLLU1fb0wn/2DA99hrkYtyE70qlCVqaFL5uHycX9v2JZTq
        qatIiC5Kirf570HVKsK+/MEEMVMhQviOSMVAR4BaJV+VXvXHl1Vm8J1HPAdgv6zGfRfowK
        e10ljQSleGYTW2coy+KemzGTkeHr5NI=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Dec 14, 2021 at 11:21:31AM +0100, Mauro Carvalho Chehab wrote:
> Hi Sakari,
> 
> Em Mon, 13 Dec 2021 15:49:42 +0200
> Sakari Ailus <sakari.ailus@iki.fi> escreveu:
> 
> > Hi Mauro,
> > 
> > Here's a few patches for 5.17. In particular, included are isl79987 driver
> > from Michale Tretter and Marek Vasut, and a dependency fix for the recently
> > added max96712 driver.
> > 
> > Please pull.
> > 
> > 
> > The following changes since commit 4383cfa18c5bbc5b9b6a9e77adc12aec1c20b72d:
> > 
> >   Merge tag 'v5.16-rc4' into media_tree (2021-12-07 11:29:41 +0100)
> > 
> > are available in the Git repository at:
> > 
> >   git://linuxtv.org/sailus/media_tree.git tags/for-5.17-2-signed
> > 
> > for you to fetch changes up to 0541ae639fb1165fb309ebf58605f901146c2535:
> > 
> >   media: i2c: isl7998x: Add driver for Intersil ISL7998x (2021-12-08 09:51:54 +0200)
> > 
> > ----------------------------------------------------------------
> > V4L2 patches for 5.17
> > 
> > ----------------------------------------------------------------
> > Andy Shevchenko (1):
> >       media: i2c: max9286: Get rid of duplicate of_node assignment
> > 
> > Marek Vasut (2):
> >       media: dt-bindings: Add Intersil ISL79987 DT bindings
> >       media: i2c: isl7998x: Add driver for Intersil ISL7998x
> 
> There are a couple of issues at the STD decoding logic, plus some coding
> style issues at the isl7998x driver. So, I'm not applying those two
> patches. Those are easily fixable, but we'll be closing the merge window
> for 5.17 this week. If it were just the coding styles, I would have just
> fixed and applied, but the best here would be for Marek to fix the issues
> I point, re-test and submit asap, in order to be on this merge window.

Ack, I see you've already replied Michael. Thanks.

-- 
Sakari Ailus
