Return-Path: <linux-media+bounces-3676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A8D82D2A0
	for <lists+linux-media@lfdr.de>; Mon, 15 Jan 2024 00:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8C271F211FB
	for <lists+linux-media@lfdr.de>; Sun, 14 Jan 2024 23:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD87E2C68D;
	Sun, 14 Jan 2024 23:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCqrP1v9"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E7C12E6C
	for <linux-media@vger.kernel.org>; Sun, 14 Jan 2024 23:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50e80d40a41so10385375e87.1
        for <linux-media@vger.kernel.org>; Sun, 14 Jan 2024 15:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705276681; x=1705881481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/oEVVR2aMGY6KbcjnYfw8QYCQqM0Umy7qOrTg67CkI=;
        b=ZCqrP1v93hQtJGQtvnddtSd66hS3MihJsVyG5phxR7e2FkQCQ+dKd1SlatMd4lM3Iu
         upqa0QvuzfOy7SFj6aZbxsRYQxr6RWdAWzAqh7O+4pY8OIDNk1FZpf+3/WthAi5g6ufX
         vvdwZHgxJEtNggUJbu+UN8WGXst/iGry6zyr9LeqyIZRx/D/wGz5tPTq6ljnTQr/5rOE
         vhQitu0S4PXHsCTKIkGk605UUWGlbK4xSAV+QiXMe7CqLKDribaXbYYt5XvejiPrbuKW
         F7aMBYnVFX9M0jhenLv10LoYnVq4F3PjodCR9Gpp5tu4APOUZOe4Fg5qI729D9MLl3Sw
         yq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705276681; x=1705881481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/oEVVR2aMGY6KbcjnYfw8QYCQqM0Umy7qOrTg67CkI=;
        b=KUsy5LvXcep+LppmRwX1X+rytG7ZV1rilr3paoCLpTOC3jYxMp0dZfUbco20KuIVET
         B0JTHoPSamYTLbUJkrsUBramH7FlSbDN86xgwga0JbNCqYIZFW6KC6M2ig56iL9XBNQc
         jOhfste6El6Q6I16fO+iCozcWUqD4UF5XRxEftcYADBKJulwM/cglKPu1ZcVO0r2TVRv
         3iKS7LLQqLpOa7zB1HZKO794lNy8sjKOUgVL84fCbphIdypE5POmlvVGAAVkH8uPMZe5
         Pm3x5a95b0xxRzOeknZbClWUlyokgPXStTd7lei6WTR/TDG4wdXyiFasbK79SwK5Rpsd
         hzLw==
X-Gm-Message-State: AOJu0YzuF5pbVoHV4U0tD5JjS7IeBvEdTbBfiLDW5HoVyTuK9XKmlUzk
	Il0O0qNhLrymUNBX7xEbZ5s=
X-Google-Smtp-Source: AGHT+IHNMEaFI/K2LQHeogTeyvje3GjiplTmob9/n70WL/G65D8iu26m04wqjM0uPtTvwSV2fcprNA==
X-Received: by 2002:ac2:5dfa:0:b0:50e:7b4a:7819 with SMTP id z26-20020ac25dfa000000b0050e7b4a7819mr1785095lfq.131.1705276680418;
        Sun, 14 Jan 2024 15:58:00 -0800 (PST)
Received: from foxbook (bff170.neoplus.adsl.tpnet.pl. [83.28.43.170])
        by smtp.gmail.com with ESMTPSA id h12-20020a056512054c00b0050e78f183e1sm1288688lfl.82.2024.01.14.15.57.59
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 14 Jan 2024 15:58:00 -0800 (PST)
Date: Mon, 15 Jan 2024 00:57:56 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: extend the bandwdith quirk to USB 3.x
Message-ID: <20240115005756.536dff4c@foxbook>
In-Reply-To: <CANiDSCsS-Wg-2h-rcHvPjoem4h-pR1xOJST_EmNTdKum8grSSQ@mail.gmail.com>
References: <20240114213518.03e22698@foxbook>
	<CANiDSCsS-Wg-2h-rcHvPjoem4h-pR1xOJST_EmNTdKum8grSSQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

> Out of curiosity, what camera are you using? Could you also share the
> patch with the quirk?

I have no idea what camera I am using ;)

It's some dodgy no-name thing which doesn't even have "made in China"
written on it and reports IDs belonging to a completely different kind
of camera.

But it sort of works, so what the heck. And I use the BW quirk with it
because it otherwise asks for way too much.

Squatting on others' IDs appears to be a fancy new cost reduction trick
(not the first time I see it happen). I'm not really convinced that it
would be a good idea to push quirks on such IDs upstream, but I figured
the BW calculation fix could be useful.

Regards,
Michal

