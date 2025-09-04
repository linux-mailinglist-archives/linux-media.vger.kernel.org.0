Return-Path: <linux-media+bounces-41753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13468B433AB
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 09:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2E2D483F16
	for <lists+linux-media@lfdr.de>; Thu,  4 Sep 2025 07:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DAE529B78D;
	Thu,  4 Sep 2025 07:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FZlTYS2H"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D073299922
	for <linux-media@vger.kernel.org>; Thu,  4 Sep 2025 07:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756970463; cv=none; b=PLNpjWZBdN9PydUDCwjLN0Dh0qtvc9vRy0K3YlLcId1tY9K6yBYhB7jG/gKYZOvT0dxwlitCf6NYWuZt84XAC6kWP3IK38kD866pDyGlymwsyk6PBqsZYxi8FSeA7gN573grBItFXhzyPHNRmpuAXLAqd/vsFliccOhP0Bwp+ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756970463; c=relaxed/simple;
	bh=IzaUyr2QUQ0u34pCN4ankMSHh6IMMQrZS71LWFjV2Xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Doew6GH9/B/Ve5Zi2CoqY7QzHLWD9A7qs8DFEmo4uDF1tk4dR4cSTpfO22lz4c7ulwpuxzNDVKStUeo5gljG9WDKHUJfFenKnbXrE6Wn7FNQL2JOdXtU/lXaTfbFFE3gzmLp+0g5JNrriJH6ilY3ZT2EWMRDhx4oSHUmReCKlls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FZlTYS2H; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b4df220483fso436671a12.2
        for <linux-media@vger.kernel.org>; Thu, 04 Sep 2025 00:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756970461; x=1757575261; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ck4Bse/Qz7JlMSXOfz+yprHWM6hsZTobGzFuDFsmoa4=;
        b=FZlTYS2HG8qWSETAIvJAfIcqD2klgYWH/sjiho4fyoE1NVIKyNDJUum6b9tpel+Z6/
         P6DSOVNcWO+Kqg0hoOzYU4z39oz2l1tcNTPB7/X2ZZmz8ZW5j+3zBN0dAiIj120WyKCv
         dwkyM3xbQJbfYtXkrwK9lQRrQgulZzA9BDlF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756970461; x=1757575261;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ck4Bse/Qz7JlMSXOfz+yprHWM6hsZTobGzFuDFsmoa4=;
        b=Imgb10RIT/B3YYWU2SV5YvUBd2ODItBnpuJ8deNTW77Nn+RkodIpYDNN1pxrgw9DoB
         Kg+wGl96+7TPZ4FkEzjkrTBGWIzA717s232lkIrfpO25xzMzIPWZEycUXQR5JfGxTBa8
         mYhbstnK1SY2tY6V2bLZ5hQLqko4zfLSFs0H1PfEDcvkINJKbxJsuMWpfIFyQy92DOVW
         W1+N8kM+my+NTL+p9ysykXFiz3VQSla34qnvQghled6DT6dCEBVEru3XO7lAQKB5rygY
         d6h62pPA0f6XLE9HrsUJ3IxddA4sCE4P8knJwi7osT67KknotaxFupoF4Ryu0AxEKdts
         DRdg==
X-Forwarded-Encrypted: i=1; AJvYcCV6I9f3lyQybBmprmp8etnrCVrsuKk8Hcnll2oj0neJ6i6nB5n+mnf3oAYdz8/ars6I7jTvMoiryY4KHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyjT83dPFx7si7XUuHfEFKUrQEivUVRiYsxKcDNHbW4VHfY66e
	X0LqW1pPLhUzPzFJ2f9+XBWbSwSmBcbJxxNuIOs7IFUeFZPUW6MybgvRn+67sWUdyV2LyIyGHaP
	6dYQ=
X-Gm-Gg: ASbGncsTx3viEtqXRQ4Bx0+qgrCcGx58IJZBQWuGNqSXacEGRPI2p4V0cVoCmlWIfqt
	aKOzvxCn+KRJ19INOwhuu0bP3lQmKMWPnKnkPRM3dIZhDcZfnNg6N6ajDvzpdEmhxvO0FuugJyC
	9dHMYRnKqg6kP37m7CYheO6XYwj5zfkstxK1zjc7oRo+JdGOgQFqeGaIzSLGKp/iq8SJDBo3Iw3
	5lFZLhnCbANWgJeNw0d5TKzEWMAjufGxN6Jv5rNrFm7nzkkBLAqMQYD1jZjLxS4TUJ2L4+brjnp
	umtv62434k1BlwMyHEmF20PeeOzNB1yPXin+wcRysJhuQlHZDVXxdpctr4+8HB5EVakGlRcYzE+
	WYVcstXT9HYoHP85HhGpc+ywl3QJtdkfJl6W8Omp6wsZclbe9txnLe9OXbvBPfK7Os8FIyqp4Q7
	s=
X-Google-Smtp-Source: AGHT+IGo61zStUSpjcuLT4d9/Oha26Up7cq1d67lNKVi+T3bRait9z7NNY3hCr7UcmKEAJBdIAezyg==
X-Received: by 2002:a17:903:19ce:b0:24b:270e:56cb with SMTP id d9443c01a7336-24b270e59bfmr104765455ad.27.1756970461132;
        Thu, 04 Sep 2025 00:21:01 -0700 (PDT)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com. [209.85.210.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ca41746casm32116835ad.48.2025.09.04.00.20.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 00:21:00 -0700 (PDT)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7724fe9b24dso553411b3a.2
        for <linux-media@vger.kernel.org>; Thu, 04 Sep 2025 00:20:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX8FGWlkpFhPERObeewXvxrY3tfsSfWbh4TGxY1Hxdwic0EqQgN2iwyejIBeJXeanK38hUtvhd1L7neVA==@vger.kernel.org
X-Received: by 2002:a05:6a20:4324:b0:246:1c:46d with SMTP id
 adf61e73a8af0-246001c0ca6mr11362895637.2.1756970458983; Thu, 04 Sep 2025
 00:20:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250904081429.592e439f.michal.pecio@gmail.com>
In-Reply-To: <20250904081429.592e439f.michal.pecio@gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 4 Sep 2025 09:20:31 +0200
X-Gmail-Original-Message-ID: <CANiDSCuwHo_wLqVwPj8VHmNAgZw6gyq4zxoapvGxDwnb0tfkxA@mail.gmail.com>
X-Gm-Features: Ac12FXwZwul4UKpKyMxWTIvEC3mrs3OlDVCBkcPTmJKAOxRhisn9yBCjCfSFcus
Message-ID: <CANiDSCuwHo_wLqVwPj8VHmNAgZw6gyq4zxoapvGxDwnb0tfkxA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Shorten the transfer size non compliance message
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michal

I like the new writing :)

On Thu, 4 Sept 2025 at 08:14, Michal Pecio <michal.pecio@gmail.com> wrote:
>
> This message is much longer than others and doesn't fit even in a 160
> column window when printed, despite providing little real information.
>
> Also replace 'transmission' with 'transfer' because that's the actual
> name and 'max packet' with 'limit' because it isn't same thing with
> isochronus endpoints. Remove cryptic abbreviations like 'ep'.
>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>

> Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
> ---
>
> By the way, this hack doesn't help much in the opposite case:
> dwMaxPayloadTransferSize is right, but EP descriptors are a mess.
>
> But no harm in trying, I guess.
> I can live with it either way.
>
>
>  drivers/media/usb/uvc/uvc_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
> index 82d9d8ae059d..baf4ace41dbe 100644
> --- a/drivers/media/usb/uvc/uvc_video.c
> +++ b/drivers/media/usb/uvc/uvc_video.c
> @@ -266,7 +266,7 @@ static void uvc_fixup_video_ctrl(struct uvc_streaming *stream,
>         if (stream->intf->num_altsetting > 1 &&
>             ctrl->dwMaxPayloadTransferSize > stream->maxpsize) {
>                 dev_warn_ratelimited(&stream->intf->dev,
> -                                    "UVC non compliance: the max payload transmission size (%u) exceeds the size of the ep max packet (%u). Using the max size.\n",
> +                                    "UVC non compliance: Reducing max payload transfer size (%u) to fit endpoint limit (%u).\n",
>                                      ctrl->dwMaxPayloadTransferSize,
>                                      stream->maxpsize);
>                 ctrl->dwMaxPayloadTransferSize = stream->maxpsize;
> --
> 2.48.1
>


--
Ricardo Ribalda

