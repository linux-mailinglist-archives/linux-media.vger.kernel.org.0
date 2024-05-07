Return-Path: <linux-media+bounces-10966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F66D8BDBB8
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 08:40:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1883B2818EE
	for <lists+linux-media@lfdr.de>; Tue,  7 May 2024 06:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8DD78B50;
	Tue,  7 May 2024 06:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClALgacn"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B18874267
	for <linux-media@vger.kernel.org>; Tue,  7 May 2024 06:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715064020; cv=none; b=oQyYIpZ8yFRzMeMPny4XumLpEDxPXqHa4mNte+RfWBD8v8PsDDsLjHkhAXpTjWNvsqBtSDIrGToy1FBQ65fHs7oTeubxnmf+kFNO6GEHbXFrr/9nMPTzNflQa3tES29Xx5YLIF3rWodADvcbhgBm18UPCgsYXoKW3Ko9ZV/QMgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715064020; c=relaxed/simple;
	bh=WyJ3WOw38MRr/raTdlZWjoGpVDK9CbDUZp7Kruc7070=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eW5mKf8iqoX6i9dwiINv1Sc9CZdZFe3G2cT5dwv2+3J2lacI1ulPCKpXAyl3oKm1p7rG/bXbRISQG4CVyd2oSqmFifdAHk3vZLu4dXJUwCjjRFkC8U8Q7rKtMxJzJyaZVv8qSN1uYKMO3KSpIznH8xdjeUAIJZj5ZgJIV5Dwqcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClALgacn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41ba1ba55ebso20567835e9.1
        for <linux-media@vger.kernel.org>; Mon, 06 May 2024 23:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715064017; x=1715668817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zk2P0fKq+fcOu18LMni7mgVNjdp1nYbGT+cfcHoxVPg=;
        b=ClALgacnHD24kIOxAkIRMpcbKGH7+79YS5svLLHm8HOilVqoYKbbSKdw6q5XLMJYZx
         Hll1lAUOOoCKR/BdW2FgZBQ1ViyFEZqD3AFsviD/Gl6tXz7S7RrL8xt+uPBVmfIYQoqe
         A8/mq97hkOB5DKAihadkc5asES6ZXa8llqi+Wn91uNKskHnP1EpevBQQg7HD2f/IaKcX
         JMqeQEI0S2yaUXhnNwCH6MD6U1RswbvA02TjK/BFPffgXFMDeJxlbIx9t3/rvLOJxGGy
         4bW86H1pLDaCM59znQIZ8wS+ML/OEl+cj241N0/KAPahQtIkFPki7iilZ6NGRQAVx1s8
         lpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715064017; x=1715668817;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zk2P0fKq+fcOu18LMni7mgVNjdp1nYbGT+cfcHoxVPg=;
        b=L+/dYMlrYvR/dtKPIZqrGs71fxhfFtjo4kpwzzJYyeW6CAtbYWgodi4/TTs6qGU+xF
         yZ34WmObMhBdfeTqteyVsPdfLMBdxkxTfN6HYCvmCQ1Y9r8BpbgKBYt4cHw/HTlHB8Md
         IITo0BBRjXnTuuHAMWM50q7fHnGzh4cZ/19rB33YmboG3U+PQYaZUV8poAUHLUbrw1kJ
         68v/Ts8XYQu5pTYtR0sf5b7WCXj6lMPX2JpTSKKlOqGW6XUSK2g5jer2EXTqbtrS81Ja
         RM9SaNpcmr/hj+CpFPDAKpmjw+PUWIRtvXc4lXws+0v+b0w43lPU8ngFt3Gmo9NXE+jH
         VW7w==
X-Gm-Message-State: AOJu0Yxm8NkmaFkVnm/u11tPwSbguwyJ3mwqjgGF1UXPdekTC4d+g5fD
	5+YMT78BDnB3E4oIAtNfHzgjaKVjtDzr6lE36SH7wWv8NS+AFvz6
X-Google-Smtp-Source: AGHT+IF+ex3LxuDb/THUyNfZ55VMpyR5tdHk48+JJdOrVwZ1pTe+VqeMJpVOS/7vA+GMcYH17wCNMQ==
X-Received: by 2002:a5d:6909:0:b0:349:c453:8de with SMTP id t9-20020a5d6909000000b00349c45308demr9056787wru.57.1715064017108;
        Mon, 06 May 2024 23:40:17 -0700 (PDT)
Received: from tom-HP-ZBook-Fury-15-G7-Mobile-Workstation (net-188-217-50-118.cust.vodafonedsl.it. [188.217.50.118])
        by smtp.gmail.com with ESMTPSA id l17-20020adfe591000000b0034dac7e5f7bsm12131752wrm.50.2024.05.06.23.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 23:40:16 -0700 (PDT)
Date: Tue, 7 May 2024 08:40:14 +0200
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
Message-ID: <ZjnMzhoWrt8E0wPJ@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>

Hi Hans,
Thanks for organizing this summit.

On Mon, May 06, 2024 at 01:33:32PM +0200, Hans Verkuil wrote:
> Hi all,
> 
> We will organize another Media Summit on Monday September 16th to coincide with
> the Open Source Summit Europe in Vienna:
> 
> https://events.linuxfoundation.org/open-source-summit-europe/
> 
> Avnet Silica has very kindly offered to host this summit at their Vienna
> office, which is about 35 minutes by public transport from the OSSE venue.
> 
> Location:
> 
> https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+GmbH+(Silica)/@48.183203,16.3100937,15z/data=!4m6!3m5!1s0x476da80e20b26d5b:0x2c5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=ttu
> 
> The meeting room can hold 18 people and has video conferencing support (MS Teams).
> 
> That said, I want to keep remote participation to a minimum. This yearly summit is meant
> for active media developers to meet up face-to-face and to discuss media subsystem issues.
> But if you are an active media developer, but are not able to attend in person, then this
> is an option.
> 
> If you have a topic that you want to discuss, just 'Reply All' to this announcement.
> It would be very much appreciated if you can also add a guesstimate of the time
> you need for your topic.
> 
> If you want to attend the meeting (either in person or remote), then send an email to me
> directly. Since the number of seats is limited, I may have to put people on a waiting list.
> Please let me know sooner rather than later (ideally by mid-July) so I have a good idea
> what to expect.
> 
> Priority goes to presenters and the core media maintainers. If multiple people of the same
> company want to attend, then I may ask to limit attendance to one or two people.

If is possible Martin and me from Avnet Silica we are planning to attend in person the meeting.
We are working on some topics to present.

Thanks in advance,
Tommaso

> 
> It is hard to predict how many people want to attend, so I'll see how it goes.
> 
> Regards,
> 
> 	Hans
> 

