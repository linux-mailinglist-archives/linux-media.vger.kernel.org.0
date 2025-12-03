Return-Path: <linux-media+bounces-48155-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D13AC9F1B2
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 14:18:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D71114E06FA
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 13:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EAB02E7659;
	Wed,  3 Dec 2025 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bu6jtpT1"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECB31F181F
	for <linux-media@vger.kernel.org>; Wed,  3 Dec 2025 13:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764767884; cv=none; b=qufqPoMmQ02jVlYR5Kz8e2arXr/XX/KrmIAT8OZhjLAgTqHaPHLLZJpYg0I/UEld+bu/RcxByGmPRnHMDNawHowibqIhCTF8mwmneMlzXzSqasFhfu086iLGZWA6ac5nwellHvXSzhaW2GPkgA4zzH60s4T1k9carjAS3O8XuYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764767884; c=relaxed/simple;
	bh=reVDA7x3hNUdYQrDUdDx+qmrjkFvJpDTrMTWj2ujyFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BwaFY1CvloZGO9lvRj8BecH3CHHWZlpAM1yYJ+f/N6uOXJdzGYvTPO6Di1zAk6+lx2Mo0z65Qy8nqNL0O5wancSLkNb0slX4auqgEbTMepvruiJ8kr/k/gIPx/FCw4h6tcWnp6zM4wk8cwTtei9fwfHFkdn3CKvz0HAowZ9ZGc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bu6jtpT1; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59431f57bf6so7549995e87.3
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 05:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764767881; x=1765372681; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P5S4Rk+sFIYtI41p7btxGAQ+EtPF7agT5NetpnNswgo=;
        b=bu6jtpT1XHuAw5Ii/005poc/gbgtQ5/FF2ENiSVhpDQfJrob8+YlODIZ18NOz+wmLn
         Ohx3BOUWrJWWJOajswM4TvRCKhbifrFzAHScwQKkUAuUzBDKqsqcuMohF1h+4ji0A/1X
         W0qzeMwyX2JZiGtDl3aje3B5Wq7nGSEMH+fqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764767881; x=1765372681;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5S4Rk+sFIYtI41p7btxGAQ+EtPF7agT5NetpnNswgo=;
        b=Dq2O0X+WcSGr+XvYpMK/pfix1uk5ZYBpwDBF604LNhrATltAise2OUP/MpsiJw+RII
         6qpir6eoN66HzSvbUt6pgnhX8NguKAT1gqnQTYTwZ9wIUcFnsXdTMeqwsAnUgJHYmJGS
         4iQp1gTxEFpXMKnAc/5oytdEWqdX484Q2yQMkwktrCoGEmMurP2c1Eu45icFlFj4D9SG
         oTcIQzECn2fcboHNayULvFSDF4Uxy5Os9g8FEa/1eC6ocVNx1pcLaxJIbnt0T9i+guDt
         VjNDgetUP7zbDiiysJ9aq5/hztsKYiByLHekSWnwmMH2clmr+Fy6SL2s/wMvcB0Fa/1F
         jGDw==
X-Forwarded-Encrypted: i=1; AJvYcCWC+2/aO5ioz1otxvPdlkuGHwvqu8moQbMzDPudv02bR4OVNMkYx6JDWskKnVxk5hgFtHxPZsV7RxjLFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYk6jbR78w/5YEvcQxgAl5CoyNx0EB8Yayn05cleGdNz8x0HQA
	cZPU2LUL7eKBMvCIn73O+c8OIMYDNL6LgEBYFnj3udPzKTOvNqT+8dAWweO1sCx/odc2jtsNovV
	l9xkLXw==
X-Gm-Gg: ASbGncvAqK/6zw1A/e1dLZ+6kLtgYuAdnXPijDGpNiDfHjQm65gQxtVjD1OjwcdlqWb
	WaZx1ILbJFwvh781csZe1KFpZ4Dy7q/7tyahMiRPVUjFJvf/25W3fIZxjdWHGFcAgp4p2rDpvCD
	aFiGSmuZkO+JIrYRQrCCjj4j1H6cQEmP6T56KF8XGFWuIV2yAuygVh6zoQ1Pen+WQUEw7iUurN2
	FFN5Scb5aILmGpGUYzo7HE3J2puQi3wFydRigXa5x0IwKHUm2i/KsPfIryLHL4F2UcG30WUxgeO
	t3jNlxjvO3ZxXinq9q5Vk9k93fHJUHpFXFvP+HEpamRsU6FBXTG1sOv/Jh5q+fKMfXGq8wNDN/f
	paLYkZVHuaho0KhtA0Pl/67TDk7+eT0xC0LH9C1EaYdISwlAc9Et+J2lK20Ws1lasGJbhbpSBMs
	NsowfPehMj3ifjZ2otDd3/OeUr2r6I0Hy79/wrgOnMJ8V2m9GkH8+T4l7f4Ao=
X-Google-Smtp-Source: AGHT+IG3O7A+IUO2LSC9YlSPIKFBji0ILlnsm3bQ/sM0tgQhWP2SSlM4t7Hcpiyk9osufD9Xw+/DVg==
X-Received: by 2002:a05:6512:12c7:b0:587:7f2d:2580 with SMTP id 2adb3069b0e04-597d3fc488bmr1036228e87.32.1764767880699;
        Wed, 03 Dec 2025 05:18:00 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-596bfa43ebesm5707939e87.57.2025.12.03.05.17.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 05:17:59 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5957c929a5eso9777205e87.1
        for <linux-media@vger.kernel.org>; Wed, 03 Dec 2025 05:17:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKf2BM2NHzhC+n0v1Q+7kVz0Qzq5g2XB6S8Hql0PTfV45vCjwkU31Y86StkXSj8TOY7MOjdHiOCmpKRw==@vger.kernel.org
X-Received: by 2002:a05:6512:2354:b0:595:83f5:c33f with SMTP id
 2adb3069b0e04-597d3f729fdmr900528e87.19.1764767878697; Wed, 03 Dec 2025
 05:17:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-warnings-6-19-v1-0-25308e136bca@chromium.org>
 <20251203-warnings-6-19-v1-2-25308e136bca@chromium.org> <20251203091649.GA13064@pendragon.ideasonboard.com>
In-Reply-To: <20251203091649.GA13064@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 3 Dec 2025 14:17:45 +0100
X-Gmail-Original-Message-ID: <CANiDSCvbZ+kUCCYV0OKEBXha5Mfpk4-vkhSWcnvjzh89LfLufQ@mail.gmail.com>
X-Gm-Features: AWmQ_blUSRjZVyg4YIgU-ywSdUHU1lQSr3F3WW-ElU_ZLNp7Yz4ryrusstxNQOs
Message-ID: <CANiDSCvbZ+kUCCYV0OKEBXha5Mfpk4-vkhSWcnvjzh89LfLufQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: iris: Document difference in size during allocation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Keke Li <keke.li@amlogic.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent



On Wed, 3 Dec 2025 at 10:17, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Dec 03, 2025 at 08:55:35AM +0000, Ricardo Ribalda wrote:
> > As we get ready for kzalloc checking for invalid sizes, let's add
> > documentation for the cases where the size is different but valid.
> >
> > This patch fixes this cocci warning:
> > ./platform/qcom/iris/iris_hfi_gen2_command.c:1215:9-25: WARNING: casting value returned by memory allocation function to (struct iris_inst *) is useless.
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> > index f9129553209922fda548ca320494ae6ae797854c..ab91afd0597045bd876d0411b08b5a3421b12c70 100644
> > --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> > +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> > @@ -1212,5 +1212,13 @@ void iris_hfi_gen2_command_ops_init(struct iris_core *core)
> >
> >  struct iris_inst *iris_hfi_gen2_get_instance(void)
> >  {
> > -     return (struct iris_inst *)kzalloc(sizeof(struct iris_inst_hfi_gen2), GFP_KERNEL);
> > +     struct iris_inst_hfi_gen2 *out;
> > +
> > +     /*
> > +      * The allocation is intentionally larger. The first member of
> > +      * struct iris_hfi_gen2 is struct iris_inst.
> > +      */
> > +     out = kzalloc(sizeof(*out), GFP_KERNEL);
> > +
> > +     return (struct iris_inst *)out;
>
>         return &out->inst;
>
> would be more readable. You can then drop the comment.

It looks better, and it is more robust. Thanks

I prefer to leave a small comment though:

+       struct iris_inst_hfi_gen2 *out;
+
+       /* The allocation is intentionally larger than struct iris_inst. */
+       out = kzalloc(sizeof(*out), GFP_KERNEL);
+
+       return &out->inst;


Regards

>
> >  }
> >
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

