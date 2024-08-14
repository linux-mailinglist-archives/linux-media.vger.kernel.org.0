Return-Path: <linux-media+bounces-16274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC16951627
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 10:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1EF71C213FE
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 08:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935C513D52B;
	Wed, 14 Aug 2024 08:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="n5VMP++4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B2F13D2A4
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 08:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723622837; cv=none; b=A+PHUXwwJUUOxMbriGPXrwHMSyjZdW47eJn8ZU/OoesIVA7eC+g7aeFBIhMG1xLwsLHU9HB2trH1RYgnhuFM6M7lAfGjArigDe+WLPXNmICc+3XKFwJ9RSl5RacTSEPgu9CDQNYPo1ER+cAqzxnaqmtTZbSHMr+ukrj8cyFYDZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723622837; c=relaxed/simple;
	bh=zl6oZ0yQ2AuljC/+g5tdcuw5JSm8FT8fOqYmulxxhYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MyLzfE0jpmFsC3jpTcKNHtdxwBDL3+GU5sPJaxGTl8FKtktZTXksugH5mfJdsnhB7ky2coz/1w0TjXHqsmxHTRqt4fpKm6qfCWALFxj8urwYzAMoVlXMIiIHDK6MQYTs7lUNOB8/HsJ5IWkDw1kCjaInPq5dN9T0+12QmAH8lV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=n5VMP++4; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52f025ab3a7so3297455e87.2
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 01:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723622833; x=1724227633; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NZJa2A/wBP2dRUmaz/amMD5VJoMLHB0MhQTzcG7HnQo=;
        b=n5VMP++4UMaYIBc/laDUSYRXlDlBaHzdShPyB+CkWSVGZ25N6lT0g6y9TQOCziDvW+
         BSUQOSGOn7QTe2CN/1fuO/YabjmTxPaevMLcs/9f2fMA9mhVo7FVh51VM2Kd8/Pu5CC6
         KbHokZyPkJJ+ypHweZKXrBKZOPVlaqh/ttcmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723622833; x=1724227633;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZJa2A/wBP2dRUmaz/amMD5VJoMLHB0MhQTzcG7HnQo=;
        b=HYJkizKRt6l/9n456VhNbJwS7cAiQ3hSECM0TFXyxhBdgKeRTIe7t9Wu5A2XgQ3T9r
         ig/Fn/JZsWFyMz2/JxQ1A9FI82C44FJ3G+xcKHy/YlAE6WhFTnYMZllBwFrR0gVugQC4
         MgWkeb4LTTOAcQX10/fa3twgOmUIpwr1OK3lFLG8X8hdpbnGApgetTy0DmsqAClfCToF
         66vIk/ai1DjTQVWaRetYtc0AvkcNltum1ZiOIh+ANytwA5NU2YnygLrB4qttHU8W9yIK
         pmY3ufqa2iMaKeogECcJ5xwo5gduK8//OpsFcHTIJFXUW8Lc8kEU/xIVNv5+/Uq7gQ83
         kX+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiAW+PyHft3yIGMKJ7KDs/H8f7d/Li0W31n80FfrFc/shRKAQ3fhrkfQv6xJr9xJnv6tfiyVJOcAnixgB3ZpesZq4JGP2fiKSiRys=
X-Gm-Message-State: AOJu0YzWT6v9H3enR4eP10WLh+HMquH5nTRxK/uxbRZvgq0jGacQLAwd
	J6G+reNbdoJWgURyBmTtn+3xJyJ61pmA2sp7pIveRn2s4qkqWnUGYHdAzVySIUiYEua23ZNaVAK
	40pTC
X-Google-Smtp-Source: AGHT+IHMS1DZYN2u/p1d3mbC6K/ZJ18oVWY0nw2vQwVjMuE8MTFvOdaRLVkJKdvFnJmarBAF7V6Qeg==
X-Received: by 2002:a05:6512:b93:b0:52e:fa35:15a4 with SMTP id 2adb3069b0e04-532eda81aadmr1217106e87.33.1723622832861;
        Wed, 14 Aug 2024 01:07:12 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200ec3b71sm1209220e87.118.2024.08.14.01.07.11
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 01:07:12 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2f0dfdc9e16so74130061fa.2
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 01:07:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9DuasiJCtb/EIHSkeqfeZHrsJK2h3MsOLAcsiFs+5Xn3inYNwRw3lSV6euvJS8veHnerEiCnApBx9O7ZdB97zGCTds9BHqNx+YCw=
X-Received: by 2002:a2e:9898:0:b0:2f2:b2f7:c8a3 with SMTP id
 38308e7fff4ca-2f3aa1fe717mr11203131fa.44.1723622831290; Wed, 14 Aug 2024
 01:07:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
 <20240813-cocci-flexarray-v6-10-de903fd8d988@chromium.org> <20240814044138.GA8686@google.com>
In-Reply-To: <20240814044138.GA8686@google.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 14 Aug 2024 10:06:58 +0200
X-Gmail-Original-Message-ID: <CANiDSCt2qEtA8_PFtCLz9uSsY2TWSa5W2tOZVt=TrdE7A2Z8Tg@mail.gmail.com>
Message-ID: <CANiDSCt2qEtA8_PFtCLz9uSsY2TWSa5W2tOZVt=TrdE7A2Z8Tg@mail.gmail.com>
Subject: Re: [PATCH v6 10/10] media: venus: Convert one-element-arrays to flex-arrays
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Aug 2024 at 06:41, Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (24/08/13 12:31), Ricardo Ribalda wrote:
> >
> > This structures are not used
> >
>
> Why not just delete them?

Byran preferred to keep them for documentation purposes
https://lore.kernel.org/linux-media/0640d530-404d-40cf-9737-0d7468dd0177@linaro.org/T/#u

I am fine with both options.


-- 
Ricardo Ribalda

