Return-Path: <linux-media+bounces-4811-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6012E84C9BF
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 12:40:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA1C51F23A04
	for <lists+linux-media@lfdr.de>; Wed,  7 Feb 2024 11:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85FC1DA4C;
	Wed,  7 Feb 2024 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C13xIH7T"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD011B297
	for <linux-media@vger.kernel.org>; Wed,  7 Feb 2024 11:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707306018; cv=none; b=Koca01d6AQ34Q+knTCjHf0xXRxMia+FXN5BnvruYZ2tf6f8PX1S5ESy/agBPRT/J6grqzIAu948RCdn3fq2wt4grAyTJPwnDMLiIRawza3C7ieBemhqJpHEghWpwtWcorayrn6SI4cicSJk7OB/9A2edDTKc3weKxDCMrRXu0kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707306018; c=relaxed/simple;
	bh=j2hucPWlt4QARh6EpWCHZVZmiT27JEZfL87REB11SSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYtb30wNmWpWkqpApfbvDwJl5KnGRGaRHD/diWGdGgLD48/jS6dW0xmjF6iLXVvyuDDjcfhmFpBDA7ZQJIQG0SUJz7hdtbXpOeC5wgcvZjkCRMCyJgh3UigqPefZ549I4qXbxPDtParDum8268zxeXLFEk7xavMjsQ3oVchumQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C13xIH7T; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-60406f4e1d0so4958657b3.1
        for <linux-media@vger.kernel.org>; Wed, 07 Feb 2024 03:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707306014; x=1707910814; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YGulZCD6+zMcYgPZs795MTY99+l/D3vsNxyEgcJw+h8=;
        b=C13xIH7T3/Dq+QRnt/A4mqHwsZtbVadlk1ady5NDtyOg0bUlIQUuj/iuVUKH/3lBx9
         04qGXSf5tWeNVXKzot/q6rHR4zXyxR6mdCeohT/ANOKsAWHhdMn13c0Z0Ms80CG2UU/z
         esaVWnu4eIbvfKcZj0ITfLhZkJfhtFyW0UdMr6h5jn3PfHts5RlEsf5T9JRQ/zOEZcn5
         ar5ufFsEaa3pxzXwO3hD982agh6gjma7LJ08B9+wqRVnEHgcOOu0aSLTw1hg/gnTQ7SG
         OBQeQggZlxzWdf5HXrFmYznwxlbynZV8iBrLkpjzsWxMAhqaUUDNoINV8LNpFo4727lo
         7aUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707306014; x=1707910814;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGulZCD6+zMcYgPZs795MTY99+l/D3vsNxyEgcJw+h8=;
        b=ZskVGM1L73Ucp/lKyvVKgGQCb87lWwx/qoCAiA5B9bWDpcWITHNYTMWkFcsq6i27m+
         bBVqy14J97b2SB+aygHd67KXA/3xEWum5zT/U25JoAQukSnHCakZwnYTgPKyCriZVHC+
         6v5BZUHwInebuN7c6+xYekIEaY93CM1pp/1lGj15q2pEkYCPUslZkABP7qibzusOKRev
         S4mKWaImszAkG8F2tdx4SXPWwVreZhg8v1oZTrQCi7JWWWzTlr5N0CP3EetKS2w2uM3w
         V+Cj+mWfToIK038qU9Jp8T14dsZZTfx9XP61H3q2fl/RGirD/VekBddp4Icfho/h45t8
         BJCA==
X-Gm-Message-State: AOJu0YyTg8QZDpTuhqnT9gZpZ9fia36HWTKgQVWmJm15vTA+ozlx0yoA
	UmUO2ySLHlWqBhw14aIMJHSsA/ZgDdnY8aNvvBbqCVOv467y4PanTjXcIy+D1TZaoc09cRi9ijF
	m0Nz0K7jdJdlklLQIx39aJoJKrB9IQ3qnKQ0+rg==
X-Google-Smtp-Source: AGHT+IHcJYp0WTpeyXfA6/v0KQqS2+K+bFf4BMoXAxddY+rgyz/NFtVQ2CSaJeYh5kLZrQX4DemLxRgcf++7/oAjGa4=
X-Received: by 2002:a81:9b4b:0:b0:604:926b:94a9 with SMTP id
 s72-20020a819b4b000000b00604926b94a9mr1274134ywg.26.1707306014489; Wed, 07
 Feb 2024 03:40:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130123951.236243-1-ulf.hansson@linaro.org>
In-Reply-To: <20240130123951.236243-1-ulf.hansson@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 7 Feb 2024 12:39:38 +0100
Message-ID: <CAPDyKFruKJhOLRLbxibF3ChDGMcJDvdOmCekRNTDYunbnKgQpw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] PM: domains: Add helpers for multi PM domains to
 avoid open-coding
To: "Rafael J . Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Kevin Hilman <khilman@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Nikunj Kela <nkela@quicinc.com>, Prasad Sodagudi <psodagud@quicinc.com>, 
	Stephan Gerhold <stephan@gerhold.net>, Ben Horgan <Ben.Horgan@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Jan 2024 at 13:39, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> Rafael, my plan is queue up this series via my pmdomain tree. Please let me know
> if you see any issues with that, especially around patch1.
>
> Updates in v3:
>         - Added tested-by, reviewed-by and suggested-by tags. No other changes
>         have been made.
>
> Updates in v2:
>         - Ccing Daniel Baluta and Iuliana Prodan the NXP remoteproc patches to
>         requests help with testing.
>         - Fixed NULL pointer bug in patch1, pointed out by Nikunj.
>         - Added some tested/reviewed-by tags.
>
> Attaching/detaching of a device to multiple PM domains has started to become a
> common operation for many drivers, typically during ->probe() and ->remove().
> In most cases, this has lead to lots of boilerplate code in the drivers.
>
> This series adds a pair of helper functions to manage the attach/detach of a
> device to its multiple PM domains. Moreover, a couple of drivers have been
> converted to use the new helpers as a proof of concept.
>
> Note 1)
> The changes in the drivers have only been compile tested, while the helpers
> have been tested along with a couple of local dummy drivers that I have hacked
> up to model both genpd providers and genpd consumers.
>
> Note 2)
> I was struggling to make up mind if we should have a separate helper to attach
> all available power-domains described in DT, rather than providing "NULL" to the
> dev_pm_domain_attach_list(). I decided not to, but please let me know if you
> prefer the other option.
>
> Note 3)
> For OPP integration, as a follow up I am striving to make the
> dev_pm_opp_attach_genpd() redundant. Instead I think we should move towards
> using dev_pm_opp_set_config()->_opp_set_required_devs(), which would allow us to
> use the helpers that $subject series is adding.
>
> Kind regards
> Ulf Hansson
>
> Ulf Hansson (5):
>   PM: domains: Add helper functions to attach/detach multiple PM domains
>   remoteproc: imx_dsp_rproc: Convert to
>     dev_pm_domain_attach|detach_list()
>   remoteproc: imx_rproc: Convert to dev_pm_domain_attach|detach_list()
>   remoteproc: qcom_q6v5_adsp: Convert to
>     dev_pm_domain_attach|detach_list()
>   media: venus: Convert to dev_pm_domain_attach|detach_list() for vcodec
>
>  drivers/base/power/common.c                   | 134 +++++++++++++++
>  drivers/media/platform/qcom/venus/core.c      |  12 +-
>  drivers/media/platform/qcom/venus/core.h      |   7 +-
>  .../media/platform/qcom/venus/pm_helpers.c    |  48 ++----
>  drivers/remoteproc/imx_dsp_rproc.c            |  82 +--------
>  drivers/remoteproc/imx_rproc.c                |  73 +-------
>  drivers/remoteproc/qcom_q6v5_adsp.c           | 160 ++++++++----------
>  include/linux/pm_domain.h                     |  38 +++++
>  8 files changed, 289 insertions(+), 265 deletions(-)
>
>

I have now applied this to my next branch to my pmdomain tree, to get
it more tested in linux-next.

Please let me know if there are objections to this or if any of you
want to provide an ack/tested/reviewed-by tag, thanks!

Kind regards
Uffe

