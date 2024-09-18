Return-Path: <linux-media+bounces-18395-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3E597C0FA
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 22:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5BF5B220C9
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 20:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF0E1CA6AA;
	Wed, 18 Sep 2024 20:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MTwB0dzM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D186FC5
	for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 20:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726692642; cv=none; b=enbu2Hqs5PcG/Xh6hoUDM8uUHyowO2IZh8f8JTj35fdsAWBvlSbYexfJv+6dsjJBIsx2dRMeXA3Ji15+3EASIZWFVlVzF/CxQ2rPhuXriJIc17Ozh9ij1duhFOOzv8H+rYS5xl9pgIYIdAhXd1Z7c3JcvrvqPla9hJLcjvo4wdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726692642; c=relaxed/simple;
	bh=e0pCv8VtxM8T+gYfUpsT8c5cyovFTcCSGj4W1j1us3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EeVKei77jfQRgE38F44og8RhpteyxYoxtiMuuEe9ImcTmkZtNQOx8qO19nisrh5PJ73g3fEHKYtG8C0kQcElZgkNPYGHpiTOErqFxg/gTfjA3Zhr0XHh/pYB+OJH3cfYig8Mlk/QTvCjeneE8ZoG2vh3jBSTvYxg7dLo53bwPoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MTwB0dzM; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-718f4fd89e5so96596b3a.0
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 13:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726692639; x=1727297439; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YoQ+OMggwhRPBa0v6VSE1kIu0Hp+76B4VjRJ7YDcDJs=;
        b=MTwB0dzM0f17X7MxIv1gERu3A4w62Jj4pdL5BHgWQZ+LMIAhl47ivDN0QBoEuMIQ4y
         ZJ6CilZ97QK4KMh2eqTVJE2XlmPQD20dF/up4lZZK/Y1S5rIHoyWgH5Nce8bWGqaWxhH
         UFqIWkLc1IZcmwiY3n1kiV2DvqsSzKx+z7dqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726692639; x=1727297439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YoQ+OMggwhRPBa0v6VSE1kIu0Hp+76B4VjRJ7YDcDJs=;
        b=kxAPQgSmTB7utC9bSAqS9KYIPeBFCi+/pvaVxGanUjPM7ysn6edUig5JMPal8n1qY4
         d6O45WD5MstvKrl/TDU+wUkerU27Olc1HGP0+L9T19oqMQX3NQT6g92WM0hNooo41FOp
         QdmisfXb4fPgsJ8pt+B7XI/DZrSQBQqxjy19b91uqU2tU/kizOh69ypxMdgbsEcw7C0K
         Cl8gcAZg9/V94cl5qs+A53ZvVUc+aUhMBmvulZ6I2dVvAAi5pmxA0n2k7eOQFe1HGFUj
         xGU0Hleod/HxhHmCvMbeG6+6QZjskfpE6gq0ArSu8Y2dP+7EOK7dw+G19Vty1QZTI4zk
         QasQ==
X-Gm-Message-State: AOJu0YyvT/b7M1Aho5+0N/vt22vH7xgbdT+QTY97vWxAZ45zv2UsZaBu
	LpcrmXbqhbk3B1YGe0V205Djxs2otH9SmUjpSV8XRYqfTFxoSQMISYbnRWDV98pCVpRV9IsaHiY
	=
X-Google-Smtp-Source: AGHT+IH2VnDuKAJA4cYTnSEG7IlgOUnx8wMzFz4HJDnQ8Z6dl+p+vCS47/1V2hspNwh7eyclJTnuVA==
X-Received: by 2002:a05:6a21:7312:b0:1ce:d418:a45c with SMTP id adf61e73a8af0-1cf764c418amr34487074637.50.1726692639529;
        Wed, 18 Sep 2024 13:50:39 -0700 (PDT)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com. [209.85.210.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db77420728sm1447623a12.80.2024.09.18.13.50.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2024 13:50:38 -0700 (PDT)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-718d704704aso70869b3a.3
        for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 13:50:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:1990:b0:718:e276:eea8 with SMTP id
 d2e1a72fcca58-71926081229mr37577976b3a.10.1726692637782; Wed, 18 Sep 2024
 13:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <fce4f906-d69b-417d-9f13-bf69fe5c81e3@koyu.space>
In-Reply-To: <fce4f906-d69b-417d-9f13-bf69fe5c81e3@koyu.space>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 18 Sep 2024 22:50:21 +0200
X-Gmail-Original-Message-ID: <CANiDSCsrVJ-rSCNHw-=FVRa4p_1PhfPzYb0cR0xh8cPrhN1yZg@mail.gmail.com>
Message-ID: <CANiDSCsrVJ-rSCNHw-=FVRa4p_1PhfPzYb0cR0xh8cPrhN1yZg@mail.gmail.com>
Subject: Re: Add support for "Quanta Computer, Inc. ACER HD User Facing"
To: Leonie Ain <me@koyu.space>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

Could you share the output of lsusb -v -d 0408:4033 ?

Thanks!

On Tue, 17 Sept 2024 at 10:13, Leonie Ain <me@koyu.space> wrote:
>
> Hi everyone,
>
> the people in the company I work for are all using Ubuntu 24.04 on a
> specific model of Acer laptops. The only problem is that the webcam
> isn't working. A quick workaround on GitHub Gist
> <https://gist.github.com/FruitSnaxx5752/b6c82f8429e760049ad6f30e5d0dbea9>
> suggests that adding the Device and Vendor IDs to the UVC driver works
> just fine. Since I don't want to rely on that workaround and manually
> load in that patched kernel module all the time I'd like to share my
> Device and Vendor IDs with you so that support for that webcam can be
> added for everyone. They are 0408:4033.
>
> Thanks for your help. If you have questions feel free to ask them, I
> have the device always with me so I can quickly debug any issues.
>
> ~Leonie
>
>


-- 
Ricardo Ribalda

