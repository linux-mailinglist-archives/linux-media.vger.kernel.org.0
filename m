Return-Path: <linux-media+bounces-19135-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A04DB991FB5
	for <lists+linux-media@lfdr.de>; Sun,  6 Oct 2024 18:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AAE0281F29
	for <lists+linux-media@lfdr.de>; Sun,  6 Oct 2024 16:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D30189B85;
	Sun,  6 Oct 2024 16:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bWfdxAIu"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F8A189913
	for <linux-media@vger.kernel.org>; Sun,  6 Oct 2024 16:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728233211; cv=none; b=qVKD4Ro09RP8G7JEWZsdn5JJF++sSanA7FmlmcVweWfmWLj9inJoskqQXx6EXfvfMco1Tw2quWtMXMW1AvN5Mwre3+1ZdEy4Wp8ut4gVJ2deDTOU+MN5TSE2FFlntUeLhb5kVhRXkRJTpS7VTD3B59BUzBp8Ucqmxfad7z+wTdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728233211; c=relaxed/simple;
	bh=uY7HvmO31wS8btb8XYVjlRLPqrYljxar4akr/+JgmGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BkCMSRt2XUaBT/VLOVE+uw9dn29kqp/i+muKoz6aEju0ASQ7tOpSKFFsllYmOf82H/PG86X9o5KCs7nxEGNaPZza6G6Y+vh3lM1Ua4DLVWyNpkmn8ZUiAKj4/wcognzNQDK4+R3DVo4d7HXm0ftcgIN0MSLQGQh2Gvo17VOmKYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bWfdxAIu; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53992157528so3883863e87.2
        for <linux-media@vger.kernel.org>; Sun, 06 Oct 2024 09:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728233207; x=1728838007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=akAXIFAX2hq/JQ/5/aAwojcmLWEHNHqXoq1KohLf+CA=;
        b=bWfdxAIu+MCaXP/n7T4hhFVPVtGgElvdbMB3WCjKWCY2DAgTzwo/uyyqHucPg6bzjv
         Xaluqq73J67/2MxuVIdXa2Vcp2UwFEfqZcgsLftd+EhPL9/Rh+lSzx9z6bsaHtwtWf6B
         I42A6/HnoBOTwlejgLJrMiJ+01PEHMSB+JT7+G3SeF28CvcdXLQINzlX6DUC64Jm2mzD
         lGH4UG0lZFnZQAVa/sa1XnVp0OkCyQ+vKHLqy1JC5XVzFPmT2F8+7pH6pvcjIieZgdYP
         rnW2piZpJW9gVORlHpFhf/D9LWvFCx0LWpFsw7YU1QI3s/Jr65x5Zsvby9YOEt3yIvpC
         qfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728233207; x=1728838007;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akAXIFAX2hq/JQ/5/aAwojcmLWEHNHqXoq1KohLf+CA=;
        b=MKxNQexspmdW7K3eg05Ns4OUOX+slMZCzyU2NxhmoU2wnqAUSfc6d8/ld1vA0VDNJE
         iqdxGgP2y+yKHRfJVTAzGvXW0tcJwBsvs88QSZGhuHG3u9i8NEuMgiLR3QGgCyDTXL2d
         CUMSt7aoxxN2Ii5ykswQa3NaNp9of98LDzIyFOzXyA5fScJwCH7d6+RfxIDGKp1fmUcp
         B6lTOB6tbOe1gtkW/3Bf0e3zOHifbg8Blz0XRuOxxEiz+v67Nr7R8G4JtQ7UUeJi5iOw
         +pEbdpNrUIRGOeCz94uj3/AgqckcONSHNnXGGqkQOuHhVRwWT4oJMDx/xOKWQ4H1iKcR
         d8AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq2d2e3ujcAvpjOqTKebtfQedYJytzxGRya/QfFs5ZgINMRHxRW2Qtpmhq41AaQO16v5xIREoOvF3knA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkrqJcusMUWQL339ROePB/cbs0a7x6eCjwpSs8jk0oz1VaLj92
	GO/Y3t9sk1wfAhJuwPQEWQdp1GdQgAqmnNwG8VzCh73VIPZbQTCJI+4vl92lBoQ=
X-Google-Smtp-Source: AGHT+IFPBkuzzGcWuEx0VbwpLEzF0XozY9XwwEwQyKHqc3jL8Hkus+AG7GZGZ6DPG2BFb8+QYH9saA==
X-Received: by 2002:a05:6512:10d3:b0:52e:e3c3:643f with SMTP id 2adb3069b0e04-539ab859ee0mr3506576e87.2.1728233207434;
        Sun, 06 Oct 2024 09:46:47 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff28034sm567156e87.250.2024.10.06.09.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 09:46:45 -0700 (PDT)
Date: Sun, 6 Oct 2024 19:46:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vedang Nagar <quic_vnagar@quicinc.com>
Cc: quic_dikshita@quicinc.com, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 16/29] media: iris: implement iris v4l2_ctrl_ops and
 prepare capabilities
Message-ID: <jk4n5upp5vw4s5yl5vw7iyri3wfxpsl35isxxggysd52eqecpk@tlmf5w2ncagz>
References: <20240827-iris_v3-v3-0-c5fdbbe65e70@quicinc.com>
 <20240827-iris_v3-v3-16-c5fdbbe65e70@quicinc.com>
 <gehwgofhviqcnopaughxfcpsqmbbiaayid2scgat4xnd5ngwmo@ylawfiup2tqc>
 <15703542-1b70-4042-86b9-7b3f3a675e3e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15703542-1b70-4042-86b9-7b3f3a675e3e@quicinc.com>

On Tue, Oct 01, 2024 at 06:31:16PM GMT, Vedang Nagar wrote:
> Hi Dmitry,
> 
> On 8/29/2024 3:03 PM, Dmitry Baryshkov wrote:
> > On Tue, Aug 27, 2024 at 03:35:41PM GMT, Dikshita Agarwal via B4 Relay wrote:
> >> From: Vedang Nagar <quic_vnagar@quicinc.com>
> >>
> >> Implement s_ctrl and g_volatile_ctrl ctrl ops.
> >> Introduce platform specific driver and firmware capabilities.
> >> Capabilities are set of video specifications
> >> and features supported by a specific platform (SOC).
> >> Each capability is defined with min, max, range, default
> >> value and corresponding HFI.
> >>
> >> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
> >> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >> ---
> >>  drivers/media/platform/qcom/iris/Makefile          |   1 +
> >>  drivers/media/platform/qcom/iris/iris_buffer.c     |   3 +-
> >>  drivers/media/platform/qcom/iris/iris_core.h       |   2 +
> >>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 194 +++++++++++++++++++++
> >>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  15 ++
> >>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   4 +
> >>  .../platform/qcom/iris/iris_hfi_gen2_command.c     |   1 +
> >>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   9 +
> >>  drivers/media/platform/qcom/iris/iris_instance.h   |   6 +
> >>  .../platform/qcom/iris/iris_platform_common.h      |  71 ++++++++
> >>  .../platform/qcom/iris/iris_platform_sm8250.c      |  56 ++++++
> >>  .../platform/qcom/iris/iris_platform_sm8550.c      | 138 +++++++++++++++
> >>  drivers/media/platform/qcom/iris/iris_probe.c      |   7 +
> >>  drivers/media/platform/qcom/iris/iris_vdec.c       |  24 ++-
> >>  drivers/media/platform/qcom/iris/iris_vdec.h       |   2 +-
> >>  drivers/media/platform/qcom/iris/iris_vidc.c       |  16 +-
> >>  16 files changed, 536 insertions(+), 13 deletions(-)
> 
> [Skipped]
> 
> >> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> >> index a74114b0761a..6ad2ca7be0f0 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> >> @@ -108,6 +108,7 @@ static int iris_hfi_gen2_session_set_default_header(struct iris_inst *inst)
> >>  	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> >>  	u32 default_header = false;
> >>  
> >> +	default_header = inst->fw_cap[DEFAULT_HEADER].value;
> > 
> > This isn't related to the s_ctrl and g_volatile_ctrl. Please split this
> > commit into the chunk that is actually related to that API and the rest
> > of the changes.
> Could you please help to provide more details on how are you expecting the
> split of the patches?
> 
> Do you expect to split V4L2 ctrls_init/s_ctrl/g_ctrl in one patch and the
> introduction of all the capabilities into another patch? We are not finding
> it feasible to split the patch that way as in ctrl_init we read the
> capability from platform data to initialize the respective control.

Please split all caps and all the structs that are not related to the
V4L2 ctrls implementation. In this patch please keep only those defines,
structs and fields that are required to implement V4L2 ctrl API.

> > 
> >>  	iris_hfi_gen2_packet_session_property(inst,
> >>  					      HFI_PROP_DEC_DEFAULT_HEADER,
> >>  					      HFI_HOST_FLAGS_NONE,
> > 
> > 

-- 
With best wishes
Dmitry

