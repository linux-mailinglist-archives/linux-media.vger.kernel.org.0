Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67A9FAA056
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 12:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388162AbfIEKrI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 06:47:08 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53848 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727160AbfIEKrH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 06:47:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=V5q/iL6TQFKVRLriXs4u0ENevVfl5lZEb9F1LrjSnaU=; b=O+IWbsCkCVXK9KTwSY02xtniD
        E/AQb3HztIGacw60JxZ5g60jfqlK9/jNbdEHUt42IKCKSoYewPk6xCOHKqKfJoP0Dm2YhgrRh7QrT
        C485qzCUrAKr8jc9SnVDV3N/e3OLwJlte5pPqcmWwL+lRSyEKzFABHU7qau6BzcB8mFlEbjMxM18W
        JV10fkKGJkwqML0AYvTP2tZauLU8GCTwTtPhDtW33AhfT1m+4qkyYKeDuQKKsbSQL5DE9Kih3/Ar0
        uz/DMPNUlNe4fWd/LOV/KCJqawnv6Hgeos5N6OlvFKvZVDP51IPqatR6CKJ28/5RNqpz+tsZ84aLr
        DGJ9qd9Yg==;
Received: from 177.17.137.173.dynamic.adsl.gvt.net.br ([177.17.137.173] helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5pI6-0003BZ-P7; Thu, 05 Sep 2019 10:47:03 +0000
Date:   Thu, 5 Sep 2019 07:46:58 -0300
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Joe Perches <joe@perches.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nishad Kamdar <nishadkamdar@gmail.com>,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: siano: Use the correct style for SPDX License
 Identifier
Message-ID: <20190905074658.0f229587@coco.lan>
In-Reply-To: <f65bf8e7bc3234358d5956f94e3b4df81bc204e6.camel@perches.com>
References: <20190831151147.GA7082@nishad>
        <20190904153432.7fb54f02@coco.lan>
        <20190904183608.GA495@kroah.com>
        <20190904160010.4532c3f5@coco.lan>
        <20190905055430.GA23826@kroah.com>
        <20190905055614.7958918b@coco.lan>
        <f65bf8e7bc3234358d5956f94e3b4df81bc204e6.camel@perches.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Thu, 05 Sep 2019 02:28:05 -0700
Joe Perches <joe@perches.com> escreveu:

> On Thu, 2019-09-05 at 05:56 -0300, Mauro Carvalho Chehab wrote:
> > I'll accept
> > this patch and keep such rule in mind for next SPDX changes.
> > 
> > Anyway, with regards to script, we need to change the rules in order to
> > allow adding SPDX for python scripts, as otherwise the addition of SPDX
> > headers may cause regressions.  
> 
> Not really.
> 
> $ git grep -n '^# SPDX-License-Identifier' -- '*.py' | wc -l
> 62
> $ git grep -n '^# SPDX-License-Identifier' -- '*.py' | \
>   cut -f2 -d: | sort | uniq -c
>      32 1
>      27 2
>       3 3
> $ git grep -n '^# SPDX-License-Identifier' -- '*.py' | \
>   cut -f1 -d: | xargs ./scripts/spdxcheck.py --verbose
> 
> License files:               14
> Exception files:              2
> License IDs                  19
> Exception IDs                 2
> 
> Files checked:               62
> Lines checked:               95
> Files with SPDX:             62
> Files with errors:            0

Not quite sure what you're meant with the above, but:

1) this won't cover all python scripts, as there are some without
.py extension:

	$ git grep -lE "\#\!.*python"|grep -v \.py$
	drivers/staging/greybus/tools/lbtest
	scripts/bloat-o-meter
	scripts/diffconfig
	scripts/show_delta
	tools/hv/lsvmbus
	tools/kvm/kvm_stat/kvm_stat

2) we have already some files that are violating PEP-263 due to
SPDX headers. On a quick look at the results of:

	$ git grep -lE "^\#.*coding" $(git grep -lE "\#\!.*python")
	Documentation/sphinx/kernel_include.py
	Documentation/sphinx/rstFlatTable.py
	tools/perf/python/tracepoint.py
	tools/perf/python/twatch.py
	tools/power/x86/intel_pstate_tracer/intel_pstate_tracer.py

Those three files already have such problem:

	tools/perf/python/tracepoint.py
	tools/perf/python/twatch.py
	tools/power/x86/intel_pstate_tracer/intel_pstate_tracer.py

On those scripts, the coding line is not at the right place, and will be
silently ignored by python, causing them to crash with UTF-8 encoding
chars, if any.

And the other two doesn't have a SPDX header file. Adding a SPDX header
there would violate the "up to the second line" rule.

Thanks,
Mauro
