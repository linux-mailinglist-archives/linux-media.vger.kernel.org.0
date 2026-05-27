Return-Path: <linux-media+bounces-62929-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cO8EI9RXF2oPBQgAu9opvQ
	(envelope-from <linux-media+bounces-62929-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 22:45:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E47E85EA282
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 22:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0DFDC31297D7
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2026 20:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DEFA3C4540;
	Wed, 27 May 2026 20:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MuRvGTTa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A07936E47E
	for <linux-media@vger.kernel.org>; Wed, 27 May 2026 20:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779914230; cv=pass; b=pNNv3CWdVHT8gBKM6ThqlMClPGg1cP0HE7Axu7h/FnjvtbHTXtnK1sMTZnT35rGD3d7lSgd0NZCR7OAz3/2Yq6BFheJA83WuN8/2QnP8QIjxIHyjTYg7PtvGgVEBI0tvwimEKcdrhMGZTXEup2HvpouR4y7vS0XghNq6oIl7LPs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779914230; c=relaxed/simple;
	bh=WCzM2+d4oqwEn+78pNZFTrvTrGN4YhXq33rqJyySTi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bS+9KPyTlDgJetyONtX8y3r7YkeQ/u4ekmbVsBBjJw0jCy6ArNIhBeaCkyrg2HZuodw0703wrr6cUV23NGj+2AJCdjx5ChUQcF1IBM7GRhkC6ZQvt8L1YvaDf6NsW+Riu79ml61+ee7APfWV3G8PgNq3+JlCJalyy+HMI3gEA3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MuRvGTTa; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a88a79eb3bso4e87.0
        for <linux-media@vger.kernel.org>; Wed, 27 May 2026 13:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779914227; cv=none;
        d=google.com; s=arc-20240605;
        b=H2CQRj3CmELKLcPPXkE6J37W6uoBoht7ieEm/OyVmHkgG4S5+xpIrbF1EvItbMH/Vv
         5ikj/iUSn8TDZUmZs3Q7b6lNmEs4G3abPGjZMjp+nrVuhfXfyfHG46m8KulPBk78tcDd
         enoADBOOp6Z6f1SgDYdg33v2HkbLVKrj0MkVeB/SYHxu8XWWbMmhltJg0sfgfRBxV5Nk
         Ox3OVPr0grULUVJr1vexDxxsBoXsT/8xlqQJwa4Xvp4lYxUDaWHfR/d5ylBJ2VwQChIz
         XUxvxzn7HLYo1aIElYYtUHT5/898eHhi3D7WbHmY60y/DtS0qX96GZXRit4R9p9eHwr6
         eYKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FiFa1Df4saC1J/ZGIYY64ADBjJ4UDzy5361EO2Lv5uM=;
        fh=Fb39SeRfwGNmBiNHkYrF2jpIf8RxPeSgdmZXzkclLEk=;
        b=JYOm5gJrEqWMkOdXQQ4rGfz4BfVXlEF5ZX1/634ArakZKYZ2/RSulu1HOLkKkBymzR
         v5bXnqzyg4DWtgZbuv4f9lHTPFSdVw/jyCJaXhTJomHK4QJubS17ZLmDjiockdvK+cCm
         hJvp0tAQ4VdWMT8/2QnZYD2do9vIdyPGXhYQvxdlpahKI69I4qXYbtQ1yMg8//necTM6
         8kUjpKPT82p4dQX82cF9hK1tqYqD7KW8Ik2vPCD63BMO3mdjI/k+EN1WfCWIo+5cspiV
         kk+sfuNyGpwUQ208Yl0pChBLNLRSkRWB03h8QcL3pNdEi5vnUQrlsn9NZvgBfHETGpad
         RWQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779914227; x=1780519027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FiFa1Df4saC1J/ZGIYY64ADBjJ4UDzy5361EO2Lv5uM=;
        b=MuRvGTTaSJ+gtQ9uuAV13ytFmK5crVVFOTg+JtYMJM4r2++JHHFt2B6uzBODY+BmAG
         srIwlM8W6fTFGZWn9a43Wer7KYHKCDOk3LriDwHIg3hGfP8+Omtz76a/KVKXG8rkMqWw
         3Os2H9DHsoLRt+caSuHUYwdZBiygLzYHfDomrne9XXn54/13nWFDVk9h7YE5+4PfAS/l
         gfEgwUfrDfmdrBXId/KC+gIMjOBV9JwLFtPGBDoQ14KTnFsR3SL5oWOSxWFjtuRDysZw
         FLaAdHTN72UERNm5002mFeXM2rTnWjTxvGVUwS8VRpwlvm85EjoSujxU7FAf+u3iuU/Z
         BTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779914227; x=1780519027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FiFa1Df4saC1J/ZGIYY64ADBjJ4UDzy5361EO2Lv5uM=;
        b=A9jG5/BeYWtIxrmK826MpmskEa6wTERiYWpPtpvWV6/9+svxcuzGjekJ9vwM6F/hU0
         lWq4bJflQHLyfgPZu4SKXSfskrUzCFy3eMpkb9r0HWbhX/VKtBY5TKac/oLedepdQdU0
         nSiGPqKYY9P/JnmEwgNUCWDcrNBbL33fjlgf3AmwjbPTHgX54mgkrGp/EcWSb8Q134ew
         RceaEwr4KxF2HazD0h2BEpYkSO8vToyA5HxamXEPilDqa+/x1feHZ3KlVBXVk5p5Do7C
         /k2BgeEV0JFTZMdlmitKNwAQPduie8t8cYKb56h/aq+6NqNvhPmRqlJVRY+fmX3fj6LR
         BPIg==
X-Forwarded-Encrypted: i=1; AFNElJ/XYeCUT8GfnblIXsJpLsv75EyeiAbYJPjz31gzeSxzZ/7w5ZALHVwzjKsIn9Tus0rUYIDi7sGMd38Xpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWySY7Q1ClWJherq8n3XmS57Q9hjWAKD+WTq+LBFR2hsIrBjgW
	TW0aVNj57zC0aIYkpDW+r0x7xQRCuUJ7xk/uDgqCyaHQ31UmOi1AWMd734MFrT/3DDjzSikLNpD
	qvmLxAueQNCMrBTA3iYjYyR1OwSrcbeFM3jct4vI=
X-Gm-Gg: Acq92OGm8AniQG7JjTV8xHJVO1JUF9GBRPUii/cvJ8xObJpDh9lRFfVh9VTscTCQGWj
	VhXogPomqEMsvV97xe1yoEUSvee6O3OF5UWK3bMdh8wgV/DGv/O01BUHcP6DGGnD5tqaXuuVRSt
	IwNGfkhA3sZbWScXd6WQQF/EXOodfaGRM4++KsVcFAnucmVvVILXZlvo54HWpV+qk2Y2W+X6lVs
	H/ZSc4yCDbgT4Juzlxal+DFs1mKXmwqLz2eqsdr7AFOR3KlztjojhjuOhQKglsPi2J4MJ4uHKys
	fqKgND4+z1Gb4RQQyHqYO+STO1yP1tkgmIuEv4JScQ9Weow=
X-Received: by 2002:a05:6512:134a:b0:5a4:462:a470 with SMTP id
 2adb3069b0e04-5aa4ff92e07mr24638e87.7.1779914226791; Wed, 27 May 2026
 13:37:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511214243.349487-1-xuehaohu@google.com> <20260526173350.2359263-1-praan@google.com>
In-Reply-To: <20260526173350.2359263-1-praan@google.com>
From: David Hu <xuehaohu@google.com>
Date: Wed, 27 May 2026 16:36:54 -0400
X-Gm-Features: AVHnY4IF3I2qsMWkH6V2x0MBlfaofpaRNxk4VxA3EVoNIlcP5hkGNNAtRYxgcFU
Message-ID: <CAPd9Lg_aXizh0R1wnRitwVRMdh5SmfUmLiQLyF+EJ31yFeLYJg@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Fix silent overflow for phys vec to sgt
To: Pranjal Shrivastava <praan@google.com>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, kevin.tian@intel.com, 
	ankita@nvidia.com, jgg@ziepe.ca, alex@shazbot.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	jmoroni@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62929-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xuehaohu@google.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,bootlin.com:url]
X-Rspamd-Queue-Id: E47E85EA282
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 1:33=E2=80=AFPM Pranjal Shrivastava <praan@google.c=
om> wrote:
>
> On Mon, May 11, 2026, David Hu wrote:
> > In case MMIO size is bigger than 4G, and peer2peer
> > dma goes through host bridge, we trigger the code
> > path to assign total linked IVOA, greater than 4G
>
> Nit: s/IVOA/IOVA
>
> > to mapped_len, and leading to a silent overflow
>
> > Fixes: 3aa31a8bb11e ("dma-buf: provide phys_vec to scatter-gather mappi=
ng routine")
> > Signed-off-by: David Hu <xuehaohu@google.com>
> > ---
> > drivers/dma-buf/dma-buf-mapping.c | 3 ++-
> > 1 file changed, 2 insertions(+), 1 deletion(-)
>
> > diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-bu=
f-mapping.c
> > index 794acff2546a..658064140357 100644
> > --- a/drivers/dma-buf/dma-buf-mapping.c
> > +++ b/drivers/dma-buf/dma-buf-mapping.c
> > @@ -95,7 +95,8 @@ struct sg_table *dma_buf_phys_vec_to_sgt(struct dma_b=
uf_attachment *attach,
> >                                        size_t nr_ranges, size_t size,
> >                                        enum dma_data_direction dir)
> > {
> > -     unsigned int nents, mapped_len =3D 0;
> > +     unsigned int nents =3D 0;
> > +     size_t mapped_len =3D 0;
> >       struct dma_buf_dma *dma;
> >       struct scatterlist *sgl;
> >       dma_addr_t addr;
>
> Minor nit: Let's follow the reverse xmas tree format?
> This looks correct to me, for this change:
>
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
>
> Apart from this, I see similar issues at other places:
>
>   1. In calc_sg_nents(), nents is accumulated as an unsigned int. [1]
>      If nr_ranges is very large, nents could also overflow, potentially
>      leading to a small allocation in sg_alloc_table() and a subsequent
>      out-of-bounds access in the mapping loop. It might be worth changing
>      nents to size_t there and adding a check against UINT_MAX.
>
>    2. In fill_sg_entry(), the loop variable i is an int [2]. Changing
>      it to unsigned int would be more consistent with the nents type
>      and safer for extremely large mappings.
>
>
> Maybe, we should also fix these? For example:
>
> diff --git a/drivers/dma-buf/dma-buf-mapping.c b/drivers/dma-buf/dma-buf-=
mapping.c
> index 794acff2546a..ecf07ffca2b9 100644
> --- a/drivers/dma-buf/dma-buf-mapping.c
> +++ b/drivers/dma-buf/dma-buf-mapping.c
> @@ -10,7 +10,7 @@ static struct scatterlist *fill_sg_entry(struct scatter=
list *sgl, size_t length,
>                                          dma_addr_t addr)
>  {
>         unsigned int len, nents;
> -       int i;
> +       unsigned int i;
>
>         nents =3D DIV_ROUND_UP(length, UINT_MAX);
>         for (i =3D 0; i < nents; i++) {
> @@ -36,7 +36,7 @@ static unsigned int calc_sg_nents(struct dma_iova_state=
 *state,
>                                   struct phys_vec *phys_vec, size_t nr_ra=
nges,
>                                   size_t size)
>  {
> -       unsigned int nents =3D 0;
> +       size_t nents =3D 0;
>         size_t i;
>
>         if (!state || !dma_use_iova(state)) {
> @@ -51,6 +51,9 @@ static unsigned int calc_sg_nents(struct dma_iova_state=
 *state,
>                 nents =3D DIV_ROUND_UP(size, UINT_MAX);
>         }
>
> +       if (nents > UINT_MAX)
> +               return 0;
> +
>         return nents;
>  }
>
> Thanks,
> Praan
>
> [1] https://elixir.bootlin.com/linux/v7.1-rc3/source/drivers/dma-buf/dma-=
buf-mapping.c#L39
> [2] https://elixir.bootlin.com/linux/v7.1-rc3/source/drivers/dma-buf/dma-=
buf-mapping.c#L13
Thank you Pranjal for the review ! Good catch on other potential
overflow sites. I have folded in your suggestions for calc_sg_nents(),
and fill_sg_entry(), and applied reverse xmas tree formatting. Sending
out a v2 shortly.

