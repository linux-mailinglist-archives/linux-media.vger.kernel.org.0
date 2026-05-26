Return-Path: <linux-media+bounces-62822-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDUxKkHaFWpYdAcAu9opvQ
	(envelope-from <linux-media+bounces-62822-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 19:37:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5365DAC75
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 19:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 26D2F3045B51
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 17:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC42841B340;
	Tue, 26 May 2026 17:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MkYUWpMv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D1940DFD1
	for <linux-media@vger.kernel.org>; Tue, 26 May 2026 17:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816835; cv=none; b=AXJQGOe2S8AhY7SlVfAa3Mi8EhBhzGpsDcSHXE0i9RrRCnr22BIxvwHWJDUI1SUdGLG/mrhW3jckrOD6E0QtHShBo+8cqXAM5ByDtyL+4ag+o3c5SADVWc1CtrZlcB65cyqS62wj2XDQNeoh/Rhn2vbpZNV1EnyawSaLxkd10hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816835; c=relaxed/simple;
	bh=t9PeMGz8g3DJguAGpGkukwTFWcPlOIHZ7bBFuMA4mxU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SmYgeM3aC+Hvx1MHmFD+k0H1LyoJKi9AC8UFeFusUyFx77HTIeWB5TdbK4H6/hqgAgn/lYyxeoI/ER668Z5wGrXR4Q8ZBFl7AMlavxiGb9Eiw5dytiRowInMz0MJs/fEdlDtoM2PQuK/UjYgkJp2FrKmz/rMlaHXh1PcCmccdRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--praan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MkYUWpMv; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--praan.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b2e8bba2e6so143605895ad.1
        for <linux-media@vger.kernel.org>; Tue, 26 May 2026 10:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779816833; x=1780421633; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hcUFNVo2Sgdj71izYX2y2jUTakglUwC/840c4cOGT0g=;
        b=MkYUWpMvI/RCSkD4m4tzCnvpuO9VdUZceA8zGsgAptualwxBbZAeq2XHiK86Qxpc75
         WgrLmOKGuKMkvTQl+jwcRi5+QnUY1ZEhgnGXtiNGbIdK0ckJdRDPU+nnVm5bIntnVMxK
         1XXJeRNqtE7mcgoiz3+7KUoCBN90avOAIoWQRAPBDWXc6htTvz7norE3qHe+vVI5qab9
         DdG0O0wVBhvuSbpIsDbMk9rJ7aO70OR9UYZaxCyn9xIJfVAqTn0EY1b2OavfwmJ+NIuH
         LGsf5DO30mFJmagc5Q1famhoNN7Ac9K9VfRTQS8NbxP2vpnmvTAoQq5yek29MsKBUfmw
         R6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779816833; x=1780421633;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hcUFNVo2Sgdj71izYX2y2jUTakglUwC/840c4cOGT0g=;
        b=oep8GvteLo0WZzhH7yJysJCDZoEENt+JZvSkRB79ojvAYqBC4jaFuqOOckBSoInNrE
         kq4XZEmfh9gkJaP57/1NwtwioUiCOz0BV09lsgLzSXmwjSauUB/EUipGs/EI5tS/ceSM
         xmFWf24YZVTZv8xN2cASiHWjDR0pIcooAdzzFURbOMKwza2A0XO2CScxzbPZ9TE6JtKo
         EUq169erpUSm25ISnHJizavfFBcHkSggnOAkims2sKXrYVUOi/VYECs9RnQwI6h3ViPj
         1eKdamJoI9mgXqWZ1X0UtWIvUTTNyVtKnwKx/PW/z3lEkKQ7P8Kefw39K2Ldgjisfp1c
         +eDg==
X-Forwarded-Encrypted: i=1; AFNElJ+CQdQcFAumq+dBUW1bTZV/aYy3TJhUEokCvXDwQyuXkO44LsNPYu1Je4AprzLsOIpyC99nkEDrs6sBKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBBLXtke6Wx7ZEOhGL7Qyu9J17dfaosMC+arI9HZlo587P91tV
	3TJQzmlbq5yZ+y+dljy4rP1lV2zickYbTDIWkBCq+S50ogIy1nDYJuawRHktb4756gHNGeW9bJi
	DFg==
X-Received: from pgbfe22.prod.google.com ([2002:a05:6a02:2896:b0:c82:798f:6276])
 (user=praan job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3947:b0:398:d6a9:fc9
 with SMTP id adf61e73a8af0-3b328cb9cffmr19853341637.5.1779816833191; Tue, 26
 May 2026 10:33:53 -0700 (PDT)
Date: Tue, 26 May 2026 17:33:50 +0000
In-Reply-To: <20260511214243.349487-1-xuehaohu@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260511214243.349487-1-xuehaohu@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260526173350.2359263-1-praan@google.com>
Subject: Re: [PATCH] dma-buf: Fix silent overflow for phys vec to sgt
From: Pranjal Shrivastava <praan@google.com>
To: xuehaohu@google.com
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, kevin.tian@intel.com, 
	ankita@nvidia.com, jgg@ziepe.ca, alex@shazbot.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	jmoroni@google.com, Pranjal Shrivastava <praan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62822-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praan@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bootlin.com:url]
X-Rspamd-Queue-Id: 4E5365DAC75
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 11, 2026, David Hu wrote:
> In case MMIO size is bigger than 4G, and peer2peer
> dma goes through host bridge, we trigger the code
> path to assign total linked IVOA, greater than 4G

Nit: s/IVOA/IOVA

> to mapped_len, and leading to a silent overflow

> Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mapping routine")
> Signed-off-by: David Hu <xuehaohu@google.com>
> ---
> drivers/dma-buf/dma-buf-mapping.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)

> diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
> index 794acff2546a..658064140357 100644
> --- a/drivers/dma-buf/dma-buf-mapping.c
> +++ b/drivers/dma-buf/dma-buf-mapping.c
> @@ -95,7 +95,8 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_buf_attachment *attach,
>  					 size_t nr_ranges, size_t size,
> 					 enum dma_data_direction dir)
> {
> -	unsigned int nents, mapped_len = 0;
> +	unsigned int nents = 0;
> +	size_t mapped_len = 0;
> 	struct dma_buf_dma *dma;
> 	struct scatterlist *sgl;
> 	dma_addr_t addr;

Minor nit: Let's follow the reverse xmas tree format?
This looks correct to me, for this change:

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Apart from this, I see similar issues at other places:

  1. In calc_sg_nents(), nents is accumulated as an unsigned int. [1]
     If nr_ranges is very large, nents could also overflow, potentially
     leading to a small allocation in sg_alloc_table() and a subsequent
     out-of-bounds access in the mapping loop. It might be worth changing
     nents to size_t there and adding a check against UINT_MAX.

   2. In fill_sg_entry(), the loop variable i is an int [2]. Changing
     it to unsigned int would be more consistent with the nents type
     and safer for extremely large mappings.


Maybe, we should also fix these? For example:

diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-mapping.c
index 794acff2546a..ecf07ffca2b9 100644
--- a/drivers/dma-buf/dma-buf-mapping.c
+++ b/drivers/dma-buf/dma-buf-mapping.c
@@ -10,7 +10,7 @@ static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
                                         dma_addr_t addr)
 {
        unsigned int len, nents;
-       int i;
+       unsigned int i;

        nents = DIV_ROUND_UP(length, UINT_MAX);
        for (i = 0; i < nents; i++) {
@@ -36,7 +36,7 @@ static unsigned int calc_sg_nents(struct dma_iova_state *state,
                                  struct phys_vec *phys_vec, size_t nr_ranges,
                                  size_t size)
 {
-       unsigned int nents = 0;
+       size_t nents = 0;
        size_t i;

        if (!state || !dma_use_iova(state)) {
@@ -51,6 +51,9 @@ static unsigned int calc_sg_nents(struct dma_iova_state *state,
                nents = DIV_ROUND_UP(size, UINT_MAX);
        }

+       if (nents > UINT_MAX)
+               return 0;
+
        return nents;
 }

Thanks,
Praan

[1] https://elixir.bootlin.com/linux/v7.1-rc3/source/drivers/dma-buf/dma-buf-mapping.c#L39
[2] https://elixir.bootlin.com/linux/v7.1-rc3/source/drivers/dma-buf/dma-buf-mapping.c#L13

