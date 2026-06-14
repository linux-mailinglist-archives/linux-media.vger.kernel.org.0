Return-Path: <linux-media+bounces-64838-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oX3vBMPyLmqw6QQAu9opvQ
	(envelope-from <linux-media+bounces-64838-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:28:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D6B681E2B
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 20:28:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BgC0CBiW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64838-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64838-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3DB83006154
	for <lists+linux-media@lfdr.de>; Sun, 14 Jun 2026 18:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4EB339B482;
	Sun, 14 Jun 2026 18:28:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5F539C645
	for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 18:28:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781461693; cv=none; b=R9vshHiE25VrR9GzKd3WIhZv6tPMligH5KTR1+aud96yIACq/zzqIbq0g8zMTKj4MNBiuwOqmfL+69Un/+NKQ4X5ILzWbWQnGk5SAJ7T4w+J1vcalMUCUnpLwmMS3LKNTjmtf9stSptl78IfHnJ3t4kNu9F2lKsQq+Z2enuOSk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781461693; c=relaxed/simple;
	bh=yj1YBhdd/0Ork/CQo+geXD69TsRvVFa6bXKGTIGKQhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h+WvhLqpzQkfRH/cNS7wXbpRJ2M+sHxpFbbJ7rTUWosaMKQ3KP8RiSHdf5hP+9VjX4cjpo6yqeoSSFUIiuxy+91objii0AaNQjcS1hMHBFANOB4Vg1nUof6zohf5dlSSoxHwc2kSIO1HsO7CgZUOFNnZKmkirsNqTKsWVQg6/8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BgC0CBiW; arc=none smtp.client-ip=209.85.216.49
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so1591599a91.1
        for <linux-media@vger.kernel.org>; Sun, 14 Jun 2026 11:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781461692; x=1782066492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MltW5HmV2Zw2C8veh6o9FwZl9YoEVtGUSjX/Vl3Wq+I=;
        b=BgC0CBiWK/qu646CbQN21tfDJrkvAy2+z8Ax0Ya/AFG4Ewrb/MvsyR/RQ16S7yYq60
         vtfE4/4xnBaoVwXL5DYOvsTJxI7yXcdL994IJCOqXOLdn156UcKO+mAyUIRdiN6KV4V6
         1PNDuGxG2SzXlixitlU0TYX2HfUU3n8PGL7xk4vhryZv24kmXVxYt6D3CD5LafJd4x4d
         peLbOi+4zMZEuprA1be/qotNyfafcmbcesILV8EhfZuIwMCWD1G+MmYCcNEQU1n0/qbz
         6vj8ReBtpsndFQ1OQtJkJaf276P40Ka5yuTTGsvB6WZJH159jrg0ePywkrsOJgU94oyC
         zJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781461692; x=1782066492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MltW5HmV2Zw2C8veh6o9FwZl9YoEVtGUSjX/Vl3Wq+I=;
        b=cKw0SPRhXP2+HJEnyN8xGbYvcnbCnvAmNz/Nd8tSwPKTByOfVLehYPVX4K3sObo/ME
         k7v/+rDcvvsIER+dPqIsDxuhMrtT6zb9kjbF5usqD2nQ7mDwH038ctjhp5KGswIEeuxs
         wOX07egWbCSaTQNypXF/xm29LVLBpZnPBoLTAqP4drltelACOVmvNgQYFH02qMUrMtab
         nZNzM1awLzyXEQT2UFV9uwfqBHWGnJKGb9y8wkZND/vtimG3NpHzX4z6UOoh3oPkXMo+
         QlDMWTUT/PmVCAyoWWEdtOvpiBjcZs3DqBC+o1KImYON8ERCyaCacml0YXX6cHKtG5kT
         j/GA==
X-Gm-Message-State: AOJu0YwbdflRWyrS9pAEUqELNqVtbBJq+spNQRU2qCgZQFVrmHskCKVR
	OTCyl2D0Emz2R4XDVc9QNYv4Mw4e4yuD9zSNnnTFfJ/ApB1ocbq6R+ZrDPCS4hEF
X-Gm-Gg: Acq92OEw+x0Kb6aSuqsEXzYytDQy2dHFXv+SOQrWr5Z+uvPV3+3KhOm2trQ6r3jzS1H
	a5eFAqlOtpnn66qp0jw9h2E9LYX+QMbIlMrDZAsM03jFWnpDyreM4FxHPBDOUfr0weIi9GWIxnP
	eBptqAsBw+IzPFjcThfmIMpu0Q76C8DY+q45+EzvHjAkupQEsD5wk60nddltusbw7jK0AlQiv9u
	kfMNmA8VdruVm05jqJY/Fehm8DvxJQag69LFNdZPWX9vHVqG0EnP88xGTrSgHs6iGSbY5arkjph
	DSectAombHjQIkkLl3ab/gj1NUUKRYWZX1RncnxudrslrtT7IY2KoxT7ouecWUWB89gU6JxxC5C
	oik0c6y+CjPFMfJQG5Bp0fYUbV3ZugP88QnA0AK5SS13vsfUncXE4b7jvCq7ilQg79bV52ybw/e
	1jtNwame2ZkbrQS0V7/WNL5MgU134m2G+jNi26+LQ+mssWyM6yTTjNjsu7gWmXli8=
X-Received: by 2002:a17:902:ccc8:b0:2c6:6424:c79f with SMTP id d9443c01a7336-2c66424cc24mr86234335ad.8.1781461691667;
        Sun, 14 Jun 2026 11:28:11 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5369sm79161335ad.9.2026.06.14.11.28.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 11:28:11 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Jai Luthra <jai.luthra@linux.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vaishnav Achath <vaishnav.a@ti.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 15/22] media: platform: j721e-csi2rx: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 23:57:09 +0530
Message-ID: <20260614182714.7999-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614182714.7999-1-birenpandya@gmail.com>
References: <20260614182714.7999-1-birenpandya@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,kernel.org,ti.com,ideasonboard.com,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-64838-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,m:jai.luthra@linux.dev,m:mchehab@kernel.org,m:vaishnav.a@ti.com,m:p.yadav@ti.com,m:tomi.valkeinen@ideasonboard.com,m:sakari.ailus@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3D6B681E2B

Fixes: b4a3d877dc92 ("media: ti: Add CSI2RX support for J721E")
The media_entity_pads_init() (or media_entity_init()) function initializes
the media entity, but the driver forgets to call media_entity_cleanup()
in the error paths and remove function. Add the missing calls to fix the
API violation and prevent potential future memory leaks.

Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index b75aa363d1bf..b88e3ac3dac8 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -1079,13 +1079,16 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
 	csi->v4l2_dev.mdev = mdev;
 
 	ret = v4l2_device_register(csi->dev, &csi->v4l2_dev);
-	if (ret)
+	if (ret) {
+		media_entity_cleanup(&csi->vdev.entity);
 		return ret;
+	}
 
 	ret = media_device_register(mdev);
 	if (ret) {
 		v4l2_device_unregister(&csi->v4l2_dev);
 		media_device_cleanup(mdev);
+		media_entity_cleanup(&csi->vdev.entity);
 		return ret;
 	}
 
@@ -1105,6 +1108,7 @@ static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
 	media_device_unregister(&csi->mdev);
 	v4l2_device_unregister(&csi->v4l2_dev);
 	media_device_cleanup(&csi->mdev);
+	media_entity_cleanup(&csi->vdev.entity);
 }
 
 static void ti_csi2rx_cleanup_subdev(struct ti_csi2rx_dev *csi)
-- 
2.50.1 (Apple Git-155)


