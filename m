Return-Path: <linux-media+bounces-58642-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LrbFtml3GkEUgkAu9opvQ
	(envelope-from <linux-media+bounces-58642-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:14:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 567CD3E8F44
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 10:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BE3CD3009E20
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2026 08:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84488343D91;
	Mon, 13 Apr 2026 08:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical-com.20251104.gappssmtp.com header.i=@canonical-com.20251104.gappssmtp.com header.b="rTfUtuMR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663E0214A9B
	for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 08:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776067871; cv=pass; b=YEqylvDQ5aZ+KJ3c9YfCqjBTNPgwZkjrLOGjO4jy3iRLe/TWT3B6790AHEeVemNqBqoleI+rh6+jySre1v2c2ISOmbx2VxwEouP7F1VOo/nSJfQEtdmaj659rWkcx3vkvG53aDh7GLupXsKB5i6/qb3RPSVpbdqnh4n9caoGvNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776067871; c=relaxed/simple;
	bh=/E/AdwjBLAN4pPPMXXheV4GKiE9Rpaz3qcVb0oiG0tM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=AO4v1lk8tuvZDR8SP6bGTjxLFd2G283WGVY05DSmvN2oPHOasf1upA+cjwxv1C/D09Fbkroy/QbWf77L2FFH5VM8PeYCdnJFsJge7Sr0bIY4tj8iY+zI+qlIvR47A0U4QPlAqhKBPN3WHVwluiW2ajQjDSBviK1pXeu4acwmc3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=canonical-com.20251104.gappssmtp.com header.i=@canonical-com.20251104.gappssmtp.com header.b=rTfUtuMR; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9c745e18a0so472768166b.1
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2026 01:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776067868; cv=none;
        d=google.com; s=arc-20240605;
        b=M2//2h7bQRrMLi9nmbBUfo9Kqt/8LHxQztmvS0MqPTr8/1wpCY7UdyHx8sEyIZuYu7
         nG25EjXEFBInJTZa5I9icGTDc7x7PcmAzLrcahxHqBxWP5F7QBtU8k5CvpvSG/B+MoHr
         uE10G47y6QHLNBtUUM8xsGmmXk40QL49v4UL0LKKyb2sKHXLFHIo+caWcADJVCpNtrTp
         qXQvAo5m0N3B88v/XYCiUK8JUk61PRj9vF8hDN2yax/j5+qORUl/NiUq9PKcFmcFITvl
         xDreaI1boNtU+90eSJwxF9gycKHUXUKWZB9DBtosPp0rQvIzXkTHw6LdXS+l/3deXtC0
         Ze4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cm/2yTJZucI3GwBHuZBqSf0fctqmWzcYTDaRRhyvpf4=;
        fh=RnOykpCmc6MCtNe215RYmcbQarNim4Jkqqaq8vvjBNg=;
        b=Il3S/v47N58IMsLHsGRWrF95vg1b0gV+ZZSFm1zgOYvVu04xuE+aUgmX7vrxCB3Tj2
         TTtX7aYsWEy3uU8s6k5Osdv5Uwc+ploBmjIHLp1x14BiFAOg5utpaINjkyqMnezcP1D9
         IxQL8GMDHs15v/IhMtn214cXETUxeDVObiRQ6R8h1s8AI3JsNz0PmI6NUfC77P+Rlmen
         qLuOFZB4NU5QT6AMealJ2HaDYDqoXWpGhUXRkhchOF1uK9zLT1lgIoDHxeiwL1tTFTWF
         lvihhn1QZp287fjJR0v6EbGBqcGLEFCzONSAxfPa7LuBgZQWsBM6qLsLvIc/6Av/S1hg
         qABQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=canonical-com.20251104.gappssmtp.com; s=20251104; t=1776067868; x=1776672668; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cm/2yTJZucI3GwBHuZBqSf0fctqmWzcYTDaRRhyvpf4=;
        b=rTfUtuMRUoyRZpJGtSjlVr2PkCSY+lT6QXnYTAu/oCKwe6MyZYY1FuY5VtgvK/E5Xh
         7c4afVA+klBlTBw+/wSzoT8reWddcFV7dwKniHtxE0ZmoNx5B1NGmx6g9h9m77nk907k
         eTHDoaP7OLhfbyQOVb1PqFDB0+pqwedROSdYGYoVB6FacbkCGvDXKIgqjwXZ9itF/HVf
         nnAt4pVNRN8PhU2gyAONCvtpV9iN9Wo5bnOx+FvdzJTlZhcxEJPZrnYIZs8m/5TEUFHC
         Pv/PDO3Ge3zdsGq4hfiDC5M/wFOpJsZNU0iBMjKkUMO422ENOTiJbXyTHTPpF8wjoS4f
         snyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067868; x=1776672668;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cm/2yTJZucI3GwBHuZBqSf0fctqmWzcYTDaRRhyvpf4=;
        b=HjfAGP+E+GmpsZZcQDqPL3Z0kgYzlD9uI6sTc3F7jT/7/5toJ8Bdrvloy88gasRPPo
         OqRQtRc6Wf9yuorsaODeuyvyvJFCnqC5q739MosNTq/WfLutRthzMllUYCS6uKKOpjku
         ErF1qgc4oCdvSbv2fUYtky+5tA531GslCEAHjQjHn5M0FqvQFchqTyAhRdvJDs/3XLI+
         d5DfFYLipMMFAruo/8VVP9iuQi+PitkPMnKwxBLLMB8xCIc9BX+kXH8i1ehzIr/SVeKq
         VFRp0MSH7/wqlI8pRvWxc3BPNmqIfe2Zim5gsxfkLrc++7y9qOEmEF6arF7l/NTmmhYK
         /Oeg==
X-Forwarded-Encrypted: i=1; AFNElJ/goij/sOcVt0OaxDyWa+fHu0O8v2u003KBx+DJxSX8MsOPU+h5QSMgn1CiIDPy8oAVv5xUIS5B0FsvDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8xvoEnhv/HYLZFMlweHncifetLb0vsgt2p+qePFeSC7yJCRaH
	siV/2WueHWwPhfIZAjzbtQ96ZBJXDFrbdojnLVP0fTYzIqzwpv+wbZWw5ukuj6IMbNUg0Omeokp
	F6CFMjYO8Rqn4fvpqlXxXOx3pe91USZM=
X-Gm-Gg: AeBDiesMTrz9uEzaOk5iF8coPPtGPFhddGPVbFCglnGjM6vHjk/ZLxf6e0PGz37loP7
	ttP6V0Q2QpFfa2EdCOiji+3A4noLmleMM7soF0Y5Pq/BwJIGSedO4DSJZ7ODYKe1vMgZgfydmow
	wX9+YjZtPypctAHdJLi5wEhToTFyg+GGWJYW854QCIbCR2V1vU+5+J5TlybRC+r+z/UhI9eLxgv
	f5IpbRDj+PLgvsV8lUMTeo3FOtm3uTOt5Dain3oVy09hIr3jztaZBeb9OURlZKh7wE/Jf/1v8MR
	NhS8IwtRatXOswLWEbg=
X-Received: by 2002:a17:907:1b22:b0:b97:fec5:eced with SMTP id
 a640c23a62f3a-b9d45b64482mr833752966b.0.1776067867411; Mon, 13 Apr 2026
 01:11:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114011917.241196-1-acelan.kao@canonical.com>
In-Reply-To: <20260114011917.241196-1-acelan.kao@canonical.com>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Mon, 13 Apr 2026 16:10:54 +0800
X-Gm-Features: AQROBzAUM-FyVmyBMIfewJCZMi_4s_1U1SPVgwvrtxpwOIQt1R-Yr616qRFplZw
Message-ID: <CAMz9Wg_i5Sgewa2N7jfEoNJrp5jMp+O5m+kM=VN9rWKcGLzQXA@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: set SB_I_NOEXEC and SB_I_NODEV on dmabuf filesystem
To: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.34 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[canonical-com.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58642-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[canonical-com.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,canonical-com.20251104.gappssmtp.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 567CD3E8F44
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Chia-Lin Kao (AceLan) <acelan.kao@canonical.com> =E6=96=BC 2026=E5=B9=B41=
=E6=9C=8814=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=889:19=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> The VFS now warns if an inode flagged with S_ANON_INODE is located on a
> filesystem that does not have SB_I_NOEXEC set. dmabuf inodes are
> created using alloc_anon_inode(), which sets S_ANON_INODE.
>
> This triggers a warning in path_noexec() when a dmabuf is mmapped, for
> example by GStreamer's v4l2src element.
>
> [   60.061328] WARNING: CPU: 2 PID: 2803 at fs/exec.c:125 path_noexec+0xa=
0/0xd0
> ...
> [   60.061637]  do_mmap+0x2b5/0x680
>
> The warning was introduced by commit 1e7ab6f67824 ("anon_inode: rework
> assertions") which added enforcement that anonymous inodes must be on
> filesystems with SB_I_NOEXEC set.
>
> Fix this by setting SB_I_NOEXEC and SB_I_NODEV on the dmabuf filesystem
> context, following the same pattern as commit ce7419b6cf23d ("anon_inode:
> raise SB_I_NODEV and SB_I_NOEXEC") and commit 98f99394a104c ("secretmem:
> use SB_I_NOEXEC").
>
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
>  drivers/dma-buf/dma-buf.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index a4d8f2ff94e46..dea79aaab10ce 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -221,6 +221,8 @@ static int dma_buf_fs_init_context(struct fs_context =
*fc)
>         if (!ctx)
>                 return -ENOMEM;
>         ctx->dops =3D &dma_buf_dentry_ops;
> +       fc->s_iflags |=3D SB_I_NOEXEC;
> +       fc->s_iflags |=3D SB_I_NODEV;
>         return 0;
>  }
>
> --
> 2.51.0
>
Hi all,

Please help to review this patch.
It does the same thing as
   ce7419b6cf23d ("anon_inode: raise SB_I_NODEV and SB_I_NOEXEC")
and
   98f99394a104c ("secretmem: use SB_I_NOEXEC")
Thanks.

