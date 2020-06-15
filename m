Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242C41F8D52
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 07:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726859AbgFOFgE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 01:36:04 -0400
Received: from smtprelay0022.hostedemail.com ([216.40.44.22]:59452 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725648AbgFOFgE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 01:36:04 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id E1274180A7FEB;
        Mon, 15 Jun 2020 05:36:02 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:800:960:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1542:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2553:2559:2562:2828:2908:3138:3139:3140:3141:3142:3352:3622:3865:3867:3870:3872:4321:4605:5007:7875:7901:10004:10400:10848:10967:11026:11232:11473:11658:11914:12043:12297:12438:12555:12740:12760:12895:12986:13439:14093:14097:14181:14659:14721:21080:21433:21451:21611:21627:21990:30054:30060:30070:30083:30090:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: rice41_210a42e26df3
X-Filterd-Recvd-Size: 3609
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf04.hostedemail.com (Postfix) with ESMTPA;
        Mon, 15 Jun 2020 05:36:01 +0000 (UTC)
Message-ID: <923edc47122b3a143b06a1e711d2ec1736d898f9.camel@perches.com>
Subject: Re: [PATCH 2/2] media: atomisp: replace old ---help--- tags by just
 help
From:   Joe Perches <joe@perches.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Date:   Sun, 14 Jun 2020 22:36:00 -0700
In-Reply-To: <20200615072254.7be610bd@coco.lan>
References: <d94e7bff13e8a361353360e4cdbf637bfb701bed.1592198305.git.mchehab+huawei@kernel.org>
         <849016f49273cd245401cc2d7d454d3a12330658.1592198305.git.mchehab+huawei@kernel.org>
         <20200615072254.7be610bd@coco.lan>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2020-06-15 at 07:22 +0200, Mauro Carvalho Chehab wrote:
> Em Mon, 15 Jun 2020 07:18:34 +0200
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:
> 
> > There are several places on this file using the deprecated
> > ---help--- tag.
> > 
> > Replaces them.
> 
> Just ignore it. A treewide patch already changed it:
> 
> 	a7f7f6248d97 ("treewide: replace '---help---' in Kconfig files with 'help'")
> 
> I'll double-check the spacing things here. If it lasts upstream, I'll
> send the changes on a separate patch.

Another possible change to avoid more ---help--- lines:
---
 scripts/checkkconfigsymbols.py | 2 +-
 scripts/checkpatch.pl          | 6 +-----
 scripts/kconfig/lexer.l        | 2 +-
 3 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
index 00a10a293f4f..1548f9ce4682 100755
--- a/scripts/checkkconfigsymbols.py
+++ b/scripts/checkkconfigsymbols.py
@@ -34,7 +34,7 @@ REGEX_SOURCE_SYMBOL = re.compile(SOURCE_SYMBOL)
 REGEX_KCONFIG_DEF = re.compile(DEF)
 REGEX_KCONFIG_EXPR = re.compile(EXPR)
 REGEX_KCONFIG_STMT = re.compile(STMT)
-REGEX_KCONFIG_HELP = re.compile(r"^\s+(help|---help---)\s*$")
+REGEX_KCONFIG_HELP = re.compile(r"^\s+help\s*$")
 REGEX_FILTER_SYMBOLS = re.compile(r"[A-Za-z0-9]$")
 REGEX_NUMERIC = re.compile(r"0[xX][0-9a-fA-F]+|[0-9]+")
 REGEX_QUOTES = re.compile("(\"(.*?)\")")
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 524df88f9364..738bb3fcf202 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3044,11 +3044,7 @@ sub process {
 
 				if ($lines[$ln - 1] =~ /^\+\s*(?:bool|tristate|prompt)\s*["']/) {
 					$is_start = 1;
-				} elsif ($lines[$ln - 1] =~ /^\+\s*(?:help|---help---)\s*$/) {
-					if ($lines[$ln - 1] =~ "---help---") {
-						WARN("CONFIG_DESCRIPTION",
-						     "prefer 'help' over '---help---' for new help texts\n" . $herecurr);
-					}
+				} elsif ($lines[$ln - 1] =~ /^\+\s*help\s*$/) {
 					$length = -1;
 				}
 
diff --git a/scripts/kconfig/lexer.l b/scripts/kconfig/lexer.l
index 6354c905b006..4b7339ff4c8b 100644
--- a/scripts/kconfig/lexer.l
+++ b/scripts/kconfig/lexer.l
@@ -105,7 +105,7 @@ n	[A-Za-z0-9_-]
 "endchoice"		return T_ENDCHOICE;
 "endif"			return T_ENDIF;
 "endmenu"		return T_ENDMENU;
-"help"|"---help---"	return T_HELP;
+"help"			return T_HELP;
 "hex"			return T_HEX;
 "if"			return T_IF;
 "imply"			return T_IMPLY;


