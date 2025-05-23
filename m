Return-Path: <linux-media+bounces-33232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F20AC1E2C
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 10:03:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 959327BBA51
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 08:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0C6284B5A;
	Fri, 23 May 2025 08:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gHdPFiDD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70998198E9B
	for <linux-media@vger.kernel.org>; Fri, 23 May 2025 08:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747987390; cv=none; b=XyEV/1pJLu10eXzuEYjJY1iw5RXlbzeHBzIOol12ClkkoS74zMXDvwkMAQEXC4HVFTuPIjwqUzLO+vtLI0D622vlnpJDPqsW39PJllCZx/FRxNooxbigr8faYucAUKzBqIDV34VTe3ixo74t1JW6MiTAUq6g58WzyH4J5r7daMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747987390; c=relaxed/simple;
	bh=Z9wdvBlSi3BObVddybjKovmq3bYiwy0P8Il9XeqD+jA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jpU70tCYVGWrvwQRji1FK6M4zu6zHrtxtcPGwJmGiQpKJ6nZJoHpZUsryjKPuZI7rH0gK7b8A39VO9KH7HmOx23/VT+4zO9nBG6wb+PnZiKEl7d2Q/bBBWK4CfK9kaSOmRtI9Ius+jmWCJBKlFknAosChih+ZhgirCfq4FeJA/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gHdPFiDD; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54998f865b8so9719122e87.3
        for <linux-media@vger.kernel.org>; Fri, 23 May 2025 01:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747987386; x=1748592186; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/6sGKaUm1itIb8350SqqYclw+MJpBJzbhFCfRRStfo=;
        b=gHdPFiDD+v1tjJn07UfxPOwGFqvzVeqmxhCVaScSCurfBZS0PHMo5DDsDTKt8JV92b
         is5GRgVw+ChR9x3mD6fW/+Ze8vxlm0yuj7CQgx7H7UPthZDV9U3I0ZWmHqZD8TzSd8Dc
         NEmXv1hkT5uuQqmdO4ichGhaGB/iD2z/62mTg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747987386; x=1748592186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/6sGKaUm1itIb8350SqqYclw+MJpBJzbhFCfRRStfo=;
        b=I7hu7S5/qgLujURBApUY6KouWGEAOO89/3ETzByeeFlzNxP/x0bZbi9TN15DLHJbn9
         jQS0JxNj3PBaNADziTswKxAbbpbwO9a8ce4gBwOC2vM8vRSHEqA78lE/MvREVzf085Dg
         VZ+K5UlecinT/v5gtoPPjuMpHqQaBafr2p4CWFdhLwP26WM9apFEIga22yYoLeQb2yDi
         OWBU4zeWyDWVWmdqPJQkbvxq431Mhw4ulYtWx/CqTH7aCEGgflMHlCY/WKvW0FQuBxEF
         kObToBhBGmDPnivDo74zCaha9yYKeYfbQQzTtDH3wwDXC1ndNWK5W6nNvA3O+OecyG6M
         2UJQ==
X-Gm-Message-State: AOJu0YzVuZuFCMAjvIsaYXwc3nDjjAK4lPZyU8nvhFC2TZRHMHkA+bCz
	kdrpYk6jwu6kTGU6P0aL8k8vPofDXWm7H9Q3B1ZMmyMwQQs1r1JZvuYw7IdGn7s/Mw6x0kVAeXj
	SPRW/ag==
X-Gm-Gg: ASbGncsMPx2CO2JF/o8LstL9LDQQWG1h2tan+wT+PbFzWceKslFRsjzChqFEaxf1epa
	2IzjRf+vbxzliOlnFsONTJ0+dyn5Nr6P0lqKAnJl+olpfk/TAZmJOkHhDYHg9I8/OWz1y35kLR4
	utpGD0VBtWocNH4Llxq5s2lF09Dil+ve/+GPet4QBxpIlF2QcVYI7GwfEbnajequxOoo8x3TSIi
	rVCYgJGL7kcBA4eiFPqhR658HehEqlTqhE4dZMcxlz/SYX80ove9tImISy5CyOx37xA1Ou4l4hi
	ZC7STPK0WPxjlDstlzG++nxiANfrqIylmW1SYEJpsEUAnYsCJ3eTsgNm/I70/jN7n5x5TptMq2L
	D2RxBWJapJHsrxA==
X-Google-Smtp-Source: AGHT+IHBgE84VHfZ6xRNVqsCsOv7dVTGV158QnfUlDZouQL5v7FaMwf8ts752AclgzYuQZkFrhNReg==
X-Received: by 2002:a05:6512:630e:b0:54f:c233:9969 with SMTP id 2adb3069b0e04-550e719791dmr6851513e87.2.1747987386209;
        Fri, 23 May 2025 01:03:06 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f163edsm3735018e87.52.2025.05.23.01.03.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 01:03:05 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54998f865b8so9719106e87.3
        for <linux-media@vger.kernel.org>; Fri, 23 May 2025 01:03:05 -0700 (PDT)
X-Received: by 2002:a05:6512:3e04:b0:550:d5cb:3490 with SMTP id
 2adb3069b0e04-550e7245369mr10690126e87.43.1747987385237; Fri, 23 May 2025
 01:03:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAB=g0fRy-JFPqCGa+06Asop7mev+1Kx35gdyA7X=gtujOndgUw@mail.gmail.com>
 <CANiDSCvbyx2=Vwso7pPNs_0-pvXaK+q2-hdTZnDqrzazMcQuHw@mail.gmail.com> <CAB=g0fSq5BB_zvyQvZtPuFZ4iuTqyAQqPVpMHYHm6N7Exfthng@mail.gmail.com>
In-Reply-To: <CAB=g0fSq5BB_zvyQvZtPuFZ4iuTqyAQqPVpMHYHm6N7Exfthng@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 23 May 2025 10:02:53 +0200
X-Gmail-Original-Message-ID: <CANiDSCtzzNGDmKsL-YPQbycxQqGDnJkh-ojrEJJYWkXRC9fqsA@mail.gmail.com>
X-Gm-Features: AX0GCFtww-lsC1SLXlsInl_X905vaNsPW49POsngakdvSi9373zSEsGvXsEe3eM
Message-ID: <CANiDSCtzzNGDmKsL-YPQbycxQqGDnJkh-ojrEJJYWkXRC9fqsA@mail.gmail.com>
Subject: Re: 0bda:5558 on ubuntu 22.04
To: Raul Negreiros <raulnegreiros@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Raul

The last log shows some USB errors:

[  330.820439] usb 3-6: reset high-speed USB device number 6 using xhci_hcd
[  330.936287] usb 3-6: device descriptor read/64, error -71
[  331.156204] usb 3-6: device descriptor read/64, error -71
[  331.381190] usb 3-6: reset high-speed USB device number 6 using xhci_hcd
[  331.495288] usb 3-6: Device not responding to setup address.
[  331.697115] usb 3-6: Device not responding to setup address.
[  331.905070] usb 3-6: device not accepting address 6, error -71
[  332.020090] usb 3-6: reset high-speed USB device number 6 using xhci_hcd
[  332.020262] usb 3-6: Device not responding to setup address.
[  332.225143] usb 3-6: Device not responding to setup address.
[  332.433009] usb 3-6: device not accepting address 6, error -71
[  332.546898] usb 3-6: reset high-speed USB device number 6 using xhci_hcd
[  332.559654] usb 3-6: device descriptor read/all, error -71
[  332.559949] usb 3-6: USB disconnect, device number 6
[  332.673926] usb 3-6: new high-speed USB device number 7 using xhci_hcd
[  332.789028] usb 3-6: device descriptor read/64, error -71
[  333.010874] usb 3-6: device descriptor read/64, error -71
[  333.226659] usb 3-6: new high-speed USB device number 8 using xhci_hcd
[  333.349364] usb 3-6: Device not responding to setup address.
[  333.555557] usb 3-6: Device not responding to setup address.
[  333.760631] usb 3-6: device not accepting address 8, error -71
[  333.760695] usb usb3-port6: attempt power cycle
[  334.148438] usb 3-6: new high-speed USB device number 9 using xhci_hcd
[  334.148522] usb 3-6: Device not responding to setup address.
[  334.352458] usb 3-6: Device not responding to setup address.
[  334.560417] usb 3-6: device not accepting address 9, error -71
[  334.674310] usb 3-6: new high-speed USB device number 10 using xhci_hcd
[  334.688683] usb 3-6: unable to get BOS descriptor set
[  334.689345] usb 3-6: unable to read config index 0 descriptor/start: -71
[  334.689350] usb 3-6: can't read configurations, error -71
[  334.689461] usb usb3-port6: unable to enumerate USB device


Could it be that your camera firmware is somehow corrupted?

Try checking if your camera is supported by fwupd, or if the notebook
vendor has an "updater" tool for your camera.


Regards!

On Wed, 14 May 2025 at 01:43, Raul Negreiros <raulnegreiros@gmail.com> wrot=
e:
>
> Thank you for the fast reply, unfortunately, it does not help.
> Are there some logs that I can collect to help?
>
> On Tue, May 13, 2025 at 7:47=E2=80=AFPM Ricardo Ribalda <ribalda@chromium=
.org> wrote:
>>
>> Hi Raul
>>
>> Thanks for the report
>>
>>
>> Could you try setting quirks to 16?
>>
>> rmmod uvcvideo; modprobe uvcvideo quirks=3D16
>>
>> Regards
>>
>> On Tue, 13 May 2025 at 02:24, Raul Negreiros <raulnegreiros@gmail.com> w=
rote:
>> >
>> > Hello,
>> >
>> > The camera 0bda:5558 is not working on Ubuntu 22.04
>> >
>> > Linux 18343-nb 6.8.0-59-generic #61~22.04.1-Ubuntu SMP PREEMPT_DYNAMIC=
 Tue Apr 15 17:03:15 UTC 2 x86_64 x86_64 x86_64 GNU/Linux
>> >
>> > Please let me know if I can provide more information. During the tests=
, I tried to open Cheese and Google Meet.
>> >
>> > Best regards
>>
>>
>>
>> --
>> Ricardo Ribalda



--=20
Ricardo Ribalda

