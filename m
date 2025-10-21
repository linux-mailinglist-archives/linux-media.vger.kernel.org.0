Return-Path: <linux-media+bounces-45141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DF4BF77E9
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 17:51:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6EC5535663F
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 15:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7686345CBC;
	Tue, 21 Oct 2025 15:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXMrDyH9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F543451C1;
	Tue, 21 Oct 2025 15:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761061774; cv=none; b=GWBkYxEwKC9fkSvB07xVVBW0CKl9D0ihwC7xtLtpDvC6mVkoaKjTjzp1MRtD3ZqZBj9dWPza1qEMK8bLlSmu9bqwIs7Uj7R33EVHpYM07p0LWQsOBKvsaft7Mxuh9IXeqdLNtsGX0ViMYf1w69RaVENOh275PyYf3XxEK8VLs+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761061774; c=relaxed/simple;
	bh=7mxg1xQod38wQEI4CXVSAADkgWs7WH+NuH4jrC7MOak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JuFloQMV3TYZbs3+WRojDQRRtYmybpWF1DR8IWaIy1qT7PJipth75EAL9yRSrApgptBap9T+sAh0IciTf7KvFPf7a+7ZJ+9nXpO41wC0ibZoCprd5mgNNXSQt8n/Lc7Ra7rY7rLt+ifZz/axxdP8Po6Avm22oa+zSOfUCSYX0uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXMrDyH9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D828C4CEF1;
	Tue, 21 Oct 2025 15:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761061771;
	bh=7mxg1xQod38wQEI4CXVSAADkgWs7WH+NuH4jrC7MOak=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cXMrDyH9/wMYjhbk7LieUtG65ffuApqJ/9UqNq1f1qddifADj8SCu8TZND0bi1yEM
	 hDPIEr7vvpuMJNPgrErFWPLDDDco0kwYkBSgBn2WRVg5vTyJQgTX0xEwklHGhXVlFB
	 CPO1PRY3W6azAaLuJOVebIFWBe4/+tZq1G3G5I8riIzm2/a8P//zCUN7eu1J28kfXd
	 b6msOZBy1kH0rC4vgk1wok8O8XB3lSFsBaZLLZzMpEUkjQzJ8fCNdACRlqrrgXGx36
	 dx7qlaONgzR8ClnpHaDhPeeSuuE2IcdBMUozkjmMtxwETvw/G4/ausfbziJhT+JlSj
	 D2L2JNnul/RFg==
Message-ID: <c6b73659-bf0f-4967-ae21-c9f1a1401edb@kernel.org>
Date: Tue, 21 Oct 2025 17:49:27 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: ov13b10: Add ACPI ID for ASUS Z13 Flow laptop
To: "Adam J. Sypniewski" <ajsyp@syptech.net>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Arec Kao <arec.kao@intel.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <aPecNTw6RHzprJ6e@garrus> <aPeeuSdxRL_JXfE9@kekkonen.localdomain>
 <aPeqy11m-TxwbzJV@garrus>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <aPeqy11m-TxwbzJV@garrus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 21-Oct-25 17:46, Adam J. Sypniewski wrote:
> The ASUS ROG Flow Z13 2025 (GZ302) laptop uses an OV13B10 sensor with a
> non-standard ACPI ID of OMNI13B1 instead of the expected OVTI13B1.
> 
> Add this ACPI ID to the driver to make the front-facing camera work on
> these laptops.
> 
> Signed-off-by: Adam J. Sypniewski <ajsyp@syptech.net>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hansg@kernel.org>

Regards,

Hans



> ---
> Changes in v2:
>  - Added comment explaining the ASUS-specific ACPI ID (Sakari)
> 
>  drivers/media/i2c/ov13b10.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
> index 869bc78ed792..5421874732bc 100644
> --- a/drivers/media/i2c/ov13b10.c
> +++ b/drivers/media/i2c/ov13b10.c
> @@ -1693,6 +1693,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov13b10_pm_ops, ov13b10_suspend,
>  static const struct acpi_device_id ov13b10_acpi_ids[] = {
>  	{"OVTIDB10"},
>  	{"OVTI13B1"},
> +	{"OMNI13B1"},   /* ASUS ROG Flow Z13 (GZ302) uses this ACPI ID */
>  	{ /* sentinel */ }
>  };
>  
> 
> base-commit: 1fdb55ed40fa5ebe6934bd6b93036c714ebb5ef8


