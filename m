Return-Path: <linux-media+bounces-21246-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 274039C3AA4
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 10:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF7931F224DD
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2024 09:14:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E29E170A0B;
	Mon, 11 Nov 2024 09:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P0zPij83"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F821662FA
	for <linux-media@vger.kernel.org>; Mon, 11 Nov 2024 09:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731316468; cv=none; b=VZwGFWQGa3J4Ml1HDEA+rhJEsAU5rtiQelQbkqhLNmDoiUKEGeugABDusDrtnPQ9D4tTdbmT+nUmMbXgTXqThrFjJE5RleUHtMzDsjMPyHAhWs58YvvNnoTjAd8a313KSmyqddTQLuViSacZubUPddP0uOqD06FSesXFOmkcOFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731316468; c=relaxed/simple;
	bh=OxTK3kBbHj69gWipHOv8iwxstU+Bq5GS1YjAAZZpka4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ISvdmfNVyDe3pGdFjBG9eOvmNM/h1ps0qCrBjfgUcmXjSJcDndcFBxJSO4onVhorJaJEOa6alU3g0wG4VS4jAAHMDYnK/AQZcYI9XL72O53oAO2KxxbuQ+e40eh6Tbgn53DPPxn7ttdCM/Wct/kroK03iCUZkoJ9GfpgQnZhQBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P0zPij83; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso724888466b.3
        for <linux-media@vger.kernel.org>; Mon, 11 Nov 2024 01:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731316465; x=1731921265; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2NWeH3jkHDc0Ye+Ypt1Wuxtz4WCpROEp8hmtW2LYWTE=;
        b=P0zPij83XztfOXqjbGNqcfpuwjbAYo2Wat38eHW/ys56hTHoygJGbFF99fpcqVO7B1
         +oGE1n4HPs6N3YbN9y0ola+34VMAX9Aevrng/Fzq9GUwH108r4N3oUHXCkVn0UxzX645
         loNDGjbLmdGZgGkXykHXJT56PXYua09qe7cS3jBT0PzQo3WhQJmBAtOEv024YPnev5Po
         oJp+TJ/l5xDD6hNiMVnvewMaSOgFnw6JsrugB/B7fHoji/V6RhfJpxrf1NgK+0X9iVKk
         AVbxH5E3Qx1YjPyKzbT0h+nrHuwk9ZmIduZ6/twjhkDgpzO3UICEgjFKuS4gDX8h9rPe
         YYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731316465; x=1731921265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2NWeH3jkHDc0Ye+Ypt1Wuxtz4WCpROEp8hmtW2LYWTE=;
        b=trPjN6JaPuUTw+3OwFdKExHsNWvNcqkSOWjpiWJhybkksM19II7kRwdLb/RNoJJtbu
         xzVtUXN6RjAjuAOMkxrYEYFaEGiXwqIasBM/oqRcGMTgnZtDiIXK8Z6n0xT/NQArblj5
         hzP6fx4SPDIG9lQ4ygXiq7NHU0Rf2qNFtIZeCdARvk4fZdUNTwNqxBY6cYlzDgqvAZvQ
         Oh6raW24LXFntb+D5dVN4wgRwUc1+ueGuzasaycq1Gey0YWnXsiO+106FJgGPkP8/lIS
         64yNEexWvR2u1GpMxxRUGnrDDzlF/DMlxo9dm8MJTVhKVBmHHPbMqjLULtBXdHoX9ULa
         c7kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoku12Nn1UfndWHpAMgSupulB4a75oBut4LKBP2sgQ0KVg6B5HEQ3+Q/Uzx1CtE27JsbNF99LvR4HFow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbwawXS1JMUORxWADjLaH4eSHtKnuSXZdeyViZzs+BDx5cE6as
	y/yF69052txVZ6KlB7C3qwfWPul89mv/VCc0S4p6uXYsGRxxeG+sWpZniHp8ug8=
X-Google-Smtp-Source: AGHT+IEJR5XILRv2WOEUbzmDldjOYjUKGr4w+bCfjgRlb0NalsMvd9Y6kH0/jAioZL9hxiS+S8Zk3w==
X-Received: by 2002:a17:906:c103:b0:a9a:4158:494a with SMTP id a640c23a62f3a-a9eeffeedd4mr1144156866b.41.1731316465395;
        Mon, 11 Nov 2024 01:14:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a4b82csm579790466b.67.2024.11.11.01.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 01:14:25 -0800 (PST)
Date: Mon, 11 Nov 2024 12:14:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Qiu-ji Chen <chenqiuji666@gmail.com>, dtwlin@gmail.com,
	johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com, linux-media@vger.kernel.org
Subject: Re: [PATCH v3] staging: greybus: uart: Fix atomicity violation in
 get_serial_info()
Message-ID: <9378fe55-66d5-4a11-9524-a0ed01f458ed@stanley.mountain>
References: <20241107113337.402042-1-chenqiuji666@gmail.com>
 <2024110724-overbuilt-liquid-3734@gregkh>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024110724-overbuilt-liquid-3734@gregkh>

On Thu, Nov 07, 2024 at 04:11:00PM +0100, Greg KH wrote:
> Hi,
> 
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
> 
> You are receiving this message because of the following common error(s)
> as indicated below:
> 
> 
> - You have marked a patch with a "Fixes:" tag for a commit that is in an
>   older released kernel, yet you do not have a cc: stable line in the
>   signed-off-by area at all, which means that the patch will not be
>   applied to any older kernel releases.  To properly fix this, please
>   follow the documented rules in the
>   Documentation/process/stable-kernel-rules.rst file for how to resolve
>   this.
> 
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.

Like Johan said, this doesn't really belong in stable because it doesn't affect
users.  It's mostly about correctness and static analysis.

The linux-media CI system has also started complaining if we don't add a stable
tag and it suggests that the correct thing is to add:

Cc: <stable+noautosel@kernel.org> # reason goes here, and must be present

Do we really have to do that?  Applying it to stable doesn't cause a problem,
it's just not necessary.

regards,
dan carpenter


