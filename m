Return-Path: <linux-media+bounces-66987-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nN+IC01KTmodKQIAu9opvQ
	(envelope-from <linux-media+bounces-66987-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:02:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD86E72690A
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 15:01:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=F2Rt2U9X;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66987-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66987-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28FC8303C038
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 12:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04714657E3;
	Wed,  8 Jul 2026 12:57:39 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DFF426ECA
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 12:57:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515459; cv=none; b=NRU7Lxu3ejH3iKDMsKVNNmdFvNy9pLOIcY7og+Qm9eh4uHBhYd3ri1YaQ8ehQa0VwSFuhhOGNJfszVIYf+i41UCiBKg+OnsnNf6NJWqf1Yi8IuVeD8gyIelI/PYQ+ZKzNuQ/Yu3sFiYgS2cuZipDis8ySsMJ2eEws1RcGNobp68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515459; c=relaxed/simple;
	bh=UrE93zXjZyxA/Ev+jUp9i7tYXbt2bq4qQ3/zk7AAZ7I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VghC6VOv/MPMxdpDEftiA9lyx+4Jr/yEUmfP8trd4tn5+R79whX+eObG+qMdLsyr6QdEl/J8s2mKoEASQbwg/w9JHwBuxbfj2/3A27wYVKDHyhn2tWa08C6P9JAI5jtl3v7+tuMrdR/uBroT7Vq4qr+czjA3P5jDyVznv7TNa1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2Rt2U9X; arc=none smtp.client-ip=209.85.215.173
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c8b49639fbaso390781a12.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 05:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515457; x=1784120257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTfotfcn9VWnxLom7GLVbOHjhNjkRdM3f9UH7tzHbYQ=;
        b=F2Rt2U9XKAM3hMRLQF1GisrFP/4fiMdN+hbpU5NLCFLKPoFuZzggqgzoKuTS601P0u
         uU8EdD4s6328oWb7byNj+Jmh5dKxZrtGPG0/5XSt1unRkTILF9jvumzLJdWzTCC7hYY8
         VsT0y+fK1jsVUcIgMYCZGVSQGrQ9TB0Bl9gd4x28K7pz7aZ7SsJDEbOVNcjfYhTeKDp4
         5FikvAYQNslmcrGFKHHynUxhlHyZKFo/OGGD+wZ7EgDKox5IpfnaKlBmFppFoUhHS69f
         q6WQhrbcvMD2VxC7B666Eqr1ONp8UaDvto+y1BoGbwhnkpcBNjDLVVcXbjorKe948xXc
         3AgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515457; x=1784120257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PTfotfcn9VWnxLom7GLVbOHjhNjkRdM3f9UH7tzHbYQ=;
        b=a2mgo38OLNedqWZC98kn2Y2GNS1py2e9Uo7kcmHopXbXcmgs1vNO1C8Hpzmx8B4kD/
         029zknLUK62WJwamuu1K4TEkISw5xf2ZZdruyjq7O95UovfCD6rUVNDPcw9RpSH1Es2B
         xv8KAeQsK+GqYA8I8AK/F8nbQyYD43gFxs6LImOllrRcFbHYdYVlGCVAFzTvPLUs+MVc
         OWYy4PxZZkR8w5DBvmLMuPYNoZHQFPnRN+XsCNX+syyeXMlgJWXNyTR9dVXysMwuiCkT
         aRnXmu1yzex6ZXY5T/DTnwXKRNWa/gpLgJf4PXu+f3rC49aOBaicdtZKHkezCDxt2pAR
         d0LQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrv4v0RSBxLTVC7nvxsVix0QtwGBo+clk1dDfz2yL5BCKWWmAUeQTlGIrvVC4/zQj2YNPCTiCymgiq5/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMUCg85OLIjbP+0eiQ4hocytToxndshGMz24mv7hDj1qIrZso6
	6wUoNNLlOzPta+G+q/YiLjkvfvQ8LVYlcraufgHNO0bFP1SqI6Faq5Oc
X-Gm-Gg: AfdE7ck8IFQGJ3hHFGnrz4Z5AG52T1X2kot1NWBQSV+HbaWUCs3FF5fcpe12pFhtUUL
	IgDADrPR77U8q0+qZIOfZbHj83ZMLQe+pmESqXrEjX+6gRYY1uy7YVJbwcxHLgziQLM6Ik5G03k
	Me6xXY/A/NNyXO9qB50EbFM9qWZr4/+N1GDLrwyt89HBbtG98+WalYpqWaMQtHN9RRlrkIAnZsG
	x0N1EY1YEtBnRwvLH/iK8fVXUAuQc+08NS/WZy/PBiD3VfaD0EXfNQ/40aQ0M7Mu2Dzonzk9sy9
	in11zucBDBdHLThS/+t0aVEG+1H8p4ruaqIt//pkmom2D5qQJ3O5hvS4jg7jAJPTqGrASgAxTHA
	rewJtI+rpVqR4VHr80QaESHdomtWGbLrqAFaIQoN0TpKmoCPEtCwWKCkV4T3jhgMwhyLnbbAedZ
	VATXak5XjkOd7B6iKu6a/PD17wSMjRYbfLVYAXR6ez9g8=
X-Received: by 2002:a05:6a21:3383:b0:3bf:b960:6fc4 with SMTP id adf61e73a8af0-3c0bccd3a30mr3293274637.30.1783515457214;
        Wed, 08 Jul 2026 05:57:37 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm30299087eec.29.2026.07.08.05.57.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 05:57:36 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	songjun.wu@microchip.com,
	wenyou.yang@microchip.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] media: i2c: ov7740: fix use-after-destroy in remove
Date: Wed,  8 Jul 2026 18:27:23 +0530
Message-ID: <20260708125720.27156-6-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260708125720.27156-4-birenpandya@gmail.com>
References: <20260615210412.34567-1-birenpandya@gmail.com>
 <20260708125720.27156-4-birenpandya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-66987-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:songjun.wu@microchip.com,m:wenyou.yang@microchip.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	RSPAMD_EMAILBL_FAIL(0.00)[stable.vger.kernel.org:query timed out];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD86E72690A

The ov7740_remove() function had a severe teardown order bug where it
destroyed the driver's mutex before freeing the V4L2 control handler
which relies on that mutex, leading to a use-after-destroy kernel panic.
Furthermore, the driver explicitly called v4l2_ctrl_handler_free() and
mutex_destroy() sequentially, but then called ov7740_free_controls()
which invokes both of them a second time, resulting in a double-free.

This patch fixes the issue by unregistering the subdevice first, and
relying exclusively on ov7740_free_controls() to safely tear down the
mutex and control handler in the correct order.

Fixes: 39c5c4471b8d ("media: i2c: Add the ov7740 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 v2: added Fixes and Cc stable tags.
---
 drivers/media/i2c/ov7740.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index 2d29147c0f647..b4e14171556f9 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -1116,10 +1116,8 @@ static void ov7740_remove(struct i2c_client *client)
 	struct v4l2_subdev *sd = i2c_get_clientdata(client);
 	struct ov7740 *ov7740 = container_of(sd, struct ov7740, subdev);
 
-	mutex_destroy(&ov7740->mutex);
-	v4l2_ctrl_handler_free(ov7740->subdev.ctrl_handler);
-	media_entity_cleanup(&ov7740->subdev.entity);
 	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&ov7740->subdev.entity);
 	ov7740_free_controls(ov7740);
 
 	pm_runtime_disable(&client->dev);
-- 
2.50.1 (Apple Git-155)


