Return-Path: <linux-media+bounces-36819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE56AF8EF3
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4274C1CA43D5
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 09:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B43FF2EA490;
	Fri,  4 Jul 2025 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gURBsIeN"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18685A2D;
	Fri,  4 Jul 2025 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751622183; cv=none; b=YupVVKCC+nGrEGNamzflUL9tn8vvcfP/ijk6maI1Zqx+jC/eJcxfrc9dN+JqZOQdHa2v/AhCeaxWWt//PbKdLI9ClTICSwDPq7AM02c2tqS1G7XVy2Rb9EcA3A35CZJfmr6fxd7Qe3cUAfME/pg+t72CbyELiVuK5XYz77CSnh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751622183; c=relaxed/simple;
	bh=5eb6AKCbpHuIGf13tSNQmtmiiVKq+2jlzkApt8oVY6s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oaAg6B8VPd68GKOVN0GFTYg+DALtv8bZ0Ii/NeWzwshmzy1sznhixM/+PSE29sJ7ACNYDH+B1tjGT+A2abLn51ENa0hr3Zpcws7r+Vf0uC/9iTqeeICxapL6KqE/Z6nuxNsQtRm22vzNQ0sagYeMvhKfkpfVd+uRyJpIozlf8CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gURBsIeN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343A2C4CEE3;
	Fri,  4 Jul 2025 09:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751622182;
	bh=5eb6AKCbpHuIGf13tSNQmtmiiVKq+2jlzkApt8oVY6s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gURBsIeNGdjDFKqABlcuncjz1243ZRy45f/kRPdAyPmhsWxh1x9lrh9X/WJ+rRqKp
	 Jwt/6UNnKNjGypQxQdJDsYwPf2dI89i3DX5TKiBo0FvPk2cAzDa7yYaQeg53CCULsd
	 SHlDd+n2SoJLwI7Ffcv0sOpVoNKU8WLfu1q2u+xMo7MntFZBxymOZjGjIREwgugHq1
	 LwMXinKhgBQ3mZrymfpq2Qr+4Q3GsoGfeZlYBBVmHSoyOhdCyWt0kl7R5r/QjEfK4C
	 QLzmvQ+KF2aykYDaLE1qW8r+x7uFJ8ZtVEwiP0B4CqrX8f1MPgmLbr2INz3kvTwpcI
	 axbqlCOmpM+Mg==
Message-ID: <d0614e1c-2966-4766-999c-2bc58d643e7e@kernel.org>
Date: Fri, 4 Jul 2025 11:42:58 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media: atomisp: fix coding style
To: Pablo <pablo@pablo.ct.ws>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
 hdegoede@redhat.com, mchehab@kernel.org, sakari.ailus@linux.intel.com,
 andy@kernel.org, gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht, koike@igalia.com, pablolucas890@gmail.com
References: <20250503200030.5982-1-pablo@pablo.ct.ws>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <20250503200030.5982-1-pablo@pablo.ct.ws>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3-May-25 10:00 PM, Pablo wrote:
> Fix a coding style:
> "ERROR: that open brace { should be on the previous line"
> issue reported in ia_css_vf.host.c:94.
> 
> Signed-off-by: Pablo <pablo@pablo.ct.ws>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans



> ---
>  Hey, this is my first patch, I apreciate any feedback, thanks!
>  .../media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c   | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> index ece5e3da3..0ce75d9bd 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> @@ -91,8 +91,7 @@ configure_kernel(
>  	unsigned int vf_log_ds = 0;
>  
>  	/* First compute value */
> -	if (vf_info)
> -	{
> +	if (vf_info) {
>  		err = sh_css_vf_downscale_log2(out_info, vf_info, &vf_log_ds);
>  		if (err)
>  			return err;


