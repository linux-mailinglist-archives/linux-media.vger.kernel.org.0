Return-Path: <linux-media+bounces-57930-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Gd+N8UrzmnIlQYAu9opvQ
	(envelope-from <linux-media+bounces-57930-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 10:41:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A131386351
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 10:41:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BDE6A30185CA
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 08:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707B73B47D3;
	Thu,  2 Apr 2026 08:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pa1jqXRy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF0638AC78
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 08:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775119298; cv=none; b=NvCWwkcSGUxbtBZUsicYDJj2RNP/8j47XKhoBWyZ0y+du4KbCcoZtonTUw7716ZqWJ4v/J68E9IsEX43qmu+0SPntZSqjqFrLPV0hyqfBw0XXivOOjLjHOSaXjOhLMAEJ3dwfr5lpzZ6EO+61agqbczODSkqGaxaFtzd6v9ZZN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775119298; c=relaxed/simple;
	bh=ANqb5i1tpKDfgmY9Mdfmivntv7t3ODNAUIQtD3WHX88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FF7J+tKLNeQMUCDBIJD+HVLzgD3EBSaErett11N5rUMVWcM0fDcvwxMA5koSqZK+IwFS+wL9l+r7Wqy92d9rCwPeocWfLtv9gST4wHm4vzHatLjTMPobz/e1En9/L1q/hvSQmrzQmaZ9La9gQbRH4Kk7WMl8gom0DcLqeIZBXkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pa1jqXRy; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d17bb1c65so353777f8f.0
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 01:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775119296; x=1775724096; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Eo+AVSMDc66CklTGyClArKPHGKdA4dAsAoQ34cPyIw=;
        b=pa1jqXRyZjRqcEgjVgS1yYQsCIZsyEEdtG1OY4F5NBNrTl4zI4kCZVV/ySsNIAUfh0
         9qmKCn55kdg4b8rxcAp0zBrBrCodYjj9BbKZpNb8e7lLyeNMsZ3lwXsq5IBoD2NJNDeR
         EYQqhfn2SiPPEDFy9+/trjsYivnnWkeXcFeWLJoTwa9nLttUGcnCRuZyu9X2eSOI5yEC
         TVV17DvSqV1LdKVPOfsUrqPgV8JyA8LVEMqaXJXltxjWneStGMqSKj5CC2EwNJKBRZqz
         ZHnWw3+pgLGP8HZ6AfIG/0+JVLjL+mkQYn4VInj0bJLZf1/VNS9Te8Y39SdBHevgRx0E
         8QqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775119296; x=1775724096;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Eo+AVSMDc66CklTGyClArKPHGKdA4dAsAoQ34cPyIw=;
        b=MkghNrCGwfCk4bwtWzJqJP/vLeS3nr/xa01JAF5LkA5594asoYo9RxTHgHwrsk4x7S
         MO8m4sNwAksCOQsAeMoPO4WoDMb0JdQ1o5HqQqvyv5A3v/zwmvjvfdghY2HUzQx6fmRD
         r1ZOqQRKp4pJT2qv6SYAKgb+Ey3GCXVW0JozGeg8RMv2PG4q75o0N+mACEGF8B8T0apB
         bbF3YOb4X9XmfWSK8wV2I7tU8ixESc3zc5jXoi+QEx/s/B6nIWdu7aGFzWHruE2iMp/i
         BBfnlBKMRqlruH5gw7z10kTF5A4RUBfp+QIVSSJaII6k6AaGDKlfn9rLTfT2uQR1N8zg
         PuJg==
X-Forwarded-Encrypted: i=1; AJvYcCUTJza+I5Q+4wpEOWo7R6mDfI7To4Ce5xfTt6LH1p0IlI0GFWsERdFKQsepJOD5g7ZxMBh9ZlFrhVEtcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxH1bngEUaqtBkd292pAIIOUZKLksXO0yKimjoy8dnuarwglAQZ
	UIMcNG5mcU/2ikkLBdiKQIf0MU2pwOsg5odBIDQ/+Nq19/7FNzRT3t68
X-Gm-Gg: ATEYQzzt2bRDO/rY0OxJcq0OF/NjVOl4mXG9oL6UsTHJoBKA+fwOEgfwv1yYKfGuKca
	hzm0um6I9T46tW9HEbvdY05bVNMYqOHll4TE2AkTGxgduhxavOlFyzoO83uohSo7kSpJ7Xf+Rfc
	L5KFY76TEqfgJQBQtWU6a6u98tj5hzRce81bV+22EUcfPGTDgGc9PskRwgqFsZnABQsNTBA4ILd
	IrvzojF+0jy1IqRyz4YQH6GP7xKhv28uC9BqMKSb7Ftji2dFElvOXMX0fFw2tHcJja09CQQ7iWq
	VYSHzyo5W4zpd6s1XlA0M/WmuNcZhkauADAoSAka+U9Lcq1FJc8k5JMkNIM0CJ4LMZ+Al22OEb3
	pGtl23IJwM8GAb2I9lZIdH/FxQWsT/eERMIgO1nZhJSXdIGp1S20RSKGSu0zxLdatRAOpHNTpKT
	rfSXcb5ISQ5AttgxB4w2U=
X-Received: by 2002:a05:6000:240b:b0:439:bcc2:bf0a with SMTP id ffacd0b85a97d-43d1f234bc9mr4271590f8f.23.1775119295773;
        Thu, 02 Apr 2026 01:41:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm6432694f8f.21.2026.04.02.01.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 01:41:34 -0700 (PDT)
Date: Thu, 2 Apr 2026 11:41:30 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, Yuho Choi <yqc5929@psu.edu>
Subject: Re: [PATCH v3] media: atomisp: gc2235: fix UAF and memory leak
Message-ID: <ac4rukwPFO0nwlzL@stanley.mountain>
References: <20260401163050.34830-1-yqc5929@psu.edu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401163050.34830-1-yqc5929@psu.edu>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57930-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,infradead.org,gmail.com,vger.kernel.org,lists.linux.dev,psu.edu];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,stanley.mountain:mid]
X-Rspamd-Queue-Id: 5A131386351
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Please run your patches through checkpatch.pl.

On Wed, Apr 01, 2026 at 12:30:50PM -0400, Yuho Choi wrote:
> gc2235_probe() handles its error paths incorrectly.
> 
> If media_entity_pads_init() fails, gc2235_remove() is called, which
> tears down the subdev and frees dev, but then still falls through to
> atomisp_register_i2c_module(). This results in use-after-free.
> 
> If atomisp_register_i2c_module() fails, the media entity and control
> handler are left initialized and dev is leaked.
> 
> gc2235_remove() is the full teardown path for a successfully probed
> device; it unconditionally assumes a fully-initialized device.
> gc2235_probe() must unwind only the resources that were actually
> initialized at the point of failure.

The "must unwind only the resources that were actually initialized at
the point of failure." phrasing is too strong. I was hoping you would
review it and find an actual bug.  I reviewed it myself and didn't find
a bug beyond the leaks and use after frees mentioned in this commit
message.  As I wrote in my blog, leaks are one of the common bugs from
this style of error handling because it is too complicated.

> 
> Handle each failure path with explicit unwind labels that free only
> what has been initialized. Return success only after the full probe
> sequence completes.

If I were determined to use a magical cleanup function to do the cleanups
then I would reverse the gotos and direct returns.

regards,
dan carpenter

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
index d3414312e1de..61fb82b26cc9 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
@@ -808,8 +808,11 @@ static int gc2235_probe(struct i2c_client *client)
 					   atomisp_bayer_order_grbg);
 
 	ret = gc2235_s_config(&dev->sd, client->irq, gcpdev);
-	if (ret)
-		goto out_free;
+	if (ret) {
+		v4l2_device_unregister_subdev(&dev->sd);
+		kfree(dev);
+		return ret;
+	}
 
 	dev->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	dev->pad.flags = MEDIA_PAD_FL_SOURCE;
@@ -818,18 +821,16 @@ static int gc2235_probe(struct i2c_client *client)
 	ret =
 	    v4l2_ctrl_handler_init(&dev->ctrl_handler,
 				   ARRAY_SIZE(gc2235_controls));
-	if (ret) {
-		gc2235_remove(client);
-		return ret;
-	}
+	if (ret)
+		goto err_remove;
 
 	for (i = 0; i < ARRAY_SIZE(gc2235_controls); i++)
 		v4l2_ctrl_new_custom(&dev->ctrl_handler, &gc2235_controls[i],
 				     NULL);
 
 	if (dev->ctrl_handler.error) {
-		gc2235_remove(client);
-		return dev->ctrl_handler.error;
+		ret = dev->ctrl_handler.error;
+		goto err_remove;
 	}
 
 	/* Use same lock for controls as for everything else. */
@@ -838,14 +839,16 @@ static int gc2235_probe(struct i2c_client *client)
 
 	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
 	if (ret)
-		gc2235_remove(client);
+		goto err_remove;
 
-	return atomisp_register_i2c_module(&dev->sd, gcpdev);
+	ret = atomisp_register_i2c_module(&dev->sd, gcpdev);
+	if (ret)
+		goto err_remove;
 
-out_free:
-	v4l2_device_unregister_subdev(&dev->sd);
-	kfree(dev);
+	return 0;
 
+err_remove:
+	gc2235_remove(client);
 	return ret;
 }
 

