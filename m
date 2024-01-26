Return-Path: <linux-media+bounces-4226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD3283DE62
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 17:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3740F1F24A0B
	for <lists+linux-media@lfdr.de>; Fri, 26 Jan 2024 16:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEEAE1DA2F;
	Fri, 26 Jan 2024 16:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BeIACOUa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FE11CFB5
	for <linux-media@vger.kernel.org>; Fri, 26 Jan 2024 16:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706285573; cv=none; b=KkXwyZkC0PbV5bm8pDujk42fMiuxFViD+IN4J7uDXUx2zOAFuzhZ6pnzVnH7MVGEz1JqMp6X1piDr0EAtLVActaKwyRwLRZnT5iwqLYW9aCX/hxutbM6qeC3jR+mWBC+p66sJE0uH8wdqJxTwF6Y+Lh3GHMeQ9bqvwWacYM+rig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706285573; c=relaxed/simple;
	bh=NGUuwyDUt/V8BbgO0Ikz6ekMH3s9pITV7aBg2GJNeyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RfDICu5G2L4FOuB8m9kfepHzY+EQCxKow4O5QLn8XTmyHlzjfERz8Ke1OrWa+RLnJoGn3wteXAk//v96cA3WQH2Cv6V5cFBDz6ewtdYJm6F7MLSpz0uKpn9JpOh814/NGZkCl7uz14U3MxPwa6ZYm2ugFwWPSXJOvX8Y7kHcNz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BeIACOUa; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55a90b2b554so670761a12.1
        for <linux-media@vger.kernel.org>; Fri, 26 Jan 2024 08:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706285569; x=1706890369; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lcg3AUd2cqMzWvqXgXxGKA4Vgsv4bHXjz07Z4n2FDK4=;
        b=BeIACOUaUbltTIQ5Oespza4D2lupH9bhKbTv9eu/2wYoz3ef5Xu/rlOXNsxKaRZOMv
         r8UlPU8PlPZav4yXbYJA3d7jv4bSQ/Y8r8Vr9ds7yDGG5CiKPNEWLmo8mmX82ZEsIfcG
         LB80cWn8KkLgwNl/mUI/Ea0RaIZVG98/HCrkMmjMhvCZIxF0J1yiaJUwqA9tua9QUcuO
         I825pEW+xlDHsUZdl7W0ebBiy78k8pN8PQBZ+voOyHZLRm3W1mPxaG5omgP8rc/vX+b0
         xV/3jyLSlc9R0nrVsrDoIhh6lHDVRkWAwCXDu62ijRff1Ff7KKI2wayjDlK//vTHVCoO
         S5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706285569; x=1706890369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lcg3AUd2cqMzWvqXgXxGKA4Vgsv4bHXjz07Z4n2FDK4=;
        b=i90M1LlqgffIfRBReKkLuQpwJbRrVsm9Xh4NJR5VJrxtSD+neErAifYKRqTFkBwCLB
         rEaxe+opBW04dyEbhIJNyJeLy8clh5PRRq19jWQmSkB0RYnoYx6rJVDetsT1jCcKMGDj
         p74hNV6/3FVK+TAgYo9jcA02jSwNqNleTFUJKRAf917JyVFPYDJxY3myF7FmC0/Pu4+a
         DgA34ENSm4dlnsMiRFHztPW+KxeEnS4+cMALwKuI44q3HwoD+edkE5BVasI/tOFwbtRZ
         98H9qfJMaikax9uAHAIUNuzHnX8W2m9/3AzP2ZP5RflIsylBoDoDLQX9R12/iAoR+ZM8
         uzUA==
X-Gm-Message-State: AOJu0Yzg3lrGlHHcQ1dXB4uGistoc7cubs1nQcIHw37b5f9f3LBabvFE
	cQDpLaFggTHQdZFA/3wENsvR7tY5WxzBGaq3Q4g4IEZBRhYrhdKo2rfVC/4Q/REtinvt7W4NnT8
	yynY+kHrrQdjufG58oi8XZFh7/hjwnDlW7N/QfA==
X-Google-Smtp-Source: AGHT+IFne1/xTwjOzXN0LiDrNgwHDmNg5oG+ktcyzY3HamyfJjBqdydrqWcvun6DTJpyaQxuZu8/43tMMiwe93Fpzl8=
X-Received: by 2002:a17:906:6d4e:b0:a34:977e:aa7d with SMTP id
 a14-20020a1709066d4e00b00a34977eaa7dmr1633817ejt.70.1706285568955; Fri, 26
 Jan 2024 08:12:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240105160103.183092-1-ulf.hansson@linaro.org>
In-Reply-To: <20240105160103.183092-1-ulf.hansson@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 26 Jan 2024 17:12:12 +0100
Message-ID: <CAPDyKFoGozKrNrAc0vpnNVuKvnorAuN_fg37DU4j0rq=egJ6Hg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] PM: domains: Add helpers for multi PM domains to
 avoid open-coding
To: "Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Kevin Hilman <khilman@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-pm@vger.kernel.org, 
	Viresh Kumar <viresh.kumar@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Nikunj Kela <nkela@quicinc.com>, Prasad Sodagudi <psodagud@quicinc.com>, 
	Stephan Gerhold <stephan@gerhold.net>, Ben Horgan <Ben.Horgan@arm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
	linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jan 2024 at 17:01, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> Updates in v2:
>         - Ccing Daniel Baluta and Iuliana Prodan the NXP remoteproc patches to
>         requests help with testing.
>         - Fixed NULL pointer bug in patch1, pointed out by Nikunj.
>         - Added some tested/reviewed-by tags.
>
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

Rafael, Greg, do have any objections to this series or would you be
okay that I queue this up via my pmdomain tree?

Kind regards
Uffe

>
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
> --
> 2.34.1

