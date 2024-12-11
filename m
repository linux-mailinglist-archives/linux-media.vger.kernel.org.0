Return-Path: <linux-media+bounces-23185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9019EC9DE
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 11:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0289188A60B
	for <lists+linux-media@lfdr.de>; Wed, 11 Dec 2024 10:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24A8236FB1;
	Wed, 11 Dec 2024 10:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="keSgyuPX"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5731A83ED
	for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 10:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733911217; cv=none; b=Ccq799QzqN5TDIBZZ3q1fFMAm5+DH8m5PrpcoSK8yrnMDeA7pfEd8P0abi4SdN0ohE3LuTHjH8z+lc5+03oMuN2PTV8eJsebJcUxa22tW2FkJm+6g+LjYQTSPu2LVTk/MV6HaASAhjVj8DWdpPwbp/aH+nWl5557mF2ISVSRsIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733911217; c=relaxed/simple;
	bh=qqXk888hHXN5lM/hj5UqNdhLJKFzxJyCfxlTAxkzIC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgvUihGj4wLBMjzvd2GZpRuHAMJjmC4ZHSREWwiSpvFMzoDTiOoByVRjRypoXQH1OeKlffstt0Da/T0LlMUkFiaiznK6y3GGYKhq0x/ZhRsih7P63tEWzpJOUv2tdzH1Y9bPkwQ13/z/2wdyNtBZCpawW62pCNozialU+fOGpPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=keSgyuPX; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53e399e3310so4462424e87.1
        for <linux-media@vger.kernel.org>; Wed, 11 Dec 2024 02:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733911213; x=1734516013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0FTHrDYAt+5sU4z/xE3NqRqqJ1EH4zKbhQxiihcV6pQ=;
        b=keSgyuPXwRLcR9mkodwZbvymknKhIp3EOL2GjltF4WWVV+xow3rpyEITHLMWqy+44o
         EH2AwNMqzwt7tTJzp5A2SzUwc7v1Itk9krdxVCDaM8ewfjda6Gk/wSSGdtj5f9bAEgIo
         xYbwaXn8PKS2Ck11zS6M0wENzLrNm4C7Bm39EPpPXJIBVkb7yWuv/hQByz3EQQjWduYr
         PXl7iGWaiBAWI+gP/qfGIGtuJ4SAwR1L1TVkvJ11DBIsMknMbGHXNN6f7avZlII9Gi7K
         6ip7MaHUeK/QJuhrRvVZy1tdL+NmP1eg68DWgjNOwDxwdYbTR6Kgsb8in/lVsd0kn8gF
         9IUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733911213; x=1734516013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FTHrDYAt+5sU4z/xE3NqRqqJ1EH4zKbhQxiihcV6pQ=;
        b=P2DATLfHSIdzJNPvClmgFn7Ky6h5Um7veUHLJVpQBY8FkMsxL8fFxl3tmSNMAeR3rZ
         S4P5P/kCmgPWIsP+sqDGyXqNzQ/sJeAfkIRwZhgt4UminaPS5pekxfOVV9KE/jaUl4+p
         dxxU9plx38lzbrcP4By1wayy1VekQpfoVu9tmOessXeM1KQS2VN29Mov45+/UxcA96zG
         oy03SyOEz3oE1EhzrngmgTBpiE8v02Q6mZs1NWQirkmUph+qxx9b1YNxM1oK+exY00Ei
         2PjQr5MZZgpOLQKo8y04RlhUyv4iEh7PcKnDyXdM7+/0LijBjXPv86SO07lirKeSQqVd
         aKxw==
X-Forwarded-Encrypted: i=1; AJvYcCU8UugN7ZeCemrcihG5J0f7og4Etsp0yjf9DJI7OOmk266A/FagM6EgxjGlHcGkg707u7T2Ti6hcf2AeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPsVUkXrbS7Rs9/kGi+vEXCK65lzRs39LH/i6B/bh2HJnV4ai9
	Uy2dhrsLxoJgnQjEnd6pipKI7MsT5SviO3YwNeK56eWtoLw+Cs8wJUhdo0sv4OQ=
X-Gm-Gg: ASbGncsegORv3JndIp5cIS5Tpc8pVTnfrim9G30Efk3oYUSADou4H5aL1DVuUS959Ks
	6XCCjl1lfVoAV2IMVqT2Exn65mzeF1filVAScUpT6k10J3jZXnbUEFUNgR0WHPK/6R+zTsr6/nM
	aSK3wwdz6ozTGqSlbMDuj0CYBh3ZYRhKXzCYc9JJXYw2BjtScd+cLzeYHYwKXglgssG+T4B96JV
	aGcF1Q3OnRF5PmJlpLrajRP6ImzaGFZv5vqbweXUC2dHZDT9ggAiKgJqUVKP40fHP+qtP5OREHM
	2NngLTo+HZl+5/IhnhXIY8LjbUquu0EXlg==
X-Google-Smtp-Source: AGHT+IHwSI2H5G/Mkb4MlxNeFcU4xm+OEFZBwe8yugoHJEmLqb/TvNYKgiOgmKZuczcoqpvpuKUFPQ==
X-Received: by 2002:a05:6512:128a:b0:53e:2f9d:6a7c with SMTP id 2adb3069b0e04-5402a5d6fecmr658688e87.5.1733911213443;
        Wed, 11 Dec 2024 02:00:13 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401b7ad992sm1141679e87.18.2024.12.11.02.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 02:00:12 -0800 (PST)
Date: Wed, 11 Dec 2024 12:00:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Stefan Schmidt <stefan.schmidt@linaro.org>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 27/28] media: iris: enable video driver probe of
 SM8250 SoC
Message-ID: <jsskqncqdh7qgquckoochpfxxemn7o6djyljou5ofktdidk2vz@wnqtca5vgu3h>
References: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com>
 <20241210-qcom-video-iris-v8-27-42c5403cb1a3@quicinc.com>
 <CAEvtbuuO5Ga+wW9rstX_e_RGnm5jSNSHmyy3w3M9FTopNhKttQ@mail.gmail.com>
 <b4f35301-6361-9e07-73dc-023e87c80857@quicinc.com>
 <35tpvx2uok22tmq76fe6mluiqnkymm2es6iu5jjj2zapeio6me@l4obuknsn3gz>
 <5220b8ad-021f-38f6-8617-34352093e494@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5220b8ad-021f-38f6-8617-34352093e494@quicinc.com>

On Wed, Dec 11, 2024 at 02:37:15PM +0530, Dikshita Agarwal wrote:
> 
> 
> On 12/11/2024 2:17 PM, Dmitry Baryshkov wrote:
> > On Wed, Dec 11, 2024 at 11:54:09AM +0530, Dikshita Agarwal wrote:
> >>
> >>
> >> On 12/10/2024 9:53 PM, Stefan Schmidt wrote:
> >>> hello Dikshita,
> >>>
> >>> On Tue, 10 Dec 2024 at 12:08, Dikshita Agarwal
> >>> <quic_dikshita@quicinc.com> wrote:
> >>>>
> >>>> Initialize the platform data and enable video driver probe of SM8250
> >>>> SoC. Add a kernel param to select between venus and iris drivers for
> >>>> platforms supported by both drivers, for ex: SM8250.
> >>>>
> >>>> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> >>>
> >>> [...]
> >>>
> >>>> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> >>>> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> >>>> @@ -17,6 +17,8 @@ static inline bool iris_valid_cap_id(enum platform_inst_fw_cap_type cap_id)
> >>>>  static enum platform_inst_fw_cap_type iris_get_cap_id(u32 id)
> >>>>  {
> >>>>         switch (id) {
> >>>> +       case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
> >>>> +               return DEBLOCK;
> >>>>         case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
> >>>>                 return PROFILE;
> >>>>         case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
> >>>> @@ -32,6 +34,8 @@ static u32 iris_get_v4l2_id(enum platform_inst_fw_cap_type cap_id)
> >>>>                 return 0;
> >>>>
> >>>>         switch (cap_id) {
> >>>> +       case DEBLOCK:
> >>>> +               return V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER;
> >>>>         case PROFILE:
> >>>
> >>> The handling for DEBLOCK does not seem to be part of the SM8250
> >>> enablement. Or did I miss something?
> >>> It seems they should be part of a different patch that makes use of
> >>> the DEBLOCK cap.
> >>>
> >> this cap is part of platform caps of SM8250 and the value(set by
> >> client/default) of this will set to firmware as part of start streaming
> >> through set APIs.
> > 
> > Then it still makes sense to split into two parts: one for DEBLOCK
> > handling, one for the platform data only. Or you can safely merge
> > DEBLOCK into the main caps commit.
> I am just adding the platform caps for SM8250 and mapping between cap id
> and corresponding v4l2 id in this patch.
> Handling of all these caps are already part of main commit.

Please move the mapping too.

> 
> > 
> >> {
> >> +		.cap_id = DEBLOCK,
> >> +		.min = 0,
> >> +		.max = 1,
> >> +		.step_or_mask = 1,
> >> +		.value = 0,
> >> +		.hfi_id = HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER,
> >> +		.set = iris_set_u32,
> >> +	},
> >>
> >> Thanks,
> >> Dikshita
> >>> regards
> >>> Stefan Schmidt
> > 

-- 
With best wishes
Dmitry

