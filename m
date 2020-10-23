Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326F5296A58
	for <lists+linux-media@lfdr.de>; Fri, 23 Oct 2020 09:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S375718AbgJWHeR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Oct 2020 03:34:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:39536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S375714AbgJWHeQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Oct 2020 03:34:16 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6607420936;
        Fri, 23 Oct 2020 07:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603438455;
        bh=HGvl3PsFstTdLuyU989jcm167i+3/reVhKz8iD6S2RM=;
        h=From:To:Cc:Subject:Date:From;
        b=U7FXUZiUnBV2+5F6f7hysjAtV/+02VrTbwXqV7mgvUbx6Bxw+sJ5PMh6g+128djCn
         ppcf80kBg7kPUg7Jtr1rm2JxZ+BgZy2Rxglc8LCTAQ82Jz4/kVUCREpRqANwjhrpKl
         Y6wYU7LplgfezUddhOaoIWCDj9tLEW9YwWxPCGJ8=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kVraW-001q9a-NR; Fri, 23 Oct 2020 09:34:12 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] kernel-doc: validate function prototype names
Date:   Fri, 23 Oct 2020 09:34:10 +0200
Message-Id: <b5c62d6251516d9d87e1fb0746447612501b7fe3.1603438441.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Kernel-doc currently expects that the kernel-doc markup to come
just before the function prototype. Yet, if it find things like:

	/**
	 * refcount_add - add a value to a refcount
	 * @i: the value to add to the refcount
	 * @r: the refcount
	 */
	static inline void __refcount_add(int i, refcount_t *r, int *oldp);
	static inline void refcount_add(int i, refcount_t *r);

Kernel-doc will do the wrong thing:

	foobar.h:6: warning: Function parameter or member 'oldp' not described in '__refcount_add'
	.. c:function:: void __refcount_add (int i, refcount_t *r, int *oldp)

	   add a value to a refcount

	**Parameters**

	``int i``
	  the value to add to the refcount

	``refcount_t *r``
	  the refcount

	``int *oldp``
	  *undescribed*

Basically, it will document "__refcount_add" with the kernel-doc
markup for refcount_add.

If both functions have the same arguments, this won't even
produce any warning!

Add a logic to check function identifiers, warning about
wrong identifiers and not documenting them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 99cd8418ff8a..c879e69262dd 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -382,6 +382,9 @@ my $inline_doc_state;
 # 'function', 'struct', 'union', 'enum', 'typedef'
 my $decl_type;
 
+# On functions, this should match the name of the function
+my $identifier;
+
 my $doc_start = '^/\*\*\s*$'; # Allow whitespace at end of comment start.
 my $doc_end = '\*/';
 my $doc_com = '\s*\*\s*';
@@ -1785,6 +1788,11 @@ sub dump_function($$) {
 	$declaration_name = $2;
 	my $args = $3;
 
+	if ($identifier ne $declaration_name) {
+	    print STDERR "${file}:$.: warning: expecting prototype for function $identifier. Prototype was for function $declaration_name instead\n";
+	    return;
+	}
+
 	create_parameterlist($args, ',', $file, $declaration_name);
     } else {
 	print STDERR "${file}:$.: warning: cannot understand function prototype: '$prototype'\n";
@@ -2036,7 +2044,6 @@ sub process_normal() {
 #
 sub process_name($$) {
     my $file = shift;
-    my $identifier;
     my $descr;
 
     if (/$doc_block/o) {
-- 
2.26.2

