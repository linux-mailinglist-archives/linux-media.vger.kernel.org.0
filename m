Return-Path: <linux-media+bounces-29128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB06A7775B
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 11:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73C3C188CA27
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 09:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45151EDA09;
	Tue,  1 Apr 2025 09:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N5t3OWHR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695161514F6
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 09:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743498947; cv=none; b=oh2JoS+eAI3pgclPuFmzIfTRfOP9rnXhvhMFYv+EN+ThzPeqCxR176i/HAfs8xMNEbYDAHNDorKSvHN5+qXehJNAqtCKWzeWHaFN7qOrkZETRJ0QmmaaXRxeTdD+f0jnxxiGPpZasHi7ojsESCyA8GjYzfq7mUwhOY1bpFhgYUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743498947; c=relaxed/simple;
	bh=0JBmHE6kCO1yjBhmMTINY80t7UJPgpuG9Rw8yM20qTQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mKv6T2QAbyHgLLkAN3BSWGd7bU0ZCjUND+IhdSbYq5BM0iSWmJytqEDcHIFY8EsXt3vC0jnSeZnC/sePu+AdVB+AyMuKC1RQbohgs5/0Efm+WxbajJsnqJ4GsnXQb5hL8MVVNUB3BADA5LloTPa/3bHo3HOSDQRyxaeMlqZ90Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N5t3OWHR; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54c090fc7adso935889e87.2
        for <linux-media@vger.kernel.org>; Tue, 01 Apr 2025 02:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743498943; x=1744103743; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A3IukIFlxY+hEBB+MBNMcP0ccGzRidO5v+42a/5NtsA=;
        b=N5t3OWHRWFibzUvUJPoi5GmmQU8RZxqtp27fXoo7V3SF4FHI9XgWfjiToxXwJsLgoC
         pHBVpBMOF1zuqgXeuGix3fW+i2a/vkQs7PEMH6OFgjD210bU6I7UKeV0t1tCCkP87lVT
         G/jGOyWogKbwmHYlXYpHXfhCzAGikL+RpaGiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743498943; x=1744103743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3IukIFlxY+hEBB+MBNMcP0ccGzRidO5v+42a/5NtsA=;
        b=fLMh+ZhvEfn9ih1hzBoM9WygFrz0pZ5pcxkFmfFQUQ0H+K60p7tx8s/Ep0UUy1WfI3
         8tPs16ST9CT6ON8s4L+5JyrQ+S+oZdq0uZi9Ux7QWevmhcKTxF3bP4di4B2QRETA5L7M
         +wVWIhL1qQUwI5At4aazG+WttuO5qG70rDK5A4zXmWaNXObI5MzwmxPGTaOSDWd0LG+l
         FfdJJthj/pR9mAAcfbBGQzS16+NPxwTHblHQOEgwWaE5PXYeG6lPesH7olhSVe6kPVUT
         veHm6c70K9F8pvyZ35M+fkgOf7vskU3NcHle7oYSUjAOcUNj8Q3Kax0Gz2kPyYOPhgz5
         vP9Q==
X-Gm-Message-State: AOJu0YxmCZmVtCphYiN+fl/YDz/HXYtzvM3llbuYhXtKshvpxbNgfoaz
	+EwAwXENBy+7RmtnUaoW+8mPTD8w2LBhwHI2iQhB7C9fESq/g3c85FekbKhpjG9gNqdbVe+mQg0
	=
X-Gm-Gg: ASbGncsTwianHfocsU8TbzyVdb5exRP8K3yswPwRyJ9qd1G6LfzEjpcVTbbtOrVCbuQ
	0DYvcHkfUtDnMJ26Ie5mObURI7ABOmQfOUQOY1PlAFPhrDO57cGnBYVWUImP+uqZ0leW9bBWfzq
	a+detRDpOE9oADjil+Pw8aqhpae7hrAbmXAoiXoutDbOWc11vhAU5646eGx/w7bHosvK2UzZIT1
	25zGEWgV5qdDZ48wg55NkfIXAxDPGSKIhYmwpX45q2MoSClNZE/e25Ou6/DUdDj0LEqpGx4moDY
	zO1cZXKsV4gciz/UcMtN8pL2Sv1LcvMMuYv1X+bkhqPg1hW1F2bSNqe5BUvN0LJVlQZBYGtVVVo
	A+etpIBRiSi17eZqJO5mdfA==
X-Google-Smtp-Source: AGHT+IEdUD4p7K9Vdx1m6lEEE+gLAaDGwUnbzrSUE8sno2upSGcQjGL3Zc5z1OyNUiIpNRfh4ubMYA==
X-Received: by 2002:a05:6512:124f:b0:545:2a96:34f7 with SMTP id 2adb3069b0e04-54b10eccbc4mr3469020e87.31.1743498943057;
        Tue, 01 Apr 2025 02:15:43 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b0957fbd3sm1320699e87.132.2025.04.01.02.15.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 02:15:42 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-307325f2436so52670381fa.0
        for <linux-media@vger.kernel.org>; Tue, 01 Apr 2025 02:15:41 -0700 (PDT)
X-Received: by 2002:a05:651c:1990:b0:30c:7a7:e841 with SMTP id
 38308e7fff4ca-30de032fb1emr39884431fa.34.1743498941227; Tue, 01 Apr 2025
 02:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cee8080d-ea46-432c-8241-e7ec81ef691d@xs4all.nl>
 <CANiDSCsrF-OAKg9OSTEwwGWq=6EgJ7MK6XahgONq_3UXuj8DFw@mail.gmail.com>
 <adf3386e-2029-4126-8b15-019240cd91ba@xs4all.nl> <CANiDSCt7gjNK=MBgvg-yO+L7kdPPyDgoi4Y8Lyqb1fSnyLJaTg@mail.gmail.com>
In-Reply-To: <CANiDSCt7gjNK=MBgvg-yO+L7kdPPyDgoi4Y8Lyqb1fSnyLJaTg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Apr 2025 11:15:28 +0200
X-Gmail-Original-Message-ID: <CANiDSCuNkF4stxwr3KjW4_NGYDVHNi5TOLDy1++QN-um-F-yfg@mail.gmail.com>
X-Gm-Features: AQ5f1Jp-ETPPZ6e7H4WO0xh1HqV5XCoenqKI1g83p5kJqmYWkiiEqCOrAbqgeEA
Message-ID: <CANiDSCuNkF4stxwr3KjW4_NGYDVHNi5TOLDy1++QN-um-F-yfg@mail.gmail.com>
Subject: Re: [PATCHv2] media: cec: extron-da-hd-4k-plus: Fix Wformat-truncation
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Apr 2025 at 11:11, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Hans
>
> On Tue, 1 Apr 2025 at 10:43, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >
> > On 01/04/2025 10:30, Ricardo Ribalda wrote:
> > > Hi Hans
> > >
> > > snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
> > >               port->direction, port->port.port,
> > >               cec_msg_initiator(msg), cec_msg_destination(msg), buf);
> > >
> > > Will need:
> > > W -> 1 byte
> > > %c -> 1 byte
> > > %u -> 1 byte port.port  (we might have to add %10 here in case gcc8 is
> > > not clever enough )
> > > * -> 1 byte
> > > %u -> 2 bytes cec_msg_initiator(msg)  (we might have to add %16 here
> > > in case gcc8 is not clever enough )
> > > * -> 1 byte
> > > %u -> 2 bytes  cec_msg_destination(msg) (we might have to add %16 here
> > > in case gcc8 is not clever enough )
> > > %s ->  CEC_MAX_MSG_SIZE * 3 buf
> >
> > Actually, this is at most (CEC_MAX_MSG_SIZE - 1) * 3, since the first byte
> > of the CEC message isn't included in the buffer.
> >
> > So this code is safe.
> >
> > I agree that it could be made a bit clearer, but something for another day.
> >
> > I ran this patch through the CI and it passed the build-ancient job.
>
> Please check the  full log. I have already added the warning to the
> "allow-list" to move to 6.14
>
> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c: In
> function 'extron_cec_adap_transmit':
> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:44:
> warning: 'DCEC' directive output may be truncated writing 4 bytes into
> a region of size between 1 and 53 [-Wformat-truncation=]
>   snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
>                                             ^~~~
> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:2:
> note: 'snprintf' output between 13 and 65 bytes into a destination of
> size 61
>   snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     port->direction, port->port.port,
>     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     cec_msg_initiator(msg), cec_msg_destination(msg), buf);
>
> This does the trick
> diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> index cfbfc4c1b2e6..c56db19eaf16 100644
> --- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> +++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> @@ -1003,7 +1003,7 @@ static int extron_cec_adap_transmit(struct
> cec_adapter *adap, u8 attempts,
>  {
>         struct extron_port *port = cec_get_drvdata(adap);
>         char buf[CEC_MAX_MSG_SIZE * 3 + 1];
> -       char cmd[CEC_MAX_MSG_SIZE * 3 + 13];
> +       char cmd[CEC_MAX_MSG_SIZE * 3 + 15];

Note that it is 15 and not 14 because I missed an * in my previous email.

Regards!

>         unsigned int i;
>
>         if (port->disconnected)
> @@ -1012,7 +1012,7 @@ static int extron_cec_adap_transmit(struct
> cec_adapter *adap, u8 attempts,
>         for (i = 0; i < msg->len - 1; i++)
>                 sprintf(buf + i * 3, "%%%02X", msg->msg[i + 1]);
>         snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
> -                port->direction, port->port.port,
> +                port->direction, port->port.port % 10,
>                  cec_msg_initiator(msg), cec_msg_destination(msg), buf);
>         return extron_send_and_wait(port->extron, port, cmd, NULL);
>  }
>
>
> >
> > Regards,
> >
> >         Hans
> >
> > > DCEC -> 4 bytes
> > > \0 -> 1 byte
> > >
> > > That is a total of CEC_MAX_MSG_SIZE * 3 + 14. Don't we need to add an
> > > extra byte to cmd?
> > >
> > > char cmd[CEC_MAX_MSG_SIZE * 3 + 14];
> > >
> > > Regards!
> > >
> > > On Tue, 1 Apr 2025 at 10:18, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> > >>
> > >> Change the port type to u8 so gcc8 knows that the port fits in a single
> > >> char.
> > >>
> > >> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:44: warning: 'DCEC' directive output may be truncated writing 4 bytes into a region of size between 0 and 53 [-Wformat-truncation=]
> > >>
> > >> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> > >> Reported-by: Ricardo Ribalda <ribalda@chromium.org>
> > >> ---
> > >>  drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h   | 2 +-
> > >>  .../cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c     | 2 +-
> > >>  .../cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h     | 6 +++---
> > >>  3 files changed, 5 insertions(+), 5 deletions(-)
> > >>
> > >> diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h b/drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h
> > >> index 7422f7c5719e..fa2e02b26565 100644
> > >> --- a/drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h
> > >> +++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h
> > >> @@ -14,7 +14,7 @@ struct cec_splitter;
> > >>  struct cec_splitter_port {
> > >>         struct cec_splitter *splitter;
> > >>         struct cec_adapter *adap;
> > >> -       unsigned int port;
> > >> +       u8 port;
> > >>         bool is_active_source;
> > >>         bool found_sink;
> > >>         ktime_t lost_sink_ts;
> > >> diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> > >> index cfbfc4c1b2e6..c4add8f3f8b4 100644
> > >> --- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> > >> +++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> > >> @@ -1692,7 +1692,7 @@ static int extron_setup_thread(void *_extron)
> > >>                         log_addrs.all_device_types[0] = CEC_OP_ALL_DEVTYPE_TV;
> > >>                 } else {
> > >>                         snprintf(log_addrs.osd_name, sizeof(log_addrs.osd_name),
> > >> -                                "Splitter Out%u", port->port.port);
> > >> +                                "Splitter Out%u", port->port.port % 10);
> > >>                         log_addrs.log_addr_type[0] = CEC_LOG_ADDR_TYPE_PLAYBACK;
> > >>                         log_addrs.primary_device_type[0] = CEC_OP_PRIM_DEVTYPE_PLAYBACK;
> > >>                         log_addrs.all_device_types[0] = CEC_OP_ALL_DEVTYPE_PLAYBACK;
> > >> diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h
> > >> index b79f1253ab5d..cd07e90ea32a 100644
> > >> --- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h
> > >> +++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h
> > >> @@ -83,9 +83,9 @@ struct extron {
> > >>         struct serio *serio;
> > >>         /* locks access to serio */
> > >>         struct mutex serio_lock;
> > >> -       unsigned int num_ports;
> > >> -       unsigned int num_in_ports;
> > >> -       unsigned int num_out_ports;
> > >> +       u8 num_ports;
> > >> +       u8 num_in_ports;
> > >> +       u8 num_out_ports;
> > >>         char unit_name[32];
> > >>         char unit_type[64];
> > >>         char unit_fw_version[32];
> > >> --
> > >> 2.47.2
> > >>
> > >
> > >
> >
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda

