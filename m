Return-Path: <linux-media+bounces-26140-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B648A35595
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 05:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B350F3A4AE9
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 04:08:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81588155382;
	Fri, 14 Feb 2025 04:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Mz/SOlyu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21A614B088
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 04:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739506126; cv=none; b=eP2pwmyaMslfpFM62HqN7qiUxo6QlzyMNs0mL5edVz8eHA34KV9nrmn9evZwNJm80aHZDK67pP3XpXIod4U4DuwfYQxtN9c8WmwYl+pXCi0nEj8GFtcZPpIPP98dzDJ4A29kYPw5MUNIAlGanXxu9mK+eyBt763Jw7LIberF0Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739506126; c=relaxed/simple;
	bh=dvXwJyiQ7kbBkPkEKIKX6x4FnIKWpx883EeHOCyAwm0=;
	h=Message-ID:Date:MIME-Version:To:From:Cc:Subject:Content-Type; b=HOB9FUH6Mszo9xeRrgrWbbn6Y0EcBMdAu6ba33d4Getpa0kd+PO+nY06fw0Gb1qxUmtIP/26tkERWL0mcPiHrWpwVlp3Smhck0BSTgMQoUxo8wfyBSzcfJ+QD0tF7B92fAPv/fw7bx+4r7U62NHFzNbc2x1uiGLs//VS7zudEm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Mz/SOlyu; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 949273F682
	for <linux-media@vger.kernel.org>; Fri, 14 Feb 2025 04:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1739506121;
	bh=q7xZetj9buJug2rOgcAsEYkiw1rJXQFbEVmTrPJ2JzE=;
	h=Message-ID:Date:MIME-Version:To:From:Cc:Subject:Content-Type;
	b=Mz/SOlyup9VarqyPuBaNdGAIOKxBoY/yAfCChu0u8h+MtqUIC7n4tfpepJDmbFQFO
	 QsuYAEbRyBUJQguDmt8XyWc+gIlH3l4NkvxGAGxWwji6TJO+Ddf3mlOTi9F2iB3Arh
	 CjHHOPCbfoKNdtdOOUmcuNbbaKHDMB+PVZVqnkwHWAvMZYjVD8GaX6pucflpiqFh2S
	 DlkM8XLRZec4KTlSB8iNEJQkmG+q2xV8WbLeqlCZWnfEtH2trKYzjNe66gBbmlOqIV
	 GWGZjyeVJWQ71IJQmNWsmd3i4p5jlpjmqIUJeUXQwpD7wKEU1HndVq9ArXpRD5qOIC
	 94ToMNAlG8CMA==
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c07668e74bso397639885a.1
        for <linux-media@vger.kernel.org>; Thu, 13 Feb 2025 20:08:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739506119; x=1740110919;
        h=content-transfer-encoding:subject:cc:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q7xZetj9buJug2rOgcAsEYkiw1rJXQFbEVmTrPJ2JzE=;
        b=dUSra0C1EuHEcMcF4o1zdxOi1FxwWVB1ZlYFCCLKQZORWotQN0OiTo21mnCMDmZ1ea
         F/EFphJh6zG6AC1LXO15PFyQsExcIYFPKxuchuCp+ZEoDM+CrPnAAz4ln+YQMStTzRhe
         rB5F6mg3cr8ZEn0Ae54MrdnGAR8jIjwhjtGMWDOqDfh0d+brpfn1cQk4Wx8tXlsYYMFa
         Kh+tmgXoz3YcZUIEQK+E3LhKxfMpid3D67GxkAAL94SrcMdR7s436Csafpq3hZRxMiZ5
         m3FNe0pswGk6bs0mdWopuk+V56h8j9w7O8Lu76Lb+3vwpleIEOJiICqYS21yZpKsaG9i
         AqcA==
X-Gm-Message-State: AOJu0YyNNTpYiqImsm3Ykaz36Mye1X1hIZ8HG7En23wcR9ErtRGLkbb0
	+ky1xB8F7++/hHN72DOD9t0kptUztmXE6ezmlpZTDioGBFGJcuVkGy4zcmm+B3iUyipDi12Zwl4
	BQrh7q6BOa3E2ZcjwJsbkBDUxHq97Kb7OExhUVsTLXPePtP2LawImM7ycAdNB7JjMb28w0x/PO0
	vuikYcTc+k6s4=
X-Gm-Gg: ASbGncu9pgMHWTudlNJ/vegLkcIAKXnaNtC1+hS4saLyhu30ZkuI+YduXaEHu+OBT1Y
	qNs5o74xnkLMtIpwSFWKK+eFvcWIhLEyfO59fh/rIHp3jI4wh3h7IvleSHO6QzJ+TvYX8Y1QEnF
	UIOfQEkDNZsd/ahvo/ibzobLnGB/To/DpeBtI1cyWhnaKGnq3eUqbpSlKoUvsaKL9Ne6WvtZaIh
	G7hlGiPzKid65QHAjYhMyWFRKcbuVRsqh4N2yRxhFvx6oecLbvllSoHzxfzmjMUpMvDpsmMGUMt
	oe718qVnAd3C
X-Received: by 2002:a05:620a:2802:b0:7c0:62ff:d12d with SMTP id af79cd13be357-7c07a157041mr967601385a.32.1739506119408;
        Thu, 13 Feb 2025 20:08:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD8k9XxoACt64p4qwfUMGNQhAATkw8yqgd0t1LdLxugzD/2XtBSHNgp02y4yO4C5by3xdSxA==
X-Received: by 2002:a05:620a:2802:b0:7c0:62ff:d12d with SMTP id af79cd13be357-7c07a157041mr967599985a.32.1739506119149;
        Thu, 13 Feb 2025 20:08:39 -0800 (PST)
Received: from [10.0.1.3] ([149.104.30.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c07c6088ccsm164775885a.33.2025.02.13.20.08.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 20:08:38 -0800 (PST)
Message-ID: <96f6dff1-f5c7-4fab-94e1-47004dd916a6@canonical.com>
Date: Fri, 14 Feb 2025 12:08:34 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-media@vger.kernel.org
From: Zhaoxuan Zhai <zhai.zhaoxuan@canonical.com>
Cc: Ethan Hsieh <ethan.hsieh@canonical.com>, jianhui.lee@canonical.com,
 guoqing.jiang@canonical.com
Subject: Questions about image size listed in VIDIOC_ENUM_FMT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

We are working on a camera driver. We plan to use v4l2 interface to send 
image data to users. We have a question we'd like to ask.

The situation we are facing is as follows.

We have an image processing unit that can process raw data collected by 
the sensor into the V4L2_PIX_FMT_NV12M format and send it to the user.

However, due to the requirements of the V4L2_PIX_FMT_NV12M format, the 
width and height of the image must be divisible by 16.

For example, when the sensor provides an image size of 2104x1560, after 
NV12M encoding, it should be pading to  2112x1566. But the additional 8 
rows and 8 columns are padded with 0s and contain no actual content.

So, we would like to ask, in this case, what size should we list in 
VIDIOC_ENUM_FMT? Should it be the actual image size with content, 
2104x1560, or the padded size, 2112x1566?"


Thank you,

Zhaoxuan


