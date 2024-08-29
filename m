Return-Path: <linux-media+bounces-17164-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B668C964C9A
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 19:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 734D8285192
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 17:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF1F1B5EBF;
	Thu, 29 Aug 2024 17:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ROhFhDPO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5A61B5EB8
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 17:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724951122; cv=none; b=qvcDOxPH7GF/w46X3uhtLPOYS8XBbt38ia6nIYkrDtesZMLnGSLbat3kqdzt6yZTrSlDZiTWCSHRzzWOCr3qeLZe0xu4cz48wHWrZynl66JpNwmwU2yBEvXq0g67lrzyq6O1O+ubGmfqZ6FJXgmCOGkkDS8Y3iLfG6GaJfLFSKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724951122; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n3NiquS4MsSyhCCLb41w6gCrs9DGnxd/OI4iaYFVyjpDDVBMQr0eaYVqhMcQ7HBSYU8+CMmnTGCvZ/g7JwfWsjoEMRXiSPG251L+KAnrqOeY6jds/degQjYYFnGBAgzbMXlq7GH2yxStOiL1aB6TPqR4FrK/kav2z3cx0CXN9a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ROhFhDPO; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42bb6d93325so145e9.0
        for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 10:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724951119; x=1725555919; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=ROhFhDPO9Ll9pWySk8+1RNzrFAIkqvOHeAt76Sekt/2Nq2RgyGnHOrg06nVAwJTbbx
         zAi0uJwwJP0jqEYMfTHLkWaLJ2gekVim0k8G/dT0p2KPEwnnDBxr8vGAEIAbWGgwydbJ
         27gRXfuhbdNIvrexgxiNmeLdRC7iD8eL/W8DICUJu+ZkoPpVwFJIzZtULYynfRQ7WJSf
         hf3JckSyM3mS9++wZHTI426vRojfg3E4bT5gEo9V8aflq0OYneGz+LtgkdyczysS1TMQ
         xYqLj5Joab5nUxH9a9uJl41/gt6GcyBRtoMAcugUPwyUekYoCs3c/38EOqb5F/7yf3PF
         4aQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724951119; x=1725555919;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=qyWZXRS4aiTTPUCINld/ZXV7mRG0tg8uaEiN5CMJ3nY/zG+swn9GtmogDhZAPaQj2T
         uifN0nQSbLxX5ULwrnF2PEcpZ0HlvbMx+dW9T14YU0d3zx5520oxwhjboWrs/f2K/Yh3
         V4WmYdPoNNZK9HNyp6Olc0/7vCzy02/KYoA7e3OmdH14PwONjs8hCPx+QYBiTigL1Rad
         cFQ5XIqaOImWcgLGqHaiCtb87Qa6ENYjzN3MYkK+mThEqhEbcFh4/VSCHtrPo2JcgWaP
         Yg2EBhztN7xHOVpX/HQrggFS3SbW9F+qffiDLQRYXV7Jfpsnx0hr+/k/g3YzCjakdHL7
         uyjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFUvJ6qKNEaqvMqNKLgJN3B3M6M19omvZ2r7lrlOdRDEsl6GLY4qNJjR/uJYV97ZWTwIXQ07c89e3fwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC0mBq6/gicDuBwrDbHaE99k8Iea3oqlyH8WfSYFtIDjn0jlAV
	9xIHUhCdAwJyGhxqQagWPmdwJoBLIihP+3+ECvUzfZIusighqmeWufBs+U996k7BNIXN8itWL+B
	viJkCOKj8Vj5va7+Q/+KJvPWsWHJMl8iCbG0=
X-Gm-Gg: AV9I1ZQM7Obj9Is9c/WWO9IG4yHhkeeTGx7veIIsbCp38VkDXUs9f94rSJowfxuaDd9
	DcQhR2Q0GxskcoHsCaG2sN5rMGFjj1Z9oArPMA8HqhNDEQdt1eYuLSm+ViWo=
X-Google-Smtp-Source: AGHT+IF8ncbv3hPX6txBwjD+mljfVJFZjCz8WD9pS5r0ChWeEb3HcbLEeUEQAMuL4Kr+bb+8RiZA/+ov4ZUA9UxFSLs=
X-Received: by 2002:a05:600c:6d12:b0:424:a2ae:8d1d with SMTP id
 5b1f17b1804b1-42bba2d4b89mr12755e9.2.1724951118768; Thu, 29 Aug 2024 10:05:18
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFs7P=jk=wfo0nbHzqd1NrGX3NKpOezD4-u=nAMqzq7mq4Lidg@mail.gmail.com>
In-Reply-To: <CAFs7P=jk=wfo0nbHzqd1NrGX3NKpOezD4-u=nAMqzq7mq4Lidg@mail.gmail.com>
From: Joshua Pius <joshuapius@google.com>
Date: Thu, 29 Aug 2024 13:04:40 -0400
Message-ID: <CAFs7P=jPqv2Zr6Fnw584TKhj5joBRt7X7gMidE4MiK1ABAMiRQ@mail.gmail.com>
Subject: Re: [PATCH] ALSA: Add logitech Audio profile quirk
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"



