Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503EF36741C
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 22:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240388AbhDUUXD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 16:23:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234550AbhDUUXC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 16:23:02 -0400
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F475C06174A
        for <linux-media@vger.kernel.org>; Wed, 21 Apr 2021 13:22:29 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dsl-hkibng32-54fb5d-176.dhcp.inet.fi [84.251.93.176])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by meesny.iki.fi (Postfix) with ESMTPSA id 73D5920180;
        Wed, 21 Apr 2021 23:22:19 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
        t=1619036539;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jsX5qdKJ9ldIpEiSuzOnBAbUaqeSOwTbYWunzqAT5pQ=;
        b=nV919fTytTbbb3/WXEnLUYcQbSSpOZrxHEL7x8CWfUafDFOSHoErOEyq1zJe15simRcnaN
        PFd7INofEiJQCqbB+hvjZ9PoGmszSDqY/bTER5MUbdtXe6ic5hP4BkWvUaO5vOWT4CJDr/
        ENsLKJo9KrxGfU3T5EpL9GTx9yO2M9M=
Received: from valkosipuli.localdomain (valkosipuli.localdomain [IPv6:fd35:1bc8:1a6:d3d5::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 198FB634C87;
        Wed, 21 Apr 2021 23:20:51 +0300 (EEST)
Received: from localhost ([127.0.0.1] helo=valkosipuli.retiisi.eu)
        by valkosipuli.localdomain with esmtp (Exim 4.92)
        (envelope-from <sakari.ailus@iki.fi>)
        id 1lZJMZ-0003S6-2q; Wed, 21 Apr 2021 23:22:19 +0300
Date:   Wed, 21 Apr 2021 23:22:19 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Bernhard Wimmer <be.wimm@gmail.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2] media: ccs: Fix the op_pll_multiplier address
Message-ID: <20210421202218.GK3@valkosipuli.retiisi.eu>
References: <20210414162453.22868-1-be.wimm@gmail.com>
 <20210421123020.GJ3@valkosipuli.retiisi.eu>
 <1bacf8f5-cf36-aa12-bc08-b797558ce92f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1bacf8f5-cf36-aa12-bc08-b797558ce92f@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1619036539; a=rsa-sha256; cv=none;
        b=bJ4dAKVXSET6yI35ieOV86OONsM4ci1uHEODshq+4oXPYjsYLE2CDYd/FXh8bWf/TYOlLm
        LD4KTvMl5D+EcXh3gUqPC/AzrjJAuXvorSxsH8ewGWhWbdFKxIrksTzjXzbLnEv4xfVlUV
        rUdN13cn9bhx1kn+17hAxcziGcTX7OI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=meesny; t=1619036539;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jsX5qdKJ9ldIpEiSuzOnBAbUaqeSOwTbYWunzqAT5pQ=;
        b=EjZfF8wiuDOerZ5NUve7Ej1GKpFFbv81lksDimNjgC2jjNKWZP0NnuUYINojoNgfl7M6rB
        EKb4gM05KgTmTi0ukXl6IOWYI/3/PtmMutiIn3hHlDv0Zo72X5goJkLvSnFOfTb6RXlRn1
        8o/G8nUrECLAq2dP2ISDd99zr0SR+wk=
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bernhard,

On Wed, Apr 21, 2021 at 05:08:33PM +0200, Bernhard Wimmer wrote:
> Hi,
> 
> On 21/04/2021 14:30, Sakari Ailus wrote:
> > Hi Bernhard,
> > 
> > Thanks for the patch.
> > 
> > On Wed, Apr 14, 2021 at 06:24:53PM +0200, Bernhard Wimmer wrote:
> >> According to the CCS spec the op_pll_multiplier address is 0x030e,
> >> not 0x031e.
> >>
> >> Signed-off-by: Bernhard Wimmer <be.wimm@gmail.com>
> > 
> > I missed last time that the register file and the driver were merged at a
> > different time and the driver fix needs to be backported to the stable
> > tree. Could you split the patch into two, i.e. one that has the changes
> > under Documentation and another one in drivers?
> > 
> > I can do that too, just let me know.
> 
> I'm not entirely sure what tags or commits these patches should apply
> to, so it's probably faster if you do it.
> 
> Alternatively if you can point me in the right direction then I'm happy
> to do it (hopefully without too much spam on the mailing list).

I can put the necessary tags in place when I pick up the patches.

The result should be two patches, one with changes under the Documentation
directory and another with the changes under drivers directory. Possibly
the driver patch could mention ge-generation of the files.

The patch touching the Documentation directory should have
"Documentation: " prepended to the subject line.

-- 
Kind regards,

Sakari Ailus
