Return-Path: <linux-media+bounces-33559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3DFAC7221
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 22:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10C221891510
	for <lists+linux-media@lfdr.de>; Wed, 28 May 2025 20:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CAC220680;
	Wed, 28 May 2025 20:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MBMkLMgZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE99221D5B8
	for <linux-media@vger.kernel.org>; Wed, 28 May 2025 20:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748463745; cv=none; b=mbCcgUM1Cm1bzHbzr7KIBhrxsWj/9xTFk52MINLNGJ9MaOnCX8tzqGwiPhTFTiacE95n4iyMlT6T6YHI52GbcnqBTT+9RQODPLRMBC8Ppq61ZTGHe3khwmqpx91cdL1QU+MC1gIVFaNSFNwQX/ag1M53okkM0QXwfp/TqSttEaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748463745; c=relaxed/simple;
	bh=huHhx83QOe4ytOYGTtBjpmUB1tXdH+3Wmtjjm+SSGvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLcWtqP3G9fQqVUnU2Y2jU+sdHrc16GZJdGWbgsUSaVsFk4l6iSXoC6AttH+0y8wKEYNLwW0QQ2Quq/BHKN7rq2Nl5wTROYYGKSso2sqzLDGHvA+3Dd24IY0DEwtK0Bh6Al9jkE48F+6frg6L4F1wKzmN27bO0IVUik8UX9HQkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MBMkLMgZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so374965e9.1
        for <linux-media@vger.kernel.org>; Wed, 28 May 2025 13:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748463742; x=1749068542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t/GHNKIbcWNsKXVXR2KnFC3ujKn6xHbitos5kAD6Ag4=;
        b=MBMkLMgZzG047gI652FafZG8nc0mIg+oY9WTbEZe7My6oLMunJJR07nR0FImRARITl
         fLiFMji26AwEak7vAwsFSXNtZTaEjumIRJYn/CfdZzn6vxN5ffcR6bYi5MoOWUL1CBlW
         MUl7cxNHFSKq1smdYNhvUd6WfBoo1rhd+ZpGgHujFUhqFPVkoXFnlixonpmMoqfUEwbN
         3Fyz+kc1+RERpIVH45icQmAo07b/UpwRptOiT1ZQevlTZepKEiAkdlXckwNmLzpxIwJM
         jvR4EbelWrp394I8bB7c2nHObDHffvabBxWBDIhAig2KcCaaudzX0TppmPrqp226hSO5
         +9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748463742; x=1749068542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/GHNKIbcWNsKXVXR2KnFC3ujKn6xHbitos5kAD6Ag4=;
        b=f0FdMoaEla8EaWrZX1PZn9D8TvXffeJ0utAwLG/aXQaSwr3TTaOt5iSwNxRhid3C0b
         7tSKUan2JUOIZ6TfvRy1CZMtiUuhDAl8Yx5aaSJ3JeobrT8L057GSiLsPOhZ6/6ZVNbK
         NHFO01dAZQWpahdL8/c0ozpztRjEhwNPI27AIqGQlYlalUH5goTHYSVthvD2+ABFDkro
         fnzzpipPdBO86AtQMLAj7FtBaqL1+JYncQxiCkbhIgyoKACFApgQYpI3YljP+0XDbq0R
         JJeejDRvtLDbCXU+D77PQWjAn7DKAr/hAiiGSXfyAr418HZ9RBEaANOKiQ1dplo2bKMl
         XcGg==
X-Forwarded-Encrypted: i=1; AJvYcCWBJMjCiArsfcy7Ra287VNwUUWc8a541fambPCyP9l95P9lcea3h3KQwVrez+bewSoMyIn1vwBFCEHbmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWa6zIfRKupS0XjrWfr+vz5P7ZWYHCP4JD8RmHmmLNYvS6DVMp
	564MzJgVoMkk6yNI57ELh0Y++R8A3ogJ5r1HT4XzGpD5v/W59feG6vlO2FQ7C3ig+h4=
X-Gm-Gg: ASbGncvoWRpHOaUdEU+Rbzc+iNqSk+PK0GnnuYpmaoRNarf6Wn3UNLG1MfNASZfmCut
	S4kXQ4ffty+CYxzfx86+7FM83ihQGS2yMdRjDNiDFgb6JdREgFl1Fq/K1/snhXCYlobCC3Z9Hmh
	qe6pTPg14ct5fa9IRZTbmi2/ow9gsldPRSi0aGPRq9oBZvAf9FXemCiAI8hVp6kle96uU+ZQde6
	X8AnGkGrb/NyJSXHLAFsV5miWvlXq1Z3UDc+kcKU7a8bowV2LkKoZm/XVhlvJ4PB7I+DnSvQPTj
	UTVDhA1OwHACMta1yMTrz+zEWB9tKgibH1wvxT5Gb7FtzwC1qpWVpRo=
X-Google-Smtp-Source: AGHT+IE3zn4Dy9h4jWWCscJ1M+kpJaQhAI/mIcsizVpyQJzFiH/Pk4FYER8Sv/LTG2QhffZTotBPeg==
X-Received: by 2002:a05:6000:2909:b0:3a3:5c05:d98b with SMTP id ffacd0b85a97d-3a4cb44533fmr17005363f8f.5.1748463742253;
        Wed, 28 May 2025 13:22:22 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eac89daesm2324797f8f.44.2025.05.28.13.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 13:22:21 -0700 (PDT)
Date: Wed, 28 May 2025 23:22:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: gspca: Add bounds checking to firmware parser
Message-ID: <b258c7f831cc3c15491d400cbf822892867696ac.1748463049.git.dan.carpenter@linaro.org>
References: <cover.1748463049.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1748463049.git.dan.carpenter@linaro.org>

This sd_init() function reads the firmware.  The firmware data holds a
series of records and the function reads each record and sends the data
to the device.  The request_ihex_firmware() function
calls ihex_validate_fw() which ensures that the total length of all the
records won't read out of bounds of the fw->data[].

However, a potential issue is if there is a single very large
record (larger than PAGE_SIZE) and that would result in memory
corruption.  Generally we trust the firmware, but it's always better to
double check.

Fixes: 49b61ec9b5af ("[media] gspca: Add new vicam subdriver")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/usb/gspca/vicam.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/gspca/vicam.c b/drivers/media/usb/gspca/vicam.c
index d98343fd33fe..91e177aa8136 100644
--- a/drivers/media/usb/gspca/vicam.c
+++ b/drivers/media/usb/gspca/vicam.c
@@ -227,6 +227,7 @@ static int sd_init(struct gspca_dev *gspca_dev)
 	const struct ihex_binrec *rec;
 	const struct firmware *fw;
 	u8 *firmware_buf;
+	int len;
 
 	ret = request_ihex_firmware(&fw, VICAM_FIRMWARE,
 				    &gspca_dev->dev->dev);
@@ -241,9 +242,14 @@ static int sd_init(struct gspca_dev *gspca_dev)
 		goto exit;
 	}
 	for (rec = (void *)fw->data; rec; rec = ihex_next_binrec(rec)) {
-		memcpy(firmware_buf, rec->data, be16_to_cpu(rec->len));
+		len = be16_to_cpu(rec->len);
+		if (len > PAGE_SIZE) {
+			ret = -EINVAL;
+			break;
+		}
+		memcpy(firmware_buf, rec->data, len);
 		ret = vicam_control_msg(gspca_dev, 0xff, 0, 0, firmware_buf,
-					be16_to_cpu(rec->len));
+					len);
 		if (ret < 0)
 			break;
 	}
-- 
2.47.2


