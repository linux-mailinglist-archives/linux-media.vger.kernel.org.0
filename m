Return-Path: <linux-media+bounces-49795-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C05F7CEBB10
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 10:30:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD38C300910E
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 09:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9813195E3;
	Wed, 31 Dec 2025 09:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jWiLN4Xk"
X-Original-To: linux-media@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B363164AF
	for <linux-media@vger.kernel.org>; Wed, 31 Dec 2025 09:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767173406; cv=none; b=FkwO1+DHMrV+nVblKme8YLt8R8vXgxDnj5kUNs3gPdPl7At3pRBT3aTEktMtqmvuLsC8gt/Jtbr5Nv21L6ItGq7nwsgyln2Ak5PUcvSfhjjeVwybQW/8P43XBOFUPHrVey502b4fi87Fvh4GdZq2Vqm4kKtGFGQfZSX0X+ilGVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767173406; c=relaxed/simple;
	bh=mcb+WNmqcLIQtlYfTU4ucRU1UPv72geQQ+dKok83As0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=PbZlzdjjaU+SrilAzqia1H3dG5TkOTb4KQS0A7N1aT8wYeoUVBTM3zYuivTA9qdioSFnAt4+ThME2uVtfB/SMhwRALBeYGmwLhwpXUD075aZ/y2DpP8vUK8D1ame2URRkUeoaxdMDSf8DODprgxaZ/VLaBOfB/wBg8afL0wA0P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jWiLN4Xk; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E5D29C1AE22;
	Wed, 31 Dec 2025 09:29:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 692A860744;
	Wed, 31 Dec 2025 09:30:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1E74B113B0757;
	Wed, 31 Dec 2025 10:29:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767173399; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TkkU5jcb/hdBJx170lfeqjGUWMcCydpY7rj/NxG0hig=;
	b=jWiLN4Xk7ImoHS5S1In2EAqHaJlxyoqCz554HPg9xlz1BTd5VYseYiYAxkvVLL4B0HnMaS
	d8PMKGZNX4UwQsOxKgqHJXwFhvdhhQrPHwjDHAG9TE4NqcQPmz29uCTzfTikiXLUMP/aYM
	JLu0ZXFbQPZpBNeLzxHonZlTteQBqXmRDgffmkAdx1W/2Hs9VFPEfTtG+kmqzC/IVs2ni8
	WT88GPMvmGvoMqV575mr2xxiA7xrlZPWJC726q9Qtq+WRN/f52Qw2Y99GdC70CLU2WUpU8
	95XG+KEWVc83R+pZKKYct4KsOREF4TXkMeFOywfYv8aX2O6hEi9uKt2rAtbZCg==
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 31 Dec 2025 10:29:57 +0100
Message-Id: <DFCAOR6T9DPE.2MOL0K9O3HP1N@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] staging: media: tegra-video: move tegra210_csi_soc
 declaration to csi.h
Cc: "Jonathan Hunter" <jonathanh@nvidia.com>, "Sowjanya Komatineni"
 <skomatineni@nvidia.com>, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
To: "Sun Jian" <sun.jian.kdev@gmail.com>, "Thierry Reding"
 <thierry.reding@gmail.com>
X-Mailer: aerc 0.20.1
References: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
In-Reply-To: <20251229070125.98741-1-sun.jian.kdev@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Sun,

On Mon Dec 29, 2025 at 8:01 AM CET, Sun Jian wrote:
> Sparse warns that tegra210_csi_soc is not declared in tegra210.c.
> The symbol is referenced from csi.c, so it must remain global. Move the
> declaration to csi.h so users see it via the header and avoid extern
> declarations in .c files.

Can you please add the exact sparse message to your commit log?

>  drivers/staging/media/tegra-video/csi.c | 4 ----
>  drivers/staging/media/tegra-video/csi.h | 4 ++++
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/me=
dia/tegra-video/csi.c
> index 604185c00a1a..3c3f6e3fd1ec 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -835,10 +835,6 @@ static void tegra_csi_remove(struct platform_device =
*pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
>
> -#if defined(CONFIG_ARCH_TEGRA_210_SOC)
> -extern const struct tegra_csi_soc tegra210_csi_soc;
> -#endif
> -
>  static const struct of_device_id tegra_csi_of_id_table[] =3D {
>  #if defined(CONFIG_ARCH_TEGRA_210_SOC)
>  	{ .compatible =3D "nvidia,tegra210-csi", .data =3D &tegra210_csi_soc },
> diff --git a/drivers/staging/media/tegra-video/csi.h b/drivers/staging/me=
dia/tegra-video/csi.h
> index 3e6e5ee1bb1e..609c5952e050 100644
> --- a/drivers/staging/media/tegra-video/csi.h
> +++ b/drivers/staging/media/tegra-video/csi.h
> @@ -130,6 +130,10 @@ struct tegra_csi_soc {
>  	unsigned int tpg_frmrate_table_size;
>  };
>
> +#if defined(CONFIG_ARCH_TEGRA_210_SOC)
> +extern const struct tegra_csi_soc tegra210_csi_soc;
> +#endif

Looks like a good idea indeed.

I checked how other structs shared across .c files are implemented by using
'git grep -w extern -- drivers/staging/media/tegra-video/' and I
discovered:

 * tegra20_vip_soc uses the exact same pattern you are fixing (extern
   declaration in .c file)
 * tegra20_vi_soc and tegra210_vi_soc have the extern declaration in an
   include file already, as you are proposing

So it would be nice to convert tegra20_vip_soc as well, in the same way as
tegra210_csi_soc. It can be a second patch in your v2 series.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

