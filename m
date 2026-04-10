Return-Path: <linux-media+bounces-58545-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E+2Jcjp2GnjjggAu9opvQ
	(envelope-from <linux-media+bounces-58545-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 14:15:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A943D691F
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 14:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D3205302612F
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 12:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90EFC3BE627;
	Fri, 10 Apr 2026 12:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TwbgcJrm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859F13BD624
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 12:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775823298; cv=pass; b=qy3VYKj3KxVf3aaFgT72xagnfRRqBBMmWVLdxflLbtcUI+ZRJ/x5QYv9BT1KUR6zFXj7luhD6PiQ7xJR9einnpjVWk2lBFMSxviOb2xdn8gfghjsVdh8/LdweWwxxYJW8II3QS/TQ2BU5bQb+1Kw2+RvEPzJpfSEnlR5MJ5ld9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775823298; c=relaxed/simple;
	bh=HZs2dOQHfZyros26cAcHpBbRttnvDk74t3XJQ4JrVHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LbEWB9Emr+adFQ5nf+E9Pi+2e4+4p0lSsEpSqRaDp7v1vmrT+qI5WKEmxLcCKhwAwXnXhZI7rLkpKXRvWjE8WD/p/VnY8T7DEQVwzED/Zj8ceZUtKmCo73VCUSEjHBxRhdNqgEa3dN/O8vUTUKF46M3eoFcbj/vj21HaSWkWCkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TwbgcJrm; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8f97c626aaso321134166b.2
        for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 05:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775823295; cv=none;
        d=google.com; s=arc-20240605;
        b=CBGa+B5BHCLveZZMCLqSCQgD9dF/GG3qQe27ND5XpK6fGshF9JGwycoW4Y3dxhVpYp
         Vigl7vzVXGKIOoG/c8OpbYsOMw4NwzrtZCd8mu41zWYIRCwfcDK7aB5wfyVH4XKd9RKC
         097rZld4yVu7c2IsJHUgQdV2r3Fv1E1G19iz9+vqIxeMbm4I3nNfiMfYQ8JHyq81qs2s
         YWFYV1Lz3YnEv3BHTHP2p7ygGv2dfa5ptv6OzjOa1ZrxH0O2MjG13BUZtkrW+jiu7E/k
         BcYQmKz24sTjYxFmLhbqzK9M0DUcAKG3eFqtFwA3wRI36/pVIbYOBTUuEme9sSuzB8/k
         MqFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7jIY/1++oar4yAYBTP2iQ0v5rOvIuL4pDsKGubLCfjE=;
        fh=4jDrml3Z8CfwnEBCMgqZkdJhF43zalJj1n/8zyAIdwA=;
        b=bZHSMqDgpPWSdkgw+WWfBL9PNofbg6Lcfpj6ZH28d2sKKiXDodE4MtLIQOuYJxQjIc
         /QzlgGjUaEHDoFomWGjiGIzQuAEhYfE3exPFaHK+TI4hmNAQ8Jc8MrZKsw4xKenabhZf
         O8LdXdSK68B1hQrTfPxeinWzY77Kg/JBK7tJUhQWJ201oE6p9UXd2e1Cs7TXFcyLKycf
         VM6XUOUN/6HqEzfudQC0NdmxdKkoIdcqXoYm995skUvD9CgmGpxaQAldzg/aa8JODBad
         SYyJf22Q5Ia2Bml1OUqWLU9A7fPXJbfGrqyL4yEqrm4aWQEDkC8iberRYT2a5w3UIQTD
         CWbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775823295; x=1776428095; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7jIY/1++oar4yAYBTP2iQ0v5rOvIuL4pDsKGubLCfjE=;
        b=TwbgcJrmtjZ97OOVgnM7Kgqu+dAdBJ4VJsqm6JJ9T84sS7V1T4MoYGXSr8ex2D6Ae5
         kEbt7hb2Gbvc7ftCA7M82mlA7COLSc1cY2RkPM/2x+roceDeegj9W0oJGSulmCw6r/M4
         ZdPzoZsvrL8Um4QGHwj2CUqq+5Y06AXNRW3K5q0qfQ6oxK1rVUM+nz9sj1hZj2PGRMxf
         rZvwZHLMUXkSflLKMrJB/4OdMLkwGnFQ2j72hYGLffq79CpvgQnejcmCcDtrgYzG324n
         lRSNM3PeLG98wYq1t8ZJ3k0f37A9ie2VNM70yB8st6fMi2vsGhYwUcXrIdzrTksGqkZ2
         AGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775823295; x=1776428095;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jIY/1++oar4yAYBTP2iQ0v5rOvIuL4pDsKGubLCfjE=;
        b=Tn+7VGvUqaJIHe1RwrUQl8BOTBTxpEXVKkOVKmXlbiFGJPAbvJXntO6oElfkAHFnY6
         odiM7R0M/Z95bDyf/4wRp/p80cbxRxjYg7yx4YmslrBUPzG832fd6j4E4rOObRC8sm3q
         fNCH9Evk65dHQSbFLi4osRMgPZjc3X3tsDhSiZ+qwiejzxE3V3jrOu1+LMcB6AVJrRR1
         aSehb7ibuTtatREhhXBvDHSDnt4mNO1SsbbOsrpzYUPNOOiT/wN7T4REPw5sHLXshQQV
         CnsPnznVcJhKgy3DcMaI6gl0QKG7V7xuxztmiS07Y+4ryB4CUip9vIk/Emfgd+PJ6N0i
         ZJJg==
X-Forwarded-Encrypted: i=1; AJvYcCW1+CmQpqxqPns434tMAti5/nlCMe29jTVPPAp+CkrKbA9CptBG29Hn1L3rnwuA5ixly5b1DYEKgUzqWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2hoTkYlmVM0vuu8iZ2K6aBY1gAZZXpIVNlz8rA1qIFo4QIE1V
	4alO+QnEd4MXfrTtkkbXwH1TpONwV8ZZk10vW9auDSPZwcOagn6HhGOw6o7bbuSnAntHOVx545P
	ST/HNNXlg748Ok4tyJ703WcwxNAu1lyf3llNl5OqJGQ==
X-Gm-Gg: AeBDiesXmEokcsW4i/r2VQNtY10+7d7NvvqORFbF0+TA7e8UQkQns5jzi3jy0S4U2xa
	gZdXvWe2Y0/KuIo2RRULrC8mlMvENP3RqTNPBGvQHw85cC0XYzRGmURyCl9NlI/GkMbAJOGoXmU
	3NC1KdO1KvDj3Oc6ZZ/XJnZMVOZvN53Gou9IS3Xq3NSUzLETQYF42jdqWOAAe5FkYaL42lhrHWa
	uJjwcK2ZY71EzmmUDhnZrMIrax3qNM8Ld7Nzjsqma8o9KhfHKf+TjHdDjqsAFCBZrDQGc9NQqJ7
	8jtcKCt3DzYgq+1kWmu5EOWk76AOjHwBZZ7s818=
X-Received: by 2002:a17:907:e102:b0:b83:95c8:15d0 with SMTP id
 a640c23a62f3a-b9d7279bb78mr130310166b.52.1775823294707; Fri, 10 Apr 2026
 05:14:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407092617.635223-1-jiri@resnulli.us>
In-Reply-To: <20260407092617.635223-1-jiri@resnulli.us>
From: Sumit Semwal <sumit.semwal@linaro.org>
Date: Fri, 10 Apr 2026 17:44:43 +0530
X-Gm-Features: AQROBzADFveULcyZjtNgjI9rBi4aeeX0JzC3AEXYi9kt8DQW2Z9q1-iXZwCoelw
Message-ID: <CAO_48GFt21rv0PJd2Csa0O4OEpN053_p__4Zux+m7jQdHSagEg@mail.gmail.com>
Subject: Re: [PATCH v2] dma-buf: heaps: system: document system_cc_shared heap
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	tjmercier@google.com, christian.koenig@amd.com, m.szyprowski@samsung.com, 
	robin.murphy@arm.com, jgg@ziepe.ca, leon@kernel.org, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.semwal@linaro.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58545-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+]
X-Rspamd-Queue-Id: 51A943D691F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Jiri,

On Tue, 7 Apr 2026 at 14:56, Jiri Pirko <jiri@resnulli.us> wrote:
>
> From: Jiri Pirko <jiri@nvidia.com>
>
> Document the system_cc_shared dma-buf heap that was introduced
> recently. Describe its purpose, availability conditions and
> relation to confidential computing VMs.
>
> Signed-off-by: Jiri Pirko <jiri@nvidia.com>
> Reviewed-by: T.J.Mercier <tjmercier@google.com>

Thank you for the patch!

Marek: Since you're taking the dependent patches through your tree,
could you please use:
Acked-by: Sumit Semwal <sumit.semwal@linaro.org>

and take this as well?

Thanks and Best regards,
Sumit.
> ---
>  Documentation/userspace-api/dma-buf-heaps.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/userspace-api/dma-buf-heaps.rst b/Documentation/userspace-api/dma-buf-heaps.rst
> index 05445c83b79a..f56b743cdb36 100644
> --- a/Documentation/userspace-api/dma-buf-heaps.rst
> +++ b/Documentation/userspace-api/dma-buf-heaps.rst
> @@ -16,6 +16,13 @@ following heaps:
>
>   - The ``system`` heap allocates virtually contiguous, cacheable, buffers.
>
> + - The ``system_cc_shared`` heap allocates virtually contiguous, cacheable,
> +   buffers using shared (decrypted) memory. It is only present on
> +   confidential computing (CoCo) VMs where memory encryption is active
> +   (e.g., AMD SEV, Intel TDX). The allocated pages have the encryption
> +   bit cleared, making them accessible for device DMA without TDISP
> +   support. On non-CoCo VM configurations, this heap is not registered.
> +
>   - The ``default_cma_region`` heap allocates physically contiguous,
>     cacheable, buffers. Only present if a CMA region is present. Such a
>     region is usually created either through the kernel commandline
> --
> 2.51.1
>

