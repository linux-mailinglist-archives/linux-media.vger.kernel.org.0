Return-Path: <linux-media+bounces-35211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99118ADF7CE
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 22:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18895189FADF
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 20:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1BE21C173;
	Wed, 18 Jun 2025 20:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p7YKsGWv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FED188006
	for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 20:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278959; cv=none; b=GbAr84aKuhh5L4Q0/RscwXf2NJlngCkSywXww9sXP/N3mZvoEcepM0fV0qUWu5l0VWpDokscuiOiRpyd0MeeL5W1YRlJqYgypM2808WfHbwgxUibzyM4QnanvXQTuC//tQ3SHxam44Dsz4DM0NesCZDCkBm6zWIvyc2AW4R0mXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278959; c=relaxed/simple;
	bh=ahnd1Z6swvTss88J3BCqiJiQsWfGMkswiPn53f9/8bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cW3On3Kmgv1OeVaTbpPBg7pfhCSOnui73ZCxmGGqjFppB2/Hc9kvGQ1HMN2KdW0sqCFHyP62mvM5twDkF5QJxpi50MRHpASqW2ThQnxBjJkJKX9Z0UepYTpHOH164vK4qzG1u9uLE8IEK/1I2RTm9crbwdhZoB95kHVwo/7rt0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p7YKsGWv; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-2e95ab2704fso23463fac.3
        for <linux-media@vger.kernel.org>; Wed, 18 Jun 2025 13:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750278957; x=1750883757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ps3OX/Dhs7yZhLG+f0r6G5XaijgRdGcZ8U1aOoi8tuc=;
        b=p7YKsGWvkNWm0tJv+IkLoY/kuLL6HhaFgH+6z+2xS2ORsU7dcqtkJL3H7lVxBuKRF+
         EQ2hAN+dsG06ZwGohIpSh20oT9WH1xcqW6mVzkEkUnYnc8SKS2g0pcggETfa3JerfF16
         ktCv+Rqb2DIpZn6MeasE5wxrmJz3qPGEuLASIAvnbg+wDUhWCsIjt1Gxws4NnBsDI1dq
         AhHl+Lcy2+Z//YAqMdN7WW31Erm9K27A5W3Wqz74Ets4K26Q/aQ3Ndl+lTyIvk3+6AZE
         58fezAinbxyrzG0OdfR50r7B2CAu3gHDvInrh7R6QwAHOKsHJOz3Ryc2pxhvGQtJgFFB
         cQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278957; x=1750883757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ps3OX/Dhs7yZhLG+f0r6G5XaijgRdGcZ8U1aOoi8tuc=;
        b=kyRRGzpGLRfShfc5veiCNpq+AqmWvNUEc9b5+gKmsPAW0IpeQTxnDgKQ6R+5u5WO37
         2mZ0KhejFBpew4HBGa7SfQ84KyMwpUkCCYIu/24ek5SVsNSxpncCCYFCvlcd36pWzCoq
         gSOGF5pc/GkANP0WAiFm+VCufM67KpIUbT91jcR05qU3ZoJ4+QnQPchfUc3EVmCq4l4j
         P5kgXs5+yNg6ejs3ZqVL9ryuX+0wiPMv+Vrsy2LjQMT4Av5i05dDe+WmpA6uViJZ0PV9
         zfyc1/iHHEtoGkm5f3TAVA8UEAfjBzjXkz32PfWu9EjpTH1MOfNPGvZIXwvUUcp6rrop
         6XsA==
X-Forwarded-Encrypted: i=1; AJvYcCV9tgS6YQyOjE4c9dxQ0cxoMNCoViaGTPSzfM2PiNR42q7i1wCX1WEKLGUX9MopENDnNjxhbA8fFI4LYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvKTXS6hfpFv3yBAumJ255LdDAt7SdHxqh1ilaC/8GcBjxK1zX
	SyJ9LJtiY3/6RNvY+cEO011cFU+Wku89NDuOFv12ZlIOrOPNZqP5AxCYKUGbDlFWycM=
X-Gm-Gg: ASbGncs9Bb4dEgc19j/TMFs/RIMw3MQiCzlpMaWF8toIDZVAdSZdr9L9QHbT8JexQ6W
	9W808gHxCboWd5WUHkbICDhrGC4zZsBdBrriRB4X8e8nP6Q03QDyg3QVjvwFalAPl9NDba/Knhl
	8jFGGyWNrAg4A4VyUxCxyzSqky7g3E2dRMQqxSdp++rTwGn3ZJneafrOKHJbRy3WHGJMt8pfnEg
	E0f+QgSjPbW0T/X55hjdQJXLrAo8X5SXsLnzUOZweBrp3DVnn+oXPq7QhxE0Aqs+ye9AgJoEFw0
	75HJe3RElSDgznK815ty3Z/DN8F6MOCxWpWufb05by9uUUMmcd3KajosOzDctsWhshf5xQ==
X-Google-Smtp-Source: AGHT+IGFpoeUPUB3ajbzRme+oGBi4olRLqQl65J8P5ov+Se4sIOpLBgOJGgqQ4g2+IIieFSr5Z+YJg==
X-Received: by 2002:a05:6870:9720:b0:2ea:7d72:23fe with SMTP id 586e51a60fabf-2eaf089dd18mr10540737fac.11.1750278957488;
        Wed, 18 Jun 2025 13:35:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eab897a367sm2981625fac.21.2025.06.18.13.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:35:56 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:35:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: hansg@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 5/5] Staging: media: atomisp: i2c: struct definition style
Message-ID: <69ff7899-cb4f-47cf-8eff-13b5a828d94a@suswa.mountain>
References: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
 <20250615231143.1558392-5-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615231143.1558392-5-thomas.andreatta2000@gmail.com>

On Mon, Jun 16, 2025 at 01:11:43AM +0200, Thomas Andreatta wrote:
> >From `static struct ov2722_reg const` to `static const struct ov2722_reg`
> 

Sentence no verb.

regards,
dan carpenter


