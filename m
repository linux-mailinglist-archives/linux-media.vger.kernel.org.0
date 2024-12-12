Return-Path: <linux-media+bounces-23318-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5399EE691
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 13:23:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3697C28347A
	for <lists+linux-media@lfdr.de>; Thu, 12 Dec 2024 12:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E815212D9A;
	Thu, 12 Dec 2024 12:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Q2VU5gqM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88064212D89
	for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 12:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734006202; cv=none; b=DEg78VyQ5nwV5IYpm7tooIVd9STh4+0gL3I6ro5Ci+t6sANSBuZftew0zPF0dQd7onMoJ4ZUF/l+b0TG15I529GFuv9mPQPkUJsbDaPzUFeUUihxr+iCFD69Q/mgd8TdW8CiOU8/RJGD45KxVfLDZ8uIcnWGLCjDseI4xEn+q3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734006202; c=relaxed/simple;
	bh=Ep1rDPRoWEPCqVDeFsvK620/n0dOwm7iNmDbyig0qjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S67B0ZcGkEXSFlqzW/2T4gtKIvFL12mVfIjggR9ZSrcEb/J7XXs4k5uV172mdvHGcSW/jf6YU4pD0zrZY78yNk5zkKz0TmciatuhAH0ZsAJ0YtfZstFhIFR/KqibTU/oLgm/ksA1VK9WLqgWKywzLSrzl8FPax8r/mjh3KINU5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Q2VU5gqM; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6f150ddc86dso4317617b3.1
        for <linux-media@vger.kernel.org>; Thu, 12 Dec 2024 04:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1734006197; x=1734610997; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BEcrt8r2ozQghVF7pJOmomLYDr4SVoGvXHeY6G1CGuE=;
        b=Q2VU5gqMngBRBtOsAQ07ijEWOJqNrtnyzpwpPDr06sO1qIKiLl5wLXYUdkwWJhUUrO
         P+I6ah8e5GV5beT5w0On54T0a0UReE/SUjIgRqxlviBPpK8416TdUca4d5FaLodVvKfS
         l+v+g5y6AWpoZY3vshBE4brIRkmO7X1+XrPkzrCHUTRD1kJjIMRQ9RfA+cHDMh1Za5t4
         SV3gFvS800vkXZP0IHZrJFXDyRMRtUY4fXriXxM/cGqOaxUMZCkSfUpytocoPQrZukpQ
         XMSDr4xjAtxwm0WCs9VWoMaqq36FUaLc8OFuWLDHbbaiCI6lJeuWDFCdh/zS3ozI+/yp
         Ao6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734006197; x=1734610997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BEcrt8r2ozQghVF7pJOmomLYDr4SVoGvXHeY6G1CGuE=;
        b=Wze8sgOdJcYGQTC/m/FKsRABOu1y+ZWRvEe+ubeJbUaV4ry7iIAamI06iHx5yWezI9
         YSibK+XCuxMmGg3tFQU6i3oB8GBqsTXikeC+6SqNMZGiVM7lStSz4P4QWC/rj+kH+1oD
         aLXifuR2kTw6oy1IiTGp/fSdCRDtYHstBqmFuYngAhcBUqGWw68WeAwoLlW+myC8si2S
         nLEkg5euQjFEEOnLmJH2QQNMkW+1IJZc9TBadgkWBZB2fGeuZ5YlO9PkHG+3sEpuzc1T
         6oFuDhonSw7PgyWtcor461Q1qq4kLKUZuLvJD8IYyb74pmEiO6ctSauSCJrUeGyV+Ryo
         QpVQ==
X-Gm-Message-State: AOJu0YzjYS/kCDIVPcuu4MRF7lfkrW83gT3sLN8L3KD0LyficMDAzpCY
	kt9xPvzXYKTSceMC0vnDChLS+TLkzSWsoHsok69l0VtT6MxIsEZiRklyd/uU3fHntNWS7YZZhui
	EH3zyeJTapXcmCly1JvIOEhrXrcLoX2nJ5ZtblQ==
X-Gm-Gg: ASbGncuSKiwIYxhex+1D/IOP4gujsQFRgTgOKmAIi0W7aZlICQkoO2Y52JfxQ85FEaZ
	BC3ZQWUMIzliaudHYrO3vNq5L3sCa1UCNZJjs0w==
X-Google-Smtp-Source: AGHT+IE5M2JKYs/9dQSaL2DYEpxXMhbqw9m/wucqSmySwr2cmEVLEauSeeYHHAehQUgeoym3BkyI97zdQnzpxcdJwlU=
X-Received: by 2002:a05:690c:60ca:b0:6ef:57f9:ec4 with SMTP id
 00721157ae682-6f275268e73mr1441317b3.5.1734006197572; Thu, 12 Dec 2024
 04:23:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiDSCuYj_xV_b1VEVfS5ZgsXKnUSXc0W-4Rd+gip+9zkCzTXA@mail.gmail.com>
In-Reply-To: <CANiDSCuYj_xV_b1VEVfS5ZgsXKnUSXc0W-4Rd+gip+9zkCzTXA@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 12:22:59 +0000
Message-ID: <CAPY8ntAZTfwf7md+5eevAortfSKw+6DvJipC_UpuYgwm9AnVjg@mail.gmail.com>
Subject: Re: RFC: User/World Facing camera control
To: Ricardo Ribalda <ribalda@google.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi Ricardo

On Thu, 12 Dec 2024 at 12:14, Ricardo Ribalda <ribalda@google.com> wrote:
>
> Hi
>
> For a system with multiple cameras (think of a phone or a tablet),
> userspace needs to know if the camera is facing the user or the world.
>
> AFAIK, we have no way to tell userspace about this it has to rely to
> tricks/hardcoding. Eg for UVC cameras they match the vid/pid or the
> camera name.
>
> Assuming we define a new field in the acpi table/device tree to
> describe this.... Would it be an option to add a new V4L2 standard
> control for this?

Doesn't V4L2_CID_CAMERA_ORIENTATION already meet the control requirement?
"This read-only control describes the camera orientation by reporting
its mounting position on the device where the camera is installed."
[1]

  Dave

[1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-camera.html

> Any thoughts?
>
> Thanks!
>
> --
> Ricardo Ribalda
> Software Engineer
> ribalda@google.com
>

