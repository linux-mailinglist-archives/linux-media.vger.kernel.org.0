Return-Path: <linux-media+bounces-50151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 41368CFE691
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 15:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A88693067925
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 14:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40691352FB6;
	Wed,  7 Jan 2026 14:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qHtH8alC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1116E352F9F
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 14:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796404; cv=none; b=Ytf3Ee1I5byD5f42yd1hCfFhEiFQbQe/xZQEva/XlXGCayj+Xkob2IMnXLLXiZB/V0czeCDiliHphIGzkUkkidqL/j22+ZB30WqH18xdkGseWNyQ5ZHDQ9uRumqzbPWJf4AT2PCIzkhFtlHP/0F5w1agSwgVlcJBBFv8Wylxp3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796404; c=relaxed/simple;
	bh=2bzqlIKsXX9eO3lZgBojgE7dcdQpm//aVw2u08myThA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHWY7ulxpc+JiePQN8ly1ip6xsjkNCm22ziSEr1wSlLXXXjcyxXkaIuEk89v6kLVIOKvRNiWcJwrnNGW/ZTv7G6OKcl7lmWT1Y+ZDEAjxQ7gMbTNE3RdSu68W2JcJop/mPSlVIXhnqdQUdlFooY8S9GfPkzIqIX2I1GqDwM5z0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qHtH8alC; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so17726995e9.2
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 06:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767796401; x=1768401201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ehCzga0f5q0xi43P9nCB2+2oc9tg1sqwri9arZAFlk4=;
        b=qHtH8alCNALBmwUDnfTi7rVypHeszjuGel3MAfkugPcQLBe2i3g+JbolEdcHZkBjhQ
         U9jW1+bmQ6lWuCsIJ4xcIyyY/tjARe107PNbLusCFYRS+b1RZgXEk7PCD59ksbT3yMmm
         /5IuI3b7ZSYJtVDdZlQ2h2rMNHjk/Ji+rHmtbYnIGQaxNJJtkmHktx5b9UvBVWQnQorB
         487SNM4wlW/i9fDvN+2tXZkAD1At0hyJG2HJZjAvSTzhOUL36vflHA401R2+UOnGLttQ
         sl8Hibew2UAFZ8dWwBstBSDn3OkelRlwBnqm3VQJ7QU9tLNSxz3fwxusuxJF3PEdPeif
         DDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767796401; x=1768401201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehCzga0f5q0xi43P9nCB2+2oc9tg1sqwri9arZAFlk4=;
        b=CQ2WMExlWHXkzBb/fjWQcvEBkLmEQBBN4cMlASvmsYb/XxLOYB2wbCF8KQ8t3QR/iJ
         l5K2AD/Aums1bHX0L8Dl8SEvynKwb3iDsRMcdxUNUaNSVx6X4j+0xZkOmYY3VDGSkTLr
         /yrtHDLFjPCBq5wFzdk86IegMLr6c72ht3DlwzBfYaUDOwNIUiXVv+Zi7RJMMSKIJacx
         JOITQd/cOtPHFa1sv6FYlBw3ggGRlpxTYtM+2ojDlK4RYdNzUnddH8BpMjk5oYG1Ydth
         179veFd/3zmT65hqAK2+TPOCz9kn3qE8pAvLoW2ImMQphiZRVhuo5pgwvpFMEP0GKEBh
         g6Eg==
X-Forwarded-Encrypted: i=1; AJvYcCV+tgw9tSr/PqH/IYdEFBszaQnrtiloeb3aAaIsYpdCo7i8ifBnE269VbzNs1lIgxWCfnGoLRbrHOU0iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaJEw5VVkmoa35IGiUtGkl0p36eHlHQ5NKKFvAoirbD/SykLcI
	qlotcGLv6AlEZhT7eAZsM/B0uX5XOjSonmqDdgpkfpTpkgvcNYYJEHjBCM4a7cGeR1M=
X-Gm-Gg: AY/fxX6r20n5iIOZpepkrr9drixR3v8hZ5rMDfmcj72MS6ehtz7JWGsAF5IWECkesXK
	T8rAHq08OcTHxZirx7qqB5Ny1VORZ1HTk9PnwtW3F09cKwkaYsU1qcj+I6KG5bvIE9DRbFxF2j8
	lnxr+xUPA2K5bzi9iwBFov2A8G+YMPII8RPJSK0ALiWQ9e75rsTydaAxDKqQMGvuWHB8qcwcfr6
	spLda4JpkIGncegdO3KTaDix4NS3omJn+joJ59bFig3FZ4x74ZJ2S/9kJERAkHJVNOmfRvqc44a
	X23q94a1OezGa4sfpDl7nlU6wOzQg3+wA2EjUVIrRJFACGGXU87AG2wb4hsKMqhMGzS1OID79nw
	p98LWWE5pTkXtSwBe5b3QZsF1P5y8IokMeMyho5voDZZUOt/DLOTu36T2HDeDYcXpvuWOqgyR3e
	jojAGdSr6Hjg7msl3g
X-Google-Smtp-Source: AGHT+IHkgW927iPiW7zVWJf1VnqJUxtlpbfccw9OxZ6+AFkNdl4ava7yOMMQmuHv9ZI+fg8GpAmGDQ==
X-Received: by 2002:a05:600c:4692:b0:47d:3ead:7439 with SMTP id 5b1f17b1804b1-47d84b5403dmr31430905e9.37.1767796401195;
        Wed, 07 Jan 2026 06:33:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f653cd6sm106370605e9.9.2026.01.07.06.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:33:20 -0800 (PST)
Date: Wed, 7 Jan 2026 17:33:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karthikey D Kadati <karthikey3608@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND v2 3/3] media: atomisp: propagate errors from
 ISP xnr and IRQ enable
Message-ID: <aV5urWWGzYlZr3lo@stanley.mountain>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
 <20260107134844.68074-1-karthikey3608@gmail.com>
 <20260107134844.68074-4-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107134844.68074-4-karthikey3608@gmail.com>

On Wed, Jan 07, 2026 at 07:18:44PM +0530, Karthikey D Kadati wrote:
> Propagate the return value of atomisp_css_capture_enable_xnr() in
> 
> atomisp_xnr().
> 
> Also check the return value of atomisp_css_irq_enable() and log an
> 
> error once using dev_err_once() to avoid flooding dmesg.
> 

Leave off the "to avoid flooding dmesg" because otherwise it makes it
sound like we were flooding dmesg before.  Just say:  "Also print an
error message if atomisp_css_irq_enable() fails".

regards,
dan carpenter


