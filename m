Return-Path: <linux-media+bounces-15022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3E59312F1
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 13:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D0151C2148E
	for <lists+linux-media@lfdr.de>; Mon, 15 Jul 2024 11:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6CE1891DC;
	Mon, 15 Jul 2024 11:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MVnXAzCs"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AED13D8B1
	for <linux-media@vger.kernel.org>; Mon, 15 Jul 2024 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721042282; cv=none; b=WfCjMHd/ltnZ156g/PDI5x2kbRZty8odin5lRd4zUYs/y17bfw2qgGXztZE2tDxQdrs/OXHF2ESuoqA7ppZe+NVgtiKkSMcb+qZQd01TxBbvB57Zz1DP1CsJ9HefAw1z8me1zghEsbAos3HTEg1PCceD7Gno8t6intaz6M2KJ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721042282; c=relaxed/simple;
	bh=F6nPlNFjvSL5hHKaGrRmsMQTJQxHkN7LmQRO1aSkssc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+/rniFtdemlf+bKRv7fvSQaSNRsjgLG1c2SO+9Pvr7pQUfyuagfJAil+dJ1JAiV1+0m0iO75FmYrTyHY/3Dn2sx25sDDRkBwrQWJYHOdr50u1y7UshAudLDKENxRs6tGboSlUD0fKwI9WWXJXTvaJiH6SAcI69QDC0U4qplP8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MVnXAzCs; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e057c25dd34so3728462276.2
        for <linux-media@vger.kernel.org>; Mon, 15 Jul 2024 04:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721042278; x=1721647078; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0nsMHYvyytvB0GcQcRWQhieGQMx8L/l5mGgk1F9IiI=;
        b=MVnXAzCsfhZEPtwFLcMjltELzRMY6ApC2/zYeBWgQikVmyAgeNjO2NdYGynJ5zSkrL
         RunPhGA7Xw4F3hlby5PHbTSXEDypY+ehP4qzEuoBrza3UdA8+6acQyY/sjxMVdTGtNw+
         Oq5SlKdBfqK657Q0s0F9u1QItDvMDAMTS5pTnB3O1CDfdvzGtlytVtQpyvaJfsyuaWiX
         jf8IKo/ALPOKnFOpiW6UIpV8A7/Zj+kzRa9Zg7EVmPWO1axcg3dqZD2QUovC7mpdihME
         foGJ3LYKAq2UAJBqHae4oZpWDAVSMPQYueO9OgAVVK0wXpt2J54XEEhAKiBHBhCqvf27
         sXYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721042278; x=1721647078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0nsMHYvyytvB0GcQcRWQhieGQMx8L/l5mGgk1F9IiI=;
        b=D5yrwZUfx2106R8UW9aWIc1fmew+P45IZ0PcostYl8g0wp+LCrfU4nx/wU5IF8aJer
         0kEAKX7lbl/G8SyrA6bEZhXn4yylv4JpmZ6x1Hdbbq1d9sePttXGy/ASEYoNs4PYMkaB
         Nu2RnBe4BJYrAtYoglWs1Ko1dXG0uFEwSWS1EMi//gFE9YlqW/WgvgwldJDvzI+4c4FJ
         gs6ADMzoE+uE96NnfGs5fG5pUoe07FJ/+rhGbiQh5jyQjbiA5Q5QvazwXvET4rWe3cqF
         FdB0PSP8NLo18BpchgjHleO1DLXTVIvt/jTbSury0DZZpX+h95z76tYNgUogmwA0rZ6n
         uyjw==
X-Forwarded-Encrypted: i=1; AJvYcCUF09kNkF9aOkWAylg1js9FL2brZqyhkYHD0z1XGQjOdFjcrmpWQI1g90tMIc2vSZhRMaC6rWRHi9j3BCVBr4Q6SsLNWXXzZX2vCBU=
X-Gm-Message-State: AOJu0Ywb4gpwd3dWz2/r9GsNPgoYEVjBn/qSbTNVbkZ0sNk93WHyaTMs
	cyJLqPNC0MVo8Ep0q2b251btlytsjFmB5SCJZ6S0fMeswGZtM3+cqhfg119p6rJjyS3++oE0V5i
	YVaZCRgovsWyYS6JzKdAFGkQeTAcZ5Kvoh6jQnA==
X-Google-Smtp-Source: AGHT+IGLXkpZxf5SwZRwilp0h5f1EqxnZ58jIcQl/Dg8fhJhziq7OC9pG7TnHNdfC3tUtLirO7j3kKAjrv2vNsA4rao=
X-Received: by 2002:a25:7408:0:b0:e03:34ec:16b2 with SMTP id
 3f1490d57ef6-e041b11d31amr20722985276.42.1721042278123; Mon, 15 Jul 2024
 04:17:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1720763312-13018-1-git-send-email-quic_dikshita@quicinc.com>
In-Reply-To: <1720763312-13018-1-git-send-email-quic_dikshita@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Jul 2024 13:17:22 +0200
Message-ID: <CAPDyKFosMMAWfiEvpaXHn5X+fEL=Asi=o-YEa9Hj5AYzyoRcHg@mail.gmail.com>
Subject: Re: [PATCH 0/2] add device managed version of dev_pm_domain_attach|detach_list()
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jul 2024 at 07:49, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> These patches add the devres-enabled version of dev_pm_domain_attach|detach_list
> in pm domain framework and use the same APIs in venus driver.
> If any client drivers use devm_pm_domain_attach_list() to attach the PM domains,
> devm_pm_domain_detach_list() will be invoked implicitly during remove phase.
>
> Dikshita Agarwal (2):
>   PM: domains: add device managed version of
>     dev_pm_domain_attach|detach_list()
>   media: venus: use device managed APIs for power domains
>
>  drivers/base/power/common.c                    | 41 ++++++++++++++++++++++++++
>  drivers/media/platform/qcom/venus/pm_helpers.c |  5 +---
>  include/linux/pm_domain.h                      |  4 +++
>  3 files changed, 46 insertions(+), 4 deletions(-)
>

This ended up being a little bit late for v6.11, please re-post a new
version when rc-1 is out.

Kind regards
Uffe

