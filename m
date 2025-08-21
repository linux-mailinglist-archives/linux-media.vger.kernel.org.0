Return-Path: <linux-media+bounces-40514-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F29E2B2EE51
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 08:38:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 794017BE443
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 06:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C446E2E7F2A;
	Thu, 21 Aug 2025 06:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WPMKTlPM"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA8B2E7BCB
	for <linux-media@vger.kernel.org>; Thu, 21 Aug 2025 06:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755758267; cv=none; b=to2UuxAifK2J7roOsAM7lFVXY2JcWrgo9H4lA+3v9W9y8gDSv7/y5MSXBwJ/NAAy9yvrHdAW1ZytC54WOq1dIqwnR1F6aTOM7v2tMvb3JR5nwHRR/AH5V/O0Jt6T7F18973cTQhM7QCmgidhSb6BRJo0nfD/dc5jCDxHOmcokR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755758267; c=relaxed/simple;
	bh=PhYPqA6hOPWR2DVP4gF6Ag53GcEYP5E9kKRpJSRcAGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=lP0P1+mjmkvaCKAVXLaxSaXIrdk5o3uXuLE3UMC5VLu5WAoRXu3eWtVHtCnsy87kYOy8Tw05hP5QQTChzP+A+IxyJ5maiRp57isGyuxioDx4htt+OmdBZ7sMBkW4B1OUMmTjoNEguIhrWj3FWks6ruE7jvu2+I5k3h1VRS4nUMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WPMKTlPM; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-24458272c00so7068595ad.3
        for <linux-media@vger.kernel.org>; Wed, 20 Aug 2025 23:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755758265; x=1756363065; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhYPqA6hOPWR2DVP4gF6Ag53GcEYP5E9kKRpJSRcAGw=;
        b=WPMKTlPMcvVMCG2+eFRxtTmgscvQgQsU21CE3l+GURBbFyqbMJb6+DAOwSJimc0e3i
         6Nd6QZ8nmMOAdOM4Y5p6ReOxyE4IZyW9aIpqLtFQ0c4sM6d98kbCdTX7zvJ8k4n2IPtL
         rZcNQuyFJaLKFOstL5vTzm5XZT7RPwOdrHfHuTfBixztb634Rofykzz/lN0fIbz3R9JR
         wnEBb5JlGQVyOBaFtCrPhz+2jc6w3XN7xbVKo7NrLQK1x2/yFNqZ0R/W/wSjjpEfFF6x
         syixE37qXnxSn54cEDPMXGaplUFoFfct+xr3cTtY9yx5jtN/6aryjL4rjXFpi9i/d2//
         VfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755758265; x=1756363065;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhYPqA6hOPWR2DVP4gF6Ag53GcEYP5E9kKRpJSRcAGw=;
        b=qfF8xCA9eeykHTym/dxtWUrvKMqgHCn3Uyyb38zeIUbqHu3ofDluUUqGzFhHeti9K0
         M+6EwTDPeQe0XiLMQu2DcSc3P9+ZogSwyWtZvKmDMcWZmgp89ZKrwMTzxhY+KB7Hs7GB
         sbLLQCl3JYNaPhEqMFtDWhjovzq9FGCe286/mMirvI++ZXu4a9suTJcVw1/Q4o2MEjFD
         l6piD1qn3rvQkaWfss13uz+88EDWfdvE4+l9ettlcEhqe1F81nSVM1g89J5tKWnzlJfi
         5uVibmGmn1sCYcyu4DZfRcDaeGQLE2L8purEEmdfooLC2gpPN3UYyJzEK2ktmnjWNawY
         yfUA==
X-Forwarded-Encrypted: i=1; AJvYcCXUuD07EseAOum9GH6hCoo1UGOMW/qhrXMpMMjjMGRySXdwGWsmXPjk3HTgCt54BezJtAPJfDII1Qb9Jg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwR1l68NyPduZ0iUUFN7kdW37CmXEnp8ydTtMhbQGKEKFl/k59H
	AGZWh/GIIwmaOfWg5KQyt5q0SjLU4xcq/0eaMdA1dl8ASudjxqbE9LBF2LMqxNmr0RQtFydJgF1
	iCyuxXbd2hIVq1Y0fJKLKcNfoss4dvr9B/vwoLEOk
X-Gm-Gg: ASbGnctOF7QiP1C1UWYG/Vv8y9z71z9PmOPJY9VlIH5MkCC4SvdOK8sy/wmcT3dUI/q
	QYMg5Vj4KziQG5eYPVMiO7E/DtC4u7HVQhjhIKiDFS0OJjuJNsZULQZOZB0y0wXo8D4F6Zd+MsC
	gaEphQiOwNMee0HnY1pkTh46ivPZYa5uwLgXG1yjQxCxXvoRPRaCq5D3/AoRx5Nuh2C+LyFGO/5
	FHwlKMwbwzmjkEjcdRvtDwdfwmX4u7jDJ/nmV69f4kjt9qS3mUVI6rpJOzPXi++
X-Google-Smtp-Source: AGHT+IHcXpaYUvuvHbg97J7ktgYhoFhHlSK61tRa5Gn2HGyAhLpvnvBPUNwdFiKjC1PzNYk9gIJ7lsruTzjTfjL24bQ=
X-Received: by 2002:a17:902:c945:b0:246:61c:a67b with SMTP id
 d9443c01a7336-246061cab36mr14478945ad.58.1755758264921; Wed, 20 Aug 2025
 23:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820124519.2287171-1-abarnas@google.com> <aKXIoFpHUjSdCbHY@smile.fi.intel.com>
 <CAATBrPGqkuLrVhKi8aj-tugZNVMD3kqv5_v3WB=kJvt4FVtFzw@mail.gmail.com>
In-Reply-To: <CAATBrPGqkuLrVhKi8aj-tugZNVMD3kqv5_v3WB=kJvt4FVtFzw@mail.gmail.com>
From: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>
Date: Thu, 21 Aug 2025 08:37:33 +0200
X-Gm-Features: Ac12FXx_26dv5aIj5KUUthDo_hXrvOsEk58zD74CpJhjgeW2kMIsNLP7aELjdNM
Message-ID: <CAATBrPHZHtW0Omp=KRskunP_2QFezb5DRRQXiCFzW0YzQcr7mA@mail.gmail.com>
Subject: Fwd: [PATCH] staging: media: atomisp: Whitespaces style cleanup in gdc.c
To: linux-staging@lists.linux.dev, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan, Greg, Andy

Will fix the message and replace the tab I missed. Also will refactor
the unnecessary forward declaration.

Thank you for review
Adrian Barna=C5=9B

