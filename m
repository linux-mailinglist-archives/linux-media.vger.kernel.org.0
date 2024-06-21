Return-Path: <linux-media+bounces-13925-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD18912316
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 13:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 508C61C2250A
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2024 11:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD34172BA7;
	Fri, 21 Jun 2024 11:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TMItB9bZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCAA172BA5
	for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 11:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718968422; cv=none; b=sHKNCFu5ox2RgEu52DL2yE6oShIosICdHMwK5ph/y6c4PLQad+X6GHSpAxNmZCQqKhiGznceQQAEqpj5p02RcWj5KzPMKQQa+wFtThxNAHAt2N+R4awz/it2+B66N3S+BtHZm419h9ykc/oGFTGS2RUx4qtUdbpaxJsg2ZxCLuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718968422; c=relaxed/simple;
	bh=vc+J3KCyEZWEa6ulW9XgE5n00OyGCLD3pCnVtEmteGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A7hFK6SLBnAp2yWHBxxwE+FnrDqyEOEX13M1legso7iAMqqRQEhb82GjaYrXFiz8dVEBtNbXseqHBbgPx1NTMChd7rej6mJAqoC+NWTtGuw8Jt78Gphfu0ADZL/SmSwiUWyox5UgHuSWAh8tCgQ5Bz/ftu1+xEHOhHfSPf1r7CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TMItB9bZ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6f9fe791f8so311505466b.0
        for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 04:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718968418; x=1719573218; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vc+J3KCyEZWEa6ulW9XgE5n00OyGCLD3pCnVtEmteGM=;
        b=TMItB9bZ4heugFedE2P0KYk8ubttOBUTAM8hd6ky/OKOnrihibPiP5KhRPVa3lA14Q
         h3Tz9HxtUwmpn/T/qsugZF7kyP1Kk4Znc0Da27YJ9+rdglvVbiT/9m+P44riJCQWFGDK
         wGnwjEPTgvRhAY1is6XYx97SLulIl0/DunQBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718968418; x=1719573218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vc+J3KCyEZWEa6ulW9XgE5n00OyGCLD3pCnVtEmteGM=;
        b=TzMTqkoA7v+JkA3XQ04uQ9Qs9LVPfs1V0r6KJElM6ny4/zYugau2RrkL87sLbRDKGn
         Q3dwvvWY4GwLCGsizA7c1eHgpBMhpoluXv9boMR0OkEXMZ1IaAi1qi+LULj3ScMEjLbO
         w5RpdTFaTWuiZA4/QVdI9sQ7MSWPaaG7qEDMdTRId6+ej+l1HqVSAYIUgGLlR67MVcB7
         4h1o2V16/kwjJ9Ktq5cMqwcN52bnQqjTz53L06A8OgBha50X/7QQ9yc29Dy8e2HUspXw
         T/YTehRxZXPo5iKwiUlNNiXHqvSyuXPcBhg3qilJt+w5N/YPGOBPN4WdFkjW7AyszpJ9
         rsKQ==
X-Gm-Message-State: AOJu0Yz4qla0SgLqANN+dtaDqkDDadWgN+aBz+rpZ57NhDCBElKbAsy/
	7F/4WrGPHS4XkkboMXEUQRFmjruMURUC6vpbD9gNxU7lAjw2gNr9U1/OtN7wU0PmmTA1iNaGWq8
	=
X-Google-Smtp-Source: AGHT+IHHKbd+xRtLHKm1rMp7azOIeyPfeevgwAOt/vL758jihkpYhfSCAEWAjz/dzPd5RvGFGtznMQ==
X-Received: by 2002:a17:907:1887:b0:a6f:af29:8d60 with SMTP id a640c23a62f3a-a6faf299090mr515562966b.2.1718968417703;
        Fri, 21 Jun 2024 04:13:37 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fd1be8340sm56679966b.109.2024.06.21.04.13.36
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 04:13:37 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6fbe639a76so307143966b.1
        for <linux-media@vger.kernel.org>; Fri, 21 Jun 2024 04:13:36 -0700 (PDT)
X-Received: by 2002:a17:907:c80a:b0:a6f:4b45:ff6c with SMTP id
 a640c23a62f3a-a6fa430f3a6mr649541966b.19.1718968416436; Fri, 21 Jun 2024
 04:13:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPvqTd7WkMWfrNqAFiuMNZ87Bva-_WB0N+DrBF2ZMo+_zTpFXg@mail.gmail.com>
In-Reply-To: <CAPvqTd7WkMWfrNqAFiuMNZ87Bva-_WB0N+DrBF2ZMo+_zTpFXg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 21 Jun 2024 13:13:24 +0200
X-Gmail-Original-Message-ID: <CANiDSCvXcSAhbAipoqtBvTejpCY2+i_=_+v=Ps-J58-TrNZA1Q@mail.gmail.com>
Message-ID: <CANiDSCvXcSAhbAipoqtBvTejpCY2+i_=_+v=Ps-J58-TrNZA1Q@mail.gmail.com>
Subject: Re: [WEBCAM] Driver error 0a50:6100
To: Daniel Liz <darkliz@gmail.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Daniel

These errors typically come from the audio device (the microphone),
not the camera.
[1494270.530420] usb 2-2.1.1: 3:1: cannot get freq at ep 0x84
[1494270.801508] usb 2-2.1.1: 3:1: cannot get freq at ep 0x84
[1494270.806591] usb 2-2.1.1: 3:1: cannot get freq at ep 0x84


Could you try to run:
yavta -c /dev/video0

(assuming /dev/video0 is your device), And return the output of that?

Does your camera work in Cheese, or Google meet?

Thanks!

