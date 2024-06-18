Return-Path: <linux-media+bounces-13547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E44190CC03
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 14:41:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78A2A282033
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 12:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDF7158A16;
	Tue, 18 Jun 2024 12:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RTcOHE2e"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5541586D5
	for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 12:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718714207; cv=none; b=M1eFVkf26BTxwV72QmlVt0Nc1lYhutDeW8C28RM6DUM1MmdNYRWFR1c+MyDP8flIt4vtHApJrvJp2fFBsrA7JZA5gidgVftq47kvfJXWrWtlvleDipV9BVftwAqVLE1LOcYpSI2GVJ9ccBOP6tRt8XXXpK6vf33OLVqRZi0v/RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718714207; c=relaxed/simple;
	bh=wc3nxRp/zEr6rzxbLlYJyj2e4UgxApK3/epeyKCpZJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvlJ1Hk+qgBSUUddNsiIGy1whbc1RlDtdaf8EP4ojDN/SLzbbEPCNgRTT8IXuuHTPBhoAcHFlYklQt1EvV1K+gbMbd045ZAcmyufLf2NQB8cfIAKt7ZT2LBh5Qc4Uxfa2hhcgyu47bn7pZQo+thrXxys1CGXhWrQ1ZUptYe9cQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RTcOHE2e; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eaae2a6dc1so95180761fa.0
        for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 05:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718714203; x=1719319003; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NTiN80rKMTOzOqZ3XNmwbttNTimI7k+ulamUrzc9SmI=;
        b=RTcOHE2ePs2Zf3PZlJ19bZIRr6S/J8kyDHy5iGG6U1svG9xcWffaCoNBqACl6HDb38
         eIvp/14/774SJYZ52+c1vzdk7TRidgIAvDKzuzNKLrwMSaCwUZlW5LaJeuNdTKidye2G
         xNGe7kYj+AA7wRvqsnJ9kLuVup7vGueYvTJaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718714203; x=1719319003;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTiN80rKMTOzOqZ3XNmwbttNTimI7k+ulamUrzc9SmI=;
        b=H1lPOF/aQMJGYmxqccaf4HPoCbqdgz88pAnhWGmjFze7TLsSjs02y50vVFdXWhQ5/e
         MKUEb7y+0+gbfn+iHDgxCHi6SBLGSOgpeAaB4gRXFRMOFaS62dxkCCJLguRbWPsKqOo6
         SlW8QjVF1z1T1XhMdpOWXAggMWDUfm1ORup6bgH3DmycUrTMo2aJNpoEOvgAsZL5KpzS
         BJ8d5unvFCU8QiOMJESUj+z6eVZ9RMZZbrcfM71CiqeNOxSdFdEyIze3IoyKegaXLKZL
         9z1B/Nna2DrI+91FafQ8zao05H2nyFbmx2IXjXc8nEfn7P3TJbJtPb1TkSqJqKnFGZdj
         4qZg==
X-Forwarded-Encrypted: i=1; AJvYcCXNjVaum3x11dI6m+a/KAz4iqWMdQA+eT4aPfqrffp/S8ooSD28zqFYaXe7GC4imT8K1kp+U2JAZK40ylqiDYomiaipcEkdmkzr6EU=
X-Gm-Message-State: AOJu0YyZY8v3dxW8h1Ktyc2UyI/qPwVC41cQueATHAdzcRo5fos8S1Bu
	0h0u/f5bEhBcVTeZ78+vSRElgwrKUZgqsuXkGUVecaKp693aUD5SWT9QhWOrcDRTun/m3xK3zOV
	GcA==
X-Google-Smtp-Source: AGHT+IF0TpVJ/oO0P+dXPIF4q2LZoJiheIkdOGAhASzp/xocSIvHUJd6r5VYZ5zwEGFUWrmrRLKR9A==
X-Received: by 2002:a2e:3005:0:b0:2ec:1d05:1bfe with SMTP id 38308e7fff4ca-2ec1d051c12mr75147651fa.53.1718714203275;
        Tue, 18 Jun 2024 05:36:43 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c1957dsm16892541fa.71.2024.06.18.05.36.42
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 05:36:42 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52c82101407so8928873e87.3
        for <linux-media@vger.kernel.org>; Tue, 18 Jun 2024 05:36:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVXLZ7aTY0SL5C0JWGFUD2JbyOMgz5ij7M9UlsiIMvUosrI8HzLksqJmIqcsaYhVJcQ2FVe0V3eLrqxB/H733OqPs6cnHYhiBYYaME=
X-Received: by 2002:a05:6512:3e25:b0:52c:8b03:99d1 with SMTP id
 2adb3069b0e04-52ca6e92adcmr12517058e87.48.1718714202517; Tue, 18 Jun 2024
 05:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527-cocci-flexarray-v3-0-cda09c535816@chromium.org> <3f7baafb-82c7-3955-e871-687fafe8048c@quicinc.com>
In-Reply-To: <3f7baafb-82c7-3955-e871-687fafe8048c@quicinc.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 18 Jun 2024 14:36:27 +0200
X-Gmail-Original-Message-ID: <CANiDSCszoUyZW85qaCrkkfNR73dXBrAURayWD8_jpV6Er6fOsg@mail.gmail.com>
Message-ID: <CANiDSCszoUyZW85qaCrkkfNR73dXBrAURayWD8_jpV6Er6fOsg@mail.gmail.com>
Subject: Re: [PATCH v3 00/18] media: Fix the last set of coccinelle warnings
To: Vikash Garodia <quic_vgarodia@quicinc.com>
Cc: Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	Andy Walls <awalls@md.metrocast.net>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi Vikash

On Tue, 18 Jun 2024 at 14:34, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
>
> Hi Ricardo,
>
> On 5/28/2024 2:38 AM, Ricardo Ribalda wrote:
> > With this set we are done with all the cocci warning/errors.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> > Changes in v3:
> > - Do not rename structure fields. (Thanks Bryan)
> > - Link to v2: https://lore.kernel.org/r/20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org
> >
> > Changes in v2:
> > - allegro: Replace hard coded 1 with a define. (Thanks Michael)
> > - Link to v1: https://lore.kernel.org/r/20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org
> >
> > ---
> > Ricardo Ribalda (18):
> >       media: allegro: nal-hevc: Replace array[1] with arrray[N]
> >       media: xilinx: Refactor struct xvip_dma
> >       media: dvb-frontend/mxl5xx: Refactor struct MBIN_FILE_T
> >       media: dvb-frontend/mxl5xx: Use flex array for MBIN_SEGMENT_T
> >       media: pci: cx18: Use flex arrays for struct cx18_scb
> >       media: siano: Refactor struct sms_msg_data
> >       media: siano: Remove unused structures
> >       media: siano: Use flex arrays for sms_firmware
> >       media: venus: Remove unused structs
> >       media: venus: Use flex array for hfi_session_release_buffer_pkt
> >       media: venus: Refactor struct hfi_uncompressed_plane_info
> >       media: venus: Refactor struct hfi_session_get_property_pkt
> >       media: venus: Refactor struct hfi_uncompressed_format_supported
> >       media: venus: Refactor hfi_session_empty_buffer_uncompressed_plane0_pkt
> >       media: venus: Refactor hfi_session_empty_buffer_compressed_pkt
> >       media: venus: Refactor hfi_sys_get_property_pkt
> >       media: venus: Refactor hfi_session_fill_buffer_pkt
> >       media: venus: Refactor hfi_buffer_alloc_mode_supported
> >
> >  drivers/media/common/siano/smscoreapi.c        | 10 +++---
> >  drivers/media/common/siano/smscoreapi.h        | 18 ++---------
> >  drivers/media/common/siano/smsdvb-main.c       |  4 +--
> >  drivers/media/common/siano/smsendian.c         |  8 +++--
> >  drivers/media/dvb-frontends/mxl5xx.c           |  2 +-
> >  drivers/media/dvb-frontends/mxl5xx_defs.h      |  4 +--
> >  drivers/media/pci/cx18/cx18-scb.h              |  2 +-
> >  drivers/media/platform/allegro-dvt/nal-hevc.h  |  7 ++--
> >  drivers/media/platform/qcom/venus/hfi_cmds.c   |  8 ++---
> >  drivers/media/platform/qcom/venus/hfi_cmds.h   | 38 ++++------------------
> >  drivers/media/platform/qcom/venus/hfi_helper.h | 45 ++------------------------
> >  drivers/media/platform/qcom/venus/hfi_parser.c |  2 +-
> >  drivers/media/platform/xilinx/xilinx-dma.c     |  4 +--
> >  drivers/media/platform/xilinx/xilinx-dma.h     |  2 +-
> >  14 files changed, 39 insertions(+), 115 deletions(-)
> > ---
> > base-commit: 48259b90973718d2277db27b5e510f0fe957eaa0
> > change-id: 20240507-cocci-flexarray-9a807a8e108e
> >
> > Best regards,
>
> Could you also mention if you have run any video usecase on any of the boards
> with these changes ?

I have only compile tested this series. If you have access to any of
the hardware it would be great if you could test it out :)

Regards!

>
> Regards,
> Vikash



-- 
Ricardo Ribalda

