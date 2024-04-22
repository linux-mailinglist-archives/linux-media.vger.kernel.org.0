Return-Path: <linux-media+bounces-9858-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF798ACB17
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 12:45:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E38541F2110D
	for <lists+linux-media@lfdr.de>; Mon, 22 Apr 2024 10:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99D7146015;
	Mon, 22 Apr 2024 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="sAV46Mlu"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284353F9D9
	for <linux-media@vger.kernel.org>; Mon, 22 Apr 2024 10:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713782465; cv=none; b=D2PMOIYkP4B+7Tb78Uf24F8UsaQF+hJyH0h8PFGndavKSlgAbUFB9JaaVdOpufvuu9j28xLHi4PhcICz9WuOsEPAlcjcqU9ssUqvq/CFVG68slndAUZDa0bbD7zdC9RHNcbdzT2JHspXzn75GKm+e32A/xpxaiPTq13NP7JBIfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713782465; c=relaxed/simple;
	bh=0/FuL1763EfwXkYTOme+h1N6UJkGwHoc750RhuhBDyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H47rtJuDW1T73+BzqwtTr/W4t5q8GosYVC/7a/h8ljuNRz++HCSnxOBJtkObDHcmErUgA7Z6ILI3hluHoUC4Jiy2CZaaFssm8IsfdT+raGoJqNFfNtwjSoCCYjuxvof/0djAe2yk1DscqtSTVbag8vLX1yCra6Z8GGpOw63KRyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=sAV46Mlu; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1713782422; bh=0/FuL1763EfwXkYTOme+h1N6UJkGwHoc750RhuhBDyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sAV46MluopTAg4UbF1VDovZ2UcD0Yy1UsxAku3K4SpRwxJgEqmD70/1RQyfZGUl1H
	 Iqu9+wtWZawdNM3YrSAVZuKPAA9Hh4yMF4VekNeMxnIfDDVs/SSLv7gtLamVqIDjKZ
	 sp6TqaPGTuRyiotp5FDRE7kY88DRphE5UAlRBI20wbQbXdKTbYSbl7cyECbfdGlvrf
	 nVH5auMK+emmIQnwAvyUTvLQcbsACNICauK2ZNMISxP8OGnIguI+xW3b3TVoy2Jv+v
	 HOyozVTMUUdIzawsRfHAtJsIlRAFFAbNUlUNTpmn2U3OK04bBruX0Nd6C4F84rPf1M
	 QiTdiLJM7NFaw==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id F29221000FF; Mon, 22 Apr 2024 11:40:22 +0100 (BST)
Date: Mon, 22 Apr 2024 11:40:22 +0100
From: Sean Young <sean@mess.org>
To: vricosti <vricosti@outlook.com>
Cc: linux-media@vger.kernel.org
Subject: Re: [PATCH] keytable: fix stdout/stderr inconsistency
Message-ID: <ZiY-llWtQYmiPRS3@gofer.mess.org>
References: <BL3PR19MB65145B42CD9A31304D6DF5CED30C2@BL3PR19MB6514.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BL3PR19MB65145B42CD9A31304D6DF5CED30C2@BL3PR19MB6514.namprd19.prod.outlook.com>

On Sat, Apr 20, 2024 at 05:01:14PM +0200, vricosti wrote:
> This patch fix the keytable inconsistency about stdout/stderr.  
> 
> Signed-off-by: Vince Ricosti <vricosti@outlook.com>
> ---
>  utils/keytable/keytable.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/keytable/keytable.c b/utils/keytable/keytable.c
> index 9f7575d6..5f5b88dd 100644
> --- a/utils/keytable/keytable.c
> +++ b/utils/keytable/keytable.c
> @@ -1728,7 +1728,7 @@ static int get_rate(int fd, unsigned int *delay, unsigned int *period)
>         }
>         *delay = rep[0];
>         *period = rep[1];
> -       printf(_("Repeat delay: %d ms, repeat period: %d ms\n"), *delay, *period);
> +       fprintf(stderr,_("Repeat delay: %d ms, repeat period: %d ms\n"), *delay, *period);

You're right, there is a problem there. I've found a few more instances of
stdout being used rather than stderr, I'll post an update patch shortly.


Sean

