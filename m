Return-Path: <linux-media+bounces-37706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB5BB0471F
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 20:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02AC21A68164
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 18:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE80226CE00;
	Mon, 14 Jul 2025 18:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vVaYetOC"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BB926C38E
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 18:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752516479; cv=none; b=GWwJbHqJ9rl4UBmyiZHgmgQmtuR3WD31bVSjOO/M7eLv/1N8JExO+ZCO77Cb9V7uCiMO6VI0w2xuH6S3g4CSWAL3/ssx2Bk14W2vD3ld39oaqPr+o/dja5vjsaK5l+TZuNHb0zVaAGPSVBXw6kaCJoCsNO2+reiceYkfIuBl8uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752516479; c=relaxed/simple;
	bh=4A6NEnLEDVYPdt7kptKVv8KoV4dKTNbBlfJrN4BTURI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wl4xi7LJrMfO7cvmJwT6M3QO+hhXFmgUTaKxkfPI/aU3m3bYbWN3JmfXIeqOO4wgJU+xFhlACdl55WlUd/vYvb91sr8XY9sb3roa5ju2U+R3dHvKSbsIU1kV1gkBfW7t9/TlUW6pQkB2ru7jA4mbmbzrAZxz1713iGscAwwohMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vVaYetOC; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-2da3c572a0bso4288354fac.3
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 11:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752516477; x=1753121277; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SkqPZJTfP/dXrtN6W5XHyA3cwGmH6cdb96S+qyDy9TA=;
        b=vVaYetOC5+3b5f2gBfpBJXEzj1MU4TY5MPOj7e9fyTXRIQvMG8NvjEKG/Js9ctjgjp
         OdYSZextreSbtAHpwp5XmM+mMn31mddi/irKpQzOLrf6hhT56ZrrX/FPVjJcUejhyEmZ
         m60CQ70v3iMq17x5fEsgWIYt8qLms0YUsR9huJ9gM36FRe23hjI0xt1n2zHfQcFcI+mt
         7au/fjk46QaCjNad/chpp73JeTsVT2m4hH7NRCgAg89S0BqZoVuhefWP8ihnsBiTO5ge
         rcRhPJO4Z5gA3gU3hYkiWFCutGKfsSBLOzDeo3d60bSDODTwD67SgkJZGkfBEuLfw1P6
         fBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752516477; x=1753121277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkqPZJTfP/dXrtN6W5XHyA3cwGmH6cdb96S+qyDy9TA=;
        b=egl3NQyca0kkR96QNLS6C6Pz/DpF7DjD7x9lSkTqLKLoIaGcDHfyolaT4grzXS0OcN
         MDwg3tswsMj/qA/L8zaSi6Z6pIckAnjnOAy1NgRmhYHuBzI+w3szSIueQR4hTTrYVpss
         iad9z2UGbfprfaUIBA7DlzthSOf2ktlmSSsIvcQtbaHseXZonmwVybYidnbTmMQit3Xq
         yMQL8hI7inCyoKEDU/eW+P7TUKYChJp2OZ8ZMkJJgzAamJbJNSS2+GFkwrGED/Kq9Ppa
         bSK1kPgpdMOhRv7huOw9DP5M9zWoWbfpxNgBUSLXF6Uzm+WMnumtgh9vjqPxVMElB+OO
         Neng==
X-Forwarded-Encrypted: i=1; AJvYcCVHfTohFqXd210DXb1bSehL8VVHmKX00ewW/ybcb1ehS9hmOniJ7qZpebOJivqzQ6lJXsLkyXmFIKlkRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyGq+7Lgz91a2aCq4hFJkPVn5uo6yMansXahai9qpPH5d07MFo
	q2BsSDOnPwvidNbXHPtV9hHZaCt/tONzoGZEev6q4NaH3Xv8AQlKrT3lYydAUch9b6opZyJp1AW
	2XyS6
X-Gm-Gg: ASbGnctqikC4QlZ46KJ44KMYSgNNfP7Cd1i2jkvz9OsQNjMeGhJQ5fsPp4DPvtn65jY
	r3WF83+lHW3+PpbNGc/iQu9VqmnE47lJmtxOxKRgWmJ0aF5hGFv+ZWB0Kn7xcQxByoFA5h3jZu9
	kRCas/sFcc1JpWfGPRrhFG47juPOIOduXRyHq8hD+FOYfz2aggH2yBH5iyJ0f15sxkvfSPr3ZTe
	mm83+c8DyCLn+YU+CJBV22U2ApAozA32diEMgh526o8dSvrqnKTdeaE809fCyVEBCkQMp2/PhLX
	BTeI/SdtVGCAwlK/SHN8WN4QctIKNmc0ujgpPlhuZ3ho8fboS2x8lw8B9UuFp9nBSKyLvDFn3G6
	TnyRNcN6vO0l5D6JamTbFSnuFvb61RA==
X-Google-Smtp-Source: AGHT+IHEpey/Ia+RCf0jqI32ZfN8fKiRgnukKmQ9MOBS/IEh6vRzjjE5dHNk9XWCsGIIN0hQXIQuqA==
X-Received: by 2002:a05:6870:6e0d:b0:29e:3c8d:61a0 with SMTP id 586e51a60fabf-2ff2670e0a4mr9867811fac.8.1752516476616;
        Mon, 14 Jul 2025 11:07:56 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf1272577sm1640198a34.43.2025.07.14.11.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 11:07:55 -0700 (PDT)
Date: Mon, 14 Jul 2025 21:07:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v8 1/3] staging: media: atomisp: fix indentation in aa
Message-ID: <1fabf80a-0172-4bcc-bfcb-96a7ab5f08be@suswa.mountain>
References: <20250704-new_atomisp-v8-0-2a8560cbd9be@gmail.com>
 <20250704-new_atomisp-v8-1-2a8560cbd9be@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-new_atomisp-v8-1-2a8560cbd9be@gmail.com>

In the subject "aa" is weird and confusing.  Say "ia_css_aa_config"
instead.

regards,
dan carpenter


