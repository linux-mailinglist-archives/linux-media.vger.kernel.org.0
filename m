Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEA3FA21AD
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2019 19:03:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbfH2RDM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 13:03:12 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44398 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727735AbfH2RDM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 13:03:12 -0400
Received: by mail-pf1-f195.google.com with SMTP id c81so2463267pfc.11
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2019 10:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cT40aX1Rm158dXbZvg7FygLmkaJhPhVyHtqBmt7878E=;
        b=PAXO8ZbCVqCw0eVBICcj0380noufm8aJLcc22R6FQyST4NWgBmi93l2YHrrW8mL0Bi
         oytzULxOstEziMDvAjIC/na6bXjIH2Gbhn+UtLkEiHbSzC5zuigdjKWDl5IkU9KNaTHk
         vNXzdah4WS39Vp4NQH4N7miEiBLnAxdMrpmLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cT40aX1Rm158dXbZvg7FygLmkaJhPhVyHtqBmt7878E=;
        b=D1Rs/9Wz1hZWpmfSdIenV8+pWisurbmZhGoPkxBwTh7wEKvjriwj/tSWfmHVtz9Clg
         fegaB+nyLsro+tg7tY38YelGrjfNraxSZMtzZEqtSiDXJD7srn6/SIJjaIVag+sqEYPq
         k1H4G2RRdeA3cFfJ4goB7i3X7zpj/dLJ81UQo9iOOE+OtepR85NsY9iA/5bkwzKWUIqN
         wrhHw/TjKuF3qjEUa3OpEiZq4MZe5EQVoipOe70f7x30Pglp92icFQ9rWato5d17tN62
         PNzO7wo0dSY4pcAED64Co27Z3k+4NH24CcaKEbOdx1GDDGpFZmCfcg/1TFqUvhNWDN4k
         MCtA==
X-Gm-Message-State: APjAAAVbfiujmzIFAfYj8fKxIGfPucj5hNkaG+rB6GW5Nb2yZOHm04at
        FP2xynFQe69mpdW1JT38R88kGA==
X-Google-Smtp-Source: APXvYqx/Q0fFZvZWabn6tcL2I8GORQH9uYo7dBQccjsc+OV6Z3702ta4szivlvQBDGAk0mtwjAaNUQ==
X-Received: by 2002:a62:1a45:: with SMTP id a66mr13125850pfa.142.1567098191599;
        Thu, 29 Aug 2019 10:03:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id t9sm2671099pgj.89.2019.08.29.10.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 10:03:10 -0700 (PDT)
Date:   Thu, 29 Aug 2019 10:03:09 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Andy Walls <awalls@md.metrocast.net>,
        Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
        Anton Sviridenko <anton@corp.bluecherry.net>,
        Andrey Utkin <andrey.utkin@corp.bluecherry.net>,
        Ismael Luceno <ismael@iodev.co.uk>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Antti Palosaari <crope@iki.fi>, Mike Isely <isely@pobox.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Colin Ian King <colin.king@canonical.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 6/7] media: don't do an unsigned int with a 31 bit shift
Message-ID: <201908291002.2F67F5ADA@keescook>
References: <4a411ba155eb062b6575aba0824123c840806c0b.1566502743.git.mchehab+samsung@kernel.org>
 <1a78a757b37d2628312e1d56d7a741ba89d42a91.1566502743.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a78a757b37d2628312e1d56d7a741ba89d42a91.1566502743.git.mchehab+samsung@kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 22, 2019 at 04:39:33PM -0300, Mauro Carvalho Chehab wrote:
> Doing something like:
> 
> 	i32 foo = 1, bar;
> 
> 	bar = foo << 31;
> 
> has an undefined behavior in C, as warned by cppcheck, as we're
> shifting a signed integer.
> 
> Instead, force the numbers to be unsigned, in order to solve this
> issue.

I also recommend using the BIT() macro, which does the ULing correctly,
etc.

i.e. instead of:

-	keyup = (gpio & ir->mask_keyup) ? 1 << 31 : 0;
+	keyup = (gpio & ir->mask_keyup) ? 1UL << 31 : 0;

use:

-	keyup = (gpio & ir->mask_keyup) ? 1 << 31 : 0;
+	keyup = (gpio & ir->mask_keyup) ? BIT(31) : 0;

-- 
Kees Cook
