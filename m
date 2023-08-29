Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F93F78C21E
	for <lists+linux-media@lfdr.de>; Tue, 29 Aug 2023 12:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233053AbjH2KPc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Aug 2023 06:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235058AbjH2KPI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Aug 2023 06:15:08 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DD5D103
        for <linux-media@vger.kernel.org>; Tue, 29 Aug 2023 03:15:04 -0700 (PDT)
Received: from hillosipuli.retiisi.eu (dkzdf0gkyyyyyyyyyyyyt-3.rev.dnainternet.fi [IPv6:2001:14ba:4506:4f15::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sailus)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4RZjwP36zsz49Py8;
        Tue, 29 Aug 2023 13:15:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1693304101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=av5IH3Y0ToH9qHXiJQbazKyS7ZxZfExMtKsWMUwVUIY=;
        b=jni2IGjMg8+VMzKyzXNvDtC2ICMlnHX2uekwgeBRPcvV7qWs+wQSp9vVJFY5QyVjZ2DElL
        uiHFW3xpDu3ISiUObCH0Sotp0xjLF1QLsaVe3zWszardvC/y4U6/zoVapR+mO7J42v7Z9l
        N87zuofuabV0mCwcmw3I7T0mKTNO37wkKmgiZyq21fol9pgaDvvfMnOGlqeJFHbu3NZEsg
        lVqHHozUVyT5lQiQPpMSsVRYIqv9BokeBLWwJgOmWAWaXSiThX+9pgwKOqrAfvU9/i4es8
        bASotG9KFxiZ7OmBc5/i4ACYB11IwKqz5Fn5WtlDhxiFYa6Lx47iokDDZhpftQ==
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1693304101; a=rsa-sha256;
        cv=none;
        b=XfUvo5oH6B52TMAc80UPHRQ/mQY7dwJxGVBvMMyy7lNRw+rmNi14Mk3mSoMTz8aEUOUFYq
        +g4Tk2BgEGf2foM8ZTK6d9NuIojLSAbH0YBslRZkKiLt0RYwXButM9UsRMz3FT7wBx9EEX
        ssmwniQhFTGAcdB84JsCksHTLH5NvQ2l9NoTYPXpjNX/6XlKD+w3805afGo/UERrJ3wLXh
        NQiBMYUmFVTQklZlz8B8AIjH+iIc4F5pJvQ19edekQznRx/gN3H00tNn10pi0qw9skUZhn
        GZWKxszy58PI9RcobXZmTZyIO3YCprGpHtYJJ34sX8Eq4IroQERSgzBl/3+jDQ==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1693304101;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=av5IH3Y0ToH9qHXiJQbazKyS7ZxZfExMtKsWMUwVUIY=;
        b=QiMQQVz/bD6PfCHhrt6+kiHbTvOhWwdMhn5Next8QwZlQusCMSNwKsWi3TUOd4dbnsgQas
        E+JMTtdxG3AQHJ6inFgdzy/fwimY+9pStp93D9+7qcWGENN7XugazC1WEdkWNaJtr3gOaC
        FwnGZB+PzE3Vk8wEUFhRFCiOMfH/LI+JdYr526GiWxA/S1NfNs4uGBEG9vRo0qHUZUjAdD
        pT9fARv5m7bUpyPaU/t7QZTFXZ/GATK+JW7vvZq7KF8wP7kcvdVqK35RPEWO2dZZYULe9L
        5u37K20fNpOEaUwM/gLjW/666aAanXhI5SOtdSLPOfd63bDzFjGFSEAqJWEhCA==
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 8DA52634C99;
        Tue, 29 Aug 2023 13:15:00 +0300 (EEST)
Date:   Tue, 29 Aug 2023 10:15:00 +0000
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>, linuxtv-ci@linuxtv.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [ANN] Introducing build scripts to test
Message-ID: <ZO3FJGdMUKwZtLsO@valkosipuli.retiisi.eu>
References: <18989016-6392-a77b-6cf7-1223c9161def@xs4all.nl>
 <fcag2mca7wkmujw5se5km5da4ns7cxnle3yn7jlu2ca4j2buoy@nxkvnvq4d6y4>
 <f61cc313-4c5f-46e0-3374-05cf3907f68a@xs4all.nl>
 <20230828142622.GO14596@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828142622.GO14596@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Hans,

On Mon, Aug 28, 2023 at 05:26:22PM +0300, Laurent Pinchart wrote:
> On Mon, Aug 28, 2023 at 04:14:56PM +0200, Hans Verkuil wrote:
> > On 28/08/2023 16:05, Jacopo Mondi wrote:
> > > On Mon, Aug 28, 2023 at 03:29:41PM +0200, Hans Verkuil wrote:
> > >> Hi all,
> > >>
> > >> We have been working on simplifying the media maintenance, and one part of that is
> > >> standardizing on build tools, in particular to make it easier for patch submitters
> > >> to run their patches through the same set of tests that the daily build does.
> > >>
> > >> This helps detect issues before you submit your patches.
> > >>
> > >> I have been working since July on transforming my hackish scripts to something
> > >> that is easier to use and of better quality. While there are still a few rough
> > >> edges, I consider it good enough to have others start to use it.
> > >>
> > >> To get the build scripts run:
> > >>
> > >> git clone git://linuxtv.org/hverkuil/build-scripts.git
> > >>
> > >> All the test builds will happen within this directory. It is completely separate
> > >> from where you do you normal development, instead you point it to where your
> > >> git repository is.
> > >>
> > >> See the README contained in the build-scripts git repo for all the details on
> > >> how to set it up.
> > >>
> > > 
> > > I've been using your scripts since after ELC-E and I can tell they're
> > > useful!
> > > 
> > >> Currently the scripts expect a debian 12-based distro (likely debian 11 will work
> > >> as well). I have no idea if it works well on Red Hat or Suse. If you use one of
> > >> those distros, and you get it to work, then a patch updating the README file with
> > >> the correct list of packages to install would be welcome.
> > > 
> > > Speaking about distros, I was wondering if you still consider a
> > > requirement to build all compiler or we should instead try to use the
> > > distro provided ones when possible to test the distro-shipped version
> > > ?
> > 
> > I strongly believe we should build the cross compilers. The reason is that
> > otherwise you get a wide variety of compiler versions, each with typically
> > different compiler warnings. It's a pain for a developer to see different
> > warnings than the person that merges those patches.
> > 
> > It's a a regular problem that the daily build sees different warnings than
> > you do locally with the distro's compiler.
> > 
> > Doing it this way also makes it easier to upgrade to the latest compiler
> > version, certainly quicker than a distro would do.
> > 
> > It's about reproducibility, really.
> 
> There's value in testing with different compiler versions though. The
> kernel's documented minimum gcc version is v5.1 at the moment. I
> certainly don't want to build myself with all versions between v5.1 and
> v13.2, but collectively we could cover more ground.
> 
> Regardless of this, I already have recent cross compilers (built with
> buildroot) for ARM and ARM64, and I'd rather use those than duplicating
> compilers. Anything that consumes extra disk space is a serious
> hinderance.

I have to say nearly all issues I've come across I have not seen myself in
my own (trivial) tests are related to either different architecture or
different kernel configuration.

There have been a couple of issues that were related to compiling the
kernel with LLVM, too, but they are much more rare. I suppose there may
have been some related to different GCC versions but I don't remember any
over the last ~ 5 years. :-)

So IMO varying configuration and building for more architectures is
beneficial, possibly compilers, too, but for different compiler versions
not so much.

-- 
Kind regards,

Sakari Ailus
