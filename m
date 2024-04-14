Return-Path: <linux-media+bounces-8853-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 717A389C7DC
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 17:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10FB51F231E7
	for <lists+linux-media@lfdr.de>; Mon,  8 Apr 2024 15:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0EA13FD7E;
	Mon,  8 Apr 2024 15:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bDBnwG0i"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C6B13FD77
	for <linux-media@vger.kernel.org>; Mon,  8 Apr 2024 15:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712589009; cv=none; b=lC2ei1ACFSl+CychBLoUZkQXtlI2olcDeG9TzIbdsnA08VlNnNKI+n0ZSqOOIa45QVDGWO7ADJLWLDQCEOoG/cjjCnwPW+6EU/aeAp2/SPFwA6iKdSb5kIzBizjY8NeUtL3JVhRX1P8qlzJ/jO/2F+REIkpA19/+COfgyJL8PjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712589009; c=relaxed/simple;
	bh=O1GMpv6U3bMpWegdyahz7zYDEcDjAVdDHz0mxZQn8uA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=stwRLoRtrB4hYOsErSsAOWgdoul/IGVyR1Crjv2MAudslbmVm74KcNKe6NtZIs+mEPac85HmTemfOYzA+/Ha9X2qZ+bjf37nRGWRYTAWtUGExYg2u2c46xsm2lADZ/LUdAlbIcJy3PqsjGNWUatAguiF4YKqULX84mZpWcCSOrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bDBnwG0i; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--panikiel.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4140225e68aso23114335e9.1
        for <linux-media@vger.kernel.org>; Mon, 08 Apr 2024 08:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712589006; x=1713193806; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yi/uhABnlcTj8gbmFZY62AYsFukjoKviscCUG5WiDB4=;
        b=bDBnwG0i8F+UFm+KU/IxneJ1To3SidWDc8exyhNYmUlMql/8909k0wSl9L7JA/BZeB
         1ixzAPbwmmJGtF6aUfR8PMluPzV6erhQC6wvTOnZY78KezrQq4A2Tj189o33k6TeDSn+
         cWqZKIetB0+x1WnOQiWHGJbsrA3Tco9L14NLHn+ZMrfEYTOF/PWtfCmGz4dZe5TJyXb4
         DGItmu4gAEwmO6DoRxHApMIC5kXZEh34uJAv5J/TPcFep33QxA9jHWtwbFhczaXaHXIB
         ozRZka7UT/BSTjYInHGSn9JiLcOe4aj//WxYAhNPdZTnVoXkpjPTIGci+1F6MW1sdJf0
         K1pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712589006; x=1713193806;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yi/uhABnlcTj8gbmFZY62AYsFukjoKviscCUG5WiDB4=;
        b=E4xRcXqDQEZ5+XNavaK6/ao2w3zcgNiLV0IjpgXmO4vvjl/rOxnJpVPLQPb4kvi0+O
         d+drCkmWg3vKvk2K6mN/bFeM2bxfW+2QFKdze7kxx3LhgbzMv9EoAxSazUy4I2ueQr0N
         Fn8ji3B4jp4bNeGWhDCCdFIqwfxJkgYn20o+t3+OW6KIKBVYDzkal27v7FMGZAj66Ff/
         l52VpyCnrQZhWsZixwW32A66NMi+RXuh0WqUIokVY1oKY8KlcCYStHcYZMN/cIegdGv7
         M3BAn7eCgKsH0RnWzu3z6++8aIqfyI+uTegZmUKjvbI8pfaDTFpJ65s/8XpB8m5Mktmk
         eFpg==
X-Gm-Message-State: AOJu0YxsHx8smLHOo9a+LHK43wrz86SkZqpH31F3fmOY9xed3nTumHtM
	0HcM4D2pzmx3Gm1hQBj0+IIjJce2y7zVPlH27+aEsJWTUu5N9wGK70j5okZv5GLCD26xmeyl9q9
	3d4wcdUwKFA==
X-Google-Smtp-Source: AGHT+IEj6+9O6AsYPRrE4sDXih3UjVlzc8R/gTi9MA/Rcp6Esze+SIQ0OaemxfVs/sEeTnu5OTi30izBkY9Zgg==
X-Received: from szatan.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:2d83])
 (user=panikiel job=sendgmr) by 2002:a05:600c:3ca6:b0:414:1390:57a2 with SMTP
 id bg38-20020a05600c3ca600b00414139057a2mr24707wmb.4.1712589006133; Mon, 08
 Apr 2024 08:10:06 -0700 (PDT)
Date: Mon,  8 Apr 2024 15:10:02 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240408151002.2283184-1-panikiel@google.com>
Subject: [PATCH 14.5/16] media: vpif_display: Use pad variant of dv timing
 subdev calls
From: "=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
To: kieran.bingham@ideasonboard.com, mchehab@kernel.org, 
	hverkuil-cisco@xs4all.nl, tharvey@gateworks.com, 
	niklas.soderlund@ragnatech.se, prabhakar.csengg@gmail.com, 
	charles-antoine.couret@nexvision.fr, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, skomatineni@nvidia.com, luca.ceresoli@bootlin.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, 
	"=?UTF-8?q?Pawe=C5=82=20Anikiel?=" <panikiel@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Use the pad variant for all (s|g|query)_dv_timings subdev calls, which
includes a pad argument.

Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
---
 drivers/media/platform/ti/davinci/vpif_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/davinci/vpif_display.c b/drivers/med=
ia/platform/ti/davinci/vpif_display.c
index 02ede1fe12cb..76d8fa8ad088 100644
--- a/drivers/media/platform/ti/davinci/vpif_display.c
+++ b/drivers/media/platform/ti/davinci/vpif_display.c
@@ -934,7 +934,7 @@ static int vpif_s_dv_timings(struct file *file, void *p=
riv,
 	}
=20
 	/* Configure subdevice timings, if any */
-	ret =3D v4l2_subdev_call(ch->sd, video, s_dv_timings, timings);
+	ret =3D v4l2_subdev_call(ch->sd, pad, s_dv_timings, 0, timings);
 	if (ret =3D=3D -ENOIOCTLCMD || ret =3D=3D -ENODEV)
 		ret =3D 0;
 	if (ret < 0) {
--=20
2.44.0.478.gd926399ef9-goog


