Return-Path: <linux-media+bounces-40462-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7CAB2E2B5
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 18:55:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBB60188A6A0
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 16:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1F2326D4A;
	Wed, 20 Aug 2025 16:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BRQKINB6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10328322DD3
	for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 16:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755708825; cv=none; b=UjxGr2ruYpRUnvwoz7JFHMhU/c1G0C/6yCS2cethMhhRRzwR4BVHLOXzeNu445zjN4zGxwZbJcf0wc6og7IZX+ttjrbiV76eJ4IW0v33O+PISeJ3/7zva+EIRNeqcKtqwLa8acv2+fjKqO0r0gLgyanSbFHuVIMtOI4yZIjsTQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755708825; c=relaxed/simple;
	bh=YFh9tQlkjzT5yWM+TmV6WOeSwu9NitbNMXsAdBpXl6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RpU3xQifIZ0GjFh1RbG5uJnC8xF5kDDCj59RSdYNDhyufDpJNy24R2327Cf4Apn6+SQnpb0MNKJSktUxS3heBRe84qMAj18fPbaKlrKnxfk71lAjufyKUZd0P2a61qoGgZuZoDWnQdqN6if6a0HvrAIol3r9KdVXzLm7E9ipMHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BRQKINB6; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b9e4193083so131178f8f.3
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 09:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755708822; x=1756313622; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WpCvOUEy9gt+e1INXVvX+QS4u6BMKssFhZFYzWXcaY4=;
        b=BRQKINB6EYU/nvEofIbXMeVTiAR3hU2Qld1wLO1hHns/hq2ZrF8FDGoXgSg9j8HzDM
         Kh8pmP8NT34Sa3k8O9iyOVN9RRwjwwNR4aJKt7aK/oqcwHNdMpDtC1KUzOJ73rjMnH1P
         cvV5K2zdw6wOEsbnCPqlPm18N4S1mWvCEEn+lRbhM7YKS515xKmkrJrzry5KFGl3Af5X
         T12UcOZi9pGCcIVx0DqeNc4yGkmu3hlDDrjNRCTb4qPKyMSZmpgDre6Oni8E4qXuVCYt
         hazFXzj79iWiGI/lu46k7Cj++DZUsodiiramULzVjCCNP9ABzdGIfuh3OuJQMyPkEB4K
         nq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755708822; x=1756313622;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WpCvOUEy9gt+e1INXVvX+QS4u6BMKssFhZFYzWXcaY4=;
        b=DYIrVKm9bYxyeUb4oLqf4Ue83lOCVACLDSIjPx6uQLs+PGwoH8w9WMGs7dIJNs9hhO
         QRXWexujjBqIbZmw3NdK14zZzFkBjsAtFMT4bkJhRejWt/KsXHFo0k6YWiDQAqwTVk/m
         7BVo24zHugUZosOcbiQKea5w8Jvlm/WxS40POlra0ZGJN6C4PjJzkUHTexuMbtvp8FG7
         0NELemxnkAA2Z7tNAJwje7uMg01CuE+jvfvgis3SmzUjuGn9Cs1ecdwt4LtR0FAXvBV8
         YDuNmgebqCttX8vt7JgQ6sUVgmhCcKrPA3ahRvkM1xdYnmR4ApQ0tkSVCJolkkxw1S6y
         Y1zQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5safn8s4o06ldd515XCqmqsZcUacBTkJRDln6VeXmqrcn918sdV5nxVZ5RgOfc3xIBTkag3gcP2F0jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyRcyTycbCRlqir4WfytKOqZ3/YGaCmZ7GDWhrnsmzUVkeCBUU
	rfH0ANl8DDnH08QHRAScyQJV2LyO3GsxDQ2PoAEFDKeNVDHZ0S4FtRdYgPzQJSTR9QY=
X-Gm-Gg: ASbGnct8jIH3xJiDdKykoiMaGUEBSZ28Ls4Nw7qUZi3mNWgSX0gDn0aKmWmzs8ruExd
	hh8k4Z07cFP+XFRY6xphy9IZ5BHW5PNmFTC2URdrKwiFYCXLwj41yEkoRcqPkxA+JTTHHpGko9A
	zAT8zh5tX5uV0qk3B6Lk2tVu9IWm3c/wS4Rr1kko1/zl0ZqQeDy3VUbWIWpSS+i0kLaqXTeyim/
	ie0KRd6ZTDKlNIMXBJEez5LEeTSOAZN+BHV2uROXP5QgCNeGY55D/7q+8NGPjaHqsK+2Wr9fO8X
	6UdWtn70AskVf8e/kelvNeCd56ZOs9XD+2B5r6VBFI0JZZobsCqDxshd7GA1TusoywpVOe2QXsQ
	hPgGHRXOigKVJfvFsQygQSBB57tmcMZ0j9WU=
X-Google-Smtp-Source: AGHT+IGB0p+aULag9mfdU8eRn3hjRaFkMxyv9kzuYWAqcbOyx1VfevBG2Noz2dFjBb5RNTesRx0DXg==
X-Received: by 2002:a05:6000:4308:b0:3b7:994b:8438 with SMTP id ffacd0b85a97d-3c32e709bd2mr2518257f8f.46.1755708822180;
        Wed, 20 Aug 2025 09:53:42 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:d9eb:6295:cf25:b839])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788b39sm8447524f8f.47.2025.08.20.09.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 09:53:41 -0700 (PDT)
Date: Wed, 20 Aug 2025 18:53:36 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2 06/11] remoteproc: Move resource table data structure
 to its own header
Message-ID: <aKX9kO5eHUp40oRj@linaro.org>
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-7-mukesh.ojha@oss.qualcomm.com>
 <aKWDXySSt57tXHVP@linaro.org>
 <20250820151822.6cmowxfsheqxfrnb@hu-mojha-hyd.qualcomm.com>
 <20250820163250.hszey3i2gtd3o2i6@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250820163250.hszey3i2gtd3o2i6@hu-mojha-hyd.qualcomm.com>

On Wed, Aug 20, 2025 at 10:02:50PM +0530, Mukesh Ojha wrote:
> On Wed, Aug 20, 2025 at 08:48:22PM +0530, Mukesh Ojha wrote:
> > On Wed, Aug 20, 2025 at 10:12:15AM +0200, Stephan Gerhold wrote:
> > > On Tue, Aug 19, 2025 at 10:24:41PM +0530, Mukesh Ojha wrote:
> > > > The resource table data structure has traditionally been associated with
> > > > the remoteproc framework, where the resource table is included as a
> > > > section within the remote processor firmware binary. However, it is also
> > > > possible to obtain the resource table through other means—such as from a
> > > > reserved memory region populated by the boot firmware, statically
> > > > maintained driver data, or via a secure SMC call—when it is not embedded
> > > > in the firmware.
> > > > 
> > > > There are multiple Qualcomm remote processors (e.g., Venus, Iris, GPU,
> > > > etc.) in the upstream kernel that do not use the remoteproc framework to
> > > > manage their lifecycle for various reasons.
> > > > 
> > > > When Linux is running at EL2, similar to the Qualcomm PAS driver
> > > > (qcom_q6v5_pas.c), client drivers for subsystems like video and GPU may
> > > > also want to use the resource table SMC call to retrieve and map
> > > > resources before they are used by the remote processor.
> > > > 
> > > 
> > > All the examples you give here (Venus/Iris, GPU) have some sort of EL2
> > > support already for older platforms:
> > 
> > Example was taken from perspective of remote processor life-cycle management.
> > You are right they have worked before in non-secure way for Chrome.
> > 
> > > 
> > >  - For GPU, we just skip loading the ZAP shader and access the protected
> > >    registers directly. I would expect the ZAP shader does effectively
> > >    the same, perhaps with some additional handling for secure mode. Is
> > >    this even a real remote processor that has a separate IOMMU domain?
> > > 
> > 
> > I don't think it is the case and think the same that they can skip
> > loading and Hence, I have not yet added support for it.
> > 
> > Will check internally before doing anything on GPU.
> > 
> > >  - For Venus/Iris, there is code upstream similar to your PATCH 11/11
> > >    that maps the firmware with the IOMMU (but invokes reset directly
> > >    using the registers, without using PAS). There is no resource table
> > >    used for that either, so at least all Venus/Iris versions so far
> > >    apparently had no need for any mappings aside from the firmware
> > >    binary.
> > 
> > You are absolutely right
> > 
> > > 
> > > I understand that you want to continue using PAS for these, but I'm a
> > > bit confused what kind of mappings we would expect to have in the
> > > resource table for video and GPU. Could you give an example?
> > 
> > We have some debug hw tracing available for video for lemans, which is
> > optional However, I believe infra is good to have incase we need some
> > required resources to be map for Video to work for a SoC.
> > 
> > > 
> > > Thanks,
> > > Stephan
> > 
> > -- 
> > -Mukesh Ojha
> 
> Since I am not subscribed to any of the mailing lists to which this
> series was sent, I am not receiving emails from the list. As a result,
> your recent messages did not reach my inbox. Additionally, it seems your
> reply inadvertently removed me from the To-list.
> 
> 
> https://lore.kernel.org/lkml/aKXqSU-487b6Je2B@linaro.org/
> 
> https://lore.kernel.org/lkml/aKXQAoXZyR6SRPAA@linaro.org/
> 

Indeed, but I don't think this is my fault: You have a strange
"Mail-Followup-To:" list in the email header of your reply [1] and my
email client honors it when I press "group reply". Your email client or
server seems to produce this header without including you in the follow
up list, as if you don't want to receive any replies. :-)

I fixed it up manually this time, but perhaps you should look into the
source of this weird header in your replies, I'm probably not the only
person using mutt and just hitting "group reply" all the time ...

Stephan

[1]: https://lore.kernel.org/linux-arm-msm/20250820163250.hszey3i2gtd3o2i6@hu-mojha-hyd.qualcomm.com/raw

