Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2219B69B8
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2019 19:39:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726941AbfIRRjf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Sep 2019 13:39:35 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:40629 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfIRRje (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Sep 2019 13:39:34 -0400
Received: by mail-pf1-f195.google.com with SMTP id x127so449237pfb.7
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2019 10:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OQtIFGeVkTt+XnxHkc+z9XK9rrx2CvqMTzjHAAqCAq8=;
        b=iPan1dxijBNbxrzcel3IP3NxEFIQ2DpMHg5pbTDR5WG/DxgVrD/XO0BFi2G9SmHtr0
         hsfgs+usig0n+bpbkTCWO9yIT/Zgxec7IWQNnOYFvguH1z1hjPScLIXLyHH3BYINTuZ3
         GYQwPrlYz6/3tZvW4BionbaKlmM548qDUogr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OQtIFGeVkTt+XnxHkc+z9XK9rrx2CvqMTzjHAAqCAq8=;
        b=qoBFxVdS5XMOxzgk55gmuTqIJF7UFajZGN//cMNJADnYUbtNXiXh/Ogy8zoY+Bt3Bl
         x9yvbKshC8wIphRJqRokCnmFuJz61stM7YC6HQb96oi97PXF+T4tWx29jamNvPABOFFB
         CKQLb6NChfjy8ORkhmwp85guodnyqeHiYlwV1+z7TG90cp2r7BU72vR1YTdFGgBWG1UI
         8Y0LEhswA4Ex27zM683XZgVnjsJTwkwr2vbNdNoEmR6rAQFR3Cy8hm2SH+upTJhs1ROJ
         9pK1POMAq6Nn5oBLzyHW+i0Pd/0MRQ5QODPYT2b2HYYgiSnyq/Vh5EioylFx4EwM6LVI
         Vqkg==
X-Gm-Message-State: APjAAAWfvATcRXXbbaAySYe9TA96b+zTGZgQhowHJ60h6RSHMZO8m1S4
        9ddn5V4V8f9Cssi5t3sLo9JmfQc1Ikk=
X-Google-Smtp-Source: APXvYqwG2qRrTADhtT/P1eKuAfeGeBIbdGOL68Nkf2bZNgg59ymVsVmtILP43efvQ1h66nMbXYEffg==
X-Received: by 2002:a17:90a:1c7:: with SMTP id 7mr5043331pjd.95.1568828374393;
        Wed, 18 Sep 2019 10:39:34 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g19sm6797067pgm.63.2019.09.18.10.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2019 10:39:33 -0700 (PDT)
Date:   Wed, 18 Sep 2019 10:39:32 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     ksummit-discuss@lists.linuxfoundation.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: Re: [Ksummit-discuss] single maintainer profile directory (was Re:
 [PATCH] media: add a subsystem profile documentation)
Message-ID: <201909181033.928B3F498D@keescook>
References: <156821693963.2951081.11214256396118531359.stgit@dwillia2-desk3.amr.corp.intel.com>
 <434c05bddd2b364e607e565227487910a8dd9793.1568391461.git.mchehab+samsung@kernel.org>
 <201909162032.F4462D3@keescook>
 <20190917102817.263517b5@coco.lan>
 <201909170930.B8AD840@keescook>
 <20190918082326.49a19a24@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190918082326.49a19a24@coco.lan>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Sep 18, 2019 at 08:23:26AM -0300, Mauro Carvalho Chehab wrote:
> You can't simply rename MAINTAINERS to .rst and let Sphinx handle it,

Right! Sorry, I meant what you'd suggested earlier: having a script
convert it at doc-build-time.

> The latest RFC about that with I sent was this one:
> 
> 	https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1238576.html

Cool, I've found it on Lore now too:
https://lore.kernel.org/lkml/20160923120733.546a4b7a@vento.lan/

I think having a script generate the entire thing might be better
(instead of having duplicated instructions at the top of both files),
which I see is what Joe suggested too.

> +.. include:: ../../MAINTAINERS
> +   :literal:

Nah, let's do a full make target as you'd suggested back in that thread.

I'll give it a shot if you don't beat me to it. :)

-- 
Kees Cook
