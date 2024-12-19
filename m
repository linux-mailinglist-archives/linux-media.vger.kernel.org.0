Return-Path: <linux-media+bounces-23784-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 074EB9F7BAD
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 13:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE3791894AD6
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 12:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD664224B1A;
	Thu, 19 Dec 2024 12:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xml4wwKF"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B1022371B
	for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 12:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734612145; cv=none; b=ClECKEh3jooWV98pP/MaOGU1VOlE1VLp8IPQxAkZjbFM6nmst7G9j3GZ6icUNf2OrLzJEavPIAmMgxJgUXg1/s5nTop3y/PxDyTLc6AQJiayOWrkikJnOACwTbWARtnPL1P7yM8he/ZKhRDUZwJiYaxlWe2HP8QKEo3v+Kj5Sq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734612145; c=relaxed/simple;
	bh=X8UXNqv5ecPdSw+vYKNV5ThJqewH+b1pj2AskuWolZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ku4IC9WN0+clZAByqrGGDbY7v7NpQ3Oc9Lvu4efiGiIyDRHnC3A1Zi2XnY0lYv9Nkq2ruEDMQjgd5hCnG12sHdBh73DWMWBSdpshjH29JgR1Nl/406JFFtYNbEbWVlh+f/MfLBMkJYEiZXUZqzuEp6sJBvZ8aiTwxjF46H1qTyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xml4wwKF; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-218c80a97caso6184265ad.0
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 04:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734612143; x=1735216943; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TnCAe9p4yEP5QmywCOysVpvHxzqj8A8f5GBf4MjEUXo=;
        b=Xml4wwKFLGXJKD3hcQl0DdpmpyaoEwyRa/y/0+rK1Rw2tGH/WG5sFzbri+yKjZw6Kd
         kv6ltOjbD7twwviwM0ueChHVUQZkkCyJVljBrA/19HpdmeviQ4hfGRl3ShU/pNNDQNkK
         HUJ92T5CxV3wI01CJj7FEQ6qspVhcYmS9uPvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734612143; x=1735216943;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TnCAe9p4yEP5QmywCOysVpvHxzqj8A8f5GBf4MjEUXo=;
        b=P5DbB6tswSltfX3Ybmil9nYvfaU3AidCepp+jrP/dnD1+AljQtOix30JidP4aziGyz
         Zrhp6n4azbse8UL0gdqS3n/neJgzN9px8hyAht12G0/5tsb48yzqRkCtUEyD5VB9Pp+n
         3iz8B7laizpMzh/VwbkeVYb2/pf0b+efe+75S09qTtqFKy5A9hLAA6zYaQaV0P1rRAxr
         /D5jgK970XOSPo0qGH/LY7VyxIf3VObE2qUg20Y9a3M+llXUe5BiF6TPWktbO9e/YSbK
         CmfOyncXMtlzdG1/qWPebYUWsTFvXZqfIwn+37iulzKYxqyQjoXLP/B2TaUU7ucvj188
         gZtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr0v4cEGPElkemTAtdyfBRSverCXKKDqIz2M7wDDrYxD8PIff7Hs7VjAv6f9GApnhXrC+obBlvBFjVkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDmtSWiFbdJrXcIBsermOBUIi7CdwLjwhTEoy5xNcWBBFOtkNJ
	ZUg04/tMfISL7HbCcSUts0bw8Dpu+avvmtxAc9fkYA2T4q1vBrSWSPW2I/Vh5Q6+czKhFupDkGo
	=
X-Gm-Gg: ASbGncsReFbGx6g6GmUBkzwWHmEK0hu3GycoqA6ckGr/PIKZi0ISkqieeSl6GJDTAr+
	Cf27ncp1Qp1v9Cw+xs5OkXa9+aYOts1OaLuX5U2s+HRIlNRRO+lVjucBrx+/87jvDWDW/l1kOsb
	5F6pH2tIOsAxhwnSWM3IeKk0BT3SZk5Afsilc3q7tMDBV9Q0OSCOunPxBm7WnGvIp9MK6u6NSfY
	k6NaUYA9gKfp/aDSjy3Gfe0JTZg+ghd7/L//rhkpZT62wDMCwRtu8hdYj5svJ436vvRXydtIqvJ
	XeGlHYI7dFUuPGGpuxs=
X-Google-Smtp-Source: AGHT+IGt/Wn0ouLJazgmH5JMTQT4XH5SRBymrqKtqNNBvwD+3uluHX+HIp6Pxy3Opq9GkHFuz9ps/Q==
X-Received: by 2002:a17:903:2346:b0:216:1e9f:c5db with SMTP id d9443c01a7336-218d71fc5a8mr108460065ad.28.1734612142852;
        Thu, 19 Dec 2024 04:42:22 -0800 (PST)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com. [209.85.216.45])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f502asm11341205ad.183.2024.12.19.04.42.21
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 04:42:21 -0800 (PST)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ef87d24c2dso564140a91.1
        for <linux-media@vger.kernel.org>; Thu, 19 Dec 2024 04:42:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU1Snkc/6SEOoqNmvkB0ATLgeq5rtCowaNfu+LmLQ054KLl6DGA2mZRgcxPUFw01St/I8b4QOaQ0xnVIQ==@vger.kernel.org
X-Received: by 2002:a17:90b:51c7:b0:2ee:f80c:688d with SMTP id
 98e67ed59e1d1-2f2e9378675mr9284447a91.25.1734612140544; Thu, 19 Dec 2024
 04:42:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-usb-orientation-v1-1-0b69adf05f37@chromium.org>
 <20241217145612.GA1652259-robh@kernel.org> <CANiDSCu_mFQQVkDb_gSyXeb1_Tu+DxSeHYvGsGp6XVDuOdPyjQ@mail.gmail.com>
 <20241219122453.GA4008177-robh@kernel.org>
In-Reply-To: <20241219122453.GA4008177-robh@kernel.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 19 Dec 2024 13:42:07 +0100
X-Gmail-Original-Message-ID: <CANiDSCt+LAE-LzCDZgrWP_V-Jc-ywTF1-PuQtyDJMfV9v_ZzGA@mail.gmail.com>
X-Gm-Features: AbW1kvb_GsNPrAWElm71yNhuDp3lbxsP7Rss3OTpjLvIYa7x_Sh-ce4PUixVmvc
Message-ID: <CANiDSCt+LAE-LzCDZgrWP_V-Jc-ywTF1-PuQtyDJMfV9v_ZzGA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: usb-device: Add panel-location
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Dec 2024 at 13:24, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Dec 17, 2024 at 04:24:27PM +0100, Ricardo Ribalda wrote:
> > Hi Rob
> >
> > On Tue, 17 Dec 2024 at 16:02, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Thu, Dec 12, 2024 at 09:44:37PM +0000, Ricardo Ribalda wrote:
> > > > For some devices like cameras the system needs to know where they are
> > > > mounted.
> > >
> > > Why do you need this and why only this property and not the dozens
> > > others ACPI has?
> >
> > Userspace needs that information to correctly show it in the UI. Eg;
> >
> > - User facing camera needs to be mirrored during preview.
> > - The user facing camera is selected by default during videoconferences
> > - The world facing camera is selected by default when taking a photo
> > - User facing camera have different parameter defaults than world facing.
>
> We already have "orientation" defined for this purpose.

Do you mean orientation from
bindings/media/video-interface-devices.yaml ?

I see a couple of issues:
- Orientation has a very specific meaning for USB typeC. I'd prefer if
we could avoid using that word.
- For other applications different than cameras it might be useful to
know the positions top, bottom, left, right, which are not available
in video-interface-devices
- The value "external" does not makes too much sense for listed usb devices
- It makes our lives easier if dt and acpi have the same meaning (less
conversion)

All that said, for my specific usecase, reusing orientation from
bindings/media/video-interface-devices.yaml works... So if that is
what you all prefer I can send a v2 with that.
Let me know what you think

>
> >
> > Right now, the only camera driver that expose the ACPI location
> > information is the IPU from intel
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/pci/intel/ipu-bridge.c#n258
> >
> > And they are only using the panel.
> >
> > If we need more information we can consider adding more parameters in
> > the future.



-- 
Ricardo Ribalda

