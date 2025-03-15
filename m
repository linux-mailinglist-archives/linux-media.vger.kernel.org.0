Return-Path: <linux-media+bounces-28308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF00A6328D
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 22:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DBDE3B4FEA
	for <lists+linux-media@lfdr.de>; Sat, 15 Mar 2025 21:06:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0B519DF77;
	Sat, 15 Mar 2025 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y9r6Hsgw"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4CE197A8B
	for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 21:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742072802; cv=none; b=m4m6wQheWEWfjyu9Ty6Tn6HRMEh0v8s7ieqSqdhhyCVM/d9omcmprD5huJspgZl32egtKh9BrCjAp1ai5TInOaIM8rGJw2qqfVxcyyRYP/hDEpwokQUA1I0urLdef7qFy/HBPCVb41TK18gJANScoyuARYHnEaBawIAGBRVCHwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742072802; c=relaxed/simple;
	bh=d6lhmOk6Rst2+Dmzg6pnztUnrXKW7cNJzQn5dRi4gBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gv5K/THRb81VJiLWBScT4YZJ5xUrApzkCrTVCR57BCpuZsLGYwjpDVMxEyq6ZuR6qyb83Ifeq5DZqLIu590DqMUPQEEsOHV1/iEuWzccDVZFe3ZM0MkPVDt4c9OBsOwCRlDUtG80PVIjvF+L457hBxcRf7F9o4UnBMaKyKO9Qbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y9r6Hsgw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742072799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KGGKey3PgYcEbrF8eKuuFufpN0zVsg5RJwP7JREs5Vo=;
	b=Y9r6HsgwqLfR2IepOGtOfNcc4V0ve8JG52A90hIu5jfZCdNIQgOOMM/RJmiQGT9yzmeCgp
	T4YebbVgRjZ2rD+8z4GHFIHaOEU4Bak4l5GIFn3xFo8zk8riJ3HfcwBSy0KPcBE/GSAATw
	SrXnpJY660lOvO0owgt5jwWa1xpDcGc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-U2MLDIVDNwqTHxxvl7_TWg-1; Sat, 15 Mar 2025 17:06:37 -0400
X-MC-Unique: U2MLDIVDNwqTHxxvl7_TWg-1
X-Mimecast-MFC-AGG-ID: U2MLDIVDNwqTHxxvl7_TWg_1742072796
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac2aa3513ccso270715766b.0
        for <linux-media@vger.kernel.org>; Sat, 15 Mar 2025 14:06:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742072796; x=1742677596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KGGKey3PgYcEbrF8eKuuFufpN0zVsg5RJwP7JREs5Vo=;
        b=wU+CW7RxTw2sdOyGLdk7YVHsbt3RwxCaivP5Zi/bvmFLSBOtEqRaQY8yenhI9IpGO+
         Q+g4gqxDQIPIs4it1ef0rX8KoY4RP6Y4xUGHGxrmfMy62JQRVPguCPyqen99LiLFwUYW
         1IjMpl3ik33TPee5IRbJnEZP5KXNFDvtrPpc0gRXnJ1JlpZKGcypB/bbcpFBfARvsWno
         dZFu0Bt5Y/+74Ep1B0YQjetySAcMrR7ZqSlBGk793nuPuw/0KiPZDJTk6FV7GbfG+56I
         J1x2ekAbqd095RkoNqI7Zv3mSDLtaujL24g7NvOptSx9QTRieyyknPXVAaGLtqV8veKR
         e+Ew==
X-Forwarded-Encrypted: i=1; AJvYcCV6ZsHh99z1hwMUkafeUvyvQ2pNtlsVXqpi9hoOCIN6A9N2jU8v2mt6r7lhVzioc5KpYKmAywX6/1H++A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyui3d9VWExnNr9Sh2AAyQRhXLwvhavAAAwGYb2Oxsb+0UYJpB8
	0ueM69oFO/7b4PMFOgEORidsub9UTXsvI/sqbuzJJKLN99B5P8aiRxF84R65JnXXcHE03SFnfkq
	sPEdxio/CoxQ5OsyB5Sm08pbh/3mPceCsseuRrfcmTRcP3XydXBLnmEXkSJQh
X-Gm-Gg: ASbGncu5N+ZQJ/YNCGrUfNGAkh5mOsN9+A3XVxI3WVcVD0d9EMUa8L6+3UYr9fdjB9e
	ADKajJTC871mGj0B0BFFZjGfyWu20s7NfkhMpL/fJxijapOcqmDrIjuzjZw72WDT2bRsHBfEv7X
	c8kpUMkaDrFtxz4CuHSjerUfRyFSjbe+A+TqSsXNM3rJhd9INyJWNNZaocM2q6QF4BMRDN3L5LL
	AWmD5epyyBS0XerouWttapCg8s4f8NBB+tz2SBoWGBjIzgahtqwpCr/2KW49w0l/HJRV50nu0Ll
	G7vxCNsXcWPsYfcETMUe+4QUfU4rgvRnQUfRRJUEkCxz2H4P30gcGr9G5X+QFw31oRc8E2xpWvb
	cYWxSGk03+kBR/zOFd5JqLSRXjJywRjrwjjkH3EjMBJEo8/fsOivKGfqe76Hcm55bFw==
X-Received: by 2002:a17:907:72cd:b0:ac2:6837:6248 with SMTP id a640c23a62f3a-ac3301e8dacmr554358366b.30.1742072796381;
        Sat, 15 Mar 2025 14:06:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeKISKsz6sVbjRokupZFHap2pTbl6mTwFIldnbVxs17pl+9liR82tRO7m4vB1ZeZ3oZVQcog==
X-Received: by 2002:a17:907:72cd:b0:ac2:6837:6248 with SMTP id a640c23a62f3a-ac3301e8dacmr554356166b.30.1742072796005;
        Sat, 15 Mar 2025 14:06:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3147ea1e2sm423181466b.59.2025.03.15.14.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Mar 2025 14:06:34 -0700 (PDT)
Message-ID: <e103139a-635a-425d-bb7c-20b77503c844@redhat.com>
Date: Sat, 15 Mar 2025 22:06:33 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: i2c: ov02c10: Add OF probe support
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: sakari.ailus@linux.intel.com, heimir.sverrisson@gmail.com,
 linux-media@vger.kernel.org, stanislaw.gruszka@linux.intel.com,
 ingvar@redpill-linpro.com, hao.yao@intel.com, mchehab@kernel.org
References: <20250314101125.9853-1-hdegoede@redhat.com>
 <20250315134009.157132-1-bryan.odonoghue@linaro.org>
 <20250315134009.157132-5-bryan.odonoghue@linaro.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250315134009.157132-5-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 15-Mar-25 2:40 PM, Bryan O'Donoghue wrote:
> Supply OF probe matching table and enumeration structure hook.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Thanks this looks very straight forward, I'll squash this
into v10.

Regards,

Hans



> ---
>  drivers/media/i2c/ov02c10.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index d3dc614a3c01..094651228763 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -1004,11 +1004,18 @@ static const struct acpi_device_id ov02c10_acpi_ids[] = {
>  MODULE_DEVICE_TABLE(acpi, ov02c10_acpi_ids);
>  #endif
>  
> +static const struct of_device_id ov02c10_of_match[] = {
> +	{ .compatible = "ovti,ov02c10" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ov02c10_of_match);
> +
>  static struct i2c_driver ov02c10_i2c_driver = {
>  	.driver = {
>  		.name = "ov02c10",
>  		.pm = pm_sleep_ptr(&ov02c10_pm_ops),
>  		.acpi_match_table = ACPI_PTR(ov02c10_acpi_ids),
> +		.of_match_table = ov02c10_of_match,
>  	},
>  	.probe = ov02c10_probe,
>  	.remove = ov02c10_remove,


