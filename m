Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60B837DE04D
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 12:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235122AbjKAL2V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 07:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235043AbjKAL2V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 07:28:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9A8A111
        for <linux-media@vger.kernel.org>; Wed,  1 Nov 2023 04:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698838049;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FGaWhF+kDQJnYubbjxHmr/7rPf/3DRVlVt9EW3AtPCQ=;
        b=aPCdHwFEWUTVhRpsCvg3ovWedCaY1qGsIwnAKQ0KoYWyy+kGr/Dl38wOweKHzp4MGj/jSW
        13zjUZuYPduXOdbeYhPRDjquPzJ9OoBNK8u6PqmxZUQSo1x8Mk6S3ZC0TvlqvmXp29/y3T
        T5ejj5uu4XyUYXD4hJ6Vre5/Rm98scI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-332-rVuO55NSNe-W3yN-jkVm9Q-1; Wed, 01 Nov 2023 07:27:28 -0400
X-MC-Unique: rVuO55NSNe-W3yN-jkVm9Q-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9d4b8735f48so190342666b.1
        for <linux-media@vger.kernel.org>; Wed, 01 Nov 2023 04:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698838047; x=1699442847;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FGaWhF+kDQJnYubbjxHmr/7rPf/3DRVlVt9EW3AtPCQ=;
        b=f8giDucmiqV/xUydclpcnYf9NzNeFLyr5/pHsqVNFYI8Dv+P9aZDsacKCdJuee+Qus
         Se+3kK2ct4HibJ2T+OvtuszeWidWf9y4m6ffjxqcCLjGuAG+bAuAbiBQqwJyVHf8AcZo
         JftqcO6Kf0ogG85g2KZweS2avmeTlB+Ty+EjSij3Pbu4yhRxBBR1mffjRA5LDTXT2Tqw
         N6cchdumUSdXEDu671sUF0lFrLOrF01ZNXJRdP4tY492lns0yOQ9SeEYwObiJKheAztp
         FZACCmjGItrm+0f4azPWtEzWexcLKdHUp1NDXYaHhXBMsNHRysgNPHJSa1/m3nXxSGeI
         FGYA==
X-Gm-Message-State: AOJu0YyhpXSXhbKvn7dxO0X3TNzg2gHGPk+DA4f9L0sW3qdalZ7ygEHq
        7c6V/uRmtj/c8nKLUzLBOE+zjHnw4emL4NylUHO2C0Pf5UPwb5pm3LBGwMBYgqqimcSujVfKVS9
        NnrVoN6B7WLYxnMBwiw3gWVE=
X-Received: by 2002:a17:907:728b:b0:9a1:c370:1af2 with SMTP id dt11-20020a170907728b00b009a1c3701af2mr1623121ejc.3.1698838046703;
        Wed, 01 Nov 2023 04:27:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJ+2Z0HL1PRMWdUYhK52SBMUMcXyD+IAkkuC8AAraSEw0AYds+/0WNPChUhrnK2R5blr3eyQ==
X-Received: by 2002:a17:907:728b:b0:9a1:c370:1af2 with SMTP id dt11-20020a170907728b00b009a1c3701af2mr1623110ejc.3.1698838046339;
        Wed, 01 Nov 2023 04:27:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gz22-20020a170906f2d600b0099cd008c1a4sm2293588ejb.136.2023.11.01.04.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 04:27:25 -0700 (PDT)
Message-ID: <0def9b52-b3bf-8fb3-2f4d-d5eda4fa36e3@redhat.com>
Date:   Wed, 1 Nov 2023 12:27:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] media: v4l2-cci: Add support for little-endian
 encoded registers
Content-Language: en-US, nl
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Alain Volmat <alain.volmat@foss.st.com>
References: <20231101111747.252072-1-alexander.stein@ew.tq-group.com>
 <20231101111747.252072-2-alexander.stein@ew.tq-group.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231101111747.252072-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Alexander,

On 11/1/23 12:17, Alexander Stein wrote:
> Some sensors, e.g. Sony, are using little-endian registers. Add support for
> those by encoding the endianess into Bit 20 of the register address.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Thank you very much for working on this.

However it looks like you forgot to add support for the LE flag
to cci_read().

Regards,

Hans


> ---
>  drivers/media/v4l2-core/v4l2-cci.c | 22 ++++++++++++++++++----
>  include/media/v4l2-cci.h           |  5 +++++
>  2 files changed, 23 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-cci.c b/drivers/media/v4l2-core/v4l2-cci.c
> index bc2dbec019b04..ea33cfd77d895 100644
> --- a/drivers/media/v4l2-core/v4l2-cci.c
> +++ b/drivers/media/v4l2-core/v4l2-cci.c
> @@ -68,6 +68,7 @@ EXPORT_SYMBOL_GPL(cci_read);
>  
>  int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
>  {
> +	bool little_endian;
>  	unsigned int len;
>  	u8 buf[8];
>  	int ret;
> @@ -75,6 +76,7 @@ int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
>  	if (err && *err)
>  		return *err;
>  
> +	little_endian = reg & CCI_REG_LE;
>  	len = FIELD_GET(CCI_REG_WIDTH_MASK, reg);
>  	reg = FIELD_GET(CCI_REG_ADDR_MASK, reg);
>  
> @@ -83,16 +85,28 @@ int cci_write(struct regmap *map, u32 reg, u64 val, int *err)
>  		buf[0] = val;
>  		break;
>  	case 2:
> -		put_unaligned_be16(val, buf);
> +		if (little_endian)
> +			put_unaligned_le16(val, buf);
> +		else
> +			put_unaligned_be16(val, buf);
>  		break;
>  	case 3:
> -		put_unaligned_be24(val, buf);
> +		if (little_endian)
> +			put_unaligned_le24(val, buf);
> +		else
> +			put_unaligned_be24(val, buf);
>  		break;
>  	case 4:
> -		put_unaligned_be32(val, buf);
> +		if (little_endian)
> +			put_unaligned_le32(val, buf);
> +		else
> +			put_unaligned_be32(val, buf);
>  		break;
>  	case 8:
> -		put_unaligned_be64(val, buf);
> +		if (little_endian)
> +			put_unaligned_le64(val, buf);
> +		else
> +			put_unaligned_be64(val, buf);
>  		break;
>  	default:
>  		dev_err(regmap_get_device(map), "Error invalid reg-width %u for reg 0x%04x\n",
> diff --git a/include/media/v4l2-cci.h b/include/media/v4l2-cci.h
> index 0f6803e4b17e9..ef3faf0c9d44d 100644
> --- a/include/media/v4l2-cci.h
> +++ b/include/media/v4l2-cci.h
> @@ -32,12 +32,17 @@ struct cci_reg_sequence {
>  #define CCI_REG_ADDR_MASK		GENMASK(15, 0)
>  #define CCI_REG_WIDTH_SHIFT		16
>  #define CCI_REG_WIDTH_MASK		GENMASK(19, 16)
> +#define CCI_REG_LE			BIT(20)
>  
>  #define CCI_REG8(x)			((1 << CCI_REG_WIDTH_SHIFT) | (x))
>  #define CCI_REG16(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x))
>  #define CCI_REG24(x)			((3 << CCI_REG_WIDTH_SHIFT) | (x))
>  #define CCI_REG32(x)			((4 << CCI_REG_WIDTH_SHIFT) | (x))
>  #define CCI_REG64(x)			((8 << CCI_REG_WIDTH_SHIFT) | (x))
> +#define CCI_REG16_LE(x)			((2 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
> +#define CCI_REG24_LE(x)			((3 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
> +#define CCI_REG32_LE(x)			((4 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
> +#define CCI_REG64_LE(x)			((8 << CCI_REG_WIDTH_SHIFT) | (x) | CCI_REG_LE)
>  
>  /**
>   * cci_read() - Read a value from a single CCI register

