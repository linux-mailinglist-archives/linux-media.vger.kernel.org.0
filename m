Return-Path: <linux-media+bounces-51579-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOYTMv6Fd2m9hgEAu9opvQ
	(envelope-from <linux-media+bounces-51579-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 16:19:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 304738A083
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 16:19:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE9B63081E05
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 15:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C9D133EAF8;
	Mon, 26 Jan 2026 15:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fE0KikZp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7660329E4B
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 15:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769440540; cv=none; b=C7QikV7aEPmmMsLM3mo29oeW5T7azDgSFaKK/qnePN/M5K2mZrE052egE7Q9YUmCDaULZtE+zP998MSebF917sBxNbU6Pp6dC+ZjVdvXevkg8E/PLqcN2Jw9G/YyQJ+FHI/fAQG0NKHs2XJCxHnulVuSGgehayK7bxL93OI2uT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769440540; c=relaxed/simple;
	bh=FC7X5zPYMI/o32zsBSUmBvAhD6KTKw50hOGSh5dNAj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QJwA/aylUbZz4HlzoBYvrKWqq6PrqJomPoh85DWPmtp425ami6Wt4RUor4NL8JcuEf+xkZbEDse33NPrXG1pf6qo05ezWF+J3a7Y45btHKwhDEuRy81aobmetobzZQ0Df+x0OJdaPbwXqy84AoBRIxCq0MWpPvxjyw20bfN/8p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fE0KikZp; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b87f00ec06aso734166366b.1
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 07:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769440533; x=1770045333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4t5aplmA3nTqsGBEOpCKNqLj2NzSX0vQ+67pQX8dHuA=;
        b=fE0KikZpBdrFIGm0jCwNgLxXZnvq2yGIQMbGrBjd4XVG0tTigK/8/HrODlOgs0iSSa
         oxviLwRWjVmdSmsBZtWpsSoP2ysCPEubCtx2erBKSwWmVlhLqApKjjG/AxqDwFyy2iet
         Buq5tc+6kqAKE/Ug0GWdGcIYXii5PPaFzD4dI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769440533; x=1770045333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4t5aplmA3nTqsGBEOpCKNqLj2NzSX0vQ+67pQX8dHuA=;
        b=uLjyS+x006X9FKTN/fe0IhYPC4HyBwi3fGItMnaVokGsx4GUU5mZSRA9Piio0VZp1z
         P7CxqbHjwzn3DbiHLUFtwZlKItpL+OFs5r0KftaImMivlvZo0GTYol19CiaPWx0+7nNc
         T/VGaQiBLeTA8fS0PzBZOziewv+8oghaT+nCyJJq7nUZ6HaTcqf5ADwMCzGF7qiSPv6/
         u1a4XCCnLN5X6pq2eqtu6ENadJA7nxWhwaadlWLJf92EVQYF1oHIyoFJRPuNsTAuk0uG
         XFpY8HP5Lxqv0FWhA7/gCIRmlZrZuJLaT5EhiRpFZD5D8FuIwHLTCypBHXkqNcBQcYmr
         IdXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlhxbgp22iasDiiCVqKb1UUWAzyN3fdKXuiTCHgAyTnv7S4P65SyDjednoI4LbW6UQWxyAjho1bGJ+1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5EDNWCrYTV7c8PjL4klfzi+tW8tXLzV9SmVHoI3490+3XjWT5
	j//S8RhX2Pc3uJS0feQdFU/FD8jl/p2Udlt7Nzf7zjkMpsI7mY/Z/ep0guEgYEOUAE0z5kBd21V
	yCT8=
X-Gm-Gg: AZuq6aJr7OMJVvhYIBKuYoVSlr8Yfn0YnfeIV41cG4O1tm6CdWROqeLB2wUHYqoDbWG
	mI3NU2tZ1hWqg0ECkiLwQBmlMVX9V/PcKZ3oeeOFr64LHuIF6+0W1UUVGgzXYQYN9ep4InIOG1r
	7OZxQHHkdaIDO/XiKOIVe/6rnnUPaBSeAOONyTsl++zvUjSKXQmlTu92YfBuAtjml6Lyl/Gyant
	84lQ2jHlCF67i2UbUYr3ycDBc+aYCuI7gPyPWcr8T/UlvblS1njrnkgG6v0K9dgnZ1321Lil7Vp
	XcSwZFRa4qvIVXcHzHAZ2CfgKuNk8L1mJg9nkxHAlS0Ec92gDXUrkc2GXvq1LBneOKyrlSxQv6U
	9f4bED27gTTPDck88w0DhuIBOxtmly1kcgI7bll+0Bang0QIS1pod2z5cGLPDXfdjX1ykUfc6/B
	JnijABVpE5OYZ4G0ifc7LfUkZhFmLo4pkmZ6pp8wawYWDHZ5gMjQ==
X-Received: by 2002:a17:906:f5aa:b0:b8a:f946:f7cd with SMTP id a640c23a62f3a-b8d20deb721mr342572566b.21.1769440533055;
        Mon, 26 Jan 2026 07:15:33 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b445747sm637101466b.30.2026.01.26.07.15.31
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:15:32 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47edffe5540so53100325e9.0
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 07:15:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUt6UeZlNgXOxqu28GzClN8NsqDOZouf5IbmO9YRYSSDZUhgjmLiXNhZcBMyKvydQ2P8Js4gzX4QWQ8RA==@vger.kernel.org
X-Received: by 2002:a05:600c:3e1a:b0:479:1b0f:dfff with SMTP id
 5b1f17b1804b1-4805ce4e55dmr85307405e9.10.1769440530557; Mon, 26 Jan 2026
 07:15:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-venus-iris-flip-switch-v2-0-b0ea05e1739a@oss.qualcomm.com>
 <20260126-venus-iris-flip-switch-v2-1-b0ea05e1739a@oss.qualcomm.com>
In-Reply-To: <20260126-venus-iris-flip-switch-v2-1-b0ea05e1739a@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 26 Jan 2026 07:15:19 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XmnJb5_hJ_NvAMMQExZb6r2P8Z4hTSfUiqit+-LYpYKQ@mail.gmail.com>
X-Gm-Features: AZwV_QgSxLFN0B5kCSZpCHaocJhmPgrGrSBW7Fb0Ju5fp6s9Xmzf9QgNaOY6xDU
Message-ID: <CAD=FV=XmnJb5_hJ_NvAMMQExZb6r2P8Z4hTSfUiqit+-LYpYKQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: sc7280-chrome-common: disable Venus
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	"Bryan O'Donoghue" <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51579-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email,chromium.org:dkim,mail.gmail.com:mid,linaro.org:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 304738A083
X-Rspamd-Action: no action

Hi,

On Sun, Jan 25, 2026 at 6:09=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Iris driver doesn't support non-PAS/TZ setup for setting up the Iris
> core. It's expected that the ABI that is going to be used in a long-term
> would be different from the defined venus-firmware subnode.
>
> Granted that the SC7280 Chromebooks were cancelled before reaching wide
> audience and granted the feature ABI changes, drop venus configuration
> for SC7280 ChromeOS devices.
>
> Suggested-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 11 -----------
>  1 file changed, 11 deletions(-)

As far as I'm aware, anyone still using a sc7280 Chromebook dev
platform doesn't care about the video encoder / decoder working.

Acked-by: Douglas Anderson <dianders@chromium.org>

