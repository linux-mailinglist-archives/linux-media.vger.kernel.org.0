Return-Path: <linux-media+bounces-15763-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 508F99475A5
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 08:59:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72F0E1C20878
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 06:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689381482F0;
	Mon,  5 Aug 2024 06:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZlfnPltS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE96144D15
	for <linux-media@vger.kernel.org>; Mon,  5 Aug 2024 06:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722841190; cv=none; b=AtGoE2LYqgAcGwxD7Ml/mn3d9vysENzcg4Mg2O7Zs2gzYsuJUU5hDJq/eJv1Gb6Lbm/iedWMV/GvryVUT8fXVLtFfsWjdEL99xKlpIleg9/QHKpCIKzAwo7frdcP7sbIMB2hIhfdrztoocLqdH9XS0ufBfNzBt6ddJK09ZaZSjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722841190; c=relaxed/simple;
	bh=NHtID9KPtcEIa3P9Y0dSnzOmLWTudPjDJscYBFmtYk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPCfkpCRq+U9tpSAgPfzpH5c7FEgf7R86GFPPr+p9sf3oh3P8x4mosTndX0ukWV2KshnYZGFaSfAKL27tnq0S3huZjK93QSJR9QcJQqTtWU1XOxzpKJyCPlRGTopK6XQRZeF7jBUhnIQqCBUfLqqKqM+u6QSvhZTxbOWdbkHqr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZlfnPltS; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7d2a9a23d9so1204872966b.3
        for <linux-media@vger.kernel.org>; Sun, 04 Aug 2024 23:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722841187; x=1723445987; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rm/KZR1BuBVKNTy9EH4IXxm1uVnhSZbpOV2mOfQUYhM=;
        b=ZlfnPltSA1y0ul63wf3xGzvw8cmUJtCebT7IAvC3uGk1zu6O5nnwJnAl8c1zVGEv6o
         n5SVxWslCjkI0G4oteSEfaD326Ti7BPhAvuSSo1RMZJFJ2x18MUDSigynPt5LCQgzOK7
         adkzcQwRHMVdeuf3NAA+TZP1NKPvkaXSQlqZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722841187; x=1723445987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rm/KZR1BuBVKNTy9EH4IXxm1uVnhSZbpOV2mOfQUYhM=;
        b=Nvg/JuTPpn0QeUWabLJs4bBnoMtOQJJe3GLFRsOpoMGfU3QRZC9U0okiw85acbkXOd
         p2pzaJ6ZX+IWNevV80IrkOCm2c6i4oHi8GuVU6QY4/BTYwE25mz+fQhaemMnJ2xYgWjx
         Schbjcjuy6FwELZVNbvmqn6Bsb3jZwkOWBoP1XNTF+U3K38LLd/EicCs8477eUKFhcaQ
         jE79ssXT6Zc8hpUzXe4bN2vi6hbrYftz8zz8rSW5VhtM8IaWJxQEjfOgwispYDlJu4IL
         B4h5VfxVKcP0nV6KVodBr2Cq1T0RRe1IGguJ7T0wWeGvmkHOgwmWSxDJUJs7KpQuH9Ow
         0YRw==
X-Gm-Message-State: AOJu0YwvFSBp2wtMkbjaUcj5+wdSyEWZwmxSoi/hbdl/hMyaUnmlU4EX
	d0t1RIFE08+o0l9AY2qj/AvQVjeLzkTPLmfDmQHX5IQTB5PQlnw2ggkG1bwDZX29u3DsU6eTPxY
	=
X-Google-Smtp-Source: AGHT+IGrp6KGPfpNFvEutW7nablrLKHccJq5m82683D4hutNCWW3blOwR/JJohkmKkB48NO2I0vJhg==
X-Received: by 2002:a17:906:7303:b0:a7a:b4bd:d0eb with SMTP id a640c23a62f3a-a7dc4e8764cmr785587666b.24.1722841186755;
        Sun, 04 Aug 2024 23:59:46 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc9db6sm408582566b.8.2024.08.04.23.59.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Aug 2024 23:59:46 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5b7b6a30454so4884712a12.2
        for <linux-media@vger.kernel.org>; Sun, 04 Aug 2024 23:59:46 -0700 (PDT)
X-Received: by 2002:a17:907:8692:b0:a7a:9a78:4b59 with SMTP id
 a640c23a62f3a-a7dc4e579f9mr766302966b.23.1722841185468; Sun, 04 Aug 2024
 23:59:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8eee4415-9082-488a-99ca-e016f9d80bb6@xs4all.nl>
In-Reply-To: <8eee4415-9082-488a-99ca-e016f9d80bb6@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 5 Aug 2024 08:59:31 +0200
X-Gmail-Original-Message-ID: <CANiDSCsQj0+DpbMMnf_PqZ-TYrYriSCbTH0LCUv7P7XigRuFxA@mail.gmail.com>
Message-ID: <CANiDSCsQj0+DpbMMnf_PqZ-TYrYriSCbTH0LCUv7P7XigRuFxA@mail.gmail.com>
Subject: Re: [PATCH] media: siano: add loadfirmware_handler NULL check
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Sat, 3 Aug 2024 at 11:35, Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Add check for a NULL value of the loadfirmware_handler to fix the
> following smatch error:
>
> drivers/media/common/siano/smscoreapi.c:1172 smscore_load_firmware_from_file() error: we previously assumed 'loadfirmware_handler' could be null (see line 1150)
>
> Note that it is a false positive, but frankly, this change makes the
> code more robust.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/media/common/siano/smscoreapi.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
> index b6f1eb5dbbdf..329aee411562 100644
> --- a/drivers/media/common/siano/smscoreapi.c
> +++ b/drivers/media/common/siano/smscoreapi.c
> @@ -1166,10 +1166,15 @@ static int smscore_load_firmware_from_file(struct smscore_device_t *coredev,

I cannot find any place where loadfirmware_handler is != than NULL.
Maybe it is better to clean the dead code instead?

diff --git a/drivers/media/common/siano/smscoreapi.c
b/drivers/media/common/siano/smscoreapi.c
index b6f1eb5dbbdf..3732367e0c62 100644
--- a/drivers/media/common/siano/smscoreapi.c
+++ b/drivers/media/common/siano/smscoreapi.c
@@ -1132,8 +1132,7 @@ static char *smscore_get_fw_filename(struct
smscore_device_t *coredev,
  * return: 0 on success, <0 on error.
  */
 static int smscore_load_firmware_from_file(struct smscore_device_t *coredev,
-                                          int mode,
-                                          loadfirmware_t loadfirmware_handler)
+                                          int mode)
 {
        int rc = -ENOENT;
        u8 *fw_buf;
@@ -1147,8 +1146,7 @@ static int
smscore_load_firmware_from_file(struct smscore_device_t *coredev,
        }
        pr_debug("Firmware name: %s\n", fw_filename);

-       if (!loadfirmware_handler &&
-           !(coredev->device_flags & SMS_DEVICE_FAMILY2))
+       if (!(coredev->device_flags & SMS_DEVICE_FAMILY2))
                return -EINVAL;

        rc = request_firmware(&fw, fw_filename, coredev->device);
@@ -1166,10 +1164,8 @@ static int
smscore_load_firmware_from_file(struct smscore_device_t *coredev,
                memcpy(fw_buf, fw->data, fw->size);
                fw_buf_size = fw->size;

-               rc = (coredev->device_flags & SMS_DEVICE_FAMILY2) ?
-                       smscore_load_firmware_family2(coredev, fw_buf,
fw_buf_size)
-                       : loadfirmware_handler(coredev->context, fw_buf,
-                       fw_buf_size);
+               rc = smscore_load_firmware_family2(coredev, fw_buf,
+                                                  fw_buf_size);
        }

        kfree(fw_buf);
@@ -1353,8 +1349,7 @@ int smscore_set_device_mode(struct
smscore_device_t *coredev, int mode)
                }

                if (!(coredev->modes_supported & (1 << mode))) {
-                       rc = smscore_load_firmware_from_file(coredev,
-                                                            mode, NULL);
+                       rc = smscore_load_firmware_from_file(coredev, mode);
                        if (rc >= 0)
                                pr_debug("firmware download success\n");
                } else {
diff --git a/drivers/media/common/siano/smscoreapi.h
b/drivers/media/common/siano/smscoreapi.h
index 82d9f8a64d99..3c15082ce0e3 100644
--- a/drivers/media/common/siano/smscoreapi.h
+++ b/drivers/media/common/siano/smscoreapi.h
@@ -97,7 +97,6 @@ typedef int (*hotplug_t)(struct smscore_device_t *coredev,
 typedef int (*setmode_t)(void *context, int mode);
 typedef void (*detectmode_t)(void *context, int *mode);
 typedef int (*sendrequest_t)(void *context, void *buffer, size_t size);
-typedef int (*loadfirmware_t)(void *context, void *buffer, size_t size);
 typedef int (*preload_t)(void *context);
 typedef int (*postload_t)(void *context);

@@ -1102,9 +1101,6 @@ extern int smscore_register_device(struct
smsdevice_params_t *params,
 extern void smscore_unregister_device(struct smscore_device_t *coredev);

 extern int smscore_start_device(struct smscore_device_t *coredev);
-extern int smscore_load_firmware(struct smscore_device_t *coredev,
-                                char *filename,
-                                loadfirmware_t loadfirmware_handler);

 extern int smscore_set_device_mode(struct smscore_device_t *coredev, int mode);
 extern int smscore_get_device_mode(struct smscore_device_t *coredev);

>                 memcpy(fw_buf, fw->data, fw->size);
>                 fw_buf_size = fw->size;
>
> +               /*
> +                * Note that loadfirmware_handler can't be NULL due to the
> +                * check above, but it is confusing smatch.
> +                */
>                 rc = (coredev->device_flags & SMS_DEVICE_FAMILY2) ?
> -                       smscore_load_firmware_family2(coredev, fw_buf, fw_buf_size)
> -                       : loadfirmware_handler(coredev->context, fw_buf,
> -                       fw_buf_size);
> +                     smscore_load_firmware_family2(coredev, fw_buf, fw_buf_size) :
> +                     (loadfirmware_handler ?
> +                      loadfirmware_handler(coredev->context, fw_buf, fw_buf_size) :
> +                      -EINVAL);
>         }
>
>         kfree(fw_buf);
> --
> 2.43.0
>


-- 
Ricardo Ribalda

