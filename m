Return-Path: <linux-media+bounces-54968-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NWzK8rtrmkWKQIAu9opvQ
	(envelope-from <linux-media+bounces-54968-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:56:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B047623C3BA
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 16:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E7B19300BE31
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 15:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E723DA5A8;
	Mon,  9 Mar 2026 15:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v/5KgD8L"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3B73B8BD2
	for <linux-media@vger.kernel.org>; Mon,  9 Mar 2026 15:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773070798; cv=pass; b=eHnXra3pBgWGPis7od4ItkVKYs3JQ3tS2GckrfRAlhTmesuU65wCmIQCFLhhChns5QGQGFfmjEdGvZgJXwNJ2lz6aPiEC5fkGbXXvjn7fBEBUV42VjVm89Rykx9tEP9LchsT2FCFzrIOUXJZwtxcsdxZb30/hinCaho7Rc70pf0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773070798; c=relaxed/simple;
	bh=fUiMYtNMvHNYULJIwkoZwWkLFEOGGVApxwthvUYiwWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQG1Sz53o0PhXkjFD8JwOiYiuYbjl9IXsU5HDMmj1kpucwU3txXnismoN3C80zfU4xGEaLd8t+26ToJD57SKw0xTSebm3z5gSE2TU+0elc6peN83U8r+eoLvaf+/iEoMEXMyhgpdrovXmxf+BovEjDEUxJ4iWb6kXTQ9b/79M50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v/5KgD8L; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64c9a6d6b70so10075219d50.3
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 08:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773070796; cv=none;
        d=google.com; s=arc-20240605;
        b=eZ6TVJc0uQQpKW0bLus65ygga7s1Zp6zXIxx2Kuc1A5Mb0RCSRrF5jagvPYSdz7F6u
         YAchSy2gsK6qo0MA4vcYhHzUyVCHKavHR+nh8Bf7E5LqckLMKHy+oYKZmIkJ+UHUbASF
         eR8nmsdp2AH/e6IHJC85CWE3UReOJxfyjA48vY4lGNdGvbs/Dv8N36omKPOP71GqzqNd
         dOeco31ARC9zh3GFmLlk6BYNKrRwD1OPDaATpjOPNpYdTVLc3qhEgTAOaRFBpmqH1NOc
         Bp9tb6IrklU+9xYAelYXRgov6mk5PcBLU+Rqt33gBVqu1sAvVUTyDWqJVgVnYbnK7Kkv
         g43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MvLYcYLZmHSPzURtRpTfKGpAse3rZ5uBdKhXxFZ9chA=;
        fh=klgKeEI8yBJcinUyl+8PZI2SwFD0IOMdZBrjFvwSeWg=;
        b=VewPZjRpPpGRH+rwX6bW8VYF+iuzxGrMSglLVAmlnK2e9EVr6ij4yTaHvipABVpNzy
         KOR4iSXrondOi3VK621y01Wksu7QSFMd3KmjS7R3reRhdDzZXsWwPD2poKWJ3Tntm3Ir
         kyX1WE6scqBO82xYB1BPF7kmjMcViPUx6ABlkO2Tdgygy2FQ1eDP8Lud+06ZkMTIBVJP
         bcMXPoKOQw7ghSS1t7YLEg9moeMOvXscLp0dVlCZAw3hUkxp7IH/hkSB9nAhQMIARJnz
         H00RbhRJ73IN2obeqa4VgHnvaUXeOkRt7N9vpIbqYPFeX0qk+eiihzN2ZXmUiC3d4lVc
         Crlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773070796; x=1773675596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvLYcYLZmHSPzURtRpTfKGpAse3rZ5uBdKhXxFZ9chA=;
        b=v/5KgD8LX34l1bv5K0IQxNSl4GYfYKIoAgDCvwLhw5KRMXyhzzGaEDPIkpQ0etqS4D
         LMMGcTHP3OQuEPJNY7/teTw8LYy6V9XQIU8W3FGYCUlOv4k4n2DWubhGeGYOPEWiQRZZ
         eJKZuxD6iVLFvwqUBarsGk8y/jtBV12jWlgOFAmLJ8KSFaVYYxi15C18aiVutfdM/nYX
         7qHoM/O51Ug19mqY/dQy+9kCc8DBtQ3l00k9OYJLjWSNlOwMwaLP3cUr8CRImFAURQVQ
         taHRat5uBiMi8FEMxswz/QH3NrMusxjsZKoW+7ekcwJ0hRg+oYKVepldYiU3QR8ue8YT
         y9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773070796; x=1773675596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MvLYcYLZmHSPzURtRpTfKGpAse3rZ5uBdKhXxFZ9chA=;
        b=OE9ssYf9itgS0gkIhOy9QSY6vqcp/HQ4kPsJKetR+V7m8Iquddx9vS53sEp2+bdQ+u
         VCF+QH3SCUhz/C7pQVCsCKXhyrk1u3xM59n1m27V76WuXPz/phkC043sy/iGlQPdGLcb
         hT4HatYJ9Pa7jDH5tIpQaDKJrkSxIzVj0u+TJYUcscHsoXOqc5WOmkthiPVou4UJ3ZKP
         Jx5Mh1ZAUQjQkXLPHV8ME1T2AhsBdJqlCfCOX4AEmCHvj6ZKRMLQ0KDdVeJLFQPBOIWZ
         zuLEVcsXJp0zdRRJHfrAXYWRidcMMLTyvhO2l+RdNjtnQeNAWBvOVSBLN4vX3Sra9EfE
         mhlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL7uZ3qSsPkZfw+l9lIClD5+KpT5xXbUcsGgaOyr15p53ThP4XvtkyDkKFCcj2c9JNNEpz1+ZOT/KCfA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxQRvZTXqHcy96aQ6Y2Upj7n9OUreuFpHyx7aKH+Kzs5FqJ0FY
	m7o/qF2ByIp9HPEISFx6gKVlYJk53lu4+k3plH/aXIuH3+cXVMW2xUCGspvkmudJmzdJn0Vzqq3
	mKQNdUe2Q2fJlhrPGRU1xVFWrdUxjgfFkY4yf9hmW
X-Gm-Gg: ATEYQzynsXHZPVuIwHXvBmYWwgrlltL7JafhBMzlS5DTlhyRki4QEjBsWKUNnOoqtmA
	IFtILvAzf4E6rzWnbpfCCpYaJrUPHJkNXnmXWg4kk7sQJtO/wFj6VMZi8sfv+U7MvjzJVyHhpvO
	K4/Xrp6meNTq6iY9XRRs4U4OyD0Qktw/9zJhODi7gQyl+TLwtuqhjd+5Q0a47I4EVLrkT9Kgnbd
	8g/AtkyZA9622CAX2Sy4LjeT87HfPFOcx17maXSBO3hHUXJel1gd0kssNu/exL7a4xjYaHrzTSh
	V1syfakcLqRY29ZwvUmzlBPlUY2vydl/eM3sFkQSziNLS5eV
X-Received: by 2002:a05:690e:16cc:b0:64d:29c6:7974 with SMTP id
 956f58d0204a3-64d29c67a27mr3174372d50.11.1773070795335; Mon, 09 Mar 2026
 08:39:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260305123641.164164-1-jiri@resnulli.us> <20260305123641.164164-3-jiri@resnulli.us>
In-Reply-To: <20260305123641.164164-3-jiri@resnulli.us>
From: Peter Gonda <pgonda@google.com>
Date: Mon, 9 Mar 2026 09:39:44 -0600
X-Gm-Features: AaiRm51h3c_DzKOKsC7CokIZvNyOKydjIyhi9bVIzEGXBlmxcqpV-AFuGedzucs
Message-ID: <CAMkAt6o_yZ5T-3TRwymjYQZEq-Q_z=DAA3vc61h81X9sQr_CXA@mail.gmail.com>
Subject: Re: [PATCH net-next v3 2/2] dma-buf: heaps: system: add
 system_cc_decrypted heap for explicitly decrypted memory
To: Jiri Pirko <jiri@resnulli.us>
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	iommu@lists.linux.dev, linux-media@vger.kernel.org, sumit.semwal@linaro.org, 
	benjamin.gaignard@collabora.com, Brian.Starkey@arm.com, jstultz@google.com, 
	tjmercier@google.com, christian.koenig@amd.com, m.szyprowski@samsung.com, 
	robin.murphy@arm.com, jgg@ziepe.ca, leon@kernel.org, sean.anderson@linux.dev, 
	ptesarik@suse.com, catalin.marinas@arm.com, aneesh.kumar@kernel.org, 
	suzuki.poulose@arm.com, steven.price@arm.com, thomas.lendacky@amd.com, 
	john.allen@amd.com, ashish.kalra@amd.com, suravee.suthikulpanit@amd.com, 
	linux-coco@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: B047623C3BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54968-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pgonda@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.939];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[resnulli.us:email,nvidia.com:email,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

Great feature to have thanks Jiri! A couple naive questions.

On Thu, Mar 5, 2026 at 5:38=E2=80=AFAM Jiri Pirko <jiri@resnulli.us> wrote:
>
> From: Jiri Pirko <jiri@nvidia.com>
>
> Add a new "system_cc_decrypted" dma-buf heap to allow userspace to
> allocate decrypted (shared) memory for confidential computing (CoCo)
> VMs.
>
> On CoCo VMs, guest memory is encrypted by default. The hardware uses an
> encryption bit in page table entries (C-bit on AMD SEV, "shared" bit on
> Intel TDX) to control whether a given memory access is encrypted or
> decrypted. The kernel's direct map is set up with encryption enabled,
> so pages returned by alloc_pages() are encrypted in the direct map
> by default. To make this memory usable for devices that do not support
> DMA to encrypted memory (no TDISP support), it has to be explicitly
> decrypted. A couple of things are needed to properly handle
> decrypted memory for the dma-buf use case:
>
> - set_memory_decrypted() on the direct map after allocation:
>   Besides clearing the encryption bit in the direct map PTEs, this
>   also notifies the hypervisor about the page state change. On free,
>   the inverse set_memory_encrypted() must be called before returning
>   pages to the allocator. If re-encryption fails, pages
>   are intentionally leaked to prevent decrypted memory from being
>   reused as private.
>
> - pgprot_decrypted() for userspace and kernel virtual mappings:
>   Any new mapping of the decrypted pages, be it to userspace via
>   mmap or to kernel vmalloc space via vmap, creates PTEs independent
>   of the direct map. These must also have the encryption bit cleared,
>   otherwise accesses through them would see encrypted (garbage) data.

So this only works on new mappings? What if there are existing
mappings to the memory that will be converted to shared?

It's also slightly worse than just reading ciphertext. If another
process writes to the memory with the incorrect mapping it could cause
corruption on AMD SEV, or an RMP violation on AMD SEV-SNP. Can we
update the existing mappings?

