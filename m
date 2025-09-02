Return-Path: <linux-media+bounces-41574-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE03CB4011C
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 14:47:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 405137B6F5F
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 12:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC05B298CA3;
	Tue,  2 Sep 2025 12:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iw91XQGT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00B2299A84;
	Tue,  2 Sep 2025 12:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756817047; cv=none; b=BpMjNDxrbf59vedFxpJf7KK2DLGU3WPJKBT2ZlpK3f1qOU/jvB4qmFbyySe/erBZVItsbFVUAEdyju3240Ejn7erjAW8pt5o/TQUqI1zCfDQHkGrNlAPnBU0gAh+1arhlkJAg9e0ulsVv1TdgM9UJOLUa4wfIz4vRb3aL2BvkX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756817047; c=relaxed/simple;
	bh=rxONkSw+u8dslVY1B0mzmOY/vdK/Blvlepq4yW8E0O4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJxVZN7ERT56XPsCR8JdBdECI++25ki1wYLxFRrBoqaGMnyg/dntIynVlaVXbyf8PUFQo4wS8tcl8TbnAKz26AEymexZLzXUgiNtH7DeGnWdDVhw1vY+xQ5fQw9McX/PKNrj6cMt9euH0rgWo2Swtp8dgxwKAyVOw0Y6fRiJxQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iw91XQGT; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-32326e20aadso5799682a91.2;
        Tue, 02 Sep 2025 05:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756817045; x=1757421845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yb8drcEYLJ/G3KDmSU2SdIBlSH9YRBB2QB4119jTYcY=;
        b=iw91XQGTyh1zK+EdtGlqypw1jQaY5myOB3Q7VbPs/UI71CkQqXfDTTy6ppv5/+42rG
         984QWqKLTEzITLxiDWhdjoHxvprv2r8j+C68fPuh7hDScnMj22wdwzZ/jDGUcgu2nAvE
         OMcKl8OLahmf9wDOyRGeU9L9I1XwzQ0MsZ6u+PeZXu5vrSYePlopeEkzSjfk3NL+3oxs
         fJ6t1n8nsalMFu9jtd2qcbz4DWG9+WA4VC+R53ow9hj5X3fbmvxe31VKemQzd7r9aZOq
         YMnhR4huG6YMcUUKlxVZy49LlxvvTT9FFeiNWmm0KuQz1SVSlyUdLhcQ0pikLdA6IZ22
         5vkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756817045; x=1757421845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yb8drcEYLJ/G3KDmSU2SdIBlSH9YRBB2QB4119jTYcY=;
        b=Yf0CESJs/eI3Q29tOdqoXz5T0yvWpkIb7TLS+Csxaostnza0ZDcmDI8uPUYzKEIIDs
         tkSKbt2sA1vvRMCD9i98T8ISapdA7KDJL8GmQwyEzh5aZDTb3w9l7U5PAciEQx3CT1RN
         RRkJVrW0OefXh1OygC+4YSgC8TzbTF4cc8jjwmvhxuVhLWsd7beUN4CUfJ++sEBKR7xZ
         +UA+oOEfgZc3DN7G/pr5DeJhfku5uytFGwDgq6aOwS1IXLBYTKb0PQlcwdvqPYzn4Ecb
         gAW35KqWYeonQDCPSXIiUxezY9BnvGUGKFunenVHD6HYsfL23i3C5Tz07BYBd5QYGRgr
         /PrA==
X-Forwarded-Encrypted: i=1; AJvYcCU5q4X9VVFTVKkgOHFYz2CWgdAZfFQ85gHTsgnjHBSqmWtD4TkBz1/TQEo0KwnKR85DCu3o9UDGyto9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3TqWDxPW9RRU3WRzposXPqv7kXXRftDYqE056BvcaUa/gFW7i
	Le690SmjL2nu7VHJgijrrIcRvF+Y8AKX/4fgWtfYT6l/FuSgFy6hPjDQ
X-Gm-Gg: ASbGnct0XN7BTDqHyNKyrsb/5aFMDVNPW378VS08zmpLpBLcbDTkkxR2OOVVhnPAIE1
	g4Q5FCYfsSTt5XzKZCkhKy/T0Pse/V5RvlqBXp0XUyEe4sxgXukpIQSPi0/XJM0F0kfc+Bg/WvB
	bMoVEKpdVbavDabgl7WGIkpNRT7Jcg7nsqnGOAj5nixyZpBBuzYkWO8LPES9doTQ1TEAZ7UWsYh
	qTCTAMd5Tfvmo7pJ896B23alJKy3CuY5pERZ/xEpZFFFG+Ho3aYjUFOhYBATCLM2rGJuv4MkCAH
	+OFwsbkLiTH68TmGwRPlJaolfwQjYxtAEzEL/JJaFUf7aieGEzrYL0saMOcVjgpDlbApmtzesnI
	sKHBStz1TMcGsKXkUL6zT+7+d2Elidd500elh3XVyUjIYe7O5qxd+zq3n
X-Google-Smtp-Source: AGHT+IFwr5iuZl/eVovKQjBPYZk6f1WWpY9r1gCyPrcBGzObywlB7xLEKKnGCZPK9BZMiD8MPZYjCg==
X-Received: by 2002:a17:90b:2ecc:b0:329:e3dc:db6c with SMTP id 98e67ed59e1d1-329e3dcdc0bmr2843860a91.23.1756817045065;
        Tue, 02 Sep 2025 05:44:05 -0700 (PDT)
Received: from dragon (104.245.102.166.16clouds.com. [104.245.102.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327cf042f97sm6380318a91.8.2025.09.02.05.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 05:44:04 -0700 (PDT)
Date: Tue, 2 Sep 2025 20:43:54 +0800
From: Shawn Guo <shawn.gsc@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Stefan Klug <stefan.klug@ideasonboard.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 6/6] arm64: dts: imx8mp: Add pclk clock and second power
 domain for the ISP
Message-ID: <aLbmijMP2f7HXRGV@dragon>
References: <20250616011115.19515-1-laurent.pinchart@ideasonboard.com>
 <20250616011115.19515-7-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616011115.19515-7-laurent.pinchart@ideasonboard.com>

On Mon, Jun 16, 2025 at 04:11:15AM +0300, Laurent Pinchart wrote:
> The ISP HDR stitching registers are clocked by the pixel clock, which is
> gated by the MIPI_CSI2 power domain. Attempting to access those
> registers with the clock off locks up the system. Fix this by adding the
> pclk clock and the MIPI_CSI2 secondary power domain.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied, thanks!

