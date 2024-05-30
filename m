Return-Path: <linux-media+bounces-12237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAFD8D4BC3
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 14:36:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0097BB22090
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 12:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37BE132135;
	Thu, 30 May 2024 12:36:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5285C13211A;
	Thu, 30 May 2024 12:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717072561; cv=none; b=r+JjJgXsZaaoiw87AAQlMaAM8A/IITEZnNvVIV8mezWa3ZVtayQewRi2OhEwfFLM5ZDWToQ40ARjxCDUOYsWo4XJNNxfzGGlXU0/FbhKl4wWPnLPFyL1DZ0Pj5IrK26N/hyYa73P6HbHgVGx2OPkNRWk8HEZIgXuzM85ikbptuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717072561; c=relaxed/simple;
	bh=i2HOgw4DS47a0JetgtSIdSIeoVBUTYiDeC6YAe4KxTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gdakesrjriSzITxFwouf3epdEZ+CutLHGNHlwGZHVPu8swuZ9dYqL/pfBnjwG/q5gQAyNTzcprP6N04/0sAnpaGbZO5ZKDsGQo5BQa86f9d4lLObxabVRLLwBjR3NAj2NhTIKZFWN4YnqeNFxVeARTYI1lTnpoBhUVChZiLE0m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386D7C2BBFC;
	Thu, 30 May 2024 12:35:58 +0000 (UTC)
Message-ID: <d1e1a574-4dab-42bf-98d4-ed673de9f5b3@xs4all.nl>
Date: Thu, 30 May 2024 14:35:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/18] media: dvb-frontend/mxl5xx: Use flex array for
 MBIN_SEGMENT_T
To: Ricardo Ribalda <ribalda@chromium.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
 <20240527-cocci-flexarray-v3-4-cda09c535816@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240527-cocci-flexarray-v3-4-cda09c535816@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/05/2024 23:08, Ricardo Ribalda wrote:
> Replace the older style one-element array with a flexible array member.
> There does not seem to be any allocation for this struct in the code, so
> no more code changes are required.
> 
> The following cocci warning is fixed:
> drivers/media/dvb-frontends/mxl5xx_defs.h:182:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/dvb-frontends/mxl5xx_defs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/dvb-frontends/mxl5xx_defs.h b/drivers/media/dvb-frontends/mxl5xx_defs.h
> index 3c5d75ed8fea..512ec979f96f 100644
> --- a/drivers/media/dvb-frontends/mxl5xx_defs.h
> +++ b/drivers/media/dvb-frontends/mxl5xx_defs.h
> @@ -179,7 +179,7 @@ struct MBIN_SEGMENT_HEADER_T {
>  
>  struct MBIN_SEGMENT_T {
>  	struct MBIN_SEGMENT_HEADER_T header;
> -	u8 data[1];
> +	u8 data[];
>  };
>  
>  enum MXL_CMD_TYPE_E { MXL_CMD_WRITE = 0, MXL_CMD_READ };
> 

While this patch looks good to me, I'll skip it until my comment for the
previous patch is addressed. Actually, I think the two patches should be
combined, but I leave that up to you.

Regards,

	Hans

