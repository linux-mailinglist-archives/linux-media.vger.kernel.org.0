Return-Path: <linux-media+bounces-67662-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pEgSNzV0V2qbOQEAu9opvQ
	(envelope-from <linux-media+bounces-67662-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:51:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ECC75DC58
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 13:51:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=t4I7A7e3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67662-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67662-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E6720304494D
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2026 11:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560FD47A0D8;
	Wed, 15 Jul 2026 11:44:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1B4472796
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 11:44:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115865; cv=none; b=pXLLCRVP9BcrBp6Kg55XS/16JyGMiJq+Nz5/H+7+Iqw2B/eNAWX0NrB2dO5nIFzmvFDt8QIz4+nudOlIWn4+d/hKPkRjzMJJZdtoqcpzy8mTaCtXA7J3xxZ4PhatZ5ZsoUCUZt3eq4caDDs7quZGtehGFgoJvYIbobLaFliwefY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115865; c=relaxed/simple;
	bh=/hOFo0rPQJJCMg8TN7ca2c/YdU1t7mtGTuPyJNmtqF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kOrDLmbluj6SBETCVh98LKMpX5Zpfwj5AvpYbp4DHYFGDAO1kHwemI6oCXq9dLxyMbJbNkf0FDqS57VKh2M3RZzgVJlMlcFv8TNqElSl9V60ZI5qNtIwAXaY5Iu6JuTBm9RD2IjdcmG2+7RRT8VdAi99hD8G3IEDGQOYMJIDAE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=t4I7A7e3; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso3675735f8f.3
        for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 04:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115861; x=1784720661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RisMOAAic48kNClVJf1apvBtYfMS81SJZNrhmUuPOOU=;
        b=t4I7A7e3omHg4+2VUCClwUcufLvHI5Cf2Db7RMS1Ti9iSAghZeQ0ATFAmfbVfGjqW9
         wkCbGFI+gNH0A1VSRQWKbl5I0w3SWT94jJctmC20pTPdRvAf9cIwJBIMEeQ4G/EQ7S0H
         Sg9JSnQJAqly/5Q6hzMeMhEsGfrbXEsw29wlHwXIbYqUj+NU5swRhl9o8yBxAt7LSi7K
         AQfSELXLiXSBYtfyJ8gyyUlx9faFpXDoBpkesyG50kGUCSQtL5NfFYApeT3uFRRQS9Sa
         ns3dAokj263nW1JD2mYkqACm8kQcFJA/2mY2a1BfB4KhIllBel+UAHAxZjkqV4UW0++w
         0xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115861; x=1784720661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RisMOAAic48kNClVJf1apvBtYfMS81SJZNrhmUuPOOU=;
        b=g4fo6pezp7/RHgZsbGkI+kkulX3yI8Yq2y+K1n9azCGYE2tz+PKRwoKzsOOcbpMgVK
         7zACn74JgxpP0TnBJtDd20+ttZIF1J1QDtaD3x14ELoTM2Cquk0Ag6AhZvfVAmeE2sy2
         feK+j+jPbKnIi4aLuTDKfWxAsT/IS4LaNs3VcSshCazsXST+9nGh4FYfrxSXezHk3YIH
         QoHrdBRb1ny5gnDdrw2F/EtpRXqDzwp1GNyObhrgd0XW4LDupCpxTM8umK4qhOmIGw55
         6YZzZGxl/S9CdGPCPyBAy2G0UQU37Dur65DLt8ZIwnGizVJPLYmx5tyANybfiXJ0hgLK
         kH7A==
X-Gm-Message-State: AOJu0Yww7jjgO17GPJt1egMtO22T/imdffsIOYe99zVwIwArgsaNtczS
	NMXoxscxItqTMJM5yLly5QEl6h+Q2V9HJziQErbhLfJlQtd+OsXQ73saerZnWfuDnz0=
X-Gm-Gg: AfdE7ckQ1jA3HqzpFzZg/UdrfcEbkFfx2+PQQKUgVa+Cotq/MAEYTafuRxBWCTlaWIB
	05nl/tYT2FfcDq810UM6B4Dfv6l8WiXGiK4mULjLjzotSA9kNHxZwcTnT6dRDRzAS8QedGrMDl6
	/IvW4ceTx2CiE/zcuGP6dKq8GDUMGOJAawRJgNs2E48AwJtgxggLI+kove47lwIljtHzE/WcdvT
	/v7sZmv5S7P9c4vqPIMAVm2NQmHhXx8lPC5UIX+enPeWW0V4cBmcho+JmlhrtPbjG9cnfwLBeQ5
	AchaeS7ech/o3OfQKrYS50EAg7JOQu+tSeXhL4o2EEomio+Nd0QnxXwcXuUUzmSNcdibyxoiy76
	6uaqM4Irb4qezSmS7guwuGtImEsxLIyCyb5vfA0BH6v2XvIfkr1E2xSHcu3nvsMVR5nffZ7xTlY
	y2xATTBcYhR3rYEsLxDspcK49Kel9pOTBM3S7pNOsIY3ESSpCjAWHMWW3O/0Ie+EwD
X-Received: by 2002:a05:6000:29ce:b0:460:3b5d:43b6 with SMTP id ffacd0b85a97d-47f46373bb4mr7550356f8f.31.1784115861266;
        Wed, 15 Jul 2026 04:44:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:20 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:26 +0100
Subject: [PATCH v4 13/21] media: imx355: Use pm_runtime autosuspend_delay
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-13-f7f966fb9ffd@raspberrypi.com>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
In-Reply-To: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67662-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mailingradian@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:david@ixit.cz,m:jacopo.mondi@ideasonboard.com,m:devicetree@vger.kernel.org,m:dave.stevenson@raspberrypi.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,raspberrypi.com:from_mime,raspberrypi.com:mid,raspberrypi.com:email,raspberrypi.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57ECC75DC58

Avoid powering the sensor up and down unnecessarily by using
pm_runtime's autosuspend_delay feature.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/i2c/imx355.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index 120eda46d982..17a2acc1152d 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1074,7 +1074,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 			goto err_rpm_put;
 	} else {
 		imx355_stop_streaming(imx355);
-		pm_runtime_put(imx355->dev);
+		pm_runtime_put_autosuspend(imx355->dev);
 	}
 
 	/* vflip and hflip cannot change during streaming */
@@ -1086,7 +1086,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 
 err_rpm_put:
-	pm_runtime_put(imx355->dev);
+	pm_runtime_put_autosuspend(imx355->dev);
 err_unlock:
 	mutex_unlock(&imx355->mutex);
 
@@ -1436,6 +1436,8 @@ static int imx355_probe(struct i2c_client *client)
 	 */
 	pm_runtime_set_active(imx355->dev);
 	pm_runtime_enable(imx355->dev);
+	pm_runtime_set_autosuspend_delay(imx355->dev, 1000);
+	pm_runtime_use_autosuspend(imx355->dev);
 
 	ret = v4l2_async_register_subdev_sensor(&imx355->sd);
 	if (ret < 0)
@@ -1448,6 +1450,7 @@ static int imx355_probe(struct i2c_client *client)
 error_media_entity_runtime_pm:
 	pm_runtime_disable(imx355->dev);
 	pm_runtime_set_suspended(imx355->dev);
+	pm_runtime_dont_use_autosuspend(imx355->dev);
 	media_entity_cleanup(&imx355->sd.entity);
 
 error_handler_free:
@@ -1478,6 +1481,8 @@ static void imx355_remove(struct i2c_client *client)
 		pm_runtime_set_suspended(imx355->dev);
 	}
 
+	pm_runtime_dont_use_autosuspend(imx355->dev);
+
 	mutex_destroy(&imx355->mutex);
 }
 

-- 
2.34.1


