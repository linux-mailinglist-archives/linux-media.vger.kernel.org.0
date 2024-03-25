Return-Path: <linux-media+bounces-7730-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA0788A186
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 14:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADDB91C37910
	for <lists+linux-media@lfdr.de>; Mon, 25 Mar 2024 13:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2771A13BAC4;
	Mon, 25 Mar 2024 10:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bAuH2K6s"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FD613B295
	for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 07:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711353198; cv=none; b=M6Q15fJd7nT6LN1I2fZ8fV7x9SeFyFkyiUfb/8zqJqCaGbbh/Jx65CP7nNsaDZxLTJg2Bc10jysrsIzoFWTvx09UdrB4/0hcVDWMqdm9ktj1DxKqrgvL4HbrUY/ys/qzBxkHPC+HsN0RrTdhsE4Uig0cTxkJvjAj6RlbTLysgzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711353198; c=relaxed/simple;
	bh=2KgIcp2UQ8SEteLfGQF+L2YAktZ4DsY+zNGZuttyUiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BSy7pzoVJW8AR+3G7iTWeYgOImT71bDmhhEzfbxUHGDrfNs9N1UAAMTNGb4ZgI3zeuNp43584b7YlUEseWI//vwmB5tOT5bLBULamVyhOYy62efUUIwrzph/GLdssxgSfue6nbkV3p1wXmZ/ZFqcOzUBoKxn31MTaZIjpcB26Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bAuH2K6s; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4d453ae6af5so1579302e0c.2
        for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 00:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711353195; x=1711957995; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2KgIcp2UQ8SEteLfGQF+L2YAktZ4DsY+zNGZuttyUiQ=;
        b=bAuH2K6s9N50+nNomhrtxYRJSDMiaK6doOW66uelky01iQLg8+zHelcW0KcAXECvfc
         Je/0uW54O8fVOx1jj+r+8fe4A3zhu74Upd2LJ/bHwN9h6sgPkcr8UKSryTr3iMQYq60N
         nIYst+8b8aktxLVXsU8dG9l2IWYPuw64zyEdc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711353195; x=1711957995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2KgIcp2UQ8SEteLfGQF+L2YAktZ4DsY+zNGZuttyUiQ=;
        b=ZF7KMoMiXdQgQhu5in+Itb0jH3QQDMeYIx9g6z8Ft+S3Bxc6KQM/XTtgXY0213Du05
         BvdRpCUYER6IgzvdQh0oHENSlhu++JQdMFpLoyscBEBlto9TVT625exrmgNgfmTsqyTo
         vt3oRn2QN3fyuVdMl0phlvvxsGO0RwuGekV+RFOSyrs+ilFF5uRoYJv+IyvTxLITMVzO
         RjzF367tSQ7/Aj/8+3gRBbm5lyDu5CPvQDrH/rbdJZn9vbFz0p4jvD/pLjIRAsClYr4P
         2TQDztHVQ5Ocr/tpWW3UUT4cZeJF3LGXool9/6xhqPM84LgIX1ztO25N/XWI+kp40uJ+
         15rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrD2VtuTU2vU0mUSxPTO4uMPjDACO7dQIVgFwOd6grScm68tEe19ZCJbzsXocL+xoa/wxqOF+ZyDNdUJFpag75Redxd54pHuhIu/w=
X-Gm-Message-State: AOJu0YzYall4gnfDN+oP+5cLjy5uw4U+QL5U7zpWI8PsWHLcFKuVOnKO
	RSbu6hvbhJwkX5tva9tbMD/21tVT00WPgHG1ItFGUFC3Yh8kYsi6syaexhiSqy+ViUvnWpu6okA
	=
X-Google-Smtp-Source: AGHT+IFx8GlKKXoxf/wVnF1btD2AhPdJjI5GqnY/gJqLA2j1Ku2FLADxc4yEGSytl3Mzq3e1Y4oFmQ==
X-Received: by 2002:a05:6122:90f:b0:4d3:373b:4db1 with SMTP id j15-20020a056122090f00b004d3373b4db1mr3815886vka.6.1711353195319;
        Mon, 25 Mar 2024 00:53:15 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 16-20020a056122081000b004d33d93758asm958499vkj.23.2024.03.25.00.53.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 00:53:14 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-4d44beade3cso1417128e0c.1
        for <linux-media@vger.kernel.org>; Mon, 25 Mar 2024 00:53:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+Q9kF25AKXOxdOA4Ew03huwjbuhAVQ/GGkJavjgJieWyEJ3QCebA2KB9gPN9VeYhzhb03NZSso7E54gPFaTQ834IfXXI95p14zeA=
X-Received: by 2002:a05:6122:468d:b0:4c0:1918:27de with SMTP id
 di13-20020a056122468d00b004c0191827demr3569976vkb.16.1711353194258; Mon, 25
 Mar 2024 00:53:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240323-resend-hwtimestamp-v10-0-b08e590d97c7@chromium.org>
 <20240323-resend-hwtimestamp-v10-3-b08e590d97c7@chromium.org> <2722561.mvXUDI8C0e@natalenko.name>
In-Reply-To: <2722561.mvXUDI8C0e@natalenko.name>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 25 Mar 2024 08:52:57 +0100
X-Gmail-Original-Message-ID: <CANiDSCsnOdTaW0Eg68+-niPXwPhYc3Br6cWoGiHytZrFOGmcZA@mail.gmail.com>
Message-ID: <CANiDSCsnOdTaW0Eg68+-niPXwPhYc3Br6cWoGiHytZrFOGmcZA@mail.gmail.com>
Subject: Re: [PATCH v10 3/6] media: uvcvideo: Quirk for invalid dev_sof in
 Logitech C922
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "hn.chen" <hn.chen@sunplusit.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Oleksandr

On Sat, 23 Mar 2024 at 13:16, Oleksandr Natalenko
<oleksandr@natalenko.name> wrote:

>
> How do I check whether C920 (046d:082d) is affected too? I have got one, I can run tests on it as long as those will not blow the webcam up.
>
> Thanks.
>

First of all you need to enable the hwtimestamps in the driver. You
could do that with

```
rmmod uvcvideo; modprobe uvcvideo hwtimestamps=1
```

Then capture some frames with yavta
```
yavta -c /dev/video0
```

After around 5 seconds all the frames should have a stable fps, the
fps is not stable then your camera is affected with this bug.


Thanks!

