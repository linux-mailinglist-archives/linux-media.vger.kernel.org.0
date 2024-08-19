Return-Path: <linux-media+bounces-16463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB83D9567C6
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 12:05:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3874CB2220B
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 10:05:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7306B15E5D0;
	Mon, 19 Aug 2024 10:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PY8sP2Hp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E45148FE0
	for <linux-media@vger.kernel.org>; Mon, 19 Aug 2024 10:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724061898; cv=none; b=GK8RAvZtoij7mtdOwmGzYlVbg8FNLRPdfh788hUb1se6jZi3gfAFSnzWAIxZxoCDOsj7nXdUL9V5BQYrvBUr/dqKzcgFUwcZNl90usIzzHkrENu6iroa1z8MKkVA94wVaK6KsNi+gY+BRIus8rval/8gnmcszSqJQPQjrTH6Zes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724061898; c=relaxed/simple;
	bh=xoT8WHk3WQmUClK7K7b/s/MGeeLj8XCH4SR68t7sZg0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s2swnBFogEtOhs1N6DFWs7DHmIYFdrZvzT/mYO7Zl+u/+mIKjN9Qk3jjTSZipsxgpMMbPFi+BRhhBCLygwX6yUmidyjY/uThZYsql4OK38rX5DRyDg9YQwCXP4Mly3h1EPfnzIj9fp+RBkcorXqDXblzOBhrZ6HDTVSxJeSL4A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PY8sP2Hp; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e115ef5740dso4385968276.3
        for <linux-media@vger.kernel.org>; Mon, 19 Aug 2024 03:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724061895; x=1724666695; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e1Ca1aEMxVbK/mwEr3WDL/uAexipVpTA2uL0ddyloYs=;
        b=PY8sP2HpePQO8GpReSqZkOmsK5FbmPXSAXeBmd8CCPaUYhzW+v9pdnrryrxc/rbtyY
         EQhocheYm+V08MFqtBKNixjGwNxjKgfU8LF+KxheTYdN7kk8Y4P2ECGJ/XW6xIhozTht
         Z4W+ZlOGhH10A3C/nk7KvgBz0r7UP5R5huugjI31p8JVOpLqlA54TAOZRlexnKgxykPa
         ugHEbvYX0XLzmamZ3NnV4idtaS2RPXbV6riSTsMSVeqQlPeGeqLhRLBcULHup1wPHKBq
         81Me8bxafBmRoyzx5tXYY8ylAsUlNNxehGmQZ0iymhRzZI2LYwauqC1cCX2oVBKYqIqu
         fqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724061895; x=1724666695;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1Ca1aEMxVbK/mwEr3WDL/uAexipVpTA2uL0ddyloYs=;
        b=h9/TaKJWEGrJDdanSWANmFW19BWw+OSnMABRpe+MT2n9CPJvLLsrlQdjJJCxAd3I2z
         3YMR9qXHPUbVZdUf48cpfKnpNd+14SkWPYGic2uUzH/tqJutGdNFwfT7hQ657bLLxpwL
         WaL1MXh65vvpKOOkafd+RlG0c2bpobeHcbRwDDysXGAICMzkIvbFj1pqOigU7ysC24vI
         AVJc4ZLvzHXoPfrDAVdRZIGItWzbW0tDRos9468PF+4jYqCSGzj4ITeyxO29YaRGfSul
         jZTHPd1uBPYrSGNENzsyTD8bJbEul2CV6PKt7qHiTRV+VS7adCqGZaZNLPYP2lkUstH1
         E96w==
X-Forwarded-Encrypted: i=1; AJvYcCU0UWzF7CsKVaV/eZafQhIZjJj21U3PM1egwuE1RqCy5hFR/DPtyKfNrJWqC0nMPWgKDxkIJlPwCkHvR28+rC98T8YKIno/43N3qA0=
X-Gm-Message-State: AOJu0YwvQaBL9NhveFfxp/ACPq2yd2wWOY9zhU0jypcZ1gWO4o6Sx5+f
	iD3tqOAHrObULHjITllOoFtXVlDPv6V3wqH22VUi2RT6B+ru6s5Cw7fZ0DtxvxfcOcAkbaMeT2O
	PvPIj8ToGABjvELsua8u0/kCg0r0AYF0+FPBjpg==
X-Google-Smtp-Source: AGHT+IHbPw975p5St5ukxgiGIy4CD4Vc8ysEaghu4/as749NoeR4PFK5yZ2MogHwI+n8JQDVO1DFvdB/CFAvp9O9pSA=
X-Received: by 2002:a05:6902:1687:b0:e13:c7a1:4a72 with SMTP id
 3f1490d57ef6-e13c7a15d8dmr9565396276.12.1724061895158; Mon, 19 Aug 2024
 03:04:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1724048566-5035-1-git-send-email-quic_dikshita@quicinc.com> <1724048566-5035-2-git-send-email-quic_dikshita@quicinc.com>
In-Reply-To: <1724048566-5035-2-git-send-email-quic_dikshita@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 19 Aug 2024 12:04:18 +0200
Message-ID: <CAPDyKFroZ+E9+Nk6+H1A5xZDv=HpcUAfnYPCXJot1NiZZci6gQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] PM: domains: add device managed version of dev_pm_domain_attach|detach_list()
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Aug 2024 at 08:23, Dikshita Agarwal
<quic_dikshita@quicinc.com> wrote:
>
> Add the devres-enabled version of dev_pm_domain_attach|detach_list.
> If client drivers use devm_pm_domain_attach_list() to attach the PM domains,
> devm_pm_domain_detach_list() will be invoked implicitly during remove phase.
>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>  drivers/base/power/common.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_domain.h   | 11 +++++++++++
>  2 files changed, 56 insertions(+)
>
> diff --git a/drivers/base/power/common.c b/drivers/base/power/common.c
> index 327d168..c8431de 100644
> --- a/drivers/base/power/common.c
> +++ b/drivers/base/power/common.c
> @@ -277,6 +277,51 @@ int dev_pm_domain_attach_list(struct device *dev,
>  EXPORT_SYMBOL_GPL(dev_pm_domain_attach_list);
>
>  /**
> + * devm_pm_domain_detach_list - devres-enabled version of dev_pm_domain_detach_list.
> + * @_list: The list of PM domains to detach.
> + *
> + * This function reverse the actions from devm_pm_domain_attach_list().
> + * it will be invoked during the remove phase from drivers implicitly if driver
> + * uses devm_pm_domain_attach_list() to attach the PM domains.
> + */
> +static void devm_pm_domain_detach_list(void *_list)
> +{
> +       struct dev_pm_domain_list *list = _list;
> +
> +       dev_pm_domain_detach_list(list);
> +}
> +
> +/**
> + * devm_pm_domain_attach_list - devres-enabled version of dev_pm_domain_attach_list
> + * @dev: The device used to lookup the PM domains for.
> + * @data: The data used for attaching to the PM domains.
> + * @list: An out-parameter with an allocated list of attached PM domains.
> + *
> + * NOTE: this will also handle calling devm_pm_domain_detach_list() for
> + * you during remove phase.
> + *
> + * Returns the number of attached PM domains or a negative error code in case of
> + * a failure.
> + */
> +int devm_pm_domain_attach_list(struct device *dev,
> +                              const struct dev_pm_domain_attach_data *data,
> +                              struct dev_pm_domain_list **list)
> +{
> +       int ret, num_pds;
> +
> +       num_pds = dev_pm_domain_attach_list(dev, data, list);
> +       if (!num_pds)
> +               return 0;

This should be:
if (num_pds <= 0)
      return num_pds;

> +
> +       ret = devm_add_action_or_reset(dev, devm_pm_domain_detach_list, *list);
> +       if (ret)
> +               return ret;
> +
> +       return num_pds;
> +}
> +EXPORT_SYMBOL_GPL(devm_pm_domain_attach_list);
> +
> +/**
>   * dev_pm_domain_detach - Detach a device from its PM domain.
>   * @dev: Device to detach.
>   * @power_off: Used to indicate whether we should power off the device.
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 772d328..b01e127 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -450,6 +450,9 @@ struct device *dev_pm_domain_attach_by_name(struct device *dev,
>  int dev_pm_domain_attach_list(struct device *dev,
>                               const struct dev_pm_domain_attach_data *data,
>                               struct dev_pm_domain_list **list);
> +int devm_pm_domain_attach_list(struct device *dev,
> +                              const struct dev_pm_domain_attach_data *data,
> +                              struct dev_pm_domain_list **list);
>  void dev_pm_domain_detach(struct device *dev, bool power_off);
>  void dev_pm_domain_detach_list(struct dev_pm_domain_list *list);
>  int dev_pm_domain_start(struct device *dev);
> @@ -476,6 +479,14 @@ static inline int dev_pm_domain_attach_list(struct device *dev,
>  {
>         return 0;
>  }
> +
> +static inline int devm_pm_domain_attach_list(struct device *dev,
> +                                            const struct dev_pm_domain_attach_data *data,
> +                                            struct dev_pm_domain_list **list)
> +{
> +       return 0;
> +}
> +
>  static inline void dev_pm_domain_detach(struct device *dev, bool power_off) {}
>  static inline void dev_pm_domain_detach_list(struct dev_pm_domain_list *list) {}
>  static inline int dev_pm_domain_start(struct device *dev)
> --
> 2.7.4
>

Kind regards
Uffe

