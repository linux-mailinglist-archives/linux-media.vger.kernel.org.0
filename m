Return-Path: <linux-media+bounces-58615-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id D+rWM8Dj22nWIQkAu9opvQ
	(envelope-from <linux-media+bounces-58615-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 20:26:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 432013E5625
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 20:26:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3667A300B46B
	for <lists+linux-media@lfdr.de>; Sun, 12 Apr 2026 18:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E5FE363C5B;
	Sun, 12 Apr 2026 18:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jykN9AR0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674AD3630A3
	for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 18:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776018358; cv=none; b=ruk/l5rIn3MMM4PWa1goLQqthWHO7FeOkFb5cgO4CZ3rLBFB/BaYP2L0rbRrA3r1wWEYNl+O8kTTi0PE6hB5UrMPf6CrPinX8TsqMDpn8qDZs6m9yPs+D0JZLNMTtqVoqTXrV1u6oEv5nZJk09ZfDlCpuX4BrFCkb7Y5jjlMeno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776018358; c=relaxed/simple;
	bh=1zJtVufJSEP6Q5SnuAXWDx7j0TqoyY8c3ryWRg4Oyqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5mYQhuUZySlHFkdpRjZ7ADq+bw+ofqPsyngev/vbSV/6LKy/qCwACVpL5hy0GlyIs2AbRBAx/Wd1+aLu/HL7O2hDePtAlma8ujnos+Yw8JgVJOz0K4TBYBMWMOszZ7pN1VeXXNHz5kr8HZqGzPQhfjIQrfMkQFJ7MX4DoR8cdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jykN9AR0; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso57402975e9.3
        for <linux-media@vger.kernel.org>; Sun, 12 Apr 2026 11:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776018355; x=1776623155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sUaZCt2imrHRQTUxqdlKlKY1LHwdFZ1j8C6DlIvvcGA=;
        b=jykN9AR05uDRS9U2SY2rFAy3zu3xKtupqd/sgsVZOZ5/+ZXG7Knhgh6GaCUVxoOjaj
         mtkkIVjt2n81Pkrstc7Ba0USYcdbzi3uh8SExAXcqq9dNEFjKmpLOSE5YH27WkoAiFWu
         0xdLPL3SGSk2bEmu4v02eC0rZYLBGdG7P+VjuOWvxZAV819w2xTLDHdkNMKAp077b73y
         Dvqes6924QsrikpqMtjQSL/H3Wdc6j4Fxm0sk2sIxzXSDMHRVq6mxmLaHY56DFoV/dOF
         D9fQ9hKeceJHZ/3x7lLBjgQBxzjJtQyT/HZ1n5W+887P2B/7s4h0UmyknnF8YInumXPn
         7ZEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776018355; x=1776623155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUaZCt2imrHRQTUxqdlKlKY1LHwdFZ1j8C6DlIvvcGA=;
        b=P7jFAwD5OGUWAKoNkeevASsMJZj18kIIhWmQ/3qdKhFCgni+i2MkQQk2VmGZF5pf0j
         c0QRj1GLvFvn+Yz8AQU9laDgJ3HupUPKkaHr01Yp88Mc0jFk2eBM/uq9/GMpGu5LPdxz
         Z28okuSM34k+L0YxLm7lHpFO6IYjCO9JLtPhA4s+YHOF4ZhUfbyIBIxzRP+Dv/6NH4//
         mMnbi8gbqFphSbMVt1L4gIGNFAnIsxIVcBr3CMNEwN8NP1dguP5m/ujOK/AA3IG7Eh7Q
         yDGpsl4hu+CRZIC7lJ+9Ct/qm3zZop8Gyq6m3nwI78d6/fdngfD/Yug0hpXaiQYOD0j+
         L0oA==
X-Forwarded-Encrypted: i=1; AJvYcCUVqZbZlEa0XUrEOTccOEgumtY/IN+hQt1P5y43gToqHlruu7SUMm5WyE0BrYiXYVMz07iGSI9GXCIdjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjFqwOZW5mRrgGV6XP3WH6dAwxLsqGNgVm4JImJ9Ks/L62u4L8
	G85qd1Bz1nkPKFfA8IhoViEz6pclVCIt36upwggok5itj02dQQQZrH/4
X-Gm-Gg: AeBDieud7xgPyYvi8uqAVjK3KT2UggSD3m0OjZQqaWQqAVSvj3YcK4gNSD8HcEf/AK/
	DEMFhexit61TuH3njtywJRkp9mr4G0U2nMNdTy+f+i2YkRU1RcBCcwsTvffRwTIReUBhyM1IYM0
	WcGX/XUx25lgiPknTbnVxpYbkhSHo3Ov7ohtw5C7MsqRzLN+ybqQBIJWo0Pf+0cr+9XvofhAjH4
	NO/Fhqz982SbLW1qIPQ2SUsWIflLLrXGe+BSPjUIHEXylwuhqSRpJYibjp0KpoRnuzzyzF+c1f7
	s9BD7X8oEEbMgtAczKG4ypSCoPdQ27+7bqgpF4W1KK/uW25bO4IwznEXKd2GfipZhceBZcOq0O1
	Bk1TWReupjOe1TAqyo3XJP5CfF+b7Jg5sF8Mq+1skgOzAs0Yi0VhEgQPhfMPWyy+NCpxGbJW56s
	rYWr6H4bn/qce+DmQ441yFfadmXF8jTw==
X-Received: by 2002:a05:600c:45ce:b0:488:a8f0:35bd with SMTP id 5b1f17b1804b1-488d67df745mr149370035e9.8.1776018354584;
        Sun, 12 Apr 2026 11:25:54 -0700 (PDT)
Received: from gmail.com ([2a00:f41:1ccb:26a3:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488e07f8207sm54197285e9.1.2026.04.12.11.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 11:25:53 -0700 (PDT)
Date: Sun, 12 Apr 2026 20:25:51 +0200
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: syzbot <syzbot+afc686a471d70896c5d9@syzkaller.appspotmail.com>
Cc: dwlsalmeida@gmail.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mchehab@kernel.org, syzkaller-bugs@googlegroups.com
Subject: [PATCH] media: dvb-core: fix memory leak in dvb_dmxdev_add_pid() on
 start failure
Message-ID: <advi5yTDwVkRTpV5@gmail.com>
References: <69d411c9.a70a0220.a26f2.003e.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69d411c9.a70a0220.a26f2.003e.GAE@google.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,kernel.org,googlegroups.com];
	TAGGED_FROM(0.00)[bounces-58615-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,afc686a471d70896c5d9];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 432013E5625
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When dvb_dmxdev_add_pid() adds a new dmxdev_feed to the filter's ts list
and then dvb_dmxdev_start_feed() fails, the function returns the error
code but leaves the orphaned feed entry in the list without cleaning up.

Fix this by removing the orphaned feed from the list and freeing it when
dvb_dmxdev_start_feed() fails in dvb_dmxdev_add_pid().

Fixes: 1cb662a31449 ("V4L/DVB (12275): Add two new ioctls: DMX_ADD_PID and DMX_REMOVE_PID")
Reported-by: syzbot+afc686a471d70896c5d9@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=afc686a471d70896c5d9
Tested-by: syzbot+afc686a471d70896c5d9@syzkaller.appspotmail.com
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/media/dvb-core/dmxdev.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 3c8bc75e4d6c..401a0cbb4138 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -901,8 +901,15 @@ static int dvb_dmxdev_add_pid(struct dmxdev *dmxdev,
 	feed->pid = pid;
 	list_add(&feed->next, &filter->feed.ts);

-	if (filter->state >= DMXDEV_STATE_GO)
-		return dvb_dmxdev_start_feed(dmxdev, filter, feed);
+	if (filter->state >= DMXDEV_STATE_GO) {
+		int ret = dvb_dmxdev_start_feed(dmxdev, filter, feed);
+
+		if (ret < 0) {
+			list_del(&feed->next);
+			kfree(feed);
+		}
+		return ret;
+	}

 	return 0;
 }
--
2.53.0

