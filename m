Return-Path: <linux-media+bounces-58320-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLh/CFVh12keNQgAu9opvQ
	(envelope-from <linux-media+bounces-58320-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 10:20:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9052A3C7AEB
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 10:20:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90DAB3055D4B
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 08:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BFA639EF1F;
	Thu,  9 Apr 2026 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="hK8QAq97"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A349C38C40B
	for <linux-media@vger.kernel.org>; Thu,  9 Apr 2026 08:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722547; cv=pass; b=gw73/1shnsqANzFtIgaPNNmyXp4D9l2WETUAbXw32+YeWxB5eqoUwPf91NWWmJlb3QKQBGG08k7FzMBrnUkKQ2WWFmZjUiM2IL++x8SNQ+KVYswVQ1pSIh5rWpbNU2yKoz+X6qwnTGGgKV8j2V9CMVM1JcZ5Mxh7st/VJIhoHH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722547; c=relaxed/simple;
	bh=Dngotpoiby0FdEKfKRicFCk8dHaAyFjbpWnfFURByR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUI0iGn3NCI8tbyg+vRqxf98yHLLae0SO+JFS4v8aj9miNx50OJUwk8LQG8CGXU6TtJ3Z3ajAB7VGqDryn0x94nr9ydenaTo9xA8rdEFx9U9buwidKCL5PkP0mDxuOv2/HR5WHPyXg8/JNIfjxZ9AhhY3bxk+Xc1KZzUwYfAphU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=hK8QAq97; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65075c2ba66so668807d50.1
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 01:15:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775722546; cv=none;
        d=google.com; s=arc-20240605;
        b=JMq6hdvRGi2dI53GVNX/CwjJ/LsXyzH1zpGkPkxHTOhUqA1RN72t1RyFg9cYeAFK9E
         YISnjQIB01vCCLiSFFInEqLTf4D5HN3bPSbVNr+/COaFSbBU4pDvH3IFaBRjttahF3C8
         HqghCu2qvG9AYOPyFZS6D+CdJfFrajt+Zg4OIv/AArbHhvkY/i9D89QXUHPg6aq3x/gn
         p37VrXXOxTTQoF9ZpIFzJ4bijGp2BTCRbrg8ITmDhhj11k2otEIHhxsPEYK71tJMA1Js
         swvGBAIC5x21u39gUmk73WfLIEz3BR9gwqJZCW3GWI3qQaehN62YoCnaq6UcTzBa3TvI
         hEog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dngotpoiby0FdEKfKRicFCk8dHaAyFjbpWnfFURByR0=;
        fh=nbuyvLSKYbIZ4ZZ0Gi5Ws8m+JCir3nRGO7UU1JcHUkc=;
        b=OxLBZRFz96uMlFOim84jQPxRMWsiB4ynKyLE3FJIaj94McmClY3Us9aiIM8vA/RC+l
         i44Pn0vaSVdG8QdRk34RN7hSeZh1UJdAxlL5xLUaz5kdLFGf5/EGye7QIngGxsjYtd1q
         6hzfgysZ/VUK3nR5IdrDtAGYdqA3qnYCzNU9JXNm6OjSoEwmk33rVs/cgAeG5TfoSFK3
         icPYEZ186QagOvXS47loY4+WuBm1r5VUCuC8tr9/JAZVkxDKsXeV9vqx0gHMFxjrhjoW
         Bb4SwesGmM/Auc7Pp+IwPF4Cz9pWfbKYL3R225XEIFPpu3Lbekdww4oQhOJLpNruDF6O
         QQug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775722546; x=1776327346; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dngotpoiby0FdEKfKRicFCk8dHaAyFjbpWnfFURByR0=;
        b=hK8QAq97TlIOoUC3QXTQogSkiZ5m0vdteO2CqmRT8OD8bwfmVSQVKwb2AfKSWKd8x1
         5omp5PoAQxvuew0sos0lP+Bez4zcRbLI51aH7r5EDDVs1bshFInZoziHjOVJ6KUw+njk
         itjwSNNtufrhKpAf2sQRopPferDvPivo+4Z6S//3cTbO3dtR+rRR1Fuh/WJQf4ahxd3/
         jROhSNHiPy+QkNUa3D5k8HY55knVpJw4J+Mq6tFHixiDOmujL+tS2A9beuKTntQsVTPH
         MXNXACM+Ofx6imiR6LU+p3yqgRiC4yeAobPgxBOWan4C3sbU79Y4Ugj59GT0EWJq0IK8
         Xe7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722546; x=1776327346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dngotpoiby0FdEKfKRicFCk8dHaAyFjbpWnfFURByR0=;
        b=Re5HOQOi9A4ty6luLcyZbvLL2NSVdBoyVft6iKRLH4HPrg0Wf8SbHZA9pxyeoXW8fL
         55ZTR0QNbH7w0P2cm3KpzYp4tw1LF7yyaf4cfX5814YrcwDSEiotUPdbvm1YQX0tgbiC
         SMSFEbimIlIxVdxNvFF/S/1u7m0J0yY1XcDW30s9aTGW0bCGu6qJ1rSSu8tRdvf/ncng
         flJOkCuNkZDwVybQvkGC4onCL1qYWu+ZYWqrzx046t2FJuW1UeRRp21+4e+YLDT/re+D
         IPFEV6P5xVs6PimyE5j9WGmZAnna3JE0/09rYh8B/CiRUGVFdMGAwGe+NOg7GlNi29SA
         aXyA==
X-Forwarded-Encrypted: i=1; AJvYcCW0yyU+MbpVrPxIVQL015bMTZrOkkaFbSTMzc9axXvXdLlULr5/fmdQRhoOSlK6Vq9i0NsTbCtEbsHueQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YysfsU9j8cD8Qy7fK7VneTSxJ0d42xcHgD7Wj4ZWpBq7FGwx7hq
	2ZDR8SeyYqiEmKmO/7MSk6JkYtWrhKNbhahQPY1VOB76kZgJFdZNEsCaFWZ4ei8SwRnTXygep2S
	VboThy2SWMyHfu4hQmSpxUYSrZCDPqePPJkwrsaGFRuDcr+ZEde9x9A==
X-Gm-Gg: AeBDievGx2MYRN6eRs2gKABrasucXKWec0R39wtHoLfKTZaLC0WGIeNjFbAL1Dfr2Q+
	lB8husL9rkuGujk1xitRXPp2yepoEVMpaMi94Q5yoe8gQh0rHIPVZ2hJOyLzwbLvC/pp05/y9Iv
	yvx3iJ+vMPiANQgVwpE4/KpbD0RoIG7VammjtVwU7Y/jZAmIeVoegt3Vut8Yot4hWrBC1aCUiCE
	u6M5CIwfhgecVzbSkzsk4TcWnRK1vD6zbkA39sItk/rOjUglCQyqrYqE8aznjshwCztX6st14GT
	tIdh
X-Received: by 2002:a53:ea4c:0:b0:650:3039:6c7d with SMTP id
 956f58d0204a3-65187573bf5mr1888711d50.12.1775722545547; Thu, 09 Apr 2026
 01:15:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260331003806.212565-3-jp@jphein.com>
 <CANiDSCvsxP+npQTHUrMTp+Z8XULYKSLTz2AFu+WQnsLbRBGa2w@mail.gmail.com> <20260409100247.7cfb62d1.michal.pecio@gmail.com>
In-Reply-To: <20260409100247.7cfb62d1.michal.pecio@gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Thu, 9 Apr 2026 01:15:34 -0700
X-Gm-Features: AQROBzBsC-Nkq1RmMLeEIh8sjrySSruolHrCkdk9eliqPcQqpZeF-BuE1MuBPPs
Message-ID: <CAD5VvzCr7gOxB2J5A6Bpma5+4OTn0zFDmpyzb3N016-BS4a87A@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile firmware
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58320-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,jphein.com:dkim,jphein.com:email]
X-Rspamd-Queue-Id: 9052A3C7AEB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Michal,

Thanks for taking another look.

I will reproduce the hc_died() crash with dynamic debug enabled
(xhci_hcd +p, usbcore +p) and with all unrelated USB devices
disconnected so the logs are clean. The slot 17 stalls in the
previous logs may have been from another device on the bus --
I will make sure only the Kiyo is connected for the next capture.

The crash that kills the controller happens when starting a video
stream (LPM disable failure path). I can SSH in to grab dmesg
live during the crash since the controller death only takes out
USB, not the network.

Will follow up with the traces.

Thanks,
JP


On Thu, Apr 9, 2026 at 1:02=E2=80=AFAM Michal Pecio <michal.pecio@gmail.com=
> wrote:
>
> On Thu, 9 Apr 2026 08:45:17 +0200, Ricardo Ribalda wrote:
> > Hi JP
> >
> > On Tue, 31 Mar 2026 at 02:38, JP Hein <jp@jphein.com> wrote:
> > >
> > > Some USB webcams have firmware that crashes when it receives rapid
> > > consecutive UVC control transfers (SET_CUR). The Razer Kiyo Pro
> > > (1532:0e05) is one such device -- after several hundred rapid
> > > control changes over a few seconds, the device stops responding
> > > entirely, triggering an xHCI stop-endpoint command timeout that
> > > causes the host controller to be declared dead, disconnecting every
> > > USB device on the bus.
> >
> > A usb device shall not be able crash the whole USB host. I believe
> > that you already captured some logs and the USB guys are looking into
> > it. I'd really like to hear what they have to say after reviewing
> > them.
>
> Sorry, I forgot about this bug. I will take a closer look at logs
> later today.
>
> I see that there is a case which crashes the host controller, but
> without dynamic debug. It would be helpful if this can be reproduced
> with debug enabled.
>
> In the future, please also make sure that there are no unrelated
> devices spamming dmesg, like "slot 17 ep 2" in those "stall" logs.
> Please find this device and disconnect it or unbind its driver.
>
> The initial cause of all that may really be the device getting
> locked up for no good reason, but not 100% sure yet.
>
> Regards,
> Michal

