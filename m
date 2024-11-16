Return-Path: <linux-media+bounces-21481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E883E9CFFA1
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 16:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 881F6282043
	for <lists+linux-media@lfdr.de>; Sat, 16 Nov 2024 15:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3BA17E010;
	Sat, 16 Nov 2024 15:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g2u+Hwlb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C6F17BB0F
	for <linux-media@vger.kernel.org>; Sat, 16 Nov 2024 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731771643; cv=none; b=SLxbzTGATrHaw7GhcSeUyJ1SwTZ2j+yCxe9TxUil9vPzli4v9VhM7c085E2sYkh7MdI8v3KEQJSF1BkYh7aLSSLRoj6vw9j/J8Bj39gD6w5n842Q3PhJalGamnaNX+5O+ljehtLHQ3QVFkhOmfQBTXEFvM4nv8EjwXu8akRzfkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731771643; c=relaxed/simple;
	bh=Wd+7kLQISUZlzyPvYmSUTVOb8NV4Vyd3OpsFXw6X7a0=;
	h=From:Message-ID:To:Subject:Date:MIME-Version:Content-Type; b=fD9C9mo6MBOLhJyHPfnSAeMWhFmhcWR5cY/EgNEtowbux3+Ls2j6eHQ3qYv8rAwJZ/kBDXzIbD5HH+yOA73uBPmODkuZI2bF18bHTEvWWY9ZSp358HWQiTsU3mpScmMfEeIJZLiAnTdIgWsFpI/Z88YZztB1ReQFTE8qKMLvEDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g2u+Hwlb; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7f8095a200eso2050876a12.1
        for <linux-media@vger.kernel.org>; Sat, 16 Nov 2024 07:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731771641; x=1732376441; darn=vger.kernel.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=g2u+HwlbdizLdA326cniZFq70l6fhV7dfFVpTatyRKIi8o0uBII4EI4WS7yKzQvT80
         hR1ESct1dMIEg6TqTk0SlVtO2hZ2Ez3lN8AZojOBhUoe6QpfnK93chHyJ+EWX7U5kxeI
         LtF7EFlfKcWEzAAYcLBpF8yas49BdF7cRihJ8MEUbZnUikvdyPsTTp01FdnAS77upLXi
         xQwAf/9xW3nWFM+RXUUSpsclFqPepecWo0oLfDIJzLiq76jG2KcE1S0K2T0JvmP+qvsD
         tngbzgFDVUhQ9c7flu13YboUk73yBrKjETOOPyLi2HH8g/2QKapjIBS2KdE5/8OJ3k3Y
         lOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731771641; x=1732376441;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XHEOkgJ64rwJ+cv0sVIqPUmbc8l+iTifR7HzGzNced0=;
        b=WqbQeeoFnBBmcKUuP1svcmKGl8t7tCI73naO2MsnFwlHMzoY65HrO5wdX9Z4BrX3Wc
         ngZrsjczd9XmvwVHgpvOAgatAzuH0qEBpiOMkffOGqhFQAYrKRgHJpRbxhRhfLzNQi3u
         Gjv60OnTix3FpP1deR6Dj0NTIv9QkmQ+mXivEgFNKS5Z9xhLLDeSEA53JNmeMPguNU6a
         P3wzUaJignuV12nwKMaqPZjXaQ3LMBOob4dml+VPgQ8RgEpGNM3DNHqUtwEPhWy5xVRX
         jC1TW9GCTFA+315Bhnyvo5rb3AxSlEHq273RXYBe4ZZGD9P+ZYeGU/OgvfYyJZUFnPFp
         jygg==
X-Gm-Message-State: AOJu0YzQjpFgyXKctBJqTLKx0eaQrXAc0QJRqwBg/cTXVeowvU4IMgzU
	Fo8vqAtVeQmjhgAAw4yO9o+UGAhv/QpGvxVTT6b8eW9DnqypLrqmNHmkSw==
X-Google-Smtp-Source: AGHT+IGwIw/237oaDTwNHtmKLazQtojw9tmdbZbV2wzYXaQ6utnZL6+vuOWPptTV0/lmWv8+uk/Crw==
X-Received: by 2002:a05:6a20:7484:b0:1cf:34c3:9d0 with SMTP id adf61e73a8af0-1dc8065edd3mr16237948637.17.1731771641524;
        Sat, 16 Nov 2024 07:40:41 -0800 (PST)
Received: from [103.67.163.162] ([103.67.163.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1dada40sm3086302a12.61.2024.11.16.07.40.40
        for <linux-media@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 16 Nov 2024 07:40:40 -0800 (PST)
From: "Van. HR" <vipinrawat07674@gmail.com>
X-Google-Original-From: "Van. HR" <infodesk@information.com>
Message-ID: <6c0274ba672044502a3e237cee6ab9940258d48cae2ec2803f1dfaf54a32ca76@mx.google.com>
Reply-To: dirofdptvancollin@gmail.com
To: linux-media@vger.kernel.org
Subject: Nov:16:24
Date: Sat, 16 Nov 2024 10:40:38 -0500
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hello,
I am a private investment consultant representing the interest of a multinational  conglomerate that wishes to place funds into a trust management portfolio.

Please indicate your interest for additional information.

Regards,

Van Collin.


