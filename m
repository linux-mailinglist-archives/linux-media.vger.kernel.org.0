Return-Path: <linux-media+bounces-41343-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CBBB3BE80
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 16:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E3737C3E92
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 14:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB3F31DD85;
	Fri, 29 Aug 2025 14:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e4z6VSYX"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B66531E113
	for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 14:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756478937; cv=none; b=LT+/TDUFWg/hnlTvOM1OIvGoqFEOqXC22hHksfMkPEAPJfGaFYFsmzH3D7VP6giIuo3oqKTkm44JNJSeE9itTl7Kkjnl7eW2Z9LH3HNMn7dp28KE4m4fuSWtQmA/j3oKjl2FVJFSX1YHC8XgYd7VAhOQ0HTwHkNnCdiYveBao1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756478937; c=relaxed/simple;
	bh=CsD18tu5P7WQfloOUpSxyfIg62U3z7hMaTaP1C2gDeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K63ztd3TyzwWPghsgErYoJvF6qGWWDpRNztSZRBjULLyfiTfjAfTKG3WQ2zqEJb5AGQlHlOcrhJO0ml9ew2A3cUPJUAxak6IGXe79mnDHZ1TLhwAF+MpIzQVvaA8Rw0H4ZWYZFCEc1OHkOv40uLddktjNUeZf4vGIALD6dEQ+5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e4z6VSYX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756478935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nnGsl4AOGRvvfml4qlX/LzDM7rmdl9bciwEhBVReQKo=;
	b=e4z6VSYXZirT2KvcM2ImQnf9B6KjkshmYv+yVgIc2WCt0x37RdFxtmTP9oPtsfvBQnN/Ia
	d6sHjtpYFCkrBag23bbCq1/Hw04r4lGQZBrfHvfwVopke/LSRn/8b3iQLSo92w4cVg/xTY
	QQQ88rh/+Gbi5HaKE5aXx/ZeJDKhHa8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-DOvlQJljMzGfR8KJZFMh7Q-1; Fri, 29 Aug 2025 10:48:52 -0400
X-MC-Unique: DOvlQJljMzGfR8KJZFMh7Q-1
X-Mimecast-MFC-AGG-ID: DOvlQJljMzGfR8KJZFMh7Q_1756478931
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-afcb7a3a160so211386766b.2
        for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 07:48:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478931; x=1757083731;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nnGsl4AOGRvvfml4qlX/LzDM7rmdl9bciwEhBVReQKo=;
        b=jQSz4DQcBpPfl9iyQ/UE/ezi2Tn+EoTtbF1T/F3sxhaFvfjsirzmsg1LkIH3MoGqCK
         RcvFYQJVWsRk7d2D1o8XvT1AyuhsSN/ybWVfX1mq5m0RT6u/FJLIo0gfCDMevyx7k54l
         Vmz9WtzlerddDGYYkPxnaE9zy/1j84m9xliHO1B17jvHJ9gLaNV3sC1kA/yXd4SnwA3Z
         zO3QavloYEKImvsoq34LSa+WWvMPGIfy2StWrICV6o8TWIeUSQS1OfcDiLcK56PTt85U
         VcVL3ySZPcGv4DsxHWbLJznUaVQcbL5qBnOw4fFJ1d84UdEMqpMYF65ybjt+3Fqcgo4G
         OVjw==
X-Forwarded-Encrypted: i=1; AJvYcCVAcdpPilOZ01m+AdBIcwKWsgF6k1PPPYof424BnL/NaxQsDF6Q2NLOfdc+RF7DeTJB/oA/Y7pGxTSJ0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXynVb7HtJ7/gF0bYfFePiE3d1ZgvamFEWLOxXIF4e7tIMILRq
	J7k+USJNimK/2JWsg7kiH+gaIqUz6rbJbP4VFg/lDKvnlVoAPri3RRZZioBa4HVkrThMqY8iKA8
	pajzzVdIFEktXV/G8pwFnfkBDz5KKczViZ7/IwflylVxOLlTFkbbEV9HZfa77oIvE4IG9ufvp
X-Gm-Gg: ASbGncuFI1M4oj5xnKv5afn4Y8RL+xjlDQyILSN/JHZO3mw6K+GbecZTaSKsDf44FG6
	fUguuTeb5wbQWC3wmhs8kXwQWTuutGV/cgw3jiKdsZU4Uz7o0Dg1pLCPDUz0ZF1vwEKs/P3VLQ5
	b0mp4zTIiJ6MWNhwyc0wpi18JPkjg3TUodtyeEggQYs/sYodQeNCLjMFIUiz+pB5Bp+gsJaBwsq
	HH3Mv5Xof45X0P3XmCN1YwYizA6eey1Hn3Q+P2rJ7E9BnN0Mej9fMselMV8styFyPBiJTyuO1qq
	hdSkhAGd+GuhGhJ6xPT2BZKDqZPar/Bx+bovg0TBlWkuAm+DiUYTYBZ5j06nKK7YklLqMx5Gus8
	fjrfj/ntBF+7KgIoLO35n6IJYnUCMrFauWTSRAgMCzCG4v68pnX31yejSPBCN8hxK9eWHxgXUBK
	q1oTnbpU0YK/yZhUw=
X-Received: by 2002:a17:907:9629:b0:afe:e4d2:6d7f with SMTP id a640c23a62f3a-afee4e20b2dmr585225366b.60.1756478930980;
        Fri, 29 Aug 2025 07:48:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETh33XWvTOkdi7js02CACSoQl3q2yo0wnqnvAmvnOAT+xJyHnmkhoOSt+Xj0dJdxjSZw7Neg==
X-Received: by 2002:a17:907:9629:b0:afe:e4d2:6d7f with SMTP id a640c23a62f3a-afee4e20b2dmr585222466b.60.1756478930452;
        Fri, 29 Aug 2025 07:48:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aff15fccb15sm40202466b.98.2025.08.29.07.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 07:48:49 -0700 (PDT)
Message-ID: <5425d668-eee4-4910-b1b5-c5972042b0c9@redhat.com>
Date: Fri, 29 Aug 2025 16:48:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: ov08x40: Fix the horizontal flip control
To: Hao Yao <hao.yao@intel.com>, linux-media@vger.kernel.org
Cc: Jason Chen <jason.z.chen@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, arun.t@intel.com
References: <20250425043328.208804-1-hao.yao@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <20250425043328.208804-1-hao.yao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 25-Apr-25 6:33 AM, Hao Yao wrote:
> The datasheet of ov08x40 doesn't match the hardware behavior.
> 0x3821[2] == 1 is the original state and 0 the horizontal flip enabled.
> 
> Signed-off-by: Hao Yao <hao.yao@intel.com>

Thanks, patch looks good to me and I've successfully
tested this on a ThinkPad X1 Carbon Gen 12 & Gen 13
where the image indeed used to be mirrored.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Tested-by: Hans de Goede <hansg@kernel.org> # ThinkPad X1 Carbon Gen 12 & Gen 13

Regards,

Hans


> ---
>  drivers/media/i2c/ov08x40.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
> index cf0e41fc3071..17112c02408a 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -1627,7 +1627,7 @@ static int ov08x40_set_ctrl_hflip(struct ov08x40 *ov08x, u32 ctrl_val)
>  
>  	return ov08x40_write_reg(ov08x, OV08X40_REG_MIRROR,
>  				 OV08X40_REG_VALUE_08BIT,
> -				 ctrl_val ? val | BIT(2) : val & ~BIT(2));
> +				 ctrl_val ? val & ~BIT(2) : val | BIT(2));
>  }
>  
>  static int ov08x40_set_ctrl_vflip(struct ov08x40 *ov08x, u32 ctrl_val)


