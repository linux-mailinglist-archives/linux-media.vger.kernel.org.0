Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3DA9AC6C5
	for <lists+linux-media@lfdr.de>; Sat,  7 Sep 2019 15:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392517AbfIGNeW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Sep 2019 09:34:22 -0400
Received: from ms.lwn.net ([45.79.88.28]:42594 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731344AbfIGNeW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Sep 2019 09:34:22 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6B6A82BD;
        Sat,  7 Sep 2019 13:34:20 +0000 (UTC)
Date:   Sat, 7 Sep 2019 07:34:19 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Sven Eckelmann <sven@narfation.org>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Doug Smythies <doug.smythies@gmail.com>,
        =?UTF-8?B?QXVyw6lsaWVu?= Cedeyn <aurelien.cedeyn@gmail.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-doc@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thierry Reding <treding@nvidia.com>,
        Armijn Hemel <armijn@tjaldur.nl>, Jiri Olsa <jolsa@redhat.com>,
        Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>,
        Namhyung Kim <namhyung@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Allison Randal <allison@lohutok.net>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH 0/6] Address issues with SPDX requirements and PEP-263
Message-ID: <20190907073419.6a88e318@lwn.net>
In-Reply-To: <cover.1567712829.git.mchehab+samsung@kernel.org>
References: <cover.1567712829.git.mchehab+samsung@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu,  5 Sep 2019 16:57:47 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> The  description at Documentation/process/license-rules.rst is very strict
> with regards to the position where the SPDX tags should be.
> 
> In the past several developers and maintainers interpreted it on a
> more permissive way, placing the SPDX header between lines 1 to 15, 
> with are the ones which the  scripts/spdxcheck.py script verifies.
> 
> However, recently, devs are becoming more strict about such
> requirement and want it to strictly follow the rule, with states that
> the SPDX rule should be at the first line ever on most files, and
> at the second line for scripts.
> 
> Well, for Python script, such requirement causes violation to PEP-263, 
> making regressions on scripts that contain encoding lines, as PEP-263
> also states about the same.
> 
> This series addresses it.

So I really don't want to be overly difficult here, but I would like to
approach this from yet another angle...

> Patches 1 to 3 fix some Python scripts that violates PEP-263;

I just checked all of those scripts, and they are all just plain ASCII.
So it really doesn't matter whether the environment defaults to UTF-8 or
ASCII here.  So, in other words, we really shouldn't need to define the
encoding at all.

This suggests to me that we're adding a bunch of complications that we
don't necessarily need.  What am I missing here?

Educate me properly and I'll not try to stand in the way of all this...

Thanks,

jon
