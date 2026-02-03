Return-Path: <linux-media+bounces-52071-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJ/CL0OCgWlNGwMAu9opvQ
	(envelope-from <linux-media+bounces-52071-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 06:06:11 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 357CBD48C5
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 06:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E39C83043AD3
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 05:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D7627E04C;
	Tue,  3 Feb 2026 05:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical-com.20230601.gappssmtp.com header.i=@canonical-com.20230601.gappssmtp.com header.b="NhoxRw9P"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BB0270EC1
	for <linux-media@vger.kernel.org>; Tue,  3 Feb 2026 05:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770095105; cv=pass; b=R5Y80WHOAcn5itbM4shdLP7k0z7GRl9FUdmhfyTp9aeJIPd1evoTnotmGhXf26dp7AYhkttReB7ZZEzi3dRpPXZfx81Ygw4Z++euwpj6ldboVXR0UIX26PISNYwRV+Om6OJ3zJUiZqAdWoRS9qfHVTA9/SUnj1t1aSebCTkD6O8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770095105; c=relaxed/simple;
	bh=1C2gG4s/buMx3mAXwFgVh4MwPSaPRCvHimj25FvWpxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=odC3O9uKNHMS8TW9RVXJA2/kIoMd7Nt2xOo+3sZWOwbash/hKHOnGgS8B2DGyEXShze4GVCQHEwYHAzLchz+kbowTHAUvqhe2pMZZ0diGRArPv0eAnkUM+pJBBZkP07WoLf04siAQilao7IX3A6MqmTN7mBoFTwR6D4wdOkj4XU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=canonical-com.20230601.gappssmtp.com header.i=@canonical-com.20230601.gappssmtp.com header.b=NhoxRw9P; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59de6abf324so4407829e87.3
        for <linux-media@vger.kernel.org>; Mon, 02 Feb 2026 21:05:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770095102; cv=none;
        d=google.com; s=arc-20240605;
        b=EZLZw0tVl/ohOA/VRV9WSe6+v5ZKkk79GLR2qrA4qqlNGPEGucfX3cFVyaS4yu6byS
         3W2y4vCJOvJLMrBY269Ialnrp97OUy3XbfbF7NMcKIfAvcibCdirsnzoW/LE3eUrqVke
         HL8dffAo5ItOexCdJklURrflgJY5ZkFi1w9hK5nLW7tctJ76bHZj2GnYCQq6jwqXa5nT
         kPCUQuinPCWJqOE0LH08Apai3WtG67xJsKU5q5CE9KfsxPDtI+D9pdl24/6KUK1nIjku
         lLjSVL3KISumGTtpT2PqjN0LGvrIkSHVJNZ5E2+i+W8TbVMsqTFG8HlTldwFnSFK/2/w
         KNLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R8Uq40im68Bsn440IXZslpowd8o1+PpzUOCwvDYaiRc=;
        fh=lwG4V5nOskHM3qvDvTnTVbsYmEmv2zVhwN96oCf0LMU=;
        b=bQl3wqoqE8xPAn2ynrBGZhxSyS55M354ofRInlyNQ5LVfsoj34g0n2aKR4lXZzkc7b
         hVOmROeV1E/CCixadBy3fuMeh5KKRX4JfM3prHriZlV8HQppa2muy3z3PTHx60WWghdd
         Wa09P0Puiq3PE1a5EAY/0k7Zjit0eODnRkRRBPeSorMqPdqZ6aV0L0yl2SmHDEYm1joP
         tVB0NYfk0BxgAJ8v/Yt8hOtr5FIBSBVNU2Hk9RCiiDHxb6BItgpjLivOshJ2rjeB36LC
         tw5qjodmDnvDoGYozYtEnnGwgxvrzK3xEFfj4/w1cEsYUsRKRhBaQvpRURp+bgWcH52r
         S+Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=canonical-com.20230601.gappssmtp.com; s=20230601; t=1770095102; x=1770699902; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8Uq40im68Bsn440IXZslpowd8o1+PpzUOCwvDYaiRc=;
        b=NhoxRw9PMXN0UbIEDl6X9a+L0gtzhllXiPzLAtLGc6RNTVjZVgDLgOwVWO9kz9nbo8
         L672ctq22FJbq5oQUeM2DMuh23sukFtCuY0mgo5if9egAJKqDMcSd0cvA6SKjKUP5Yem
         O922k5Yu+Dsoei4WHTuMie5HG3vW+S6ZZQSnAeu0+bqamklr/z/Sf+8B4jrS0GlVIwhL
         xqoAkFVUjzduih14maM2svPPHbwtj9MvaCQc8Cn2f5J3VKxAqP6yCsBkbKsJoXqPdvrA
         8yAxtihXXzqysNLZS9Rpr+qo6Dtlq9vPbRs77vInCtvnv1cnv1+Y9aG1JmXOTloHFYxG
         6BHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770095102; x=1770699902;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R8Uq40im68Bsn440IXZslpowd8o1+PpzUOCwvDYaiRc=;
        b=F2UdpWRXaiR1PxxRYGmjuOI4B+hSrA+ej0Lcejqq6JxGh+Z596ec1kQ32CjKUtKSfO
         m6KUND3HPAmQN79eDjZJIvxPWRw/Es70+KYI6hMP3frWF0W5AeTv8oiYrkTOdDlvj3e/
         qsSceewRyR5poSMGlNTYoCLCZj7JCi6c5ukDt4I6VHjv50ls+ZryTfXlNsRhy2imvWdB
         R8jbsCewFYuD70qeq2UclGoxNI354swNqjXcjJWJj3EasRxWtWXSCQGAfYlJFKDvPGdA
         3i3euvay1IUlryygCErmNC7GWguFnzp9hwigxyKnNHK/lqMZb0xhttiGjqlk8M3muRpt
         Djcg==
X-Forwarded-Encrypted: i=1; AJvYcCVB49Jq5VMnAsvd9PXqD/SDLvZ3/OsFPve91kdHiM07ZTXRzUtIlo4aRKXoIVc02ReR+FOrJCL5/8389w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU0SDlvAgZYwOsMyJL+Vuwilw/KE9RC63flDWkaUTIzzDzfGGU
	3k5S0VDnIS299Okz7wJu6mokeLm6JaxOE0e85uSrMGxUwWZqtEPeWpw4d5cyUGkraZcyu/691Fw
	PWHwL893vRT9pYH+nu2j0VztTj9ulXPM=
X-Gm-Gg: AZuq6aKGhFmYlNOVfPlFUHRJyGvN+OrSsA94q9Zyqk1K7JKXlgI9FpNSexaN3AEwcfa
	1cvkMMPFxQqvJ6pf/BOcl6CXf3F5Z9b1vJIeLBkaVQkWDV/laWE4JYiLyzbPJWCm+QVf5r1Qhb8
	BugO6TacvoVQJxuUX/+AgeMULQb2eTZyL2cXFU57qcr9X2pP51mrYfbbn7Z5BJfUf1EdEZcaIKg
	iFlrY6Bn97y77Xy2Ryxrt6SFB0dHZychPjEOqp/Be/sUnhnFsqjzOVTbA6jwTh0sBF5cJzB
X-Received: by 2002:a05:6512:12c4:b0:59e:1813:76ae with SMTP id
 2adb3069b0e04-59e181378f9mr4300091e87.44.1770095101318; Mon, 02 Feb 2026
 21:05:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114011917.241196-1-acelan.kao@canonical.com>
In-Reply-To: <20260114011917.241196-1-acelan.kao@canonical.com>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Tue, 3 Feb 2026 13:04:49 +0800
X-Gm-Features: AZwV_Qi2T0EhTqZVBJiCZ6adKX1ZiJrDZb_bikoYUAtxh6o1wMI284ojl7lLFWc
Message-ID: <CAMz9Wg8ez3U3qbB5AbyA_8QUkEoPyejyAhyy82+xwiH8wxi1Jw@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: set SB_I_NOEXEC and SB_I_NODEV on dmabuf filesystem
To: Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	DMARC_POLICY_REJECT(2.00)[canonical.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),reject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[canonical-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52071-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[canonical-com.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:email,mail.gmail.com:mid,canonical-com.20230601.gappssmtp.com:dkim,kaoatcanonical.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 357CBD48C5
X-Rspamd-Action: no action

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
A gentle ping, please review this patch, thanks.

--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)

