Return-Path: <linux-media+bounces-10679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA6F8BABCB
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 13:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EA1FB21408
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2024 11:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B45152524;
	Fri,  3 May 2024 11:41:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495A0139CF8;
	Fri,  3 May 2024 11:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714736481; cv=none; b=cJbvdHmX+2+iwqK0fryilt6ZQn28GF7EWE4eLA2iVIEtvFsEt00DJmcIW6IvqpwlOsf4LxhsqWIDK8PGVzwN5nCqyjSt7h8lefTahJWzSBevP6/PHKyc+1z6Qu+/82G7NMi1M5202ktLV87anT53FQa5wJTbiLZHrUquK7bZz2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714736481; c=relaxed/simple;
	bh=paeAkz+bILIyndefnz3puskAYJmZsO3+RT1VHMdrofU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tm7MPvkXTMuF69IrIYWIj/ekIVKG7AjoYKWjh1Aq9qpxaoNgAEATdaYDxGXbiQqCFp3Ia/tXvW70JTibl7Z8CWH1ntjggvAHmmcfKuI1T3pzYhlYrppgv1kvK8cEfIASIA6Kj/4VhFDPmuzzK6UkPuvslXry0iLVIkNWpR1VRsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54BBC116B1;
	Fri,  3 May 2024 11:41:19 +0000 (UTC)
Message-ID: <60c08e6b-4a1b-408b-9317-3abe1346cdc5@xs4all.nl>
Date: Fri, 3 May 2024 13:41:17 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: cec.h: Fix kerneldoc
Content-Language: en-US, nl
To: Ricardo Ribalda <ribalda@chromium.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240503-fixdoc-v1-1-44d26e6f9dba@chromium.org>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240503-fixdoc-v1-1-44d26e6f9dba@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/05/2024 13:33, Ricardo Ribalda wrote:
> is_claiming_log_addrs documentation was missing.
> 
> fix this kernel-doc warning:
> include/media/cec.h:296: warning: Function parameter or struct member 'is_claiming_log_addrs' not described in 'cec_adapter'
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Hmm, that happens when you don't run your own patches through the build tests :-(

Regards,

	Hans

> ---
> https://gitlab.freedesktop.org/linux-media/media-staging/-/pipelines/1169148/test_report?job_name=doc
> ---
>  include/media/cec.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/media/cec.h b/include/media/cec.h
> index d3abe84c9c9e..d131514032f2 100644
> --- a/include/media/cec.h
> +++ b/include/media/cec.h
> @@ -187,6 +187,7 @@ struct cec_adap_ops {
>   *	in order to transmit or receive CEC messages. This is usually a HW
>   *	limitation.
>   * @is_enabled:		the CEC adapter is enabled
> + * @is_claiming_log_addrs:  true if cec_claim_log_addrs() is running
>   * @is_configuring:	the CEC adapter is configuring (i.e. claiming LAs)
>   * @must_reconfigure:	while configuring, the PA changed, so reclaim LAs
>   * @is_configured:	the CEC adapter is configured (i.e. has claimed LAs)
> 
> ---
> base-commit: 1aa1329a67cc214c3b7bd2a14d1301a795760b07
> change-id: 20240503-fixdoc-d1380eb243cd
> 
> Best regards,


