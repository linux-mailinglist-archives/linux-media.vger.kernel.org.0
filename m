Return-Path: <linux-media+bounces-30967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE14FA9BC95
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 03:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E38D5A13FF
	for <lists+linux-media@lfdr.de>; Fri, 25 Apr 2025 01:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACC61547FF;
	Fri, 25 Apr 2025 01:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEuzw4/E"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4938F6F;
	Fri, 25 Apr 2025 01:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745546372; cv=none; b=fVdL+12fIUx+seWHSrG/abNTCItet3tPMy4OZy3zr+44ddKNiPw2si7FKeGlXR6ht+ZVElSuQ5HRd3JKk5m6I/A4ZGQzuXh3DntBZTS4FVv+zjn+l84GpqO7XqAOBUtsVS++6gxESxE/NB7U6gVb9abwq/BFSPhQY9Xm3EQsdUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745546372; c=relaxed/simple;
	bh=1aJS5kl7xtX5V22+sHMIn3FQYVOQs0lFq8Rba+JOQOk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=FxVr9LCsll0q2cpZ61CvqKAibwhHRGB5VbknQF0pfeEQKFXJoYiVaw6reeKqlmd8gelH21F8vPEwcQEyTGSb9td2Ct10ayjAZXkJjOmbntjnObgp3a+TptM4one22TmERBM+b6+zPrB3VaU/PW8GbKDT+QpeU5S86HcxyxkElV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEuzw4/E; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af28bc68846so1658052a12.1;
        Thu, 24 Apr 2025 18:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745546370; x=1746151170; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oi2E46jx11E6P8igzC1fG0bFDRSDTXcSRpMpk983nrY=;
        b=EEuzw4/EFRSxytiz0r+lwu99ixUYYLMaOqxczKSSa1MPaANo8dPKBYguxbDdUvWEK/
         kqOdtDB7QoI7+xzA7JvcVHb6l4fn8bPi9KtFN9X1J8vcsSK/ol/b8gCVGKJqWeGlfaZ4
         W/TwozkoNaoWINVzyoNc5PRYKCtGP4qCN7IGUylJLyjzPdbsRb1Fy6rjHtuIHNdCeHR4
         iP9cdEo0FdUtK5KhzXucLhvykS8LNj5n3SghKd7ItCCE78YIHDP+pkixOD1+R/ZyK+k/
         wLvaGNNnNUyKDSGQy/JGWOfzl2OO0J7BBzEXG7k9SVPU9zFJQ7EW7r70bVHCHMGT8dTG
         tH1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745546370; x=1746151170;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oi2E46jx11E6P8igzC1fG0bFDRSDTXcSRpMpk983nrY=;
        b=QTSWu6FrDjLoKJr1rtASDXDJn1U188QsFP3uW6vJhiniCgOj8kZJyY8oKRFS4svYc9
         4Am3FDtw5eTQH4jv0/LO72wejbmP/PJUcpuIVobfFjXTqGP/wXA2MEDiJdmWGdZr8ER2
         ypOkNypyQwCRPjY9VrZYYk0LfFpzMbfZIQ7JuvZQIVjxHjSYHHrXOQtyUne+4uNnxN2m
         91lGUaryxTlbEqLagvKymI0Wl26Nn48GjgeOI+3OpQS/b4EHxGJ9KcDDZBToX+o5n2vP
         w+058gJ3fgUefkC1oHa7hz1XE8pvzA/tnexpwKeNo31EZcJvRd2V9LkpB5nsSPiDx84r
         Asmw==
X-Forwarded-Encrypted: i=1; AJvYcCWhKS1QDeY3QzF/4RIP4K3cKa9bqo0V/V38xfTkX4Z6Gs81QTNUxtCu6y3T/+1OIhQnsagKcIIk1QMu5ck=@vger.kernel.org, AJvYcCWhRKuwtucv4i/dJQwnk6sM9i9Fa3TScxq4Njc1GS5ipSs43azq8MkII9g9FI+/GSzVkroneJ0GH5pNCUE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyuwj2POwEmNQe1aUQAG16A2jKcckokXh19eixJ7fOfr5O8Mk/Z
	pr8Gl6pKBQbXB5gHFcmtdeAZUCR79EGg6pZV5CAacgca/6IF2UjV2wlm/p6lZ/Q2uZPEGETjBB1
	Um0W4QJUjUJnQhd/yjZ5bjkQEAPrdpOFG
X-Gm-Gg: ASbGncudJT872v7hQlxp0NS5+aw2ES8UoUpiiVnvD/V8RY/Msnhoido2XJGYcjSfrVY
	mVVLYLklDOO4NSLQYhCgQv80zV0H+vuy/nzIiEv6Rcccy8i+ifqKPGTfZ1YL8Sl8eIawqGXqjCU
	pX1Oi/OBa5VXrDzqWYHThVIPiHoV8NXxTm
X-Google-Smtp-Source: AGHT+IE+zVM4WpEuyOpPXj2HuMzgLGXY1M8RKFwF+Rhj/9AiRqxl6HW9J6mp5sKp80FFW5u/q6NHC6lDdZMUIYvZGBg=
X-Received: by 2002:a05:6a21:108f:b0:1f5:7e57:501c with SMTP id
 adf61e73a8af0-2045b9f2751mr579130637.39.1745546369927; Thu, 24 Apr 2025
 18:59:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Adam Ford <aford173@gmail.com>
Date: Thu, 24 Apr 2025 20:59:18 -0500
X-Gm-Features: ATxdqUH2ucRW9Ou2xib10t4cq9PF3I2OJH1I9z5HZpvuCEak-7VO3uZSElmYo3w
Message-ID: <CAHCN7xKy7w0Kwf8Oyjd6dFLzAhiGiqdaYOj=qfA4kSRthD5Law@mail.gmail.com>
Subject: i.MX8M Nano ISI Channel Question
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-media <linux-media@vger.kernel.org>, imx@lists.linux.dev, 
	arm-soc <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

NXP-

I am trying use Libcamera to capture video on an i.MX8M Nano.
(Hopefully, this makes Laurent smile)

I noticed that it has a maximum capture of 1080 lines when I query it
with Libcamera, but the same camera on the Mini can capture at higher
rates.  The multimedia overview states it can handle 1 unprocessed
camera stream at 4kp30 without scaling.  The Nano's Ref manual later
states that each processing channel has one line buffer, and each line
buffer can store up to 2048 pixels.  It continues to describe when
processing higher resolution images like 4k, the line buffer from
other channels can be combined.

Section 13.4.3.5 of the Nano's Ref manual (Rev 2, dated 07/2022)
explicitly goes into detail on how to capture up to 4k image
resolution by combining channel 'n' with channel 'n+1' which implies
there are at least two channels.

Section 13.4.5.1 states the registers are dedicated for each channel
and spaced 64KB apart, but then the following table only shows the
base address for one, and Table 2-6 shows the ISI size is 64KB.

The driver is currently written to only support 1 channel.  When
reading through the driver, it appears to require one IRQ per channel,
so I looked through the Nano's IRQ table (7-1), and found there are
three:
ISI Camera Channel 0 Interrupt - 16
ISI Camera Channel 1 Interrupt - 42
ISI Camera Channel 2 Interrupt - 43

I attempted to enable a second channel by modifying the .num_channels
= 2 value in the driver, and I modified my device tree to assign a
second IRQ (42), but when I query the pipeline with libcamera, it
still doesn't show an available resolution ov 2592x1944 that is
supported by the camera and work on the Mini without the ISI system.

Can someone tell me how many channels are actually available, and
whether or not  4Kp30 video is really available on the Nano?

Thank you,

adam

