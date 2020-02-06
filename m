Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55836154748
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 16:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727803AbgBFPLo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 10:11:44 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:37582 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727602AbgBFPLn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 10:11:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description;
        bh=UhxvxepcKfB+Wfh8eN9De8M7E0rqIZOFN8yjyXgRbHc=; b=GAnLgO2v9sLQP9LnMDfDtF1fH4
        C/kM/KBZRnluJAHtyFTkvb4oYk4F292J1aAFv6dbblnnVecDomnxBsSivtkmjpd+rEKjzB9ZjJIJ9
        aziyPesQmWFoVJerDdaWCdczZTh+226F5F1FJ9NnnbxxDJkqtD/NZzPadqlMrJDUFFLxDy8cShvYn
        4q2lhN/Ud0l3Mt+m6YFqlcdTe8vM3FjhtQdyQYHjuMVoVJK9RgBdSqnP77Cys1cEV/88lwqMy2RJ5
        L1NlhEYRC3mrdhA8vxFpSJMNwIFfBSI4v9gsTmxxF3gpTpC96nFJ7h1S9O4YCqt0Ox+VdCMRW9vMR
        lWJj5kuA==;
Received: from [179.95.15.160] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1izioc-000430-DU; Thu, 06 Feb 2020 15:11:42 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1izioV-002oMr-OA; Thu, 06 Feb 2020 16:11:31 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        David Howells <dhowells@redhat.com>,
        linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
        keyrings@vger.kernel.org
Subject: [PATCH 02/11] docs: crypto: convert asymmetric-keys.txt to ReST
Date:   Thu,  6 Feb 2020 16:11:21 +0100
Message-Id: <1b6cd1da02dda27a725a6c4214019a1e306a7927.1581001737.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1581001737.git.mchehab+huawei@kernel.org>
References: <cover.1581001737.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This file is almost compatible with ReST. Just minor changes
were needed:

- Adjust document and titles markups;
- Adjust numbered list markups;
- Add a comments markup for the Contents section;
- Add markups for literal blocks.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 ...symmetric-keys.txt => asymmetric-keys.rst} | 91 +++++++++----------
 Documentation/crypto/index.rst                |  1 +
 2 files changed, 44 insertions(+), 48 deletions(-)
 rename Documentation/crypto/{asymmetric-keys.txt => asymmetric-keys.rst} (91%)

diff --git a/Documentation/crypto/asymmetric-keys.txt b/Documentation/crypto/asymmetric-keys.rst
similarity index 91%
rename from Documentation/crypto/asymmetric-keys.txt
rename to Documentation/crypto/asymmetric-keys.rst
index 8763866b11cf..34063f8959fe 100644
--- a/Documentation/crypto/asymmetric-keys.txt
+++ b/Documentation/crypto/asymmetric-keys.rst
@@ -1,8 +1,10 @@
-		=============================================
-		ASYMMETRIC / PUBLIC-KEY CRYPTOGRAPHY KEY TYPE
-		=============================================
+.. SPDX-License-Identifier: GPL-2.0
 
-Contents:
+=============================================
+Asymmetric / Public-key Cryptography Key Type
+=============================================
+
+.. Contents:
 
   - Overview.
   - Key identification.
@@ -13,8 +15,7 @@ Contents:
   - Keyring link restrictions.
 
 
-========
-OVERVIEW
+Overview
 ========
 
 The "asymmetric" key type is designed to be a container for the keys used in
@@ -42,8 +43,7 @@ key, or it may interpret it as a reference to a key held somewhere else in the
 system (for example, a TPM).
 
 
-==================
-KEY IDENTIFICATION
+Key Identification
 ==================
 
 If a key is added with an empty name, the instantiation data parsers are given
@@ -57,49 +57,48 @@ The asymmetric key type's match function can then perform a wider range of
 comparisons than just the straightforward comparison of the description with
 the criterion string:
 
- (1) If the criterion string is of the form "id:<hexdigits>" then the match
+  1) If the criterion string is of the form "id:<hexdigits>" then the match
      function will examine a key's fingerprint to see if the hex digits given
-     after the "id:" match the tail.  For instance:
+     after the "id:" match the tail.  For instance::
 
 	keyctl search @s asymmetric id:5acc2142
 
-     will match a key with fingerprint:
+     will match a key with fingerprint::
 
 	1A00 2040 7601 7889 DE11  882C 3823 04AD 5ACC 2142
 
- (2) If the criterion string is of the form "<subtype>:<hexdigits>" then the
+ 2) If the criterion string is of the form "<subtype>:<hexdigits>" then the
      match will match the ID as in (1), but with the added restriction that
      only keys of the specified subtype (e.g. tpm) will be matched.  For
-     instance:
+     instance::
 
 	keyctl search @s asymmetric tpm:5acc2142
 
 Looking in /proc/keys, the last 8 hex digits of the key fingerprint are
-displayed, along with the subtype:
+displayed, along with the subtype::
 
 	1a39e171 I-----     1 perm 3f010000     0     0 asymmetric modsign.0: DSA 5acc2142 []
 
 
-=========================
-ACCESSING ASYMMETRIC KEYS
+Accessing Asymmetric Keys
 =========================
 
 For general access to asymmetric keys from within the kernel, the following
-inclusion is required:
+inclusion is required::
 
 	#include <crypto/public_key.h>
 
 This gives access to functions for dealing with asymmetric / public keys.
 Three enums are defined there for representing public-key cryptography
-algorithms:
+algorithms::
 
 	enum pkey_algo
 
-digest algorithms used by those:
+digest algorithms used by those::
 
 	enum pkey_hash_algo
 
-and key identifier representations:
+and key identifier representations::
 
 	enum pkey_id_type
 
@@ -110,25 +109,25 @@ PGP-specific metadata, whereas X.509 has arbitrary certificate identifiers.
 
 The operations defined upon a key are:
 
- (1) Signature verification.
+1) Signature verification.
 
 Other operations are possible (such as encryption) with the same key data
 required for verification, but not currently supported, and others
 (eg. decryption and signature generation) require extra key data.
 
 
-SIGNATURE VERIFICATION
+Signature Verification
 ----------------------
 
 An operation is provided to perform cryptographic signature verification, using
-an asymmetric key to provide or to provide access to the public key.
+an asymmetric key to provide or to provide access to the public key::
 
 	int verify_signature(const struct key *key,
 			     const struct public_key_signature *sig);
 
 The caller must have already obtained the key from some source and can then use
 it to check the signature.  The caller must have parsed the signature and
-transferred the relevant bits to the structure pointed to by sig.
+transferred the relevant bits to the structure pointed to by sig::
 
 	struct public_key_signature {
 		u8 *digest;
@@ -159,8 +158,7 @@ data; or -ENOMEM if an allocation can't be performed.  -EINVAL can be returned
 if the key argument is the wrong type or is incompletely set up.
 
 
-=======================
-ASYMMETRIC KEY SUBTYPES
+Asymmetric Key Subtypes
 =======================
 
 Asymmetric keys have a subtype that defines the set of operations that can be
@@ -171,11 +169,11 @@ The subtype is selected by the key data parser and the parser must initialise
 the data required for it.  The asymmetric key retains a reference on the
 subtype module.
 
-The subtype definition structure can be found in:
+The subtype definition structure can be found in::
 
 	#include <keys/asymmetric-subtype.h>
 
-and looks like the following:
+and looks like the following::
 
 	struct asymmetric_key_subtype {
 		struct module		*owner;
@@ -198,39 +196,37 @@ the subtype.  Currently, the name is only used for print statements.
 
 There are a number of operations defined by the subtype:
 
- (1) describe().
+  1) describe().
 
      Mandatory.  This allows the subtype to display something in /proc/keys
      against the key.  For instance the name of the public key algorithm type
      could be displayed.  The key type will display the tail of the key
      identity string after this.
 
- (2) destroy().
+  2) destroy().
 
      Mandatory.  This should free the memory associated with the key.  The
      asymmetric key will look after freeing the fingerprint and releasing the
      reference on the subtype module.
 
- (3) query().
+  3) query().
 
      Mandatory.  This is a function for querying the capabilities of a key.
 
- (4) eds_op().
+  4) eds_op().
 
      Optional.  This is the entry point for the encryption, decryption and
      signature creation operations (which are distinguished by the operation ID
      in the parameter struct).  The subtype may do anything it likes to
      implement an operation, including offloading to hardware.
 
- (5) verify_signature().
+  5) verify_signature().
 
      Optional.  This is the entry point for signature verification.  The
      subtype may do anything it likes to implement an operation, including
      offloading to hardware.
 
-
-==========================
-INSTANTIATION DATA PARSERS
+Instantiation Data Parsers
 ==========================
 
 The asymmetric key type doesn't generally want to store or to deal with a raw
@@ -254,11 +250,11 @@ Examples of blob formats for which parsers could be implemented include:
 During key instantiation each parser in the list is tried until one doesn't
 return -EBADMSG.
 
-The parser definition structure can be found in:
+The parser definition structure can be found in::
 
 	#include <keys/asymmetric-parser.h>
 
-and looks like the following:
+and looks like the following::
 
 	struct asymmetric_key_parser {
 		struct module	*owner;
@@ -273,7 +269,7 @@ the parser.
 There is currently only a single operation defined by the parser, and it is
 mandatory:
 
- (1) parse().
+  1) parse().
 
      This is called to preparse the key from the key creation and update paths.
      In particular, it is called during the key creation _before_ a key is
@@ -282,7 +278,7 @@ mandatory:
 
      The caller passes a pointer to the following struct with all of the fields
      cleared, except for data, datalen and quotalen [see
-     Documentation/security/keys/core.rst].
+     Documentation/security/keys/core.rst]::
 
 	struct key_preparsed_payload {
 		char		*description;
@@ -321,7 +317,7 @@ mandatory:
      public-key algorithm such as RSA and DSA this will likely be a printable
      hex version of the key's fingerprint.
 
-Functions are provided to register and unregister parsers:
+Functions are provided to register and unregister parsers::
 
 	int register_asymmetric_key_parser(struct asymmetric_key_parser *parser);
 	void unregister_asymmetric_key_parser(struct asymmetric_key_parser *subtype);
@@ -330,8 +326,7 @@ Parsers may not have the same name.  The names are otherwise only used for
 displaying in debugging messages.
 
 
-=========================
-KEYRING LINK RESTRICTIONS
+Keyring Link Restrictions
 =========================
 
 Keyrings created from userspace using add_key can be configured to check the
@@ -340,7 +335,7 @@ allowed to link.
 
 Several restriction methods are available:
 
- (1) Restrict using the kernel builtin trusted keyring
+  1) Restrict using the kernel builtin trusted keyring
 
      - Option string used with KEYCTL_RESTRICT_KEYRING:
        - "builtin_trusted"
@@ -350,7 +345,7 @@ Several restriction methods are available:
      rejected.  The ca_keys kernel parameter also affects which keys are used
      for signature verification.
 
- (2) Restrict using the kernel builtin and secondary trusted keyrings
+  2) Restrict using the kernel builtin and secondary trusted keyrings
 
      - Option string used with KEYCTL_RESTRICT_KEYRING:
        - "builtin_and_secondary_trusted"
@@ -361,7 +356,7 @@ Several restriction methods are available:
      kernel parameter also affects which keys are used for signature
      verification.
 
- (3) Restrict using a separate key or keyring
+  3) Restrict using a separate key or keyring
 
      - Option string used with KEYCTL_RESTRICT_KEYRING:
        - "key_or_keyring:<key or keyring serial number>[:chain]"
@@ -378,7 +373,7 @@ Several restriction methods are available:
      certificate in order (starting closest to the root) to a keyring.  For
      instance, one keyring can be populated with links to a set of root
      certificates, with a separate, restricted keyring set up for each
-     certificate chain to be validated:
+     certificate chain to be validated::
 
 	# Create and populate a keyring for root certificates
 	root_id=`keyctl add keyring root-certs "" @s`
@@ -400,7 +395,7 @@ Several restriction methods are available:
      one of the root certificates.
 
      A single keyring can be used to verify a chain of signatures by
-     restricting the keyring after linking the root certificate:
+     restricting the keyring after linking the root certificate::
 
 	# Create a keyring for the certificate chain and add the root
 	chain2_id=`keyctl add keyring chain2 "" @s`
diff --git a/Documentation/crypto/index.rst b/Documentation/crypto/index.rst
index c4ff5d791233..2bcaf422731e 100644
--- a/Documentation/crypto/index.rst
+++ b/Documentation/crypto/index.rst
@@ -18,6 +18,7 @@ for cryptographic use cases, as well as programming examples.
 
    intro
    architecture
+   asymmetric-keys
    devel-algos
    userspace-if
    crypto_engine
-- 
2.24.1

