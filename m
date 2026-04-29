Return-Path: <linux-media+bounces-60033-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOHuDS+X8mk5swEAu9opvQ
	(envelope-from <linux-media+bounces-60033-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 01:41:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DB149B652
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 01:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E5A83040231
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 23:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B27E3B27CA;
	Wed, 29 Apr 2026 23:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sinbNTJI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0EB34F474
	for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 23:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777506083; cv=none; b=j9+nNFBh1LTNnWP7QyJPbx3xt/NFZ9xrT7aVwHP3VdQ59Dhd00GPqNtNE0S5v68QjZQJxLSeCm8zfKR3gDJgIJN1hUoIU4M5tWV1V2e5MonbNO1Evw0Zzz/p8ystzbly3l5qm4af+C+/+PFBo3MEytwfuCMgw0JkG9zfIATqvQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777506083; c=relaxed/simple;
	bh=SENc4XzcXhXZH4RQPf5YBtAV9F2SAEGP6vKTlctEGbQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=nKAozMgln/H/m4yclYav9eLW/EaO14JPHC6kRNBv3/JwEDv3kUlwmZACCNwS3vqdMXVHtTjhlzPH76mWcdZFEeILXt4CfhB4e2KRZhWCczL0o4FJhuqf2JRB09wi6FoFrMRSYTbpdIp+lhY23FumiUqmzTAWAKjuXlUj13aTCOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sinbNTJI; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-364ad762ef8so136549a91.1
        for <linux-media@vger.kernel.org>; Wed, 29 Apr 2026 16:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777506082; x=1778110882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=DEbN0PRYPELCXuCsVB1AGme2es0zOz+5Jz+a4L5FzlI=;
        b=sinbNTJI2cD9GD1p3GkN83m5uDZaScn5pJrZfNfFyJdzcFzorap3bbfrZxgQUq8DZN
         w9sBG2Tk/EBx4bnkYLemDBpsWhL0EiCeybhf+9y2//m2eCpg5SWH6HsasrIhC144zZ4r
         EC00MKbaqgZ6Gr9gmvr8IcqRp5p/t2EtBSM1hZRKMsTPkFVPlGngrIBbTSAZacBN+eJh
         kS+IUxjOnX7R5waIXDbgLarehqj1abqXBzZRD2nQwCrWsgUMHFBf60cPquSBvL0RxfBF
         sgTUsv3MboJ93sE4qzW/MrWw6TWOiW4zBmRDD6k9sqDJSB6rU2D6GaNSF44W2ISFUvuw
         mJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777506082; x=1778110882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DEbN0PRYPELCXuCsVB1AGme2es0zOz+5Jz+a4L5FzlI=;
        b=SndETqr3RSyoi51dyrLKi9lek1h43CnIGBA4jx5qKp7YbLnpkrRFH1edenVWHrSuh+
         MipO+18AvVbv/cpLFscrEwtYFE2TVhOJB5QtqsoUE+iQTg0zQoaAtTHIS8A91bSs2b9F
         UOj5LOiljjs6zaGbuwiLXWVPkqVFfZqeeRmDOhfjdr909w+KqD22IhDLRSPxk/ukUzSd
         DnuOc+39Uq20UqIFf0+lcVzC11M25azYVo15C9wQ3TIqxvK+dHgLAaJrdpzlRLl/xiUC
         9Y7Zgf+kl/1hpBui4yIqDNZmDThnGQUP8aCXhViUCeDmqfePWvjoTNDZsvWpJa09JPuW
         21+w==
X-Forwarded-Encrypted: i=1; AFNElJ+IhE8UixSke5F0Y8RVIW4nHBO8ax8Y19PAXavHhwOKi7cKRXkWfvZypCGb7CQVIkgvS2w4308bMOxwaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzioKNO/4GJhleLN2efMHQrzeQvoSdbc+6pmauqM+1Ut9CLvn0c
	xXZKFJ1SLwCj6rMP+o2IsJri4hU5QI1V08cdYjadmDLy21zYmdfe//gf
X-Gm-Gg: AeBDietsfi8NE8pjtXjOwF0NCcj3B+DKeNWcZTxT6pOAbPRJxfI2d4lubLowZ69U4CN
	UqFXFV15IT0WdZwaMWcOelMaKPdUfZwAmuq5nXn6wv5F0srsC0cEWUbc1jDEPRs5gDfoJSS9X4R
	Xh52L8DdW9z4WM9fiSlVixNpo2jatNBErbMnO3Cwgu6Rdzwha6HGnjCPCpAOubXGmSIj5lGgsOq
	uM6W9OEQzMQHWNB5XwSmhsGHgvfGe2+Lg2JfDAa02Mcwv2ZaYGZcJF0TxpQ3ff5t+urFBmDs6Mq
	IlWo/2i298N+utsKPgxkNceprgh/cHoPvXbvDSEA1DF6MUX0VGiu3XBm8xcCwSYznNIp+2iu0JO
	leX1HLw8KJ6Do98F0Qs9/R0DY/mWYGgoBNEBT8xpFgNDHRL1WybsR4pipoGWNWmZQez8HGDuqHQ
	xViz0N9wakrssZYsWR7dwqH+e0WkvQIEVUyDnwHZhzHPB4GwQgSBitlZzvih65iVOsMaFZgkI8J
	c7cJJjxyMJm+gsdp0UJwud/EwE=
X-Received: by 2002:a17:90b:2fc8:b0:364:87dd:b2c4 with SMTP id 98e67ed59e1d1-364c32aa4bdmr345691a91.25.1777506081799;
        Wed, 29 Apr 2026 16:41:21 -0700 (PDT)
Received: from archlinux (S010680dac2bce256.cg.shawcable.net. [174.0.186.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364be02940dsm702390a91.15.2026.04.29.16.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 16:41:21 -0700 (PDT)
From: Jack Lee <skunkolee@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jack Lee <skunkolee@gmail.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	linux-media@vger.kernel.org (open list:STAGING - ATOMISP DRIVER),
	linux-kernel@vger.kernel.org (open list:INTEL MID (Mobile Internet Device) PLATFORM),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH] staging: media: atomisp: ov2722: clean up ov2722_startup()
Date: Wed, 29 Apr 2026 17:41:06 -0600
Message-ID: <20260429234110.7879-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B2DB149B652
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-60033-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skunkolee@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Remove stale TODO comment that has been present since the file
was first added to staging in 2017 and was never really acted on.
Also replace return ret with return 0 since ret is guaranteed
to be zero at that point, both write calls return early on
failure.

Signed-off-by: Jack Lee <skunkolee@gmail.com>
---
 drivers/staging/media/atomisp/i2c/atomisp-ov2722.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
index 2c41c496daa6..fcd71cc55731 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
@@ -599,7 +599,6 @@ static int ov2722_s_power(struct v4l2_subdev *sd, int on)
 	return ret;
 }
 
-/* TODO: remove it. */
 static int ov2722_startup(struct v4l2_subdev *sd)
 {
 	struct ov2722_device *dev = to_ov2722_sensor(sd);
@@ -619,7 +618,7 @@ static int ov2722_startup(struct v4l2_subdev *sd)
 		return ret;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int ov2722_set_fmt(struct v4l2_subdev *sd,
-- 
2.54.0


