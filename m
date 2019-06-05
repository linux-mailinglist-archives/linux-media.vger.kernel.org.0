Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1D8636209
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2019 19:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbfFERD0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Jun 2019 13:03:26 -0400
Received: from smtprelay0024.hostedemail.com ([216.40.44.24]:37504 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728794AbfFERD0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Jun 2019 13:03:26 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id 8554E8368EE9;
        Wed,  5 Jun 2019 17:03:24 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 13,1.2,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::::::,RULES_HIT:41:355:379:599:800:960:968:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1431:1437:1515:1516:1518:1535:1544:1593:1594:1605:1711:1730:1747:1777:1792:2197:2198:2199:2200:2393:2553:2559:2562:2731:2828:2902:3138:3139:3140:3141:3142:3622:3653:3865:3866:3867:3868:3870:3871:3872:3874:4250:4321:4605:5007:7875:7903:7904:9008:10008:10848:10967:11026:11232:11473:11657:11658:11914:12043:12296:12555:12740:12760:12895:12986:13161:13229:13439:14181:14659:14721:21080:21221:21433:21627:30054:30060:30070:30090:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:none,Custom_rules:0:1:0,LFtime:26,LUA_SUMMARY:none
X-HE-Tag: snail30_1d61b4fc2bc61
X-Filterd-Recvd-Size: 5807
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf19.hostedemail.com (Postfix) with ESMTPA;
        Wed,  5 Jun 2019 17:03:21 +0000 (UTC)
Message-ID: <a798561d24c486d31063a7994d8630c859df00e9.camel@perches.com>
Subject: Re: [PATCH] media: do not use C++ style comments in uapi headers
From:   Joe Perches <joe@perches.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Wed, 05 Jun 2019 10:03:19 -0700
In-Reply-To: <20190605071413.779bd821@coco.lan>
References: <20190604111334.22182-1-yamada.masahiro@socionext.com>
         <8cf48e20064eabdfe150795365e6ca6f36032e9f.camel@perches.com>
         <CAK8P3a1oDfNF_T+NCoPsXkJAY2x4_uCWSwrDXHi7dDSaMqfnfA@mail.gmail.com>
         <CAK7LNAS0Ph2Z6x0-UPSkJUC31NvPi09BmFrve+YJcXMrop-BGA@mail.gmail.com>
         <20190604134213.GA26263@kroah.com>
         <CAK7LNARyqW3q6_46e-aYjmF8c0jUNDLdyB28zNaBEXqTV+5QSA@mail.gmail.com>
         <CAK8P3a0bz8XYJOsmND2=CT_oTDmGMJGaRo9+QMroEhpekSMEaQ@mail.gmail.com>
         <CAK7LNARU+uT0aUBh5niwEafL8+Ok7=sOZYukptpDH1w7Cii3hQ@mail.gmail.com>
         <20190605051040.GA22760@kroah.com>
         <b70cf8c1f901ea09abbdb22dd28244b18fd1a39d.camel@perches.com>
         <20190605071413.779bd821@coco.lan>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 2019-06-05 at 07:14 -0300, Mauro Carvalho Chehab wrote:
> Em Tue, 04 Jun 2019 22:22:05 -0700
> Joe Perches <joe@perches.com> escreveu:
> 
> > On Wed, 2019-06-05 at 07:10 +0200, Greg KH wrote:
> > > On Wed, Jun 05, 2019 at 01:10:41PM +0900, Masahiro Yamada wrote:  
> > > > On Wed, Jun 5, 2019 at 3:21 AM Arnd Bergmann <arnd@arndb.de> wrote:  
> > []
> > > > This means we cannot reliably use uint{8,16,32,64}_t in UAPI headers.  
> > > 
> > > We should not be doing that as they are in the userspace "namespace" of
> > > variables, not in the kernel namespace.  We've been over this many times
> > > in the past :(  
> > 
> > Just not very successfully...
> > 
> > $ git grep -w -P 'u?_?int(?:8|16|32|64)_t' include/uapi | wc -l
> > 342
> > $ git grep -w -P --name-only 'u?_?int(?:8|16|32|64)_t' include/uapi | wc -l
> > 13
> 
> Out of curiosity, I decided to check those occurrences...
> 
> About half of those 13 files are false-positives:
> 
> - bpf.h, pps.h and amdgpu_drm.h use those int types only inside comments;
> - drm.h and coda.h have their own typedefs for those int types;
> - vmwgfx_drm.h includes drm.h (which has the typedefs).
> 
> So, only 6 headers actually use posix types in a way that it seems that 
> it would require including stdint.h:
> 
> - include/uapi/linux/fuse.h
> 
>   This one explicitly includes stdint.h if !__KERNEL__
> 
> - include/uapi/linux/netfilter_bridge/ebtables.h,
>   include/uapi/linux/sctp.h,
>   include/uapi/scsi/scsi_netlink.h and
>   include/uapi/scsi/scsi_netlink_fc.h
> 
>   They include linux/types.h unconditionally, relying on
>   scripts/headers_install.sh to remove it;
> 
> - include/uapi/scsi/scsi_bsg_fc.h
> 
>   It doesn't include anything. In other words, it assumes that the c file 
>   would include either linux/types.h or stdint.h.
> 
> ---
> 
> Not saying that this is a good idea, but, as we have already a script that
> it is meant to sanitize uAPI header files when installing them
> (scripts/headers_install.sh), one could modify it (or convert to perl/python)
> in a way that it would be doing something like[1]:
> 
> 	sed -E
> 		...
> 		-e 's,//(.*),/* \1 */,'
> 
> [1] the actual rule should be more complex than that, in order to avoid 
> replacing // inside /**/ comments.

Perhaps a checkpatch change too:

The first block updates unsigned only bitfields
The second tests uapi definitions and suggests "__<kernel_types"
---
 scripts/checkpatch.pl | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index c33c5002f190..afc4bb05a987 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3747,7 +3747,7 @@ sub process {
 		}
 
 # check for declarations of signed or unsigned without int
-		while ($line =~ m{\b($Declare)\s*(?!char\b|short\b|int\b|long\b)\s*($Ident)?\s*[=,;\[\)\(]}g) {
+		while ($line =~ m{\b($Declare)\s*(?!char\b|short\b|int\b|long\b)\s*($Ident)?\s*[=,;:\[\)\(]}g) {
 			my $type = $1;
 			my $var = $2;
 			$var = "" if (!defined $var);
@@ -5905,10 +5905,10 @@ sub process {
 			      "Using weak declarations can have unintended link defects\n" . $herecurr);
 		}
 
-# check for c99 types like uint8_t used outside of uapi/ and tools/
-		if ($realfile !~ m@\binclude/uapi/@ &&
-		    $realfile !~ m@\btools/@ &&
-		    $line =~ /\b($Declare)\s*$Ident\s*[=;,\[]/) {
+# check for c99 types like uint8_t used outside of tools/
+# for uapi, suggest using __<types>, otherwise use <types> like s8, u32, etc...
+		if ($realfile !~ m@\btools/@ &&
+		    $line =~ /\b($Declare)\s*$Ident\s*[=,;:\[]/) {
 			my $type = $1;
 			if ($type =~ /\b($typeC99Typedefs)\b/) {
 				$type = $1;
@@ -5916,6 +5916,9 @@ sub process {
 				$kernel_type = 's' if ($type =~ /^_*[si]/);
 				$type =~ /(\d+)/;
 				$kernel_type .= $1;
+				if ($realfile =~ m@\binclude/uapi/@) {
+					$kernel_type = "__" . $kernel_type;
+				}
 				if (CHK("PREFER_KERNEL_TYPES",
 					"Prefer kernel type '$kernel_type' over '$type'\n" . $herecurr) &&
 				    $fix) {

