Return-Path: <linux-media+bounces-12605-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A0D8FD4C9
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 20:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1628128766B
	for <lists+linux-media@lfdr.de>; Wed,  5 Jun 2024 18:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947D413AD12;
	Wed,  5 Jun 2024 18:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U52V+hRs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C587C15F408
	for <linux-media@vger.kernel.org>; Wed,  5 Jun 2024 18:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717610422; cv=none; b=D1oq8IZbE1phWLEtSXivFMGGJ7X0VOw9/IxUIFa8Fis5Etwt2gHZ3rgSEN7KoVs/GAWMavwwn7zSbECw5mVwpYTmCvkSPm8SVs4He0jzigXdmu93wFZ8T97v+mQPIMzayi3xlPLIq1ZuZHyj5Wcg8DfaQuFIhnenbVhRFdYnagw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717610422; c=relaxed/simple;
	bh=DtpDZyHe3eugG9lKYAyC1ondYmKEiXhRbdfT84tszLE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U5dXvzOpD5hcp030w2EpPrisZSytvt91l65rb8fCXt6XvnD3CoO5JXCOxk48GiIz8MzzY6BfS5ylg7BYwXBOIgz3HiwmHKUxH6vcmQ0d9WSNHQfnCO5iPXUsYpY59iNPw2IfzBNOyKl42C4Kl6g/Cti9ojZAdM9ORNbVS2Uzjis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U52V+hRs; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joychakr.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-df78ea30f83so1550766276.1
        for <linux-media@vger.kernel.org>; Wed, 05 Jun 2024 11:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717610418; x=1718215218; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AwIs39A3C8kh3vVRuRyRYkps3QbjGarBaeH82L3DU0g=;
        b=U52V+hRsiJQjSRnjvYDtZ8nO3ttKXkTxiHrLjNmADwfjQ8plad8HEMYMkkxmvtoFIs
         QEZHHMmsbHs8oE4DsgfG7xV73VdpniuxJWGD1uX+sexyHuIPqMEjjQbpiFRleB333mzK
         cskQ8g8ioMRy6iE5yXCZP8fi72tXA3aLXSn2e//1mmOhKE3l2iZpjrsErUj6Nw8rXBT/
         Ls5L9CJrzLx+rKGRzdTKorUXDwYGdNhd3A3/5vELUbwt6as3QITS3EdKaGbEVRNWJanK
         trjloEE6aIqij88o+jESh2lYoT7HqoWLxLTSIiCFGrQSEuGXKrYAGwKb/WUU8YLm9SV8
         ouoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717610418; x=1718215218;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AwIs39A3C8kh3vVRuRyRYkps3QbjGarBaeH82L3DU0g=;
        b=AE/iamN0cu5lajefXw4yNE1/658/ZnogZIcKgCsZvXcU9TbRyAyX6fScE5z15dHYGw
         H6Hxri8M/Dg4e6OnBh5FDcn2Rq8yK3qtuqxHrAcorYXyFe01nJdBLu71fKfyNFVSsrKf
         XkBkC10Mmahtz09Q+zlz3CinHadUGAnIwDS+DJ1Cf9a2zQQzzczPi5XmhwjTirZipKtn
         F8NHNaBn4SfX5d4ZgJdhfNxrVuc2dmRSmbWad0fPsCcdIEvcZo52f++EPcIcnwO9L15R
         kZDOWhPDjeo0lMLrF2t4A6bRRZgWGbhMXe0neLe1yC6wCE0DR/pH0hPLvtVqFVQ1yB9p
         gh2w==
X-Forwarded-Encrypted: i=1; AJvYcCVoMdrylq3dt5xoKxgzTpAxjHiXZtSAgLmUMDGdhq4MP+Wa7KiCg4r1mmHVb8Sd+lygpFkGAHEQ3+WB8/D6a3rbnue7NFb5mhvtRKY=
X-Gm-Message-State: AOJu0YylMQo32Nd0ZoDbP3KQWSbGOfa+nlwZ43GtniFzFajZST3mgfTE
	J12cY49ss9JHuohThN1kE0G+FB7Y/8fMktXkqTp8swSg1bUuoTQF/ib2VyFU86Tui3qY7T0ciC2
	LxvWmrojpjw==
X-Google-Smtp-Source: AGHT+IF67RE9Tjmuj/kq/k/X6dA78e699FHOj3MI1LHmpXg9uh50LZwtSgAXRWUPUOYrgrIfYkhy+wDlS5BIsw==
X-Received: from joychakr.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6ea])
 (user=joychakr job=sendgmr) by 2002:a25:9004:0:b0:de5:a44c:25af with SMTP id
 3f1490d57ef6-dfadec0b255mr68711276.5.1717610418012; Wed, 05 Jun 2024 11:00:18
 -0700 (PDT)
Date: Wed,  5 Jun 2024 17:59:48 +0000
In-Reply-To: <20240605175953.2613260-1-joychakr@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240605175953.2613260-1-joychakr@google.com>
X-Mailer: git-send-email 2.45.1.467.gbab1589fc0-goog
Message-ID: <20240605175953.2613260-5-joychakr@google.com>
Subject: [PATCH v1 04/17] iio: pressure: bmp280: Change nvmem reg_read/write
 return type
From: Joy Chakraborty <joychakr@google.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, manugautam@google.com, 
	Joy Chakraborty <joychakr@google.com>
Content-Type: text/plain; charset="UTF-8"

Change nvmem read/write function definition return type to ssize_t.

Signed-off-by: Joy Chakraborty <joychakr@google.com>
---
 drivers/iio/pressure/bmp280-core.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/pressure/bmp280-core.c b/drivers/iio/pressure/bmp280-core.c
index 09f53d987c7d..8d5aeabfa297 100644
--- a/drivers/iio/pressure/bmp280-core.c
+++ b/drivers/iio/pressure/bmp280-core.c
@@ -1465,10 +1465,11 @@ static const int bmp580_odr_table[][2] = {
 
 static const int bmp580_nvmem_addrs[] = { 0x20, 0x21, 0x22 };
 
-static int bmp580_nvmem_read(void *priv, unsigned int offset, void *val,
-			     size_t bytes)
+static ssize_t bmp580_nvmem_read(void *priv, unsigned int offset, void *val,
+				 size_t bytes)
 {
 	struct bmp280_data *data = priv;
+	size_t bytes_read = bytes;
 	u16 *dst = val;
 	int ret, addr;
 
@@ -1518,13 +1519,14 @@ static int bmp580_nvmem_read(void *priv, unsigned int offset, void *val,
 	mutex_unlock(&data->lock);
 	pm_runtime_mark_last_busy(data->dev);
 	pm_runtime_put_autosuspend(data->dev);
-	return ret;
+	return ret < 0 ? ret : bytes_read;
 }
 
-static int bmp580_nvmem_write(void *priv, unsigned int offset, void *val,
-			      size_t bytes)
+static ssize_t bmp580_nvmem_write(void *priv, unsigned int offset, void *val,
+				  size_t bytes)
 {
 	struct bmp280_data *data = priv;
+	size_t bytes_written = bytes;
 	u16 *buf = val;
 	int ret, addr;
 
@@ -1582,7 +1584,7 @@ static int bmp580_nvmem_write(void *priv, unsigned int offset, void *val,
 	mutex_unlock(&data->lock);
 	pm_runtime_mark_last_busy(data->dev);
 	pm_runtime_put_autosuspend(data->dev);
-	return ret;
+	return ret < 0 ? ret : bytes_written;
 }
 
 static int bmp580_preinit(struct bmp280_data *data)
-- 
2.45.1.467.gbab1589fc0-goog


