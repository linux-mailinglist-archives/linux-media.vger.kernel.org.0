Return-Path: <linux-media+bounces-12895-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C37902C2D
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 01:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B4D81F231F5
	for <lists+linux-media@lfdr.de>; Mon, 10 Jun 2024 23:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066061514F6;
	Mon, 10 Jun 2024 23:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AE0tYdJ2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4501514C6
	for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 23:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718060722; cv=none; b=Ozp3HzrZmDXrriXIFksyDOyhieCX0jO1KUijpr5HQPyWIyyzEUuAYkCG4xSWbIv3kEz2YYC7lNZMCei5WLSC3NXBHuqAAvGUAopE3eApGxjHgNLP0+7bqYSoUtYBbOY73eKoihjiI1X6h64YN7w5uxlHnua6mx59zMycCR72uDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718060722; c=relaxed/simple;
	bh=0iAQrERYxy8ofmSmW1ynsHwEiXbQ2uB33xUNEsgQzSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5t5qiBrrGMxd5MiFRcP8erSlH8Q8sUmmgdGzZxLRUByg4CgSPY5Sa/hso+OerQyX8ORD6gcu27yj3C5j6cAB5EoPdXz2w3Kl5RB1OSs2sIbYMovQ4DK3t4PtGwDN0Y2j4W5d9+gKUPC3n6ISPb9iNAQDDhcELB5n3jI2vkpAxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AE0tYdJ2; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5295eb47b48so5851218e87.1
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 16:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718060719; x=1718665519; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/1Y/1ng7J+NJ/Pxck+jwlwukOV+5HqrD1XO5KGcJr80=;
        b=AE0tYdJ2BZkVFw6kuSTDLRFwWCFrf+OEpqptDrYDmSsVdqCm031I+jIlgWlZJBaz3S
         efwV/dLjigrLYxOF/zIu/snGHE0lIfJ7hsptCWRnhzNRfv+HUwzExnRZH7wlWj8aUkqs
         nEYTHh0R0p25lfrQe6lQ4lGJqfs2+8gutPBxw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718060719; x=1718665519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1Y/1ng7J+NJ/Pxck+jwlwukOV+5HqrD1XO5KGcJr80=;
        b=O88CD5PKO5iODEzOfR8boCJmhafb63qm/clr7+grrntANOzFcmWYJ/HqvhsszEtQPJ
         KuMWHvpvz+j/qOd7CUh2zkOF9blYdAi9Z6FF5wtjFJ1pIR5TGOJksQ6ELs3Smw4hGJLh
         EnKyA4DHnmVn2D2OQJeZGRd34MZZ9B9rQGKVsKT7/uGZmcZf3E8HfSXuumdoWeL+E9pt
         3msYyeVzl4vW58RLjJJWZTZv8k3zKHZPWqnTtk+8u4+eMJUupkfeZDa8DzQTRJwp4VG4
         QN3cixLWd0QlNi7F57dgVBEHQpCdcZukx0HQiuOcHvDDhIELBQ2hcKWJiTHOrB6eqAJ4
         2oZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+yyg4SbXUKW+NmqUvuZydPh3IkGwfl/XOqvWZYY9tqf1LMTTBgsMAhVwliJcYWsc9Kur3nUf7hAfWqMuH8ia7raBAhp382lNeybY=
X-Gm-Message-State: AOJu0Ywb+dz4gNsl2IKNC6dMn9UMIbJTKPQErYn/LcnjbDrEBFYK7F7v
	kciGNFjUUnEuKsVXYpLvqY6NcT7vFSNEXci0icM6AUsHEiH0MZLVwHVg/hStGtYSQFTgCMg3jjV
	amArI
X-Google-Smtp-Source: AGHT+IHpPzw1k15tBpBjFZVf6dS/RqFctJOkWIlJwyuZycIe9KeGIXg9jOeY1KnaZ0bhtQt2y9C2TQ==
X-Received: by 2002:a05:6512:3d0b:b0:52c:836a:3db8 with SMTP id 2adb3069b0e04-52c836a3e68mr4927637e87.15.1718060719011;
        Mon, 10 Jun 2024 16:05:19 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c89a3e905sm843713e87.209.2024.06.10.16.05.17
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 16:05:18 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52bd48cf36bso3715157e87.3
        for <linux-media@vger.kernel.org>; Mon, 10 Jun 2024 16:05:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNIJhV2afBNhZQIS82wV2fni08catMNJF/po9sWyzwWu/e2pUx5IOu/1gHrnWbQefD/ky5oMjJf9+CXd23hlRmOZ5bJNrXYZbedQ4=
X-Received: by 2002:a05:6512:324f:b0:52b:fc90:acdc with SMTP id
 2adb3069b0e04-52bfc90ae01mr4654385e87.32.1718060717297; Mon, 10 Jun 2024
 16:05:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318-billion-v1-0-2f7bc0ee2030@chromium.org>
 <20240318-billion-v1-2-2f7bc0ee2030@chromium.org> <20240610152046.GJ26663@pendragon.ideasonboard.com>
In-Reply-To: <20240610152046.GJ26663@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 11 Jun 2024 01:05:01 +0200
X-Gmail-Original-Message-ID: <CANiDSCsO1Cvn-S9gKLJ1ecNdejqy7-VmiJVRCfS82-fFy_BBeg@mail.gmail.com>
Message-ID: <CANiDSCsO1Cvn-S9gKLJ1ecNdejqy7-VmiJVRCfS82-fFy_BBeg@mail.gmail.com>
Subject: Re: [PATCH 2/5] media: uvcvideo: Refactor Power Line Frequency limit selection
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Mon, 10 Jun 2024 at 17:21, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> > +static int __uvc_ctrl_add_mapping(struct uvc_video_chain *chain,
> > +     struct uvc_control *ctrl, const struct uvc_control_mapping *mapping);
>
> I wonder if we could avoid the forward declaration by turning the
> .add_mapping() operation into a .filter_mapping() (name to be
> bikshedded) that would return a replacement mapping instead of adding
> it. The caller (the __uvc_ctrl_add_custom_mapping() function) would then
> call __uvc_ctrl_add_mapping() unconditionally. You could actually call
> the new operation directly in __uvc_ctrl_add_custom_mapping() without
> having to add a new __uvc_ctrl_add_custom_mapping() function. What do
> you think, would that be simpler and more redable ?

Let me add it as a forward patch, let me know what you think.

Regards!

