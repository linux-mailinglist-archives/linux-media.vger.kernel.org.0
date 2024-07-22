Return-Path: <linux-media+bounces-15232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5080938AFA
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 10:16:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6E631C21454
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 08:16:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495D91662F1;
	Mon, 22 Jul 2024 08:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CPklVXkK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12985160873
	for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 08:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721636159; cv=none; b=h+MRauMELgVQLz4mWxwDLYvKzmdz8S08wJm0A+FHQQFsb461ASpp/XV+fTRBs55lVCZhAUgGzxdWCvMFzXcA6N8JOhICBnQ+ZQY5lKf/2Zs8ZOwVvHrE1DJjHMLdofF/rz5fm1ftyGrERXDVdhSEuMdZpsJ7KwDR03aCL1hrwSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721636159; c=relaxed/simple;
	bh=/2+YuJPIcXqhODSP/RWPHTqk9XUdfUu5MmN5dANhmUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wqt5yEldw0M2vz3g4rvhgqQqc7TKV1RoEZSHNPPaTNNpngxYO61FqDOI1fsW6+sEXr72rKNPexgXmO7+T3clBPywLu5uNn+5qSQHtLVptcGszJBbeHnP+DEoE6eLcekFXpny3HI1qXnuCr+G9KnKtOLpGO99hTpoanoFeKSwg3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CPklVXkK; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5a156557026so3146231a12.2
        for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 01:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721636156; x=1722240956; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=exw+OqFC2fTiy9XVN6qgl4Zl3vrBp9o9yGgwUOr5R+g=;
        b=CPklVXkKa1V9mcQqJDw40svAJv0xke9IJ4gBBmfcRLQRgX4zBtsUk8/wH11pTwKX7z
         lZ2tD4+b6BPm9EbpqkcxTgsMTqgklP1gdHdbmlatNw9lvWvYn8psg1qh7XCjjAvgtGfn
         Fe6Bt/X2AM172ZqBsasIumucNmmN8yCrGoBuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721636156; x=1722240956;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exw+OqFC2fTiy9XVN6qgl4Zl3vrBp9o9yGgwUOr5R+g=;
        b=KYqX/RYh71FAk/2NZ/Au6TklFxCPau/3kACX6n3GDpj1eiLCRKitzsa6Dv8Z0Ympqp
         kdtkMG789BHCDfXaZrwl1T8lsbLiYYDKEqaopvwy0H/29iZuiz1xD0UFP41ppyeQ2Boy
         VothIjhEFgcbQOxVmgIs+ueS7p1FrGiLQqI6v0EW71YbmnYDNih3C9E9/vMsAsqWjpgx
         FxzKViCu23kTXZJSY5cXtNM4JoARE4lEUm638zLgadq0nzdJcRVAubkQJtQvvThvoaf8
         zzVq/YNpUel7wckgfsYTa5UdETYuVUeap/9zkTx8y+fc8/q14mWEAcJJwpzvulOSm3Kh
         gH7w==
X-Gm-Message-State: AOJu0YzBeP/DAgbT1LIN9BvsystXM70UXGVP4F3QvIb3J42kbFZveB1q
	B9qBRzLqZCB2gOIDncpI6TN7pKE13peftYFu8AHNYF/nNkd81nuUs81RG6IbTSF5aNoYDl7hmo4
	Vzw==
X-Google-Smtp-Source: AGHT+IHwOPkYY9YEDVKr5LeyeZBvRvktvYDAj7Cyg47KjR8E83NDeiogNH67ptFzFRNhognNMZEEzg==
X-Received: by 2002:a05:6402:34c9:b0:5a1:b42f:c93 with SMTP id 4fb4d7f45d1cf-5a478b78e72mr5031308a12.13.1721636155642;
        Mon, 22 Jul 2024 01:15:55 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30c7d32bbsm5742715a12.89.2024.07.22.01.15.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jul 2024 01:15:55 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a77b550128dso407873666b.0
        for <linux-media@vger.kernel.org>; Mon, 22 Jul 2024 01:15:55 -0700 (PDT)
X-Received: by 2002:a17:906:f58c:b0:a72:9001:ed73 with SMTP id
 a640c23a62f3a-a7a4c43833emr431011766b.50.1721636154850; Mon, 22 Jul 2024
 01:15:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <qiDpaTpmUiihs32PnSJ5OBrVm201qlAyraYycyW8Fo72UIcSkWQ2FgQPnddO_56Euepf508o_SsViFu1cQiSHlgD06m2rdnoqQvEeLe7NZo=@brettrd.com>
In-Reply-To: <qiDpaTpmUiihs32PnSJ5OBrVm201qlAyraYycyW8Fo72UIcSkWQ2FgQPnddO_56Euepf508o_SsViFu1cQiSHlgD06m2rdnoqQvEeLe7NZo=@brettrd.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 22 Jul 2024 10:15:43 +0200
X-Gmail-Original-Message-ID: <CANiDSCv+Gh3E5TuJkxbqWnJ8fcM=WhJbh+hJjNbM=D2ZwSwf=Q@mail.gmail.com>
Message-ID: <CANiDSCv+Gh3E5TuJkxbqWnJ8fcM=WhJbh+hJjNbM=D2ZwSwf=Q@mail.gmail.com>
Subject: Re: new UVC thermal camera vid:pid and quirk
To: BrettRD <brett@brettrd.com>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi BrettRD

Thanks for your report.

Do you want to give it a try at sending a patch for the device?

It looks something like this:
https://lore.kernel.org/linux-media/20221101-easycam-v3-1-2c9881a7a4f7@chromium.org/

Make sure the vid:pids are alphabetically ordered.

Regards!

On Fri, 19 Jul 2024 at 07:55, BrettRD <brett@brettrd.com> wrote:
>
> Hello,
>
> I have a device not listed among the UVC supported devices, '2bdf:0102 HIK Camera', It's sold as a "mini640" thermal camera.
>
> It needs the quirk 'UVC_QUIRK_PROBE_MINMAX' before it runs happily under gstreamer using v4l2src, no errors for all reported resolutions.
>
> Attached is the libusb output from it, and the v4l2_compliance report generated without the quirk applied. (with quirk=2 it reports no failures)
>
> Thanks for a great driver and documentation
> Brett



-- 
Ricardo Ribalda

