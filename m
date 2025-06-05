Return-Path: <linux-media+bounces-34163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 190B5ACF62B
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 20:05:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 458D87AA020
	for <lists+linux-media@lfdr.de>; Thu,  5 Jun 2025 18:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2F0275869;
	Thu,  5 Jun 2025 18:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Sqd75kwg"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD45C4400
	for <linux-media@vger.kernel.org>; Thu,  5 Jun 2025 18:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146682; cv=none; b=W8wkJ7ks2T6YP7qQX9qOs0RjPPEok0E5whg7in82n1ffePe/bgAwyCqmbFQo7Uv2K67xhmBOSCBEjAYf10I64dbUmg22NW1ONjQl4dW8JokAsmF6bo/ZK+iDDXCRNXJHAMVMG+UHqCOb0IwuBU/p3aFVF1cTvP+qGrasF7ZltLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146682; c=relaxed/simple;
	bh=DshX3P50HVQUgJtke7ECoM7M1xI+yi7ruyYu+dvvl64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ANh4EzLEmC/dUhG4R7+VjBXO8TaLnUSF6dy82dIK5ZjU4S3eZ1j4mdL+QrHGtzQGDNdUTNzG7GsfDloDHQeoItlPs5XpzSZ13pgWh6lsZ4ccdQIcXZxu4JZt9upWa6kDP8yruD36CcmPzt2fQNlltvqYv10xlKU1K3pBsWM5VLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Sqd75kwg; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55324e35f49so1363114e87.3
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 11:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749146679; x=1749751479; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MpNR1Dy42Q17/xQ1tazKS3/gVCMeoisZacQChHchjfM=;
        b=Sqd75kwgr9oVuxloQ5aZHOkwJoAjbqT5clFed2iF0eytt5OF6iEd+mfwSQiyWpFsnR
         gdlXHpS3we+ikmBLbLD+xiWXCS/BlP3hhlQcD+GRTRZIG/AoYbiVTHhWGPQ0w3Ej5e7O
         Jt+pnOuCZibPXaigQJIzONA9aWqZ2VJ13lZo8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749146679; x=1749751479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpNR1Dy42Q17/xQ1tazKS3/gVCMeoisZacQChHchjfM=;
        b=Gu7AMwhjP5dvdZosq5YFkeGkXcQfSXrmsPbTDa8DSarViI8yid9LDAF6znh2fdHYYh
         oHxSs3n+Tqb6o1Tx0rxQkT9vje1E6H1YR0f3jUWegdSumzxpGNTjstFKQN3T68NETQ6F
         XV23m5BThckDlxTyTO52iHX1JFdl/n6fNL9WxSLeCmpl75Lcz3S0X+1M2SQ6eHbiKB6c
         MfpFtEMv5jd5NXmDWRkNdlmh8O29Kt56V0LTVKEHMsWEthdGdfF2cDrfkPJLTqpU9GhQ
         IjdPOvbxREhZ09OZEDZHqw7/nDA6FQusBc+b62HtR7tUQaW2y/1bGo0AilpFE50eCueM
         cF9Q==
X-Gm-Message-State: AOJu0Yzp5J7sv1ggCECJheUdJ+PHCOpUDtJz8QSR61RF9zlt3CVoMrjQ
	VwPn6OekQRF6sH+5DODmXNtBJCOIBpc9Ktv3cC80LkZ1t/xiZFSRAGrkO9yhJ8+nzN0V46/T31V
	yebM=
X-Gm-Gg: ASbGncsqwEuKJaCFMiRhl9j8ZXhn5BNiwnYslayscjsCNoEI/EYs5bouJFweVIbTh7o
	lIz236raeTS3Nef2U6sVFHucqjPV0JMLzSN8/gY8gmouAkB9LhA5Hyv1MQ1SDdJtdKRC9FiFYUa
	rOkqMha8aWKzlz7k6zlKI5rSZshBvqw1ZPhsfCNktygpbX186zETLbAaRJkPvHo9cc+3TRjWSz+
	KJKW64tL2HpW0vcg4Hz3uc7/KOZsOrGSStKJ7CiRHK/aVthJ3NtbEjGgToJ6gH4h3ALTd50GMV7
	UoUrz8FtOIqYQBqUsK0ncoYI0PpKU06feBl3jfEbBjgFEsQWAbJZxo5CylsVqP1UpmKwFdYmjTu
	X9KkkSw1HC9jJNG+NbOYzC7Kk
X-Google-Smtp-Source: AGHT+IHn5CdzyqG3iEdcwQqR7fLHJ6ePIj4T6y0vMJLZR1H9FeXJUP3lztxtj6+I82meDslF27OIPg==
X-Received: by 2002:a05:6512:4022:b0:553:2785:b2e3 with SMTP id 2adb3069b0e04-55366e33c9fmr23143e87.51.1749146678695;
        Thu, 05 Jun 2025 11:04:38 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553560318c4sm766613e87.199.2025.06.05.11.04.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 11:04:38 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so1357141e87.1
        for <linux-media@vger.kernel.org>; Thu, 05 Jun 2025 11:04:38 -0700 (PDT)
X-Received: by 2002:a05:651c:549:b0:32a:de85:4613 with SMTP id
 38308e7fff4ca-32adfce095emr995941fa.23.1749146677757; Thu, 05 Jun 2025
 11:04:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605-prefix-v2-1-4d797e89e29f@chromium.org>
In-Reply-To: <20250605-prefix-v2-1-4d797e89e29f@chromium.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 5 Jun 2025 20:04:25 +0200
X-Gmail-Original-Message-ID: <CANiDSCtNz+KCGpDaGVSucMeizajb=5gAdKnoEv9aFLGZhFXibw@mail.gmail.com>
X-Gm-Features: AX0GCFtpgNGVFjoGAxpBF6cdnAtqo6qoe9UiEkTwjGiUduc91g8Y5FfEM2YMSEw
Message-ID: <CANiDSCtNz+KCGpDaGVSucMeizajb=5gAdKnoEv9aFLGZhFXibw@mail.gmail.com>
Subject: Re: [PATCH v4l-utils v2] CONTRIBUTE: Add simple contribution instructions
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

For the record, this was mi git config:

[b4]
        send-prefixes = v4l-utils
        send-series-cc = linux-media@vger.kernel.org
[branch "b4/prefix"]
        b4-prep-cover-strategy = commit
[format]
        subjectPrefix = PATCH v4l-utils

On Thu, 5 Jun 2025 at 19:54, Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> In the media summit we discussed the need of a special prefix for
> v4l-utils. This helps patchwork and media-ci.
>
> Create a new file with a brief introductions on how to contribute and
> make the `v4l-utils` official.
>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes in v2:
> - Add git config example
> - Link to v1: https://lore.kernel.org/r/20250605-prefix-v1-1-450aff98308a@chromium.org
> ---
>  CONTRIBUTE.md | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/CONTRIBUTE.md b/CONTRIBUTE.md
> new file mode 100644
> index 0000000000000000000000000000000000000000..708939df88f471b085aafe2b79c9c6e1f044c52e
> --- /dev/null
> +++ b/CONTRIBUTE.md
> @@ -0,0 +1,23 @@
> +## Repository
> +
> +v4l-utils official repository is hosted at https://git.linuxtv.org/v4l-utils.git
> +
> +## Contributions
> +
> +Patches are welcome! Please send your patches to `linux-media@vger.kernel.org`
> +using the prefix `[PATCH v4l-utils]`. E.g:
> +
> +```
> +git config set format.subjectPrefix "PATCH v4l-utils"
> +```
> +
> +## b4 config
> +
> +If you use b4[1] for your contributor workflow you can use these options:
> +
> +```
> +git config set b4.send-series-cc linux-media@vger.kernel.org
> +git config set b4.send-prefixes v4l-utils
> +```
> +
> +[1] https://b4.docs.kernel.org/en/latest/contributor/overview.html
>
> ---
> base-commit: 0d4e8e2d4e2d9d87863222e03fd3a6a4a3ff3d86
> change-id: 20250605-prefix-a1a47dbdaa75
>
> Best regards,
> --
> Ricardo Ribalda <ribalda@chromium.org>
>


-- 
Ricardo Ribalda

