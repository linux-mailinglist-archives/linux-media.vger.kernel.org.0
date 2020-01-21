Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F500143F80
	for <lists+linux-media@lfdr.de>; Tue, 21 Jan 2020 15:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbgAUO2U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jan 2020 09:28:20 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:42362 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727508AbgAUO2U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jan 2020 09:28:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=T9Vym10ZYiJ3JrTDmycxHGNFN/lQQVOsbqkuKAqRN1w=; b=PEg+MU9LMAo/p/5LQWiCiSTHL
        VIl3WTbtYszoscDkSs5Vwn+E8Lt14SytpnnMCIo+DqRW1/pK4YH16IQSSqdhu/IdrsZF5Ns7flKjn
        pd0DVmNmmswiQRs5McQzixBzxz6U6YcsF8gdjGADYjtvlpNoaNjhaxqEWzx0uL6Hpqta2IgUVDCD/
        Oi0Rj/WIyU17fcqpDJp1ZD17Q6Ohmc1S/NbZYRxg6uHVGWkEvT2k9EpNW1CBvcK5Lcno+/S0suQkl
        X/nfERLfjnU8fvzZSboI0TbFWW4fBs6PcRpdFlHJKI9xgMaMB1orRYZmrCDrtal9X5uGvUbp/ENeF
        xnVgM3Enw==;
Received: from [179.179.33.167] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ituVs-0002O3-8K; Tue, 21 Jan 2020 14:28:18 +0000
Date:   Tue, 21 Jan 2020 15:28:03 +0100
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        LibCamera Devel <libcamera-devel@lists.libcamera.org>,
        Jenkins Builder Robot <jenkins@linuxtv.org>,
        linux-media@vger.kernel.org
Subject: Re: [libcamera-devel] Build failed in Jenkins: libcamera #72
Message-ID: <20200121152718.44c60a8a@kernel.org>
In-Reply-To: <20200121135149.GA7686@pendragon.ideasonboard.com>
References: <659134945.14.1579046596894.JavaMail.jenkins@builder.linuxtv.org>
        <263aa6e2-9b6c-5939-687d-005ae8fc2059@ideasonboard.com>
        <20200121141246.4d1b2ac5@kernel.org>
        <20200121135149.GA7686@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Tue, 21 Jan 2020 15:51:49 +0200
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> > I added a clean step, just to be sure, e. g. the current build script is:
> > 
> > 	ninja -C build clean
> > 	meson build -Dandroid=true
> > 	ninja -C build  
> 
> The recommended steps are
> 
> meson -Dandroid=true build
> ninja -C build clean
> ninja -C build
> 
> This will ensure the build directory is created if it doesn't exist
> before trying to run ninja in it. However, the meson step will will be a
> no-op in case the directory exists. If you want to change options for an
> existing build directory, you have to run
> 
> meson --reconfigure -Dandroid=true build

I tried it. Didn't work: it keeps preserving c++11 instead of using c++17.

> 
> This will fail if the build directory doesn't exist. The following
> script should work in all cases.
> 
> options="-Dandroid=true"
> 
> if [[ -d build ]] ; then
> 	meson --reconfigure $options build
> else
> 	meson $options build
> fi
> 
> ninja -C build clean
> ninja -C build
> 
> > But it still produces errors when trying to build.  
> 
> Clean is a good idea, but won't be enough when core configuration
> options of the project change I'm afraid :-( We need to wipe out the
> build directory completely, or run
> 
> meson configure -Dcpp_std=c++14 build

I prefer not doing that. As you're saying below, if the build changes
default to some later version, build will break again.

> 
> However, the only configuration option that requires such an operation
> to prevent breakages is cpp_std, and we don't envision switching to
> C++17 very soon. Even if we did, that would be a one time change, as
> there's no other published C++ version after that :-)
> 
> Could you handle this manually to fix the build ? No further action
> should be needed after that.
> 
> While at it, could you also set -Dv4l2=true to compile-test the V4L2
> compatibility layer ?

After doing a 'mason setup --wipe', v4l2=true is automatically set. Anyway,
I added an option that will display the configuration. This way, someone can
check that all options that should be enabled are there.

Cheers,
Mauro
