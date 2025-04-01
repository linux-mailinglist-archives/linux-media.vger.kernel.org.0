Return-Path: <linux-media+bounces-29110-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CBDA77672
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 10:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A40F93AA6B0
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 08:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EB8B673;
	Tue,  1 Apr 2025 08:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TuF2WhJV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B9F4207F
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 08:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743496253; cv=none; b=ltYtfaDF+Tc/+j5gn3xJIA7x9zkjizozXhP0SkJjbtUBSJtSaxwcyV0tzfFwFC5gSPyWrEeeieBTlkxwrZS+KK/47T0JzVUrAialeq0w63PRBOPqTwe7mDKb8OK+mbvjok12V5I4AHsTEvl8izxjy6RH+h3EGvqZ9pOYwWnf2/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743496253; c=relaxed/simple;
	bh=8wVTRYc4bR42UoEhL/dv5IJNitGCjjap87S7w05SYyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tyEzr8wYlVAtjlFChhrZfJtyETSsFtrSh4/67yv1mRihm5ILdQS6zui2PkEafYSpamDufwV+8tIQ/kvK1WFuHkgfp4+vMBs8OyH3mMU2+zJAVrMoHWMwrJRsyJINLvQquJoFlit+6JTD7IVRPc7W4eim9lEdMZ+wGsDHSaT6GWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TuF2WhJV; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54996d30bfbso4649785e87.2
        for <linux-media@vger.kernel.org>; Tue, 01 Apr 2025 01:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743496249; x=1744101049; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tAQdC7jRn8REwu/75f3lw0Je3dhC8Ef0KaBCNrphsqM=;
        b=TuF2WhJV24pG1H+gAqyECwpAk9Xp7hc7q3Qaw4TP6lctBTpzsWB2AfRKkPxHJi079n
         wi0viKS7GKFFWNHAFCTapOLDj8eR5IALnFw/fSrWo8ZzX2cFYgtbAg+dUN4ykq0y1wqU
         ahaAZd5K7Xf7cv/nN9Kc6RDzNzXveU0dAxk/k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743496249; x=1744101049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tAQdC7jRn8REwu/75f3lw0Je3dhC8Ef0KaBCNrphsqM=;
        b=nfL98oYMq4moY6RufowDFuvAx29XebhG2fFAN225HJED1psDtvsQWbtWwlzHRw1Til
         QGDbqQKTj2vyYyr/WaPKViXAvll2GhpG0CHjH5w+IfKHO9CpP4mYtglYibxPioabn8n2
         tEXOQulyb0hTYDgnQbYdQ5anKhDwCvh1aJVY9nmZ6WbP369JD2fYAOvRIGx6c2Rrmc0G
         OChvYBKBlitOuDrH3WBQnzFrJoGGrEHOj3KNVWMBSUlAnHQbQTQXhAr+w5TzVXqtNOLp
         JwDSlKS3gITcFY5IoND/RpYkT3nAryS6nCs9IDN57eucNJfvVIo3V0E9szJYU2kVZ2v7
         WbnQ==
X-Gm-Message-State: AOJu0YxelTslJa+ds/EnGh0T9rSWn7Q+ZQbaVZDLDFYmPSLsskoXQ41D
	mXvfSv9EmxscztLEZdvzrCw8+4u0qMKrdcBjB4T+7NCqojWhk0S8DlQ9h6UlfpHRBkQJWRKCm0M
	=
X-Gm-Gg: ASbGnctGxtS0kVt7dvjWQ9o9Ajjdd1VhqKj+aHtu/BKUO/K74xpU/MpZRnF/8ORyn5w
	UHTp7r6ob2Lv9I9gqUmelk/INwXPKuDdvgqI6jJHyLrEz4gc5ZwaHPyLrG8b+vgVYhu+eYr03Ol
	sbUTF8ihPbtiWEXnV713doWE/RjKdEbi8hifYnKnmcBv/lho+BRyiYJGEJqEmNt5OD3Hkjh3ocX
	Sg44pj9OZN5YbfzSwwbR4UC2BcNNu/euztx48UD8pMw6EXmvUpluXYjEnPofedb6ElJJFfco5uw
	tnzvjkos5yiw8vubosJRPXHUt1tth8oPHG9bXaUceA4s/5iDqyd9p43kFVuZu+8Pz++th4FW9nX
	nC6Hb+4g=
X-Google-Smtp-Source: AGHT+IHqhz33XVNEap0pRhtObcaNsIhadPDVMfPQAs/JXq0/91CaNwmY14fkTB494uvaDlH3X0boMw==
X-Received: by 2002:a05:6512:6ce:b0:545:8f7:8597 with SMTP id 2adb3069b0e04-54b10dc7bf9mr4031007e87.16.1743496249480;
        Tue, 01 Apr 2025 01:30:49 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0957fff0sm1314273e87.126.2025.04.01.01.30.48
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 01:30:48 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54af20849bbso3839677e87.0
        for <linux-media@vger.kernel.org>; Tue, 01 Apr 2025 01:30:48 -0700 (PDT)
X-Received: by 2002:a05:6512:1107:b0:54a:cc11:b442 with SMTP id
 2adb3069b0e04-54b1112703emr4049432e87.47.1743496248260; Tue, 01 Apr 2025
 01:30:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cee8080d-ea46-432c-8241-e7ec81ef691d@xs4all.nl>
In-Reply-To: <cee8080d-ea46-432c-8241-e7ec81ef691d@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Apr 2025 10:30:35 +0200
X-Gmail-Original-Message-ID: <CANiDSCsrF-OAKg9OSTEwwGWq=6EgJ7MK6XahgONq_3UXuj8DFw@mail.gmail.com>
X-Gm-Features: AQ5f1JpwTXSKRR--Zih1zuEkd3Ib-_qhJeVnydybVi48rdurU3opgeRqfLBUjvM
Message-ID: <CANiDSCsrF-OAKg9OSTEwwGWq=6EgJ7MK6XahgONq_3UXuj8DFw@mail.gmail.com>
Subject: Re: [PATCHv2] media: cec: extron-da-hd-4k-plus: Fix Wformat-truncation
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
              port->direction, port->port.port,
              cec_msg_initiator(msg), cec_msg_destination(msg), buf);

Will need:
W -> 1 byte
%c -> 1 byte
%u -> 1 byte port.port  (we might have to add %10 here in case gcc8 is
not clever enough )
* -> 1 byte
%u -> 2 bytes cec_msg_initiator(msg)  (we might have to add %16 here
in case gcc8 is not clever enough )
* -> 1 byte
%u -> 2 bytes  cec_msg_destination(msg) (we might have to add %16 here
in case gcc8 is not clever enough )
%s ->  CEC_MAX_MSG_SIZE * 3 buf
DCEC -> 4 bytes
\0 -> 1 byte

That is a total of CEC_MAX_MSG_SIZE * 3 + 14. Don't we need to add an
extra byte to cmd?

char cmd[CEC_MAX_MSG_SIZE * 3 + 14];

Regards!

On Tue, 1 Apr 2025 at 10:18, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Change the port type to u8 so gcc8 knows that the port fits in a single
> char.
>
> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:44: warning: 'DCEC' directive output may be truncated writing 4 bytes into a region of size between 0 and 53 [-Wformat-truncation=]
>
> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> Reported-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h   | 2 +-
>  .../cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c     | 2 +-
>  .../cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h     | 6 +++---
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h b/drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h
> index 7422f7c5719e..fa2e02b26565 100644
> --- a/drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h
> +++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h
> @@ -14,7 +14,7 @@ struct cec_splitter;
>  struct cec_splitter_port {
>         struct cec_splitter *splitter;
>         struct cec_adapter *adap;
> -       unsigned int port;
> +       u8 port;
>         bool is_active_source;
>         bool found_sink;
>         ktime_t lost_sink_ts;
> diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> index cfbfc4c1b2e6..c4add8f3f8b4 100644
> --- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> +++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> @@ -1692,7 +1692,7 @@ static int extron_setup_thread(void *_extron)
>                         log_addrs.all_device_types[0] = CEC_OP_ALL_DEVTYPE_TV;
>                 } else {
>                         snprintf(log_addrs.osd_name, sizeof(log_addrs.osd_name),
> -                                "Splitter Out%u", port->port.port);
> +                                "Splitter Out%u", port->port.port % 10);
>                         log_addrs.log_addr_type[0] = CEC_LOG_ADDR_TYPE_PLAYBACK;
>                         log_addrs.primary_device_type[0] = CEC_OP_PRIM_DEVTYPE_PLAYBACK;
>                         log_addrs.all_device_types[0] = CEC_OP_ALL_DEVTYPE_PLAYBACK;
> diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h
> index b79f1253ab5d..cd07e90ea32a 100644
> --- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h
> +++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h
> @@ -83,9 +83,9 @@ struct extron {
>         struct serio *serio;
>         /* locks access to serio */
>         struct mutex serio_lock;
> -       unsigned int num_ports;
> -       unsigned int num_in_ports;
> -       unsigned int num_out_ports;
> +       u8 num_ports;
> +       u8 num_in_ports;
> +       u8 num_out_ports;
>         char unit_name[32];
>         char unit_type[64];
>         char unit_fw_version[32];
> --
> 2.47.2
>


-- 
Ricardo Ribalda

