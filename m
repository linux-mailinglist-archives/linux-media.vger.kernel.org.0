Return-Path: <linux-media+bounces-20932-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D52569BCE15
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 14:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12F3E1C21CDA
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 13:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B1111D6DA8;
	Tue,  5 Nov 2024 13:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VTtEbvlT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2983D1D5ACE
	for <linux-media@vger.kernel.org>; Tue,  5 Nov 2024 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730813930; cv=none; b=hkUgHOprEtXSb11bchEea4cq47xW9wY0sh4wK7tyxHzu8DkJYel6LdJ8aKwoPUWm8EGW9fM2peb8QWF5DGM9vhrjq7b1G10EfvhLDkM6z4K9iZTL5WqFqzuwZPa1fr3TYOIkeiFgIP4jwTNHz44zQluCO3kQQ34QSTFhpM7lhYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730813930; c=relaxed/simple;
	bh=yh1p+AhkWM4xFMAtZ7oOEO9mnv3l6TsekjZBUbWKZHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=byEh7xhDleqMHJcdJ7ACILqTlcgJVLdqQI5J1y3nE+UIfYeAnXnTBKBh6Qd9tSKH8ynDd+rXmZ+b/1nBjvzJ1HCB7gd8wQzbWEOHg4JPX/sfS1PPA/Ubed65cMI9y+WIUmy6Do9UsaHyfnRVKxPcA9GS7X3/v/TTWnM2PcKB7X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VTtEbvlT; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-290c69be014so2330287fac.3
        for <linux-media@vger.kernel.org>; Tue, 05 Nov 2024 05:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730813928; x=1731418728; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cV5o3WhWVOPFdJQoEMG+jv0FEl4oyGKv0FBzhxP78ik=;
        b=VTtEbvlT2XLlxplgw9McgVJ4jcXtTiL8IOv+w+evNmSibXY/ZgvlRWiaMpM7Mpcs1h
         c4kPlGICap9KfQ5bG5DRiqVFCPz0/5thJlae8DoYE4/hHB35JT8YBRlmK2AORtwudmeb
         Y9gc967QWu6v/h4zCuk+oIDbvHcX2F6OHhlKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730813928; x=1731418728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cV5o3WhWVOPFdJQoEMG+jv0FEl4oyGKv0FBzhxP78ik=;
        b=k08BHQR/OZ/Exx0YfpS0N0ht8Z5CjcPPDPAICjcX4m0/0Jm1YllQHDl2C5c3Z2E7qB
         Xb6tISwcQC+0xd5wjfavnvsXALNrG8PVKabVZKbscTpB/uUkoc5Dilxqve0RbGWa4Qnu
         VXTj0JTQhVmcpbEfey3mxj+RKFLIuQBDnfupuLwvLqAAWKvN+fofkivFJjNIViy1z497
         6K3I2GttGBjRkx7+Qvt71h9TC0fAqqKEcdSyuAUy+fb3cQqAIkkxVW5owj6rA8XJX1wR
         YwzgwDAX3KQrzPkMrUjXUbHwrQkjlBZ8mF6ymE46TPkdq//yS/B7Yf670iBpRYsp5I6r
         y2HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb9MhEdmfQJtKBQxNlHzQeAYSXjuI3AXdE7qcXHqr9UK7RjdzUpcANO2xTX5A5fILHLlfGTDBNZEJM4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxtXF9rd6ohNwp06IK8mJFtcGkYdSwCfKEjGivknraAa+BNsif
	HgQDBc0PBWqz8U4voDOtowulRI0PBe34Ffv6ytfSufopoE00RCI9JySj0WqQjw==
X-Google-Smtp-Source: AGHT+IGsgQ/6CuL0YqnGrmyzIOA69jiw5u+Wid5BjBzfkM3Z31ADKK+7Jq4rj6syR0JyqOptl5hmlQ==
X-Received: by 2002:a05:6870:8dcf:b0:277:a43a:dac2 with SMTP id 586e51a60fabf-2949ed9b4abmr13867576fac.17.1730813927824;
        Tue, 05 Nov 2024 05:38:47 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:2c73:a2d8:c3cb:500c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee459f8ee9sm9044983a12.72.2024.11.05.05.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 05:38:47 -0800 (PST)
Date: Tue, 5 Nov 2024 22:38:43 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCHv6 0/3] media: venus: close() fixes
Message-ID: <20241105133843.GA13546@google.com>
References: <20241025165656.778282-1-senozhatsky@chromium.org>
 <37a906eb-4cd1-4034-9bf6-2f9f4560b9e3@suse.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37a906eb-4cd1-4034-9bf6-2f9f4560b9e3@suse.de>

Hi Stanimir,

On (24/11/05 14:04), Stanimir Varbanov wrote:
> On 10/25/24 19:56, Sergey Senozhatsky wrote:
> > A couple of fixes for venus driver close() handling
> > (both enc and dec).
> > 
> > v5->v6:
> > -- added kfree() backtrace to 0002
> > 
> > Sergey Senozhatsky (3):
> >   media: venus: fix enc/dec destruction order
> >   media: venus: sync with threaded IRQ during inst destruction
> >   media: venus: factor out inst destruction routine
> 
> Could you please combine 1/3 and 2/3 commit bodies into 3/3 body and
> resend the new 3/3 only. I do not see a reason to apply 1/3 and 2/3.

So the reason being is that 1/3 fixes a race condition (stale data
in ->fh) and a lockdep splat (wrong destruction order).  2/3 fixes a
completely different race (IRQ vs close) condition and UAF.  And 3/3
is just a refactoring that doesn't fix anything.  Are you sure you
want to squash all 3 of them?  Because they look slightly independent
to me.

> Also, on what platform this was tested?

I ran CTS on one of the strongbad devices.

