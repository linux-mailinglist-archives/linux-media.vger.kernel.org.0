Return-Path: <linux-media+bounces-51242-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOwAHhndcGnCaQAAu9opvQ
	(envelope-from <linux-media+bounces-51242-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:05:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9BE581EE
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 15:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 248C66C44E7
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 13:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBA748BD28;
	Wed, 21 Jan 2026 13:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="f2ykpi5x"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B563F47A0A4
	for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 13:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003237; cv=none; b=vEW1QyEHoPRjgbPb+NWpyHj+tSd5GCw9UpmSd/q4rUrclyR4H6W1iNt+OmWc7a9o1ro2XoMI4S1iyUnGpaKZZN2o0WWek++xIzJXItd+dImCFZ+wZtl6l6BHahauysFf6atgc+GExRIXPmObBdlflrBpRFUMdW1N1aq+GRA/Bbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003237; c=relaxed/simple;
	bh=fn6QDJCmTOKiiaWIAjab6bH+PZ+yr8u3rj/vi81/cYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpSc6w0pqoWgSDgdzfRI9r/+axHnyZKETDjxt23ox9i4q/v90KpP93ocv1FS6cIZjJCwe49XtDOqEJ7E/NaVLMo6hzN2KDrCddYxvwz6assaUwsNDo/0qTwwbhj2O3GGzQ13NHVb9W20/1U+ymjVXvdAQCEXQpjUvK4YGUPdmQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=f2ykpi5x; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8c5320536bfso700167185a.1
        for <linux-media@vger.kernel.org>; Wed, 21 Jan 2026 05:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1769003233; x=1769608033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yPFd5kAX+x+JPapHwkry8xE9pec/AtWEm0UrVlklyxQ=;
        b=f2ykpi5xV4AqsGPe+t+9MtvUDmlEc1u0/PQj3lUfq4aU/Hwo77wnVtB1eJvqw+N7FN
         xzw4bLrstDOy/0REMCSD0ORUqKGqxYQKiKStbNKYxQNp2WZZQkyzz0itbawmRWbgL2H1
         skBwVkp2ffpngECJUXLObAycSsyoKYUXeuUlgvqOQ1kg+zZsoWSmce3o9BISVyx04BtZ
         AgQZ9HkSHxdLKj+2xGZJkeR2PiUR2+ajp8gLKlIvaoCY6LIqMmkKw5ciDOnVgL0oTANR
         9ooarnFP/DPmR+r04BE9llj8PqxyLSQ2rKlR55DLPAonR+3okKBsSxwo0aSyKEbn36/H
         Me+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769003233; x=1769608033;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPFd5kAX+x+JPapHwkry8xE9pec/AtWEm0UrVlklyxQ=;
        b=nM48LtzPwuQPsLmFqSwsKDYB1fuZd31xSyE4zV4NGbZHAgZCyTDLKt53pwwBZnOgye
         EfZ6gXxaNNFL3fAOrkf/DJX8w3vLQpM0N/Rdq0LP9eUhIfKK8508MyZmxSU903/Mq7jr
         DKndWAvdGJqPc4sOsIDv0SBv/pvfZqopALSSy6HwyHOy//xq6MKkK/dWjFhha7ezD7Yo
         1yQ40FfuOXSl2/n5mpzG//kV8PbiBsZfyn9BYNHgPB8ANkwu2M9U1Q5AbeW8rr1btjGF
         aCRFQ3mDNUWoA9BsD/2i9PpUuAhBOLR1EucqsTOkZ9Z96TqxSjMsVc/Nkmqoa9qEXUP5
         VMQg==
X-Forwarded-Encrypted: i=1; AJvYcCUjYryl3RZwpu6MbdCvD6X0zndtEQhtarzamRx4NoxY74C6EDCe41BhW0Inj/x7IsTtamcep1mHYPk0dA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdhSqwh3kJIwJvmA01iIlAJKzOmjnCt5YgxGRPq2NQT+CH8aQH
	VaVWna5W/Hazr6eUvSyKdbeROfwuoNkaXZAtgxrkMRSRoTpx1EVjf0soc7SC9FSM/g4=
X-Gm-Gg: AZuq6aJuWiKRKjCxBVPjKFUDum1ZMDpEmdJjAw0buCRRnN4FlYZB7MMMB5QPOKWdUNM
	TBQ5xhrnXpLwUgMvtth5bSPV5I/Nah9yRUOtGqBtsX0SJY/C2cmLgqg21iDRm83h740itekCsrb
	R8R3u9pe8REeEf8+gqgc/cpsAzne/El0RtqO/DLqXyOJd4XUFZws2YJmBE2nBu8uemAF0ARx6p+
	2WxSu2JrqQqVRq3q7E/yqkIhJ7H1VthjfVbIkiPoiqsjIut3/tbHbdwQKWv/zR/h98YHNiG7RYz
	zssM/SQM28z2JX8g5xNPaOrn825C3c3SEb7yvtzkErhQVE7oGIJyvm4cJf6BtjWj/QwFLXfxfRT
	aJwPWe14S0X5cG2PnWZtPRgO/KIQJo6Z5rG6xfg1SUo76SCahR5z38i6qjgerh0e6GKTWg92ica
	uHg+MtkMcWiL8QEeXMKw0YggljA2rE9d1tOxjafF2WtFEz+tJjoplIm8IHuDlM2AqQaqyWSXmpc
	Ahzww==
X-Received: by 2002:a05:620a:4003:b0:8b2:f090:b167 with SMTP id af79cd13be357-8c6ccdbf81fmr639187685a.24.1769003233554;
        Wed, 21 Jan 2026 05:47:13 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ab288sm1307247385a.6.2026.01.21.05.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 05:47:12 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1viYYC-00000006Dum-1GTZ;
	Wed, 21 Jan 2026 09:47:12 -0400
Date: Wed, 21 Jan 2026 09:47:12 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Felix Kuehling <Felix.Kuehling@amd.com>,
	Alex Williamson <alex@shazbot.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
	intel-xe@lists.freedesktop.org, linux-rdma@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v4 8/8] vfio: Validate dma-buf revocation semantics
Message-ID: <20260121134712.GZ961572@ziepe.ca>
References: <20260121-dmabuf-revoke-v4-0-d311cbc8633d@nvidia.com>
 <20260121-dmabuf-revoke-v4-8-d311cbc8633d@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-dmabuf-revoke-v4-8-d311cbc8633d@nvidia.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ziepe.ca:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,amd.com,gmail.com,ffwll.ch,redhat.com,collabora.com,chromium.org,linux.intel.com,kernel.org,suse.de,intel.com,8bytes.org,arm.com,shazbot.org,nvidia.com,vger.kernel.org,lists.freedesktop.org,lists.linaro.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51242-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[ziepe.ca];
	RCPT_COUNT_TWELVE(0.00)[34];
	DKIM_TRACE(0.00)[ziepe.ca:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jgg@ziepe.ca,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,ziepe.ca:mid,ziepe.ca:dkim,nvidia.com:email]
X-Rspamd-Queue-Id: 2E9BE581EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 02:59:16PM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Use the new dma_buf_attach_revocable() helper to restrict attachments to
> importers that support mapping invalidation.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/vfio/pci/vfio_pci_dmabuf.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c b/drivers/vfio/pci/vfio_pci_dmabuf.c
> index 5fceefc40e27..85056a5a3faf 100644
> --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
> @@ -31,6 +31,9 @@ static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
>  	if (priv->revoked)
>  		return -ENODEV;
>  
> +	if (!dma_buf_attach_revocable(attachment))
> +		return -EOPNOTSUPP;
> +
>  	return 0;
>  }

We need to push an urgent -rc fix to implement a pin function here
that always fails. That was missed and it means things like rdma can
import vfio when the intention was to block that. It would be bad for
that uAPI mistake to reach a released kernel.

It's tricky that NULL pin ops means "I support pin" :|

Jason

