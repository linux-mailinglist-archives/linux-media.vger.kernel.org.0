Return-Path: <linux-media+bounces-67018-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VQBLEnNlTmqSLwIAu9opvQ
	(envelope-from <linux-media+bounces-67018-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:57:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B072D727AB7
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 16:57:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=Hj37vLOj;
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67018-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67018-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCFA9309631A
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 14:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090984BCABB;
	Wed,  8 Jul 2026 14:49:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A85480DF2
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 14:49:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522167; cv=none; b=R87Vd98rFINOYiyxvULjTu6cQiVLrvsVxRLV9pV6qPrhWa1D6rLUubo7UNGo04WQ+Qg8Lh/1Oq5ztfmfV7y0wUeLFkF5McExotoMJJil2fFbi6XPfkIuVi4ZvWyvSgQWxF3dSxUgjCYTXh90Wl/VHlezQzW3zfM2n5bT/vYLM2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522167; c=relaxed/simple;
	bh=HkxE7QDh3kVaBT0axp9IR5qPsGPYXHxX+yr5prLaKjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APWQ/6yaVUj6kmYq59tiGb/N7bRuTFb/fw6xkdQmKAt9Cw+OEHybC0YMzvplSuZramtcoaG8zrXSwmopQFYEuu9L/GcZEzjNQR+Qt3ZZclYuWES4PWmdrdfQYI7x0jKjGyCR86ODklU2TCL1aP98PhaGWdunvLAh0isKkkRjK6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Hj37vLOj; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso8041375e9.1
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 07:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522159; x=1784126959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eznbuB8Cf+t+hvmFqCai3LuNPnGzE5omPSOsh6CmaE0=;
        b=Hj37vLOjeZ7jbyWdqakFad9/Qbf8T+venr92kA+UQriuHPKJ6nwnB5cyVPsFF5/jJm
         rgVZfDLD4LgZNhjxQt0QQ3ExSu4LLP5qeQpeGfexMat67kNkmnZwTo0Dwr2hSgoB7jjF
         /ijKCWBmG+ZITrkcGm79A2QDYozr8BXK3pGhm857XKQjJvou1z3ZUiPqhm/PG6R4Ykuj
         yE9Wz3NrHLwmV14ruAo5S6oPsZRy3GzgsD5oRuz7CHBQ53orAaLtyXoyNL0wxAI8RKIf
         WLXDzOEja/rQeIMps2DmYQcrhgDbDFGqHahbpczGH9mqcrLL//k21c6WDqPsSD2ni/rw
         wlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522159; x=1784126959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eznbuB8Cf+t+hvmFqCai3LuNPnGzE5omPSOsh6CmaE0=;
        b=mU+j8Vu9XkbIo1p9cNfw9TfOkv4+7wWGK9ResG+4PxR6yx1r4F7BYh3v4etWbgV/0r
         s0rwk0pZAnPiWFxABWEgsEO7HwAZ9hQxuKQ25vYNZOj9E1/nym9wsuLeLiemSjpdsx1e
         mXWVHjDpqZxLTvq5XTa+b+n2uwpXUmHefSFMEf0BcQo5v046Mki/NzEUqmLqo0ccJvxF
         MQImyvRzdBD4xyVVBffAXhOBc0IgZnuk+rB4/ekM0bLhmPwJXZE5aIFtv2raMEKFU5iA
         ek9WDv1exM+8wKTozy35Z7DpuMJ9d7tYsM77KjHstqC6ScSZcmY2PH2P4N/CfT505van
         BCwA==
X-Gm-Message-State: AOJu0Yxb+9oASuAQyIGSXvjZVF6jPufSz2+ACOkUbnBaf7NjX7yx23Km
	JjMpPTTTaOh1J8C9hceYTSdW8+bLBPhfvxzGz2sl2LnrHFq/hL6yggelV5nc6IRPKHI=
X-Gm-Gg: AfdE7clfuarDmpjRth+N3Yvp8VgX8YotZETZWQysgpfr3brM61JI3H7CkltEcsfbmgI
	Swxfsv89GIgBe0ryFkbPn2a9XiZoImNd3O5kkZhqYJzpvYyw+hTYk42VpBMOD33y8eLtygalwfW
	ATP4zdCbsxZnuCi4e6Z/D3f2AC+tVycy57QJTVM01UZFAB9lZZ3kTESTZefhluGrkOp1K1NIJkf
	UIdu9DYVETvmvIodZ7UmFIPo7P0vRpz6G1PPk5ft2bLhgERE34krDpIjNfWx0IRdtsXX4fOi6bm
	2yhpTdRnmRzoa4AYaAs8psY+1gRE0T2DbhrWCNeSGTGXnC2CzPRfiw8EsL5EJpipJNjpgNxyi/t
	0Ea0kay0zWGt6vrSK1Bp2R+qPVkhpXpJomTM1WVJCM+/9XtW9//UbT37arzYlt39oGEiXMo40Ex
	I4t3J6M0cvivkjf03NZSm6o6oeXSJeZxAaU1lGqQ0qXxIX5bqKaK+PICsA4q2FKHmLd9YN+joKp
	2E=
X-Received: by 2002:a05:600c:e558:10b0:493:e57e:7aa5 with SMTP id 5b1f17b1804b1-493e68c6e63mr19742845e9.22.1783522158971;
        Wed, 08 Jul 2026 07:49:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:18 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:48 +0100
Subject: [PATCH v3 12/20] media: imx355: Use pm_runtime autosuspend_delay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-12-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
In-Reply-To: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67018-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,raspberrypi.com:from_mime,raspberrypi.com:email,raspberrypi.com:mid,raspberrypi.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B072D727AB7

Avoid powering the sensor up and down unnecessarily by using
pm_runtime's autosuspend_delay feature.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index ee1f41a66a0b..f01a1a5ae7c9 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1073,7 +1073,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 			goto err_rpm_put;
 	} else {
 		imx355_stop_streaming(imx355);
-		pm_runtime_put(imx355->dev);
+		pm_runtime_put_autosuspend(imx355->dev);
 	}
 
 	/* vflip and hflip cannot change during streaming */
@@ -1085,7 +1085,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 
 err_rpm_put:
-	pm_runtime_put(imx355->dev);
+	pm_runtime_put_autosuspend(imx355->dev);
 err_unlock:
 	mutex_unlock(&imx355->mutex);
 
@@ -1436,6 +1436,8 @@ static int imx355_probe(struct i2c_client *client)
 	pm_runtime_set_active(imx355->dev);
 	pm_runtime_enable(imx355->dev);
 	pm_runtime_idle(imx355->dev);
+	pm_runtime_set_autosuspend_delay(imx355->dev, 1000);
+	pm_runtime_use_autosuspend(imx355->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&imx355->sd);
 	if (ret < 0)
@@ -1446,6 +1448,7 @@ static int imx355_probe(struct i2c_client *client)
 error_media_entity_runtime_pm:
 	pm_runtime_disable(imx355->dev);
 	pm_runtime_set_suspended(imx355->dev);
+	pm_runtime_dont_use_autosuspend(imx355->dev);
 	media_entity_cleanup(&imx355->sd.entity);
 
 error_handler_free:
@@ -1476,6 +1479,8 @@ static void imx355_remove(struct i2c_client *client)
 		pm_runtime_set_suspended(imx355->dev);
 	}
 
+	pm_runtime_dont_use_autosuspend(imx355->dev);
+
 	mutex_destroy(&imx355->mutex);
 }
 

-- 
2.34.1


