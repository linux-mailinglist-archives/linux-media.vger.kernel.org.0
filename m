Return-Path: <linux-media+bounces-26522-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9D1A3E42A
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 19:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24E7F189C946
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 18:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FAE5263892;
	Thu, 20 Feb 2025 18:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CXz1zTLb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4460E262D3C
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 18:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740077278; cv=none; b=rwFMzlQPBpmtNFkC7Zf16tk+tuay9vqZlLr1jOXEQau+J0u7Dqi0Hozp/dGSKsm8FruAQ/ANDYDF+ToPjOk/c0ifiJx3BOpov0OjnpRLW3Ij6b1Hy8ztCMxodYJnWemjd88HvkKf2dNCtyuEd0O0MO4bBPDPzAPF/U89vSl+p0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740077278; c=relaxed/simple;
	bh=6B5HvqWIp+PUkGx3Rc6L3YdpnmE0g1i0YpNHkUSBHMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZvgUNT08O+yrHPPbk0p969kKgFlFTclFqznHKAtz9zerQUYbJ9AHyp2hmYXwe7VKoL4pOeMWMM7CqaFVE1xS3xnc/qYyFcxeavoHIAsXdH2TKhQflUYRS3ISiFLD4eLe5Cis5NuIPPUNkqu4wkpxTanDAY6c0JbFk4pjvuAVk78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CXz1zTLb; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-220d398bea9so19236165ad.3
        for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 10:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740077276; x=1740682076; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6B5HvqWIp+PUkGx3Rc6L3YdpnmE0g1i0YpNHkUSBHMs=;
        b=CXz1zTLbRcppdwp4fAj6s6gGM/oNyZHrESBIynTytLV2kT9H9Da0oL0XxbmLL4LzSh
         8WKWwKU1wN1NblBe09/m08VTTjU2rs41w0r0oxgTtgnLdBzHxPhD4TricP9ZKLM/AZzk
         mU2bYtWjnB/B4z3UCmhAw0g7Y08yoTT/2DutTon9GZKNkmgIDylePhu9dZ7f6+W4lgnn
         u88yOA1S4x8Dqz5JZXknekUBnRxYtiqoGS1HGAge4eC7hbBXEwOhCZhonFq2VCx1zLn8
         Jk1Oz3WlsdzeYO/xjxFPtjAhnZLdq0VfizhAxbW+FEXlzL2CmS9gALd8XI9iiMq8jQdC
         QPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740077276; x=1740682076;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6B5HvqWIp+PUkGx3Rc6L3YdpnmE0g1i0YpNHkUSBHMs=;
        b=IA+i0gpbHEB7ZsiAn3JBYrYdak1IeU6H1XkXWxggMpsOyO1wadAD2QQe7gP9E0+z61
         UKiDgtrEHGn/XXATkOQ9Rs1TKYFqzRVp+fzK1fzZZIjPwlIrTLzVYv6UXNQPm3Uc3yzI
         1bx0AMMXh7dAU7m6es5Xkf8Z9D4g/tOL8EQE406UBfIxL19FhNJnmuZEIaF01TZrxRy/
         V00Mb6v2vodOppJKSxCFLjhc6K528cRIgnHTEv19uuVXjLjTmkMHMAC+bvOTb7svwqLo
         rEJPNa9rebcPAjA2UtiCjqoLZHU+cYIFd4/Kt/QBjSHzNanT2F0ph0R4LmUwwnlrb1Bc
         6OLg==
X-Gm-Message-State: AOJu0YxO5pf5nxWDUJDoe7jdU5mFVmMzjrv4Zq10+Kg3b0u/LA+wjbEt
	9S5adnuFu9ioBWx2/4pj0V8lc/cCxdr5+us18JvpVtXXtXqVPMnLbF3khZkTleYaJwvM6PrC/Vg
	vcomo9Jqw4cZa8dHXPZGkeGJ1Cd4=
X-Gm-Gg: ASbGncuL8Pn/3YuVc/my2JPzsGFSRdtVkxtkJpd5Wu2WojhRKFKJOKcIRudonv/8+rA
	10HDOx5nsYCey3Q80iBuowi3RaGOtebXIMMohhQcn3cnEoEX9+YB7O+pev35cT/zwVh0YtfUfoA
	==
X-Google-Smtp-Source: AGHT+IGchfVWtyiNhx0/X9fyPnlC5mrXcuyOHeoeG28tks3Q4TJAPVOkxItzThsioa5XblBeDIYVFzAJWhE38t8Xt/Q=
X-Received: by 2002:a17:902:db07:b0:221:1c2:2012 with SMTP id
 d9443c01a7336-2219ffbc8f3mr2868125ad.49.1740077276597; Thu, 20 Feb 2025
 10:47:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219094637.607615-1-eagle.alexander923@gmail.com>
 <20250219094637.607615-2-eagle.alexander923@gmail.com> <CAPY8ntC4MbKBb6j9Xj4+=U1G3bOAZuxS9kMdHtTBWwX3AOHuuw@mail.gmail.com>
In-Reply-To: <CAPY8ntC4MbKBb6j9Xj4+=U1G3bOAZuxS9kMdHtTBWwX3AOHuuw@mail.gmail.com>
From: Alexander Shiyan <eagle.alexander923@gmail.com>
Date: Thu, 20 Feb 2025 21:47:43 +0300
X-Gm-Features: AWEUYZlO4McEOKy58C6pydXi5lus8P9-8BwiIgaekPOattcV9j3oGfkpu4mTOC8
Message-ID: <CAP1tNvQ77CuBAWrkySQvYhXngHoDfbkYaz=zE+74V6__aKUunA@mail.gmail.com>
Subject: Re: [PATCH 2/4] media: i2c: imx415: Add missing ADBIT1 register for
 setup output format
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-media@vger.kernel.org, 
	Michael Riesch <michael.riesch@wolfvision.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Dave.

> > The imx415 sensor has one more register for setting the output
> > format (10/12 bit), which is currently not in the driver.
>
> The datasheet states it is the "internal A/D conversion bits" setting,
> not output format.
> Output format is set via MDBIT (reg 0x3032).
>
> The sensor may well happily truncate 12bit A/D readout to RAW10
> output, or left shift 10bit A/D values to RAW12 output.
>
> I'll defer to Wolfvision on this one as I would expect them as the
> original authors to have been given a register list by Sony for the
> readout modes that they were interested in. Sony may therefore have
> recommended this apparent mismatch in A/D depth vs output format.

As far as I can see from the datasheet, the "Operating mode" table (page 48)
clearly states that the AS-conversion and output bit width values are equal.

Thanks!

