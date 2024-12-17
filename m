Return-Path: <linux-media+bounces-23576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ED99F4A5A
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 12:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 403511686C6
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 11:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5A81F03D4;
	Tue, 17 Dec 2024 11:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nDw5qKxj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02B01EF088
	for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 11:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734436568; cv=none; b=P8QwU+ivtEEKpswwIpMb8bBQafWKonIxEO+XbSTUVJDxcWPudOZiqKBT22uqt02zbxtKvnalwHHQ1NbMsE1K/IZoBTEpd86Eb3UW5x8vm1bBAVMY8EVaGiSToVkF7i2LNoQi8lUVWca4pJRnv8hsF9bL0C975lVhdkL3t0C0OL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734436568; c=relaxed/simple;
	bh=DPASesAJtANExigfnsem2WPysD+PZ0iUAOh87U9EdGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O8E6BNfAtsiJTLUO+sTrmwfBK0nSxzcBI73uXQjI3DV//C5F/qPRt2jA9tfqq83MEnrrZqlJWwZIamp1oV+g6Gkp8SypUFv7ZjNxOqdwuhunTmCXX0wYmM//WR5toRXaQUM5Y2w13g9AcmjvnC+tVDM3yh2KjEtNLnxTJ/iixmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nDw5qKxj; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-728e3826211so4083006b3a.0
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 03:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734436566; x=1735041366; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DPASesAJtANExigfnsem2WPysD+PZ0iUAOh87U9EdGo=;
        b=nDw5qKxjJHl5Eoxbr1RtH4z95l15dOktWXqtfzso4RLifLeOKLAX7hDeHyHbb7MhSV
         ew1QIRbPZu0OpVGUmo1SY8yhQP7NBQDpMT3nA6Q6kPeWAXN6VvlNjszEAq5PZRGcVj9g
         v89uETd3BpYIh3tAKXnIfSUsSypPRsCMubegA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734436566; x=1735041366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DPASesAJtANExigfnsem2WPysD+PZ0iUAOh87U9EdGo=;
        b=L0e9PuKokYQGce+I9R1eTLtYzjxOGzX5kccfV8IobEoTLEdW5+XQSAcLqbwSCD3/oq
         NLD69dWymY+x2xPyeULz8yiH0Q7RezBnlnlReIOXvrvB4c7oNksXilMfnk9LV8zZWMCi
         i/LE8ANl73RqS2bFZwFRhVRDknHx5cMp6GWKx+UQVmv0VrxV0hOpEuHr6JoApxpZdd5u
         PFS9xPBgRr1C0NNHdPf3UOqg8WpNB68YSVbG5xbXB+/kwSaemFaL+yYOW7H57/5uyjbB
         6fq1WOcsBN4oGBnZmSVdaF4urMG1tTIC9rIA2Mbgsl0L5AfLocrnKPt2WGEnt0zQQTYo
         JhmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXolDaKG4mue++f90HWOmXs7I77fUeSbw2OKSVH0jrHJuJJCNWoHiSTE2YLbSLYez23fq4dL5V9DnMiKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzVP0kLeYuiSwGhhvi0xXp2JNtQrFeyVhRxJsgM5zTiGwoAnms
	dPyBeNxHuMvYWcntF9xNNkcwQlyf5DirBfuKS8WKdQ40nM7tIMaTFMgedyoJxf31qGD7MgYzM4E
	=
X-Gm-Gg: ASbGncshvK93388Hmn3WWuMA03QhDC/TatJZtyj+MxunHZICdEQwt9P1LzppXGQOVDv
	dNp/URuG5nBmNex8hnKo/37mSJRGrV3hSJJJ5qna8FLqYnI7ZsBGgNi7YDpGQjozbBY62i9iCTV
	6znY5TAPKR5XTfcvb7v9m+gMJWQjpJN0wua/V4w0611KGpclGlQCCwSKsss3xa5Wu1/b3TyB/A4
	4AZJrEKqutOjFvdtoET/4wvdnkNSff2mjeD+ctcu3rmGXmzofg4TDbSgESUT4IZnMrhq/39MIae
	2rmwDN8Flgpb3ONzM2s=
X-Google-Smtp-Source: AGHT+IG8xc0CIPtXFdF6jBbmMaslgt4Zp/4e9HyxNm8L2+Q6+IT4RNyJWdeEuUxYGpK293BGahMjfA==
X-Received: by 2002:a05:6a21:3a90:b0:1e1:9f24:2e4c with SMTP id adf61e73a8af0-1e45ab3ae34mr5136986637.16.1734436565916;
        Tue, 17 Dec 2024 03:56:05 -0800 (PST)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918b78e47sm6689004b3a.101.2024.12.17.03.56.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 03:56:05 -0800 (PST)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2efd81c7ca4so3592866a91.2
        for <linux-media@vger.kernel.org>; Tue, 17 Dec 2024 03:56:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVpuaVrKQoD+WKUFlYnjkZZapgFmSNLc3wDtyyRYR9Nrv9bL/ccVlh2Ts8Dg0n/8dieAxzr3FO3wgzKGg==@vger.kernel.org
X-Received: by 2002:a17:90b:544f:b0:2ee:ba84:5cac with SMTP id
 98e67ed59e1d1-2f2d7d6d916mr4676875a91.7.1734436564404; Tue, 17 Dec 2024
 03:56:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241128145144.61475-1-isaac.scott@ideasonboard.com>
 <20241217111351.1890805-1-isaac.scott@ideasonboard.com> <20241217115426.GA2025@pendragon.ideasonboard.com>
In-Reply-To: <20241217115426.GA2025@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 17 Dec 2024 12:55:52 +0100
X-Gmail-Original-Message-ID: <CANiDSCuHTGNUaDUrn6hnNfQEv37BQH9xa=NR7PE0D=oB1QLP_Q@mail.gmail.com>
X-Gm-Features: AbW1kvauHRRolNrqt1OWakMNfEgFbwwOep2INeb-HiEXgzWz-Lx7Rh3Aij718ac
Message-ID: <CANiDSCuHTGNUaDUrn6hnNfQEv37BQH9xa=NR7PE0D=oB1QLP_Q@mail.gmail.com>
Subject: Re: [PATCH 3/2] media: uvcvideo: Add Kurokesu C1 PRO camera
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Isaac Scott <isaac.scott@ideasonboard.com>, mchehab@kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Isaac

Could you also provide the lsusb -v of the device?

Thanks

