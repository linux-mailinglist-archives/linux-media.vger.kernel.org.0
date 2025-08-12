Return-Path: <linux-media+bounces-39616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 972B5B22E95
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 19:10:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 894033BB28A
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 17:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F98F2F83C6;
	Tue, 12 Aug 2025 17:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="h1kA7+0I"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBED1A9FB7;
	Tue, 12 Aug 2025 17:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755018504; cv=pass; b=KV+6q8b3sHuuwWU+iFQlb48XAGQUetbde2kc3UAyxGbx1J97M61t489Z6X5MQC4NoJ5i0FUCz/K2d0s0ySM0FQ1STU3ODK2tmCf5o1pIJJg3TpqXIAbOpzB/EQ5sxvT3fOFSR/OLIejHUxUbcd0+LX+4gh3JWJ+iUQ1dZSj6Xwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755018504; c=relaxed/simple;
	bh=nQ/ztbq3yjkUYINidoautnSKxc9fr9+WkgQ0va3g8XE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dn6P9AMi6QC15cEbX7nC1LTcG+l/AQyd04/PHitdjak/+nUHXNwpHl4/y5n1PYdK2uERKEFz9w1uzbzsvYClBJ7Pr8Gkxq8lbddRgV1CFTyg6dpPOvT4f/QUCeRetaFg2uVmh4yjrI3vBXtmk3PyElGmDnSM/SzJ7UwCIv+Q1WU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=h1kA7+0I; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1755018476; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X2+6LwOk6qAv9zrq6LA5lWJtwOuVWCKOYnHqz+/wya1EJ7ZFLuBXrXwPuSE5Y09kXg9IW+ufBGm+8my9JZ0G0NaK1Hr2RaQ+Lq1IzsVM1UWAfnj97rhqerSSWRLjTS9w/iwPgsVhn/k1cBgfLVyE8tYPGyAA+XYPDvo7fd6AcJ4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755018476; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sw4HIiGpcTlEANcKneYpvYEeePB5QhOBB0MDbHc9D3c=; 
	b=DydPo1JcWKdDn1l5azr8mzuF8AMH/N0ACJ6fHZBdW0i14ZqlJgQZW4PNP9C4UusAHku6ZQlbSF/gokc+99CObc2Ly4q1H6BwSuh8AVIX0mylFmQtsu56RhlToq3RcFL5ihY8ZcI30T4AWIPJp6IS1ccfLHdxzdiX+KPFIFb1kdM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755018476;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=sw4HIiGpcTlEANcKneYpvYEeePB5QhOBB0MDbHc9D3c=;
	b=h1kA7+0Ixsm5zg0SIUI3cJXY0kA3JL2n/i4eyh20FfZKM4fe0xcNwT6EgM15ZOqz
	clya8QxUyjydBdtY+7ZYDY2PeYd/sEVspUvj9ic1w/Q92BqmykR2RIn2LA/ReGuqQel
	Te6aYj3DP5kBM8m4Nf55CcEnK8QafOaPGGNob5Os=
Received: by mx.zohomail.com with SMTPS id 1755018474668548.5768361747636;
	Tue, 12 Aug 2025 10:07:54 -0700 (PDT)
Message-ID: <f3b7414c-8182-4018-951b-b6c64653c38d@collabora.com>
Date: Tue, 12 Aug 2025 20:07:50 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] media: rkvdec: Add H264 support for the VDPU381
 variant
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
 <20250808200340.156393-10-detlev.casanova@collabora.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20250808200340.156393-10-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 8/8/25 23:03, Detlev Casanova wrote:
> +static struct rcb_size_info vdpu381_rcb_sizes[] = {
> +	{6,	PIC_WIDTH},	// intrar
> +	{1,	PIC_WIDTH},	// transdr (Is actually 0.4*pic_width)
> +	{1,	PIC_HEIGHT},	// transdc (Is actually 0.1*pic_height)
> +	{3,	PIC_WIDTH},	// streamdr
> +	{6,	PIC_WIDTH},	// interr
> +	{3,	PIC_HEIGHT},	// interc
> +	{22,	PIC_WIDTH},	// dblkr
> +	{6,	PIC_WIDTH},	// saor
> +	{11,	PIC_WIDTH},	// fbcr
> +	{67,	PIC_HEIGHT},	// filtc col
> +};
> +
> +const struct rkvdec_config config_vdpu381 = {

Nit: config_vdpu381 should be declared as "static", same for
config_vdpu383 in the next patch

-- 
Best regards,
Dmitry

