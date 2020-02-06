Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42A4515474C
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 16:12:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbgBFPLo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 10:11:44 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:37566 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbgBFPLn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 10:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=tQKSPVS1xeeao2HSiQdMD6DVzUR/7bXFDqMVsLnfJyI=; b=DRfSTy2zFyufdS7daYWJ+WlEEA
        5k9kvZypG79V6Cvvwm6t50NA8nQzOSpPMW0u+4dkCmZepss2mEjLse3r8k+cBNATom+45z2B8psh2
        q8A+/0EoeQOR480y0d5wReOQ0x0bLzHDsYugssdbH18zTR3vsCzrcXdqPiZjWOAok9ABjBFP4nmyY
        ngonDAuDpX5leOw/AUq4n5NFkBCSN1BGMI3ptX7cQ8s3jeNx3HcWR9ytxCbosmBl7uNSEiFbcFHbC
        JKHrK0sdl7pIuEc1MygjIdNydgWIGZOZEum0IlBPaKxdSxmnwo6JE2knQpnqM1HeJ3cGhpThcz4oC
        q19/4alA==;
Received: from [179.95.15.160] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1izioc-000431-Lh; Thu, 06 Feb 2020 15:11:42 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1izioV-002oN6-Sa; Thu, 06 Feb 2020 16:11:31 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-crypto@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 05/11] docs: crypto: descore-readme.txt: convert to ReST format
Date:   Thu,  6 Feb 2020 16:11:24 +0100
Message-Id: <6dcad7bb8feb264625ef0124fe86b2137427ad08.1581001737.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581001737.git.mchehab+huawei@kernel.org>
References: <cover.1581001737.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert this readme file to ReST file format, preserving its
contents as-is as much as possible. The only changes are:

- Added chapter and title markups;
- Added blank lines where needed;
- Added list markups where needed;
- Use a table markup;
- replace markups like `foo' to ``foo``;
- add one extra literal markup to avoid warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 ...{descore-readme.txt => descore-readme.rst} | 152 ++++++++++++------
 Documentation/crypto/index.rst                |   1 +
 2 files changed, 108 insertions(+), 45 deletions(-)
 rename Documentation/crypto/{descore-readme.txt => descore-readme.rst} (81%)

diff --git a/Documentation/crypto/descore-readme.txt b/Documentation/crypto/descore-readme.rst
similarity index 81%
rename from Documentation/crypto/descore-readme.txt
rename to Documentation/crypto/descore-readme.rst
index 16e9e6350755..45bd9c8babf4 100644
--- a/Documentation/crypto/descore-readme.txt
+++ b/Documentation/crypto/descore-readme.rst
@@ -1,8 +1,20 @@
-Below is the original README file from the descore.shar package.
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+
+===========================================
+Fast & Portable DES encryption & decryption
+===========================================
+
+.. note::
+
+   Below is the original README file from the descore.shar package,
+   converted to ReST format.
+
 ------------------------------------------------------------------------------
 
 des - fast & portable DES encryption & decryption.
-Copyright (C) 1992  Dana L. How
+
+Copyright |copy| 1992  Dana L. How
 
 This program is free software; you can redistribute it and/or modify
 it under the terms of the GNU Library General Public License as published by
@@ -20,13 +32,12 @@ Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 
 Author's address: how@isl.stanford.edu
 
-$Id: README,v 1.15 1992/05/20 00:25:32 how E $
-
-
-==>> To compile after untarring/unsharring, just `make' <<==
+.. README,v 1.15 1992/05/20 00:25:32 how E
 
+==>> To compile after untarring/unsharring, just ``make`` <<==
 
 This package was designed with the following goals:
+
 1.	Highest possible encryption/decryption PERFORMANCE.
 2.	PORTABILITY to any byte-addressable host with a 32bit unsigned C type
 3.	Plug-compatible replacement for KERBEROS's low-level routines.
@@ -36,7 +47,7 @@ register-starved machines.  My discussions with Richard Outerbridge,
 71755.204@compuserve.com, sparked a number of these enhancements.
 
 To more rapidly understand the code in this package, inspect desSmallFips.i
-(created by typing `make') BEFORE you tackle desCode.h.  The latter is set
+(created by typing ``make``) BEFORE you tackle desCode.h.  The latter is set
 up in a parameterized fashion so it can easily be modified by speed-daemon
 hackers in pursuit of that last microsecond.  You will find it more
 illuminating to inspect one specific implementation,
@@ -47,11 +58,13 @@ performance comparison to other available des code which i could
 compile on a SPARCStation 1 (cc -O4, gcc -O2):
 
 this code (byte-order independent):
-   30us per encryption (options: 64k tables, no IP/FP)
-   33us per encryption (options: 64k tables, FIPS standard bit ordering)
-   45us per encryption (options:  2k tables, no IP/FP)
-   48us per encryption (options:  2k tables, FIPS standard bit ordering)
-  275us to set a new key (uses 1k of key tables)
+
+  - 30us per encryption (options: 64k tables, no IP/FP)
+  - 33us per encryption (options: 64k tables, FIPS standard bit ordering)
+  - 45us per encryption (options:  2k tables, no IP/FP)
+  - 48us per encryption (options:  2k tables, FIPS standard bit ordering)
+  - 275us to set a new key (uses 1k of key tables)
+
 	this has the quickest encryption/decryption routines i've seen.
 	since i was interested in fast des filters rather than crypt(3)
 	and password cracking, i haven't really bothered yet to speed up
@@ -63,15 +76,20 @@ this code (byte-order independent):
 	are highly variable because of cache effects).
 
 kerberos des replacement from australia (version 1.95):
-   53us per encryption (uses 2k of tables)
-   96us to set a new key (uses 2.25k of key tables)
+
+  - 53us per encryption (uses 2k of tables)
+  - 96us to set a new key (uses 2.25k of key tables)
+
 	so despite the author's inclusion of some of the performance
 	improvements i had suggested to him, this package's
 	encryption/decryption is still slower on the sparc and 68000.
 	more specifically, 19-40% slower on the 68020 and 11-35% slower
 	on the sparc,  depending on the compiler;
 	in full gory detail (ALT_ECB is a libdes variant):
+
+	===============	==============	===============	=================
 	compiler   	machine		desCore	libdes	ALT_ECB	slower by
+	===============	==============	===============	=================
 	gcc 2.1 -O2	Sun 3/110	304  uS	369.5uS	461.8uS	 22%
 	cc      -O1	Sun 3/110	336  uS	436.6uS	399.3uS	 19%
 	cc      -O2	Sun 3/110	360  uS	532.4uS	505.1uS	 40%
@@ -79,10 +97,15 @@ kerberos des replacement from australia (version 1.95):
 	gcc 2.1 -O2	Sun 4/50	 48  uS	 53.4uS	 57.5uS	 11%
 	cc      -O2	Sun 4/50	 48  uS	 64.6uS	 64.7uS	 35%
 	cc      -O4	Sun 4/50	 48  uS	 64.7uS	 64.9uS	 35%
+	===============	==============	===============	=================
+
 	(my time measurements are not as accurate as his).
+
    the comments in my first release of desCore on version 1.92:
-   68us per encryption (uses 2k of tables)
-   96us to set a new key (uses 2.25k of key tables)
+
+   - 68us per encryption (uses 2k of tables)
+   - 96us to set a new key (uses 2.25k of key tables)
+
 	this is a very nice package which implements the most important
 	of the optimizations which i did in my encryption routines.
 	it's a bit weak on common low-level optimizations which is why
@@ -91,48 +114,60 @@ kerberos des replacement from australia (version 1.95):
 	speed up the key-setting routines with impressive results.
 	(at some point i may do the same in my package).  he also implements
 	the rest of the mit des library.
+
 	(code from eay@psych.psy.uq.oz.au via comp.sources.misc)
 
 fast crypt(3) package from denmark:
+
 	the des routine here is buried inside a loop to do the
 	crypt function and i didn't feel like ripping it out and measuring
 	performance. his code takes 26 sparc instructions to compute one
 	des iteration; above, Quick (64k) takes 21 and Small (2k) takes 37.
 	he claims to use 280k of tables but the iteration calculation seems
 	to use only 128k.  his tables and code are machine independent.
+
 	(code from glad@daimi.aau.dk via alt.sources or comp.sources.misc)
 
 swedish reimplementation of Kerberos des library
-  108us per encryption (uses 34k worth of tables)
-  134us to set a new key (uses 32k of key tables to get this speed!)
+
+  - 108us per encryption (uses 34k worth of tables)
+  - 134us to set a new key (uses 32k of key tables to get this speed!)
+
 	the tables used seem to be machine-independent;
 	he seems to have included a lot of special case code
-	so that, e.g., `long' loads can be used instead of 4 `char' loads
+	so that, e.g., ``long`` loads can be used instead of 4 ``char`` loads
 	when the machine's architecture allows it.
+
 	(code obtained from chalmers.se:pub/des)
 
 crack 3.3c package from england:
+
 	as in crypt above, the des routine is buried in a loop. it's
 	also very modified for crypt.  his iteration code uses 16k
 	of tables and appears to be slow.
+
 	(code obtained from aem@aber.ac.uk via alt.sources or comp.sources.misc)
 
-``highly optimized'' and tweaked Kerberos/Athena code (byte-order dependent):
-  165us per encryption (uses 6k worth of tables)
-  478us to set a new key (uses <1k of key tables)
+``highly optimized`` and tweaked Kerberos/Athena code (byte-order dependent):
+
+  - 165us per encryption (uses 6k worth of tables)
+  - 478us to set a new key (uses <1k of key tables)
+
 	so despite the comments in this code, it was possible to get
 	faster code AND smaller tables, as well as making the tables
 	machine-independent.
 	(code obtained from prep.ai.mit.edu)
 
 UC Berkeley code (depends on machine-endedness):
-  226us per encryption
-10848us to set a new key
+  -  226us per encryption
+  - 10848us to set a new key
+
 	table sizes are unclear, but they don't look very small
 	(code obtained from wuarchive.wustl.edu)
 
 
 motivation and history
+======================
 
 a while ago i wanted some des routines and the routines documented on sun's
 man pages either didn't exist or dumped core.  i had heard of kerberos,
@@ -142,10 +177,10 @@ it was too convoluted, the code had been written without taking
 advantage of the regular structure of operations such as IP, E, and FP
 (i.e. the author didn't sit down and think before coding),
 it was excessively slow,  the author had attempted to clarify the code
-by adding MORE statements to make the data movement more `consistent'
+by adding MORE statements to make the data movement more ``consistent``
 instead of simplifying his implementation and cutting down on all data
 movement (in particular, his use of L1, R1, L2, R2), and it was full of
-idiotic `tweaks' for particular machines which failed to deliver significant
+idiotic ``tweaks`` for particular machines which failed to deliver significant
 speedups but which did obfuscate everything.  so i took the test data
 from his verification program and rewrote everything else.
 
@@ -167,12 +202,13 @@ than versions hand-written in assembly for the sparc!
 
 
 porting notes
+=============
 
 one thing i did not want to do was write an enormous mess
 which depended on endedness and other machine quirks,
 and which necessarily produced different code and different lookup tables
 for different machines.  see the kerberos code for an example
-of what i didn't want to do; all their endedness-specific `optimizations'
+of what i didn't want to do; all their endedness-specific ``optimizations``
 obfuscate the code and in the end were slower than a simpler machine
 independent approach.  however, there are always some portability
 considerations of some kind, and i have included some options
@@ -184,8 +220,8 @@ perhaps some will still regard the result as a mess!
    i assume word pointers can be freely cast to and from char pointers.
    note that 99% of C programs make these assumptions.
    i always use unsigned char's if the high bit could be set.
-2) the typedef `word' means a 32 bit unsigned integral type.
-   if `unsigned long' is not 32 bits, change the typedef in desCore.h.
+2) the typedef ``word`` means a 32 bit unsigned integral type.
+   if ``unsigned long`` is not 32 bits, change the typedef in desCore.h.
    i assume sizeof(word) == 4 EVERYWHERE.
 
 the (worst-case) cost of my NOT doing endedness-specific optimizations
@@ -195,40 +231,46 @@ the input and output work areas do not need to be word-aligned.
 
 
 OPTIONAL performance optimizations
+==================================
 
-1) you should define one of `i386,' `vax,' `mc68000,' or `sparc,'
+1) you should define one of ``i386,`` ``vax,`` ``mc68000,`` or ``sparc,``
    whichever one is closest to the capabilities of your machine.
    see the start of desCode.h to see exactly what this selection implies.
    note that if you select the wrong one, the des code will still work;
    these are just performance tweaks.
-2) for those with functional `asm' keywords: you should change the
+2) for those with functional ``asm`` keywords: you should change the
    ROR and ROL macros to use machine rotate instructions if you have them.
    this will save 2 instructions and a temporary per use,
    or about 32 to 40 instructions per en/decryption.
+
    note that gcc is smart enough to translate the ROL/R macros into
    machine rotates!
 
 these optimizations are all rather persnickety, yet with them you should
 be able to get performance equal to assembly-coding, except that:
+
 1) with the lack of a bit rotate operator in C, rotates have to be synthesized
-   from shifts.  so access to `asm' will speed things up if your machine
+   from shifts.  so access to ``asm`` will speed things up if your machine
    has rotates, as explained above in (3) (not necessary if you use gcc).
 2) if your machine has less than 12 32-bit registers i doubt your compiler will
    generate good code.
-   `i386' tries to configure the code for a 386 by only declaring 3 registers
+
+   ``i386`` tries to configure the code for a 386 by only declaring 3 registers
    (it appears that gcc can use ebx, esi and edi to hold register variables).
    however, if you like assembly coding, the 386 does have 7 32-bit registers,
-   and if you use ALL of them, use `scaled by 8' address modes with displacement
+   and if you use ALL of them, use ``scaled by 8`` address modes with displacement
    and other tricks, you can get reasonable routines for DesQuickCore... with
    about 250 instructions apiece.  For DesSmall... it will help to rearrange
    des_keymap, i.e., now the sbox # is the high part of the index and
    the 6 bits of data is the low part; it helps to exchange these.
+
    since i have no way to conveniently test it i have not provided my
    shoehorned 386 version.  note that with this release of desCore, gcc is able
    to put everything in registers(!), and generate about 370 instructions apiece
    for the DesQuickCore... routines!
 
 coding notes
+============
 
 the en/decryption routines each use 6 necessary register variables,
 with 4 being actively used at once during the inner iterations.
@@ -236,15 +278,18 @@ if you don't have 4 register variables get a new machine.
 up to 8 more registers are used to hold constants in some configurations.
 
 i assume that the use of a constant is more expensive than using a register:
+
 a) additionally, i have tried to put the larger constants in registers.
    registering priority was by the following:
-	anything more than 12 bits (bad for RISC and CISC)
-	greater than 127 in value (can't use movq or byte immediate on CISC)
-	9-127 (may not be able to use CISC shift immediate or add/sub quick),
-	1-8 were never registered, being the cheapest constants.
+
+	- anything more than 12 bits (bad for RISC and CISC)
+	- greater than 127 in value (can't use movq or byte immediate on CISC)
+	- 9-127 (may not be able to use CISC shift immediate or add/sub quick),
+	- 1-8 were never registered, being the cheapest constants.
+
 b) the compiler may be too stupid to realize table and table+256 should
    be assigned to different constant registers and instead repetitively
-   do the arithmetic, so i assign these to explicit `m' register variables
+   do the arithmetic, so i assign these to explicit ``m`` register variables
    when possible and helpful.
 
 i assume that indexing is cheaper or equivalent to auto increment/decrement,
@@ -253,25 +298,31 @@ this assumption is reversed for 68k and vax.
 
 i assume that addresses can be cheaply formed from two registers,
 or from a register and a small constant.
-for the 68000, the `two registers and small offset' form is used sparingly.
+for the 68000, the ``two registers and small offset`` form is used sparingly.
 all index scaling is done explicitly - no hidden shifts by log2(sizeof).
 
 the code is written so that even a dumb compiler
 should never need more than one hidden temporary,
 increasing the chance that everything will fit in the registers.
 KEEP THIS MORE SUBTLE POINT IN MIND IF YOU REWRITE ANYTHING.
+
 (actually, there are some code fragments now which do require two temps,
 but fixing it would either break the structure of the macros or
 require declaring another temporary).
 
 
 special efficient data format
+==============================
+
+bits are manipulated in this arrangement most of the time (S7 S5 S3 S1)::
 
-bits are manipulated in this arrangement most of the time (S7 S5 S3 S1):
 	003130292827xxxx242322212019xxxx161514131211xxxx080706050403xxxx
+
 (the x bits are still there, i'm just emphasizing where the S boxes are).
-bits are rotated left 4 when computing S6 S4 S2 S0:
+bits are rotated left 4 when computing S6 S4 S2 S0::
+
 	282726252423xxxx201918171615xxxx121110090807xxxx040302010031xxxx
+
 the rightmost two bits are usually cleared so the lower byte can be used
 as an index into an sbox mapping table. the next two x'd bits are set
 to various values to access different parts of the tables.
@@ -288,7 +339,7 @@ datatypes:
 	must be long-aligned.
 
 DesQuickInit()
-	call this before using any other routine with `Quick' in its name.
+	call this before using any other routine with ``Quick`` in its name.
 	it generates the special 64k table these routines need.
 DesQuickDone()
 	frees this table
@@ -298,6 +349,7 @@ DesMethod(m, k)
 	which must have odd parity (or -1 is returned) and which must
 	not be a (semi-)weak key (or -2 is returned).
 	normally DesMethod() returns 0.
+
 	m is filled in from k so that when one of the routines below
 	is called with m, the routine will act like standard des
 	en/decryption with the key k. if you use DesMethod,
@@ -308,19 +360,26 @@ DesMethod(m, k)
 	will be set to magic constants which speed up the encryption/decryption
 	on some machines.  and yes, each byte controls
 	a specific sbox during a specific iteration.
+
 	you really shouldn't use the 768bit format directly;  i should
 	provide a routine that converts 128 6-bit bytes (specified in
 	S-box mapping order or something) into the right format for you.
 	this would entail some byte concatenation and rotation.
 
 Des{Small|Quick}{Fips|Core}{Encrypt|Decrypt}(d, m, s)
-	performs des on the 8 bytes at s into the 8 bytes at d. (d,s: char *).
+	performs des on the 8 bytes at s into the 8 bytes at
+	``d. (d,s: char *)``.
+
 	uses m as a 768bit key as explained above.
+
 	the Encrypt|Decrypt choice is obvious.
+
 	Fips|Core determines whether a completely standard FIPS initial
 	and final permutation is done; if not, then the data is loaded
 	and stored in a nonstandard bit order (FIPS w/o IP/FP).
+
 	Fips slows down Quick by 10%, Small by 9%.
+
 	Small|Quick determines whether you use the normal routine
 	or the crazy quick one which gobbles up 64k more of memory.
 	Small is 50% slower then Quick, but Quick needs 32 times as much
@@ -329,15 +388,17 @@ Des{Small|Quick}{Fips|Core}{Encrypt|Decrypt}(d, m, s)
 
 
 Getting it to compile on your machine
+=====================================
 
 there are no machine-dependencies in the code (see porting),
-except perhaps the `now()' macro in desTest.c.
+except perhaps the ``now()`` macro in desTest.c.
 ALL generated tables are machine independent.
 you should edit the Makefile with the appropriate optimization flags
 for your compiler (MAX optimization).
 
 
 Speeding up kerberos (and/or its des library)
+=============================================
 
 note that i have included a kerberos-compatible interface in desUtil.c
 through the functions des_key_sched() and des_ecb_encrypt().
@@ -347,6 +408,7 @@ you should not need to #include desCore.h;  just include the header
 file provided with the kerberos library.
 
 Other uses
+==========
 
 the macros in desCode.h would be very useful for putting inline des
 functions in more complicated encryption routines.
diff --git a/Documentation/crypto/index.rst b/Documentation/crypto/index.rst
index 22a6870bf356..21338fa92642 100644
--- a/Documentation/crypto/index.rst
+++ b/Documentation/crypto/index.rst
@@ -27,3 +27,4 @@ for cryptographic use cases, as well as programming examples.
    crypto_engine
    api
    api-samples
+   descore-readme
-- 
2.24.1

