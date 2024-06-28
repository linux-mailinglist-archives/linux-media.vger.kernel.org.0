Return-Path: <linux-media+bounces-14322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BE391BC10
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 12:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14B59B21D73
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2024 10:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE60154435;
	Fri, 28 Jun 2024 10:00:09 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A6A153561;
	Fri, 28 Jun 2024 10:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719568809; cv=none; b=P4QX7F41FKncHmlP7oYzphv/6ibyrQNzZQm0oFU7S8/vaV5aFKGtTDVQjckddhsZRr0WgEnuyuswgQtczewgnsJIZMUep/0zxEy0Pf/6pn3hqRRt8FFjL/UXrTsxGiKhiqekf7A/ETL9s8jH+ZBR32P1PKJseVkk9qjfAxe1mgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719568809; c=relaxed/simple;
	bh=CgF0fdtMrFKBEO9+/Ow/VYFg8b9/1qosPCQhoWQ3G9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I9iCfv4/4jYGxEVcRYcQHWO6vPC94FdG0RJ2dwPMrMSTm0nmzPs6zbRL3rWws/zQe65VdZQsjOej2n9q2xeEYlafe5G7ss9bi2vuKm5JU1JTQzJX6J265ebGyJ1ZuV2UB+CHjrGmleP2gnC/sCgX/CgRm36XEO3AoIOVLC5EmAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 956EFC116B1;
	Fri, 28 Jun 2024 10:00:06 +0000 (UTC)
Message-ID: <32e23a79-ad3a-465f-97e3-d32cbc75019e@xs4all.nl>
Date: Fri, 28 Jun 2024 12:00:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Remove unused phy_sel variable in
 csid gen2
To: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 quic_hariramp@quicinc.com
References: <20240626074730.85-1-quic_grosikop@quicinc.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240626074730.85-1-quic_grosikop@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/06/2024 09:47, Gjorgji Rosikopulos wrote:
> The issue is introduced with:
> 
> [PATCH v4 0/8] Move camss version related defs in to resources

In the pull request I posted today I folded this patch into that 6/8 of the
patch series, rather than having this patch on top.

I forgot to mention that in my PR.

Regards,

	Hans

> 
> Signed-off-by: Gjorgji Rosikopulos <quic_grosikop@quicinc.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-gen2.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> index 2d8398a91fc2..e1c757933e27 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -260,17 +260,12 @@ static void __csid_configure_testgen(struct csid_device *csid, u8 enable, u8 vc)
>  
>  static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 vc)
>  {
> -	struct csid_testgen_config *tg = &csid->testgen;
> -	u32 val;
> -	u32 phy_sel = 0;
>  	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
>  	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + vc];
>  	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
>  								   csid->res->formats->nformats,
>  								   input_format->code);
> -
> -	if (!tg->enabled)
> -		phy_sel = csid->phy.csiphy_id;
> +	u32 val;
>  
>  	/*
>  	 * DT_ID is a two bit bitfield that is concatenated with


