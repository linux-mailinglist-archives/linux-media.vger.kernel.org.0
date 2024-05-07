Return-Path: <linux-media+bounces-11040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 923DB8BE5F8
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 16:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21D5C1F235A7
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 14:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C132215E80C;
	Tue,  7 May 2024 14:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oan4o4je"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC76154C11
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715092324; cv=none; b=UoaBOAdqtdr/DmsjfnmU32iR/2icnA/Ka187t6P4b6ys3yfb2cijEouNmdM49EH/n3w0vJy7hZSQZvav1kxg4VOCReQuRkoSIueGyEnjtikpxhJ2+wtLqPNpSRyxYINS+DepcU9EqkNn8g4g4sBfqZAqee0xMVZpw4GwOi10/2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715092324; c=relaxed/simple;
	bh=dIUOrSAIHdN021aT4jUnSjW6nNXUU6fCmRhcBGP9zbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VEqpGe9KEdLBy4jR562NrIGaMMHzBTXFMxE2bHVUdv8qTvxA0QirgOf+SE9v+IDYwg/c5E0zvvcUxg2UWwwNu9lqQngsixUY+34lMGdgINqFWbnz7pJCGRjP+giacNKBGiBRHdsYrgzv0s9KQLGL09/TsYAIvNMI2BMjNy9ZU+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oan4o4je; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c96a556006so1346859b6e.0
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 07:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1715092321; x=1715697121; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xfoakoCRXp8NuHbtuDoi6TSXe/02ySjJzEnJ69B3Tag=;
        b=oan4o4jebP5SqJqyZKftRzRdplkA8Ow1NaPhMWWetQ5Pu0Rr+/YQmptrmNVS08ugtp
         Bvnrv5VKNCknVkoWJbe/6WvV4qorPzdUCLs5xcO8g+7Blgts02qyyMS8nlnk3rXSs9W5
         bfTDxsxS84uCYEc1fvqq63COLcIG1DRnSygE8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715092321; x=1715697121;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xfoakoCRXp8NuHbtuDoi6TSXe/02ySjJzEnJ69B3Tag=;
        b=O21nLFcLP5AE9aJ0Wy6ADag+oqURyiZYKEqxwUHOvJhnspmMMtWCyv9iSr/28N6a+f
         BS1wxi2YWeM78py00OUj9ebK/QUw/A12f3ZrBuGUxXt7hFKeC4NYXGRKI+azOqqEUwrF
         kdQ2R5RwhMvSY2cdfBTzCX5RV1sJXyr7IMZwwU2icEO+pLtUKwW5QUbTZiBfygpN8b3i
         uolN3yq/F+1BTxk+nczh8FFKVq1MBm/JVX1uhV7mvxkuWFcvNHkk/o9DHDs7PKG+++wq
         P3i1cgHJtm+cUYnSrjVsOxINO3FATdOSgG+zYJX9rpdQzuxJ5hcQfxWdYOrMnfe/T6TP
         Yuyg==
X-Gm-Message-State: AOJu0YyXfZITViZRmsxiUeE94vU9tDyRk2ma00juiCBAqkWTo4uqGmO6
	O6I9hT4MGNY741Rlf70EONLriXI7il3jVZFAbbhs4DF8N0EuE69VoDxTnbRdbde7EQRyTaiFfjP
	ciw==
X-Google-Smtp-Source: AGHT+IE06jlzaa2bltFFuXBMS1KIpc0COcQEZ6S6UU9WGetleNQudGLUHy4MozyUnVZjcnxGT8Qm2g==
X-Received: by 2002:a05:6808:6394:b0:3c9:7344:7fc0 with SMTP id ec20-20020a056808639400b003c973447fc0mr4069916oib.58.1715092320736;
        Tue, 07 May 2024 07:32:00 -0700 (PDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id y5-20020a056808060500b003c968dfe021sm982673oih.40.2024.05.07.07.31.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 May 2024 07:32:00 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c9691e1e78so1440785b6e.3
        for <linux-media@vger.kernel.org>; Tue, 07 May 2024 07:31:59 -0700 (PDT)
X-Received: by 2002:a05:6808:23cb:b0:3c9:6f9c:4abf with SMTP id
 bq11-20020a05680823cb00b003c96f9c4abfmr5962885oib.32.1715092319135; Tue, 07
 May 2024 07:31:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507-cocci-flexarray-v1-0-4a421c21fd06@chromium.org> <20240507-cocci-flexarray-v1-6-4a421c21fd06@chromium.org>
In-Reply-To: <20240507-cocci-flexarray-v1-6-4a421c21fd06@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 7 May 2024 16:31:43 +0200
X-Gmail-Original-Message-ID: <CANiDSCv==iq+pj18m891AqTYaq1M+QjyE0R=4NQKUK8BmSi7Qw@mail.gmail.com>
Message-ID: <CANiDSCv==iq+pj18m891AqTYaq1M+QjyE0R=4NQKUK8BmSi7Qw@mail.gmail.com>
Subject: Re: [PATCH 06/18] media: siano: Refactor struct sms_msg_data
To: Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	Andy Walls <awalls@md.metrocast.net>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi,

The CI has found a build error in ppc for this patch.

https://gitlab.freedesktop.org/linux-media/media-staging/-/pipelines/1171798/test_report?job_name=build

Will send a v2 shortly

On Tue, 7 May 2024 at 15:18, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Replace a single element array with a single element field.
>
> This fixes the following cocci warning:
> drivers/media/common/siano/smscoreapi.h:619:5-13: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/common/siano/smscoreapi.c  | 10 +++++-----
>  drivers/media/common/siano/smscoreapi.h  |  2 +-
>  drivers/media/common/siano/smsdvb-main.c |  4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/common/siano/smscoreapi.c b/drivers/media/common/siano/smscoreapi.c
> index 7ebcb10126c9..b6f1eb5dbbdf 100644
> --- a/drivers/media/common/siano/smscoreapi.c
> +++ b/drivers/media/common/siano/smscoreapi.c
> @@ -839,7 +839,7 @@ static int smscore_configure_board(struct smscore_device_t *coredev)
>                 mtu_msg.x_msg_header.msg_flags = 0;
>                 mtu_msg.x_msg_header.msg_type = MSG_SMS_SET_MAX_TX_MSG_LEN_REQ;
>                 mtu_msg.x_msg_header.msg_length = sizeof(mtu_msg);
> -               mtu_msg.msg_data[0] = board->mtu;
> +               mtu_msg.msg_data = board->mtu;
>
>                 coredev->sendrequest_handler(coredev->context, &mtu_msg,
>                                              sizeof(mtu_msg));
> @@ -852,7 +852,7 @@ static int smscore_configure_board(struct smscore_device_t *coredev)
>                 SMS_INIT_MSG(&crys_msg.x_msg_header,
>                                 MSG_SMS_NEW_CRYSTAL_REQ,
>                                 sizeof(crys_msg));
> -               crys_msg.msg_data[0] = board->crystal;
> +               crys_msg.msg_data = board->crystal;
>
>                 coredev->sendrequest_handler(coredev->context, &crys_msg,
>                                              sizeof(crys_msg));
> @@ -1306,7 +1306,7 @@ static int smscore_init_device(struct smscore_device_t *coredev, int mode)
>         msg = (struct sms_msg_data *)SMS_ALIGN_ADDRESS(buffer);
>         SMS_INIT_MSG(&msg->x_msg_header, MSG_SMS_INIT_DEVICE_REQ,
>                         sizeof(struct sms_msg_data));
> -       msg->msg_data[0] = mode;
> +       msg->msg_data = mode;
>
>         rc = smscore_sendrequest_and_wait(coredev, msg,
>                         msg->x_msg_header. msg_length,
> @@ -1394,7 +1394,7 @@ int smscore_set_device_mode(struct smscore_device_t *coredev, int mode)
>
>                         SMS_INIT_MSG(&msg->x_msg_header, MSG_SMS_INIT_DEVICE_REQ,
>                                      sizeof(struct sms_msg_data));
> -                       msg->msg_data[0] = mode;
> +                       msg->msg_data = mode;
>
>                         rc = smscore_sendrequest_and_wait(
>                                 coredev, msg, msg->x_msg_header.msg_length,
> @@ -1554,7 +1554,7 @@ void smscore_onresponse(struct smscore_device_t *coredev,
>                         struct sms_msg_data *validity = (struct sms_msg_data *) phdr;
>
>                         pr_debug("MSG_SMS_DATA_VALIDITY_RES, checksum = 0x%x\n",
> -                               validity->msg_data[0]);
> +                               validity->msg_data);
>                         complete(&coredev->data_validity_done);
>                         break;
>                 }
> diff --git a/drivers/media/common/siano/smscoreapi.h b/drivers/media/common/siano/smscoreapi.h
> index f8789ee0d554..46dc74ac9318 100644
> --- a/drivers/media/common/siano/smscoreapi.h
> +++ b/drivers/media/common/siano/smscoreapi.h
> @@ -616,7 +616,7 @@ struct sms_msg_hdr {
>
>  struct sms_msg_data {
>         struct sms_msg_hdr x_msg_header;
> -       u32 msg_data[1];
> +       u32 msg_data;
>  };
>
>  struct sms_msg_data2 {
> diff --git a/drivers/media/common/siano/smsdvb-main.c b/drivers/media/common/siano/smsdvb-main.c
> index d893a0e4672b..44d8fe8b220e 100644
> --- a/drivers/media/common/siano/smsdvb-main.c
> +++ b/drivers/media/common/siano/smsdvb-main.c
> @@ -689,7 +689,7 @@ static int smsdvb_start_feed(struct dvb_demux_feed *feed)
>         pid_msg.x_msg_header.msg_flags = 0;
>         pid_msg.x_msg_header.msg_type  = MSG_SMS_ADD_PID_FILTER_REQ;
>         pid_msg.x_msg_header.msg_length = sizeof(pid_msg);
> -       pid_msg.msg_data[0] = feed->pid;
> +       pid_msg.msg_data = feed->pid;
>
>         return smsclient_sendrequest(client->smsclient,
>                                      &pid_msg, sizeof(pid_msg));
> @@ -711,7 +711,7 @@ static int smsdvb_stop_feed(struct dvb_demux_feed *feed)
>         pid_msg.x_msg_header.msg_flags = 0;
>         pid_msg.x_msg_header.msg_type  = MSG_SMS_REMOVE_PID_FILTER_REQ;
>         pid_msg.x_msg_header.msg_length = sizeof(pid_msg);
> -       pid_msg.msg_data[0] = feed->pid;
> +       pid_msg.msg_data = feed->pid;
>
>         return smsclient_sendrequest(client->smsclient,
>                                      &pid_msg, sizeof(pid_msg));
>
> --
> 2.45.0.rc1.225.g2a3ae87e7f-goog
>


-- 
Ricardo Ribalda

