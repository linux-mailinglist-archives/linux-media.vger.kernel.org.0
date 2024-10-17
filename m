Return-Path: <linux-media+bounces-19809-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D0E9A2E6E
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 22:23:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDF9B1C2201F
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 20:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FC421A717;
	Thu, 17 Oct 2024 20:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGKUUnsD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6741DFE2A;
	Thu, 17 Oct 2024 20:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729196602; cv=none; b=egWztCjiuSIGfA94lzZlABAd8Ce/FOAYgp8DWyOjKaEhUj/vihQBNVasM5E7m0BWlVOiniDwitu+LEjzgw/VmZ+iDH++n8TTfEu23xbuTEdphuWSlQSiGeD1tPLodLzrAYLtnwuscBnR4/qJy6zb8L71N+eJCwXxZtspBdcPLZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729196602; c=relaxed/simple;
	bh=oTJIfT3oyqakJf9FHAZr6BaFyoh65Pq8PbKuBix5ynQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tAcNR31/FyNfqZiKTql4VI5h6rtgymlRHCjyxLn52Hm6aeTCXPY3xLoy4EdZOxapVx/2HtjRtwdJ7YFpNu51Lb6YRu3uKDPuHWJ28aXjiuDWMwMZiO/vStsV9UCCqsuykGaQcW+duen/TbnIWFcwukQik8ffJbL6ekscZ6DpCOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGKUUnsD; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so1084486a12.0;
        Thu, 17 Oct 2024 13:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729196600; x=1729801400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38u4+lvEP3MwxaW3jAQulStrKf3LnsiUKlHFBeOP4Rk=;
        b=RGKUUnsDjrY5TBYBZY8lYFcghtgM92LBfAsfMWezX/aeh1Q8Lb/oy0JJGM0L0nkMvF
         pXdvofCLVRZ1IkDde5fSDl3gYtHjBYkJo9GXkp44WHF2lwf9QjJ48TS7t2knWBfZohKp
         kLLzMfHbLuIIkUJQ8HbbgRFuId54rzpZIa0cgCMm8jYopb3PH73iEr71AN5CcYd6vbei
         xnne5bQCMDCjn+Gwsd1Pg+tKoB0awkArjy/wMeXhgaO9kOUJWi5W8GZl4hXjY+tDy0TG
         pZhCKeIoAd00Ck/rWe8Eb//IEpjXf2C87SyEc6hktmc0Hrk94XwM7AZaA1HjEd/BnOMw
         9dCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729196600; x=1729801400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38u4+lvEP3MwxaW3jAQulStrKf3LnsiUKlHFBeOP4Rk=;
        b=esZqhPDSU7/kwvqC2GPvf7rbEwOKoHfq6wKunfbsltNX07zsh4+D4MHqa8WnOaUOwS
         4uYJZ+rjs9BdA1Y8Hh4Vk+VIgB0fDA1IzqGhL5fOW52bXbIFSzoj3zIaU9YuZ+fJ1Ob1
         14NLLuYw9dMMyoS0HFdDl582VnxDaCyu4WFxmz5B0X9+CVnz22Stp/CGZm4FQZw3/ga+
         iMNdb9soRcsjXr+szYhtY1gcTuPD+sCaQmuWz4GnE0issHH9QiOZpVuayjq6i61bMU5b
         881wYJh6XnXJVVVz27kFUSUAw8Febm2AJic4O2IjIMgK+y1e1+j91kXaS802u6WsAn52
         xH3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUma59blz8jhXzVcImQbwdBf+6W3XhH7TtKt9U4QQqxArBcA/3kLzGLsoVc/335d2XTGluajL1U3UxtD1U=@vger.kernel.org, AJvYcCUmu64IMlmkixutgl10AaFpbS30jMCC9KhfV5MIue0ceseuHAx5632g4ELlNZvfEGDmdsiPpwTN8znth5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD8xTATTE5ny4lYRanfjVaPQh2p+fgUuBIzdga9EoleJL123so
	Nt+Yg9EffFW6dC4GdF0b7YnREMbacD3qGPYrVuS0WdL0dJZpByuqbUxJ5c68
X-Google-Smtp-Source: AGHT+IGMAWQD6p2HxyTayb3FsLXe59RkwnRVgQe15THThCv3iM/TQVQ9CJUSlYItiOMujnRF+Gx7RA==
X-Received: by 2002:a17:90b:4c8f:b0:2e2:d82b:d144 with SMTP id 98e67ed59e1d1-2e561a3281cmr234135a91.37.1729196600158;
        Thu, 17 Oct 2024 13:23:20 -0700 (PDT)
Received: from archlinux.. ([2405:201:e00c:517f:5e87:9cff:fe63:6000])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2e55d216012sm232832a91.0.2024.10.17.13.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 13:23:19 -0700 (PDT)
From: Mohammed Anees <pvmohammedanees2003@gmail.com>
To: angelogioacchino.delregno@collabora.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	moudy.ho@mediatek.com,
	pvmohammedanees2003@gmail.com,
	ribalda@chromium.org,
	sebastian.fricke@collabora.com
Subject: Re: [PATCH] media: platform: mtk-mdp3: Remove unwanted else in mdp-cmdp-prepare()
Date: Fri, 18 Oct 2024 01:51:27 +0530
Message-ID: <20241017202127.2943-1-pvmohammedanees2003@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <f771788c-bdcd-4378-a9c4-4bd6bbf93591@collabora.com>
References: <f771788c-bdcd-4378-a9c4-4bd6bbf93591@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you for your feedback! I have made the 
required changes and sent over the new one.

Thanks!

