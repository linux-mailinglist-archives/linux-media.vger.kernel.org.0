Return-Path: <linux-media+bounces-16879-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 355A596046B
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 10:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7C50B22B28
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2024 08:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59529198A19;
	Tue, 27 Aug 2024 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dgKgZQe9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BEC14B07E
	for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 08:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724747429; cv=none; b=Pi6RfmwMJXRJAe6Yy28ZFG+U7MUvBgLmvKEY41REY0szhujZ1CnEOggswptS8qcFfYjmP+A8VauFfwpW8UUT6RZUCygHm7Xn8RXFyLuEuHE/5BkkNK8tq7OodepX8Wso11RqvdiVY8jL/B710SITAjrpYXwvBh7SGYIdpHvovKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724747429; c=relaxed/simple;
	bh=/ybs2KnV3+jGgzd+z7IQzZDEcwA6FR9efiI7qbXcTBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N6egJuIBdTC7xAljB0tf6IHv8c+rNYNooaoPMWaDcOX+2D3fiyIY+TSjYOlOw3Haa0oJtodEBzMNpOyJVYzsjp52HRRujS1s6Xpl8+Zr3UuJrSbWTXG2ws1h3wO46NCDEGDd2frc9iWs1GfCiPgDFM+/E2ukkjA4/HHSIuEgnis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dgKgZQe9; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2d46f2816c0so4167477a91.2
        for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 01:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724747426; x=1725352226; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEyn9jUT2FpyLYAjHKFMVWeuGnjVkiqgrAa0Pe7cY0I=;
        b=dgKgZQe9htOVuTI1X6WNu9yyaM9Wy5ErCNH37RNE7ciCN/Cwr8McstJJN4lCahUAHW
         O6HfLURtlBrpf5Y+2D/tAR8pfh+V3B8TifVO8zQDKSBHufogxnp74YE8OpxWnn4/e/Zg
         3uf+/3inIt2EfHmLb1qef2PggBi6FKovJ0yis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724747426; x=1725352226;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEyn9jUT2FpyLYAjHKFMVWeuGnjVkiqgrAa0Pe7cY0I=;
        b=nn5j9GL03Mn4K8+TRkBCLEuYeqPoScfshV8ImDmO4rfSOnrsUBU7PWfCMWjz5/0bLC
         tJizaTL4JP+P1NN5AjUuqW/OBFrw049fEblMouHVY8bfx5CQ57VXmqkHpzfQoDMSl//x
         14Txwc5/OQ7cwd5fai06g5eXfRRAJ8F+hDdmEbZTSPsr8eURBGkLnr2OkllHJf936GuT
         LaaRy0wkPLjRtJ/uUaf++X4lDTNUmeL/UgrzJGJ28cCb5UbnIHmWWGdGcdHqS0uVa/Ld
         d1/4HCbp2FwcXPa8LtInxn89WZFutubG0ToBP9wGlDYWn+fw0II7raI669D7bNDT6GnZ
         kaiw==
X-Forwarded-Encrypted: i=1; AJvYcCV61BakTiSbbE8ggPeaUmMcHmmNccyxuZpWBeyZpmIRlbfeHY4u7vmR4cV3uM8f7WX1vd6yTNc0SE2fsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHRssJnQosuO9T012j92/rVcXF1UI210tO3E4kYwneSH3zWb9f
	4ZUeszExFlQFzLdX0f0F93ns5GNzhVjnFIARwIIfMcHzUu7KRB+HP3q7GPanF7J2HtskQaharGU
	=
X-Google-Smtp-Source: AGHT+IFaZLm00fb1/UoQo0D4P/Sxb8sWeGW7pKhyo/lVfdBG80Biv23ge/p3S9fH++wDL7ryfziUrg==
X-Received: by 2002:a17:90a:d350:b0:2d3:b55e:5f2 with SMTP id 98e67ed59e1d1-2d8257f86c5mr2435923a91.14.1724747426336;
        Tue, 27 Aug 2024 01:30:26 -0700 (PDT)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com. [209.85.216.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d6136fcf10sm11374010a91.2.2024.08.27.01.30.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Aug 2024 01:30:25 -0700 (PDT)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2d46f2816c0so4167455a91.2
        for <linux-media@vger.kernel.org>; Tue, 27 Aug 2024 01:30:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWAbMNl4qF3R47GMKzC1Rl/rZg8qqjgTnSZ7QXS2gAVImQ92KTDblrE0dKX0KR81em5P9N+kb9r9BYDIQ==@vger.kernel.org
X-Received: by 2002:a17:90b:4a42:b0:2c9:6d8:d823 with SMTP id
 98e67ed59e1d1-2d8257c5a7bmr2583148a91.1.1724747424097; Tue, 27 Aug 2024
 01:30:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240823094839.3142472-1-yuehaibing@huawei.com>
In-Reply-To: <20240823094839.3142472-1-yuehaibing@huawei.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 27 Aug 2024 10:30:10 +0200
X-Gmail-Original-Message-ID: <CANiDSCtKMyRoTt7-DVGeKqjh-0R_xB7G7qAAFfCPNcSV-DOnTQ@mail.gmail.com>
Message-ID: <CANiDSCtKMyRoTt7-DVGeKqjh-0R_xB7G7qAAFfCPNcSV-DOnTQ@mail.gmail.com>
Subject: Re: [PATCH -next] media: siano: Remove unused declarations
To: Yue Haibing <yuehaibing@huawei.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Aug 2024 at 11:51, Yue Haibing <yuehaibing@huawei.com> wrote:
>
> There is no caller and implementation in tree, so can remove them.
>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  drivers/media/common/siano/smscoreapi.h | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
> index 3c15082ce0e3..d945a2d6d624 100644
> --- a/drivers/media/common/siano/smscoreapi.h
> +++ b/drivers/media/common/siano/smscoreapi.h
> @@ -1115,12 +1115,6 @@ extern int smsclient_sendrequest(struct smscore_client_t *client,
>  extern void smscore_onresponse(struct smscore_device_t *coredev,
>                                struct smscore_buffer_t *cb);
>
> -extern int smscore_get_common_buffer_size(struct smscore_device_t *coredev);
> -extern int smscore_map_common_buffer(struct smscore_device_t *coredev,
> -                                     struct vm_area_struct *vma);
> -extern int smscore_send_fw_file(struct smscore_device_t *coredev,
> -                               u8 *ufwbuf, int size);
> -
>  extern
>  struct smscore_buffer_t *smscore_getbuffer(struct smscore_device_t *coredev);
>  extern void smscore_putbuffer(struct smscore_device_t *coredev,
> --
> 2.34.1
>


-- 
Ricardo Ribalda

