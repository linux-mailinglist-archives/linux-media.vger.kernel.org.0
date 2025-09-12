Return-Path: <linux-media+bounces-42460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E6638B552A3
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 17:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D9D874E343B
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 15:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE00F212568;
	Fri, 12 Sep 2025 15:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aBv7gVu2"
X-Original-To: linux-media@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6631F8724
	for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 15:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689459; cv=none; b=UV3uNGk3rw00oECM2TpwtkZ6Fx72C60hn4A2GHiyCW5rAwq5+fE9LJVdNVxdNvjnYdPQTCPoE6MF1pcuM09fULeE9nNTeGj856z6pfmN8idtNNIfq0gaII+eqw9HXZVlWncgtasSHk0X//CX0+BroH5/5hDti5PkLXVkfBrJxPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689459; c=relaxed/simple;
	bh=2U3DqoOB9c4gUI0P2Jy+1Db4qAN8DMTnVvxyqVJIm5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWl1+eaRe8mX1rAv8My5c8BzzwHt+8YyaqmXfTexy0OEBz5MlMbM9buHjE+7rSSOaD6UFXn7mtOGXzE1hVQ9XW9ogIzd1vQhP/XV6feTVR3g0TsYPo17dVfq57vIY+Zcp2i7WZalFlrvUmX0X/lfkk+oKkS7AzXDtUPHAIWBMuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aBv7gVu2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757689455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w6+03+6KMi0xIZ+CNaQJK/sgah2Ln0Cdnhj4ONcK25Q=;
	b=aBv7gVu2kEbiZH6jD/Sby3IKGWE4H0CDf8ZD5cD5xv1GLx6ccUnJKYRN1dWqLOJhIVkW3b
	/RqjRnLAqcgP+B+aolVHD3wFBYQebSjhn8kcDaDiN7B2FZNgTKQwcVI6Zhag3Zbs6NXWHN
	Nb67+pfpHqy4lndUlcksvuVeQEIEUWI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-MBveN6vEOo-8tLG8cKJhdQ-1; Fri, 12 Sep 2025 11:04:14 -0400
X-MC-Unique: MBveN6vEOo-8tLG8cKJhdQ-1
X-Mimecast-MFC-AGG-ID: MBveN6vEOo-8tLG8cKJhdQ_1757689453
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-816ae20ff2dso393288685a.1
        for <linux-media@vger.kernel.org>; Fri, 12 Sep 2025 08:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689453; x=1758294253;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6+03+6KMi0xIZ+CNaQJK/sgah2Ln0Cdnhj4ONcK25Q=;
        b=UilebqJ25FnKjjnf7dq47YscYawsup0ftlBIbFQ+NIoe9mSUabhTE2nfWVZKgOIvqz
         vzYDvXqjXV4V92tFxeHP9pH3GswaiVYbxcEXcf8H1iGerDDjc4qdu5HD5183Ef5erQRe
         ms3G57TjcItwn82EtXTWPzR5XHs5khKRgNOZrdc4QCb4Vwl3JM2mQh2NVrTzi8hPBGPf
         EJAN2YxDc+FADFKBkePy8ryRoMbPnimRkIK8f0+M3kXQL1qJGm8xqhW5aDK2FbSkP64g
         y6J6kCB6YQwD9p1KxV+2EW2/la8jHAboLEeINneZv6EEORGsyxsrqU3lefunGeOuyFd8
         cRIA==
X-Forwarded-Encrypted: i=1; AJvYcCX8afx9NCU+cDTN0TYBrIXWjPTyqJTaOLKl/QPW17cA9wzg1/fS0PGQMLl/HHilmYQmwWnWLigPtG+1Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDCgU2IpERWgUoaeOh4PRmQoQvk0cA+zsJc1fWDLF3YHWnYcD/
	YA1Xg3pa+15swNypGYQp09v8Wfs/oVjOMlALv70wwiFQAJYovU0h6KyBqDhbB21fxb8UbFo5wFD
	uEmTlJcWXTdPN/vrDGmYOQSFq1eitLEwJuB6m9YIepXKofVHwUUKo9QYEor1sZD8L
X-Gm-Gg: ASbGnctjxwKcwqwfTC05T/Tj46luIangotbrAUcQwDpL+DhwUdmI32KxWWUoEXKXsaU
	+tjXww9RRvXJdZ2FDeszhJXu6o0NleySydxEgXxj3EZ7CUVqCQVk4S8NhwaLDYqxJ0eTpeOsdCM
	qc2774/9SZn4v4KKUNfaXNtfpqFSOixRKbVbdiR1TiRQu5kRQ728acx/nlLTGsnd18WFwsVbtAq
	lbGvQwf2ISqb5b0se9qKeW5ovyNohxiqaB8my8/bEIhl9K9Rw3+kc1DWwfNOndEyDHAwFG6boXD
	wqKe2km4uoPuhqRTtuDJ/ymQZPDPXeIMea+lCA6glUEFenbIyeCurszy0+ZJcWKlyJJ19ZAyjcy
	OfFpynq02kTZxoQoAUz/eedlttTlPuA==
X-Received: by 2002:a05:620a:28c4:b0:810:bba9:d089 with SMTP id af79cd13be357-823fc987678mr477702085a.32.1757689452958;
        Fri, 12 Sep 2025 08:04:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEgtgh/Gg0WuKmmKqdI04apG8y63BvE/4WJYY0ss9G0WLraw6KPsoUpne6BKqb/M/2Jd8L2w==
X-Received: by 2002:a05:620a:28c4:b0:810:bba9:d089 with SMTP id af79cd13be357-823fc987678mr477601585a.32.1757689446310;
        Fri, 12 Sep 2025 08:04:06 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820cd704b90sm283525285a.43.2025.09.12.08.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:04:05 -0700 (PDT)
Date: Fri, 12 Sep 2025 11:04:02 -0400
From: Brian Masney <bmasney@redhat.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 5/5] dt-bindings: clock: st: flexgen: remove
 deprecated compatibles
Message-ID: <aMQ2Ym1GL3ZbyAOI@redhat.com>
References: <20250912-master-v2-0-2c0b1b891c20@gmail.com>
 <20250912-master-v2-5-2c0b1b891c20@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912-master-v2-5-2c0b1b891c20@gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Sep 12, 2025 at 01:36:12PM +0200, Raphael Gallais-Pou wrote:
> st/stih407-clock.dtsi file has been removed in commit 65322c1daf51
> ("clk: st: flexgen: remove unused compatible").  This file has three
> compatibles which are now dangling.  Remove them from documentation.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


