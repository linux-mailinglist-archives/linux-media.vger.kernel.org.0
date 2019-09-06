Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4027AB806
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 14:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392019AbfIFMUf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 08:20:35 -0400
Received: from smtprelay0137.hostedemail.com ([216.40.44.137]:37610 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732863AbfIFMUe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Sep 2019 08:20:34 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 891AF52C8;
        Fri,  6 Sep 2019 12:20:33 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::::::,RULES_HIT:41:355:379:599:800:960:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2197:2199:2393:2525:2553:2561:2564:2682:2685:2689:2693:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3353:3622:3653:3865:3866:3868:3870:3871:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:5007:6117:7901:7903:8985:9025:9592:10004:10400:10848:11026:11027:11232:11657:11658:11854:11914:12043:12296:12297:12438:12555:12679:12740:12760:12895:12986:13069:13311:13357:13439:14096:14097:14181:14659:14721:21080:21094:21221:21323:21433:21451:21627:30054:30056:30060:30070:30075:30090:30091,0,RBL:47.151.152.152:@perches.com:.lbl8.mailshell.net-62.14.0.100 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:25,LUA_SUMMARY:
X-HE-Tag: hope21_3ed998ba99338
X-Filterd-Recvd-Size: 3203
Received: from XPS-9350.home (unknown [47.151.152.152])
        (Authenticated sender: joe@perches.com)
        by omf04.hostedemail.com (Postfix) with ESMTPA;
        Fri,  6 Sep 2019 12:20:31 +0000 (UTC)
Message-ID: <a610efdd3bf488d407dc1130fa8ed090019ccffd.camel@perches.com>
Subject: Re: [PATCH] docs: license-rules.txt: cover SPDX headers on Python
 scripts
From:   Joe Perches <joe@perches.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Jessica Yu <jeyu@kernel.org>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Thomas Gleixner <tglx@linutronix.de>, linux-doc@vger.kernel.org
Date:   Fri, 06 Sep 2019 05:20:30 -0700
In-Reply-To: <20190906083457.7e7934ec@coco.lan>
References: <20190905055614.7958918b@coco.lan>
         <88e638eb959095ab6657d295f9f8c27169569bf2.1567675272.git.mchehab+samsung@kernel.org>
         <20190905092703.GA30899@kroah.com> <20190905090701.37dcf75e@coco.lan>
         <b32c2e46b91e7bcda2a9bd140673f06d71b2487a.camel@perches.com>
         <20190906083457.7e7934ec@coco.lan>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, 2019-09-06 at 08:34 -0300, Mauro Carvalho Chehab wrote:
> I did some changes on it, plus one change at the pedantic mode of
> scripts/spdxcheck.py, and placed the corresponding patches at:
> 
> 	https://git.linuxtv.org/mchehab/experimental.git/log/?h=spdx_pedantic

Overall seems very nice, thanks.

Couple nits.

Some of the scripts and py files move the author
block into a description or add unnecessary blank
comments.  These may use some manual fixups.

For instance:

diff --git a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
index f12a4e2..ff610ec 100755
--- a/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
+++ b/tools/perf/tests/shell/record+probe_libc_inet_pton.sh
@@ -1,4 +1,5 @@
 #!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
 # probe libc's inet_pton & backtrace it with ping
 # Installs a probe on libc's inet_pton function, that will use uprobes,
@@ -6,8 +7,6 @@
 # with the a backtrace 3 levels deep, check that it is what we expect.
 # This needs no debuginfo package, all is done using the libc ELF symtab
 # and the CFI info in the binaries.
-
-# SPDX-License-Identifier: GPL-2.0
 # Arnaldo Carvalho de Melo <acme@kernel.org>, 2017
 
  . $(dirname $0)/lib/probe.sh

and

diff --git a/tools/testing/selftests/bpf/tcp_client.py b/tools/testing/selftests/bpf/tcp_client.py
index a53ed58..c2ee17d 100755
--- a/tools/testing/selftests/bpf/tcp_client.py
+++ b/tools/testing/selftests/bpf/tcp_client.py
@@ -1,7 +1,7 @@
 #!/usr/bin/env python3
-#
 # SPDX-License-Identifier: GPL-2.0
 #
+#

> what's the "very first line" where a
> SPDX header tag should be on a man page?

Beats me.
This says man pages are documents,
https://spdx.org/rdf/ontology/spdx-2-0-rev-7/individuals/usageType_document___85292652.html


