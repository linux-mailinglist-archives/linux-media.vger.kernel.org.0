Return-Path: <linux-media+bounces-28403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EECA0A67149
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 11:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D21042284A
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 10:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B02208961;
	Tue, 18 Mar 2025 10:28:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04A9207670
	for <linux-media@vger.kernel.org>; Tue, 18 Mar 2025 10:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742293726; cv=none; b=VR6ePF8QeznhdB1640W2S3VpTnesdqnpH1+S2RaC7Mh1RLy17U+HtsAqwLGUiFVoFQc01yHJnJ9D6UVNEFmTJl6LDBOHRZe7261/FdlNcncCAW3LiTdnEUlzVs/eocphXHTAtbNIICyoWm+tI1l0Ewtu+NValU55ognHEfziMGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742293726; c=relaxed/simple;
	bh=0Yf8zwe0iIiSKI0Dg2hD7OmFQpt7e+kC2AcWFL83mwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7uOeEpyPyGXbk17gCE/96Sy8hleXwJjLyf1Tzsv0XAgbxVaVrquzVfmKc7N3rs92yimn9GEJohmes6LtVPdJloZ5tkvGtmUWp00IZzl2hsIZtO4RaqKMiTlGQ7EexWbznCXoQJsLTegziCTvC2jL2QSBPz8V4wJTj12Bc+FqG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2263428c8baso88155ad.1
        for <linux-media@vger.kernel.org>; Tue, 18 Mar 2025 03:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742293721; x=1742898521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RM+okc81SddqYQR5Qb68dWyTT/KjxhqC4j719LC3UJ8=;
        b=MQczMwyyEne4nSKOT5KKlozGnCnbWc3iWLJW6fmHAoXsICLsYReUGlxQB2JJ1rgR+j
         KS8bL+uKG79ME4ae0kvGijF+CctEs8NMLY8rrw1MY6sclUaZLx84iJ1ngW9iZgd1l7wd
         ilRNaI6bQgjtWR8JFa7v899QJPXFJQhs/O9uJu2Rkqvw2SQ0OixcV4kn3cwGZ6SXDxGc
         OpEMYbwIV6CmIdlJGqOyxG/dcsUuyzs2yTY1BAAuZgeSb68j0WPqZfBzeEViD6s+j0zJ
         vV9/tg4sNWGz9M0O7DW+qjnQqdjIzFrSfO3P5SDAB+zv0zedJYv1+AlLJcFit5Z8TGgu
         E52A==
X-Forwarded-Encrypted: i=1; AJvYcCUp5BSXOQfcA5obrg12HcWz6Xex4AI/WibOTr/v3jF6CPxPygZKu/Hsj8ykyG1yGiUl2fqUKOnKTwB3xg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtm4wYFVtfYnjF/8ovrHRCIc3FjDxp6R0NWEVk29Kdk5CjLAcn
	FAarvzgvh95ICtR1Udc0KgRvxhsyUNUeA3s4nPyagexEaXJ/CNeaYHYxF7MUJPa7HqRJmCG6ax4
	wp8qK
X-Gm-Gg: ASbGncv4uzRVF/H6P/bnA8az4dG/xBw2jzsux/4mdRwaBFcOXFCSK7YWJq6FL4b2yln
	txWSHGZllN+UXf7pZLRTEx0DocaRVn/rsRRm/evIMsEpaOKbcafAIP3Hkln+dSdX11/B/7GjWEQ
	ULSx84wfGg5R3Hed/R753CrP0csEndOCqZMbKxEdvVnH2kkrgOZLQCN4m+jz/RIUVP+wPiGpZcq
	nH74B2XrG36hXeI9EaZHGworCere3/hjISXWnCct8/8bg/h4iagaOlBnIADMbKllDc5gxQ2G1cb
	s8mQOjnmVIOXocCS2jbAbNbrzlylk6RJReb+OKKSZGjEZg==
X-Google-Smtp-Source: AGHT+IGKc8EaZI3unlc+kVdriOoL1O0l9vdYG/4SJdDspSPx+oktmGGKkLOFcJKRAjb8ZjB5EId3xw==
X-Received: by 2002:a17:902:ef43:b0:215:8232:5596 with SMTP id d9443c01a7336-22630eecac6mr1808115ad.16.1742293720753;
        Tue, 18 Mar 2025 03:28:40 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:a770:ff91:7d61:7179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd5da2sm90801825ad.254.2025.03.18.03.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 03:28:40 -0700 (PDT)
Date: Tue, 18 Mar 2025 19:28:32 +0900
From: Hidenori Kobayashi <hidenorik@chromium.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: vivid: Add more webcam resolutions
Message-ID: <4gfphzokeqm4rx2ggxz2pq4wekbuqofpzrfdasafuk3h5xzlip@xwbc6jnd3mdj>
References: <20250314-vivid-fix-twice-v2-0-dcfca4053704@chromium.org>
 <20250314-vivid-fix-twice-v2-2-dcfca4053704@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314-vivid-fix-twice-v2-2-dcfca4053704@chromium.org>

Re-sending in proper plain text. Sorry, please discard the previous one.

On Fri, Mar 14, 2025 at 12:39:41PM +0000, Ricardo Ribalda wrote:
> Add 3 more common resolution for webcams. This is required to increase
> the test coverage of unit tests based on vivid.
> 
> Co-developed-by: Hidenori Kobayashi <hidenorik@chromium.org>
> Signed-off-by: Hidenori Kobayashi <hidenorik@chromium.org>
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/test-drivers/vivid/vivid-vid-cap.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> index 623ba1e5e54791c0ac62aa2f0fcc3dcd444c873a..df726961222be874c39d19e1fb457bd816ab45fd 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
> @@ -25,9 +25,12 @@
>  /* Sizes must be in increasing order */
>  static const struct v4l2_frmsize_discrete webcam_sizes[] = {
>  	{  320, 180 },
> +	{  320, 240 },
>  	{  640, 360 },
>  	{  640, 480 },
>  	{ 1280, 720 },
> +	{ 1280, 960 },
> +	{ 1600, 1200 },
>  	{ 1920, 1080 },
>  	{ 3840, 2160 },
>  };
> 
> -- 
> 2.49.0.rc1.451.g8f38331e32-goog
> 

Tested-by: Hidenori Kobayashi <hidenorik@chromium.org> # v4l2-compliance,
v4l2-ctl --list-formats-ext


