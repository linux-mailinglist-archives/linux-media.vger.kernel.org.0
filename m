Return-Path: <linux-media+bounces-56878-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4FmED0GLwmkLewQAu9opvQ
	(envelope-from <linux-media+bounces-56878-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 14:01:53 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FE4308D28
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 14:01:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 579923072D2B
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 12:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4313F3845B5;
	Tue, 24 Mar 2026 12:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="nDf3O5yp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9EE3CD8DF
	for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 12:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357094; cv=none; b=Y/qqhicp4It9mS9N3t08LED8YdMux6ntq8HPsW6qY20c6O0YWGRE9JPPhVKXzvL9U+cYjZ1C7JGVAIH6n1jt/pnifMLIFSCnQOrWz44pc68i1Vur0Q0FkCuW5crZUaej1tPrC13qVzDsruhB/RkVnkHdByZDUR/0GKq7m+Cednw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357094; c=relaxed/simple;
	bh=UekqH47k2cwGT4dCv4/f1JuxckWHtyDjuoLAl39hWmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjBri2DdC1xsRfEkFNLPz4MJGvbnfNt1mJA1qNPUYoeLQEYBICZ2CHjFjnNJyJWuv3g/mNizS/vwF/rxynF+dwdSvQ9oc8nUI/AlgqNQMUXyuSC81C28oaQlJYC1YpWMGTAerPMWBW4FIUktPyHueDaSHJ8ech3sLrix7plRgr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=nDf3O5yp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486fb439299so43856625e9.0
        for <linux-media@vger.kernel.org>; Tue, 24 Mar 2026 05:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1774357091; x=1774961891; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EJ9KhFxElQQZSu9ghWXCoeiyYOoUrbSYY15jZoKWOCg=;
        b=nDf3O5yplVSYDgDFCrX8iclV0i1ndvta4eMRLHyWcQ2dghK0oOcMDtr56lgcQq0CP+
         x7Leiv4OvgZu5g0TEOXRzX0/Hkf99pbImMie3+2ZSlxzb2OgDHb/souKhTBEi+yGteby
         LfXtZbZF5gkraKYOwCWMP0xbgRtWtcI1yrLOahq2NufnHBZwJRvm0DdlGOW25TOh2sep
         DLHYCOHwsD+Hfhhi1M0v/rh/amxBbnZzoaZQU5cqFNW9G/XlA4Ne+2UdGKrr9QP6hqPX
         mobMD6WwZtd08BwKdVut3sE0QTAmazcZoGwml8lN1anYXAsulrkdPHDeXPo1/Vc8ANnq
         8iCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357091; x=1774961891;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ9KhFxElQQZSu9ghWXCoeiyYOoUrbSYY15jZoKWOCg=;
        b=KuHra3thif7mNNcGgIUGz5PoPXNKRbOoj0tktKsCpsJbB2oGDIy/JHf2Fp5FH/ovoh
         ajy9X9TcyzqWkKUQjcruQXKapScGzcL2g/lHEl4NPgcWOLACGKyv94pvbJlou3fZUVvX
         Hj8dXf1wyYoA/rX80uEvISXOr0nYAZVLsw0MVBNqeilJC4tiEFbc19N2dIjnMR94u00+
         nN9h2o8k2D0HR6LLR2RPf2LcTTs6eOKmO6rFIz4yul0QA6Po9ntf0KZgZJ3PfyPDjhaO
         JnpYwLuPMUDdCVdBSNJftUSETTvRMLEwBc9Utqcr7cJr9+vj2FzTQK3i1gRy7BSb6roM
         M/MQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBz/adg4k9nmdtmUVZj/aa/zy5MUXnx36or57idsPIlULiQ8aJXJOxnwFBN0QBLYhmqmh3djH2vn1oFA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yway7cdU3TRUuj/TizwZ6ySlbru3KTJHmQlZi89m9IsH6roKQmi
	j976aGsNMTwDZ4BqC05dQOftaSAFU2hKmF9ZCyGJGA0Q4Ezg5axko35KXimHmCxGkjs=
X-Gm-Gg: ATEYQzyh8CeQUQcI7MZOkdJ0eCzqWQtRbgRJhQ9sBhSJ14rwhc6YsCNfkYJv5i0I6jD
	ZNunwPzV5+RXzp63Z1L8gAdfdliU5jDNyjhxpObnVxFdkBZ3WLMVgRCXDS9fxPxDZGZlE+A197P
	13nSSX2LgHQx/4R9ffno5yemNquzgjlUUWRWtp6oOlG36eWVA+/Lf63TRle3FGggIZwZSrbSqhX
	WG3QgXOSIpX8K9K3c48oGtJIOTpborFX4FI3LiXvTjgewCoOP7P1XA/ChV8XVJ+UBgFMkLbvF2V
	mVXx6GuQvvKgMZaFdW0Y9TuEfofNol9hIV52NsP0cXnZ/U4Zw6fBDOVsqNtb+pwt2FyKBzyVUsC
	pHABRHN51w+qXkCS/oPcIbXkdEC2ztN8PsK6qULOR+WrjM363JV9s+1DyBzDXUmSimmCB95cNEP
	HJFYmOoDVPDtTw6tuUDpw6qOj36pFKiUInYkY=
X-Received: by 2002:a05:600c:3b07:b0:47e:e2eb:bc22 with SMTP id 5b1f17b1804b1-486febb59acmr211442975e9.5.1774357091334;
        Tue, 24 Mar 2026 05:58:11 -0700 (PDT)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871109e659sm17440195e9.23.2026.03.24.05.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 05:58:10 -0700 (PDT)
Date: Tue, 24 Mar 2026 13:58:07 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	christian.koenig@amd.com, m.szyprowski@samsung.com, robin.murphy@arm.com, jgg@ziepe.ca, 
	leon@kernel.org, sean.anderson@linux.dev, ptesarik@suse.com, 
	catalin.marinas@arm.com, aneesh.kumar@kernel.org, suzuki.poulose@arm.com, 
	steven.price@arm.com, thomas.lendacky@amd.com, john.allen@amd.com, 
	ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, linux-coco@lists.linux.dev
Subject: Re: [PATCH v4 2/2] dma-buf: heaps: system: add system_cc_decrypted
 heap for explicitly decrypted memory
Message-ID: <vflgbxlfg4pzj3yrnkz7g5dwncnod6uenwpwgs5z2qflbrjucv@coqj6fmjkyye>
References: <20260316125857.617836-1-jiri@resnulli.us>
 <20260316125857.617836-3-jiri@resnulli.us>
 <CABdmKX0Ux2HMTTuOnvZryBBRwCjH0zUe-EMvL9k1VxZtz+BWiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABdmKX0Ux2HMTTuOnvZryBBRwCjH0zUe-EMvL9k1VxZtz+BWiA@mail.gmail.com>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[resnulli.us];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56878-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[resnulli-us.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ti.com:email,resnulli.us:email,resnulli-us.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 28FE4308D28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Tue, Mar 24, 2026 at 12:25:46AM +0100, tjmercier@google.com wrote:
>On Mon, Mar 16, 2026 at 5:59 AM Jiri Pirko <jiri@resnulli.us> wrote:

[..]


>> --- a/drivers/dma-buf/heaps/system_heap.c
>> +++ b/drivers/dma-buf/heaps/system_heap.c
>> @@ -10,17 +10,25 @@
>>   *     Andrew F. Davis <afd@ti.com>
>>   */
>>
>> +#include <linux/cc_platform.h>
>>  #include <linux/dma-buf.h>
>>  #include <linux/dma-mapping.h>
>>  #include <linux/dma-heap.h>
>>  #include <linux/err.h>
>>  #include <linux/highmem.h>
>> +#include <linux/mem_encrypt.h>
>>  #include <linux/mm.h>
>> +#include <linux/set_memory.h>
>>  #include <linux/module.h>
>> +#include <linux/pgtable.h>
>>  #include <linux/scatterlist.h>
>>  #include <linux/slab.h>
>>  #include <linux/vmalloc.h>
>>
>> +struct system_heap_priv {
>> +       bool decrypted;
>> +};
>
>Hi Jiri,
>
>I wonder if it'd better to call this cc_decrypted (or I guess
>cc_shared based on Robin's comment in the previous patch) like the DMA
>attr? There's a separate effort for "restricted" heaps with TEE for
>(encrypted) video playback, which doesn't involve VMs or RDMA. I think
>the cc_ prefix might help avoid any confusion between the usecase here
>and restricted heaps.

Sure. I'll rename this.

Thanks!

[..]

