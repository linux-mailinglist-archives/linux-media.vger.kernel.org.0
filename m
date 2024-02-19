Return-Path: <linux-media+bounces-5408-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CE1859E79
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 09:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83ED1282350
	for <lists+linux-media@lfdr.de>; Mon, 19 Feb 2024 08:37:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E04721363;
	Mon, 19 Feb 2024 08:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ge6DQLie"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A70D20315
	for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 08:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708331839; cv=none; b=saR8GhLwNOWXUQrQcZVVo5EKgYZ0kkDFivvhjwQNYlDZP6qznKehU+eam4U/mQjwungmyQt7gm1DX3bXwwBS42d1ndsL2DKbXhk+xhdCueUr292ehg3q+ycE3GkYvZCI7PrKk0ca1AnvTMKMHIa4QzUPxGPFgy/WJHEjYkJIgew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708331839; c=relaxed/simple;
	bh=tA/HjR4gNsKYDqxOmkzpm1jPCMw5rPMZeBApJ0Rh/cs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Djo/1mkPxP3wwQu5qfkEcnWwVZb+kJkwNLjY1HhOIxd2ikXmXbRWB0gY6eACWPsJG20WLzr1fXrjr3f2za05H0arZARFHvBBn1Pnp21jwbuDkLl4YWevOfBJx4Cnia7jqZJpkLM0Ni2fb6NWk1uzas3M04xCjBTh/Zxq9hLQTQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ge6DQLie; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3e7f7b3d95so88503366b.3
        for <linux-media@vger.kernel.org>; Mon, 19 Feb 2024 00:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708331837; x=1708936637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ojbVELbGUO0Fdw1LO3aSx5BEslcvMdmSrG39OaZaxOY=;
        b=Ge6DQLieZ2ifGEL3Y2+H/rbtAMtU0Zl5t9cedF+AlgRk4g8V9/pw4CBzTO0ehV1IVx
         95WO1Q72LHvcU4rU118BDgM7NqVnZFYxsg/o44DUMitwmM7WPeUEy0E8/XfTXuMd3ODG
         ZXQuaphfcGJepmMcgUhakUe9YoCZqmUoxpwRvfp/oLSh8t+Wli4VHG2uWryR8FM5SmPW
         ngOZsaH3EmFfZpz4AJbfV/qYb3o1cvZWHzWdPWMonjpxRaiRdooGZ9x3hL4kC9302Fdv
         ibD1pFVBPwXy9L0iWFL4lzvXIsjYn700t9oetL453v/FaZ1ge7FFC4cW1xNtwzgV08xv
         bhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708331837; x=1708936637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojbVELbGUO0Fdw1LO3aSx5BEslcvMdmSrG39OaZaxOY=;
        b=XtNu4vT8jQNp40mwGVs8gE29J8pA3YHBOZ6+NZj7tVkZqVb3OBj+2fCeDS+BQysDyZ
         96VzrAaAZwh4PbLYx3A+CG18e7fng5Td4EeO1d5yGS0btZbD4Sly2bmaymusjyaGHMqk
         W3wXvoSRSQRWFJ4J/Z4HKgRkXHPYEElz4SK3fGD2oXQqthP5QcLvNmO0c6ycWwfiA+oB
         lGS43jPFawfQwpI3f0Wng36NDptxL4E0rspAGzFLMR91qJ6zqthcPhUvuvIMM/MZUtTT
         /OiCy3x6jRwSIUqC6wXpZOqCmYkqDfF2eK0lymGEJ8IZNSkBU7/9MPd1zZiAU9qDFtij
         HcSg==
X-Forwarded-Encrypted: i=1; AJvYcCVX6PIXjU6xcqKec+C29QwVn0GKhCkSyv0plwNrzVVcss3qKIYhePpvMOMX3x9tqjZ2c1gGhpX0QCKcxawxH0KAmnsAKYYhDZNhmh0=
X-Gm-Message-State: AOJu0YwZGcfadhDFChaHDDOB2KlhIUEQllVNhLC50TfRax7WjPme98q+
	fIGIpTNj7AzcCo3Rb3qz1muBu3mffXIvQDVJQMva0oILLXcMQpNqKo3lzNYtSI4=
X-Google-Smtp-Source: AGHT+IHPRRVfa7/lTL/FAHCnZ0EhKSDENbaTpEre/56m0a9j/pZ89HxBxVne3vEkeUmJJ840QF6VYg==
X-Received: by 2002:a17:906:fcca:b0:a3e:473e:26a0 with SMTP id qx10-20020a170906fcca00b00a3e473e26a0mr2936656ejb.51.1708331836826;
        Mon, 19 Feb 2024 00:37:16 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id th7-20020a1709078e0700b00a3e059c5c5fsm2695590ejc.188.2024.02.19.00.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 00:37:16 -0800 (PST)
Date: Mon, 19 Feb 2024 11:37:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: gustavo@embeddedor.com, keescook@chromium.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2] udmabuf: Fix a potential (and unlikely) access to
 unallocated memory
Message-ID: <91d964c2-3d5a-4e96-a4db-e755455c5b5c@moroto.mountain>
References: <f75d0426a17b57dbddacd7da345c1c62a3dbb7ce.1708278363.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f75d0426a17b57dbddacd7da345c1c62a3dbb7ce.1708278363.git.christophe.jaillet@wanadoo.fr>

On Sun, Feb 18, 2024 at 06:46:44PM +0100, Christophe JAILLET wrote:
> If 'list_limit' is set to a very high value, 'lsize' computation could
> overflow if 'head.count' is big enough.
> 

The "list_limit" is set via module parameter so if you set that high
enough to lead to an integer overflow then you kind of deserve what
you get.

This patch is nice for kernel hardening and making the code easier to
read/audit but the real world security impact is negligible.

regards,
dan carpenter


