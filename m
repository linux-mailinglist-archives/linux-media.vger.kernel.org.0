Return-Path: <linux-media+bounces-40329-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 973F7B2D210
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 04:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4509B1BC70C4
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 02:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B2FE21FF36;
	Wed, 20 Aug 2025 02:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+R9MqJR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CE9194C86
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 02:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755658049; cv=none; b=Knta+FFxJ7w9Xc+cGU47fnx1XAqXjZ0HIcRCYLyv3jUbN610Zx9O9EFqnVum9rMUph6oK6ctnEBEjdyQr3ILf7ssIRpm//eYng9DKC0dqukv1ofAQQlRfJBbh4u2HsGv6Tw4Usb+ChgMuZ/fLoqdajVLLO9HbQh7s0m5RRKxo9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755658049; c=relaxed/simple;
	bh=P3BfL5l0QX+9ioNw4s14MG3a+Ev328O3dr8N9aXAvDQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=ccTsF0Jw6eT6ORqNJ9XcvXDFK/fNApffhuzUyQx2dte1fGujtFJPkG3eIxgPUqOyPITzxRawp7QJdiqo4n24PiiaYcfEraSM2anKbg0ZCbI3P9360IpVqqBDvIm2Fc2JuVnpubElppk7BBockOnhHwPsfOR4jGTw/onm7mCUexk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+R9MqJR; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-71d60501806so52889297b3.2
        for <linux-media@vger.kernel.org>; Tue, 19 Aug 2025 19:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755658047; x=1756262847; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P3BfL5l0QX+9ioNw4s14MG3a+Ev328O3dr8N9aXAvDQ=;
        b=X+R9MqJRa+qssxpBBmrBHrAWsWWr/aQIE9X9N0PNd+EBoSyvnHGe4qbW+wATqC9pIM
         Riw4Ha31ZIpFkXt9g6kUdrYM4PzAuI+rGWCJ+VNJYtUoaNlB2/m6gM5tRaypUkaDFzQv
         9CDU7HmnmB9nlgRUIeqUhI2/4qpUP/ywl7xbvNMVtarclW7SBrzsLQD6dZY9XBsiqs5H
         Ft5hxRpBw26m64/+mmmGDL3lQBLUHB91KYCEuRFYjrxLvRGaoR/6KNOdp5zyx01aUB4j
         aYqyJo5woDLGQPExODYib5j8cWujBWnacqLC3dev/9ylzXp18rOvuaPayFEBElZPJRWl
         HY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755658047; x=1756262847;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P3BfL5l0QX+9ioNw4s14MG3a+Ev328O3dr8N9aXAvDQ=;
        b=dyIEwPZjEFRsKl8fAwZVi4+eFvokRmC+DhxT6RsJ8nTlOZIDUYDhQuvHL840xAOO9v
         M9xlIZK7SUHQwPA5c/JmLEPT9SN+CVb/7eFh48eI4sRoJfFbVTTn1mFi1IclL7c5GhvJ
         bHGSUGXBGTRQTwiq7s7DKlbGIArFjKxp6A1HhvUumtGUq+QuHjDOuDILI8YXGiMxHAbj
         NwGuv7XDTrSbGzuPVUpJaYLcSPiu19wYCLTvq8Czj0jdIiWKL0zFCCaWuVwl49FYwqb6
         YxJ+dwW9VainWXepOuwCqYwUfXmhs+9j/fRyjU0zOxmeodNj0e2HyybBtk4mE9Z/Il6x
         +zVQ==
X-Gm-Message-State: AOJu0YxLb2h8Su6pCTc43vhguyYyGVSm0gVvCxEMb/vMivR0E5C65gmP
	cq1ePWQFKJePdVwzig2EBGDSdf9gNCBUnursxiy7MFarNbZireAhO8VcYbrxbgxaT7KwuLyVdPp
	arnGCBGCVqgBZapAUR5lkvB27DP2/+erS+A==
X-Gm-Gg: ASbGncuJ4B8yBl4C+ufoTKDskuPPJDvIvdzkXxuySd3zPG1x+Xs7T6L6aUZfOtAOtpw
	cvPRs6cXVaHeORlbNTCm+oEj4tUyELUy9C7dtPZfWT/3G2n7ZYgL+xek7+L1J1A9zZvVxV+Dro7
	vNpTzMmzfYPVOu58QZKJiYFCGujfNfPZWxfqw0DTUQNEmveDHegWZtE8Wc3SiQ4RBDqXrjtHqgr
	qYAp9KUy2MQHMpgCB5KX/pzABBNxLFXYQ==
X-Google-Smtp-Source: AGHT+IEPYvDSjgKsZjuys4IT6C0tomuZtiTB16SzRbQk+XGtf47KKY6n0Z8f2uX1xkvsV1XcxXnn2J/Na+GmrfPqDkw=
X-Received: by 2002:a05:690c:9516:b0:71f:b944:1052 with SMTP id
 00721157ae682-71fb94450damr2471097b3.53.1755658046918; Tue, 19 Aug 2025
 19:47:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818093159.612208-1-chandramohan.explore@gmail.com> <68a300aa.050a0220.30045a.4f37@mx.google.com>
In-Reply-To: <68a300aa.050a0220.30045a.4f37@mx.google.com>
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
Date: Wed, 20 Aug 2025 08:17:16 +0530
X-Gm-Features: Ac12FXyBFnh3ZlYY_PQyWR2xGXRcLeORdWMVi3RYnj2VZFPm9PR7oyVGCPX7m1U
Message-ID: <CADBJw5Yc-04r+w8Z6af4JmnwJjKhDnUDWq8sdOGOakYQYbOOjw@mail.gmail.com>
Subject: Re: media: v4l: Fix dereference before NULL check
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Team,

Regarding my below patch :
https://patchwork.linuxtv.org/project/linux-media/patch/20250818093159.612208-1-chandramohan.explore@gmail.com/

> For more details, check the full report at:
> https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/82645328/artifacts/report.htm .
>
>
>
> Best regards, and Happy Hacking!
> Media CI robot on behalf of the linux-media community.
>
> ---
> Check the latest rules for contributing your patches at:
> https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
>
> If you believe that the CI is wrong, kindly open an issue at
> https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> to this message.
>

I went through the logs but I could not find any issues related to my change.
I see that some of the artifact upload failed in the CI tests.
Could you please help me on what I need to do from my side for the
patch to proceed ?

Thanks,
Chandra Mohan Sundar

