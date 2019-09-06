Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB13ABECE
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 19:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391341AbfIFRdr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 13:33:47 -0400
Received: from smtprelay0102.hostedemail.com ([216.40.44.102]:41097 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727381AbfIFRdq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Sep 2019 13:33:46 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 11459100E86C4;
        Fri,  6 Sep 2019 17:33:45 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::::::,RULES_HIT:41:355:379:599:967:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1540:1593:1594:1711:1730:1747:1777:1792:2197:2199:2393:2525:2560:2563:2682:2685:2828:2859:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3622:3653:3865:3866:3867:3868:3871:3872:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4321:5007:6117:7901:9025:10004:10400:10848:11026:11232:11658:11914:12043:12297:12438:12555:12740:12760:12895:13069:13163:13229:13311:13357:13439:14181:14659:14721:21080:21221:21433:21451:21627:30054:30060:30070:30091,0,RBL:47.151.152.152:@perches.com:.lbl8.mailshell.net-62.8.0.100 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:27,LUA_SUMMARY:none
X-HE-Tag: shape57_207efb1258f13
X-Filterd-Recvd-Size: 2276
Received: from XPS-9350.home (unknown [47.151.152.152])
        (Authenticated sender: joe@perches.com)
        by omf09.hostedemail.com (Postfix) with ESMTPA;
        Fri,  6 Sep 2019 17:33:43 +0000 (UTC)
Message-ID: <9d30210a2d024aae4c36c8995019cdeab29e1e19.camel@perches.com>
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
Date:   Fri, 06 Sep 2019 10:33:42 -0700
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

Your script needs a modification of this line:

    $spdx = $1 if m/(SPDX-License-Identifier:.*)/;

This is on $_ and not $spdx.

This line needs to be:

    $spdx = $1 if $spdx =~ m/(SPDX-License-Identifier:.*)/;

Otherwise the script produces:
---
diff --git a/tools/perf/util/rlimit.h b/tools/perf/util/rlimit.h
index 9f59d8e..5d975b9 100644
--- a/tools/perf/util/rlimit.h
+++ b/tools/perf/util/rlimit.h
@@ -1,6 +1,6 @@
+/* SPDX-License-Identifier: LGPL-2.1 */ */
 #ifndef __PERF_RLIMIT_H_
 #define __PERF_RLIMIT_H_
-/* SPDX-License-Identifier: LGPL-2.1 */
 
 void rlimit__bump_memlock(void);
 #endif // __PERF_RLIMIT_H_


