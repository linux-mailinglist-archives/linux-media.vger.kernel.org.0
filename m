Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2531F154759
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 16:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727524AbgBFPLr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 10:11:47 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:37564 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727586AbgBFPLn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 10:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
        To:From:Reply-To:Content-ID:Content-Description;
        bh=VuPZopcPVgZNDCW51vVmxg0nP0lSy2Z9nj9rgMXxMGE=; b=oEMWikM547BejTB3Bf8tF5ReeT
        MuNfvoyQKIj3bPsdWbXtYMA0/JxHk7PrseMXGozyFS8CsHx6RDdLIZ/ckNEbUFFQXwYnieSfKFUzu
        2Iuo6K49GbphWudWsugqLVBuzvhd+3q2lf/6aoiriPeU7qlXdJfAQJ6uBBpASlmGYyH91dRaSQAa/
        XUosRKCj2ZnNwgltECJzr88CST5IgA7UcASB8Rw37lzRkWMyBWV+KJBRaJWWDEMSY4HR39mldKwSx
        ES9gumOyzD31K7hb+uA9gxomOQQp7l+i7Hf6VasXeCcsCAGVsXqq/6GXSrRkyGmCOK+Hks5q+HiaC
        dKQgRB9A==;
Received: from [179.95.15.160] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1izioc-000433-UO; Thu, 06 Feb 2020 15:11:42 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1izioV-002oMw-PI; Thu, 06 Feb 2020 16:11:31 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-crypto@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 03/11] docs: crypto: convert api-intro.txt to ReST format
Date:   Thu,  6 Feb 2020 16:11:22 +0100
Message-Id: <a8b452cd37f90bc96841af29e84dccf3f7b37560.1581001737.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581001737.git.mchehab+huawei@kernel.org>
References: <cover.1581001737.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Change title markups;
- Mark literal blocks;
- Use list markups at authors/credits;
- Add blank lines when needed;
- Remove trailing whitespaces.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../crypto/{api-intro.txt => api-intro.rst}   | 186 ++++++++++--------
 Documentation/crypto/index.rst                |   1 +
 2 files changed, 100 insertions(+), 87 deletions(-)
 rename Documentation/crypto/{api-intro.txt => api-intro.rst} (70%)

diff --git a/Documentation/crypto/api-intro.txt b/Documentation/crypto/api-intro.rst
similarity index 70%
rename from Documentation/crypto/api-intro.txt
rename to Documentation/crypto/api-intro.rst
index 45d943fcae5b..bcff47d42189 100644
--- a/Documentation/crypto/api-intro.txt
+++ b/Documentation/crypto/api-intro.rst
@@ -1,7 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
 
-                    Scatterlist Cryptographic API
-                   
-INTRODUCTION
+=============================
+Scatterlist Cryptographic API
+=============================
+
+Introduction
+============
 
 The Scatterlist Crypto API takes page vectors (scatterlists) as
 arguments, and works directly on pages.  In some cases (e.g. ECB
@@ -13,22 +17,23 @@ so that processing can be applied to paged skb's without the need
 for linearization.
 
 
-DETAILS
+Details
+=======
 
 At the lowest level are algorithms, which register dynamically with the
 API.
 
 'Transforms' are user-instantiated objects, which maintain state, handle all
-of the implementation logic (e.g. manipulating page vectors) and provide an 
-abstraction to the underlying algorithms.  However, at the user 
+of the implementation logic (e.g. manipulating page vectors) and provide an
+abstraction to the underlying algorithms.  However, at the user
 level they are very simple.
 
-Conceptually, the API layering looks like this:
+Conceptually, the API layering looks like this::
 
   [transform api]  (user interface)
   [transform ops]  (per-type logic glue e.g. cipher.c, compress.c)
   [algorithm api]  (for registering algorithms)
-  
+
 The idea is to make the user interface and algorithm registration API
 very simple, while hiding the core logic from both.  Many good ideas
 from existing APIs such as Cryptoapi and Nettle have been adapted for this.
@@ -44,21 +49,21 @@ one block while the former can operate on an arbitrary amount of data,
 subject to block size requirements (i.e., non-stream ciphers can only
 process multiples of blocks).
 
-Here's an example of how to use the API:
+Here's an example of how to use the API::
 
 	#include <crypto/hash.h>
 	#include <linux/err.h>
 	#include <linux/scatterlist.h>
-	
+
 	struct scatterlist sg[2];
 	char result[128];
 	struct crypto_ahash *tfm;
 	struct ahash_request *req;
-	
+
 	tfm = crypto_alloc_ahash("md5", 0, CRYPTO_ALG_ASYNC);
 	if (IS_ERR(tfm))
 		fail();
-		
+
 	/* ... set up the scatterlists ... */
 
 	req = ahash_request_alloc(tfm, GFP_ATOMIC);
@@ -67,18 +72,19 @@ Here's an example of how to use the API:
 
 	ahash_request_set_callback(req, 0, NULL, NULL);
 	ahash_request_set_crypt(req, sg, result, 2);
-	
+
 	if (crypto_ahash_digest(req))
 		fail();
 
 	ahash_request_free(req);
 	crypto_free_ahash(tfm);
 
-    
+
 Many real examples are available in the regression test module (tcrypt.c).
 
 
-DEVELOPER NOTES
+Developer Notes
+===============
 
 Transforms may only be allocated in user context, and cryptographic
 methods may only be called from softirq and user contexts.  For
@@ -91,7 +97,8 @@ size (typically 8 bytes).  This prevents having to do any copying
 across non-aligned page fragment boundaries.
 
 
-ADDING NEW ALGORITHMS
+Adding New Algorithms
+=====================
 
 When submitting a new algorithm for inclusion, a mandatory requirement
 is that at least a few test vectors from known sources (preferably
@@ -119,132 +126,137 @@ Also check the TODO list at the web site listed below to see what people
 might already be working on.
 
 
-BUGS
+Bugs
+====
 
 Send bug reports to:
-linux-crypto@vger.kernel.org
-Cc: Herbert Xu <herbert@gondor.apana.org.au>,
+    linux-crypto@vger.kernel.org
+
+Cc:
+    Herbert Xu <herbert@gondor.apana.org.au>,
     David S. Miller <davem@redhat.com>
 
 
-FURTHER INFORMATION
+Further Information
+===================
 
 For further patches and various updates, including the current TODO
 list, see:
 http://gondor.apana.org.au/~herbert/crypto/
 
 
-AUTHORS
+Authors
+=======
 
-James Morris
-David S. Miller
-Herbert Xu
+- James Morris
+- David S. Miller
+- Herbert Xu
 
 
-CREDITS
+Credits
+=======
 
 The following people provided invaluable feedback during the development
 of the API:
 
-  Alexey Kuznetzov
-  Rusty Russell
-  Herbert Valerio Riedel
-  Jeff Garzik
-  Michael Richardson
-  Andrew Morton
-  Ingo Oeser
-  Christoph Hellwig
+  - Alexey Kuznetzov
+  - Rusty Russell
+  - Herbert Valerio Riedel
+  - Jeff Garzik
+  - Michael Richardson
+  - Andrew Morton
+  - Ingo Oeser
+  - Christoph Hellwig
 
 Portions of this API were derived from the following projects:
-  
+
   Kerneli Cryptoapi (http://www.kerneli.org/)
-    Alexander Kjeldaas
-    Herbert Valerio Riedel
-    Kyle McMartin
-    Jean-Luc Cooke
-    David Bryson
-    Clemens Fruhwirth
-    Tobias Ringstrom
-    Harald Welte
+   - Alexander Kjeldaas
+   - Herbert Valerio Riedel
+   - Kyle McMartin
+   - Jean-Luc Cooke
+   - David Bryson
+   - Clemens Fruhwirth
+   - Tobias Ringstrom
+   - Harald Welte
 
 and;
-  
+
   Nettle (http://www.lysator.liu.se/~nisse/nettle/)
-    Niels Möller
+   - Niels Möller
 
 Original developers of the crypto algorithms:
 
-  Dana L. How (DES)
-  Andrew Tridgell and Steve French (MD4)
-  Colin Plumb (MD5)
-  Steve Reid (SHA1)
-  Jean-Luc Cooke (SHA256, SHA384, SHA512)
-  Kazunori Miyazawa / USAGI (HMAC)
-  Matthew Skala (Twofish)
-  Dag Arne Osvik (Serpent)
-  Brian Gladman (AES)
-  Kartikey Mahendra Bhatt (CAST6)
-  Jon Oberheide (ARC4)
-  Jouni Malinen (Michael MIC)
-  NTT(Nippon Telegraph and Telephone Corporation) (Camellia)
+  - Dana L. How (DES)
+  - Andrew Tridgell and Steve French (MD4)
+  - Colin Plumb (MD5)
+  - Steve Reid (SHA1)
+  - Jean-Luc Cooke (SHA256, SHA384, SHA512)
+  - Kazunori Miyazawa / USAGI (HMAC)
+  - Matthew Skala (Twofish)
+  - Dag Arne Osvik (Serpent)
+  - Brian Gladman (AES)
+  - Kartikey Mahendra Bhatt (CAST6)
+  - Jon Oberheide (ARC4)
+  - Jouni Malinen (Michael MIC)
+  - NTT(Nippon Telegraph and Telephone Corporation) (Camellia)
 
 SHA1 algorithm contributors:
-  Jean-Francois Dive
-  
+  - Jean-Francois Dive
+
 DES algorithm contributors:
-  Raimar Falke
-  Gisle Sælensminde
-  Niels Möller
+  - Raimar Falke
+  - Gisle Sælensminde
+  - Niels Möller
 
 Blowfish algorithm contributors:
-  Herbert Valerio Riedel
-  Kyle McMartin
+  - Herbert Valerio Riedel
+  - Kyle McMartin
 
 Twofish algorithm contributors:
-  Werner Koch
-  Marc Mutz
+  - Werner Koch
+  - Marc Mutz
 
 SHA256/384/512 algorithm contributors:
-  Andrew McDonald
-  Kyle McMartin
-  Herbert Valerio Riedel
-  
+  - Andrew McDonald
+  - Kyle McMartin
+  - Herbert Valerio Riedel
+
 AES algorithm contributors:
-  Alexander Kjeldaas
-  Herbert Valerio Riedel
-  Kyle McMartin
-  Adam J. Richter
-  Fruhwirth Clemens (i586)
-  Linus Torvalds (i586)
+  - Alexander Kjeldaas
+  - Herbert Valerio Riedel
+  - Kyle McMartin
+  - Adam J. Richter
+  - Fruhwirth Clemens (i586)
+  - Linus Torvalds (i586)
 
 CAST5 algorithm contributors:
-  Kartikey Mahendra Bhatt (original developers unknown, FSF copyright).
+  - Kartikey Mahendra Bhatt (original developers unknown, FSF copyright).
 
 TEA/XTEA algorithm contributors:
-  Aaron Grothe
-  Michael Ringe
+  - Aaron Grothe
+  - Michael Ringe
 
 Khazad algorithm contributors:
-  Aaron Grothe
+  - Aaron Grothe
 
 Whirlpool algorithm contributors:
-  Aaron Grothe
-  Jean-Luc Cooke
+  - Aaron Grothe
+  - Jean-Luc Cooke
 
 Anubis algorithm contributors:
-  Aaron Grothe
+  - Aaron Grothe
 
 Tiger algorithm contributors:
-  Aaron Grothe
+  - Aaron Grothe
 
 VIA PadLock contributors:
-  Michal Ludvig
+  - Michal Ludvig
 
 Camellia algorithm contributors:
-  NTT(Nippon Telegraph and Telephone Corporation) (Camellia)
+  - NTT(Nippon Telegraph and Telephone Corporation) (Camellia)
 
 Generic scatterwalk code by Adam J. Richter <adam@yggdrasil.com>
 
 Please send any credits updates or corrections to:
 Herbert Xu <herbert@gondor.apana.org.au>
-
diff --git a/Documentation/crypto/index.rst b/Documentation/crypto/index.rst
index 2bcaf422731e..b2eeab3c8631 100644
--- a/Documentation/crypto/index.rst
+++ b/Documentation/crypto/index.rst
@@ -17,6 +17,7 @@ for cryptographic use cases, as well as programming examples.
    :maxdepth: 2
 
    intro
+   api-intro
    architecture
    asymmetric-keys
    devel-algos
-- 
2.24.1

