Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9752C1A3B7D
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 22:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbgDIUqB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 16:46:01 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:14446 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726725AbgDIUqB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Apr 2020 16:46:01 -0400
X-IronPort-AV: E=Sophos;i="5.72,364,1580770800"; 
   d="scan'208";a="444630938"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 22:46:00 +0200
Date:   Thu, 9 Apr 2020 22:45:59 +0200 (CEST)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Alexander Popov <alex.popov@linux.com>
cc:     Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        Michal Marek <michal.lkml@markovi.net>, cocci@systeme.lip6.fr,
        "kernel-hardening@lists.openwall.com" 
        <kernel-hardening@lists.openwall.com>,
        Jann Horn <jannh@google.com>,
        Kees Cook <keescook@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [Cocci] Coccinelle rule for CVE-2019-18683
In-Reply-To: <3c92523d-4b3f-e805-84e6-6abd1eedd683@linux.com>
Message-ID: <alpine.DEB.2.21.2004092242450.2403@hadrien>
References: <fff664e9-06c9-d2fb-738f-e8e591e09569@linux.com> <alpine.DEB.2.21.2004091248190.2403@hadrien> <3c92523d-4b3f-e805-84e6-6abd1eedd683@linux.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> >> kthread_stop@stop_p(...)
> >> ...
> >> mutex_lock@lock_p(E)
> >>
> >> @script:python@
> >> stop_p << race.stop_p;
> >> unlock_p << race.unlock_p;
> >> lock_p << race.lock_p;
> >> E << race.E;
> >> @@
> >>
> >> coccilib.report.print_report(unlock_p[0], 'mutex_unlock(' + E + ') here')
> >> coccilib.report.print_report(stop_p[0], 'kthread_stop here')
> >> coccilib.report.print_report(lock_p[0], 'mutex_lock(' + E + ') here\n')
>
> ...
>
> > Based on Jann's suggestion, it seem like it could be interesting to find
> > these locking pauses, and then collect functions that are used in locks
> > and in lock pauses.  If a function is mostly used with locks held, then
> > using it in a lock pause could be a sign of a bug.  I will see if it turns
> > up anything interesting.
>
> Do you mean collecting the behaviour that happens between unlocking and locking
> and then analysing it somehow?

Yes.  I have tried doing what I described, but I'm not sure that the
results are very reliable at the moment.

julia
