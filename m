Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD64AAAC99
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 21:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388596AbfIET6K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 15:58:10 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58484 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391578AbfIET56 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 15:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=s3bnuLPie8tvQfkLbByEq3DCPFD82JjDHl5b4Zu8iF4=; b=plaVHZbHUd55P5ecQIdhVR0Dd
        b647jC3qkNMHeQvR6S8LXLmPQyjJMxC+UVYMMowrtdyPSFLYcsPNwsaNk1GNEFSQnPYjdaE2yydhg
        mXc6VYjfer9P+z2VSHqaBFiQSTtO/8kzvcYX/sZfGAwWRAh3oowVLpZcsao0GpvqJpl5aOp4Wluap
        ksI7yBAPdp5kUPrTAn32B/uuvi2PMsJsHTxCUgT01aTEBYclaB+dXT4oCH/tb8tWrzeLAkL9SmlSH
        a+s4RP7cWcuPv/mXYD6bMdjkjx3Hep3/sXyJPpPiZ0DxwyFmtwK4WmsyaZsCYqgH+vZ3nb+s10KP9
        EnA0bL/Bw==;
Received: from [177.159.253.249] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i5xtG-0000IH-DH; Thu, 05 Sep 2019 19:57:58 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.1)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1i5xtC-0005m1-K3; Thu, 05 Sep 2019 16:57:54 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Sven Eckelmann <sven@narfation.org>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Doug Smythies <doug.smythies@gmail.com>,
        =?UTF-8?q?Aur=C3=A9lien=20Cedeyn?= <aurelien.cedeyn@gmail.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-doc@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thierry Reding <treding@nvidia.com>,
        Armijn Hemel <armijn@tjaldur.nl>, Jiri Olsa <jolsa@redhat.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Namhyung Kim <namhyung@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Allison Randal <allison@lohutok.net>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: [PATCH 0/6] Address issues with SPDX requirements and PEP-263
Date:   Thu,  5 Sep 2019 16:57:47 -0300
Message-Id: <cover.1567712829.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The  description at Documentation/process/license-rules.rst is very strict
with regards to the position where the SPDX tags should be.

In the past several developers and maintainers interpreted it on a
more permissive way, placing the SPDX header between lines 1 to 15, 
with are the ones which the  scripts/spdxcheck.py script verifies.

However, recently, devs are becoming more strict about such
requirement and want it to strictly follow the rule, with states that
the SPDX rule should be at the first line ever on most files, and
at the second line for scripts.

Well, for Python script, such requirement causes violation to PEP-263, 
making regressions on scripts that contain encoding lines, as PEP-263
also states about the same.

This series addresses it.

Patches 1 to 3 fix some Python scripts that violates PEP-263;

Patch 4 mentions PEP-263 for Python scripts, allowing to go up to
line 3, when both "#!" and the encoding line is found;

Patch 5 changes the scripts/spdxcheck.py for it to identify on what
line each SPDX header is found, optinally allowing to print an histogram
about that;

Patch 6 adds a pedantic^Wstrict mode to scripts/spdxcheck.py,
making it to also check for violations at the line with contains the
SPDX header.

PS.: I sent already a RFC version for those patches along with this
thread:

    https://lore.kernel.org/lkml/b32c2e46b91e7bcda2a9bd140673f06d71b2487a.camel@perches.com/

Mauro Carvalho Chehab (6):
  docs: sphinx: add SPDX header for some sphinx extensions
  tools: perf: fix SPDX header in the light of PEP-263
  tools: intel_pstate_tracer.py: fix SPDX header in the light of PEP-263
  docs: license-rules.txt: cover SPDX headers on Python scripts
  scripts/spdxcheck.py: keep track on what line SPDX header was found
  scripts/spdxcheck.py: check if the line number follows the strict rule

 Documentation/process/license-rules.rst       |  7 ++-
 Documentation/sphinx/kernel_include.py        |  1 +
 Documentation/sphinx/rstFlatTable.py          |  1 +
 scripts/spdxcheck.py                          | 55 +++++++++++++++----
 tools/perf/python/tracepoint.py               |  3 +-
 tools/perf/python/twatch.py                   |  3 +-
 .../intel_pstate_tracer.py                    |  2 +-
 7 files changed, 55 insertions(+), 17 deletions(-)

-- 
2.21.0


