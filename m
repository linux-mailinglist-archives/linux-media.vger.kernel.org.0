Return-Path: <linux-media+bounces-4128-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3239B83A0AB
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 05:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAB0928A883
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 04:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37950C2D2;
	Wed, 24 Jan 2024 04:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MGPO/Z0K"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DD1BE61
	for <linux-media@vger.kernel.org>; Wed, 24 Jan 2024 04:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706071329; cv=none; b=tl1dO5qqIwtvS21Eu+4ua3aGzXXvmxXggYoOBwWbKSes4aaiC7ZupywSHJ5nsOMBS2M1EpBmiimw2Z1rteHqrfb34PUAAQeE1HyDo5iJTBHiF89N8TzqW+eTf2J9D9eXdgYSkIuwdPRvUVXnARf69rXm7QFWtMPgtQPCqv1Hwk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706071329; c=relaxed/simple;
	bh=e4pbeXom0LDWgqWdhVcGIXfmmhhjFqm1bArinBlRlsw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7/efuMV6s8SLWo+I6cm55ypRC/K1dWjrsNmqiV7M6hDxqw0mea1m7Jlb7tsb3RBGaJXT+XMOS3PS5VNn/WOzjbw8gvlbQ2fjyYwsxug5Xz2idDpBIupMg22Dl9PWCTogX40DULCk9ZY1/gbW5oUXvbsOCVLpcohE9BdajicSvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MGPO/Z0K; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50eabbc3dccso6277480e87.2
        for <linux-media@vger.kernel.org>; Tue, 23 Jan 2024 20:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706071325; x=1706676125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byZX8CNDQqxIAHkIYRFNHVe9vMPofE7buyvVj+0IE88=;
        b=MGPO/Z0KqYN22yNyx15VfWKOEQ9rR3/D0yYXWioWcEcVtUkqERgVe6akwYXlJSycVX
         lpFtpfEUlBd27W2B+bjREeRLGbRsiYXZvXhHLLRdbRkVMXPjI86W0Bq+fzUTxGjRgdiG
         MUq08EdEF9oZaxMKxL8JT5RoTZjj8awHwdM/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706071325; x=1706676125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=byZX8CNDQqxIAHkIYRFNHVe9vMPofE7buyvVj+0IE88=;
        b=PRK+Wi5Do0IHIRITFYHWUDH7JtzooTZuhAEiJv+JndcsSSkXcwv7iqinGdEPiDBQbc
         TMiWuI9BjtME7A74EPJghAjn9Ux9Q3Vn34insZC04DBC8bTcfYAPrzOPaaRDIZ8q1kwq
         j68uc8oWswM0F+YaSNt6sgVHZTR461hTI6Y/K4ldVjqB44J3wcd49CRGAv49vZ4nRc/u
         cOsFJ7lyGod3g4BYoWMcRDkqkxi3VaqUUAUKZ8s40JisAHhypLi5loHSA40hRqKNgUuN
         WOpCMyZHbDfbKs/R9RXxR6b3PXELjhYVichznDyAa0wTtKfMCHM3/fN5yWasedBx8SHc
         p2ug==
X-Gm-Message-State: AOJu0YwvFkoU4IRbyIcwzXEm4i+skSjnIiArEVRgOUhoxBeGRtT7l21N
	/k8XBNyBGlTc61WSNOzf2RbEmeTNloNwOLMwij4ms/+XsL0FWNNyigBKjQmsB8mZ1258PYrB5P3
	uig==
X-Google-Smtp-Source: AGHT+IEENHxhARByZXlo+ayHzVStne2/kk2CjNhNB4LpUHRc2ZksD4jUaisg6WowYHHGqsMTOOmO+Q==
X-Received: by 2002:ac2:5587:0:b0:510:56e:1f with SMTP id v7-20020ac25587000000b00510056e001fmr547051lfg.86.1706071324808;
        Tue, 23 Jan 2024 20:42:04 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id q24-20020a170906541800b00a26f0f49dd2sm15212710ejo.11.2024.01.23.20.42.04
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 20:42:04 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-337d90030bfso4404575f8f.2
        for <linux-media@vger.kernel.org>; Tue, 23 Jan 2024 20:42:04 -0800 (PST)
X-Received: by 2002:a5d:6290:0:b0:337:bba5:2d5c with SMTP id
 k16-20020a5d6290000000b00337bba52d5cmr73143wru.273.1706071323772; Tue, 23 Jan
 2024 20:42:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124033154.834344-1-jason.z.chen@intel.com>
In-Reply-To: <20240124033154.834344-1-jason.z.chen@intel.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 24 Jan 2024 13:41:44 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C+njoC=jqxR5GdpO39WH2TtURoP11HPo-4YtirtF67Gw@mail.gmail.com>
Message-ID: <CAAFQd5C+njoC=jqxR5GdpO39WH2TtURoP11HPo-4YtirtF67Gw@mail.gmail.com>
Subject: Re: [PATCH v5] media: ov08x40: Reduce start streaming time
To: "Chen, Jason Z" <jason.z.chen@intel.com>
Cc: sakari.ailus@linux.intel.com, bingbu.cao@linux.intel.com, 
	linux-media@vger.kernel.org, andy.yeh@intel.com, qingwu.zhang@intel.com, 
	senozhatsky@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 24, 2024 at 12:33=E2=80=AFPM Chen, Jason Z <jason.z.chen@intel.=
com> wrote:
>
> From: Jason Chen <jason.z.chen@intel.com>
>
> Because video duration involves calculating the streaming time, and i2c
> communication incurs too many XTALK register settings every 4 bytes with
> i2c START and STOP.
>
> So we have opted switch to the i2c burst method.
> This method involves writing the XTALK registers in the order of
> the register block.
>
> The start streaming time can be reduced from around 400ms to 150ms
>
> Signed-off-by: Jason Chen <jason.z.chen@intel.com>
> ---
>  drivers/media/i2c/ov08x40.c | 1208 ++---------------------------------
>  1 file changed, 56 insertions(+), 1152 deletions(-)

Thanks for addressing the comments!

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

