Return-Path: <linux-media+bounces-12092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4528D1D9E
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 15:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5238A2824D8
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 13:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065C716F8E7;
	Tue, 28 May 2024 13:53:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBAE13AD30
	for <linux-media@vger.kernel.org>; Tue, 28 May 2024 13:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716904380; cv=none; b=QNxYa/FUj+ft645Y0y5tI3YXfJs8YR6t/7THtxGvNmY52d43BFuwnoFuWr7CKPyiKL7jKCnIKW/i83mDI43tX2UzrYmeytm/HcfkchPjuK2buDU1SA49+CmWXn1iHxKDWs2wMcmL1DKBHwlzYvBlS6asy1G740GN+kJktqFWDl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716904380; c=relaxed/simple;
	bh=3Pj74Nu4ktesHuDG3HthgKkc3BF0Puu51mhNC0syUjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2RmfRZZeOWkbwaHi8WgJVeAPt/slkzF1ZZfde8uahRA0Ahw+wbaIkZVI5yGUbXgZ7RdwTDzHzEJu33tboAAJZK2DKPttJdVqJsgTLn2XbaNjEoIhas4zfu4rxrczcuwWp5aEdE3lCGUPtjbp/V5alq1b0N/xtZPRid2oI+4ZO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mtr@pengutronix.de>)
	id 1sBxFG-0003PP-VL; Tue, 28 May 2024 15:52:06 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <mtr@pengutronix.de>)
	id 1sBxFE-003Kql-Le; Tue, 28 May 2024 15:52:04 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mtr@pengutronix.de>)
	id 1sBxFE-001NEu-1o;
	Tue, 28 May 2024 15:52:04 +0200
Date: Tue, 28 May 2024 15:52:04 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	Andy Walls <awalls@md.metrocast.net>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v3 01/18] media: allegro: nal-hevc: Replace array[1] with
 arrray[N]
Message-ID: <ZlXhhPtE0EP8PE-L@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michal Simek <michal.simek@amd.com>,
	Andy Walls <awalls@md.metrocast.net>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org>
 <20240527-cocci-flexarray-v3-1-cda09c535816@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240527-cocci-flexarray-v3-1-cda09c535816@chromium.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

Typo in the subject: arrray -> array

On Mon, 27 May 2024 21:08:51 +0000, Ricardo Ribalda wrote:
> Structures that have a single element array as the last field can be
> mistaken as a "flex array".
> 
> We could replace all the single element arrays in the structure with
> single element fields, but this driver prefers to follow the ITU-T H.265
> specification, which defines it as an array.
> 
> If we introduce a new define N_HRD_PARAMETERS, we make clear our
> intentions.

N_HRD_PARAMETERS -> N_HRD_PARAMS

> 
> This fixes this cocci warning:
> drivers/media/platform/allegro-dvt/nal-hevc.h:102:14-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

With that fixed

Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

> ---
>  drivers/media/platform/allegro-dvt/nal-hevc.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/nal-hevc.h
> index eb46f12aae80..361e2f55c254 100644
> --- a/drivers/media/platform/allegro-dvt/nal-hevc.h
> +++ b/drivers/media/platform/allegro-dvt/nal-hevc.h
> @@ -96,10 +96,11 @@ struct nal_hevc_vps {
>  	unsigned int extension_data_flag;
>  };
>  
> +#define N_HRD_PARAMS 1
>  struct nal_hevc_sub_layer_hrd_parameters {
> -	unsigned int bit_rate_value_minus1[1];
> -	unsigned int cpb_size_value_minus1[1];
> -	unsigned int cbr_flag[1];
> +	unsigned int bit_rate_value_minus1[N_HRD_PARAMS];
> +	unsigned int cpb_size_value_minus1[N_HRD_PARAMS];
> +	unsigned int cbr_flag[N_HRD_PARAMS];
>  };
>  
>  struct nal_hevc_hrd_parameters {
> 
> -- 
> 2.45.1.288.g0e0cd299f1-goog
> 
> 

