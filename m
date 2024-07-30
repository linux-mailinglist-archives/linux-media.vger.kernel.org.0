Return-Path: <linux-media+bounces-15583-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C7E941596
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 17:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 374941C22A92
	for <lists+linux-media@lfdr.de>; Tue, 30 Jul 2024 15:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DE21A38C6;
	Tue, 30 Jul 2024 15:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BIByJ6xt"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC581A2C0A
	for <linux-media@vger.kernel.org>; Tue, 30 Jul 2024 15:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722354105; cv=none; b=LMdcKe8CIbJfo8X+ohCpGiJfOh2tZz8wLt+C4mbtVgETfjIlyYNmtQJ+P8L8T80yLLWHz7pLhu5xXECED2BGFcmFLb0nctVWDO5EskRUfXQZXFToaCZh1mclelyt0Daqa0EyejKj/Wq2ThvC8nk8XnzXcqQpv6pv8SAQqVqiEkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722354105; c=relaxed/simple;
	bh=6S1+m+RU5TP0WJO+ATrG36zohR9UGzfg3bpcYcZuyIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4jrnkr6pzxCdzEPN85u4GHAMsTEIheMmHp9pgwbu7HxrOAO0s+oEAmgjagfVKxEHiQmdN+V5kLq1BhU+RUcC6hozqYxBwH+cAiNIxkbyn1BXgY4IndjXMcFKsBnb8tDgm1JvNwbRYwOztTwEfvQJBQEfkBJBHTuFliQqQNqq/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BIByJ6xt; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-260f033fda3so3082241fac.3
        for <linux-media@vger.kernel.org>; Tue, 30 Jul 2024 08:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722354103; x=1722958903; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QOYhoQjLh01grFeGpfGAtgBAV8l3EXt2trNxBAoFc2Y=;
        b=BIByJ6xtp/ijXxEHzvIL4r7Tj7CULE8pzjrH0jtl/CPmPskxaCK8tgDpmAuMQcTuSy
         JJvV1uAwAdEtlhdGJpdIPc0LbJVcPMzFNKHE/QYR4CIj/uvdkFKROeKk8TsRh0wv1V2y
         6JJ0Yb0YHHOJVBYVmG5ePrVumm0cDmxVm6thTLE5z//CsBXrDqJDHnl/UQyvlmbDFkEV
         ST2h/0o2VGk5APQCTmCu9JR7jhBoqgdgSxXxknUY0ZkT+QdDjpcvE/tMBy1kJ4USoMH9
         ttsZflmPIgxQt4QAWJqadTxWenaWjwUjQKPL7DSzS4kllJB6ZyRd3hQkLDkY9QUSpCdu
         EYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722354103; x=1722958903;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QOYhoQjLh01grFeGpfGAtgBAV8l3EXt2trNxBAoFc2Y=;
        b=C4LxwqbiZruGvzD5ZszxcS/5TsRwLIjhJUmuRuF7v32AVoh72EJTG4IZoMMZX/83VO
         Aer6IrSDS1m+1OSwJmwgBYfEL4x40Dxzl0LSI0q0X9RfC8Xt41PFMXRtLKQ7vpXdY8xP
         XChwHKtWsHdBkZ1MhjVkS4G31xYIPncFIjxIBkThUv30Ipx6Fx6iSOnt+InsNV2Cdlf9
         5CuiZacOKCSppNImG5L8abWHNiUopT/2PGEBsRo/nLBjNMcMeFqvigoCBnQSajWUA/gY
         q16f3QS3Qy6TyOi24PrFgis6VDulby3JK9NEaNTFtGFH14wVU6UHBTKGKsT5HbcdtueS
         C9SA==
X-Forwarded-Encrypted: i=1; AJvYcCVyokOSfElCTysZ72Us0/WEUZdpgdycemR2W22pDb9FKtAjW79qOj3PH+6rivPV1zB01yX860K/NOFchNjUd7hS1vZAoChWKZ2XgWU=
X-Gm-Message-State: AOJu0YwVcSdZpI/qkkP2bw0V1KLzqyDaPes41SYE8tAzC64n5zLAZt+1
	x06iA1f8hIVO1nGPxlvgwOj2OJWDa0JM+mCuyzz4aKaUU6kAHcaGs4+bsq9ooKA=
X-Google-Smtp-Source: AGHT+IGqePBFhhpk8DQstbQ3a2wmKNDOtmsTlHz8YGGpoYP/ywMn8gIPcKM/fxeJ8kWYjggfjSyb2Q==
X-Received: by 2002:a05:6870:519:b0:25d:dea:456f with SMTP id 586e51a60fabf-267d4f36803mr13457664fac.42.1722354103139;
        Tue, 30 Jul 2024 08:41:43 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7095ad4e936sm428038a34.7.2024.07.30.08.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 08:41:42 -0700 (PDT)
Date: Tue, 30 Jul 2024 10:41:40 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Santiago Ruano =?iso-8859-1?Q?Rinc=F3n?= <santiagorr@riseup.net>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, helen.koike@collabora.com,
	~lkcamp/patches@lists.sr.ht
Subject: Re: [PATCH v2 1/2] staging: media: sdis: move open brace to a new
 line
Message-ID: <e7fb44cc-1a48-4486-b9b6-e505fa1a4e73@suswa.mountain>
References: <20240730080628.991297-1-santiagorr@riseup.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240730080628.991297-1-santiagorr@riseup.net>

On Tue, Jul 30, 2024 at 05:06:27PM +0900, Santiago Ruano Rincón wrote:
> Fix checkpatch error "ERROR: open brace '{' following function
> definitions go on the next line" in sdis_1.0/ia_css_sdis.host.c:239.
> 
> Signed-off-by: Santiago Ruano Rincón <santiagorr@riseup.net>
> 
> ---
> This is one of my first patches. Could you please tell me if is there
> anything wrong with it? Thank you.

v2 patches need to say what changed since v1.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter


