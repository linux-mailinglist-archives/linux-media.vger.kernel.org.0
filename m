Return-Path: <linux-media+bounces-6136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4651186C6D5
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 11:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02EE6284B53
	for <lists+linux-media@lfdr.de>; Thu, 29 Feb 2024 10:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47FB3651B6;
	Thu, 29 Feb 2024 10:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CIgdZ34p"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03AF6351F
	for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 10:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709202354; cv=none; b=VUhKpafO1Uj7mWc04+AzpUHcikCWn7jHVgOHyBv5w8XQ27UfOWlf0vHAraQou+qqo3uPefBqN16RHubhXhPzMlZVpbhX+5lQC4QHAEUvgbl2rcXha8rw4LnlQkXeIE59E2oyWtEexbGEpH45jsgy9c3cg0g+m1PTJoYJFqtVGVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709202354; c=relaxed/simple;
	bh=L3otKDiKmoYiNyKoH8hToJZHi9QcL1mwSS7YeznPnFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BBBejLw0vwd5dIsIu64wRsi0MIKS8AugEnt2/Xl6OOCC2hisRq5K3sygXwJk5TMEyNludHhfViTXRQ2YoaCXVaHlj7TMzM7ZdM9Gt9nY6jti3PxAKuqacgXWvnIoFptrbEEHjIoy9ARKatCanbiK2z0JrAdqWDmqaCa7Vp6Z+Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CIgdZ34p; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7c7b9b25ba6so33628839f.1
        for <linux-media@vger.kernel.org>; Thu, 29 Feb 2024 02:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709202352; x=1709807152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpcZnx5dbRty5Sf0Le7nOZDViI6+9gd83COGv8VYuWo=;
        b=CIgdZ34ptqz2YsS6fLUvxmQg42euWLSyEIzARTlQHBv6eIZpROrOVxAMYuq1YppLE9
         p+MtqXD91QLN8NusbjJ57RrEaziHuE3tvfHpXXJcxywaMxQ7dYpbF6X9Q/z/bKg159xi
         EdX/MxhIhUIiEqliS7926Ac4bS4/Zjue7+nzITTLhnlZPPJw9TdjuDODHPoVOrGWvQzD
         5qcgDK16BpTXFEKgbLo4pny9g0XgN/sRTEej4fYYO94nGvyI61nFLQrh2ZCx8FLODx4p
         fLmXKRncIh1l9S+q4isbA1uOY5uGFRr5hnP7hOjz79SYgH9AUG3Rf5wFhckCoB6AndFw
         o7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709202352; x=1709807152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpcZnx5dbRty5Sf0Le7nOZDViI6+9gd83COGv8VYuWo=;
        b=HJeztimC/hLWEa/h6LgouAe+3RXz/rVCka3n1lZuV2FMjKyqREoUOVGlHKa6V4blpg
         SMNA2bICbFxxefcnzwWoKmBJAjqIhKK6Ba9XzprtMmiVwm1jQHk5zYGW531MvpLTZn9U
         vumDSwsaRvoJp1asxdt3czCp6sPAPVdJyjEyR+UYmcZaXlzbmlreWAFFTGSQAS44oZbJ
         QvyFNwi1WfI6j5tDPnrAnyz9MA6Qs9Gvc4qbw5wcUt0DcagOiRydBqWpg7wFhTmQAse0
         +4021AYAlGZjJXSE0gtZnObaujrXccG+7LLBitZc+xOFNWf0lPVvAyuwa6qig+FXDvDh
         Dl6g==
X-Forwarded-Encrypted: i=1; AJvYcCXSCDtUlk+VWj9vQvqLLZ6pW98Golw7WKgmAXAavfwrYwwaa9SgddfD72Y1GVbEk1D4ik2bkOPkVT2OgK8nP6M7k1kQdftsLfnYVhI=
X-Gm-Message-State: AOJu0YxQ6UKuLBJULrQVkUmAX8LRDlvypoCoTikA81t4h86brKfNghrW
	uwtnFP+PL1S/aJQQlNzO56fpb4xlg2cNVzXPKoPvZj9Cod/GOsxTkyGMtCU44FngRbZmI/TgiIL
	QX4TsMbH6H7v+1/XuKmfz7BYnj5hGTXrrCt4q
X-Google-Smtp-Source: AGHT+IEx8H6lKJkRxdMCbvdpYLSnZ6ffccNVSyjgjJzl2J1MbCWOGEG+M7RNHteijmJmzVzUaew6fbebLQdqsrIqgjI=
X-Received: by 2002:a05:6602:641d:b0:7c7:cd3b:9e69 with SMTP id
 gn29-20020a056602641d00b007c7cd3b9e69mr2515469iob.3.1709202351983; Thu, 29
 Feb 2024 02:25:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221160215.484151-1-panikiel@google.com> <20240221160215.484151-9-panikiel@google.com>
 <13aeb2ff-72f4-49d9-b65e-ddc31569a936@linaro.org> <CAM5zL5q0oKoTMR0jSwYVAChCOJ9iKYPRFiU1vH4qDqhHALKz4w@mail.gmail.com>
 <20240227142911.GB3863852-robh@kernel.org> <CAM5zL5pXu5sbzCHY_BrCJ7eZj-p9n0tCo6CmuTqUpvniTrqWJg@mail.gmail.com>
 <324f7b6e-c72c-40aa-afe6-779345c2eade@linaro.org> <CAM5zL5oJSHxJK4QWsr2X23g-cN6G54VhGfuwHhMJ9rNu6+gZ=w@mail.gmail.com>
 <20240228180950.GA392372-robh@kernel.org>
In-Reply-To: <20240228180950.GA392372-robh@kernel.org>
From: =?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>
Date: Thu, 29 Feb 2024 11:25:41 +0100
Message-ID: <CAM5zL5qen2Zcg3yecH3jXJ3hiLq88p81n9hmUXQ5E0CXV6w61w@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] media: dt-bindings: Add Intel Displayport RX IP
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, airlied@gmail.com, 
	akpm@linux-foundation.org, conor+dt@kernel.org, daniel@ffwll.ch, 
	dinguyen@kernel.org, hverkuil-cisco@xs4all.nl, 
	krzysztof.kozlowski+dt@linaro.org, maarten.lankhorst@linux.intel.com, 
	mchehab@kernel.org, mripard@kernel.org, tzimmermann@suse.de, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, ribalda@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 7:10=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
>
> On Wed, Feb 28, 2024 at 02:09:33PM +0100, Pawe=C5=82 Anikiel wrote:
> > On Wed, Feb 28, 2024 at 1:18=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> > >
> > > On 28/02/2024 12:05, Pawe=C5=82 Anikiel wrote:
> > > > On Tue, Feb 27, 2024 at 3:29=E2=80=AFPM Rob Herring <robh@kernel.or=
g> wrote:
> > > >>
> > > >> On Mon, Feb 26, 2024 at 11:59:42AM +0100, Pawe=C5=82 Anikiel wrote=
:
> > > >>> On Mon, Feb 26, 2024 at 10:13=E2=80=AFAM Krzysztof Kozlowski
> > > >>> <krzysztof.kozlowski@linaro.org> wrote:
> > > >>>>
> > > >>>> On 21/02/2024 17:02, Pawe=C5=82 Anikiel wrote:
> > > >>>>> The Intel Displayport RX IP is a part of the DisplayPort Intel =
FPGA IP
> > > >>>>> Core. It implements a DisplayPort 1.4 receiver capable of HBR3 =
video
> > > >>>>> capture and Multi-Stream Transport. The user guide can be found=
 here:
> > > >>>>>
> > > >>>>> https://www.intel.com/programmable/technical-pdfs/683273.pdf
> > > >>>>>
> > > >>>>> Signed-off-by: Pawe=C5=82 Anikiel <panikiel@google.com>
> > > >>>>> ---
> > > >>>>>  .../devicetree/bindings/media/intel,dprx.yaml | 160 ++++++++++=
++++++++
> > > >>>>>  1 file changed, 160 insertions(+)
> > > >>>>>  create mode 100644 Documentation/devicetree/bindings/media/int=
el,dprx.yaml
> > > >>>>>
> > > >>>>> diff --git a/Documentation/devicetree/bindings/media/intel,dprx=
.yaml b/Documentation/devicetree/bindings/media/intel,dprx.yaml
> > > >>>>> new file mode 100644
> > > >>>>> index 000000000000..31025f2d5dcd
> > > >>>>> --- /dev/null
> > > >>>>> +++ b/Documentation/devicetree/bindings/media/intel,dprx.yaml
> > > >>>>> @@ -0,0 +1,160 @@
> > > >>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > >>>>> +%YAML 1.2
> > > >>>>> +---
> > > >>>>> +$id: http://devicetree.org/schemas/media/intel,dprx.yaml#
> > > >>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > >>>>> +
> > > >>>>> +title: Intel DisplayPort RX IP
> > > >>>>> +
> > > >>>>> +maintainers:
> > > >>>>> +  - Pawe=C5=82 Anikiel <panikiel@google.com>
> > > >>>>> +
> > > >>>>> +description: |
> > > >>>>> +  The Intel Displayport RX IP is a part of the DisplayPort Int=
el FPGA IP
> > > >>>>> +  Core. It implements a DisplayPort 1.4 receiver capable of HB=
R3 video
> > > >>>>> +  capture and Multi-Stream Transport.
> > > >>>>> +
> > > >>>>> +  The IP features a large number of configuration parameters, =
found at:
> > > >>>>> +  https://www.intel.com/content/www/us/en/docs/programmable/68=
3273/23-3-20-0-1/sink-parameters.html
> > > >>>>> +
> > > >>>>> +  The following parameters have to be enabled:
> > > >>>>> +    - Support DisplayPort sink
> > > >>>>> +    - Enable GPU control
> > > >>>>> +  The following parameters' values have to be set in the devic=
etree:
> > > >>>>> +    - RX maximum link rate
> > > >>>>> +    - Maximum lane count
> > > >>>>> +    - Support MST
> > > >>>>> +    - Max stream count (only if Support MST is enabled)
> > > >>>>> +
> > > >>>>> +properties:
> > > >>>>> +  compatible:
> > > >>>>> +    const: intel,dprx-20.0.1
> > > >>>>> +
> > > >>>>> +  reg:
> > > >>>>> +    maxItems: 1
> > > >>>>> +
> > > >>>>> +  interrupts:
> > > >>>>> +    maxItems: 1
> > > >>>>> +
> > > >>>>> +  intel,max-link-rate:
> > > >>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
> > > >>>>> +    description: Max link rate configuration parameter
> > > >>>>
> > > >>>> Please do not duplicate property name in description. It's usele=
ss.
> > > >>>> Instead explain what is this responsible for.
> > > >>>>
> > > >>>> Why max-link-rate would differ for the same dprx-20.0.1? And why
> > > >>>> standard properties cannot be used?
> > > >>>>
> > > >>>> Same for all questions below.
> > > >>>
> > > >>> These four properties are the IP configuration parameters mention=
ed in
> > > >>> the device description. When generating the IP core you can set t=
hese
> > > >>> parameters, which could make them differ for the same dprx-20.0.1=
.
> > > >>> They are documented in the user guide, for which I also put a lin=
k in
> > > >>> the description. Is that enough? Or should I also document these
> > > >>> parameters here?
> > > >>
> > > >> Use the standard properties: link-frequencies and data-lanes. Thos=
e go
> > > >> under the port(s) because they are inheritly per logical link.
> > > >
> > > > The DP receiver has one input interface (a deserialized DP stream),
> > > > and up to four output interfaces (the decoded video streams). The "=
max
> > > > link rate" and "max lane count" parameters only describe the input
> > > > interface to the receiver. However, the port(s) I am using here are
> > > > for the output streams. They are not affected by those parameters, =
so
> > > > I don't think these properties should go under the output port(s).
> > > >
> > > > The receiver doesn't have an input port in the DT, because there is=
n't
> > > > any controllable entity on the other side - the deserializer doesn'=
t
> > > > have any software interface. Since these standard properties
> > > > (link-frequencies and data-lanes) are only defined in
> > > > video-interfaces.yaml (which IIUC describes a graph endpoint), I ca=
n't
> > > > use them directly in the device node.
> > >
> > > DT describes the hardware, so where does the input come? From somethi=
ng,
> > > right? Regardless if you have a driver or not. There is dp-connector
> > > binding, if this is physical port.
> >
> > Yes, it is a physical port. I agree adding a DT node for the physical
> > DP input connector would let us add link-frequencies to the input port
> > of the receiver.
> >
> > However, dp-connector seems to be a binding for an output port - it's
> > under schemas/display/connector, and DP_PWR can be a power supply only
> > for an output port (looking at the dp-pwr-supply property). Also, the
> > driver for this binding is a DRM bridge driver (display-connector.c)
> > which would not be compatible with a v4l2 (sub)device.
>
> So then we should add 'dp-input-connector' because they are different.
> When we haven't defined connectors, properties of the connector have
> been shoved in whatever node is associated with a connector like you
> have done. That works for a while, but then becomes unmanageable. DP on
> USB-C connectors for example.
>
> OTOH, maybe your use here is niche enough to not be worth the trouble.
> Depends if we see the need for video input connectors in general.

My use case is a dedicated hardware that runs DP tests of an external
DUT. I can't think of another scenario where we'd need an input DP
port. IMO this is pretty niche, but I'll leave the decision to you

