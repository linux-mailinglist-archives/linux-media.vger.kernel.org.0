Return-Path: <linux-media+bounces-12236-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9658D4BB9
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 14:33:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7C921C2227F
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2024 12:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2A0132123;
	Thu, 30 May 2024 12:33:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5CE18309F;
	Thu, 30 May 2024 12:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717072402; cv=none; b=Mz7Tg3+Cp2pq5QDFq8+snv10nhI918OngvDq/J92zqH1h4sOC62/60Of2j1mIr21cKKl7cBHuohZFn1DIfsfXqRTfQaKYFm50/0CieNnikCU+bJFvi57n+FplXk2pPIYnGxVgfr9xbBhH5baYWc5KfY/eyJd2LY+1gqrN5aG8hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717072402; c=relaxed/simple;
	bh=2D+tP+irQK0VLIbOTiKIw++x+RqzlOCBamg7qaJLCtg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DyztHDKWnbj5hc7mF0hEHCRYlDYvatqFWRgP50M77DgPwBxHKWgE42z0kH1ojJ5pAFYxcjiQZ4vk+XuR1jDqeZrGlRDUVn7rGnMAdjSkCLL8Znp57FO0kLAI+0QgAWTAer0LqdtI35cnFu4GQ4X3lgTF3mtkG7/ifNFhqpXLHRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F6EC2BBFC;
	Thu, 30 May 2024 12:33:19 +0000 (UTC)
Message-ID: <6823bc58-9461-4a54-b5b3-7ea5c46fc68b@xs4all.nl>
Date: Thu, 30 May 2024 14:33:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/18] media: dvb-frontend/mxl5xx: Refactor struct
 MBIN_FILE_T
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
 <20240527-cocci-flexarray-v3-3-cda09c535816@chromium.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20240527-cocci-flexarray-v3-3-cda09c535816@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/05/2024 23:08, Ricardo Ribalda wrote:
> Replace a single element array, with a single element field.
> 
> The following cocci warning is fixed:
> drivers/media/dvb-frontends/mxl5xx_defs.h:171:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/dvb-frontends/mxl5xx.c      | 2 +-
>  drivers/media/dvb-frontends/mxl5xx_defs.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/dvb-frontends/mxl5xx.c b/drivers/media/dvb-frontends/mxl5xx.c
> index 91e9c378397c..a15c0438b07a 100644
> --- a/drivers/media/dvb-frontends/mxl5xx.c
> +++ b/drivers/media/dvb-frontends/mxl5xx.c
> @@ -893,7 +893,7 @@ static int do_firmware_download(struct mxl *state, u8 *mbin_buffer_ptr,
>  	status = write_register(state, FW_DL_SIGN_ADDR, 0);
>  	if (status)
>  		return status;
> -	segment_ptr = (struct MBIN_SEGMENT_T *) (&mbin_ptr->data[0]);
> +	segment_ptr = (struct MBIN_SEGMENT_T *)(&mbin_ptr->data);
>  	for (index = 0; index < mbin_ptr->header.num_segments; index++) {
>  		if (segment_ptr->header.id != MBIN_SEGMENT_HEADER_ID) {
>  			dev_err(state->i2cdev, "%s: Invalid segment header ID (%c)\n",
> diff --git a/drivers/media/dvb-frontends/mxl5xx_defs.h b/drivers/media/dvb-frontends/mxl5xx_defs.h
> index 097271f73740..3c5d75ed8fea 100644
> --- a/drivers/media/dvb-frontends/mxl5xx_defs.h
> +++ b/drivers/media/dvb-frontends/mxl5xx_defs.h
> @@ -168,7 +168,7 @@ struct MBIN_FILE_HEADER_T {
>  
>  struct MBIN_FILE_T {
>  	struct MBIN_FILE_HEADER_T header;
> -	u8 data[1];
> +	u8 data;

From what I can tell, shouldn't this be 'data[]'? It really appears to be a flexible array.

Regards,

	Hans

>  };
>  
>  struct MBIN_SEGMENT_HEADER_T {
> 


