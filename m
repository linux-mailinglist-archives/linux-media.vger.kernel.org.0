Return-Path: <linux-media+bounces-52740-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNObCKMrj2kPKwEAu9opvQ
	(envelope-from <linux-media+bounces-52740-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:48:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F7A13677F
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 14:48:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF52B30C732E
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 13:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455563451D4;
	Fri, 13 Feb 2026 13:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b8Ks7bQv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AA332AAB6
	for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 13:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770990391; cv=none; b=Nu8ICQquJL/PfhcBP7nK4WFICbAuadI2Oz8TskIf6LB8fY2p4N3Odmu0uoUJwmtPDH5gA4PTP6zkQtcmj3QiOU4OZoS63/J3icX70KRCtNrNpldQnsPSlmGxnOSakAAMtbnhi6ldMrVGgE+XZqidXcCD/ngjwJ3XE9D9bmSkj08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770990391; c=relaxed/simple;
	bh=7uzhT1Hdpq2Zj/z3tC0kx0DO7eu7YJpM8NOGHA2+aEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tv9uS196/A7HfGqdqHWu+JguCKfEUdifw/I8t9EbYNz3Yk8BuvdNT+FRiwTaNA7k7oKlG+P1Q5Bg/ZL7LtT8Hn6wYRdeNU4qHPgRdfXpC8m1ShjEQlpCZwZHH4rjhHlp/oSJpDCj+cV2asRUZlaQrUdGUtBO5IkbRcoCZNrJHNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b8Ks7bQv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4836f363ad2so11192145e9.1
        for <linux-media@vger.kernel.org>; Fri, 13 Feb 2026 05:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770990388; x=1771595188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4B97dcFXXQx/22amrzajNB5xqYOGdgqYpxZ5xW5NAyU=;
        b=b8Ks7bQvyUkk2F2wlPNJKzjRKifHGmZFZYQ3Cf2KK455nlodcZ5T5TXTDIgM2+9usS
         ds7HW2p0a6k1S54MzhCAvMUh64t1EpOP+xyYm3Saz5pjm+vsEotoLemSLcch6DU4aPWR
         Y+PCmtCq5eedV7tSaTn3CkR20z3i0o6C0SvCdd48vBQDiekbOrwY4teDX81p/45flYuj
         2q3RSIW5xbZbA6tHYeML/47+5MUToYRYy5YuWGJvyywjnojw4/xcUWEUJL5y9x0+EgSg
         SfZGg+PcjPMtrbMV1R+EpqmE0WaVUsczU4roNNRPrenSfPILfkVW6T/FtRQPnVSN6Cov
         /2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770990388; x=1771595188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4B97dcFXXQx/22amrzajNB5xqYOGdgqYpxZ5xW5NAyU=;
        b=ZDVIRjJv30cCbEsdx9U8uro20e2XzFjZRIDCJdoosTOKRU8P7DPVTZeS0imQAnRhmd
         vOACkhqC4vVC1qavephGp3RuZ20gr2mhtI6LwScdjVQtbTbbkstp0jxU0JHWh2HVPnky
         3LcEMvKl+gSxg61ukQMrRteFN8UGJzipCipplXt4u43AHHeoWwk/uf8H8RKePWhlz3/O
         ZuNmU4CVNV6XAZuu5Yi0/flgQBssJzAmg8jVYh8vbkPlnwK+OyWpUYGbGxBEm05Ttp6D
         uco//blYhtst+5WQ13tJ67AdkU1NdX00x3nfzUBgI7EGqO2ljUyfnEoI1EiTyomCnka+
         o1xg==
X-Gm-Message-State: AOJu0YwrcZJFueJDEQYTHIyXniSP7tcAGXHa+CBE+96xHENjp1MQj8eT
	hpTO1cx4tuOUONb9P9n6l72J7yQbwuJV0jWHTsFAEWVz22hdGGJ4o7tRIri/NPOG6nI=
X-Gm-Gg: AZuq6aK+Ey/J87jxc1HOMrA1V2og0BxoysQhR0B8Qqf7JQdQ+b56sEWa6SPUwDMCG8V
	WauGmB1XCm6/xzXXG/bNoDYSz0Ib1JqJX1bEam9Ie7/b302PUNJ5REdR8pnmPnaQHBIZr2VqQJJ
	aXEDuQEm4k1idxRsoFG0FB26cA00iQRMnqfo+Urlg3Zc2c5O3e5mV583hu5aMAgPH01ShMPQRe9
	QTztgINpEFE6Pyz60JeflpYUMEwbyJpt8+XjEgcdv3vfpjdss0ZqSCZcqrq5W5WZ6KHihrEAB5Y
	PrRYvmYuycnuQCCL59FLib3Cd2NG0NEm7BZR7VT7PVfZtNvFu57/yh9VPH5kL6RZDbDaHz90Qb/
	9jIgC75roAnunRxplVhg/O6zh1mA+i6t88ccaoD292RMoL8Z059/KZ4sxHh476kleGMSYAm4pvN
	zDg09KrdzoUnHuJod29NVbPejTA41PQppTrpClVsXt
X-Received: by 2002:a05:600c:314f:b0:483:6fe1:c057 with SMTP id 5b1f17b1804b1-48373a3f3bcmr26871935e9.21.1770990387410;
        Fri, 13 Feb 2026 05:46:27 -0800 (PST)
Received: from zovi.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a2998fsm17198625e9.17.2026.02.13.05.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 05:46:27 -0800 (PST)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: [PATCH 2/2] media: dvbdev: Simplify error paths in dvb_register_device()
Date: Fri, 13 Feb 2026 14:44:16 +0100
Message-ID: <20260213134551.1294954-3-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260213134551.1294954-1-petr.pavlu@suse.com>
References: <20260213134551.1294954-1-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52740-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[petr.pavlu@suse.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 79F7A13677F
X-Rspamd-Action: no action

The error paths in dvb_register_device() each handle necessary cleanup
operations individually. Since the function performs a number of
operations, this leads to duplicated and lengthy code.

Unify the cleanup process under error labels.

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 drivers/media/dvb-core/dvbdev.c | 79 +++++++++++++--------------------
 1 file changed, 31 insertions(+), 48 deletions(-)

diff --git a/drivers/media/dvb-core/dvbdev.c b/drivers/media/dvb-core/dvbdev.c
index c067bbeb9461..94591f8a7afa 100644
--- a/drivers/media/dvb-core/dvbdev.c
+++ b/drivers/media/dvb-core/dvbdev.c
@@ -466,16 +466,15 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 
 	id = dvbdev_get_free_id(adap, type);
 	if (id < 0) {
-		mutex_unlock(&dvbdev_register_lock);
-		*pdvbdev = NULL;
 		pr_err("%s: couldn't find free device id\n", __func__);
-		return -ENFILE;
+		ret = -ENFILE;
+		goto error_set_pdvbdev;
 	}
 
 	*pdvbdev = dvbdev = kzalloc(sizeof(*dvbdev), GFP_KERNEL);
 	if (!dvbdev) {
-		mutex_unlock(&dvbdev_register_lock);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto error_unlock;
 	}
 
 	/*
@@ -494,19 +493,15 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	if (!dvbdevfops) {
 		dvbdevfops = kmemdup(template->fops, sizeof(*dvbdevfops), GFP_KERNEL);
 		if (!dvbdevfops) {
-			kfree(dvbdev);
-			*pdvbdev = NULL;
-			mutex_unlock(&dvbdev_register_lock);
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto error_free_dvbdev;
 		}
 
 		new_node = kzalloc(sizeof(*new_node), GFP_KERNEL);
 		if (!new_node) {
 			kfree(dvbdevfops);
-			kfree(dvbdev);
-			*pdvbdev = NULL;
-			mutex_unlock(&dvbdev_register_lock);
-			return -ENOMEM;
+			ret = -ENOMEM;
+			goto error_free_dvbdev;
 		}
 
 		new_node->fops = dvbdevfops;
@@ -534,17 +529,8 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	minor = nums2minor(adap->num, type, id);
 #endif
 	if (minor >= MAX_DVB_MINORS) {
-		if (new_node) {
-			list_del(&new_node->list_head);
-			kfree(dvbdevfops);
-			kfree(new_node);
-		}
-		list_del(&dvbdev->list_head);
-		kfree(dvbdev);
-		*pdvbdev = NULL;
-		up_write(&minor_rwsem);
-		mutex_unlock(&dvbdev_register_lock);
-		return -EINVAL;
+		ret = -EINVAL;
+		goto error_dvbdev_cleanup;
 	}
 
 	dvbdev->minor = minor;
@@ -553,18 +539,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	if (ret) {
 		pr_err("%s: dvb_register_media_device failed to create the mediagraph\n",
 		       __func__);
-		if (new_node) {
-			list_del(&new_node->list_head);
-			kfree(dvbdevfops);
-			kfree(new_node);
-		}
-		dvb_media_device_free(dvbdev);
-		list_del(&dvbdev->list_head);
-		kfree(dvbdev);
-		*pdvbdev = NULL;
-		up_write(&minor_rwsem);
-		mutex_unlock(&dvbdev_register_lock);
-		return ret;
+		goto error_free_media;
 	}
 
 	clsdev = device_create(dvb_class, adap->device,
@@ -573,18 +548,8 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 	if (IS_ERR(clsdev)) {
 		pr_err("%s: failed to create device dvb%d.%s%d (%pe)\n",
 		       __func__, adap->num, dnames[type], id, clsdev);
-		if (new_node) {
-			list_del(&new_node->list_head);
-			kfree(dvbdevfops);
-			kfree(new_node);
-		}
-		dvb_media_device_free(dvbdev);
-		list_del(&dvbdev->list_head);
-		kfree(dvbdev);
-		*pdvbdev = NULL;
-		up_write(&minor_rwsem);
-		mutex_unlock(&dvbdev_register_lock);
-		return PTR_ERR(clsdev);
+		ret = PTR_ERR(clsdev);
+		goto error_free_media;
 	}
 
 	dvb_minors[minor] = dvb_device_get(dvbdev);
@@ -595,6 +560,24 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
 
 	mutex_unlock(&dvbdev_register_lock);
 	return 0;
+
+error_free_media:
+	dvb_media_device_free(dvbdev);
+error_dvbdev_cleanup:
+	if (new_node) {
+		list_del(&new_node->list_head);
+		kfree(dvbdevfops);
+		kfree(new_node);
+	}
+	list_del(&dvbdev->list_head);
+	up_write(&minor_rwsem);
+error_free_dvbdev:
+	kfree(dvbdev);
+error_set_pdvbdev:
+	*pdvbdev = NULL;
+error_unlock:
+	mutex_unlock(&dvbdev_register_lock);
+	return ret;
 }
 EXPORT_SYMBOL(dvb_register_device);
 
-- 
2.52.0


