Return-Path: <linux-media+bounces-49171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AD4CCFDFE
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 13:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 129193050D10
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 12:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB84E339873;
	Fri, 19 Dec 2025 12:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eQpkga8O"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA4C334C34
	for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 12:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766148351; cv=none; b=ATBhDEwuJmwi8BUlgatzqd58YtC6bYODaFzguMM9bN8vT5tqZjqcC/EjU6aIQs/sObwd9v+LSXid9HaqBRECt7/tj7G4DlQZx03dCDau97AE80mH+azqvlIkbmsOEVv5Koieooowo//3oitxfyabEt2hMyHG3Ok63qzyBHhhVkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766148351; c=relaxed/simple;
	bh=rSL621rykIUEPUs9lqTSuM839KvPGrjZGBWPyNzT8tY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bcj2WnlrubDPRED4ZFlWY3Nksog+iNdmLNW5T71kF/GCifHVmQhaT/P90WDchd8Cs5q0Usc1A9DLJ+X65SH0ttKGCGMVJdgbVwyy2zJvXu3rOUKa6n/1GSBJHB0eD5vOCNql/ms5Fula3ZVxVPO8xr6JDUuraHIA89Vg9qTWRrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eQpkga8O; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477632d9326so10781895e9.1
        for <linux-media@vger.kernel.org>; Fri, 19 Dec 2025 04:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766148346; x=1766753146; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ReSbGlU8XRlW0YyM9RKHmUTpdJ2dyefmPFjmWe9yo0c=;
        b=eQpkga8O1WWXNCP4aoXHqCIbJ7gVwsSLHneGuSdfbPjlLtZGuQrLS1bk5ZO3JadWQ7
         CLmK8PjcYTDB+DI/KHO3qEwwZPmBq5T1rClsOdv0l48G1b6CLpm96i9ZYU6lnCwOxSGD
         GuhfxmmDP4uLBgDPZ4BQSdRTDZCzRQ6u0YH6Dv7uxhDMuy+8+aUZp4bipKlgDp6ya8qV
         slcYmam0D2aCKLp4J3yafWj8gNzDdvNghzyqQOka7rkjC4E/1hnLSRu04tNBZ+n3OeAA
         BuD11SK3744bzAQir9MOzWRcoZ8mzVh0vb0DMHM5HUVDfEZZuq+AyzTKydtrvlksOouV
         eJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766148346; x=1766753146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ReSbGlU8XRlW0YyM9RKHmUTpdJ2dyefmPFjmWe9yo0c=;
        b=DCbl3Jeej7mUIYCNWPVpYT9baZVzGj1arPq1a2WLeyo2PMO86/Vn1t5Hlk7cXLrIHL
         CRw3Lwz7qWhObDEiMghnC8pHJqFOhL7Dql3iiirB6Ja2fmGcZGvCrlti5yAwhhY5/wRR
         eac6HEyjgxSf9GqwDAtbc/GlMkKe5X0taW5N4f8FKOL/bAx4pmoELjYKE0mXRdJlJNgX
         DtRcgmR5Ikd+Ubv7SR6qTbwxyjrUqscCWPPGuRfPX10Y68uEftYCaJyXqxTF4qjUCB8H
         ip+sSxQNXvKFnuL675XAu6rfD9VCjudmZ0ZlSCxVzLIxYJ2UQQlCk0tsCTMpHSJd9+Cf
         QjaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWF2gz0rKVnPhg1CSs5sNCZcoY9+A0fV39dP5XGMG4dM0YgH4AG5DhODMNmj7/nFIDus5f/S0WzVAtkAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPYi7YqyKrAqfo4NTaNa1YMEwdLbYMufcE3J+P7oQ9hl/5R5Rr
	ETqrdnKm70bDSslxjjxhQ4DpVwGAtgPBnAacznO1GRRurL2K3WDAdpf3MffhoxPddlM=
X-Gm-Gg: AY/fxX4zGb+YMaCy/SG+6Ufk9h/NFXcwPBLbsq+xl/AQONNfgPZ/Hcn0fjqG3yqFNLk
	BIxRnr9AExYViHwRhYnt8yWI35i0UezWtsPlNjkQDDZV/9llsI/F4oIPpqGAj3iyeZOqjLmSDBL
	u3nfeg7MhnggYTg3Fi0S6hXFkbj6dOXEMHj8T27q8rOMMtC6ejx8JAscQj+zyQgiHBJrKNOa37/
	kWqGDH0DcgzcM9bZs9aS7KSmFYcM4uMsYA9SdPoGq6ZlP32UGPCfk/kv4woVUP3PqefsR0917vX
	UO0t740OEEYhJG3BC+eddUl6DbCsCbqbuS25tdDipUvHP183fsDFL5c9YX5dmzMNTkAH89mONBW
	OoA+0dE4UFWzSesZdsRjVZ4QvcxX8KOB47vziSsfpvZEPD4qXBr3npUNgT5blnAHxXUBw8oIgHn
	TAXS4X8+/yKnay8uJ7
X-Google-Smtp-Source: AGHT+IETZ0G01z1cE7qdPgY5yrMZkHUa63bk9+h/z7utiQB+7f6R6xnjXPBJ2pNhG2GNw9+omqfAPg==
X-Received: by 2002:a05:6000:1861:b0:430:fa9a:74d with SMTP id ffacd0b85a97d-4324e4ca445mr3427880f8f.24.1766148345817;
        Fri, 19 Dec 2025 04:45:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aef7sm4702525f8f.7.2025.12.19.04.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 04:45:45 -0800 (PST)
Date: Fri, 19 Dec 2025 15:45:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	"Luck, Tony" <tony.luck@intel.com>, Chris Li <sparse@chrisli.org>,
	Eric Biggers <ebiggers@kernel.org>, Kees Cook <kees@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Petr Pavlu <petr.pavlu@suse.com>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	Malcolm Priestley <tvboxspy@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH 3/3] module: Add compile-time check for embedded NUL
 characters
Message-ID: <aUVI9smf2t7PvDF6@stanley.mountain>
References: <20251209001139.GA7982@quark>
 <d3dd8fc8-ab46-4cf1-87a9-0324685ba2e0@kernel.org>
 <SJ1PR11MB6083C6D97484ED4E4710268EFCA3A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <aThSGiKwJRYOB6kx@agluck-desk3>
 <aThqcq0iGge1pQCr@agluck-desk3>
 <20251210010020.GA2522829@google.com>
 <aTn0WdVv-S_EpQmS@agluck-desk3>
 <aTqAxfiVCR2ch4I5@stanley.mountain>
 <CABCJKufWw4VQA_k6Deuf5Bn6401cbYv_St8VV_0-LAau6F0nTw@mail.gmail.com>
 <083ebd92-4b3f-47f8-bf0f-395a604b5f05@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <083ebd92-4b3f-47f8-bf0f-395a604b5f05@kernel.org>

On Fri, Dec 12, 2025 at 02:30:48AM +0900, Daniel Gomez wrote:
> Maybe the flag fix just needs to be applied to the evaluation? Other op
> structs do the same. But Dan's patch did not implement evaluate. E.g.:
> 
> static struct symbol_op constant_p_op = {
> 	.evaluate = evaluate_to_int_const_expr,
> 	.expand = expand_constant_p
> };
> 

I was waiting for you to send this as a patch.  I can do it if you
need me to.

regards,
dan carpenter


