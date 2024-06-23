Return-Path: <linux-media+bounces-13991-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5C8913E9A
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 23:45:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73417B20F0A
	for <lists+linux-media@lfdr.de>; Sun, 23 Jun 2024 21:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06F4C1850A3;
	Sun, 23 Jun 2024 21:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UsCk4O/X"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75292F24;
	Sun, 23 Jun 2024 21:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719179133; cv=none; b=QLc8qDF4Quebti19JGzVWXVvWvXCsVpmG9Lh9BowjOK8ZL0Pzd5Ch5KD/9mTKr53/td58HijI82aVDgtLEFPzVXaqH+Ld4/JBhTqLte1p68SA5BQXfbUaWOKlFNK9KCNgYBoJPzGn5N3ZNJ49djkPnmeWWN4boqJYVDNSVb2Pfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719179133; c=relaxed/simple;
	bh=+sjSIfD0xw328RYswYEmbEzYV+qz6W+AObYb8jgCg7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPLLukcit35rlcQx9/7Lu7DBBNRU21O1Zbw9HBchGii3nSmtj8zYNrR0yqslUNriaqLALZk6QoJVRucWZtmMk7SrdM8ODjUwE+fIFQP0JebPAiyy7X5eEdAL4G7n8d96FUnpaWVXdQQS0riqcaBYax0S2es3RPBhCUMucn8rzPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UsCk4O/X; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52cdd893e5cso1465844e87.1;
        Sun, 23 Jun 2024 14:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719179130; x=1719783930; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+sjSIfD0xw328RYswYEmbEzYV+qz6W+AObYb8jgCg7A=;
        b=UsCk4O/XRnpLMVQbQV3TKWfSbYTI025RtH3cPH2oK0u3jFA61VJy/fTcHIih4M9S9H
         G6lsg9NT+VBI5E8RHbEXI0OlTukzGgaFvqG/8nxNH+duLE08242YTaAFNAfJeMIo+i3S
         HIp6+4VFiPQsFbreIxOK+IQEC+jeQsytiszc03FttplnIXHPlT8+w+THTRxxMPtV2AKH
         zx/b60Y3Yvy1xkZsXyA/V+1j2lshaHM9YiCucF/s/8dmsWc/4K4bIAx7CBDTra+YoSTq
         WCmI5gPKVhhQQOU82PbP3spVx9+2zDzkq0tV1WGp3fo74VHyFYYkCXovSZkIp0J+EPzI
         hPFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719179130; x=1719783930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+sjSIfD0xw328RYswYEmbEzYV+qz6W+AObYb8jgCg7A=;
        b=CfQgsscVyjb39wnK/NAZZQr95mpZfK/ywL0FNrHMxq8/BiDXz8Ytu8VF07fram/rHe
         ddaJZzvjBLrsjNYiGvsvp5syvgcZD5erA26ewky5zaljNJFSVd5McKHsEKeTfDJYm8yH
         l2vMPstYHWk25QmrN0736+/Sabf6Xwdx00nG7sb20dihPrZr5eDRngdWgINawFNxJL9L
         E2G8F0yyZPFZEfc00q5CxWdudcMVpqEDSGHWY+puf9TvBTuhXAkd84oOPIijf45JNjGC
         ZDP1R4DvZrgBsl+p2pZr0Lo2T78SOGvLTFTT3c2asCPbteuvtcrd5wAOqZyROLyjvum8
         7QiA==
X-Forwarded-Encrypted: i=1; AJvYcCW706gRtifXlj6SWFk9V+Kw1AiYLvJAj+9CjEiEXKIVOdSggataPjZ3B6to7b0WSIo86ch2WrwzSkcKjLjN/Hzt2pZwtGWxXlk4SRr313BDIwdJ3p1bZQppIQz6rrWKSvrenVWx9RwExIGRtywb8IJV2PFhEdGls6DAy9N7u/2rYe+HPWzQTiG6Eu/hZtLo4rGoR18uAQTC757H7wnGvko6i6mw7g==
X-Gm-Message-State: AOJu0Yy0a+LkJu8cngKbsHpRBBRUX2gZBDewTb1DgOE+aGVfyQQqxBJF
	Q+F1+dXGfwaN0EwMaRGt1zmYCyMsaktl/UjGmnG0hZZHd/LhGW7UWVYTNUzVk41QL6TEGl5d6EZ
	+FiEI+NAnvO927zsdSRaSCwb7xu4=
X-Google-Smtp-Source: AGHT+IHpKpsdK6P9VB/FJF8WQ6vBXhia4teldi0tFc5wr3ekqrpk5gj6uNSYZ/Dlc+A+Vq/eX1DxQOrhlL6jz1fZrVU=
X-Received: by 2002:ac2:4197:0:b0:52c:d76f:7f61 with SMTP id
 2adb3069b0e04-52ce186148amr1675888e87.56.1719179129793; Sun, 23 Jun 2024
 14:45:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621-b4-sc7180-camss-v1-0-14937929f30e@gmail.com>
 <20240621-b4-sc7180-camss-v1-1-14937929f30e@gmail.com> <fcdb072d-6099-4423-b4b5-21e9052b82cc@linaro.org>
 <CADgMGSvbK+8_QvtXSYrxdGjJFFzgtLPFtetMecBME_pCdoWzsA@mail.gmail.com> <12000768-e9bf-46de-9159-562d92470eb3@linaro.org>
In-Reply-To: <12000768-e9bf-46de-9159-562d92470eb3@linaro.org>
From: george chan <gchan9527@gmail.com>
Date: Mon, 24 Jun 2024 05:45:18 +0800
Message-ID: <CADgMGSv-GSQf83kyF3Cc0KhB_rba+zECS4=vgCz8FJ8K9CJFog@mail.gmail.com>
Subject: Re: [PATCH 1/6] media: dt-bindings: media: camss: Add
 qcom,sc7180-camss binding
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 23, 2024 at 7:10=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> Something like this
>
> https://git.codelinaro.org/bryan.odonoghue/kernel/-/commit/7626cd2a2a5098=
32c214e538827b91c5dbf1bf09
>
Nice, see if sc7180 is the first-runner-up patch hitting the mainline.

