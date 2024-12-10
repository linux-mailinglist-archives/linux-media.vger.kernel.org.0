Return-Path: <linux-media+bounces-23060-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 192EC9EB13A
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 13:51:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7C9128297F
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 12:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B284E1A705C;
	Tue, 10 Dec 2024 12:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c7gKtQZZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475E21A0BF1
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 12:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733835051; cv=none; b=pFChLMLXHOeYdHCtyr2VqKx8eooyJjwtEDbsUzr2mHbE0Q52pkjU30sw4tviIjb0tGE1l3RJW6x4fP3LnO3XA/DoBD1m/6xa7Axk28ll/Ksve4JSR4ebs8WpqIP7BP2lwS7dLCMtryAzor/IAQmgGtRw4OCKkPWoJtWr8CyBc/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733835051; c=relaxed/simple;
	bh=bY/aA+IWQ3QxQ2sZnjjb5W3DKLhLKSXmN8peYI/pr7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JMUjk6g4VCsz1yzj4YDDrRKa4dZVOwGB4kThxFMNr+P7rPF1M9YZJLoTjwotTUj9H4iB7ZecrUEW7Cv6PucIMn6n7GasiHMZfO/qR9bHetAUoZ1ed9gpEIaVx4WOHUL5MrLp6sHDYObXv00FHmvJLKkusuC0P9jdEbytNyRrF9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c7gKtQZZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa5f1909d6fso1045191266b.3
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 04:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733835048; x=1734439848; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7qRHcucb3bJvZLwoVQ1HjlEAIx4MF32wL8i5hALjhQ=;
        b=c7gKtQZZEwP5pZT1e3RFifBctv/PUanT5oTBJpmb0cnAHLazwA0MwVIeG9noVNbp+2
         zQP29p8WS7rwVhBMsRpb4CVHnKi7chADGfw6Do9GjceB8oW0ErLa/3QT1ulSaKmkviEU
         WGBxMgyjMgqM0oS476OyqVb4vMyaLyKtsoJQKawKzcUqXAUCZ9CgM1jmAdGskMpc/1jc
         AzjR9CDxPoEpkv14KHUPcZGuv/ds4+Tm6Hdi1pyJ58UNA5SJjUAEftUvrFOQ2CJj6vBj
         H96huddPu6PSHN7UIXmHetguWX56iIKNLlo20kKtaS8b7QrHmRtfF6XKmo70TO+oelJ7
         91vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733835048; x=1734439848;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7qRHcucb3bJvZLwoVQ1HjlEAIx4MF32wL8i5hALjhQ=;
        b=BAB7R522YtbrePKoFSBvpnDV1cf9ZsF1c9wIhhTuMxLjKaGeGBZn0CjhiHqBjIYj/I
         T4aRbK/Elfdm89h0b3knKdooYJt+p4P2/eVIFfo3xGsaWT/eSjzHfb56D2jdbw9zn3sP
         8x/AmNfCqgX4BRTHpi37yiKGTIg2Lwgo/MDn7YxzUxqtOsja7b/bEe0P90CeRi51oGGw
         Lf1hw8jAvIWgx1383USAWnlQQHLaY0tgGQxd6Uu3w0WokIIqxmaanyzlBZtak0jEoyXu
         5e2NPESXGXsz4JpLg0AffO0Z3Ksuayr6mJfygnBaSuq0Q5HJwVnIJkoNemGtZx5WM/lw
         q5DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb8fQW8t2GOsDGdE3sPOQnbi19KlTxylXBhsay/G8CkG44H7f55CcUZbxff9Gj8XYgLtcUyOi57J02sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCa5FEkBW8i7vDCkP6RfoxxVB5DAecLXtPwNfsuAPHUdq8mVxa
	oeE1U3TVcIJmSVgt9axQXSMo5ti8mGQvU3WIdvMgAbVedR20WdKGA52xAWqvsV9qXTaPZIP0Wtd
	/JpVNFlmyk3v/DlBwhsBHatGwtHIWAzLVXz022g==
X-Gm-Gg: ASbGncuvF6+05y/a2PsXi2PgYrxqI/srzx3KIoMLQg9rRGnRxcifcNx7G4et56/U9xi
	54OW7e6/YHgA/EwK6SFslYiljFdBSludYr/g=
X-Google-Smtp-Source: AGHT+IGUyenOeDiJ6ElklP7HzZFpKG0ehemH7byFc2hBRRMkI05xaWuzUu/O9qFlx4Kz7Wofw600OMm2prli/4lUsnk=
X-Received: by 2002:a17:906:30d5:b0:aa6:abb2:31f4 with SMTP id
 a640c23a62f3a-aa6abb2322bmr37782966b.25.1733835047677; Tue, 10 Dec 2024
 04:50:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210-qcom-video-iris-v8-0-42c5403cb1a3@quicinc.com> <20241210-qcom-video-iris-v8-16-42c5403cb1a3@quicinc.com>
In-Reply-To: <20241210-qcom-video-iris-v8-16-42c5403cb1a3@quicinc.com>
From: Stefan Schmidt <stefan.schmidt@linaro.org>
Date: Tue, 10 Dec 2024 13:50:36 +0100
Message-ID: <CAEvtbuus3scTvcjMuxxrfcqnd61+vqM5G=os-aUuM3+SLp2abQ@mail.gmail.com>
Subject: Re: [PATCH v8 16/28] media: iris: implement vb2 streaming ops
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jianhua Lu <lujianhua000@gmail.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Dikshita,

On Tue, 10 Dec 2024 at 12:07, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> +static int iris_hfi_gen1_session_stop(struct iris_inst *inst, u32 plane)
> +{
> +       struct hfi_session_flush_pkt flush_pkt;
> +       struct iris_core *core = inst->core;
> +       struct hfi_session_pkt pkt;
> +       u32 flush_type = 0;
> +       int ret = 0;
> +
> +       if ((V4L2_TYPE_IS_OUTPUT(plane) &&
> +            inst->state == IRIS_INST_INPUT_STREAMING) ||
> +           (V4L2_TYPE_IS_CAPTURE(plane) &&
> +            inst->state == IRIS_INST_OUTPUT_STREAMING) ||
> +           inst->state == IRIS_INST_ERROR) {
> +               reinit_completion(&inst->completion);
> +               iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_STOP);
> +               ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
> +               if (!ret)
> +                       ret = iris_wait_for_session_response(inst, false);
> +
> +               reinit_completion(&inst->completion);
> +               iris_hfi_gen1_packet_session_cmd(inst, &pkt, HFI_CMD_SESSION_RELEASE_RESOURCES);
> +               ret = iris_hfi_queue_cmd_write(core, &pkt, pkt.shdr.hdr.size);
> +               if (!ret)
> +                       ret = iris_wait_for_session_response(inst, false);
> +       } else if (inst->state == IRIS_INST_STREAMING) {
> +               if (V4L2_TYPE_IS_OUTPUT(plane))
> +                       flush_type = HFI_FLUSH_ALL;
> +               else if (V4L2_TYPE_IS_CAPTURE(plane))
> +                       flush_type = HFI_FLUSH_OUTPUT;

Below there is also HFI_FLUSH_OUTPUT2 defined. Do we need to handle
this flush type here as well?

[...]

> +#define HFI_FLUSH_OUTPUT                               0x1000002
> +#define HFI_FLUSH_OUTPUT2                              0x1000003

regards
Stefan Schmidt

