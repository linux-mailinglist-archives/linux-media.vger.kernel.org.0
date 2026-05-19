Return-Path: <linux-media+bounces-62130-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IL32CKVSDGqmfAUAu9opvQ
	(envelope-from <linux-media+bounces-62130-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:08:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9988E57E56A
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A418B309D974
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 11:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3754B8DF6;
	Tue, 19 May 2026 11:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K60BlYWN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E44C4ADD84
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 11:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779191985; cv=none; b=utbx9yFlhJTAMPdu9H6AKyDCkht4sHmn3xE9DmNIhmDfNP/adAnGLRZlRF77sGqDN52dxJ9rhm1U+yQY6GqPNcfcAURXraGpBxDG/l1U2WxT1XNa/WAevl3YSOCFTMBsSmtJQ/giyOTUEgBEQ6VYwt+CxqouM3NAewaX+3HlQuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779191985; c=relaxed/simple;
	bh=D/9EFdR6b9LvR2+vOqAMX9wsIzPdMbBECRGp89WBgwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UA0q/Gj7GcAnGdHvcuO7pn4LlGpwhi4hdfBMUXfpRflmX+sbIQdzZrmNH3nNpe16MLHUHNnXjxyCTd6VqhpYs775OUvuN4w/lJ8V0vGegWAbf8Ap9VrCP12wUAf5raGwR2IWnzY0GqWyWzyu9h5jAA5gy7FAZhecq7wO1HT7hSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K60BlYWN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9775C2BCB3;
	Tue, 19 May 2026 11:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779191984;
	bh=D/9EFdR6b9LvR2+vOqAMX9wsIzPdMbBECRGp89WBgwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K60BlYWNKPVeeM/4hVYHuiSV0gCpKy1dEMDZ08eBkzSXyzzY3sm98GIUiv/2weosV
	 I3zIx5aeTr5S9WcgR+JRReIPS2DEZP5W0HFdHLwZ/WoAFuWmwG86taqUnLnCS6IGQW
	 aVQFF2eXIHPH8Oh5tCyrG6v4HS9/U749IycTZ+NoNcSOlZD/gYf6ACAw3oHiztrYvW
	 CO9XKq4cpJ9GEt0A2hD8yqLC7ss/3Y0eupTFm1D1EZ+NFiUNDUtq4iMeYNDTSHOrDY
	 FQkqFfxTiqjXe8oc+3Crg53JaPSGTJjtmnq1XYVX6BmGf29J9ZxwtK9Yt+IKlPXn0C
	 OeKByod4ZdpCw==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCH 2/3] media: em28xx: drop 'users' field
Date: Tue, 19 May 2026 13:54:42 +0200
Message-ID: <7b098799ba6495ae1f3a9cdc70d485c53acf2d81.1779191683.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779191683.git.hverkuil+cisco@kernel.org>
References: <cover.1779191683.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62130-lists,linux-media=lfdr.de,cisco];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9988E57E56A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Drop the em28xx_v4l2 'users' field, use v4l2_fh_is_singular_file()
instead.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/usb/em28xx/em28xx-video.c | 18 +++++++-----------
 drivers/media/usb/em28xx/em28xx.h       |  1 -
 2 files changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
index 42f5e7547cc4..6c726764a5f3 100644
--- a/drivers/media/usb/em28xx/em28xx-video.c
+++ b/drivers/media/usb/em28xx/em28xx-video.c
@@ -2332,9 +2332,8 @@ static int em28xx_v4l2_open(struct file *filp)
 		return -ENODEV;
 	}
 
-	em28xx_videodbg("open dev=%s type=%s users=%d\n",
-			video_device_node_name(vdev), v4l2_type_names[fh_type],
-			v4l2->users);
+	em28xx_videodbg("open dev=%s type=%s\n",
+			video_device_node_name(vdev), v4l2_type_names[fh_type]);
 
 	ret = v4l2_fh_open(filp);
 	if (ret) {
@@ -2345,7 +2344,7 @@ static int em28xx_v4l2_open(struct file *filp)
 		return ret;
 	}
 
-	if (v4l2->users == 0) {
+	if (v4l2_fh_is_singular_file(filp)) {
 		em28xx_set_mode(dev, EM28XX_ANALOG_MODE);
 
 		if (vdev->vfl_type != VFL_TYPE_RADIO)
@@ -2363,8 +2362,6 @@ static int em28xx_v4l2_open(struct file *filp)
 		v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, s_radio);
 	}
 
-	v4l2->users++;
-
 	mutex_unlock(&dev->lock);
 
 	return 0;
@@ -2467,13 +2464,13 @@ static int em28xx_v4l2_close(struct file *filp)
 	struct em28xx_v4l2    *v4l2 = dev->v4l2;
 	struct usb_device *udev = interface_to_usbdev(dev->intf);
 	int              err;
+	bool last_user;
 
-	em28xx_videodbg("users=%d\n", v4l2->users);
-
-	vb2_fop_release(filp);
 	mutex_lock(&dev->lock);
+	last_user = v4l2_fh_is_singular_file(filp);
+	_vb2_fop_release(filp, NULL);
 
-	if (v4l2->users == 1) {
+	if (last_user) {
 		/* No sense to try to write to the device */
 		if (dev->disconnected)
 			goto exit;
@@ -2496,7 +2493,6 @@ static int em28xx_v4l2_close(struct file *filp)
 	}
 
 exit:
-	v4l2->users--;
 	mutex_unlock(&dev->lock);
 
 	return 0;
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index 90b83e4598ac..f68159fab345 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -580,7 +580,6 @@ struct em28xx_v4l2 {
 	int sensor_yres;
 	int sensor_xtal;
 
-	int users;		/* user count for exclusive use */
 	int streaming_users;    /* number of actively streaming users */
 
 	u32 frequency;		/* selected tuner frequency */
-- 
2.53.0


