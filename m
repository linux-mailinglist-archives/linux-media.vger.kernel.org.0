Return-Path: <linux-media+bounces-45795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD442C14470
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 12:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 064BC5805C2
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 10:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C611A3090EA;
	Tue, 28 Oct 2025 10:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GoX60KGy"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1A13090EB
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 10:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761649077; cv=none; b=cSReEAM+AyJH9TbbLWPMdWxrfPrdNUAEY7SG2FiNL+b/W2f4hbWTwvgBoDIeeckelYMW9SlBjAIOenn+bTYr7V4Kc3LZwTy5/u2CroYxm+xTKwRVC4p6++kvGMO8LV/FXJ5tgoGL81GkPorXhyRo/fqbl//4DqNq8qeAS7XPFG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761649077; c=relaxed/simple;
	bh=dhQt0bKJ9jTDhVK4Se77dIyzwulKfyFM8IP6do1bd2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tsUbiCptSBt9eQV5qDH4hd1IkncRSYa1L/woZ/91P+oz6TVCPy7aheKyRQUzjgrl30Kq3+RX9YwmgihXapPG7R6AbC7JEjmXY07QE8cx9P8usM7mm6aID6mtFHuwyll4z7r9uggWdZKwTUk22LzngVt17O55H9pbtUqlfz/QdiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GoX60KGy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761649073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ss7g9OPGrAkY9kUcGCclPiLcw52MVKuR0CuNg2oTpdY=;
	b=GoX60KGyBU7TaI352OE0Ic9ZAlHFkRFOugnC/z/ujAlg5NvjtAiSj88+61XRw1nuXR+yGB
	T/68B741Q7uOr0fjluU/s+fmHlKCRgGl0S5Zhsx7lwvrDUjbOVy3jV2kFL16qHcBr03flA
	BylgLV1b4MzMPmzKFSs2jZx8sGOyO1g=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-ARf2IflnO_W8E3CTOdAHew-1; Tue, 28 Oct 2025 06:57:52 -0400
X-MC-Unique: ARf2IflnO_W8E3CTOdAHew-1
X-Mimecast-MFC-AGG-ID: ARf2IflnO_W8E3CTOdAHew_1761649071
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-475ddd57999so26716065e9.1
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 03:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761649071; x=1762253871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ss7g9OPGrAkY9kUcGCclPiLcw52MVKuR0CuNg2oTpdY=;
        b=DcK6qjEzGgVbAR4ppQc4Q5aJ27tIPnbqYTH6ovu17ANO+RSFw6rLipHOLbxlKCgs46
         6V8tWX0pOZIrLlbTzCQ23ZJrm8bdJsTL3eWkb/H4KSaVPI7OCiwrTZPsgg4Qo3aBU9wv
         5Rkn38VxmvSOmQ4iYu8GARdgF72XjXJD4jeMu/ECzjPF43KHXdhvnihOlTgf8VOe3U+s
         ZglZOVO0morqRAJksRWWu2TyzpGf03YVOwtMNLVPf6pZ3vmetnA53IPIL7943dS4kLOW
         dcZE5U+CDwWkULlSpZTEd+3ztWWE26vQDTo+PoNh8xdkuDdNOIFwCj+zY0oer/t7pCj3
         kokA==
X-Forwarded-Encrypted: i=1; AJvYcCWPafCLIa34Ua6DAX3D7KHyB4hV5pX+4OtXS3izvA6G1yj9NaW8eKH5P+yalrqGlUFIXg+GL5wFs6lHUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlBadT4dYxhU/Kozyz6u5xIRO5kmhOhMRNK4ffcVP2spoVu/Af
	mt8KYAQ551mZ3uo3xw7v1SCwCytTqxBA2ND3BdlE1yKbnW7aW3rMo7Wmi1tALsaXHauVAA/jkAu
	vdXP53CRYShSJjgyvf/63M9MHCCIRMereh2iZteteo1I/eYL/5uBvsGXOPirglmQ3
X-Gm-Gg: ASbGncvDlfJnX3gdSztMfyMwJUYUucA8+ygt64Mp13tzrCZPRN/fzKJmDpBOOGVWSpm
	+IvOKizbJ7tirstH+nbxhWZtRmbT+2Y7pK6Rb+ipweWMd3EfopY5uxYq7YkzVQWYDTf3MDTYmMK
	ZcRPAV3vPSWDwx8H2AkV4V3DvZbdFdcElTkUSCjI6z8r9zQDnTHnZShdCNp7u7WquslK4agYQ+T
	ASPy7+/s+gEoyGcKRwYEWUt5l57tHHTdWzEanSJ0EmwrVgyVHe3S1QX03SBST7tpk+PF+XKqW97
	PhpxwAZWR+qybY42JtvWmW464GtdQOWkWo9ZmHsgvwsZl+Yk3Nv7zmuyz+I/zx54gnMYKQoXYg4
	4/Iwbin35On206LbQBe5f/Wjf78L629YAmSVFuWZdTM5PwO0=
X-Received: by 2002:a05:600c:34c7:b0:475:e067:f23d with SMTP id 5b1f17b1804b1-47717e30340mr24822345e9.25.1761649071059;
        Tue, 28 Oct 2025 03:57:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErU20c2eSasDdwQZzdlRNWvVKDbbva3lmpIExHrHtMT8SPwj/9JiHFRH8lMSjet+8CB83SCA==
X-Received: by 2002:a05:600c:34c7:b0:475:e067:f23d with SMTP id 5b1f17b1804b1-47717e30340mr24821915e9.25.1761649070539;
        Tue, 28 Oct 2025 03:57:50 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd47853csm191118005e9.13.2025.10.28.03.57.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 03:57:50 -0700 (PDT)
Message-ID: <05efdc9a-8704-476e-8179-1a9fc0ada749@redhat.com>
Date: Tue, 28 Oct 2025 11:57:47 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 2/6] net: ti: icssg-prueth: Add XSK pool
 helpers
To: Meghana Malladi <m-malladi@ti.com>, horms@kernel.org,
 namcao@linutronix.de, vadim.fedorenko@linux.dev, jacob.e.keller@intel.com,
 christian.koenig@amd.com, sumit.semwal@linaro.org, sdf@fomichev.me,
 john.fastabend@gmail.com, hawk@kernel.org, daniel@iogearbox.net,
 ast@kernel.org, kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 andrew+netdev@lunn.ch
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>,
 danishanwar@ti.com
References: <20251023093927.1878411-1-m-malladi@ti.com>
 <20251023093927.1878411-3-m-malladi@ti.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251023093927.1878411-3-m-malladi@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/23/25 11:39 AM, Meghana Malladi wrote:
> @@ -1200,6 +1218,109 @@ static int emac_xdp_setup(struct prueth_emac *emac, struct netdev_bpf *bpf)
>  	return 0;
>  }
>  
> +static int prueth_xsk_pool_enable(struct prueth_emac *emac,
> +				  struct xsk_buff_pool *pool, u16 queue_id)
> +{
> +	struct prueth_rx_chn *rx_chn = &emac->rx_chns;
> +	u32 frame_size;
> +	int ret;
> +
> +	if (queue_id >= PRUETH_MAX_RX_FLOWS ||
> +	    queue_id >= emac->tx_ch_num) {
> +		netdev_err(emac->ndev, "Invalid XSK queue ID %d\n", queue_id);
> +		return -EINVAL;
> +	}
> +
> +	frame_size = xsk_pool_get_rx_frame_size(pool);
> +	if (frame_size < PRUETH_MAX_PKT_SIZE)
> +		return -EOPNOTSUPP;
> +
> +	ret = xsk_pool_dma_map(pool, rx_chn->dma_dev, PRUETH_RX_DMA_ATTR);
> +	if (ret) {
> +		netdev_err(emac->ndev, "Failed to map XSK pool: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (netif_running(emac->ndev)) {
> +		/* stop packets from wire for graceful teardown */
> +		ret = icssg_set_port_state(emac, ICSSG_EMAC_PORT_DISABLE);
> +		if (ret)
> +			return ret;
> +		prueth_destroy_rxq(emac);
> +	}
> +
> +	emac->xsk_qid = queue_id;
> +	prueth_set_xsk_pool(emac, queue_id);
> +
> +	if (netif_running(emac->ndev)) {
> +		ret = prueth_create_rxq(emac);

It looks like this falls short of Jakub's request on v2:

https://lore.kernel.org/netdev/20250903174847.5d8d1c9f@kernel.org/

about not freeing the rx queue for reconfig.

I think you should:
- stop the H/W from processing incoming packets,
- spool all the pending packets
- attach/detach the xsk_pool
- refill the ring
- re-enable the H/W

/P


