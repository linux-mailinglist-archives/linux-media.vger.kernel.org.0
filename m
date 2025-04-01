Return-Path: <linux-media+bounces-29145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BD4A77B90
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 15:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 908E13AFAB7
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 13:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9497204581;
	Tue,  1 Apr 2025 13:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QGHTG68b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E079203707
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 13:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743512422; cv=none; b=ruxdPgk41qaEoTR5avYRCcJKkzQqRl0GPz5CKHY0MIErzAwiaRrO7QPZTz0zxyd+WMOdbplknpGQuDvSPiJ7yA+OMJ9ptcjacngmIdjnVt74vV6ZJPKnACXdYaPg2T7R9NcDuBCCuXt+0KOCFWPPkAlB5TmnOZXsSkj3fZLtisQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743512422; c=relaxed/simple;
	bh=OjgI5+In7loHAVZbMdtRrfVDhF9WiqnryHICNUhoNK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kFPPrmnpZJR2z7h6fDxMLyl6SQTRMNXoldwZSzEbN2GhJB6iG2uzT7qRfdXeEunT7/xJK3MP8UebGJ0ijHKr1jHzrIkAz6g8w27QKFUDxNC9y0VJUYGY1Nq4lGiJ6c62UbIgEGqty8eON81k6LVEi7RYLUh1+ja88tby6NFGvMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QGHTG68b; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30bfd4d4c63so52935251fa.2
        for <linux-media@vger.kernel.org>; Tue, 01 Apr 2025 06:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743512416; x=1744117216; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+iRR6I3MRixn7v8uxjP6RrlRNlKpkOU3ts6hO7Pe5kY=;
        b=QGHTG68bbSSdX49OPOqy6S+Kp5QH3ondnsobzcECrPFVtWaCiJhofvRhHZB2or53uE
         2WJrnzNOFh2kFnoOM7Y1RPlPKEzQjdt+BcWcNi8dO4Bu+3LbMhzWwiVbaQd6KtFNPxsh
         vAu7yvh28XXsrKhpqA3WfIkU9T6byCR4nIWO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743512416; x=1744117216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+iRR6I3MRixn7v8uxjP6RrlRNlKpkOU3ts6hO7Pe5kY=;
        b=kkQiiyV7TK64QyPpNKRwTLamxDNkZzBiMSjYIW4dL00XyqCEJST1fgVcacaSMKyJnx
         IQPZXK1souoZcyVXLoZ1lz2rTBjpxvb5/okE8FFSsJuemh22wbTFdhAZDJ0j2jRGvKeR
         0/lNTcpbsnr0DPWW77VBWw2l9aHDPZHAOfC7GiSRFKRah1+JfzkbswAuccAnhMYFb5xQ
         dBcD5a/ENZWAhohXCwxKKHfLrfSlpKJd0yt4qYw5uU5Kbgeb/5fQjGRrsJuQOvJJUfla
         +PChRhchiIo23xq9FvapydDjYLOTcROBFxjxgd/5jZQKAKyowTrYJos3ftyG1DM0KJkj
         QPvQ==
X-Gm-Message-State: AOJu0Yx2VYLpegcngdSpQcXDD1Y5/HmNJEAkuNhIfQ1cfHTy6aCLgh0c
	fMR/qwQSCb1jZgGXCLRoNSYYTE7r73rFi3LgXAJCoZernJsKjPGI1Pr1ihrXrQFl5xK1DVjttp8
	=
X-Gm-Gg: ASbGncuwn3XZxNXubvyDiVBwW7v4ez6IcKk4kNxvAXGxCR+1XlXr93wHLFE6ctKB+jf
	INMKzSUqnXofTBGfharKFIono5KAZ2l4CbgPOUifSGbCn1xfjRgKSHnRcmZr0js05kH/zQhP45S
	Lx8aRzMFnuT8336hEqUa/ti06spDz+TARh6GJng5XzIXFzprfuuO45gvk0Kg8/vr9V80ORELPqL
	pBTFBBBdf56OZwmYewBQUlZZ9HOQ+4ghcHHbmLlF9D8sP75hVgbZpnnqvzrGUzG/5nlKGZkBJkM
	NG5GKwHk3e5yvP2hw/wuNVQ95JaydqbTdvu0AzxjJ45iFQBOgVnQ8iv4nywWQ/1+tQw4Y6DgBGT
	IzRbr+Uw=
X-Google-Smtp-Source: AGHT+IEt9oGWRchf5J3sQ8E2meZSiDPVr3TWBw9mUuRyhb/QKCdo7aAAPPCLesvzKoeGz82b4LX0lA==
X-Received: by 2002:a2e:a803:0:b0:30b:b908:ce06 with SMTP id 38308e7fff4ca-30eecd3b3fdmr11040971fa.19.1743512415856;
        Tue, 01 Apr 2025 06:00:15 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b5978bsm16888941fa.100.2025.04.01.06.00.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 06:00:15 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so465738e87.1
        for <linux-media@vger.kernel.org>; Tue, 01 Apr 2025 06:00:15 -0700 (PDT)
X-Received: by 2002:ac2:4e10:0:b0:549:8cbb:5443 with SMTP id
 2adb3069b0e04-54c0a535a5emr721119e87.47.1743512414729; Tue, 01 Apr 2025
 06:00:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <75a04abe-59d5-4835-a306-a63e5ff9d35f@xs4all.nl>
In-Reply-To: <75a04abe-59d5-4835-a306-a63e5ff9d35f@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Apr 2025 15:00:02 +0200
X-Gmail-Original-Message-ID: <CANiDSCuxVxMn7a3CL4yDhLJY5_kSiHd9roC0t=+aC7uNQUPm5g@mail.gmail.com>
X-Gm-Features: AQ5f1JqjT1iOcx9-FLxMvCw83UPaPwyb7IC8efdpONit3rnhsFbIB2GUnEly5Aw
Message-ID: <CANiDSCuxVxMn7a3CL4yDhLJY5_kSiHd9roC0t=+aC7uNQUPm5g@mail.gmail.com>
Subject: Re: [PATCHv3] media: cec: extron-da-hd-4k-plus: Fix Wformat-truncation
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Tue, 1 Apr 2025 at 14:47, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Change the port type to u8 so gcc8 knows that the port fits in a single
> char.
You want to change this commit message

>
> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:44: warning: 'DCEC' directive output may be truncated writing 4 bytes into a region of size between 0 and 53 [-Wformat-truncation=]
>
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> Reported-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Change since v2:
>
> Redid the patch, fixing the buffer sizes. It turned out that was the problem.
> It now passes build-ancient (I checked the logs this time).
> ---
>  .../cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c    | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> index cfbfc4c1b2e6..5ebd9d73fb15 100644
> --- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> +++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> @@ -1002,8 +1002,8 @@ static int extron_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
>                                     u32 signal_free_time, struct cec_msg *msg)
>  {
>         struct extron_port *port = cec_get_drvdata(adap);
> -       char buf[CEC_MAX_MSG_SIZE * 3 + 1];
> -       char cmd[CEC_MAX_MSG_SIZE * 3 + 13];
> +       char buf[(CEC_MAX_MSG_SIZE - 1) * 3 + 1];
> +       char cmd[(CEC_MAX_MSG_SIZE - 1) * 3 + 15];
Random idea, please ignore if you do not like it. What about ?:
char cmd[sizeof(buf) + 14];

>         unsigned int i;
>
>         if (port->disconnected)
> @@ -1013,7 +1013,8 @@ static int extron_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
>                 sprintf(buf + i * 3, "%%%02X", msg->msg[i + 1]);
>         snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
>                  port->direction, port->port.port,
> -                cec_msg_initiator(msg), cec_msg_destination(msg), buf);
> +                cec_msg_initiator(msg),
> +                cec_msg_destination(msg), buf);

You do not need to change the style here.
>         return extron_send_and_wait(port->extron, port, cmd, NULL);
>  }
>
> --
> 2.47.2
>


-- 
Ricardo Ribalda

