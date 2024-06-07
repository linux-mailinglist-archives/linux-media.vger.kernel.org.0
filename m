Return-Path: <linux-media+bounces-12717-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D2B9000B2
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 12:24:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEB6B1C20E5B
	for <lists+linux-media@lfdr.de>; Fri,  7 Jun 2024 10:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF5A15ECDC;
	Fri,  7 Jun 2024 10:22:45 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2669315ECC0
	for <linux-media@vger.kernel.org>; Fri,  7 Jun 2024 10:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717755765; cv=none; b=DU6TY0X3CGKa+BPBLY7263OfTH7EzgWvO8Hj0JV2qjIM+sGmOF/PZ/LjxjEivdC5D9h07nW3U9WEGA6TkokJi29NtfFbx5IPgbPRIVZ7SQ0CgRlE7LbTwqCUKXSt7ICDsYyYkNNNVgmGhLNaFZPRHoQNh9pb0R2ii3S9s5kUzGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717755765; c=relaxed/simple;
	bh=AT/utfbQoGs94ENuEbaO2EgkRd8Ee9kSqZrB2OVemRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/UNpKeozclO8Jm87diinICBPXTdEoLQaK/YubDBL/X6JcvaaXJa3BFOW5hcIKBOkYy9vG3qbw1b2F2zhjrg+vLGYwTW32DVQ591RPwFunollZCadZQ96gicDT/Pm1rQyYSxsgDUqA+3ULmQzTr+DLvcpIFos3WOIBnAarlDHzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CDFC2BBFC;
	Fri,  7 Jun 2024 10:22:43 +0000 (UTC)
Message-ID: <40725a98-215a-402f-860a-90ebb4b1341c@xs4all.nl>
Date: Fri, 7 Jun 2024 12:22:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: admin-guide: Update cardlists
To: Nils Rothaug <nils.rothaug@gmx.de>, mchehab@kernel.org
Cc: linux-media@vger.kernel.org
References: <20240203124745.10257-1-nils.rothaug@gmx.de>
 <20240203124745.10257-5-nils.rothaug@gmx.de>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240203124745.10257-5-nils.rothaug@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/02/2024 13:47, Nils Rothaug wrote:
> Add a few recently supported cards.
> 
> Signed-off-by: Nils Rothaug <nils.rothaug@gmx.de>
> ---
>  Documentation/admin-guide/media/em28xx-cardlist.rst | 8 ++++++++
>  Documentation/admin-guide/media/tuner-cardlist.rst  | 2 ++
>  Documentation/devicetree/bindings/media/rc.yaml     | 1 +
>  3 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/admin-guide/media/em28xx-cardlist.rst b/Documentation/admin-guide/media/em28xx-cardlist.rst
> index ace65718ea2..7dac07986d9 100644
> --- a/Documentation/admin-guide/media/em28xx-cardlist.rst
> +++ b/Documentation/admin-guide/media/em28xx-cardlist.rst
> @@ -438,3 +438,11 @@ EM28xx cards list
>       - MyGica iGrabber
>       - em2860
>       - 1f4d:1abe
> +   * - 106
> +     - Hauppauge USB QuadHD ATSC
> +     - em28274
> +     - 2040:846d
> +   * - 107
> +     - MyGica UTV3 Analog USB2.0 TV Box
> +     - em2860
> +     - eb1a:2860

This should be merged with the patch adding MyGica UTV3 support to em28xx.

> diff --git a/Documentation/admin-guide/media/tuner-cardlist.rst b/Documentation/admin-guide/media/tuner-cardlist.rst
> index 362617c59c5..65ecf48ddf2 100644
> --- a/Documentation/admin-guide/media/tuner-cardlist.rst
> +++ b/Documentation/admin-guide/media/tuner-cardlist.rst
> @@ -97,4 +97,6 @@ Tuner number Card name
>  89           Sony BTF-PG472Z PAL/SECAM
>  90           Sony BTF-PK467Z NTSC-M-JP
>  91           Sony BTF-PB463Z NTSC-M
> +92           Silicon Labs Si2157 tuner
> +93           Tena TNF931D-DFDR1
>  ============ =====================================================

As mentioned in the review of patch 1/4, this should be merged with that patch.

> diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
> index 7bbe580c80f..dedc5a4b81e 100644
> --- a/Documentation/devicetree/bindings/media/rc.yaml
> +++ b/Documentation/devicetree/bindings/media/rc.yaml
> @@ -103,6 +103,7 @@ properties:
>        - rc-msi-digivox-iii
>        - rc-msi-tvanywhere
>        - rc-msi-tvanywhere-plus
> +      - rc-mygica-utv3
>        - rc-nebula
>        - rc-nec-terratec-cinergy-xs
>        - rc-norwood

This must be a separate patch after the patch adding the rc support.

Also CC this series to devicetree@vger.kernel.org, since that is where
changes to bindings files are reviewed.

Regards,

	Hans

> --
> 2.34.1
> 
> 


