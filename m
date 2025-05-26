Return-Path: <linux-media+bounces-33386-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B94A3AC4015
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 15:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 662CD18966AD
	for <lists+linux-media@lfdr.de>; Mon, 26 May 2025 13:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0957B202F8F;
	Mon, 26 May 2025 13:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KSrKYNp7"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39C1F9E8
	for <linux-media@vger.kernel.org>; Mon, 26 May 2025 13:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748265167; cv=none; b=PpMC9kZN1DpVGvvpktbny+IUjj273wdTKjZI+0dnp2OuTJ2peCgQ43lbChGF7Xm+wIXH4fbEfo0dXK7XlKZ4A/srQ3g6727lFntKhNBtmBWApW4YxfDMFfbILpv8vUbm5Cc0EdUBEa68odcDJR0kJ2/BfczpAbPSMcbEJ6n4lJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748265167; c=relaxed/simple;
	bh=vZhyA16i4QBSEsNG/mrzQfpgHB+jBlz4tGq06KsD/94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0NAcH+t4UlQGrobsQN+IynKeuyLqf+wPK+OiIRplKWVSxAHQFaGfo3I3KlVrOKVqlNXcq+9dcjQ8MpiC+eOmRpkJfCgudSzylUOZavpcMvh4qScYW1EduUdPCX9ixa15I/h5pobbG2qYb1EVYtyJmEmdmBFDlYK17IKVkHdghM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KSrKYNp7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748265163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LGsF0H7qCgK7/aWOj+Nk3etjewi4LnEg9nKOYPaMqno=;
	b=KSrKYNp7EilJdui/sGMacITXZj52v1J/evVB9CvHCqi8itrWugMjv3pPTU8O/qYfvKP4e1
	ppmzmatN6FOgUMkX3REHCUMgFHxocbCdPM/hUtZ6+Mci9mC6a5pjX2dkws59KqabL72ZQE
	bpKtQuPCwuIsgXCYyfZJe5n5OP4Gm3U=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-tgGLENOpPUSr5xjm3p2H_g-1; Mon, 26 May 2025 09:12:41 -0400
X-MC-Unique: tgGLENOpPUSr5xjm3p2H_g-1
X-Mimecast-MFC-AGG-ID: tgGLENOpPUSr5xjm3p2H_g_1748265161
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ad53aaae592so224306866b.0
        for <linux-media@vger.kernel.org>; Mon, 26 May 2025 06:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748265161; x=1748869961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LGsF0H7qCgK7/aWOj+Nk3etjewi4LnEg9nKOYPaMqno=;
        b=r/WvHruusL86PlDsECUJDyY9Ds7jxbdp7jEegQXSxW6zJ/GP0j0DHQecNpFl0G2pob
         Q08xgn5yjDnaJ6jBgUUSA4XYttMmGA2SxkXXyKdMAXD1VFwrUNlvdG2/a3G5A8SEZxyO
         +FXgeCDMQ/Td56jxks98giIh/HpSlmiRdUMf/j6gC1sH5N3oyzT+B+zMNaGGj8B9vyYh
         ADJjeMLVO9LpPYYJQpDJQqzfzIsicMa3+CJxW+SBMLau2NyAqOdb8Xr0x9fFiKIgq6ho
         t6y4rhq7+f5rMn2GQLSZ4Zf1YnWswakKCV+KeGz28QDyp7dfk9NSZkPN8Ul3OlDNNG9a
         RyDg==
X-Gm-Message-State: AOJu0YyD0TJgIWvXNC5FvA7NeMTF4fgdeQBPO89ckVmSWRYRAgV5soQv
	ep9NLx7IMzxp99Dr4mtPaWDPbxPoVRZY52sfJn24KNJnHJOW59z7QN3HI3TqpJsd+BDSQ8nr3y2
	ds2alsSnkNUDA8fXIC9VRNvG5DQ7dZLDg0yNxNZDCiRujS7xmCX7zZgppK2e/xrij
X-Gm-Gg: ASbGncspifZQoNfGMPffOL5ZzXb/G/vIX2R1cct8pDhmbTA9n8A7MsrGmDdrkpmlweD
	s0e6cNh2Gi1AHztdQNKJ9HqkmPw5/vRQnjaMCAw5qrjsqjHvcAPlX+Lgd+XDfsHSz24NipETL51
	ynte70Sbz1Hrll7K9YAkWCsoiC90v22KkZ8Y8Eq4wkuJlguTmAcNOHoJvLyKMVNXllwP52eWHue
	HTBVbkWRALgAoX6hGbbyi2Wt3cQVfQE45ftsaITQ6VYCFbc5rQJ6d2HRbu2mbztC0lKUzgH/SLL
	dnL+8GH+o9F/BWQ=
X-Received: by 2002:a17:907:e98a:b0:ad5:3a7b:de91 with SMTP id a640c23a62f3a-ad85b1bfa4amr972804166b.27.1748265160514;
        Mon, 26 May 2025 06:12:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8QvnLtVJhSpJ26PCw53K12teQU0kcApIkCEK6+L/O1mhz5DN4sVNTnhfSEoC9TKB9oRBNBA==
X-Received: by 2002:a17:907:e98a:b0:ad5:3a7b:de91 with SMTP id a640c23a62f3a-ad85b1bfa4amr972799866b.27.1748265160087;
        Mon, 26 May 2025 06:12:40 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b059sm1702170766b.10.2025.05.26.06.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 06:12:39 -0700 (PDT)
Message-ID: <f3454fcc-ec8c-4735-8188-9f44fffa6df8@redhat.com>
Date: Mon, 26 May 2025 15:12:39 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] media: Documentation: Add note about UVCH length
 field
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250404-uvc-meta-v5-0-f79974fc2d20@chromium.org>
 <20250404-uvc-meta-v5-2-f79974fc2d20@chromium.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250404-uvc-meta-v5-2-f79974fc2d20@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4-Apr-25 08:37, Ricardo Ribalda wrote:
> The documentation currently describes the UVC length field as the "length
> of the rest of the block", which can be misleading. The driver limits the
> data copied to a maximum of 12 bytes.
> 
> This change adds a clarifying sentence to the documentation to make this
> restriction explicit.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
>  Documentation/userspace-api/media/v4l/metafmt-uvc.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> index 784346d14bbdbf28348262084d5b0646d30bd1da..42599875331c0066cf529153caccb731148023b9 100644
> --- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> +++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
> @@ -44,7 +44,9 @@ Each individual block contains the following fields:
>          them
>      * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
>      * - __u8 length;
> -      - length of the rest of the block, including this field
> +      - length of the rest of the block, including this field. Please note that
> +        regardless of the this value, for V4L2_META_FMT_UVC the kernel will
> +        never copy more than 2-12 bytes.
>      * - __u8 flags;
>        - Flags, indicating presence of other standard UVC fields
>      * - __u8 buf[];
> 


