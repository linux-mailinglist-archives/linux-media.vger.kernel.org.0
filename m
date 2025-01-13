Return-Path: <linux-media+bounces-24704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F802A0C28F
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 21:26:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C21333A266D
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2025 20:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 364CE1CEAAC;
	Mon, 13 Jan 2025 20:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6tIqK0G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC571CBEAC
	for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 20:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736799973; cv=none; b=Skza6pMHZ8LVhLwdX5K+d498cAOQznuEG23iVw/KQdc2zmrWtuP8cj5mNr5c2LEdfnANjSaWEljnP2j524C3xfJr1J0NLD1J11IclaCUgIxmfyrimgdOC1XgkPzE9s33ujygPipkHDeOMLdH6w4eBxsBV20qIVcU0K0gca2Zq74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736799973; c=relaxed/simple;
	bh=+zlVkH8NKWnmJLRM+HljEfD55AdkkyJp1EVnIgNjFk4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=JFp9vbM/GylGviMMWfPT2Hd+8JevMc9gVnbBhLM5GW+MAYq0K0NPUZntO70wd1zLNlTp2Zrhcx9qcserC0xE3C6+ZV2r1dM4CzS6EOlGj9x+nbKH5wAN+2414GzVSxVXxbG6lbKS/JJkiFrroB4UXp6GfTfMR5V80O54vrV6fbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6tIqK0G; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54024aa9febso4094139e87.1
        for <linux-media@vger.kernel.org>; Mon, 13 Jan 2025 12:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736799970; x=1737404770; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+zlVkH8NKWnmJLRM+HljEfD55AdkkyJp1EVnIgNjFk4=;
        b=O6tIqK0G+4WLqxO20NmxrsQ+cL/ls+Q8BOS8jghkrog1on5AVCmLgZHjdo1TDzl+4g
         FQOGf9mIX16v+8Uo4qsEwGugo8XwmqdWqKXmjDVZWRsFQqzhPuVdYPX7wzcizyCCjtdK
         8nAc66J6VDBkPE7X8v0hQigxHd/asPTYDr6C9J1k1VugSkMfV8ack9lcMxZZBbLBplEg
         ibyRjnToNzN0I90oJlieZxqCWqWzWlwqNS+bfkjGrStmlxCaBgqjS7FG6ynsvRhTaoeG
         Pp5iMw8vmxH4iY6ZozRIkTDXx3bp+wgKBVAmMeiJnBFtwYycO+1C+pxklo/bWRDYDgtq
         577w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736799970; x=1737404770;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+zlVkH8NKWnmJLRM+HljEfD55AdkkyJp1EVnIgNjFk4=;
        b=kyV4IpO+q7e23GVk6SSwHBrJqFzgKBAoxmGA75/iwER6ulkv+NxgCVJjTj7gGWLiPd
         Znz+X/6WfrMZJEU/gft57kq9tCyEv1BPxU4cmHw5K3HMQqsEPFHw5m+2oHKQWZyVP6M8
         2Z19ui3nDDHQA+yo/G882A4MPZQ5j+nnUigesVmN6PZi8ct/oWJMT8EzhyxtgDuEilvO
         w6owCAihSn0GBHJ4GHFpoBOqwaoDy9B2IdJHTHLNLkP8zUCCMs6gBxcDwXyEL+v4SuaV
         BGdj4hskfDUV2UgAFVdwrI+7IKho6mq8xb/oIEaxvBMJNQkd3FIs/i8CbNoT05owS4zc
         +vqg==
X-Forwarded-Encrypted: i=1; AJvYcCUEPY8gQQNzLAexGRD5Xb7r5WZ7b1Yoo3mCro3Q/YWzxg4SiKszEHQCzrL5g3b8keFes4fG5Ooq37LYnw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzdb+Ifx61OTENtGsCJzTW3yCwVgoUV3oVhSFug7kpMQBhgMtb8
	A7wYLekp6mvsg9c6srwY9GsVjkknP83G4MLCM6e0t59OTsJswvqnj1RN2OoqxLhoRk6tbtbhzex
	M73Z0IAWEWjVq/lMueBw3lawKiDQepOX9
X-Gm-Gg: ASbGncvvOr5s8H1J4Uwqu5PvbmVOKuZ2SUWn5Ch5LzR3X9fibqsXsp6zikx6HaLMawt
	bk9D4ej4j8R6g9sFjZaGOuB/6t25A3tTjn21aDTTKyKcYBIQEWVXbbRzYbz27eqedHzkuqA==
X-Google-Smtp-Source: AGHT+IEPJ0vmm4otC+mlbsF6iUp+dhH6I4fXW62JfBK8K4e5JRI1r89GoHKLVJLYOBpdoCIihlrF1eGW0Jss3aYlBBQ=
X-Received: by 2002:a05:6512:3ba8:b0:540:263a:131f with SMTP id
 2adb3069b0e04-5428481c17fmr6527030e87.50.1736799969837; Mon, 13 Jan 2025
 12:26:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 13 Jan 2025 17:25:58 -0300
X-Gm-Features: AbW1kvb-ZHqGZjizkln34B81Nh5-1bHCKDqT6eKsrF44DhqN2ohq0xu3SzOvcgU
Message-ID: <CAOMZO5D0QvYvr940giHPGwLpunQOpku7e5K_5hHyYYCwZQry2g@mail.gmail.com>
Subject: Hantro H1 Encoding Upstreaming
To: andrzej.p@collabora.com
Cc: Frank Li <frank.li@nxp.com>, ming.qian@oss.nxp.com, 
	linux-media <linux-media@vger.kernel.org>, Adam Ford <aford173@gmail.com>, linux-imx@nxmp.com
Content-Type: text/plain; charset="UTF-8"

Hi Andrzej,

Do you plan to submit a non-RFC of the Hantro Encoding patch series
that you submitted earlier?

https://patchwork.kernel.org/project/linux-media/cover/20231116154816.70959-1-andrzej.p@collabora.com/

I don't have access to the ST chip, but I am interested in using it on
the i.MX8MM and i.MX8MP.

Please let me know.

Thanks,

Fabio Estevam

