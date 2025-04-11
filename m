Return-Path: <linux-media+bounces-29998-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9F1A852D9
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 07:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AD569A480A
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 05:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 754D527CCCB;
	Fri, 11 Apr 2025 05:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQs5h59b"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3E2188006;
	Fri, 11 Apr 2025 05:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744348002; cv=none; b=FVt2A7B2s9houCqGrfK5PpJjQRRf37tTtoi7mRDyOth4zw6AGXe4sUMClLmNZlcRMN8fKZAIkzj9wbYpRU3yV1TGDxFyOBoqdjmSY/dE6NIIZk12kX6A7fsYrMAkuoY+lA3hmfJbNx8yLxLpyzXhl7OpccHmcTfJU9cXybGSDVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744348002; c=relaxed/simple;
	bh=TbDuMl/Sq2ZXQvnZuR7kS1Hdjn8lYRMBDvDmno+c6x8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNtf1qmrb4qKAKkl6JV8VmyKsOoIIorXwIc0muTlJHmDfHN2d/xuyBrjWDDZlQ/tA878itfPLeUjkI8iyZgbvNp6PdhJT/tAFF4PDBSdBm3xPPgGep4k5Q25HFFg/1LngKTxuBL4RgBPIu6tgOAwCp9ooi67VnKBviLArJ1rGdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQs5h59b; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-47664364628so16986541cf.1;
        Thu, 10 Apr 2025 22:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744347999; x=1744952799; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRb/BCzXnzLKk6r4YRRQWPkMbuh8VxUF58IC7wx4Qyo=;
        b=eQs5h59bReedvxOqO/rBHlw67zz3Kbntt6zmnc/1vF//DoX8a8xZwxxITMztajxdYT
         ejpaLDNgB8kWjDgKNuF680vCY9niW0LQDaugmPvRbrkHkAcoGdEYosFwKz6M3JJIpzYF
         Bn1inqWnDQ4Uy6QUL4OZp1tPzY0Zlli4BFT7c8RZvs1uJYN89QjN4lSKPNp40HQhH6CD
         bliEe2GijtX3vX9jJjzYveYk3a9sUNn1alJ4/fqb3otxQmhrmaPZqwa4rvK2vfLZkloy
         wrAMdX115TmdFb7YoDDFDyT7Z5iXU45Ax6bUcBZ2A87F/8XHrWRPCu3+HSVlfRsgErmR
         4mIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744347999; x=1744952799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WRb/BCzXnzLKk6r4YRRQWPkMbuh8VxUF58IC7wx4Qyo=;
        b=nhJ63BNQlJB94siZNyTzEIUygvsF73vRm5Ke5HpB3FQ8egfwrMiDJTSn4wJNmGcOv+
         LGTxPUKo8dBEKOji6VUVlpCfJI/v7SYsR1yGpMPs2R7JcUcW7kVoalphJi5m1ovBWXzE
         b2ats85DVjwUvVHxPv6gOlg/WgMwDwiYiRpHzym5i9lrLWe2bx2YYA79PeSthrXXTNcI
         dc3XGeQaZEtmNsmepB56oM1KTkfKQYk+ALsp+QH27gxqbWB0C0prT66bF0GmAzS+0jWd
         1q5NZco5eiWBpK72MDHKfhxsqsiHg8W63N2jryOYGlHSfuRL/MjRy4no4OG0w8xJKqnc
         gDSg==
X-Forwarded-Encrypted: i=1; AJvYcCVuEyEOoF6bWbkFiLTbtDa+oeJCK7RMCBN1SpQt2OhB+F9mzD/e2dDoZxgGEwRaJDEBtve192CxsVwy0vU=@vger.kernel.org, AJvYcCWHkGFGedzhlCl/uJuK71KFPk0KzsDpmgIdfQvfKfbDHSls3TYDZ5XmclDxnHJGDdoou1r2QF9oVLzAer4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzti2XnR8TFyUfEpoIiWstfYxxAP7mTzMoifmYrI1NOtOHwQ61O
	d383X1hUB3bcwM4S78irFK7MmeT9zWiETQBMQqhXkijkJF6niJFGenSpLW6RVsQAeCHU5/4BxN9
	yNvcrJfvic797ZSeYrMzpDz9qAOo=
X-Gm-Gg: ASbGncuZGIsTxbuWCHeq3pJww+4EdkcoaAOs59NcXQA1b6uJjtZyDSdz26Xiq2Sr97N
	XR5gB/AiIhl8nDA23zjfooHmXo8Y0eCtF+tDhuwlYOX70NlVaZZJVD/dXfrOCXPLqohvF6Gx0GV
	yoPShHpwc3I1fwKd/HBlKyJCw4Lxl1LJ6z+oqaREfBwLAckRXy9+qPWA==
X-Google-Smtp-Source: AGHT+IGH8blIjeDOAZg5z0GQj77DusDHZUwOzxUmaMEMsOsLsHxldpdQ9ObvlObvrzkIXG3Wp0sbtxtNfEKUkMgBckA=
X-Received: by 2002:a05:622a:180b:b0:471:9e02:365e with SMTP id
 d75a77b69052e-47976cf0474mr26662631cf.8.1744347998872; Thu, 10 Apr 2025
 22:06:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <67e26157.0c0a0220.36adcd.506e@mx.google.com> <CANiDSCsvEke31SAgXhs_sXEN7d6fXrwuhJFsi2mzESq1Jc8pxA@mail.gmail.com>
 <CAKUZ0zJjdSDH3cw=8iKJauU5dmcq9TFhAaJX4yS5UQoiCUaguA@mail.gmail.com>
 <20250326001336.GA23984@pendragon.ideasonboard.com> <CAKUZ0zKDy47cQ0ZQo-=1c7wmazbutF=VF3qX09DfZFBz01hh-g@mail.gmail.com>
 <20250402002948.GC4845@pendragon.ideasonboard.com> <CAKUZ0z+V0pBvAf1VRGcWf_QcROZFsTUcHmNM1T1=DpBw56yi8A@mail.gmail.com>
 <20250409205426.GA12162@pendragon.ideasonboard.com>
In-Reply-To: <20250409205426.GA12162@pendragon.ideasonboard.com>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Fri, 11 Apr 2025 01:05:00 -0400
X-Gm-Features: ATxdqUH8eL4Lmr0vwwzRy8Nge0IwfyWriQBevvgqTS8bu8Att64H7FTQtit9JFQ
Message-ID: <CAKUZ0zKow-wstck4nq7JFbXfxYXR94phRG_bEuWBY2H7p3EWyg@mail.gmail.com>
Subject: Re: [PATCH] media: Fix invalid link creation when source entity has 0 pads
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, hdegoede@redhat.com, mchehab@kernel.org, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+701fc9cc0cb44e2b0fe9@syzkaller.appspotmail.com, 
	skhan@linuxfoundation.org, kernelmentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > > Can you share the USB descriptors.
> >
> > The USB descriptors via the Syzkaller reproducer:
> >          "\x12\x01\x00\x00\xfb\x5d\x7d\x08\x6d\x04\xc3\x08\x16\x6b\x01\=
x02\x03"
> >          "\x01\x09\x02\x50\x00\x01\x00\x00\x00\x00\x09\x04\x1f\x00\x00\=
xff\x01"
> >          "\x00\x00\x0a\x24\x02\x00\x00\x05\x02\x01\x02\x07\x24\x07\x05\=
x00\x00"
> >          "\x18\xc2\x24\x08\x05\x04\x00\x04\x96\x0d\x24\x06\x01\x01\x03\=
x02\x00"
> >          "\x01\x00\x06\x00\x06\x09\x24\x03\x05\x05\x03\x06\x05\x81\x09\=
x24\x03"
> >          "\x06\x01\x01\x04\x05\x05\x07\x24\x04\x05\x01\x00\x9c\xbd\x89"
>
> If I haven't made any mistake in the manual decode process (is there any
> Linux tool that can decode a binary descriptors dump the same way lsusb
> decodes descriptors from a device ?), the relevant UVC descriptors there
> are
I tried looking around and couldn=E2=80=99t find anything. The closest I co=
uld
find was defining the structure and then using a parser or reverse
engineering it using wireshark. Do you think there is a need for such
a tool? I would be interested in making one.

>
> 0x0a            bLength
> 0x24            bDescriptorType USB_DT_CS_INTERFACE
> 0x02            bDescriptorSubtype VC_INPUT_TERMINAL
> 0x00            bTerminalID 0 (invalid)
> 0x00, 0x05      bTerminalType 0x0500 (invalid)
> 0x02            bAssocTerminal 2 (invalid)
> 0x01            iTerminal 1
> 0x02, 0x07
>
> 0x09            bLength
> 0x24            bDescriptorType USB_DT_CS_INTERFACE
> 0x03            bDescriptorSubtype VC_OUTPUT_TERMINAL
> 0x06            bTerminalID 6
> 0x01, 0x01      bTerminalType TT_STREAMING
> 0x04            bAssocTerminal 4 (invalid)
> 0x05            bSourceID 5
> 0x05            iTerminal 5
>
> 0x07            bLength
> 0x24            bDescriptorType USB_DT_CS_INTERFACE
> 0x04            bDescriptorSubtype VC_SELECTOR_UNIT
> 0x05            bUnitID 5
> 0x01            bNrInPins 1
> 0x00            baSourceID(1) 0
> 0x9c            iSelector 156
This looks correct. I compared it with the Universal Serial Bus Device
Class Definition for Video Devices: Video Device Examples (revision
1.5 2012). I only got slightly different results (only formatting
related - w prefix instead of b for 2 bytes).

>
> Ignoring a few invalid values (bTerminalID shouldb't be 0, bTerminalType
> 0x0500 is defined by the specification, and the two bAssocTerminal ids
> are also invalid), this creates the following chain:
>
> VC_INPUT_TERMINAL (0) -> VC_SELECTOR_UNIT (5) -> VC_OUTPUT_TERMINAL (6)
>
> Looking at uvc_mc_init_entity() where the media_entity->num_pads field
> gets assigned by calling media_entity_pads_init(), a media entity is
> only initialized when the entity type is not TT_STREAMING (so it's a
> subdev), or when the entity has an associated video device. I think
> that what is happening here is that the second entity in the above list
> (VC_OUTPUT_TERMINAL, id 6) fails to initialize properly in
> uvc_register_terms() is there is no corresponding streaming interface in
> the device. This is confirmed by the
>
> usb 1-1: No streaming interface found for terminal 6.
>
> message in the syzbot kernel log. No video device is created for the
> terminal, and no media_entity is initialized. Trying to later link the
> entity in uvc_mc_create_links() then fails.
>
> I don't want to address this in uvc_mc_create_links() as the invalid
> terminal in the chain means we could have other issues elsewhere. One
> option is to fail turn the missing streaming interface check in a hard
> failure, at least for the chain being registered. The driver could still
> proceed to registering other chains.
>
> There's a small risk of regression for buggy devices. If that's a
> problem, we could instead remove invalid terminals from the device
> entities list before we proceed to scanning chains.
Which solution do you recommend? I can try implementing the one for
the hard failure while letting it proceed to register other chains. It
seems like testing for a regression would require feedback from the
community which might be hard since it would most likely only affect a
few devices.





>
> > > > I confirmed this by changing the terminal ID in the format descript=
or
> > > > from 6 to 5, which eliminates both warnings. This shows the warning=
 is
> > > > correctly identifying an invalid descriptor configuration, not a
> > > > kernel bug.
> > >
> > > There's still something not quite right. uvc_entity->num_pads should
> > > always be equal to the corresponding media_entity->num_pads. That's n=
ot
> > > the case here, and I think it indicates a bug.
> >
> > Ah ok - the mismatch itself shouldn't happen regardless of the descript=
or
> >
> > > > Since the USB descriptor is invalid, I believe the warning is
> > > > necessary and should remain. The code should stay as is.
> > >
> > > There should be a warning, but I think it needs to be caught in a
> > > different place, earlier.
> >
> > Got it.
> >
> > > > On Tue, Mar 25, 2025 at 8:13=E2=80=AFPM Laurent Pinchart wrote:
> > > > > On Tue, Mar 25, 2025 at 06:05:00PM -0400, Gabriel wrote:
> > > > > > Hi Ricardo,
> > > > > >
> > > > > > > I cannot reach that URL
> > > > > > I was unable to access the URL from my email client when I init=
ially
> > > > > > sent the email, but a couple of hours later, I was able to. Ini=
tially,
> > > > > > copying and pasting the URL into the browser provided a workaro=
und.
> > > > > >
> > > > > > > Shouldn't it be?:
> > > > > > > Fixes: 4ffc2d89f38a ("[media] uvcvideo: Register subdevices f=
or each entity")
> > > > > > You're right, I incorrectly referenced the wrong commit. Howeve=
r, I=E2=80=99m
> > > > > > not certain if it should reference a96aa5342d57 (Fixes: a96aa53=
42d57 -
> > > > > > '[media] uvcvideo: Ignore entities for terminals with no suppor=
ted
> > > > > > format') as it's the latest commit affecting the line I'm chang=
ing or
> > > > > > the one you mentioned.
> > > > > >
> > > > > > > Shouldn't source->num_pads be the same as remote->num_pads?
> > > > > > The fuzzer (Syzkaller) that triggered the warning appears to ha=
ve
> > > > > > encountered a case where source->num_pads and remote->num_pads =
were
> > > > > > different. When analyzing the case in GDB, remote->num_pads was=
 1,
> > > > > > while source->num_pads was 0.
> > > > >
> > > > > This seems like the real bug that should be fixed.
> > > > >
> > > > > > > Are you sure that your kernel does not contain?
> > > > > > > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/=
linux.git/commit/drivers/media/usb/uvc/uvc_entity.c?id=3D41ddb251c68ac75c10=
1d3a50a68c4629c9055e4c
> > > > > > Yes, it should be included since I am running the upstream kern=
el.
>
> --
> Regards,
>
> Laurent Pinchart

