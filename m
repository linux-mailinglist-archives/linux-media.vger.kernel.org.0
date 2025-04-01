Return-Path: <linux-media+bounces-29127-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CABA77754
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 11:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 404313AB282
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 09:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CC91EE019;
	Tue,  1 Apr 2025 09:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TGOrLlOy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D971EDA14
	for <linux-media@vger.kernel.org>; Tue,  1 Apr 2025 09:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743498709; cv=none; b=a1P0H4e7ev5c2lxeOedDc6linglX5BzufxPEoywbR9G6R7/WHL/0x0ePK6tkmExanrJ+dryuErVLk5AsAfKjI7Y372mE3AShcTzoNzcuSBY1hZ89VWmLqg/1SKUEzjRVgMPq8RpfnWu/lJkFH/pHEQZdMw8acGd7bviTbxnyPqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743498709; c=relaxed/simple;
	bh=p8DHTi3Za/tI6OPWKL2aIB6I/RThaYEdn657WfHnJxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kjBkPpWzVR/I0TstErScVSAyAfDccVnrj01NzzOHijvItqW89Ec+O4aOfSIX15qmeiAaG6q0gGPHQi0dVUJRRA106nfoXk9kw9iV6v69+mJVrpXve87si/RTh4qLOGR8f3IGWfnE7IfZX9YNRGmJ2Y8yUThpEVbt+16xRBmcVWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TGOrLlOy; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5499e3ec54dso6026974e87.0
        for <linux-media@vger.kernel.org>; Tue, 01 Apr 2025 02:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743498705; x=1744103505; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y6G4HIBOXLcV4V0qXmz7XkYBnWOeypui+TDu06is8F8=;
        b=TGOrLlOyEJtzOvePl1EOnzDoW4RNuUDpWoNrWFOTsUfTfYrss6hKba1dUb3fdWTXZs
         y3A2SbniTTdIKxrmBaMptFpLdVItMde2AjJYk1K1c9mSqoEH65g3IX60oMQH+vhGDiGi
         ZwOKsXGa6JUl064/WwJRZjY/O9gAKWpsxsLOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743498705; x=1744103505;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6G4HIBOXLcV4V0qXmz7XkYBnWOeypui+TDu06is8F8=;
        b=NNgcNUDsJEf6SgBtMVzfLo0EqRw9Sq8fwwYq/Jd04XKw/f2tidN5WA0EkCoI2ldYpB
         +WalaDXwvn14bQXmCiNiKa96djyA4/rX1euaRKpL48BJPz0N4kPrCoFQsqXok5rLIk65
         k/9lTiJlB439Iec6p7sWiPkJlFfcdbb4JimC2HlL30r2UAQcd5duCsXj4EaQIDJ/0iUQ
         WlgKGeJZOW2iZOST3GPFLZfbIq+QGKwC3nI9a3QnpiAqM0ZgzJ4MfJj1llCC9Y57yaTk
         A1cwg46ZXYmZS2nrd9XxqSeC1zgtbGtjstgo5EqYcXHN2EAmj29EnrbRa6GM+n0sf0vk
         KeoQ==
X-Gm-Message-State: AOJu0Yy84+Z1UiA2HT9FUOMjbFWvWdPS3S4OWlSkLZcPu7sfXvtB8mjc
	i6GtNlkkpCw/GHZEeWkZtGCWA55gIlrbzyx4DBv3u4WMy0Bis5qH7icYrKpu1Bf+ONsikBCN1U8
	=
X-Gm-Gg: ASbGncvAdRLXkSSc28fDPRpVZC+O4RkwYO7Pr6dO6SH01yM/wP7vYp1wHffxb+5aJ26
	cavJLPGSFPty5RcOJ4TFucH8AgFXtGdS2rfbcFWbXjghw9Mu/z47egWxC+Qkz/4SGvNk61bcrmd
	iNdQmV17s2zzcGCUSbIhWVX96DlGl9Mo+hB7gvax0i7Hh6NnyipTv7sx+e0a2aJ0WHQQsok76Kb
	tcyaNleWI/G3RZxvssxZ4nBRNz33JpsTVX3/7+boR4gan2ozqObJztKss83DfEtC9PqGqg9haQT
	MFBTRUq4uMl2wp1/uZc4bB3g5/EQSgWnnVJrvNnBYpUxWimkWELVF9H6umXWcsGImwuZZwfv1Vm
	ckkOtvbI=
X-Google-Smtp-Source: AGHT+IGmSQUEo3RY2ejp9wNWeQ+0FWAiw5WQ9yKcT0hghxQZnQbRowJvPOJK6+8Lh6SpMOZPRBRkpw==
X-Received: by 2002:a05:6512:3090:b0:545:22ec:8b6c with SMTP id 2adb3069b0e04-54b1110d5d2mr3506920e87.35.1743498704624;
        Tue, 01 Apr 2025 02:11:44 -0700 (PDT)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c1667sm1312662e87.67.2025.04.01.02.11.43
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 02:11:43 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-549967c72bcso5719191e87.3
        for <linux-media@vger.kernel.org>; Tue, 01 Apr 2025 02:11:43 -0700 (PDT)
X-Received: by 2002:a05:6512:2305:b0:549:735f:f0f6 with SMTP id
 2adb3069b0e04-54b1113c49amr3739592e87.50.1743498703075; Tue, 01 Apr 2025
 02:11:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cee8080d-ea46-432c-8241-e7ec81ef691d@xs4all.nl>
 <CANiDSCsrF-OAKg9OSTEwwGWq=6EgJ7MK6XahgONq_3UXuj8DFw@mail.gmail.com> <adf3386e-2029-4126-8b15-019240cd91ba@xs4all.nl>
In-Reply-To: <adf3386e-2029-4126-8b15-019240cd91ba@xs4all.nl>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 1 Apr 2025 11:11:30 +0200
X-Gmail-Original-Message-ID: <CANiDSCt7gjNK=MBgvg-yO+L7kdPPyDgoi4Y8Lyqb1fSnyLJaTg@mail.gmail.com>
X-Gm-Features: AQ5f1Jp-tFC07HcW2O6Avs-q2d_xOWvbJk4TiCTf258cxTPNNoBHqPB_Es0RONk
Message-ID: <CANiDSCt7gjNK=MBgvg-yO+L7kdPPyDgoi4Y8Lyqb1fSnyLJaTg@mail.gmail.com>
Subject: Re: [PATCHv2] media: cec: extron-da-hd-4k-plus: Fix Wformat-truncation
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Hans

On Tue, 1 Apr 2025 at 10:43, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 01/04/2025 10:30, Ricardo Ribalda wrote:
> > Hi Hans
> >
> > snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
> >               port->direction, port->port.port,
> >               cec_msg_initiator(msg), cec_msg_destination(msg), buf);
> >
> > Will need:
> > W -> 1 byte
> > %c -> 1 byte
> > %u -> 1 byte port.port  (we might have to add %10 here in case gcc8 is
> > not clever enough )
> > * -> 1 byte
> > %u -> 2 bytes cec_msg_initiator(msg)  (we might have to add %16 here
> > in case gcc8 is not clever enough )
> > * -> 1 byte
> > %u -> 2 bytes  cec_msg_destination(msg) (we might have to add %16 here
> > in case gcc8 is not clever enough )
> > %s ->  CEC_MAX_MSG_SIZE * 3 buf
>
> Actually, this is at most (CEC_MAX_MSG_SIZE - 1) * 3, since the first byte
> of the CEC message isn't included in the buffer.
>
> So this code is safe.
>
> I agree that it could be made a bit clearer, but something for another day.
>
> I ran this patch through the CI and it passed the build-ancient job.

Please check the  full log. I have already added the warning to the
"allow-list" to move to 6.14

drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c: In
function 'extron_cec_adap_transmit':
drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:44:
warning: 'DCEC' directive output may be truncated writing 4 bytes into
a region of size between 1 and 53 [-Wformat-truncation=]
  snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
                                            ^~~~
drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:2:
note: 'snprintf' output between 13 and 65 bytes into a destination of
size 61
  snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    port->direction, port->port.port,
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    cec_msg_initiator(msg), cec_msg_destination(msg), buf);

This does the trick
diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
index cfbfc4c1b2e6..c56db19eaf16 100644
--- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
+++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
@@ -1003,7 +1003,7 @@ static int extron_cec_adap_transmit(struct
cec_adapter *adap, u8 attempts,
 {
        struct extron_port *port = cec_get_drvdata(adap);
        char buf[CEC_MAX_MSG_SIZE * 3 + 1];
-       char cmd[CEC_MAX_MSG_SIZE * 3 + 13];
+       char cmd[CEC_MAX_MSG_SIZE * 3 + 15];
        unsigned int i;

        if (port->disconnected)
@@ -1012,7 +1012,7 @@ static int extron_cec_adap_transmit(struct
cec_adapter *adap, u8 attempts,
        for (i = 0; i < msg->len - 1; i++)
                sprintf(buf + i * 3, "%%%02X", msg->msg[i + 1]);
        snprintf(cmd, sizeof(cmd), "W%c%u*%u*%u*%sDCEC",
-                port->direction, port->port.port,
+                port->direction, port->port.port % 10,
                 cec_msg_initiator(msg), cec_msg_destination(msg), buf);
        return extron_send_and_wait(port->extron, port, cmd, NULL);
 }


>
> Regards,
>
>         Hans
>
> > DCEC -> 4 bytes
> > \0 -> 1 byte
> >
> > That is a total of CEC_MAX_MSG_SIZE * 3 + 14. Don't we need to add an
> > extra byte to cmd?
> >
> > char cmd[CEC_MAX_MSG_SIZE * 3 + 14];
> >
> > Regards!
> >
> > On Tue, 1 Apr 2025 at 10:18, Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> Change the port type to u8 so gcc8 knows that the port fits in a single
> >> char.
> >>
> >> drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c:1014:44: warning: 'DCEC' directive output may be truncated writing 4 bytes into a region of size between 0 and 53 [-Wformat-truncation=]
> >>
> >> Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
> >> Reported-by: Ricardo Ribalda <ribalda@chromium.org>
> >> ---
> >>  drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h   | 2 +-
> >>  .../cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c     | 2 +-
> >>  .../cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h     | 6 +++---
> >>  3 files changed, 5 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h b/drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h
> >> index 7422f7c5719e..fa2e02b26565 100644
> >> --- a/drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h
> >> +++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/cec-splitter.h
> >> @@ -14,7 +14,7 @@ struct cec_splitter;
> >>  struct cec_splitter_port {
> >>         struct cec_splitter *splitter;
> >>         struct cec_adapter *adap;
> >> -       unsigned int port;
> >> +       u8 port;
> >>         bool is_active_source;
> >>         bool found_sink;
> >>         ktime_t lost_sink_ts;
> >> diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> >> index cfbfc4c1b2e6..c4add8f3f8b4 100644
> >> --- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> >> +++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> >> @@ -1692,7 +1692,7 @@ static int extron_setup_thread(void *_extron)
> >>                         log_addrs.all_device_types[0] = CEC_OP_ALL_DEVTYPE_TV;
> >>                 } else {
> >>                         snprintf(log_addrs.osd_name, sizeof(log_addrs.osd_name),
> >> -                                "Splitter Out%u", port->port.port);
> >> +                                "Splitter Out%u", port->port.port % 10);
> >>                         log_addrs.log_addr_type[0] = CEC_LOG_ADDR_TYPE_PLAYBACK;
> >>                         log_addrs.primary_device_type[0] = CEC_OP_PRIM_DEVTYPE_PLAYBACK;
> >>                         log_addrs.all_device_types[0] = CEC_OP_ALL_DEVTYPE_PLAYBACK;
> >> diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h
> >> index b79f1253ab5d..cd07e90ea32a 100644
> >> --- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h
> >> +++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.h
> >> @@ -83,9 +83,9 @@ struct extron {
> >>         struct serio *serio;
> >>         /* locks access to serio */
> >>         struct mutex serio_lock;
> >> -       unsigned int num_ports;
> >> -       unsigned int num_in_ports;
> >> -       unsigned int num_out_ports;
> >> +       u8 num_ports;
> >> +       u8 num_in_ports;
> >> +       u8 num_out_ports;
> >>         char unit_name[32];
> >>         char unit_type[64];
> >>         char unit_fw_version[32];
> >> --
> >> 2.47.2
> >>
> >
> >
>


-- 
Ricardo Ribalda

