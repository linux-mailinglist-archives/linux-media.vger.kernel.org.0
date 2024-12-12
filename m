Return-Path: <linux-media+bounces-23338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0109EEDC0
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 16:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89BBB164AD8
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 15:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3108121E0AE;
	Thu, 12 Dec 2024 15:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="jFwYQYLI"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA870222D59;
	Thu, 12 Dec 2024 15:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734018304; cv=pass; b=JwJvcjOWEvbdIiHNXEAEypEy/zSBvL2q2vd6g2pd+aSvqrMZnC2D+SdDBXZuWOz14YQ+jouexaCHI06qj0I3LdLRulop4INIIXw79i3KKTSFN9nvewMtWMBA8OU7vpAjhk2hsn2nHuC4nw5sjorVeEgrLQOquick+EM1P7Y6u0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734018304; c=relaxed/simple;
	bh=PVvOYhteQt/W34vlzLIOZu/OrN2/wktZb+MQBqw5I0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gjYqIiDfeckCsV+O6/P/Hm4svs4kTM/dfgla3DJrxyqf7JKNn2t6AwVO93PqVsyvNDgynV32xpTkQLPyIrWpcyIDOtli6VN3zauIMMOUk0jYmP9GrEfnalx4BaH83UV83FKKIVqmHhlh/hslEncTBhjJHsy21dMKiscIj21cvHk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=jFwYQYLI; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1734018279; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bEzMQTO495WOxsE00l2/3H9gHcbvt1ILP7zAa3dkOhO40kA9C4/7fXmaQfDUNe0VEmJYYGjsyyHOcH8TfFV2R4Jo/Lzi62aVsslpOY+hb9lMpKqHp1v2MfgyyebfKMoI5Yk7BnseczjJfXAjbeF3zzrF/UdC576fKRN/b+n8VWo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1734018279; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=QRMCv1tG0lvAEJlwsZhhip2MIboiG2RgXcTqJTaG+EA=; 
	b=b4R4Sqi+R04TU0FF8Ff4fWQALubLC+MIPdm/3yw8xhsbdilKLboyk2Sq6CrmZSLgN1zJexg2+SMyY5wIk4tFVygzku9kQ5Zgl87aeyI2DznbLSlrW5CF+df6UCO8AkQZMc+eGuNgrgSyneBt4nV8M+nnAUqZaItOyPwzRZc2e6Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1734018279;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=QRMCv1tG0lvAEJlwsZhhip2MIboiG2RgXcTqJTaG+EA=;
	b=jFwYQYLI4atho5DbRERvwwWjwPHr9Qxwt1qhTSwFwaRDCrzk7rFTAmHOhIQqrz9l
	P338+J/5FMdANB9/jj4tdSarxGbJoyBUQrojVNTSf+lqLH8x0PQuOfk82p3MsIWu0dG
	W5sp/7P3zoi8UlYCZAkVrQpAsg3r/2imvtGplJ2c=
Received: by mx.zohomail.com with SMTPS id 1734018277894547.7282054868983;
	Thu, 12 Dec 2024 07:44:37 -0800 (PST)
Message-ID: <c7af1854-cb98-41d5-946c-00fe4f4584bd@collabora.com>
Date: Thu, 12 Dec 2024 16:44:34 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] media: hantro: Replacement maintainers
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
 hverkuil-cisco@xs4all.nl, mchehab@kernel.org, p.zabel@pengutronix.de,
 kernel@collabora.com, linux-kernel@vger.kernel.org
References: <20241210212518.1587395-1-nicolas.dufresne@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20241210212518.1587395-1-nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 10/12/2024 à 22:25, Nicolas Dufresne a écrit :
> As per a long time request from Ezequiel who left the project around
> 2020, replace the top maintainers with Benjamin and myself, keeping
> Philipp who is still active in the subsystem.
>
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

> ---
>   MAINTAINERS | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1e930c7a58b1..00e95d6512f7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -10030,7 +10030,8 @@ F:	include/trace/events/handshake.h
>   F:	net/handshake/
>   
>   HANTRO VPU CODEC DRIVER
> -M:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> +M:	Nicolas Dufresne <nicolas.dufresne@collabora.com>
> +M:	Benjamin Gaignard <benjamin.gaignard@collabora.com>
>   M:	Philipp Zabel <p.zabel@pengutronix.de>
>   L:	linux-media@vger.kernel.org
>   L:	linux-rockchip@lists.infradead.org
>
> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37

