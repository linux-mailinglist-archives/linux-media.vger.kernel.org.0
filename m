Return-Path: <linux-media+bounces-20950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EEB9BD2B9
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 17:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED3911F23376
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 16:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D671DACA8;
	Tue,  5 Nov 2024 16:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g4TRtE0U"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FB2172BD0
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 16:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730825145; cv=none; b=TGwyxSrP04A63GzVnrrn1NcBwlynVscI0sqmzShm/d8OJk7Ioqss5X5lRRv8bMpjBdCyIkGfY8yPISDaJyhyhATqmRzrIHPhDbI5jkd/1lkbvxpkSDg19ofW60Dpg+IO8qcinY2a3gW0a6ypA+W8PvTunYGx/6YDbhPb+pmhKB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730825145; c=relaxed/simple;
	bh=GqxkKxfCepw+WI0L9oUkhsjWH1YFkyvLJN/ydsnKHRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C146E8nrX+B8QE1QhZgl7Kb7p6Kd3h4EavAbgPPgZPnrgwPisnLdBBFzjgU/wsyn1Ox0tBqu3fT8McgPKO9hnRa55iqOuDwRxnAgD9nHZvMcQmiRElf0S3lGjqiRpAi9YQh2hU2zUmKNQLq0FQ0NRu1EFKneIL/h7gtEK3FCvI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g4TRtE0U; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f6e1f756so6028144e87.0
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2024 08:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730825141; x=1731429941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eO2Rc2ylDy//zWsYbxaCN7+Jb/tGlO2igB2V28DpRFE=;
        b=g4TRtE0UaQxF3cXKTIoQnEz6iL0ZsjO1SmYLbveO8wd8Z7EZLGDpB2TA8D1jjMmovA
         fXiLo5KOZfGWgxRSNE0SBXD1sMkijhX6MTKYYF/IAt7vaFsiElaujhn9CxKqCfiZJVMA
         oBTV7NifJEoo0GidMxUe6Zwrv7wVTWqPCuqOx+wU7zOsm+AxdehwnvXhsYV6pk0+aRsI
         wGmlUS4M+gh+ciIJDyUp92M4rz5RnhH1bHWY7F5h3Fvl7i5nf6Ik3c5gejpvMeNJKS4G
         zIxyeYy6seDk9XuVIRa3E6nH+EC6uMuIHYP3sqMxEO7O45PN/A7O4KBQw2HwdcCeQpwR
         SdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730825141; x=1731429941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eO2Rc2ylDy//zWsYbxaCN7+Jb/tGlO2igB2V28DpRFE=;
        b=DKq6AeHmBBDdXPawsXEafvn9oveRW2n8O2XeuojkfaPsrqzMb0legl/r47V1qoj/XL
         zbcCHDNnkGhOYD6AJW6OlAAklEfMZIEKZH8F5Fu0AJpDKqv1Nq5Y9xBYESWJhK9h29k2
         08n9dRCGIn2IuAUEaUnOkj9fmsbjErqinB4emiYi1FFRlQNyGGCkc+HoBnhQD6F6/JL/
         uPhdwaIgv5BKFIX11nAHX8pVtDOWfiCL+XS2N6k7nweu7QuPHsfhjuwUkfrxTfC5qWg/
         9Hp3FmEiHD+DfwDhQbT+LTSZ0JCzUHPgjGqmsbryTtSfbOQP3IsKPlrSANdRwouSh3sa
         YBUw==
X-Forwarded-Encrypted: i=1; AJvYcCVy6QxscsEI8S+BAz77Dc4KyeZIpKpsJxIk7Kl4kNmWe12R6s4fxYlTy5juTMhGYfiQ+FClwzmNHKJSQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXISURZ2y4hmQz8DtSzFwPOmyTBwzht9eDURshY9OAQcbNoYwh
	FXw1gou2ID9MHMJfUMWNXkDKEdVZXCRDkRe9qIVcjNu4n7qXYdcc4rNBQYoDFtU=
X-Google-Smtp-Source: AGHT+IHbbL60OFoSRKrDaKJLcmCLmCs0FTzW4o/g/NDSmkrMXRKBjyIAqB/wjh3gYIeBgf3U9lFeTQ==
X-Received: by 2002:a05:6512:1307:b0:539:f886:31c6 with SMTP id 2adb3069b0e04-53b34a18f24mr19234091e87.38.1730825141265;
        Tue, 05 Nov 2024 08:45:41 -0800 (PST)
Received: from localhost ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d698055sm195385765e9.40.2024.11.05.08.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:45:40 -0800 (PST)
Date: Tue, 5 Nov 2024 19:45:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] media: xilinx-tpg: fix double put in xtpg_parse_of()
Message-ID: <372abe0b-fd67-4498-883a-7139632ed43c@suswa.mountain>
References: <f41dfe97-6e6c-47b4-91bf-199c5938c6d0@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f41dfe97-6e6c-47b4-91bf-199c5938c6d0@stanley.mountain>

On Mon, Nov 04, 2024 at 08:16:19PM +0300, Dan Carpenter wrote:
> This loop was recently converted to use for_each_of_graph_port() which
> automatically does __cleanup__ on the "port" iterator variable.  Delete
> the calls to of_node_put(port) to avoid a double put bug.
> 
> Fixes: 393194cdf11e ("media: xilinx-tpg: use new of_graph functions")

I guess the CI system applies this to the wrong git tree so it says
the of_node_put() calls are necessary and it can't find the Fixes
commit.

regards,
dan carpenter


