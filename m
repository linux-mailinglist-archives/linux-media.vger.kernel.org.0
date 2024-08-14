Return-Path: <linux-media+bounces-16268-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F362695138B
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 06:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3055C1C22F20
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 04:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD9354720;
	Wed, 14 Aug 2024 04:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cJrS1Fe0"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2305E38385
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 04:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723610505; cv=none; b=AP/koBs2Y91QDrQRPSfF7+azfh7hkc6KZ6gu46GfLCkv5XqSe+i+Gl9GJZ6peQlPIhRgh2GE/FQxZP8X8tsCs8ufItJ3UxdKxqLcU6e9/cs9k8hegapmHJBLtTmltoeL8pP98FdJxzwn93kE69pmAfRKa3ZKTIv1/MOqXj68zZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723610505; c=relaxed/simple;
	bh=WQNyqMcKW44XCLFC2YkMyCMhspS3EgYL/ooMD/x42bY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmaRvfSxeRIepiO78qgIyGXBhPTIirHVDVGSTdiFaKsf8mr+JdsVmwE5dCL/0/KS2q6/XtGCJVLbxLdXGW11/sMJjf2nPMA6XBbXMlZJKEQ6EVHQm2oGGOJT6tnalA8CXR0pedUcQo3XdJ89Wdil7q7ir6yjHXb9z/wP/VZqIis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cJrS1Fe0; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2cb56c2c30eso364620a91.1
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2024 21:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723610503; x=1724215303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9yGZSHVjYQ9aqijE7e309njoaIKkre7O560JhEdqjQM=;
        b=cJrS1Fe0q8VK6QBOQQSHurPTOYUkppHBhKv7D5/pyceAw7dkNnKT0jRvIgBmh0qPaX
         bxLWsdLY8018r//baebOA1dFDmSVoBj/IcyJEn3Bc5MjvQGw5qz859m9ClHk+3PQVUwY
         nFIW3gZm8GfXU0ejfPup6sCmb8SZQz233r9IE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723610503; x=1724215303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9yGZSHVjYQ9aqijE7e309njoaIKkre7O560JhEdqjQM=;
        b=idHOXAYy/C1mHQsNvjaUTkCV2rsd2Za/XpghObTGbSqxshnVPVcLIoysK8ThAzEXrD
         7k985IHQ6A8OwU5QXmpe/xVXH7UVF4LPHQ9L3yBV9BmIyiq5fUPOr/hO/PrgFVxH7e5n
         dO+QCuWw5+i0ynAg7wznwd+MOXQ9N7zRA5LO9t4b0KhTthpa8dNYdwhwm2A5A/5nb27u
         dK/eVc/JXwD3eCPRXWI7SU/l+q38HTh7+EysmShyhVn7YqFvPZ2YeuYhOIzXR6+HtNQK
         umvoJPFjyLacoNprgRMHTX17YrlIHU313tQ3R9ocMe58N3Wxcmq7jFRhk027wMuzzWSo
         Q+rQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtlcRJ1EvS7F6DZHwk6vXjMf5dzV/zQaYybnYEawhSaBkA88xuaoQHVyB0ZrIU5WxrFM7AosUsx250Wj5U0T2bs0dMA+jq21SMRo0=
X-Gm-Message-State: AOJu0YzWv1ICYixWC9xM4YVRkySnH+Z3cYZd0kviodOSbHaoEnBRIFBA
	l7PVA+Tz8Hx+thiCmM9ZdRbTVEjzmyJcpVp9gqVO1Bm5qE/Mmf37Hv3bywMWOw==
X-Google-Smtp-Source: AGHT+IELuLGAsaW5mcR7wJyDZYVwjV0ICWG7mOIH3D74CpzZArxQD4ZWE91i91RO0YWRvGanjh+bAg==
X-Received: by 2002:a17:90a:9f85:b0:2c9:90fa:b9f8 with SMTP id 98e67ed59e1d1-2d3acbf458cmr1484709a91.10.1723610503359;
        Tue, 13 Aug 2024 21:41:43 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:1432:35df:53f:489f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3ac7dd3f0sm511322a91.18.2024.08.13.21.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 21:41:42 -0700 (PDT)
Date: Wed, 14 Aug 2024 13:41:38 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 10/10] media: venus: Convert one-element-arrays to
 flex-arrays
Message-ID: <20240814044138.GA8686@google.com>
References: <20240813-cocci-flexarray-v6-0-de903fd8d988@chromium.org>
 <20240813-cocci-flexarray-v6-10-de903fd8d988@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813-cocci-flexarray-v6-10-de903fd8d988@chromium.org>

On (24/08/13 12:31), Ricardo Ribalda wrote:
> 
> This structures are not used
> 

Why not just delete them?

