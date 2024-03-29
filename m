Return-Path: <linux-media+bounces-8156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC4B890F80
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 01:29:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C192B24719
	for <lists+linux-media@lfdr.de>; Fri, 29 Mar 2024 00:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA623FE36;
	Fri, 29 Mar 2024 00:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BsbhWivB"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828503FE23
	for <linux-media@vger.kernel.org>; Fri, 29 Mar 2024 00:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711671860; cv=none; b=dP2YZS3SiXhTdVOT/Y7Pxi2UaHkAoCHCFng9pGEaNAYl1CPfjFFJgRCuAuhMOqOJMSDTWeS+vIzmw/37g1c1wyTr6PjxPztFTUiM6PNak0wwQwnLH+Mx4dDSDk2TwleuMVppeJVziqfoNOgos7Sq8uRLw8kdX+KN9iIjBEhu2Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711671860; c=relaxed/simple;
	bh=E9HCbCwLabDJEyckgGcDAcoyc/Aduzt0ewRHjyPV5Q4=;
	h=Content-Type:From:Mime-Version:Date:Subject:Message-Id:To; b=ofSVyWkFdSCb8OBn/BVesSNGeyM0wQrHTpv3c2Vgluj4eS/dFi5eETH/5AGuv6t/ZB9bSKpYjOulzpyYNszUBgKsWJh6mH0NJ6brTy69rOkH8ktosg+x1cqUFzGLcXIUZdH7EnCOAAkIACUAaf9YbWnNihF0q1dQ/0yPAI6FRf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BsbhWivB; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3662feb90a8so9792395ab.3
        for <linux-media@vger.kernel.org>; Thu, 28 Mar 2024 17:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711671857; x=1712276657; darn=vger.kernel.org;
        h=to:message-id:subject:date:mime-version:from
         :content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86beGXAVVZ8jIUtSAyDP5kVVtKOJOf1Cuk5mBnxAvnc=;
        b=BsbhWivBkP5yEXKUJnSwrdJSD1cefEaxWEnTQ2UnPCZThR4iiIoJDmxuhJNwR5WM11
         Hjlfvyx1plJRepUxpjsbMX0UKuwn7yZOGVHdZoQlK1tIONKTpzS8QaFaZg26dPSTdBmg
         o6WMEXnET59TkmeMaLba8sqOxZ+Ju+Hhsm0RIoTqTZ75siYN0q15WEypG5dT6NR1gTOo
         rlHjaylMH9oC2O6uxUohpUgbMTHSp0iQtzezRzrZAqbnuUNMKnHd2aL3zsUDM0WBn74g
         unwDJ6TetyUnEdT7yLGd+4+Ri6FM53etSb58sXkd06DAu7Yy0oB7Sd5VpdSc09tiGJDt
         sHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711671857; x=1712276657;
        h=to:message-id:subject:date:mime-version:from
         :content-transfer-encoding:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=86beGXAVVZ8jIUtSAyDP5kVVtKOJOf1Cuk5mBnxAvnc=;
        b=chAG4/Sp/NmDZwKb2YFkHNOh1RVZdNV0Wu2qp1JjSHoaU4VyFOxsFoWXefnW3+v5lO
         FMKkgBpEuvas+MEh37/eIB4ybjMQTU1XocmdZT6eJKUmDZnfXBCBvU4LU1fwN9GBmc6w
         8VeqxLnjv9mB6lDLzourKjGj1gPEMKrviZvVg+cXyp1PHYBvoUma+S9UB0W0PQYA8+LS
         qWA7WlJRb227nZu9z5mVF53AG3dFyLhGEWT2It1tZ6PuplAcBiPIJp5Kw1Hjl6iN+HlP
         WEJYMhumtcRgQ1/pg6eex5qyhHv92oaFatTG94O+Ma7IYe8TTiWl+Kusd9GawvUBRcee
         wW3A==
X-Gm-Message-State: AOJu0YxGIaKcnRbAYWSq2wCCWGauBjbB0b1fGnow9zj1uupRgpc5yG22
	BzsFLQ08H3UGIONEegdSc8fZDcTAiB+VkOB1xnlNeZJJx0n3Z5dJ17Ad9sTk
X-Google-Smtp-Source: AGHT+IFfQlRfaijeuG63J3fHAD/Kh3imvwqOgS7ZfATk62+2YiOt5wPm+dneQUAPtjpeQbmoK2Xztg==
X-Received: by 2002:a6b:f71a:0:b0:7d0:2834:a3c5 with SMTP id k26-20020a6bf71a000000b007d02834a3c5mr764328iog.18.1711671857612;
        Thu, 28 Mar 2024 17:24:17 -0700 (PDT)
Received: from smtpclient.apple ([207.138.218.9])
        by smtp.gmail.com with ESMTPSA id d63-20020a0285c5000000b0047ec4e4b5d2sm678784jai.15.2024.03.28.17.24.16
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 17:24:17 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Jim Kiekbusch <jim.kiekbusch@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Date: Thu, 28 Mar 2024 19:24:06 -0500
Subject: Looking for assistance 
Message-Id: <2952E98C-915F-4BFE-944B-8FDF064C8961@gmail.com>
To: linux-media@vger.kernel.org
X-Mailer: iPad Mail (21D61)

I am attempting to add ir remote control to a raspberry pi application and c=
annot get ir-keytable to recognize transmissions.  Any help or direction you=
 can give me is greatly appreciated.

Thanks,
Jim=

