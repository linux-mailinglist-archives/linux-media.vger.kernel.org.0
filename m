Return-Path: <linux-media+bounces-39-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA487E7F06
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 18:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 001CDB21731
	for <lists+linux-media@lfdr.de>; Fri, 10 Nov 2023 17:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9686938DD3;
	Fri, 10 Nov 2023 17:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hbP6DI5w"
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20253C081
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 17:46:52 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F542D4E3
	for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 03:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699614854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=03UND7blMF3lWiyjlhd55D3XLhjFL3Wa79jbOROqQiY=;
	b=hbP6DI5wC6cEpzXQmULWsEV2IKhOysLTgDlo+46OoIAMy1dNgqpRcVrp6w2QemzE8potfJ
	w2OhH1T0pxpNacWCepFXtaQQKHn9Qr4fqDKRMUPeD+mRsqLhBAdC+2l2lDO2andoelacWT
	T5ZTA9ZW8+M6fq59T6ij8yJri3Fwiqs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-TYMrsL9xP8SJf_XPrKC0Ng-1; Fri, 10 Nov 2023 06:14:13 -0500
X-MC-Unique: TYMrsL9xP8SJf_XPrKC0Ng-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9e293cd8332so169030166b.1
        for <linux-media@vger.kernel.org>; Fri, 10 Nov 2023 03:14:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699614852; x=1700219652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=03UND7blMF3lWiyjlhd55D3XLhjFL3Wa79jbOROqQiY=;
        b=gAIJmyzUY6VHmu8bi9z1V9ZGGX4ZhLafLtNvB8I0eqrte34Q+JtR5kWf1BrJtROote
         bZdfPVjsMZUQA5Vu2rA9FplzAbMr0+w8luuNZiQ2SVyjfyvy51AsSryr6rsA9+Rk2L7u
         G0qFQbV6EwcrLVc1OeBCfmKqXg7QCBSC3s0NVjYsII8ctBw0F0fUTLivfNwXuCc44pYg
         NHtn+JwNUUs1TO4IO8CxFYGIeaoi8W7M1YWW15SHR3GO0waeY3EMkKhRwdae0vFRvkpU
         PMLWwygp5Qyo9wgVAmJAxh5zF4r7aOJD3wUGzkJCieVhgpj9DJSA3CwFJrbERRzolfEA
         v8Pg==
X-Gm-Message-State: AOJu0YwAia+Dvy9ku20LCK5VNO07RetUpUD+1CMXk7R02jJbFO77gCFD
	+WLNLjAGrAQJsJu5Hg+itjUyewdWvXiR4XvRyaGjpq5WFG+dX8t0wfqd1j6TGUGHjsv/mDrcv8g
	lzwzR3AP50E1jKtnR5LV666XYnHTk+XU=
X-Received: by 2002:a17:907:8691:b0:9b2:cf77:a105 with SMTP id qa17-20020a170907869100b009b2cf77a105mr7055420ejc.15.1699614851679;
        Fri, 10 Nov 2023 03:14:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgzTPiFKYAB2n3Fzm+jihXuJJn3FUsFDIocsYJUF4PJEscBWIgqak4SoAGzomAgC7LPJR6Nw==
X-Received: by 2002:a17:907:8691:b0:9b2:cf77:a105 with SMTP id qa17-20020a170907869100b009b2cf77a105mr7055411ejc.15.1699614851360;
        Fri, 10 Nov 2023 03:14:11 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id lt24-20020a170906fa9800b0099d798a6bb5sm3775599ejb.67.2023.11.10.03.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 03:14:10 -0800 (PST)
Message-ID: <553265e2-a57a-4f70-9254-f140348ed1e8@redhat.com>
Date: Fri, 10 Nov 2023 12:14:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] media: v4l: cci: Add macros to obtain register width
Content-Language: en-US, nl
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
References: <20231110094705.1367083-1-sakari.ailus@linux.intel.com>
 <20231110094705.1367083-4-sakari.ailus@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231110094705.1367083-4-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/10/23 10:47, Sakari Ailus wrote:
> Add CCI_REG_WIDTH() macro to obtain register width in bits and similarly,
> CCI_REG_WIDTH_BYTES() to obtain it in bytes.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  include/media/v4l2-cci.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> index b4ce0a46092c..80eaa7fdc606 100644
> --- a/include/media/v4l2-cci.h
> +++ b/include/media/v4l2-cci.h
> @@ -40,6 +40,9 @@ struct cci_reg_sequence {
>  #define CCI_REG_FLAG_PRIVATE_END	31U
>  #define CCI_REG_PRIVATE_MASK		GENMASK(CCI_REG_FLAG_PRIVATE_END, CCI_REG_FLAG_PRIVATE_START)
>  
> +#define CCI_REG_WIDTH_BYTES(x)		(((x) & CCI_REG_WIDTH_MASK) >> CCI_REG_WIDTH_SHIFT)

Please use FIELD_GET like v4l2-cci.c does:

#define CCI_REG_WIDTH_BYTES(x)		FIELD_GET(CCI_REG_WIDTH_MASK, (x))

With that fixed:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

As for the patch 4 - 6, those are interesting patches but
I'm afraid I don't have time to review them.

Regards,

Hans





> +#define CCI_REG_WIDTH(x)		(CCI_REG_WIDTH_BYTES(x) << 3)
> +
>  #define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
>  #define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))
>  #define CCI_REG24(x)			((3 << CCI_REG_WIDTH_SHIFT) | (x))


