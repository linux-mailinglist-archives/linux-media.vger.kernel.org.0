Return-Path: <linux-media+bounces-3097-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A60A0820AC5
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 10:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A9711F217CA
	for <lists+linux-media@lfdr.de>; Sun, 31 Dec 2023 09:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6E033E5;
	Sun, 31 Dec 2023 09:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h+LBMkdD"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27872F58
	for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 09:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704015504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6GH49fe9P1LFfC/zNntRaTyPi/DVVoaN4qHiWXM/OtM=;
	b=h+LBMkdDMMPaQDE5gQvscJoIHfNWYTUt8G3guc38ugOKWw85dDOvF9P8UD7hQAXxd724BA
	HIHn38evAfPTc7+bOoVUVzNyvHvanDhlnZ9G0mXCICOA8YJrrRTuoprmjZpKmphsfalWZd
	lsoWm0xQ1T21myxfRFpb5iyBsXXqzmw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-T8dNZRokM2iCBDKgGxm3Ww-1; Sun, 31 Dec 2023 04:38:17 -0500
X-MC-Unique: T8dNZRokM2iCBDKgGxm3Ww-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5545ab4864aso3425462a12.0
        for <linux-media@vger.kernel.org>; Sun, 31 Dec 2023 01:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704015495; x=1704620295;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6GH49fe9P1LFfC/zNntRaTyPi/DVVoaN4qHiWXM/OtM=;
        b=T3jKfK2TlSuII/2ZWNTiXYHRaRhcodggIPqmCN0HWwckYyFouJxA8UMh3uuZyvt966
         R5DCCkjDAVhaFIeRmpS9JYucV0+EZs52126k/Gs+h35jKij8mov2BpRGGSEU53X/qg5Z
         zK1tH9E8Emvpysiu78oPY/JuCWXm8adQ7YGkU7vjka/uP64MXTeqlX0870w0iJeOU840
         BUhvdtS9mpRSp78jLi13LOGPHH/tdXQViKLU2+/dbsXALA8uYyQU49uPsn2GQnDRV+Z6
         bSeW9Npl7T+2EmEsDwHezbgHXYH2qqAhKhRpPPRJ7UQakWyXHHXUVKgcz532h36YbIsY
         6VAQ==
X-Gm-Message-State: AOJu0YzSXtoenUzdKuB4EhUnHOlnpxWUGllUa91c5cc2XoZ/c9FiR0Lz
	qph3e2EAbi/pBsHX2rduyCVUv/zkT5p34VhYC669dCbqUUV9bUJIZbOXSMVzyuSuvFNFjIGoZ3+
	FY56hw4zMRI0Mzfl/3UbrgJv0zKaUQfRgDBW8EDI=
X-Received: by 2002:a50:d659:0:b0:554:4dde:6646 with SMTP id c25-20020a50d659000000b005544dde6646mr9319616edj.9.1704015495638;
        Sun, 31 Dec 2023 01:38:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsdLgr/QXBiJ4I44Y8+TgG/zaD+DgQPBwKYBPXU1QroyHu/Mjj3koypyIhrQjThHzW7bCHEg==
X-Received: by 2002:a50:d659:0:b0:554:4dde:6646 with SMTP id c25-20020a50d659000000b005544dde6646mr9319610edj.9.1704015495186;
        Sun, 31 Dec 2023 01:38:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ew10-20020a056402538a00b005546ba152f4sm10900308edb.71.2023.12.31.01.38.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:38:14 -0800 (PST)
Message-ID: <e48ff1b3-73fc-4668-840e-129417ce2c08@redhat.com>
Date: Sun, 31 Dec 2023 10:38:13 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media: atomisp: Removed duplicate comment and
 fixed comment format
Content-Language: en-US, nl
To: Jonathan Bergh <bergh.jonathan@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231014083545.173238-1-bergh.jonathan@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231014083545.173238-1-bergh.jonathan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/14/23 10:35, Jonathan Bergh wrote:
> Fixed the following issues:
>  * Removed a duplicate comment
>  * Fixed up minor comment format issue
> 
> Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans



> ---
>  drivers/staging/media/atomisp/i2c/gc2235.h | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/gc2235.h b/drivers/staging/media/atomisp/i2c/gc2235.h
> index 55ea422291ba..ade28950db73 100644
> --- a/drivers/staging/media/atomisp/i2c/gc2235.h
> +++ b/drivers/staging/media/atomisp/i2c/gc2235.h
> @@ -74,9 +74,6 @@
>  #define GC2235_COARSE_INTG_TIME_MIN 1
>  #define GC2235_COARSE_INTG_TIME_MAX_MARGIN 6
>  
> -/*
> - * GC2235 System control registers
> - */
>  /*
>   * GC2235 System control registers
>   */
> @@ -167,7 +164,7 @@ enum gc2235_tok_type {
>  	GC2235_TOK_MASK = 0xfff0
>  };
>  
> -/**
> +/*
>   * struct gc2235_reg - MI sensor  register format
>   * @type: type of the register
>   * @reg: 8-bit offset to register


