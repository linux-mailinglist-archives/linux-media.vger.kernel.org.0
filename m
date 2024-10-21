Return-Path: <linux-media+bounces-19995-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 774909A6D64
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 16:57:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 981251C220BF
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 14:57:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACA11EABDC;
	Mon, 21 Oct 2024 14:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJmsENef"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855EA1FA256
	for <linux-media@vger.kernel.org>; Mon, 21 Oct 2024 14:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729522635; cv=none; b=tCOUuO396emm/eDusKh+ZgWyVXsB0LvtSqUBAtSKbP2uM2dhaAqn56tHDb81JRMefjmKPAPImMJI6zUtzRrXLyqIzXUJ4P8t0EPyHMU2DUWmT/zJKmRTjJdfRxXuiC8ovbHAgfRk9QcQDZOMiovogXF3iMIFxlRX22aAi4XxYQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729522635; c=relaxed/simple;
	bh=BXHn0860JPCVWd8O7hdisae8Uk0Bt4aGT8/0Q2FdgIU=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=pOzIiWr5w+2SVHpn1QiU9v0OZF0tpHlS2u/XGf9Iv7J9jFQNnktJfHID8v25GD9VYh44m6QIVTtPJjlQ1pdY89I9vMlN+nzH9jIRZDjBbNrCT/76bopJH2lc6NScOMqFGsmfZ9ZGRJLytVirBnm4Uh2+8NWegGYh86LuJEE8RHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJmsENef; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539e63c8678so5478318e87.0
        for <linux-media@vger.kernel.org>; Mon, 21 Oct 2024 07:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729522630; x=1730127430; darn=vger.kernel.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=BXHn0860JPCVWd8O7hdisae8Uk0Bt4aGT8/0Q2FdgIU=;
        b=iJmsENefaIz22jFIAHT7GvqAl14bGezLksOpbsevebB/VG9iR3SVwRMCnaUE5EoC0R
         Cvhk8k+rRW7YlPkl8WJiMjbMyXVrTDYasqJG3WYzPwqdh8eyEpZoVI8m+7bp+N9Q0nZ5
         RQNg7/tt0dzWXBLmu5YLj6WQgNuSVlwLPaK4rxnhIsIk82eG3em8JyAfvkuuiL92muIx
         kk+xYvyhlSTYm3PMnHCzYyqm1RTaPs8BHd9JQP8tjpRdEgPWMo03UWqTw1A1Ud+z6J2l
         U3KzzCI2+vOH5lTsltER7l/uJCWqwnKbRio7awpEeyTJyyY1ncl31EMlZVvlodK8rhq0
         I5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729522630; x=1730127430;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXHn0860JPCVWd8O7hdisae8Uk0Bt4aGT8/0Q2FdgIU=;
        b=jijzpqx/cPPKUSWwZuOCViSueRE1WeMYBeAf8H/8i3hyp2p3JR5CDnB/d9zf3+/Pn3
         jKrUp1nyNJlNibA1yniW9s1A7PzKMizatFUCDwLuRNbdV71sp95ooKrTVJ5qcQL6+JlB
         wJ7mdPMCTPOve4BGeC26nAMPWhCRyj6Fc2z/Yldym7WJBB4Gza6BGvadYUJWwUiB4Uu1
         IArNxk7n+lYkw7ovJb571AwWJQdG7TdsPD0Ibo+gjoC3X328aQd5rY0l6I9CYYBy525g
         dhjaeC88QBm9M/GqSgDzjVfW76QSxNlx0D9z3DSMNevrEN4vkzGGfJY3QSg2RIP1RzXq
         4idQ==
X-Gm-Message-State: AOJu0YyrnKGRxOnvqEz1qOEg+YdQLqpEVO2Q1jxDdH41zaI+Fdk28U3V
	7UmjIO+2sxo9h6XeLUDg63jShJvaet9F5aFSN0QurQa9oBSR9AHQ
X-Google-Smtp-Source: AGHT+IFi+V9+sl2yeEmMm1OzhdR6R7NAwWkbVgOxv66Ambz/rq1s7dxKMyy1zrID4gQb+u7zlMCRkQ==
X-Received: by 2002:a05:6512:3c8c:b0:536:a695:9429 with SMTP id 2adb3069b0e04-53a15441f87mr5940429e87.10.1729522630108;
        Mon, 21 Oct 2024 07:57:10 -0700 (PDT)
Received: from razdolb (static.40.223.216.95.clients.your-server.de. [95.216.223.40])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a2243158fsm501690e87.220.2024.10.21.07.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 07:57:09 -0700 (PDT)
References: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
User-agent: mu4e 1.10.8; emacs 29.4.50
From: Mikhail Rudenko <mike.rudenko@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>,
 Kate Hsuan <hpa@redhat.com>, Alexander Shiyan
 <eagle.alexander923@gmail.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Tommaso Merciai
 <tomm.merciai@gmail.com>, Umang Jain <umang.jain@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sylvain Petinot
 <sylvain.petinot@foss.st.com>, Christophe JAILLET
 <christophe.jaillet@wanadoo.fr>, Julien Massot
 <julien.massot@collabora.com>, Naushir Patuck <naush@raspberrypi.com>
Subject: Re: [RFC 0/4] Sub-device configuration models
Date: Mon, 21 Oct 2024 17:29:33 +0300
In-reply-to: <20241011075535.588140-1-sakari.ailus@linux.intel.com>
Message-ID: <87ed497bcs.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi, Sakari!

On 2024-10-11 at 10:55 +03, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:

> Hello everyone,
>
> I've been recently working (with others) on sub-device streams support as
> well as on internal pads. The two can be used to make sub-device
> configuration more versatile.
>
> At the same time, the added interfaces are much more useful if we require
> specific semantics of those interfaces, so that the user space knows
> exactly what e.g. a given selection target signifies. However, as the same
> selection rectangle could be used for a different purpose on a non-raw
> sensor device, we need a way to tell how should the user space determine
> how to use a given interface.
>
> I'm proposing to solve this problem by introducing sub-device
> configuration models, and by the common raw sensor model, also present in
> this patchset, in particular.
>
> This has been (and will, for some time, continue to be) the reason why I
> have reviewed few sensor driver related patches lately. As we're
> introducing a new interface, it's beneficial to be able to use that
> interface right from the start, rather than trying to later on offer
> compatibility support, which is almost always a fair amount of work with
> less than desirable results in the driver.
>
> With this solved, I believe we can enable the use of the streams UAPI.
>
> Comments are welcome.
>
> The compiled documentation can be found in
> <URL:https://www.retiisi.eu/~sailus/v4l2/tmp/meta-format/output/userspace-api/media/v4l/dev-subdev.html#sub-device-configuration-models>
> and the patches here
> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>, i.e.
> they're on top of the metadata set.

I've read the updated documentation you shared, and have a question
concerning binning configuration. IIUC binning should be configured via
set_selection(V4L2_SEL_TGT_COMPOSE). But I also see some existing
drivers configure binning via set_fmt() (imx296) or both set_fmt() and
set_selection(V4L2_SEL_TGT_COMPOSE) (imx274). What will be the right way
to add binning support to a driver I care about (ov4689), which
presently does not implement any binning configuration at all?

--
Best regards,
Mikhail

