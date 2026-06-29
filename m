Return-Path: <linux-media+bounces-65926-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cnnCNLtYQmqw5AkAu9opvQ
	(envelope-from <linux-media+bounces-65926-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:36:27 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB936D981D
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 13:36:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chromium.org header.s=google header.b=PuKdQKTO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65926-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65926-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=chromium.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA8133061EB2
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 11:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 767CC403E85;
	Mon, 29 Jun 2026 11:31:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6333939AF
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 11:31:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732661; cv=none; b=MNjkYzgArfCP2HLzhE9foFLPUFIfK6HMn7CKgzLut/6YQ5hcOTtaRQiZDY8RI1RShIWQNqRfXHJTbaRZvxPGfzRXCiswQllJbaR+l2+86Jb4i0eifKibik8JFCAxpZHM7yBBZOGSxRvUCr44M/vgWgf/q+77S+aXb0cwIWCM6ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732661; c=relaxed/simple;
	bh=ZFP65eOMqBrUdH9uFBg2XIXldh3NDouJtW5AEBr19dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HtUP5TSyZoYKw5m6Ej0CuyjMIsH5MiZ7O/iQPVS+ebbci6f2lbpDeIGkOKIYgnARYLgveTsgPVfKZly1t68wovbtUIeqBUcJdAKNeYInUduuJPRMpPIkLBre3nJ8C9DG4FmZT+2P6yJRp2FZrVWYGAqTCIvUsLlsBHcmRj5ria4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PuKdQKTO; arc=none smtp.client-ip=209.85.167.49
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aea5e2a361so2121954e87.1
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 04:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782732658; x=1783337458; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2h4vq6YMyhV7+/J+J80e8AqbTVSrOVELjNsb0fjYJrU=;
        b=PuKdQKTOveSigBh9f5nUsZqgRrzMfbbcKif/dsEEZNiGtutUQjqlLSR8uvi7zG/yOr
         r3qevowzNc4WWweXv9gaCzehQEJwLVBYhWef5uynBprdTuJ5sWVLnvE8rAJ7YpM+3cDj
         fy+oc7uJQioUbnoP19MoFV/ggzR0WFiMHQK04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782732658; x=1783337458;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2h4vq6YMyhV7+/J+J80e8AqbTVSrOVELjNsb0fjYJrU=;
        b=I4MdTSlQzbMA1s2qnlpilVceGXdm1r9c39Erw2cGC6kdc/ChveUR5rt+//JMCoB8ef
         48E8XuZHztJupzOUE7ib2fNVn6Z/rGbnyK1mVNDGxLZEqm88R04xD+hs8Py8iGu1C8Wm
         H5XHaMA0rdoQGGKW3mVcl98vPYTllv+kNyQkB3ZbPxe9BsnrgSuEEEtSeWoZNvtgDNsR
         4O1AZD/xiEy696hepjap9XB1NrQGEG0VhqkWAh82+KnrYpAtT8AKuRkWkQoUMoroz8hD
         Blo9QkXnSzjbricxHAclyC8kh0sVnSrlXdY88l5pFHpFe2s852bcnL/JQG2XIheEGr6B
         6ORg==
X-Gm-Message-State: AOJu0YwQl+lNOSFKtudlByjyp0CHbaRa0dciK/JbajvjIu5xXQB+qWwm
	YogXJb8ItVXdmgSeu+y4qm4EW53QMjjkVI/xEUkTnYReRk9soJWvtWleh/Q2c4s4Eg==
X-Gm-Gg: AfdE7ckzdQM46VgYhqTRStNug+4K+3vyJsBjA2P6Qqq26IvdA9pR91Fl+RE+IP2VaPe
	BNdQtBjKiBWFV4K43Flfve3Iu4caRmoK+KcIRmyaNWeBREY7Fa6V/iuL06tYIkxXE8s7H/ailOl
	d0CmcpyE3rg3REpT76pFkeljvD4kBXDXB3N8zsEXYTEOcnqt/1aTKlsA87/mR+LMZzeuTF84//O
	f9EOqa+TcQBY0cG2esBFmmVMcwOjViJW4hX05wJIBsJ39fWZEaZHm7GAI6f8SsdJ1xF2XU7Z+0a
	xVmqw4Ww/F6/Ag/gT65adSlZu+Xr6OreBW9ZvvVa2iGmw3GpXShx4JIAQ7v5oUa5eT1E/bcgFIa
	bxZfCFNdGs6j0gJh+ByWuzWKX/tsebzsEyPEtWo5PR1RP3Si5hx01ekZFWQB6ww7USh4cKdblYE
	G3ToE6QjcScaxCux+MqNgLKMQk8WGh/9+CS0bLdH7uqgI1s38IWAH2Hz7ivAZan9fUay73
X-Received: by 2002:a05:6512:135a:b0:5ae:b6b4:f20f with SMTP id 2adb3069b0e04-5aeb6b4f2b7mr1088221e87.53.1782732658474;
        Mon, 29 Jun 2026 04:30:58 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea2cffc04sm3597745e87.17.2026.06.29.04.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:30:57 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 29 Jun 2026 11:30:50 +0000
Subject: [PATCH 9/9] media: drivers/media/dvb-core: CodeStyle for
 dvb_frontend_open()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-cocci-7-2-v1-9-5884c80ee3b6@chromium.org>
References: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
In-Reply-To: <20260629-cocci-7-2-v1-0-5884c80ee3b6@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, Bin Du <bin.du@amd.com>, 
 Nirujogi Pratap <pratap.nirujogi@amd.com>, 
 Sultan Alsawaf <sultan@kerneltoast.com>, 
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Abylay Ospan <aospan@amazon.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Bin Du <Bin.Du@amd.com>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-65926-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:skhan@linuxfoundation.org,m:kieran.bingham@ideasonboard.com,m:bin.du@amd.com,m:pratap.nirujogi@amd.com,m:sultan@kerneltoast.com,m:Svetoslav.Stoilov@amd.com,m:sakari.ailus@linux.intel.com,m:aospan@amazon.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:Bin.Du@amd.com,m:ribalda@chromium.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,chromium.org:dkim,chromium.org:email,chromium.org:mid,chromium.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CB936D981D

We can rearrange a bit the function to reduce the indentation levels.

No functional change added to this patch.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/dvb-core/dvb_frontend.c | 49 ++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 27 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index 791834e088b6..0286da57f382 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -2875,7 +2875,6 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 	struct dvb_device *dvbdev = file->private_data;
 	struct dvb_frontend *fe = dvbdev->priv;
 	struct dvb_adapter *adapter = fe->dvb;
-	int ret;
 
 	dev_dbg(fe->dvb->device, "%s:\n", __func__);
 	if (fe->exit == DVB_FE_DEVICE_REMOVED)
@@ -2893,36 +2892,32 @@ static int dvb_frontend_open(struct inode *inode, struct file *file)
 				return -EBUSY;
 			adapter->mfe_dvbdev = dvbdev;
 		}
-	} else {
-		if (!adapter->mfe_dvbdev) {
+		return __dvb_frontend_open(inode, file);
+	}
+
+	if (!adapter->mfe_dvbdev) {
+		adapter->mfe_dvbdev = dvbdev;
+	} else if (adapter->mfe_dvbdev != dvbdev) {
+		struct dvb_device *mfedev = adapter->mfe_dvbdev;
+		struct dvb_frontend *mfe = mfedev->priv;
+		struct dvb_frontend_private *mfepriv = mfe->frontend_priv;
+		int ret;
+
+		ret = wait_dvb_frontend(adapter, mfedev);
+		if (ret)
+			return ret;
+
+		if (adapter->mfe_dvbdev != dvbdev) {
+			mfedev = adapter->mfe_dvbdev;
+			mfe = mfedev->priv;
+			mfepriv = mfe->frontend_priv;
+			if (mfedev->users != -1 || mfepriv->thread)
+				return -EBUSY;
 			adapter->mfe_dvbdev = dvbdev;
-		} else if (adapter->mfe_dvbdev != dvbdev) {
-			struct dvb_device
-				*mfedev = adapter->mfe_dvbdev;
-			struct dvb_frontend
-				*mfe = mfedev->priv;
-			struct dvb_frontend_private
-				*mfepriv = mfe->frontend_priv;
-
-			ret = wait_dvb_frontend(adapter, mfedev);
-			if (ret)
-				return ret;
-
-			if (adapter->mfe_dvbdev != dvbdev) {
-				mfedev = adapter->mfe_dvbdev;
-				mfe = mfedev->priv;
-				mfepriv = mfe->frontend_priv;
-				if (mfedev->users != -1 ||
-				    mfepriv->thread)
-					return -EBUSY;
-				adapter->mfe_dvbdev = dvbdev;
-			}
 		}
 	}
 
-	ret = __dvb_frontend_open(inode, file);
-
-	return ret;
+	return __dvb_frontend_open(inode, file);
 }
 
 static int dvb_frontend_release(struct inode *inode, struct file *file)

-- 
2.55.0.rc0.799.gd6f94ed593-goog


