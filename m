Return-Path: <linux-media+bounces-1931-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A95809C92
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 07:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E852CB20E5E
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 06:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A96C6D38;
	Fri,  8 Dec 2023 06:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QHJcxllf"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A621723
	for <linux-media@vger.kernel.org>; Thu,  7 Dec 2023 22:47:03 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a1ec87a7631so148424166b.0
        for <linux-media@vger.kernel.org>; Thu, 07 Dec 2023 22:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1702018021; x=1702622821; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bhp7niZixNUyC1WRXnTrthFp9hlVK/ThVcRbBT5lIeU=;
        b=QHJcxllfTYTQmxmNsYx257FwhE0aDgnY8DoRrvd0WLTBfZd4IXPyhvtePaHYNfm6bT
         L9upz9rE1hToGNqNPLof97nLqw2x8+5q8DgZsUFJKZUQvPUHKxkBIN9zUmGgYInGQBWF
         OUu7ZMi07/J3YiD960ugramtjQWc/vkyO5xnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702018021; x=1702622821;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bhp7niZixNUyC1WRXnTrthFp9hlVK/ThVcRbBT5lIeU=;
        b=hIaDQkaTjYIOig3fsqkXbK9fglei5Aur8K96yUVVfI69MZR7r+76n/1RYyRZhTGEtw
         qyseiplm5raixECgPViM/bskq7guVrwXuX2krV8gzD3h9nZZWnUGwxQst5QKMLF8sOJ2
         zUGgCXsBXPdDUJ3bS0G3ZtkFJoDjXuKvkkrFD1dM8AakNIzN7yoaTapfYKNRDLRMzYP8
         09au4fHLufEPjFx1Vg/MOIh78KpQwxeBf3l6CaWcTpJCk98ajFVc/sionkCYCJ74APVV
         7GnV8u0BERgDRCH4GGeBnsYI96t9QfTpbmTtduYn4HxpJTOVeXpwXnFzhvvmi6VGlY/J
         jkhw==
X-Gm-Message-State: AOJu0YyRS5gebaN25V8FR7L7jj6wR0CI5LhFbbEAL2pBVHdcAF01jRC9
	cOvfSmn6q2vHOjgsWRMUOv14ZtkSC2G/EbXv+1o=
X-Google-Smtp-Source: AGHT+IFuVP+JquKsbtHCbU/0DJWmzEsx1a7bUbG3ZtyTm5NggCiilqOxLewTAc16JEypP3STNhmhpg==
X-Received: by 2002:a17:906:2cb:b0:a16:3da0:dd36 with SMTP id 11-20020a17090602cb00b00a163da0dd36mr2496831ejk.48.1702018020921;
        Thu, 07 Dec 2023 22:47:00 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id rg9-20020a1709076b8900b00a1db175d37csm627809ejc.177.2023.12.07.22.46.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 22:47:00 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40c2db0ca48so25825e9.1
        for <linux-media@vger.kernel.org>; Thu, 07 Dec 2023 22:46:59 -0800 (PST)
X-Received: by 2002:a05:600c:3b20:b0:40c:1e46:508e with SMTP id
 m32-20020a05600c3b2000b0040c1e46508emr27895wms.0.1702018019494; Thu, 07 Dec
 2023 22:46:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alexandre Courbot <acourbot@chromium.org>
Date: Fri, 8 Dec 2023 15:46:47 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUB9GTEOCCkvVK9+ukjuYr9x6X8Kv-XSHT1tNd_=ZCCfA@mail.gmail.com>
Message-ID: <CAPBb6MUB9GTEOCCkvVK9+ukjuYr9x6X8Kv-XSHT1tNd_=ZCCfA@mail.gmail.com>
Subject: [FYI] virtio-media published
To: virtio-dev@lists.oasis-open.org, Keiichi Watanabe <keiichiw@chromium.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Enrico Granata <egranata@google.com>, Gustavo Padovan <gustavo.padovan@collabora.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Albert Esteve <aesteve@redhat.com>, 
	Enric Balletbo i Serra <eballetb@redhat.com>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

This is just a heads-up to announce the initial publication of virtio-media:

https://github.com/Gnurou/virtio-media

The name has changed slightly, but this project is essentially the
refinement and continuation of my virtio-v4l2 proposal. The reason for
moving forward with this is, to be candid, the unclear direction and
lack of progress regarding the future of virtio-video, and the
non-consensual way in which its development has been, let's say
"redirected".

The repo above contains the specification in the README file
(presented in a more informal way than the virtio specification), as
well as a guest V4L2 driver able to pass v4l2-compliance when proxying
the vivid/vicodec virtual devices or an actual UVC camera using the
crosvm V4L2 proxy device [1]. As of now it is basically
feature-complete and offers everything that virtio-video is supposed
to eventually do. I am considering adding support for multiple devices
and requests to allow more complex camera setups.

Since the initial proposal has been rejected I have no intent to push
this forward for merging in the virtio specification, so this will
live out of the official spec. However, it is likely that we will soon
switch to this solution for video support in ChromeOS and possibly
other Google projects with a similar need for a stable virtualization
solution for media devices.

Anyone who is interested in using this for their project, or with
specific requests, is welcome to contact me or open issues on the
Github project.

Cheers,
Alex.

[1] https://chromium-review.googlesource.com/c/crosvm/crosvm/+/5065329

