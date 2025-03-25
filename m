Return-Path: <linux-media+bounces-28739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE1AA708DA
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 19:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E581D3A6FA1
	for <lists+linux-media@lfdr.de>; Tue, 25 Mar 2025 18:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6722826463C;
	Tue, 25 Mar 2025 18:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="b9SF9K6c"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39BB25D539
	for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 18:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742926341; cv=none; b=RKa2HLgDQwcFnLoSrEi7wp0wDXhuYo/3XQ2DEEbGjVf8zmeH9aX1cbj9hGM75dTCRKnE8WTNfPonem2joQ9WRUWqFE9vdwB+zI3dxZvwUyoPjB4/uwoREoBaogYXPOHRD2Gn96ryp9dSlqJqjOwqW9fUD+ZC8QJHJ6E0qQx5qkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742926341; c=relaxed/simple;
	bh=XLf3UMEZ4QQxK7kiSkEbTvqmOCztZ+BTYq8zGg5Y9Zk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jL7ofstA1D4JT77kfsvfq3etq/LFKD0HLDh/jj2NGGE6UiIpFNXFzHE9hpsLqlTrPIuiZFqhOI9dC3+8ziUAlh4Azi2eqeXW9MmSYYk6tCG6M3X3cixqGnvNbG4WS1DEM3cyd5711vPb6u3luX0oafmLKgF4bq37Bw401ZUy8pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=b9SF9K6c; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c55500d08cso564654285a.0
        for <linux-media@vger.kernel.org>; Tue, 25 Mar 2025 11:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1742926338; x=1743531138; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XLf3UMEZ4QQxK7kiSkEbTvqmOCztZ+BTYq8zGg5Y9Zk=;
        b=b9SF9K6c8XizlMuVchWlDyHnKM4yoPjrw6Q0cy4H6nD0mFkrXTr7R1/uVJkegoMq3i
         Hg9lPuH+TBUz7/NtUfxbhGUpidP3ujovZBqvcOuvsJcCKAb+uJlmUZ7ijeXm0X8rlmLx
         z/iyXRKUiGHn7bj1NPlndYSHSMiue/kwzFm7EC8+/wU5w6LG5r8iy3CcMip7zPX9xnbX
         xiUPhAtfQvdxlMk0Fab0tYD2VWa4htsrqHz5bD8xjJWJKg+Ul260W1Lcdhb84xBKeNMb
         PtHE3PXHPERCf7DAiyK2QGbrFnAY6KyaE+j3C1735Ah6nJORdYkFH0mAeLT6H2y++RB/
         2S7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742926338; x=1743531138;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XLf3UMEZ4QQxK7kiSkEbTvqmOCztZ+BTYq8zGg5Y9Zk=;
        b=KVwsY8yUB/Kg6GBSlrCqVdv7XzyDs8tX+3ZQBxQuondkUMlZJvYx8F7t1SkjkMe8FA
         uArw2ZaqPeMdCvlAj3+cQJJ5tWdyCRGYCSRU5hhj7kSBNvJ3qD0tJodOL9pewC4GZi3Y
         sUNyLJ43dFmUZKQPOg1XOS78BiaXz1VeAWGB7v8evw2kfZlC9kUYeUXO1uQfTHmha2Zo
         1J2bcpQZvFZhFBUW9mxw8BsZrfDHC8B3gkloejae9Ym/0B7Nxj9CiD/76MKdGUPl9X+7
         tkwvIsAPzoKaFU1eN7uSGFmzsCcxn3Ux/089wVc/+lNuCciwPKxa7RRqx0penkuspkP9
         Fptg==
X-Gm-Message-State: AOJu0YyK03oiAJVkqlGHoJNvbOYed/S8Sik1n6ttj1+OELI0mmZ2giDB
	P97451clBSKO/jtHawmRIWTWVRpiq018hzT8omkuG5kqH+VVWgOqOVFMHU9K0KI=
X-Gm-Gg: ASbGncsoTCEbx4LIQXiO+M+ATZnqJ9DlJiUtXGzJDo5V+gyavzW6BVGsLNS6uGDFGkZ
	TSKNpn7YNME0P2olRX5mkjoZG3MsCC6JtWqq2NWTQSH2hwpEUkVnfnBN6laCcbj8baKsGZsLE1F
	ODsPsDTdOuaNmrrzBzrfpcoG1YWLQTWRsww5I0QM6jvsv6IpfYdpe4KpolPwAV9fw5ou3KbyUKA
	hdu2SWwcR2BGlI16YCOV6DzHAJx3rzWPapxxvLYdzVy/3o8e+oOCo6feKQ/7UD7TTAldmuX1di2
	RCLYV5Ynlu8OSBvk8Hb+VZQozwPgSpQ5XbRk00uM2CBsOufBNg==
X-Google-Smtp-Source: AGHT+IEL+2aA5ioTOInt9TsutPBGrZ3qKP3t5w76VuLAUhPomVfu+w4DyqpHsyqrBw4wpeKT/gGOvw==
X-Received: by 2002:a05:620a:199d:b0:7c5:4caa:21af with SMTP id af79cd13be357-7c5ba203c7amr2828339485a.53.1742926338329;
        Tue, 25 Mar 2025 11:12:18 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::5ac? ([2606:6d00:11:e976::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5b93485f7sm669234785a.74.2025.03.25.11.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 11:12:17 -0700 (PDT)
Message-ID: <aec691edc21205dead06f4ce76ad225662ee60dd.camel@ndufresne.ca>
Subject: Re: [ANNOUNCEMENT] libcamera workshop 2025 - Nice, May 16th
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	libcamera-devel@lists.libcamera.org
Cc: linux-media@vger.kernel.org, Kieran Bingham
	 <kieran.bingham@ideasonboard.com>
Date: Tue, 25 Mar 2025 14:12:16 -0400
In-Reply-To: <20250325102750.GE20035@pendragon.ideasonboard.com>
References: <20250325102750.GE20035@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hello,

Le mardi 25 mars 2025 =C3=A0 12:27 +0200, Laurent Pinchart a =C3=A9crit=C2=
=A0:
> If you would like to attend, please register your interest by replying
> to this e-mail, and indicate if you have any discussion topics you would
> like to include in the schedule.=20

I'll be happy to participate. Topic, nothing big, maybe we can spend 20
min, I can share an update on the state of the GStreamer support, and
what is missing, and I'd ask for feedback to complete and prioritized
that part.

I'm also interested in an update from Jacopo around multi-context MC, I
don't feel to dive into sensor configuration, its pretty clear this is
what it is and will be exposed as-is through the abstractions such are
Gst (I'll make patch as soon as I have the time).

regards,
Nicolas

