Return-Path: <linux-media+bounces-62940-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDFcKjvtF2rYVwgAu9opvQ
	(envelope-from <linux-media+bounces-62940-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 09:22:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D75A5ED9BB
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 09:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB3C830158B3
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2026 07:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C3C31E857;
	Thu, 28 May 2026 07:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nS92iQMP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EFC23AB88
	for <linux-media@vger.kernel.org>; Thu, 28 May 2026 07:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779952614; cv=none; b=WKYZM7C4K7lGvBQ/nulKyaPgka0q+irSNXOWRFS/ZBoVdBK/BxCRh+58vlULgw9ZdemSyWlK7stTAXY57h67/mrVX4zQbbz7OqGFE6PaMgYOslILN9BDlFbEmiZS8pU+6tb6B6s7aUgeh4J1LYYsRWZTosSb6z66K5nJvhFNSrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779952614; c=relaxed/simple;
	bh=XaYsYrhGLq3XA3lYC+A6pLo8lWhihzxDC2DiuKDcu4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kgjmr89uMT9deXjl6Ft9DxG3xpyu7jZzFXvQl6wvOKsGOsmfQjDqslw5iYXWU1jZWTBCtpS5o9dlcAiv9JxcU/4539p9fBA0bWZcb7ULoDjzsHwTjQSV37YT6mgFoWy2ptupNRtz0di0VldbvXJ18ABIMKZUDhEZ7Yqa5s+4wWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nS92iQMP; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a88de2b52eso15146494e87.2
        for <linux-media@vger.kernel.org>; Thu, 28 May 2026 00:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1779952611; x=1780557411; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9qn1MiVjSGhJ2guNif5ET5u7IkDu7zYFO0QUwNM/k10=;
        b=nS92iQMPOzh0VAq2md8IM9/MFQcs9UgF41VQfdukL3cfh1ZPQdajcO4zwjwLAZEUeJ
         ltFOfpqH7em/Nh5hbNTXwHzDqKaunUU6c8tTfHb22TFnSOm9azDaBUZqMqmXFxjF2KFb
         d6xvzvxRXdOzOk1+SuijIntZ1en1TAgvLWV7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779952611; x=1780557411;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qn1MiVjSGhJ2guNif5ET5u7IkDu7zYFO0QUwNM/k10=;
        b=Mj/yalMtiURfFi2xTCl5Nro5Wedd3I0sFVT3E/4SOuxjD9EA6hrSBihulwvdrxG1rB
         8hQ+jIdXvywqveBb8YRLJxTeNA8PwGYgb0cacmn9+KJk98wVRLbXmeTj5Dj+ppbIRA2y
         5VuTlauaZ2yBXQh6fGkreQ7xMY7M9Hzio4TEYce1TkEbx14lQsgn27e0RMnXMra0orCD
         sWYWPzUXB6OzB1YP5+MP8Not7IXNAPfUq/RbkUgmHFkEBuPSRhccsjoLjKmL45sQLJoD
         Y2m/yotHgMWiwzZqO+Ukh3OKEVjA+CNfXcnhiJWhzicsuzvcQgzxfwwXi44Qkh3Fz2P5
         atRw==
X-Gm-Message-State: AOJu0Ywo38WDrxuThycmYt7wV5kMhg2yUXofF9qHPWqEeZfQudsVVYh2
	fHIv2/DdQE+seNhZU5y9Lf0vtdCHz5SsrglEK44r9SN2wc64c4BV+iObp9SvgeZ19g==
X-Gm-Gg: Acq92OGizJ0vUZX3KlT1pSKOGO2BZUNPiJDQLMvRrOrQ7sf2qtTmBZEDHgRVdqWl6J3
	mhxNYCPbDjRGUs7+7gmNawZZ4uuS1/KeUL6SpbXK64y65HzsCkdYZo0bE1QTsMoVTktbibsx93m
	O4O9H4U2hDbXybWQ4jytLBJOm69bznKfsz/1UpOdAYA8/fGC9UDrvFEYSHGVunYVpDrOkqaXIOK
	DmNV6QxfgLqrG/aDafvzEbyhG0lVYWV8BsCXMmoGvUQITZuY49XHfagZ4PIApoSJdih24r/8v4D
	mmBMmz25VRf/y/4TfTt/izwiFWVSuzBEJeeJrba7/YvXVD4US0EHwESPsq7Q2kQ8p6E3G8AJ3Gr
	M5S15pbY6EHbDtkQ9UdNjxR+iNRFxrc3SvEdKkG326bN8+qivFW3D3DaF2wHj8A8QQb+u0h5bdN
	0IpidPocOArynBnX8qW0GuJWDsic8lXAIJ+ULJuBRfww7hsrKLZwsm2z/emY3pLIFmZjuC9qw/U
	k8UKIpUh7+E2csh6pRJuSI=
X-Received: by 2002:a05:6512:1244:b0:5a8:63e0:971b with SMTP id 2adb3069b0e04-5aa323a9bc6mr7848849e87.35.1779952611096;
        Thu, 28 May 2026 00:16:51 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa46322348sm1736465e87.43.2026.05.28.00.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 00:16:50 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 28 May 2026 07:16:49 +0000
Subject: [PATCH v2] media: Documentation: Add myself as maintainer for
 media-ci
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260528-media-ci-v2-1-bad550b21cf6@chromium.org>
X-B4-Tracking: v=1; b=H4sIAODrF2oC/23MQQ7CIBCF4as0sxYDKHbqynuYLhBomQWlASWah
 ruLXbv8X16+DbJL5DJcuw2SK5QpLi3koQPj9TI7RrY1SC4vXElkwVnSzBBTA0dUZzwN0wPafU1
 uovdO3cfWnvIzps8uF/Fb/yBFMMEsYt8rFIOV+mZ8ioFe4RjTDGOt9QsdEOnJowAAAA==
X-Change-ID: 20260528-media-ci-5908854839fb
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62940-lists,linux-media=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email,chromium.org:mid,chromium.org:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8D75A5ED9BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add myself as maintainer of media-ci.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Fix error in email :S
- Link to v1: https://lore.kernel.org/r/20260528-media-ci-v1-1-d88775819d2a@chromium.org
---
 Documentation/driver-api/media/maintainer-entry-profile.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index c5c00c66d85c..7806d83128d4 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -432,6 +432,10 @@ The Media Driver Maintainers responsible for specific areas are:
 
     - Qualcomm drivers
 
+  - Ricardo Ribalda <ribalda@chromium.org>
+
+    - Media-CI
+
 Submit Checklist Addendum
 -------------------------
 

---
base-commit: a96fcde9fa9a6696991d1f172a8bc2bade82a6d9
change-id: 20260528-media-ci-5908854839fb

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


