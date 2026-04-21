Return-Path: <linux-media+bounces-59237-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPsxNba952kWAQIAu9opvQ
	(envelope-from <linux-media+bounces-59237-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 20:11:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 364C743E696
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 20:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C70E302E783
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2026 18:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF4A2DECA3;
	Tue, 21 Apr 2026 18:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hCJ0CN8L";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kYz3I/PX"
X-Original-To: linux-media@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BFF28640B;
	Tue, 21 Apr 2026 18:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776794579; cv=none; b=M/qCqrpuQ5o/+7YjCoOxdD5crmxFR5rAiICeA8MOGmTZ/+FgshZsa8OOwbXGV7cNIsD4/F5IBltz+M98YG8FZ1Ak+CxPaAi685OeUpECKj7vUY7t7amdiU6k0xHtu3evdzKCToideUOXnJWwc6drW8V8D6nrEXsv6TJNXsMzJsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776794579; c=relaxed/simple;
	bh=WoUznLblO/mmxuCRQwVhw/QQgI/Py50O6xzSDTsNc2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a6V59PRWm0jBzQgkEaWS2NaiX96huEt1edtjC5AbR7Iq9aY14MqkvR1jihWzTWQwRdFKK+YJ7f4kyQBOZiLSQ3oeov5h3eH50QSRfVAw9EDEnbAEjTkPFHvRChbZ2hOEB2HR0IV4vS9f6PGqcuLfZnrlesdx8gpUfoyyxbpnE10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hCJ0CN8L; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kYz3I/PX; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4g0VZR06KJz9spj;
	Tue, 21 Apr 2026 20:02:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776794575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bkSTLKZru3gfycAuM4Gr35StLpobzomuFrfuszWpYXo=;
	b=hCJ0CN8Lb6WuIQVGXxjplCWSjSs7u/Xn9jyZhkHB9OzJfrJGAPwHw895SBmG+c9Hz+LQfy
	Jy6X1hBijbEvadZpdd+2XwwNGXLEj91clNS4HYlWDnxZViAcDN9AJlX0TnqLS3rdhoFt/t
	oR9oY/b2B7Jp0xHSPgR9iMdya6dNsZ0Ynd8L6I4gE3EB4lEqU+j85wcEzHDg95xBVI0j18
	1KvNb8U4MeOyyVdR8qdoSRqKNONkqRBMnK89GgzY1eKyngW83zV4zH6r0cdX7MrZYD9Nho
	hR8aGpaLZz80Ikn+Lcph84eve8y6b8t0Ub1LIHmjpPC1UiufdZqkhSHNBEtpSw==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="kYz3I/PX";
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1776794573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bkSTLKZru3gfycAuM4Gr35StLpobzomuFrfuszWpYXo=;
	b=kYz3I/PXpeyXoqaalGtAzwL9qH+1NranX0hee+1rt4aZqNrjut6jVWhR0Yv98s9+993x2K
	s1CV8uCJjJ9a32sJzdxwNEn7OZZPxkpWtJFEfnIa0CVdGQk00cN4e3V1dAAcAPDCRGQDLY
	nEOz6lyNCOBq9MZ6Em3gkv0MtPSv8eEdoHYmmfBwIJyBlgIsrwsq7aV5QqahzzCd+wnzUw
	M1Vtm3KVngnqeOjC7h0p2ZI3RY9C82vv0dXX9UJFxx5K1bBu8kR1i0/1bKk7jLUjlRgwdQ
	hv3xz7ZwC7wGl601FBRgTOATqe98+ue6JwWrLxPXWXGq54bCenH91kK/WCrxAg==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-media@vger.kernel.org,
	Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH v2 1/3] Documentation: adopt new coding style of type-aware kmalloc-family
Date: Tue, 21 Apr 2026 20:01:58 +0200
Message-ID: <20260421180200.225244-2-manuelebner@mailbox.org>
In-Reply-To: <20260421175516.224960-2-manuelebner@mailbox.org>
References: <20260421175516.224960-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: co8oprgg8djorzgejszfokchnytw84k9
X-MBO-RS-ID: d75bdf6d01e6b58ae96
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59237-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Queue-Id: 364C743E696
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Update the documentation to reflect new type-aware kmalloc-family as
suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj() and family")

ptr = kmalloc(sizeof(*ptr), gfp);
 -> ptr = kmalloc_obj(*ptr);
ptr = kmalloc(sizeof(struct some_obj_name), gfp);
 -> ptr = kmalloc_obj(*ptr);
ptr = kzalloc(sizeof(*ptr), gfp);
 -> ptr = kzalloc_obj(*ptr);
ptr = kmalloc_array(count, sizeof(*ptr), gfp);
 -> ptr = kmalloc_objs(*ptr, count);
ptr = kcalloc(count, sizeof(*ptr), gfp);
 -> ptr = kzalloc_objs(*ptr, count);

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/core-api/kref.rst                      |  4 ++--
 Documentation/core-api/list.rst                      |  4 ++--
 Documentation/core-api/memory-allocation.rst         |  4 ++--
 Documentation/driver-api/mailbox.rst                 |  4 ++--
 Documentation/driver-api/media/v4l2-fh.rst           |  2 +-
 Documentation/kernel-hacking/locking.rst             |  4 ++--
 Documentation/locking/locktypes.rst                  |  4 ++--
 Documentation/process/coding-style.rst               |  8 ++++----
 .../sound/kernel-api/writing-an-alsa-driver.rst      | 12 ++++++------
 Documentation/spi/spi-summary.rst                    |  4 ++--
 .../translations/it_IT/kernel-hacking/locking.rst    |  4 ++--
 .../translations/it_IT/locking/locktypes.rst         |  4 ++--
 .../translations/it_IT/process/coding-style.rst      |  2 +-
 .../translations/sp_SP/process/coding-style.rst      |  2 +-
 Documentation/translations/zh_CN/core-api/kref.rst   |  4 ++--
 .../translations/zh_CN/process/coding-style.rst      |  2 +-
 .../zh_CN/video4linux/v4l2-framework.txt             |  2 +-
 .../translations/zh_TW/process/coding-style.rst      |  2 +-
 18 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/Documentation/core-api/kref.rst b/Documentation/core-api/kref.rst
index 8db9ff03d952..1c14c036699d 100644
--- a/Documentation/core-api/kref.rst
+++ b/Documentation/core-api/kref.rst
@@ -40,7 +40,7 @@ kref_init as so::
 
      struct my_data *data;
 
-     data = kmalloc(sizeof(*data), GFP_KERNEL);
+     data = kmalloc_obj(*data);
      if (!data)
             return -ENOMEM;
      kref_init(&data->refcount);
@@ -100,7 +100,7 @@ thread to process::
 	int rv = 0;
 	struct my_data *data;
 	struct task_struct *task;
-	data = kmalloc(sizeof(*data), GFP_KERNEL);
+	data = kmalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
 	kref_init(&data->refcount);
diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.rst
index 241464ca0549..86cd0a1b77ea 100644
--- a/Documentation/core-api/list.rst
+++ b/Documentation/core-api/list.rst
@@ -112,7 +112,7 @@ list:
 
           /* State 1 */
 
-          grock = kzalloc(sizeof(*grock), GFP_KERNEL);
+          grock = kzalloc_obj(*grock);
           if (!grock)
                   return -ENOMEM;
           grock->name = "Grock";
@@ -123,7 +123,7 @@ list:
 
           /* State 2 */
 
-          dimitri = kzalloc(sizeof(*dimitri), GFP_KERNEL);
+          dimitri = kzalloc_obj(*dimitri);
           if (!dimitri)
                   return -ENOMEM;
           dimitri->name = "Dimitri";
diff --git a/Documentation/core-api/memory-allocation.rst b/Documentation/core-api/memory-allocation.rst
index 0f19dd524323..8379775f17d3 100644
--- a/Documentation/core-api/memory-allocation.rst
+++ b/Documentation/core-api/memory-allocation.rst
@@ -135,7 +135,7 @@ Selecting memory allocator
 The most straightforward way to allocate memory is to use a function
 from the kmalloc() family. And, to be on the safe side it's best to use
 routines that set memory to zero, like kzalloc(). If you need to
-allocate memory for an array, there are kmalloc_array() and kcalloc()
+allocate memory for an array, there are kmalloc_objs() and kzalloc_objs()
 helpers. The helpers struct_size(), array_size() and array3_size() can
 be used to safely calculate object sizes without overflowing.
 
@@ -151,7 +151,7 @@ sizes, the alignment is guaranteed to be at least the largest power-of-two
 divisor of the size.
 
 Chunks allocated with kmalloc() can be resized with krealloc(). Similarly
-to kmalloc_array(): a helper for resizing arrays is provided in the form of
+to kmalloc_objs(): a helper for resizing arrays is provided in the form of
 krealloc_array().
 
 For large allocations you can use vmalloc() and vzalloc(), or directly
diff --git a/Documentation/driver-api/mailbox.rst b/Documentation/driver-api/mailbox.rst
index 463dd032b96c..4bcd73a99115 100644
--- a/Documentation/driver-api/mailbox.rst
+++ b/Documentation/driver-api/mailbox.rst
@@ -87,8 +87,8 @@ a message and a callback function to the API and return immediately).
 		struct async_pkt ap;
 		struct sync_pkt sp;
 
-		dc_sync = kzalloc(sizeof(*dc_sync), GFP_KERNEL);
-		dc_async = kzalloc(sizeof(*dc_async), GFP_KERNEL);
+		dc_sync = kzalloc_obj(*dc_sync);
+		dc_async = kzalloc_obj(*dc_async);
 
 		/* Populate non-blocking mode client */
 		dc_async->cl.dev = &pdev->dev;
diff --git a/Documentation/driver-api/media/v4l2-fh.rst b/Documentation/driver-api/media/v4l2-fh.rst
index a934caa483a4..38319130ebf5 100644
--- a/Documentation/driver-api/media/v4l2-fh.rst
+++ b/Documentation/driver-api/media/v4l2-fh.rst
@@ -42,7 +42,7 @@ Example:
 
 		...
 
-		my_fh = kzalloc(sizeof(*my_fh), GFP_KERNEL);
+		my_fh = kzalloc_obj(*my_fh);
 
 		...
 
diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
index dff0646a717b..d02e62367c4f 100644
--- a/Documentation/kernel-hacking/locking.rst
+++ b/Documentation/kernel-hacking/locking.rst
@@ -442,7 +442,7 @@ to protect the cache and all the objects within it. Here's the code::
     {
             struct object *obj;
 
-            if ((obj = kmalloc(sizeof(*obj), GFP_KERNEL)) == NULL)
+            if ((obj = kmalloc_obj(*obj)) == NULL)
                     return -ENOMEM;
 
             strscpy(obj->name, name, sizeof(obj->name));
@@ -517,7 +517,7 @@ which are taken away, and the ``+`` are lines which are added.
              struct object *obj;
     +        unsigned long flags;
 
-             if ((obj = kmalloc(sizeof(*obj), GFP_KERNEL)) == NULL)
+             if ((obj = kmalloc_obj(*obj)) == NULL)
                      return -ENOMEM;
     @@ -63,30 +64,33 @@
              obj->id = id;
diff --git a/Documentation/locking/locktypes.rst b/Documentation/locking/locktypes.rst
index 37b6a5670c2f..ac1ad722a9e7 100644
--- a/Documentation/locking/locktypes.rst
+++ b/Documentation/locking/locktypes.rst
@@ -498,7 +498,7 @@ allocating memory.  Thus, on a non-PREEMPT_RT kernel the following code
 works perfectly::
 
   raw_spin_lock(&lock);
-  p = kmalloc(sizeof(*p), GFP_ATOMIC);
+  p = kmalloc_obj(*p, GFP_ATOMIC);
 
 But this code fails on PREEMPT_RT kernels because the memory allocator is
 fully preemptible and therefore cannot be invoked from truly atomic
@@ -507,7 +507,7 @@ while holding normal non-raw spinlocks because they do not disable
 preemption on PREEMPT_RT kernels::
 
   spin_lock(&lock);
-  p = kmalloc(sizeof(*p), GFP_ATOMIC);
+  p = kmalloc_obj(*p, GFP_ATOMIC);
 
 
 bit spinlocks
diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 35b381230f6e..a3bf75dc7c88 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -936,7 +936,7 @@ used.
 ---------------------
 
 The kernel provides the following general purpose memory allocators:
-kmalloc(), kzalloc(), kmalloc_array(), kcalloc(), vmalloc(), and
+kmalloc(), kzalloc(), kmalloc_objs(), kzalloc_objs(), vmalloc(), and
 vzalloc().  Please refer to the API documentation for further information
 about them.  :ref:`Documentation/core-api/memory-allocation.rst
 <memory_allocation>`
@@ -945,7 +945,7 @@ The preferred form for passing a size of a struct is the following:
 
 .. code-block:: c
 
-	p = kmalloc(sizeof(*p), ...);
+	p = kmalloc_obj(*p, ...);
 
 The alternative form where struct name is spelled out hurts readability and
 introduces an opportunity for a bug when the pointer variable type is changed
@@ -959,13 +959,13 @@ The preferred form for allocating an array is the following:
 
 .. code-block:: c
 
-	p = kmalloc_array(n, sizeof(...), ...);
+	p = kmalloc_objs(*ptr, n, ...);
 
 The preferred form for allocating a zeroed array is the following:
 
 .. code-block:: c
 
-	p = kcalloc(n, sizeof(...), ...);
+	p = kzalloc_objs(*ptr, n, ...);
 
 Both forms check for overflow on the allocation size n * sizeof(...),
 and return NULL if that occurred.
diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index 895752cbcedd..12433612aa9c 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -266,7 +266,7 @@ to details explained in the following section.
               ....
 
               /* allocate a chip-specific data with zero filled */
-              chip = kzalloc(sizeof(*chip), GFP_KERNEL);
+              chip = kzalloc_obj(*chip);
               if (chip == NULL)
                       return -ENOMEM;
 
@@ -628,7 +628,7 @@ After allocating a card instance via :c:func:`snd_card_new()`
   err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
                      0, &card);
   .....
-  chip = kzalloc(sizeof(*chip), GFP_KERNEL);
+  chip = kzalloc_obj(*chip);
 
 The chip record should have the field to hold the card pointer at least,
 
@@ -747,7 +747,7 @@ destructor and PCI entries. Example code is shown first, below::
                       return -ENXIO;
               }
 
-              chip = kzalloc(sizeof(*chip), GFP_KERNEL);
+              chip = kzalloc_obj(*chip);
               if (chip == NULL) {
                       pci_disable_device(pci);
                       return -ENOMEM;
@@ -1737,7 +1737,7 @@ callback::
   {
           struct my_pcm_data *data;
           ....
-          data = kmalloc(sizeof(*data), GFP_KERNEL);
+          data = kmalloc_obj(*data);
           substream->runtime->private_data = data;
           ....
   }
@@ -3301,7 +3301,7 @@ You can then pass any pointer value to the ``private_data``. If you
 assign private data, you should define a destructor, too. The
 destructor function is set in the ``private_free`` field::
 
-  struct mydata *p = kmalloc(sizeof(*p), GFP_KERNEL);
+  struct mydata *p = kmalloc_obj(*p);
   hw->private_data = p;
   hw->private_free = mydata_free;
 
@@ -3833,7 +3833,7 @@ chip data individually::
           err = snd_card_new(&pci->dev, index[dev], id[dev], THIS_MODULE,
                              0, &card);
           ....
-          chip = kzalloc(sizeof(*chip), GFP_KERNEL);
+          chip = kzalloc_obj(*chip);
           ....
           card->private_data = chip;
           ....
diff --git a/Documentation/spi/spi-summary.rst b/Documentation/spi/spi-summary.rst
index 6e21e6f86912..7ad6af76c247 100644
--- a/Documentation/spi/spi-summary.rst
+++ b/Documentation/spi/spi-summary.rst
@@ -249,7 +249,7 @@ And SOC-specific utility code might look something like::
 	{
 		struct mysoc_spi_data *pdata2;
 
-		pdata2 = kmalloc(sizeof *pdata2, GFP_KERNEL);
+		pdata2 = kmalloc_obj(*pdata2);
 		*pdata2 = pdata;
 		...
 		if (n == 2) {
@@ -373,7 +373,7 @@ a bus (appearing under /sys/class/spi_master).
 			return -ENODEV;
 
 		/* get memory for driver's per-chip state */
-		chip = kzalloc(sizeof *chip, GFP_KERNEL);
+		chip = kzalloc(*chip);
 		if (!chip)
 			return -ENOMEM;
 		spi_set_drvdata(spi, chip);
diff --git a/Documentation/translations/it_IT/kernel-hacking/locking.rst b/Documentation/translations/it_IT/kernel-hacking/locking.rst
index 4c21cf60f775..acca89a3743a 100644
--- a/Documentation/translations/it_IT/kernel-hacking/locking.rst
+++ b/Documentation/translations/it_IT/kernel-hacking/locking.rst
@@ -462,7 +462,7 @@ e tutti gli oggetti che contiene. Ecco il codice::
     {
             struct object *obj;
 
-            if ((obj = kmalloc(sizeof(*obj), GFP_KERNEL)) == NULL)
+            if ((obj = kmalloc_obj(*obj)) == NULL)
                     return -ENOMEM;
 
             strscpy(obj->name, name, sizeof(obj->name));
@@ -537,7 +537,7 @@ sono quelle rimosse, mentre quelle ``+`` sono quelle aggiunte.
              struct object *obj;
     +        unsigned long flags;
 
-             if ((obj = kmalloc(sizeof(*obj), GFP_KERNEL)) == NULL)
+             if ((obj = kmalloc_obj(*obj)) == NULL)
                      return -ENOMEM;
     @@ -63,30 +64,33 @@
              obj->id = id;
diff --git a/Documentation/translations/it_IT/locking/locktypes.rst b/Documentation/translations/it_IT/locking/locktypes.rst
index 1c7056283b9d..d5fa36aa05cc 100644
--- a/Documentation/translations/it_IT/locking/locktypes.rst
+++ b/Documentation/translations/it_IT/locking/locktypes.rst
@@ -488,7 +488,7 @@ o rwlock_t. Per esempio, la sezione critica non deve fare allocazioni di
 memoria. Su un kernel non-PREEMPT_RT il seguente codice funziona perfettamente::
 
   raw_spin_lock(&lock);
-  p = kmalloc(sizeof(*p), GFP_ATOMIC);
+  p = kmalloc_obj(*p, GFP_ATOMIC);
 
 Ma lo stesso codice non funziona su un kernel PREEMPT_RT perché l'allocatore di
 memoria può essere oggetto di prelazione e quindi non può essere chiamato in un
@@ -497,7 +497,7 @@ trattiene un blocco *non-raw* perché non disabilitano la prelazione sui kernel
 PREEMPT_RT::
 
   spin_lock(&lock);
-  p = kmalloc(sizeof(*p), GFP_ATOMIC);
+  p = kmalloc_obj(*p, GFP_ATOMIC);
 
 
 bit spinlocks
diff --git a/Documentation/translations/it_IT/process/coding-style.rst b/Documentation/translations/it_IT/process/coding-style.rst
index c0dc786b8474..2a499412a2e3 100644
--- a/Documentation/translations/it_IT/process/coding-style.rst
+++ b/Documentation/translations/it_IT/process/coding-style.rst
@@ -943,7 +943,7 @@ Il modo preferito per passare la dimensione di una struttura è il seguente:
 
 .. code-block:: c
 
-	p = kmalloc(sizeof(*p), ...);
+	p = kmalloc_obj(*p, ...);
 
 La forma alternativa, dove il nome della struttura viene scritto interamente,
 peggiora la leggibilità e introduce possibili bachi quando il tipo di
diff --git a/Documentation/translations/sp_SP/process/coding-style.rst b/Documentation/translations/sp_SP/process/coding-style.rst
index 7d63aa8426e6..44c93d5f6beb 100644
--- a/Documentation/translations/sp_SP/process/coding-style.rst
+++ b/Documentation/translations/sp_SP/process/coding-style.rst
@@ -955,7 +955,7 @@ La forma preferida para pasar el tamaño de una estructura es la siguiente:
 
 .. code-block:: c
 
-	p = kmalloc(sizeof(*p), ...);
+	p = kmalloc_obj(*p, ...);
 
 La forma alternativa donde se deletrea el nombre de la estructura perjudica
 la legibilidad, y presenta una oportunidad para un error cuando se cambia
diff --git a/Documentation/translations/zh_CN/core-api/kref.rst b/Documentation/translations/zh_CN/core-api/kref.rst
index b9902af310c5..fcff01e99852 100644
--- a/Documentation/translations/zh_CN/core-api/kref.rst
+++ b/Documentation/translations/zh_CN/core-api/kref.rst
@@ -52,7 +52,7 @@ kref可以出现在数据结构体中的任何地方。
 
      struct my_data *data;
 
-     data = kmalloc(sizeof(*data), GFP_KERNEL);
+     data = kmalloc_obj(*data);
      if (!data)
             return -ENOMEM;
      kref_init(&data->refcount);
@@ -106,7 +106,7 @@ Kref规则
 	int rv = 0;
 	struct my_data *data;
 	struct task_struct *task;
-	data = kmalloc(sizeof(*data), GFP_KERNEL);
+	data = kmalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
 	kref_init(&data->refcount);
diff --git a/Documentation/translations/zh_CN/process/coding-style.rst b/Documentation/translations/zh_CN/process/coding-style.rst
index 5a342a024c01..55d5da974d89 100644
--- a/Documentation/translations/zh_CN/process/coding-style.rst
+++ b/Documentation/translations/zh_CN/process/coding-style.rst
@@ -813,7 +813,7 @@ Documentation/translations/zh_CN/core-api/memory-allocation.rst 。
 
 .. code-block:: c
 
-	p = kmalloc(sizeof(*p), ...);
+	p = kmalloc_obj(*p, ...);
 
 另外一种传递方式中，sizeof 的操作数是结构体的名字，这样会降低可读性，并且可能
 会引入 bug。有可能指针变量类型被改变时，而对应的传递给内存分配函数的 sizeof
diff --git a/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt b/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
index f0be21a60a0f..ba43c5c4797c 100644
--- a/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
+++ b/Documentation/translations/zh_CN/video4linux/v4l2-framework.txt
@@ -799,7 +799,7 @@ int my_open(struct file *file)
 
 	...
 
-	my_fh = kzalloc(sizeof(*my_fh), GFP_KERNEL);
+	my_fh = kzalloc_obj(*my_fh);
 
 	...
 
diff --git a/Documentation/translations/zh_TW/process/coding-style.rst b/Documentation/translations/zh_TW/process/coding-style.rst
index e2ba97b3d8bb..63c78982a1af 100644
--- a/Documentation/translations/zh_TW/process/coding-style.rst
+++ b/Documentation/translations/zh_TW/process/coding-style.rst
@@ -827,7 +827,7 @@ Documentation/translations/zh_CN/core-api/memory-allocation.rst 。
 
 .. code-block:: c
 
-	p = kmalloc(sizeof(*p), ...);
+	p = kmalloc_obj(*p, ...);
 
 另外一種傳遞方式中，sizeof 的操作數是結構體的名字，這樣會降低可讀性，並且可能
 會引入 bug。有可能指針變量類型被改變時，而對應的傳遞給內存分配函數的 sizeof
-- 
2.53.0


