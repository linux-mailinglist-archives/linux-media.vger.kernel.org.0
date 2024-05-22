Return-Path: <linux-media+bounces-11731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA7E8CC1A3
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 14:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 396791C21D0B
	for <lists+linux-media@lfdr.de>; Wed, 22 May 2024 12:55:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330E882490;
	Wed, 22 May 2024 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SRIXtvL4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF40EC7
	for <linux-media@vger.kernel.org>; Wed, 22 May 2024 12:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716382505; cv=none; b=kyO6YmoyjTrxUEySpWPdieNzxKrUY4Zhfic7m9vaMgRzinaZws7lhIcwLeDPFszFI5ofDofn2DfBaJMprIUnNyqeZvRJ6rDi94nX60b4TmpTkiP9QstTSOYyrP3RczjBoBBDTetqPVFGNbCVyS3hHl+PnnJ0Sb5jikxHsNWKenA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716382505; c=relaxed/simple;
	bh=BinNhgcEH42gS3lWUSSUP7U6VJyoBPjo0uHCGJBaX60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I6hZb+5avUksLvmZKJVKUrmoAnrXH7IpXeWZHTidISGlaO8atR9PPKbjnNnKM1G2o2MiJ06MdxFq+SOhR5aA5zX/NzBVn9dmbOR0DmoTxBf68A8jL72JYI4mzQ7zzZkaoZ8JcE7Bk5ZO0uuNHR0/TBMMAjlu9g1JDuAZGzCXSyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SRIXtvL4; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-69cb4a046dfso21392596d6.2
        for <linux-media@vger.kernel.org>; Wed, 22 May 2024 05:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716382503; x=1716987303; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qRSyPLhJtHsuvnS9t5bdddtQaBryY+zRRpKLYbkoicI=;
        b=SRIXtvL4/+op/Ozs+juw7HgT612PXGoyjLKRmE/usQ2zEfhKX2t+IdyYxQOJ/xpwhc
         u/Ji8EXUlmNEggOdnMaArW0VJcjc6qAIyawtonvLb8fr3u+r9yt3wc2Ho19vwb3zRAR+
         y8yd/XzWhjjw/PFkEkB75Z0kD8JNG0zh2VYls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716382503; x=1716987303;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qRSyPLhJtHsuvnS9t5bdddtQaBryY+zRRpKLYbkoicI=;
        b=JOoTrrxs6kQaahMAt0QAsi6LcvZYpdXYMHb5ItEnnVOsnSh/iYN3B6cGlqtO2e7vkc
         wpZEKzXWdOMKAhypYGrSUtFOvBnv7q7/kvrXYZzOF8Hikhz1Ijn7KHfe590wOEOf2Smu
         Es7wngPnut3+sOJVNmGbaWMLHBepHqL2oulTzvbffvFkuRbwMm8SDUK4rPKOCG7dd+Si
         pB0WzS1S79uAuuL4+T+KchLGUxVW+XqxjwdkFr4bETXs9O41RBI531Empqbr4g+UY7Vf
         U0hv2MHGge+UPWxLQlKchumiRhtRBL+H3AGpF57QUIEa8wF8UTwbeIKHaBnLjd1OcbT6
         WeOA==
X-Forwarded-Encrypted: i=1; AJvYcCVEPmb/hnxHFme8ZmVC1Qadan0SgxWiLeKwIXJqhcVGbASRUnXpYwq/Us212I3p2Qj1uvs2YZrrQJdp20vBR/lH+RQv1kVamIMGT4o=
X-Gm-Message-State: AOJu0YxCqIiF43k83Z6ZWuElwu9V54hWCPInnideP9dMOGA+rEwhfXtF
	mArdBMaJNlfjP+spUpyK/J//Sp5dHsj4vdQJ9rfoB3r3LVX/ykOZzBZi6q41MjYvlU17gteyZ3A
	eNA==
X-Google-Smtp-Source: AGHT+IGTM6p+stFx6nNbxtEOQWjUj7VJhAkMw029DdJ8bpoWBayMgTsH9AIjNdREYXBvE0Dim0yFjw==
X-Received: by 2002:a05:6214:458b:b0:6ab:988:c7d5 with SMTP id 6a1803df08f44-6ab7f35f901mr19284906d6.26.1716382502735;
        Wed, 22 May 2024 05:55:02 -0700 (PDT)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f185491sm134505276d6.43.2024.05.22.05.55.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 05:55:02 -0700 (PDT)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6a8691d724eso7788536d6.0
        for <linux-media@vger.kernel.org>; Wed, 22 May 2024 05:55:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWlgziL22nySprrC1xUVm6OCM3zil2h9hCZKJAfBJZn9KTXZiM6NxE65df8oHRU9hXkXEax0a0pyWehdSPVF1vGKMlmof08Udl5Bqw=
X-Received: by 2002:a05:6214:3903:b0:6ab:6c2e:e425 with SMTP id
 6a1803df08f44-6ab7f356954mr17023246d6.24.1716382501399; Wed, 22 May 2024
 05:55:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
 <20240507-cocci-flexarray-v2-10-7aea262cf065@chromium.org>
 <284a3096-cc2d-45bf-9075-fcd1bc60a599@linaro.org> <96593105-0ca3-43c7-86da-7a059cad287f@linaro.org>
In-Reply-To: <96593105-0ca3-43c7-86da-7a059cad287f@linaro.org>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 May 2024 14:54:43 +0200
X-Gmail-Original-Message-ID: <CANiDSCtpSQWfe8Jj=L__kYJa74N7KnqMeaW0=cGzagMtBrHiUg@mail.gmail.com>
Message-ID: <CANiDSCtpSQWfe8Jj=L__kYJa74N7KnqMeaW0=cGzagMtBrHiUg@mail.gmail.com>
Subject: Re: [PATCH v2 10/18] media: venus: Use flex array for hfi_session_release_buffer_pkt
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Michal Simek <michal.simek@amd.com>, 
	Andy Walls <awalls@md.metrocast.net>, Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi Bryan


On Fri, 10 May 2024 at 02:10, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 10/05/2024 00:37, Bryan O'Donoghue wrote:
> >> -    u32 buffer_info[1];
> >> +    u32 buffer_info[];
> >>   };
> >>   struct hfi_session_release_resources_pkt {
> >>
> > Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Oops no.
>
> Please don't change the size of the structure.

In this case buffer_info[] is a real flexible array, so there is not
much we can do.

The driver seems to only uses the structure to address memory. It is
not allocating the structure or doing any calculations based on its
size, so it should be fine (famous last words).

If anyone has access to the hardware it would be great if they tested it :)

>
> u32 buffer_info;
>
> ---
> bod



-- 
Ricardo Ribalda

