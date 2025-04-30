Return-Path: <linux-media+bounces-31377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A050EAA4554
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 10:28:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02F264E23DE
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 08:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5EA721C173;
	Wed, 30 Apr 2025 08:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Alh41VcA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C39217F27
	for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 08:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001665; cv=none; b=I972Q1YnI47FTSLbwZLvJfzaUonlWRJKe+HvMmHRE2oDdUS0scitU0x9v393lBp4ClwxV76Q3qC1HOs7krl33lxSq8d8DmT3SSIn1qoRaYE+7QKb7qEg8PK1/V67ndxp7WhLsZGKkTLTPYIPy49PXE36TVdSQqG0LSkb49QnzoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001665; c=relaxed/simple;
	bh=qVsS2hUBtqENy+Oubx9DpGdc3RA0lMtgQ25CAEpQvtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAIJwMPY03FEN2mAZUpt1fFW0G3yFzDePQpBlTj/AQvvOej0fwFfxMfrjwvdjCzoKFAxMgNQwn9VT74md9a3bdXE4Bpra7vCObfxEmJLW9u6aYZ7NeRmJZYOWL2grBVSO39fRNhyNIl6jDv3uXJ1vo6o7KPykfTbS+DY10nUWcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Alh41VcA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso61681225e9.2
        for <linux-media@vger.kernel.org>; Wed, 30 Apr 2025 01:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746001660; x=1746606460; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1mGsDZPklQSrBkLSeSMFUQEvM6CvjwvWAOT3FCKj6DE=;
        b=Alh41VcAHba6JSo3mD2BqMWSh+WzP0a8CfA/RbQ8zniwxJJUDVF4lTqHuTwM1Q/+Su
         iGTQu8YQfVE6M9CvoGy7VZ85OneF6wNgNccuw3Kzh+f8AH8Xs/ucSLwYmPbDJ6yfDzIY
         5Ee12Bf11b8SbMKmHpOVz8u0v66qjNl3donX0gDQiyeyeHJFLC84PfdkJ6vKdlUEYW/R
         EHFIJXQlQy2kkD5JgGdajP3w0BQTqTnj0zUHWe2Sh4/wp6ut4cDRmIx1arYJBTW6fHAe
         6fmeoUF0FVfLnPD0hbhScziPB5SYET3bk+xj+PrgATvTbEBCgSm/uWAK08jgysu4e3l5
         DSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001660; x=1746606460;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mGsDZPklQSrBkLSeSMFUQEvM6CvjwvWAOT3FCKj6DE=;
        b=a35hv+o9PFBL9coR4q5k+PdqpYJGzgKbR2KRgDT4DA7cuDYXBt7a9xAim7j8YssEG0
         6p5e5NJpIMDtxyZaurs6OyzwkTLAcDK82MnugD5y4sC7ff8KyH5m/rF8Sg8CehCZrFuM
         cz3RjMzZ4ucCG9Z5q+JKqKGHmxCUD0eUjpLeJF0aEB3LxcLpmCywB4TPtdChkK9i3k0E
         Ka3aNm2dJP7s52QaQCsIKSejtTpQyuc5ezFDTaCUB4WaYUle/2Z0WyssyLkfnhv9S2XQ
         vrJunZJXTU32DGBLm6aTFZh9BJrtalX8/Z4B8X+RdNEmYwsWRBBECOWlp6OlCbw3l6Ld
         FbOA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ/qD6J5c453HlzsIKBk4L+m92Ry19pYWgWaWVGjvnx9h5axdup8jbmHapAiauASQQLKObVmYDXF7qGw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/9Pg3RM77g6SbAFovO0Vp7UWkscKWurLepp537nHi1KVNNgkH
	QRfAn68a0AWPPClX4n6oj3GGY987+5rgwO7Dh545t/81CE9s2GBRAWP8eK1cIr8=
X-Gm-Gg: ASbGncsJhXX0ucIUJY8urLjyFO/TpADBlOO2N/Wcv8TTYqUzJoygmjFhw/afPBGcJ/h
	udWRbcTmN9oCPQ0eCaZ1kJVEXePj4GeU1s8uf9WEP21kBBMS/WP5UZQyydLZWH75d8GQ7gTgYey
	gq9qrzKSp/pK2IDWueKffQWvDGOocYJJ8x1wGYBoCM6O2jRWuwMD/iWw4AxBUaeSaC1uFbQ9ssm
	lOb6wwwjdzVjOq0VF4IKufw+V44/4+eQo1rVmpLN+EzhQZGp6nyzcIpTZDBkw7feyCZpur2HQrj
	+/FDnjl+II9s6Maalqd1vOnMqHCkrzosWVgorHaO0ZpdNg==
X-Google-Smtp-Source: AGHT+IFirixO8zK1n2Aomk9+LOvvs0gmdVuJyEBLIkX5VxmbuCqSlheIcRnqq6WdgItyXk/d3bhvEQ==
X-Received: by 2002:a05:600c:3acb:b0:43c:fc00:f94f with SMTP id 5b1f17b1804b1-441b268dfcamr12676025e9.23.1746001660599;
        Wed, 30 Apr 2025 01:27:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441ae3f5949sm33946145e9.1.2025.04.30.01.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:27:40 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:27:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: i2c: ds90ub960: Fix uninitialized variable in
 ub960_serializer_temp_ramp()
Message-ID: <e01f2784c6f8e4bc14458f9f4246ac0a8888468c.1746001540.git.dan.carpenter@linaro.org>
References: <cover.1746001540.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746001540.git.dan.carpenter@linaro.org>

The "ret" variable is not initialized on the success path.

Fixes: a05744749600 ("media: i2c: ds90ub9xx: Set serializer temperature ramp")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/i2c/ds90ub960.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 8075bffbac2b..cf104461b9a7 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2058,7 +2058,7 @@ static int ub960_serializer_temp_ramp(struct ub960_rxport *rxport)
 	u8 temp_dynamic_cfg;
 	u8 nport = rxport->nport;
 	u8 ser_temp_code;
-	int ret;
+	int ret = 0;
 
 	/* Configure temp ramp only on UB953 */
 	if (!fwnode_device_is_compatible(rxport->ser.fwnode, "ti,ds90ub953-q1"))
-- 
2.47.2


