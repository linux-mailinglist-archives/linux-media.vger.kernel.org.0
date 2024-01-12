Return-Path: <linux-media+bounces-3600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0A782B86F
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 01:06:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40644283FCC
	for <lists+linux-media@lfdr.de>; Fri, 12 Jan 2024 00:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF82262A;
	Fri, 12 Jan 2024 00:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mwiqXLJf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB90910FE
	for <linux-media@vger.kernel.org>; Fri, 12 Jan 2024 00:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-28ddd807e4bso852217a91.3
        for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 16:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705017963; x=1705622763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCsMdLHga1GxnMyWDbdKtpfMINMaUDqjALsfcY3IzvA=;
        b=mwiqXLJf3t7Gr0uSHaZSBsMT3fpxqOTnLUwURJH17VPsMnKAprHgmx+6KJyoRsaqbU
         syZ9MkeDCM1m4gswRk6k3j5GisQnU2gOjRhhof+4wRGj4IFzTSa+F34VaK59oIei5AvT
         ytWS65RYLFGeOfYBPZpaKv10gOIzuHboq3oXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705017963; x=1705622763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NCsMdLHga1GxnMyWDbdKtpfMINMaUDqjALsfcY3IzvA=;
        b=dc5TdGRPiLuwN0JLBqo5VWbTKjbav3ewO+nfMqbPvkFdb9/ZIzuW941YywRb15zN3J
         0uEWUjy3lmMPhyN6DxAW/LxM3Igr3nTnq1YVmXgwkhXNK/RlljLp0h0NEFvrfiGYjXRk
         uN0sOzrmTWO53iSKBXpFNvLw6XemoG0QAX+bV4hqZ3bO897ld/ieST3RyDAZUMn1Subk
         9L1P2l5LW4WCi34e3W4za5d8TIArBtGoSPAJ6DLz1/eJ/Gi1Dgj+4pt16JPQ3u2mMiZM
         530Ic1CIjUxKXlg4XH3ORAXqbrRdF8tSVm+qgyzCgqhS4CiRvu+mbzx5OQoa/4JrAlDu
         y54w==
X-Gm-Message-State: AOJu0YwoaEk2KAA7vZ83hUiQCUm8KkOnHyEgRZQTWBvnJ8lvXf/1XLs+
	p/VtcrOy0cphJaWaPiSZrtbXh33GgZeGZK4nIDMPwOcYl0a+rvilNe6nNqBjcw==
X-Google-Smtp-Source: AGHT+IErAvw1GUiSMvbfubpQ0WiskyDsn9mMns8r5WQUQgZgSWKq5N7P6VNxiNo/j2j+6JbPl4sTQkxfe6kkAVb2Gfc=
X-Received: by 2002:a17:90a:e544:b0:28d:bd78:7806 with SMTP id
 ei4-20020a17090ae54400b0028dbd787806mr544103pjb.59.1705017963052; Thu, 11 Jan
 2024 16:06:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1704867134-5522-1-git-send-email-quic_dikshita@quicinc.com>
In-Reply-To: <1704867134-5522-1-git-send-email-quic_dikshita@quicinc.com>
From: Nathan Hebert <nhebert@chromium.org>
Date: Thu, 11 Jan 2024 16:05:52 -0800
Message-ID: <CANHAJhGpHps26T5ErXVpz3Artf-Zwfidps2tF5GoEBNm2XdevQ@mail.gmail.com>
Subject: Re: [PATCH v2] media: venus: flush all buffers in output plane streamoff
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 9, 2024 at 10:13=E2=80=AFPM Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> For scenarios, when source change is followed by VIDIOC_STREAMOFF
> on output plane, driver should discard any queued OUTPUT
> buffers, which are not decoded or dequeued.
> Flush with HFI_FLUSH_INPUT does not have any actual impact.
> So, fix it, by invoking HFI_FLUSH_ALL, which will flush all
> queued buffers.
>
> Fixes: 85872f861d4c ("media: venus: Mark last capture buffer")
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Tested on a SC7280 Chromebook with a custom client [0] to perform the
queueing and VIDIOC_STREAMOFF sequence as described in the commit
message. Before this patch, a buffer from before the VIDIOC_STREAMOFF
command would be dequeued and seen by the client. With this patch, it
is not seen by the client.

[0]: https://crrev.com/c/5191249

Tested-by: Nathan Hebert <nhebert@chromium.org>
>
> ---
> Changes since v1:
> - Added fixes tag (Bryan)
>
>  drivers/media/platform/qcom/venus/vdec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/pla=
tform/qcom/venus/vdec.c
> index 29130a9..0d2ab95 100644
> --- a/drivers/media/platform/qcom/venus/vdec.c
> +++ b/drivers/media/platform/qcom/venus/vdec.c
> @@ -1255,7 +1255,7 @@ static int vdec_stop_output(struct venus_inst *inst=
)
>                 break;
>         case VENUS_DEC_STATE_INIT:
>         case VENUS_DEC_STATE_CAPTURE_SETUP:
> -               ret =3D hfi_session_flush(inst, HFI_FLUSH_INPUT, true);
> +               ret =3D hfi_session_flush(inst, HFI_FLUSH_ALL, true);
>                 break;
>         default:
>                 break;
> --
> 2.7.4
>
>

